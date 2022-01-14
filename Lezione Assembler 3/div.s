        .text
        .global main
main:   mov r1, #7 @ dividendo è 7
        mov r2, #3 @ divisore è 3
        mov r0, #0 @ r0 conterrà il risultato, r1 il resto
loop:   cmp r1, r2
        blo end
        sub r1, r1, r2 @ togli una volta il divisore dal dividendo
        add r0, r0, #1 @ incrementa risultato di uno
        b loop
end:    mov r7, #1 @ poi chiamo la exit(r0)
        svc 0
