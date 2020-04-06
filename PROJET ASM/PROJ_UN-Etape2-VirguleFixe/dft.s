	AREA moncode, code
	export dft
			
	import TabCos
	import TabSin
	import TabSig
		
	; Im(k) = somme( x(i) * sin(ik * 2PI/n )
	; avec k = donnée, x(i) = le signal, ik = index d'entree trigo

dft		proc			; r0 = k
		
		push	{r4}
		push	{r5}
		push	{r6}
		
		mov	r6, #0		; r6 stocke la valeur que l'on va retourner 
		
		ldr	r1, =TabSig	; r1 = @TabSig
		ldr	r2, =TabSin	; r2 = @TabSin
		mov	r3, #0		; r3 = i
boucleFor
		mul	r0, r3		; r0 = ik
		
		ldr	r12, [r1, #1]!
		ldr	r12, [r1, #1]!	; r12 = x(i)
				
		mov	r12, r12, LSL #16
		mov	r12, r12, LSR #16
		
		cmp	r0, #64    ; modulation de ik
		bcc	dejaModuler
boucleWhile
		sub	r0, #64
		
		CMP	r0, #64
		bhi	boucleWhile
		
dejaModuler
		ldr r4, [r2, r3, LSL #1 ] ; r4 = sin[ik modulo 64]
		
		mov	r4, r4, LSL #16
		mov	r4, r4, LSR #16
		
		mul	r5, r4, r12	; r5 = imaginaire
		
		add	r6, r5
		
		add	r3, #1
		cmp	r3, #64
		bne	boucleFor
		
		mov	r0, r6
		
		pop {r6}
		pop {r5}
		pop {r4}
		
		endp
			
		end