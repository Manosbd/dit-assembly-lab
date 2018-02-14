.data
    container: .space 120
    newLine: .asciiz " \n"
    prompt: .asciiz "Give a string"

.text
    _main:

        #counters
        li		$t0, 0		# $t0 = 0
        
        li		$v0, 8		# $v0 = 8
        la		$a0, container		#         
        syscall
        la 	    $t7, container		# $a0 = $s0
        # t7 is now the start of the string
        _loop1:
            lb		$t1, ($t7)		# 
            beq		$t1, $zero, _end_loop1	# if $t1 == $Zero then _end_loop1

            move    $a0, $t1
            li		$v0, 11		# $v0 = 11
            syscall
            

            addi	$t7, $t7, 1			# $a0 = $a0 + 1
            addi	$t0, $t0, 1			# $t0 = $t0 + 1
            
            j _loop1
        _end_loop1:

    _end:
        jal exit
        
        

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