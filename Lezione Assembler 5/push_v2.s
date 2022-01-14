      .text
      .global main

main: mov r1, #43
      mov r2, #44
      push {r1, r2}
      mov r0, #0 @ valore di ritorno del main
      mov pc, lr @ non si terminano i programmi con una exit! :)
