# COMP122 Lecture Notes: October 26 & 22, 2022

## Announcements
   1. Exam #2 Announced
   1. Assignments: 
      - past due: 23-binary-addition past due   
      - due Sun: 24-floating-point-encoding
      - due Sun: 25-bitwise-operations

## Today's Agenda
   1. Potential Review for Exam #2
      - got questions?
   1. Base64 Encoding: 
      - Lookup Table:
        * https://docs.google.com/spreadsheets/d/1Jlo2GmWvl4bxlPN9GzXsKnl4acyppBWYQjX2S_Bm9oQ/edit#gid=0
      - 2^6 = 64 -> 6 bit encoding scheme
      - e.g., 01 0010 -> 'S'
      - e.g., 00 1111 | 00 0110 | 10 1010 -> 'P' 'G' 'q' 
   1. Base64 Motivation  (see slides)
   1. Program: Base64 (see slides)

## Questions
   1. M/W M:
      - MIPS how to divide using shifts
      - Binary multiplication
      - Floating point bias: Negative or Positive
      - MIPS demarshal and marshal -- when?

   1. M/W A:
      - complement of a negative number
      - explain the syntax of a binary number in scientific format
      - convert real base 16 -> base 2, and then decimal
      - BCD addition with the pattern in the homework

   1. T/R M: 
      - UTF8 encoding
      - Floating point in padding and error of the exponent and mantissa
        - Conversion to a binary fraction
      - Binary Multiplication
      - Binary Addition: when to add the initial carry in to 1
      - Encoding of 1's and 2's complement for both positive and negative numbers
      - Clarification on sra

   1. T/R A:
      - utf8
      - binary real -> float encoding (binary16)
        - negative floating point
      - BCD addition with the corrective step
      - complements of numbers (as opposed to encoding in 1's and 2's complement)






## Today's Material


  18 + 42                           <!-- response: BCD: 253 + 4142 -->
   ```
   x xxx1   0 0000    <!-- response: carries -->
     0001     1000    <!-- response: op1 encoding -->
     0100     0010    <!-- response: op2 encoding -->
    -----    -----
   y yyyy   0 1010    <!-- response: sum encoding -->

   x xxxx   1 1100    <!-- response: corrective step carries -->
   y yyyy   0 1010    <!-- response: sum encoding -->
     0xx0     0110    <!-- response: corrective step -->
    -----    -----
   c xxxx   1 0000    <!-- response: final sum -->
   ```

 











---
## Resources
   1. Base64 Lookup Table:
      * https://docs.google.com/spreadsheets/d/1Jlo2GmWvl4bxlPN9GzXsKnl4acyppBWYQjX2S_Bm9oQ/edit#gid=0
   1. Base64 Encoding Slides: https://docs.google.com/presentation/d/1xQtJqJ7HrvDOfQtq1JYljzXWPMRUIWeQyUOHiz4uEV4/edit


## Notes
