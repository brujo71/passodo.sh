# Usage
#####  [README](https://github.com/brujo71/passodo.sh/blob/main/README.md) - [Setup](https://github.com/brujo71/passodo.sh/blob/main/SETUP.md)
## Basic usage examples
Create a new directory and launch the script
```
mymac ~ % mkdir testpwd
mymac ~ % cd testpwd
mymac testpwd % passodo.sh 
```
To use the script, a master password must be chosen during the first run, as it will be required at the beginning of each subsequent run.
```
master pwd: 
no repository found in current direcoty
Initialize a new one? (enter y to process):y
passodo repository was initialized
launch again passodo.sh to check the choosen password
```
After creating a directory named "secrets_passodo", the script will exit. To verify your master password, you will need to re-enter it when running the script again.
```
mymac testpwd % ls
secrets_passodo
```
first access to the new and empty repository
```
mymac testpwd % passodo.sh
master pwd: 
master password is correct!
% help
syntax: command [entry]
    add <entry>
		add a single line secret
    addm <entry>
		add a multi lines secret
    copy <entry>
		copy an entry to clipboard without displaying it
    del <entry>
		delete an entry
    help
		show this help
    list
		list all entries
    quit
		quit (contrl+C is also ok)
    show <entry>
		display an entry (single or multi lines)
shortcuts: a,am,c,h,l,q,s ( no shortcut to del)
% list
% add test1
insert value for test1: 
% list
test1
% show test1 
entry ./test1
my test secret
```
When the list command is first executed, nothing will be displayed as the repository is empty.
To add a secret to the repository, use the add command followed by the entry name. You will be prompted to enter the secret, which will not be echoed on the screen.
After adding an entry, the list command will display the newly added secret.
To view the content of a specific entry, use the show command followed by the entry name. The secret associated with that entry will be displayed.
```
% copy test1 
secret copied to clipboard
```
If the terminal and operating system support the copy-to-clipboard function (such as xclip on Linux or pbcopy on macOS), the secret can be copied to the clipboard. The secret will not be displayed in this case.
```
% addm test2
insert reserved information to store in test2 entry and confirm with newline and ctrl+D
my test 2 secret
second line
last line of my test2 secret
% list
test1
test2
```
The addm command adds a multi line secret to the repository 
```
% show test2
entry ./test2
my test 2 secret
second line
last line of my test2 secret
```
`show` works with both single e multi lines secrets
```
% q
bye bye
mymac testpwd % ls secrets_passodo 
passoso_verification	test1			test2
mymac testpwd % cat secrets_passodo/test2 
U2FsdGVkX1+r4iSD6pAz5+aAxtatqa6qsDnc3UHTrEZJWZwKo847AKvl6JJ7pmaH
SOOQAsDYonreAwElV8t6qcbABTGQTSpgktBtHcp4BL8=
mymac testpwd % passodo.sh 
master pwd: 
bad decrypt
4364500288:error:06065064:digital envelope routines:EVP_DecryptFinal_ex:bad decrypt:crypto/evp/evp_enc.c:612:
wrong password
mymac testpwd % passodo.sh
master pwd: 
master password is correct!
% l
test1
test2
% s test2
entry ./test2
my test 2 secret
second line
last line of my test2 secret
% copy test1
content copied to clipboard

% q
bye bye
mymac testpwd %
```

