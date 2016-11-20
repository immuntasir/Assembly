extern printf
section .data

	noo:	dq	26 , 55 , 145 , 1230 , 14 , 23 , 21 , 411
	msg :	db	"The sum is %lld",10,0
	
section .text
	
	global main

main:
	push	rbp
	mov	rbx,0
	mov	rax,[noo]
loop:
	
	add	rbx,8
	cmp	rbx,64
	JE	next	
	add	rax,[noo+rbx]
	JMP	loop
next:	
	mov	rdi,msg
	mov	rsi,rax
	call	printf
exit:
	mov	rax,0
	pop	rbp
	ret
	
