.text
.globl _start

_start:
	l.s $f1, zero	# holds zero
	
loop:
	la $a0, print_message
	li $v0, 4
	syscall

	li $v0, 6
	syscall
		
	la $a0, newline
	li $v0, 4
	syscall

	mov.s $f12, $f0
	li $v0, 2
	syscall
	
	cvt.w.s $f12, $f0
	cvt.s.w $f3, $f12

	c.eq.s $f0, $f1
	bc1t exit
	
	c.eq.s $f3, $f0
	bc1t yes

	la $a0, no_message
	li $v0, 4
	syscall
	
	j loop

yes:

	la $a0, yes_message
	li $v0, 4
	syscall
	
	j loop

exit:	
	la $a0, newline
	li $v0, 4
	syscall

	la $a0, exit_message
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

.data

zero: .float 0.0
yes_message: .asciiz "Is interger! "
no_message: .asciiz "És not interger. "
print_message: .asciiz "Give number: "
exit_message: .asciiz "Au revoir..."
newline: .asciiz "\n"