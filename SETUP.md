# prerequisites
#####  [README](https://github.com/brujo71/passodo.sh/blob/main/README.md) - [USAGE](https://github.com/brujo71/passodo.sh/blob/main/USAGE.md)
## check for openssl
Before running passodo.sh, please type openssl version to check the version of OpenSSL installed on your system.

passodo.sh requires OpenSSL version 1.1.0 or higher, or LibreSSL version 2.9.1 or higher.

See below how to install / upgrade openssl on your system. If you prefer not to change the system version of OpenSSL, you can specify the correct version by configuring an environment variable. For example: 
```
export PASSODO_OPENSSL="/opt/homebrew/Cellar/openssl@1.1/1.1.1t/bin/openssl"
```
(Be sure to check the exact path on your system.)

### how to install / upgrade openssl on MAC OS
see [How to upgrade OpenSSL in OS X?](https://apple.stackexchange.com/questions/126830/how-to-upgrade-openssl-in-os-x)

### how to install / upgrade openssl on Linux
A recent linux distro should not present problems. For other sistuation refer to the specific  documentation if your distro and version.

### how to install / upgrade openssl on Windows Cygwin
see [Install OpenSSL on Windows with Cygwin](https://www.ssl.com/how-to/install-openssl-on-windows-with-cygwin/)

## install passodo.sh
`passodo.sh` is a single file script. There are different strategies:
### solution 1
```
git clone ....
chmod u+x [path/to/localdir]/passodo.sh
export PATH=$PATH:[path/to/localdir]
```
### solution 2
Use git or downlaod passodo.sh in another way and then copy it in a folder in your PATH. Remenper to check execution permission.

### solution 3
Use git or downlaod passodo.sh in another way and then copy it in the folder where you think to create de secret repository. Remenper to check execution permission.
## first run
Go to the direcory in which you would store the secrets repository. The type
```
passodo.sh
```
if you installed in a PATH dir or
```
./passodo.sh
```
if you copied it in current direcotory


