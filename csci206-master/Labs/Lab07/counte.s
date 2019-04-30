# CSCI 206 Computer Organization & Programming
# Date: 2017-03-04
# Student Name: Gabe Gomez

.data
msg: 
.asciiz "There are "
e:
.asciiz "e's"
no:
.asciiz "no fault"


.text
.global counte

main:
	la $a0, msg

counte:
	la $s0, 0($a0)
	li $s1, 0
	addi $s2, $zero, 0
	j loop
	nop
	
loop:
	lb $t0, ($s0)
	beq $t0, $zero, exit
	li $t1, 'e'
	beq $t0, $t1, match
	addi $s0, $s0, 1
	j loop
	nop
	
match:
	addi $s2, $s2, 1
	addi $s0, $s0, 1
	j loop
	nop
	
exit:
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 1
	addi $a0, $s2, 0
	syscall
	
	li $v0, 4
	la $a0, e
	syscall
	