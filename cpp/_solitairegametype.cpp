//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitairegametype.cpp
//  Datum       : 02.12.2008
//******************************************************************************************************************************************************************************************************
 
#include "../hpp/_solitairegametype.hpp"
 
const int KLONDIKE_1=0;			// klondike game, one card
const int KLONDIKE_3=1;			// klondike game, three cards
const int SPIDER_1=2;			// spider game, one suit
const int SPIDER_2=3;			// spider game, two suits
const int SPIDER_4=4;			// spider game, four suits
const int EIGHTOFF=5;			// Eight off game
const int FREECELL=6;			// Freecell
const int FORECELL=7;			// Forecell
const int AUSTRALIAN=8;			// Australian
const int BETROTHAL=9;			// Betrothal
const int BLINDA=10	;			// Blind Alleys
const int BLANKET=11;			// Blanket
const int CANCAN=12;			// Can-Can
const int CRUEL=13;				// Cruel solitaire
const int PYRAMID=14;			// Pyramid solitaire
const int GOLF=15;				// Golf
const int YUKON=16;				// Yukon 1
const int FOURCOL=17;			// Four colors
const int SCORPION=18;			// Scorpion
const int DKLONDIKE_1=19;		// 2 pack klondike 1 card
const int DKLONDIKE_3=20;		// 2 pack klondike 3 cards
const int RUSSIAN=21;    		// Russian Solitaire
const int SEATOWERS=22;  		// Sea Towers
const int LIMITEDCOVERED=23; 	// limited covered
const int LADYPALK=24;   		// ladypalk
const int LABYRINTH=25;         // labyrinth
const int LABYRINTHEASIER=26;   // labyrintheasire
const int LABYRINTHRODENBACH=27;// labyrinthrodenbach
const int LABYRINTHDOUBLE=28;   // labyrinthdouble
const int OSMOSIS=29;			// Osmosis
const int GOLFEASY=30 ;  		// golfeasy
const int KINGSPEAK=31;  		// kingspeak
const int FORTYTHIEVES=32;  	// fortythieves
const int LABELLELUCIE=33;  	// la belle lucie
const int LAFACILELUCIE=34; 	// la facile lucie
const int RUSSIANEASY=35;   	// russian easy
const int RUSSIANFREE=36;   	// russian free
const int ACESUP=37; 	   		// Aces Up
const int ACME=38; 	 	  		// Acme
const int ACESUPEASY=39; 	 	// Aces up easy
const int ANT=40; 			 	// ant
const int AUNTMARY=41;			// aunt mary
const int AUNTFREEMARY=42;		// aunt free mary
const int BAKERSDOZEN=43;		// bakers dozen
const int BAKERSGAME=44;		// bakers game
const int FLOWERGARDEN=45;		// flower garden
const int GARGANTUA=46;			// gargantua
const int GIANT=47;				// giant
const int INDIAN=48;			// indian
const int MISSMILLIGAN=49;		// miss milligan
const int KLONDIKECONTRA=50	;	// klondike contra
const int CONTRAFLOW=51;		// contra flow
const int FREECELLDOUBLE=52;	// freecell double
const int SINGLERAIL=53;		// single rail
const int SOLIDSQUARE=54;		// solid square
const int SPIDERETTE=55;		// spiderette
const int STONEWALL=56;			// stonewall
const int SPIDERLINGE=57;		// spiderlinge
const int MAZE=58;				// maze
const int MARTHA=59;			// martha
const int LIMITED=60;			// limited
const int NAPOLEONSSQUARE=61;	// napoleons square
const int PYRAMIDDOUBLE=62;		// pyrmaid double
const int FREEWALL=63; 			// free wall
const int CARRENAPOLEON=64 ;	// carre napoleon
const int MAZEEASY=65; 			// maze easy
const int MAZETWOSUIT=66; 		// maze two suit
const int MAZEEASYTWOSUIT=67;	// maze easy two suit
const int BLANKETTWOSUIT=68;	// blanket two suit
const int PAIRSCROSS=69;		// pairscross
const int STONEWALLEASY=70;		// stone wall easy
const int FORTYTHIEVESDOUBLESTOCK=71;// forty thieves doubls stock
const int FORTYTHIEVESREDEAL=72;// forty thieves redeal
const int PYRAMIDRESERVE=73; 	// pyramid reserve
const int SPIDERSUPERSTOCK=74; 	// spider super stock
const int SWEETMATCH=75;		// sweetmatch
const int VERYEASY=76;			// veryeasy


const int gametypecount=77;

_gametype const gametype[gametypecount]={ 
{0, 1.0, 7.0, 4,4 , 0.5, 1, 52 , L"Klondike 1 Card","_kondike1"},
{0, 0.5, 7.0, 3,6 , 0.6, 1, 52 , L"Klondike 3 Cards","_kondike3"},

{1, 1.0, 6  , 2,0 , 0.3, 2, 104, L"Spider Easy (1 suit)", "_spider1"},
{1, 0.8, 7  , 0,0 , 0.5, 2, 104, L"Spider Medium (2 suits)","_spider2"},
{1, 0.7, 8  , 0,0 , 0.7, 2, 104, L"Spider Hard (4 suits)","_spider4"},
{2, 0.5, 15 , 7,3 , 0.7, 1, 52 , L"Eight Off","_eightoff"},

{2, 1.0, 15 , 6,3 , 0.7, 1, 52 , L"Free Cell","_freecell"},
{2, 0.8, 15 , 4,4 , 0.7, 1, 52 , L"Fore Cell","_forecell"},
{0, 0.3, 7  , 3,7 , 0.5, 1, 52 , L"Australian","_australian"},
{6, 0.5, 5  ,10,3 , 0.3, 1, 50 , L"Betrothal","_betrothal"},

{0, 0.6, 5  , 5,3 , 0.5, 1, 52 , L"Blind Alleys","_blindalleys"},
{3, 0.7, 7  , 9,7 , 0.5, 1, 48 , L"Blanket","_blanket"},
{6, 0.6, 5  , 7,3 , 0.5, 1, 52 , L"Can-Can","_cancan"},
{5, 0.1, 5  , 0,1 , 0.5, 1, 52 , L"Cruel","_cruel"},

{3, 1.0, 5  , 8,52, 0.3, 1, 52 , L"Pyramid","_pyramid"},
{6, 0.8, 5  , 4,8 , 0.3, 1, 52 , L"Golf","_golf"},
{4, 0.6, 7  , 2,5 , 0.7, 1, 52 , L"Yukon","_yukon"},
{2, 0.6, 15 , 4,9 , 0.8, 1, 52 , L"Four colors","_fourcolors"},

{1, 0.3, 7  , 0,4 , 0.9, 1, 52 , L"Scorpion","_scorpion"},
{0, 0.1, 7  , 7,2 , 0.5, 2, 104, L"Klondike Double 1 card","_klondike21"},
{0, 0.1, 7  , 2,1 , 0.5, 2, 104, L"Klondike Double 3 cards","_klondike23"},
{4, 0.5, 15 , 0,0 , 0.7, 1, 52 , L"Russian","_russian"},

{2, 0.6, 15 , 6,2 , 0.7, 1, 52 , L"Sea Towers","_seatowers"},
{0, 0.3, 7  , 8,3 , 0.5, 2, 104, L"Limited Covered","_limitedcovered"},
{0, 0.5, 7  , 1,1 , 0.5, 2, 104, L"Lady Palk","_ladypalk"},
{3, 0.6, 5  , 7,53, 0.3, 1, 52 , L"Labyrinth","_labyrinth"},

{3, 0.0, 5  , 8,52, 0.3, 1, 52 , L"Labyrinth easy","_labyrintheasier"},
{3, 0.0, 5  ,50,10, 0.3, 1, 52 , L"Labyrinth Rodenbach","_labyrinthrodenbach"},
{3, 0.0, 13 ,25,35, 0.5, 2, 104, L"Labyrinth Double","_labyrintdouble"},
{6, 0.5, 7  , 4,54, 0.3, 1, 52 , L"Osmosis Ascending","_osmosis"},

{6, 0.1, 5  , 0,0,  0.3, 1, 52 , L"Golf Easy","_golfeasy"},
{6, 0.5, 5  ,24,18, 0.3, 1, 52 , L"King's Peak","_kingspeak"},
{0, 0.5, 18 , 0,10, 0.4, 2, 104, L"Forty Thieves","_fortythieves"},
{5, 0.5, 7  , 2,24, 0.6, 1, 52 , L"La Belle Lucie","_labellelucie"},

{5, 0.0, 7  ,18,8,  0.7, 1, 52 , L"La Facile Lucie","_lafacilelucie"},
{4, 0.0, 7  , 1,1,  0.7, 1, 52 , L"Russian easy","_russianeasy"},
{4, 0.0, 7  , 2,4,  0.7, 1, 52 , L"Russian free","_russianfree"},
{6, 0.8, 6  , 0,15, 0.6, 1, 52 , L"Aces Up","_acesup"},

{0, 0.3, 5  , 0,7,  0.2, 1, 52 , L"Acme","_acme"},
{6, 0.0, 5  , 2,1,  0.3, 1, 52 , L"Aces Up Easy","_acesupeasy"},
{0, 0.0, 10 , 0,0,  0.3, 2, 104, L"Assortment","_ant"},
{4, 0.3, 5  , 0,10, 0.6, 1, 52 , L"Aunt Mary","_auntmary"},

{4, 0.0, 5  , 2,8,  0.7, 1, 52 , L"Aunt Free Mary","_auntfreemary"},
{6, 0.5, 7  , 0,0,  0.5, 1, 52 , L"Baker's Dozen","_bakersdozen"},
{2, 0.5, 10 , 0,3,  0.5, 1, 52 , L"Baker's Game","_bakersgame"},
{6, 0.5, 6  , 8,26, 0.6, 1, 52 , L"Flower Garden","_flowergarden"},

{0, 0.3, 16 , 5,5,  0.4, 2, 104, L"Gargantua","_gargantua"},
{0, 0.4, 14 , 1,12, 0.4, 2, 104, L"Giant","_giant"},
{0, 0.3, 15 ,10,0,  0.6, 2, 104, L"Indian","_indian"},
{0, 0.4, 15 , 1,11, 0.5, 2, 104, L"Miss Milligan","_missmilligan"},

{0, 0.2, 8  , 5,5,  0.6, 1, 52 , L"Klondike Contra","_klondikecontra"},
{0, 0.0, 9  , 6,6,  0.8, 1, 52 , L"Contraflow","_contraflow"},
{2, 0.2, 20 , 3,7,  0.9, 2, 104, L"Free Cell Double","_freecelldouble"},
{0, 0.1, 5  , 1,11, 0.2, 1, 52 , L"Single Rail","_singlerail"},

{5, 0.5, 14 , 7,2,  0.6, 2, 104, L"Solid Square","_solidsquare"},
{1, 0.4, 5  , 2,8,  0.8, 1, 52 , L"Spiderette Easy","_spiderette"},
{6, 0.4, 6  , 1,19, 0.7, 1, 52 , L"Stonewall","_stonewall"},
{1, 0.0, 7  , 3,6,  0.3, 1, 78 , L"Little Spiderling","_spiderlinge"},

{3, 0.2, 7  , 0,0,  0.3, 1, 44 , L"Maze","_maze"},
{6, 0.5, 6  , 9,3,  0.5, 1, 52 , L"Martha","_martha"},
{0, 0.5, 8  , 0,0,  0.4, 2, 104, L"Limited","_limited"},
{5, 0.5, 7  ,21,49, 0.3, 2, 104, L"Napoleon's Square","_napoleonssquare"},

{3, 0.1, 7  , 0,9,  0.2, 2, 104, L"Pyramid Large","_pyramiddouble"},
{2, 0.0, 6  , 5,10, 0.5, 1, 52 , L"Free Wall","_freewall"},
{0, 0.5, 7  , 1,0,  0.5, 2, 104, L"Carre Napoleon","_carrenapoleon"},
{3, 0.0, 7  , 0,0,  0.3, 1, 44 , L"Maze Easy","_mazeeasy"},

{3, 0.0, 7  , 0,0,  0.3, 2, 44 , L"Maze Two Suit","_mazetwosuit"},
{3, 0.0, 7  , 2,4,  0.3, 1, 44 , L"Maze Easy Two Suit","_mazeeasytwosuit"},
{3, 0.0, 7  , 1,1,  0.5, 2, 48 , L"Blanket Two Suit","_blankettwosuit"},
{3, 0.0, 8  , 1,1,  0.7, 1, 8  , L"Pair's Cross","_pairscross"},

{6, 0.0, 6  ,13,12, 0.7, 1, 52 , L"Stonewall Easy","_stonewalleasy"},
{0, 0.0, 18 , 4,1,  0.5, 2, 104, L"Forty Thieves Double Stock","_fortythievesdoublestock"},
{0, 0.0, 18 , 1,5,  0.4, 2, 104, L"Forty Thieves Redeal","_fortythievesredeal"},
{3, 0.0, 10 , 0,0,  0.4, 2, 104, L"Pyramid Reserve","_pyramidreserve"},

{1, 0.0, 7  , 4,2,  0.4, 2, 104, L"Spider Super Stock","_spidersuperstock"},
{0, 0.0, 5  , 0,0,  0.4, 1, 8  , L"<experimentell>","_sweetmatch"},
{0, 0.0, 1  , 0,0,  0.1, 1, 1  , L"Very easy","_veryeasy"}
};

//schwierigkeit : 
// 0.0-0.2 : sehr leicht (0.1)
// 0.2-0.4 : leicht (0.3)
// 0.4-0.6 : mäßig (0.5)
// 0.4-0.6 : schwer (0.7)
// 0.4-0.6 : sehr schwer (0.9)	

//typgruppen werden definiert :
// 0 : klondikegruppe
// 1 : spidergruppe
// 2 : freecellgruppe
// 3 : Feldgruppe
// 4 : Yukongruppe
// 5 : cruel
// 6 : sonstige							

 _zeichenkette<_tt> gameobjective[1000];

_zeichenkette<_tt> gametypegroupnames[]={
				L"Klondike",
				L"Spider",
				L"Freecell",
				L"Feld",
				L"Yukon",
				L"Cruel",
				L"Sonstige"};

//******************************************************************************************************************
//										G A M E S P I D E R O N E S U I T E
//******************************************************************************************************************
_gamespideronesuit::_gamespideronesuit(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
};
_gamespideronesuit::_gamespideronesuit(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
                index=SPIDER_1;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();	
				createpiletableau(10,-11,7);
				createpilestock(-11,7+taby,1,0);
				for(_tg pdx=0;pdx<7.5;pdx+=1) createpilediscard(-9+tabx+pdx*tabx,7+taby);
				tableaugivesamesuit(true);
				tableaugivedescending(true);
				tableautakesamesuit(true);
				tableautakedescending(true);
				createcards(8,zufall<int>(0,3));
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(0.5,0,-39);
				cameraposition[2].setzen(1,2,-39);
				camerapositionmenu[2].setzen(4,9,-57);
				camerapositionpreview[1].setzen(4,0,-75);
				camerapositionpreview[2].setzen(0,-7,-80);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(-11+10*tabx,7+taby);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-16,-10,0);
				_animationmove*a0=new _animationmove(this,10,2,0,50,9);
				_animationmove*a01=new _animationmove(this,-6,-6,0,50,9,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),104,60,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),90,10);
				a3->soundsingle=true;
				for(n=0;n<4;n++) a3->use(piletableau(n),6);
				for(n=4;n<10;n++) a3->use(piletableau(n),5);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<4;n++) {
				 _pile*p=piletableau(n);
				 as->use(p,6);
				};
				for(n=4;n<10;n++) as->use(piletableau(n),5);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				a4->usesoundaction=false;
				a4->usesoundstart=false;
				a4->soundstart=solitaire->sspend;
				for(n=0;n<10;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gamespideronesuit::tipp(){
				startusing();
				if(tipptableaucompleterow()){
				 tippexecutecompleterow();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableau(0,true,true,true)){
				 tippexecutemove();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamespideronesuit::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tipptableaucompleterow()){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
	 			  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(autoplaymovetableau(1)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamespideronesuit::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if((tipptableaucompleterow())&&(solitaire->autodiscard)){
				  autoplayanimationpiletopile(true,true);return(true);
	 			 }else if((tipptableauturn())&&(solitaire->autoturncard)){
	 			  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(15,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if((tipptableauemptypile())&&(solitaire->autoempty)){
				  autoplayanimationpiletopile(true,true);return(true);
				 };
				};
				return(false);
};
bool _gamespideronesuit::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplaycompleterow(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplaytableaumove(card,true,true,true)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaytableauemptypile(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E S P I D E R T W O S U I T 
//******************************************************************************************************************
_gamespidertwosuit::_gamespidertwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_gamespideronesuit(s,mo,prev,menue,i){
};
_gamespidertwosuit::_gamespidertwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamespideronesuit(s,mo,prev,menue,SPIDER_2){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				int suit[2];
				createpiletableau(10,-11,7);
				 createpilestock(-11,7+taby,1,0);
				for(_tg pdx=0;pdx<7.5;pdx+=1) createpilediscard(-9+tabx+pdx*tabx,7+taby);
				tableaugivesamesuit(true);
				tableaugivedescending(true);
				tableautakedescending(true);
				suit[0]=zufall<int>(0,3);
				if(suit[0]==0) suit[1]=zufall<int>(1,2);
				if(suit[0]==1) suit[1]=zufall<int>(0,1)*3;
				if(suit[0]==2) suit[1]=zufall<int>(0,1)*3;
				if(suit[0]==3) suit[1]=zufall<int>(1,2);
				createcards(4,suit[0]);
				createcards(4,suit[1]);
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(0.5,0,-39);
				cameraposition[2].setzen(1,2,-39);
				camerapositionmenu[2].setzen(4,9,-57);
				camerapositionpreview[1].setzen(4,0,-75);
				camerapositionpreview[2].setzen(0,-7,-80);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(-11+10*tabx,7+taby);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-16,-10,0);
				_animationmove*a0=new _animationmove(this,10,2,0,50,9);
				_animationmove*a01=new _animationmove(this,-6,-6,0,50,9,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),104,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				a3->soundsingle=false;
				for(n=0;n<4;n++) a3->use(piletableau(n),6);
				for(n=4;n<10;n++) a3->use(piletableau(n),5);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<4;n++) as->use(piletableau(n),6);
				for(n=4;n<10;n++) as->use(piletableau(n),5);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				a4->soundaction=solitaire->ssingle;
				a4->usesoundaction=false;
				a4->usesoundstart=false;
				for(n=0;n<10;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gamespidertwosuit::tipp(){
				startusing();
				if(tipptableaucompleterow()){
				 tippexecutecompleterow();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);//tippexecuteemptypile()
				}else if(tipptableau(0,true)){
				 tippexecutemove();return(true);
				}else if(tipptableau(0,false)){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};	
bool _gamespidertwosuit::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tipptableaucompleterow()){
	 			  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
	 			  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(15,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
 				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamespidertwosuit::clickplay(_card*card){
				 startusing();
				 deinsertpick();
				 if(clickplaycompleterow(card)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(card->turnedup()==false){
				  card->turn(solitaire->autospeed/2,true);return(true);
				 }else if(clickplaytableauemptypile(card)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(clickplaytableaumove(card,true)){
			 	  autoplayanimationpiletopile();return(true);
				 }else if(clickplaytableaumove(card)){
				  autoplayanimationpiletopile();return(true);
				 };
				return(false);
};

//******************************************************************************************************************
//										G A M E S P I D E R F O U R S U I T 
//******************************************************************************************************************
_gamespiderfoursuit::_gamespiderfoursuit(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamespidertwosuit(s,mo,prev,menue,SPIDER_4){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(10,-11,7);
				createpilestock(-11,7+taby,1,0);
				for(_tg pdx=0;pdx<7.5;pdx+=1) createpilediscard(-9+tabx+pdx*tabx,7+taby);
				tableaugivesamesuit(true);
				tableaugivedescending(true);
				tableautakedescending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(0.5,0,-39);
				cameraposition[2].setzen(1,2,-39);
				camerapositionmenu[2].setzen(4,9,-57);
				camerapositionpreview[1].setzen(4,0,-75);
				camerapositionpreview[2].setzen(0,-7,-80);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(-11+10*tabx,7+taby);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-16,-10,0);
				_animationmove*a0=new _animationmove(this,10,2,0,50,9);
				_animationmove*a01=new _animationmove(this,-6,-6,0,50,9,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),104,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				a3->soundsingle=false;
				for(n=0;n<4;n++) a3->use(piletableau(n),6);
				for(n=4;n<10;n++) a3->use(piletableau(n),5);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<4;n++) as->use(piletableau(n),6);
				for(n=4;n<10;n++) as->use(piletableau(n),5);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<10;n++) a4->use(piletableau(n));
				a4->usesoundaction=false;
				a4->usesoundstart=false;
				a4->soundstart=solitaire->sspend;
				setanimationpreparative();
				update();
};


//******************************************************************************************************************
//										G A M E S C O R P I O N 
//******************************************************************************************************************
_gamescorpion::_gamescorpion(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamespideronesuit(s,mo,prev,menue,SCORPION){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7);
				createpilestock(-11,7+taby,1,0);
				createpilediscard(-11+tabx,7+taby);
				tableautakesamesuit(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);//king
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,1,-30);
				cameraposition[1].setzen(-3,2,-30);
				cameraposition[2].setzen(-3,4,-32);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-75);
				camerapositionpreview[2].setzen(0,-4,-70);
				rectangle[0].setzen(-11,-3);
				rectangle[1].setzen(-11+7*tabx,7+taby);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-16,-10,0);
				_animationmove*a0=new _animationmove(this,10,2,0,50,9);
				_animationmove*a01=new _animationmove(this,-6,-6,0,50,9,true);
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),52-7*7,60,30);
				int i=3;
				_animationrotation*ar;
				for(n=0;n<4;n++){ 
				 ar=new _animationrotation(this,0,0,0,180,2,16,4,i);
				 i+=7;
				};
				i=7*4;
				for(n=4;n<7;n++){ 
				 ar=new _animationrotation(this,0,0,0,180,2,16,7,i);
				 i+=7;
				};
				_animationcardtopile*a3=new _animationcardtopile(this,30,40);
				for(n=0;n<7;n++) a3->use(piletableau(n),7);
				_animationpileshiftout*as=new _animationpileshiftout(this,15,30);
				for(n=0;n<4;n++) as->use(piletableau(n),4,3);
				for(n=4;n<7;n++) as->use(piletableau(n),7);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,10,50);
				for(n=0;n<4;n++) a4->use(piletableau(n),4);
				for(n=4;n<7;n++) a4->use(piletableau(n),7);
				setanimationpreparative();
				shufflecards();
				update();
};
bool _gamescorpion::tipp(){
				startusing();
				if(tipptableaucompleterow()){
				 tippexecutecompleterow();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);//tippexecuteemptypile()
				}else if(tipptableau(0)){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamescorpion::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tipptableaucompleterow()){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
	 			  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamescorpion::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if((tipptableaucompleterow())&&(solitaire->autodiscard)){
				  autoplayanimationpiletopile(true,true);return(true);
	 			 }else if((tipptableauturn())&&(solitaire->autoturncard)){
	 			  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(15,true);
				  }while(foundlist.naechstes(card));
				   return(true);
				 }else if((tipptableauemptypile())&&(solitaire->autoempty)){
				  autoplayanimationpiletopile(true,true);return(true);
				 };
				};
				return(false);
};
bool _gamescorpion::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplaycompleterow(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplaytableauemptypile(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};


//******************************************************************************************************************
//										G A M E S P I D E R E T T E
//******************************************************************************************************************
_gamespiderette::_gamespiderette(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamespideronesuit(s,mo,prev,menue,SPIDERETTE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,0);
				_pilestock*ps=createpilestock(-11,taby,1,0);
				ps->redealvalue=0;
				for(_tg pdx=0;pdx< 3.5;pdx+=1) createpilediscard(-9+tabx+pdx*tabx,taby);
				_pilereserve*pr=createpilereserve(-11+7*tabx+0.5,taby*0.5);
				pr->takerestriction=false;
				tableaugivesamesuit(true);
				tableaugivedescending(true);
				tableautakedescending(true);
				createcards(1,0);
				createcards(1,0);
				createcards(1,2);
				createcards(1,2);
				cameraposition[0].setzen(-6,0,-30);
				cameraposition[1].setzen(-4,0,-30);
				cameraposition[2].setzen(-2,-1,-28);
				camerapositionmenu[2].setzen(-1,1,-50);
				camerapositionpreview[1].setzen(4,0,-75);
				camerapositionpreview[2].setzen(0,-2,-56);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(-11+7*tabx+0.5,taby);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-16,-10,0);
				_animationmove*a0=new _animationmove(this,10,2,0,50,9);
				_animationmove*a01=new _animationmove(this,-6,-6,0,50,9,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),104,60,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<7;n++) a3->use(piletableau(n),n+1);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<7;n++) as->use(piletableau(n),n+1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<7;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gamespiderette::tipp(){
				startusing();
				if(tipptableaucompleterow()){
				 tippexecutecompleterow();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableau(0,true,true,true)){
				 tippexecutemove();return(true);
				}else if(tipptableau(0,false,false,true)){
				 tippexecutemove();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);//tippexecuteemptypile()
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamespiderette::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tipptableaucompleterow()){
	 			  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;if(foundlist.anfang(card))do{}while(foundlist.naechstes(card));
				  card->objekt()->turn(solitaire->autospeed/2,true);
				  return(true);
				 }else if(autoplaymovetableau(1,true,true,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,false,true,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tipptableauemptypile()){
 				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamespiderette::clickplay(_card*card){
				 startusing();
				 deinsertpick();
				 if(clickplaycompleterow(card)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(card->turnedup()==false){
				  card->turn(solitaire->autospeed/2,true);return(true);
				 }else if(clickplaytableaumove(card,true,true,true)){
			 	  autoplayanimationpiletopile();return(true);
				 }else if(clickplaytableaumove(card,false,true,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(clickplaytableauemptypile(card)){
				  autoplayanimationpiletopile(true,true);return(true);
				 };
				return(false);
};


//******************************************************************************************************************
//										G A M E S P I D E R L I N G E
//******************************************************************************************************************
_gamespiderlinge::_gamespiderlinge(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamespideronesuit(s,mo,prev,menue,SPIDERLINGE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_piletableau*pt;
				_tg w=155;
				for(int i=0;i<4;i++){//linke seite
				 pt=createpiletableau(1,cos(_ph*w)*20+12.5,sin(_ph*w)*20);
				 pt->vector.setzen(cos(_ph*w),sin(_ph*w),0);
				 w+=17;
				 if(i==0){
				  pt->camerastretch=false;
				  pt->maximumlength=9;
				 };
				 if(i==1){
				  pt->camerastretch=false;
				  pt->maximumlength=11;
				 };
				 if(i==2){
				  pt->camerastretch=false;
				  pt->maximumlength=11;
				 };
				};
				w=25;
				for(int i=0;i<4;i++){ //rechts seite
				 pt=createpiletableau(1,cos(_ph*w)*20-12.5,sin(_ph*w)*20);
				 pt->vector.setzen(cos(_ph*w),sin(_ph*w),0);
				 w-=17;
				};
				createpilestock(0,0,1,0);
				_pilefreecell*pf;
				pf=createpilefreecell(-tabx,0);pf->suit=0;
				pf=createpilefreecell(+tabx,0);pf->suit=0;
				for(_tg pdy=0;pdy<0.5;pdy+=1){
				 for(_tg pdx=0;pdx<1.5;pdx+=1){
				  createpilediscard(pdx*tabx-tabx*0.5,taby+0.5);
				 };
				};
				for(_tg pdy=0;pdy<1.5;pdy+=1){
				 for(_tg pdx=0;pdx<1.5;pdx+=1){
				  createpilediscard(pdx*tabx-tabx*0.5,-12.5+pdy*taby);
				 };
				};
				//tableaugivesamesuit(true);
				tableaugivedescending(true);
				//tableautakesamesuit(true);
				tableautakedescending(true);
				createcards(1,0);
				createcards(1,0);
				createcards(1,0);
				createcards(1,0);
				createcards(1,0);
				createcards(1,0);
				cameraposition[0].setzen(-3,-3,-35);
				cameraposition[1].setzen(-1,-1,-33);
				cameraposition[2].setzen(-1,-2,-36);
				camerapositionmenu[2].setzen(3-tabx,1,-50);
				camerapositionpreview[1].setzen(4,0,-88);
				camerapositionpreview[2].setzen(0,-2,-85);
				rectangle[0].setzen(-11,-12.5);
				rectangle[1].setzen(+11,2*taby);
				enlargerectangle();
				int n;
				cardposition(-16,-10,0);
				_animationmove*a0=new _animationmove(this,10,2,0,50,9);
				_animationmove*a01=new _animationmove(this,-6,-6,0,50,9,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),104,60,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<8;n++) a3->use(piletableau(n),7);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<8;n++) as->use(piletableau(n),7);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<8;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E K L O N D I K E O N E 
//******************************************************************************************************************
_gameklondikeone::_gameklondikeone(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){;
                index=i;
};
_gameklondikeone::_gameklondikeone(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
                index=KLONDIKE_1;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby);
				_tg px=-11;
				createpilestock(px,7,0,1);
				createpilewaste(px+tabx,7);
				px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);//king
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-60);
				camerapositionpreview[2].setzen(0,-2,-57);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(tabx*3,7);
				enlargerectangle();
				//pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) _animationmove*a01=new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),4*13,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<7;n++) a3->use(piletableau(n),n+1);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<7;n++) as->use(piletableau(n),n+1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<7;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gameklondikeone::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);
				}else if(tipptableau(0,false,false)){
				 tippexecutemove();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gameklondikeone::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,false,false)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gameklondikeone::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				 if(solitaire->autoturncard){
				  if(tipptableauturn()){
				   _listenknoten<_card>*card;
				   if(foundlist.anfang(card))do{
				    card->objekt()->turn(15,true);
				   }while(foundlist.naechstes(card));
				   return(true);
				  };
				 };
				 if(solitaire->autoempty){
				  if(tipptableauemptypile()){
				   autoplayanimationpiletopile(true,true);
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gameklondikeone::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableauemptypile(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaywaste(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};


//******************************************************************************************************************
//										G A M E K L O N D I K E O N E T W O D E C K
//******************************************************************************************************************
_gameklondikeonetwodeck::_gameklondikeonetwodeck(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,DKLONDIKE_1){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby);
				_tg px=-11;
				createpilestock(px,7,0,1);
				createpilewaste(px+tabx,7);
				px=-1-tabx;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				createpilefoundation(px+tabx*4,7);
				createpilefoundation(px+tabx*5,7);
				createpilefoundation(px+tabx*6,7);
				createpilefoundation(px+tabx*7,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
 				tableautakeemptynumber(12);
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-40);
				cameraposition[1].setzen(1,0,-40);
				cameraposition[2].setzen(1,0,-40);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(2,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-70);
				camerapositionpreview[2].setzen(0,-5,-80);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(-1-tabx+tabx*7,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,30,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,30,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,(i-1) % 2,(i+1) % 2,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),8*13,25,20);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<7;n++) a3->use(piletableau(n),n+1);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<7;n++) as->use(piletableau(n),n+1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<7;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E G A R G A N T U A 
//******************************************************************************************************************
_gamegargantua::_gamegargantua(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,GARGANTUA){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(9,-11,7-taby-0.5);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=1;
				createpilewaste(px+tabx,7);
				px=-1-tabx;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				createpilefoundation(px+tabx*4,7);
				createpilefoundation(px+tabx*5,7);
				createpilefoundation(px+tabx*6,7);
				createpilefoundation(px+tabx*7,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
 				tableautakeemptynumber(12);//king
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-40);
				cameraposition[1].setzen(1,0,-40);
				cameraposition[2].setzen(1,0,-40);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(2,7,-50);
				camerapositionpreview[1].setzen(4,0,-70);
				camerapositionpreview[2].setzen(0,-3,-78);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(-1-tabx+tabx*7,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,(i-1) % 2,(i+1) % 2,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),8*13,25,20);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<9;n++) a3->use(piletableau(n),n+1);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<9;n++) as->use(piletableau(n),n+1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<9;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E I N D I A N 
//******************************************************************************************************************

_gameindian::_gameindian(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,INDIAN){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(10,-11,7-taby-0.5);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=1;
				createpilewaste(px+tabx+0.5,7);
				px=-1-tabx+0.5;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				createpilefoundation(px+tabx*4,7);
				createpilefoundation(px+tabx*5,7);
				createpilefoundation(px+tabx*6,7);
				createpilefoundation(px+tabx*7,7);
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 pit->givemaximal=1;
				}while(piletableaulist.naechstes(pit));
				tableaugivedescending(true);
				tableautakeothersuit(true);
				tableautakedescending(true);
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-40);
				cameraposition[1].setzen(1,0,-40);
				cameraposition[2].setzen(3,0,-37);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(4,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-70);
				camerapositionpreview[2].setzen(0,-5,-80);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(-1-tabx+0.5+tabx*7,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,46,8,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),8*13-30,50,10);
				
				_vektor3<_tg> v;
				v.setzen(8,0,0);
				v.rotz(10);
				_tg av=2;
				_animationrotation*ar=new _animationrotation(this,0,0,0,0,20,30);
				for(n=0;n<10;n++){
				 ar->use(card(n*3+0),180,v);
				 v.rotz(av);
				 v.mul(1.05);
				 av*=1.05;
				 ar->use(card(n*3+1),180,v);
				 v.mul(1.05);
				 v.rotz(av);
				 av*=1.05;
				};
				_animationcardtopile*a3=new _animationcardtopile(this,40,30);
				for(n=0;n<10;n++) a3->use(piletableau(n),3);
				_animationpileshiftout*as=new _animationpileshiftout(this,15,15);
				for(n=0;n<10;n++) as->use(piletableau(n),2,1);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,15,15);
				for(n=0;n<10;n++) a4->use(piletableau(n),2);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E G I A N T
