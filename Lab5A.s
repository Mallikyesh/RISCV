.data 

arr:.word 0x11,0x22,0x33,0x44
found:.word 0x0

.text

la x3,arr
la x11,found
li x4,0x44
li x10,0
li x5,4

loop: lw x6,0(x3)
addi x3,x3,4
addi x5,x5,-1
addi x10,x10,1
beq x5,x0,exit
bne x6,x4,loop


exit: 
sw x10,0(x11)
sw x6,4(x11)
nop