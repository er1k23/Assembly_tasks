section .data
    s_fmt db "%ld",0
    pr db "%ld",10,0
section .bss
section .text
    global main 
    extern scanf 
    extern printf
    extern action

main:
    push rbp
    mov rbp,rsp
    sub rsp,16

    mov rax,0
    mov rdi, s_fmt
    lea rsi,[rbp-8]
    call scanf
    mov rax,qword[rbp-8]

    call action

    mov rsp,rbp
    pop rbp
    ret

action:
    push rbp
    mov rbp,rsp
    sub rsp,16

    mov rbx,10
    mov rcx,0
    mov r10,0

add:
    mov rdx,0
    div rbx
    add rcx,rdx
    inc r10
    cmp r10,3
    jl add

end:
    mov rax,0
    mov rdi,pr
    mov rsi,rcx
    call printf

    mov rsp,rbp
    pop rbp
    mov rax,0
    ret
