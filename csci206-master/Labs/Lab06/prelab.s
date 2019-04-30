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
#
# This simple program demonstrates writing very simple leaf procedures.
# The program computes an expression in the form of "4x - (2y + c)".
# You are to call the procedure "my_func", taking two parameters (x and y) and
# produce "4x - (2y + c)" within the procedure.

	.data
	.align 2
# Define the constant c here
C:	.word	1

	.text

main:
	li $s4, 1
	sw $s4, C
	# Call my_func(2, 3)
	addi	$a0, $zero, 2
	addi	$a1, $zero, 3
	jal	my_func
	add	$s0, $zero, $v0		# save result in $s0

	# Call my_func(5, 6)
	addi	$a0, $zero, 5
	addi	$a1, $zero, 6
	jal	my_func
	add	$s1, $zero, $v0     # save result in $s1

    	add $s1, $s1, $s0

    #
    # add code here to print the result of my_func(2,3) + my_func(5,6)
    #
    
    	li $v0, 1
    	la $a0, ($s1)
    	syscall

	addi	$v0, $zero, 10				# system call for exit
	syscall

# my_func = 4x - (2y + 1)
my_func:
    #
    # your code for the procedure goes here 
    #
    	addi $t0, $zero, 4	#Create a varaibel with 4
    	addi $t1, $zero, 2	#Create a variable with 2
    	mul $t2, $t0, $a0	#Multiply the 4 by the first argument
    	mul $t3, $t1, $a1	#Multiply the 2 by the second argument
    	add $t3, $t3, $s4	#Add C to result of 2y
    	sub $v0, $t2, $t3	#Subtract 2y + C from 4x
    	
    	
	jr $ra
