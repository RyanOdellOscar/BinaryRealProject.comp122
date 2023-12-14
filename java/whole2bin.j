public static int whole2bin(int whole) {
	int number;
	int value;
	int count;
	count = 0;
	number = whole;
	while(number != 0) {
		mips.push(number % 2);
		number = number / 2;
		count ++;
	}
	for(; count > 0; count--) {
		value = mips.pop();
		mips.print_d(value);
	}
	
	return number;
	
}