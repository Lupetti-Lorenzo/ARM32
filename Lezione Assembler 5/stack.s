      .text
      .global main

main: mov r0, #0xCC
      mov r1, #0xFA
      mov r2, #0x43
      push {r0, r1, r2}
      mov r0, #0
      mov r1, #0
      mov r2, #0
      pop {r3, r4}
      mov r7, #1
      svc 0
