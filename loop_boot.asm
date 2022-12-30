;playing with MBR
;Author : Sean D'silva

mov al, 0x41 ;switch to tty mode
mov ah, 0x0e ; hex for A 
int 0x10     ;interrupt to update the screen with register value
jmp print    

exit:
	;infinite loop to give the cpu something to do 
	jmp $

print:
	inc al
	cmp al, 0x5b
	je exit
	int 0x10
	jmp print
	
times 510-($-$$) db 0
db 0x55, 0xaa
