opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6446"

opt pagewidth 120

	opt pm

	processor	12F683
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 1 "C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\header.h"
	psect config,class=CONFIG,delta=2 ;#
# 1 "C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\header.h"
	dw 0x37FF & 0x3BFF & 0x3DFF & 0x3FBF & 0x3FBF & 0x3FFF & 0x3FEF & 0x3FF7 & 0x3FFC ;#
	FNCALL	_main,_EepromRead
	FNCALL	_main,_BEEP
	FNCALL	_main,_EepromWrite
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	main@PERC
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
	line	37

;initializer for main@PERC
	retlw	03Ch
	retlw	0

	retlw	08h
	retlw	07h

	retlw	08Ch
	retlw	0Ah

	retlw	010h
	retlw	0Eh

	global	_mpmero
	global	_jelzes
	global	_start
	global	_timer2count
	global	_ADCON0
_ADCON0	set	31
	global	_CCP1CON
_CCP1CON	set	21
	global	_CMCON0
_CMCON0	set	25
	global	_GPIO
_GPIO	set	5
	global	_INTCON
_INTCON	set	11
	global	_T2CON
_T2CON	set	18
	global	_GIE
_GIE	set	95
	global	_GPIE
_GPIE	set	91
	global	_GPIF
_GPIF	set	88
	global	_GPIO0
_GPIO0	set	40
	global	_GPIO1
_GPIO1	set	41
	global	_GPIO2
_GPIO2	set	42
	global	_PEIE
_PEIE	set	94
	global	_TMR2IF
_TMR2IF	set	97
	global	_ANSEL
_ANSEL	set	159
	global	_EEADR
_EEADR	set	155
	global	_EECON2
_EECON2	set	157
	global	_EEDATA
_EEDATA	set	154
	global	_IOC
_IOC	set	150
	global	_OSCCON
_OSCCON	set	143
	global	_OSCTUNE
_OSCTUNE	set	144
	global	_PCON
_PCON	set	142
	global	_PR2
_PR2	set	146
	global	_TRISIO
_TRISIO	set	133
	global	_GPPU
_GPPU	set	1039
	global	_RD
_RD	set	1248
	global	_TMR2IE
_TMR2IE	set	1121
	global	_WPU4
_WPU4	set	1196
	global	_WR
_WR	set	1249
	global	_WREN
_WREN	set	1250
	file	"kupak.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_mpmero:
       ds      2

_jelzes:
       ds      1

_start:
       ds      1

_timer2count:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
main@PERC:
       ds      8

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	fcall	__pidataBANK0+6		;fetch initializer
	movwf	__pdataBANK0+6&07fh		
	fcall	__pidataBANK0+7		;fetch initializer
	movwf	__pdataBANK0+7&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_EepromWrite
?_EepromWrite:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 2 bytes @ 0x0
	ds	2
	global	?_BEEP
?_BEEP:	; 0 bytes @ 0x2
	global	??_EepromWrite
??_EepromWrite:	; 0 bytes @ 0x2
	global	?_EepromRead
?_EepromRead:	; 2 bytes @ 0x2
	global	BEEP@hossz
BEEP@hossz:	; 1 bytes @ 0x2
	global	EepromWrite@adat
EepromWrite@adat:	; 1 bytes @ 0x2
	ds	1
	global	??_BEEP
??_BEEP:	; 0 bytes @ 0x3
	ds	1
	global	??_EepromRead
??_EepromRead:	; 0 bytes @ 0x4
	global	EepromRead@result
EepromRead@result:	; 2 bytes @ 0x4
	ds	2
	global	BEEP@hany
BEEP@hany:	; 1 bytes @ 0x6
	ds	1
	global	BEEP@i
BEEP@i:	; 2 bytes @ 0x7
	ds	2
	global	BEEP@y
BEEP@y:	; 1 bytes @ 0x9
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	3
	global	_main$225
_main$225:	; 2 bytes @ 0x3
	ds	2
	global	main@OFF_TIMER
main@OFF_TIMER:	; 1 bytes @ 0x5
	ds	1
	global	main@LEVEL
main@LEVEL:	; 1 bytes @ 0x6
	ds	1
