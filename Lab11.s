.data

r1:.word 0b10101010

.text

li s0,LED_MATRIX_0_BASE
li s1,LED_MATRIX_0_WIDTH
li s2,LED_MATRIX_0_HEIGHT
li s3, 0x000000
li s4, 0xffc72c

addi s5,s0,8*4

li s6, SWITCHES_0_BASE

reset: mv a0,s0
li x3,1

start: lw t1,0(s6)
and t1,t1,x3
bne t1,x0,bgcl
sw s3,0(a0)

cont: slli x3,x3,1
addi a0,a0,4
beq a0,s5,reset
j start

bgcl: sw x4,0(a0)
j cont
nop