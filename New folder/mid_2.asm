INCLUDE 'emu8086.inc'
.model small
.stack 100H

.data
a DB ?
b DB ?
c DB ?

.code

main PROC
    MOV AX, @data
    MOV DS, AX
    
    MOV AH, 1
    INT 21h
    MOV a, AL
    INT 21h
    MOV b, AL
    INT 21h
    MOV c, AL
    
;    if a > b
;        if a > c
;            print a
;            check bc AND print
;        else print c
;            print ab
;    else b > a
;        if b > c
;            print b
;            check ac AND print
;        else print c
;            print ba
        
    printn
    
    MOV AH, a
    MOV AL, b
    CMP AH, AL
    JGE check_ac
    JMP check_bc
    
    check_ac:
    MOV AH, a
    MOV AL, c
    CMP AH, AL
    JGE print_a
    
    MOV AH, 2   ; c, a, b
    MOV DL, c
    INT 21h
    MOV DL, a
    INT 21h
    MOV DL, b
    INT 21h
    JMP exit
    
    print_a:
    MOV AH, 2   ; a
    MOV DL, a
    INT 21h
    
    MOV AH, b
    MOV AL, c
    CMP AH, AL
    JGE print_bc
    
    MOV DL, c   ; c, b
    INT 21h
    MOV DL, b
    INT 21h
    JMP exit
    
    print_bc:
    MOV AH, 2   ; b, c
    MOV DL, b
    INT 21h
    MOV DL, c
    INT 21h
    JMP exit
    
    
    check_bc:
    MOV AH, b
    MOV AL, c
    CMP AH, AL
    JGE print_b
    
    MOV AH, 2   ; c, b, a
    MOV DL, c
    INT 21h
    MOV DL, b
    INT 21h
    MOV DL, a
    INT 21h
    JMP exit
    
    print_b:
    MOV AH, 2   ; b
    MOV DL, b
    INT 21h
    
    MOV AH, a
    MOV AL, c
    CMP AH, AL
    JGE print_ac
    
    MOV DL, c   ; c, a
    INT 21h
    MOV DL, a
    INT 21h
    JMP exit
    
    print_ac:
    MOV AH, 2   ; a, c
    MOV DL, a
    INT 21h
    MOV DL, c
    INT 21h
    JMP exit
    
    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main