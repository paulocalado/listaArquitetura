#include <stdio.h>

int main() {
	int f, g, h;
	int t0, t1, t2;
	int A[10000000], B[10000000];
	
	t0 = f * 4;
	t0 = &A[f];
	t1 = g * 4;
	t1 = &B[g];
	f = A[f];
	t2 = &A[f + 1]; 
	t0 = A[f + 1];
	t0 = A[f + 1] + A[f];
	B[g] = A[f + 1] + A[f];
	
	return 0;
}	