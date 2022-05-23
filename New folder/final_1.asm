.model small
.stack 100H

.data
var1 DB 10, 13, "The quotient is: $"
var2 DB 10, 13, "The remainder is: $"

.code

main PROC
    MOV AX, @data
    MOV DS, AX
    
    MOV AX, 123DH
    MOV BL, 23H
    DIV BL
    
    MOV CL, AL
    MOV CH, AH
    
    MOV AH, 9
    LEA DX, var1
    INT 21H
    MOV AH, 2
    MOV DL, CL
    INT 21H

    MOV AH, 9
    LEA DX, var2
    INT 21H
    MOV AH, 2
    MOV DL, CH
    INT 21H
    
    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main