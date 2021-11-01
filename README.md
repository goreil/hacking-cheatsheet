# Repo for code from the art of exploitation

## Assumed Live CD Requirements
* Linux 32-bit (Ubuntu 5.04: release 8 April 2005)
* GCC 3.3.6 (release: May 3, 2005) https://ftp.gnu.org/gnu/gcc/gcc-3.3.6/gcc-3.3.6.tar.bz2


## How to install old gcc version:
* `mkdir gcc-{version}-files`
* cd `gcc-{version}-files`
* Find source
* Use `wget` to download source
* Untar with `tar -xvf`
* `sudo apt-get install libgmp-dev libmpfr-dev libmpc-dev libc6-dev`
* `./gcc-{version}/configure --prefix=/usr/bin/gcc/{version}`
* Run makefile `make`
### Encounter undefined reference_name_p
except.c: undefined reference to `libc_name_p' 

https://compilationhell.blogspot.com/2011/08/exceptc-undefined-reference-to.html
