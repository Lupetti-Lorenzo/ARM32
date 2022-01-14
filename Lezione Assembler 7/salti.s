      .text
      .global main

main: mov r0, #0
      b dopo @ 0xea000002
      mov r0, #0
      mov r0, #0
      mov r0, #0

dopo: mov r0, #0
      mov r0, #0
      mov r0, #0
      b dopo @ 0xeafffffb
      mov r0, #0
      mov r0, #0
