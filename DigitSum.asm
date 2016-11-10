; Given a number this prints the sum of digits of the number
; func(124) = 7

extern printf
global main 
section .data
num:	dq 	12412451
ans: 	dq 	0
divi: 	dq	10
msg: 	db	"Number: %ld", 10, 0
section .bss
section .text
global main 
global add
add:
	push rbp
	CMP 	rax, 0
	JLE	exit
	mov 	rdx, 0
	idiv	dword [divi]
	add 	[ans], rdx
	call 	add
exit: 
	pop 	rbp
	ret
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16	
	xor rbx, rbx
	mov rax, [num]
	call digitcount

	mov rdi, msg
	mov rsi, rbx
	xor rax, rax
	call printf
	leave 
	ret

digitcount:	
	push rbp
	mov rbp, rsp
	sub rsp, 16

	xor rdx, rdx
	mov rcx, 10
	idiv rcx
	add rbx, rdx

	cmp rax, 0
	je no_call
	call digitcount
no_call:
	leave
	ret
