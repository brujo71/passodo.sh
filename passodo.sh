#!/bin/bash

set -f

PASSODO_DIRNAME=secrets_passodo
PASSODO_VERIFICATION_FILE="passodo_verification"
PASSODO_VERIFICATION_CONTENT="passodo.sh check password"

if [ -z "$PASSODO_OPENSSL" ] ; then
    OPENSSL=openssl
else 
    OPENSSL="$PASSODO_OPENSSL"
fi
OPENSSL_ENC="$OPENSSL enc -aes-256-cbc -pbkdf2 -salt -a"
OPENSSL_DEC="$OPENSSL_ENC -d"

echo "" | pbcopy 2>/dev/null
pbc=$?
if [ "$pbc" == "0" ]; then 
    CLIPCOPY=pbcopy
else 
    echo "" | xclip 2>/dev/null
    xcl=$?
    if [ "$xcl" == "0" ]; then 
        CLIPCOPY=xclip
    else 
        CLIPCOPY=""
    fi
fi

passenc() {
   $OPENSSL_ENC -k "$mpwd" -out "$1"
   if [ "$?" != "0" ] ; then
        >&2 echo "proble with openssl encoding"
   fi
}

passdecraw() {
    $OPENSSL_DEC -k "$mpwd" -in "$1"
    return $?
}

passdec() {
    echo "entry" $1 
    passdecraw "$1"
    res=$?
    echo
    return $res
}

init() {
    mkdir -p "$PASSODO_DIRNAME" 
    echo -n "$PASSODO_VERIFICATION_CONTENT" | passenc "$PASSODO_DIRNAME/$PASSODO_VERIFICATION_FILE" 
}

entry2filew() {
    if [ -z "$1" ] ; then
        >&2 echo entry not specified
        return 2
    fi
    dnf="./$1"
    if [ -f "$dnf" ] ; then
        >&2 echo "entry $1 already exists"
        return 1 
    else
        #>&2 echo entry2filew mkdir $dnf "$(dirname "$dnf")"
        mkdir -p "$(dirname "$dnf")"
        echo $dnf
    fi
}

addentry() {
    dnf=$(entry2filew "$1")
    if [ "$?" == "0" ] ; then
        echo insert reserved information to store in $1 entry and confirm with newline and ctrl+D
        passenc "$dnf" 
    fi
}

addentryvalue() {
    dnf=$(entry2filew "$1")
    if [ "$?" == "0" ] ; then
        echo -n "$2" | $OPENSSL_ENC -k "$mpwd" -out "$dnf" 
    fi
}

entry2filer() {
    dnf="./$1"
    if [ -f "$dnf" ] ; then
        echo -n "$dnf" 
    else
        >&2 echo "entry $1 does not exist" 
        return 1
    fi
}

showentry() {
    dnf=$(entry2filer "$1")
    if [ "$?" == "0" ]; then
         passdec "$dnf"      
    fi
}

helpline() {
    echo "    "$1
    echo -e \\t\\t$2
}

read -p "master pwd: " -s mpwd
echo 


if [ -d "$PASSODO_DIRNAME" ] ; then
    cd "$PASSODO_DIRNAME"
    if [ -f passoso_verification ] ; then
        mv passoso_verification $PASSODO_VERIFICATION_FILE
    fi
    bfn=$(entry2filer $PASSODO_VERIFICATION_FILE)
    if [ "$?" != "0" ] ; then
        echo passodo dir has an initialization problem >&2
        exit 100
    fi
    passdec "$bfn" > /dev/null
    if [ "$?" != "0" ] ; then
        echo wrong password >&2
        exit 10
    fi
    echo master password is correct!
else 
    echo "no repository found in current directory"
    read -p "Initialize a new one? (enter y to proceed):" y2confir
    if [ "$y2confir"  != "y" ] ; then 
        exit 0
    fi
    init
    echo passodo repository was initialized
    echo launch again passodo.sh to check the choosen password 
    exit 0
fi


while true; do
    read -e -t 900 -p "% " cmdall
    if [ "$?" != "0" ]; then
        exit 1
    fi
    cmdarr=($cmdall)
    cmd=${cmdarr[0]}
    entry="${cmdarr[@]:1}"
    
    case $cmd in
        am | addm)
            addentry "$entry"
        ;;
        a | add)
            read -p "insert value for $entry: " -s value
            echo
            addentryvalue "$entry" "$value"
        ;;
        s | show)
            showentry "$entry"
        ;;
        c | copy)
            if [ "$CLIPCOPY" == "" ] ; then 
                echo -e no \"copy to clipboard\" command avaible: install pbcopy on mac or xclip on linux
            else  
                dnf=$(entry2filer "$entry")
                if [ "$?" == "0" ]; then
                    passdecraw "$dnf" | $CLIPCOPY
                    echo content copied to clipboard
                fi
            fi
        ;;
        l | list)
            find . -type f | cut -b 3- | grep -v $PASSODO_VERIFICATION_FILE | sort
        ;;
        del)
            dnf=$(entry2filer "$entry")
            if [ "$?" == "0" ]; then
                rm -f "$dnf"
                echo removed $dnf
            fi            
        ;;
        q | quit)
            echo bye bye
            exit 0
        ;;
        h | help | *)
            echo "syntax: command [entry]" 
            helpline "add <entry>" "add a single line secret"
            helpline "addm <entry>" "add a multi lines secret"
            helpline "copy <entry>" "copy an entry to clipboard without displaying it"
            helpline "del <entry>" "delete an entry"
            helpline "help" "show this help"
            helpline "list" "list all entries"
            helpline "quit" "quit (contrl+C is also ok)"
            helpline "show <entry>" "display an entry (single or multi lines)"
            echo "shortcuts: a,am,c,h,l,q,s ( no shortcut to del)"
        ;;
    esac
    
done
