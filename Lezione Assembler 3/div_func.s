        .text
        .global mydiv @ r0 contiene il dividendo,
                      @ r1 il divisore,
                      @ r0 conterrà il risultato finale
mydiv:  mov r2, r1 @ sposto il divisore in r2
        mov r1, r0 @ sposto il dividendo in r1
        mov r0, #0 @ r0 inizializzato a zero
loop:   cmp r1, r2
        blo end
        sub r1, r1, r2 @ togli una volta il divisore dal dividendo
        add r0, r0, #1 @ incrementa risultato di uno
        b loop
end:    mov pc, lr
