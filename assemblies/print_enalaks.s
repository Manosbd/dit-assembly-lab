.data
    str: .asciiz "abcdefghjk"
    container: .space 44
    newLine: .asciiz " \n"

.text 
    _main:

        li  $t0, 0
        li  $t1, 9
        li  $t7, 4
        _loop1:
            beq     $t0,$t7,_end_loop1
            lb      $a1, str($t0)
            jal     printChar
            lb      $a1, str($t1)
            jal     printChar
            addi    $t0,$t0, 1
            addi    $t1,$t1,-1
            jal     printNewLine
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
