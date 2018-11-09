.data
	

.text
	main:
		move $t0, $zero
		
	#loop para receber vetor de entrada e armazenar em memoria
	loop:
		la $s0, 0x10010000
		
		bgt $t0, 9, exitLoop
		li $v0, 5
		syscall
		move $t1, $v0
		mul $t2, $t0,4
		add $s0, $s0,$t2
		sw $t1, 0($s0)
		
		#i++
		addi $t0, $t0,1
		
		j loop
	
	exitLoop:
		li $v0,10
		syscall