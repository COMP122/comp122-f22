# COMP122 Lecture Notes: October 10 & 11, 2022

## Announcements
   1. 41-echo: Due Sunday night Oct 9
      1. Two week assignment
      1. Five parts:
         - 2 parts in Java, with the code provided
         - 3 parts in MIPS that mirror the Java code
           - each part was discussed, with code, in class
      1. Looks easy when the Prof does it on the board
         - Examplar code provided by the Prof
         - Many students (16) delayed until Sept 7 to start
         - Nine (9) students delayed until Oct 9 to start
      1. Number of commits
      ```
      #students #commits
      10 1   -- only accepted the assignment!
       1 2
       9 3
       2 4
      65 5    
       9 6   -- minimum number of commits: 1 + 5
       3 7
       1 8
       1 14
      ``` 
      1. Thoughts?


## Today's Agenda
   1. Practicum in writing MIPS Code, using the MARS debugger
   1. Inclass Lab Assignment

## Questions
   1. M/W M:
      - Why `exiti 0` as opposed to `move $v0 $?`
      - 21 students in attendance 
   1. M/W A:
      - 
   1. T/R M: 
      - 
   1. T/R A: 
      - 

## Today's Material

  1. Walk through 

  ```
  int main() {
    series(4, 16);
    System.exit();
  }

  int series(int a, int b) {
    int x;
    int i;

    x = a - b;
    System.out.printf("%d", x);
    System.out.printf("\n");

    for (i=a; i<b; i++) {
      System.out.printf("%d", i);
      System.out.printf(",");
    }
    System.out.printf("%d\n", i);
    return b - a;
  }
  ```

  1. Assignment:
     - https://classroom.github.com/a/81i2qleF

---
## Resources


