section .data
    scanf_f dq "%ld"
    sub_form db "%d",10,0
    negativ_num db "Negative",10,0
    one dq 1
section .bss
    scan_num resq 1
    res1 resq 1
        res2 resq 1

section .text
    global main
    extern scanf
    extern printf

main:
    
    push rbp
    mov rbp,rsp
    
    ;scanf
    mov rax,0
    mov rdi,scanf_f
    mov rsi,scan_num
    call scanf
    ;/
   
    mov rbx,[one]
    
    ;one option
    cmp [scan_num],rbx
    je one_opt
    
    ;negativ option
    mov rax,0
    cmp [scan_num],rax
    jl negativ
    
    
    mov rax, [scan_num]
    sub rax,1
    mov [res1],rax
    

    mov rax,0
    mov rax, [scan_num]
    mul qword[res1]
    mov [res2],rax
    
again: 
    mov rax, [res1] ;4
    sub rax,1 ;3
    mov [res1],rax ;3
    
    mov rax,0
    mov rax, [res1] ;3
    mul qword[res2]
    mov [res2],rax
    cmp [res1],rbx
    jg again
    
        mov rax,0
        mov rdi,sub_form
        mov rsi, [res2]
        call printf
        jmp end

one_opt:
        mov rax,0
        mov rdi,sub_form
        mov rsi, rbx
        call printf
        jmp end

    negativ:
        mov rax,0
        mov rdi,negativ_num  
        call printf 
        jmp end

end:
    mov rsp,rbp
    pop rbp
    ret
