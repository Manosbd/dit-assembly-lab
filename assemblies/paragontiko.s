.text
.globl __start

__start:
	lw $s0, num
	addi $a0, $zero, 1 	# holds result
	add $t0, $zero, $zero

loop:   
	addi $t0, $t0, 1
	bgt $t0, $s0, exit
	mul $a0, $a0, $t0
	blt $t0, $s0, loop 

exit:
	li $v0,1
	syscall

	li $v0,10
	syscall	
	
		
.data
num: .word 5