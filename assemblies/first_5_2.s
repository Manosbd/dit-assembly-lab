.data 
    prompt: .asciiz "Enter a string\n"

.text
    _main:
        li		$v0, 4		# $v0 = 4
        la		$a0, prompt		# 
        syscall
        li		$v0, 8		# $v0 = 8
        syscall
        # a0 is now the string = s0
        la		$s0, ($a0)
        # make 6th element into a z0
        sb      $zero, 6($s0)
        li		$v0, 4		# $v0 = 4
        la		$a0, ($s0)		# 
        syscall
        li		$v0, 10		# $v0 = 10
        syscall
