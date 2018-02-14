.data
    prompt: .asciiz "Enter a string"

.text
    _main:
        # ask for string
        la		$a0, prompt
        li		$v0, 4
        syscall
        # read string, $s0 is now the string start address
        li		$v0, 8		# $v0 = 8
        syscall
        la		$s0, 0($a0)     
        # set up counters
        li		$t1, 5		# $t1 = 5
        li		$t0, 0		# $t1 = 5
        _nextChar:
            beq		$t0, $t1, _break	# if $t0 == $t1 then _break
            lb      $t2, 0($s0)
            la		$a0, ($t2)
            li		$v0, 11		# print a character
            syscall            
            addi	$s0, $s0, 1			# $s0 = $s0 + 1
            addi	$t0, $t0, 1			# $t0 = $t0 + 1              
            j _nextChar
        _break:
            li		$v0, 10		# $v0 = 10
            syscall
            
            
            
        

        