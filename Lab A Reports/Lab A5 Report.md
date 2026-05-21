# Lab A5 - Report

## 1. Design a 3 input priority encoder circuit. The inputs are a3a2a1, with a3 having the lowest priority and a1 the highest. The outputs are y2y1, indicating the encoded highest-priority active input, and v, the valid output which indicates that at least one input is active. (Note: Priority input a3 is encoded as 11, a2 as 10 and a1 as 01). Perform the following:

### i. Construct the truth table.

| A3 | A2 | A1 | Y2 | Y1 | V |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 0 | 0 | 0 | X | X | 0 |
| 1 | 0 | 0 | 1 | 1 | 1 |
| X | 1 | 0 | 1 | 0 | 1 |
| X | X | 1 | 0 | 1 | 1 |

### ii. Simplify the Boolean expressions for y2, y1 , and v using Karnaugh map techniques.

<img width="718" height="489" alt="Screenshot 2026-05-02 at 9 49 19 PM" src="https://github.com/user-attachments/assets/ef8de1d5-a22e-48f0-8a4f-c5fd19dd2a22" />

### iii. Draw the logic diagram with necessary basic logic gates.

```mermaid
graph LR
    A1((A1)) --- OR1
    A2((A2)) --- OR1
    A3((A3)) --- OR1
    OR1{OR} --> V([V])

    A1 --- NOT1
    NOT1[NOT] --> Y2([Y2])

    A1 --- OR2
    A2 --- NOT2[NOT]
    NOT2 --- OR2{OR} --> Y1([Y1])
```

## 2. Design and construct a 3 to 8 decoder circuit using 2-line-to-4-line decoder and also other logic gates needed. Perform the following:

### i. Form the truth table for higher order decoder (3 to 8 decoder)

| E | A | B | D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |

### ii. Design higher order decoder using the given lower order decoder.

| E | A | B | D1-0 | D1-1 | D1-2 | D1-3 | D2-0 | D2-1 | D2-2 | D2-3 |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |

### iii. Draw the logic diagram for higher order decoder using two lower order decoders

```mermaid
graph TD
    E((E)) --- NOT_E[NOT]
    NOT_E --- DEC1[2x4 Decoder 1]
    E --- DEC2[2x4 Decoder 2]
    
    A((A)) --- DEC1
    A --- DEC2
    B((B)) --- DEC1
    B --- DEC2

    DEC1 --- D0([D0])
    DEC1 --- D1([D1])
    DEC1 --- D2([D2])
    DEC1 --- D3([D3])
    
    DEC2 --- D4([D4])
    DEC2 --- D5([D5])
    DEC2 --- D6([D6])
    DEC2 --- D7([D7])
```

## 3. Design a full subtractor circuit using

### i. Two half subtractors.

|   A   |   B   |   Bout   |   D   |
|-------|-------|----------|-------|
|   0   |   0   |   0      |   0   |
|   0   |   1   |   1      |   1   |
|   1   |   0   |   0      |   1   |
|     1 |   1   |   0      |     0 |

**D =** A ⊕ B

**Bout =** A’B

```mermaid
graph LR
    A --- NodeA(( ))
    B --- NodeB(( ))

    NodeA --> XOR{{"XOR"}}
    NodeB --> XOR
    XOR --> D

    %% Borrow Path
    NodeA --> NOT["NOT"]
    NOT --> AND["AND"]
    NodeB --> AND
    AND --> Bout
```

|   A   |   B   |   C   |   Bout   |   D   |
|-------|-------|-------|----------|-------|
|   0   |   0   |   0   |   0      |   0   |
|   0   |   0   |   1   |   1      |   1   |
|   0   |   1   |   0   |   1      |   1   |
|   0   |   1   |   1   |   1      |   0   |
|   1   |   0   |   0   |   0      |   1   |
|   1   |   0   |   1   |   0      |   0   |
|   1   |   1   |   0   |   0      |   0   |
|   1   |     1 | 1     |   1      |     1 |

**D =** A’B’C + A’BC’ + AB’C' + ABC = C(A’B'+AB) + C’(A’B+AB’) = C(AB’+A’B)' + C’(A’B+AB’) = C ⊕ A ⊕ B

