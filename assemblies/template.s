.data
    container: .space 44
    newLine: .asciiz " \n"
    prompt: .asciiz "Give a number"
    str: .asciiz "abcd"

.text 
    _main:
        li      $t1, 0 # outer loop counter
        li      $t2, 0 # inner loop counter
        li      $t3, 4 # loop limit

        _loop1:
            beq     $t1, $t3, _end_loop1



            _loop2:
                beq     $t2, $t3, _end_loop2
                # outer == inner loop counter, print *
                bne     $t1, $t2, _printNormal
                li      $a1, '*'
                jal     printChar
                j _skip
                _printNormal:
                lb      $a1, str($t2)
                jal     printChar
                _skip:
                addi    $t2, $t2, 1
                j _loop2
            _end_loop2:



            addi    $t1, $t1, 1
            li      $t2, 0
            jal printNewLine
            j _loop1
        _end_loop1:
    jal     exit;



# pass char into a1 register
printChar:
    li      $v0, 11
    move    $a0, $a1
    syscall
    jr      $ra

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

printNewLine:
    li      $v0, 4
    la      $a0, newLine
    syscall
    jr      $ra

exit:
    li		$v0, 10	
    syscall
