# CSCI 206 Computer Organization & Programming
# Date: 2011-09-13
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
# This program calculates the sum of the values in array A and counts
# the number of values in the array.
#
# Similarly to a C-string, the array is terminated by sentinel value
# equal to zero.
#
# The sum is stored in $s0 and the count in $s1

	.data
A:	.word 5 4 3 2 4 1 4	# declare array int A[]={5,4,3,2,4,1};
ivar:	.word 0
sum:	.word 0
currentIndex: .word 0
numElements: .asciiz "Number of elements: "
total:  .asciiz "\nSummation: "
	.text	

init:
	
	li $s0, 0
	sw $s0, ivar
	li $s1, 0
	sw $s1, currentIndex
	li $s2, 0
	sw $s2, sum
	j lenArray

main:				# This symbols marks the first instruction of your program

#
# Add your code here
#	
	li $v0, 4
	la $a0, numElements
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 4
	la $a0, total
	syscall
	
	li $v0, 1
	la $a0, ($s2)
	syscall

	li	$v0, 10		# system call for exit
	syscall			# Exit!


lenArray:
	lw $t0, A($s1)
	addi $t1, $zero, 0
	beq $t0, $t1, indexReset
	addi $s0, $s0, 1
	addi $s1, $s1, 4
	j lenArray
	
indexReset:
	li $s1, 0
	sw $s1, currentIndex
	j summation
	
summation:
	lw $t0, A($s1)
	addi $t1, $zero, 0
	beq $t0, $t1, main
	add $s2, $t0, $s2
	addi $s1, $s1, 4
	j summation