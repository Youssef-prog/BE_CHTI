	AREA monconde, code
		
	export M2

	import TabCos
	import TabSin
	import dft


M2 proc ; r0 = @TabSig, r1 = k


	push {lr}
	push {r4-r7}


	ldr r2, =TabSin ; r2 = @TabSin
	ldr r3, =TabCos ; r3 = @TabCos



	push {r1-r2}
	
	mov r4, r0
	mov r5, r0
	mov r0, r1
	mov r1, r2
	mov r2, r4
	bl dft

	mov r4, r0 ; r4 = tab des im

	pop {r1-r2}

	
	mov r0, r1
	mov r1, r3
	mov r2, r5
	bl dft 

	mov r5, r0 ; r5 = tab des re



	


	smull r6, r7, r4, r4 ; im2

	smlal r6, r7, r5, r5 ;M2 

	mov r0, r7  

	pop {r4-r7} 
	pop {pc}

	endp

	end