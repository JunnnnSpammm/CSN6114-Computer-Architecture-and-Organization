## Lab B-06: Programming Exercise 4

### 1. Perform the following operations by writing programs using ARM instructions.
> 34,25,15,23,45,64,56,23

#### a. Sort the numbers above in ascending order using bubble sort. (Reference: http://en.wikipedia.org/wiki/Bubble_sort)

```assembly
        LDR     R0, =NUMBERS          ; R0 = address of array
        MOV     R1, #8                ; R1 = number of elements
        SUB     R2, R1, #1            ; R2 = outer loop count = n-1

outer   
        MOV     R3, #0                ; R3 = index j
        MOV     R4, R2                ; R4 = inner loop counter

inner   
        LDR     R5, [R0, R3, LSL #2]  ; R5 = NUMBERS[j]

        ADD     R6, R3, #1
        LDR     R7, [R0, R6, LSL #2]  ; R7 = NUMBERS[j+1]

        CMP     R5, R7
        BLE     noswap                ; If R5 < R7, skip swap

        STR     R7, [R0, R3, LSL #2]  ; NUMBERS[j] = smaller value
        STR     R5, [R0, R6, LSL #2]  ; NUMBERS[j+1] = larger value

noswap  
        ADD     R3, R3, #1            ; j++
        SUBS    R4, R4, #1
        BNE     inner

        SUBS    R2, R2, #1
        BNE     outer

        END

NUMBERS DCD     34, 25, 15, 23, 45, 64, 56, 23
```

#### b. Sort the numbers above in descending order. (Hint: Modify the subroutine in part [a] by checking the flag values after the compare operation)

```assembly
        LDR     R0, =NUMBERS          ; R0 = address of array
        MOV     R1, #8                ; R1 = number of elements
        SUB     R2, R1, #1            ; R2 = outer loop count = n-1

outer   
        MOV     R3, #0                ; R3 = index j
        MOV     R4, R2                ; R4 = inner loop counter

inner   
        LDR     R5, [R0, R3, LSL #2]  ; R5 = NUMBERS[j]

        ADD     R6, R3, #1
        LDR     R7, [R0, R6, LSL #2]  ; R7 = NUMBERS[j+1]

        CMP     R5, R7
        BGE     noswap                ; If R5 > R7, skip swap

        STR     R7, [R0, R3, LSL #2]  ; NUMBERS[j] = larger value
        STR     R5, [R0, R6, LSL #2]  ; NUMBERS[j+1] = smaller value

noswap  
        ADD     R3, R3, #1            ; j++
        SUBS    R4, R4, #1
        BNE     inner

        SUBS    R2, R2, #1
        BNE     outer

        END

NUMBERS DCD     34, 25, 15, 23, 45, 64, 56, 23
```

### 2. Assume there is a five-stages instruction pipeline - Fetch (F), Decode (D), Fetch Operand (FO), Execute (E) and Write (W) running in a microprocessor. Assume that each stage requires one-time unit and no branch instruction is involved.

#### i. By using formula, how many time units are needed to complete these FOUR instructions with pipelining?
$$T_{k, n} = [5+4-1]\tau = 8\tau$$

#### ii. By using formula, calculate the total time required to execute FOUR instructions without pipelining.
$$T_{1, n} = 5(4)\tau = 20\tau$$

#### iii. Calculate the speedup factor for the same number of instructions.
$$S = \frac{20\tau}{8\tau} = 2.5$$

### 3. Write a program to evaluate the arithmetic expression A = [(B+C) - D)] / E, using one address instructions, two address instructions and three address instructions. The instructions available for use are as follows:
| One address | Two address | Three address |
| --- | --- | --- |
| LOAD X | MOVE X ,Y |  |
| STORE X | ADD X, Y | ADD X,Y,Z |
| ADD X | SUB X, Y | SUB X,Y,Z |
| SUB X | MUL X ,Y | MUL X,Y, Z |
| MUL X | DIV X, Y | DIV X, Y, Z |
| DIV X |  |  |

#### Three address

```assembly
        ADD   A, B, C   ; A <- B + C
        SUB   A, A, D   ; A <- B + C - D
        DIB   A, A, E   ; A <- [B + C - D] / E
```

#### Two address

```assembly
        MOVE  A, B     ; A <- B
        ADD   A, C     ; A <- B + C
        SUB   A, D     ; A <- B + C - D
        DIV   A, E     ; A <- [B + C - D] / E
```

#### One address

```assembly
        LOAD   B    ; AC <- B
        ADD    C    ; AC <- AC(B) + C
        SUB    D    ; AC <- AC(B + C) - D
        DIV    E    ; AC <- AC(B + C - D) / E
        STORE  A    ; A <- AC
```

### 4. Suppose an 8-bit data word stored in memory is 1111 1000. Using the Hamming algorithm, determine what is the value of the four check bits (Check bit 8, Check bit 4, Check bit 2 and Check bit 1) that would be stored in memory with the data word. Show how you got your answer.

|   Bit position  |  12  |  11  |  10  |   9  |   8  |   7  |   6  |   5  |   4  |   3  |   2  |   1   |
|:---------------:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:-----:|
| Position number | 1100 | 1011 | 1010 | 1001 | 1000 | 0111 | 0110 | 0101 | 0100 | 0011 | 0010 | 00101 |
|     Data bit    |  D8  |  D7  |  D6  |  D5  |      |  D4  |  D3  |  D2  |      |  D1  |      |       |
|    Check bit    |      |      |      |      |  C8  |      |      |      |  C4  |      |  C2  |   C1  |
|       Word      |   1  |   1  |   1  |   1  |   0  |   1  |   0  |   0  |   0  |   0  |   1  |   1   |

$$C8 = D8 \oplus D7 \oplus D6 \oplus D5 = 0$$
$$C4 = D8 \oplus D4 \oplus D3 \oplus D2 = 0$$
$$C2 = D7 \oplus D6 \oplus D4 \oplus D3 \oplus D1 = 1$$
$$C1 = D7 \oplus D5 \oplus D4 \oplus D2 \oplus D1 = 1$$

**Check bit =** $0011_2$
