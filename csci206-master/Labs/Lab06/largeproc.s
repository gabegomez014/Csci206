# CSCI 206 Computer Organization & Programming
# Date: 2011-09-19
# Copyright (c) 2011 Bucknell University
#
# Permission is hereby granted, free of charge, to any individual or
# institution obtaining a copy of this software and associated
# documentation files (the "Software"), to use, copy, modify, and
# distribute without restriction, provided that this copyright and
# permission notice is maintained, intact, in all copies and
# supporting
# documentation.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
# KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
# THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#
# Student name:
#
# This program demonstrates passing a large number of arguments to a
# procedure which is not a leaf procedure.

	.data
	.align 2
A:	.word 3
B:	.word 7
C:	.word 4
D:	.word 9
E:	.word 3
F:	.word 8
Result1:.word 0xDEADBEEF
Result2:.word 0xDEADBEEF
newLine: .asciiz "\n"

	.text

# The main() procedure calls largeProc, storing the results into
# Result1 and Result2 and also printing them out to the terminal.

main:

# Prepare arguments to pass to largeProc
	lw $a0, A			# Load in A, D, and F
	lw $a1, D
	lw $a2, F
	lw $v0, Result1			# Load in the value of the results to be obtained
	lw $v1, Result2
	addi $sp, $sp, -20		# Create a stack space to enter A, D, F and the two values
	sw $a0, 8($sp)			# Stroring A, D, F and the two values in the stack
	sw $a1, 4($sp)
	sw $a2, 0($sp)
	sw $v0, 16($sp)
	sw $v1, 12($sp)
	

# Call largeProc
	jal largeProc			# Jumping and linking to largeProc

# Print the results returned from largeProc
	lw $v0, 4($sp)			# Loading the values of v0 and v1 back to v0 and v1
	lw $v1, 0($sp)
	addi $sp, $sp, 8		# Close stack space
		
	move $a0, $v0			# a0 has value of v0
	move $a1, $v1			# a1 has value of v1
	
	li $v0, 1			# To print an integer
	la $a0, ($a0)			# Giving result of v0
	syscall
	
	li $v0, 4			# To print a string
	la $a0, newLine			# To create a new line
	syscall
	
	li $v0, 1			# To print an integer
	la $a0, ($v1)			# Giving the results of v1
	syscall

# The program is finished. Terminate the execution.
	addi	$v0, $zero, 10		# system call for exit
	syscall

# This large complicated procedure takes 6 paramters and returns 2.
# Additionally this procedure calls another procedure.
# It is assumed that $fp has been set correctly

largeProc:

# your code goes here
	
	# Store registers which must be saved onto the stack

	# Compute the first result
	lw $v0, 16($sp)			# Load Result1 from the stack		# Close stack corresponding to taking out v0
	lw $a0, B			# Load B, C, and E into a0, a1, and a2 respectively
	lw $a1, C
	lw $a2, E
	add $v0, $a0, $a1		# t0 contains the addition of B and C
	add $v0, $v0, $a2		# t0 contains the addition of B, C and E
	

	# Compute the second result
	lw $v1, 12($sp)			# load Result2 from the stack
	lw $a0, 8($sp)			# load A from the stack and set it to a0
	lw $a1, 4($sp)			# load D from the stack and set it to a1
	lw $a2, 0($sp)			# load F from the stack and set it to a2
	addi $sp, $sp, 16		# close any remaining stack space
	sub $v1, $a0, $a1		# t0 holds the addition of A and D
	add $v1, $v1, $a2		# Now t0 holds the addition of A, D, and F
	
	addi $sp, $sp, -8		# Open some stack space 
	sw $v0, 4($sp)			# Store value of v0 in stack space
	sw $v1, 0($sp)			# Store value of v1 in stack space

	# Call smallProc for the heck of it, but save $v0,
	# and $v1 because smallProc could possibly overwrite them!
	j smallProc			# Jumping to smallProc

	# Restore registers using the stack

	jr	$ra

# This procedure computes nothing useful, it just returns

smallProc:

	jr	$ra
	
# Put all of the values within the stack. Then,obtain the values of each one as it is seen fit. When it comes to printing them, simply load the first two into $a0 and $a1
# Then, take the last value that is wanted, set it to $a0 since it has already been printed, and then print the new #$a0. Similarly to how I had done above. 
		
