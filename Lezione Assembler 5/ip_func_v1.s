      .text
      .global IP @ r0 base x, r1 base y, r2 n
                 @ r0 valore di ritorno

IP:   push {r4, r5}
      mov r3, #0 @ accumulatore
loop: ldr r4, [r0], #4 @ carica x[i]
      ldr r5, [r1], #4 @ carica y[i]
      mul r4, r4, r5
      add r3, r3, r4
      sub r2, r2, #1
      cmp r2, #0
      bhi loop
      pop {r4, r5}
      mov r0, r3
      mov pc, lr
