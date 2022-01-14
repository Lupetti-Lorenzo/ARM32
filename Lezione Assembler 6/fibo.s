        .text
        .global fibo @ r0 contiene n
                     @ r0 conterrà F(n)

  fibo: cmp r0, #2
        movlo pc, lr
        mov r3, r0 @ r3 = n
        mov r0, #1 @ r0 = x2
        mov r1, #0 @ r1 = x1
        mov r12, #2 @ r12 = i
  loop: cmp r12, r3
        bhi fine
        mov r2, r0 @ r2 = tmp
        add r0, r1, r0
        mov r1, r2
        add r12, r12, #1
        b loop
  fine: mov pc, lr
