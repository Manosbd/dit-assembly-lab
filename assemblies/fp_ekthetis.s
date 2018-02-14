.text
.globl __start

__start:

loop1:
read_float:
	li $v0, 6
	syscall

print_float: 
	mov.s $f12, $f0
	li $v0, 2
	syscall

	li.s $f2, 0.0
	c.eq.s $f12, $f2 # an dwthei san eisodos to mhden
	bc1t exit # termatizei to programma.

	jal print_endl
	li $s0, 0
loop2:
	mfc1 $s0, $f12
	sll $s0, $s0, 1
	srl $s0, $s0, 24
	addi $s0, $s0, -127

print_exponent:
	li $v0, 4
	la $a0, Exponent
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	jal print_endl
	j loop1


exit:
	li $v0, 10
	syscall

print_endl:
	li $v0, 4
	la $a0, endl
	syscall
	jr $ra


.data

endl: .asciiz "\n"
Exponent: .asciiz "Exponent = "