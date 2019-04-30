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
# This program uses a procedure xfind to find a particular character.
# See detailed instructions in lab handout

	.data
# Define constants here

	.align 2

# These are the two test strings, use one at a time
#string: .asciiz "Where is my xbox 360?"
string: .asciiz "None of that character in here."

	.text

main:
	# Prepare for procedure call
	addi	$sp, $sp, -4		# saving registers
	sw	$ra, 0($sp)
	
	la	$a0, string		# load address of string
	jal	xfind			# call function convert

#   write code here to print the result of the 
#   call to xfind

	move $a0, $v0   		# Take the value in $v0 and put it into $a0
	li $v0, 34			# For printing out hexadecimal address value
	la $a0, ($a0)			# What will be printed out
	syscall 


	lw	$ra, 0($sp)		# restoring registers
	addi	$sp, $sp, 4
	
	li	$v0, 10			# exit to OS
	syscall

xfind:
# write the code of function xfind after this comment
	lb $v0, ($a0)			# Load a byte from the string to $v0
	beq $v0, 'x', found		# If 'x' is equal to $v0, go to found brack
	beq $v0, $zero, not_found	# If $v0 is equal to the null terminator, go to not_found
	addi $a0, $a0, 1		# Adding one to $a0
	j xfind				#recursive
	
found:
	lb $v0, ($a0)			# Load byte from $a0 to $v0
	sb $v0, ($a0)			# store the byte that was just loaded in
	jr $ra				# Return to the calling function
	
not_found:
	addi $v0, $zero, -1		# $v0 becomes -1 (represented as 0xffffffff
	jr $ra				# Returns to the calling function
