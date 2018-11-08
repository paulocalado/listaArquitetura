.data
	JumpTable: .word emptyState,soma, subtracao, multiplicacao, divisao
	operation: .asciiz "Escolha a operação: (1-Adição, 2-Subtração, 3-Multiplicação, 4-Divisão \n"
	firstNumber: .asciiz "Digite o primeiro operando \n"
	secondNumber: .asciiz "Digite o segundo operando \n"
	result: .asciiz "Resultado: "

.text
	la $s0, JumpTable
	
	li $v0, 4
	la $a0, firstNumber
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, secondNumber
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	li $v0, 4
	la $a0, operation
	syscall
	
	li $v0, 5
	syscall
	move $s3, $v0
	
	
	blt $s3, 0, Exit #testa se operacao eh maior que 1
	li $t0, 4
	bgt $s3, $t0, Exit #testa se operacao eh maior que 4
	
	sll $t1, $s3, 2	  #calcula o endereco da operacao
	add $t0, $t1, $s0 #$t0 = jumptable +4*k(operacao)
	lw $t0, 0($t0) 	  #carrega o endereco do caso selecionado
	jr $t0

emptyState:
	j Exit

soma:
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	add $a0, $s1, $s2
	syscall
	
	j Exit
subtracao:
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	sub $a0, $s1, $s2
	syscall

	j Exit
multiplicacao:
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	mul $a0, $s1, $s2
	syscall
	
	j Exit
divisao:
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	div $a0, $s1, $s2
	syscall
	
	j Exit

Exit:
	li $v0, 10
	syscall	
