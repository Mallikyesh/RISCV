.data
a:.word 2,3,4,5,6,7,8,9,10,11
b:.word 11,10,9,8,7,6,5,4,3,2
c:.word 0,0,0,0,0,0,0,0,0,0,0

.text
la x4,a
la,x5,b
la x6,c
li x7,10
mv x8,x0

back:
    slli x9,x8,2
    add x20,x9,x4
    add x21,x9,x5
    add x22,x9,x6
    lw x12,0(x20)
    lw x10,0(x21)
    add x11,x12,x10
    sw x11,0(x22)
    addi x7,x7,-1
    addi x8,x8,1
    bne x7,x0,back
    nop
loop:j loop
    