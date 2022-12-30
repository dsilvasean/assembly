;playing with MBR
;Author : Sean D'silva

mov al, 0x41 ; hex for A
mov ah, 0x0e ; switch to tty mode
mov bh, 0x62 ; hex for a
mov bl, 0x41 ; hex for A 
int 0x10     ;interrupt to update the screen with register value
jmp lower

exit:
	;infinite loop to give the cpu something to do 
	jmp $

lower:
	mov al, bh;
	int 0x10
	inc bh;
	inc bh;
	cmp bh, 0x7c 
	je exit
	je upper 

upper:
	inc bl
	inc bl
	mov al, bl
	int 0x10
	jmp lower
			
times 510-($-$$) db 0
db 0x55, 0xaa
