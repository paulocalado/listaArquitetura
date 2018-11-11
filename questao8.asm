.data
	separator: .asciiz "   "

.text
	main:
		move $t0, $zero
		move $t3, $zero
		move $t4, $zero
	#loop para receber vetor de entrada e armazenar em memoria
	loop:
		la $s0, 0x10010000
		
		bgt $t0, 9, bubbleSort
		li $v0, 5
		syscall
		move $t1, $v0
		mul $t2, $t0,4
		add $s0, $s0,$t2
		sw $t1, 0($s0)
		
		#i++
		addi $t0, $t0,1
		
		j loop
	
	bubbleSort:
		move $t1, $zero
		move $t2, $zero
		# i = $t3 e j = $t4
		la $s0, 0x10010000
		
		bgt $t3, 8, setRegisters
		mul $t5, $t3, 4
		add $s0, $s0, $t5
		lw $t2, 0($s0)
		
		#j = i+1
		addi $t4, $t3, 1
		#i++
		addi $t3, $t3, 1
		j innerLoop
	
	innerLoop:
		la $s0, 0x10010000
		
		bgt $t4, 9, bubbleSort
		mul $t6, $t4, 4
		add $s0, $s0, $t6
		lw $t7, 0($s0)
		
		addi $t4, $t4,1
		
		bgt $t2, $t7, swap
		
		j innerLoop
		
	swap:	
		#$t0 usado como aux
		move $t0, $zero	
		move $t0, $t7
		move $t7, $t2
		move $t2, $t0	
		
		la $s0, 0x10010000
		add $s0, $s0, $t5
		sw $t2, 0($s0)
		
		la $s0, 0x10010000
		add $s0, $s0, $t6
		sw $t7, 0($s0)
		
		j innerLoop

	setRegisters:
		move $t0, $zero
		move $t1, $zero
		move $t2, $zero
		move $t3, $zero
		
		j printResult
		
	printResult:
		la $s0, 0x10010000
		
		bgt $t0, 9, endProgram
		mul $t2, $t0,4
		add $s0, $s0,$t2
		
		li $v0, 1
		lw $a0, 0($s0)
		syscall
		
		li $v0, 4
		la $a0, separator
		syscall
		#i++
		addi $t0, $t0,1
		
		j printResult
		
	endProgram: 
		li $v0, 10
		syscall
		
