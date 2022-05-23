INCLUDE 'emu8086.inc'
.model small
.stack 100H

.data
num1 DW 50
num2 DW 40

.code

main PROC
    MOV AX, @data
    MOV DS, AX
    
    MOV AX, num1
    MOV BX, num2
    MUL BX
    
    print "the multiplication is: "
    MOV AH, 2
    MOV DX, AX
    INT 21H
    
    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main