# Repo for code from the art of exploitation

# Chapter 0x300

## Bash 
### suppress errors
Just add `2>/dev/null` at the end

### loops

```
for i in $(seq 1 10)
  >do 
  >echo the value is $i
  >done
```
## Why won't my shellcode work?

### Randomize VA Space
* `echo 0 > /proc/sys/kernel/randomize_va_space`

### Because newer Linux versions have exec shield

* https://wiki.ubuntu.com/Security/Features#nx
* https://unix.stackexchange.com/questions/66802/disable-stack-protection-on-ubuntu-for-buffer-overflow-without-c-compiler-flags

**Try this Solution:** Use Ubuntu 9.04 or earlier

**Solution:** Use `mprotect(<pointer to memory>, <mem_size>, PROT_WRITE|PROT_READ|PROT_EXEC);` in C. Remember to first use mprotect and then write the shellcode. Also, you need to `#include <sys/mman.h>


# Chapter 0x200

## Change permissions
Change Suid
* `sudo chown root:root <binary>`
* `sudo chomod u+s <binary>`

## Pcalc - Fast calculations
* `pcalc 0x03e7` Calculate hex to dec and bin

## GCC
* `gcc -g -o <output_file> <input-file.c>` stores in an input file and links for debugger
* `gcc -fno-stack-protector <input-file.c>` disable stack protector 
* `gdb -q <output_file>` quiet mode, disable header

## In GDB
* Have run with arguments `gdb --args executablename arg1 arg2 arg3`
* `list` Shows the source code if it exists.
* `b <line>` Sets a breakpoint
* `run` Runs the program
* `continue` Continues after a breakpoint
* Find address of 'system': `p system`

## common commands
* `echo "set disassembly intel" > ~/.gdbinit` sets gdb to intel syntax

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


