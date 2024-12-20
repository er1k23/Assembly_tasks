section .data
    result dd "The difference is %d",10,0
section .bss 
    num1 resq 1
    num2 resq 1
    result_n resq 1
    
section .text
    global main 
    extern printf 
    extern scanf
    
    
main:
    push rbp
    mov rbp,rsp
    
    mov rax, 0
    mov rdi,0
    mov rsi,num1
    syscall
    
    mov rax, 0
    mov rdi,0
    mov rsi,num2
    syscall
    
    mov rax,0
    mov rax, qword[num1]
    sub rax, qword[num2]
    mov qword[result_n], rax
    
    
    mov rax, 0
    mov rdi, result
    mov rsi, qword[result_n]
    call printf
    
    
    
    mov rsp,rbp
    pop rbp
    ret