# Lab A6 - Report

## 1.

### i. Verify the function table for 7476 Dual Negative Edge Triggered JK Flip-flop

| (PRE)' | (CLR)' | CLK | J | K | Q          | Q'         |
|--------|--------|-----|---|---|------------|------------|
|      0 |      1 | X   | X | X |          1 |          0 |
|      1 |      0 | X   | X | X |          0 |          1 |
|      0 |      0 | X   | X | X | Non-stable | Non-stable |
|      1 |      1 |   1 | 0 | 0 | Q0         | Q0′        |
|      1 |      1 | ↓   | 1 | 0 |          1 |          0 |
|      1 |      1 | ↓   | 0 | 1 |          0 |          1 |
|      1 |      1 | ↓   | 1 | 1 | Q0′        | Q0         |
|      1 |      1 |   1 | X | X | Q0         | Q0         |

### ii. Construct the following flip-flops using JK Flip-Flop and verify their truth tables

**a. D (Data) Flip-Flop**

<img width="509" height="244" alt="Screenshot 2026-05-09 at 4 15 02 PM" src="https://github.com/user-attachments/assets/3ccad2c3-4866-4920-9702-5660002d8e79" />

**b. T (Toggle) Flip-Flop**

<img width="487" height="181" alt="Screenshot 2026-05-09 at 4 15 09 PM" src="https://github.com/user-attachments/assets/068e390c-598e-4810-bfa6-2dffd1d96ad9" />

## 2. Design a 2-bit synchronous counter that can go through the following sequence in binary. 1, 3, 2, 0 and repeat. Use J-K Flip-flops for the design. Verify your design experimentally.

> 01 -> 11 -> 10 -> 00 -> 01

| Current A | Current B | Next A | Next B | JA | KA | JB | KB |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 1 | 0 | X | 1 | X |
| 0 | 1 | 1 | 1 | 1 | X | X | 0 |
| 1 | 1 | 1 | 0 | X | 0 | X | 1 |
| 1 | 0 | 0 | 0 | X | 1 | 0 | X |

<img width="693" height="624" alt="Screenshot 2026-05-09 at 4 19 07 PM" src="https://github.com/user-attachments/assets/c5874b68-88e8-4d3d-bf98-0a9035f5fd2b" />

<img width="461" height="201" alt="Screenshot 2026-05-09 at 4 19 16 PM" src="https://github.com/user-attachments/assets/498cd959-9654-431a-8727-c3d6df519501" />

## 3. Construct and explain the operation of the following ripple counters with positive edge triggered D Flip-flops.

### i. 4 bit binary asynchronous UP counter

<img width="587" height="212" alt="Screenshot 2026-05-09 at 4 19 44 PM" src="https://github.com/user-attachments/assets/54c1d617-bb80-4908-8d32-15525aa10835" />

### ii. 4 bit binary asynchronous DOWN counter

<img width="584" height="234" alt="Screenshot 2026-05-09 at 4 21 14 PM" src="https://github.com/user-attachments/assets/9095ec18-c959-453f-b5c4-00c116f5ad1a" />

### iii. Asynchronous BCD Counter

<img width="517" height="294" alt="Screenshot 2026-05-09 at 4 21 26 PM" src="https://github.com/user-attachments/assets/b14e6324-446f-484b-b0de-960d293298dc" />

### iv. Asynchronous MOD-12 Counter

<img width="455" height="229" alt="Screenshot 2026-05-09 at 4 21 57 PM" src="https://github.com/user-attachments/assets/ea8edb34-d94a-4acf-9789-0aff3b302fde" />

Q0 changes every clock pulse. Q1 changes every time Q0 goes from high to low. Q2 changes every time Q1 goes from high to low. Q3 changes every time Q2 goes from high to low. When the counter count till 1100 (12), it will reset all D flip flop to 0000, repeating the counter again.

### v. Ripple divide by 14 Counter

<img width="450" height="230" alt="Screenshot 2026-05-09 at 4 22 25 PM" src="https://github.com/user-attachments/assets/153b3ee6-d0cd-46e8-b69a-09d62cf8db8e" />

Q0 changes every clock pulse. Q1 changes every time Q0 goes from high to low. Q2 changes every time Q1 goes from high to low. Q3 changes every time Q2 goes from high to low. When the counter count till 1110 (14), it will reset all D flip flop to 0000, repeating the counter again.

## 4.  Design and Construct a parallel counter that has the following sequence. If the input (UP)/(DOWN)’ = 1, it will count up, 000-010-100-110 and then recycle to 000 If the input (UP)/ (DOWN)’ = 0, it will count down, 110-100-010-000 and then recycle to 110. Undesired states are don’t care states.

<img width="562" height="130" alt="Screenshot 2026-05-09 at 4 22 52 PM" src="https://github.com/user-attachments/assets/29696d68-5019-4391-9dc0-599c68a91f90" />

### i. Use T flip-flops for the design.

| (UP)/ (DOWN)' | Present MSB (A) | Present (B) | Present LSB (C) | Next MSB (A) | Next (B) | Next LSB (C) | T Flip Flop $T_A$ | T Flip Flop $T_B$ | T Flip Flop $T_C$ |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 |
| 0 | 0 | 0 | 1 | X | X | X | X | X | X |
| 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |
| 0 | 0 | 1 | 1 | X | X | X | X | X | X |
| 0 | 1 | 0 | 0 | 0 | 1 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | X | X | X | X | X | X |
| 0 | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 1 | 0 |
| 0 | 1 | 1 | 1 | X | X | X | X | X | X |
| 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | X | X | X | X | X | X |
| 1 | 0 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 1 | X | X | X | X | X | X |
| 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 | X | X | X | X | X | X |
| 1 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 1 | 1 | 1 | 1 | X | X | X | X | X | X |

<img width="486" height="310" alt="Screenshot 2026-05-09 at 4 25 05 PM" src="https://github.com/user-attachments/assets/810335fb-faff-4529-afa2-5082f7d5d47e" />

<img width="480" height="195" alt="Screenshot 2026-05-09 at 4 25 14 PM" src="https://github.com/user-attachments/assets/58105412-ecd8-493b-b65b-e715c86ba27a" />

<img width="460" height="213" alt="Screenshot 2026-05-09 at 4 25 20 PM" src="https://github.com/user-attachments/assets/10eb91d0-3f74-4cd3-b516-62da84e5393c" />

### ii. Use D flip-flops for the design.

| (UP)/ (DOWN)' | Present MSB (A) | Present (B) | Present LSB (C) | Next MSB (A) | Next (B) | Next LSB (C) | D Flip Flop $D_A$ | D Flip Flop $D_B$ | D Flip Flop $D_C$ |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 |
| 0 | 0 | 0 | 1 | X | X | X | X | X | X |
| 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | X | X | X | X | X | X |
| 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 | X | X | X | X | X | X |
| 0 | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 1 | X | X | X | X | X | X |
| 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | X | X | X | X | X | X |
| 1 | 0 | 1 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
| 1 | 0 | 1 | 1 | X | X | X | X | X | X |
| 1 | 1 | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 |
| 1 | 1 | 0 | 1 | X | X | X | X | X | X |
| 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 | X | X | X | X | X | X |

<img width="485" height="491" alt="Screenshot 2026-05-09 at 4 26 03 PM" src="https://github.com/user-attachments/assets/0b90b1d5-e840-4731-9843-48a5ee47102b" />

<img width="311" height="152" alt="Screenshot 2026-05-09 at 4 26 12 PM" src="https://github.com/user-attachments/assets/30ea3b28-b551-4dc7-89c6-ef176b8a5913" />
