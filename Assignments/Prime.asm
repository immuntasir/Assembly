section .bss
section .data
	a:	dq 7	;The input number
	Prime1:	db "%ld is a prime.",10, 0
	Prime2: db "%ld is not a prime.	It is divisible by %ld.",10, 0
	one: db "1 is not a prime.",10, 0
	zero: db "0 is not a prime.",10, 0
	
section .text

	extern printf
	global main

main:
	push	rbp
	mov	rax,[a]
	mov	rdx, 0
	mov	rcx, 2

Loop:
	mov	rax,[a]
	cmp	rcx,[a]
	JE	Prime
	cmp	rax,1
	JE	NotPrime1
	cmp	rax,0
	JE	NotPrime0

	mov	rax,[a]
	mov	rdx, 0
	idiv	rcx
	cmp	rdx,0
	JE	NotPrime
	add	rcx,1
	JMP	Loop

NotPrime1:			
	mov	rdi,one
	call	printf
	JMP	Exit

NotPrime0:			
	mov	rdi,zero
	call	printf
	JMP	Exit

NotPrime:
	mov	rdi,Prime2
	mov	rax, [a]
	mov	rsi, rax
	mov	rdx, rcx
	call	printf
	JMP	Exit

Prime:
	mov	rdi,Prime1
	mov	rax, [a]
	mov	rsi, rax
	call	printf
	JMP	Exit

Exit:
	pop	rbp
	mov	rax,0
	ret




	
