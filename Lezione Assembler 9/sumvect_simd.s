          .text
          .global sumvect @ r0 indirizzo x, r1 indirizzo y,
                          @ r2 indirizzo z, r3 dimensione n (deve essere pari)
          @ questo programma va compilato con -mfpu=neon
          .type sumvect, %function

 sumvect: cmp r3, #0
          beq fine
          vldr d0, [r0] @ si leggono 2 elementi di x in un colpo solo
          vldr d1, [r1] @ si leggono 2 elementi di y in un colpo solo
          vadd.u32 d2, d0, d1 @ si fa x+y di due elementi in un colpo solo
          vstr d2, [r2] @ si scrive due risultati di z in un colpo solo
          sub r3, r3, #2 @ decremento indice loop di 2
          add r0, r0, #8 @ incremento base di x di 8 bytes (2 elementi)
          add r1, r1, #8 @ incremento base di y di 8 bytes (2 elementi)
          add r2, r2, #8 @ incremento base di z di 8 bytes (2 elementi)
          b sumvect
    fine: mov pc, lr
