	.text
	.globl _start
_start:
	la $a0, num

read:
	la $a0, read_message
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	
	move $t2, $v0	# t2 holds num
		
	la $a0, endl
	li $v0, 4
	syscall

	la $a0, ans_message
	li $v0, 4
	syscall

loop:
	beqz $t2, ans
	div $t2, $t2, 2
	mflo $t1 
	sb $t1, ($a0)
	add $a0, $a0, 1
		
	j loop

ans:
	la $a0, -4($a0)
	li $v0, 4
	syscall
	
exit:
	la $a0, endl
	li $v0, 4
	syscall

	la $a0, exit_message
	li $v0, 4
	syscall
	
	la $a0, endl
	li $v0, 4
	syscall

	li $v0, 10
	syscall

	.data

num: .space 4
ans_message: .asciiz "Binary is: "
read_message: .asciiz "Give decimal number: "
exit_message: .asciiz "Au revoir... "
endl: .asciiz "\n"