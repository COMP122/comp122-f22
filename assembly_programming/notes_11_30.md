# COMP122 Lecture Notes: Nov 30 and Dec 1, 2022


## Announcements
   1. We are fast approaching the end of the semester
      1. Today's Lecture
         - Main material:  Stack, Frames, Subroutines, and Macros
         - Quick Run through of Subroutine Transitioning
      1. M/T's Lecture 
         - Second Reading of Subroutine Transitioning
           - By this point, you have finished
             * finished: 44-char-array-java
             * finished: Part 1 of 45-strings-mips
             * Actively working on: Part 2&3 of 45-strings-mips
      1. W/R is the inclass final 


## Today's Agenda
   1. Stack Operations
   1. Frames
   1. Subroutine and Macros
   1. First Reading of: Subroutine Transitioning


  
## Questions
   1. M/W M:
      - none 
   1. M/W A:
      - none
   1. T/R M:
      - how to get the length of a string...call the strchr subroutine
   1. T/R A:
      - what's on the test


## Today's Material


1. Additional Provided Macros
   * .include "macros/subroutine.s"
   * .include "macros/stack.s"

   | macro              | Description                                                   |
   |--------------------|---------------------------------------------------------------|
   | push_args [...]    | Marshals each of the actual arguements                        |
   |                    |   - First four arguements are placed into $a0..$a3            |
   |                    | Subsequently aruements are pushed onto the stack              |
   | pop_results [...]  | Demarshals the return values                                  |
   |                    |   - i.e., moves the values from $v0 to specified register     |
   | push r0 [...]      | Pushes each of named registers, left -> right, onto the stack |
   | pop  r0 [...]      | Pops each of named registers, right -> left, from the stack   |
   |                    |                                                               |
   | push_t_registers   | Pushes all the `t` registers onto the top of the stack        |
   | pop_t_registers    | Pops all the `t` registes from the top of the statck          |


1. Usage of Macros:
   * index = strchr(A, c);    # length = strchr(A, '\0');   // == strlen(A)

   ```mips
   # index = strchr(A, c);
   push_args $t0, $t1         # Marshal the actual arguments
   push_t_registers           # Save my T registers
   push $ra, $sp, $fp         # Save return address,and my frame information              
   jal strchr                 
   pop $ra, $sp, $fp
   pop_t_registers
   pop_results $t2
   ```



---
## Resources
   * Stack, Frames, Subroutines, Macros: https://docs.google.com/presentation/d/1RACq-1VESmSazD1RWuBwN6UwIZqg-QMH5Ng2sQ4NMQM/edit#slide=id.gd743544067_4_204

   * Subroutine Transitioning: https://docs.google.com/presentation/d/15Uwj3w_5gF_1nm0jX3-9TTRPdEJrHswXCzmlD73UZhk/edit#slide=id.gd743544067_0_0 
 

## Notes



