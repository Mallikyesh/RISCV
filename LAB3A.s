.data

num:.word 0xab,0xcd,0xef,0x10,0x11 
.text

la x1,num
li x4,5
addi x3,x0,0
rpt: lw x2,0(x1)
add x3,x3,x2
addi x1,x1,4
addi x4,x4,-1
bne x4,x0,rpt

sw x3,0(x1)
nop