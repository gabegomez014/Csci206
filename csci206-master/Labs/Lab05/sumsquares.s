# CSCI 206 Computer Organization & Programming
# Date: 02/20/2017
# Author: Gabe Gomez

.data

squares: 
.space 100
i:
.word 0
MAX:
.word 100
total:
.word 0
open:
.asciiz "squares["
close:
.asciiz "] = "
newLine:
.asciiz "\n"
sumOfSquares:
.asciiz "sum of squares from 0 to 99 = "

.text

init: 
	li $s0, 0
	sw $s0, total
	li $s1, 0
	sw, $s1, i
	li $s2, 100
	sw $s2, MAX
	

main:
	beq $s1, $s2, end
	mul $t0, $s1, $s1
	add $s0, $s0, $t0
	
	li $v0, 4
	la $a0, open
	syscall
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $v0, 4
	la $a0, close
	syscall
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	addi $s1, $s1, 1
	
	j main

end:
	li $v0, 4
	la $a0, sumOfSquares
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall

	li $v0, 10
	syscall
	