//******************************************************************************************************************
_gamegiant::_gamegiant(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,GIANT){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(8,-11,7-taby-1);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,1,0);
				ps->redealvalue=1;
				px=-3-tabx;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				createpilefoundation(px+tabx*4,7);
				createpilefoundation(px+tabx*5,7);
				createpilefoundation(px+tabx*6,7);
				createpilefoundation(px+tabx*7,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-40);
				cameraposition[1].setzen(1,0,-40);
				cameraposition[2].setzen(1,0,-35);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(2,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-70);
				camerapositionpreview[2].setzen(0,-4,-75);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(-3-tabx+tabx*7,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,45,25);
				_animationmove*a01=new _animationmove(this,-8,-10,0,45,25,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,(i+1) % 2,(i+1) % 2,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),8*13,20,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),20,100);
				for(n=0;n<8;n++) a3->use(piletableau(n),1);
				_animationpileturn*a4=new _animationpileturn(this,10,100);
				for(n=0;n<8;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E M I S S M I L L I G A N
//******************************************************************************************************************
_gamemissmilligan::_gamemissmilligan(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,MISSMILLIGAN){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(8,-7,7-taby-1);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,1,0);
				ps->redealvalue=0;
				_pilereserve*pr=createpilereserve(px,7-taby);
				pr->takerestriction=false;
				px=-3-tabx;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				createpilefoundation(px+tabx*4,7);
				createpilefoundation(px+tabx*5,7);
				createpilefoundation(px+tabx*6,7);
				createpilefoundation(px+tabx*7,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
 				tableautakeemptynumber(12);
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-40);
				cameraposition[1].setzen(1,0,-40);
				cameraposition[2].setzen(2,0,-36);
				camerapositionmenu[1].setzen(-1,7,-50);
				camerapositionmenu[2].setzen(4,7,-50);
				camerapositionpreview[1].setzen(4,0,-70);
				camerapositionpreview[2].setzen(0,-5,-73);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(-3-tabx+tabx*7,7);
				enlargerectangle();
				pilesort();
				int n;
				_animationrotation*a0=new _animationrotation(this,12,2,0,180,25,9);
				_animationrotation*a01=new _animationrotation(this,8,2,0,180,25,9);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,20,9,(i+1) % 2,(i+1) % 2,true);
				shufflecards();
				cardposition(-26,-11,0);
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),8*13,20,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),20,100);
				for(n=0;n<8;n++) a3->use(piletableau(n),1);
				_animationpileturn*a4=new _animationpileturn(this,10,100);
				for(n=0;n<8;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E K L O N D I K E C O N T R A
//******************************************************************************************************************
_gameklondikecontra::_gameklondikecontra(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamecarrenapoleon(s,mo,prev,menue,KLONDIKECONTRA){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=-1;
				createpilewaste(px+tabx,7);
				px=0;
				_pilefoundation*pf;
				pf=createpilefoundation(px+tabx*0,7);pf->takeascending=true;pf->takeemptysuit=0;
				pf=createpilefoundation(px+tabx*1,7);pf->takeascending=true;pf->takeemptysuit=1;
				pf=createpilefoundation(px+tabx*2,7);pf->takedescending=true;pf->takeemptysuit=2;
				pf=createpilefoundation(px+tabx*3,7);pf->takedescending=true;pf->takeemptysuit=3;
				tableautakealteratecolor(true);
				tableautakedescending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-60);
				camerapositionpreview[2].setzen(0,-2,-56);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(tabx*3,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),4*13,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<7;n++) a3->use(piletableau(n),n+1);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<7;n++) as->use(piletableau(n),n+1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<7;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gameklondikecontra::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false,true)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaytableauemptypile(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaywaste(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E C O N T R A F L O W
//******************************************************************************************************************
_gamecontraflow::_gamecontraflow(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,CONTRAFLOW){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilestock*ps=createpilestock(-2,7,0,1);
				ps->redealvalue=0;
				createpilewaste(+2,7);
				createpiletableau(3,-2.5*tabx-1,7-taby-1);
				createpiletableau(3,+1+0.5*tabx,7-taby-1);
				_tg px=0;
				_pilefoundation*pf;
				pf=createpilefoundation(-tabx*3,7);pf->takedescending=true;pf->takeemptysuit=2;
				pf=createpilefoundation(-tabx*4,7);pf->takedescending=true;pf->takeemptysuit=3;
				pf=createpilefoundation(+tabx*4,7);pf->takeascending=true;pf->takeemptysuit=0;
				pf=createpilefoundation(+tabx*3,7);pf->takeascending=true;pf->takeemptysuit=1;
				for(int j=0;j<3;j++){
				 piletableau(j)->takeascending=true;
				 piletableau(j)->giveascending=true;
				};
				for(int j=3;j<6;j++){
				 piletableau(j)->takedescending=true;
				 piletableau(j)->givedescending=true;
				};
				_pilereserve*pr=createpilereserve(-13,0);
				pr->takerestriction=false;
				pr=createpilereserve(+13,0);
				pr->takerestriction=false;
				
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-0.3,0,-30);
				cameraposition[2].setzen(-0.3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(0.5,1+6,-50);
				camerapositionpreview[1].setzen(0,-4,-60);
				camerapositionpreview[2].setzen(0,-4,-70);
				rectangle[0].setzen(-tabx*4,-8);
				rectangle[1].setzen(+tabx*4,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
    			shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),4*13,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<6;n++) a3->use(piletableau(n),3);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<6;n++) as->use(piletableau(n),3);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<6;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gamecontraflow::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);	
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);
				}else if(tipptableau(0,false,false)){
				 tippexecutemove();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				}else if(tippreserve(0)){
				 tippexecutemove();return(true);
				};
				return(false);
				};
bool _gamecontraflow::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,false,false)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 }else if(tippreserve(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 };
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E K L O N D I K E T H R E E 
//******************************************************************************************************************
_gameklondikethree::_gameklondikethree(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,KLONDIKE_3){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby);
				_tg px=-11;
				createpilestock(px,7,0,3);
				createpilewaste(px+tabx,7);
				px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);//king
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-60);
				camerapositionpreview[2].setzen(0,-2,-57);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(tabx*3,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),4*13,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<7;n++) a3->use(piletableau(n),n+1);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<7;n++) as->use(piletableau(n),n+1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<7;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E K L O N D I K E T H R E E T W O D E C K
//******************************************************************************************************************
_gameklondikethreetwodeck::_gameklondikethreetwodeck(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,DKLONDIKE_3){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby);
				_tg px=-11;
				int n;
				createpilestock(px,7,0,3);
				createpilewaste(px+tabx,7);
				px=-1-tabx;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				createpilefoundation(px+tabx*4,7);
				createpilefoundation(px+tabx*5,7);
				createpilefoundation(px+tabx*6,7);
				createpilefoundation(px+tabx*7,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);//king
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-40);
				cameraposition[1].setzen(1,0,-40);
				cameraposition[2].setzen(1,0,-40);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(2,1+6,-50);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-5,-80);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(-1-tabx+tabx*7,7);
				enlargerectangle();
				pilesort();
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,(i-1) % 2,(i+1) % 2,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),8*13,25,20);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<7;n++) a3->use(piletableau(n),n+1);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<7;n++) as->use(piletableau(n),n+1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<7;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E F O R T Y T H I E V E S
//******************************************************************************************************************
_gamefortythieves::_gamefortythieves(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_gameklondikeone(s,mo,prev,menue,i){
};
_gamefortythieves::_gamefortythieves(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,FORTYTHIEVES){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(10,-11,7-taby-1);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=0;
				createpilewaste(px+tabx,7);
				px=-1-tabx;
				int n;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				createpilefoundation(px+tabx*4,7);
				createpilefoundation(px+tabx*5,7);
				createpilefoundation(px+tabx*6,7);
				createpilefoundation(px+tabx*7,7);
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);
				for(n=0;n<10;n++) piletableau(n)->givemaximal=1;
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-40);
				cameraposition[1].setzen(0,0,-40);
				cameraposition[2].setzen(1.5,-2,-38);
				camerapositionmenu[1].setzen(3,7,-50);
				camerapositionmenu[2].setzen(3,4,-50);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-5,-78);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(-1-tabx+tabx*7,7);
				enlargerectangle();
				pilesort();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,-5,2,0,40,5,true,false,true);
				shufflecards();
				new _animationrotation(this,5,-5,0,180,20,8);
				new _animationcardtostock(this,pilestock(0),8*13-40,30,10);
				new _animationrotation(this,2,-4,0,180,10,8);
				_animationcardtopile*a2=new _animationcardtopile(this,30,30);
				for(n=0;n<10;n++) a2->use(piletableau(n),4);
				_animationpileshiftout*a3=new _animationpileshiftout(this,30,40);
				for(n=0;n<10;n++) a3->use(piletableau(n),4);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,20,50);
				for(n=0;n<10;n++) a4->use(piletableau(n),4);
				setanimationpreparative();
				update();
};
bool _gamefortythieves::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,false,true,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E F O R T Y T H I E V E S D O U B L E S T O C K
//******************************************************************************************************************
_gamefortythievesdoublestock::_gamefortythievesdoublestock(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamefortythieves(s,mo,prev,menue,FORTYTHIEVESDOUBLESTOCK){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				int n;
				createpiletableau(10,-15+tabx*2+1,7-taby-1);
				_tg px=-15;
				_pilestock*ps;
				_pilewaste*pw;
				ps=createpilestock(px,7,0,1);
				ps->redealvalue=1;
				pw=createpilewaste(px+tabx,7);
				ps->wastepartner=0;
				pw->stockpartner=0;
				px=-15;
				ps=createpilestock(px,7-taby,0,1);
				ps->redealvalue=1;
				pw=createpilewaste(px+tabx,7-taby);
				ps->wastepartner=1;
				pw->stockpartner=1;
				px=-15+tabx*2;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				createpilefoundation(px+tabx*4,7);
				createpilefoundation(px+tabx*5,7);
				createpilefoundation(px+tabx*6,7);
				createpilefoundation(px+tabx*7,7);
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);
				for(n=0;n<10;n++) piletableau(n)->givemaximal=1;
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-40);
				cameraposition[1].setzen(0,0,-40);
				cameraposition[2].setzen(3,-2,-41);
				camerapositionmenu[1].setzen(3,7,-50);
				camerapositionmenu[2].setzen(3,4,-50);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-5,-90);
				rectangle[0].setzen(-15,-10);
				rectangle[1].setzen(-15+tabx*2+1+tabx*9,7);
				enlargerectangle();
				pilesort();
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-10,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-5,2,0,40,5,true,false,true);
				shufflecards();
				new _animationrotation(this,5,-5,0,180,20,8);
				new _animationcardtostock(this,pilestock(0),32,20,10);
				new _animationcardtostock(this,pilestock(1),32,20,10);
				new _animationrotation(this,2,-4,0,180,10,8);
				_animationcardtopile*a2=new _animationcardtopile(this,30,30);
				for(n=0;n<10;n++) a2->use(piletableau(n),4);
				_animationpileshiftout*a3=new _animationpileshiftout(this,30,40);
				for(n=0;n<10;n++) a3->use(piletableau(n),4);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,20,50);
				for(n=0;n<10;n++) a4->use(piletableau(n),4);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E F O R T Y T H I E V E S R E D E A L
//******************************************************************************************************************
_gamefortythievesredeal::_gamefortythievesredeal(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamefortythieves(s,mo,prev,menue,FORTYTHIEVESREDEAL){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				int n;
				createpiletableau(10,-11,7-taby-1);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=1;
				createpilewaste(px+tabx,7);
				px=-1-tabx;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				createpilefoundation(px+tabx*4,7);
				createpilefoundation(px+tabx*5,7);
				createpilefoundation(px+tabx*6,7);
				createpilefoundation(px+tabx*7,7);
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);
				for(n=0;n<10;n++) piletableau(n)->givemaximal=1;
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-40);
				cameraposition[1].setzen(0,0,-40);
				cameraposition[2].setzen(1.5,-2,-38);
				camerapositionmenu[1].setzen(3,7,-50);
				camerapositionmenu[2].setzen(3,4,-50);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-5,-78);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(-1-tabx+tabx*7,7);
				enlargerectangle();
				pilesort();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,-5,2,0,40,5,true,false,true);
				shufflecards();
				new _animationrotation(this,5,-5,0,180,20,8);
				new _animationcardtostock(this,pilestock(0),8*13-40,30,10);
				new _animationrotation(this,2,-4,0,180,10,8);
				_animationcardtopile*a2=new _animationcardtopile(this,30,30);
				for(n=0;n<10;n++) a2->use(piletableau(n),4);
				_animationpileshiftout*a3=new _animationpileshiftout(this,30,40);
				for(n=0;n<10;n++) a3->use(piletableau(n),4);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,20,50);
				for(n=0;n<10;n++) a4->use(piletableau(n),4);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E B L I N D A L L E Y S  
//******************************************************************************************************************
_gameblindalleys::_gameblindalleys(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,BLINDA){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(6,-11,7-taby-1);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=1;
				createpilewaste(px+tabx,7);
				px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				foundationascending(true);	
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,0,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(0,-4,-55);
				camerapositionpreview[2].setzen(0,-3,-57);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(tabx*3,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,-10,-3,0,40,5,true);
				_animationcardtofoundation*af=new _animationcardtofoundation(this,40,40);
				int in=0;
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 af->use(fit,card(in*13));
				 in+=1;
				}while(pilefoundationlist.naechstes(fit));
				shufflecards();
				new _animationcardtostock(this,pilestock(0),4*12,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<6;n++) a3->use(piletableau(n),3);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<6;n++) as->use(piletableau(n),3);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<6;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E L I M I T E D 