;;Data sizes: Strings 0, constant 0, data 8, bss 5, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      10
;; BANK0           80      7      20
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?_EepromRead	unsigned short  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_BEEP
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 9     9      0     367
;;                                              0 BANK0      7     7      0
;;                         _EepromRead
;;                               _BEEP
;;                        _EepromWrite
;; ---------------------------------------------------------------------------------
;; (1) _BEEP                                                 8     7      1      92
;;                                              2 COMMON     8     7      1
;; ---------------------------------------------------------------------------------
;; (1) _EepromWrite                                          1     1      0      22
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _EepromRead                                           4     2      2      23
;;                                              2 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _isr                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _EepromRead
;;   _BEEP
;;   _EepromWrite
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               20      0       0       5        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      1F       8        0.0%
;;ABS                  0      0      1E       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      7      14       4       25.0%
;;BITBANK0            50      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      A       A       1       71.4%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 30 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  LEVEL           1    6[BANK0 ] unsigned char 
;;  OFF_TIMER       1    5[BANK0 ] unsigned char 
;;  y               1    0        unsigned char 
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       4       0
;;      Temps:          0       3       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_EepromRead
;;		_BEEP
;;		_EepromWrite
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
	line	30
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	32
	
l1056:	
	line	39
	
l1058:	
;main.c: 36: unsigned char LEVEL;
;main.c: 37: static unsigned int PERC[4] = {60, 1800, 2700, 3600};
;main.c: 39: OSCCON = 0b01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	40
	
l1060:	
;main.c: 40: OSCTUNE = 0b00001111;
	movlw	(0Fh)
	movwf	(144)^080h	;volatile
	line	41
	
l1062:	
;main.c: 41: TRISIO = 0b00000001;
	movlw	(01h)
	movwf	(133)^080h	;volatile
	line	42
	
l1064:	
;main.c: 42: GPIO = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	43
	
l1066:	
;main.c: 43: CCP1CON = 0;
	clrf	(21)	;volatile
	line	44
	
l1068:	
;main.c: 44: CMCON0 = 7;
	movlw	(07h)
	movwf	(25)	;volatile
	line	45
;main.c: 45: ADCON0 = 0;
	clrf	(31)	;volatile
	line	46
;main.c: 46: ANSEL = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	47
	
l1070:	
;main.c: 47: GPPU = 1;
	bsf	(1039/8)^080h,(1039)&7
	line	48
	
l1072:	
;main.c: 48: WPU4 = 1;
	bsf	(1196/8)^080h,(1196)&7
	line	49
;main.c: 49: INTCON = 0;
	clrf	(11)	;volatile
	line	50
	
l1074:	
;main.c: 50: PEIE = 1;
	bsf	(94/8),(94)&7
	line	51
	
l1076:	
;main.c: 51: GIE = 1;
	bsf	(95/8),(95)&7
	line	54
	
l1078:	
;main.c: 54: PCON = 0b0010000;
	movlw	(010h)
	movwf	(142)^080h	;volatile
	line	60
	
l1080:	
;main.c: 60: PR2 = 137;
	movlw	(089h)
	movwf	(146)^080h	;volatile
	line	61
	
