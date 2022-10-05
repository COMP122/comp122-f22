# COMP122 Lecture Notes: October 3 & 4, 2022

## Announcements
   1. Graded: 21-table-encodings
   1. Assignments:
      - 22-utf-encoding: Due Monday
      - 41-echo: Due Sunday night

## Today's Agenda
   1. Review outstanding questions

   1. Goal: Write a MIPS program
      1. First write each subroutine in a high-level language
      1. Second, convert to TAC
      1. Third, convert to MIPS
      * After Practice, you can collapse steps


   1. Concepts for the day:
      1. Introduce MIPS-122 with TAC
         - reduced number of instructions
         - reduced number of data
         types
           * integers
           * arrays of integers

      1. TAC: simple constant calculation
         - Register Allocation (& Bookkeeping)
         - Providing the Result of a Calculation

      1. Providing Inputs
         - Well-known places

      1. Creating a Subroutine
         - Introduce Linkage between Subroutines
         - Marshaling

      1. Iteration via a For Loop
         - Multiplication via Successive Addition: Java Implementation
         - Transformation Process into:
           - Three Address Code (TAC)
           - MIPS
---
      1. Accessing an Array

      1. Processing of the argv Data Structure


## Questions
   1. M/W M:
      - Scientific Notation: why in this class?
      - What is the command to compare files:
        * git diff file1 [commit_hash]
        * diff file1 file2
      - Why the spacing in the UTF-8 answers.md
   1. M/W A:
      - Nothing!
   1. T/R M: 
   1. T/R A: 


---
# Today's Material
  1. See 10_03/

## MIPS-122 ISA:
   * TAC Instructions and corresponding subset MIPS Instructions

     1. Instructions
      - virtual registers: a, b, etc.  (name starts with a uppercase)
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

## TAC: simple constant calculation
  1. Example
     - x = 1 + 2 * 3 + 4
     * Problem 1: Where do I put things?
     * Problem 2: Where to do we place the results
   ```

   start:  nop

           # t0: a
           # t1: b
           # t2: c
           # t3: d
           # t4: x

           li $t0, 2           # a = 2 
           li $t1, 3           # b = 3
           mult $t2, $t0, $t1  # c = a * b
           addi $t3, $t2, 1    # d = c + 1
           addi $t3, $t3, 4    # d = d + 4
           move $t4, $t3       # x = d

           move $v0, $t4
   end:    nop

   ```

## Providing Inputs 
  1. Example
     * area of a trapezoid
     * area = 1/2 * (height * base * top)
      
  1. Issues:
     * Problem 3: 1/2 is not integer
     * Problem 4: We don't have a divide operation
     * Problem 5: Where to do we place the inputs?

```mips

start:   nop
         # Arguments
         # v0: a
         # v1: --
         # a0: h
         # a1: b
         # a2: t
         # a3: --

         # Register allocation
         # t0: a
         # t1: h
         # t2: b
         # t3: t
         # t4: x
         # t5: y
         # t6: z

         # De-marshal your inputs
         move $t1, $a0
         move $t2, $a1
         move $t3, $a2

         # insert the body
         move $t4, $t1           # x = h
         move $t5, $t2           # y = b
         mult $t4, $t4, $t5      # x = x * y
         move $t6, $t3           # z = t
         mult $t4, $t4, $t6      # x = x * z
         srl  $t4, $t4, 1        # x = x >> 1
         move $t0, $t4           # a = x

         # Marshal your outputs
         move $v0, $t0
end:     exit
```



## Creating a subroutine
  1. Put the first two things together!

  1. Prototype:
     - int trap_a(int h, int b, int t);

     - call to "trap_a(1, 2, 3)"
     ```

     ```

```mips

trap_a:   nop             #  int trap_a(int h, int b, int t);

         # Arguments
         # v0: a
         # v1: --
         # a0: h
         # a1: b
         # a2: t
         # a3: --

         # Register allocation
         # t0: a
         # t1: h
         # t2: b
         # t3: t
         # t4: x
         # t5: y
         # t6: z

         # De-marshal your inputs
         move $t1, $a0
         move $t2, $a1
         move $t3, $a2

         # insert the body
         move $t4, $t1           # x = h
         move $t5, $t2           # y = b
         mult $t4, $t4, $t5      # x = x * y
         move $t6, $t3           # z = t
         mult $t4, $t4, $t6      # x = x * z
         srl  $t4, $t4, 1        # x = x >> 1
         move $t0, $t4           # a = x

         # Marshal your outputs
         move $v0, $t0
         jr $ra                  # return
```






## Loops

  1. Example:  Multiplication via successive additions

   ```java
   product = 0;
   for ( i = 1 ; i <= b ; i ++ ) {
     product = product + a;
   }
   result = product
   ```

  1. Issues:
     * Problem 6: Need to break down the semantics of the for-loop
     * Problem 7: Need reduce the number of jumps

   ```java
          product = 0;
          i = 0;
    top:  for (; i <= b ;) {
            product = product + a;
    
            i++;
          }
    done: ;
          result = product
   ```


   ```mips
            # t0: product
            # t1: i
            # t2: b
            # t3: a
            # t4: result

            move $t0, $zero              #       product = 0;
            li $t1, 0                    #       i = 0;
      top:  ble $t1, $t2, body           ## top:  for (; i <= b ;) {
                                         #  top:  if i <= b, goto body
            b done                       #           goto done

      body:                              #
            add $t0, $t0, $t3            # product = product + a;

            addi $t1, $t1, 1             #         i++;
            goto top                     #       }

      done: nop                          # done: ;
            move $t4, $t0                #       result = product
   ```

   ```
            move $t0, $zero              #       product = 0;
            li $t1, 0                    #       i = 0;
      top:  bgt $t1, $t2, done           ## top:  for (; i <= b ;) {
                                         #  top:  if! i <= b, done {
              add $t0, $t0, $t3          #         product = product + a;

              addi $t1, $t1, 1           #         i++;
            goto top                     #       }
            
      done: nop                          # done: ;
            move $t4, $t0                #       result = product
   ```



---
## Resources
   * 41-echo
   * git cheatsheet

