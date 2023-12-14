public static int whole2bin(int whole) {
		int number;
		int value;
		int count;
		count = 0;
		number = whole;
loop1:	while(number != 0) {
			mips.push(number % 2);
			number = number / 2;
			count ++;
			continue loop1;
		}
done1:  ;
loop2:	for(; count > 0;) {
			value = mips.pop();
			mips.print_d(value);
			count--;
			continue loop2;
		}
done2:	;		
		return number;
		
	}