//******************************************************************************************************************
_gamelimited::_gamelimited(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_gameklondikeone(s,mo,prev,menue,i){
};
_gamelimited::_gamelimited(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,LIMITED){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg ox=0;
				_tg oy=taby;
				for(int j=2;j>=0;j--){
			 	 for(int i=3;i>=0;i--){
				  createpiletableau(1,ox+-11+tabx*2.7*i,oy+1.5-(taby+1)*j);
				 };
				};
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 pit->vector.setzen(0.7,-0.3,0);
				 pit->givemaximal=1;
				}while(piletableaulist.naechstes(pit));
				_tg px=-11;
				_pilestock*ps=createpilestock(ox+px,oy+7,0,1);
				ps->redealvalue=0;
				createpilewaste(ox+px+tabx,oy+7);
				px=-tabx;
				createpilefoundation(ox+px+tabx*0,oy+7);
				createpilefoundation(ox+px+tabx*1,oy+7);
				createpilefoundation(ox+px+tabx*2,oy+7);
				createpilefoundation(ox+px+tabx*3,oy+7);
				createpilefoundation(ox+px+tabx*4,oy+7);
				createpilefoundation(ox+px+tabx*5,oy+7);
				createpilefoundation(ox+px+tabx*6,oy+7);
				createpilefoundation(ox+px+tabx*7,oy+7);
				tableaumaximumlength(6);
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[1].setzen(1.8,0,-39);
				cameraposition[2].setzen(1.8,2,-39);
				camerapositionmenu[2].setzen(1,8,-55);
				camerapositionpreview[1].setzen(0,0,-90);
				camerapositionpreview[2].setzen(0,-3,-85);
				rectangle[0].setzen(-11,-8);
				rectangle[1].setzen(tabx*6,7+taby);
				enlargerectangle();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,-10,-3,0,40,5,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),8*13-12*3,50,10);
				_vektor3<_tg> v;
				v.setzen(20,0,0);
				v.rotz(-20);
				_tg av=1;
				_animationrotation*ar=new _animationrotation(this,0,0,0,0,30,22);
				for(n=0;n<36;n++){
				 ar->use(card(n),180,v);
				 v.rotz(av);
				 v.mul(1.01);
				 av*=1.02;
				};
				_animationcardtopile*a3=new _animationcardtopile(this,30,20);
				for(n=0;n<12;n++) a3->use(piletableau(n),3);
				_animationpileshiftout*a23=new _animationpileshiftout(this,15,20);
				for(n=0;n<12;n++) a23->use(piletableau(n),3);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,13,10);
				for(n=0;n<12;n++) a4->use(piletableau(n),3);
				setanimationpreparative();
				update();
};
bool _gamelimited::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);	
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tipptableau(0,false,false,true)){
				 tippexecutemove();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamelimited::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,false,false,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamelimited::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false,true)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaytableauemptypile(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaywaste(card,true)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaywaste(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E L I M I T E D C O V E R E D
//******************************************************************************************************************
_gamelimitedcovered::_gamelimitedcovered(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamelimited(s,mo,prev,menue,LIMITEDCOVERED){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg ox=0;
				_tg oy=taby;
				for(int j=2;j>=0;j--){
			 	 for(int i=3;i>=0;i--){
				  createpiletableau(1,ox+-11+tabx*2.7*i,oy+1.5-(taby+1)*j);
				 };
				};
				_tg px=-11;
				_pilestock*ps=createpilestock(ox+px,oy+7,0,1);
				ps->redealvalue=0;
				createpilewaste(ox+px+tabx,oy+7);
				px=-tabx;
				createpilefoundation(ox+px+tabx*0,oy+7);
				createpilefoundation(ox+px+tabx*1,oy+7);
				createpilefoundation(ox+px+tabx*2,oy+7);
				createpilefoundation(ox+px+tabx*3,oy+7);
				createpilefoundation(ox+px+tabx*4,oy+7);
				createpilefoundation(ox+px+tabx*5,oy+7);
				createpilefoundation(ox+px+tabx*6,oy+7);
				createpilefoundation(ox+px+tabx*7,oy+7);
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 pit->vector.setzen(0.7,-0.3,0);
				}while(piletableaulist.naechstes(pit));
				tableaumaximumlength(6);
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[1].setzen(1.8,0,-39);
				cameraposition[2].setzen(1.8,2,-39);
				camerapositionmenu[2].setzen(1,8,-50);
				camerapositionpreview[1].setzen(0,0,-90);
				camerapositionpreview[2].setzen(0,-3,-85);
				rectangle[0].setzen(-11,-8);
				rectangle[1].setzen(tabx*6,7+taby);
				enlargerectangle();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,-10,-3,0,40,5,true);
				shufflecards();
				new _animationcardtostock(this,pilestock(0),8*13,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<12;n++) a3->use(piletableau(n),3);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<12;n++) as->use(piletableau(n),3);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<12;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E L A D Y P A L K
//******************************************************************************************************************
_gameladypalk::_gameladypalk(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,LADYPALK){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg ox=0;
				_tg oy=-taby;
				createpiletableau(1,ox-tabx,oy+-1*taby);
				createpiletableau(1,ox-tabx,oy+0*taby);
				createpiletableau(1,ox-tabx,oy+1*taby);
				createpiletableau(1,ox-tabx,oy+2*taby);
				for(int i=0;i<4;i++){
				 piletableau(i)->vector.setzen(-1,0,0);
				 piletableau(i)->camerastretch=false;
				 piletableau(i)->maximumlength=11;
				};
				createpiletableau(1,ox+tabx*2,oy+-1*taby);
				createpiletableau(1,ox+tabx*2,oy+0*taby);
				createpiletableau(1,ox+tabx*2,oy+1*taby);
				createpiletableau(1,ox+tabx*2,oy+2*taby);
				for(int i=4;i<8;i++){
				 piletableau(i)->vector.setzen(1,0,0);
				};
				_tg px=-11;
				_pilestock*ps=createpilestock(ox,oy+3*taby,0,1);
				ps->redealvalue=0;
				createpilewaste(ox+tabx,oy+3*taby);
				px=-tabx;
				createpilefoundation(ox,oy+-1*taby);
				createpilefoundation(ox,oy+0*taby);
				createpilefoundation(ox,oy+1*taby);
				createpilefoundation(ox,oy+2*taby);
				createpilefoundation(ox+tabx,oy+-1*taby);
				createpilefoundation(ox+tabx,oy+0*taby);
				createpilefoundation(ox+tabx,oy+1*taby);
				createpilefoundation(ox+tabx,oy+2*taby);
				tableaugivedescending(true);
				tableautakedescending(true);
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-1.5,-40);
				cameraposition[2].setzen(0,0,-35);
				camerapositionmenu[2].setzen(1.8,5.5,-55);
				camerapositionpreview[1].setzen(0,0,-80);
				camerapositionpreview[2].setzen(0,-3,-80);
				rectangle[0].setzen(+tabx*2+10,-2*taby);
				rectangle[1].setzen(-tabx*1-10,2*taby);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,60,8);
				new _animationmove(this,-10+tabx*2,-10,0,60,8,true);
				shufflecards();
				new _animationcardtostock(this,pilestock(0),8*13,60,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),20,10,true);
				for(n=0;n<8;n++) a3->use(piletableau(n),4);
				_animationpileshiftout*aps=new _animationpileshiftout(this,20,40);
				for(n=0;n<8;n++) aps->use(piletableau(n),4);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,33,50);
				for(n=0;n<8;n++) a4->use(piletableau(n),4);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E A C M E 
//******************************************************************************************************************
_gameacme::_gameacme(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,ACME){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(4,-2-tabx*1.5,7-taby-1);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=1;
				createpilewaste(px+tabx,7);
				px=-2;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				_pilereserve*pr=createpilereserve(-11,7-taby-2);
				pr->vector.setzen(0,-0.5,0);
				pr->tableaufill=true;
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 pit->givemaximal=1;
				 pit->takeemptyrestriction=true;
				}while(piletableaulist.naechstes(pit));
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(0,0,-50);
				camerapositionpreview[2].setzen(0,-1,-68);
				rectangle[0].setzen(-11,7-taby*3-1);
				rectangle[1].setzen(-2+tabx*3,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-14,-11,0,40,5);
				new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
				_animationcardtofoundation*af=new _animationcardtofoundation(this,40,40);
				int in=0;
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 af->use(fit,card(in*13));
				 in+=1;
				}while(pilefoundationlist.naechstes(fit));
				shufflecards();
				_animationcardtopile*ap=new _animationcardtopile(this,30,30);
				_pilereserve*prit;
				if(pilereservelist.anfang(prit))do{
				 ap->use(prit,13,false,true);
				}while(pilereservelist.naechstes(prit));
				new _animationcardtostock(this,pilestock(0),4*13-13,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<4;n++) a3->use(piletableau(n),1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<4;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E A U N T M A R Y 
//******************************************************************************************************************
_gameauntmary::_gameauntmary(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,AUNTMARY){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(6,-11,(7-taby-1));
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=0;
				createpilewaste(px+tabx,7);
				px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);//king
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-60);
				camerapositionpreview[2].setzen(0,-3,-65);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(+tabx*3,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-12,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-4,-10,0,40,5,true);
				shufflecards();
				_tg woff=_tg(180)/_tg(6);
				_tg w=woff*0.5;
				_animationrotation*ar;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,6,0);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,5,7);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,4,14);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,3,21);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,2,28);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,1,35);w+=woff;
				_animationcardtopile*a3=new _animationcardtopile(this,20,40);
				for(n=0;n<6;n++) a3->use(piletableau(n),6);
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),52-36,20,40);
				_animationpileshiftout*as=new _animationpileshiftout(this,20,40);
				for(n=0;n<6;n++) as->use(piletableau(n),6-n,n);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,20,50);
				for(n=0;n<6;n++) a4->use(piletableau(n),6-n);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E A U N T F R E E M A R Y 
//******************************************************************************************************************
_gameauntfreemary::_gameauntfreemary(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,AUNTFREEMARY){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(6,-11,7-taby-1);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=0;
				createpilewaste(px+tabx,7);
				px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				_pilefreecell*pf;
				pf=createpilefreecell(9,(7-taby-1));
				pf->suit=0;
				pf=createpilefreecell(9+tabx,(7-taby-1));
				pf->suit=1;
				pf=createpilefreecell(9,(7-taby-1)-taby);
				pf->suit=2;
				pf=createpilefreecell(9+tabx,(7-taby-1)-taby);
				pf->suit=3;
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);//king
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-0.7,0,-30);
				cameraposition[2].setzen(-0.7,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-60);
				camerapositionpreview[2].setzen(0,-3,-65);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(9+tabx,7);
				enlargerectangle();
				pilesort();
				int n;				
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-12,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-4,-10,0,40,5,true);
				shufflecards();
				_tg woff=_tg(180)/_tg(6);
				_tg w=woff*0.5;
				_animationrotation*ar;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,6,0);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,5,7);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,4,14);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,3,21);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,2,28);w+=woff;
				ar=new _animationrotation(this,cos(_ph*w)*7,sin(_ph*w)*9,0,180,20,56,1,35);w+=woff;
				_animationcardtopile*a3=new _animationcardtopile(this,20,40);
				for(n=0;n<6;n++) a3->use(piletableau(n),6);
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),52-36,20,40);
				_animationpileshiftout*as=new _animationpileshiftout(this,20,40);
				for(n=0;n<6;n++) as->use(piletableau(n),6-n,n);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,20,50);
				for(n=0;n<6;n++) a4->use(piletableau(n),6-n);
				setanimationpreparative();
				update();
};
bool _gameauntfreemary::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaywaste(card)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplayfreecell(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E S I N G L E R A I L 
//******************************************************************************************************************
_gamesinglerail::_gamesinglerail(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=SINGLERAIL;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(4,-11,7-taby-1);
				_tg px=-11;
				_pilestock*ps=createpilestock(px,7,0,1);
				ps->redealvalue=0;
				createpilewaste(px+tabx,7);
				px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableaugivedescending(true);
				tableautakedescending(true);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-60);
				camerapositionpreview[2].setzen(0,-3,-57);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(+tabx*3,7);
				enlargerectangle();
				pilesort();
				cardposition(-26,-11,0);
				new _animationmove(this,-14,-11,0,40,5);
				new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),4*13,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(int n=0;n<4;n++) a3->use(piletableau(n),1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(int n=0;n<4;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gamesinglerail::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableau(0,false,false,true)){
				 tippexecutemove();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamesinglerail::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(autoplaymovetableau(1,false,false,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamesinglerail::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				 if(solitaire->autoturncard){
				  if(tipptableauturn()){
				   _listenknoten<_card>*card;
				   if(foundlist.anfang(card))do{
				    card->objekt()->turn(15,true);
				   }while(foundlist.naechstes(card));
				   return(true);
				  };
				 };
				 if(solitaire->autoempty){
				  if(tipptableauemptypile()){
				   autoplayanimationpiletopile(true,true);
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gamesinglerail::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false,true)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaytableauemptypile(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaywaste(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E C A R R E N A P O L E O N 
//******************************************************************************************************************
_gamecarrenapoleon::_gamecarrenapoleon(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
};
_gamecarrenapoleon::_gamecarrenapoleon(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
                index=CARRENAPOLEON;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(6,-11,taby+1);
				tableaumaximumlength(6);
				createpiletableau(6,-11,taby-2.0*taby);
				_tg px=-11-tabx-1;
				_pilestock*ps;
				ps=createpilestock(px,7,1,0);
				ps->tableaucount=3;
				ps->redealvalue=1;
				createpilewaste(px,7-taby);
				px=0;
				for(_tg iy=0;iy<3.5;iy+=1){
				 for(_tg ix=0;ix<1.5;ix+=1){
				  createpilefoundation(10+ix*tabx,7-taby*iy);
				 };
				};
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(-5,-2,-33);
				cameraposition[1].setzen(-2,-2,-34);
				cameraposition[2].setzen(-2,-2,-34);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,4,-50);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-2,-75);
				rectangle[0].setzen(-11-tabx-1,7-taby*3-taby*0.5);
				rectangle[1].setzen(10+tabx,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-14,-11,0,40,5);
				new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),8*13,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<12;n++) a3->use(piletableau(n),1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<12;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gamecarrenapoleon::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);	
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableau(0,false,true,true)){
				 tippexecutemove();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamecarrenapoleon::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(autoplaymovetableau(1,false,true,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamecarrenapoleon::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				 if(solitaire->autoturncard){
				  if(tipptableauturn()){ 
				   _listenknoten<_card>*card;
				   if(foundlist.anfang(card))do{
				    card->objekt()->turn(15,true);
				   }while(foundlist.naechstes(card));
				   return(true);
				  };
				 };
				 if(solitaire->autoempty){
				  if(tipptableauemptypile()){ 
				   autoplayanimationpiletopile(true,true);
				   return(true);
				  };
				 };
				};
				return(false);
				};
bool _gamecarrenapoleon::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,true,true)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaytableauemptypile(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaywaste(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E F R E E C E L L 
//******************************************************************************************************************
_gamefreecell::_gamefreecell(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
	            blockade=-1;
	            blockadecount=0;
};
_gamefreecell::_gamefreecell(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
	            blockade=-1;
	            blockadecount=0;
				index=FREECELL;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(8,-11,7-taby-0.5);
				createpilefoundation(4+tabx*0,7);
				createpilefoundation(4+tabx*1,7);
				createpilefoundation(4+tabx*2,7);
				createpilefoundation(4+tabx*3,7);
				createpilefreecell(-11+tabx*0,7);
				createpilefreecell(-11+tabx*1,7);
				createpilefreecell(-11+tabx*2,7);
				createpilefreecell(-11+tabx*3,7);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cardlist.invertieren();
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				foundationascending(true);
				tableaugiverestrictionfreecell(true);
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(0,-2.5,-36);
				cameraposition[2].setzen(0,-2.5,-34);
				camerapositionmenu[2].setzen(1,3,-50);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-2,-73);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(4+tabx*3,7+1);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				shufflecards();
				_animationmove*a0=new _animationmove(this,10,-11,0,80,5);
				_animationmove*a01=new _animationmove(this,0,-11,0,40,5,true);
				_vektor3<_tg> v;
				v.setzen(8,0,-0.02);
				v.rotz(10);
				_tg av=2;
				_animationrotation*ar=new _animationrotation(this,0,0,0,0,30,30);
				for(n=0;n<52;n++){
				 ar->use(card(n),180,v);
				 v.rotz(av);
				 v.mul(1.005);
				 av*=1.02;
				};
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				for(n=0;n<4;n++) a2->use(piletableau(n),7);
				for(n=4;n<8;n++) a2->use(piletableau(n),6);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				for(n=0;n<4;n++) a3->use(piletableau(n),7);
				for(n=4;n<8;n++) a3->use(piletableau(n),6);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,13,15);
				for(n=0;n<4;n++) a4->use(piletableau(n),7);
				for(n=4;n<8;n++) a4->use(piletableau(n),6);
				setanimationpreparative();
				update();
};
bool _gamefreecell::tippfreecelltofoundation(){
				bool found=false;
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				_pilefreecell*frit;
				if(pilefreecelllist.anfang(frit))do{
				 if(found==false){
				  if(frit->erstes()){
				   _card*c=frit->erstes();
				   foundlist.aushaengen();
				   foundlist.einhaengen(c);
				   _pilefoundation*fit;
				   if(pilefoundationlist.anfang(fit))do{
				    if(found=false){
				     if(fit->candrop(&foundlist)){
				      found=true;
				      foundsour=frit;
				      founddest=fit;
				     };
				    };
				   }while(pilefoundationlist.naechstes(fit));
				  };
				 };
				}while(pilefreecelllist.naechstes(frit));
				return(found);
};
_card* _gamefreecell::getcardtableau(int ss,int sn){
				_piletableau*pit;
				_card*cit;
				if(piletableaulist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  if((cit->suit==ss)&&(cit->number==sn)) return(cit);
				 }while(pit->naechstes(cit));
				}while(piletableaulist.naechstes(pit));
				return(0);
};
_card* _gamefreecell::getcardfoundation(int ss,int sn){
				_pilefoundation*pit;
				_card*cit;
				if(pilefoundationlist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  if((cit->suit==ss)&&(cit->number==sn)) return(cit);
				 }while(pit->naechstes(cit));
				}while(pilefoundationlist.naechstes(pit));
				return(0);
};
_card* _gamefreecell::getsearchedcard(int b){//returns the card, that is used for(the aktual blockade-foundation
				 //Print "b="+b
				if(b!=-1){
				 _pilefoundation*f=pilefoundation(b);
				 int ss;
				 int sn;
				 if(f->erstes()){
				  _card*c=f->erstes();
				  ss=c->suit;
				  sn=c->number+1;
				  if(sn>12) return(0);
				 }else{
				  //achtung es muss bei einem leeren pile auf alle fälle
				  //eine karte gewählt werden, die noch nicht in einem der anderen
				  //foundations ist
				  sn=0;
				  ss=b;
				  int startsuit=ss;
				  bool found=false;
				  do{
				   if(getcardfoundation(ss,sn)==0){
				    found=true;
				   }else{
				    ss+=1;
				    if(ss>3) ss=0;
				   };
				  }while((found==false)&&(ss!=startsuit));
				 };
				 return(getcardtableau(ss,sn));
				}else{ 
				 return(0);
				};
};
bool _gamefreecell::tippfreecelltotableau(){//only if(target is not the blockade-tableaupile
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				_card*csuch=getsearchedcard(blockade);
				_pilefreecell*fit;
				if(pilefreecelllist.anfang(fit))do{
				 if(fit->erstes()){
				  _card*c=fit->erstes();
				  foundlist.aushaengen();
				  foundlist.einhaengen(c);
				  _piletableau*pit;
				  if(piletableaulist.anfang(pit))do{
				   if(pit->candrop(&foundlist)){
				    bool ok=true;
				    if(csuch) if(csuch->pile==pit) ok=false;
				 	if(ok){
				     founddest=pit;
				     foundsour=fit;
				     return(true);
		   		    };
				   };
				  }while(piletableaulist.naechstes(pit));
				 };
				}while(pilefreecelllist.naechstes(fit));
				return(false);
};
bool _gamefreecell::validateblockade(){
				//zuerst prüfen ob der akutelle blockadeindex noch gültig ist, indem das 
				//dazugehörige Foundationpile noch nicht vollständig besetzt ist
				_pilefoundation*f=pilefoundation(blockade);
				if(f->anzahl()<13) return(true);
				return(false);
};
void _gamefreecell::initblockade(){
				blockadecount=100000;//more than 100000 card in a pile will not occur
				//get the foundationindex ,which searchcard has the lowest blockadecount
				int i=0;
				_pilefoundation*pit;
				if(pilefoundationlist.anfang(pit))do{
				 _card*c=getsearchedcard(i);
				 if(c){
				  int bc=c->index();//is directly the count!
				  if(blockadecount>bc){
				   blockadecount=bc;
				   blockade=i;
				  };
				 };
				 i+=1;
				}while(pilefoundationlist.naechstes(pit));
};
void _gamefreecell::nextblockade(){
				if(blockade!=-1){
				 int i=0;
				 int n=100000;
				 bool changed=false;
				 _pilefoundation*pit;
				 if(pilefoundationlist.anfang(pit))do{
				  if(pit->flag==1){
				   _card*c=getsearchedcard(i);
				   if(c){
				    int bc=c->index();//is directly the count!
				    if(abs(blockadecount-bc)<n){
				     n=blockadecount-bc;
				     blockade=i;
				     changed=true;
				    };
				   };
				  };
				  i+=1;
				 }while(pilefoundationlist.naechstes(pit));
				 if(changed) blockadecount=getsearchedcard(blockade)->index(); else blockade=-1;
				};
};
bool _gamefreecell::tippclearblockade(){
				//benutzt den aktuellen blockade index, und
				//versucht die suchkarte freizuräumen
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 fit->flag=1;
				}while(pilefoundationlist.naechstes(fit));
				initblockade();
				do{
				 if(validateblockade()){
				  _card*csuch=getsearchedcard(blockade);
				  if(csuch){
  				   pilefoundation(blockade)->flag=0;
				   //------------------------------- fragment laden ----------------------
				   foundlist.aushaengen();
				   _card*it=csuch;
				   _pile*p=it->pile;
				   while(p->vorheriges(it)) foundlist.einhaengen(it);
				   //------------------------------- pickbaren teil isolieren ------------
				   if(foundlist.anzahl()>0){
				    bool pickable=false;
				    do{
				     _card*c=foundlist.erstes()->objekt();
				     if(c->canpick()) pickable=true; else delete(foundlist.erstes());
				    }while((foundlist.anzahl()!=0)&&(pickable==false));
				   };
				   //---------------------------------------------------------------------
				   if(foundlist.anzahl()>0){
				    do{
				     //----versuche nun das fragment innerhalb des tableaus zu verlegen----
				     _piletableau*pit;
				     if(piletableaulist.anfang(pit))do{
				      if(pit!=csuch->pile){
				       if(pit->candrop(&foundlist)){
				        foundsour=csuch->pile;
				        founddest=pit;
				        return(true);
				       };
				      };
				     }while(piletableaulist.naechstes(pit));
					 //----versuche nun das Fragment auf einer der Freecells zu verlegen----
				 	 if(foundlist.anzahl()==1){
				 	  _pilefreecell*rit;
					  if(pilefreecelllist.anfang(rit))do{
					   if(rit->candrop(&foundlist)){
					    foundsour=csuch->pile;
					    founddest=rit;
					    return(true);
					   };
					  }while(pilefreecelllist.naechstes(rit));
				 	 };
					 //---------------------------------------------------------------------
				     delete(foundlist.erstes());
				    }while(foundlist.anzahl()>0);
				   };
				  };
				 };	
				 nextblockade();
				}while(blockade!=-1);
				return(false);
};
bool _gamefreecell::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tippfreecelltofoundation()){
				 tippexecutemove();return(true);
				}else if(tippfreecelltotableau()){
				 tippexecutemove();return(true);
				}else if(tippclearblockade()){
				 tippexecutemove();return(true);
				}else if(tipptableau(0,false,false)){
				 tippexecutemove();return(true);
				};
				return(false);
};
bool _gamefreecell::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tippfreecelltofoundation()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippfreecelltotableau()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippclearblockade()){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(autoplaymovetableau(1,false,false)){
				  autoplayanimationpiletopile();return(true);
				 };
				};
				return(false);
};
bool _gamefreecell::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
				  }else if(tippfreecelltofoundation()){
				   autoplayanimationpiletopile();
				   return(true);
	 			  };
	 			 };	
				 if(solitaire->autoturncard){
				  if(tipptableauturn()){ 
				   _listenknoten<_card>*card;
				   if(foundlist.anfang(card))do{
				    card->objekt()->turn(15,true);
				   }while(foundlist.naechstes(card));
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gamefreecell::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false,true)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaytableauemptypile(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplayfreecell(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E F R E E C E L L D O U B L E
//******************************************************************************************************************
_gamefreecelldouble::_gamefreecelldouble(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamefreecell(s,mo,prev,menue,FREECELLDOUBLE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpilefoundation(-14+tabx*6,7);
				createpilefoundation(-14+tabx*7,7);
				createpilefoundation(-14+tabx*8,7);
				createpilefoundation(-14+tabx*9,7);
				createpilefoundation(-14+tabx*6,7-taby);
				createpilefoundation(-14+tabx*7,7-taby);
				createpilefoundation(-14+tabx*8,7-taby);
				createpilefoundation(-14+tabx*9,7-taby);
				
				createpilefreecell(-14+tabx*0,7);
				createpilefreecell(-14+tabx*1,7);
				createpilefreecell(-14+tabx*2,7);
				createpilefreecell(-14+tabx*3,7);
				createpilefreecell(-14+tabx*0,7-taby);
				createpilefreecell(-14+tabx*1,7-taby);
				createpilefreecell(-14+tabx*2,7-taby);
				createpilefreecell(-14+tabx*3,7-taby);
				createpiletableau(10,-14,7-2*taby);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cardlist.invertieren();//!!!!!!!!!!
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				foundationascending(true);
				tableaugiverestrictionfreecell(true);
				cameraposition[0].setzen(-3,-6,-38);
				cameraposition[1].setzen(0.5,-5,-36);
				cameraposition[2].setzen(0.5,-3,-37);
				camerapositionmenu[2].setzen(1,1,-50);
			
				camerapositionpreview[1].setzen(0,0,-100);
				camerapositionpreview[2].setzen(0,-4.5,-100);
				rectangle[0].setzen(-14,-14.7);
				rectangle[1].setzen(-14+tabx*9,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				shufflecards();
				new _animationmove(this,14,-11,0,80,5);
				new _animationmove(this,8,-7,0,40,5,true);
				_vektor3<_tg> v;
				v.setzen(0,-5,-0.02);
				v.rotz(-20);
				_tg av=2;
				_animationrotation*ar=new _animationrotation(this,0,0,0,0,30,15);
				for(n=0;n<104;n++){
				 ar->use(card(n),180,v);
				 v.rotz(-av);
				 v.mul(1.005);
				 av*=1.015;
				};
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				for(n=0;n<4;n++) a2->use(piletableau(n),11);
				for(n=4;n<10;n++) a2->use(piletableau(n),10);
				_animationpileshiftout*a3=new _animationpileshiftout(this,10,10);
				for(n=0;n<4;n++) a3->use(piletableau(n),11);
				for(n=4;n<10;n++) a3->use(piletableau(n),10);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,13,15);
				for(n=0;n<4;n++) a4->use(piletableau(n),11);
				for(n=4;n<10;n++) a4->use(piletableau(n),10);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E F R E E W A L L
//******************************************************************************************************************
_gamefreewall::_gamefreewall(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamefreecell(s,mo,prev,menue,FREEWALL){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(8,-11,7-taby-0.5);
				createpilefoundation(4+tabx*1,7);
				createpilefoundation(4+tabx*2,7);
				createpilefoundation(4+tabx*3,7);
				createpilefoundation(4+tabx*4,7);
				createpilefreecell(-11+tabx*0,7);
				createpilefreecell(-11+tabx*1,7);
				createpilefreecell(-11+tabx*2,7);
				createpilefreecell(-11+tabx*3,7);
				createpilefreecell(-11+tabx*4,7);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cardlist.invertieren();
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				foundationascending(true);
				tableaugiverestrictionfreecell(true);
				cameraposition[0].setzen(-2,-4,-37);
				cameraposition[1].setzen(1,-2.5,-36);
				cameraposition[2].setzen(1,-2.5,-36);
				camerapositionmenu[2].setzen(1,3,-50);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-4,-77);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(4+tabx*4,7+1);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				shufflecards();
				new _animationmove(this,10,-11,0,80,5);
				new _animationmove(this,0,-11,0,40,5,true);
				_vektor3<_tg> v;
				v.setzen(15,0,0);
				v.rotz(-10);
				_tg av=1;
				_animationrotation*ar=new _animationrotation(this,0,0,0,0,30,22);
				for(n=0;n<24;n++){
				 ar->use(card(51-n),180,v);
				 v.rotz(av);
				 v.mul(1.01);
				 av*=1.02;
				};
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				for(n=0;n<2;n++) a2->use(piletableau(n),6);
				for(n=6;n<8;n++) a2->use(piletableau(n),6);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				for(n=0;n<2;n++) a3->use(piletableau(n),6);
				for(n=6;n<8;n++) a3->use(piletableau(n),6);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,13,15);
				for(n=0;n<2;n++) a4->use(piletableau(n),6);
				for(n=6;n<8;n++) a4->use(piletableau(n),6);
				//----------------------------- kern anlegen -------------------------
				_animationcardtopile*ap52=new _animationcardtopile(this,30,30);
				for(n=2;n<6;n++) ap52->use(piletableau(n),2,true,true);
				_animationpileturn*a54=new _animationpileturn(this,13,100);
				for(n=2;n<6;n++) a54->use(piletableau(n));
				_animationcardtopile*ap22=new _animationcardtopile(this,30,30);
				for(n=2;n<6;n++) ap22->use(piletableau(n),5,true,true);
				_animationpileturn*a24=new _animationpileturn(this,13,100);
				for(n=2;n<6;n++) a24->use(piletableau(n));
				_animationcardtopile*ap32=new _animationcardtopile(this,30,30);
				for(n=2;n<6;n++) ap32->use(piletableau(n),7,true,true);
				_animationpileturn*a34=new _animationpileturn(this,13,100);
				for(n=2;n<6;n++) a34->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E E I G H T O F F
//******************************************************************************************************************
_gameeightoff::_gameeightoff(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamefreecell(s,mo,prev,menue,EIGHTOFF){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(8,-11,7-taby-0.5);
				createpilefoundation(14.6,7-taby*0);
				createpilefoundation(14.6,7-taby*1);
				createpilefoundation(14.6,7-taby*2);
				createpilefoundation(14.6,7-taby*3);
				createpilefreecell(-11+tabx*0,7);
				createpilefreecell(-11+tabx*1,7);
				createpilefreecell(-11+tabx*2,7);
				createpilefreecell(-11+tabx*3,7);
				createpilefreecell(-11+tabx*4,7);
				createpilefreecell(-11+tabx*5,7);
				createpilefreecell(-11+tabx*6,7);
				createpilefreecell(-11+tabx*7,7);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cardlist.invertieren();
				tableaugivesamesuit(true);
				tableaugivedescending(true);
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);
				tableautakeemptynumber(12);//king
				tableaugiverestrictionfreecell(true);
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(0,-6,-35);
				cameraposition[2].setzen(0,-1.5,-35);
				camerapositionmenu[2].setzen(1.5,3,-50);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-3,-75);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(14.6,7+1);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,10,-11,0,80,5);
				new _animationmove(this,0,-11,0,40,5,true);
				new _animationrotation(this,3,3,0,180,10,8);
				shufflecards();
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				for(n=0;n<8;n++) a2->use(piletableau(n),6);
				new _animationrotation(this,0,0,0,180,0.70,8);
				_animationcardtofreecell*af=new _animationcardtofreecell(this,40,40);
				_pilefreecell*cfit;
				if(pilefreecelllist.anfang(cfit))do{
				 af->use(cfit);
				}while(pilefreecelllist.naechstes(cfit));
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				for(n=0;n<8;n++) a3->use(piletableau(n),6);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,16,15);
				for(n=0;n<8;n++) a4->use(piletableau(n),6);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E F O R E C E L L 
//******************************************************************************************************************
_gameforecell::_gameforecell(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamefreecell(s,mo,prev,menue,FORECELL){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(8,-11,7-taby-0.5);
				createpilefoundation(4+tabx*0,7);
				createpilefoundation(4+tabx*1,7);
				createpilefoundation(4+tabx*2,7);
				createpilefoundation(4+tabx*3,7);
				createpilefreecell(-11+tabx*0,7);
				createpilefreecell(-11+tabx*1,7);
				createpilefreecell(-11+tabx*2,7);
				createpilefreecell(-11+tabx*3,7);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cardlist.invertieren();
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				foundationascending(true);
				tableaugiverestrictionfreecell(true);
				tableautakeemptynumber(12);//king
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(0,0,-37);
				cameraposition[2].setzen(0,-2,-35);
				camerapositionmenu[2].setzen(1,4,-55);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-3,-75);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(4+tabx*3,7+1);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,10,-11,0,80,5);
				new _animationmove(this,0,-11,0,40,5,true);
				new _animationrotation(this,0,0,0,180,0.70,8);
				shufflecards();
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				for(n=0;n<8;n++) a2->use(piletableau(n),6);
				new _animationrotation(this,0,0,0,180,0.70,8);
				_animationcardtofreecell*af=new _animationcardtofreecell(this,40,40);
				_pilefreecell*cfit;
				if(pilefreecelllist.anfang(cfit))do{
				 af->use(cfit);
				}while(pilefreecelllist.naechstes(cfit));
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				for(n=0;n<8;n++) a3->use(piletableau(n),6);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,13,15);
				for(n=0;n<8;n++) a4->use(piletableau(n),6);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E F O U R C O L O R
//******************************************************************************************************************
_gamefourcolor::_gamefourcolor(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamefreecell(s,mo,prev,menue,FOURCOL){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby);
				createpilefoundation(14.6,7-taby*0);
				createpilefoundation(14.6,7-taby*1);
				createpilefoundation(14.6,7-taby*2);
				createpilefoundation(14.6,7-taby*3);
				createpilefreecell(-11+tabx*0,7,2);
				createpilefreecell(-11+tabx*1,7,3);
				createpilefreecell(-11+tabx*2,7,1);
				createpilefreecell(-11+tabx*3,7,0);
				createcards(1,0);
				createcards(1,1);
				createcards(1,3);
				createcards(1,2);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				foundationascending(true);
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(0,-2,-37);
				cameraposition[2].setzen(0,-2,-37);
				camerapositionmenu[2].setzen(2,4,-60);
				camerapositionpreview[1].setzen(0,0,-90);
				camerapositionpreview[2].setzen(0,-4,-95);
				rectangle[0].setzen(-11,-13);
				rectangle[1].setzen(14.6,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,10,-11,0,80,5);
				new _animationmove(this,0,-11,0,40,5,true);
				new _animationrotation(this,3,4,0,180,10,8);
				shufflecards(0,12);
				shufflecards(13,25);
				shufflecards(26,38);
				shufflecards(39,51);
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				for(n=0;n<4;n++) a2->use(piletableau(n),13);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				for(n=0;n<4;n++) a3->use(piletableau(n),13);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,13,15);
				for(n=0;n<4;n++) a4->use(piletableau(n),13);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E S E A T O W E R S 
//******************************************************************************************************************
_gameseatowers::_gameseatowers(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamefreecell(s,mo,prev,menue,SEATOWERS){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(10,-11,7-taby-0.5);
				createpilefoundation(-11,7);
				createpilefoundation(-11+tabx,7);
				createpilefoundation(14+tabx*0,7);
				createpilefoundation(14+tabx*1,7);
				createpilefreecell(-1+tabx*0,7);
				createpilefreecell(-1+tabx*1,7);
				createpilefreecell(-1+tabx*2,7);
				createpilefreecell(-1+tabx*3,7);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				tableaugivesamesuit(true);
				tableaugivedescending(true);
				tableautakesamesuit(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);
				foundationascending(true);
				tableaugiverestrictionfreecell(true);
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(1.5,-2,-37);
				cameraposition[2].setzen(1.5,-2,-37);
				camerapositionmenu[2].setzen(4,7,-55);
				camerapositionpreview[1].setzen(0,0,-75);
				camerapositionpreview[2].setzen(0,-4.5,-78);
				rectangle[0].setzen(-11,-10);
				rectangle[1].setzen(-11+tabx*9,7+1);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				shufflecards();
				new _animationmove(this,10,-11,0,80,5);
				new _animationmove(this,0,-11,0,40,5,true);
				_vektor3<_tg> v;
				v.setzen(8,0,-0.02);
				v.rotz(10);
				_tg av=2;
				_animationrotation*ar=new _animationrotation(this,0,0,0,0,30,30);
				for(n=0;n<52;n++){
				 ar->use(card(n),180,v);
				 v.rotz(av);
				 v.mul(1.005);
				 av*=1.02;
				};
				_animationcardtopile*a2=new _animationcardtopile(this,25,20);
				for(n=0;n<10;n++) a2->use(piletableau(n),5);
				new _animationrotation(this,0,0,0,180,0.70,8);
				_animationcardtofreecell*af=new _animationcardtofreecell(this,40,40);
				_pilefreecell*it=pilefreecelllist.erstes();
				it=it->naechstes();
				af->use(it);
				it=it->naechstes();
				af->use(it);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,15);
				for(n=0;n<10;n++) a3->use(piletableau(n),5);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,13,15);
				for(n=0;n<10;n++) a4->use(piletableau(n),5);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E B A K E R S G A M E 
//******************************************************************************************************************
_gamebakersgame::_gamebakersgame(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamefreecell(s,mo,prev,menue,BAKERSGAME){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(8,-11,7-taby-0.5);
				createpilefoundation(4+tabx*0,7);
				createpilefoundation(4+tabx*1,7);
				createpilefoundation(4+tabx*2,7);
				createpilefoundation(4+tabx*3,7);
				createpilefreecell(-11+tabx*0,7);
				createpilefreecell(-11+tabx*1,7);
				createpilefreecell(-11+tabx*2,7);
				createpilefreecell(-11+tabx*3,7);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cardlist.invertieren();
				tableaugivesamesuit(true);
				tableaugivedescending(true);
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);
				tableaugiverestrictionfreecell(true);
				tableautakeemptynumber(12);
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(0,0,-37);
				cameraposition[2].setzen(0,0,-34);
				camerapositionmenu[2].setzen(0,7,-55);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-4,-78);
				rectangle[0].setzen(-11,-8);
				rectangle[1].setzen(4+tabx*3,7+1);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,10,-11,0,80,5);
				new _animationmove(this,0,-11,0,40,5,true);
				new _animationrotation(this,zufall<_tg>(-6,6),zufall<_tg>(-8,8),0,180,20,8);
				shufflecards();
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				for(n=0;n<4;n++) a2->use(piletableau(n),7);
				for(n=4;n<8;n++) a2->use(piletableau(n),6);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				for(n=0;n<4;n++) a3->use(piletableau(n),7);
				for(n=4;n<8;n++) a3->use(piletableau(n),6);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,33,50);
				for(n=0;n<4;n++) a4->use(piletableau(n),7);
				for(n=4;n<8;n++) a4->use(piletableau(n),6);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E A U S T R A L I A N 
