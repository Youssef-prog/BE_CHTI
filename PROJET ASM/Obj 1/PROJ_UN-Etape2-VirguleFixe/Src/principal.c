extern void sommeCarre(void);
extern int dft(int, int**, int**);
extern int M2(int**, int);
extern int* TabSig;
extern int* TabSin;
extern int* TabCos;

int im[64], re[64];
int m2;

int main(void){ // faire boucle for

	/*for(int k=0; k<64; k++){
		im[k] = dft(k, &TabSin, &TabSig);
		re[k] = dft(k, &TabCos, &TabSig);

	}*/

	int k = 23;
	m2 = M2(&TabSig, k);

	while(1){}
}