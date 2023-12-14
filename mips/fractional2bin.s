        .text
        .include "macros/syscalls.s"
        .include "macros/stack.s"

        .globl fractional2bin

fractional2bin: nop                   #public static int fractional2bin(int fractional, int max_bits) {
        # a0: fractional
        # a1: max_bits
        # t0: max                     #         int max;
        # t1: number                  #         int number;
        # t2: bits                    #         int bits;
        # t3: max_bits

        ###############################         max = value_of_max(fractional);

        push_t_registers()            #         Save T registers
        push $ra, $sp, $fp, $gp       #         Save special registers
        jal value_of_max                 
        pop $ra, $sp, $fp, $gp        #         Restore special registers
        pop_t_registers()             #         Restore T registers
        move $t0, $v0                 #         Demarshal return value

        #############################

        move $t1, $a0                 #         number = fractional;
        move $t3, $a1
        li $t2, 0                     #         bits = 0;

loop:   beq $t1, $zero, done          #           while (number != 0) {
        bge $t2, $t3, done            #            if(bits >= max_bits) break loop;
        addi $t2, $t2, 1              #            bits++;
        sll $t1, $t1, 1               #            number = number * 2; 
        bge $t1, $t0, cons            #            if ( number >= max ) {
        b alt
cons:   print_di(1)                   #               mips.print_di(1);
        sub $t1, $t1, $t0             #               number = number - max;
        b loop                        #               continue loop;
                                      #            } else {
alt:    print_di(0)                   #               mips.print_di(0);
        b loop                        #               continue loop;
                                      #            }
                                      #         }
done:   nop                           #         ;
        print_ci('\n')                #         mips.print_ci('\n');
        move $v0, $t1                 #         return number;
        jr $ra                        #      }



       .globl value_of_max
        
value_of_max: nop               #  public static int value_of_max(int       number) {
        # t0: number
        # t1: max               # int max;
        # t2: i                 # int i;
        # s0: 8                 # int _8;
        # s1: 10                # int _10;
      
        push_s_registers()      # Save S registers
        move $t0, $a0           # Demarshal input arguments
      
        li $t1, 10              # max = 10;
        li $t2, 0               # i=0;
        li $s0, 8               # _8 = 8;
        li $s1, 10              # _10 = 10;
      
loop2:  blt $t0, $t1, done2     # for (; number >= max ;) {
          bgt $t2, $s0, loop2   #    if( i > _8) break loop2;
          mul $t1, $t1, $s1     #    max = max * _10;
          addi $t2, $t2, 1      #    i++;
          b loop2               #    continue loop2;
                                # }
done2:  nop                     # ;
                                # return max;
        move $v0, $t1           # Marshal output value
        pop_s_registers()       # Restore S registers                          
        jr $ra
                                # }