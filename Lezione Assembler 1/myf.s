     .text
     .global fun

fun: add r0, r0, r1
     asr r0, r0, #1
     mov pc, lr
