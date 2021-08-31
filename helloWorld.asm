[ORG 0x7C00]

mov bx, welcomeMessage  ; bx = char_address
call print              ; print()

jmp $

print:
    ;while (true)

    mov al, [bx]        ; al = *char_address
    cmp al, 0           ; if (*char_address == '\0') break
    je exitPrint

    mov ah, 0x0E        ; printf ("%c", *char_address)
    int 0x10 

    inc bx              ; char_address = char_address + 1
    jmp print
exitPrint:
    ret

welcomeMessage: db 0x0a, "Welcome to real mode!", 0

times 510-($-$$) db 0
dw 0xAA55
