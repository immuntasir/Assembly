; a simple recurence problem

;F(x, y) = y, when x = 0
;F(x, y) = y+1,and recursive call F(x/2, y), if x even
;F(x, y) = y+x/2 , and recursive call F(x/2, y), if x odd
extern printf
global main 
section .data
x:	dq	1
y:	dq	1455
msg: 	db	"Number: %ld", 10,  0
section .bss
section .text
global main 
global func
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16	
	
	mov rbx, [y]
	mov rax, [x]
	call func

	mov rdi, msg
	mov rsi, rbx
	call printf

	xor rax, rax
	leave 
	ret
func:
	push rbp
	mov rbp, rsp
	sub rsp, 16	

	cmp rax, 0
	je firiyedao

	mov rdx, 0
	mov r13, 2
	idiv r13

	cmp rdx, 0
	je prothom
	add rbx, 1
	call func
	jmp firiyedao
prothom:
	add rbx, rax
	call func;
firiyedao:
	leave
	ret
