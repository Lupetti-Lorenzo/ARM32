        .text
        .global mydiv @ r0 contiene il dividendo,
                      @ r1 il divisore,
                      @ r0 conterrà il risultato finale
mydiv:  mov r2, r1 @ sposto il divisore in r2
        mov r1, r0 @ sposto il dividendo in r1
        mov r0, #0 @ r0 inizializzato a zero
loop:   cmp r1, r2
        subhs r1, r1, r2
        addhs r0, r0, #1
        bhs loop
end:    mov pc, lr
