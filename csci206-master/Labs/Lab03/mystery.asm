
# CSCI 206 Computer Organization & Programming
# Date: 2011-08-29
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
# Student name: Gabe Gomez


	.data
	
unused:	.word 0xDEADBEEF			
						
x:	.word 89				
						
	.text	
main:						# This tells the simulator
						# where start your program

	
	add		$t0, $zero, $zero	#This creates a temporary
						#variable that is zero
	
	add		$t1, $zero, $zero	#this creates another temporary
						#variable that is 0	

loop:
	add		$t1, $t1, $t0		#This adds temp variable 0 and
						#temp variable 1

	addi		$t0, $t0, 1		#Increases temp variable 0 by 1

	ble		$t0, 10, loop		#checks to see if temp variable 0
						#is less than or equal to 10 to 
						#see if another loop needed.

	la		$t2, x			#load address of x into temp
						#variable 2

	sw		$t1, 0($t2)		#Store word memory[$t2 + 0] = $t1
	
	li		$v0, 10			# system call for exit
	syscall					# Exit!