//******************************************************************************************************************
_gameaustralian::_gameaustralian(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=AUSTRALIAN;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby-1);
				_tg px=-11;
				createpilestock(px,7,0,1);
				createpilewaste(px+tabx,7);
				px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,0,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-55);
				camerapositionpreview[2].setzen(0,-1,-58);
				rectangle[0].setzen(-11,-8);
				rectangle[1].setzen(+tabx*3,7+1);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-10,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-6,0,40,5,true);
				shufflecards();
				_animationcardtostock*a2=new _animationcardtostock(this,pilestock(0),24,50,10);
				_animationrotation*ar=new _animationrotation(this,0,0,0,180,0.70,8);
				_animationcardtopile*a3=new _animationcardtopile(this,50,100);
				for(n=0;n<7;n++) a3->use(piletableau(n),4);
				_animationpileshiftout*as=new _animationpileshiftout(this,20,20);
				for(n=0;n<7;n++) as->use(piletableau(n),4);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,10,50);
				for(n=0;n<7;n++) a4->use(piletableau(n),4);
				setanimationpreparative();
				update();
};
bool _gameaustralian::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);	
				}else if(tipptableau(0)){
				 tippexecutemove();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gameaustralian::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(autoplaymovetableau(1)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gameaustralian::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				};
				return(false);
};
bool _gameaustralian::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaywaste(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E B E T H O R A L
//******************************************************************************************************************
_gamebethoral::_gamebethoral(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
                sourcarditerator=0;
				index=BETROTHAL;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilebethoral*pb=createpilebethoral(-11+tabx*0.5,0+taby+4);
				pb->showdescription=false;
				_tg px=-11;
				createpilestock(px,0,1,0);
				_pilediscard*pd=createpilediscard(px+tabx,0);
				pd->showdescription=false;
				createcards(1,1);
				createcards(1,0);
				createcards(1,3);
				createcards(1,2);
				cameraposition[2].setzen(-10,0,-35);
				camerapositionmenu[2].setzen(-10,5,-50);
				camerapositionpreview[1].setzen(4,0,-50);
				camerapositionpreview[2].setzen(0,-2.5,-55);
				rectangle[0].setzen(-11+tabx*0.5 - 6,-taby-4);
				rectangle[1].setzen(-11+tabx*0.5 + 6,+taby+4);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,-8,-6,0,40,5,true);
				shufflecards(0,49);
				swapcards(0,50);
				new _animationcardtostock(this,pilestock(0),51,50,10);
				_animationcardtopile*a3=new _animationcardtopile(this,50,100);
				a3->use(piletableau(0),1,false,true);
				setanimationpreparative();
				update();
};
bool _gamebethoral::tippbethoral(){
                _piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 int cpp=pit->anzahl();
				 if(cpp>2){
				  if(sourcarditerator>(cpp-1)) sourcarditerator=0;
				  int sourstart=sourcarditerator;
				  bool found=false;
				  do{
				   _card*cs=pit->card(sourcarditerator);
				   if(cs->canpick()){ 
				    foundlist.aushaengen();
				    foundlist.einhaengen(cs);
				    founddest=getpilediscardminimum();
				    foundsour=cs->pile;
				    found=true;
				   };
				   sourcarditerator+=1;
				   if(sourcarditerator>(cpp-1)) sourcarditerator=0;
				  }while((found==false)&&(sourstart!=sourcarditerator));
				  if(found) return(true);
				 };
				}while(piletableaulist.naechstes(pit));
				return(false);
};
bool _gamebethoral::tipp(){
				startusing();
				if(tippbethoral()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamebethoral::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippbethoral()){
				  _pilebethoral*pb=dynamic_cast<_pilebethoral*>(foundsour);
				  _card*it=foundlist.erstes()->objekt();
				  if((it)&&(pb)){
				   pb->discard(it);
				   return(true);
				  };
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};		
				return(false);
};
bool _gamebethoral::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autodiscard){
	  			  if(tippbethoral()){
				   _pilebethoral*pb=dynamic_cast<_pilebethoral*>(foundsour);
				   _card*it=foundlist.erstes()->objekt();
				   if((it)&&(pb)){
				    pb->discard(it);
				    return(true);
				   };
	 			  };
	 			 };
				};
				return(false);
};
bool _gamebethoral::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(card->canpick()){
				 _pilebethoral*pb=dynamic_cast<_pilebethoral*>(card->pile);
				 if(pb){
				  pb->discard(card);
				  return(true);
				 };
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E B L A N K E T
//******************************************************************************************************************
_gameblanket::_gameblanket(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
                souriterator=0;
                destiterator=0;
                foundsourcard=0;
                founddestcard=0;
};
_gameblanket::_gameblanket(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
                souriterator=0;
                destiterator=0;
                foundsourcard=0;
                founddestcard=0;
				index=BLANKET;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pileblanket*pb;
				pb=createpileblanket(-19,9-taby*0);pb->showdescription=false;
				pb=createpileblanket(-19,9-taby*1);pb->showdescription=false;
				pb=createpileblanket(-19,9-taby*2);pb->showdescription=false;
				pb=createpileblanket(-19,9-taby*3);pb->showdescription=false;

				_pileredeal*pr=createpileredeal(-19+6*tabx,9-taby*4.3,13);
				pr->blanketmode=true;
				pr->redealvalue=2;
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cardlist.invertieren();
				cameraposition[0].setzen(-4,-4,-46);
				cameraposition[1].setzen(0,-4,-43);
				cameraposition[2].setzen(0,-2,-44);
				camerapositionmenu[2].setzen(1,7,-70);
				camerapositionpreview[1].setzen(0,0,-80);
				camerapositionpreview[2].setzen(0,-3,-100);
				rectangle[0].setzen(-19,9-taby*4);
				rectangle[1].setzen(-19+tabx*12,9);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,-3,-11,0,40,5,true);
				shufflecards();
				_animationcardtopile*af=new _animationcardtopile(this,40,40);
				_piletableau*fit;
				if(piletableaulist.anfang(fit))do{
				 af->use(fit,13,false,true);
				}while(piletableaulist.naechstes(fit));
				new _animationpseudoclear(this,0,-zufall<_tg>(-8,8),zufall<_tg>(-8,8),-30,24,40);
				setanimationpreparative();
				update();
};
bool _gameblanket::tippblanket(){
				_card*card[48];
				_card*ace[4];
				int ci=0;
				int ai=0;
				_piletableau*pit;
				_card*cit;
				if(piletableaulist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  if(cit->number==0){
				   ace[ai]=cit;
				   ai+=1;
				  }else{
				   card[ci]=cit;
				   ci+=1;
				  };
				 }while(pit->naechstes(cit));
				}while(piletableaulist.naechstes(pit));
				_card*cs=card[souriterator];
				_card*cd=ace[destiterator];
				int sourstart=souriterator;
				int deststart=destiterator;
				bool found=false;
				foundsourcard=0;
				founddestcard=0;
				do{
				 cs=card[souriterator];
				 cd=ace[destiterator];
				 _pileblanket*pks=dynamic_cast<_pileblanket*>(cd->pile);
				 _pileblanket*pkd=dynamic_cast<_pileblanket*>(cs->pile);
				 if((pkd)&&(pks)&&(cs->canpick())){
				  if(pkd->leftestcard(cd)){
				   if((cs->number==1)&&(pks->leftestcard(cs)==false)){//nur 2er
				    found=true;
				    foundsourcard=cs;
				    founddestcard=cd;
				   };
				  }else{
				   if(cs->number==1){
				    //nichts machen
				   }else{
				    if(pkd->candropat(cs,cd)){
				     found=true;
				     foundsourcard=cs;
				     founddestcard=cd;
				    };
				   };
				  };
				 };
				 souriterator+=1;
				 if(souriterator>47){
				  souriterator=0;
				  destiterator+=1;
				  if(destiterator>3) destiterator=0;
				 };
				}while((found==false)&&(!((sourstart==souriterator)&&(deststart==destiterator))));
				return(found);
};
void _gameblanket::tippexecuteblanket(){
				_card*cs=foundsourcard;
				_card*cd=founddestcard;
				if((cs)&&(cd)){
				 _card*cn=new _card(cs);
				 _vektor3<_tg> vn;
				 _vektor3<_tg> t0;
				 _vektor3<_tg> t1;
				 t0.setzen(0,0,-20);
				 t1.setzen(0,0,+20);
				 tipplist.einhaengen(cn);
				 cn->curveposition.setzen(cn->position,cd->position,t0,t1);
				 cn->curvevx.setzen(cn->vx,cn->vx,vn,vn);
				 cn->curvevy.setzen(cn->vy,cn->vy,vn,vn);
				 cn->curvespeed=solitaire->autospeed;
				 cn->startcurve();
				 cn->cardcontrolopacity=cs;
				 cn->curveopacity.setzen(0,0,2,-10);
				};
};
bool _gameblanket::tipp(){
	            _pileredeal*rit;
	            if(pileredeallist.anfang(rit)) if(rit->ready()==false) return(false);
				startusing();
				if(tippblanket()){
				 tippexecuteblanket();return(true);
				}else if(tippredeal()){
				 tippexecuteredeal();return(true);
				};
				return(false);
};
bool _gameblanket::autoplay(){
	            _pileredeal*rit;
	            if(pileredeallist.anfang(rit)) if(rit->ready()==false) return(false);
				startusing();
				if(cardcurving()==false){
				 if(tippblanket()){
				  _pileblanket*pk= dynamic_cast<_pileblanket*>(founddestcard->pile);
				  if(pk) pk->swap(foundsourcard,founddestcard);
				  return(true);
				 }else if(tippredeal()){
				  dynamic_cast<_pileredeal*>(foundsour)->redeal();return(true);
				 };
				};	
				return(false);
};
bool _gameblanket::automove(){
				return(false);
};
bool _gameblanket::clickplayblanket(_card*card){
				if(card->number==0) return(false);
				_card*ace[4];
				int ai=0;
				_piletableau*pit;
				_card*cit;
				if(piletableaulist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  if(cit->number==0){
				   ace[ai]=cit;
				   ai+=1;
				  };
				 }while(pit->naechstes(cit));
				}while(piletableaulist.naechstes(pit));
				_card*cs=card;
				_card*cd=ace[destiterator];
				int sourstart=souriterator;
				int deststart=destiterator;
				_pileblanket*pks=dynamic_cast<_pileblanket*>(cs->pile);
				bool found=false;
				int di=0;
				foundsourcard=0;
				founddestcard=0;
				if((pks)&&(cs->canpick())){
				 do{
				  cd=ace[di];
				  _pileblanket*pkd=dynamic_cast<_pileblanket*>(cd->pile);
				  if(pkd){
			 	   if(pkd->leftestcard(cd)){
				    if(cs->number==1){// && pks.leftestcard(cs)=false//nur 2er
				     found=true;
				     foundsourcard=cs;
				     founddestcard=cd;
				    };
				   }else{
				    if(cs->number==1){ 
				     //nichts machen
				    }else{
				     if(pkd->candropat(cs,cd)){ 
				      found=true;
				      foundsourcard=cs;
				      founddestcard=cd;
				     };
				    };
				   };
				  };
				  di+=1;
			 	 }while((found==false)&&(di!=4));
				};
				return(found);
};
bool _gameblanket::clickplay(_card*card){
	            _pileredeal*rit;
	            if(pileredeallist.anfang(rit)) if(rit->ready()==false) return(false);
				startusing();
				deinsertpick();
				if(clickplayblanket(card)){
				 _pileblanket*pk=dynamic_cast<_pileblanket*>(founddestcard->pile);
				 if(pk) pk->swap(foundsourcard,founddestcard);
				 return(true);
				};
				return(false);
};


//******************************************************************************************************************
//										G A M E B L A N K E T T W O S U I T
//******************************************************************************************************************
_gameblankettwosuit::_gameblankettwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameblanket(s,mo,prev,menue,BLANKETTWOSUIT){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pileblanket*pb;
				pb=createpileblanket(-19,9-taby*0);pb->showdescription=false;
				pb=createpileblanket(-19,9-taby*1);pb->showdescription=false;
				pb=createpileblanket(-19,9-taby*2);pb->showdescription=false;
				pb=createpileblanket(-19,9-taby*3);pb->showdescription=false;
				_pileredeal*pr=createpileredeal(-19+6*tabx,9-taby*4.3,13);
				pr->blanketmode=true;
				pr->redealvalue=2;
				createcards(1,0);
				createcards(1,0);
				createcards(1,1);
				createcards(1,1);
				cardlist.invertieren();
				cameraposition[0].setzen(-4,-4,-46);
				cameraposition[1].setzen(0,-4,-43);
				cameraposition[2].setzen(0,-2,-44);
				camerapositionmenu[2].setzen(1,7,-70);
				camerapositionpreview[1].setzen(0,0,-80);
				camerapositionpreview[2].setzen(0,-3,-100);
				rectangle[0].setzen(-19,9-taby*4);
				rectangle[1].setzen(-19+tabx*12,9);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,-3,-11,0,40,5,true);
				shufflecards();
				_animationcardtopile*af=new _animationcardtopile(this,40,40);
				_piletableau*fit;
				if(piletableaulist.anfang(fit))do{
				 af->use(fit,13,false,true);
				}while(piletableaulist.naechstes(fit));
				new _animationpseudoclear(this,0,-zufall<_tg>(-8,8),zufall<_tg>(-8,8),-30,24,40);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E M A Z E 
