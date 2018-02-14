.data
    readInt: .asciiz "Give me an integer\n"
    printInt: .asciiz "Take it back\n"

.text
    _main:
        li		$v0, 4		# $v0 = 4
        la		$a0, readInt		# 
        syscall

        li		$v0, 5		# $v0 = 5
        syscall

        # copy from v0 to s0
        la		$s0, ($v0)		# 
        
        
        li		$v0, 4		# $v0 = 4
        la		$a0, printInt
        syscall

        # store from v0 -> s0, print s0 (need to replace v0 to print) or do i?
        la		$a0, ($s0)		# 
        li		$v0, 1		# $v0 = 1
        syscall
        
        