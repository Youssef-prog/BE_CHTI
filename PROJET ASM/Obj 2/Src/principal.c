extern void sommeCarre(void);
extern int dft(int, int**, int**);
extern int M2(int**, int);
extern int* TabSig;
extern int* TabSin;
extern int* TabCos;

#include "./gassp72.h"

//int im[64], re[64];
//int m2;

#define BUFFER_SIZE 64
#define TAB_SIZE 6

unsigned int SYSTICK_PER = 15000*75; //période de 15 ms

#define NBR_FREQ 6

#define M2TIR 1000000

int *dma_buf[BUFFER_SIZE];

int occurence[TAB_SIZE];
int score[TAB_SIZE] = {0, 0, 0, 0, 0, 0};

int freq[NBR_FREQ] = {85, 90, 95, 100, 115, 120};

void sys_callback(){
	// Démarrage DMA pour 64 points
	//GPIO_Set(GPIOB, 1);
	
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
	Stop_DMA1;
	
	for(int i=0; i<NBR_FREQ; i++){
		int k = freq[i]/5;
		M2(dma_buf, k);
		if(M2(&TabSig, k)>M2TIR){
			occurence[k]+=1;
		}
		
		else{
			occurence[k] = 0;
		}
		
		if(occurence[k]>=5){
			occurence[k] = 0;
			score[k]+=1;
			
			
		}
	}
		
		//GPIO_Clear(GPIOB, 1);	
	
}

int main(void){ // faire boucle for

	/*for(int k=0; k<64; k++){
		im[k] = dft(k, &TabSin, &TabSig);		Tests des valeurs réelles et imaginaires
		re[k] = dft(k, &TabCos, &TabSig);		avec le jeu de tests officiel.

	}*/

	/*int k = 23;			Test du module avec le jeu de tests officiel.
	m2 = M2(&TabSig, k); */		


	// activation de la PLL qui multiplie la fréquence du quartz par 9
	CLOCK_Configure();
	// PA2 (ADC voie 2) = entrée analog
	GPIO_Configure(GPIOA, 2, INPUT, ANALOG);
	// PB1 = sortie pour profilage à l'oscillo
	GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
	// PB14 = sortie pour LED
	GPIO_Configure(GPIOB, 14, OUTPUT, OUTPUT_PPULL);

	// activation ADC, sampling time 1us
	Init_TimingADC_ActiveADC_ff( ADC1, 72 );
	Single_Channel_ADC( ADC1, 2 );
	// Déclenchement ADC par timer2, periode (72MHz/320kHz)ticks
	Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );
	// Config DMA pour utilisation du buffer dma_buf (a créér)
	Init_ADC1_DMA1( 0, (vu16 *)dma_buf );

	// Config Timer, période exprimée en périodes horloge CPU (72 MHz)
	Systick_Period_ff( SYSTICK_PER );
	// enregistrement de la fonction de traitement de l'interruption timer
	// ici le 3 est la priorité, sys_callback est l'adresse de cette fonction, a créér en C
	Systick_Prio_IT( 3, sys_callback );
	SysTick_On;
	SysTick_Enable_IT;

	while(1); 
}