//******************************************************************************************************************
_gamemaze::_gamemaze(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
	            souriterator=0;
	            destiterator=0;
	            foundsourcard=0;
	            founddestcard=0;
};
_gamemaze::_gamemaze(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=MAZE;
	            souriterator=0;
	            destiterator=0;
	            foundsourcard=0;
	            founddestcard=0;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilemaze*b;
				b=createpilemaze(-19,9-taby*0,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*1,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*2,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*3,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*4,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*5,9);b->showdescription=false;
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				createcard(0,12);
				createcard(0,12);
				cardlist.invertieren();
				cameraposition[0].setzen(-4,-8,-46);
				cameraposition[1].setzen(-7.5,-7,-40);
				cameraposition[2].setzen(-7.5,-3,-40);
			    camerapositionmenu[2].setzen(-7,7,-70);
				camerapositionpreview[1].setzen(0,0,-120);
				camerapositionpreview[2].setzen(0,-2.5,-95);
				rectangle[0].setzen(-19,9-taby*5);
				rectangle[1].setzen(-19+tabx*8,9);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,12,-5,0,40,5,true);
				shufflecards();
				_animationcardtopile*af=new _animationcardtopile(this,40,40);
				_piletableau*fit;
				if(piletableaulist.anfang(fit))do{
				 af->use(fit,9,false,true);
				}while(piletableaulist.naechstes(fit));
				new _animationpseudoclear(this,12,-zufall<_tg>(-8,8),zufall<_tg>(-8,8),-30,24,40);
				setanimationpreparative();
				update();
};
bool _gamemaze::tippmaze(){
				_card*card[48];
				_card*king[60];
				int ci=0;
				int ai=0;
				_piletableau*pit;
				_card*cit;
				if(piletableaulist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  if(cit->number==12){
				   king[ai]=cit;
				   ai+=1;
				  }else{
				   card[ci]=cit;
				   ci+=1;
				  };
				 }while(pit->naechstes(cit));
				}while(piletableaulist.naechstes(pit));
				_card*cs=card[souriterator];
				_card*cd=king[destiterator];
				int sourstart=souriterator;
				int deststart=destiterator;
				bool found=false;
				foundsourcard=0;
				founddestcard=0;
				do{
				 cs=card[souriterator];
				 cd=king[destiterator];
				 _pileblanket*pkd=dynamic_cast<_pileblanket*>(cd->pile);
				 _pileblanket*pks=dynamic_cast<_pileblanket*>(cs->pile);
				 if((pkd)&&(pks)&&(cs->canpick())){
				  if(pkd->candropat(cs,cd)){
				   found=true;
				   foundsourcard=cs;
				   founddestcard=cd;
				  };
				 };
				 souriterator+=1;
				 if(souriterator>47){
				  souriterator=0;
				  destiterator+=1;
				  if(destiterator>=ai) destiterator=0;
				 };
				}while((found==false)&&(!((sourstart==souriterator)&&(deststart==destiterator))));
				return(found);
};
void _gamemaze::tippexecutemaze(){
				_card*cs=foundsourcard;
				_card*cd=founddestcard;
				if((cs)&&(cd)){
				 _card*cn=new _card(cs);
				 _vektor3<_tg> vn;
				 _vektor3<_tg> t0(0,0,-20);
				 _vektor3<_tg> t1(0,0,+20);
				 tipplist.einhaengen(cn);
				 cn->curveposition.setzen(cn->position,cd->position,t0,t1);
				 cn->curvevx.setzen(cn->vx,cn->vx,vn,vn);
				 cn->curvevy.setzen(cn->vy,cn->vy,vn,vn);
				 cn->curvespeed=solitaire->autospeed;
				 cn->startcurve();
				 cn->cardcontrolopacity=cs;
				 cn->curveopacity.setzen(0,0,2,-10);
				};
};
bool _gamemaze::tipp(){
				startusing();
				if(tippmaze()){
				 tippexecutemaze();return(true);	
				};
				return(false);
};
bool _gamemaze::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippmaze()){
				  _pilemaze*pk=dynamic_cast<_pilemaze*>(founddestcard->pile);
				  if(pk) pk->swap(foundsourcard,founddestcard);
				  return(true);
				 };
				};
				return(false);
};
bool _gamemaze::automove(){
				return(false);
};
bool _gamemaze::clickplaymaze(_card*card){
				if(card->number==12) return(false);
				_card*king[60];
				int ai=0;
				_piletableau*pit;
				_card*cit;
				if(piletableaulist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  if(cit->number==12){
				   king[ai]=cit;
				   ai+=1;
				  };
				 }while(pit->naechstes(cit));
				}while(piletableaulist.naechstes(pit));
				_card*cs=card;
				_card*cd=king[destiterator];
				int sourstart=souriterator;
				int deststart=destiterator;
				_pilemaze*pks=dynamic_cast<_pilemaze*>(cs->pile);
				bool found=false;
				int di=0;
				foundsourcard=0;
				founddestcard=0;
				if((pks)&&(cs->canpick())){
				 do{
				  cd=king[di];
				  _pilemaze*pkd=dynamic_cast<_pilemaze*>(cd->pile);
				  if(pkd){
				   if(pkd->candropat(cs,cd)){
				    found=true;
				    foundsourcard=cs;
				    founddestcard=cd;
				   };
				  };
				  di+=1;
			 	 }while((found==false)&&(di!=ai));
				};
				return(found);
};
bool _gamemaze::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplaymaze(card)){
				 _pilemaze*pk=dynamic_cast<_pilemaze*>(founddestcard->pile);
				 if(pk) pk->swap(foundsourcard,founddestcard);
				 return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E M A Z E E A S Y
//******************************************************************************************************************
_gamemazeeasy::_gamemazeeasy(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamemaze(s,mo,prev,menue,MAZEEASY){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilemaze*b;
				b=createpilemaze(-19,9-taby*0,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*1,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*2,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*3,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*4,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*5,11);b->showdescription=false;
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				createcard(0,12);
				createcard(0,12);
				for(int i=0;i<6;i++){
				 createcard(0,12);
				 createcard(0,12);
				};
				cardlist.invertieren();
				cameraposition[0].setzen(-4,-8,-46);
				cameraposition[1].setzen(-5.5,-7,-43);
				cameraposition[2].setzen(-4,-3,-40);
			    camerapositionmenu[2].setzen(-2,7,-70);
				camerapositionpreview[1].setzen(0,0,-120);
				camerapositionpreview[2].setzen(0,-2.5,-95);
				rectangle[0].setzen(-19,9-taby*5);
				rectangle[1].setzen(-19+tabx*10,9);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,12,-5,0,40,5,true);
				shufflecards();
				_animationcardtopile*af=new _animationcardtopile(this,40,40);
				_piletableau*fit;
				if(piletableaulist.anfang(fit))do{
				 af->use(fit,11,false,true);
				}while(piletableaulist.naechstes(fit));
				new _animationpseudoclear(this,12,-zufall<_tg>(-8,8),zufall<_tg>(-8,8),-30,24,40);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E M A Z E T W O S U I T
//******************************************************************************************************************
_gamemazetwosuit::_gamemazetwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamemaze(s,mo,prev,menue,MAZETWOSUIT){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilemaze*b;
				b=createpilemaze(-19,9-taby*0,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*1,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*2,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*3,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*4,9);b->showdescription=false;
				b=createpilemaze(-19,9-taby*5,9);b->showdescription=false;
				createcards(1,0);
				createcards(1,0);
				createcards(1,2);
				createcards(1,2);
				createcard(0,12);
				createcard(0,12);
				cardlist.invertieren();
				cameraposition[0].setzen(-4,-8,-46);
				cameraposition[1].setzen(-7.5,-7,-40);
				cameraposition[2].setzen(-7.5,-3,-40);
			    camerapositionmenu[2].setzen(-7,7,-70);
				camerapositionpreview[1].setzen(0,0,-120);
				camerapositionpreview[2].setzen(0,-2.5,-95);
				rectangle[0].setzen(-19,9-taby*5);
				rectangle[1].setzen(-19+tabx*8,9);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,12,-5,0,40,5,true);
				shufflecards();
				_animationcardtopile*af=new _animationcardtopile(this,40,40);
				_piletableau*fit;
				if(piletableaulist.anfang(fit))do{
				 af->use(fit,9,false,true);
				}while(piletableaulist.naechstes(fit));
				new _animationpseudoclear(this,12,-zufall<_tg>(-8,8),zufall<_tg>(-8,8),-30,24,40);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E M A Z E E A S Y T W O S U I T
//******************************************************************************************************************
_gamemazeeasytwosuit::_gamemazeeasytwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamemaze(s,mo,prev,menue,MAZEEASYTWOSUIT){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilemaze*b;
				b=createpilemaze(-19,9-taby*0,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*1,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*2,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*3,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*4,11);b->showdescription=false;
				b=createpilemaze(-19,9-taby*5,11);b->showdescription=false;

				createcards(1,3);
				createcards(1,3);
				createcards(1,1);
				createcards(1,1);
				createcard(0,12);
				createcard(0,12);
				for(int i=0;i<6;i++){
				 createcard(3,12);
				 createcard(3,12);
				};
				cardlist.invertieren();
				cameraposition[0].setzen(-4,-8,-46);
				cameraposition[1].setzen(-5.5,-7,-43);
				cameraposition[2].setzen(-4,-3,-40);
			    camerapositionmenu[2].setzen(-2,7,-70);
				camerapositionpreview[1].setzen(0,0,-120);
				camerapositionpreview[2].setzen(0,-2.5,-95);
				rectangle[0].setzen(-19,9-taby*5);
				rectangle[1].setzen(-19+tabx*10,9);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,12,-5,0,40,5,true);
				shufflecards();
				_animationcardtopile*af=new _animationcardtopile(this,40,40);
				_piletableau*fit;
				if(piletableaulist.anfang(fit))do{
				 af->use(fit,11,false,true);
				}while(piletableaulist.naechstes(fit));
				new _animationpseudoclear(this,12,-zufall<_tg>(-8,8),zufall<_tg>(-8,8),-30,24,40);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E C A N C A N 
//******************************************************************************************************************
_gamecancan::_gamecancan(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=CANCAN;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(13,-18,0);
				createpilereserve(-8+tabx*0,7);
				createpilereserve(-8+tabx*1,7);
				createpilereserve(-8+tabx*2,7);
				_tg px=4;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);//king
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-4,-4,-46);
				cameraposition[1].setzen(1,-4,-43);
				cameraposition[2].setzen(1,-4,-43);
				camerapositionmenu[2].setzen(0,3,-55);
				camerapositionpreview[1].setzen(0,-6,-80);
				camerapositionpreview[2].setzen(0,-6,-96);
				rectangle[0].setzen(-18,-6);
				rectangle[1].setzen(-18+tabx*12,7);
				enlargerectangle();
				pilesort();
				int n,i;
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,2,-9,0,40,5,true);
				shufflecards();
				_animationcardtopile*a2=new _animationcardtopile(this,50,10);
				i=1;
				for(n=0;n<13;n++){
				 a2->use(piletableau(n),i);
				 if(n>5) i-=1; else i+=1;
				};
				_animationcardtopile*ap=new _animationcardtopile(this,50,10);
				_pilereserve*prit;
				if(pilereservelist.anfang(prit))do{
				 ap->use(prit,1,false,true);
				}while(pilereservelist.naechstes(prit));
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				i=1;
				for(n=0;n<13;n++){
				 as->use(piletableau(n),i);
				 if(n>5) i-=1; else i+=1;
				};
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<13;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gamecancan::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);//tippexecuteemptypile()
				}else if(tipptableau(0)){
				 tippexecutemove();return(true);
				}else if(tippreserve(0)){
				 tippexecutemove();return(true);
				};
				return(false);
};
bool _gamecancan::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippreserve(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 };
				};
				return(false);
};
bool _gamecancan::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				 if(solitaire->autoturncard){
				  if(tipptableauturn()){ 
				   _listenknoten<_card>*card;
				   if(foundlist.anfang(card))do{
				    card->objekt()->turn(15,true);
				   }while(foundlist.naechstes(card));
				   return(true);
				  };
				 };
				 if(solitaire->autoempty){
				  if(tipptableauemptypile()){ 
				   autoplayanimationpiletopile(true,true);
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gamecancan::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplaytableaumove(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E C R U E L
//******************************************************************************************************************
_gamecruel::_gamecruel(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
};
_gamecruel::_gamecruel(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=CRUEL;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpileredeal(-11,7,4);
				for(_tg iy=0;iy<1.5;iy+=1){
				 for(_tg ix=0;ix<5.5;ix+=1){
				  createpilecruel(-11+ix*tabx,-4+iy*taby);
				 };
			    };
				_tg px=4;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[1].setzen(-1,0,-37);
				cameraposition[2].setzen(0,0,-35);
				camerapositionmenu[2].setzen(1,7,-50);
				camerapositionpreview[1].setzen(0,0,-58);
				camerapositionpreview[2].setzen(0,-2.5,-66);
				rectangle[0].setzen(-11,-4);
				rectangle[1].setzen(4+tabx*3,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(26,-11,0);
				new _animationmove(this,14,-6,0,40,5);
				new _animationmove(this,10,-3,0,40,5,true);
				_animationcardtofoundation*af=new _animationcardtofoundation(this,40,40);
				int in=0;
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 af->use(fit,card(in*13));
				 in+=1;
				}while(pilefoundationlist.naechstes(fit));
				shufflecards();
				_animationcardtopile*a2=new _animationcardtopile(this,50,35);
				for(n=0;n<12;n++) a2->use(piletableau(n),4,false,true);
				setanimationpreparative();
				update();
};
bool _gamecruel::tipp(){
	            _pileredeal*rit;
	            if(pileredeallist.anfang(rit)) if(rit->ready()==false) return(false);
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);
				}else if(tipptableau(0)){
				 tippexecutemove();return(true);
				}else if(tippredeal()){
				 tippexecuteredeal();return(true);
				};
				return(false);
};
bool _gamecruel::autoplay(){
	            _pileredeal*rit;
	            if(pileredeallist.anfang(rit)) if(rit->ready()==false) return(false);
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(autoplaymovetableau(1)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippredeal()){
				  dynamic_cast<_pileredeal*>(foundsour)->redeal();return(true);
				 };
				};
				return(false);
};
bool _gamecruel::automove(){
	            _pileredeal*rit;
	            if(pileredeallist.anfang(rit)) if(rit->ready()==false) return(false);
	
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				};
				return(false);
};
bool _gamecruel::clickplay(_card*card){
	            _pileredeal*rit;
	            if(pileredeallist.anfang(rit)) if(rit->ready()==false) return(false);
				startusing();
				deinsertpick();
				if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E S O L I D S Q U A R E
//******************************************************************************************************************
_gamesolidsquare::_gamesolidsquare(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
};
_gamesolidsquare::_gamesolidsquare(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=SOLIDSQUARE;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilewaste*pw=createpilewaste(-11,0);
				pw->tableaufill=true;
				_pilestock*ps=createpilestock(-14,taby,0,1);
				ps->tableaufill=true;
				ps->redealvalue=0;
				for(_tg iy=0;iy<3.5;iy+=1){
				 for(_tg ix=0;ix<3.5;ix+=1){
				  _pilecruel*cc=createpilecruel(-2*tabx+ix*tabx,2*taby-iy*taby);
				  cc->takeemptyrestriction=false;
				 };
			    };
				_tg px=4;
				_pilefoundation*pf;
				pf=createpilefoundation(+tabx*4,+taby*2.2);pf->takeemptysuit=0;
				pf=createpilefoundation(-tabx*5,-taby*1.2);pf->takeemptysuit=1;
				pf=createpilefoundation(+tabx*4,-taby*1.2);pf->takeemptysuit=2;
				pf=createpilefoundation(-tabx*5,+taby*2.2);pf->takeemptysuit=3;
				tableautakesamesuit(true);
				tableautakeboth(true);
				tableautakewrapped(true);
				foundationascending(true);
				foundationmirrored(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(-5,2,-33);
				cameraposition[1].setzen(-4,3,-37);
				cameraposition[2].setzen(-4,3,-37);
				camerapositionmenu[1].setzen(-1,5,-65);
				camerapositionmenu[2].setzen(-1,5,-65);
				camerapositionpreview[1].setzen(0,0,-78);
				camerapositionpreview[2].setzen(0,-2.3,-75);
				rectangle[0].setzen(-tabx*5,-taby*1.2);
				rectangle[1].setzen(+tabx*4,+taby*2.2);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(26,-11,0);
				shufflecards();
				_animationmove*a0=new _animationmove(this,14,-6,0,40,5);
				_animationmove*a01=new _animationmove(this,10,-3,0,40,5,true);
				_animationcardtopile*a2=new _animationcardtopile(this,50,35);
				for(n=0;n<16;n++) a2->use(piletableau(n),1,false,true);
				new _animationcardtostock(this,pilestock(0),8*13-16,20,10);
				setanimationpreparative();
				update();
};
bool _gamesolidsquare::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);	
				}else if(tipptableau(0,false,true,true)){
				 tippexecutemove();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamesolidsquare::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,false,true,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamesolidsquare::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				};
				return(false);
};
bool _gamesolidsquare::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false,true)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E N A P O L E O N S S Q U A R E
//******************************************************************************************************************
_gamenapoleonssquare::_gamenapoleonssquare(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamesolidsquare(s,mo,prev,menue,NAPOLEONSSQUARE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilewaste*pw=createpilewaste(-tabx*0.7-tabx*0.5,-taby*1-0.5);
				_pilestock*ps=createpilestock(+tabx*0.7-tabx*0.5,-taby*1-0.5,0,1);
				ps->redealvalue=0;
				for(_tg ix=0;ix<3.5;ix+=1){
				 _pilecruel*pc;
				 pc=createpilecruel(-2*tabx+ix*tabx,2*taby);pc->takeemptyrestriction=false;
				 pc=createpilecruel(-3*tabx-0.5,2*taby-taby*ix);pc->takeemptyrestriction=false;
				 pc=createpilecruel(+2*tabx+0.5,2*taby-taby*ix);pc->takeemptyrestriction=false;
				 _pilefoundation*pf;
				 pf=createpilefoundation(-2*tabx+ix*tabx,taby);     pf->takeemptysuit=int(ix);
				 pf=createpilefoundation(-2*tabx+ix*tabx,0);        pf->takeemptysuit=int(ix);
			    };
				tableautakesamesuit(true);
				tableautakedescending(true);
				foundationascending(true);	
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(-5,2,-33);
				cameraposition[1].setzen(-4,3,-33);
				cameraposition[2].setzen(-1,2.5,-30);
				camerapositionmenu[1].setzen(-1,5,-65);
				camerapositionmenu[2].setzen(-1,5,-65);
				camerapositionpreview[1].setzen(0,0,-78);
				camerapositionpreview[2].setzen(0,-2,-65);
				rectangle[0].setzen(-3*tabx-0.5,-taby*1-0.5);
				rectangle[1].setzen(+2*tabx+0.5,2*taby);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(26,-11,0);
				shufflecards();
				new _animationmove(this,14,-6,0,40,5);
				new _animationmove(this,11,-3,0,40,5,true);
				_animationcardtopile*a2=new _animationcardtopile(this,50,35);
				for(n=0;n<12;n++) a2->use(piletableau(n),1,false,true);
				new _animationcardtostock(this,pilestock(0),8*13-12,20,10);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E L A B E L L E L U C I E
//******************************************************************************************************************
_gamelabellelucie::_gamelabellelucie(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamecruel(s,mo,prev,menue,LABELLELUCIE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pileredeal*pr=createpileredeal(-11,7,3);
				pr->shuffle=true;
				pr->redealvalue=2;
				createpiletableau(3,-8+7*tabx,6.5-4.3*taby,-tabx*2.3,0);
				createpiletableau(5,-8+7*tabx,6.5-3.2*taby,-tabx*2.3,0);
				createpiletableau(5,-8+7*tabx,6.5-2.1*taby,-tabx*2.3,0);
				createpiletableau(5,-8+7*tabx,6.5-1.0*taby,-tabx*2.3,0);
				_tg px=4;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableautakesamesuit(true);
				tableautakedescending(true);
				tableaumaximumlength(4);
				foundationascending(true);
				int n;
				for(n=0;n<18;n++){
				 piletableau(n)->givemaximal=1;
				 piletableau(n)->vector.setzen(0.8,-0.2,0);
				 piletableau(n)->takeemptyrestriction=true;
				};			
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(0,-taby-2,-41);
				cameraposition[1].setzen(0,-taby,-39);
				cameraposition[2].setzen(-2,-taby+1,-39);
				camerapositionpreview[1].setzen(0,0,-110);
				camerapositionpreview[2].setzen(0,-2,-83);
				rectangle[0].setzen(-8,7-4.3*taby-2);
				rectangle[1].setzen(tabx*3,7);
				enlargerectangle();
				cardposition(26,-11,0);
				new _animationmove(this,14,-6,0,40,5);
				new _animationmove(this,10,-3,0,40,5,true);
				shufflecards();
				_animationcardtopile*a2=new _animationcardtopile(this,50,35);
				for(n=0;n<17;n++) a2->use(piletableau(n),3,false,true);
				a2->use(piletableau(17),1,false,true);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E L A F A C I L E L U C I E
//******************************************************************************************************************
_gamelafacilelucie::_gamelafacilelucie(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamecruel(s,mo,prev,menue,LAFACILELUCIE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pileredeal*pr=createpileredeal(-11,7,3);
				pr->redealvalue=2;
				pr->shuffle=true;
				createpiletableau(3,-8+7*tabx,6.5-4.3*taby,-tabx*2.3,0);
				createpiletableau(5,-8+7*tabx,6.5-3.2*taby,-tabx*2.3,0);
				createpiletableau(5,-8+7*tabx,6.5-2.1*taby,-tabx*2.3,0);
				createpiletableau(5,-8+7*tabx,6.5-1.0*taby,-tabx*2.3,0);
				_tg px=4;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				foundationascending(true);
				tableaumaximumlength(4);
				int n;
				for(n=0;n<18;n++){
				 piletableau(n)->takesamesuit=true;
				 piletableau(n)->takedescending=true;
				 piletableau(n)->givemaximal=1;
				 piletableau(n)->vector.setzen(0.8,-0.2,0);
				 piletableau(n)->takeemptynumber=12;
				};
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(0,-taby-2,-41);
				cameraposition[1].setzen(0,-taby,-39);
				cameraposition[2].setzen(-2,-taby+1,-39);
				camerapositionpreview[1].setzen(0,0,-110);
				camerapositionpreview[2].setzen(0,-2,-83);
				rectangle[0].setzen(-8,7-4.3*taby-2);
				rectangle[1].setzen(tabx*3,7);
				enlargerectangle();
				cardposition(26,-11,0);
				new _animationmove(this,14,-6,0,40,5);
				new _animationmove(this,10,-3,0,40,5,true);
				shufflecards();
				_animationcardtopile*a2=new _animationcardtopile(this,50,35);
				for(n=0;n<17;n++) a2->use(piletableau(n),3,false,true);
				a2->use(piletableau(17),1,false,true);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E P Y R A M I D
//******************************************************************************************************************
_gamepyramid::_gamepyramid(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
	            sourcarditerator=0;
	            destcarditerator=0;

};
_gamepyramid::_gamepyramid(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=PYRAMID;
	            sourcarditerator=0;
	            destcarditerator=0;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpilewastepyramid(-7.8,7-taby);
				_pilediscard*pd=createpilediscard(10,7);
				pd->pyramidmode=true;
				createpilepyramid(2,7);
				_pilestockpyramid*ps=createpilestockpyramid(-7.8,7);
				ps->redealvalue=2;
				ps->open=true;
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[2].setzen(0,0,-35);
				camerapositionmenu[2].setzen(2.5,5,-55);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-2.5,-70);
				rectangle[0].setzen(-7.8,7-taby*3);
				rectangle[1].setzen(2+tabx*3,7);
				enlargerectangle();
				cardposition(26,-11,0);
				new _animationmove(this,14,2,0,30,10);
				new _animationmove(this,10,5,0,30,10,true);
				shufflecards();
				_animationcardtopile*ap=new _animationcardtopile(this,20,40);
				_pilepyramid*pit;
				if(pilepyramidlist.anfang(pit))do{
				 ap->use(pit,28,false,true);
				}while(pilepyramidlist.naechstes(pit));
				ap->cardinpreparationafteranimation=false;
				_animationmove*a011=new _animationmove(this,-2,8,0,30,20,true);
				_animationcardtopile*as=new _animationcardtopile(this,15,40);
				as->use(pilestock(0),24,true,true);
				setanimationpreparative();
				update();
};
bool _gamepyramid::tippkingtodiscardcard(_card*c){
				if(c->number==12){
				 foundsour=c->pile;
				 founddest=getpilediscardminimum();
				 foundlist.aushaengen();
				 foundlist.einhaengen(c);
				 return(true);
				};
				return(false);
};
bool _gamepyramid::tippkingtodiscard(){
				if(pilediscardlist.erstes()){
				 _card*c=0;
				 _pilestock*psit;
				 if(pilestocklist.anfang(psit))do{
				  c=psit->erstes();
				  if(c) if(tippkingtodiscardcard(c)) return(true);
				 }while(pilestocklist.naechstes(psit));
				 _pilewaste*pwit;
				 if(pilewastelist.anfang(pwit))do{
				  c=pwit->erstes();
				  if(c) if(tippkingtodiscardcard(c)) return(true);
				 }while(pilewastelist.naechstes(pwit));
				 _pilereserve*prit;
				 if(pilereservelist.anfang(prit))do{
				  _card*crit;
				  if(prit->anfang(crit))do{
				   if(tippkingtodiscardcard(crit)) return(true);
				  }while(prit->naechstes(crit));
				 }while(pilereservelist.naechstes(prit));
				 _pilepyramid*pit;
				 if(pilepyramidlist.anfang(pit))do{
				  _card*cit;
				  if(pit->anfang(cit))do{
				   if(cit->canpick()) if(tippkingtodiscardcard(cit)) return(true);
				  }while(pit->naechstes(cit));
				 }while(pilepyramidlist.naechstes(pit));
				};
				return(false);
};
bool _gamepyramid::tipppyramidcard(_card*cs){
				_pilepyramid*pp;
				if(pilepyramidlist.anfang(pp))do{
				 _card*cp;
				 if(pp->anfang(cp))do{
				  if(cp->canpick()) if((((cs->number+1)+(cp->number+1))==13)){
				   foundlist.aushaengen();
				   founddest=getpilediscardminimum();
				   foundsour=cp->pile;
				   foundlist.einhaengen(cs);
				   foundlist.einhaengen(cp);
				   return(true);
				  };
				 }while(pp->naechstes(cp));
				}while(pilepyramidlist.naechstes(pp));
				return(false);
};
bool _gamepyramid::tipppyramidpyramid(_card*cs,_card*cd){
				if(pilediscardlist.erstes()){
				 if((((cs->number+1)+(cd->number+1))==13)){
				  if((cs->canpick())&&(cd->canpick())){
				   foundlist.aushaengen();
				   founddest=getpilediscardminimum();
				   foundsour=cd->pile;
				   foundlist.einhaengen(cs);
				   foundlist.einhaengen(cd);
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gamepyramid::tipppyramid(){
				if((pilestocklist.erstes())&&(pilewastelist.erstes())&&(pilediscardlist.erstes())){
				 //kann innerhalb der pyramide etwas discarded werden?
				 //dazu die kombination benutzen
				 _pilepyramid*pp=pilepyramidlist.erstes();
				 if(pp){
				  int cpp=pp->anzahl();
				  if(cpp>1){
				   if(sourcarditerator>(cpp-1)) sourcarditerator=0;
				   if(destcarditerator>(cpp-1)) destcarditerator=0;
				   int sourstart=sourcarditerator;
				   int deststart=destcarditerator;
				   bool f=false;
				   do{
				    _card*cs=pp->card(sourcarditerator);
				    _card*cd=pp->card(destcarditerator);
					if(tipppyramidpyramid(cs,cd)) f=true;
				    destcarditerator+=1;
				    if(destcarditerator>(cpp-1)){
				     destcarditerator=0;
				     sourcarditerator+=1;
				     if(sourcarditerator>(cpp-1)) sourcarditerator=0;
				    };
				   }while((f==false)&&(!((sourstart==sourcarditerator)&&(deststart==destcarditerator))));
				   if(f) return(true);
				  };
				 };
				 //kann zwischen stock und waste discarded werden ?
				 _pilestock*psit;
				 _pilewaste*pwit;
				 if(pilestocklist.anfang(psit))do{
				  if(pilewastelist.anfang(pwit))do{
				   _card*cs=psit->erstes();
				   _card*cw=pwit->erstes();
				   if((cs)&&(cw)){
				    if(((cs->number+1)+(cw->number+1))==13){
				     foundlist.aushaengen();
				     founddest=getpilediscardminimum();
				     foundsour=psit;
				     foundlist.einhaengen(cs);
				     foundlist.einhaengen(cw);
				     return(true);
				    };
  				   };
				   //kann zwischen pyramide und stock discarded werden?
				   if(cs) if(tipppyramidcard(cs)) return(true);
				   //kann zwischen pyramide und waste discarded werden?
				   if(cw) if(tipppyramidcard(cw)) return(true);
				  }while(pilewastelist.naechstes(pwit));
				 }while(pilestocklist.naechstes(psit));
				};
				//kann zwischen pyramide und reserve discarded werden?
				_pilereserve*prit;
				_card*crit;
				if(pilereservelist.anfang(prit))do{
				 if(prit->anfang(crit))do{
				  if(tipppyramidcard(crit)) return(true);
				 }while(prit->naechstes(crit));
				}while(pilereservelist.naechstes(prit));
				return(false);
};
void _gamepyramid::tippexecutepyramid(){
				_tg i=0;
				_listenknoten<_card>*card;
				if(foundlist.anfang(card))do{
				 _card*cn=new _card(card->objekt());
				 _vektor3<_tg> vn;
				 _vektor3<_tg> off=founddest->dropposition();
				 _vektor3<_tg> t0(0,0,-20);
				 _vektor3<_tg> t1(0,0,+20);
				 tipplist.einhaengen(cn);
				 cn->curveposition.setzen(cn->position,off,t0,t1);
				 cn->curvevx.setzen(cn->vx,founddest->dropvx(),vn,vn);
				 cn->curvevy.setzen(cn->vy,founddest->dropvy(),vn,vn);
				 cn->curvespeed=solitaire->autospeed;
				 cn->startcurve();
				 cn->cardcontrolopacity=card->objekt();
				 cn->curveopacity.setzen(0,0,2,-10);
				 i+=1;
				}while(foundlist.naechstes(card));
};
bool _gamepyramid::tipp(){
				startusing();
				if(tippkingtodiscard()){
				 tippexecutemove();return(true);
				}else if(tipppyramid()){
				 tippexecutepyramid();return(true);
				}else if(tippstockpyramid()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamepyramid::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippkingtodiscard()){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipppyramid()){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tippstockpyramid()){
				  dynamic_cast<_pilestockpyramid*>(foundsour)->deal();return(true);
				 };
				};	
				return(false);
};
bool _gamepyramid::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autodiscard){
	  			  if(tippkingtodiscard()){
				   autoplayanimationpiletopile(true,true);return(true);
	 			  };  
	 			 };	
				};	
				return(false);
};
bool _gamepyramid::clickplaypilecard(_card*card,_pile*pile){
				if(pile==0) return(false);
				if(pilediscardlist.erstes()){
				 _pilereserve*pr=dynamic_cast<_pilereserve*>(pile);
				 if(pr){
				  _card*cit;
				  if(pile->anfang(cit))do{
				   if(((card->number+1)+(cit->number+1))==13){
				    foundlist.aushaengen();
				    founddest=getpilediscardminimum();
				    foundsour=card->pile;
				    foundlist.einhaengen(card);
				    foundlist.einhaengen(cit);
				    return(true);
				   };
				  }while(pile->naechstes(cit));
				 }else{
				  _card*cit=pile->erstes();
				  if(cit){
				   if(((card->number+1)+(cit->number+1))==13){
				    foundlist.aushaengen();
				    founddest=getpilediscardminimum();
				    foundsour=card->pile;
				    foundlist.einhaengen(card);
				    foundlist.einhaengen(cit);
				    return(true);
				   };
				  };
				 };
				};
				return(false);
};
bool _gamepyramid::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(tippkingtodiscardcard(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(tipppyramidcard(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaypilecard(card,pilestock(0))){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaypilecard(card,pilewaste(0))){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaypilecard(card,pilestock(1))){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaypilecard(card,pilewaste(1))){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaypilecard(card,pilereserve(0))){
				 autoplayanimationpiletopile(true,true);return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E P Y R A M I D D O U B L E 
//******************************************************************************************************************
_gamepyramiddouble::_gamepyramiddouble(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamepyramid(s,mo,prev,menue,PYRAMIDDOUBLE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpilewastepyramid(-7.8,7-taby);
				_pilediscard*pd=createpilediscard(10,7);
				pd->pyramidmode=true;
				createpilepyramid(2,7);
				createpilefreecell(14,0);
				_pilestockpyramid*ps=createpilestockpyramid(-7.8,7);
				ps->redealvalue=2;
				ps->open=true;
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-8,-42);
				cameraposition[1].setzen(0,-8,-39);
				cameraposition[2].setzen(0,-2,-39);
				camerapositionmenu[2].setzen(2,1,-65);
				camerapositionpreview[1].setzen(0,0,-120);
				camerapositionpreview[2].setzen(0,-3,-90);
				rectangle[0].setzen(2-tabx*4.5,7-taby*4.5);
				rectangle[1].setzen(2+tabx*4.5,7);
				enlargerectangle();
				cardposition(26,-11,0);
				new _animationmove(this,14,2,0,30,10);
				new _animationmove(this,10,5,0,30,10,true);
				shufflecards();
				_animationcardtopile*ap=new _animationcardtopile(this,20,40);
				_pilepyramid*pit;
				if(pilepyramidlist.anfang(pit))do{
				 ap->use(pit,55,false,true);
				}while(pilepyramidlist.naechstes(pit));
				ap->cardinpreparationafteranimation=false;
				new _animationmove(this,-2,8,0,30,20,true);
				_animationcardtopile*as=new _animationcardtopile(this,20,40);
				as->use(pilestock(0),104-55,true,true);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E P Y R A M I D R E S E R V E
//******************************************************************************************************************
_gamepyramidreserve::_gamepyramidreserve(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamepyramid(s,mo,prev,menue,PYRAMIDRESERVE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilediscard*pd=createpilediscard(10,7);
				pd->pyramidmode=true;
				createpilepyramid(2,7);
				_pilereserve*pr=createpilereserve(-11-tabx*0.5,8);
				pr->vector.setzen(0,-0.8,0);
				pr->flowermode=true;
				pr->arcmode=true;
				pr->radiusy=3;
				pr->radiusx=7;
				pr->anglestep=10;
				pr->pyramidmode=true;
				_pilestockpyramid*ps=createpilestockpyramid(-11,3);
				createpilewastepyramid(-11,3-taby);
				ps->redealvalue=1;
				ps->open=true;
				ps=createpilestockpyramid(-11-tabx,3);
				_pilewastepyramid*pw=createpilewastepyramid(-11-tabx,3-taby);
				ps->redealvalue=1;
				ps->open=true;
				ps->wastepartner=1;
				pw->stockpartner=1;
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-8,-42);
				cameraposition[1].setzen(0,-8,-39);
				cameraposition[2].setzen(-2,-3,-42);
				camerapositionmenu[2].setzen(2,1,-65);
				camerapositionpreview[1].setzen(0,0,-120);
				camerapositionpreview[2].setzen(0,-4,-110);
				rectangle[0].setzen(-11-tabx*1.5,7-taby*4.5);
				rectangle[1].setzen(2+tabx*4.5,8);
				enlargerectangle();
				cardposition(26,-11,0);
				new _animationmove(this,14,2,0,30,10);
				new _animationmove(this,10,5,0,30,10,true);
				shufflecards();
				_animationcardtopile*ap=new _animationcardtopile(this,20,40);	
				_pilepyramid*pit;
				if(pilepyramidlist.anfang(pit))do{	
				 ap->use(pit,55,false,true);
				}while(pilepyramidlist.naechstes(pit));
				ap->cardinpreparationafteranimation=false;
				new _animationmove(this,-2,8,0,30,20,true);
				_animationcardtopile*ap2=new _animationcardtopile(this,10,40);
				_pilereserve*prit;
				if(pilereservelist.anfang(prit))do{
				 ap2->use(prit,10,false,true);
				}while(pilereservelist.naechstes(prit));
				ap2->cardinpreparationafteranimation=false;
				_animationcardtopile*as=new _animationcardtopile(this,20,40);
				as->use(pilestock(0),20,true,true);
				_animationcardtopile*as2=new _animationcardtopile(this,20,40);
				as2->use(pilestock(1),19,true,true);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E G O L F
//******************************************************************************************************************
_gamegolf::_gamegolf(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=GOLF;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_pilestock*ps=createpilestock(-7.8,7,0,0,1);
				ps->redealvalue=0;
				createpilefoundation(-7.8+tabx,7);
				int n;
				for(n=0;n<7;n++)createpilereserve(-10+tabx*n,0);
				foundationboth(true);
				foundationsamesuit(false);
				foundationgiverestriction(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,0,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(0,0,-55);
				camerapositionpreview[2].setzen(0,-2,-57);
				rectangle[0].setzen(-10,-5);
				rectangle[1].setzen(-10+tabx*6,7);
				enlargerectangle();
				pilesort();	
				cardposition(-16,-10,0);
				new _animationmove(this,10,2,0,90,5);
				new _animationmove(this,-6,-6,0,90,5,true);
				new _animationcardtostock(this,pilestock(0),16,50,10);
				_animationcardtopile*a20=new _animationcardtopile(this,60,10);
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 a20->use(fit,1,false);
				}while(pilefoundationlist.naechstes(fit));
				new _animationrotation(this,0,0,0,180,0.70,8);
				shufflecards();
				_animationcardtopile*a2=new _animationcardtopile(this,60,10);
				for(n=0;n<7;n++) a2->use(pilereserve(n),5);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				for(n=0;n<7;n++) a3->use(pilereserve(n),5);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,33,50);
				for(n=0;n<7;n++)a4->use(pilereserve(n),5);
				setanimationpreparative();
				update();
};
bool _gamegolf::tippreservetofoundation(){
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				_pilereserve*rit;
				if(pilereservelist.anfang(rit))do{
				 _card*c=rit->erstes();
				 if(c){
				  if(rit->canpick(c)){
				   foundlist.aushaengen();
				   foundlist.einhaengen(c);
				   _pilefoundation*fit;
				   if(pilefoundationlist.anfang(fit))do{
				    if(fit->candrop(&foundlist)){
				     foundsour=rit;
					 founddest=fit;
					 return(true);
				    };
				   }while(pilefoundationlist.naechstes(fit));
				  };
				 };
				}while(pilereservelist.naechstes(rit));
				return(false);
};
bool _gamegolf::tipp(){
				startusing();
				if(tippreservetofoundation()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamegolf::autoplay(){
				if(tippreservetofoundation()){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(tippstock()){
				 dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				};
				return(false);
};
bool _gamegolf::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippreservetofoundation()){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };
	 			 };
				};
				return(false);
};
bool _gamegolf::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E G O L F E A S Y
//******************************************************************************************************************
_gamegolfeasy::_gamegolfeasy(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamegolf(s,mo,prev,menue){
				foundationwrapped(true);
				index=GOLFEASY;
};	

//******************************************************************************************************************
//										G A M E Y U K O N 
//******************************************************************************************************************
_gameyukon::_gameyukon(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
};
_gameyukon::_gameyukon(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=YUKON;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby);
				_tg px;
				px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);//king
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-3,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(0,0,-65);
				camerapositionpreview[2].setzen(0,-3,-70);
				rectangle[0].setzen(-11,-7);
				rectangle[1].setzen(+tabx*3,7+0.5);
				enlargerectangle();
				pilesort();
				int n;				
				cardposition(-26,-11,0);
				new _animationmove(this,-12,-11,0,40,5);
				new _animationmove(this,-4,-10,0,40,5,true);
				_vektor3<_tg> v(6,0,-0.02);
				v.rotz(10);
				_tg av=2;
				_animationrotation*ar=new _animationrotation(this,0,0,0,0,30,30);
				for(n=0;n<52;n++){
				 if((n==0)||((n>=2)&&(n<=6))||((n>=9)&&(n<=13))||((n>=17)&&(n<=21))||((n>=26)&&(n<=30))||((n>=36)&&(n<=40))||((n>=47)&&(n<=51))){
				  ar->useindex(n,180,v);
				  v.rotz(av);
				  v.mul(0.99);
				  av*=1.02;
				 };
				};
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				a2->use(piletableau(0),1);
				for(n=1;n<7;n++) a2->use(piletableau(n),5+n);
				_animationpileshiftout*a3=new _animationpileshiftout(this,15,20);
				a3->use(piletableau(0),1);
				for(n=1;n<7;n++) a3->use(piletableau(n),5,n);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,13,15);
				a4->use(piletableau(0),1);
			    for(n=1;n<7;n++) a4->use(piletableau(n),5);
				setanimationpreparative();
				shufflecards();
				update();
};
bool _gameyukon::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);//tippexecuteemptypile()
				}else if(autoplaymovetableau(0,false,false)){
				 tippexecutemove();return(true);
				};
				return(false);
};
bool _gameyukon::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,false,false)){
				  autoplayanimationpiletopile();return(true);
				 };
				};
				return(false);
};
bool _gameyukon::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };	
				 if(solitaire->autoturncard){
				  if(tipptableauturn()){ 
				   _listenknoten<_card>*card;
				   if(foundlist.anfang(card))do{
				    card->objekt()->turn(15,true);
				   }while(foundlist.naechstes(card));
				   return(true);
				  };
				 };
				 if(solitaire->autoempty){
				  if(tipptableauemptypile()){ 
				   autoplayanimationpiletopile(true,true);
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gameyukon::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplaytableaumove(card,false,false)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E R U S S I A N 
//******************************************************************************************************************
_gamerussian::_gamerussian(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameyukon(s,mo,prev,menue,RUSSIAN){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby-0.5);
				_tg px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableautakesamesuit(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-3,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(0,0,-65);
				camerapositionpreview[2].setzen(0,-3,-70);
				rectangle[0].setzen(-11,-7);
				rectangle[1].setzen(+tabx*3,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-12,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-4,-10,0,40,5,true);
				shufflecards();
				new _animationrotation(this,0,0,0,180,2,16,1);
				new _animationrotation(this,0,0,0,180,2,16,5,2);
				new _animationrotation(this,0,0,0,180,2,16,5,9);
				new _animationrotation(this,0,0,0,180,2,16,5,17);
				new _animationrotation(this,0,0,0,180,2,16,5,26);
				new _animationrotation(this,0,0,0,180,2,16,5,36);
				new _animationrotation(this,0,0,0,180,2,16,5,47);
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				a2->use(piletableau(0),1);
				for(n=1;n<7;n++) a2->use(piletableau(n),5+n);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				a3->use(piletableau(0),1);
				for(n=1;n<7;n++) a3->use(piletableau(n),5,n);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,33,50);
				a4->use(piletableau(0),1);
				for(n=1;n<7;n++) a4->use(piletableau(n),5);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E R U S S I A N E A S Y
//******************************************************************************************************************
_gamerussianeasy::_gamerussianeasy(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameyukon(s,mo,prev,menue,RUSSIANEASY){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(8,-11-tabx,7-taby);
				_tg px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				tableautakesamesuit(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);
				foundationascending(true);
				createcards(2,0);
				createcards(1,1);
			    createcards(1,3);
				cameraposition[0].setzen(-6,-3,-31);
				cameraposition[1].setzen(-4,-1,-31);
				cameraposition[2].setzen(-4,-1,-31);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(0,0,-65);
				camerapositionpreview[2].setzen(0,-3,-70);
				rectangle[0].setzen(-11-tabx,-7);
				rectangle[1].setzen(+tabx*3,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-12,-11,0,40,5);
				new _animationmove(this,-4,-10,0,40,5,true);
				shufflecards();
				new _animationrotation(this,0,0,0,180,2,16,1);
				new _animationrotation(this,0,0,0,180,2,16,5,2);
				new _animationrotation(this,0,0,0,180,2,16,5,9);
				new _animationrotation(this,0,0,0,180,2,16,5,17);
				new _animationrotation(this,0,0,0,180,2,16,5,26);
				new _animationrotation(this,0,0,0,180,2,16,5,36);
				new _animationrotation(this,0,0,0,180,2,16,5,47);
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				a2->use(piletableau(1),1);
				for(n=1;n<7;n++) a2->use(piletableau(1+n),5+n);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				a3->use(piletableau(1),1);
				for(n=1;n<7;n++) a3->use(piletableau(1+n),5,n);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,33,50);
				a4->use(piletableau(1),1);
				for(n=1;n<7;n++)a4->use(piletableau(1+n),5);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E R U S S I A N F R E E 
//******************************************************************************************************************
_gamerussianfree::_gamerussianfree(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameyukon(s,mo,prev,menue,RUSSIANFREE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(7,-11,7-taby);
				_tg px=0;
				createpilefoundation(px+tabx*0,7);
				createpilefoundation(px+tabx*1,7);
				createpilefoundation(px+tabx*2,7);
				createpilefoundation(px+tabx*3,7);
				px=-11-tabx;
				_pilefreecell*pf;
				pf=createpilefreecell(px+tabx*0,7);
				pf->suit=0;
				pf=createpilefreecell(px+tabx*1,7);
				pf->suit=1;
				pf=createpilefreecell(px+tabx*2,7);
				pf->suit=2;
				pf=createpilefreecell(px+tabx*3,7);
				pf->suit=3;
				tableautakesamesuit(true);
				tableautakedescending(true);
				tableautakeemptynumber(12);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-6,-3,-31);
				cameraposition[1].setzen(-4,-1,-31);
				cameraposition[2].setzen(-4,-1,-31);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(0,0,-65);
				camerapositionpreview[2].setzen(0,-3,-70);
				rectangle[0].setzen(-11-tabx,-7);
				rectangle[1].setzen(+tabx*3,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-12,-11,0,40,5);
				new _animationmove(this,-4,-10,0,40,5,true);
				shufflecards();
				new _animationrotation(this,-5,0,0,180,20,66,1);
				new _animationrotation(this,-5,0,0,180,20,66,5,2);
				new _animationrotation(this,-5,0,0,180,20,66,5,9);
				new _animationrotation(this,-5,0,0,180,20,66,5,17);
				new _animationrotation(this,-5,0,0,180,20,66,5,26);
				new _animationrotation(this,-5,0,0,180,20,66,5,36);
				new _animationrotation(this,-5,0,0,180,20,66,5,47);
				_animationcardtopile*a2=new _animationcardtopile(this,40,40);
				a2->use(piletableau(0),1);
				for(n=1;n<7;n++) a2->use(piletableau(0+n),5+n);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				a3->use(piletableau(0),1);
				for(n=1;n<7;n++) a3->use(piletableau(0+n),5,n);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,33,50);
				a4->use(piletableau(0),1);
				for(n=1;n<7;n++) a4->use(piletableau(0+n),5);
				setanimationpreparative();
				update();
};
bool _gamerussianfree::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplaytableaumove(card,false,false)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplayfreecell(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E L A B Y R I N T H 
//******************************************************************************************************************
_gamelabyrinth::_gamelabyrinth(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
                sourcardx=0;
                sourcardy=0;
};
_gamelabyrinth::_gamelabyrinth(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=LABYRINTH;
                sourcardx=0;
                sourcardy=0;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg ox=-4;
				_tg oy=11;
				_pilelabyrinth*pl=createpilelabyrinth(ox-4,oy+5,8,6);
				pl->fillfirst=true;
				_pilestock*ps=createpilestock(ox-5-tabx,oy+5,0,0,0,true);
				ps->redealvalue=0;
				createpilefoundation(ox-5-tabx,oy+5-1*taby);
				createpilefoundation(ox-5-tabx,oy+5-2*taby);
				createpilefoundation(ox-5-tabx,oy+5-3*taby);
				createpilefoundation(ox-5-tabx,oy+5-4*taby);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(0,-1,-47);
				cameraposition[1].setzen(0,0,-43);
				cameraposition[2].setzen(0,taby,-43);
				camerapositionmenu[2].setzen(1.5,8,-60);
				camerapositionpreview[1].setzen(0,0,-110);
				camerapositionpreview[2].setzen(0,-4.5,-97);
				rectangle[0].setzen(ox-5-tabx,oy+5-taby*5);
				rectangle[1].setzen(ox-4+tabx*7,oy+5);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,60,8);
				new _animationmove(this,-10+tabx*2,-10,0,60,8,true);
				_animationcardtofoundation*af=new _animationcardtofoundation(this,40,40);
				int in=0;
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 af->use(fit,card(in*13));
				 in+=1;
				}while(pilefoundationlist.naechstes(fit));
				shufflecards();
				new _animationcardtostock(this,pilestock(0),4*12,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),20,10,true);
				a3->uselabyrinth(pilelabyrinth(0));
				setanimationpreparative();
				update();
};				
bool _gamelabyrinth::tipplabyrinth(){
				bool found=false;
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				_pilelabyrinth*pl=pilelabyrinthlist.erstes();
				if(pl){
				 _pilefoundation*pit;
				 if(pilefoundationlist.anfang(pit))do{
				  if(found==false){
			       int startsourcardx=sourcardx;
				   int startsourcardy=sourcardy;
				   do{
				    if(pl->feld[sourcardx,sourcardy]){
				     _card*c=pl->feld[sourcardx,sourcardy];
					 if(c->canpick()){
				      foundlist.aushaengen();
				  	  foundlist.einhaengen(c);
				  	  if(pit->candrop(&foundlist)){
				       foundsour=pl;
					   founddest=pit;
					   found=true;
					  };
					 };
					};
					sourcardx+=1;
				    if(sourcardx>=pl->dimx){
					 sourcardx=0;
					 sourcardy+=1;
					 if(sourcardy>=pl->dimy) sourcardy=0;
				    };
				   }while((!((startsourcardx==sourcardx)&&(startsourcardy==sourcardy)))&&(found==false));
				  };
				 }while(pilefoundationlist.naechstes(pit));
				};
				return(found);
};
bool _gamelabyrinth::tipp(){
				startusing();
				if(tipplabyrinth()){
				 tippexecutemove();return(true);	
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamelabyrinth::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tipplabyrinth()){
				  autoplayanimationpiletopile(true,true,-20,0,-10,false);return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamelabyrinth::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tipplabyrinth()){
				   autoplayanimationpiletopile(true,true,-20,0,-10,false);
				   return(true);
	 			  };  
	 			 };
				};
				return(false);
};
bool _gamelabyrinth::clickplayfoundationlabyrinth(_card*c){
				founddest=0;
				foundsour=c->pile;
				foundlist.aushaengen();
				foundlist.einhaengen(c);
				_pilefoundation*destpile;
				if(pilefoundationlist.anfang(destpile))do{
				 if(founddest==0) if(destpile->candrop(&foundlist)) founddest=destpile;
				}while(pilefoundationlist.naechstes(destpile));
				if(founddest) return(true);
				return(false);
};
bool _gamelabyrinth::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayfoundationlabyrinth(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				};
				return(false);
};


