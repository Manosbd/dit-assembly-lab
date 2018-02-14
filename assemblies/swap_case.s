.data
    newLine: .asciiz " \n"
    container: .space 80
    str: .asciiz "einaiena keimeno poy den exei katholou ton xaraktira x LEL xD"
    prompt: .asciiz "Give a string"

.text
    _main:
        # ascii diff --> 32
        li		$s1, 'a'		# $s1 = 'a'
        li		$s2, 'z'		# $s2 = 'z'
        
        
        la		$a1, prompt		# 
        jal		printString				# jump to printString and save position to $ra       
        
        # read string, s0 -> input string
        li		$v0, 8		# $v0 = 8
        syscall
        move 	$s0, $a0		# $s0 = $a0
                
        li		$t0, 0		# $t0 = 0
    _while:
        lb		$t1, ($s0)		#         
        beq		$t1, $zero, _break	# if $t0 == $zero then _break
        blt		$t1, $s1, _skipSwap	# if $t1    < st1 _skipSwap target        
        bgt		$t1, $s2, _skipSwap	# if $t1 > $t1 then target
        
        addi	$t1, $t1, -32			# $t2 = $t1 + -32  A --> a
        _skipSwap:
        sb		$t1, container($t0)		# 
        addi	$t0, $t0, 1			# $t0 = $t0 + 1
        addi	$s0, $s0, 1			# $s0 = $s0 + 1
        
        j _while
    _break:
        la		$a1, container
        jal		printString				# jump to printString and save position to $ra        
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