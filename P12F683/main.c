/* DPTP SYSTEM - Szentkirályi kupak vezérlés
 * Email: don_peter@freemail.hu
 * Készült:   2015 Szeptember 28 Hétfõ
 * PIC: PIC12F683
 * Fórdító:  HI-TECH C for PIC10/12/16
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

unsigned char timer2count = 0;		// Timer2 számláló
volatile unsigned short mpmero = 0;	// Másodperc mérése
unsigned char start = 0;			// Program indítása
unsigned char jelzes=0;				// hangjezéshez

void main(void);
void BEEP(unsigned char hany, unsigned char hossz);
void BEEP2(unsigned char hany, unsigned char hossz);
unsigned short EepromRead (void);
void EepromWrite (unsigned char adat);

void main(void){
	unsigned char i,y;				// Implementáló
	unsigned char OFF_TIMER=0;		// kikapcsoláshoz szükséges idõmérõ
	/****************************************************************
	* LEVEL == 1 == 15perc, LEVEL == 2 == 30perc, ...45perc, 1óra   *
	****************************************************************/
	unsigned char LEVEL;			// Alapértlemezet idõmérési szint
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
	INTCON = 0;					// Összes interrupt láb kikapcsolva
	PEIE   = 1;					// Peripheral interrupt engedélyezése
	GIE    = 1;					// Globális interrupt engedélyezése
	
	// Sleep üzemmód beállítása
	PCON = 0b0010000;			// Ultra alacsony energia engedélyezve (wake-up)
	
	//Timer2 beállítása
	/*titt2 = 1 / (Fosc / 4 / <T2_prescaler> / (PR2+1) / <T2_postscaler> )
	T2_prescaler = 16, T2_postscaler = 10, PR2+1 = 250 azaz
	titt2 = 1 / (8E6 / 4 / 16 / 125 / 10 ) = 0.0100 s*/
	PR2 = 137;
    T2CON = 0b01001111;
	TMR2IE = 0;
    PEIE = 1;
    GIE = 1;
	
	LEVEL = EepromRead();
	LEVEL = LEVEL>0&&LEVEL<255?LEVEL:1;		// Utolsó elmentett állás betöltése
	LED = 1;	
	BEEP(1, 255);							// Bekapcsolás jelzése
	LED = 0;

	while (1){
		
		if(!start){							// Ha a program még nincs elindítva	start==0
			if(!GOMB){						// Ha a gombot megynomjuk
				while(!GOMB); 				// Várakozunk gomb felengedésére
				start=1;					// Program indítása
				TMR2IE = 1;					// Timer engedélyezése
				BEEP(2, 100);
			}
		}else if(start){					// Ha a program el van indítva start==1
			if(!GOMB){						// Ha történt gombnyomás
				OFF_TIMER=0;				// Nullázzuk az idõmérõt
				while(!GOMB){				// Feltételezzük, hogy hosszan nyomjuk a gombot, ha mégsem, akkor várakozunk felengedésig
					OFF_TIMER++;			// indõmérés
					__delay_ms(100);		// 100ms késleltetés
					if(OFF_TIMER>50){		// Ha 5s-ot meghaladja a gombnyomás nullázunk és sztendbájba tesszüka PIC-et
						OFF_TIMER=0;		// Nullázzuk idõmérõt
						start=0;			// Program leállítása
						TMR2IE = 0;			// Timer leállítása
						timer2count=0;		// Timer nullázása
						mpmero=0;			// Másodperc nullázása
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
				if(start){					// Hogy ha nem lett leállítva a program
					if(LEVEL<4){
						LEVEL++;			// Nõveljük a szinten
						BEEP(LEVEL, 100);
					}else{
						LEVEL=1;			// Szint alapértelmezett állapotba kerül
						BEEP(LEVEL, 100);
					}
					//BEEP(1, 10);
				}
			}
		}
		
		// Fõ funkciók
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

 // Megszakítás
 extern interrupt isr(void){ 
	if(GPIF == 1){	// Ha sleep üzenmód volt
		// Sleep üzemmód beállítása
		PCON = 0b0010000;			// Ultra alacsony energia engedélyezve (wake-up)
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
		__delay_ms(100);		// 1ms késleltetés
	}
}

void BEEP2(unsigned char hany, unsigned char hossz){
	unsigned char i,y;
	for(y=0; y<hany; y++){
		HANG1=1; //hang();
		for(i=0; i<hossz; i++){
			__delay_ms(1);		// 1ms késleltetés
		}
		HANG1=0;
		__delay_ms(100);		// 1ms késleltetés
	}
}

/*********************************************
+		Eeprom olvasása
**********************************************/
unsigned short EepromRead (void){
	unsigned short result;
	EEADR = 0;			// Memória címtõl kezdi az olvasást
	RD = 1;				// Olvasást vezérlõ bit
	result = EEDATA;	// Kiolvassuk az adatot
	return result;
}

/*********************************************
+		Eeprom írása
**********************************************/
void EepromWrite (unsigned char adat){
	EEADR = 0;			// Memória címtõl kezdjük az írást
	EEDATA = adat;
	WREN = 1;			// Flash Program / adat EEPROM írást engedélyezõ bit
	GIE = 0;			// Tiltjuk a interrupt-ot (megszakítást)
	EECON2 = 0x55;
	EECON2 = 0xAA;
	WR = 1;				// Írást vezérlõ bit
	while (WR == 1);	// Várakozunk az írás befejezéséig
	GIE = 1;			// engedélyezzük az interrupt-ot (megszakítást)
	WREN = 0;			// Flash Program / adat EEPROM írást engedélyezõ bit
}
