        .text
        .include "macros/syscalls.s"
        .include "macros/stack.s"

        .globl whole2bin

whole2bin:  nop								#public static int whole2bin(int whole) {
			# t0: number					#		int number;
			# t1: value						#		int value;
			# t2: count						#		int count;
			# t3: temp

			li $t3, 2
			li $t2, 0						#		count = 0;
			move $t0, $a0					#		number = whole;
loop1:		beq	$t0, $zero, done1			#		while(number != 0) {
			andi $t3, $t0, 1 
			push $t3						#			mips.push(number % 2);
			srl $t0, $t0, 1					#			number = number / 2;
			addi $t2, $t2, 1				#			count ++;
			b loop1							#			continue loop1;
											#		}
done1:		nop								#	    ;

loop2:		beq $t2, $zero done2			#		for(; count > 0;) {
			pop $t1							#			value = mips.pop();
			print_d($t1)					#			mips.print_d(value);
			subi $t2, $t2, 1				#			count--;
			b loop2							#			continue loop2;
											#		}
done2:		nop								#		;		
			move $v0, $t0					#		return number;
			jr $ra										
											#	}