
.data
num:.byte 0xab,0xcd,0xef,0x11,0x22  # 8-bit data stored using .byte
.text

la x1,num
li x4,6              
addi x3,x0,0                
rpt: lb x2,0(x1)            
add x3,x3,x2                
addi x1,x1,1            
addi x4,x4,-1            
bne x4,x0,rpt           

sw x3,0(x1)                 
nop

