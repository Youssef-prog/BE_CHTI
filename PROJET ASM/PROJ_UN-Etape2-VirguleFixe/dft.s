    AREA monconde, code
    export dft
    
    import TabCos
    import TabSin
    import TabSig
        
    
    ; Im(k) = somme( x(i) * sin(ik * 2PI/n )
    ; avec k = donnée, x(i) = le signal,  ik = index d'entree trigo
    
dft    proc                ; r0 = k
    
    push    {lr}
    push    {r4}
    push    {r5}
    push    {r6}
    push    {r7}
    
    mov    r7, r0        ; r7 = k
    mov    r6, #0        ; r6 stock la valeur que l'on va return

    
    ;ldr    r1, =TabSin         ; r1 = @TabSin
    ;ldr    r2, =TabSig        ; r2 = @TabSig
    mov    r3, #0              ;  r3 = i
boucleFor    
    mul    r0, r3, r7            ; r0 = ik
    
    
    ;ldr    r12, [r1, #1]!
    ldrsh    r12, [r2, r3, lsl #1]  ; r12 = x(i)
    
    
    mov    r12, r12, LSL #24
    mov    r12, r12, LSR #24
         

    ldrsh    r4, [r1, r3, LSL #1]  ;      r4 = sin[ik modulo 64]
    
    
    ;mov    r4, r4, LSL #16
    ;mov    r4, r4, LSR #16
    

    mul    r5, r4, r12          ; r5 = imaginaire
    
    add    r6, r5
    
    add    r3, #1
    cmp    r3, #64
    bne    boucleFor
    
    mov    r0, r6
    
    pop    {r7}
    pop    {r6}
    pop    {r5}
    pop    {r4}
    pop    {pc}
    
    endp
    
    end