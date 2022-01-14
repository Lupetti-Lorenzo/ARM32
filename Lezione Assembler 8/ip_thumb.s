      .text
      .code 16 @ specifica che è codice Thumb
      .global ipf @ r0 valore n, r1 indirizzo x
                  @ r2 indirizzo y, r0 valore di ritorno
      .type ipf, %function
      .align 2

 ipf: mov r3, #0 @ r3 conterrà risultato
      sub sp, #8 @ emulo push {r4-r5}
      str r4, [sp, #0]
      str r5, [sp, #4]
      lsl r0, #2  @ r0 (n) viene moltiplicato per 4
loop: sub r0, #4 @ prima volta N -> N-1
      cmp r0, #0
      blt fine @ attenzione! usare blt non blo (perché?)
      ldr r4, [r1, r0] @ load x[i]
      ldr r5, [r2, r0] @ load y[i]
      mul r4, r5 @ prodotto parziale (x[i]*y[i]) e risultato in r4
      add r3, r4 @ aggiornamento somma parziale e risultato in r3
      b loop @ nuova iterazione
fine: mov r0, r3 @ metto in r0 il risultato
      ldr r4, [sp, #0] @ emulo pop {r4, r5}
      ldr r5, [sp, #4]
      add sp, #8
      bx lr @ ritorno e switch Thumb -> ARMv7
