# COMP122 Lecture Notes: October 2 & 3, 2022

## Announcements
   1. Graded: 21-table-encodings
   1. Assignments:
      - 22-utf-encoding: Due Monday Oct 4
      - 41-echo: Due Sunday night Oct 9

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
         - reduced number of data types
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
      - superfluous zeros
      - checksum at layer three, how does it work
   1. T/R A: 


---
# Today's Material
  1. See 10_03/

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
      | `x = (* A)`                   | `lb x, 0(A)`              |
      | `call label`                  | `jal label`               |
      | `return`                      | `jr $ra`                  |

## TAC: simple constant calculation
  1. Example
     - x = 1 + 2 * 3 + 4
     * Problem 1: Where do I put things?
     * Problem 2: Where to do we place the results

  1. TAC -> MIPS

  ```

  start:    nop      # x = 1 + (2 * 3) + 4

            # Register allocation
            # t0: a
            # t1: b
            # t2: c
            # t3: d

            li $t0, 2            # a = 2
            li $t1, 3            # b = 3
            mul $t2, $t0 , $t1   # c = a * b
            addi $t3, $t2, 1     # d = c + 1
            addi $v0, $t3, 4     # x = d + 4


  end:      exit

  ```

## Providing Inputs 
  1. Example
     * area of a trapezoid
     * area = 1/2 * (height * base * top)
      
  1. Issues:
     * Problem 3: 1/2 is not integer
     * Problem 4: We don't have a divide operation
     * Problem 5: Where to do we place the inputs?

  1. TAC => MIPS

  ```
  start:    nop            # a = (h * b * t) >> 1

            # Arguments
            # v0: a
            # v1: --
            # a0: h
            # a1: b
            # a2: t
            # a3: --

            # Register allocation
            # t0: h
            # t1: b
            # t2: t
            # t3: x
            # t4: y

            # De-marshal my inputs
            move $t0, $a0
            move $t1, $a1
            move $t2, $a2

            mul $t3, $t0, $t1       # x = h * b
            mul $t4, $t3, $t2       # y = x * t
            srl $t5, $t4, 1         # a = y >> 1


            # Marshal return value

            move $v0, ?
  end:      exit
  ```


## Creating a subroutine
  1. Put the first two things together!

  1. Prototype:
     - int trap_a(int h, int b, int t);

  1. Calling a subroutine
     - x = trap_a( 1, 4+2, 3) + trap_a(3, 5, 2);

     ```

        # Register allocation
         # t0: 1 
         # t1: 4+2
         # t2: 3
         # t3: 3
         # t4: 5
         # t5: 2
         # t6: trap_a ( 1, 4+2, 3)
         # t7: trap_a(3, 5, 2)
         # t8: x

     li $t0, 1
     li $t1, 4
     addi $t1, $t1, 2
     li $t3, 3

     # marshall the arguements
     move $a0, $t0
     move $a1, $t1
     move $a2, $t2


     # make the call
     jal trap_a                    # call trap_a

     # demarshal the return values
     move $t6, $v0

     # now fill in the rest of the code

     ```

   1. MIPS subroutine for trap_a
   ```mips
      trap_a:     nop            # int trap_a(int h, int b, int t);
      
                  # Arguments
                  # v0: a
                  # v1: --
                  # a0: h
                  # a1: b
                  # a2: t
                  # a3: --
      
                  # Register allocation
                  # t0: h
                  # t1: b
                  # t2: t
                  # t3: x
                  # t4: y
      
                  # De-marshal my inputs
                  move $t0, $a0
                  move $t1, $a1
                  move $t2, $a2
      
                  # a = (h * b * t) >> 1
                  mul $t3, $t0, $t1       # x = h * b
                  mul $t4, $t3, $t2       # y = x * t
                  srl $t5, $t4, 1         # a = y >> 1
      
      
                  # Marshal return value
      
                  move $v0, $t5
        end:      jr $ra                  # return
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
   ```


   ```mips 
   ```




---
## Resources
   * 41-echo
   * git cheatsheet

