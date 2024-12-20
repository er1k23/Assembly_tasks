section .data 
    format dd "The our numbers is %ld and %ld ",10,0
    operator_you_wrote dd "Your operator is %c ",10,0
    
    add_form db "The result of adding is %ld",10,0
    sub_form db "The result of substraction is %ld",10,0
    mul_form db "The result of multiply is %ld",10,0
    div_form db "The result of division is %ld",10,0
    
    destination_index_1 dd "%d"
    destination_index_2 dd "%d "
    destination_index_operator dd " %c"


section .bss
    result resq 1
    number1 resq 1
    number2 resq 1
    operator resb 1
    
    
section .text
    global main
    extern printf
    extern scanf

    
main:
    push rbp
    mov rbp,rsp

; take two number 

    mov rax,0
    mov rdi,destination_index_1
    mov rsi,number1
    call scanf
    
    mov rax,0
    mov rdi,destination_index_2
    mov rsi,number2
    call scanf

; take operator 

    mov rax,0
    mov rdi,destination_index_operator
    mov rsi,operator
    call scanf
    
; show numbers

    mov rax, 0 
    mov rdi, format
    mov rsi, [number1]
    mov rdx, [number2]
    call printf
    
; show operator

    mov rax, 0 
    mov rdi, operator_you_wrote
    mov rsi, [operator]
    call printf

loop:
    cmp byte[operator], '+'
    je adding
    
    cmp byte[operator], '-'
    je substraction
    
    cmp byte[operator], '*'
    je multiply
    
    cmp byte[operator], '/'
    je division

adding:
    mov rax, [number1]
    add rax,[number2]
    mov [result],rax
        mov rax,0
        mov rdi,add_form
        mov rsi, [result]
        call printf
        jmp end
        
        
substraction:
    mov rax, [number1]
    sub rax,[number2]
    mov [result],rax
        mov rax,0
        mov rdi,sub_form
        mov rsi, [result]
        call printf
        jmp end
        
multiply:
    mov rax, [number1]
    mul qword[number2]
    mov [result],rax
        mov rax,0
        mov rdi,mul_form
        mov rsi, [result]
        call printf
                jmp end

        
division:
    mov rax, [number1]
    mov rdx,0
    div qword[number2]
    mov [result],rax
        mov rax,0
        mov rdi,div_form
        mov rsi, [result]
        call printf
                jmp end

        
        
end:
    mov rsp,rbp
    pop rbp
    ret