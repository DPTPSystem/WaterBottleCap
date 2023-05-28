/* DPTP SYSTEM - Szentkir�lyi kupak vez�rl�s
 * Email: don_peter@freemail.hu
 * K�sz�lt:   2015 Szeptember 28 H�tf�
 * PIC: PIC12F683
 * F�rd�t�:  HI-TECH C for PIC10/12/16
 */

#include <htc.h>
#include <stdio.h>
#include "header.h"
#define _XTAL_FREQ 8000000			// 8 MHz
#define GOMB	GPIO0				// Gomb
#define LED		GPIO1				// Led
#define HANG1	GPIO2				// Hang1
//#define HANG2	GPIO4				// Hang2
/*#define hang() { HANG1==0 ? HANG1=1, HANG2=0 : HANG1=0, HANG2=1; }
#define hang_off() { HANG1=0, HANG2=0; }*/

unsigned char timer2count = 0;		// Timer2 sz�ml�l�
volatile unsigned short mpmero = 0;	// M�sodperc m�r�se
unsigned char start = 0;			// Program ind�t�sa
unsigned char jelzes=0;				// hangjez�shez

void main(void);
void BEEP(unsigned char hany, unsigned char hossz);
void BEEP2(unsigned char hany, unsigned char hossz);
unsigned short EepromRead (void);
void EepromWrite (unsigned char adat);

void main(void){
	unsigned char i,y;				// Implement�l�
	unsigned char OFF_TIMER=0;		// kikapcsol�shoz sz�ks�ges id�m�r�
	/****************************************************************
	* LEVEL == 1 == 15perc, LEVEL == 2 == 30perc, ...45perc, 1�ra   *
	****************************************************************/
	unsigned char LEVEL;			// Alap�rtlemezet id�m�r�si szint
	static unsigned int PERC[4] = {60, 1800, 2700, 3600};
	
	OSCCON = 0b01110001;
	OSCTUNE = 0b00001111;
	TRISIO = 0b00000001;
	GPIO = 0b00000000;
	CCP1CON = 0;
	CMCON0 = 7;
	ADCON0 = 0;
	ANSEL = 0;
	GPPU = 1;
	WPU4 = 1;
	INTCON = 0;					// �sszes interrupt l�b kikapcsolva
	PEIE   = 1;					// Peripheral interrupt enged�lyez�se
	GIE    = 1;					// Glob�lis interrupt enged�lyez�se
	
	// Sleep �zemm�d be�ll�t�sa
	PCON = 0b0010000;			// Ultra alacsony energia enged�lyezve (wake-up)
	
	//Timer2 be�ll�t�sa
	/*titt2 = 1 / (Fosc / 4 / <T2_prescaler> / (PR2+1) / <T2_postscaler> )
	T2_prescaler = 16, T2_postscaler = 10, PR2+1 = 250 azaz
	titt2 = 1 / (8E6 / 4 / 16 / 125 / 10 ) = 0.0100 s*/
	PR2 = 137;
    T2CON = 0b01001111;
	TMR2IE = 0;
    PEIE = 1;
    GIE = 1;
	
	LEVEL = EepromRead();
	LEVEL = LEVEL>0&&LEVEL<255?LEVEL:1;		// Utols� elmentett �ll�s bet�lt�se
	LED = 1;	
	BEEP(1, 255);							// Bekapcsol�s jelz�se
	LED = 0;

	while (1){
		
		if(!start){							// Ha a program m�g nincs elind�tva	start==0
			if(!GOMB){						// Ha a gombot megynomjuk
				while(!GOMB); 				// V�rakozunk gomb felenged�s�re
				start=1;					// Program ind�t�sa
				TMR2IE = 1;					// Timer enged�lyez�se
				BEEP(2, 100);
			}
		}else if(start){					// Ha a program el van ind�tva start==1
			if(!GOMB){						// Ha t�rt�nt gombnyom�s
				OFF_TIMER=0;				// Null�zzuk az id�m�r�t
				while(!GOMB){				// Felt�telezz�k, hogy hosszan nyomjuk a gombot, ha m�gsem, akkor v�rakozunk felenged�sig
					OFF_TIMER++;			// ind�m�r�s
					__delay_ms(100);		// 100ms k�sleltet�s
					if(OFF_TIMER>50){		// Ha 5s-ot meghaladja a gombnyom�s null�zunk �s sztendb�jba tessz�ka PIC-et
						OFF_TIMER=0;		// Null�zzuk id�m�r�t
						start=0;			// Program le�ll�t�sa
						TMR2IE = 0;			// Timer le�ll�t�sa
						timer2count=0;		// Timer null�z�sa
						mpmero=0;			// M�sodperc null�z�sa
						EepromWrite (LEVEL);
						BEEP(5, 100);
						IOC = 0x01;					// GPIO interrupt enabled
						GPIE = 1;
						GPIF = 0;
						TRISIO = 0x01;
						GPIO = 0;
						asm("SLEEP");
					}
				}
				if(start){					// Hogy ha nem lett le�ll�tva a program
					if(LEVEL<4){
						LEVEL++;			// N�velj�k a szinten
						BEEP(LEVEL, 100);
					}else{
						LEVEL=1;			// Szint alap�rtelmezett �llapotba ker�l
						BEEP(LEVEL, 100);
					}
					//BEEP(1, 10);
				}
			}
		}
		
		// F� funkci�k
		if(PERC[LEVEL-1]<mpmero){
			mpmero=0;
		}
		if(jelzes){
			LED=1;
			BEEP(1, 100);
			__delay_ms(100);
			LED=0;
			jelzes=0;
		}
		__delay_ms(10);
	}
}

 // Megszak�t�s
 extern interrupt isr(void){ 
	if(GPIF == 1){	// Ha sleep �zenm�d volt
		// Sleep �zemm�d be�ll�t�sa
		PCON = 0b0010000;			// Ultra alacsony energia enged�lyezve (wake-up)
		GPIF = 0;
		PCON = 0x00;
		GPIE = 0;
		IOC = 0;
		TRISIO = 0x01;
		GPIO = 0;
		asm("NOP");
	}else{
		if(timer2count>99){
			//LED = 1;
			//BEEP(1, 10);
			//LED = 0;
			timer2count = 0;
			mpmero++;
			if(mpmero<11){ jelzes=1; }
		}
		timer2count++;
		TMR2IF = 0;
	}
}

