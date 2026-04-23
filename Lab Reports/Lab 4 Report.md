# Lab 4 - Report

## 1. Design a combinational logic circuit for 3-input minority circuit. Assume that a minority circuit is one which produces a HIGH (1) when two or more inputs are LOW (0).

### i. Construct the truth table.

|   A   |   B   |   C   |   X   |   Product   |   Sum       |
|-------|-------|-------|-------|-------------|-------------|
|   0   |   0   |   0   |   1   |   A’B’C’    |             |
|   0   |   0   |   1   |   1   |   A’B’C     |             |
|   0   |   1   |   0   |   1   |   A’BC’     |             |
|   0   |   1   |   1   |   0   |             |   A+B’+C’   |
|   1   |   0   |   0   |   1   |   AB’C’     |             |
|   1   |   0   |   1   |   0   |             |   A’+B+C’   |
|   1   |   1   |   0   |   0   |             |   A’+B’+C   |
|   1   |   1   |   1   |   0   |             |   A’+B’+C'  |

### ii. Simplify the Boolean expression into product-of-sums (POS) form and sum-of-products (SOP) form using Boolean Algebra Techniques / Karnaugh map.

<img width="646" height="104" alt="Screenshot 2026-04-23 at 6 56 40 PM" src="https://github.com/user-attachments/assets/3ebe54b5-3ac4-4b9d-968c-52ea2c1ab992" />

**SOP:** A’B’ + B’C’ + A’C’

<img width="652" height="113" alt="Screenshot 2026-04-23 at 6 57 46 PM" src="https://github.com/user-attachments/assets/cd48573f-0398-4add-9ce1-dc71a19a2122" />

