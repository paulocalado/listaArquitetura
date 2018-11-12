.data
	n: .word 0
	answer: .word 0
	errorMsg: .asciiz "Entrada Inválida"
	answerMsg: .asciiz "O Resultado é: " 
.text
	.globl main
	main:
		li $v0, 5
		syscall
		
		bltz $v0, exit  # if n < 0
		
		add $a0, $a0, $v0
		jal soma
		sw $s0, answer
		
		# Display the result msg
		li $v0, 4
		la $t0, answerMsg
		add $a0, $t0, $zero
		syscall
		
		# Display the result
		li $v0, 1
		add $a0, $s0, $zero
		syscall
		
		# end program
		li $v0, 10
		syscall
	exit:
		
		li $v0, 4
		la $t0, errorMsg
		add $a0, $t0, $zero
		syscall
		
		li $v0, 10
		syscall
		
	.globl soma	
		soma:
			subu $sp, $sp, 8
			sw $ra, 0($sp)
			sw $a0, 4($sp)
			
			# Base
			#li $v0, 1
			#bew $a0, $zero, somaRecursiva
			slti $t0, $a0, 1  # se n < 1
			beq $t0, $zero, L1
			addi $sp, $sp, 8
			jr $ra
			
			L1:
				addi $a0, $a0, -1
				jal soma
				
				lw $a0, 4($sp)
				lw $ra, 0($sp)
				addi $sp, $sp, 8
				
				add $s0, $s0, $a0
				jr $ra	
			
		
	
		
