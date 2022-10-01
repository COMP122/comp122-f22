# Concepts for the day:
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
     - Transformation into Process
       - Three Address Code (TAC)
       - MIPS

  1. Accessing an Array

  1. Processing of the argv Data Structure


---
## MIPS-122 ISA:

MIPS-122 is just a simplified version of MIPS. Moreover, we provide a set of corresponding Three Address Code (TAC) statements for a subset of instructions.

  * TAC Instructions and corresponding subset MIPS Instructions
  
     1. Instructions
        - virtual registers: a, b, etc.  (name starts with a uppercase)
        - physical registers: $t0, $t1, etc.
        - memory references
          - text reference: label
          - data references: A, B, etc. (name starts with uppercase)
        - `<cond>`:  <, <=, ==, !=, >=, >
  
     |-------------------------------|---------------------------|
     | TAC Instruction               | MIPS Instruction          |
     |-------------------------------|---------------------------|
     | `nop`                         | `nop`                     |
     | `x = [ a | imm ]`             | `li, move`                |
     | `x = a [+|-] [ b | imm ]`     | `add, sub, addi, subi`    |
     | `x = a * b`                   | `mul`                     |
     | `x = a >> imm`                | `srl`                     |
     | `if  a <cond> b, goto label`  | `b<cond> a, b, label`     |
     | `if! a <cond> b, goto label`  | `b<! cond>, a, b, label`  |
     | `goto label`                  | `b label`                 |
     | `x = & A`                     | `la x, A`                 |
     | `x = (* a)`                   | `lb x, 0(a)`              |
     | `call label`                  | `jal label`               |
     | `return`                      | `jr $ra`                  |
     |-------------------------------|---------------------------|
  
     | `x = (* a)`                   | `lb x, 0(a)`              |
  
    1. Data types:
       - integers: 0-255 (0 .. 2^8 -1)
    1. Registers:  
       - 8 bits wide
       - $t0, $t1, $t2, $t3, then growing as needed
    1. Memory:
       - addressable: byte
       - only .text, data, stack
    1. OS Interface
       - exit  
  
---
## TAC: simple constant calculation
  1. Example
     - x = 1 + 2 * 3 + 4
     - x = 1 + (2 * 3) + 4

  1. Rewrite in Three Address Code (TAC)
     ```
     start: nop
              a = 1
              b = 2
              b = b * 3
              c = 4
              x = a + b
              x = a + c
     end:   exit
     ```
 
  1. Reframe into ISA instructions 
     * Problem 1: Where do I put things?
     * Solution 1: Perform Register Allocation with bookkeeping
       ```
       # t0: a
       # t1: b
       # t2: c
       # t3: x
       ```

     * Problem 2: Where to do we place the results
     * Solution 2: Place it in a well known place
         - top of the stack
         - defined register: $v0
         ```
         $v0 = $t3
         ```

     * Restructured TAC code
       ```
       start: nop
              # t0: a
              # t1: b
              # t2: c
              # t3: x

              a = 1
              b = 2
              b = b * 3
              c = 4
              x = a + b
              x = a + c
       end:   exit
       ```
  1. Write the MIPS code
     ```
     ```

---
## Providing Inputs 
  1. Example
     * area of a trapezoid
     * area = 1/2 * (height * base * top)
      
  1. Issues:
     * Problem 3: 1/2 is not integer
     * Solution 3: use communicative property
       - area = (height * base * top) / 2

     * Problem 4: We don't have a divide operation
     * Solution 4:
       - x >> 1
       - area = (height * base * top) >> 1

  1. Rewrite in Three Address Code
     ```
     x = height
     x = x * base
     x = x * top
     y = 1
     y = x >> y
     area = y
     ```

    * Reframe into ISA instructions
      - Perform Register Allocation
      - Place the results
      ```
      # v0: area

      # t0: x
      # t1: y
      # t2: a

      ```

     * Problem 5: Where to do we place the inputs?
     * Solution 5: Place them in a well known place
         - top of the stack, 
         - defined registers: $a0, $a1, $a2, $a4
         ```
         # a0: height
         # a1: base
         # a2: top
         ```

   * Write the MIPS code:
     ```
     ```

