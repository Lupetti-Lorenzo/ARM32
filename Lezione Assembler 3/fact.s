        .text
        .global fact @ r0 contiene il numero,
                     @ r0 conterrà il suo fattoriale
fact:   mov r1, r0 @ muovo il valore in r1
        mov r0, #1 @ r0 inizializzato a uno
start:  cmp r1, #0
        beq fine
        sub r1, r1, #1
        b start
fine:   mov pc, lr
