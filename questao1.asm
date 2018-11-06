
.text
	la $s0, 0x10010000
	add $t0, $zero, 1
	sw $t0, 0($s0)
	
	move $t0, $zero
	add $t0, $zero, 3
	sw $t0, 4($s0)
	
	move $t0, $zero
	add $t0, $zero, 2
	sw $t0, 8($s0)
	
	move $t0, $zero
	add $t0, $zero, 1
	sw $t0, 12($s0)	
	
	move $t0, $zero
	add $t0, $zero, 4
	sw $t0, 16($s0)
	
	move $t0, $zero
	add $t0, $zero, 5
	sw $t0, 20($s0)