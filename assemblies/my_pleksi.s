.data
    newLine: .asciiz " \n"
    s1: .asciiz "123456789"
    s2: .asciiz "abcdefghi"

.text
    _main:
        li		$t0, 0		# $t0 = 0
    _loop:
        lb		$t1, s1($t0)		# 
        beq		$t1, $zero, _end	# if $t1 == $zero then _end
        li		$v0, 11		# $v0 = 11
        move 	$a0, $t1		# $a0 = $t1
        syscall
        lb		$a0, s2($t0)		# 
        syscall
        addi	$t0, $t0, 1		# $t0 = $t0 + 1        
        j _loop
        _end:
        li		$v0, 10	
        syscall