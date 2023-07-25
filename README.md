# Hacking-Cheatsheet
This Repository contains a Cheatsheet for binary exploitation and cryptography as well as useful Bash scripts for those topics.

# Scripts
* `create`: Compile shellcode. Creates a `shellcode-elf` ELF-binary for easy debugging with `strace` and `shellcode-raw` for exploits.
* `crun`: Run C-Code in the command line! Example usage: `crun 'printf("Sizeof int %d\n", sizeof(int));'`
* `procdump`: Dump the memory content of a process with only `dd`. Useful when `gdb` is not installed on the server.

# Cheatsheet for Exploitations

## Crypto
### Coppersmith method (missing low bits) explained
https://github.com/p4-team/ctf/tree/master/2019-09-02-tokyowesterns/happy


## Calling conventions
### x86-64
https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-and-user-space-f
* user_level_syscall: `%rdi, %rsi, %rdx, %rcx, %r8 and %r9`
* user_level_function: `%rdi, %rsi, %rdx, %rcx, %r8 and %r9`

## angr
### Get symbol
```python
s = "enter_symbol_here"
project.loader.find_symbol(s).rebased_address
```
## pwntools in jupyter notebook
```python
import os
os.environ['PWNLIB_NOTERM'] = 'True'
from pwn import *
```
## Sage
Integer a = 3 in ring modulo 42:
```sage
R = Integers(42)
a = R(3)
```

## Upgrade reverse shell

1. `python3 -c "import pty; pty.spawn('/bin/bash')"`
2. <Press CTRL+Z> `stty raw -echo; fg`

## Load binary with provided libc
https://github.com/io12/pwninit

## Enable x32 binaries
`sudo apt install libc6-i386`

## GCC
* `gcc -g -o <output_file> <input-file.c>` stores in an input file and links for debugger
* `gcc -fno-stack-protector <input-file.c>` disable stack protector 
* `gdb -q <output_file>` quiet mode, disable header

## In GDB
* Have run with arguments `gdb --args executablename arg1 arg2 arg3`
* Find something in memory `find $esp-0x1Quit, +0x10000, 0xffffcc74`, https://sourceware.org/gdb/onlinedocs/gdb/Searching-Memory.html
### GEF
* Show memory mappings `vmmap`

## common commands
* `echo "set disassembly intel" > ~/.gdbinit` sets gdb to intel syntax


## Shellcode
### Repeat instruction
```asm 
.rept 10
  nop
.endr
```
Repeat nop 10 times

### Disable ASLR
* `echo 0 > /proc/sys/kernel/randomize_va_space`



