	AREA moncode, code
	export dft
			
	import TabCos
	import TabSin
	import TabSig
		
	; Im(k) = somme( x(i) * sin(ik * 2PI/n )
	; avec k = donnée, x(i) = le signal, ik = index d'entre trigo

dft		proc
	
		mov	r3, #0, r3 = i
boucleFor
		; i = 3
		
		ldr	r1, =TabSig
		ldr	r12, [r1, #(2*3)] ; r12 = x(i)
		
		mov	r12, r12, LSL #16
		mov	r12, r12, LSR #16
		
		cmp	i*k, #64    ; modulation de ik
		bcc	dejaModuler
boucleWhile
		mov	ik, ik - #64
		
		CMP	ik, #64
		bhi	boucleWhile
		
dejaModuler
		ldr	r1, =TabSin
		ldr	r2, [r1, #(2*ik)] ; r2 = sin[ik modulo #4]
		
		mov	r2, r2, LSL #16
		mov	r2, r2, LSR #16
		
		mul	r12, r2, r12
		mov	r2, r12
		
		add	r1, #1
		cmp	r3, #64
		bne	boucleFor
		
		
		
boucleFor
		; i = 3
		
		ldr	r1, =TabSig
		ldr	r12, [r1, #(2*3)] ; r12 = x(i)
		
		mov	r12, r12, LSL #16
		mov	r12, r12, LSR #16
		
		cmp	i*k, #64    ; modulation de ik
		bcc	dejaModuler
boucleWhile
		mov	ik, ik - #64
		
		CMP	ik, #64
		bhi	boucleWhile
		
dejaModuler
		ldr	r1, =TabCos
		ldr	r2, [r1, #(2*ik)] ; r2 = cos[ik modulo #4]
		
		mov	r2, r2, LSL #16
		mov	r2, r2, LSR #16
		
		mul	r12, r2, r12
		mov	r2, r12
		
		add	r1, #1
		cmp	r3, #64
		bne	boucleFor
		
		endp
			
		end