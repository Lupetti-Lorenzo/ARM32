        .data
  mess: .string "Il valore del fattoriale e' %d\n"
        .text
        .global main

  main: mov r0, #4 @ fattoriale di 4 = 4 * 3 * 2 * 1 = 24
        push {lr}
        bl fact @ chiamata di funzione
        mov r1, r0 @ sposto il risultato in r1
        ldr r0, =mess @ carico in r0 indirizzo stringa della printf
        bl printf
        pop {lr} @ rispristino indirizzo di ritorno
        mov pc, lr

  fact: mov r1, #1 @ r1 contiene acc
        push {lr}
        bl fact1
        pop {lr}
        mov pc, lr

 fact1: cmp r0, #0
        moveq r0, r1 @ case base: ritorno acc
        moveq pc, lr
        mul r1, r1, r0 @ r1 = n*acc
        sub r0, r0, #1 @ r0 = n-1
        push {lr}
        bl fact1
        pop {lr}
        mov pc, lr
