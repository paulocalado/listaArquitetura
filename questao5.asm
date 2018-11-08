.data
	msg1: .asciiz "Entre com um inteiro: \n"
	msg2: .asciiz "O Numero e impar e positivo \n"
	msg3: .asciiz "O Numero e par e positivo \n"
	msg4: .asciiz "O Numero e par e negativo \n"
	msg5: .asciiz "O Numero e impar e negativo \n"
.text
	
	main:
		la $s1, msg1
		li $v0, 4
		add $a0, $s1, $zero
		syscall 
		
	 	li  $v0, 5           # service 5 is read integer
    		syscall
    		
    		add $s0, $v0, $zero  # num
    		
    		bgez $s0, positivo   # num >= 0
    		bltz $s0, negativo   # num < 0
    		
    	positivo:
    		rem $t1, $s0, 2
    		bnez $t1, else
    		
    		la $s1, msg3
		li $v0, 4
		add $a0, $s1, $zero
		syscall
		
		j exit
    		
    	else:
    		la $s1, msg2
		li $v0, 4
		add $a0, $s1, $zero
		syscall
			
		j exit 
    			
    	negativo:
    		rem $t1, $s0, 2
    		bnez $t1, elsesegundo
    		
    		la $s1, msg4
		li $v0, 4
		add $a0, $s1, $zero
		syscall
		
		j exit
	
	elsesegundo:
		la $s1, msg5
		li $v0, 4
		add $a0, $s1, $zero
		syscall
			
		j exit 	
    	exit:
    		li $v0, 10
    		syscall
