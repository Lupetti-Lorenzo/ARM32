      .text
      .global main

main: add r1, r2, #5 @ 0xe2821005
      add r1, r2, #-5 @ viene compilata come una sub r1, r2, #5
      add r1, r2, r3, lsl #2 @ 0xe0821103
      add r1, r2, r3, lsl r4 @ 0xe0821413
      mov r0, #16 @ 0xe3a00010
      mov r0, #0
      mov pc, lr
