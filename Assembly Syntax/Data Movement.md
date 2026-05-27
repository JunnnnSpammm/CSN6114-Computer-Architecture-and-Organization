## Single Register Data Transfer

| Instruction Prefix | Operation    | Data Size         | Description                                                                                                         |
|--------------------|--------------|-------------------|---------------------------------------------------------------------------------------------------------------------|
| `LDR` / `STR`      | Load / Store | Word (32-bit)     | Moves a full 32-bit word between a register and memory.                                                             |
| `LDRB` / `STRB`    | Load / Store | Byte (8-bit)      | Moves just a single byte. LDRB clears the upper 24 bits of the destination register to zero.                        |
| `LDRH` / `STRH`    | Load / Store | Halfword (16-bit) | Moves a 16-bit halfword. LDRH clears the upper 16 bits of the destination register to zero.                         |
| `LDRSB`            | Load Signed  | Byte (8-bit)      | Loads a byte and sign-extends it across the remaining 24 bits of the 32-bit register (preserving negative numbers). |
| `LDRSH`            | Load Signed  | Halfword (16-bit) | Loads a halfword and sign-extends it across the remaining 16 bits of the 32-bit register.                           |

## Load Register `LDR`
`LDR Destination_Register, [Base_Address_Register]`, load data from address into register

```assembly
LDR r0, [r1, #8]          ; Address = value in r1 + 8
                          ; Loads the data at that address into r0

LDR r0, [r1, r2]          ; Address = value of r1 + r2
LDR r0, [r1, r2, LSL#2]   ; Address = value of r1 + (r2 * 4) [Since shifting left by 2 is multiplying by 4]

LDR r0, [r1, #-8]         ; Address = value in r1 - 8
LDR r0, [r1, -r2]         ; Address = value of r1 - r2
LDR r0, [r1, -r2, LSL#2]  ; Address = value of r1 - (r2 * 4)
```

## Load Register `LDR`
`STR Destination_Register, [Base_Address_Register]`, store data from register into address

```assembly
STR r0, [r1, #8]          ; Address = value in r1 + 8
                          ; Store the data in r0 into the address

LDR r0, [r1, r2]          ; Address = value of r1 + r2
LDR r0, [r1, r2, LSL#2]   ; Address = value of r1 + (r2 * 4) [Since shifting left by 2 is multiplying by 4]

LDR r0, [r1, #-8]         ; Address = value in r1 - 8
LDR r0, [r1, -r2]         ; Address = value of r1 - r2
LDR r0, [r1, -r2, LSL#2]  ; Address = value of r1 - (r2 * 4)
```

## Index Method

| Addressing Mode | Syntax      | What it does                                                                                                |
|-----------------|-------------|-------------------------------------------------------------------------------------------------------------|
| Pre-Indexed     | `[r1, #4]`  | Uses r1 + 4 to look up memory. r1 does not change.                                                          |
| Auto-Indexed    | `[r1, #4]!` | Adds 4 to r1 first, looks up that new address, and saves the new address back into r1 (indicated by the !). |
| Post-Indexed    | `[r1], #4`  | Looks up the address exactly as it is currently in r1, and then adds 4 to r1 afterward.                     |

## PC-relative Addressing
Define what `ITEM` is.

```assembly
        .data          ; Tells the assembler this is the data section
ITEM:   .word 0x42     ; Defines ITEM as a 4-byte word containing the value 42

        .text          ; Tells the assembler this is the code section
        .global _start
_start:
        LDR R1, ITEM   ; The assembler calculates the offset to where ITEM is
```

The programmer wants to fetch whatever value is stored at the label `ITEM` and put it into register `R1`.

- If a instruction `LDR R1, ITEM` is located at adresss 1000. The Program Counter (PC) will point to 1008 due to ARM's hardware pipeline (Fetch, Decode, Execute)
- The processor calculate the offset from PC to `ITEM` and convert the code to `LDR R1, [PC, {Offset}]`
- For example: if `ITEM` is in 1060, then the code will be converted to `LDR R1, [PC, #52]`

## LDM / STM Operation: Block Transfer
`LDM` is used to load multiple data into multiple register. `STM` is used to sotre multiple data from multiple register.  

```assembly
STMIA r2!, {r0, r1, r4}   ; Store r0 in the address which is value of r2
                          ; Then increment 4 to store r1, and increment again to store r4
                          ; Since r2 is marked with !, update r2 to the address after r4, which is r2 + 12

LDMIB r2!, {r0, r1, r4}   ; Increment r2 with 4 first, then load r0 in the address which is the current value of r2
                          ; Then increment 4 to load r1, and increment again to load r4
                          ; Since r2 is marked with !, update r2 to the address of the last block access, which is r2 + 12

STMDB r2!, {r0, r1, r4}   ; Decrement r2 with 4 first, then store r0 in the address which is value of r2
                          ; Then decrement 4 to store r1, and decrement again to store r4
                          ; Since r2 is marked with !, update r2 to the address after r4, which is r2 - 12
```
