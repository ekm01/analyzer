//PARAM: --enable ana.int.congruence  --enable ana.int.congruence_no_overflow --disable ana.int.def_exc --disable ana.int.enums

int main() {
	int a = 1;
	int b = 2;
	int c = 3;
	int d = 4;
	int e = 0;

	while (d < 9)	 {
		b = 2 * a;
		d = d + 4;
		e = e - 4 * a;

		a = b - a;
		c = e + d;
	}

	a = d / 2;
	b = d % 2;

    // c is unknown
	assert (c == 4); // UNKNOWN!
	// d should be 12 in the concrete domain and  4Z in the congr. domain
	assert (d != 1); assert (d != 2); assert (d != 3);
	assert (d == 12); // UNKNOWN
	// a should be 6 in the concrete domain and 2Z in the congr. domain
	assert (a == 6); // UNKNOWN
	// e should be -8 in the concrete domain and 4Z in the congr. domain
	assert (e == -8); // UNKNOWN
	assert (b == 0);

	return 0;
}
