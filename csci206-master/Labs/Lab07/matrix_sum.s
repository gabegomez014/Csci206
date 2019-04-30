# CSCI 206 Computer Organization & Programming
# Date: 2017-03-04
# Student Name: Gabe Gomez

.data
array1: .word 0,1,2,9,8,7
array2: .word 6,5,4,3,4,5
array3: .word 0

.text
.global matrix_sum

matrix_sum:
	la $a0, array1
	la $a1, array2
	la $a2, array3
	j loop
	
loop:
	lb $t0, ($a0)
	lb $t1, ($a1)
	addi $a1, $a1, 1
	addi $a0, $a0, 1
	
	add $t2, $t1, $t0
	sw $t2, 0($a2)
	
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	addi $a2, $a2, 1 
	
	li $v0, 1
	la $a0, 0($t0)
	syscall
	
	li $v0, 1
	la $a0, 0($t1)
	syscall
	
	j loop
	