l1082:	
;main.c: 61: T2CON = 0b01001111;
	movlw	(04Fh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	62
	
l1084:	
;main.c: 62: TMR2IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	63
	
l1086:	
;main.c: 63: PEIE = 1;
	bsf	(94/8),(94)&7
	line	64
	
l1088:	
;main.c: 64: GIE = 1;
	bsf	(95/8),(95)&7
	line	66
	
l1090:	
;main.c: 66: LEVEL = EepromRead();
	fcall	_EepromRead
	movf	(0+(?_EepromRead)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@LEVEL)
	line	67
	
l1092:	
;main.c: 67: LEVEL = LEVEL>0&&LEVEL<255?LEVEL:1;
	clrf	(_main$225)
	incf	(_main$225),f
	clrf	(_main$225+1)
	
l1094:	
	movf	(main@LEVEL),w
	skipz
	goto	u260
	goto	l374
u260:
	
l1096:	
	movf	(main@LEVEL),w
	xorlw	0FFh
	skipnz
	goto	u271
	goto	u270
u271:
	goto	l374
u270:
	
l1098:	
	movf	(main@LEVEL),w
	movwf	(_main$225)
	clrf	(_main$225+1)
	
l374:	
	movf	(_main$225),w
	movwf	(main@LEVEL)
	line	68
	
l1100:	
;main.c: 68: GPIO1 = 1;
	bsf	(41/8),(41)&7
	line	69
	
l1102:	
;main.c: 69: BEEP(1, 255);
	movlw	(0FFh)
	movwf	(?_BEEP)
	movlw	(01h)
	fcall	_BEEP
	line	70
	
l1104:	
;main.c: 70: GPIO1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	74
	
l1106:	
;main.c: 74: if(!start){
	bcf	status, 5	;RP0=0, select bank0
	movf	(_start),f
	skipz
	goto	u281
	goto	u280
u281:
	goto	l1114
u280:
	line	75
	
l1108:	
;main.c: 75: if(!GPIO0){
	btfsc	(40/8),(40)&7
	goto	u291
	goto	u290
u291:
	goto	l1156
u290:
	line	76
	
l378:	
	btfss	(40/8),(40)&7
	goto	u301
	goto	u300
u301:
	goto	l378
u300:
	
l380:	
	line	77
;main.c: 77: start=1;
	clrf	(_start)
	incf	(_start),f
	line	78
;main.c: 78: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	79
	
l1112:	
;main.c: 79: BEEP(2, 100);
	movlw	(064h)
	movwf	(?_BEEP)
	movlw	(02h)
	fcall	_BEEP
	goto	l1156
	line	81
	
l1114:	
	movf	(_start),w
	skipz
	goto	u310
	goto	l1156
u310:
	line	82
	
l1116:	
;main.c: 82: if(!GPIO0){
	btfsc	(40/8),(40)&7
	goto	u321
	goto	u320
u321:
	goto	l1156
u320:
	line	83
	
l1118:	
;main.c: 83: OFF_TIMER=0;
	clrf	(main@OFF_TIMER)
	line	84
;main.c: 84: while(!GPIO0){
	goto	l1144
	line	85
	
l1120:	
;main.c: 85: OFF_TIMER++;
	incf	(main@OFF_TIMER),f
	line	86
	
l1122:	
;main.c: 86: _delay((unsigned long)((100)*(8000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u397:
	decfsz	((??_main+0)+0),f
	goto	u397
	decfsz	((??_main+0)+0+1),f
	goto	u397
	decfsz	((??_main+0)+0+2),f
	goto	u397
opt asmopt_on

	line	87
	
l1124:	
;main.c: 87: if(OFF_TIMER>50){
	movlw	(033h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@OFF_TIMER),w
	skipc
	goto	u331
	goto	u330
u331:
	goto	l1144
u330:
	line	88
	
l1126:	
;main.c: 88: OFF_TIMER=0;
	clrf	(main@OFF_TIMER)
	line	89
;main.c: 89: start=0;
	clrf	(_start)
	line	90
	
l1128:	
;main.c: 90: TMR2IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	91
;main.c: 91: timer2count=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_timer2count)
	line	92
;main.c: 92: mpmero=0;
	clrf	(_mpmero)	;volatile
	clrf	(_mpmero+1)	;volatile
	line	93
	
l1130:	
;main.c: 93: EepromWrite (LEVEL);
	movf	(main@LEVEL),w
	fcall	_EepromWrite
	line	94
	
l1132:	
;main.c: 94: BEEP(5, 100);
	movlw	(064h)
	movwf	(?_BEEP)
	movlw	(05h)
	fcall	_BEEP
	line	95
	
l1134:	
;main.c: 95: IOC = 0x01;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	96
	
l1136:	
;main.c: 96: GPIE = 1;
	bsf	(91/8),(91)&7
	line	97
	
l1138:	
;main.c: 97: GPIF = 0;
	bcf	(88/8),(88)&7
	line	98
	
l1140:	
;main.c: 98: TRISIO = 0x01;
	movlw	(01h)
	movwf	(133)^080h	;volatile
	line	99
;main.c: 99: GPIO = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	100
	
l1142:	
# 100 "C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
SLEEP ;#
psect	maintext
	line	84
	
l1144:	
	btfss	(40/8),(40)&7
	goto	u341
	goto	u340
u341:
	goto	l1120
u340:
	line	103
	
l1146:	
;main.c: 101: }
;main.c: 102: }
;main.c: 103: if(start){
	movf	(_start),w
	skipz
	goto	u350
	goto	l1156
u350:
	line	104
	
l1148:	
;main.c: 104: if(LEVEL<4){
	movlw	(04h)
	subwf	(main@LEVEL),w
	skipnc
	goto	u361
	goto	u360
u361:
	goto	l389
u360:
	line	105
	
l1150:	
;main.c: 105: LEVEL++;
	incf	(main@LEVEL),f
	line	106
	
l1152:	
;main.c: 106: BEEP(LEVEL, 100);
	movlw	(064h)
	movwf	(?_BEEP)
	movf	(main@LEVEL),w
	fcall	_BEEP
	line	107
;main.c: 107: }else{
	goto	l1156
	
l389:	
	line	108
;main.c: 108: LEVEL=1;
	clrf	(main@LEVEL)
	incf	(main@LEVEL),f
	line	109
	
l1154:	
;main.c: 109: BEEP(LEVEL, 100);
	movlw	(064h)
	movwf	(?_BEEP)
	movlw	(01h)
	fcall	_BEEP
	line	117
	
l1156:	
;main.c: 110: }
;main.c: 112: }
;main.c: 113: }
;main.c: 114: }
;main.c: 117: if(PERC[LEVEL-1]<mpmero){
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(main@LEVEL),w
	addlw	main@PERC+-2&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_main+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_main+0)+0+1
	movf	(_mpmero+1),w	;volatile
	subwf	1+(??_main+0)+0,w
	skipz
	goto	u375
	movf	(_mpmero),w	;volatile
	subwf	0+(??_main+0)+0,w
u375:
	skipnc
	goto	u371
	goto	u370
u371:
	goto	l1160
u370:
	line	118
	
l1158:	
;main.c: 118: mpmero=0;
	clrf	(_mpmero)	;volatile
	clrf	(_mpmero+1)	;volatile
	line	120
	
l1160:	
;main.c: 119: }
;main.c: 120: if(jelzes){
	movf	(_jelzes),w
	skipz
	goto	u380
	goto	l1172
u380:
	line	121
	
l1162:	
;main.c: 121: GPIO1=1;
	bsf	(41/8),(41)&7
	line	122
	
l1164:	
;main.c: 122: BEEP(1, 100);
	movlw	(064h)
	movwf	(?_BEEP)
	movlw	(01h)
	fcall	_BEEP
	line	123
	
l1166:	
;main.c: 123: _delay((unsigned long)((100)*(8000000/4000.0)));
	opt asmopt_off
movlw  2
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u407:
	decfsz	((??_main+0)+0),f
	goto	u407
	decfsz	((??_main+0)+0+1),f
	goto	u407
	decfsz	((??_main+0)+0+2),f
	goto	u407
opt asmopt_on

	line	124
	
l1168:	
;main.c: 124: GPIO1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	125
	
l1170:	
;main.c: 125: jelzes=0;
	clrf	(_jelzes)
	line	127
	
l1172:	
;main.c: 126: }
;main.c: 127: _delay((unsigned long)((10)*(8000000/4000.0)));
	opt asmopt_off
movlw	26
movwf	((??_main+0)+0+1),f
	movlw	248
movwf	((??_main+0)+0),f
u417:
	decfsz	((??_main+0)+0),f
	goto	u417
	decfsz	((??_main+0)+0+1),f
	goto	u417
	clrwdt
opt asmopt_on

	goto	l1106
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	129
	signat	_main,88
	global	_BEEP
psect	text116,local,class=CODE,delta=2
global __ptext116
__ptext116:

;; *************** function _BEEP *****************
;; Defined at:
;;		line 157 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
;; Parameters:    Size  Location     Type
;;  hany            1    wreg     unsigned char 
;;  hossz           1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  hany            1    6[COMMON] unsigned char 
;;  i               2    7[COMMON] unsigned short 
;;  y               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         4       0       0
;;      Temps:          3       0       0
;;      Totals:         8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text116
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
	line	157
	global	__size_of_BEEP
	__size_of_BEEP	equ	__end_of_BEEP-_BEEP
	
_BEEP:	
	opt	stack 7
; Regs used in _BEEP: [wreg+status,2+status,0]
;BEEP@hany stored from wreg
	line	160
	movwf	(BEEP@hany)
	
l1040:	
;main.c: 158: unsigned short i;
;main.c: 159: unsigned char y;
;main.c: 160: for(y=0; y<hany; y++){
	clrf	(BEEP@y)
	goto	l1054
	line	161
	
l1042:	
;main.c: 161: for(i=0; i<hossz; i++){
	clrf	(BEEP@i)
	clrf	(BEEP@i+1)
	goto	l1048
	line	162
	
l1044:	
;main.c: 162: _delay((unsigned long)((100)*(8000000/4000000.0)));
	opt asmopt_off
movlw	66
movwf	(??_BEEP+0)+0,f
u427:
decfsz	(??_BEEP+0)+0,f
	goto	u427
	clrwdt
opt asmopt_on

	line	163
;main.c: 163: GPIO2=!GPIO2;
	movlw	1<<((42)&7)
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((42)/8),f
	line	161
	
l1046:	
	incf	(BEEP@i),f
	skipnz
	incf	(BEEP@i+1),f
	
l1048:	
	movf	(BEEP@hossz),w
	movwf	(??_BEEP+0)+0
	clrf	(??_BEEP+0)+0+1
	movf	1+(??_BEEP+0)+0,w
	subwf	(BEEP@i+1),w
	skipz
	goto	u245
	movf	0+(??_BEEP+0)+0,w
	subwf	(BEEP@i),w
u245:
	skipc
	goto	u241
	goto	u240
u241:
	goto	l1044
u240:
	
l409:	
	line	165
;main.c: 164: }
;main.c: 165: GPIO2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(42/8),(42)&7
	line	166
	
l1050:	
;main.c: 166: _delay((unsigned long)((100)*(8000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_BEEP+0)+0+2),f
movlw	3
movwf	((??_BEEP+0)+0+1),f
	movlw	186
movwf	((??_BEEP+0)+0),f
u437:
	decfsz	((??_BEEP+0)+0),f
	goto	u437
	decfsz	((??_BEEP+0)+0+1),f
	goto	u437
	decfsz	((??_BEEP+0)+0+2),f
	goto	u437
opt asmopt_on

	line	160
	
l1052:	
	incf	(BEEP@y),f
	
l1054:	
	movf	(BEEP@hany),w
	subwf	(BEEP@y),w
	skipc
	goto	u251
	goto	u250
u251:
	goto	l1042
u250:
	line	168
	
l411:	
	return
	opt stack 0
GLOBAL	__end_of_BEEP
	__end_of_BEEP:
;; =============== function _BEEP ends ============

	signat	_BEEP,8312
	global	_EepromWrite
psect	text117,local,class=CODE,delta=2
global __ptext117
__ptext117:

;; *************** function _EepromWrite *****************
;; Defined at:
;;		line 196 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
;; Parameters:    Size  Location     Type
;;  adat            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  adat            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text117
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
	line	196
	global	__size_of_EepromWrite
	__size_of_EepromWrite	equ	__end_of_EepromWrite-_EepromWrite
	
_EepromWrite:	
	opt	stack 7
; Regs used in _EepromWrite: [wreg+status,2]
;EepromWrite@adat stored from wreg
	movwf	(EepromWrite@adat)
	line	197
	
l996:	
;main.c: 197: EEADR = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(155)^080h	;volatile
	line	198
	
l998:	
;main.c: 198: EEDATA = adat;
	movf	(EepromWrite@adat),w
	movwf	(154)^080h	;volatile
	line	199
	
l1000:	
;main.c: 199: WREN = 1;
	bsf	(1250/8)^080h,(1250)&7
	line	200
	
l1002:	
;main.c: 200: GIE = 0;
	bcf	(95/8),(95)&7
	line	201
	
l1004:	
;main.c: 201: EECON2 = 0x55;
	movlw	(055h)
	movwf	(157)^080h	;volatile
	line	202
	
l1006:	
;main.c: 202: EECON2 = 0xAA;
	movlw	(0AAh)
	movwf	(157)^080h	;volatile
	line	203
	
l1008:	
;main.c: 203: WR = 1;
	bsf	(1249/8)^080h,(1249)&7
	line	204
;main.c: 204: while (WR == 1);
	
l426:	
	btfsc	(1249/8)^080h,(1249)&7
	goto	u201
	goto	u200
u201:
	goto	l426
u200:
	
l428:	
	line	205
;main.c: 205: GIE = 1;
	bsf	(95/8),(95)&7
	line	206
;main.c: 206: WREN = 0;
	bcf	(1250/8)^080h,(1250)&7
	line	207
	
l429:	
	return
	opt stack 0
GLOBAL	__end_of_EepromWrite
	__end_of_EepromWrite:
;; =============== function _EepromWrite ends ============

	signat	_EepromWrite,4216
	global	_EepromRead
psect	text118,local,class=CODE,delta=2
global __ptext118
__ptext118:

;; *************** function _EepromRead *****************
;; Defined at:
;;		line 185 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  result          2    4[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned short 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text118
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
	line	185
	global	__size_of_EepromRead
	__size_of_EepromRead	equ	__end_of_EepromRead-_EepromRead
	
_EepromRead:	
	opt	stack 7
; Regs used in _EepromRead: [wreg+status,2]
	line	187
	
l986:	
;main.c: 186: unsigned short result;
;main.c: 187: EEADR = 0;
	clrf	(155)^080h	;volatile
	line	188
	
l988:	
;main.c: 188: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	189
	
l990:	
;main.c: 189: result = EEDATA;
	movf	(154)^080h,w	;volatile
	movwf	(EepromRead@result)
	clrf	(EepromRead@result+1)
	line	190
	
l992:	
;main.c: 190: return result;
	movf	(EepromRead@result+1),w
	movwf	(?_EepromRead+1)
	movf	(EepromRead@result),w
	movwf	(?_EepromRead)
	line	191
	
l423:	
	return
	opt stack 0
GLOBAL	__end_of_EepromRead
	__end_of_EepromRead:
;; =============== function _EepromRead ends ============

	signat	_EepromRead,90
	global	_isr
psect	text119,local,class=CODE,delta=2
global __ptext119
__ptext119:

;; *************** function _isr *****************
;; Defined at:
;;		line 132 in file "C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  397[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text119
	file	"C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
	line	132
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 6
; Regs used in _isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+0)
	movf	pclath,w
	movwf	(??_isr+1)
	ljmp	_isr
psect	text119
	line	133
	
i1l1010:	
;main.c: 133: if(GPIF == 1){
	btfss	(88/8),(88)&7
	goto	u21_21
	goto	u21_20
u21_21:
	goto	i1l1026
u21_20:
	line	135
	
i1l1012:	
;main.c: 135: PCON = 0b0010000;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(142)^080h	;volatile
	line	136
	
i1l1014:	
;main.c: 136: GPIF = 0;
	bcf	(88/8),(88)&7
	line	137
	
i1l1016:	
;main.c: 137: PCON = 0x00;
	clrf	(142)^080h	;volatile
	line	138
	
i1l1018:	
;main.c: 138: GPIE = 0;
	bcf	(91/8),(91)&7
	line	139
	
i1l1020:	
;main.c: 139: IOC = 0;
	clrf	(150)^080h	;volatile
	line	140
;main.c: 140: TRISIO = 0x01;
	movlw	(01h)
	movwf	(133)^080h	;volatile
	line	141
	
i1l1022:	
;main.c: 141: GPIO = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	142
	
i1l1024:	
# 142 "C:\Users\DPTP\Dropbox\PIC_Programozas\P12F683\szentkiralyi_kupak\main.c"
NOP ;#
psect	text119
	line	143
;main.c: 143: }else{
	goto	i1l402
	line	144
	
i1l1026:	
;main.c: 144: if(timer2count>99){
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_timer2count),w
	skipc
	goto	u22_21
	goto	u22_20
u22_21:
	goto	i1l1036
u22_20:
	line	148
	
i1l1028:	
;main.c: 148: timer2count = 0;
	clrf	(_timer2count)
	line	149
	
i1l1030:	
;main.c: 149: mpmero++;
	incf	(_mpmero),f	;volatile
	skipnz
	incf	(_mpmero+1),f	;volatile
	line	150
	
i1l1032:	
;main.c: 150: if(mpmero<11){ jelzes=1; }
	movlw	high(0Bh)
	subwf	(_mpmero+1),w	;volatile
	movlw	low(0Bh)
	skipnz
	subwf	(_mpmero),w	;volatile
	skipnc
	goto	u23_21
	goto	u23_20
u23_21:
	goto	i1l1036
u23_20:
	
i1l1034:	
	clrf	(_jelzes)
	incf	(_jelzes),f
	line	152
	
i1l1036:	
;main.c: 151: }
;main.c: 152: timer2count++;
	incf	(_timer2count),f
	line	153
	
i1l1038:	
;main.c: 153: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	155
	
i1l402:	
	movf	(??_isr+1),w
	movwf	pclath
	movf	(??_isr+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,90
psect	text120,local,class=CODE,delta=2
global __ptext120
__ptext120:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
