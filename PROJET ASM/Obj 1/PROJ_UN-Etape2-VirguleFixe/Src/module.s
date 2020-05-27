	;Area, moncode, code
	AREA monconde, code
		
	export M2

	import TabCos
	import TabSin
	import dft


M2 proc ; r0 = @TabSig, r1 = k


	push {lr}
	push {r4}
	push {r5}
	push {r6}
	push {r7}


	ldr r2, =TabSin ; r2 = @TabSin
	ldr r3, =TabCos ; r3 = @TabCos


	push {r0}
	push {r1}
	push {r2}
	push {r3}

	mov r0, r1
	mov r1, r2
	mov r2, r0
	bl dft

	mov r4, r0 ; r4 = tab des im

	pop {r3}
	pop {r2}
	pop {r1}
	pop {r0}

	push {r0}
	push {r1}
	push {r2}
	push {r3}

	mov r0, r1
	mov r1, r3
	mov r2, r0
	bl dft

	mov r5, r0 ; r5 = tab des re

	pop {r3}
	pop {r2}
	pop {r1}
	pop {r0}


	ldrsh r6, [r4, r1, lsl #1]
	ldrsh r7, [r5, r1, lsl #1]


	mul r6, r6 ; im2

	mla r7, r7, r7, r6 ;M2

	mov r0, r7

	pop {r7}
	pop {r6}
	pop {r5}
	pop {r4}
	pop {pc}

	endp

	end