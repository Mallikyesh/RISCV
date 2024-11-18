#bubble sort

.data

arr:.word 0x22,0x11,0x33,0x55,0x44
len:.word 5
arr2:.word 0x0

.text
la x3,arr
la x8,arr2
li x4, 0 #i=0
li x5,0 #j=0
la x22,len
lw x6,0(x22)



outerloop:
    bge x4, x6, exit
    #addi x7,x7,4    #increment the array address
    li x5,0
    
innerloop: 
    sub x9,x6,x4    # len-i
    addi x9,x9,-1   # len-i-1
    bge x5,x9,eq
    
    slli x10,x5,2
    add x11,x3,x10
    lw x12,0(x11)
    
    addi x10,x10,4
    add x13,x3,x10
    lw x14,0(x13)
    
    bge x14,x12,noswap
    sw x12,0(x13)
    sw x14,0(x11)
    
    
noswap: 
    addi x5,x5,1
    beq x0,x0,innerloop
eq:
    addi x4,x4,1
    beq x0,x0,outerloop
exit:nop
    