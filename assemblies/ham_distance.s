.data
    newLine: .asciiz " \n"
    prompt: .asciiz "Give a number"
    no: .word 0xFFFF0FFF
    mask: .word 0x00000001
    n1: .word 0xffffffff
    n2: .word 0xf

.text
    _main:
        lw		$s1, n1		# 
        lw		$s2, n2		# 
        li		$t0, 0		# iterator
        li		$t1, 32		# iteration max
        li		$t3, 0		# counter

        # calculate xor, same bits -> 0, different bits -> 1
        # hamming distance is smae bits, need to count every 0
        # from the resulting binary number
        # 1111111111111111111111111111
        # 1010111111111111111111111111
        # 0101000000000000000000000000 <- count zeros here
        xor     $s3, $s1, $s2

        # for each bit, check if its zero, if yes then proceed
        _loop:
            beq		$t0, $t1, _end	# if $t0 == $t1 then target

            # if s0 is 0 then same bits
            andi    $s4, $s3, 1
            bne		$s4, $zero, _skip	# if $s0 == $t1 then target
            # if same, increase counter
            addi	$t3, $t3, 1			# $t3 = $t3 + 1
            # shift one bit >> to check next
            _skip:
            srl     $s3, $s3, 1
            addi	$t0, $t0, 1			# $t0 = $t0 + 1
            j _loop

        
                

        _end:
            move    $a1, $t3
            jal printNumber
            jal		exit			# jump to exit and save position to $ra
    





exit:
    li		$v0, 10	
    syscall

# pass number into a1 register
printNumber:
    li		$v0, 4
    la		$a0, newLine
    syscall
    li		$v0, 1
    move 	$a0, $a1
    syscall
    jr		$ra	
    
# pass string into a1 register
printString:
    li		$v0, 4
    la		$a0, newLine
    syscall
    la		$a0, ($a1) 
    syscall
    jr		$ra	