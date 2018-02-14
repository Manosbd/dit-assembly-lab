.text
.globl _start

_start:
	li $s0,2

read:
	la $a0,newline
	li $v0,4
	syscall

	la $a0,enter
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	
	li $s0,2
	move $s1, $v0
	beqz $s1, exit
loop:
	beq $s0, $s1, yes
	div $s2,$s1,$s0
	mfhi $s3
	beqz $s3, no
	add $s0, $s0, 1
	j loop

yes:
	move $a0, $s1
	li $v0,1
	syscall

	la $a0,yes_message
	li $v0,4
	syscall
	j read

no:
	move $a0, $s1
	li $v0,1
	syscall

	la $a0,no_message
	li $v0,4
	syscall
	j read

exit:
	move $a0, $s1
	li $v0,1
	syscall

	la $a0,newline
	li $v0,4
	syscall

	la $a0, exit_message
	li $v0,4
	syscall

	li $v0,10
	syscall

.data
enter: .asciiz "Enter number: "
newline: .asciiz "\n"
yes_message: .asciiz " is prime "
no_message: .asciiz " is not prime "
exit_message: .asciiz "Au revoir... "
