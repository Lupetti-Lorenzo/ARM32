        .text
        .global fact @ r0 contiene il numero,
                     @ r0 conterrà il suo fattoriale
fact:   mov r1, r0 @ muovo l'input in r1
        mov r0, #1 @ r0 inizializzato a uno
start:  cmp r1, #0
        mulhi r0, r0, r1
        subhi r1, r1, #1
        bhi start
fine:   mov pc, lr
