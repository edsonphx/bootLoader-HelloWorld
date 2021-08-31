[ORG 0x7C00]

mov bx, welcomeMessage  ; bx = charAdress
call print              ; print()

jmp $

print:
    ;while (true)

    mov al, [bx]        ; al = *charAdress
    cmp al, 0           ; if (*charAdress == '\0') break
    je exitPrint

    mov ah, 0x0E        ; printf ("%c", *charAdress)
    int 0x10 

    inc bx              ; charAdress = charAdress + 1
    jmp print
exitPrint:
    ret

welcomeMessage: db 0x0a, "Welcome to real mode!", 0

times 510-($-$$) db 0
dw 0xAA55
