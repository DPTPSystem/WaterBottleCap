# Water Bottle Smart Cap
* Kupak elektronika: Vízfogyasztásra figyelmeztető elektronika
* DPTP System 2032-05-28.
* Projekt keletkezése: 2016-05-13.
* PIC12F683, HI-TECH C for PIC10/12/16

![DPTP System - WBSC](https://github.com/DPTPSystem/WaterBottleCap/blob/master/images/pcb_3.PNG "DPTP System - WBSC")

# Miért
Egy magyarországi fejlesztő csapat keresett meg egy olyan okos karorával kapcsolatos fejlesztésük keretein belül, amely többeközt a viselő 
bőrtípusától függően vagy függetlenűl képes a börpigment elváltozásaiból megállapítani az egyes éllettani tulajdonásgait. Vagy is ez volt a
cél, és ennek egyik eleme volt a alacsony energia igényű (BLE) bluetooth kapcsolat, amelyet egy nRF8001-es chip biztosította. A fő kérés a 
nyákokra való kisméretű chipek szakszerű felforrasztása volt, de mivel ez a technológia engem is érdekelt el kezdtem a saját fejlesztéseimet.
Ez a szál ezt mutaja és osztja meg az érdeklődőkkel.

# Célok
Általánosan elmondható illetve jellemző, hogy kevés vizet és azt is csak ritkán elnagyolt időközzel fogyasztunk. A kupak elektronika célja, 
hogy figyelmeztessen bennünket egy viszonylag betartható időközönkénti vízfogyasztásra. A víz lételemünk, elválaszthatatlanok vagyunk tőle, 
hiszen víz nélkül nincs élet. Az emberi szervezetnek átlagosan 60-65 % -a víz, amely részben a sejten belül, részben a sejten kívül helyezkedik 
el. Az életkor előrehaladtával sajnos a víz aránya csökken. Ennek a csökkent vízmennyiségnek kell ellátnia folyadékkal testünk minden részét.
Éppen ezért a víznek különleges szerepe van az élő szervezetben:
1. biztosítja a vérkeringést, a vér ozmózis nyomását;
2. a szükséges tápanyagok oldását, felszívódását, szállítását;
3. befolyása van a vér sav-bázis egyensúlyára;
4. hő szabályozó szerepével biztosítja a közel állandó belső hőmérsékletét.
A felnőtt emberi szervezetnek 2-2,5 liter folyadék felvételére van szüksége naponta. Ezt a vízigényt táplálékkal és közvetlen folyadékfelvétellel 
fedezi. A szervezet vízkészletének állandóságát egyrészt a vízfelvételre serkentő szomjúságérzés, másrészt a vízkonzerválást széles határok között 
biztosító veseműködés teszi lehetővé. Itt jön képbe az agy és annak működése. Napi 1400 milliliter víz folyik át agyunkon és 2000 milliliter víz 
mossa át vesénket. Az emberi szervezet igen takarékosan bánik vízkészletével, és naponta mindössze kb. 2,4 litert választ ki. A baj, hogy az agyunk 
a legnagyobb ellenségünk vízfogyasztás szempontjából, mivel nem jelzi kellő időben előre, hogy szomjasak vagyunk, csak akkor, amikor már rendszerint 
„késő”. Az emberi agy annyira lusta, hogy csak abban az esetben jelez időben, ha azért semmit nem kell tennie. Ha valamilyen külső inger éri, pl. 
szem előtt van a víz és még valamilyen más külső hatásra is kénytelen oda figyelni (pl. a szóban forgó elektronikára, hiszen az hang és fényjelzést
is ad), akkor az agyunk is odafigyel a vízfogyasztásunkra. A kupak elektronika mellett az is kell, hogy mellettünk legyen a palack víz, mert mi 
magunk is annyira lusták vagyunk, hogy ha ki kell menni a szobából a konyhába a vízért, már nehezebben mozdulunk meg, mint ha csak a kezünket kell 
kinyújtani. Ebből adódik, hogy e projekt hivatott az egészségünk megóvására és mivel ilyen elektronikával nem találkoztam még, mondhatni, hogy 
innovációnk az újdonság erejével bír

# Működés
Az eszköz oldalából kinyúló vékony műanyag lemez eltávolításával lehet működésbe hozni az eszközt. Indulásnál 1 hosszabb sípolással és fényjelzéssel 
jelzi az eszköz az aktív állapotot, illetve a készenlétet. A program minden gombnyomást egy nagyon rövid sípolással nyugtáz. Első gombnyomásra a 
program aktiválódik, melyet 2 rövid sípolással visszajelez és az alapértelmezett 15 perces időközi figyelmeztetéseket megkezdi (a tesztelések miatt 
ez 1percre lett csökkentve). Minden további gombnyomással a program léptet egyet az előre meghatározott időközökben: 15-30-45-60 perc.

Az eszköz a gombnyomást követően az éppen aktuálisan beállított időközi lépésnek megfelelő hangvisszajelzést is ad:
1. 15 perc = 1 sípolás
2. 30 perc = 2 sípolás
3. 45 perc = 3 sípolás
4. 60 perc = 4 sípolás.
A 60 perces beállított érték utáni újabb gombnyomásnál a ciklus újra kezdődik, vagy is ismét a kezdeti 15 perces2 időközi figyelmeztetés lesz érvényben.
A program leállítható egy folyamatos minimum 5mp-ig tartó gombnyomásra, mely után az eszköz standby állapotba kerül. A standby állapotba lépést az eszköz 
5 hosszabb hang visszajelzéssel adja tudtunkra. Újabb gombnyomásnál az eszköz felébred és az utoljára beállított időközzel, azonnal megkezdi az idő mérését.
A program folyamatosan másodpercenkénti időméréssel számolja az eltelt időt. Ha a mért idő eléri a beállított időt, akkor az eszköz 10 másodpercig tartó, 
rövidebb szakaszos sípolással és villogó fénnyel jelzi a vízfogyasztás idejét. Az eszköz a beállításokat folyamatosan elmenti, ha az elem lemerül, elemcserét 
követően azonnal indul a program, ezt 1 hosszabb sípolással és fénnyel vissza is jelzi, majd gombnyomásra az utoljára elmentett idő és a program aktiválódik 
és megkezdi az idő mérését. Minden további funkció a már fentebb leírt módon értelmezhető.

# Hardver komponensek
1db SMD SOP8 PIC12F683 mikrokontroller3
1db SMD 1206 220-470R ellenállás
1db SMD slim mikrokapcsoló
1db SMD 1206 LED (zöld, piros, sárga, kék, fehér)
1db SMD 1206 100nF kerámia kondenzátor
1db SMD 1206 1K ellenállás
1db SMD NPN tranzisztor
2db SMD 1206 10K ellenállás
1db SMD slim buzzer (3v)
1db CR2032 elem (3v)
1db CR2032 elemfoglalat (felület szerelhető)
Méretek:
A nyák átmérője 275mm.
Magassága: kb. 10mm, burkolati elem nélkül.

# Kapcsolási rajz

![DPTP System - WBSC](https://github.com/DPTPSystem/WaterBottleCap/blob/master/images/sematic_1.PNG "DPTP System - WBSC")

![DPTP System - WBSC](https://github.com/DPTPSystem/WaterBottleCap/blob/master/images/sematic_2.PNG "DPTP System - WBSC")

# Nyáktervek
A nyáktervek SMD egyoldalas áramköri rajzolattal készültek.

![DPTP System - WBSC](https://github.com/DPTPSystem/WaterBottleCap/blob/master/images/kupak_1.PNG "DPTP System - WBSC")

![DPTP System - WBSC](https://github.com/DPTPSystem/WaterBottleCap/blob/master/images/kupak_2.PNG "DPTP System - WBSC")

# PCB

![DPTP System - WBSC](https://github.com/DPTPSystem/WaterBottleCap/blob/master/images/pcb_1.PNG "DPTP System - WBSC")

![DPTP System - WBSC](https://github.com/DPTPSystem/WaterBottleCap/blob/master/images/pcb_2.PNG "DPTP System - WBSC")

![DPTP System - WBSC](https://github.com/DPTPSystem/WaterBottleCap/blob/master/images/pcb_3.PNG "DPTP System - WBSC")

# Burkolat
A burkolatra anyagválasztásánál többféle ötlet merült fel:
1. olyan gumírozott anyag, amely nagyon rugalmas, csepp- és ütésálló.
2. olyan merevfalú műanyag burkolat, amelynek csepp- és ütésállósága megegyezik a gumírozott anyagéval
3. olyan gumírozott szövet, amely könnyedén felveszi a palack hengeres formáját, csepp- és ütésálló
Mindhárom esetben az elektronikának biztosítani kell a megfelelő védelmet, mint például:
1. nagyfokú igénybevétel, ütés-, csepp- és egyéb kisebb mennyiségű folyadékállóság.
Az elektronika burkolat kivitelezésénél szintén több ötlet merült fel:
1. a palack kupakjában történő elhelyezés
2. egy kupakra külsőleg ráhúzható teljesen különálló, úgymond kupakhuzat, amely teljes egészében vagy részben takarná el az eredeti zárókupakot.
3. egy olyan tépőzáras palack-öv, amely mint egy karóra fogná körbe a palack kerületét
4. egy olyan szűkebb gumírozott palack-öv, amely a 3. pontban leírtaknak megfelelően funkcionál
A burkolatnak mind e mellett biztosítania kell, hogy a belső hang és fényjelzést áteressze. A projekt fejlesztése közben figyelembe vettem, hogy 
az eszköz huzamosabb ideig lesz használatban, ezért minimális áramfogyasztás mellett is sokáig működjön, illetve minimális komponensből álljon, 
és az előállítási költségét tekintve is alacsonyan lehessen tartani, mivel egy olyan eszközről van szó, melyet esetenként milliós számban kellene 
előállítani.

# Kapcsolodó videós tartalmak
DPTP System - Kupak elektronika

[![DPTP System - WBSC](https://img.youtube.com/vi/LDBDLTYmF1c/0.jpg)](https://www.youtube.com/watch?v=LDBDLTYmF1c)

DPTP System - Vízfogyasztásra ösztönző elektronika

[![DPTP System - WBSC](https://img.youtube.com/vi/Fg6iMSZSsOc/0.jpg)](https://www.youtube.com/watch?v=Fg6iMSZSsOc)