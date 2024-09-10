; Hello World in NASM assembly

global _start           ; expose program entry point

section .text           ; start of code segment

_start:

    ; Write "Hello World!" to the console
    ; mov rax,1               ; system call for write 
    ; mov rdi,1               ; file handle for stdout
    ; mov rsi,hello_str       ; address of output string
    ; mov rdx,hello_str_len   ; size of output string 
    ; syscall                 ; invoke operating system call 

    ; mov rax,10
    ; mov rbx,0xca
    ; mov rcx,var1            ; var1 represents the address, not the data at var1
    ; mov rcx,[var1]
    ; mov [var1],rbx
    ; mov [var1],[var2]         ; invalid move instruction
    ; mov rdx,[var2]
    ; mov [var1],rdx

    mov rax,1
    mov rbx,2 
    mov rcx,3

    add rax,5
    sub rbx,rcx
    inc rcx

    add qword[var1],2       ; you need to be explicit about the size of the operation when working without registers
    inc qword[var2]

    mov rax,hello_str
    mov rbx,[hello_str]
    mov rcx,hello_str_len

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment

    hello_str db "Hello World!",0xa     ; output string with newline
    hello_str_len equ $-hello_str       ; size of output string 

    var1 dq 30          ; quadword, 64 bits
    var2 dq -2
    var3 dq 0xfc43ab7c

    var4 dd 32          ; doubleword, 32 bits
    var5 dw 15          ; word, 16 bits
    var6 db 11          ; byte, 8 bits

    array1 dq 10,20,30,40           ; array of 4 quadwords
    array2 dw 11,22,33,44,55,66,77,88           ; array of 8 words
    array2_len equ  ($-array2)/2

    array3 db 5,'a',0x3,8           ; array of 4 bytes

section .bss            ; start of uninitialized data segment 

    uvar1 resq 1        ; reserves one quadword at location uvar1
    uvar2 resd 10       ; reserves ten doublewords at location uvar2
    uvar3 resw 8        
    uvar4 resb 100       