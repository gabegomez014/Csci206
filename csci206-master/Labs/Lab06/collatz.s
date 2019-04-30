# CSCI 206 Computer Organization & Programming
# Date: 2017-02-27
# Student Name: Gabe Gomez

.data
equivalent: .asciiz "==>"
space: .asciiz " "
newLine: .asciiz "\n"
count: .word 1
MAX_ITEMS: .word 100


.text

main:
	addi $s0, $zero, 1			# s0 is now set to 1
	lw $s1, MAX_ITEMS			# s1 is now set to the MAX_ITEMS
	addi $s2, $zero, 1			# s2 is now set to the current count for recursions that will be needed
	jal printOne				# Simply goes through the case of 1 and prints out correct result
	

find_length:
	beq $s0, $s1, end			# If s0 == 100, go to end brack
	add $s3, $s0, $zero
	jal collatz				# Jump and Link to find_length
	
	j find_length
	

collatz:
	beq $s3, 1, done		# To see if $s3 is 1 and stop the function
	addi $t0, $zero, 2		# t0 is simply value of 2
	div $s3, $t0			# divide s0 and t0
	mfhi $t1			# t1 currently has the remainder of dividing s0 by t0
	beqz $t1, divide		# checking if t1 is 0. If so, will do the divide of collatz
	bne $t1, 0, multiply		# If mod is not equal to 0, do the mulutply of collatz
	
done:
	li $v0, 1			# To print out the intger
	la $a0, ($s0)			# Load value of s0 in a0
	syscall
	
	jal center			# Create a space, ==> and then another space
	
done2:	
	li $v0, 1			# To print out the integer for how long it took
	la $a0, ($s2)			# Give a0 value of count
	syscall
	
	li $v0, 4			# To take in a string
	la $a0, newLine			# Creates a new line
	syscall
	
	addi $s2, $zero, 1		# The count is reset to 1
	addi $s0, $s0, 1		# Add 1 to s0
	
	j find_length
	
divide:
	div $s3, $s3, 2			# Setting s3 to s3 / 2
	addi $s2, $s2, 1		# adding 1 to counter because of number of iterations
	j collatz
	
multiply:
	mul $s3, $s3, 3			# Setting s3 to s3 * 3
	addi $s3, $s3, 1			# Setting s3 to s3 + 1
	addi $s2, $s2, 1		# Adding 1 to counter because of new iteration 
	j collatz
	
	
printOne:
	li $v0, 1			#This entire funtion is to print the result if it were one
	la $a0, 1
	syscall
	
	jal spaces			# Creates a space
	jal equivalencies		# Creates ==>
	jal spaces			# creates a space
	
	li $v0, 1
	la $a0, 1
	syscall
	
	addi $s0, $s0, 1		# s0 is incremented by 1 to go from 1 to 2
	
	li $v0, 4
	la $a0, newLine
	syscall
		
	j find_length			# Go into find_length
	
	
center:
	jal spaces			# set of other functions to make the center part of expressions easier
	jal equivalencies
	jal spaces
	j done2				# jumps to 2nd part of iterations being done
	
spaces:
	li $v0, 4			# Creates a space
	la $a0, space
	syscall
	jr $ra

equivalencies: 
	li $v0, 4			#Creates ==>
	la $a0, equivalent
	syscall
	jr $ra

end:				
	addi	$v0, $zero, 10		# system call for exit
	syscall
