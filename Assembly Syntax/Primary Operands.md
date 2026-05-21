## Single-Cycle Instruction Pipeline
How independent sequential instructions move through a three-stage pipeline (Fetch, Decode, Execute).

```assembly
ADD r0, r1, #5      ; r0 = r1 + 5
                    ; Adds the immediate value 5 to the contents of register r1 
                    ; and saves the result into destination register r0.

SUB r2, r3, r6      ; r2 = r3 - r6
                    ; Subtracts the contents of register r6 from register r3
                    ; and saves the result into destination register r2.

CMP r2, #3          ; r2 - 3
                    ; Compares the value in r2 with the immediate value 3 by
                    ; subtracting 3 from r2. This updates the CPSR flags 
                    ; (such as Zero, Negative) but does not store the arithmetic result.
```

## Breaking Down a C Statement
How a complex high-level multi-operand expression in C (`a = b + c + d - e;`) must be broken down into rigid, 3-address assembly instructions.

**Assumed variable mapping:** * `r0` = `a`, `r1` = `b`, `r2` = `c`, `r3` = `d`, `r4` = `e`.

```assembly
ADD r0, r1, r2      ; r0 = r1 + r2  (Intermediate: a = b + c)
                    ; Adds the values of b (r1) and c (r2), storing it in a (r0).

ADD r0, r0, r3      ; r0 = r0 + r3  (Intermediate: a = a + d)
                    ; Adds the value of d (r3) to the accumulated sum in a (r0).

SUB r0, r0, r4      ; r0 = r0 - r4  (Final: a = a - e)
                    ; Subtracts the value of e (r4) from the accumulated sum in a (r0).
```

## Move Operand
Copies a value directly into a destination register

```assembly
MOV r1, #0          ; Loads the immediate integer constant 0 into register r1
MOV r0, #1          ; Loads the immediate integer constant 1 into register r0
```

## Arithmetic Operand
Appending an `S` to an instruction explicitly commands the processor to update the condition code flags (such as `Zero`, `Negative`, `Carry`, or `Overflow`) in the Current Program Status Register (CPSR) based on the operation's output.

```assembly
ADD R0, R2, R4      ; Performs: R0 = R2 + R4
                    ; Adds the value of R2 and R4, then stores it in R0.
                    ; The CPSR condition flags remain unchanged.

ADDS R0, R1, #1     ; Performs: R0 = R1 + 1
                    ; Adds 1 to R1 and stores the result in R0.
                    ; Updates flags (e.g., if R0 becomes 0, the Z flag is set to 1).

SUB R0, R3, #17     ; Performs: R0 = R3 - 17
                    ; Subtracts the immediate value 17 from R3 and stores it in R0.
                    ; CPSR flags are not updated.

SUBS R1, R1, #1     ; Decrements R1 by 1 AND sets the condition flags.
```

## Bit-Complement Movement (`MVN`)
Demonstrates data movement using the Move Negative (`MVN`) instruction.

```assembly
MVN Rd, Rm          ; Rd = ~Rm
                    ; Performs a bitwise NOT (complement) on the contents of Rm 
                    ; and places the inverted result into destination register Rd.

MVN Rd, #value      ; Rd = ~value
                    ; Performs a bitwise NOT on the immediate value 
                    ; and stores the result into destination register Rd.
```

## Inline Barrel Shifter Operation
Demonstrates shift or rotate operation to be embedded into a register data-processing instruction.

```assembly
MOV Ri, Rj, LSL #4  ; Ri = Rj << 4
                    ; Logically shifts the value in register Rj to the left by 4 bits
                    ; (effectively multiplying it by 16) using the Barrel Shifter, 
                    ; and stores the shifted outcome into register Ri.
```

## Shifted Operands
Shows data processing variations combining arithmetic and barrel shifting.

```assembly
ADD R0, R2, R4      ; R0 = R2 + R4
                    ; Performs R0 <- [R2] + [R4]. Adds contents of R2 
                    ; and R4 together without shifting, saving the result into R0.

SUB R0, R3, #17     ; R0 = R3 - 17
                    ; Performs R0 <- [R3] - 17[. Subtracts the unsigned 
                    ; immediate value 17 from R3 and stores the result in R0.

ADD R0, R1, R5, LSL #4  ; R0 = R1 + (R5 << 4)
                        ; First, the Barrel Shifter shifts the contents of register R5 
                        ; left by 4 bit positions (multiplying R5 by 16).
                        ; Then, it adds that shifted result to R1 and saves it into R0.
```