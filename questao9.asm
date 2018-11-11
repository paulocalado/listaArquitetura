.data
	msg: .asciiz "Entrada Invalida\n"
.text
	main:
		li  $v0, 5           # service 5 is read integer
    		syscall
    		
    		bltz $v0, exit       # if n < 0
    		
    		jal fatorial
	
	fatorial:
		# fat = fat * i
		li $s0, 1 # i
		li $s1, 1 # fat
		move $t8, $v0
		
		loop:
			blt $t8, $s0, imprimeSoma
			mul $s1, $s1, $s0
			
			addi $s0, $s0, 1 # i++
			
			j loop
		
		
	imprimeSoma:
		li  $v0, 1           # service 1 is print integer
    		add $a0, $s1, $zero  # load desired value into argument register $a0, using pseudo-op
    		syscall
    		
    		li $v0, 10
		syscall
    		
	exit:
		la $t0, msg
		li $v0, 4
		add $a0, $t0, $zero
		syscall 
		
		li $v0, 10
		syscall
