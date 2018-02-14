.data
    array1: .space 12 # declares 12 bytes of storage to hold 12/4= 3 integers

.text 
    main:
        la		$t0, array1 # loads array1's address into t0 register
        li		$t1, 5		# $t1 = 5
        sw		$t1, ($t0)  # t0 = t1, array1 starts at t0, now first elemenet of array is 5
        li		$t1, 13		# $t1 = 13
        sw		$t1, 4($t0) # second element of array1 is set to 13, its t0 + 4 bytes = address of 2nd element
        li		$t1, -7		# $t1 = -7
        sw		$t1, 8($t0)	# 3rd element of array is set to -7
        li		$v0, 10		# $v0 = 4
        syscall
        
        
        