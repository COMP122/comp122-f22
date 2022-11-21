# COMP122 Lecture Notes: Nov 20 and 20, 2022


## Announcements
   1. Assignment: 43-binary32 released
      - due: Tuesday, Nov 22, 2022  @ 11:59 PM

   1. Regrade Considerations of: 23-, 24-, 25-, 31- 
      - all should have been requested last week, but ...
      - all MUST be in Tuesday, Nov 22, 2022 @ 11:59
      - you must follow the process as defined in the previous announcement
        * i.e., the process is enumerated within Nov 14 and 15 notes.

   1. Assignment: 44-reverse-string being prepared
      - Write three Java programs, using JAVA TAC
        * int strchr(String A, char c): 
          - locate a character within a string
        * int strrev(String A, char c): 
          - prints a string in reverse -- starting from c
        * String A strrcpy(String A, String B, char c)
          - copies string B in reverse onto A

   1. W/R: No class --- Thursday is thanksgiving

   1. M/T: 
      - Tuesday Morning -- no, class: Prof is otherwise occupied
      - Tuesday Afternoon -- under advisement


## Today's Agenda
   ~1. Memory and Alignment (notes & slide)~
   ~1. strchr in Java (notes)~
   ~1. TAC: ~
   ~   - Memory Operations~
   ~   - While loop~
   ~   - If-then-else~
   ~1. strchr in Java (slides)~
   1. Time for Lab / Questions
  
## Questions
   1. M/W M: 
   1. M/W A:
   1. T/R M:
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
                                 
            // break skip;              
          }                  
    skip: ; 
    ```                        

    ```java
    loop:  while  (a <= b) {
             // <body>

             continue loop;
           }
   ```



---
## Resources
   * ![Memory Alignment](https://docs.google.com/spreadsheets/d/1iweUQVFsHa2tF6ETj5bGEEjKRG5sp9eGgeLJ2OEx3sU/edit#gid=0)
   
   * TAC2MIPS.md

   * ![String Processing](https://docs.google.com/presentation/d/1fg9BuWtyZ9PARK0gDE5ZcbjOiudRSrVP2s1iuSIDYXw/edit#slide=id.g199d0a137fe_0_29)
 

## Notes



