       .text
       .global cerca @ r0 valore da cercare x,
                     @ r1 puntatore primo elemento lista
       @ .type cerca, %function  @indica che "cerca" è una funzione

cerca: mov r3, r0 @ r3 contiene x
       mov r0, #0 @ r0 conterrà la posizione da ritornare
loop:  cmp r1, #0 @ lista vuota?
       moveq r0, #-1 @ valore di ritorno -1
       moveq pc, lr @ ritorno al chiamante
       ldr r2, [r1], #4 @ carico in r2 il value e post incremento r1
       cmp r2, r3 @ controllo se ho trovato una occorrenza
       addeq r0, r0, #1
       moveq pc, lr @ ritorno al chiamante
       add r0, r0, #1 @ incrementa di una posizione
       ldr r1, [r1] @ prendo il prossimo elemento (campo next)
       b loop @ vado avanti
