extern printf
section .bss
fib: 	resw 30
section .data
 	msg3: db "%ld", 10, 0
	
	a:	dq 	0
	b:	dq	1
	c: 	dq 	10
	d: 	dq 	0
	e: 	dq 	0
section .text 
	
	global main
	global subroutine
subroutine:	
	push rbp
	mov rdi, [a]
	mov [fib+rcx], rdi
	add rcx, 2;
	mov rax, 0
mov 	rdi, msg3
mov 	rsi, [a]
call printf 
	mov rdi, [b]
	add rdi, [a]
	mov rsi, [a]
	mov [b], rsi
	mov [a], rdi
	sub dword[c], 1
	pop rbp
	CMP dword [c], 0
	JNE subroutine 
	ret
print:	
	push rbp
	mov 	rdi, msg3
	mov rsi, [rcx]
 	call printf
	sub rcx, 32
	sub dword [c], 1 
	pop rbp
	CMP dword [c], 0	
	JNE print
	ret
main:
	push	rbp
	mov rcx, 0
	mov rax, 1
	call 	subroutine
	mov rcx, fib
	add rcx, 320
	mov dword[c], 10
	;call print
exit:
	mov	rax,0
	pop	rbp
	ret
