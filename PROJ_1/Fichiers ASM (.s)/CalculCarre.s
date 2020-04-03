	AREA moncode, code
	export CalculCarre
			
	import TabCos

CalculCarre 	proc
		mov	r0, #1
		ldr	r1, =TabCos
		ldr	r2, [r1]
		
		endp
			
		end
			
		