---
## Creating a subroutine
  1. Put the first two things together!
     - handling inputs
     - placing your output

  1. Construct the framework
     * Prototype:
       - int routine(int a, int b);
     * framework
       ```
       routine: nop 
                   # Formal Arguments
                   # a0: a
                   # a1: b
                   # a2: --
                   # a3: --
                   # v0: <return value>
  
                   # Register Allocation
                   #
    
                   nop               # do some cool stuff
  
                   $v0 = $<return value>
                return               
       ```

   1. Now consider a multiple calls to "routine"
      ```java
        int function F(int a, int b, int c) {
          answer = routine(b, a) + routine(a, c)
          return answer;
        }
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

  1. Issues
     * Problem 6: Multiple return locations:
     * Solution 6: Introduce $ra register
       - explain ``jal`` command

     * Problem 7: Our input variables are over written
       - the values of $a0, $a1 are reused
     * Solution 7: De-marshal inputs, Marshal the output
       - That is to say: 
         - allocate a unique register for these values
         - reposition at the start/end of the subroutine

  1. Write the MIPS code:
     ```
     ```
---

## Iteration via a For Loop

  1. Consider Multiplication via successive additions
     * Java implementation
       ```java
       product = 0;
       for ( i = 1 ; i <= b ; i ++ ) {
         product = product + a;
       }
       result = product
       ```

     * A simplified Java implementation
       ```java
       product = 0; 
       i = 1;                               // Initialize Loop
       for (; i <= b ;) {                   // Perform Boolean Test
   
         product = product + a;             // Body of Loop
   
         i ++;                              // Perform Loop Update
       }
       result = product;
       ```

  1. Transform into simplified Java into TAC
     ```
            product = 0
            i = 0           	          # Initialize Loop
     top:   nop        
 
            if i < b, goto body           # Perform Boolean Test
            goto done
     body:    nop
       
              product = product + a;      # Body of Loop
       
              i = i + 1                   # Perform Loop Update
              goto top
     done:  nop

            result = product
     ```

  1. Flip Conditional and Transform into TAC
     - use the `if! <cond>, goto label` transformation
     ```
            i = 0           	          # Initialize Loop
     top:   nop        
            if i >= b, goto done          # Perform Boolean Test

              product = product + a;      # Body of Loop
         
              i = i + 1                   # Perform Loop Update
              goto top
     done:  nop

            result = product
       ```

  1. Write the MIPS code fragment
     ```
     start:
               # Register Allocation


     end:
     ```
  
## Accessing an Array

  1. Reduction of an Array via Addition
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
       for (; i < length ;) {
       	 value = ref_A[i];
         sum += value;

         i++;
       }
       result = sum;
       ```

  1. Depiction of the Array of Integers

     ![An an Array of Integers](/integer_array.png)

    * Revised Algorithm to walk an array via a pointer

    * A simplified C version
       ```C
       sum = 0;

       length = <size of A>;                # Length has to be provided
       pointer_A = &A;

       i = 0;
       for (; i < length ;) {
       	 value = (* pointer_A);
         sum += value;

         pointer_A ++;

         i ++; 
       }
       result = sum;
       ```

  1. Transform into TAC code
     ```
            sum = 0

            length = <size of Array> 
            pointer_A = &A

            i = 0           	            
     top:   nop        
   
            if i >= length, goto done        
              value = (* pointer_A)
              sum = sum + 1
             
              pointer_A = pointer_A + 1

              i = i + 1                      
              goto top
     done:  nop
     result = sum
     ```

  1. Write the MIPS code fragment
     ```
     start:
               # Register Allocation


     end:
     ```

## Processing of the argv Data Structure
  1. Update the ISA
     - Instruction now includes
       - `x = (* a)`  => `lw x, 0(a)`

     - Data types:
       - integers: 0-255 (0 .. 2^8 -1)
       - addresses: 0 .. 2^32-1 

     - Registers:  
       - 8 => 32 bits wide

     - OS Interface:  via macros define in "syscalls.s"
       - print_d  _reg_   # print a decimal value, value is in _reg_
       - print_s  _reg_   # print a string, address is in _reg_
       - print_ci _imm_   # print a char, the value is _imm_
       - exiti _imm_      # exit with a value, the value is _imm_

  1. Framework of the main subroutine
     ```
     int main( int argc, char * argv[]) {

       exit(0);     # java.lang.System.exit() 
     }
     ```

  1. Depiction of the argv Data Structure
     ![The argv Data Structure](/argv.png)

  1. Processing of argv via TAC
      ```
      main:   nop

              length = argc
              pointer_A = argv                 # argv is already an address

              i = 0           	               
      top:    nop        
   
              if i >= length, goto done        
                str = (* pointer_A)           # str is  an address 
                
                # do some processing on the string
             
                pointer_A = pointer_A + 4     # addresses are 4 bytes

                i = i + 1                      
                goto top
      done:   nop
      ```

   1. Process of arv in MIPS
      - This is your assignment!
      ```
              .data
              .text
              .globl main
              .include "syscalls.s"

      main:   nop
              # Formal Arguments
              # a0: 
              # a1: 
              # a2: 
              # a3: 
              # v0: 

              # Register Allocation

              # De-marshal Inputs

              #################
              # The body



              #################
              # Marshal Output
              move $v0, $<return>
              exiti 0

      ```