# Assignment 1

### The Question

Ques No: 6, Input=0, 14->9->2->6(repeat), all undesired state go to 9.

Ques No: 6, Input=1, 2->4->0->7(repeat), all undesired state go to 4.

MSB->LSB: T, T, D, JK

### State Transition Diagram

<img width="1021" height="461" alt="Transition Diagram" src="https://github.com/user-attachments/assets/a246ebb6-b167-47ea-b991-2e0d5f38b888" />

### Flip-flop Excitation Table

#### T Excitation Table:
|   $Q_n$  |   $Q_{n+1}$  |   T  |
|----------|--------------|------|
|      0   |        0     |   0  |
|      0   |        1     |   1  |
|      1   |        0     |   1  |
|      1   |        1     |   0  |

#### D Excitation Table:
|   $Q_n$  |   $Q_{n+1}$  |   D  |
|----------|--------------|------|
|      0   |        0     |   0  |
|      0   |        1     |   1  |
|      1   |        0     |   0  |
|      1   |        1     |   1  |

#### JK Excitation Table:
|   $Q_n$  |   $Q_{n+1}$  |   J  |   K  |
|----------|--------------|------|------|
|      0   |        0     |   0  |   X  |
|      0   |        1     |   1  |   X  |
|      1   |        0     |   X  |   1  |
|      1   |        1     |   X  |   0  |

### State Table

| Input |   Present A |   Present B |   Present C |   Present D |   Next A |   Next B |   Next C |   Next D |   $T_A$ |   $T_B$ |   $D_C$ |   $J_D$ |   $K_D$ |
|-------|-------------|-------------|-------------|-------------|----------|----------|----------|----------|---------|---------|---------|---------|---------|
|   0   |   0         |   0         |   0         |   0         |   1      |   0      |   0      |   1      |   1     |   0     |   0     |   1     |   X     |
|   0   |   0         |   0         |   0         |   1         |   1      |   0      |   0      |   1      |   1     |   0     |   0     |   X     |   0     |
|   0   |   0         |   0         |   1         |   0         |   0      |   1      |   1      |   0      |   0     |   1     |   1     |   0     |   X     |
|   0   |   0         |   0         |   1         |   1         |   1      |   0      |   0      |   1      |   1     |   0     |   0     |   X     |   0     |
|   0   |   0         |   1         |   0         |   0         |   1      |   0      |   0      |   1      |   1     |   1     |   0     |   1     |   X     |
|   0   |   0         |   1         |   0         |   1         |   1      |   0      |   0      |   1      |   1     |   1     |   0     |   X     |   0     |
|   0   |   0         |   1         |   1         |   0         |   1      |   1      |   1      |   0      |   1     |   0     |   1     |   0     |   X     |
|   0   |   0         |   1         |   1         |   1         |   1      |   0      |   0      |   1      |   1     |   1     |   0     |   X     |   0     |
|   0   |   1         |   0         |   0         |   0         |   1      |   0      |   0      |   1      |   0     |   0     |   0     |   1     |   X     |
|   0   |   1         |   0         |   0         |   1         |   0      |   0      |   1      |   0      |   1     |   0     |   1     |   X     |   1     |
|   0   |   1         |   0         |   1         |   0         |   1      |   0      |   0      |   1      |   0     |   0     |   0     |   1     |   X     |
|   0   |   1         |   0         |   1         |   1         |   1      |   0      |   0      |   1      |   0     |   0     |   0     |   X     |   0     |
|   0   |   1         |   1         |   0         |   0         |   1      |   0      |   0      |   1      |   0     |   1     |   0     |   1     |   X     |
|   0   |   1         |   1         |   0         |   1         |   1      |   0      |   0      |   1      |   0     |   1     |   0     |   X     |   0     |
|   0   |   1         |   1         |   1         |   0         |   1      |   0      |   0      |   1      |   0     |   1     |   0     |   1     |   X     |
|   0   |   1         |   1         |   1         |   1         |   1      |   0      |   0      |   1      |   0     |   1     |   0     |   X     |   0     |
|   1   |   0         |   0         |   0         |   0         |   0      |   1      |   1      |   1      |   0     |   1     |   1     |   1     |   X     |
|   1   |   0         |   0         |   0         |   1         |   0      |   1      |   0      |   0      |   0     |   1     |   0     |   X     |   1     |
|   1   |   0         |   0         |   1         |   0         |   0      |   1      |   0      |   0      |   0     |   1     |   0     |   0     |   X     |
|   1   |   0         |   0         |   1         |   1         |   0      |   1      |   0      |   0      |   0     |   1     |   0     |   X     |   1     |
|   1   |   0         |   1         |   0         |   0         |   0      |   0      |   0      |   0      |   0     |   1     |   0     |   0     |   X     |
|   1   |   0         |   1         |   0         |   1         |   0      |   1      |   0      |   0      |   0     |   0     |   0     |   X     |   1     |
|   1   |   0         |   1         |   1         |   0         |   0      |   1      |   0      |   0      |   0     |   0     |   0     |   0     |   X     |
|   1   |   0         |   1         |   1         |   1         |   0      |   0      |   1      |   0      |   0     |   1     |   1     |   X     |   1     |
|   1   |   1         |   0         |   0         |   0         |   0      |   1      |   0      |   0      |   1     |   1     |   0     |   0     |   X     |
|   1   |   1         |   0         |   0         |   1         |   0      |   1      |   0      |   0      |   1     |   1     |   0     |   X     |   1     |
|   1   |   1         |   0         |   1         |   0         |   0      |   1      |   0      |   0      |   1     |   1     |   0     |   0     |   X     |
|   1   |   1         |   0         |   1         |   1         |   0      |   1      |   0      |   0      |   1     |   1     |   0     |   X     |   1     |
|   1   |   1         |   1         |   0         |   0         |   0      |   1      |   0      |   0      |   1     |   0     |   0     |   0     |   X     |
|   1   |   1         |   1         |   0         |   1         |   0      |   1      |   0      |   0      |   1     |   0     |   0     |   X     |   1     |
|   1   |   1         |   1         |   1         |   0         |   0      |   1      |   0      |   0      |   1     |   0     |   0     |   0     |   X     |
|   1   |   1         |   1         |   1         |   1         |   0      |   1      |   0      |   0      |   1     |   0     |   0     |   X     |   1     |

