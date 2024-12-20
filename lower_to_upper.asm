section .bss
    string resb 1024
section .text
    global main
main:
        mov rax, 0
        mov rdi, 0
        mov rsi, string
        mov rdx, 1023
    syscall
    mov rax, 0
    mov rbx, 0
aLoop:
    mov bl, byte[string + rax]
    inc rax
    cmp bl, 0
    je end
    cmp bl, 'z'
    jg aLoop
    cmp bl, 'a'
    jl aLoop
    sub bl, 32
    mov byte[string + rax - 1], bl
    jmp aLoop
end:
        mov rax, 1
        mov rdi, 1
        mov rsi, string
        mov rdx, 1024
    syscall
        mov rax, 60
        mov rdi, 0
    syscall
