          .text
          .global sumvect @ r0 indirizzo x, r1 indirizzo y,
                          @ r2 indirizzo z, r3 dimensione n (deve essere divisibie per 4)
          @ questo programma va compilato con -mfpu=neon
          .type sumvect, %function

 sumvect: cmp r3, #0
          beq fine
          vldr d0, [r0] @ si leggono 2 elementi di x in un colpo solo
          add r0, r0, #8 @ base di x incrementata di 8 bytes (2 elementi)
          vldr d1, [r0] @ si leggono 2 elementi di x in un colpo solo
          vldr d2, [r1] @ si leggono 2 elementi di y in un colpo solo
          add r1, r1, #8 @ base di y incrementata di 8 bytes (2 elementi)
          vldr d3, [r1] @ si leggono 2 elementi di y in un colpo solo
          vadd.u32 q0, q0, q1 @ si fa x+y di 4 elementi in un colpo solo
          vstr d0, [r2] @ si scrive due risultati di z in un colpo solo
          add r2, r2, #8 @ incremento base di z di 8 bytes (2 elementi)
          vstr d1, [r2] @ si scrive due risultati di z in un colpo solo
          sub r3, r3, #4 @ decremento indice loop di 4
          add r0, r0, #8 @ incremento base di x di 8 bytes (2 elementi)
          add r1, r1, #8 @ incremento base di y di 8 bytes (2 elementi)
          add r2, r2, #8 @ incremento base di z di 8 bytes (2 elementi)
          b sumvect
    fine: mov pc, lr