### K-map

#### $T_A$:
<img width="548" height="301" alt="Screenshot 2026-05-20 at 2 08 17 PM" src="https://github.com/user-attachments/assets/be9c591b-51b3-4d69-8fcd-449beb3d49d5" />

**$T_A$ =** I'A'B + I'A'C'+ I'A'D + AB'C'D + IA

#### $T_B$:
<img width="556" height="301" alt="Screenshot 2026-05-20 at 2 08 30 PM" src="https://github.com/user-attachments/assets/7bc23e44-8049-46a0-8621-a42f05456ca8" />

**$T_B$ =** I'AB + I'BC' + I'BD + IA'C'D' + IA'CD + IB' + A'B'CD'

#### $D_C$:
<img width="560" height="437" alt="Screenshot 2026-05-20 at 2 08 42 PM" src="https://github.com/user-attachments/assets/d207d26b-a789-4492-8ae8-92e613188a0b" />

**$D_C$ =** I'A'CD' + I'AB'C'D + IA'B'C'D' + IA'BCD

#### $J_D$:
<img width="556" height="310" alt="Screenshot 2026-05-20 at 2 08 50 PM" src="https://github.com/user-attachments/assets/f5f17597-6ad9-48d2-827d-0acce8eafc88" />

**$J_D$ =** I'A + I'C' + A'B'C'

#### $K_D$:
<img width="552" height="305" alt="Screenshot 2026-05-20 at 2 09 15 PM" src="https://github.com/user-attachments/assets/4e5ca7c2-f9d7-48b7-8d00-48c535f9b232" />

**$K_D$ =** I + AB'C'
