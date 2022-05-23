INCLUDE 'emu8086.inc'
.model small
.stack 100H

.data
var1 DB ?
var2 DB ?

.code

main PROC
    MOV AX, @data
    MOV DS, AX
    
    print "Enter the first number: "
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    printn
    print "Enter the second number: "
    MOV AH, 1
    INT 21H
    MOV BH, AL
    
    CMP BH, BL
    JG second
    
    printn
    print "The larger number is: "
    MOV AH, 2
    MOV DL, BL
    INT 21H
    JMP exit
    
    second:
    printn
    print "The larger number is: "
    MOV AH, 2
    MOV DL, BH
    INT 21H
    JMP exit
    
    
    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main