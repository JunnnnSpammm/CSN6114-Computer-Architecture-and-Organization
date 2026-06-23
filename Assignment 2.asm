       MOV     R0, #0x11000000
       MOV     R1, #0x00110000
       MOV     R2, #0x00001100
       MOV     R3, #0x00000011
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       MOV     R8, #0x2000
       STR     R0, [R8]

       ;       Move r0, #0x22223333
       MOV     R0, #0x22000000
       MOV     R1, #0x00220000
       MOV     R2, #0x00003300
       MOV     R3, #0x00000033
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       STR     R0, [R8, #4]

       ;       Move r0, #0x31111111
       MOV     R0, #0x31000000
       MOV     R1, #0x00110000
       MOV     R2, #0x00001100
       MOV     R3, #0x00000011
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       STR     R0, [R8, #8]

       ;       Move r0, #0x42223333
       MOV     R0, #0x42000000
       MOV     R1, #0x00220000
       MOV     R2, #0x00003300
       MOV     R3, #0x00000033
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       STR     R0, [R8, #12]

       ;       Move r0, #0x51111111
       MOV     R0, #0x51000000
       MOV     R1, #0x00110000
       MOV     R2, #0x00001100
       MOV     R3, #0x00000011
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       STR     R0, [R8, #16]

       ;       Move r0, #0x62223333
       MOV     R0, #0x62000000
       MOV     R1, #0x00220000
       MOV     R2, #0x00003300
       MOV     R3, #0x00000033
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       STR     R0, [R8, #20]

       ;       Move r0, #0x71111111
       MOV     R0, #0x71000000
       MOV     R1, #0x00110000
       MOV     R2, #0x00001100
       MOV     R3, #0x00000011
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       STR     R0, [R8, #24]

       ;       Move r0, #0x82223333
       MOV     R0, #0x82000000
       MOV     R1, #0x00220000
       MOV     R2, #0x00003300
       MOV     R3, #0x00000033
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       STR     R0, [R8, #28]

       ;       Move r0, #0x91111111
       MOV     R0, #0x91000000
       MOV     R1, #0x00110000
       MOV     R2, #0x00001100
       MOV     R3, #0x00000011
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       STR     R0, [R8, #32]

       ;       Move r0, #0xA2223333
       MOV     R0, #0xA2000000
       MOV     R1, #0x00220000
       MOV     R2, #0x00003300
       MOV     R3, #0x00000033
       ADD     R0, R0, R1
       ADD     R0, R0, R2
       ADD     R0, R0, R3
       STR     R0, [R8, #36]

       ; Store the sum in R7:R6
       MOV     R6, #0               ; Lower 32-bit of accumulation
       MOV     R7, #0               ; Upper 32-bit of accumulation
       MOV     R8, #0x2000          ; Reset pointer to start of array
       MOV     R9, #10              ; Loop counter (10 elements to sum)

sum_loop 
       LDR     R4, [R8], #4         ; Load element into R4, then post-increment R8 by 4 bytes
       MOV     R5, R4, ASR #31      ; Sign-extend R4 into R5
       ADDS    R6, R6, R4           ; Add lower bits, update carry flag
       ADC     R7, R7, R5           ; Add upper bits with carry

       SUBS    R9, R9, #1           ; Decrement loop counter and set flags
       BNE     sum_loop             ; If R9 != 0, branch back to sum_loop

       ; Store the final result in #0x2100
       MOV     R8, #0x2100 
       STR     R6, [R8, #0]
       STR     R7, [R8, #4]
