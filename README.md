# Cheatsheet for Exploitations

## Upgrade reverse shell

1. `python3 -c "import pty; pty.spawn('/bin/bash')"`
2. <Press CTRL+Z> `stty raw -echo; fg`

## Enable x32 binaries
`sudo apt install libc6-i386`

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


## Shellcode
### Repeat instruction
```asm 
.rept 10
  nop
.endr
```
Repeat nop 10 times

### Randomize VA Space
* `echo 0 > /proc/sys/kernel/randomize_va_space`



