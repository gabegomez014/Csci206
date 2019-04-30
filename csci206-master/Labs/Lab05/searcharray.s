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
# data segment -------------------------------------
.data	 
.align 2
 
save:
.word 0,0,0,0,7,0,0,0,0,0 	# array save[.]
ivar:
.word 0 			# int i
kvar:
.word 0 			# int k
donestring:
.asciiz "\nloop terminated, i= "
userInput:
.asciiz "Please enter an integer: "
error:
.asciiz "\nValue not found"
# code segment --------------------------------------
.text
init:
	li 	$v0, 4
	la	$a0, userInput
	syscall
	li	$v0, 1
	syscall
	move	$t0, $v0
	li 	$s3, 0 		# store 0 in i
	sw 	$s3, ivar
	li 	$s5, 7 		# store 7 in k
	sw 	$s5, kvar
    	la 	$s4, save 	# put the address of save[0] in $s4
    	addi 	$t0, $zero, 5 	# $t0=7 
    	addi	$t4, $zero, 0
	addi	$t5, $zero, 1
        
test:
	# reserve $t1 for byte offset of save array
	add	$t1, $zero, $s3 	# $t1 = i
	sll	$t1, $t1, 2 		# cnvert index to byte addres (multiply $t1 by 4)
	add	$t1, $t1, $s4		# $t1 = &save[0] + $t1 (byte address of save[i])
	lw	$t2, 0($t1)		# $t2 = save[i]
	addi 	$t4, $t4, 1
	beq	$t2, $t0, terminate
	beq	$t4, $t5, message
	addi	$s3, $s3, 1
	j	test
	 
terminate:
	la	$a0, donestring
	li	$v0, 4
	syscall
	
	add	$a0, $zero, $s3		# print value of i
	li	$v0, 1
	syscall
	    
	li 	$v0, 10 		# terminate program
	syscall	
	
message:
	li $v0, 4
	la $a0, error
	syscall
	
