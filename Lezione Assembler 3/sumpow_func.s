        .text
        .global sumpow @ r0 contiene x,
                       @ r1 contiene n,
                       @ r0 conterrà il risultato finale

sumpow: mov r2, r1 @ r2 = n
        mov r1, r0 @ r1 = x
        mov r0, #0 @ r0 inizializzato a zero
 start: cmp r2, #0
        beq fine
        b pow @ pow produrrà la potenza r1**r2 in r3
  cont: add r0, r0, r3
        sub r2, r2, #1
        b start
  fine: add r0, r0, #1
        mov pc, lr

   pow: mov r3, r1 @ r3 è il risultato della potenza r1**r2
        mov r4, r2 @ r4 contiene una copia dell'esponente
 pow_s: cmp r4, #1
        mulne r3, r3, r1
        subne r4, r4, #1
        bne pow_s
        b cont
