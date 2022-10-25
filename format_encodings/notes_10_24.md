# COMP122 Lecture Notes: October 24 & 25, 2022

## Announcements
   1. Exam #2 Announced
      - Oct 31 / Nov 2
      - In-class: @ the day/time in which you are enrolled
      - Format: similar to HW assignments
      - Coverage: Format and Encodings
   1. Assignments Released
      - 24-floating-point-encoding
      - 25-bitwise-operations
   1. Plan:
      - Today: Complete Coverage of Material today
      - W/R: Practicum and/or Review

## Today's Agenda
   1. Floating Point Encoding
   1. Bitwise operations
      - nor (\~), and (&), or (|), and xor (^) 
      - shifts and rotates
      - bit manipulation

## Questions
   1. M/W M:
      - BCD Addition
      - One's and Two's Complement
   1. M/W A:
      - when doing binary subtraction when do I do an initial 1 as a carry in
   1. T/R M: 
   1. T/R A: 

## Today's Material

- example conversion to double 
10#  6.22140 x 10^5
10#  622140.00000000000000000000000000000000000000000
2#   10010111111000111100.000000000000000
2#   1. 0010 1111 1100 0111 1000 x 2^ (19)

float:
     | S   | E (8)      | M (23)  | 
     | --: | :---------:| :------ | 
     |  0  | 1001 0010  | 0010 1111 1100 0111 0000 000  | 

exponent
    19
+  127
------
   146  -> 1001 0010


- example of rotate to the left by 3

   1011 1011 : original
   1101 1101
   1101 1101 : rotate left by 3 (answer)

   1011 1011 : original
   0000 0101 : shift right by 5

   1101 1000 : shift left by 3
|  0000 0101 : shift right by 5
   ----------
   1101 1101

- example of rotate to the left by 2

1101 1011
----------
01 1011 00  : sll by 2
00 0000 11  : srl by 6
01 1011 11  : or

01 1011 11   : rol by 2

---
## Resources
   1. conversion_2float.md: class-material/format_encodings/conversion_2float.md
   1. Floating Point: https://docs.google.com/presentation/d/13tNZwZO81TJvirJHBU2-nThO-3xQ9ZmZUZUEzBxYNMA/edit#slide=id.gf1bcb9d487_0_2364
   1. Bitwise Operations: https://docs.google.com/presentation/d/1h3Q4srhBRhfdQsMj8mI9YWbxl3g6ZMcCzyt6yvz7k9g/edit#slide=id.g10e6aad98fb_0_254

## Notes
