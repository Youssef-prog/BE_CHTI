	AREA moncode, code
	export sommeCarre
			
	import TabCos
	import TabSin
		

sommeCarre 	proc

;		mov
;boucleFor
;		add r0, #1
;		
;		CMP R0, #5
;		BNE boucleFor
;		mov	r1, #1
;		mov	r1, #1


		ldr	r1, =TabSin
		ldr	r2, [r1, #(2*3)]
		
		mov	r12, r12, LSL #16
		mov	r12, r12, LSR #16
		
		mul	r12, r12, r12
		
		
		ldr	r1, =TabCos
		ldr	r2, [r1, #(2*3)]
		
		mov	r2, r2, LSL #16
		mov	r2, r2, LSR #16
		
		mul	r2, r2, r2
		
		
		add	r3, r12, r2
		mov	r3, r2
		
		mov	r0, #0
		
		endp
			
		end
			
		