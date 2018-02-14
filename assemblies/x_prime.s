.text
	.globl __start
__start:
	li   $v0, 5
	syscall
	add  $t8, $v0, $zero
	li   $t7, 0
	li   $t6, 1
main_loop:
	beq  $t7, $t8, exit_loop
	add  $a0, $t6, $zero
	jal  __is_prime
	bne  $v0, $zero, prime_case
	addi $t6, $t6, 1
	j 	 main_loop
prime_case:
	addi $t7, $t7, 1
	addi $t6, $t6, 1
	j    main_loop
exit_loop:
	
__end:
	li $v0, 0xA
	syscall

__is_prime:
	addi $t0, $a0, -3
	slti $t1, $t0, 1
	bne  $t1, $zero, prime
	li   $t1, 2
	li   $t2, 3
	div  $a0, $t1
	mfhi $t3
	beq  $t3, $zero, not_prime
	div  $a0, $t2
	mfhi $t3
	beq  $t3, $zero, not_prime
	li   $t0, 6
	li   $t1, 5
	li   $t2, 2
loop:
	mul  $t3, $t1, $t1
	slt  $t4, $t3, $a0
	bne  $t4, $zero, prime
	div  $a0, $t1
	mfhi $t4
	beq  $t4, $zero, not_prime
	add  $t1, $t1, $t2
	sub  $t2, $t0, $t2
	j 	 loop
	
prime:
	li $v0, 1
	jr $ra
	
not_prime:
	li  $v0, 0
	jr  $ra