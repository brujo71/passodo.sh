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
secrets_passodo
```
first access to the new and empty repository
```
mymac testpwd % passodo.sh
master pwd: 
master password is correct!
% help
syntax: command [entry]
add entry for entering a single line secret
addm entry for entering a multi lines secret
show entry to display a secret (single o multi lines)
copy entry to copy entry to clipboard without to display it
del entry to delete an entry
help to disaply this help
list to list all entries
quit to quit
shortcuts: a,am,s,c,l,q (no showrcut to del)
% list
% add test1
insert value for test1: 
% list
test1
% show test1 
entry ./test1
my test secret
```
The first command `list` show nothing as the repository is empty.
The command `add` followed by the entry name add a single password. The password is asked on a prompt with no eco.
The second command `list` display the added entry.
Finally the `show` commad displays the content fo an entry.
```
% copy test1 
secret copied to clipboard
```
If terminal and S.O. support copy-to-clipboard function (`xclip` on linux and `pbcopy` on mac os),
the secret can be copied into the clipboard. The secret is not displayed in this case.
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
The addm command adds a multi line secret to the store 
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
Note that 