void BEEP(unsigned char hany, unsigned char hossz){
	unsigned short i;
	unsigned char y;
	for(y=0; y<hany; y++){
		for(i=0; i<hossz; i++){
			__delay_us(100);
			HANG1=!HANG1;
		}
		HANG1=0;
		__delay_ms(100);		// 1ms k�sleltet�s
	}
}

void BEEP2(unsigned char hany, unsigned char hossz){
	unsigned char i,y;
	for(y=0; y<hany; y++){
		HANG1=1; //hang();
		for(i=0; i<hossz; i++){
			__delay_ms(1);		// 1ms k�sleltet�s
		}
		HANG1=0;
		__delay_ms(100);		// 1ms k�sleltet�s
	}
}

/*********************************************
+		Eeprom olvas�sa
**********************************************/
unsigned short EepromRead (void){
	unsigned short result;
	EEADR = 0;			// Mem�ria c�mt�l kezdi az olvas�st
	RD = 1;				// Olvas�st vez�rl� bit
	result = EEDATA;	// Kiolvassuk az adatot
	return result;
}

/*********************************************
+		Eeprom �r�sa
**********************************************/
void EepromWrite (unsigned char adat){
	EEADR = 0;			// Mem�ria c�mt�l kezdj�k az �r�st
	EEDATA = adat;
	WREN = 1;			// Flash Program / adat EEPROM �r�st enged�lyez� bit
	GIE = 0;			// Tiltjuk a interrupt-ot (megszak�t�st)
	EECON2 = 0x55;
	EECON2 = 0xAA;
	WR = 1;				// �r�st vez�rl� bit
	while (WR == 1);	// V�rakozunk az �r�s befejez�s�ig
	GIE = 1;			// enged�lyezz�k az interrupt-ot (megszak�t�st)
	WREN = 0;			// Flash Program / adat EEPROM �r�st enged�lyez� bit
}
