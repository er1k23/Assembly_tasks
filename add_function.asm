section .data
    scan_fmt db "%ld %ld %ld",0
    print_num db "%ld",10,0
section .bss
    scan_num1 resq 1 
    scan_num2 resq 1
    scan_num3 resq 1

section .text
    global main
    global action
    extern scanf 
    extern printf

main:
    push rbp
    mov rbp,rsp
    sub rsp,32

    
    mov qword[rbp-32],0
    mov qword[rbp-24],0
    mov qword[rbp-16],0
    
    mov rax,0
    mov rdi,scan_fmt
    lea rsi,[rbp-32]
    lea rdx,[rbp-24]
    lea rcx,[rbp-16]
    call scanf
    
    mov r8,qword[rbp-32]
    mov r9,qword[rbp-24]
    mov r10,qword[rbp-16]
    mov rax,0
    call action
 
    mov rsp,rbp
    pop rbp
    mov rax,0
    ret

action:
    push rbp
    mov rbp,rsp

    sub rsp,32

    add r8,r9
    add r8,r10
    mov rax,0
    mov rdi, print_num
    mov rsi,r8
    call printf

    mov rsp,rbp
    pop rbp
    ret
