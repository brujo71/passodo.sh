# passodo.sh - a command line password manager
## What is passodo.sh for?
*passodo.sh* is a command line password manager that stores passwords, secrets, or other texts in encrypted files using a master password to secure them. It is intended to be multiplatform, self-contained, and very simple to install and use. It can be used on any OS with bash and openssl installed (e.g., Linux, macOS, Windows with cygwin) with no other dependencies. *passodo.sh* can easily manage many tens of passwords that can be organized into folders.

##### [Setup](https://github.com/brujo71/passodo.sh/blob/main/SETUP.md) - [Usage](https://github.com/brujo71/passodo.sh/blob/main/USAGE.md) 

## What is not passodo.sh for?
*passodo.sh* is not intended to store other data than text. It is not intended to grow with complex or exotic functions, nor to be the backend of a graphical interface. It is also not intended to grow with diffused utility not so useful (e.g., strong password check). *passodo.sh* is not suited for thousands of entries. There is no backup or cloud function included.

## Key feature
- Open source GNU GPL-3.0
- Only a few lines of bash script
- Based on openssl for wide compatibility
- No dependency
- No installation required
- All data is stored in one directory, making it easy to backup, transfer, or store in the cloud
- Each secret is stored in an encrypted and base64-encoded file
- Secrets can be organized into folders
- Secrets can be copied directly into the clipboard without displaying them


## Is passodo.sh secure? Can I trust it?
This is the main objective of the project. *passodo.sh* is secure because it is extremely simple.
This implies that you can check the security by yourself reading the code. *passodo.sh* adopts openssl AES-256-cdc algorithm 
with all the recommended security options. 

You will always be able to decrypt your secrets manually with openssl command, so you don't have to worry about
losing your secrets if this project will be abandoned or will not work anymore.

## Who it is addressed to?
Everyone with a minimum knowledge about shells would be able to use this program, 
but it is addressed especially to technicians, programmers, and sysadmins.

## Warning
**If you lose the master password, no one will be able to help you**

This is free software with no warranty: use at your own risk.

## Why another password manager?
- Recently, some technical sites spoke about password managers that were hacked.
- There can be a need to store passwords directly on a server with no graphical interface.
- Other password managers I found either need installation, have security issues, or have dependencies.

## Requirements
- passodo.sh requires OpenSSL version 1.1.0 or higher, or LibreSSL version 2.9.1 or higher. 
- to use optional "copy to clipboard" function pbcopy on Mac or xclip on Linux should work

See [setup](https://github.com/brujo71/passodo.sh/blob/main/SETUP.md) for more information

## To Do
- More tests on macOS (especially old versions)
- Test on more Linux versions
- Test on cygwin