//******************************************************************************************************************
//										G A M E L A B Y R I N T H E A S I E R
//******************************************************************************************************************
_gamelabyrintheasier::_gamelabyrintheasier(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamelabyrinth(s,mo,prev,menue){
				index=LABYRINTHEASIER;
				_pilelabyrinth*pl;
				if(pilelabyrinthlist.anfang(pl)) pl->fillfirst=false;
};

//******************************************************************************************************************
//										G A M E L A B Y R I N T H R O D E N B A C H
//******************************************************************************************************************
_gamelabyrinthrodenbach::_gamelabyrinthrodenbach(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamelabyrinth(s,mo,prev,menue){
				index=LABYRINTHRODENBACH;
				_pilelabyrinth*pl;
				if(pilelabyrinthlist.anfang(pl)) {
				 pl->fillfirst=false;
				 pl->bothdirection=true;
				};
};

//******************************************************************************************************************
//										G A M E L A B Y R I N T H D O U B L E
//******************************************************************************************************************
_gamelabyrinthdouble::_gamelabyrinthdouble(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamelabyrinth(s,mo,prev,menue,LABYRINTHDOUBLE){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg ox=-4-3*tabx;
				_tg oy=11;
				_pilelabyrinth*pl=createpilelabyrinth(ox-4,oy+5,16,6);
				pl->fillfirst=false;
				_pilestock*ps=createpilestock(ox-5-tabx,oy+5,0,0,0,true);
				createpilefoundation(ox-5-tabx,oy+5-1*taby);
				createpilefoundation(ox-5-tabx,oy+5-2*taby);
				createpilefoundation(ox-5-tabx,oy+5-3*taby);
				createpilefoundation(ox-5-tabx,oy+5-4*taby);
				createpilefoundation(ox-5-2*tabx,oy+5-1*taby);
				createpilefoundation(ox-5-2*tabx,oy+5-2*taby);
				createpilefoundation(ox-5-2*tabx,oy+5-3*taby);
				createpilefoundation(ox-5-2*tabx,oy+5-4*taby);
				ps->redealvalue=0;
				foundationascending(true);
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(-4,0,-60);
				cameraposition[1].setzen(3,0,-60);
				cameraposition[2].setzen(3,2,-60);
				camerapositionmenu[2].setzen(3,12,-95);
				camerapositionpreview[2].setzen(0,-5,-135);
				rectangle[0].setzen(ox-5-tabx*2  +tabx*0.5  ,oy+5-taby*5);
				rectangle[1].setzen(ox-4+tabx*15 -taby*0.5  ,oy+5);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,60,8);
				new _animationmove(this,-10+tabx*2,-10,0,60,8,true);
				_animationcardtofoundation*af=new _animationcardtofoundation(this,40,40);
				int in=0;
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 af->use(fit,card(in*13));
				 in+=1;
				}while(pilefoundationlist.naechstes(fit));
				shufflecards();
				new _animationcardtostock(this,pilestock(0),8*12,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),20,10,true);
				a3->uselabyrinth(pilelabyrinth(0));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E S W E E T M A T C H 
//******************************************************************************************************************
_gamesweetmatch::_gamesweetmatch(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=SWEETMATCH;
	            sourx=0;
	            soury=0;
	            sourn=0;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();	
				_tg ox=-4-tabx;
				_tg oy=11;
				cameraposition[0].setzen(0,2,-41);
				cameraposition[1].setzen(0,2,-41);
				_pilesweetmatch*ps=createpilesweetmatch(ox-4,oy+5+7*taby,10,13);
				//------------------- set invisible fields -------------------------
				for(int y=0;y<6;y++){
				 for(int x=0;x<10;x++){
				  ps->status[x,y]=1;
				 };
				};
				//------------------ set blocked fields ----------------------------
		 		for(int x=4;x<6;x++){
		 		 for(int y=9;y<13;y++){
				  ps->status[x,y]=2;
				 };
				};
				//------------------ set blased fields ----------------------------
		        ps->status[3,9]=3;
		        ps->status[3,10]=3;
		        ps->status[3,11]=3;
		        ps->status[3,12]=3;
		        ps->status[6,9]=3;
		        ps->status[6,10]=3;
		        ps->status[6,11]=3;
		        ps->status[6,12]=3;
		        //------------------------------------------------------------------
				createpilediscard(ox+4+tabx*2,oy-3*taby);
				for(int i=0;i<12;i++){
				 createcard(0,0);
				 createcard(1,0);
				 createcard(0,9);
				 createcard(2,12);
				 createcard(3,11);
				};
				ps->updateblase();
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(+tabx*3,7);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,46,8);
				new _animationmove(this,-6,-12,0,46,8);
				for(int  i=1;i<4;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,3),-10+i*taby*2.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
				_animationrotation*ar=new _animationrotation(this,0,0,0,180,3,8);
				shufflecards();
				_animationcardtopile*a3=new _animationcardtopile(this,20,10);
				a3->usesweetmatch(pilesweetmatch(0),true,true);
				update();
};
bool _gamesweetmatch::tippsweetmatch(){
				_pilesweetmatch*ps=pilesweetmatch(0);
				bool found=false;
				_card*c;
				_card*cn;
				int nx,ny;
				int startsourn=sourn;
				int startsourx=sourx;
				int startsoury=soury;
				foundsour=ps;
				founddest=ps;
				foundlist.aushaengen();
				founddestposition.loeschen();
				founddestcard.aushaengen();
				do{
				 if(sourn==0){ 
				  nx=sourx+1;
				  ny=soury;
				 }else if(sourn==1){
				  nx=sourx;
				  ny=soury+1;
				 }else if(sourn==2){
				  nx=sourx-1;
				  ny=soury;
				 }else if(sourn==3){
				  nx=sourx;
				  ny=soury-1;
				 };
				 c=ps->feld[sourx,soury];
				 cn=0;
				 if((nx>=0)&&(nx<ps->dimx)&&(ny>=0)&&(ny<ps->dimy)) cn=ps->feld[nx,ny];
				 if((c)&&(cn)){
				  if(ps->swapbuildsrow(c,cn)){
				   _vektor3<_tg>*v=new _vektor3<_tg>(ps->droppositionat(nx,ny));
				   foundlist.einhaengen(c);
				   founddestposition.einhaengen(v);
				   founddestcard.einhaengen(cn);
				   found=true;
				  }; 
				 };
				 sourn+=1;
				 if(sourn>3){
				  sourn=0;
				  sourx+=1;
				  if(sourx>(ps->dimx-1)){
				   sourx=0;
				   soury+=1;
				   if(soury>(ps->dimy-1)) soury=0;
				  };
				 };
				}while((found==false)&& (!((startsourn==sourn)&&(startsourx==sourx)&&(startsoury==soury))));
				return(found);
};
void _gamesweetmatch::tippexecutesweetmatch(){
				_vektor3<_tg>*v=founddestposition.erstes()->objekt();
				_listenknoten<_card>*card;
				if(foundlist.anfang(card))do{
				 _card*cn=new _card(card->objekt());
				 _vektor3<_tg> vn;
				 _vektor3<_tg> t0(0,0,-20);
				 _vektor3<_tg> t1(0,0,+20);
				 tipplist.einhaengen(cn);
				 cn->curveposition.setzen(cn->position,*v,t0,t1);
				 cn->curvevx.setzen(cn->vx,founddest->dropvx(),vn,vn);
				 cn->curvevy.setzen(cn->vy,founddest->dropvy(),vn,vn);
				 cn->curvespeed=40;
				 cn->startcurve();
				 cn->cardcontrolopacity=card->objekt();
				 cn->curveopacity.setzen(0,0,2,-10);
				}while(foundlist.naechstes(card));
};
bool _gamesweetmatch::tipp(){
				startusing();
				if(tippsweetmatch()){
				 tippexecutesweetmatch();return(true);
				};
				return(false);
};
bool _gamesweetmatch::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippsweetmatch()){
				  _pilesweetmatch*ps=pilesweetmatch(0);
				  _card*c=foundlist.erstes()->objekt();
				  _card*cn=founddestcard.erstes()->objekt();
				  ps->swap(c,cn,false);
				  return(true);
				 };
				};
				return(false);
};
bool _gamesweetmatch::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
				};
				return(false);
};
bool _gamesweetmatch::clickplaysweetmatch(_card*c){
				_pilesweetmatch*ps=pilesweetmatch(0);
				bool found=false;
				_card*cn;
				_card*cf;
				int nx,ny;
				int x=c->sweetindex[0];
				int y=c->sweetindex[1];
				int n=0;
				foundsour=ps;
				founddest=ps;
				foundlist.aushaengen();
				founddestposition.loeschen();
				founddestcard.aushaengen();
				do{
				 if(n==0){
				  nx=x+1;
				  ny=y;
				 }else if(n==1){
				  nx=x;
				  ny=y+1;
				 }else if(n==2){
				  nx=x-1;
				  ny=y;
				 }else if(n==3){
				  nx=x;
				  ny=y-1;
				 };
				 cf=ps->feld[x,y];
				 cn=0;
				 if((nx>0)&&(nx<ps->dimx)&&(ny>0)&&(ny<ps->dimy)) cn=ps->feld[nx,ny];
				 if((cf)&&(cn)){
				  if(ps->swapbuildsrow(cf,cn)){
				   _vektor3<_tg>*v=new _vektor3<_tg>(ps->droppositionat(nx,ny));
				   foundlist.einhaengen(cf);
				   founddestposition.einhaengen(v);
				   founddestcard.einhaengen(cn);
				   found=true;
				  }; 
				 };
				 n+=1;
				}while((found==false)&&(n<4));
				return(found);
};
bool _gamesweetmatch::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplaysweetmatch(card)){
				_pilesweetmatch*ps=pilesweetmatch(0);
				 _card*c=foundlist.erstes()->objekt();
				 _card*cn=founddestcard.erstes()->objekt();
				 ps->swap(c,cn,false);
				 return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E K I N G S P E A K	
//******************************************************************************************************************
_gamekingspeak::_gamekingspeak(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=KINGSPEAK;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg ox=0;
				_tg oy=-taby;
				createpiletableau(1,ox-tabx,oy-1*taby);
				createpiletableau(1,ox-tabx,oy+0*taby);
				createpiletableau(1,ox-tabx,oy+1*taby);
				createpiletableau(1,ox-tabx,oy+2*taby);
				_piletableau*p;
				int i;
				for(i=0;i<4;i++){
				 p=piletableau(i);
				 p->vector.setzen(-1,0,0);
				 p->takedescending=true;
				 p->takesamesuit=true;
				 p->takeemptynumber=5;
				 p->takeemptysuit=i;
				 p->giverestriction=true;
				 p->discardcount=true;
				};
				createpiletableau(1,ox+tabx*1,oy-1*taby);
				createpiletableau(1,ox+tabx*1,oy+0*taby);
				createpiletableau(1,ox+tabx*1,oy+1*taby);
				createpiletableau(1,ox+tabx*1,oy+2*taby);
				for(i=4;i<8;i++){
				 p=piletableau(i);
				 p->vector.setzen(1,0,0);
				 p->takeascending=true;
				 p->takesamesuit=true;
				 p->takeemptynumber=6;
				 p->takeemptysuit=i-4;
				 p->giverestriction=true;
				 p->discardcount=true;
				};
				_tg px=-11;
				_pilestock*ps=createpilestock(ox-tabx/2,oy+3*taby,0,1);
				createpilewaste(ox+tabx-tabx/2,oy+3*taby);
				px=-tabx;
				createpiletableau(1,ox,oy-1*taby);
				createpiletableau(1,ox,oy+0*taby);
				createpiletableau(1,ox,oy+1*taby);
				createpiletableau(1,ox,oy+2*taby);
				for(i=8;i<12;i++){
				 p=piletableau(i);
				 p->takeemptynumber=12;
				 p->takeemptysuit=i-8;
				 p->takemaximal=1;
				 p->discardcount=true;
				 p->giverestriction=true;
				 p->showdescription=false;;
				};
				ps->redealvalue=2;
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(0,-1,-39);
				cameraposition[1].setzen(0,0,-37);
				cameraposition[2].setzen(0,0,-37);
				camerapositionmenu[1].setzen(0,6,-50);
				camerapositionmenu[2].setzen(0,6,-50);
				camerapositionpreview[1].setzen(0,0,-80);
				camerapositionpreview[2].setzen(0,-2.3,-77);
				rectangle[0].setzen(-11,oy-1*taby);
				rectangle[1].setzen(+11,oy+3*taby);
				enlargerectangle();
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,60,8);
				new _animationmove(this,-10+tabx*2,-10,0,60,8,true);
				_animationcardtopile*af=new _animationcardtopile(this,40,40);
				for(i=0;i<4;i++) af->use(piletableau(8+i),1,false,true,card(12+i*13));
				shufflecards();
				new _animationcardtostock(this,pilestock(0),4*13,60,10);
				setanimationpreparative();
				update();
};
bool _gamekingspeak::tipp(){
				startusing();
				if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gamekingspeak::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippwaste()){
				  autoplayanimationpiletopile(false,false,20,0,-10);return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gamekingspeak::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippwaste()){
				   autoplayanimationpiletopile(true,true,20,0,-10);
				   return(true);
	 			  };  
	 			 };
				};
				return(false);
};
bool _gamekingspeak::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplaywaste(card)){
				 autoplayanimationpiletopile(false,false,20,0,-10);return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E A C E S U P 
//******************************************************************************************************************
_gameacesup::_gameacesup(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=ACESUP;
				sourpile=0;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpileacesup(-11+3*tabx,7-taby);
				createpileacesup(-11+4*tabx,7-taby);
				createpileacesup(-11+5*tabx,7-taby);
				createpileacesup(-11+6*tabx,7-taby);
				createpilestock(16,-12,1,0);
				_pilediscard*pd=createpilediscard(12,-12);
				pd->acesupmode=true;
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(0,-8,-39);
				cameraposition[1].setzen(5,-5,-36);
				cameraposition[2].setzen(5,-5,-32);
				camerapositionmenu[2].setzen(7,1,-50);
				camerapositionpreview[1].setzen(0,0,-50);
				camerapositionpreview[2].setzen(0,-1.5,-65);
				rectangle[0].setzen(-11+3*tabx,-12);
				rectangle[1].setzen(16,7-taby);
				enlargerectangle();
				pilesort();	
				int n;
				new _animationmove(this,0,0,0,30,15);
				new _animationmove(this,-6,-6,0,30,15,true);
				shufflecards();
				new _animationcardtostock(this,pilestock(0),104,60,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),40,100);
				for(n=0;n<4;n++) a3->use(piletableau(n),1);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<4;n++) as->use(piletableau(n),1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<4;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gameacesup::tippacesup(){
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				bool found=false;
				int startpile=sourpile;
				do{
				 _pileacesup*pit=dynamic_cast<_pileacesup*>(piletableau(sourpile));
				 if(pit->anzahl()>0){
				  foundlist.aushaengen();
				  foundlist.einhaengen(pit->erstes());
				  if(pilediscardlist.erstes()){
				   _pilediscard*pd=getpilediscardminimum();
				   if(pd->candrop(&foundlist)){
				    found=true;
				    foundsour=pit;
				    founddest=pd;
				   };
				  };
				 };
				 sourpile+=1;
				 if(sourpile>=piletableaulist.anzahl()) sourpile=0;
				}while((found==false)&&(startpile!=sourpile));
				return(found);
};
bool _gameacesup::tipp(){
				startusing();
				if(tipptableaucompleterow()){
				 tippexecutecompleterow();return(true);
				}else if(tippacesup()){
				 tippexecutemove();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);
				}else if(tipptableau(0)){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gameacesup::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tipptableaucompleterow()){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tippacesup()){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gameacesup::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if((tippacesup())&&(solitaire->autodiscard)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if((tipptableauemptypile())&&(solitaire->autoempty)){
				  autoplayanimationpiletopile(true,true);return(true);
				 };
				};
			    return(false);
};
bool _gameacesup::clickplayacesup(_card*c){
				if(pilediscardlist.erstes()){
				 founddest=0;
				 foundsour=c->pile;
				 foundlist.aushaengen();
				 foundlist.einhaengen(c);
				 if(c->vorheriges()!=c->liste()->letztes()) return(false);
				 _pilediscard*pd=getpilediscardminimum();
				 if(pd->candrop(&foundlist)) founddest=pd;
				 if(founddest) return(true);
				};
				return(false);
};
bool _gameacesup::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayacesup(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				};
				return(false);
};


