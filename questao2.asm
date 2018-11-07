.data
	i: .word 0
	num: .word 100
	
	
.text
	la $s0, 0x10010020
	lw $s1, i
	lw $s2, num
	
	#v[i] = 1
	addi $t0, $zero, 1
	mul $t3,$s1,4
	add $s0, $s0, $t3
	sw $t0, 0($s0)
	move $t0, $zero
	move $t3, $zero
	
	
	#i = i +1
	addi $s1, $s1,1
	
	#v[i] = 3
	addi $t0, $zero, 3
	mul $t3, $s1, 4
	add $s0, $s0, $t3
	sw $t0, 0($s0)
	move $t0, $zero
	move $t3, $zero
	la $s0, 0x10010020
	
	#i = i+1
	addi $s1, $s1,1
	
	#v[i]= 2
	addi $t0, $zero, 2
	mul $t3, $s1, 4
	add $s0, $s0, $t3
	sw $t0, 0($s0)
	move $t0, $zero
	move $t3, $zero
	la $s0, 0x10010020
	
	#i = i+1
	addi $s1, $s1, 1
	
	#v[i]=1
	addi $t0, $zero, 1
	mul $t3, $s1, 4
	add $s0, $s0, $t3
	sw $t0, 0($s0)
	move $t0, $zero
	move $t3, $zero
	la $s0, 0x10010020
	
	#i = i+1
	addi $s1, $s1, 1
	
	#v[i]=4
	addi $t0, $zero, 4
	mul $t3, $s1, 4
	add $s0, $s0, $t3
	sw $t0, 0($s0)
	move $t0, $zero
	move $t3, $zero
	la $s0, 0x10010020
	
	#i = i+1
	addi $s1, $s1, 1
	
	#v[i]=5
	addi $t0, $zero, 5
	mul $t3, $s1, 4
	add $s0, $s0, $t3
	sw $t0, 0($s0)
	move $t0, $zero
	move $t3, $zero
	la $s0, 0x10010020
	
	#i = i+1
	addi $s1, $s1, 1
	
	#v[2] + v[4]
	lw $t4, 8($s0)
	lw $t5, 16($s0)
	add $t0, $t4, $t5
	#v[2] + v[4] + num
	add $t0, $t0, $s2
	mul $t3, $s1,4
	add $s0, $s0, $t3
	sw $t0, 0($s0)