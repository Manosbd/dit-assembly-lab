.data
    container: .space 44
    newLine: .asciiz " \n"
    prompt: .asciiz "Give a number"
    no: .word 0xFFFF0FFF
    mask: .word 0xe0000000
    n1: .word 15454

.text
    _main:
        # iterations
        li		$t1, 0		# $t1 = 0
        li		$t7, 0 		# memory index at array., mult 4        
        li		$t2, 11		# $t1 = 0
        
        lw		$s1, n1		# 

        _loop1:
            beq		$t2, $t1, _end_loop1
            # keep last 3 bits
            andi    $s2, $s1, 7
            # print last 3 bits
            #move    $a1, $s2
            #jal     printNumber
            sw		$s2, container($t7)	
            # shift 3 bits
            srl     $s1, $s1, 3
            # repeat
            addi	$t7, $t7, 4			# $t7 = $t7 + 4
            addi	$t1, $t1, 1			# $t1 = $t1 + 1
            j _loop1
                

        _end_loop1:
        li		$t1, 0		# $t1 = 0
        li		$t2, 11		# $t1 = 0
        li		$t7, 40 		# memory index at array., mult 4  
        _loop2:
            beq		$t2, $t1, _end_loop2	# if $t2 == $t1 then _end_loop2
            lw		$a1, container($t7)		# 
            jal		printNumber				# jump to printNumber and save position to $ra            
            addi	$t7, $t7, -4			# $t7 = $t7 + 4
            addi	$t1, $t1, 1			# $t1 = $t1 + 1
            j _loop2
        _end_loop2:
            jal		exit			# jump to exit and save position to $ra
    





exit:
    li		$v0, 10	
    syscall

# pass number into a1 register
printNumber:
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