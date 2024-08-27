.text
li x2,100
li x3,140
li x4,120
li x5,50
li x6,160
li x7,40
li x1,0

add x8,x2,x4
sub x9,x5,x7
add x10,x3,x6
sub x11,x8,x9
add x12,x11,x10
sub x13,x12,x7

sw x13,4(x1)
