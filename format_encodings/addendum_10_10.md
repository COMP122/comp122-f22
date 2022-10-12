                .include "syscalls.s"


main:
                li $a0, 4
                li $a1, 16
                jal series
                print_d $v0
                exit



series:         nop             # int series(int a, int b)

                # Formal Arguments
                # v0: d
                # a0: a
                # a1: b
        
                # Register allocation
                # t0: a
                # t1: b
                # t2: x
                # t3: i
                # t4: d

                # Demarshal
                move $t0, $a0
                move $t1, $a1

                # Algorithm

                sub $t2, $t0, $t1               #            x = a - b;
                print_d $t2                     #            print_d x; 
                print_ci '\n'                   #            print_ci '\n';
                                                # 
                move $t3, $t0                   #            i=a
mutt:           bge $t3,$t1, jeff                                # mutt:      for(; i<b ;) {
                  print_d $t3                     #              print_d i;
                  print_ci ','                  #              print_ci ',';
                  addi $t3, $t3, 1              #              i = i + 1;
                b mutt                          #              continue mutt;
                                                #            }
jeff:           nop                             # jeff:      ;
                print_d $t3                     #            print_d i 
                print_ci '\n'                   #            print_ci '\n'
                sub $t4, $1, $t0                #            d = b - a
                                                
                # Demarshal                     #            return d;
                move $v0,  $t4

                # Return
                jr $ra











