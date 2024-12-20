section .rodata
    s_fmt db "%d %d %d",0
    p_fmt db "Result is: %d",10,0
section .text
    global main
    extern scanf
    extern printf
    global adder

main:
    push rbp
    mov rbp,rsp
    sub rsp,16

    mov rax, 0
    mov rdi, s_fmt
    lea rsi, [rbp-16]
    lea rdx, [rbp -12]
    lea rcx, [rbp-8]
    call scanf

    movsx rdi, dword[rbp-16]
    movsx rsi, dword[rbp-12]
    xor rax,rax
    call adder

    mov rdi,rax
    movsx rsi,dword[rbp-8]
    xor rax,rax
    call adder

    mov rsi,rax
    mov rax,0
    mov rdi, p_fmt
    call printf


    add rsp,16
    pop rbp
    mov rax,0
    ret


adder:
    push rbp
    mov rbp,rsp

    add rdi,rsi
    mov rax,rdi

    mov rsp,rbp
    pop rbp
    ret
