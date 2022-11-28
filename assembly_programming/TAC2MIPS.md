# TAC -> MIPS Conversation Table
Given a simplied Java psuedo code for a method that has been transformed into Three Address Code (TAC) syntax, the following table provides the mapping from TAC to MIPS.

## Nomenclature:
   1. registers:
      - virtural registers names
        - lowercase variables, e.g., `a`
      - physical register names
        - e.g., $t1
   1. memory locations
      - Captialized names, e.g., `A`
   1. immediate values, i.e., `imm`
      - literal value, e.g., 2

## Mathematical Operations (non-Arrays)
   * Here we assume the type is signed 32-bit signed integers

   | TAC Instruction               | MIPS Instruction          |
   |-------------------------------|---------------------------|
   | `;`                           | `nop`                     |
   | `a ++;`                       | `addi a, a, 1`            |
   | `x = [ a \| imm ];`           | `move x, a \| li x, imm`  |
   | `x = a [ + \| - ] b;`         | `add x, a, b     # etc`   |
   | `x = a [ + \| - ] imm;`       | `addi x, a, imm  # etc`   |
   | `x = a * b;`                  | `mul a, b`                |
   |                               | `mflo x`                  |
   | `x = a / b;`                  | `div a, b`                |
   |                               | `mflo x`                  |
   | `x = a % b;`                  | `div a, b`                |
   |                               | `mfhi x`                  |
   | `x = a << imm;`               | `sll x, a, imm`           |
   | `x = a << b;`                 | `sllv x, a, b`            |
   | `x = a >> imm;`               | `sra x, a, imm`           |
   | `x = a >> b;`                 | `srav x, a, b`            |
   | `x = a >>> imm;`              | `srl x, a, imm`           |
   | `x = a >>> b;`                | `srlv x, a, b`            |


## Array Operations:
   * Here we assume the type of A is `w`ord, a 32-bit integer.

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

## Control Structures

   | TAC Instruction               | MIPS Instruction          |
   |-------------------------------|---------------------------|
   | `if (a <cond> b) {`           | `b<! cond> a, b, alt`     |
   | `else {`                      | `nop`                     |
   | `for(; a <cond> b ;) {`       | `b<! cond> a, b, done`    |
   | `while(a <cond> b) {`         | `b<! cond> a, b, done`    |
   | `} while (a <cond> b);`       | `b<cond> a, b, top`       |
   | `continue label;`             | `b label`                 |
   | `break label;`                | `b label`                 |
   | `}`                           | `<null>   # end of scope` |


   | `TAC <cond>` | `MIPS <cond>` | `MIPS <! cond>` |`TAC <! cond>` |
   |:------------:|:-------------:|:---------------:|:-------------:|
   | `<`          | `lt`          | `ge`            |  `>=`         |
   | `<=`         | `le`          | `gt`            |  `>`          |
   | `!=`         | `ne`          | `eq`            |  `==`         |
   | `==`         | `eq`          | `ne`            |  `!=`         |
   | `>=`         | `ge`          | `lt`            |  `<`          |
   | `>`          | `gt`          | `le`            |  `>=`         |


## Subroutine Calls
   * To simplify things, we have created a set of macros that following the MIPS convention for parameter passing.  These macros are:
     - marshal_args( args... )
     - demarshal_arg( var )
     - returni( )
     - return()
   * Also to simply things, we are not addressing the MIPS convention for saving registers across subroutine boundaries.

   | TAC Instruction               | MIPS Instruction          |
   |-------------------------------|---------------------------|
   | `x = subroutine(a, b, ...);`  | `marshal(a, b, ...)`      |
   |                               | `jal subroutine`          |
   |                               | `demarshal(x)`            |
   | `x = A.method(b, c, ...);`    | `la a, a`                 |
   |                               | `marshal(a, b, ...)`      |
   |                               | `jal method`              |
   |                               | `demarshal(x)`            |
   | `return imm;`                 | `returni(imm)`            |
   | `return a;`                   | `return(a)`               |

   * Note that dealing with objects are more intricate than is shown here. But the format shown provides a general understanding of the necessary approach.
