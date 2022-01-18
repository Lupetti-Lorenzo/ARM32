.text 
.global cambia @ r0 char*(stringa), r1 chiave cifratura
.type cambia, %function

cambia: push {r0, r1, lr}
        bl strlen 
        mov r2, r0      @ r2 lunghezza della stringa
        pop { r0, r1 }  @ r0 puntatore, r1 k
        mov r3, #0      @ r3 somma
        push { r4-r6 }
        mov r4, #0      @ r4 indice for
        mov r5, r0      @ r5 puntatore stringa
for:   cmp r4, r2
        beq fine
        @ corpo del for
        push { r0-r3 }
        ldrb r0, [r5, r4] @ carattere corrente
        bl cifra    
        mov r6, r0        @ r6 carrattere cifrato
        pop { r0-r3 }
        cmp r0, r6
        beq fineif
        str r0, [r5, r4] @ aggiorno la stringa
        add r3, r3,  #1  @ incremento sum
fineif: add r4, r4,  #1  @ incremento indice for
        b for
fine:   pop { r4-r6, lr }
        mov r0, r3 @ ritorno la somma in r0
        mov pc, lr
