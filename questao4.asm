.data
	a: .word 1
	b: .word 2
	i: .word 0
	breakLine: .asciiz "\n"
.text
	main:
		lw $s0, a
		lw $s1, b
		lw $s2, i
		
	loop:
		bgt $s2, 10, exit
		# i++
		addi $s2, $s2, 1
		# if(a<b)
		slt $s3, $s0, $s1
		beq $s3, $zero, else	
		#a = a+2
		addi $s0, $s0, 2
		j loop
		
	else:
		#b = b+2
		addi $s1, $s1, 2
		j loop
	
	exit: 
		#imprime o valor de a
		li $v0, 1
		move $a0, $s0
		syscall
		
		#apenas quebrando a linha entre as duas variáveis
		li $v0, 4
		la $a0, breakLine
		syscall
		
		#imprime o valor de b
		li $v0, 1
		move $a0, $s1
		syscall
	
	
	