# COMP122 Lecture Notes: Nov 28 and 29, 2022


## Announcements
   1. We are fast approaching the end of the semester
      - stay tuned for information about Exam #4

   1. Assignment: 44-reverse-string-java
      - Write three Java subroutines, using a style that is simplified or TAC Java
        * int strchr(char[] A, char c): 
          - locate a character within a ~~string~~ character array
        * int strrev(char[] A, char c): 
          - prints a ~~string~~ character array in reverse -- starting from c
        * char[] strrcpy(char[] A, char[] B, char c)
          - copies ~~string~~ array B in reverse onto the end of A

   1. Assignment: 45-reverse-string-mips
      - Write one MIPS subroutine
        * int strchr(char* A, char c): 
          - locate a character within a ~~string~~ character array

      - Write two additional MIPS subroutines
        * int strrev(char* A, char c): 
          - prints a string character array in reverse -- starting from c
        * char* strrcpy(char* A, char* B, char c)
          - copies string B in reverse onto the end of A



## Today's Agenda
   1. Memory and Alignment (notes & slide)
   1. strchr in Java (notes)
   1. TAC:
        - Memory Operations
        - While loop
        - If-then-else
   1. String Processing (slides)
   1. Time for Lab / Questions


  
## Questions
   1. M/W M: 
      - none
   1. M/W A:
      - none
   1. T/R M:
      - none
   1. T/R A:


## Today's Material
1. Memory Declarations

   ```mips
   A:   .asciiz "This is a string!"
        .align 2
   H:   .half  0xBEEF 
   ```

1. strchr: locate a character within a string
   - practicum   

1. Memory Operations:

   | TAC Instruction               | MIPS Instruction          |
   |-------------------------------|---------------------------|
   | `x = A[imm];`                 | `la a, A`                 |
   |                               | `lw x, imm(a)`            |
   | `x = A[v];`                   | `la a, A`                 |
   |                               | `add a, a, v`             |
   |                               | `lw x, 0(a)`              |
   | `A[imm] = x;`                 | `la a, A`                 |
   |                               | `sw x, imm(a)`            |
   | `A[v] = x;`                   | `la a, A`                 |
   |                               | `add a, a, v`             |
   |                               | `sw x, 0(a)`              |    
   | `x = & A;`                    | `la x, A`                 |
   | `x = (* a);`                  | `lw x, 0(a)`              |
   | `(* a) = x;`                  | `sw x, 0(a)`              |

   - if-then-else and while-loop patterns
                 
    ```java
          if ( a != b ) {           
    cons:   ;  
            // <body> 

            // break skip;              
          }                   
          else { 
    alt:    ;                                
            // <body>

            // break skip;              
          }                  
    skip: ; 
    ```                        

    ```java
    loop:  while  (a <= b) {
             // <body>

             continue loop;
           }
    done:  ;
    ```



---
## Resources
   * ![Memory Alignment](https://docs.google.com/spreadsheets/d/1iweUQVFsHa2tF6ETj5bGEEjKRG5sp9eGgeLJ2OEx3sU/edit#gid=0)
   
   * TAC2MIPS.md

   * ![String Processing](https://docs.google.com/presentation/d/1fg9BuWtyZ9PARK0gDE5ZcbjOiudRSrVP2s1iuSIDYXw/edit#slide=id.g199d0a137fe_0_29)
 

## Notes



