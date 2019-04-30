# CSCI 206 Computer Organization & Programming
# Date: 2017-03-04
# Student Name: Gabe Gomez

.text
.global is_prime
.global loop
.global not_prime
.global prime

main:
	addi $a0, $zero, 23
	j is_prime
	nop


is_prime:
	move $s0, $a0		# Moving the argument into a register that is saved throughout calls
	addi $s1, $zero, 2	# Set the first integer to divide the input to 2
	j loop			# Jump to loop which will determine if something is prime or not
	nop
	
loop:
	beq $s0, $s1, prime	# Checks to se if the integer we have been dividing by is equal to our integer in question. If they are, it means it is prime, so go to that branch
	nop
	div $s0, $s1		# Divides the integer in question by our current integer to find remainder
	mfhi $t0		# t0 is given the remainder of the step above
	beqz $t0, not_prime	# If the remainder is 0, then that means the integer in question is not prime, so go to that branch
	nop
	addi $s1, $s1, 1 	# Adds one to the integer we are currently dividing the integer in question by
	j loop			# Starts at the beginning of the loop
	nop
	
not_prime:
	li $v0, 0		# Give the return value a value of 0
	jr $ra			# Return that 0 back to primes2
	nop

prime:
	li $v0, 1		# Give the return value a value of 1
	jr $ra			# Return that 1 back to primes2
	nop

	
