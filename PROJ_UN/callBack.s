
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register

	AREA Mesdonnees, data
		
		
tot dcb 0
;
;
	AREA monconde, code
	export timer_callback
;
;
timer_callback	proc
	
	LDR R10,=tot
	LDRSB R9,[R10]
	MVN R9,R9
	STRB R9,[R10]
		
	CMP R9,#0
	BEQ On

	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00020000
	str	r1, [r3]
; N.B. le registre BSRR est write-only, on ne peut pas le relire
	B out	
On
	; mise a 1 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00000002
	str	r1, [r3]
; mise a zero de PB1

out	bx	lr
	endp





	

	end