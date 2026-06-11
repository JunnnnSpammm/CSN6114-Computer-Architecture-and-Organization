## Lab B-04: Programming Exercise 2

### 1. Write ARM instructions to find the

#### i. 1’s complement and 2’s complement of a 32 bit number in location ‘X’ and store the result in memory.

```assembly
       MOV     R1, #0x1000
       MOV     R2, #0XC0000034
       STR     R2, [R1]

       LDR     R0, [R1]
       MVN     R5, R0
       ADD     R6, R5, #0x001

       MOV     R7, #0x7000
       STR     R5, [R7], #0x04
       STR     R6, [R7]
       END
```

#### ii. 1’s complement and 2’s complement of a 64-bit number in locations ‘X’ and ‘X+1’ (lower order first followed by higher order) and store the result in consecutive memory locations

```assembly
       MOV     R0, #0x6300
       MOV     R1, #0xC0000034
       MOV     R2, #0xFF000000
       STR     R1, [R0], #0x04
       STR     R2, [R0]

       MVN     R3, R1
       MVN     R4, R2

       ADDS    R5, R3, #0x001
       ADC     R6, R4, #0x0

       MOV     R7, #0x6400
       STR     R3, [R7], #0x04
       STR     R4, [R7], #0x04
       STR     R5, [R7], #0x04
       STR     R6, [R7]
       END
```

### 2. Perform the following BCD addition operation (one digit of BCD code add with another one digit of BCD code) by writing a program in ARM Assembly Language:

1. Operand 1 is stored in memory location 6000H and Operand 2 is stored in memory location 6004H.
2. Place the result in two consecutive memory locations if the result exceeds the value 10BCD: 7000H and 7004H

```assembly
       MOV     R1, #0x05
       MOV     R2, #0x08
       MOV     R3, #0x6000
       MOV     R4, #0x7000
       STR     R1, [R3]
       STR     R2, [R3, #0x04]
       LDRB    R5, [R3]
       LDRB    R6, [R3, #0x04]

       MOV     R7, #0x06
       MOV     R9, #0x0F
       MOV     R10, #0x01
       ADD     R8, R5, R6

       CMP     R8, #0x0A
       BLT     skip
       ADD     R8, R8, R7
       AND     R8, R8, R9
       STR     R8, [R4]
       STR     R10, [R4, #0x04]
       END

skip   
       STR     R8, [R4]
       END
```

### 3. Perform the following Multiplication and Division by 2 operations by writing a program in ARM Assembly Language:

1. The Operand (assume the operand is one decimal bit, less than or equal to 810 ) is stored in memory location 5000H
2. Perform a Multiplication by 2 by performing a logical shift to the left and store the result in memory location 5004H.
3. Perform a Division by 2 by performing a logical shift to the right and store the result in memory location 5008H.

```assembly
       MOV     R0, #0x5000
       MOV     R1, #8
       STR     R1, [R0]

       LDR     R2, [R0]
       LSL     R4, R2, #1
       STR     R4, [R0, #0x04]

       LSR     R3, R2, #1
       STR     R3, [R0, #0x08]
       END
```

### 6. 

| Memory Address | Data |
|----------------|------|
| 10             | 20   |
| 20             | 30   |
| 30             | 40   |
| 40             | 50   |

Given the above memory values and a one-address machine with an accumulator, what values do the following instructions load into the accumulator?

#### i. LOAD IMMEDIATE 30
```assembly
MOV R0, #0x30
```
30

#### ii. LOAD DIRECT 30
```assembly
MOV R0, #0x30
LDR R1, [R0]
```
40

#### iii. LOAD INDIRECT 30
```assembly
MOV R0, #0x30
LDR R1, [R0]
LDR R2, [R0]
```
50

#### iv. LOAD IMMEDIATE 10
```assembly
MOV R0, #0x10
```
10

#### v. LOAD DIRECT 40
```assembly
MOV R0, #0x40
LDR R1, [R0]
```
50

#### vi. LOAD INDIRECT 10
```assembly
MOV R0, #0x10
LDR R1, [R0]
LDR R2, [R0]
```
30