//******************************************************************************************************************
//										G A M E A C E S U P E A S Y
//******************************************************************************************************************
_gameacesupeasy::_gameacesupeasy(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameacesup(s,mo,prev,menue){
				index=ACESUPEASY;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpileacesup(-11+3*tabx,7-taby);
				createpileacesup(-11+4*tabx,7-taby);
				createpileacesup(-11+5*tabx,7-taby);
				createpileacesup(-11+6*tabx,7-taby);
				createpilefreecell(-11+7.5*tabx,7-taby);
				createpilestock(16,-12,1,0);
				_pilediscard*pd=createpilediscard(12,-12);
				pd->acesupmode=true;
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(0,-8,-39);
				cameraposition[1].setzen(5,-5,-36);
				cameraposition[2].setzen(5,-5,-32);
				camerapositionmenu[2].setzen(7,1,-50);
				camerapositionpreview[1].setzen(0,0,-50);
				camerapositionpreview[2].setzen(0,-1.5,-65);
				rectangle[0].setzen(-11+3*tabx,-12);
				rectangle[1].setzen(16,7-taby);
				enlargerectangle();
				pilesort();
};

//******************************************************************************************************************
//										G A M E O S M O S I S
//******************************************************************************************************************
_gameosmosis::_gameosmosis(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=OSMOSIS;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(4,-10,7,0,-taby);
				_tg px;
				createpilestock(8+1.5*tabx,7-taby*1,0,3);
				createpilewaste(8+2.5*tabx,7-taby*2);
				pilestock(0)->verticalredeal=true;
				px=0;
				_pilefoundation*pf;
				pf=createpilefoundation(px-tabx*1.5,7-taby*0);
				pf->drawownshadow=false;
				pf=createpilefoundation(px-tabx*1.5,7-taby*1);
				pf->drawownshadow=false;
				pf=createpilefoundation(px-tabx*1.5,7-taby*2);
				pf->drawownshadow=false;
				pf=createpilefoundation(px-tabx*1.5,7-taby*3);
				pf->drawownshadow=false;
				
				for(int i=0;i<4;i++){
				 piletableau(i)->vector.setzen(1,0,0);
				 piletableau(i)->takerestriction=true;
				 pilefoundation(i)->osmosismode=true;
				 pilefoundation(i)->giverestriction=true;
				 pilefoundation(i)->vector.setzen(1,0,0);
				};
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(0,-3.74,-34);
				cameraposition[1].setzen(0,-2,-36);
				cameraposition[2].setzen(1,-2,-36);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3,4,-52);
				camerapositionpreview[1].setzen(0,0,-80);
				camerapositionpreview[2].setzen(0,-2,-70);
				rectangle[0].setzen(-10,7-taby*3);
				rectangle[1].setzen(8+2.5*tabx,7);
				enlargerectangle();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-10,-11,0,40,5);
				new _animationmove(this,-10+tabx,-3,0,40,5,true);
				shufflecards();
				new _animationcardtostock(this,pilestock(0),4*13-1,50,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),50,100);
				for(n=0;n<4;n++) a3->use(piletableau(n),4);
				_animationcardtofoundation*af=new _animationcardtofoundation(this,40,40);
				af->use(pilefoundation(0),card(0));
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<4;n++) as->use(piletableau(n),4);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(int n=0;n<4;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gameosmosis::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);//tippexecuteemptypile()
				}else if(tipptableau(0,false,false)){
				 tippexecutemove();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
				};
_animationpiletopile*_gameosmosis::autoplayanimationpiletopile(bool udx,bool udy,_tg vx,_tg vy,_tg vz,bool undoconstantsort){
				//in foundlist kann nur eine Karte sein
				_animationpiletopile*a=new _animationpiletopile(this,&foundlist,founddest,solitaire->autospeed,0.1,true,udx,udy);
				a->undoconstantsort=undoconstantsort;
				a->vector.setzen(vx,vy,vz);
				a->vectortarget.setzen(40,-40,0);
				a->skipable=false;
				//----------------------- determine destindex for(osmosismode sorted cards -------------------
				int destindex=0;
				_pilefoundation*pf=dynamic_cast<_pilefoundation*>(founddest);
				if(pf){
				 _card*c=foundlist.erstes()->objekt();
				 _card*it=pf->erstes();
				 if((it)&&(c)){
				  bool stop=false;
				  do{
				   _card*cp=it;
				   if(cp->number>c->number){
				    it=it->naechstes();if(it==pf->erstes()) it=0;
				    destindex+=1;
				   }else{
				    stop=true;
				   };
				  }while((stop==false)&&(it));
				 };
				};
				//--------------------------------------------------------------------------------------				
				a->insertindex=destindex;
				return(a);
};
bool _gameosmosis::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,false,false)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gameosmosis::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				 if(solitaire->autoturncard){
				  if(tipptableauturn()){
				   _listenknoten<_card>*card;
				   if(foundlist.anfang(card))do{
				    card->objekt()->turn(15,true);
				   }while(foundlist.naechstes(card));
				   return(true);
				  };
				 };
				 if(solitaire->autoempty){
				  if(tipptableauemptypile()){
				   autoplayanimationpiletopile(true,true);
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gameosmosis::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaywaste(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E V E R Y E A S Y 
//******************************************************************************************************************
_gameveryeasy::_gameveryeasy(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameklondikeone(s,mo,prev,menue,VERYEASY){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(1,-11,2);
				_tg px=-11;
				createpilestock(px,7,0,1);
				createpilewaste(px+tabx,7);
				px=0;
				createpilefoundation(px+tabx*0,7);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				tableautakealteratecolor(true);
				tableautakedescending(true);
				foundationascending(true);
				createcard(0,0);
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				rectangle[0].setzen(-11,-6);
				rectangle[1].setzen(+tabx*3,7);
				enlargerectangle();
				pilesort();
				cardposition(-26,-11,0);
				new _animationmove(this,-14,-11,0,40,5);
				new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
				new _animationcardtostock(this,pilestock(0),1,50,10);
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E A N T 
//******************************************************************************************************************
_gameant::_gameant(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=ANT;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(10,-11+tabx*0.5,1);
				_pilestock*ps=createpilestock(-11-tabx,7,0,1);
				createpilewaste(-11-tabx,7-taby);
				for(_tg pdx=0;pdx<7.5;pdx+=1) createpilediscard(-11+tabx*pdx,7);
				tableaugivedescending(true);
				tableautakedescending(true);
				ps->redealvalue=0;
				createcards(2,0);
				createcards(2,1);
				createcards(2,2);
				createcards(2,3);
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(1.6,0,-39);
				cameraposition[2].setzen(1.6,0,-39);
				camerapositionmenu[2].setzen(3,5,-60);
				camerapositionpreview[1].setzen(0,-5,-75);
				camerapositionpreview[2].setzen(0,-8,-86);
				rectangle[0].setzen(-11-tabx,-6);
				rectangle[1].setzen(-11+tabx*0.5+tabx*9,7);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-16,-10,0);
				new _animationmove(this,10,2,0,50,9);
				new _animationmove(this,-6,-6,0,50,9,true);
				shufflecards();
				new _animationcardtostock(this,pilestock(0),104,60,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),90,10);
				a3->soundsingle=true;
				for(n=0;n<10;n++) a3->use(piletableau(n),1);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				for(n=0;n<10;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
bool _gameant::tipp(){
				startusing();
				if(tipptableaucompleterow()){
				 tippexecutecompleterow();return(true);
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);//tippexecuteemptypile()
				}else if(tipptableau(true)){
				 tippexecutemove();return(true);
				}else if(tipptableau(0)){
				 tippexecutemove();return(true);
				}else if(tippwaste()){
				 tippexecutemove();return(true);
				}else if(tippstock()){
				 tippexecutestock();return(true);
				};
				return(false);
};
bool _gameant::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tipptableaucompleterow()){
	 			  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
 				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,true)){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippwaste()){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippstock()){
				  dynamic_cast<_pilestock*>(foundsour)->deal();return(true);
				 };
				};
				return(false);
};
bool _gameant::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if((tipptableaucompleterow())&&(solitaire->autodiscard)){
				  autoplayanimationpiletopile(true,true);return(true);
	 			 }else if((tipptableauturn())&&(solitaire->autoturncard)){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(15,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if((tipptableauemptypile())&&(solitaire->autoempty)){
				  autoplayanimationpiletopile(true,true);return(true);
				 };
				};
			    return(false);
};
bool _gameant::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplaycompleterow(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplaytableaumove(card,true)){
			 	 autoplayanimationpiletopile();return(true);
				}else if(clickplaytableaumove(card)){
				 autoplayanimationpiletopile();return(true);
				}else if(clickplaywaste(card)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};