**Bout =** A’B’C + A’BC’ + A’BC + ABC = C(A’B’ + AB) + A’B(C + C’) = C(A ⊕ B)’ + A’B

```mermaid
graph LR
    subgraph HS1 [Half Subtractor 1]
        direction LR
        A1[A]
        B1[B]
        D1[D]
        Bout1[Bout]
    end

    subgraph HS2 [Half Subtractor 2]
        direction LR
        A2[A]
        B2[B]
        D2[D]
        Bout2[Bout]
    end

    A --> A1
    B --> B1
    C --> B2

    D1 --> A2
    D2 --> OutD

    Bout1 --> OR((OR))
    Bout2 --> OR
    OR --> OutBout
```

### ii. Using only NAND gates.

**D =** [A’B’C + A’BC’ + AB’C' + ABC]’’ = [(A’B’C)’(A’BC’)’(AB’C’)’(ABC)’]’

**Bout =** [A’B’C + A’BC’ + A’BC + ABC]’’ = [(A’B’C)’(A’BC’)’(A’BC)’(ABC)’]’

```mermaid
graph LR
    subgraph Inputs
        A
        B
        C
    end

    subgraph Inverters
        notA{{"NAND (NOT A)"}}
        notB{{"NAND (NOT B)"}}
        notC{{"NAND (NOT C)"}}
    end

    subgraph Intermediate_Logic
        L1{{"NAND Layer"}}
        L2{{"NAND Layer"}}
    end

    A --> notA
    B --> notB
    C --> notC

    A & B & C & notA & notB & notC --> L1
    L1 --> L2
    
    L2 --> D
    L2 --> Bout
```

### iii. Using only NOR gates.

**D =** [(A+B+C)(A+B’+C’)(A’+B+C’)(A’+B’+C)]’’ = [(A+B+C)’ + (A+B’+C’)’ + (A’+B+C’)’ + (A’+B’+C)’]’

**Bout =** [(A+B+C)(A’+B+C)(A’+B+C’)(A’+B’+C)]’’ = [(A+B+C)’ + (A’+B+C)’ + (A’+B+C’)’ + (A’+B’+C)’]’

```mermaid
graph LR
    subgraph Inputs
        A
        B
        C
    end

    subgraph NOR_Inverters
        notA{{"NOR (NOT A)"}}
        notB{{"NOR (NOT B)"}}
        notC{{"NOR (NOT C)"}}
    end

    subgraph NOR_Logic_Array
        Array1{{"NOR Stage 1"}}
        Array2{{"NOR Stage 2"}}
    end

    A --> notA
    B --> notB
    C --> notC

    A & B & C & notA & notB & notC --> Array1
    Array1 --> Array2
    
    Array2 --> D
    Array2 --> Bout
```

## 4.  Implement the following Boolean expression F(W, X, Y, Z) = ∑m (1, 2, 4, 6, 7, 9, 11, 14, 15)

| W | X | Y | Z | F16 | F8 |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 0 | 0 | **Z** |
| 0 | 0 | 0 | 1 | 1 | |
| 0 | 0 | 1 | 0 | 1 | **Z'** |
| 0 | 0 | 1 | 1 | 0 | |
| 0 | 1 | 0 | 0 | 1 | **Z'** |
| 0 | 1 | 0 | 1 | 0 | |
| 0 | 1 | 1 | 0 | 1 | **1** |
| 0 | 1 | 1 | 1 | 1 | |
| 1 | 0 | 0 | 0 | 0 | **Z** |
| 1 | 0 | 0 | 1 | 1 | |
| 1 | 0 | 1 | 0 | 0 | **Z** |
| 1 | 0 | 1 | 1 | 1 | |
| 1 | 1 | 0 | 0 | 0 | **0** |
| 1 | 1 | 0 | 1 | 0 | |
| 1 | 1 | 1 | 0 | 1 | **1** |
| 1 | 1 | 1 | 1 | 1 | |

### i. Using 8×1 MUX and the needed logic gates

```mermaid
graph LR
    subgraph Inputs
        Z([Input Z])
        VCC[VCC / High]
        GND[GND / Low]
        SEL[Select Inputs: W, X, Y]
    end

    subgraph Logic
        NOT{NOT Gate}
    end

    subgraph MUX_8_1 [8-to-1 Multiplexer]
        direction TB
        P0[Pin 0]
        P1[Pin 1]
        P2[Pin 2]
        P3[Pin 3]
        P4[Pin 4]
        P5[Pin 5]
        P6[Pin 6]
        P7[Pin 7]
    end

    Z --> P0
    Z --> NOT
    Z --> P4
    Z --> P5

    NOT --> P1
    NOT --> P2

    VCC --> P3
    VCC --> P7

    GND --> P6

    SEL -.-> MUX_8_1

    %% Output
    MUX_8_1 --> F
```

### ii. Using 16×1 MUX and the needed logic gates.

```mermaid
graph LR
    subgraph Inputs
        VCC[VCC / High / 1]
        GND[GND / Low / 0]
        SEL[Select Inputs: W, X, Y, Z]
    end

    subgraph MUX_16_1 [16-to-1 Multiplexer]
        direction TB
        P0[Pin 0]
        P1[Pin 1]
        P2[Pin 2]
        P3[Pin 3]
        P4[Pin 4]
        P5[Pin 5]
        P6[Pin 6]
        P7[Pin 7]
        P8[Pin 8]
        P9[Pin 9]
        P10[Pin 10]
        P11[Pin 11]
        P12[Pin 12]
        P13[Pin 13]
        P14[Pin 14]
        P15[Pin 15]
    end

    VCC --> P1
    VCC --> P2
    VCC --> P4
    VCC --> P6
    VCC --> P7
    VCC --> P9
    VCC --> P11
    VCC --> P14
    VCC --> P15

    GND --> P0
    GND --> P3
    GND --> P5
    GND --> P8
    GND --> P10
    GND --> P12
    GND --> P13

    SEL -.-> MUX_16_1

    MUX_16_1 --> F
```

### iii. Using a suitable decoder and an OR gate.

```mermaid
graph LR
    subgraph Input_Section
        IN[Data Input: 1]
        SEL[Select Inputs: W, X, Y, Z]
    end

    subgraph DEMUX [1-to-16 Demultiplexer]
        direction TB
        D0[Out 0]
        D1[Out 1]
        D2[Out 2]
        D3[Out 3]
        D4[Out 4]
        D5[Out 5]
        D6[Out 6]
        D7[Out 7]
        D8[Out 8]
        D9[Out 9]
        D10[Out 10]
        D11[Out 11]
        D12[Out 12]
        D13[Out 13]
        D14[Out 14]
        D15[Out 15]
    end

    subgraph Logic_Gate
        OR{8-Input OR Gate}
    end

    D1 --> OR
    D2 --> OR
    D4 --> OR
    D6 --> OR
    D7 --> OR
    D10 --> OR
    D11 --> OR
    D14 --> OR

    SEL -.-> DEMUX
    IN --> DEMUX

    OR --> F
```

## 5. Design code converter circuits for the following problems: (For the above design problems, construct the truth table, simplify the Boolean expressions using K-map/Boolean Algebra techniques and draw the logic diagram)

### i. 3-bit Gray-to-binary code converter

|   G2   |   G1   |   G0   |   B2   |   B1   |   B0  |
|--------|--------|--------|--------|--------|-------|
|   0    |   0    |   0    |   0    |   0    |   0   |
|   0    |   0    |   1    |   0    |   0    |   1   |
|   0    |   1    |   0    |   0    |   1    |   1   |
|   0    |   1    |   1    |   0    |   1    |   0   |
|   1    |   0    |   0    |   1    |   1    |   1   |
|   1    |   0    |   1    |   1    |   1    |   0   |
|   1    |   1    |   0    |   1    |   0    |   0   |
|   1    |   1    |   1    |   1    |   0    |   1   |

<img width="427" height="228" alt="Screenshot 2026-05-02 at 10 44 03 PM" src="https://github.com/user-attachments/assets/4b29ec20-a6db-4073-af27-75820a759df9" />

<img width="425" height="113" alt="Screenshot 2026-05-02 at 10 44 13 PM" src="https://github.com/user-attachments/assets/77592f7d-6c11-47cf-99a4-571e7a2963b2" />

```mermaid
graph LR
    subgraph Inputs
        G2
        G1
        G0
    end

    subgraph Gates [XOR Logic]
        XOR1((XOR))
        XOR2((XOR))
    end

    subgraph Outputs
        B2
        B1
        B0
    end

    G2 --> B2
    G2 --> XOR1
    G2 --> XOR2

    G1 --> XOR1
    XOR1 --> B1

    G0 --> XOR2
    G1 --> XOR2
    XOR2 --> B0
```

### ii. 3-bit Binary-to-Gray code converter.

|   B2   |   B1   |   B0   |   G2   |   G1   |   G0  |
|--------|--------|--------|--------|--------|-------|
|   0    |   0    |   0    |   0    |   0    |   0   |
|   0    |   0    |   1    |   0    |   0    |   1   |
|   0    |   1    |   0    |   0    |   1    |   1   |
|   0    |   1    |   1    |   0    |   1    |   0   |
|   1    |   0    |   0    |   1    |   1    |   0   |
|   1    |   0    |   1    |   1    |   1    |   1   |
|   1    |   1    |   0    |   1    |   0    |   1   |
|   1    |   1    |   1    |   1    |   0    |   0   |

<img width="448" height="228" alt="Screenshot 2026-05-02 at 10 46 27 PM" src="https://github.com/user-attachments/assets/70ef576f-ef2c-4896-afa5-76b1a6f23d67" />

<img width="437" height="121" alt="Screenshot 2026-05-02 at 10 46 33 PM" src="https://github.com/user-attachments/assets/12a74eac-4bef-4954-ad0f-fd850a5fdbc1" />

```mermaid
graph LR
    subgraph Inputs
        B2
        B1
        B0
    end

    subgraph Gates [XOR Logic]
        XOR1((XOR))
        XOR2((XOR))
    end

    subgraph Outputs
        G2
        G1
        G0
    end

    B2 --> G2
    B2 --> XOR1

    B1 --> XOR1
    B1 --> XOR2
    XOR1 --> G1
    B0 --> XOR2
    XOR2 --> G0
```

### iii. (8 4 -2 -1) BCD code to (Excess 3) BCD code converter.

|       |   A   |   B   |   C   |   D   |        |   X3   |   X2   |   X1   |   X0  |
|-------|-------|-------|-------|-------|--------|--------|--------|--------|-------|
|   0   |   0   |   0   |   0   |   0   |   3    |   0    |   0    |   1    |   1   |
|   1   |   0   |   1   |   1   |   1   |   4    |   0    |   1    |   0    |   0   |
|   2   |   0   |   1   |   1   |   0   |   5    |   0    |   1    |   0    |   1   |
|   3   |   0   |   1   |   0   |   1   |   6    |   0    |   1    |   1    |   0   |
|   4   |   0   |   1   |   0   |   0   |   7    |   0    |   1    |   1    |   1   |
|   5   |   1   |   0   |   1   |   1   |   8    |   1    |   0    |   0    |   0   |
|   6   |   1   |   0   |   1   |   0   |   9    |   1    |   0    |   0    |   1   |
|   7   |   1   |   0   |   0   |   1   |   10   |   1    |   0    |   1    |   0   |
|   8   |   1   |   0   |   0   |   0   |   11   |   1    |   0    |   1    |   1   |
|   9   |   1   |   1   |   1   |   1   |   12   |   1    |   1    |   0    |   0   |

<img width="420" height="154" alt="Screenshot 2026-05-02 at 10 47 44 PM" src="https://github.com/user-attachments/assets/1f36d303-72f7-4009-a377-7e7d5767367e" />

<img width="439" height="437" alt="Screenshot 2026-05-02 at 10 47 50 PM" src="https://github.com/user-attachments/assets/e0df2fca-0554-48e5-8de9-e01bb6919fff" />

```mermaid
graph LR
    subgraph Inputs
        A
        B
        C
        D
    end

    subgraph Gates
        NOT1{NOT Gate}
        NOT2{NOT Gate}
    end

    subgraph Outputs
        X3
        X2
        X1
        X0
    end
    A --> X3
    B --> X2

    C --> NOT1
    NOT1 --> X1
    
    D --> NOT2
    NOT2 --> X0
```
