## Branch Instructions
Branching shifts program execution to a different address by updating the Program Counter (PC).

- **Branch (`B <label>`):** Performs a PC-relative jump to a specific instruction label. It has a range of $\pm32$ Megabytes.
- **Branch with Link (`BL <subroutine>`):** Used to call functions/subroutines. When `BL` is executed, it automatically performs two actions:
    1. It copies the updated Program Counter value (the return address) into **R14 (the Link Register / LR)**.
    2. It jumps to the subroutine address.
- **Returning from Subroutines:** To exit a subroutine and return to the main program, the value inside `LR` is copied back into the `PC` using a data movement instruction: `MOV pc, lr`.
    * For nested subroutines, the `LR` must be pushed onto the stack (`STMFD sp!, {regs, lr}`) so it isn't overwritten, and then restored at the end (`LDMFD sp!, {regs, pc}`).

## Conditional Branching and Loops
Branch instructions can be postfixed with **Condition Codes** (e.g., `EQ`, `NE`, `GT`) to dictate whether the jump should actually occur based on the processor's current status flags.

- **Setting Flags:** Status flags are set either automatically by comparison instructions like `CMP` (which performs a subtraction to check relationships) or by appending an `S` to data processing instructions (such as `SUBS`).

```assembly
loop
    ...
    SUBS r1, r1, #1   ; Decrement loop counter r1 and set flags
    BNE loop          ; If Z (Zero) flag is clear (r1 != 0), branch back to loop
```

## Condition Codes
`B{condition} LOCATION` branches to `LOCATION` if the settings of the condition code flags satisfy {condition}

| Suffix | Description | Flags tested |
| :--- | :--- | :--- |
| **EQ** | Equal | **Z=1** |
| **NE** | Not equal | **Z=0** |
| **CS/HS** | Unsigned higher or same | **C=1** |
| **CC/LO** | Unsigned lower | **C=0** |
| **MI** | Minus | **N=1** |
| **PL** | Positive or Zero | **N=0** |
| **VS** | Overflow | **V=1** |
| **VC** | No overflow | **V=0** |
| **HI** | Unsigned higher | **C=1 & Z=0** |
| **LS** | Unsigned lower or same | **C=0 or Z=1** |
| **GE** | Greater or equal | **N=V** |
| **LT** | Less than | **N!=V** |
| **GT** | Greater than | **Z=0 & N=V** |
| **LE** | Less than or equal | **Z=1 or N=!V** |
| **AL** | Always | |

## Conditional Execution (Eliminating Branches)
A unique aspect of flow control highlighted in the ARM slides is that **nearly every ARM instruction can be executed conditionally**. By adding a condition code postfix directly to regular instructions (like `MOVEQ` or `ADDNE`), you can execute logic conditionally *without* writing an explicit branch instruction.

This optimization vastly improves code density and hardware performance because it avoids flushing the processor's multi-stage execution pipeline.

### Standard Branching Method:

```assembly
CMP r3, #0
BEQ skip        ; Branch forward if r3 == 0
ADD r0, r1, r2  ; Skipped if r3 == 0
skip
```

### Optimized Conditional Execution Method:

```assembly
CMP r3, #0
ADDNE r0, r1, r2 ; Executes ADD ONLY if r3 is NOT Equal to 0
```
