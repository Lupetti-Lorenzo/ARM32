      .text
      .global main

main: mov r1, #43
      mov r2, #44
      @ emulo la push {r1, r2}
      str r2, [sp, #-4]!
      str r1, [sp, #-4]!
      mov r0, #0 @ valore di ritorno del main
      mov pc, lr @ non si terminano i programmi con una exit! :)
