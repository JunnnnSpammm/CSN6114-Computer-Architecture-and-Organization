## Lab B-05: Programming Exercise 3

### 1. Write ARM instructions to store the following block of data (32 bit words) in memory locations starting from 0x6000 to 0x6014. Subsequently, copy the data to the locations 0x7000 to 0x7014.
**Data (H):** 0x01, 0x02, 0x03, 0x04, 0x05, 0x06

```assembly
       MOV     R1, #0x6000      ; Initialize source address.
       MOV     R2, #0x6000
       MOV     R3, #0x7000      ; Initialize destination address.
       MOV     R4, #06H         ; Initialize counter.
       MOV     R6, #06H
       MOV     R0, #0x01

insert 
       STR     R0, [R1], #4
       ADD     R0, R0, #0x01

       SUB     R6, R6, #0x01

       CMP     R6, #0x00
       BNE     insert

loop   
       LDR     R5, [R2], #4     ; Load data into R5 and set pointer to next source data.
       STR     R5, [R3], #4     ; Store data in R5 to [R3] and set pointer to next destination.

       SUB     R4, R4, #0x01    ; Decrement counter.

       CMP     R4, #0x00        ; Check zero (any data left)?
       BNE     loop
```

### 2. Modify Question 1 to transfer the data to the locations 0x7000 to 0x7014 in the reverse order.
(E.g. the data byte 06H at location 0x6014 should be stored at location 0x7000.)

```assembly
       MOV     R1, #0x6000
       MOV     R2, #0x6000
       LDR     R3, =0x7014
       MOV     R4, #06H
       MOV     R6, #06H
       MOV     R0, #0x01

insert 
       STR     R0, [R1], #4
       ADD     R0, R0, #0x01

       SUB     R6, R6, #0x01

       CMP     R6, #0x00
       BNE     insert

loop   
       LDR     R5, [R2], #4
       STR     R5, [R3]
       SUB     R3, R3, #4

       SUB     R4, R4, #0x01

       CMP     R4, #0x00
       BNE     loop
```

### 3. A bus that connects major computer components (processor, memory, I/O) is called a system bus.

#### i. Define the function of the system bus.
The system bus acts as the central communication highway in a computer, linking the CPU, main memory (RAM), and peripheral devices.

#### ii. List and describe the THREE major modules of the system bus.
* **Data Bus:** Transfers the actual information (data) between the CPU, memory, and I/O devices bidirectionally.
* **Address Bus:** Carries the physical memory addresses to specify where the data needs to be read from or written to. It is transfer away from CPU.
* **Control Bus:** Transmits timing and command signals to coordinate operations and ensure that devices do not conflict with one another.

### 4. Assume a three-stage pipeline (fetch, execute and write). Draw a timing diagram to show how many units are needed for three instructions.
| Timing        | 1     | 2       | 3       | 4       | 5     |
|---------------|-------|---------|---------|---------|-------|
| Instruction 1 | Fetch | Execute | Write   |         |       |
| Instruction 2 |       | Fetch   | Execute | Write   |       |
| Instruction 3 |       |         | Fetch   | Execute | Write |

### 5. Assume that a processor employs a memory address register (MAR), a memory buffer register (MBR), a program counter (PC), and an instruction register (IR). List the sequence of events of the instruction cycle (fetch cycle.)
1. **Move the address to the MAR:** The address of the next instruction to be executed is copied from the Program Counter (PC) into the Memory Address Register (MAR).
2. **Fetch the instruction from memory:** The control unit issues a memory read command. The memory hardware looks at the address stored in the MAR, retrieves the instruction from that location, and places it into the Memory Buffer Register (MBR).
3. Simultaneously, The PC is incremented to point to the next sequential instruction address.
4. **Transfer the instruction to the IR:** The instruction currently held in the MBR is moved into the Instruction Register (IR). This frees up the MBR for any subsequent data transfers during the upcoming decode/execute cycles.S

### 6. List and describe the SIX status flags of an Intel 8086 microprocessor.
1. **Carry Flag (CF):** Indicates an overflow condition for unsigned integer arithmetic.
2. **Parity Flag (PF):** Used for data error checking (parity check).
3. **Auxiliary Carry Flag (AF):** Used for Binary Coded Decimal (BCD) arithmetic operations.
4. **Zero Flag (ZF):** Indicates whether the result of an operation is zero.
5. **Sign Flag (SF):** Indicates the sign of the result in **signed** arithmetic.
6. **Overflow Flag (OF):** Indicates an overflow condition for **signed** integer arithmetic.

### 7. Assume there is a four-stage instruction pipeline - Fetch (F), Decode (D), Execute (E) and Write (W) running in a microprocessor. Assume that each stage requires one time unit and no branch instruction is involved.

#### i. Based on the answer in (i), how many time units are needed to complete these Six instructions with pipelining?
$$T_{k, n} = [4+6-1]\tau = 9\tau$$

#### ii. By using formula, calculate the total time required to execute SIX instructions without pipelining.
$$T_{1, n} = 4(6)\tau = 24\tau$$

#### iii. Calculate the speedup factor for the same number of instructions.
$$S = \frac{24\tau}{9\tau} = \frac{8}{3} \approx 2.67$$
