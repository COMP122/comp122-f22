# COMP122 Lecture Notes: Nov 14 and 15, 2022


## Announcements
   1. Grading of 23-, 24-, 25-, 31-
      - these assignments have been graded
      - due dates were honored (with a small time cushion)
      - submission.md files must have been committed by the due date
      - repos MUST have been pushed before grading started
      - your responsibility to know what you submitted

   1. Regrading, Accommodations, Exceptions: to grading
      - You must make an explicit request via a slack DM
      - Your request must state 
        - your github account name
        - which assignment (23-, 24-, 25-, 31-) is in question
        - why you deserve a consideration
      - If you already think you made said request, make it again!

   1. Program:  administrative/grade_guesstimator 
      - available -- not fully tested
        * feel free to try and provide feedback
      - all previous grade.report files 
        * augmented with `ASSIGNMENT_[0-9][0-9]_total="1?[0-9][0-9]"`
        * you need to pull all previous assignments, 
          - for the tool to automatically include assignment scores

   1. Noticed that a handful of students pushed past deliverables 
      after after grading was complete.  
      - Do NOT presume that I was even aware that you made said pushes
      - I.e., I did not take them into consideration for grading.

   1. Quiz is scheduled for the weekend of 17th
      - the quiz must be completed with a 2 hour time-frame
      - but you have a large window (48 hours ?) over the weekend to self-schedule the quiz time.

   1. Grading of 20- is scheduled to be done by End of Week
   1. Grading of 30- is scheduled to be done over Thanksgiving
   1. Start of a new section: MIPS Assembly 


## Today's Agenda
   1. Review of where we are:
      - 41-echo
      - 42-kickstart
      - 43-binary32
   1. Review of MIPs
   1. Binary32 Program Overview, and Coding Practicum
  
    
## Questions
   1. M/W M: 
   1. M/W A:
      - no questions
   1. T/R M:
      - no questions
   1. T/R A:



## Today's Material


 1. Binary32 Program Overview, and Coding Practicum
      - Review of binary32 encoding format
      - subroutine overview:  "encode_binary32" 
        * Example: Theoretical Input
          - "+ 1.1 0100 1110 0001  x2^ - 10 1001 (-41)"  

        * Example: Actual Inputs:
          - Breakdown of   '+'  "2# 1 1 0100 1110 0001"  "x2^"   '-'    "2# 10 1001"   
          - ( '+', 0x34E1, '-', 0x29)  

        * Prototype:  encode_binary32( sign, num, expon_sign, expon )
        * Formal Parameters:
          - a0: sign -- an ASCII character
          - a1: number (representing, in total,:  1.\<mantissa\>) 
          - a2: expon_sign -- an ASCII character
          - a3: exponent (unbiased)
          - v0: the encoded binary32 value

        * Algorithm:
          1. Demarshal your input arguments
          1. Decode and then encode the sign
          1. Obtain the mantissa, by left-justifying the number while dropping the leading 1
             - shift the number to the left the appropriate number of positions
             - use the `position_of_msb` macro to determine this number 
          1. Decode the sign of the exponent and then re-encode the exponent
          1. Add the bias to the exponent
          1. Shift the pieces into place: sign, exponent, mantissa
          1. Merge the pieces together
          1. Call `print_t` to print the value as a bit"t" string
          1. Marshal your output arguments 
          1. Return from the subroutine `jr $ra`
             - Note, as explained in class, the return will when using MARS -- that is Okay


      - Final spec to be provided later
        * Above is Phase 1

   1. Lab time:
      - create a file called "encode_binary32.s"
      - create a subroutine called "encode_binary32"
      - use the template to structure your subroutine
      - write the three-address (TAC) code first
      - convert the TAC into MIPS
      - debug 
        - manual add your values into the $a0..$a3 registers

   1. mips_subroutine tool
      - to be provided

   1. macro to determine the position of the most significant bit

   ```mips
   .macro position_of_msb(%reg)
              li $a0, 0                #        counter = 0;
              move $a1, %reg           #        number = %reg;
        loop: beq $a1, $zero, done     # loop:  for(; number != zero ;) {
                addi $a0, $a0, 1       #           counter ++;
                srl $a1, $a1, 1        #           number = number >> 1;
              b loop                   #           break loop;
                                       #        }
        done: nop                      # done:  nop
              move $v0, $a0            #        $v0 = counter;
    .end_macro
    ```



---
## Resources
   1. Slides:
      - Intro to MIPS:
      - https://docs.google.com/presentation/d/13NbmMDsDcbJ6qLznOublbubldTsf4qAPr2wl8Ip1KDE/edit#slide=id.gfba52f9b0c_0_217


## Notes



