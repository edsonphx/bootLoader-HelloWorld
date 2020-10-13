[ORG 0x7C00]

.START:
	mov si, STRING
	
CHAR_LOOP: lodsb
	or al,al
	jz .END
	mov ah, 0x0E
	int 0x10
	jmp CHAR_LOOP
	
.END:
	jmp .END

STRING:	db "Hello, World!", 0

times 510-($-$$) db 0
dw 0xAA55