**POS:** (A’+C’)(B’+C’)(A’+B')

### iii. Construct the logic diagram using OR-AND gate network and verify the circuit experimentally.

**SOP:**
```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
    end

    A --> NOT1((NOT))
    B --> NOT2((NOT))
    C --> NOT3((NOT))

    NOT1 --> AND1[AND 1]
    NOT2 --> AND1
    NOT2 --> AND2[AND 2]
    NOT3 --> AND2
    NOT3 --> AND3[AND 3]
    NOT1 --> AND3

    AND1 --> OR{OR}
    AND2 --> OR
    AND3 --> OR

    OR --> X[X]
```

**POS:**
```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
    end

    A --> NOT1((NOT))
    B --> NOT2((NOT))
    C --> NOT3((NOT))

    NOT1 --> OR1{OR 1}
    NOT2 --> OR1
    NOT2 --> OR2{OR 2}
    NOT3 --> OR2
    NOT3 --> OR3{OR 3}
    NOT1 --> OR3

    OR1 --> AND[AND]
    OR2 --> AND
    OR3 --> AND

    AND --> X[X]
```

### iv. Construct the logic diagram using only NAND gates and verify the circuit experimentally.

**SOP:** A’B’ + B’C’ + A’C’ = [A’B’ + B’C’ + A’C’]’’ = [(A’B’)’(B’C’)’(A’C’)']’

```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
    end

    A --> NAND_A1((NAND))
    A --> NAND_A1
    B --> NAND_B1((NAND))
    B --> NAND_B1
    C --> NAND_C1((NAND))
    C --> NAND_C1

    NAND_A1 --> NAND_AB((NAND))
    NAND_B1 --> NAND_AB
    NAND_B1 --> NAND_BC((NAND))
    NAND_C1 --> NAND_BC
    NAND_C1 --> NAND_AC((NAND))
    NAND_A1 --> NAND_AC

    NAND_AB --> NAND_FINAL((NAND))
    NAND_BC --> NAND_FINAL
    NAND_AC --> NAND_FINAL

    NAND_FINAL --> X[X]
```

**POS:** (A’+C’)(B’+C’)(A’B') = [(A’+C’)(B’+C’)(A’B’)]’’ = [(B’+C’)’+(A’+B’)’+(A’+C’)’]’ = [BC+AB+AC]’ = (BC)’(AB)’(AC)’ = [(BC)’(AB)’(AC)’]’’

```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
    end

    A --- nodeA(( ))
    B --- nodeB(( ))
    C --- nodeC(( ))

    nodeA --> NAND1((NAND 1))
    nodeB --> NAND1
    nodeB --> NAND2((NAND 2))
    nodeC --> NAND2
    nodeC --> NAND3((NAND 3))
    nodeA --> NAND3

    NAND1 --> NAND_FINAL((NAND 4))
    NAND2 --> NAND_FINAL
    NAND3 --> NAND_FINAL

    NAND_FINAL --> NOT_STAGE((NAND 5))
    NOT_STAGE --> X[X]
```

## 2. Design a combinational logic circuit for 4-input majority circuit. A majority circuit is one which produces a HIGH (1) output when three or more inputs are HIGH (1).

### i. Construct the truth table and simplify the Boolean expression into SOP and POS forms using K-map.

|   A   |   B   |   C   |   D   |   X   |   Product   |   Sum        |
|-------|-------|-------|-------|-------|-------------|--------------|
|   0   |   0   |   0   |   0   |   0   |             |   A+B+C+D    |
|   0   |   0   |   0   |   1   |   0   |             |   A+B+C+D’   |
|   0   |   0   |   1   |   0   |   0   |             |   A+B+C’+D   |
|   0   |   0   |   1   |   1   |   0   |             |   A+B+C’+D’  |
|   0   |   1   |   0   |   0   |   0   |             |   A+B’+C+D   |
|   0   |   1   |   0   |   1   |   0   |             |   A+B’+C+D’  |
|   0   |   1   |   1   |   0   |   0   |             |   A+B’+C’+D  |
|   0   |   1   |   1   |   1   |   1   |   A’BCD     |              |
|   1   |   0   |   0   |   0   |   0   |             |   A’+B+C+D   |
| 1     | 0     | 0     | 1     | 0     |             |   A’+B+C+D’  |
| 1     | 0     | 1     | 0     | 0     |             |   A’+B+C’+D  |
| 1     | 0     | 1     | 1     | 1     | AB’CD       |              |
| 1     | 1     | 0     | 0     | 0     |             | A’+B’+C+D    |
| 1     | 1     | 0     | 1     | 1     | ABC’D       |              |
| 1     | 1     | 1     | 0     | 1     | ABCD’       |              |
| 1     | 1     | 1     | 1     | 1     | ABCD        |              |

<img width="655" height="185" alt="Screenshot 2026-04-23 at 7 12 47 PM" src="https://github.com/user-attachments/assets/4a5bfa2a-5738-446f-a650-5d957c8bc5e8" />

**SOP:** ABD + BCD + ACD + ABC

<img width="657" height="183" alt="Screenshot 2026-04-23 at 7 12 56 PM" src="https://github.com/user-attachments/assets/2faa8754-3ab1-4184-9d2a-f506f278f120" />

**POS:** (A+C)(C+D)(A+B)(A+D)(B+D)

### ii. Construct the logic diagram using AND-OR gate network with simplified SOP expression.

```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
        D[D]
    end

    A & B & C --> AND1[AND 1]
    A & B & D --> AND2[AND 2]
    A & C & D --> AND3[AND 3]
    B & C & D --> AND4[AND 4]

    AND1 --> OR{OR}
    AND2 --> OR
    AND3 --> OR
    AND4 --> OR

    OR --> X[X]
```

### iii. Construct the logic diagram using OR-AND gate network with simplified POS expression.

```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
    end

    A --- nodeA(( ))
    B --- nodeB(( ))
    C --- nodeC(( ))

    nodeA --> NAND1((NAND 1))
    nodeB --> NAND1
    nodeB --> NAND2((NAND 2))
    nodeC --> NAND2
    nodeC --> NAND3((NAND 3))
    nodeA --> NAND3

    NAND1 --> NAND_FINAL((NAND 4))
    NAND2 --> NAND_FINAL
    NAND3 --> NAND_FINAL

    NAND_FINAL --> NOT_STAGE((NAND 5))
    NOT_STAGE --> X[X]
```

### iv. Construct the logic diagram using only NAND gates with simplified SOP expression.

**SOP:** ABD + BCD + ACD + ABC = [ABD + BCD + ACD + ABC]’’ = [(ABD)’(BCD)’(ACD)’(ABC)’]’

```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
        D[D]
    end

    A & B & C --> NAND1((NAND 1))
    A & B & D --> NAND2((NAND 2))
    A & C & D --> NAND3((NAND 3))
    B & C & D --> NAND4((NAND 4))

    NAND1 --> FINAL_NAND((NAND 5))
    NAND2 --> FINAL_NAND
    NAND3 --> FINAL_NAND
    NAND4 --> FINAL_NAND

    FINAL_NAND --> X[X]
```

### v. Construct the logic diagram using only NOR gates with simplified POS expression.

**POS:** (A+C)(C+D)(A+B)(A+D)(B+D) = [(A+C)(C+D)(A+B)(A+D)(B+D)]’’ = [(A+C)’ + (C+D)’ + (A+B)’ + (A+D)’ + (B+D)’]’

```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
        D[D]
    end

    A & B --> NOR1((NOR 1))
    A & C --> NOR2((NOR 2))
    B & C --> NOR3((NOR 3))
    A & D --> NOR4((NOR 4))
    B & D --> NOR5((NOR 5))
    C & D --> NOR6((NOR 6))

    NOR1 & NOR2 & NOR3 & NOR4 & NOR5 & NOR6 --> FINAL_NOR((NOR 7))

    FINAL_NOR --> X[X]
```

## 3. Design a combinational logic circuit that controls an elevator door in a three-storey building. There are 4 input conditions. M is a logic signal that indicates when the elevator is moving (M=1) or stopped (M=0). F1, F2 and F3 are floor indicator signals that are normally LOW, and they go HIGH only when the elevator is positioned at the level of that particular floor.

### i. Construct the truth table and simplify the Boolean expression into SOP form using K-map with don’t care conditions.

|   M   |   F1   |   F2   |   F3   |   X   |   Product           |   Sum        |
|-------|--------|--------|--------|-------|---------------------|--------------|
|   0   |   0    |   0    |   0    |   0   |                     |   A+B+C+D    |
|   0   |   0    |   0    |   1    |   1   |   M’(F1)’(F2)’(F3)  |   A+B+C+D’   |
|   0   |   0    |   1    |   0    |   1   |   M’(F1)’(F2)(F3)’  |   A+B+C’+D   |
|   0   |   0    |   1    |   1    |   X   |                     |   A+B+C’+D’  |
|   0   |   1    |   0    |   0    |   1   |   M’(F1)(F2)’(F3)’  |   A+B’+C+D   |
|   0   |   1    |   0    |   1    |   X   |                     |   A+B’+C+D’  |
|   0   |   1    |   1    |   0    |   X   |                     |   A+B’+C’+D  |
|   0   |   1    |   1    |   1    |   X   |                     |              |
|   1   |   0    |   0    |   0    |   0   |                     |   A’+B+C+D   |
|   1   |   0    |   0    |   1    |   0   |                     |   A’+B+C+D’  |
|   1   |   0    |   1    |   0    |   0   |                     |   A’+B+C’+D  |
|   1   |   0    |   1    |   1    |   X   |                     |              |
|   1   |   1    |   0    |   0    |   0   |                     | A’+B’+C+D    |
|   1   |   1    |   0    |   1    |   X   |                     |              |
|   1   |   1    |   1    |   0    |   X   |                     |              |
|  1    |   1    |   1    |   1    |   X   |                     |              |

<img width="661" height="193" alt="Screenshot 2026-04-23 at 7 23 09 PM" src="https://github.com/user-attachments/assets/09c2e70c-79fc-4baf-84a1-9dd22578e38b" />

**SOP:** M’(F1)+M’(F2)+M’(F3)

### ii. Construct the logic diagram using AND-OR gate network with simplified SOP expression.

```mermaid
graph LR
    subgraph Inputs
        M[M]
        F1[F1]
        F2[F2]
        F3[F3]
    end

    M --> NOT((NOT))

    NOT --> AND1[AND 1]
    F1 --> AND1   
    NOT --> AND2[AND 2]
    F2 --> AND2
    NOT --> AND3[AND 3]
    F3 --> AND3

    AND1 --> OR{OR}
    AND2 --> OR
    AND3 --> OR

    OR --> X[X]
```

### iii. Construct the logic diagram using only NAND gates with simplified SOP expression

M’(F1)+M’(F2)+M’(F3) = [M’(F1)+M’(F2)+M’(F3)]’’ = [{M’(F1)}’{M’(F2)}’{M’(F3)}’]’

```mermaid
graph LR
    subgraph Inputs
        M[M]
        F1[F1]
        F2[F2]
        F3[F3]
    end

    M --> NAND_M((NAND 1))
    M --> NAND_M

    NAND_M --> NAND_F1((NAND 2))
    F1 --> NAND_F1
    NAND_M --> NAND_F2((NAND 3))
    F2 --> NAND_F2
    NAND_M --> NAND_F3((NAND 4))
    F3 --> NAND_F3

    NAND_F1 --> FINAL_NAND((NAND 5))
    NAND_F2 --> FINAL_NAND
    NAND_F3 --> FINAL_NAND

    FINAL_NAND --> X[X]
```

## 4. Design a minimal combinational logic circuit that detects the presence of any of the six illegal code groups in the 8421 standard BCD code by providing a logic-1 output.

### i. Construct the truth table and simplify the Boolean expression using K-map.

|   A   |   B   |   C   |   D   |   X   |   Product  |
|-------|-------|-------|-------|-------|------------|
|   0   |   0   |   0   |   0   |   0   |            |
|   0   |   0   |   0   |   1   |   0   |            |
|   0   |   0   |   1   |   0   |   0   |            |
|   0   |   0   |   1   |   1   |   0   |            |
|   0   | 1     |     0 |   0   |     0 |            |
|   0   |   1   |   0   |   1   |   0   |            |
|   0   |   1   |   1   |   0   |   0   |            |
|   0   |   1   |   1   |   1   |   0   |            |
|   1   |   0   |   0   |   0   |   0   |            |
|   1   |   0   |   0   |   1   |   0   |            |
|   1   |   0   |   1   |   0   |   1   |   AB’CD’   |
|   1   |   0   |   1   |   1   |   1   |   AB’CD    |
|   1   |   1   |   0   |   0   |   1   |   ABC’D’   |
|   1   |   1   |   0   |   1   |   1   |   ABC’D    |
|   1   |   1   |   1   |   0   |   1   |   ABCD’    |
|   1   |   1   |   1   |   1   |   1   |   ABCD     |

<img width="661" height="191" alt="Screenshot 2026-04-23 at 7 31 41 PM" src="https://github.com/user-attachments/assets/0ed00607-16d6-4e71-85cf-525b9cfd223d" />

**SOP:** AB + AC

### ii. Construct the logic diagram using basic logic gates that produces minimum hardware requirement.

```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
        D[D]
    end

    A --> AND1[AND 1]
    B --> AND1
    A --> AND2[AND 2]
    C --> AND2

    AND1 --> OR{OR}
    AND2 --> OR

    OR --> X[X]
```

## 5. A combinational logic circuit has four inputs and one output. The output is 1 if and only if the decimal number represented by the inputs in binary code is a prime number.

### i. Construct the truth table and simplify the Boolean expression into POS form using K- map.

|   A   |   B   |   C   |   D   |   X   |   Sum          |
|-------|-------|-------|-------|-------|----------------|
|   0   |   0   |   0   |   0   |   0   |   A+B+C+D      |
|   0   |   0   |   0   |   1   |   0   |   A+B+C+D’     |
|   0   |   0   |   1   |   0   |   1   |                |
|   0   |   0   |   1   |   1   |   1   |                |
|   0   |   1   |   0   |   0   |   0   |   A+B’+C+D     |
|   0   |   1   |   0   |   1   |   1   |                |
|   0   |   1   |   1   |   0   |   0   |   A+B’+C’+D    |
|   0   |   1   |   1   |   1   |   1   |                |
|   1   |   0   |   0   |   0   |   0   |   A’+B+C+D     |
|   1   |   0   |   0   |   1   |   0   |   A’+B+C+D’    |
|   1   |   0   |   1   |   0   |   0   |   A’+B+C'+D    |
|   1   |   0   |   1   |   1   |   1   |                |
|   1   |   1   |   0   |   0   |   0   |   A’+B’+C+D    |
|   1   |   1   |   0   |   1   |   1   |                |
|   1   |   1   |   1   |   0   |   0   |   A’+B’+C’+D   |
|   1   |   1   |   1   |   1   |   0   |   A’+B’+C’+D’  |

<img width="660" height="188" alt="Screenshot 2026-04-23 at 7 35 11 PM" src="https://github.com/user-attachments/assets/4a9d55a1-f2ff-4149-a993-fa5ce1a9417e" />

**POS:** (B+C)(B’+D)(A’+D)(A’+B’+C’)

### ii. Construct the logic diagram using OR-AND gate network with simplified POS expression

```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
        D[D]
    end

    A --> NOT_A((NOT))
    B --> NOT_B((NOT))
    
    NOT_A --> OR1{OR 1}
    B --> OR1
    NOT_B --> OR1

    B --> OR2{OR 2}
    NOT_B --> OR2
    A --> OR2
    A --> OR3{OR 3}
    C --> OR3
    D --> OR3
    B --> OR4{OR 4}
    D --> OR4

    OR1 --> AND[AND]
    OR2 --> AND
    OR3 --> AND
    OR4 --> AND

    AND --> X[X]
```

### iii. Construct the logic diagram using only NOR gates with simplified POS expression.

(B+C)(B’+D)(A’+D)(A’+B’+C’) = [(B+C)(B’+D)(A’+D)(A’+B’+C’)]’’ = [(B+C)’ + (B’+D)’ + (A’+D)’ + (A’+B’+C’)’]’

```mermaid
graph LR
    subgraph Inputs
        A[A]
        B[B]
        C[C]
        D[D]
    end

    %% Stage 1: NOR as NOT
    A --> NOR_A((NOR 1))
    A --> NOR_A
    B --> NOR_B((NOR 2))
    B --> NOR_B
    C --> NOR_C((NOR 3))
    C --> NOR_C

    NOR_A --> NOR_ABC((NOR 4))
    NOR_B --> NOR_ABC
    NOR_C --> NOR_ABC
    NOR_A --> NOR_ABD((NOR 5))
    NOR_B --> NOR_ABD
    D --> NOR_ABD
    NOR_A --> NOR_ACD((NOR 6))
    NOR_C --> NOR_ACD
    D --> NOR_ACD
    NOR_B --> NOR_BCD((NOR 7))
    NOR_C --> NOR_BCD
    D --> NOR_BCD

    NOR_ABC --> FINAL_NOR((NOR 8))
    NOR_ABD --> FINAL_NOR
    NOR_ACD --> FINAL_NOR
    NOR_BCD --> FINAL_NOR

    FINAL_NOR --> X[X]
```
