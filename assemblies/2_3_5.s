.data
    giveNumber: .asciiz "Give me a number"
    newLine: .asciiz " \n"
    by2: .asciiz "Divisable by 2"
    by3: .asciiz "Divisable by 3"
    by5: .asciiz "Divisable by 5"


.text
    _main:
        la		$a1, giveNumber		# 
        jal		printString				# jump to printString and save position to $ra        
        # read integer
        li		$v0, 5		# $v0 = 5
        syscall
        move 	$s0, $v0		# $s0 = $v0
        move 	$a1, $s0		# $a1 = $s0
        jal		printNumber		# jump to printNumber and save position to $ra    

        # s0-> given int, t0->current division check, t1-> div mod
        # division by 2
        li		$t0, 2		# $t0 = 2
        div		$s0, $t0			# $s0 / $t2
        mfhi	$t1					# $t3 = $s0 mod $t2 
        bne		$t1, $zero, _next2	# if $t0 != $zero then _next2
        la		$a1, by2		# 
        jal		printString				# jump to printString and save position to $ra
        j       _end
    _next2:
        li		$t0, 3		# $t0 = 2
        div		$s0, $t0			# $s0 / $t2
        mfhi	$t1					# $t3 = $s0 mod $t2 
        bne		$t1, $zero, _next3	# if $t0 != $zero then _next2
        la		$a1, by3		# 
        jal		printString				# jump to printString and save position to $ra
        j       _end
    _next3:
        li		$t0, 5		# $t0 = 2
        div		$s0, $t0			# $s0 / $t2
        mfhi	$t1					# $t3 = $s0 mod $t2 
        bne		$t1, $zero, _end	# if $t0 != $zero then _next2
        la		$a1, by5		# 
        jal		printString				# jump to printString and save position to $ra
        j       _end
    _end:
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
    
# pass number into a1 register
printString:
    li		$v0, 4
    la		$a0, newLine
    syscall
    la		$a0, ($a1) 
    syscall
    jr		$ra	