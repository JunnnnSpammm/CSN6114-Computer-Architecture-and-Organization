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
       MOV     R6, #0
       MOV     R7, #0
       MOV     R8, #0x2000

       ; Calculate the sums of all 10 element

       LDR     R4, [R8, #0]
       MOV     R5, R4, ASR #31 ; Shift R4 into R5 and isolate the sign bit
       ADDS    R6, R6, R4
       ADC     R7, R7, R5 

       LDR     R4, [R8, #4]
       MOV     R5, R4, ASR #31
       ADDS    R6, R6, R4
       ADC     R7, R7, R5

       LDR     R4, [R8, #8]
       MOV     R5, R4, ASR #31
       ADDS    R6, R6, R4
       ADC     R7, R7, R5

       LDR     R4, [R8, #12]
       MOV     R5, R4, ASR #31
       ADDS    R6, R6, R4
       ADC     R7, R7, R5

       LDR     R4, [R8, #16]
       MOV     R5, R4, ASR #31
       ADDS    R6, R6, R4
       ADC     R7, R7, R5

       LDR     R4, [R8, #20]
       MOV     R5, R4, ASR #31
       ADDS    R6, R6, R4
       ADC     R7, R7, R5

       LDR     R4, [R8, #24]
       MOV     R5, R4, ASR #31
       ADDS    R6, R6, R4
       ADC     R7, R7, R5

       LDR     R4, [R8, #28]
       MOV     R5, R4, ASR #31
       ADDS    R6, R6, R4
       ADC     R7, R7, R5

       LDR     R4, [R8, #32]
       MOV     R5, R4, ASR #31
       ADDS    R6, R6, R4
       ADC     R7, R7, R5

       LDR     R4, [R8, #36]
       MOV     R5, R4, ASR #31
       ADDS    R6, R6, R4
       ADC     R7, R7, R5

       ; Store the final result in #0x2100
       MOV     R8, #0x2100 
       STR     R6, [R8, #0]
       STR     R7, [R8, #4]
