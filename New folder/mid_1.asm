INCLUDE 'emu8086.inc'
.model small
.stack 100H

.data
num DB 5
; 0000 0101
; 1111 1010 = FA
; 1111 1011 = FB

.code

main PROC
    MOV AX, @data
    MOV DS, AX
    
    MOV BL, num
    NOT BL
    ADD BL, 1
    
    print "the 2s complement is: "
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main