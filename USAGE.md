# Usage
#####  [README](https://github.com/brujo71/passodo.sh/blob/main/README.md) - [Setup](https://github.com/brujo71/passodo.sh/blob/main/SETUP.md)
## Basic usage examples
Create a new directory e launch the script
```
mymac ~ % mkdir testpwd
mymac ~ % cd testpwd
mymac testpwd % passodo.sh 
```
the script always ask for a master password at the beginning. Choose one at first run.
```
master pwd: 
no repository found in current direcoty
Initialize a new one? (enter y to process):y
passodo repository was initialized
launch again passodo.sh to check the choosen password
```
the script create a directory named *secrets_passodo* and exits. In this way you should re-type the master password for check
```
mymac testpwd % ls
secrets_passodo *# a new directory was vcreated*
mymac testpwd % passodo.sh *# password is asked ones but script quits so password is inserted a second time to check it*
master pwd: 
master password is correct!
% *# simply type enter to display help*
unknown command
syntax: command [entry]
add entry for entering a single line secret
addm entry for entering a multi lines secret
show entry to display a secret (single o multi lines)
copy entry to copy entry to clipboard without to display it
del entry to delete an entry
list to list all entries
quit to quit
shortcuts: a,am,s,c,l,q ( no showrcut to del)
% l *# no entry yet: empty response*
% a test1 *# add a single line password named test1* 
insert value for test1: 
% l
test1
% s test1 
entry ./test1
my test secret
% c test1
content copied to clipboard
% am test2
insert reserved information to store in test2 entry and confirm with newline and ctrl+D
my test 2 secret
second line
last line of my test2 secret
% list
test1
test2
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

% q
bye bye
mymac testpwd %
```
