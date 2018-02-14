.data
    newLine: .asciiz " \n"
    container: .space 80
    str: .asciiz "einai ena keimeno poy den exei katholou ton xaraktira x LEL xD"

.text
    _main:
        # s0 the char that breaks
        li		$s0, 'x'		# $s0 = 'x'    
        la		$s1, str		
        la		$s2, container
        
        # print string
        la		$a1, str
        jal		printString			

        # start looping
    _loop:
        lb		$t1, ($s1)
        beq		$t1, $s0, _skip	# if $t0 == $s0 then _skip else copy
        sb		$t1, ($s2)		# 
        addi	$s1, $s1, 1			# $s1 = $s1 + 1
        addi	$s2, $s2, 1			# $s2 = $s2 + 1
        j _loop
    _skip:
        la		$a1, container		# 
        jal printString        
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