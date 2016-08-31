TITLE	Lab00xx
;Programmer:	Marcus Ross
;Due:		7 Feb,  2014
;Description:	This program uses procedures and illustrates simple move and add instructions along with displaying "Hello, world" to the user

	.MODEL SMALL
	.386
	.STACK 64
;==============================
	.DATA
msgOut	DB	'Hello,  world', 13, 10, '$'
firstNum	DW	209
answer	DW	?
;==============================
	.CODE
Main	PROC	NEAR
	mov	ax, @data	;init data
	mov	ds, ax	;segment register

	call	DoCalcs	;compute values

	call	DispMsg	;disp to screen
done:
	mov	ax, 4c00h	;return code 0
	int	21h	;4c = exit

Main	ENDP
;==============================

;move a number into a register from memory and sum it with a constant value
DoCalcs	PROC	NEAR
	mov	ax, firstNum	;prepare for add
	mov	bx, -11
	add	ax, bx
	mov	answer, ax	;store in memory
	ret	;return to calling proc
DoCalcs	ENDP

;==============================

;sets up memory and calcs the string display
DispMsg	PROC	NEAR
	mov	dx, OFFSET msgOut	;message to display
	mov	ah, 09h	;set up code
	int	21h	;09 = call DOS string display
	ret	;return
DispMsg	ENDP

	END	Main