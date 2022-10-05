# COMP122 Lecture Notes: October 3 & 4, 2022

## Announcements
   1. Graded: 21-table-encodings
   1. Assignments:
      - 22-utf-encoding: Due Monday
      - 41-echo: Due Sunday night

## Today's Agenda
   1. Review outstanding questions

   1. Concepts for the day:
      1. Introduce MIPS-122 with TAC

      1. TAC: simple constant calculation
         - Register Allocation (& Bookkeeping)
         - Providing the Result of a Calculation

      1. Providing Inputs
         - Code transformation
         - Well-known places

      1. Creating a Subroutine
         - Introduce Linkage between Subroutines
         - Marshaling

      1. Iteration via a For Loop
         - Multiplication via Successive Addition: Java Implementation
         - Transformation Process into:
           - Three Address Code (TAC)
           - MIPS

      1. Accessing an Array

      1. Processing of the argv Data Structure


## Questions
   1. M/W M:
      - Scientific Notation: why in this class
      - git diff
      - spacing conventions and why

   1. M/W A:
   1. T/R M: 
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
      | `x = (* a)`                   | `lb x, 0(a)`              |
      | `call label`                  | `jal label`               |
      | `return`                      | `jr $ra`                  |

## TAC: simple constant calculation
  1. Example
     - x = 1 + 2 * 3 + 4
     * Problem 1: Where do I put things?
     * Problem 2: Where to do we place the results


## Providing Inputs 
  1. Example
     * area of a trapezoid
     * area = 1/2 * (height * base * top)
      
  1. Issues:
     * Problem 3: 1/2 is not integer
     * Problem 4: We don't have a divide operation
     * Problem 5: Where to do we place the inputs?

```TAC

start: nop
       # a0: height
       # a1: base
       # a2: top
       # a3: --
       # v0: area
       # v1: --

       t0 = h
       t1 = b
       t0 = t0 * t1
       t2 = top
       t0 = t0 * t2
       area  = t0 >> 1
```

```mips

start: nop
       # a0: height
       # a1: base
       # a2: top
       # a3: --
       # v0: area
       # v1: --

       # t0: h, h*b, h*b*t
       # t1: b
       # t2: t
       # t3: --

start: nop
       move $t0, $a0                   # t0 = h
       move $t1, $a1                   # t1 = b
       mult $t0, $t0, $t1              # t0 = t0 * t1
       move $t2, $a2                   # t2 = top
       mult $t0, $t0, $t2              # t0 = t0 * t2
       srl  $v0, $t0, 1                # area  = t0 >> 1

end:   exit
```




## Creating a subroutine
  1. Put the first two things together!

  1. Issuse
     * Problem 6: Multiple return locations:
     * Problem 7: Our input variables are over written

  1. Prototype
     ```java
        int function F(int a, int b, int c) {
          answer = routine(b, a) + routine(a, c)
          return answer;
     ```

  1. Convert into TAC Code
       ```
       F:    nop
               # Formal Arguments
               # a0: a
               # a1: b
               # a2: c
               # a3: --
               # v0: answer

               # Register Allocation
               # t0 : a
               # t1 : b
               # t2 : c
               # t3 : x
               # t4 : y

               # De-marshal
               move $t0, $a0
               move $t1, $a1
               move $t2, $a2

    
               #--- routine(b,a)
               $a0 = b
               $a1 = a
               call routine
               x = $v0
               #-------

               #--- routine(a,c)
               $a0 = a
               $a1 = c
               call routine
               y = $v0
               #--------

               answer = x + y
               $v0 = answer
               return
       ```


```
routine:   nop
           # Formal Arguments
           # a0: a
           # a1: b
           # a2: --
           # a3: --
           # v0: <return value>

           # Register Allocation
           #

           # cool stuff

           move $v0, $<return value>

           return   #jr $ra
```



### Loop: a * b
   ```java
     product = 0;
     for ( i = 1 ; i <= b ; i ++ ) {
       product = product + a;
     }
   result = product
   ```


   ```java
     product = 0;
     i = 1; 
top: for (; i <= b ;) {
       product = product + a;

       i ++;
     }
done: nop
   result = product
   ```

   ```TAC
       product = 0;
       i = 1;

top:   if! i <= b, goto done
         product = product + a;

         i = i + 1;
       goto top

   ```



---
## Resources
   * 41-echo
   * git cheatsheet

