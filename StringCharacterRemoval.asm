; Given a string, this removes all occurence of 'x'
extern printf
global main 
section .data
str: 	db	"Thixs ixsx ax sxtrinxgx", 10, 0
msg: 	db	"%c",  0
section .bss
section .text
global main 
global print
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16	
	xor rbx, rbx
	call print

	xor rax, rax
	leave 
	ret
print:	
	push rbp
	mov rbp, rsp
	sub rsp, 16
	
	xor rdx, rdx
	mov dl, 120
	cmp [str+rbx], dl
	je okay
	
	mov rdi, msg
	mov rsi, [str+rbx]
	call printf
okay:
	add rbx, 1
	mov dl, 0
	cmp [str + rbx], dl
	je no_call
	
	call print
no_call:
	leave
	ret
