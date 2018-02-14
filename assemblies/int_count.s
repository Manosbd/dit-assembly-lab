.data
    str: .asciiz "abcdefg"
    container: .space 44
    newLine: .asciiz " \n"
    prompt: .asciiz "Enter a number:"
    result: .asciiz "Count of integers given: "

.text 
    _main:

        li      $t1, 0
        la      $t2, prompt
        _loop1:
            move    $a1, $t2
            jal     printString
            li      $v0, 5
            syscall
            beq     $v0, $zero, _end_loop1
            addi    $t1, $t1, 1
            j _loop1
        _end_loop1:

        la      $a1, result
        jal     printString
        move    $a1, $t1
        jal     printNumber
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
