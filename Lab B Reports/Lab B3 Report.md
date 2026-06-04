## Lab B-03: Programming Exercise 1
The following questions are to be completed in the Lab, and included in the report.

### 1. Specify the register contents and the status bits as the following instructions are executed.
```assembly
EOR     R0, R0, R0
MOV     R1, #0xFFFFFFFF
MOV     R2, #0x00000066
ADDS    R1, R1, #0x01
SUBS    R0, R0, #0x01
ADD     R0, R0, R1
SUBS    R0, R0, #0x86
ORRS    R0, R0, R2
END
```
Verify your results by executing the above instruction in the simulator in step forward mode and examining various registers after each step.

| Instruction           | Description                                                                        | Changes in register                                       |
|-----------------------|------------------------------------------------------------------------------------|-----------------------------------------------------------|
| `EOR R0, R0, R0`      | Do bitwise XOR operation on R0, clear R0 to `0x00000000`                           | R0 = `0x00000000`                                         |
| `MOV R1, #0xFFFFFFFF` | Set R1 to `0xFFFFFFFF`                                                             | R1 = `0xFFFFFFFF`                                         |
| `MOV R2, #0x00000066` | Set R2 to `0x00000066`                                                             | R2 = `0x66`                                               |
| `ADDS R1, R1, #0x01`  | R1 = R1 + 1, and update the flags                                                  | R1 = `0x0`; NF = `0`; ZF = `1`; CF = `1`; VF = `0`        |
| `SUBS R0, R0, #0x01`  | R0 = R0 - 1, and update the flags                                                  | R0 = `0xFFFFFFFF`; NF = `1`; ZF = `0`; CF = `0`; VF = `0` |
| `ADD R0, R0, R1`      | R0 = R0 + R1                                                                       | No changes                                                |
| `SUBS R0, R0, #0x86`  | R0 = R0 - 86, and update the flags                                                 | R0 = `0xFFFFFF79`; NF = `1`; ZF = `0`; CF = `1`; VF = `0` |
| `ORRS R0, R0, R2`     | Do bitwise OR operation between R0 and R2, show output in R0, and update the flags | R0 = `0xFFFFFF7F`; NF = `1`; ZF = `0`;                    |
| `END`                 | Mark the end of the code                                                           | No changes                                                |

### 2. Write ARM instructions to do the following:
1. Load the number 30H in R1 and 39H in R2
2. Subtract 39H from 30H using R1 and R2 (30H – 39H)
3. Store the result in memory address 7500H

```assembly
MOV     R1, #0x30
MOV     R2, #0x39
SUBS    R0, R1, R2
MOV     R3, #0x7500
STR     R0, [R3]
END
```

| Instruction       | Description                                           | Changes in register                                       |
|-------------------|-------------------------------------------------------|-----------------------------------------------------------|
| `MOV R1, #0x30`   | Set R1 to `0x30`                                      | R1 = `0x30`                                               |
| `MOV R2, #0x39`   | Set R2 to `0x39`                                      | R2 = `0x39`                                               |
| `SUBS R0, R1, R2` | R0 = R1 - R2, and update the flags                    | R0 = `0xFFFFFFF7`; NF = `1`; ZF = `0`; CF = `0`; VF = `0` |
| `MOV R3, #0x7500` | Set R3 to `0x7500`                                    | R3 = `0x7500`                                             |
| `STR R0, [R3]`    | Store R0 into the address pointed to by R3 (`0x7500`) | Memory address `0x7500` = `0xFFFFFFF7`                    |
| `END`             | Mark the end of the code                              | No changes                                                |

### 3. Write instructions to
1. Clear R0,
2. Load the data bytes 8EH in R10 and F7H in R12.
3. Obtain only the low order 4 bits from both data bytes (Hint: logical mask)
4. Exclusive OR the masked bytes
5. Store the result in a memory location

Verify your theoretical result by executing the program in step forward mode.

```assembly
EOR     R0, R0, R0
MOV     R10, #0x8E
MOV     R12, #0xF7
AND     R10, R10, #0b1111
AND     R12, R12, #0b1111
EOR     R0, R10, R12
MOV     R1, #0x1000
STR     R0, [R1]
END
```

| Instruction             | Description                                                                                 |
|-------------------------|---------------------------------------------------------------------------------------------|
| `EOR R0, R0, R0`        | Do bitwise XOR operation on R0, clear R0 to `0x00000000`                                    |
| `MOV R10, #0x8E`        | Set R10 to `0x8E`                                                                           |
| `MOV R12, #0xF7`        | Set R10 to `0xF7`                                                                           |
| `AND R10, R10, #0b1111` | Do bitwise OR operation between R10 and `0b1111`, obtain only the low order 4 bits from R10 |
| `AND R12, R12, #0b1111` | Do bitwise OR operation between R12 and `0b1111`, obtain only the low order 4 bits from R12 |
| `EOR R0, R10, R12`      | Do bitwise XOR operation between R10 and R12, show output in R0                             |
| `MOV R1, #0x1000`       | Set R1 to `0x1000`                                                                          |
| `STR R0, [R1]`          | Store R0 into the address pointed to by R1 (`0x1000`)                                       |
| `END`                   | Mark the end of the code                                                                    |

