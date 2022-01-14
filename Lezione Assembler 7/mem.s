      .text
      .global main

      @ r1 è un indirizzo "buono" in quanto quello di argv
main: ldr r0, [r1, #4] @ 0xe5911004
      ldr r0, [r1], #4 @ 0xe4910004
      ldr r0, [r1, #4]! @ 0xe5b10004
      mov r0, #0
      mov pc, lr
