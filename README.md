# Cheatsheet for Exploitations

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

### Randomize VA Space
* `echo 0 > /proc/sys/kernel/randomize_va_space`



