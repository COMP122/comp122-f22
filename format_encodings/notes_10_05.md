# COMP122 Lecture Notes: October 5 & 6, 2022

## Announcements
   1. 41-echo: Due Sunday night Oct 9
   1. Note the notational difference in TAC -> MIPS table
   1. "One Markdown.app" ?

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
           * integers  (note: address == integers)
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
      - Please go over marshaling and de-marshaling
   1. M/W A:
      - Are there any other registers in MIPS?
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
      | `<null>`                      | `nop`                     |
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
      | `for(; a <cond> b ;)`         | `b<! cond> a, b, label`   |
      | `continue label`              | `b label`                 |

      | `TAC <cond>` | `MIPS <cond>` |
      |--------------|---------------|
      | `<`          | `lt`          | 
      | `<=`         | `le`          | 
      | `!=`         | `ne`          | 
      | `==`         | `eq`          | 
      | `>=`         | `ge`          | 
      | `>`          | `gt`          | 


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
   top:     for (; i <= b ;) 
               product = product + a;
     
               i = i + 1;

               continue top; 
   done:    ;
            result = product;
   
   ```


   1. Accessing an Array
      * Consider the following Java version
        ```java
           sum = 0;
           for ( i = 0 ; i < A.length ; i ++ ) {
             sum += A[i];
           }
           result = sum;
        ```

      * A Simplified Java Version
        ```java
                  sum = 0;

                  length = A.length;
                  ref_A = A;

                  i = 0;
           bob:   for (; i < length ;) {
                    sum = sum + ref_A[i];
         
                    i = i + 1;
                    continue bob;
                  }
           mary:  ;
                  result = sum;
        ```

       ```C
                  sum = 0;

                  length = A.length;
                  ref_A = &A;

                  i = 0;
           bob:   for (; i < length ;) {
                    value = (* ref_A);
                    sum = sum + value;
         
                    ref_A = ref_A + 1;
                    i = i + 1;
                    continue bob;
                  }
           mary:  ;
                  result = sum;
        ```


      ```mips
         # Register allocation
         # t0: sum
         # t1: length
         # t2: ref_A
         # t3: i
         # t4: result
         # t5: value
         # t6: 
                              #           sum = 0;
                              #
                              #           length = 5;
              la  $t2, A      #           ref_A = &A;
                              #
                              #           i = 0;
      bob:                    #    bob:   for (; i < length ;) {
                              #             value = (* ref_A);
              lb $t5, 0($t2)  #             sum = sum + value;
                              #  
                              #             ref_A = ref_A + 1;
                              #             i = i + 1;
                              #             continue bob;
                              #           }
      mary:                   #    mary:  ;
                              #           result = sum;
      ```


   1. echo program


   1. Processing of the argv Data Structure


   1. Revised OS Interface:  via macros define in "syscalls.s"
       - print_d  _reg_   # print a decimal value, value is in _reg_
       - print_s  _reg_   # print a string, address is in _reg_
       - print_ci _imm_   # print a char, the value is _imm_
       - exiti _imm_      # exit with a value, the value is _imm_



---
## Resources
   * 41-echo
   * git cheatsheet

