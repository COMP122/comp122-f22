# COMP122 Lecture Notes: Nov 14, 2022

##  These notes are specifically for the Monday/Afternoon class
   1. The subroutine "encode_binary32" has a technical flaw in it
   1. This flaw will be discussed on Nov 15
   1. This flaw DOES NOT prevent you from working on the assignment!


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
   1. Binary32
      - overview
      - subroutine overview (43-binary32)
        * Theoretical Input
          -  "+ 1 .1 0100 1110 0001  x2^  - 101001"

        * Actual Inputs:
          -  0  1  5344 ~x2^~ -41
          -  a0 a1 a2         a3

        * Formal Parameters:
          - a0: sign (0: positive, 1: negative), e.g. 0
          - a1: whole (always 1)
          - a2: fractional part, e.g., 5354
          - a3: exponent (unbiased),  -41
          - v0: the encoded binary32 value

        * Algorithm:
          1. demarshal your input args
          1. ~encode the sign~ (done)
          1. ~drop the leading 1~ (done)
          1. add the bias to the exponent
          1. shift the pieces into place
          1. merge the pieces together
          1. call print_t to print the value
          1. marshal your output arg
          1. return 
             - \# this will cause an interrupt
             - ignore for now

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

## Questions
   1. M/W M: 
      - no questions
   1. M/W A:
   1. T/R M:
   1. T/R A:



## Today's Material



---
## Resources
   1. Slides:
      * State and MicroArchecture: https://docs.google.com/presentation/d/1fiKqQJ8tik9L4aVuD_QYIuWPIkTQBGgARH9uZGCP-Fs/edit#slide=id.gc7bbf9a6da_0_0


## Notes



