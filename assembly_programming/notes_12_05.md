# COMP122 Lecture Notes: Dec 5 and Dec 6, 2022


## Announcements
   1. W/R is the in-class exam for the Assembly Language Section
      - Will you be required to write code?
        * Yes, in the form of code snippets, e.g., macros

   1. Grading of the following has been completed
      1. 20-exam-formats
      1. 30-quiz-digital-logic
      1. 41-echo
      1. 42-kickstart


## Today's Agenda
   1. Practicum atoi
   1. Second Reading of: Subroutine Transitioning


  
## Questions
   1. M/W M: 
      - What are the S registers for?
      - How do you get the length of the string?
      - How do you create an array
        ```mips
            .data
            .align 2
        R:  .space 256

            .text
        ```

   1. M/W A:
      - none


   1. T/R M:
   1. T/R A:


## Today's Material
   <!-- which is all review -->
   1. man atoi:  convert ASCII string to integer

   1. Examples:
      ```cli
      $ mips_subroutine "123"
      123
      ```
      ```cli
      $ mips_subroutine "123garbage"
      123
      ```

   1. Computation:
      - value = value * base + digit 

   1. Method Signature:
      - C: `atoi(const char *str)`
      - Java: `Integer.parseInt(String str)`

   1. Steps:
      1. Write main subroutine to call `atoi`
         1. precall
         1. call
         1. postcall
      1. Write `atoi` subroutine
         1. setup
         1. compute
         1. cleanup

   * See addendum files...

---
## Resources
 
   * In your repos: `mars-mips/programs/macros/*.s`
   * Subroutine Transitioning: https://docs.google.com/presentation/d/15Uwj3w_5gF_1nm0jX3-9TTRPdEJrHswXCzmlD73UZhk/edit#slide=id.gd743544067_0_0 
 

## Notes
















