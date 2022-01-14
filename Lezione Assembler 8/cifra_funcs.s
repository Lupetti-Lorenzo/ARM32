        .text
        .global cifra
        .global cambia
        .type cifra, %function
        .type cambia, %function

        @ r0 contiene c, r1 contiene n, r0 ritornerà cc
 cifra: mov r2, r0 @ scrivo c in r2 che sara' il nostro cc
        cmp r0, #0x61 @ confronto c con 'a'
        blo fine1 @ ascii sono da 0..127 per cui signed o unsigned è ok
        cmp r0, #0x7a @ confronto c con 'z'
        bhi fine1 @ ascii sono da 0..127 per cui signed o unsigned è ok
        add r2, r2, r1 @ faccio c+n e scrivo in cc (r2)
        cmp r2, #0x7a @ confronto c+n con 'z'
        bls fine1
        sub r2, r2, #0x7a @ faccio cc - 'z'
        add r2, r2, #0x61 @ faccio cc + 'a'
        sub r2, r2, #1 @ tolgo 1
 fine1: mov r0, r2
        mov pc, lr

        @ r0 contiene il puntatore a s, r1 contiene n, r0 ritornerà sum
cambia: push {r0, r1, lr}
        bl strlen
        mov r2, r0 @ r2 contiene lunghezza di s
        pop {r0, r1}
        mov r3, #0 @ r3 contiene sum
        push {r4, r5}
        mov r4, #0 @ r4 contiene indice for loop
        mov r5, r0 @ r5 contiene puntatore a s
   for: cmp r4, r2 @ confronto indice for loop con lunghezza s
        bhs fine2
        ldrb r0, [r5, r4] @ r0 contiene s[i]
        push {r0, r1, r2, r3}
        bl cifra
        mov r6, r0 @ copio in r6 il nuovo carattere
        pop {r0, r1, r2, r3}
        cmp r6, r0 @ confronto il nuovo carattere con il vecchio
        beq fineif
        strb r6, [r5, r4] @ scrivo il nuovo carattere in s[i]
        add r3, r3, #1 @ incremento sum
fineif: add r4, r4, #1 @ incremento indice for loop
        b for
 fine2: mov r0, r3 @ copio sum in r0
        pop {r4, r5, lr}
        mov pc, lr
