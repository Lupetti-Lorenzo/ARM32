      .text
      .global main

main: mov r0, #1
      mov r1, #2
      push {r0, r1}
      mov r0, #0
      mov r1, #0
      pop {r1}
      pop {r0}
      mov pc, lr
