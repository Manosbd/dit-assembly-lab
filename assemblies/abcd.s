.data
	string1: .asciiz "abcd"
	output: .space 4
	asterisk: .asciiz "*"
	nl: .asciiz "\n"

.text
	_main:
		# t0 is array length
		li $t0,4
		# t1 outer loop counter
		li $t1,0
		# t2 inner loop counter
		li $t2,0
		# s0 input string
		la $s0,string1

	_loop:
		beq $t1, $t0, _loop_end
		move $t2,$zero
		_inner_loop:
			beq $t2, $t0, _inner_loop_end
			# if inner ==  outer counter
			beq $t1, $t2, _if
			# print character at current index
			add $t9, $t2, $s0 # t9 is now the new address
			lb $a0, ($t9) # load byte from address
			li $v0, 11
			syscall
			j _if_end
			_if:
				jal _print_asterisk
			_if_end:
			# restart inner loop
			addi $t2, $t2, 1
			j _inner_loop
		_inner_loop_end:
		jal _print_nl
		addi $t1, $t1, 1
		j _loop
	_loop_end:

	_exit:
		li $v0,10
		syscall

	_print_asterisk:
		li $v0,4
		la $a0,asterisk
		syscall
		jr $ra

	_print_nl:
		li $v0,4
		la $a0,nl
		syscall
		jr $ra