//******************************************************************************************************************
//										G A M E B A K E R S D O Z E N 
//******************************************************************************************************************
_gamebakersdozen::_gamebakersdozen(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
};
_gamebakersdozen::_gamebakersdozen(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=BAKERSDOZEN;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_piletableau*pt;
				for(_tg x=0;x<5.5;x+=1){
				 for(_tg y=1;y>-0.5;y-=1){
				  if(fabs(y-1)<nahenull){ 
				   createpiletableau(1,tabx*0.5-13+x*tabx,8-y*10);
				  }else{ 
				   pt=createpiletableau(1,-13+x*tabx,8-y*10);
				   pt->camerastretch=false;
				   pt->maximumlength=7.5;
				  };
				 };
				};
				pt=createpiletableau(1,-13+tabx*6,8);
				pt->camerastretch=false;
				pt->maximumlength=7.5;
				_tg px=10;
				createpilefoundation(px,7);
				createpilefoundation(px,7-taby);
				createpilefoundation(px,7-taby*2);
				createpilefoundation(px,7-taby*3);
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 pit->givemaximal=1;
				 pit->takeemptyrestriction=true;
				}while(piletableaulist.naechstes(pit));
				tableautakedescending(true);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-2,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(3-4,1+6,-50);
				camerapositionpreview[1].setzen(0,0,-70);
				camerapositionpreview[2].setzen(0,-3,-80);
				rectangle[0].setzen(-13,7-taby*3);
				rectangle[1].setzen(10,8);
				enlargerectangle();
				int n;
				int piles[12];
				cardposition(-26,-11,0);
				new _animationmove(this,-14,-11,0,40,5);
				new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-3,1),-10+i*taby*1.7+zufall<_tg>(-1,1),0,46,8,i % 2,(i+1) % 2,true);
				_animationrotation*ar=new _animationrotation(this,4,-13,0,180,20,20);
				int g=0;
				for(int i=0;i<13;i++){
				 piles[i]=0;
				};
				do{
				 piles[zufall<int>(0,11)]=1;
				 g=0;
				 for(int i=0;i<13;i++){
				  g+=piles[i];
				 };
				}while(g!=4);
				shufflecards();
				int si[4];
				int di[4];
				for(int i=0;i<4;i++){
				 si[i]=-1;
				 di[i]=-1;
				};
				g=0;
				int m=0;
				int j=0;
				_card*cit;
				if(cardlist.anfang(cit))do{
				 if(cit->number==12){
				  si[g]=m;
				  g+=1;
				 };
				 m+=1;
				}while(cardlist.naechstes(cit));
				g=0;
				for(int i=0;i<4;i++){
				 if((si[i]%4)>0){
				  do{
				   g+=4;
				  }while(card(g)->number==12);//!!!!!!!!!!!!!!!!!! fragwürdige übersetzung
				  di[i]=g;
				 }else{
				  di[i]=si[i];
				 };
				};
				for(int i=0;i<4;i++) if(si[i]!=di[i]) swapcards(si[i],di[i]);
				_animationcardtopile*a3=new _animationcardtopile(this,50,100);
				for(n=0;n<13;n++) a3->use(piletableau(n),4);
				_animationpileshiftout*as=new _animationpileshiftout(this,15,40);
				for(n=0;n<13;n++) as->use(piletableau(n),4);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,23,10);
				for(n=0;n<13;n++) a4->use(piletableau(n),4);
				setanimationpreparative();
				update();
};
bool _gamebakersdozen::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);	
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);//tippexecuteemptypile()
				}else if(tipptableau(0,false,false)){
				 tippexecutemove();return(true);
				};
				return(false);
};
bool _gamebakersdozen::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1,false,false)){
				  autoplayanimationpiletopile();return(true);
				 };
				};
				return(false);
};
bool _gamebakersdozen::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				 if(solitaire->autoturncard){
				  if(tipptableauturn()){
				   _listenknoten<_card>*card;
				   if(foundlist.anfang(card))do{
				    card->objekt()->turn(15,true);
				   }while(foundlist.naechstes(card));
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gamebakersdozen::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(clickplaytableaumove(card,false,false)){
				 autoplayanimationpiletopile();return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E M A R T H A
//******************************************************************************************************************
_gamemartha::_gamemartha(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamebakersdozen(s,mo,prev,menue,MARTHA){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg y=7-taby+0.5;
				_piletableau*pt;
				for(int x=0;x<8;x++){
				 if((x!=3)&&(x!=4)){
				  pt=createpiletableau(1,-tabx*4+x*tabx,y);
				  pt->vector.setzen(0,1,0);
				  pt->camerastretch=false;
				  pt->maximumlength=7;
				 };
				};
				
				y=7-taby*2-0.5;
				for(int x=0;x<8;x++){
				 if((x!=3)&&(x!=4)){
				  pt=createpiletableau(1,-tabx*4+x*tabx,y);
				  pt->vector.setzen(0,-1,0);
				 };
				};
				_tg px=0-tabx*0.5;
				createpilefoundation(px,7);
				createpilefoundation(px,7-taby);
				createpilefoundation(px,7-taby*2);
				createpilefoundation(px,7-taby*3);
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 pit->takeemptymaximal=1;
				}while(piletableaulist.naechstes(pit));
				tableautakedescending(true);
				tableautakealteratecolor(true);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-3,-3,-30);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-3,0,-30);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(-2,3,-50);
				camerapositionpreview[1].setzen(4,0,-90);
				camerapositionpreview[2].setzen(0,-3,-75);
				rectangle[0].setzen(-tabx*4,7-taby*2-0.5-taby);
				rectangle[1].setzen(-tabx*4+7*tabx,7-taby+0.5+taby);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-14,-11,0,40,5);
				new _animationmove(this,-8,-10,0,46,8,true);
				for(int i=1;i<3;i++) new _animationmove(this,-10+tabx*2+zufall<_tg>(-8,-5),-10+i*taby*2.1,0,46,8,i % 2,(i+1) % 2,true);
				_animationcardtofoundation*af=new _animationcardtofoundation(this,40,40);
				int in=0;
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 af->use(fit,card(in*13));
				 in+=1;
				}while(pilefoundationlist.naechstes(fit));
				shufflecards();
				_animationcardtopile*ap2=new _animationcardtopile(this,20,30);
				ap2->invers=true;
				for(n=0;n<12;n++) ap2->use(piletableau(n),2,true,true);
				_animationpileturn*a4=new _animationpileturn(this,13,100);
				for(n=0;n<12;n++) a4->use(piletableau(n));
				_animationcardtopile*ap22=new _animationcardtopile(this,20,30);
				ap22->invers=true;
				for(n=0;n<12;n++) ap22->use(piletableau(n),4,true,true);
				_animationpileturn*ap24=new _animationpileturn(this,13,100);
				for(n=0;n<12;n++) ap24->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E F L O W E R G A R D E N
//******************************************************************************************************************
_gameflowergarden::_gameflowergarden(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i):_game(s,mo,prev,menue){
                index=i;
};
_gameflowergarden::_gameflowergarden(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=FLOWERGARDEN;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg px=0;
				createpiletableau(6,-1.5-tabx*2,2);
				createpilefoundation(px+tabx*-3.7,2);
				createpilefoundation(px+tabx*-3.7,2-taby);
				createpilefoundation(px+tabx*3.7,2);
				createpilefoundation(px+tabx*3.7,2-taby);
				_pilereserve*pr=createpilereserve(0,10);
				pr->vector.setzen(0,-0.8,0);
				pr->flowermode=true;
				pr->arcmode=true;
				pr->radiusy=6;
				pr->radiusx=10;
				tableautakedescending(true);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 pit->givemaximal=1;
				}while(piletableaulist.naechstes(pit));
				cameraposition[0].setzen(-2,2,-28);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-2,2,-33);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(0,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-60);
				camerapositionpreview[2].setzen(0,-3,-70);
				rectangle[0].setzen(tabx*-3.7,-6);
				rectangle[1].setzen(tabx*3.7 ,10);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,46,8,true);
				shufflecards();
				_animationcardtopile*ap=new _animationcardtopile(this,30,30);
				_pilereserve*prit;
				if(pilereservelist.anfang(prit))do{
				 ap->use(prit,16,false,true);
				}while(pilereservelist.naechstes(prit));
				ap->cardinpreparationafteranimation=false;
				_animationrotation*ar=new _animationrotation(this,3,7,zufall<_tg>(-6,-3),180,20,18);
				_animationcardtopile*ap2=new _animationcardtopile(this,30,30);
				for(n=0;n<6;n++) ap2->use(piletableau(n),6);
				_animationpileshiftout*a3=new _animationpileshiftout(this,20,40);
				for(n=0;n<6;n++) a3->use(piletableau(n),6);
				_animationpileturnvertical*a4=new _animationpileturnvertical(this,33,50);
				for(n=0;n<6;n++) a4->use(piletableau(n),6);
				setanimationpreparative();
				update();
};
bool _gameflowergarden::tipp(){
				startusing();
				if(tippfoundation(0)){
				 tippexecutemove();return(true);	
				}else if(tipptableauturn()){
				 tippexecuteturn();return(true);
				}else if(tipptableauemptypile()){
				 tippexecutemove();return(true);//tippexecuteemptypile()
				}else if(tipptableau(0)){
				 tippexecutemove();return(true);
				}else if(tippreserve(0)){
				 tippexecutemove();return(true);
				};
				return(false);
};
bool _gameflowergarden::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tippfoundation(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 }else if(tipptableauturn()){
				  _listenknoten<_card>*card;
				  if(foundlist.anfang(card))do{
				   card->objekt()->turn(solitaire->autospeed/2,true);
				  }while(foundlist.naechstes(card));
				  return(true);
				 }else if(tipptableauemptypile()){
				  autoplayanimationpiletopile();return(true);
				 }else if(autoplaymovetableau(1)){
				  autoplayanimationpiletopile();return(true);
				 }else if(tippreserve(1)){
				  autoplayanimationpiletopile(true,true);return(true);
				 };
				
				};
				return(false);
};
bool _gameflowergarden::automove(){
	    		if((cardcurving()==false)&&(animationlist.erstes()==0)&&(picklist.erstes()==0)){
	  			 if(solitaire->autofoundation){
	  			  if(tippfoundation(2)){
				   autoplayanimationpiletopile(true,true);
				   return(true);
	 			  };  
	 			 };
				 if(solitaire->autoturncard){
				  if(tipptableauturn()){ 
				   _listenknoten<_card>*card;
				   if(foundlist.anfang(card))do{
				    card->objekt()->turn(15,true);
				   }while(foundlist.naechstes(card));
				   return(true);
				  };
				 };
				 if(solitaire->autoempty){
				  if(tipptableauemptypile()){ 
				   autoplayanimationpiletopile(true,true);
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gameflowergarden::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplayfoundation(card)){
				 autoplayanimationpiletopile(true,true);return(true);
				}else if(card->turnedup()==false){
				 card->turn(solitaire->autospeed/2,true);return(true);
				}else if(clickplaytableaumove(card,false,false)){
				 autoplayanimationpiletopile(true,true);
				 return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E S T O N E W A L L 
//******************************************************************************************************************
_gamestonewall::_gamestonewall(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameflowergarden(s,mo,prev,menue,STONEWALL){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg px=0;
				createpiletableau(6,-1.5-tabx*2,2);
				createpilefoundation(px+tabx*-3.7,2);
				createpilefoundation(px+tabx*-3.7,2-taby);
				createpilefoundation(px+tabx*3.7,2);
				createpilefoundation(px+tabx*3.7,2-taby);
				_pilereserve*pr=createpilereserve(0,10);
				pr->vector.setzen(0,-0.8,0);
				pr->flowermode=true;
				pr->arcmode=true;
				pr->radiusy=6;
				pr->radiusx=10;
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-2,2,-28);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-2,2,-33);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(0,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-60);
				camerapositionpreview[2].setzen(0,-4,-70);
				rectangle[0].setzen(tabx*-3.7,-6);
				rectangle[1].setzen(tabx*3.7 ,10);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-14,-11,0,40,5);
				_animationmove*a01=new _animationmove(this,-8,-10,0,46,8,true);
				shufflecards();
				_animationcardtopile*ap=new _animationcardtopile(this,30,30);
				_pilereserve*prit;
				if(pilereservelist.anfang(prit))do{
				 ap->use(prit,16,false,true);
				}while(pilereservelist.naechstes(prit));
				ap->cardinpreparationafteranimation=false;
				_animationcardtopile*ap2=new _animationcardtopile(this,30,30);
				for(n=0;n<6;n++) ap2->use(piletableau(n),2,true,true);
				_animationpileturn*a4=new _animationpileturn(this,13,100);
				for(n=0;n<6;n++) a4->use(piletableau(n));
				_animationcardtopile*ap22=new _animationcardtopile(this,30,30);
				for(n=0;n<6;n++) ap22->use(piletableau(n),4,true,true);
				_animationpileturn*a24=new _animationpileturn(this,13,100);
				for(n=0;n<6;n++) a24->use(piletableau(n));
				_animationcardtopile*ap222=new _animationcardtopile(this,30,30);
				for(n=0;n<6;n++) ap222->use(piletableau(n),6,true,true);
				_animationpileturn*a224=new _animationpileturn(this,13,100);
				for(n=0;n<6;n++) a224->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E S T O N E W A L L E A S Y
//******************************************************************************************************************
_gamestonewalleasy::_gamestonewalleasy(_solitaire*s,unsigned int mo,bool prev,bool menue):_gameflowergarden(s,mo,prev,menue,STONEWALLEASY){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg px=0;
				createpiletableau(6,-1.5-tabx*2,2);
				createpilefoundation(px+tabx*-3.7,2);
				createpilefoundation(px+tabx*-3.7,2-taby);
				createpilefoundation(px+tabx*3.7,2);
				createpilefoundation(px+tabx*3.7,2-taby);
				_pilereserve*pr=createpilereserve(0,10);
				pr->vector.setzen(0,-0.8,0);
				pr->flowermode=true;
				pr->arcmode=true;
				pr->radiusy=6;
				pr->radiusx=12;
				pr->anglestep=6;
				tableautakealteratecolor(true);
				tableautakedescending(true);
				tableaugivealteratecolor(true);
				tableaugivedescending(true);
				foundationascending(true);
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].setzen(-2,2,-28);
				cameraposition[1].setzen(-3,0,-30);
				cameraposition[2].setzen(-2,2,-35);
				camerapositionmenu[1].setzen(3-4,1+6,-50);
				camerapositionmenu[2].setzen(0,1+6,-50);
				camerapositionpreview[1].setzen(4,0,-60);
				camerapositionpreview[2].setzen(0,-4,-70);
				rectangle[0].setzen(tabx*-3.7,-6);
				rectangle[1].setzen(tabx*3.7 ,10);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-26,-11,0);
				new _animationmove(this,-14,-11,0,40,5);
				new _animationmove(this,-8,-10,0,46,8,true);
				shufflecards();
				_animationcardtopile*ap=new _animationcardtopile(this,30,30);
				_pilereserve*prit;
				if(pilereservelist.anfang(prit))do{
				 ap->use(prit,16+6,false,true);
				}while(pilereservelist.naechstes(prit));
				ap->cardinpreparationafteranimation=false;
				_animationcardtopile*ap2=new _animationcardtopile(this,30,30);
				for(n=0;n<6;n++) ap2->use(piletableau(n),2,true,true);
				_animationpileturn*a4=new _animationpileturn(this,13,100);
				for(n=0;n<6;n++) a4->use(piletableau(n));
				_animationcardtopile*ap22=new _animationcardtopile(this,30,30);
				for(n=0;n<6;n++) ap22->use(piletableau(n),4,true,true);
				_animationpileturn*a24=new _animationpileturn(this,13,100);
				for(n=0;n<6;n++) a24->use(piletableau(n));
				_animationcardtopile*ap222=new _animationcardtopile(this,30,30);
				for(n=0;n<6;n++) ap222->use(piletableau(n),5,true,true);
				_animationpileturn*a224=new _animationpileturn(this,13,100);
				for(n=0;n<6;n++) a224->use(piletableau(n));
				setanimationpreparative();
				update();
};

//******************************************************************************************************************
//										G A M E P A I R S C R O S S
//******************************************************************************************************************
_gamepairscross::_gamepairscross(_solitaire*s,unsigned int mo,bool prev,bool menue):_game(s,mo,prev,menue){
				index=PAIRSCROSS;
				destiterator=0;
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				_tg ox=0;
				_tg oy=0;
				_pilearray*pl=createpilearray(ox-tabx*2.5,0,5,5);
				createcard(0,12);
				createcard(1,12);
				createcard(2,12);
				createcard(3,12);
				createcard(0,11);
				createcard(1,11);
				createcard(2,11);
				createcard(3,11);
				for(int i=0;i<16;i++){
				 _card*c=createcard(3,0);
				 c->backsided=true;
				};
				createcard(0,0);
				cameraposition[0].setzen(0,-1,-47);
				cameraposition[1].setzen(0,-taby*2,-35);
				cameraposition[2].setzen(0,-taby*2,-35);
				camerapositionmenu[1].setzen(-1,-5-taby,-45);
				camerapositionmenu[2].setzen(-1.5,-4,-55);
				camerapositionpreview[1].setzen(0,0,-90);
				camerapositionpreview[2].setzen(0,-2.5,-80);
				rectangle[0].setzen(ox-tabx*2.5,-taby*4);
				rectangle[1].setzen(ox-tabx*2.5+tabx*4,0);
				enlargerectangle();
				cardposition(-26,-11,0);
				_animationmove*a0=new _animationmove(this,-10,-11,0,60,8);
				_animationmove*a01=new _animationmove(this,-10+tabx*2,-10,0,60,8,true);
				shufflecards();
				_animationcardtopile*ac=new _animationcardtopile(this,30,30);
				ac->usearray(pilearray(0));
				_animationpiletoclear*al=new _animationpiletoclear(this,0,0,zufall<_tg>(-20,20),zufall<_tg>(-20,20),-30,30,10);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				a4->use(pilearray(0));
				setanimationpreparative();
				update();
};
bool _gamepairscross::tipppairscross(){
                _pilearray*pa=pilearray(0);
				bool found=false;
				int nx=-1;
				int ny=-1;
				if(pa){
			 	 for(int iy=0;iy<pa->dimy;iy++){
				  for(int ix=0;ix<pa->dimx;ix++){
				   if(pa->feld[ix,iy]==0){
				    nx=ix;
				    ny=iy;
			       };
				  };
				 };
				 if(nx!=-1){
				  found=false;
				  int startiterator=destiterator;
			 	  do{
				   if((destiterator==0)&&(ny>0)){//nach oben
				    if(pa->candropat(pa->feld[nx,ny-1],nx,ny)){
				     foundsourcard[0]=nx;
				     foundsourcard[1]=ny-1;
				     founddestcard[0]=nx;
				     founddestcard[1]=ny;
				     found=true;
				    };
				   }else if((destiterator==1)&&(nx<pa->dimx-1)){//nach rechts
				    if(pa->candropat(pa->feld[nx+1,ny],nx,ny)){
				     foundsourcard[0]=nx+1;
				     foundsourcard[1]=ny;
				     founddestcard[0]=nx;
				     founddestcard[1]=ny;
				     found=true;
				    };
				   }else if((destiterator==2 && ny<pa->dimy-1)){//nach unten
				    if(pa->candropat(pa->feld[nx,ny+1],nx,ny)){
				     foundsourcard[0]=nx;
				     foundsourcard[1]=ny+1;
				     founddestcard[0]=nx;
				     founddestcard[1]=ny;
				     found=true;
				    };
				   }else if((destiterator==3)&&(nx>0)){ //nach links
				    if(pa->candropat(pa->feld[nx-1,ny],nx,ny)){
				     foundsourcard[0]=nx-1;
				     foundsourcard[1]=ny;
				     founddestcard[0]=nx;
				     founddestcard[1]=ny;
				     found=true;
				    };
				   };
				   destiterator+=1;
				   if(destiterator>=4) destiterator=0;
				  }while((found==false)&&(destiterator!=startiterator));
				 };
				};
				return(found);
};
void _gamepairscross::tippexecutepairscross(){
				_pilearray*pa=pilearray(0);
				if(pa){
				 _card*cs=pa->feld[foundsourcard[0],foundsourcard[1]];
				 if(cs){
				  _card*cn=new _card(cs);
				  _vektor3<_tg> vn;
				  _vektor3<_tg> t0(0,0,-20);
				  _vektor3<_tg> t1(0,0,+20);
				  tipplist.einhaengen(cn);
				  cn->curveposition.setzen(cn->position,pa->droppositionat(founddestcard[0],founddestcard[1]),t0,t1);
				  cn->curvevx.setzen(cn->vx,cn->vx,vn,vn);
				  cn->curvevy.setzen(cn->vy,cn->vy,vn,vn);
				  cn->curvespeed=solitaire->autospeed;
				  cn->startcurve();
				  cn->cardcontrolopacity=cs;
				  cn->curveopacity.setzen(0,0,2,-10);
				 };
				};
};
bool _gamepairscross::tipp(){
				startusing();
				if(tipppairscross()){
				 tippexecutepairscross();return(true);	
				};
				return(false);
};
bool _gamepairscross::autoplay(){
				startusing();
				if(cardcurving()==false){
				 if(tipppairscross()){
				  _pilearray*pk=pilearray(0);
				  if(pk)pk->move(foundsourcard[0],foundsourcard[1],founddestcard[0],founddestcard[1]);
				  return(true);				
				 };
				};
				return(false);	
};
bool _gamepairscross::automove(){
				return(false);
};
bool _gamepairscross::clickplaypairscross(_card*card){
				int cx=card->arrayindex[0];
				int cy=card->arrayindex[1];
				_pilearray*pa=dynamic_cast<_pilearray*>(card->pile);
				if(pa){
				 if(cx>0){
				  if(pa->candropat(card,cx-1,cy)){
				   foundsourcard[0]=cx;
				   foundsourcard[1]=cy;
				   founddestcard[0]=cx-1;
				   founddestcard[1]=cy;
				   return(true);
				  };
				 };
				 if(cx<(pa->dimx-1)){
				  if(pa->candropat(card,cx+1,cy)){
				   foundsourcard[0]=cx;
				   foundsourcard[1]=cy;
				   founddestcard[0]=cx+1;
				   founddestcard[1]=cy;
				   return(true);
				  };
				 };
				 if(cy>0){
				  if(pa->candropat(card,cx,cy-1)){
				   foundsourcard[0]=cx;
				   foundsourcard[1]=cy;
				   founddestcard[0]=cx;
				   founddestcard[1]=cy-1;
				   return(true);
				  };
				 };
				 if(cy<(pa->dimy-1)){
				  if(pa->candropat(card,cx,cy+1)){
				   foundsourcard[0]=cx;
				   foundsourcard[1]=cy;
				   founddestcard[0]=cx;
				   founddestcard[1]=cy+1;
				   return(true);
				  };
				 };
				};
				return(false);
};
bool _gamepairscross::clickplay(_card*card){
				startusing();
				deinsertpick();
				if(clickplaypairscross(card)){
				 _pilearray*pk=dynamic_cast<_pilearray*>(card->pile);
				 if(pk) pk->move(foundsourcard[0],foundsourcard[1],founddestcard[0],founddestcard[1]);
				 return(true);
				};
				return(false);
};

//******************************************************************************************************************
//										G A M E S P I D E R S U P E R S T O C K
//******************************************************************************************************************
_gamespidersuperstock::_gamespidersuperstock(_solitaire*s,unsigned int mo,bool prev,bool menue):_gamespideronesuit(s,mo,prev,menue,SPIDERSUPERSTOCK){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				createpiletableau(6,-10+tabx,6);
				_pilestock*ps;
				_pilewaste*pw;
				ps=createpilestock(-11,7+taby,0,4);
				ps->wasteiteration=true;
				ps->redealvalue=1;
				for(_tg pdx=0;pdx<7.5;pdx+=1) createpilediscard(-9+tabx+pdx*tabx,7+taby);
				pw=createpilewaste(-11,7-taby*3);
				pw=createpilewaste(-11,7-taby*2);
				pw=createpilewaste(-11,7-taby*1);
				pw=createpilewaste(-11,7);
				tableaugivesamesuit(true);
				tableaugivedescending(true);
				tableautakesamesuit(true);
				tableautakedescending(true);
				createcards(8,zufall<int>(0,3));
				cameraposition[0].setzen(0,-6,-39);
				cameraposition[1].setzen(0.5,0,-39);
				cameraposition[2].setzen(2,2,-39);
				camerapositionmenu[2].setzen(4,9,-57);
				camerapositionpreview[1].setzen(4,0,-75);
				camerapositionpreview[2].setzen(0,-7,-80);
				rectangle[0].setzen(-11,7-taby*3);
				rectangle[1].setzen(-9+tabx+7*tabx,7+taby);
				enlargerectangle();
				pilesort();
				int n;
				cardposition(-16,-10,0);
				new _animationmove(this,10,2,0,50,9);
				new _animationmove(this,-6,-6,0,50,9,true);
				shufflecards();
				new _animationcardtostock(this,pilestock(0),104,60,10);
				_animationstocktopile*a3=new _animationstocktopile(this,pilestock(0),90,10);
				a3->soundsingle=true;
				for(n=0;n<3;n++) a3->use(piletableau(n),5);
				for(n=3;n<6;n++) a3->use(piletableau(n),4);
				_animationpileshiftoutvertical*as=new _animationpileshiftoutvertical(this,5,20);
				for(n=0;n<3;n++) as->use(piletableau(n),5);
				for(n=3;n<6;n++) as->use(piletableau(n),4);
				_animationpileturn*a4=new _animationpileturn(this,10,50);
				a4->usesoundaction=false;
				a4->usesoundstart=false;
				a4->soundstart=solitaire->sspend;
				for(n=0;n<6;n++) a4->use(piletableau(n));
				setanimationpreparative();
				update();
};
