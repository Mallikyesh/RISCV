.data
#number_str:.string "4847352989243094"   # Example 16-digit number string
number_str:.string "5610591081018250"   # Example 16-digit number string

#number_str:.string "490154203237518"   # Example 15-digit number string IMEI

valid_msg:.string "valid"
invalid_msg:.string "invalid"

.text
    # Step 1: Checking the length
la x1, number_str         # x1 points to the start of number_str
li x2, 0                  # Counter for number of digits
check_length:
lb x3, 0(x1)              # Load each byte from the string
beqz x3,length_verified # If null terminator, exit loop
addi x2, x2, 1            # Increment digit count
addi x1, x1, 1            # Move to the next character
j check_length

length_verified:
    
li x4, 17                 # Expected length for IMEI: 15, Credit card num: 16
bge x2, x4, invalid       # If length not 16, go to invalid



    # Step 2: Convert characters to integers and check positions
    
la x1, number_str         # Reload address of number_str
add x1,x1,x2               #move pointer to end of string
li x2, 0                  # Initialize position counter
li x17, 0                 # x17 will accumulate the final sum

process_digits:
addi x1,x1,-1
lb x5, 0(x1)              # Load character at x1 into x5
beqz x5,validate    # If null terminator is found, exit loop

addi x5, x5, -48           # Convert ASCII to integer

li x18,2
# Check if position is odd or even
rem x6, x2, x18             # Remainder to check if position is odd
beqz x6, add_even    # If even, add directly to sum

# Odd position - double the digit
slli x5, x5, 1            # Double the digit
li x7, 10
blt x5, x7, add_odd       # If doubled digit is less than 10, add directly

# If doubled digit >= 10, separate digits and sum

div x8, x5, x7            # x8 = doubled digit / 10 (tens place)
rem x9, x5, x7            # x9 = doubled digit % 10 (ones place)
add x5, x8, x9            # Sum of separated digits

add_odd:
add x17, x17, x5          # Add the processed odd-position digit to x17
j next_digit

add_even:
add x17, x17, x5          # Add the even-position digit directly to x17

next_digit:

addi x2, x2, 1            # Increment position counter
li x10, 16                # Loop should exit after 16 digits
bge x2, x10, validate     # If processed 16 digits, go to validation
j process_digits

validate:
# Step 3: Check if the accumulated sum in x17 is divisible by 10
li x7, 10
rem x6, x17, x7           # Check if x17 % 10 == 0
beqz x6, valid

invalid:
# print "invalid"
la a0, invalid_msg
li a7, 4                  # Print string syscall
ecall
j end_program

valid:
# print "valid"
la a0, valid_msg
li a7, 4                  # Print string syscall
ecall

end_program:
li a7, 10                 # Exit program
ecall
