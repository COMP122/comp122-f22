# COMP122 Lecture Notes: October 5 & 6, 2022

## Announcements
   1. 41-echo: Due Sunday night Oct 9
   1. Note the notational difference in TAC -> MIPS table

## Today's Agenda
   1. Review outstanding questions

   1. Recap from M/T
      1. Goal: Write a MIPS program
         1. Zero, build a model of what your are doing
         1. First, write each subroutine in a high-level language
         1. Second, convert to TAC
         1. Third, convert to MIPS
         * After Practice, you can collapse steps

      1. Introduce MIPS-122 with TAC
         - only two data types:
           * integers  (note pointers/reference)
           * arrays of integers

      1. Bookkeeping
      1. Translation:  TAC -> MIPS
      1. Convention for:
         - return values for subroutines
         - passing in arguments
         - use of the $sp and $ra registers

      1. Loops in MIPS
      ---

   1. Accessing an Array

   1. Processing of the argv Data Structure

   1. Echo Program


## Questions
   1. M/W M:
      - 
   1. M/W A:
      - 
   1. T/R M: 
      -
   1. T/R A: 
      - 


---
# Today's Material
  1. See 10_05/

## MIPS-122 ISA:
   * TAC Instructions and corresponding subset MIPS Instructions

     1. Instructions
      - virtual registers: a, b, etc.  (name starts with a lowercase)
      - physical registers: $t0, $t1, etc.
      - memory references
        - text reference: label
        - data references: A, B, etc. (name starts with uppercase)
      - `<cond>`:  <, <=, ==, !=, >=, >
  
      | TAC Instruction               | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `nop`                         | `nop`                     |
      | `x = [ a \| imm ]`            | `li, move`                |
      | `x = a [+\|-] [ b \| imm ]`   | `add, sub, addi, subi`    |
      | `x = a * b`                   | `mul`                     |
      | `x = a >> imm`                | `srl`                     |
      | `if  a <cond> b, goto label`  | `b<cond> a, b, label`     |
      | `if! a <cond> b, goto label`  | `b<! cond>, a, b, label`  |
      | `goto label`                  | `b label`                 |
      | `x = & A`                     | `la x, A`                 |
      | `x = (* a)`                   | `lb x, 0(a)`              |
      | `call label`                  | `jal label`               |
      | `return`                      | `jr $ra`                  |
      |                               |                           |
      | `for(; a <cond> b ;)`         | `b<! cond>, a, b, label`  |
      | `continue label`              | `b label`


## Loops

  1. Example:  Multiplication via successive additions

   ```java
   product = 0;
   for ( i = 1 ; i <= b ; i ++ ) {
     product = product + a;
   }
   result = product;
   ```

  1. Issues:
     * Problem 6: Need to break down the semantics of the for-loop
     * Problem 7: Need reduce the number of jumps

  ```java
         product = 0;
         i = 1; 
   top:  for (; i <= b ;) {          
           product = product + a;

           i ++;

           continue top;
         }
   done: ;
         result = product;
   ```


   ```TAC
            product = 0;
            i = 1; 
   top:     if! i <= b , done
               product = product + a;
     
               i = i + 1;

               goto top; 
   done:    ;
            result = product;
   
   ```


   1. Accessing an Array

   1. Processing of the argv Data Structure




---
## Resources
   * 41-echo
   * git cheatsheet

