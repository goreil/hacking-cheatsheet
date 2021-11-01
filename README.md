# Repo for code from the art of exploitation



## Assumed Live CD Requirements
* Linux 32-bit (Ubuntu 5.04: release 8 April 2005)
* GCC 3.3.6 (release: May 3, 2005) https://ftp.gnu.org/gnu/gcc/gcc-3.3.6/gcc-3.3.6.tar.bz2


## How to install old gcc version:
https://www.slothparadise.com/installing-any-gcc-version/#:~:text=The%20first%20method%20of%20installing%20any%20gcc%20version,manager%20may%20or%20may%20not%20install%20missing%20dependencies.

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

* Find `find . -name "cfns.h"
* And delete it `rm <path to cfns.h>`
* `sudo apt install gperf`

https://compilationhell.blogspot.com/2011/08/exceptc-undefined-reference-to.html


#### Second solution
* Get a fresh file`wget https://sources.debian.org/data/main/g/gcc-h8300-hms/1%3A3.4.6%2Bdfsg-1/gcc/cp/cfns.h`


# Chapter 0x200

## common commands
* `echo "set disassembly intel" > ~/.gdbinit` sets gdb to intel syntax

## In GDB

### Display format

* **o** octal
* **x** hex
* **u** unsigned base 10
* **t** binary
* **i** instruction
* **c** character
### Sizes:
* **b** single byte
* **h** halfword (2 bytes)
* **w** word (4 bytes)
* **g** giant (8 bytes)

### Examples
* `x/8x $eip` gets the current command and following 8 Dwords(4-byte)
* `info register eip` or `i r eip` returns the content of a register
* `x/i $eip`retuns the command in human readable format
* `print` can be used to do simple math which will be stored in `$1`
* `nexti`*next instruction*
* `x/s <address>` returns the string stored at that adress

## Notes
* Intel Syntax: `operation <destination>, <source>
* x86-Processors: *little-endian byte order* 
