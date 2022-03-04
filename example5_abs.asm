.text

	.globl	main
main:
	# Print string msg1
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg1	# load the address of msg
	syscall
	
	# Get input A from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t0,$v0		# syscall results returned in $v0

	# Math!
	bge $t0,$0,POSITIVE
NEGATIVE: sub $t0,$0,$t0
POSITIVE: li	$v0,4		# print_string syscall code = 4
	la	$a0, msg2	# load the address of msg
	syscall

	li	$v0,1		# print_int syscall code = 1
	move	$a0, $t0	# int to print must be loaded into $a0
	syscall

	li	$v0,10		# exit
	syscall
	
	.data
msg1:	.asciiz	"Lutfen sayi giriniz:\n"
msg2:	.asciiz	"Sayinin mutlak degeri:\n"
