# Docker quick start
#####  [README](https://github.com/brujo71/passodo.sh/blob/main/README.md) - [USAGE](https://github.com/brujo71/passodo.sh/blob/main/USAGE.md)
## check for openssl
## run with docker
First of all choose the directory in with save encripted passwords or create it.
```
mkdir /tmp/mysecrets
```
then symply run passodo with docker
```
% mkdir /tmp/mysecrets
% docker container run -v /tmp/mysecrets:/var/secrets -it brujo71/passodo-alpine 
```
## first run
At the first run the following messages will be displayed
```
% docker container run -v /tmp/mysecrets:/var/secrets -it brujo71/passodo-alpine
Unable to find image 'brujo71/passodo-alpine:latest' locally
latest: Pulling from brujo71/passodo-alpine
c30352492317: Pull complete 
444910ef9d7b: Pull complete 
b6574d4d7870: Pull complete 
112ed741072c: Pull complete 
4f4fb700ef54: Pull complete 
076ccd0fe071: Pull complete 
Digest: sha256:8b5fd8e228eb91319c295eb6fd18128df0264ebef37b63f12b5d8e48722d4638
Status: Downloaded newer image for brujo71/passodo-alpine:latest
master pwd: 
```
Simply type the master password you choose for your secrets repository.
The programm will ask you a confimation and then it will exit.
```
no repository found in current direcoty
Initialize a new one? (enter y to process):y
passodo repository was initialized
launch again passodo.sh to check the choosen password
```