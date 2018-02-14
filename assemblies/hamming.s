.text       
        .globl __start 
__start:            
 	la $t0, num
	li $t4, 0
	li $t5, 0
	
	lw $t1, 0($t0)       
	lw $t2, 4($t0) 
	lw $t6, 8($t0) 
	li $s0, 32
	xor $t3, $t1, $t2
loop:
	and $t7, $t3, $t6
	add $t4, $t4, $t7
	addi $t5, $t5, 1
	srl $t3, $t3, 1
	bne $t5, $s0, loop
	
	la $a0,answer     
	li $v0,4
    	syscall

	move $a0, $t4
	li $v0, 1
	syscall

	la $a0,endl     
	li $v0,4
    	syscall

	la $a0,exit_message     
	li $v0,4
    	syscall

	li $v0,10
    	syscall         

    .data
num:      .word 0x0f, 0x07, 0x01
answer:     .asciiz "Hamming distance is : "
exit_message: .asciiz "Au revoir... "
endl:       .asciiz "\n"