| Registers               | Final Output |
|-------------------------|--------------|
| R0                      | 0x9          |
| R1                      | 0x1000       |
| R10                     | 0xE          |
| R12                     | 0x7          |
| Memory address `0x1000` | 0x9          |

### 4. To conserves energy and to avoid an electrical overload on a hot afternoon, implement the following procedures to control the appliances through the house. Assume that the control switches are located in the kitchen and they are available to anyone in the house. Write ARM instructions to do the following:
1. Turn on the air conditioner if switch S7 of the input port 00H is on.
2. Ignore all other switches of the input port even if someone attempt to turn on other appliances.
3. Simulate the output at memory location 7500H

```assembly
MOV     R0, #0b1110111
MOV     R10, #0b10000001
AND     R1, R0, R10
MOV     R2, #0x7500
STR     R1, [R2]
END
```

| Instruction            | Description                                                                                 |
|------------------------|---------------------------------------------------------------------------------------------|
| `MOV R0, #0b1110111`   | Set R0 to `0b1110111`                                                                       |
| `MOV R10, #0b10000001` | Set R10 to `0b10000001`                                                                     |
| `AND R1, R0, R10`      | Do bitwise OR operation between R0 and R10, store it in R1, obtain only the 1st and 7th bit |
| `MOV R2, #0x7500`      | Set R2 to `0x7500`                                                                          |
| `STR R1, [R2]`         | Store R1 into the address pointed to by R2 (`0x7500`)                                       |
| `END`                  | Mark the end of the code                                                                    |

| Registers               | Final Output |
|-------------------------|--------------|
| R0                      | 0x77         |
| R1                      | 0x1          |
| R2                      | 0x7500       |
| R10                     | 0x81         |
| Memory address `0x7500` | 0x1          |

### 5. Given the following register and memory values, what values do the following ARM instructions load into R0? Assume instructions are not related.
* Address `1040` contains `0x40`
* Address `2040` contains `0x50`
* R0 contains `0x0020`
* R1 contains `0x0040`
* R2 contains `0x1000`
* R3 contains `0x0020`
* R4 contains `0x2000`

1. `MOV R0, #0x20`
2. `ADD R0, R1, R3`
3. `MOV R0, R2`
4. `LDR R0, [R2, #0x40]`
5. `STR R0, [R2]`
6. `LDR R0, [R4, R1]`

| Instruction           | Description                                           | Ouput                                             |
|-----------------------|-------------------------------------------------------|---------------------------------------------------|
| `MOV R0, #0x20`       | Set R0 to `0x20`                                      | R0 = `0x0020`                                     |
| `ADD R0, R1, R3`      | R0 = R1 + R3                                          | R0 = `0x0060`                                     |
| `MOV R0, R2`          | Set R0 to R2 (`0x1000`)                               | R0 = `0x1000`                                     |
| `LDR R0, [R2, #0x40]` | Load R2 + `0x40` (`0x1040`) into R0                   | R0 = `0x0040`                                     |
| `STR R0, [R2]`        | Store R0 into the address pointed to by R2 (`0x1000`) | R0 = `0x0020`, memory address `0x1000` = `0x0020` |
| `LDR R0, [R4, R1]`    | Load R4 + R1 (`0x2040`) into R0                       | R0 = `0x50`                                       |

### 6. Specify the flag status if the following ARM instructions are executed:
```assembly
EORS    R0, R0, R0
SUB     R0, R0, #0x01
MOV     R1, #0xFFH
ADDS    R1, R1, #0x01
```

| Instruction          | Description                                              | Ouput                                  |
|----------------------|----------------------------------------------------------|----------------------------------------|
| `EORS R0, R0, R0`    | Do bitwise XOR operation on R0, clear R0 to `0x00000000` | NF = `0`; ZF = `1`; CF = `0`; VF = `0` |
| `SUB R0, R0, #0x01`  | R0 = R0 - 1                                              | NF = `0`; ZF = `1`; CF = `0`; VF = `0` |
| `MOV R1, #0xFFH`     | Set R1 to `#0xFFH`                                       | NF = `0`; ZF = `1`; CF = `0`; VF = `0` |
| `ADDS R1, R1, #0x01` | R1 = R1 + 1, and update the flags                        | NF = `0`; ZF = `0`; CF = `0`; VF = `0` |
