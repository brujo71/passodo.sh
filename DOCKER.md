# Docker quick start
#####  [README](https://github.com/brujo71/passodo.sh/blob/main/README.md) - [USAGE](https://github.com/brujo71/passodo.sh/blob/main/USAGE.md) - [DOCKER](https://github.com/brujo71/passodo.sh/blob/main/DOCKER.md)
## run with docker
Simply run it with docker
```
% docker container run -v ./mysecrets:/var/secrets -it --rm brujo71/passodo.sh
```
## first run
At the first run create a directory to store your encrypted passwords, ther run the docker container
```
% mkdir mysecrets
% docker container run -v ./mysecrets:/var/secrets  -it --rm brujo71/passodo.sh
Unable to find image 'ndreaxlbit/passodo.sh:latest' locally
latest: Pulling from ndreaxlbit/passodo.sh
c30352492317: Pull complete 
444910ef9d7b: Pull complete 
b6574d4d7870: Pull complete 
112ed741072c: Pull complete 
4f4fb700ef54: Pull complete 
076ccd0fe071: Pull complete 
Digest: sha256:8b5fd8e228eb91319c295eb6fd18128df0264ebef37b63f12b5d8e48722d4638
Status: Downloaded newer image for ndreaxlbit/passodo.sh:latest
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
Lunch again passodo on docker with the same previous command
```
% docker container run -v ./mysecrets:/var/secrets  -it --rm brujo71/passodo.sh 
```
and type again the master password you choose.
Now you can use a new encrypted empty repositori and began to add new secrets that will be stored in `./mysecrets`. See [USAGE](https://github.com/brujo71/passodo.sh/blob/main/USAGE.md) for more details.
