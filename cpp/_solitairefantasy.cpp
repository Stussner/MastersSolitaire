//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitairefantasy.cpp , Hauptmodul
//  Datum       : 29.11.2008
//******************************************************************************************************************************************************************************************************
#include <windows.h>
#include "../hpp/_solitairefantasy.hpp"


           
//******************************************************************************************************************
//										F I G U R E D R A W E N T R Y
//******************************************************************************************************************
_figuredrawentry::_figuredrawentry(_solitairefantasy*s,_figure*f):_listenknotenbasis<_figuredrawentry>(&s->figuredrawlist){
	            marked=0;
				solitaire=s;
				figure=f;
				pfadein=true;
				pfadeout=false;
				pfadeopacitytime=solitaire->clock->system();
				pfadeopacity=0;
};
_figuredrawentry::~_figuredrawentry(){
};		
void _figuredrawentry::fadeout(){
				if(pfadeout==false){
				 pfadein=false;
				 pfadeout=true;
				 pfadeopacitytime=solitaire->clock->system();
				};
};						
void _figuredrawentry::draw(_grafik*gra,_kamera<_tg>*cam,_to op){
				_tg speed=1;
				figure->opacity=op*pfadeopacity;
				figure->draw(gra,cam);
				_tg fadetimenew=solitaire->clock->system();
				_tg ds=(fadetimenew-pfadeopacitytime)*0.001;
				pfadeopacitytime=fadetimenew;
				if(pfadein){
				 pfadeopacity+=speed*ds;
				 if(pfadeopacity>1){
				  pfadeopacity=1;
				  pfadein=false;
				 };
				};
				if(pfadeout){
				 pfadeopacity-=speed*ds;
				 if(pfadeopacity<0){
				  pfadeopacity=0;
				  //pfadeout=false
				 };
				};					
				animate();
};				
void _figuredrawentry::animate(){
				bool gedr=false;
				if(marked==2){
				 if(solitaire->tastatur->knopflinks()==false){
				  if(figure->inner()){
				   gedr=true;	
				   marked=0;
				  }else{
				   marked=0;
				  };
				 }else{
				  if(figure->inner()==false){
				   marked=0;
				  };
				 };
				};
				if(marked==1){
				 if(figure->inner()){
				  if(solitaire->tastatur->knopflinks()){
				   marked=2;
				  };
				 }else{
				  marked=0;
				 };
				};				
				if(marked==0){
				 if(figure->inner()){
  				  marked=1;
				 }; 
   			    };				
				if(gedr) if(solitaire->menumain->active()) solitaire->showmenuuser();
};				


//******************************************************************************************************************
//										S O L I T A I R E F A N T A S Y 
//******************************************************************************************************************
_solitairefantasy::_solitairefantasy(){	
				brandingstufe=0;
				smokemenu=0;
	            guihelpinitmagicw=0;
	            guihelpinitmagicy=0;
	            buttonwidth=226;
	            buttonheight=72;
	            checkboxwidth=34;
	            checkboxheight=30;
	            checkboxoffy=-10;
	            figureindexold=-1;
	            buttonraus=false;
	            keyraus=false;
	            marked=0;
                maximieren();
                zeigen();
				//zentrieren(800,600);
				clock=new _win::_zeit();
                maus=new _win::_maus<_tg>(300,300);
                tastatur=new _win::_tastatur();
                iggsystem=new _iggsystem(this,1024,768);
				iggsystem->background[0].aushaengen();
               // *this+=new _guiereignisSize<_solitaire>(this, &_solitaire::beigroesse);
				*this+=new _guiereignisMouseMove<_solitaire>(this, &_solitaire::beimausbewegung);
                *this+=new _guiereignisClose<_solitaire>(this, &_solitaire::beischliessen);
                *this+=new _guiereignisDestroy<_solitaire>(this, &_solitaire::beizerstoeren);                
        
				//----------------------------------------------------------------------------------------------------------------------------------
                                
                grafikmodusaktuell(desktopwidth,desktopheight,desktopdepth,desktoprate);              
				if(desktopwidth<=1024){ 
				 windowedmodewidth=800;
				 windowedmodeheight=600;
				 fastvideomodewidth=800;
 				 fastvideomodeheight=600;
				}else{
				 windowedmodewidth=1024;
				 windowedmodeheight=768;
				 fastvideomodewidth=1024;
				 fastvideomodeheight=768;
				};                       
				grafikmodus(0);
				gra->orthonormal();
				clearscreen();
				akustik=new _akustikopenal();
				musicman=new _musikverwaltung(akustik,clock);
				//----------------------------------------------------------------------------------------------------------------------------------
				
				datenpfad="../solitaire/daten/";
				_zeichenkette<char> datenpfadsound="../solitaire/daten/sounds/";
				isplashsurricate=ladenbild(datenpfad+"fantasy/logo/Suricate_logo_big.jpg");
				isplashportal=ladenbild(datenpfad+"fantasy/logo/BFG_splash_1024x768.jpg");
				ilogosurricate=ladenbild(datenpfad+"fantasy/logo/Suricate_logo_small.tga");
				ilogoportal=ladenbild(datenpfad+"fantasy/logo/Suricate_logo_big.jpg");//"fantasy/logo/BFG_logo_150x125.png");
				font24=gra->erzeugenzeichensatz(0,0,datenpfad+"zeichensatz/dauphin48");
				font24->skalierung(0.8);
				font18=gra->erzeugenzeichensatz(0,0,datenpfad+"zeichensatz/dauphin30");
				font18->skalierung(0.8);
				irose=ladenbild(datenpfad+"fantasy/gui/rose3.tga");
				//HideMouse();
				//AppTitle=strcreditsfantasysolitaire;//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			
				loadoptions(strfileoptions);
				
				_activity*act=new _activity();	
				activitylist.einhaengen(act);

				for(int i=0;i<1000;i++){
				 gametypeactive[i]=true;
				};
				gametypeactive[75]=false;
				
				//fullscreen=false								
				//blendscreen=CreateImage(gra->groessex(),gra->groessey(),1,DYNAMICIMAGE);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				
				//gra->vollbild(_vektor4<_to>(0,0,0,1));
			
				fadeinsplashsurricate();
				
				gamestats=new _gamestats*[gametypecount];
				for (int i = 0;i<gametypecount;i++) gamestats[i]=0;
				loadstatistics(strfilestatistics);			
				
				volumesound=0.3;
				//SetMaskColor(255,100,254)
				menuopacity2=1;
				cardtexturefrontcount=3;
				cardtexturebackcount=6;
				scenecount=1;
				musiccount=3;
				//for(Local j=0 To scenecount-1
				// sceneambient[j]=new _vektor3
				// scenediffuse[j]=new _vektor3
				//};
			   
			    //tonverwaltung=new _tonverwaltung(akustik);
				//sparkingmouse=false
				
				usermanagement=new _benutzerverwaltung(strfileusers,L"Fantasy Solitaire Users");
				usermanagement->ladenbild(datenpfad+"fantasy/figure/userprinzessin128.tga");
				usermanagement->ladenbild(datenpfad+"fantasy/figure/userdame2128.tga");
				usermanagement->ladenbild(datenpfad+"fantasy/figure/userritter128.tga");
				usermanagement->ladenbild(datenpfad+"fantasy/figure/userzauberer128.tga");
				usermanagement->ladenbild(datenpfad+"fantasy/figure/userfee128.tga");
				usermanagement->ladenbild(datenpfad+"fantasy/figure/userdrachen128.tga");
				usermanagement->ladenbild(datenpfad+"fantasy/figure/userkoenig128.tga");
				usermanagement->ladenbild(datenpfad+"fantasy/figure/userlehrerin128.tga");
				backgroundcolor.setzen(255,255,255,1);
				world=new _welt();	
				world->lichtambient()=farbeambienz;
				updatescene();
				cam=new _camerasolitaire();
				//-----------------------------------------  font load -----------------------------------------------------------
				font30=gra->erzeugenzeichensatz(0,0,datenpfad+"zeichensatz/dauphin64");
				font30->skalierung(0.8);
				font14=gra->erzeugenzeichensatz(0,0,datenpfad+"zeichensatz/dauphin14");
				font16=gra->erzeugenzeichensatz(0,0,datenpfad+"zeichensatz/dauphin24");
				font16->skalierung(0.8);
				font10=gra->erzeugenzeichensatz(0,0,datenpfad+"zeichensatz/dauphin10");
				//----------------------------------------- gui load -------------------------------------------------------------
				iguiwindow=ladenbild(datenpfad+"fantasy/gui/window_512_750_3.tga");
				igametypewindow=ladenbild(datenpfad+"fantasy/gui/window_950_950_13.tga");
				imessagewindow=ladenbild(datenpfad+"fantasy/gui/window_512_256_3.tga");
				ilistboxwindow=ladenbild(datenpfad+"fantasy/gui/window_256_256_3.tga");
				iverlaufwindow=ladenbild(datenpfad+"fantasy/gui/window_950_550_5.tga");
				ihighscorewindow=ilistboxwindow;//ladenbild(datenpfad+"fantasy/gui/window_highscore.tga")

				iguihelp300180=ladenbild(datenpfad+"fantasy/gui/guihelp_300_180.tga");
				iguihelp51280=ladenbild(datenpfad+"fantasy/gui/guihelp_512_80.tga");
				iguihelp512111=ladenbild(datenpfad+"fantasy/gui/guihelp_512_111.tga");
				iguihelp512180=ladenbild(datenpfad+"fantasy/gui/guihelp_512_180.tga");
				iguihelp839124=ladenbild(datenpfad+"fantasy/gui/guihelp_839_124.tga");
				iguihelp85093=ladenbild(datenpfad+"fantasy/gui/guihelp_850_93.tga");
				iguihelp24389=ladenbild(datenpfad+"fantasy/gui/guihelp_243_89.tga");

				ibuttonshadow=ladenbild(datenpfad+"fantasy/gui/button_schatten.tga");
				ibuttonshadowon=ladenbild(datenpfad+"fantasy/gui/button_schatten_on.tga");
				ibuttonshadowson=ladenbild(datenpfad+"fantasy/gui/button_schatten_son.tga");
				icheck=ladenbild(datenpfad+"fantasy/gui/check3.tga");
				idonut=ladenbild(datenpfad+"fantasy/gui/donut2.tga");
				idonutred=ladenbild(datenpfad+"fantasy/gui/donutred.tga");
				idonutgreen=ladenbild(datenpfad+"fantasy/gui/donutgreen.tga");
				idonutblue=ladenbild(datenpfad+"fantasy/gui/donutblue.tga");
				iblack=ladenbild(datenpfad+"fantasy/gui/black.tga");
				iframe=ladenbild(datenpfad+"fantasy/gui/frame3.tga");
				iframe2=ladenbild(datenpfad+"fantasy/gui/frame2.tga");
				irosecredits=ladenbild(datenpfad+"fantasy/gui/rose05.tga");

				inormalrange=ladenbild(datenpfad+"fantasy/gui/verlauf_normalbereich.tga");
				itrackbar=ladenbild(datenpfad+"fantasy/gui/trackbar.tga");
				itrackbarbutton=ladenbild(datenpfad+"fantasy/gui/trackbar_button2.tga");
				ilistboxl=ladenbild(datenpfad+"fantasy/gui/listbox_large.tga");
				iscrollbar=ladenbild(datenpfad+"fantasy/gui/scrollbar.tga");
				iscrollbarbutton=ladenbild(datenpfad+"fantasy/gui/scrollbarbutton.tga");
				iscrollbarhorizontal=ladenbild(datenpfad+"fantasy/gui/scrollbarhorizontal.tga");
			    ibuttong=ladenbild(datenpfad+"fantasy/gui/button_neu_large.tga");
				ibuttonghl=ladenbild(datenpfad+"fantasy/gui/button_neu_large_on.tga");
				ibuttongson=ladenbild(datenpfad+"fantasy/gui/button_neu_large_son.tga");
			    ibuttonl=ladenbild(datenpfad+"fantasy/gui/button_neu_medium.tga");
				ibuttonlhl=ladenbild(datenpfad+"fantasy/gui/button_neu_medium_on.tga");
				ibuttonlson=ladenbild(datenpfad+"fantasy/gui/button_neu_medium_son.tga");
				ibuttonm=ladenbild(datenpfad+"fantasy/gui/button_neu_smallmedium.tga");
				ibuttonmhl=ladenbild(datenpfad+"fantasy/gui/button_neu_smallmedium_on.tga");
				ibuttonmson=ladenbild(datenpfad+"fantasy/gui/button_neu_smallmedium_son.tga");
				ibuttons=ladenbild(datenpfad+"fantasy/gui/button_neu_small.tga");
				ibuttonshl=ladenbild(datenpfad+"fantasy/gui/button_neu_small_on.tga");
				ibuttonsson=ladenbild(datenpfad+"fantasy/gui/button_neu_small_son.tga");
				ibuttonu=ladenbild(datenpfad+"fantasy/gui/button_neu_micro.tga");
				ibuttonuhl=ladenbild(datenpfad+"fantasy/gui/button_neu_micro_on.tga");
				ibuttonuson=ladenbild(datenpfad+"fantasy/gui/button_neu_micro_son.tga");
				icheckbox=ladenbild(datenpfad+"fantasy/gui/checkbox2.tga");
				icheckboxhl=ladenbild(datenpfad+"fantasy/gui/checkbox2_on.tga");
				ilistboxbuttonup=ladenbild(datenpfad+"fantasy/gui/listbox_button_up.tga");
				ilistboxbuttondown=ladenbild(datenpfad+"fantasy/gui/listbox_button_down.tga");
				//-------------------------------------------- sound load --------------------------------------------------------
				smove=ladenton(datenpfadsound+"fansol_card_shuffle02cut.ogg");
				sturn=ladenton(datenpfadsound+"fansol_card_deal01a.ogg");
				scardsingle=ladenton(datenpfadsound+"card_single.ogg");				
				sexplosion[0]=ladenton(datenpfadsound+"explosion2.ogg");			
				sfireplace=ladenton(datenpfadsound+"fantasol_fireplace.ogg");
				//,true);!!!!!!!!!!!!!loooped
				spendulum=ladenton(datenpfadsound+"fantasol_pendulum.ogg");
				suhrschlag0=ladenton(datenpfadsound+"fantasol_clock_singlestroke_fadeout_low.ogg");				
				suhrschlagstunde=ladenton(datenpfadsound+"fantasol_clock_westminster_nofade_low.ogg");
				sgong=ladenton(datenpfadsound+"gong.ogg");				
				sspark=ladenton(datenpfadsound+"spark.ogg");			
				sspend=ladenton(datenpfadsound+"spend.ogg");
				//-------------------------------------------- figure load ------------------------------------------------------
				iprinzessin=ladenbild(datenpfad+"fantasy/figure/prinzessin.tga");
				idame=ladenbild(datenpfad+"fantasy/figure/dame.tga");
				iritter=ladenbild(datenpfad+"fantasy/figure/ritter.tga");
				izauberer=ladenbild(datenpfad+"fantasy/figure/zauberer.tga");
				ifee=ladenbild(datenpfad+"fantasy/figure/fee.tga");
				idrachen=ladenbild(datenpfad+"fantasy/figure/drachen.tga");
				ikoenig=ladenbild(datenpfad+"fantasy/figure/koenig.tga");
				ilehrerin=ladenbild(datenpfad+"fantasy/figure/lehrerin.tga");
				prinzessin=new _figure(this,iprinzessin,0.188,0.5257);
				dame=new _figure(this,idame,0.167,0.494);
				ritter=new _figure(this,iritter,0.1760,0.4930);
				zauberer=new _figure(this,izauberer,0.1786,0.4451);
				fee=new _figure(this,ifee,0.1114,0.355);
				drachen=new _figure(this,idrachen,0.02291,0.2798);
				koenig=new _figure(this,ikoenig,0.1911,0.5562);
				lehrerin=new _figure(this,ilehrerin,0.191,0.507);
				//---------------------------------------------- scene && logo load --------------------------------------------
				ilogo=ladenbild(datenpfad+"fantasy/logo/logo03.tga");
				if(greenboard){
				 tbackgroundgamea=ladentextur(datenpfad+"fantasy/scene/table_08_2048_1024.jpg");
				 tbackgroundgamel=ladentextur(datenpfad+"fantasy/scene/table_08_2048_1024hl.jpg");
				}else{
				 tbackgroundgamea=ladentextur(datenpfad+"fantasy/scene/table_07_2048_1024.jpg");
				 tbackgroundgamel=ladentextur(datenpfad+"fantasy/scene/table_07_2048_1024hl.jpg");
				};
				//imenubackground=ladenbild(datenpfad+"fantasy/scene/background_iggmenu3_test.jpg")
				//imenubackgroundl[0]=ladenbild(datenpfad+"fantasy/scene/background alone.png")
				//imenubackgrounda=ladenbild(datenpfad+"fantasy/scene/Background alone AMBIENT Only.png")
				_zeichenkette<char> fn;
				_zeichenkette<char> h;
				for(unsigned int n=0;n<3;n++){
				 fn=_zeichenkette<char>("scene/scene_02_")+int(n)+".jpg";
				 if(dateiexistiert(fn)){
				  imenubackgroundl[n]=ladenbild(fn);
				 }else{
			 	  imenubackgroundl[n]=ladenbild(datenpfad+"fantasy/scene/scene_02_"+int(n)+".jpg");
			     };
				};
				imenubackgroundglow=ladenbild(datenpfad+"fantasy/scene/scene_00_fireplace_woodglow.tga");
				icandleholdermenu=ladenbild(datenpfad+"fantasy/scene/candleholder_menu.tga");
				icandleholdergame=ladenbild(datenpfad+"fantasy/scene/candleholder_game.tga");
				//imenubackgroundl[2]=ladenbild(datenpfad+"play/Background_B2.png")
				//imenubackgroundl[3]=ladenbild(datenpfad+"play/Background_B3.png")
				//--------------------------------------------- game texture load ---------------------------------------------
				tempty=ladentextur(datenpfad+"fantasy/game/empty.tga");
				temptykey=ladentextur(datenpfad+"fantasy/game/emptykey.tga");
				tsymbolsuit[0]=ladentextur(datenpfad+"fantasy/game/symbol_suit0.tga");
				tsymbolsuit[1]=ladentextur(datenpfad+"fantasy/game/symbol_suit1.tga");
				tsymbolsuit[2]=ladentextur(datenpfad+"fantasy/game/symbol_suit2.tga");
				tsymbolsuit[3]=ladentextur(datenpfad+"fantasy/game/symbol_suit3.tga");
				tsymbolsuitrand[0]=ladentextur(datenpfad+"fantasy/game/symbol_suit0rand.tga");
				tsymbolsuitrand[1]=ladentextur(datenpfad+"fantasy/game/symbol_suit1rand.tga");
				tsymbolsuitrand[2]=ladentextur(datenpfad+"fantasy/game/symbol_suit2rand.tga");
				tsymbolsuitrand[3]=ladentextur(datenpfad+"fantasy/game/symbol_suit3rand.tga");
				tsymbolnumber[0]=ladentextur(datenpfad+"fantasy/game/symbolA.tga");
				tsymbolnumber[1]=ladentextur(datenpfad+"fantasy/game/symbol2.tga");
				tsymbolnumber[2]=ladentextur(datenpfad+"fantasy/game/symbol3.tga");
				tsymbolnumber[3]=ladentextur(datenpfad+"fantasy/game/symbol4.tga");
				tsymbolnumber[4]=ladentextur(datenpfad+"fantasy/game/symbol5.tga");
				tsymbolnumber[5]=ladentextur(datenpfad+"fantasy/game/symbol6.tga");
				tsymbolnumber[6]=ladentextur(datenpfad+"fantasy/game/symbol7.tga");
				tsymbolnumber[7]=ladentextur(datenpfad+"fantasy/game/symbol8.tga");
				tsymbolnumber[8]=ladentextur(datenpfad+"fantasy/game/symbol9.tga");
				tsymbolnumber[9]=ladentextur(datenpfad+"fantasy/game/symbol10.tga");
				tsymbolnumber[10]=ladentextur(datenpfad+"fantasy/game/symbolB.tga");
				tsymbolnumber[11]=ladentextur(datenpfad+"fantasy/game/symbolD.tga");
				tsymbolnumber[12]=ladentextur(datenpfad+"fantasy/game/symbolK.tga");
				tsymbolnumbersmall[0]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbolA.tga");
				tsymbolnumbersmall[1]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbol2.tga");
				tsymbolnumbersmall[2]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbol3.tga");
				tsymbolnumbersmall[3]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbol4.tga");
				tsymbolnumbersmall[4]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbol5.tga");
				tsymbolnumbersmall[5]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbol6.tga");
				tsymbolnumbersmall[6]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbol7.tga");
				tsymbolnumbersmall[7]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbol8.tga");
				tsymbolnumbersmall[8]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbol9.tga");
				tsymbolnumbersmall[9]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbol10.tga");
				tsymbolnumbersmall[10]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbolB.tga");
				tsymbolnumbersmall[11]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbolD.tga");
				tsymbolnumbersmall[12]=ladentextur(datenpfad+"fantasy/game/symbolnumbersmall/symbolK.tga");
				
				tsymbolfine=ladentextur(datenpfad+"fantasy/game/symbolfine2.tga");
				tsymbolddd=ladentextur(datenpfad+"fantasy/game/symbolddd.tga");
				for(int m=0;m<10;m++){
				 tnumber[m]=ladentextur(datenpfad+"fantasy/game/"+m+".tga");
				 tnumbersmall[m]=ladentextur(datenpfad+"fantasy/game/numbersmall/"+m+".tga");
				};
				//------------------------------------------------------ load background && effects ------------------------------------------
				tfeuer=ladentextur(datenpfad+"fantasy/effect/fire01.tga");
				tfeuer2=ladentextur(datenpfad+"fantasy/effect/fire03.tga");
				tfeuer3=ladentextur(datenpfad+"fantasy/effect/fire04.tga");
				tfeuer4=ladentextur(datenpfad+"fantasy/effect/fire05.tga");
				tfeuer5=ladentextur(datenpfad+"fantasy/effect/fire06.tga");
				tfeuer6=ladentextur(datenpfad+"fantasy/effect/fire07.tga");
				tfeuercandle=ladentextur(datenpfad+"fantasy/effect/firecandle.tga");
				tsmoke[0]=ladentextur(datenpfad+"fantasy/effect/wolke00.tga");
				tshadow=ladentextur(datenpfad+"fantasy/effect/shadow3232.tga");
				tshadow16=ladentextur(datenpfad+"fantasy/effect/shadow16.tga");
				tcorona=ladentextur(datenpfad+"fantasy/effect/corona00.tga");
				tcoronared=ladentextur(datenpfad+"fantasy/effect/corona06red.tga");
				tcoronablue=ladentextur(datenpfad+"fantasy/effect/corona01blue.tga");
				tcoronawhite=ladentextur(datenpfad+"fantasy/effect/coronawhite.tga");
				tfunken[0]=ladentextur(datenpfad+"fantasy/effect/funken00.tga");
				tdigit=ladentextur(datenpfad+"fantasy/effect/digit00.tga");
				tdigith=ladentextur(datenpfad+"fantasy/effect/digit00h.tga");
				tdigits=ladentextur(datenpfad+"fantasy/effect/digit00s.tga");
				tpendulum=ladentextur(datenpfad+"fantasy/effect/pendulum01.tga");
				background=new _background(this);
				uhr=new _uhr(this);
				kamin=new _kamin2(this,2,1,0,1.5,&particlemenulist);
				//------------------------------------------------------- effect candles ------------------------------------------------------
				candlegame[0]=createcandle(&candlegamelist,-14.6,5.85,-7,5000,4,2.3,&particlegamelist);
				candlegame[1]=createcandle(&candlegamelist,12.3,9.6,-8,5000,4,2.0,&particlegamelist);
				candlegame[1]->sparked=true;
			    //candlegame[2]=createcandle(candlegamelist,3,7,-9,5000,4,2.0,particlegamelist)
        		//candlegame[3]=createcandle(candlegamelist,-1,7,-8,5000,4,2.0,particlegamelist)
				//r[0,0]=-13
				//r[0,1]=-14
				//r[1,0]=19
				//r[1,1]=11				
				//candlegame[0]=createcandle(candlegamelist,-13.2,-12.5,0,5000,2.5,1.6,particlegamelist)
				//candlegame[1]=createcandle(candlegamelist,18.5,10,0,5000,2.5,1.6,particlegamelist)
				//candlegame[1].sparked=true		
				candlemenu[1]=createcandle(&candlemenulist,-0.7-1.145,2-0.30+0.7,-10,5000,1,0.7,&particlemenulist);
				candlemenu[1]->flamme->aktiv(true);
				candlemenu[0]=createcandle(&candlemenulist,0.08-1.3,2.2+0.7,-10,5000,1,0.7,&particlemenulist);
				candlemenu[0]->flamme->aktiv(true);
				candlemenu[2]=createcandle(&candlemenulist,+0.85-1.4,2-0.24+0.7,-10,5000,1,0.7,&particlemenulist);
				candlemenu[2]->flamme->aktiv(true);
				candlemenu[2]=createcandle(&candlemenulist,+3-0.35,3.5,-8.5,5000,1,0.7,&particlemenulist);
				candlemenu[2]->flamme->aktiv(true);
				//smokemenu=new _smoke
				//smokemenu.initsmoke(this,10.7,3.2,-5,5000,1,0.5,particlemenulist,true)
				candlemenu[3]=createcandle(&candlemenulist,10.5,4.55,-5,5000,1,0.7,&particlemenulist);
				candlemenu[3]->flamme->aktiv(true);
				_listenknoten<_candle>*cit;
				if(candlegamelist.anfang(cit))do{
				 cit->objekt()->lightcolor=farbekerze;
				}while(candlegamelist.naechstes(cit));				
				if(candlemenulist.anfang(cit))do{
				 cit->objekt()->flamme->feldkraftghomogen().setzen(0,-1,0);
				}while(candlemenulist.naechstes(cit));				
				//------------------------------------------------- cardset source load && generation --------------------------------
				cardsetmanager=new _cardsetmanager(this);
				cardsetmanager->load("cardsets");
				//generatestandardcardset("cardsets");
				L->schreiben("laden der cardsets beendet.");
				cardsetmanager->createhardwaresourcesurfaces(gra);
				L->schreiben("create hardware surfaces");
				//cardsetmanager->cleartexturehardwaresources();
				cardsetmanager->generatetexturepreviewall(gra);
				L->schreiben("generieren textur vorschau(alles)");
				cardsetmanager->cleartexturehardwaresources();
				L->schreiben("gelöscht hardware surfaces");
				cardsetmanager->generatetexture(gra);
				L->schreiben("generieren textur");
				cardsetmanager->cleartexturehardwaresources();
				L->schreiben("gelöscht hardware surfaces");
				if(brandingstufe==0) fadeinloadscreen(); else fadeinsplashportal();
				//--------------------------------------------------- music load ---------------------------------------------------------------
				L->schreiben("-----------0--");
				musicman->erzeugenmusik(datenpfad+"fantasy/musik/sheepworldsolitaire01.ogg");
				musicman->erzeugenmusik(datenpfad+"fantasy/musik/sheepworldsolitaire02.ogg");
				musicman->erzeugenmusik(datenpfad+"fantasy/musik/sheepworldsolitaire03.ogg");
				//musicman->playtime[0]=62922*2-10000;
				//musicman->playtime[1]=70582*2-10000;
				//musicman->playtime[2]=69178*2-10000;
				L->schreiben("-----------0.5--");
				musicman->laden();
				L->schreiben("-----------1--");
				//musicman->abspielen(0,true);
				L->schreiben("-----------2-----------");
				//---------------------------------------------------- win effects ------------------------------------------------------
				//fireworkcards=new _fireworkcards(this,world,particlesourcegamelist,particlegamelist,clock);
				fireworkrocket=new _fireworkrocket(this,world,&particlesourcegamelist,&particlegamelist,clock);
				fireworkimage=new _fireworkimage(this,world,&particlesourcegamelist,&particlegamelist,clock);
				//------------------------------------------------- create gui --------------------------------------------------------
				gra->orthonormal();
				createmenugametypehelp();
				createmenugametype();
				createmenumain();
				createmenugame();
				//createmenuscene();
				createmenuoptionsacoustics();
				createmenuoptionsgraphics();
				createmenuoptionsgame();
				createmenuoptionscard();
				createmenuoptionscardfront();
				createmenuoptionscredits();
				createmenuuser();
				createmenuusercreate();
				createmenustatistics();
				createmenuranks();
				createmenucardgenerator();
				updatemenumain();
				menuoptionslast=menuoptionsacoustics;
				//------------------------------------------------ blendscreen init ---------------------------------------------------
				//ShowMouse();!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	            groesseminimal(_guigroesse<int>(640,480));
                //maximieren();
                //zeigen();
                //fokus();           
			
				
};
void _solitairefantasy::initfinish(){
	 			//GrabImage(blendscreen,0,0);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				deletesecure(irose);
				blendscreenopacity=1;
				uhrprogrammstart=fpstimeold=clock->system();
				setworldfieldmenu();
				initialisiert=true;

};
_solitairefantasy::~_solitairefantasy(){
				if(cardsetmanager){ 
				 cardsetmanager->savedynamicsets();
				 deletesecure(cardsetmanager);
				};
				deletesecure(game);
				deletesecure(gamepreview);
				deletesecure(gamemenu);
				savestatistics(strfilestatistics);
				for(int n=0;n<gametypecount;n++) deletesecure(gamestats[n]);
				deletesecure(gamestats);
				saveoptions(strfileoptions);
				usermanagement->speichern();
				deletesecure(fireworkrocket);
				deletesecure(fireworkimage);

                shadowlist.loeschen();
                shadowpreviewlist.loeschen();
                particlelistbackground.loeschen();
                particlegamelist.loeschen();
                particlemenulist.loeschen();
				deletesecure(usermanagement);
				deletesecure(cam);
				deletesecure(world);
				deletesecure(clock);
				deletesecure(iggsystem);
				//deletesecure(tonverwaltung);
				deletesecure(musicman);
				deletesecure(akustik);
				deletesecure(font10);
				deletesecure(font14);
				deletesecure(font16);
				deletesecure(font18);
				deletesecure(font24);
				deletesecure(font30);
				deletesecure(gra);
				deletesecure(maus);
				deletesecure(tastatur);
};
_bild<_tb>* _solitairefantasy::ladenbild(_zeichenkette<char> s,bool clamp){
				L->schreiben("Laden bild : ",s);
                _bild<_tb>*b=new _bild<_tb>(s);
                b->wiederholung(0,clamp);
                b->wiederholung(1,clamp);
				
                return(b);
};
_textur<_tb>* _solitairefantasy::ladentextur(_zeichenkette<char> s,bool clamp){
				L->schreiben("Laden textur : ",s);
                _textur<_tb>*t=new _textur<_tb>();
                _bild<_tb>  *b=new _bild<_tb>(s);
                t->einfuegenbitmap(b);
                b->wiederholung(0,clamp);
                b->wiederholung(1,clamp);
                return(t);
};                                
_ton*_solitairefantasy::ladenton(const _zeichenkette<char>&datei){
                std::vector<unsigned char> buffer;                          
                _ton*t=akustik->erzeugenton();
                if(t==0) {
                    L->schreiben("_tonverwaltung : erzeugenton() fehlgeschlagen.");
                    throw("_tonverwaltung : erzeugenton() fehlgeschlagen.");
                };
                _datei file(datei.daten());
                file.oeffnennurlesen();
                file.laden(buffer,file.groesse());
                t->laden(buffer);
                file.schliessen();
                return(t);
};
void _solitairefantasy::drawloadscreen(bool swap,_to op){
				_vektor3<_tg> o;
			    _vektor4<_to> c(1,1,1,1-op);
                gra->aktivitaet(true);
                if(gra->szenebeginn()){
                 gra->validieren();
				 gra->tiefenbufferkondition(false);
				 gra->tiefenbufferschreiben(false);
				 gra->transparenz(true);
				 gra->orthonormal();
				 gra->ausschussflaeche(false);

				 //gra->rechteck(blendscreen,0,0,gra->groessex(),gra->groessey(),c);!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 c.setzen(0,0,0,op);
				 //SetImageFont(font24)
				 gra->rechteck(0,0,gra->groessex(),gra->groessey(),c);
				 c.setzen(1,1,1,op);
				 gra->rechteck(irose,gra->groessex()/2-150,gra->groessey()/2-100,irose->groesse(0),irose->groesse(1),c);
				 _zeichenkette<_tt> h=strsolitaireloading;
				 o.setzen(gra->groessex()/2-font24->breite(h)/2-110,gra->groessey()/2-font24->hoehe(h)/2-90,1);
				 c.setzen(1,0.85,0.65,op);
				 zeichnenguitext(gra,h,font24,o,c);
				 //SetImageFont(font18)
				 h=strevaluationcopy;
				 o.setzen(gra->groessex()/2-font18->breite(h)/2,gra->groessey()-25,1);
				 c.setzen(1,0.75,0.3,op);
				 zeichnenguitext(gra,h,font18,o,c);
			 	 gra->szeneende();
				};
				if(swap) gra->anzeigebufferumschalten(videosynchronisation);
};
void _solitairefantasy::drawsplashsurricate(bool swap,_to op){
				_vektor3<_tg> o;
			    _vektor4<_to> c(1,1,1,1-op);
                gra->aktivitaet(true);
                if(gra->szenebeginn()){
                 gra->validieren();
				 gra->tiefenbufferkondition(false);
				 gra->tiefenbufferschreiben(false);
				 gra->transparenz(true);
				 gra->orthonormal();
				 gra->ausschussflaeche(false);
			
				//gra->rechteck(blendscreen,0,0,gra->groessex(),gra->groessey(),c);!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			
				 c.setzen(1,1,1,op);
				 gra->rechteck(isplashsurricate,0,0,gra->groessex(),gra->groessey(),c);
				 _zeichenkette<_tt> h;
				 h=strloading;
				 o.setzen(gra->groessex()/2-font18->breite(h)/2,gra->groessey()-25,1);
				 c.setzen(1,1,1,op);
				 zeichnenguitext(gra,h,font18,o,c);
				 gra->szeneende();
				};
				if(swap) gra->anzeigebufferumschalten(videosynchronisation);
};
void _solitairefantasy::drawsplashportal(bool swap,_to op){
				_vektor3<_tg> o;
			    _vektor4<_to> c(1,1,1,1-op);
                gra->aktivitaet(true);
                if(gra->szenebeginn()){
                 gra->validieren();
				 gra->tiefenbufferkondition(false);
				 gra->tiefenbufferschreiben(false);
				 gra->transparenz(true);
				 gra->orthonormal();
				 gra->ausschussflaeche(false);
				 //gra->rechteck(blendscreen,0,0,gra->groessex(),gra->groessey(),c);!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 c.setzen(1,1,1,op);
				 gra->rechteck(isplashportal,0,0,gra->groessex(),gra->groessey(),c);
				 _zeichenkette<_tt> h=strloading;
				 o.setzen(gra->groessex()/2-font18->breite(h)/2,gra->groessey()-25,1);
				 c.setzen(1,1,1,op);
				 zeichnenguitext(gra,h,font18,o,c);
				 gra->szeneende();
				};
				if(swap) gra->anzeigebufferumschalten(videosynchronisation);

};
void _solitairefantasy::fadeinloadscreen(){
				//GrabImage(blendscreen,0,0);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				_tg start=clock->system();
				_to op=0;
				do{
				 op=(clock->system()-start)*0.001;
				 if(op>1) op=1;
				 drawloadscreen(true,op);
				}while(op<1);
};	
void _solitairefantasy::fadeinsplashsurricate(){
				//GrabImage(blendscreen,0,0);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				_tg start=clock->system();
				_to op=0;
				do{
				 op=(clock->system()-start)*0.001;
				 if(op>1) op=1;
				 drawsplashsurricate(true,op);
				}while(op<1);
};	
void _solitairefantasy::fadeinsplashportal(){
				//GrabImage(blendscreen,0,0);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				_tg start=clock->system();
				_to op=0;
				do{
				 op=(clock->system()-start)*0.001;
				 if(op>1) op=1;
				 drawsplashportal(true,op);
				}while(op<1);
};								
void _solitairefantasy::messageboxblack(const _zeichenkette<_tt>&t,const _zeichenkette<_tt>&tbutton,_tg ox,_tg oy,_zeichensatz*f,_bild<_tb>*iwindow){
				iggsystem->saveactivitylist();
				iggsystem->setactivitylist(false);
				_to tr=messageboxtextcolor.x();
				_to tg=messageboxtextcolor.y();
				_to tb=messageboxtextcolor.z();
				gra->orthonormal();
				_iggwindow*w0;
				_tg px=ox;
				_tg py=oy;
				_tg wy=200;
				_tg wx=f->breite(t)+messageboxadditiontextwidth;
				_tg maxwx=400;
				if(wx<100) wx=100;
				if(wx>maxwx) wx=maxwx;
				_liste<_zeichenkette<_tt> >*lt=textsplit(t,wx-messageboxadditiontextwidth,f);
				_liste<_igg> guilist;
				px-=wx/2;
				py-=wy/2;
				wy=180+lt->anzahl()*20;
				w0=new _iggwindow(iggsystem,px,py,wx,wy,1,1,1);
				w0->position.z(-10);
				windowinitmagic(w0,iwindow);
				w0->setshadow(25,25);
				guilist.einhaengen(w0);
				_tg yit=messageboxadditiontexty;
				_listenknoten<_zeichenkette<_tt> >*tit;
				if(lt->anfang(tit))do{
				 guilist.einhaengen(new _iggtext(w0,wx/2-f->breite(*(tit->objekt()))/2,yit,messageboxtextz,*(tit->objekt()),tr,tg,tb,f));
				 yit+=25;
				}while(lt->naechstes(tit));
				lt->loeschen();
				deletesecure(lt);
				_iggbutton*k0=new _iggbutton(w0,wx/2-messageboxbuttonwidth/2,wy-60+messageboxadditionbuttony-10,messageboxbuttonwidth,messageboxbuttonheight,tbutton,0);
				buttoninitmagic(k0);
				guilist.einhaengen(k0);
				w0->visibility(false);
				w0->activity(false);
				w0->fadeopacity(0);
				w0->fadein();
				w0->fadetarget(menuopacity);
				bool q=false;
				do{
				 
				 iggsystem->nullstates(maus,tastatur);
				 iggsystem->animieren(maus,tastatur);
				 iggsystem->animierenfade();
				 bearbeitenloeschmarkierung();
				 animatesystem();
                 iggsystem->animierenhilfefadeoutglobal();
				 gra->orthonormal();		
				 drawloadscreen(false,1);
				 _listenknoten<_igg>*git;
				 if(guilist.anfang(git))do{
				  git->objekt()->zeichnen(gra,cam);
				 }while(guilist.naechstes(git));
				 iggsystem->zeichnencursor(maus,gra,cam);				
				 gra->anzeigebufferumschalten(false);
				}while((iggsystem->button==0)&&(tastatur->escape()==false)&&(tastatur->enter()==false)&&(tastatur->knopflinks()==false)&&(tastatur->knopfrechts()==false)&&(q==false));
				iggsystem->button=0;
				w0->fadeout();
				w0->activity(false);
				do{
				 iggsystem->nullstates(maus,tastatur);
				 iggsystem->animieren(maus,tastatur);
				 iggsystem->animierenfade();
				 bearbeitenloeschmarkierung();
				 iggsystem->animierenhilfefadeoutglobal();
				 gra->orthonormal();		
				 drawloadscreen(false,w0->pfadeopacity);
				 _listenknoten<_igg>*git;
				 if(guilist.anfang(git))do{
				  git->objekt()->zeichnen(gra,cam);
				 }while(guilist.naechstes(git));
				 iggsystem->zeichnencursor(maus,gra,cam);
				 gra->anzeigebufferumschalten(false);
				}while(w0->pfadeopacity>0);
				iggsystem->restoreactivitylist();
};					
void _solitairefantasy::messagedesktopsizetoosmall(){
				messageboxblack(strdesktopsizetoosmall,strok,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow);
};				
void _solitairefantasy::messagetrialexhausted(){
				messageboxblack(strtrialexhausted,strok,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow);
};				
void _solitairefantasy::messagetrialdeactivated(){
				messageboxblack(strtrialdeactivated,strok,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow);
};				
void _solitairefantasy::generatestandardcardset(const _zeichenkette<char>&pf){
				_cardsetback*cb=new _cardsetback(cardsetmanager);
				_cardsetfront*cf=new _cardsetfront(cardsetmanager);
				cb->statisch=true;
				cf->statisch=false;
				cb->addground(datenpfad+"sets/ground_00.tga","ground_00");
				//cb->addground(datenpfad+"sets/ground_01.tga","ground_01");
				//cb->addground(datenpfad+"sets/ground_02.tga","ground_02");
				//cb->addground(datenpfad+"sets/ground_03.tga","ground_03");
				//cb->addground(datenpfad+"sets/ground_04.tga","ground_04");
				cb->addground(datenpfad+"sets/ground_06.tga","ground_06");
				
				cb->addmotive(datenpfad+"sets/motiveback_00.tga","motiveback_00");
				cb->addframe(datenpfad+"sets/frame_00.tga","frame_00");
				cb->addframe(datenpfad+"sets/frame_01.tga","frame_01");
				//cb->addframe(datenpfad+"sets/frame_02.tga","frame_02");
				cb->addframe(datenpfad+"sets/frame_06.tga","frame_06");
				cb->addframe(datenpfad+"sets/frame_07.tga","frame_07");
				//cb->addframe(datenpfad+"sets/frame_08.tga","frame_08");
				cb->addframe(datenpfad+"sets/frame_09.tga","frame_09");
				cb->addframe(datenpfad+"sets/frame_10.tga","frame_10");
				cb->addframe(datenpfad+"sets/frame_11.tga","frame_11");
				cb->addframe(datenpfad+"sets/frame_12.tga","frame_12");
				cb->addframe(datenpfad+"sets/frame_13.tga","frame_13");
				cb->addframe(datenpfad+"sets/frame_14.tga","frame_14");
				cb->addframe(datenpfad+"sets/frame_15.tga","frame_15");
				cb->addframe(datenpfad+"sets/frame_16.tga","frame_16");
				cb->addframe(datenpfad+"sets/frame_17.tga","frame_17");
				cb->addframe(datenpfad+"sets/frame_18.tga","frame_18");
				cb->addframe(datenpfad+"sets/frame_19.tga","frame_19");
				cb->addframe(datenpfad+"sets/frame_20.tga","frame_20");
				//cb->addframe(datenpfad+"sets/frame_21.tga","frame_21");
				cb->addframe(datenpfad+"sets/frame_22.tga","frame_22");
				//cb->addframe(datenpfad+"sets/frame_23.tga","frame_23");
				cb->addframe(datenpfad+"sets/frame_24.tga","frame_24");
				//cb->addframe(datenpfad+"sets/frame_25.tga","frame_25");
				cb->addframe(datenpfad+"sets/frame_27.tga","frame_27");
				//cb->addframe(datenpfad+"sets/frame_28.tga","frame_28");
				cb->addframe(datenpfad+"sets/frame_29.tga","frame_29");
				cb->addframe(datenpfad+"sets/frame_30.tga","frame_30");

				cb->addframe(datenpfad+"sets/frame_31.tga","frame_31");
				cb->addframe(datenpfad+"sets/frame_32.tga","frame_32");
				cb->addframe(datenpfad+"sets/frame_33.tga","frame_33");

				cb->addstructure(datenpfad+"sets/structure_02.tga","structure_02");
				//cb->addstructure(datenpfad+"sets/structure_03.tga","structure_03");
				cb->addstructure(datenpfad+"sets/structure_04.tga","structure_04");
				//cb->addstructure(datenpfad+"sets/structure_07.tga","structure_07");
				cb->addstructure(datenpfad+"sets/structure_08.tga","structure_08");
				cb->addstructure(datenpfad+"sets/structure_09.tga","structure_09");
				cb->addstructure(datenpfad+"sets/structure_10.tga","structure_10");
				cb->addstructure(datenpfad+"sets/structure_11.tga","structure_11");
				cb->addstructure(datenpfad+"sets/structure_12.tga","structure_12");
				cb->addstructure(datenpfad+"sets/structure_13.tga","structure_13");
				cb->addstructure(datenpfad+"sets/structure_14.tga","structure_14");
				cb->addstructure(datenpfad+"sets/structure_15.tga","structure_15");
				cb->addstructure(datenpfad+"sets/structure_16.tga","structure_16");
				cb->addstructure(datenpfad+"sets/structure_17.tga","structure_17");
				cb->addstructure(datenpfad+"sets/structure_18.tga","structure_18");
				cb->addstructure(datenpfad+"sets/structure_21.tga","structure_21");
				//cb->addstructure(datenpfad+"sets/structure_22.tga","structure_22");
				cb->addstructure(datenpfad+"sets/structure_23.tga","structure_23");
				cb->addstructure(datenpfad+"sets/structure_24.tga","structure_24");
				cb->addstructure(datenpfad+"sets/structure_27.tga","structure_27");
				cb->addstructure(datenpfad+"sets/structure_28.tga","structure_28");
				cb->addstructure(datenpfad+"sets/structure_30.tga","structure_30");
				cb->addstructure(datenpfad+"sets/structure_32.tga","structure_32");
				cb->addstructure(datenpfad+"sets/structure_33.tga","structure_33");
				cb->addstructure(datenpfad+"sets/structure_37.tga","structure_37");
				//cb->addstructure(datenpfad+"sets/structure_38.tga","structure_38");
				//cb->addstructure(datenpfad+"sets/structure_39.tga","structure_39");
				cb->addstructure(datenpfad+"sets/structure_40.tga","structure_40");
				cb->addstructure(datenpfad+"sets/structure_41.tga","structure_41");
				cb->addstructure(datenpfad+"sets/structure_42.tga","structure_42");
			//	cb->addstructure(datenpfad+"sets/structure_43.tga","structure_43");
				//cb->addstructure(datenpfad+"sets/structure_44.tga","structure_44");
				cb->addstructure(datenpfad+"sets/structure_45.tga","structure_45");
				cb->addstructure(datenpfad+"sets/structure_46.tga","structure_46");
				//cb->addstructure(datenpfad+"sets/structure_47.tga","structure_47");
				cb->addstructure(datenpfad+"sets/structure_48.tga","structure_48");
				cb->addimpurity(datenpfad+"sets/impurity_00.tga","impurity_00");
				cb->addimpurity(datenpfad+"sets/impurity_01.tga","impurity_01");
				cb->setground("ground_00");
				cb->setmotive("motiveback_00");
				cb->setframe("frame_06",0,0,0);
				cb->setstructureground("structure_16",0,false);
				cb->setstructureframe("structure_16",0);
				cb->setimpurity("impurity_00",0,0,0);
				cb->statisch=true;
				cb->save(pf+"/_00_back_01.sol");
				
				cb->clearlocallists();
				
				cb->setground("ground_06");
				cb->setimpurity("impurity_00",0.0,0.0,0.0);
				cb->statisch=true;
				cb->save(pf+"/_00_back_00.sol");
				
				for(unsigned int n=0;n<52;n++){
				 _zeichenkette<char> h=int(n);
				 if(h.groesse()==1) h.anhaengenfront("0");
				 cf->addmotive(datenpfad+"sets/motivefront_"+h+".tga","motivefront_00");
				};
				cf->setground("ground_00");
				cf->setframe("frame_06",0,0,0);
				cf->setmotive("motivefront_00");
				cf->setstructureground("structure_09",0,false);
				cf->setstructureframe("structure_09",0);
				cf->setimpurity("impurity_00",0,0,0);
				//cf->save(pf+"/fantasy_standard_front_clean.sol")
				cf->setframe("frame_06",0,1,0);
				cf->save(pf+"/_00_front_01.sol");
				cf->clearlocallists();
				cf->setground("ground_06");
				cf->setframe("frame_06",0,0,0);
				cf->setimpurity("impurity_00",0.0,0.0,0.0);
			    //cf->save(pf+"/fantasy_standard_front_used.sol");
				
				cf->setframe("frame_06",0,1,0);
				cf->save(pf+"/_00_front_00.sol");
				//cf->statisch=false;
				//cf->save(pf+"/fantasy_standard_front_dynamic.sol");
			    //------------------------------- russen cards FRONT --------------------------------------
				_cardsetfront*cr=new _cardsetfront(cardsetmanager);
				cr->statisch=false;
				//cr->addground(datenpfad+"sets/russen/ground_00.tga","ground_russia00");
				cr->addground(datenpfad+"sets/russen/ground_01.tga","ground_russia01");	
				//cr->addframe(datenpfad+"sets/russen/framesoft.tga","framesoft");
				cr->addframe(datenpfad+"sets/russen/framemuster00.tga","framemuster00");
				//cr->addframe(datenpfad+"sets/russen/framemuster01.tga","framemuster01");
				cr->addframe(datenpfad+"sets/russen/framemuster02.tga","framemuster02");
				cr->addframe(datenpfad+"sets/russen/framemuster03.tga","framemuster03");
				cr->addframe(datenpfad+"sets/russen/framemuster04.tga","framemuster04");
							
				//cr.addground(datenpfad+"sets/ground_05.tga","ground_05")
				for(unsigned int n=0;n<52;n++){
				 unsigned int k=n%4;
				 unsigned int vsu;
				 if(k==0) vsu=1;
				 if(k==1) vsu=3;
				 if(k==2) vsu=4;
				 if(k==3) vsu=2;
				 unsigned int i=(n/4)+1;
				 _zeichenkette<char> h=i;
				 _zeichenkette<char> hvsu=vsu;
				 if(h.groesse()==1) h.anhaengenfront("0");
				 hvsu.anhaengenfront("0");
				 cr->addmotive(datenpfad+"sets/russen/"+hvsu+"/"+hvsu+"_"+h+".tga","motivefront_russen");
				};				
				cr->setground("ground_00");
				cr->setframe("frame_00",0,0,0);
				cr->setmotive("motivefront_russen");
				cr->setstructureground("structure_09",0,false);
				cr->setstructureframe("structure_09",0);
				cr->setimpurity("impurity_00",0,0,0);
				
				cr->save(pf+"/_01_front_01.sol");
				cr->clearlocallists();
				cr->setground("ground_russia01");
				cr->save(pf+"/_01_front_00.sol");
 
				//------------------------------- russen cards BACK --------------------------------------
				_cardsetback*cbr=new _cardsetback(cardsetmanager);
				cbr->statisch=true;
				cbr->addmotive(datenpfad+"sets/russen/motiveback00.tga","motiveback_russen_00");
				cbr->addmotive(datenpfad+"sets/russen/motiveback01.tga","motiveback_russen_01");
				cbr->addmotive(datenpfad+"sets/russen/motiveback02.tga","motiveback_russen_02");
				cbr->addmotive(datenpfad+"sets/russen/motiveback03.tga","motiveback_russen_03");
				cbr->addmotive(datenpfad+"sets/russen/motivebackempty.tga","motiveback_russen_empty");
				cbr->setground("ground_russia01");
				//cbr->setframe("framesoft",true,true,false);
				cbr->setimpurity("impurity_00",1.0,0.0,0.0);
				cbr->setmotive("motiveback_russen_00");
				cbr->setstructureground("structure_09",0,false);
				cbr->save(pf+"/_01_back_02.sol");
				cbr->clearlocallists();
				cbr->setmotive("motiveback_russen_01");
				cbr->save(pf+"/_01_back_03.sol");
				cbr->clearlocallists();
				cbr->setmotive("motiveback_russen_02");
				cbr->save(pf+"/_01_back_04.sol");
				cbr->clearlocallists();
				cbr->setmotive("motiveback_russen_03");
				cbr->save(pf+"/_01_back_05.sol");
				
				//cbr->static=true;
				cbr->clearlocallists();
				cbr->statisch=false;
				cbr->setimpurity("impurity_00",0.0,0.0,0.0);
				cbr->setframe("framemuster00",1,1,1);
				cbr->setstructureframe("structure_09",0.95);
                cbr->setstructureground("structure_09",0,false);
				cbr->setmotive("motiveback_russen_empty");
				cbr->save(pf+"/_01_back_00.sol");
				
				_cardsetback*cb2=new _cardsetback(cardsetmanager);
				cb2->setframe("framemuster02",0,0,1);
				cb2->setstructureframe("structure_09",0.1);
				cb2->setmotive("motiveback_russen_empty");
				cb2->setground("ground_06");
				cb2->setstructureground("structure_09",0,false);
				cb2->setimpurity("impurity_00",0.0,0.0,0.0);
				cb2->save(pf+"/_01_back_01.sol");
				//----------------------------------------- tassilo poker cards FRONT ---------------------
				_cardsetfront*ctf=new _cardsetfront(cardsetmanager);
				ctf->statisch=false;
				ctf->addground(datenpfad+"sets/tassilo/ground.tga","ground_tassilo");
				for(unsigned int n=0;n<52;n++){
				 unsigned int k=n%4;
				 unsigned int vsu;
				 if(k==0) vsu=1;
				 if(k==1) vsu=3;
				 if(k==2) vsu=4;
				 if(k==3) vsu=2;
				 unsigned int i=(n/4)+1;
				 _zeichenkette<char> h=i;
				 _zeichenkette<char> hvsu=vsu;
				 if(h.groesse()==1) h.anhaengenfront("0");
				 hvsu.anhaengenfront("0");
				 ctf->addmotive(datenpfad+"sets/tassilo/"+hvsu+"/"+hvsu+"_"+h+".tga","motivefront_tassilo");
				};				
				ctf->setground("ground_tassilo");
				ctf->setframe("frame_00",0,0,0);
				ctf->setmotive("motivefront_tassilo");
				ctf->setstructureground("structure_09",0,false);
				ctf->setstructureframe("structure_09",0);
				ctf->setimpurity("impurity_00",0,0,0);
				ctf->save(pf+"/_02_front_00.sol");
				ctf->clearlocallists();
				
};
void _solitairefantasy::generatestatistics(){
				for( int i=0;i<gametypecount;i++){
				 gamestats[i]=new _gamestats(this,i);
				 _gamestatsentry*eit;
				 for( int j=0;j<5;j++){
				 eit=new _gamestatsentry(gamestats[i]);
				  if(zufall<unsigned int>(0,1)==0){
				   eit->discards=zufall<unsigned int>(1,gametype[i].punktemaximal/2);
				  }else{ 
				   eit->discards=gametype[i].punktemaximal;
				  }; 
				  //eit.time=20*1000+(15*60*1000)*gametypetime[i]+ Rnd(0,5*1000*60)
				  eit->time=gametype[i].dauer*60*1000+zufall<_tg>(60*500,60*2500);
				  eit->moves=zufall<unsigned int>(eit->discards*2,eit->discards*5);
				  eit->user=strdummynames[zufall<unsigned int>(0,9)];
				  eit->undos=0;
				  eit->tipps=0;
				 };
				 
				 if(gamestats[i]->entrylist.anfang(eit))do{//for(Local eit:_gamestatsentry=EachIn gamestats[i].entrylist
				  _gamestatsentry*ehi=new _gamestatsentry(gamestats[i],true);
				  ehi->copy(eit);
				 }while(gamestats[i]->entrylist.naechstes(eit));
				 gamestats[i]->highscorelist.sortieren();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				};
};	
void _solitairefantasy::takestatistics(bool showhighscore){
				if((game->inuse)&&(game->statsclosed==false)&&(game->preview==false)){
				 game->statsclosed=true;
				 _gamestatsentry*e=new _gamestatsentry(gamestats[currentgame]);
				 e->time=game->time;
				 e->discards=game->discards;
				 e->undos=game->undos;
				 e->moves=game->moves;
				 e->tipps=game->tipps;
				 if(usermanagement->aktuell()) e->user=usermanagement->aktuell()->name();
				 _gamestatsentry*h=new _gamestatsentry(gamestats[currentgame],true);
				 h->copy(e);
				 gamestats[currentgame]->highscorelist.sortieren();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 if(usermanagement->aktuell()) h->user=usermanagement->aktuell()->name();
				 updatemenumain();
				 if(h->index()>=5){
				  if(game->ended){
				   messagebox(strwonbutnotinhighscore,strok,gra->groessex()/2,gra->groessey()/2+20,font18,imessagewindow);
				  };
				 };
				 if((h->index()<5)&&(showhighscore)){
				  //--------------------------------------------------------------------------
				  _tg ox=gra->groessex()/2;
				  _tg oy=gra->groessey()/2+20-100;
				  _iggwindow*w0;
				  _iggbutton*highclear=0;
				  _tg wy=256;
				  _tg wx=256;
				  _tg wm=(wx/2-4);
				  _tg y=0;
				  _to r,g,b,a;
				  _iggtext*gt;
				  iggsystem->saveactivitylist();
				  iggsystem->setactivitylist(false);
				  gra->orthonormal();
				  w0=new _iggwindow(iggsystem,ox-wx/2,oy,wx,wy,1,1,1);
				  windowinitmagic(w0,ihighscorewindow);
				  _zeichenkette<_tt> hh=strhighscore;
				  _iggtext*gth=new _iggtext(w0,wm-font24->breite(hh)/2,35,1,hh,1,0.8,0.5,font24);
				  y=70;
				  
				  _zeichenkette<_tt> hhh;
				  _gamestatsentry*it;
				  gamestats[currentgame]->highscorelist.anfang(it);
				  //Local it:TLink=gamestats[currentgame].highscorelist.firstlink()
				  
				  for(unsigned int i=0;i<5;i++){
				   _tg f=1-_tg(i)/_tg(4);
				   r=1;
				   g=0.5+0.3*f;
				   b=0.2+0.2*f;
				   a=1;
				   if(i!=h->index()){
				    r=0.25+r*0.5;
				    g=0.25+g*0.5;
				    b=0.25+b*0.5;
				    a=0.4;
				   };
			 	
				   if(it){
				    gt=new _iggtext(w0,wm-15-font18->breite(it->user),y,1,it->user,r,g,b,font18);
				    gt->colortransformed.w(a);
				    hhh=int(it->score());
				    gt=new _iggtext(w0,wm-font18->breite(hhh)/2,y,1,hhh,r,g,b,font18);
				    gt->colortransformed.w(a);
				    hhh=timemstohhmmss(e->time);
				    gt=new _iggtext(w0,wm+15,y,1,hhh,r,g,b,font18);
				    gt->colortransformed.w(a);	
				    it=it->naechstes();
				    if(it==gamestats[currentgame]->highscorelist.erstes()) it=0;
				   }else{
			 	    hhh=(i+1)+strranknotset;
				    gt=new _iggtext(w0,wm-font18->breite(hhh)/2,y,1,hhh,r,g,b,font18);
				    gt->colortransformed.w(a);	
				   };
				   y+=25;
				  };
				  w0->visibility(false);
				  w0->activity(false);
				  w0->fadeopacity(0);
				  w0->fadein();
				  w0->fadetarget(menuopacity);
				  menugame->fadeout();
				  bool ap;
				  if(game){
				   ap=game->allowpick;
				   game->allowpick=false;
				  };
				  bool q=false;
				  do{
				   iggsystem->nullstates(maus,tastatur);
				   if(animatestandard()) q=true;
				   drawstandard();
				  }while((iggsystem->button==0)&&(tastatur->escape()==false)&&(tastatur->enter()==false)&&(tastatur->knopflinks()==false)&&(tastatur->knopfrechts()==false)&&(q==false));
				  iggsystem->button=0;
				  w0->fadeout(false,false,true);
				  showmenugame();
				  if(game) game->allowpick=ap;
				  iggsystem->restoreactivitylist();
				  //--------------------------------------------------------------------------
				 };
				};
				updatemenumain();
};	
void _solitairefantasy::setworldfieldgame(){
				//if(fireworkcards) fireworkcards->aktiv(false);
				if(fireworkrocket) fireworkrocket->aktiv(false);
				if(fireworkimage) fireworkimage->aktiv(false);
				//world->worldfield->clearrotation();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				//world->worldfield->homogen.setzen(0,0,0);
};
void _solitairefantasy::setworldfieldmenu(){
				//if(fireworkcards) fireworkcards->aktiv(false);
				if(fireworkrocket) fireworkrocket->aktiv(false);
				if(fireworkimage) fireworkimage->aktiv(false);
				//world->worldfield->clearrotation();
				//world->worldfield->homogen.setzen(0,0,0);
};
bool _solitairefantasy::innergamemenu(){
				_tg mx=maus->x()/_tg(gra->groessex());
				_tg my=maus->y()/_tg(gra->groessey());
				if((mx>0.34)&&(mx<0.59)&&(my>0.68)&&(my<0.81)) return(true);
				return(false);
};
bool _solitairefantasy::animatestandard(){
                if(initialisiert==false) return(false);
				_tg fadetimenew=clock->system();
				_tg ds=(fadetimenew-gameopacitytime)*0.001;
				gameopacitytime=fadetimenew;
				if(pgamefadein){
				 gameopacity+=iggsystem->fadespeed*ds;
				 if(gameopacity>1){
				  gameopacity=1;
				  pgamefadein=false;
				 };
				};
				if(pgamefadeout){
				 gameopacity-=iggsystem->fadespeed*ds;
				 if(gameopacity<0){
				  gameopacity=0;
				  pgamefadeout=false;
				  deletesecure(game);
				  setworldfieldmenu();
				 };
				};				
			/*	uhr->animate();
				if(game&&(pgamefadein||pgamefadeout)){
				 animatemenu();
				 animategame();
				}else if(game==0){
				 animatemenu();
				}else{
				 animategame();//3 ms (double deck, fenster)
				};			
				//*************** 4.74 ms *******************************
				if(gamepreview) gamepreview->animate(clock);
				if(gamemenu){
				 if(gamemenu->animationlist.erstes()){
				  gamemenu->animate(clock);
				 };
				};
				animatemusic();
				if((demoplay)&&(gamepreview)){
				 if(gamepreview->animationlist.erstes()==0){
				  _tg nt=clock->system();
				  if((nt-demoplaylasttime)>1){//500
				   demoplaylasttime=nt;
				   gamepreview->autoplay();
				  };
				 };
				};	*/
				//*************** 4.74 ms ********************* nachher 0.15
				//*************** mit gametypemenu : 2.8 ms********************* 
				//*************** 0.16ms *********************
				//iggsystem->key=keypress;
				if(game){
				 if(game->picklist.anzahl()==0) iggsystem->animieren(maus,tastatur);
				}else{
				 iggsystem->animieren(maus,tastatur);
				};	
				//********************************************
				iggsystem->animierenfade();
				iggsystem->size.setzen(gra->groessex(),gra->groessey(),1);
				//***********************************************
				//*********************************************************
				bearbeitenloeschmarkierung();
				 
				
				if(tastatur->taste()){
				 if(showfpsstatus==2) if(tastatur->taste(83)){
				  showfpsstatus=0;
				  if(showfps) showfps=false; else showfps=true;
				 }; 
				 if(showfpsstatus==1) if(tastatur->taste(80)) showfpsstatus=2; else showfpsstatus=0;
				 if(showfpsstatus==0) if(tastatur->taste(70)) showfpsstatus=1; else showfpsstatus=0;
				};
				return(false);
};
void _solitairefantasy::animatesystem(){
                                MSG m;
                                while(PeekMessage(&m,NULL,0,0,PM_NOREMOVE)){
                                 if(GetMessage(&m,0,0,0)){
                                  TranslateMessage(&m);
                                  DispatchMessage(&m);
                                 };
                                };   
                                if((akustik)&&(initialisiert)){
                                 _tg s;
                                 akustik->zuhoererort(_vektor3<>(0,0,0)); 
                                 akustik->zuhoerergeschwindigkeit(_vektor3<>(0,0,0));                                                                 
                                 s=_tg(clock->system()-uhrprogrammstart)/_tg(1000);    
                              //   akustik->animieren(s);                                
                                };
};
void _solitairefantasy::animatemusic(){

				if(game){
				 //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 /*
				 if((musicman->channelmenu->playing())&&(musicman->channelmenufadedown==false)&&(musicman->channelmenufadeup==false)&&(musicman->channelmenufadeswitch==false)){
				  if((clock->system()-musicman->starttime)>musicman->spieldauer[musicman->menuindex]){
				   unsigned int ni=musicman->menuindex+1;
				   if(ni>musicman->count-1) ni=0;
				   musicman->channelmenufadeswitch=true;
				   musicman->channelmenuswitchto=ni;
				   if(game) game->music=ni;
				   musicman->channelmenufadeup=false;
				   musicman->channelmenufadedown=false;
				  };
				 };	
				 */
				};
				musicman->animieren(paused);
};							
void _solitairefantasy::animatemenu(){
				bool gedr=false;
				if(marked==2){
				 if(tastatur->knopflinks()==false){
				  if(innergamemenu()){
				   gedr=true;
				   marked=0;
				  }else{
				   marked=0;
				  };
				 }else{
				  if(innergamemenu()==false){
				   marked=0;
				  };
				 };
				};
				if(marked==1){
				 if(innergamemenu()){
				  if(tastatur->knopflinks()){
				   marked=2;
				  };
				 }else{
				  marked=0;
				 };
				};				
				if(marked==0){
				 if(innergamemenu()){
  				  marked=1;
				 }; 
   			    };				
				if(gedr) if(menumain->active()) {
				 if(game){ 
				  if(game->ended){
				   initgame(0,true);
				   transformgame();
				  };
				 }else{
				  initgame(0,true);
				  transformgame();
				 };
				 gamefadein();
				 showmenugame();
				 activatestatusgame();
				};
				
				kamin->animate();
				_partikel*ait;
				if(particlemenulist.anfang(ait))do{//for(Local ait:_particle=EachIn particlemenulist
				 ait->animieren();
				}while(particlemenulist.naechstes(ait));	
			
			    _listenknoten<_candle>*cit;
				if(candlemenulist.anfang(cit))do{//for(Local cit:_candle=EachIn candlemenulist
				 if(cit->objekt()->flamme->aktiv()==false) cit->objekt()->flamme->aktiv(true);
				 cit->objekt()->animate(clock);
				 cit->objekt()->flamme->animieren();
				}while(candlemenulist.naechstes(cit));

				if(smokemenu){
				 if(smokemenu->flamme->aktiv()==false) smokemenu->flamme->aktiv(true);
				 smokemenu->animate(clock);
				 smokemenu->flamme->animieren();
				};
};				
void _solitairefantasy::animategame(){
				getmousevectorstatic();
			    _listenknoten<_candle>*cit;
				if(candlegamelist.anfang(cit))do{//for(Local cit:_candle=EachIn candlegamelist
				 cit->objekt()->animate(clock);
				}while(candlegamelist.naechstes(cit));
				_partikelquelle*qit;
				if(particlesourcegamelist.anfang(qit))do{//for(Local qit:_particlesource=EachIn particlesourcegamelist
				 qit->animieren();
				}while(particlesourcegamelist.naechstes(qit));
				_partikel*ait;
				if(particlegamelist.anfang(ait))do{//for(Local ait:_particle=EachIn particlegamelist
				 ait->animieren();
				}while(particlegamelist.naechstes(ait));				
				transformscene();//wegen pilestretch				
 				if(game) game->animate(clock);//**** 2.88 ms (double deck, fenster), bestätigt	
				//--------------------------------------- backgroundcolor lighting ------------------------------------------
				_vektor4<_to> v4;
				_vektor3<_to> v3;
				unsigned int cl=0;
				_licht<_tg,_to>*lit;
				if(world->anfang(lit))do{//for(Local lit:_light=EachIn world.lightlist
				 v3.add(lit->farbedynamisch());
				 cl++;
				}while(world->naechstes(lit));
				if(cl>0) v3*=_to(1)/cl;
				v3.x(1-(0.8-v3.x())*0.5);
				v3.y(1-(0.5-v3.y())*0.5);
				v3.z(1-(0.2-v3.z())*0.5);
				//v4.setzen(1,1-(Sin(clock.count*30)*0.05+0.05),1-(Sin(clock.count*40)*0.01+0.01),1)
				v4.setzen(v3.x(),v3.y(),v3.z(),1);
				//background.mesh.vertexcolor(v4)
				v4*=255;
				v4.w(1);
				backgroundcolor=v4;
				//------------------------------------ world gravitation animate -----------------------------------------
				if(game==0){
				 setworldfieldmenu();
				}else{
				 //world.worldfield.homogen.setzen(0,0,1)
				 if(game->ended){
				  //------------------------------------ world gravitation animate -----------------------------------------
				  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				  /*
				  if(world->worldfield->rotationlist.erstes()==0){
				   world->worldfield->createrotationconstant(+5,0,10,0,0,-30,-0.3);
				  };
				  world->worldfield->homogen.z((0.5+Sin(clock->system()*0.1)*0.5)*1);
				  _feldrotation<_tg>*rot;
				  if(world->worldfield->rotationlist.anfang(rot)){
				   rot->intensity=sin(clock->system()*0.005*_ph)*0.3;
				  };
				  */
				  //------------------------------------ firework card animate -----------------------------------------
				  if(game->effectindex==2){
				  /*
				   if(fireworkcards->active==false) fireworkcards.activate();
				   _tg zz=-1.1;
				   _tg gamma=1;
				   gamma=(zz-cam->z())/mousevector.z();
				   fireworkcards->position.setzen(cam->x()+mousevector.x()*gamma,cam->y()+mousevector.y()*gamma,zz);
				   fireworkcards->rotation=sin( _ph* clock->system()* cos(_ph*clock->system()*0.0001)*0.05   )*220;
				   fireworkcards->vector.setzen(cos(_ph*clock->system()*0.1)*0.4,sin(_ph*clock->system()*0.15)*0.4,-0.5);
				   */
				  };
				  //------------------------------------ firework rocket animate -----------------------------------------
				  if(game->effectindex==1){
				   if(fireworkrocket->aktiv()==false) fireworkrocket->aktiv(true);
				   fireworkrocket->ort(zufall<_tg>(-10,10),zufall<_tg>(-10,10),zufall<_tg>(-7,-2));
				   fireworkrocket->generationsrate(zufall<_tg>(2,5));
				   fireworkrocket->partikelquelletod()->kurvefarbe().setzen(1,1,1,1  ,  0.5,0.2,0.1,0,  0,0,0,0, 0,0,0,0);
				   fireworkrocket->partikelquelletod()->vektortoleranz(zufall<_tg>(0.1,0.9));
			       fireworkrocket->partikelquelleleben()->rotation(sin(_ph*clock->system()/10)*90);
				   fireworkrocket->partikelquelleleben()->groesse(1+sin(_ph*clock->system()*0.23)*0.7);
				  };
				  //------------------------------------ firework image animate -----------------------------------------
				  if(game->effectindex==0){
				   if(fireworkimage->aktiv()==false) fireworkimage->aktiv(true);
				   fireworkimage->ort(zufall<_tg>(-10,10),zufall<_tg>(-10,10),zufall<_tg>(-7,-2));
				   fireworkimage->rotationachse().zufall();
				  };
				 }else{
				  setworldfieldgame();
				 };
				};
				//------------------------------------ watchdog speed animate -----------------------------------------
				if(watchdogspeed){
				 if(watchdogspeed->hintgiven==false){
				  bool wdanim=false;
				  if(game){
				   if((game->activepreparation()==false)&&(paused==false)&&(gameopacity==1)&&(fullscreen)&&(fastvideomode==false)&&(gra->groessex()!=1024)){
				   //if(game->activepreparation()=false && paused=false && gameopacity=1 && fastvideomode=false
				    wdanim=true;
				   };
				  };
				  if(wdanim){
				   if(watchdogspeed->animate()>0){
				    _zeichenkette<_tt> hhh=strwatchdogspeedhint;//+"             FPS,average="+watchdogspeed.fpsresultaverage+"   FPS,maximum="+watchdogspeed.fpsresultmaximum+"   FPS,variance="+watchdogspeed.fpsresultvariance+"     recorded values : " 
				   // for(Local wit:_watchdogspeedentry=EachIn watchdogspeed.fpslist
				   //  hhh+=Int(wit.value)+"  "
				   // };
				    watchdogspeed->hintgiven=true;
				    if(abfrage(hhh,stryes,strno,gra->groessex()/2,gra->groessey()/2,font24,imessagewindow)){
					 //auch beschleunigen
				 	 systemaccellerate=true;
				     cbsp->checked=true;
					 if(game) game->markforupdateshadow(0);
				     cbfv->checked=true;
				     fastvideomode=true;
					 updatefullscreenhelp();
					 updatemenumain();
				     grafikmodus(0);
				    };
				   };
				  }else{
				   watchdogspeed->reset();
				  };
				 };
				};
				
};
void _solitairefantasy::clearscreen(){
				if(gra){
	            gra->aktivitaet(true);
                if(gra->szenebeginn()){
                 gra->validieren();
				 gra->allebufferloeschen();
			     gra->szeneende();
                };
                 // grafik->anzeigebufferumschalten();
                HRESULT hr=dynamic_cast<_grafikdirectx*>(gra)->pcontext->UpdateFrame(DDFLIP_NOVSYNC);
                if(hr==DDERR_SURFACELOST||hr==DDERR_SURFACEBUSY) hr = HandleModeChanges();
				};
};

void _solitairefantasy::drawstandard(){

	            gra->aktivitaet(true);
                if(gra->szenebeginn()){
                 gra->validieren();
				_to op10=windowstatistics->pfadeopacity;
				_to op0=windowranks->pfadeopacity;
				_to op1=windowoptionsacoustics->pfadeopacity;
				_to op2=windowoptionsgraphics->pfadeopacity;
				_to op3=windowoptionsgame->pfadeopacity;
				_to op4=windowoptionscard->pfadeopacity;
				_to op40=windowoptionscardfront->pfadeopacity;
				_to op5=windowoptionscredits->pfadeopacity;
				_to op6=windowgametype->pfadeopacity;
				_to op7=windowuser->pfadeopacity;
				_to op8=windowusercreate->pfadeopacity;
				_to op9=cardgeneratorwindow->pfadeopacity;
				
				blackscreenopacity=op0+op1+op2+op3+op4+op40+op5+op6+op7+op8+op9+op10;
				if((showedoptionscard==false)||(showedmenugametype==false)) blackscreenopacity=1;
				if(blackscreenopacity>1) blackscreenopacity=1;
				blackscreenopacity*=0.6;
				blackscreentransparency=1-blackscreenopacity;
				
				if(game&&(pgamefadein||pgamefadeout)){
				 //beides zeichnen
				 drawgame();
				 drawmenu(1-gameopacity);
				}else if(game==0){
				 //nur menu zeichnen
				 drawmenu();
				}else{
				 //spiel zeichnen
				 drawgame();
				};
				
				gra->orthonormal();		
				iggsystem->zeichnen(gra,cam);// **** schnell
				iggsystem->zeichnencursor(maus,gra,cam);
				/*drawblendscreen();
				drawpause();*/
				if(showfps){
				 //*********************+ FPS **************************
				 fpscount++;
				 _tg nt=clock->system();
				 _tg dt=nt-fpstimeold;
				 if(dt>1000){
				  fpstimeold=nt;
				  fpstext=int(_tg(fpscount)/(dt*0.001));
				  if(videosynchronisation) fpstext=L"FPS(s) = "+fpstext; else fpstext=L"FPS(a) = "+fpstext;
				  fpscount=0;
				 };
				 _vektor3<_tg> o(gra->groessex()/2,10,0);
				 _vektor4<_to> c(0,1,0,1);
				 zeichnenguitext(gra,fpstext,font30,o,c);
				};
				
				 //gra->anzeigebufferumschalten(videosynchronisation);
			     gra->szeneende();
                };
                 // grafik->anzeigebufferumschalten();
                HRESULT hr=dynamic_cast<_grafikdirectx*>(gra)->pcontext->UpdateFrame(DDFLIP_NOVSYNC);
                if(hr==DDERR_SURFACELOST||hr==DDERR_SURFACEBUSY) hr = HandleModeChanges();
};		
void _solitairefantasy::drawmenu(_to op){//**** 9ms ?
  				// Print "draw mm op=m"+op
				drawmenubackground(op);
				drawmenueffects(op);
};
void _solitairefantasy::drawmenubackground(_to op){
				gra->orthonormal();

				_to li=kamin->intensity();
				backgroundcolor.setzen(1,1,1,1);
				_vektor4<_to> c;
				_to ol=li;//(li*0.5)+0.5//need opacity of lighted images between 70 && 100%
				_to o0=1-ol;//*(1-li)
				_to o1=ol*li;
				if(op==1){
				 c=backgroundcolor*blackscreentransparency;
				 c.w(1);
				 gra->transparenz(false);
				 gra->rechteck(imenubackgroundl[0],0,0,gra->groessex(),gra->groessey(),c);	
				 if(systemaccellerate==false){
				  c=backgroundcolor*blackscreentransparency;
				  c.w(o0);
				  gra->transparenz(true);
				  gra->transparenzmultiplikativ();
				  gra->rechteck(imenubackgroundl[1],0,0,gra->groessex(),gra->groessey(),c);
				  gra->transparenz(false);
				 // if(o1>0){
				 //  SetAlpha(o1)
				 //  gra->rechteck(imenubackgroundl[2],0,0,gra->groessex(),gra->groessey())
				 // };
				 // SetBlend(SOLIDBLEND|ALPHABLEND)
				  c.setzen(1,1,1,1);
				  c*=blackscreentransparency;
				  c.w(1);
				  gra->transparenz(true);
				  gra->transparenzmultiplikativ();
				  gra->rechteck(ilogo,0,0,ilogo->groesse(0),ilogo->groesse(1),c);
				  gra->transparenz(false);
				 };
				 c.setzen(blackscreentransparency,blackscreentransparency,blackscreentransparency,li*0.5+0.5);
				 gra->transparenz(true);
				 gra->transparenzadditiv();
				 gra->rechteck(imenubackgroundglow,gra->groessex()*0.42,gra->groessey()*0.59,gra->groessex()*0.15722,gra->groessey()*0.0820,c);
  			     gra->transparenz(false);
				}else{
				 gra->transparenz(true);
				 gra->transparenzmultiplikativ();
				 c=backgroundcolor*blackscreentransparency;
				 c.w(op);
				 gra->rechteck(imenubackgroundl[0],0,0,gra->groessex(),gra->groessey(),c);	
  			     gra->transparenz(false);
				 if(systemaccellerate==false){
				  c=backgroundcolor*blackscreentransparency;
				  c.w(o0*op);
				  gra->transparenz(true);
				  gra->transparenzmultiplikativ();
				  gra->rechteck(imenubackgroundl[1],0,0,gra->groessex(),gra->groessey(),c);
				  gra->transparenz(false);
				  //if(o1>0){
				  // SetAlpha(o1*op)
				  // gra->rechteck(imenubackgroundl[2],0,0,gra->groessex(),gra->groessey())
				  //};
				  c.setzen(blackscreentransparency,blackscreentransparency,blackscreentransparency,op);
				  gra->transparenz(true);
				  gra->transparenzmultiplikativ();
				  gra->rechteck(ilogo,0,0,ilogo->groesse(0),ilogo->groesse(1),c);
				  gra->transparenz(false);
				 };
				 c.setzen(blackscreentransparency,blackscreentransparency,blackscreentransparency,(li*0.5+0.5)*op);
				 gra->transparenz(true);
				 gra->transparenzadditiv();
				 gra->rechteck(imenubackgroundglow,gra->groessex()*0.42,gra->groessey()*0.59,gra->groessex()*0.15722,gra->groessey()*0.0820,c);
				 gra->transparenz(false);
				};
};					
void _solitairefantasy::drawmenueffects(_to op){
				_tg gh=768;
				_tg gw=1024;
				_tg m=(gh+gh)*0.5;
				
				cam->setzen(0,6,-20);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				cam->vektor().setzen(0,0,2);
				cam->ebene(1).setzen(0,gh/m,0);
				cam->ebene(0).setzen(gw/m,0,0);	
				
				_vektor3<_tg> n;
				_vektor3<_tg> e;
				_tg wy=-6;
				_tg wx=-7;
				n.setzen(0,1,0);
				_vektoranalysis3<_tg> V;
				V.rotieren(n,cam->vektor(),wy,e);cam->vektor(e);
				V.rotieren(n,cam->ebene(0),wy,e);cam->ebene(0,e);//!!!!!!!!!!!!!!!!!!!!!!!!
				
				n.setzen(1,0,0);
				V.rotieren(n,cam->ebene(1),wx,e);cam->ebene(1,e);
				V.rotieren(n,cam->vektor(),wx,e);cam->vektor(e);
				V.rotieren(n,cam->ebene(0),wx,e);cam->ebene(0,e);
			//	gra.driver=D3D7GraphicsDriver()
			//	gra.device=gra.driver.Direct3DDevice7()
				
				world->transformierenglobal(gra,cam);
				
				if(uhr){			
				 uhr->opacity=op;
				 uhr->draw(gra,cam);
				};		
				drawmenufigure(op);
				if((gamemenu)&&(buttonstart->pfadeopacity>0)) drawgamemenu(op*op*op*op*op);
				_to li=kamin->intensity();
				_bild<_tb>*i=icandleholdermenu;
				gra->orthonormal();
				gra->transparenzmultiplikativ();
				_vektor4<_to> c;
				c.setzen(blackscreentransparency,blackscreentransparency,blackscreentransparency,1*op);
				_tg x=(_tg(520)/_tg(1920))*gra->groessex();
				_tg y=(_tg(959)/_tg(1440))*gra->groessey();
				_tg w=(_tg(i->groesse(0))/_tg(1920))*gra->groessex();
				_tg h=(_tg(i->groesse(1))/_tg(1440))*gra->groessey();
				gra->rechteck(i,x,y,w,h,c);
				
				world->transformierenglobal(gra,cam);
				_partikel*ait;
				if(particlemenulist.anfang(ait))do{//for(Local ait:_particle=EachIn particlemenulist
				 ait->zeichnen(gra);
				}while(particlemenulist.naechstes(ait));	
				
				_listenknoten<_candle>*cat;
				if(candlemenulist.anfang(cat))do{//for(Local cat:_candle=EachIn candlemenulist
				 cat->objekt()->opacity(op);
				 cat->objekt()->draw(gra,cam);
				}while(candlemenulist.naechstes(cat));			
				if(kamin){
				 kamin->opacity(op);
				}; 
};		
void _solitairefantasy::drawmenufigure(_to op){
	   			gra->orthonormal();
	   			_figuredrawentry*fit;
				if(figuredrawlist.anfang(fit))do{//for(Local fit:_figuredrawentry=EachIn figuredrawlist
				 fit->draw(gra,cam,op);
				}while(figuredrawlist.naechstes(fit));
				//------- erzeugen
				if(usermanagement->aktuell()){
				 if(usermanagement->aktuell()->bildindex()!=figureindexold){
				  figureindexold=usermanagement->aktuell()->bildindex();
				  if(figuredrawlist.anfang(fit))do{//for(Local fit:_figuredrawentry=EachIn figuredrawlist
				   fit->fadeout();
				  }while(figuredrawlist.naechstes(fit));
				  _figuredrawentry*fde;
				  if(usermanagement->aktuell()->bildindex()==0) fde=new _figuredrawentry(this,prinzessin);
				  if(usermanagement->aktuell()->bildindex()==1) fde=new _figuredrawentry(this,dame);
				  if(usermanagement->aktuell()->bildindex()==2) fde=new _figuredrawentry(this,ritter);
				  if(usermanagement->aktuell()->bildindex()==3) fde=new _figuredrawentry(this,zauberer);
				  if(usermanagement->aktuell()->bildindex()==4) fde=new _figuredrawentry(this,fee);
				  if(usermanagement->aktuell()->bildindex()==5) fde=new _figuredrawentry(this,drachen);
				  if(usermanagement->aktuell()->bildindex()==6) fde=new _figuredrawentry(this,koenig);
				  if(usermanagement->aktuell()->bildindex()==7) fde=new _figuredrawentry(this,lehrerin);
				 };
				}else{
				 if(figuredrawlist.anfang(fit))do{//for(Local fit:_figuredrawentry=EachIn figuredrawlist
				  fit->fadeout();
				 }while(figuredrawlist.naechstes(fit));
				 figureindexold=-1;
				};
				//------- loeschen
				if(figuredrawlist.anfang(fit))do{//for(Local fit:_figuredrawentry=EachIn figuredrawlist
				 if(fit->pfadeout){
				  if(fit->pfadeopacity==0){
				   fit->loeschmarkierung(true);
				  };
				 };
				}while(figuredrawlist.naechstes(fit));
				figuredrawlist.loeschenmarkiert();
};
void _solitairefantasy::drawgame(){
				_vektor3<_tg> o;
				_vektor4<_to> c;
				_zeichenkette<_tt> h;
				transformbackground();
				background->draw(gra,cam);
				//Local pit:_page
				transformscene();
				//gra->wrap(true);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				if(game){
				 //gsamtes zeichnen : 2.58 ms bei 1 deck , 4.35 ms bei 2 decks***************
				 game->drawpile(gra,cam);
				 game->drawlist.sortieren();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				//******************+  zusammen 12.2 ms ****************
				 if(systemaccellerate==false) drawgameshadowcurving(false,0.2,0.35);//gra->rechteck(isi,-15,-15,32,32)  7,6ms
				 game->drawpilecard(gra,cam);// ~ 5.3ms
				// if(systemaccellerate=false game->drawpilecardshadowneigung(gra,cam)	 
				 if(systemaccellerate==false) drawgameshadowcurving(true,0.2,0.35);
				 //*****************************************************
				 game->drawcard(gra,cam);
				 background->drawfront(gra,cam);
				 transformscene();
				 //gra->wrap(true);//!!!!!!!!!!!!!!!!
				 game->drawcurving(gra,cam);
				 //******************************************
				 //------------------------------------------- pile info zeichnen ----------------------------------
				 if((mouseoverpile)&&(menugame->active())&&(game->pileinfo)){
				  messagepileinfo(game->pileinfoname,game->pileinfodescription0,game->pileinfodescription1);
				 };				
				 _pileinfoentry*pit;
				 if(pileinfolist.anfang(pit))do{//or(Local pit:_pileinfoentry=EachIn pileinfolist
				  pit->draw(gra,cam);
				 }while(pileinfolist.naechstes(pit));
				 //------- loeschen
				 if(pileinfolist.anfang(pit))do{//for(Local pit:_pileinfoentry=EachIn pileinfolist
				  if(pit->pfadeout){
				   if(pit->pfadeopacity==0){
				    pit->loeschmarkierung(true);
				   };
				  };
				 }while(pileinfolist.naechstes(pit));
				 pileinfolist.loeschenmarkiert();
				 //------------------------------------- status bar zeichnen --------------------------------
				 _statusbarentry*sit;
				 if(statusbarlist.anfang(sit))do{//for(Local sit:_statusbarentry=EachIn statusbarlist
				  sit->draw(gra,cam);
				 }while(statusbarlist.naechstes(sit));
				 //------- loeschen
				 if(statusbarlist.anfang(sit))do{//for(Local sit:_statusbarentry=EachIn statusbarlist
				  if(sit->pfadeout){
				   if(sit->pfadeopacity==0){
				    sit->loeschmarkierung(true);
				   };
				  };
				 }while(statusbarlist.naechstes(sit));
				 statusbarlist.loeschenmarkiert();
				};
				gra->transparenz(false);
				//world->zeichnen(gra,cam);!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				transformscene();
				gra->transparenzadditiv();
				_listenknoten<_candle>*cat;
				if(candlegamelist.anfang(cat))do{//for(Local cat:_candle=EachIn candlegamelist
				 if((cat->objekt()->sparked==false)||(sparkingmouse==false)) cat->objekt()->draw(gra,cam);
				}while(candlegamelist.naechstes(cat));
				//transformscene();
				_partikel*ait;
				if(particlegamelist.anfang(ait))do{//for(Local ait:_particle=EachIn particlegamelist
				 ait->zeichnenschatten(gra);
				}while(particlegamelist.naechstes(ait));
				if(candlegamelist.anfang(cat))do{//for(Local cat:_candle=EachIn candlegamelist
				 if((cat->objekt()->sparked==true)&&(sparkingmouse==true)) cat->objekt()->draw(gra,cam);
				}while(candlegamelist.naechstes(cat));
				if(particlegamelist.anfang(ait))do{//for(Local ait:_particle=EachIn particlegamelist
				 ait->zeichnen(gra);
				}while(candlegamelist.naechstes(cat));
				if(game->ended){
				 gra->orthonormal();
				 _vektor3<_tg> o;
				 _vektor4<_to> c;
				 _zeichenkette<_tt> h;
				 h=strgratulation;
				 o.setzen(gra->groessex()/2-font30->breite(h)/2,gra->groessey()/2-font30->hoehe(h)/2-100,2);
				 c.setzen(1,0.8,0.2,1);
				 zeichnenguitext(gra,h,font30,o,c);
				 world->transformierenglobal(gra,cam);	
				};
};
void _solitairefantasy::transformbackground(){
				//cam.position.setzen(0,0,-1)
				//cam.view.setzen(0,0,1)
				//cam.up.setzen(0,1,0)
				//cam.side.setzen(1,0,0)				
				//world.transform(gra,cam)	
				cam->setzen(0,-2,-33);
				cam->vektor().setzen(0,0,2);
				cam->ebene(1,_vektor3<_tg>(0,0.9,0));
				//cam->ebene(1).normalisieren();
				cam->ebene(1,_vektor3<_tg>(1.1,0,0));
				world->transformierenglobal(gra,cam);				
};
void _solitairefantasy::transformbackgroundcandle(){
				cam->setzen(0,-4,-33);
				cam->vektor().setzen(0,0.18,1.8);
				cam->ebene(1,_vektor3<_tg>(0,0.8,-0.1));
				//cam->ebene(1).normalisieren();
				cam->ebene(0,_vektor3<_tg>(1.1,0,0));
				world->transformierenglobal(gra,cam);				
};				
void _solitairefantasy::transformscene(){
				cam->setzen(0,-2,-33);
				cam->vektor(_vektor3<_tg>(0,0,1.8));
				//cam.up.setzen(0,0.5, (-cam.view.y/cam.view.z)*0.5)
				//cam.up.norm()
				//cam.up.mul(0.8)
				cam->ebene(1,_vektor3<_tg>(0,0.8,0));
				cam->ebene(0,_vektor3<_tg>(1.1,0,0));
				cam->vektor().rotx(-5.5);
				cam->ebene(1).rotx(-5.5);
				world->transformierenglobal(gra,cam);
};
void _solitairefantasy::getmousevectorstatic(){
				transformscene();
				getmousevector(gra,cam);
};						
void _solitairefantasy::transformgame(){
	  			if(game){
	  				
	 			 _vektor3<_tg> h;
				 h=game->translationglobal*-1;
	 			 game->translate(h);
	 			 game->scale(_tg(1)/game->scaleglobal);
				 
				 _tg r[2][2];
				 r[0][0]=-13.2;
				 r[0][1]=-12.5;
				 r[1][0]=18.5;
				 r[1][1]=10;
				 _tg smx=(r[0][0]+r[1][0])*0.5;
				 _tg smy=(r[0][1]+r[1][1])*0.5;
				 _tg sdx=fabs(r[1][0]-r[0][0]);
				 _tg sdy=fabs(r[1][1]-r[0][1]);
				
				 _tg gmx=(game->rectangle[1].x()+game->rectangle[0].x())*0.5;
				 _tg gmy=(game->rectangle[1].y()+game->rectangle[0].y())*0.5;
				 _tg gdx=fabs(game->rectangle[1].x()-game->rectangle[0].x());
				 _tg gdy=fabs(game->rectangle[1].y()-game->rectangle[0].y());
				 
				 _vektor3<_tg> ds(smx,smy,0);
				 _vektor3<_tg> dn(-gmx,-gmy,0);
				 game->translate(dn);
				
				 _tg dx=gdx/sdx;
				 _tg dy=gdy/sdy;
				 _tg f;
				
				 if(dx>dy){
				  f=sdx/gdx;
				  //Print "dx="+dx
				  //Print "sdx="+sdx
				  //Print "gdx="+gdx
				  //Print "game->rectangle[1].x="+game->rectangle[1].x+"   game->rectangle[0].x="+game->rectangle[0].x
				 }else{
				  //Print "dy"
				  f=sdy/gdy;
				 };
				 //Print "f="+f
				 game->scale(f);
				 game->translate(ds);
				};
};
void _solitairefantasy::updatescene(){
				//world.lightlist.clear()
				//Local l:TList=CreateList()
				//for(Local lit:_light=EachIn world.lightlist
				// if(lit.noshadow=false l.einhaengen(lit)
				//};
				//for(Local lit:_light=EachIn l
				// lit.deinsert()
				//};		
				//l.clear()		
				//iggsystem->background[0].clear()//image=imenubackground[currentscene]		
				//iggsystem->background[0].einhaengen(imenubackground[currentscene])
				currentscene=0;
				//if(currentscene=0//sonne
				// sceneambient[0].setzen(0.53,0.4,0.2)
				// scenediffuse[0].setzen(1,0.9,0.28)
				 //Local ll:_light=new _light
				 //ll.init(world,-30,30,-60,0,0,0,9000)						
				 //ll.color.copy(scenediffuse[0])
				 if(game) game->sigmadiffuse(cardlighting);
				//};
				/*
				if(currentscene=1//biene
				 sceneambient[1].setzen(0.5,0.45,0.3)
				 scenediffuse[1].setzen(1,0.89,0.7)
				 Local l:_light=new _light
				 l.init(world,-50,50,-40,0,0,0,85000)						
				 l.color.copy(scenediffuse[currentscene])
				 if(game game->sigmadiffuse(0.27)
				};
				if(currentscene=2//frühling
				 sceneambient[2].setzen(0.7,0.7,0.7)
				 scenediffuse[2].setzen(1,0.9,0.5)
				 Local l:_light=new _light
				 l.init(world,30,30,-40,0,0,0,10000)						
				 l.color.copy(scenediffuse[2])
				 if(game game->sigmadiffuse(0.3)
				};
				if(currentscene=3//grasend
				 sceneambient[3].setzen(0.4,0.4,0.4)
				 scenediffuse[3].setzen(1,1,0.8)
				 Local l:_light=new _light
				 l.init(world,20,20,-50,0,0,0,10000)						
				 l.color.copy(scenediffuse[currentscene])
				 if(game game->sigmadiffuse(0.2)
				};
				if(currentscene=4//muehle
				 sceneambient[4].setzen(0.3,0.4,0.6)
				 scenediffuse[4].setzen(0.77,1,0.97)
				 Local l:_light=new _light
				 l.init(world,-50,-50,-100,0,0,0,50000)						
				 l.color.copy(scenediffuse[4])
				 if(game game->sigmadiffuse(0.3)
				};
				if(currentscene=5//berge
				 sceneambient[5].setzen(0.3,0.3,0.3)
				 scenediffuse[5].setzen(0.85,1,0.97)
				 Local l:_light=new _light
				 l.init(world,-50,30,-100,0,0,0,50000)						
				 l.color.copy(scenediffuse[5])
				 if(game game->sigmadiffuse(0.3)
				};
				if(currentscene=6//mond
				 sceneambient[6].setzen(0.1,0.1,0.1)
				 scenediffuse[6].setzen(1,1,1)
				 Local l:_light=new _light
				 l.init(world,-40,40,-120,0,0,0,60000)						
				 l.color.copy(scenediffuse[6])
				 if(game game->sigmadiffuse(0.3)
				};
				*/
				//world.lightambient.copy(sceneambient[currentscene])
				if(game) game->createshadow();
};					
_zeichenkette<char> _solitairefantasy::usernamendialog(_tg ox,_tg oy){
                return("");
};
//******************************************************************************************************************
//										S U P P L Y 
//******************************************************************************************************************
void _solitairefantasy::buttoninitmagic(_iggbutton*g,_zeichensatz*f,_bild<_tb>*bs,_bild<_tb>*bsh,_bild<_tb>*bl,_bild<_tb>*blh){
				_vektor4<_to> v(0.9,0.65,0.4,1);
				g->centrictext=true;
				g->font=font18;
				g->background[0].einhaengen(ibuttonu);
				g->background[0].einhaengen(ibuttons);				
				g->background[0].einhaengen(ibuttonm);
				g->background[0].einhaengen(ibuttonl);
				g->background[0].einhaengen(ibuttong);
				g->background[1].einhaengen(ibuttonuhl);
				g->background[1].einhaengen(ibuttonshl);
				g->background[1].einhaengen(ibuttonmhl);
				g->background[1].einhaengen(ibuttonlhl);
				g->background[1].einhaengen(ibuttonghl);
				g->background[2].einhaengen(ibuttonuson);
				g->background[2].einhaengen(ibuttonsson);
				g->background[2].einhaengen(ibuttonmson);
				g->background[2].einhaengen(ibuttonlson);
				g->background[2].einhaengen(ibuttongson);
				g->shadowimage[0].einhaengen(ibuttonshadow);
				g->shadowimage[1].einhaengen(ibuttonshadowon);
				g->shadowimage[2].einhaengen(ibuttonshadowson);
				g->shadowimageboardening=(g->breite()/_tg(128))*7;
				g->settextcolor(v);
				g->color.setzen(1,1,1,1);
				g->colortransformed=g->color;
				g->textcolormark.setzen(0.05,0.2,0.3,0);
				g->textcoloractive.setzen(0.1,0.4,0.6,0);					
				g->setshadow(7,7,0.6);
};
void _solitairefantasy::buttoninitmagicleft(_iggbutton*g){
				_vektor4<_to> v(0.1,0.2,0.3,1);
				g->centrictext=true;
				g->background[0].einhaengen(ibuttonarrowloff);
				g->background[1].einhaengen(ibuttonarrowlon);
				g->background[2].einhaengen(ibuttonarrowlon);
				g->settextcolor(v);
				v.setzen(1,1,1,1);
				g->color=v;
				g->colortransformed=v;
				g->setshadow(7,7,0.4);
				g->font=font24;
};
void _solitairefantasy::buttoninitmagicright(_iggbutton*g){
				_vektor4<_to> v(0.1,0.2,0.3,1);
				g->centrictext=true;
				g->background[0].einhaengen(ibuttonarrowroff);
				g->background[1].einhaengen(ibuttonarrowron);
				g->background[2].einhaengen(ibuttonarrowron);
				g->settextcolor(v);
				v.setzen(1,1,1,1);
				g->color=v;
				g->colortransformed=v;
				g->setshadow(7,7,0.4);
				g->font=font24;
};
void _solitairefantasy::checkboxinitmagic(_iggcheckbox*g){
				g->background[0].einhaengen(icheckbox);
				g->background[1].einhaengen(icheckboxhl);
				g->background[2].einhaengen(icheckboxhl);
				g->setcheckimage(icheck);
				g->checkimagebreite=g->breite();
				g->checkimagehoehe=g->hoehe();
				g->checkposition.x(0);
				g->checkposition.y(0);
				g->setshadow(3,3,0.4);
};
void _solitairefantasy::trackbarinitmagic(_iggtrackbar*g){
				g->background[0].einhaengen(itrackbar);
				g->background[1].einhaengen(itrackbar);
				g->background[2].einhaengen(itrackbar);
				g->sliderimage=itrackbarbutton;
				g->displaymultiplier=100;
				g->displayaddition=L" %";
				g->displayrounding=true;			
				g->shadow=false;
};
void _solitairefantasy::listboxinitmagic(_igglistbox*g){
				g->clearbackground();
				g->color.setzen(1,1,1,1);
				g->frameimagehorizontal=iscrollbarhorizontal;
				_iggscrollbarvertical*sh=g->scrollbarvertical;
				sh->barimage=iscrollbar;
				sh->barimagebreite=6;
				sh->sliderimage=iscrollbarbutton;
				sh->buttonup->background[0].einhaengen(ilistboxbuttonup);
				sh->buttonup->background[1].einhaengen(ilistboxbuttonup);
				sh->buttonup->background[2].einhaengen(ilistboxbuttonup);
				sh->buttondown->background[0].einhaengen(ilistboxbuttondown);
				sh->buttondown->background[1].einhaengen(ilistboxbuttondown);
				sh->buttondown->background[2].einhaengen(ilistboxbuttondown);
				sh->buttonup->size.setzen(20,20,0);
				sh->buttondown->size.setzen(20,20,0);
				g->scrollstepwheel=20;
				sh->scrollstepbutton=4;
				sh->scrollstepbar=(g->hoehe()-16)-20;
				sh->scrollbuttonsmooth=true;
				sh->barsmooth=false;
				sh->setshadow(3,3,0.4);			
				sh->buttonup->setshadow(3,3,0.4);
				sh->buttondown->setshadow(3,3,0.4);
				g->scrollfriction=0.0;
				g->shadow=false;
			    g->drawframe=true;
};
void _solitairefantasy::windowinitmagic(_iggwindow*w,_bild<_tb>*i){
				w->background[0].einhaengen(i);
				w->background[1].einhaengen(i);
				w->background[2].einhaengen(i);
};				
void _solitairefantasy::comboboxinitmagic(_iggcombobox*g){
				_vektor4<_to> v(0.0,0.0,0.0,1);
				g->background[0].einhaengen(ibuttonu);
				g->background[0].einhaengen(ibuttons);
				g->background[0].einhaengen(ibuttonm);
				g->background[0].einhaengen(ibuttonl);
				g->background[1].einhaengen(ibuttonuhl);
				g->background[1].einhaengen(ibuttonshl);
				g->background[1].einhaengen(ibuttonmhl);
				g->background[1].einhaengen(ibuttonlhl);
				g->background[2].einhaengen(ibuttonuhl);
				g->background[2].einhaengen(ibuttonshl);
				g->background[2].einhaengen(ibuttonmhl);
				g->background[2].einhaengen(ibuttonlhl);
				v.setzen(1,1,1,1);
				g->color=v;
				g->colortransformed=v;
				listboxinitmagic(g->listbox);
				g->listbox->frameimage=ilistboxwindow;
				//g->listbox.position.setz(g->position.getz()-3)
				g->listbox->setshadow(7,7,0.4);
				buttoninitmagic(g->button);
				g->button->centrictext=true;
				g->button->clearbackground();
			    g->button->background[0].einhaengen(ibuttonu);
				g->button->background[1].einhaengen(ibuttonuhl);
				g->button->background[2].einhaengen(ibuttonuhl);
								//if(f=0 g->font=font18 }else{ g->font=f
				g->text->color.setzen(1,0.8,0.5,1);
				g->text->colortransformed.setzen(1,0.8,0.5,1);
};					
void _solitairefantasy::guihelpinitmagic(_igg*g){
				_igg*gh=g->hilfe;
				if(gh){
				 _iggwindow*gw=dynamic_cast<_iggwindow*>(gh);
				 if(gw){
				  guihelpinitmagicy=0;
				  guihelpinitmagicw=gw;
				  guihelpinitmagicwindow();
				 };
				};
};				
void _solitairefantasy::guihelpinitmagicwindow(){
				//Print "GUI HELP INIT Wndow 0 y="+y
				_tg d0=fabs((guihelpinitmagicw->breite()/guihelpinitmagicw->hoehe())-(_tg(512)/_tg(180-50)));
				_tg d1=fabs((guihelpinitmagicw->breite()/guihelpinitmagicw->hoehe())-(_tg(512)/_tg(111-40)));
				_tg d2=fabs((guihelpinitmagicw->breite()/guihelpinitmagicw->hoehe())-(_tg(512)/_tg(80 -30)));
				_tg d3=fabs((guihelpinitmagicw->breite()/guihelpinitmagicw->hoehe())-(_tg(300)/_tg(180-50)));
				if((d0<=d1)&&(d0<=d2)&&(d0<=d3)){
				 guihelpinitmagicw->background[0].einhaengen(iguihelp512180);
				 guihelpinitmagicw->background[1].einhaengen(iguihelp512180);
				 guihelpinitmagicw->background[2].einhaengen(iguihelp512180);	
				 guihelpinitmagicw->size.x(guihelpinitmagicw->breite()+30);
				 guihelpinitmagicw->size.y(guihelpinitmagicw->hoehe()+30);
			    }else if((d1<=d0)&&(d1<=d2)&&(d1<=d3)){
				 guihelpinitmagicw->background[0].einhaengen(iguihelp512111);
				 guihelpinitmagicw->background[1].einhaengen(iguihelp512111);
				 guihelpinitmagicw->background[2].einhaengen(iguihelp512111);				
				 guihelpinitmagicw->size.x(guihelpinitmagicw->breite()+25);
				 guihelpinitmagicw->size.y(guihelpinitmagicw->hoehe()+25);							
				}else if((d2<=d0)&&(d2<=d1)&&(d2<=d3)){
				 guihelpinitmagicw->background[0].einhaengen(iguihelp51280);
				 guihelpinitmagicw->background[1].einhaengen(iguihelp51280);
				 guihelpinitmagicw->background[2].einhaengen(iguihelp51280);				
				 guihelpinitmagicw->size.x(guihelpinitmagicw->breite()+20);
				 guihelpinitmagicw->size.y(guihelpinitmagicw->hoehe()+20);
				}else if((d3<=d0)&&(d3<=d1)&&(d3<=d2)){
				 guihelpinitmagicw->background[0].einhaengen(iguihelp300180);
				 guihelpinitmagicw->background[1].einhaengen(iguihelp300180);
				 guihelpinitmagicw->background[2].einhaengen(iguihelp300180);				
				 guihelpinitmagicw->size.x(guihelpinitmagicw->breite()+27);
				 guihelpinitmagicw->size.y(guihelpinitmagicw->hoehe()+27);
				};
				guihelpinitmagicw->position.y(guihelpinitmagicy);
				guihelpinitmagicw->color.setzen(1,1,1,1);
				guihelpinitmagicw->colortransformed=guihelpinitmagicw->color;
				guihelpinitmagicw->fadetarget(1);
				guihelpinitmagicw->setshadow(10,10);
				guihelpinitmagicw->animieren(maus,tastatur);
				_iggwindow*gwl=guihelpinitmagicw;
				_igg*git;
				if(gwl->anfang(git))do{//for(Local git:_gui=EachIn gwl.childlist
				 _iggwindow*gwi=dynamic_cast<_iggwindow*>(git);
				 if(gwi){
				  guihelpinitmagicy+=guihelpinitmagicw->hoehe();
				  guihelpinitmagicw=gwi;
				  guihelpinitmagicwindow();
				 }else{  
				  git->position.x(git->position.x()+10);
				  git->position.y(git->position.y()+10);
				 };
				}while(gwl->naechstes(git));
};
//******************************************************************************************************************
//										M A I N M E N U 
//******************************************************************************************************************
void _solitairefantasy::createmenumain(){
				menumain=menuman->createmenu();
				_iggbutton*kit;
				_tg bw=buttonwidth;
				_tg bh=buttonheight-4;
				_tg y=100;
				_tg x=850;
				_tg off=10;
				_iggwindow*wii;
				_iggtext*tit;

				tmmcurgame=new _iggtext(iggsystem,0,-50,2,L"hu",1,0.95,0.6,font30);
				tmmcurgame->position.addieren(0.5,1,0,true);
				tmmcurgame->zentriert();
				menumain->add(tmmcurgame);
				
				y=10;
				x=-226-5;
				_tg wnx=iggsystem->breite();
				_tg wny=iggsystem->hoehe();
				//Local k:_guivectorkondition;
				buttonstart=new _iggbutton(iggsystem,0,0,226,68,strplay,0);
				buttonstart->position.setzen(1,0,0,true);
				buttonstart->position.addieren(x/wnx,y/wny,0,true);
				buttonstart->position.kondition(500,1023,400,767,  0.2,0.15,-1,true);
				buttonstart->size.kondition(500,1023,400,767,   160,50,1,false);
				buttonstart->dynamischgroesse(wnx,wny);
				buttoninitmagic(buttonstart);
				buttonstart->fontliste.einhaengen(font18);
				buttonstart->fontliste.einhaengen(font24);
				buttonstart->fontliste.einhaengen(font30);
				buttonstart->benutzenfontliste=true;
				menumain->add(buttonstart); 
				y+=off+bh;

				buttonmenumaingametype=new _iggbutton(iggsystem,0,0,226,68,strgametype,font24,2);
				buttonmenumaingametype->position.setzen(1,0,0,true);
				buttonmenumaingametype->position.addieren(x/wnx,y/wny,0,true);
				buttonmenumaingametype->position.kondition(500,1023,400,767,  0.4,0.15,-1,true);
				buttonmenumaingametype->size.kondition(500,1023,400,767,   160,50,1,false);
				buttonmenumaingametype->dynamischgroesse(wnx,wny);
				buttoninitmagic(buttonmenumaingametype);
				buttonmenumaingametype->fontliste.einhaengen(font18);
				buttonmenumaingametype->fontliste.einhaengen(font24);
				buttonmenumaingametype->fontliste.einhaengen(font30);
				buttonmenumaingametype->benutzenfontliste=true;
				menumain->add(buttonmenumaingametype);
				y+=off+bh;
				
				buttonmenumainoptions=new _iggbutton(iggsystem,0,0,226,72-4,stroptions,font24,-1);
				buttonmenumainoptions->position.setzen(1,0,0,true);
				buttonmenumainoptions->position.addieren(x/wnx,y/wny,0,true);
				buttonmenumainoptions->position.kondition(500,1023,400,767,  0.6,0.15,-1,true);
				buttonmenumainoptions->size.kondition(500,1023,400,767,   160,50,1,false);
				buttonmenumainoptions->dynamischgroesse(wnx,wny);
				buttoninitmagic(buttonmenumainoptions);
				buttonmenumainoptions->fontliste.einhaengen(font18);
				buttonmenumainoptions->fontliste.einhaengen(font24);
				buttonmenumainoptions->fontliste.einhaengen(font30);
				buttonmenumainoptions->benutzenfontliste=true;
				menumain->add(buttonmenumainoptions);
				y+=off+bh;
				
				buttonmenumainclose=new _iggbutton(iggsystem,0,0,226,72-4,strclose,font24,-1);
				buttonmenumainclose->position.setzen(1,0,0,true);
				buttonmenumainclose->position.addieren(x/wnx,y/wny,0,true);
				buttonmenumainclose->position.kondition(500,1023,400,767,  0.8,0.15,-1,true);
				buttonmenumainclose->size.kondition(500,1023,400,767,   160,50,1,false);
				buttonmenumainclose->dynamischgroesse(wnx,wny);
				buttoninitmagic(buttonmenumainclose);
				buttonmenumainclose->fontliste.einhaengen(font18);
				buttonmenumainclose->fontliste.einhaengen(font24);
				buttonmenumainclose->fontliste.einhaengen(font30);
				buttonmenumainclose->benutzenfontliste=true;
				menumain->add(buttonmenumainclose);
				y+=off+bh;

				buttonmenumainplayer=new _iggbutton(iggsystem,10,-75,219,60,strchangeplayer,font24,-1);
				buttonmenumainplayer->position.setzen(10/wnx,-75/wny,0,true);
				buttonmenumainplayer->position.addieren(0,1,0,true);
				buttonmenumainplayer->size.setzen(_tg(226)/wnx,_tg(68)/wny,0,true);
				buttoninitmagic(buttonmenumainplayer);
				buttonmenumainplayer->fontliste.einhaengen(font18);
				buttonmenumainplayer->fontliste.einhaengen(font24);
				buttonmenumainplayer->fontliste.einhaengen(font30);
				buttonmenumainplayer->benutzenfontliste=true;
				menumain->add(buttonmenumainplayer);

				textmenumainplayer=new _iggtext(iggsystem,123,-100,1,strwelcome+L" ",1,0.8,0.5,font24,-1);
				textmenumainplayer->position.setzen(123/wnx,-100/wny,0,true);
				textmenumainplayer->position.addieren(0,1,0,true);
				textmenumainplayer->position.addieren(0,0,0,false);
				textmenumainplayer->zentriert();
				menumain->add(textmenumainplayer);

				windowhighscore=new _iggwindow(iggsystem,0,0,226,235+16,1,1,1);
				windowhighscore->position.setzen(1,1,0,true);
				windowhighscore->position.addieren(-224,-210-230-16,0);
				windowinitmagic(windowhighscore,ihighscorewindow);
				menumain->add(windowhighscore);
				
				_zeichenkette<_tt> hh;
				_iggtext*gth=new _iggtext(windowhighscore,windowhighscore->breite()/2-5,32,1,strhighscore,1,0.85,0.6,font24);
				gth->zentriert();
				
				y=50+10;
				for(unsigned int i=0;i<5;i++){
				 _tg f=1-_tg(i)/_tg(4);
				 textmenumainhighscorename[i]=new _iggtext(windowhighscore,10,y,1,L"hu",1,0.5+0.3*f,0.2+0.2*f,font18);
				 textmenumainhighscorepoints[i]=new _iggtext(windowhighscore,100,y,1,L"hu",1,0.5+0.3*f,0.2+0.2*f,font18);
				 textmenumainhighscorepoints[i]->zentriert();
				 textmenumainhighscoretime[i]=new _iggtext(windowhighscore,200,y,1,L"hu",1,0.5+0.3*f,0.2+0.2*f,font18);
				 textmenumainhighscoretime[i]->rechtsbuendig();
				 y+=20;
				};
				//y+=10
				buttonmenumainhighscoreclear=new _iggbutton(windowhighscore,50-5,162,windowhighscore->breite()-100,40,strdelete,font24,-1);
				buttonmenumainhighscoreclear->setshadow(5,5,0.35);
				buttoninitmagic(buttonmenumainhighscoreclear);
				
				windowstatisticsshort=new _iggwindow(iggsystem,0,0,226,215,1,1,1);
				windowstatisticsshort->position.setzen(1,1,0,true);
				windowstatisticsshort->position.addieren(-224,-210,0);
				windowinitmagic(windowstatisticsshort,ihighscorewindow);
				menumain->add(windowstatisticsshort);

				gth=new _iggtext(windowstatisticsshort,windowstatisticsshort->breite()/2-5,28,1,strstatistics,1,0.85,0.6,font24);gth->zentriert();
				
				hh=L" ";
				textstatisticsshortplayer=new _iggtext(windowstatisticsshort,windowstatisticsshort->breite()/2,29+35,1,hh,1,0.8,0.4,font18);textstatisticsshortplayer->zentriert();
				textstatisticsshortcount=new _iggtext(windowstatisticsshort,windowstatisticsshort->breite()/2,29+55,1,hh,1,0.8,0.4,font18);textstatisticsshortcount->zentriert();
				textstatisticsshortquote=new _iggtext(windowstatisticsshort,windowstatisticsshort->breite()/2,29+75,1,hh,1,0.8,0.4,font18);textstatisticsshortquote->zentriert();

				buttonmenumainstatistics=new _iggbutton(windowstatisticsshort,50-5,windowstatisticsshort->hoehe()-80,windowstatisticsshort->breite()-100,40,strdetails,font24,-1);
				buttoninitmagic(buttonmenumainstatistics);
				buttonmenumainstatistics->setshadow(5,5,0.35);
				
				if(brandingstufe==2){
				 _iggimage*gi=new _iggimage(iggsystem,10,0,ilogosurricate->groesse(0),ilogosurricate->groesse(1),ilogosurricate,1,1,1);
				 gi->position.addieren(0,-140/wny,0,true);
				 gi->position.addieren(0,1,0,true);
				 gi->position.addieren(0,-int(ilogosurricate->groesse(1)+10+ilogoportal->groesse(1)),0,false);
				 gi->selectable=false;
				 menumain->add(gi);

				 gi=new _iggimage(iggsystem,10,0,ilogoportal->groesse(0),ilogoportal->groesse(1),ilogoportal,1,1,1);
				 gi->position.addieren(0,-140/wny,0,true);
				 gi->position.addieren(0,1,0,true);
				 gi->position.addieren(0,-int(ilogoportal->groesse(1)),0,false);
				 gi->selectable=false;
				 menumain->add(gi);
				};
				updatemenumain();
				menumain->visibility(false);
				menumain->activity(false);
				menumain->fadeopacity(0);
				menumain->fadein();
				menumain->fadetarget(menuopacity);
};
void _solitairefantasy::updatemenumain(){
				//update class&time display
				//tmmcurgame->position.x(-font30->breite(gametype[currentgame].name)/2);
				tmmcurgame->setzen(gametype[currentgame].name);
				_zeichenkette<_tt> h;
				if(game){
				 if(game->inuse){
				  h=timemstohhmmss(game->time);
				 }else{
				  h=strnotbegun;
				 };
			 	};
			    if(usermanagement->aktuell()){
			     if(gra->groessex()>1400) textmenumainplayer->zeichensatz(font30); else textmenumainplayer->zeichensatz(font24);
			     h=strwelcome+L" "+usermanagement->aktuell()->name();
				 textmenumainplayer->setzen(h);
			     h=usermanagement->aktuell()->name();
				 textstatisticsshortplayer->setzen(h);
			     h=strcount+L" "+gamestats[currentgame]->countuser(usermanagement->aktuell()->name());
				 textstatisticsshortcount->setzen(h);
			     if(gamestats[currentgame]->countuser(usermanagement->aktuell()->name())>0){
			      h=strquote+L" "+int(gamestats[currentgame]->quoteuser(usermanagement->aktuell()->name())*100)+L"%";
			     }else{
			      h=L"";
			     };
				 textstatisticsshortquote->setzen(h);
				 //textstatisticsshortquote->position.x(226/2-textstatisticsshortquote->font->breite(h)/2);
				 //textmenumainplayer->position.setzen(2,-textmenumainplayer->font->breite(h)/2,0,0,false);
				 //textstatisticsshortplayer->position.x(226/2-textstatisticsshortplayer->font->breite(h)/2);
				 //textstatisticsshortcount->position.x(226/2-textstatisticsshortcount->font->breite(h)/2);
				}else{
				 textmenumainplayer->setzen(L"");
				 textstatisticsshortplayer->setzen(L"");
				 textstatisticsshortcount->setzen(L"");
				 textstatisticsshortquote->setzen(L"");
				};
				
				_zeichenkette<_tt> hhh;
				_gamestatsentry*it;
				gamestats[currentgame]->highscorelist.anfang(it);
				for(unsigned int i=0;i<5;i++){
				 if(it){
				  textmenumainhighscorename[i]->setzen(it->user);
				  hhh=int(it->score());
				  textmenumainhighscorepoints[i]->setzen(hhh);
				  textmenumainhighscoretime[i]->setzen(timemstohhmmss(it->time));
				  //textmenumainhighscorename[i]->position.x(windowhighscore->width()/2-5-15-textmenumainhighscorename[i]->font->breite(hhh));
				  //textmenumainhighscorepoints[i]->position.x(windowhighscore->width()/2-5-textmenumainhighscorepoints[i]->font->breite(hhh)/2);
				  //textmenumainhighscoretime[i]->position.x(windowhighscore->width()/2+10);
				  it=it->naechstes();
				  if(it==gamestats[currentgame]->highscorelist.erstes()) it=0;
				 }else{
				  h=(i+1)+strranknotset;
				  textmenumainhighscorename[i]->setzen(L"");
				  textmenumainhighscorepoints[i]->setzen(h);
				  textmenumainhighscoretime[i]->setzen(L"");
				  //textmenumainhighscorename[i]->position.x(windowhighscore->width()/2-5-15);
				  //textmenumainhighscorepoints[i]->position.x(windowhighscore->width()/2-5-textmenumainhighscorepoints[i]->font->breite(h)/2);
				  //textmenumainhighscoretime[i]->position.x(windowhighscore->width()/2+10);
				 };
				};
};
//******************************************************************************************************************
//										U S E R  M E N U 
//******************************************************************************************************************				
void _solitairefantasy::createmenuuser(){
				_to tr=0.99,tg=0.7,tb=0.27;
				_tg wx=512;
				_tg wy=723;
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg y=100;
				_tg x=650;
				_tg off=20;
				_iggcheckbox*cbt;
				menuuser=menuman->createmenu();
				windowuser=new _iggwindow(iggsystem,int(-wx/2),int(-wy/2),wx,wy,1,1,1);
				windowuser->position.addieren(0.5,0.5,0,true);
				windowuser->position.kondition(500,1023,400,767,280,3,-1,false);
				windowuser->size.kondition(500,1023,400,767,wx,600,1,false);
				windowuser->setshadow(10,10);
				windowinitmagic(windowuser,iguiwindow);
				menuuser->add(windowuser);
				
				buttonusermainmenu=new _iggbutton(iggsystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,font24,11);
				buttonusermainmenu->position.addieren(0.5,0.5,0,true);
				buttonusermainmenu->position.kondition(500,1023,400,767, 20,10,-1,false);
				buttoninitmagic(buttonusermainmenu);
				menuuser->add(buttonusermainmenu);
								
				windowusertitle=new _iggtext(windowuser,(wx/2),50,1,strplayer,1,0.8,0.5,font30);windowusertitle->zentriert();
				
				windowuserlist=new _igglistbox(windowuser,65,90,370,520,8,1,1,1);
				windowuserlist->size.kondition(500,1023,400,767,  370,420,1,false);
				listboxinitmagic(windowuserlist);
				updatelistboxuser(windowuserlist,false);
				updatelistboxuserselection();
				windowuserlist->selectionrect=true;
				windowuserlist->moverrect=true;
				
				y=0;
				buttonusercreate=new _iggbutton(iggsystem,+wx/2+20,-wy/2+y,bw,bh,strcreate,font24,33);
				buttonusercreate->position.addieren(0.5,0.5,0,true);
				buttonusercreate->position.kondition(500,1023,400,767, 20,330+y,-1,false);
				buttoninitmagic(buttonusercreate);
				menuuser->add(buttonusercreate);
				y+=bh+off;

				buttonuseredit=new _iggbutton(iggsystem,+wx/2+20,-wy/2+y,bw,bh,stredit,font24,33);
				buttonuseredit->position.addieren(0.5,0.5,0,true);
				buttonuseredit->position.kondition(500,1023,400,767, 20,330+y,-1,false);
				buttoninitmagic(buttonuseredit);
				menuuser->add(buttonuseredit);
				y+=bh+off;

				buttonuserdelete=new _iggbutton(iggsystem,+wx/2+20,-wy/2+y,bw,bh,strdelete,font24,33);
				buttonuserdelete->position.addieren(0.5,0.5,0,true);
				buttonuserdelete->position.kondition(500,1023,400,767, 20,330+y,-1,false);
				buttoninitmagic(buttonuserdelete);
				menuuser->add(buttonuserdelete);
				y+=bh+off;

				menuuser->visibility(false);
				menuuser->activity(false);
				menuuser->fadetarget(menuopacity2);
				menuuser->fadeopacity(0);
};
void _solitairefantasy::updatelistboxuser(_igglistbox*ul,bool smallbild){
				ul->loeschen();
				ul->selection=0;
				_tg yit=20;
				int i=0;
				_tg yo;
				_tg xo;
				_tg wx;
				_tg wy;
				_tg xx;
				if(smallbild){
				 yo=90;
				 wx=80;
				 wy=80;
				 xo=10;
				 xx=80;
				}else{
				 wx=128;
				 wy=128;
				 yo=148;
				 xo=-10;
				 xx=155;
				};
				_benutzer*uit;
				if(usermanagement->anfang(uit))do{//for(Local uit:_user=EachIn usermanagement->list
				 _iggcheckbox*cbt=0;
				 if(smallbild==false){
				  cbt=new _iggcheckbox(ul,60,yit+20,checkboxwidth,checkboxheight);//,7000+i);!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				  cbt->position.addieren(0,0,-1,false);
				  checkboxinitmagic(cbt);
				 };
				 _tg xs=font24->breite(uit->name())/2;
				 _iggtext*gte=ul->inserttext(uit->name(),ul->breite()/2-xs-xo,yit+yo,1,1,0.8,0.4,font24,7100+i);
				 _iggimage*gim=ul->insertimage(usermanagement->bild(uit->bildindex()),ul->breite()/2-wx/2-xo,yit,wx,wy,1,1,1,7100+i);
			     _iggimage*gimf=0;
				 if(smallbild==false){
				  gimf=ul->insertimage(iframe,(ul->breite()/2-wx/2-xo)-5,(yit)-5,wx+12,wy+12,1,1,1,-1);
			     }else{
				  gimf=ul->insertimage(iframe,(ul->breite()/2-wx/2-xo)-4,(yit)-4,wx+8,wy+8,1,1,1,-1);
  				 };
				 gimf->position.z(gimf->position.z()-1);
				 gimf->selectable=false;
				 gimf->fadeopacity(0);
				 gim->crosslinktext=gte;
				 gte->crosslinkimage=gim;
				 if(cbt){
				  cbt->crosslinkimage=gim;
				  gim->crosslinkcheckbox=cbt;
				  cbt->fadeopacity(0);
				 };
				 gim->fadeopacity(0);
				 gte->fadeopacity(0);
				 if(usermanagement->aktuell()){
				  if(uit->name()==usermanagement->aktuell()->name()) ul->selection=gim;
				 };
				 if(smallbild) gim->index+=2000;
				 yit+=65+wy;
				 if(smallbild==false) yit+=10;
				 i++;
				}while(usermanagement->naechstes(uit));
};
void _solitairefantasy::updatelistboxuserselection(){
                _igg*it;
                _iggcheckbox*cit;
                _iggtext*tit;
	 			if(windowuserlist->anfang(it))do{//for(Local cit:_iggcheckbox=EachIn windowuserlist.childlist
	 			 cit=dynamic_cast<_iggcheckbox*>(it);
	 			 if(cit) cit->checked=false;
				}while(windowuserlist->naechstes(it));
				windowuserlist->selection=0;
				
				if(usermanagement->aktuell()){
				 int ui=0;
				 int userindex=-1;
				 
				 if(windowuserlist->anfang(it))do{//for(Local tit:_iggtext=EachIn windowuserlist.childlist
				  tit=dynamic_cast<_iggtext*>(it);
				  if(tit){
				   if(tit->lesen()==usermanagement->aktuell()->name()) userindex=ui;
				   ui++;
				  };
				 }while(windowuserlist->naechstes(it));
				 
				 ui=0;
	 			 if(windowuserlist->anfang(it))do{//for(Local cit:_iggcheckbox=EachIn windowuserlist.childlist
	 			  cit=dynamic_cast<_iggcheckbox*>(it);
	 			  if(cit){
	  			   if(ui==userindex){
	  			    cit->checked=true;
	  			    windowuserlist->selection=cit->crosslinkimage;
		 		   };
				   ui++;
				  };
				 }while(windowuserlist->naechstes(it));
				};
};
//******************************************************************************************************************
//										U S E R  N E W  M E N U 
//******************************************************************************************************************				
void _solitairefantasy::createmenuusercreate(){
				_to tr=0.99,tg=0.7,tb=0.27;
				_tg lx=250;
				_tg ly=100;
				_tg wx=710;
				_tg wy=700;
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg y=100;
				_tg x=650;
				_tg off=20;
				_tg xit=0;
				_tg yit=0;
				int i;
				_tg cw=128*0.7;
				_tg ch=200*0.7;
				_iggcheckbox*cbt;
				menuusercreate=menuman->createmenu();
				windowusercreate=new _iggwindow(iggsystem,-wx/2-100,-wy/2,wx,wy,1,1,1);
				windowusercreate->position.addieren(0.5,0.5,0,true);
				windowusercreate->position.kondition(500,1023,400,767, 80,3,-1,false);
				windowusercreate->size.kondition(500,1023,400,767, 720,580,1,false);
				windowusercreate->setshadow(10,10);
				windowinitmagic(windowusercreate,igametypewindow);
				menuusercreate->add(windowusercreate);
				/*
				buttonusernewmainmenu=new _iggbutton
				buttonusernewmainmenu.init(iggsystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strcreate,11)
				buttonusernewmainmenu.position.add(0.5,0.5,0,true)
				buttoninitmagic(buttonusernewmainmenu)
				menuusernew.add(buttonusernewmainmenu)		
				*/		
				_zeichenkette<_tt> hh;
				windowusercreatetitle=new _iggtext(windowusercreate,(wx/2-6),50,1,strcreateuser,1,0.8,0.5,font30);
				windowusercreatetitle->dynamisch(wx,wy);
				windowusercreatetitle->zentriert();
				windowusercreatetitle1=new _iggtext(windowusercreate,(wx/2-6),80,1,strusercreatefirst1,1,0.8,0.5,font30);
				windowusercreatetitle1->dynamisch(wx,wy);
				windowusercreatetitle1->superinvisible=true;
				windowusercreatetitle1->zentriert();
				windowusercreatetitle2=new _iggtext(windowusercreate,(wx/2-6),110,1,strusercreatefirst2,1,0.8,0.5,font30);
				windowusercreatetitle2->dynamisch(wx,wy);
				windowusercreatetitle2->superinvisible=true;
				windowusercreatetitle2->zentriert();
				
				windowusercreateimagelist=new _igglistbox(windowusercreate,70,90,310+250,430,8,1,1,1);
				windowusercreateimagelist->dynamisch(wx,wy);
				listboxinitmagic(windowusercreateimagelist);
				yit=20;
				xit=10;
				_tg iwx=120;
				_tg iwy=120;
				_listenknoten<_bild<_tb> >*bit;
				int j=0;
				if(usermanagement->bildliste()->anfang(bit))do{//for(Local j=0 To usermanagement->imagecount-1
				 _iggcheckbox*cbt=new _iggcheckbox(windowusercreateimagelist,xit+iwx-25,yit+5,19,19);//,8000+j);!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 cbt->position.addieren(0,0,-1,false);
				 checkboxinitmagic(cbt);
				 _iggimage*gim=windowusercreateimagelist->insertimage(bit->objekt(),xit,yit,iwx,iwy,1,1,1,8100+j);
				
				 gim->crosslinkcheckbox=cbt;
				 cbt->crosslinkimage=gim;
			     _iggimage*gimf=windowusercreateimagelist->insertimage(iframe,xit-5,yit-5,iwx+10,iwy+10,1,1,1,-1);
				 gimf->position.z(gimf->position.z()-1);
				 gimf->selectable=false;
				 xit+=15+iwx;
				 if(xit>(200+(2*(15+iwx)))){
				  xit=10;
				  yit+=15+iwy;
				 };
				 j++;
				}while(usermanagement->bildliste()->naechstes(bit));
				
				windowusercreateimagelist->selectionrect=true;
				windowusercreateimagelist->moverrect=true;
							
				hh=strname+L" : ";
				windowusercreatename=new _iggeditbox(windowusercreate,70+font24->breite(hh),600,wx-70*2-10,40,L"",font24,1,1,1);
				windowusercreatename->drawframe=false;
				windowusercreatename->cursorimage=itrackbarbutton;
				windowusercreatename->cursorbreite=32;
				windowusercreatename->cursorhoehe=32;
				windowusercreatename->cursoroffsety=-25;
				windowusercreatename->cursorsmooth=true;
				windowusercreatename->textcolor.setzen(1,0.8,0.5,1);
				windowusercreatename->dynamisch(wx,wy);
				
				_iggtext*gt=new _iggtext(windowusercreate,80,605,1,hh,1,0.8,0.5,font24);
				gt->dynamisch(wx,wy);
				
				y=0;
				buttonusercreatecreate=new _iggbutton(iggsystem,+wx/2+10-100,-wy/2+y,bw,bh,strcreate,font24,33);
				buttonusercreatecreate->position.addieren(0.5,0.5,0,true);
				buttonusercreatecreate->position.kondition(500,1023,400,767,  5,5,-1,false);
				buttonusercreatecreate->size.kondition(500,1023,400,767,  buttonwidth-80,buttonheight-10,1,false);
				buttoninitmagic(buttonusercreatecreate);
				menuusercreate->add(buttonusercreatecreate);
				y+=bh+off;

				buttonusercreatecancel=new _iggbutton(iggsystem,+wx/2+10-100,-wy/2+y,bw,bh,strcancel,font24,33);
				buttonusercreatecancel->position.addieren(0.5,0.5,0,true);
				buttonusercreatecancel->position.kondition(500,1023,400,767,  5,buttonheight+5+5,-1,false);
				buttonusercreatecancel->size.kondition(500,1023,400,767,  buttonwidth-80,buttonheight-10,1,false);
				buttoninitmagic(buttonusercreatecancel);
				menuusercreate->add(buttonusercreatecancel);
				y+=bh+off;

				menuusercreate->visibility(false);
				menuusercreate->activity(false);
				menuusercreate->fadetarget(menuopacity2);
				menuusercreate->fadeopacity(0);
};
//******************************************************************************************************************
//										C A R D G E N E R A T O R   M E N U 
//******************************************************************************************************************				
void _solitairefantasy::createmenucardgenerator(){
				_iggtext*gt;
				_to tr=1,tg=0.8,tb=0.4;
				_tg lx=250;
				_tg ly=100;
				_tg y=80;
				_tg x=670;
				_tg wx=850;
				_tg wy=760;
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg yit=0;
				_tg off=28;
				_tg cw=256*0.5;
				_tg ch=384*0.5;
				_netz*mt;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),1,1,tsymbolfine);
				//gg.position.setzen(0,0,0)
				//gg.color.setzen(1,1,1,1)
				//gg.vx.setzen(cw,0,0)
				//gg.vy.setzen(0,ch,0)
				//gg.resolution[0]=1
				//gg.resolution[1]=1
				menucardgenerator=menuman->createmenu();

				cardgeneratorwindow=new _iggwindow(iggsystem,-wx/2+90,-wy/2+10,wx,wy,1,1,1);
				cardgeneratorwindow->position.addieren(0.5,0.5,0,true);
				cardgeneratorwindow->position.kondition(500,1023,400,767,  100,5,-1,false);
				cardgeneratorwindow->size.kondition(500,1023,400,767,  690,590,1,false);
				cardgeneratorwindow->shadow=false;
				windowinitmagic(cardgeneratorwindow,igametypewindow);
				menucardgenerator->add(cardgeneratorwindow);
				
				cardgeneratorbuttonback=new _iggbutton(iggsystem,-wx/2+90-(buttonwidth-60),-wy/2+10+10,buttonwidth-60,buttonheight,strback,font24,-1);
				cardgeneratorbuttonback->position.addieren(0.5,0.5,0,true);
				cardgeneratorbuttonback->position.kondition(500,1023,400,767,  5,5,-1,false);
				buttoninitmagic(cardgeneratorbuttonback);
				cardgeneratorbuttonback->createhilfe(strcardgeneratorhelpback,font18,0.2,0,0);
				guihelpinitmagic(cardgeneratorbuttonback);
				menucardgenerator->add(cardgeneratorbuttonback);

				cardgeneratorbuttonreset=new _iggbutton(iggsystem,-wx/2+90-(buttonwidth-60),-wy/2+buttonheight+10+10+10,buttonwidth-60,buttonheight,strreset,font24,-1);
				cardgeneratorbuttonreset->position.kondition(500,1023,400,767,  5,buttonheight+5+5,-1,false);
				cardgeneratorbuttonreset->position.addieren(0.5,0.5,0,true);
				buttoninitmagic(cardgeneratorbuttonreset);
				cardgeneratorbuttonreset->createhilfe(strcardgeneratorhelpreset,font18,0.2,0,0);
				guihelpinitmagic(cardgeneratorbuttonreset);
				
				menucardgenerator->add(cardgeneratorbuttonreset);
				_zeichenkette<_tt> hh=L"";//strcardgenerator
				cardgeneratortexttitle=new _iggtext(cardgeneratorwindow,(wx/2)-font30->breite(hh)/2,50,1,hh,1,0.8,0.5,font30);
				int i=0;
				for(int j=0;j<4;j++){
				 _tg w=j*40+90;
				 gg.ort(wx/2-30+cos(w*_ph)*160,180-sin(w*_ph)*130,0);
				// gg.textur(cb->texturpreview);
				 w-=70;
				 _vektor3<_tg> h;
				 h.setzen(cw,0,0);
				 h.rotz(-w/2);
				 gg.vektor0(h);
				 h.setzen(0,ch,0);
				 h.rotz(-w/2);
				 gg.vektor1(h);
				 gg.texturvektor(1,1);//vx.setzen(cw,0,0)
				 //gg.vy.setzen(0,ch,0)
				 //gg.vx.rotz(-w/2);
				 //gg.vy.rotz(-w/2);
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 //mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzadditiv(false);
				 _iggmesh*gim=cardgeneratorwindow->insertmesh(mt,20,20+i*(ch+60),200,128,1,1,1,-1);
				 gim->position.kondition(500,1023,400,767,  20-80,20+i*(ch+60),-0,false);
				 cardgeneratormeshfrontlist.einhaengen(gim);
				};	
				_tg ew=170;
				_tg w=10;
				_vektor3<_tg> h;
				gg.ort(0,0,0);
				h.setzen(cw*1.4,0,0);
				h.rotz(w);
				gg.vektor0(h);
				h.setzen(0,ch*1.4,0);
				h.rotz(w);
				gg.vektor1(h);
				//gg.vx.setzen(cw*1.4,0,0);
				//gg.vy.setzen(0,ch*1.4,0);
				//gg.vx.rotz(w);
				//gg.vy.rotz(w);
				mt=gg.erzeugen();
				mt->zweiseitig(true);
				//mt->ausschussflaeche(false);
				mt->transparenz(true);
				mt->transparenzadditiv(false);
				_iggmesh*gim;
				gim=cardgeneratorwindow->insertmesh(mt,wx/2-40,40,200,128,1,1,1,-1);
				gim->position.kondition(500,1023,400,767,  wx/2-40-80,40,0,false);
				cardgeneratormeshbacklist.einhaengen(gim);
				_listenknoten<_iggmesh>*gm;
				if(cardgeneratormeshfrontlist.anfang(gm))do{//for(Local gm:_iggmesh=EachIn cardgeneratormeshfrontlist
				 gm->objekt()->selectable=false;
				}while(cardgeneratormeshfrontlist.naechstes(gm));			
				if(cardgeneratormeshbacklist.anfang(gm))do{//for(Local gm:_iggmesh=EachIn cardgeneratormeshbacklist
				 gm->objekt()->selectable=false;
				}while(cardgeneratormeshbacklist.naechstes(gm));			
				
							
				//gg.position.setzen(0,0,0)
				//gg.vx.setzen(cw,0,0)
				//gg.vy.setzen(0,ch,0)				
				//-------------------------------------- background guis -----------------------------------------
				hh=strbackground;
				cardgeneratortextground=new _iggtext(cardgeneratorwindow,60,55,1,hh,1,0.8,0.5,font24);
				cardgeneratortextground->createhilfe(strcardgeneratorhelpbackground,font18,0.6,0,0);
				guihelpinitmagic(cardgeneratortextground);
				
				cardgeneratorlistboxground=new _igglistbox(cardgeneratorwindow,60,85,ew,265,8,1,1,1);
				cardgeneratorlistboxground->size.kondition(500,1023,400,767,  ew,265-70,1,false);
				listboxinitmagic(cardgeneratorlistboxground);
				hh=strstructure;
				gt=new _iggtext(cardgeneratorwindow,60,365,1,hh,1,0.8,0.5,font18);		
				gt->position.kondition(500,1023,400,767,  60,365-70,-1,false);
				gt->createhilfe(strcardgeneratorhelpstructurebackground,font18,0.6,0,0);
				guihelpinitmagic(gt);
								
				cardgeneratortrackbargroundstructure=new _iggtrackbar(cardgeneratorwindow,60,385,ew,20,font18,1,1,1,0.5,0,1);
				cardgeneratortrackbargroundstructure->position.kondition(500,1023,400,767,  60,385-70,-1,false);
				cardgeneratortrackbargroundstructure->displaymultiplier=100;
				cardgeneratortrackbargroundstructure->displayaddition=L" %";
				cardgeneratortrackbargroundstructure->displayrounding=true;				
				trackbarinitmagic(cardgeneratortrackbargroundstructure);							
								
				hh=strbehind;
				gt=new _iggtext(cardgeneratorwindow,60,405,1,hh,1,0.8,0.5,font18);
				gt->position.kondition(500,1023,400,767,  60,405-70,-1,false);
				gt->createhilfe(strcardgeneratorhelpstructurebackgroundbehind,font18,0.6,0,0);
				guihelpinitmagic(gt);
				cardgeneratorcheckboxgroundstructurebehind=new _iggcheckbox(cardgeneratorwindow,60+ew-19,405,19,19);
				cardgeneratorcheckboxgroundstructurebehind->position.kondition(500,1023,400,767,  60+ew-19,405-70,-1,false);
				checkboxinitmagic(cardgeneratorcheckboxgroundstructurebehind);
				cardgeneratorcheckboxgroundstructurebehind->checked=true;
								
				cardgeneratorlistboxgroundstructure=new _igglistbox(cardgeneratorwindow,60,390+40,ew,210+30,8,1,1,1);
				cardgeneratorlistboxgroundstructure->position.kondition(500,1023,400,767,  60,390+40-70,-1,false);
				cardgeneratorlistboxgroundstructure->size.kondition(500,1023,400,767,  ew,240-70,1,false);
				listboxinitmagic(cardgeneratorlistboxgroundstructure);
				//---------------------------------------- frame guis -------------------------------------------
				_tg xfr=wx-70-ew;
				_tg kox=160;
				hh=strframe;
				cardgeneratortextframe=new _iggtext(cardgeneratorwindow,xfr,55,1,hh,1,0.8,0.5,font24);
				cardgeneratortextframe->position.kondition(500,1023,400,767,  xfr-kox,55,-1,false);
				cardgeneratortextframe->createhilfe(strcardgeneratorhelpframe,font18,0.6,0,0);
				guihelpinitmagic(cardgeneratortextframe);
				//----
				cardgeneratortextframenumber=new _iggtext(cardgeneratorwindow,xfr,90,1,strfornumbers,1,0.8,0.5,font18);
				cardgeneratortextframenumber->position.kondition(500,1023,400,767,  xfr-kox,90,-1,false);
				cardgeneratortextframenumber->createhilfe(strcardgeneratorhelpframefornumbers,font18,0.6,0,0);
				guihelpinitmagic(cardgeneratortextframenumber);

				cardgeneratortrackbarframenumber=new _iggtrackbar(cardgeneratorwindow,xfr+110,90,60,20,font18,1,1,1,0.5,0,1);
				cardgeneratortrackbarframenumber->position.kondition(500,1023,400,767,  xfr+110-kox,90,-1,false);
				cardgeneratortrackbarframenumber->displaymultiplier=100;
				cardgeneratortrackbarframenumber->displayaddition=L" %";
				cardgeneratortrackbarframenumber->displayrounding=true;
				trackbarinitmagic(cardgeneratortrackbarframenumber);
				//----
				cardgeneratortextframepicture=new _iggtext(cardgeneratorwindow,xfr,115,1,strforpictures,1,0.8,0.5,font18);
				cardgeneratortextframepicture->position.kondition(500,1023,400,767,  xfr-kox,115,-1,false);
				cardgeneratortextframepicture->createhilfe(strcardgeneratorhelpframeforpictures,font18,0.6,0,0);
				guihelpinitmagic(cardgeneratortextframepicture);
				
				cardgeneratortrackbarframepicture=new _iggtrackbar(cardgeneratorwindow,xfr+110,115,60,20,font18,1,1,1,0.5,0,1);
				cardgeneratortrackbarframepicture->position.kondition(500,1023,400,767,  xfr+110-kox,115,-1,false);
				cardgeneratortrackbarframepicture->displaymultiplier=100;
				cardgeneratortrackbarframepicture->displayaddition=L" %";
				cardgeneratortrackbarframepicture->displayrounding=true;
				trackbarinitmagic(cardgeneratortrackbarframepicture);
				//----
				cardgeneratortextframebackside=new _iggtext(cardgeneratorwindow,xfr,100,1,strforbacksides,1,0.8,0.5,font18);
				cardgeneratortextframebackside->position.kondition(500,1023,400,767,  xfr-kox,100,-1,false);
				cardgeneratortextframebackside->createhilfe(strcardgeneratorhelpframeforbacksides,font18,0.6,0,0);
				guihelpinitmagic(cardgeneratortextframebackside);
				
				cardgeneratortrackbarframebackside=new _iggtrackbar(cardgeneratorwindow,xfr+110,100,60,20,font18,1,1,1,0.5,0,1);
				cardgeneratortrackbarframebackside->position.kondition(500,1023,400,767,  xfr+110-kox,100,-1,false);
				cardgeneratortrackbarframebackside->displaymultiplier=100;
				cardgeneratortrackbarframebackside->displayaddition=L" %";
				cardgeneratortrackbarframebackside->displayrounding=true;
				trackbarinitmagic(cardgeneratortrackbarframebackside);

				//cardgeneratorcheckboxframebackside=new _iggcheckbox
				//cardgeneratorcheckboxframebackside.init(cardgeneratorwindow,xfr+170-19-21,100,19,19,-1)
				//checkboxinitmagic(cardgeneratorcheckboxframebackside)
				//cardgeneratorcheckboxframebackside.checked=true	
				
				cardgeneratorlistboxframe=new _igglistbox(cardgeneratorwindow,xfr,145,ew,225,8,1,1,1);
				cardgeneratorlistboxframe->position.kondition(500,1023,400,767,  xfr-kox,145,-1,false);
				cardgeneratorlistboxframe->size.kondition(500,1023,400,767,  ew,225-70,1,false);
				listboxinitmagic(cardgeneratorlistboxframe);
				
				hh=strstructure;
				gt=new _iggtext(cardgeneratorwindow,xfr,385,1,hh,1,0.8,0.5,font18);
				gt->position.kondition(500,1023,400,767,  xfr-kox,385-70,-1,false);
				gt->createhilfe(strcardgeneratorhelpstructureframe,font18,0.6,0,0);
				guihelpinitmagic(gt);
								
				cardgeneratortrackbarframestructure=new _iggtrackbar(cardgeneratorwindow,xfr,405,ew,20,font18,1,1,1,0.5,0,1);
				cardgeneratortrackbarframestructure->position.kondition(500,1023,400,767,  xfr-kox,405-70,-1,false);
				cardgeneratortrackbarframestructure->displaymultiplier=100;
				cardgeneratortrackbarframestructure->displayaddition=L" %";
				cardgeneratortrackbarframestructure->displayrounding=true;
				trackbarinitmagic(cardgeneratortrackbarframestructure);
								
				cardgeneratorlistboxframestructure=new _igglistbox(cardgeneratorwindow,xfr,430,ew,170+70,8,1,1,1);
				cardgeneratorlistboxframestructure->position.kondition(500,1023,400,767,  xfr-kox,430-70,-1,false);
				cardgeneratorlistboxframestructure->size.kondition(500,1023,400,767,  ew,170+70-70,1,false);
				listboxinitmagic(cardgeneratorlistboxframestructure);
				
				//---------------------------------------- impurity guis ----------------------------------------
				_tg xim=(wx/2)-(ew/2)-5;
				_tg yim=270;
				hh=strimpurity;
				cardgeneratortextimpurity=new _iggtext(cardgeneratorwindow,xim,yim+120,1,hh,1,0.8,0.5,font24);
				cardgeneratortextimpurity->position.kondition(500,1023,400,767,  xim-80,yim+120-60,-1,false);
				cardgeneratortextimpurity->createhilfe(strcardgeneratorhelpimpurity,font18,0.6,0,0);
				guihelpinitmagic(cardgeneratortextimpurity);

				cardgeneratortrackbarimpurity=new _iggtrackbar(cardgeneratorwindow,xim,yim+145,ew,20,font18,1,1,1,0.5,0,1);
				cardgeneratortrackbarimpurity->position.kondition(500,1023,400,767,  xim-80,yim+145-60,-1,false);
				cardgeneratortrackbarimpurity->displaymultiplier=100;
				cardgeneratortrackbarimpurity->displayaddition=L" %";
				cardgeneratortrackbarimpurity->displayrounding=true;
				trackbarinitmagic(cardgeneratortrackbarimpurity);
				
				cardgeneratorlistboximpurity=new _igglistbox(cardgeneratorwindow,xim,yim+170,ew,155,8,1,1,1);
				cardgeneratorlistboximpurity->position.kondition(500,1023,400,767,  xim-80,yim+170-60,-1,false);
				cardgeneratorlistboximpurity->size.kondition(500,1023,400,767,  ew,155-55,1,false);
				listboxinitmagic(cardgeneratorlistboximpurity);
				
				hh=stryellowing;
				gt=new _iggtext(cardgeneratorwindow,xim,yim+340,1,hh,1,0.8,0.5,font18);
				gt->position.kondition(500,1023,400,767,  xim-80,yim+340-105-10,-1,false);
				gt->createhilfe(strcardgeneratorhelpimpurityyellowing,font18,0.6,0,0);
				guihelpinitmagic(gt);
				cardgeneratortrackbarimpurityyellowing=new _iggtrackbar(cardgeneratorwindow,xim,yim+360,ew,20,font18,1,1,1,0.5,0,1);
				cardgeneratortrackbarimpurityyellowing->position.kondition(500,1023,400,767,  xim-80,yim+360-105-10,-1,false);
				cardgeneratortrackbarimpurityyellowing->displaymultiplier=100;
				cardgeneratortrackbarimpurityyellowing->displayaddition=L" %";
				cardgeneratortrackbarimpurityyellowing->displayrounding=true;
				trackbarinitmagic(cardgeneratortrackbarimpurityyellowing);
				/*
				hh=strscratchs
				gt=new _iggtext
				gt.init(cardgeneratorwindow,xim,yim+385,2,hh,1,0.8,0.5,font18)						
				cardgeneratortrackbarimpurityscratchs=new _iggtrackbar
				cardgeneratortrackbarimpurityscratchs.init(cardgeneratorwindow,xim,yim+405,170,20,1,1,1,0.5,0,1,-1)
				cardgeneratortrackbarimpurityscratchs.displaymultiplier=100
				cardgeneratortrackbarimpurityscratchs.displayaddition=" %"
				cardgeneratortrackbarimpurityscratchs.displayrounding=true				
				trackbarinitmagic(cardgeneratortrackbarimpurityscratchs)						
				*/
				updatemenucardgenerator(0);
				menucardgenerator->fadeoff();
				menucardgenerator->visibility(false);
				menucardgenerator->activity(false);
				menucardgenerator->fadetarget(menuopacity2);
				menucardgenerator->fadeopacity(0);
};
void _solitairefantasy::updatemenucardgenerator(_cardset*c){
				cardsetmanager->actualedit=c;
				if(c) c->generatetexturepreview(gra);
				_iggcheckbox*cbt;
				_tg cw=128*0.5;
				_tg ch=200*0.5;
				_netz*mt;
				_iggmesh*gm;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,0);
				_tg i=0;
				_cardsetfront*cf=dynamic_cast<_cardsetfront*>(c);
				_cardsetback*cb=dynamic_cast<_cardsetback*>(c);
				_tg cboy=checkboxoffy+10;
				_tg cbw=checkboxwidth;
				_tg cbh=checkboxheight;
                _cardsetbild*tit;
				
				//gg.position.setzen(0,0,0)
				//gg.color.setzen(1,1,1,1)
				//gg.vx.setzen(cw,0,0)
				//gg.vy.setzen(0,ch,0)
				
				cardgeneratorlistboxground->loeschen();
				i=0;
				if(cardsetmanager->groundlist.anfang(tit))do{//for(Local tit:_cardsetbild=EachIn cardsetmanager->groundlist
				 gg.textur(tit->textur());
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 //mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzadditiv(false);
				 _tg x=5;
				 _tg y=20+i*(ch+20);
				 gm=cardgeneratorlistboxground->insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1);
				 gm->crosslinkname.kopierenchar(tit->name.daten());
				 cbt=new _iggcheckbox(cardgeneratorlistboxground,x+cw+5,y+cboy,cbw,cbh);
				 checkboxinitmagic(cbt);
				 gm->crosslinkcheckbox=cbt;
				 cbt->crosslinkmesh=gm;
				 if(c){
				  if(tit->name==c->groundselection){
				   cardgeneratorlistboxground->selection=gm;
				   cbt->checked=true;
				  };
				 };
				 i++;
				}while(cardsetmanager->groundlist.naechstes(tit));
				
				cardgeneratorlistboxgroundstructure->loeschen();
				i=0;
				if(cardsetmanager->structurelist.anfang(tit))do{//for(Local tit:_cardsetbild=EachIn cardsetmanager->structurelist
				 gg.textur(tit->textur());
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 //mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzadditiv(false);
				 _tg x=5;
				 _tg y=20+i*(ch+20);
				 gm=cardgeneratorlistboxgroundstructure->insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1);
				 gm->crosslinkname.kopierenchar(tit->name.daten());
				 cbt=new _iggcheckbox(cardgeneratorlistboxgroundstructure,x+cw+5,y+cboy,cbw,cbh);
				 gm->crosslinkcheckbox=cbt;
				 cbt->crosslinkmesh=gm;
				 checkboxinitmagic(cbt);
				 if(c){
				  if(tit->name==c->structuregroundselection){
				   cardgeneratorlistboxgroundstructure->selection=gm;
				   cbt->checked=true;
				  };
				 };
				 i++;
				}while(cardsetmanager->structurelist.naechstes(tit));	

				cardgeneratorlistboxframe->loeschen();
				i=0;
				if(cardsetmanager->framelist.anfang(tit))do{//for(Local tit:_cardsetbild=EachIn cardsetmanager->framelist
				 gg.textur(tit->textur());
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 //mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzadditiv(false);
				 _tg x=10;
				 _tg y=20+i*(ch+20);
				 gm=cardgeneratorlistboxframe->insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1);
				 gm->crosslinkname.kopierenchar(tit->name.daten());
				 cbt=new _iggcheckbox(cardgeneratorlistboxframe,x+cw+5,y+cboy,cbw,cbh);
				 checkboxinitmagic(cbt);
				 gm->crosslinkcheckbox=cbt;
				 cbt->crosslinkmesh=gm;
				 if(c){
				  if(tit->name==c->frameselection){
				   cardgeneratorlistboxframe->selection=gm;
				   cbt->checked=true;
				  };
				 };				
				 i++;
				}while(cardsetmanager->framelist.naechstes(tit));	
				
				cardgeneratorlistboxframestructure->loeschen();
				i=0;
				if(cardsetmanager->structurelist.anfang(tit))do{//for(Local tit:_cardsetbild=EachIn cardsetmanager->structurelist
				 gg.textur(tit->textur());
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 //mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzadditiv(false);
				 _tg x=10;
				 _tg y=20+i*(ch+20);
				 gm=cardgeneratorlistboxframestructure->insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1);
				 gm->crosslinkname.kopierenchar(tit->name.daten());
				 cbt=new _iggcheckbox(cardgeneratorlistboxframestructure,x+cw+5,y+cboy,cbw,cbh);
				 checkboxinitmagic(cbt);
				 gm->crosslinkcheckbox=cbt;
				 cbt->crosslinkmesh=gm;
				 if(c){
				  if(tit->name==c->structureframeselection){
				   cardgeneratorlistboxframestructure->selection=gm;
				   cbt->checked=true;
				  };
				 };				
				 i++;
				}while(cardsetmanager->structurelist.naechstes(tit));	
				
				cardgeneratorlistboximpurity->loeschen();
				i=0;
				if(cardsetmanager->impuritylist.anfang(tit))do{//for(Local tit:_cardsetbild=EachIn cardsetmanager->impuritylist
				 gg.textur(tit->textur());
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 //mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzadditiv(false);
				 _tg x=5;
				 _tg y=20+i*(ch+20);
				 gm=cardgeneratorlistboximpurity->insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1);
				 gm->crosslinkname.kopierenchar(tit->name.daten());
				 cbt=new _iggcheckbox(cardgeneratorlistboximpurity,x+cw+5,y+cboy,cbw,cbh);
				 checkboxinitmagic(cbt);
				 gm->crosslinkcheckbox=cbt;
				 cbt->crosslinkmesh=gm;
				 if(c){
				  if(tit->name==c->impurityselection){
				   cardgeneratorlistboximpurity->selection=gm;
				   cbt->checked=true;
				  };
				 };				
				 i++;
				}while(cardsetmanager->impuritylist.naechstes(tit));								
				
				
				if(c==0) return;
				L->schreiben("pass");
				_listenknoten<_iggmesh>*mit;
				_polygon*pit;
				if(cf){
				 int j=0;
				 if(cardgeneratormeshfrontlist.anfang(mit))do{//for(Local mit:_iggmesh=EachIn cardgeneratormeshfrontlist
				  mit->objekt()->superinvisible=false;
				  if(mit->objekt()->meshtransformed->anfang(pit))do{//for(Local pit:_polygon=EachIn mit.meshtransformed.polygonlist
				   pit->textur(cf->texturpreview[j]);
				  }while(mit->objekt()->meshtransformed->naechstes(pit));
				  j++;
				 }while(cardgeneratormeshfrontlist.naechstes(mit));
				 if(cardgeneratormeshbacklist.anfang(mit))do{//for(Local mit:_iggmesh=EachIn cardgeneratormeshbacklist
				  mit->objekt()->superinvisible=true;
				 }while(cardgeneratormeshbacklist.naechstes(mit));
				 cardgeneratortextframenumber->superinvisible=false;
				 cardgeneratortextframepicture->superinvisible=false;
				 cardgeneratortextframebackside->superinvisible=true;
				 cardgeneratortrackbarframenumber->superinvisible=false;
				 cardgeneratortrackbarframepicture->superinvisible=false;
				 cardgeneratortrackbarframebackside->superinvisible=true;
				}; 
				
				if(cb){
				 if(cardgeneratormeshbacklist.anfang(mit))do{//for(Local mit:_iggmesh=EachIn cardgeneratormeshbacklist
				  mit->objekt()->superinvisible=false;
				  if(mit->objekt()->meshtransformed->anfang(pit))do{//for(Local pit:_polygon=EachIn mit.meshtransformed.polygonlist
				   pit->textur(cb->texturpreview);
				  }while(mit->objekt()->meshtransformed->naechstes(pit));
				 }while(cardgeneratormeshbacklist.naechstes(mit));
				 if(cardgeneratormeshfrontlist.anfang(mit))do{//for(Local mit:_iggmesh=EachIn cardgeneratormeshfrontlist
				  mit->objekt()->superinvisible=true;
				 }while(cardgeneratormeshfrontlist.naechstes(mit));
				 cardgeneratortextframenumber->superinvisible=true;
				 cardgeneratortextframepicture->superinvisible=true;
				 cardgeneratortextframebackside->superinvisible=false;
				 cardgeneratortrackbarframenumber->superinvisible=true;
				 cardgeneratortrackbarframepicture->superinvisible=true;
				 cardgeneratortrackbarframebackside->superinvisible=false;
				};				
				
				cardgeneratortrackbargroundstructure->setzen(c->structureground);
				cardgeneratorcheckboxgroundstructurebehind->checked=c->structuregroundbehind;
				
				cardgeneratortrackbarframepicture->setzen(c->frameforpictures);
				cardgeneratortrackbarframenumber->setzen(c->framefornumbers);
				cardgeneratortrackbarframebackside->setzen(c->frameforbacksides);
				cardgeneratortrackbarframestructure->setzen(c->structureframe);
				
				cardgeneratortrackbarimpurity->setzen(c->impurity);
				cardgeneratortrackbarimpurityyellowing->setzen(c->impurityyellowing);
				
				cardgeneratorlistboxground->scrolltoselection();
				cardgeneratorlistboxgroundstructure->scrolltoselection();
				cardgeneratorlistboxframe->scrolltoselection();
				cardgeneratorlistboxframestructure->scrolltoselection();
				cardgeneratorlistboximpurity->scrolltoselection();
};
//******************************************************************************************************************
//										S T A T I S C S  M E N U 
//******************************************************************************************************************				
void _solitairefantasy::createmenustatistics(){
				_to tr=1,tg=0.8,tb=0.4;
				_tg lx=250;
				_tg ly=100;
				_tg y=80;
				_tg x=670;
				_tg wx=850;
				_tg wy=760;
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg yit=0;
				_tg off=28;
	
				menustatistics=menuman->createmenu();
				windowstatistics=new _iggwindow(iggsystem,int(-wx/2+90),int(-wy/2+5),wx,wy,1,1,1);
				windowstatistics->position.addieren(0.5,0.5,0,true);
				windowstatistics->position.kondition(500,1023,400,767,  100,5,-1,false);
				windowstatistics->size.kondition(500,1023,400,767,  690,590,1,false);
				windowstatistics->shadow=false;
				windowinitmagic(windowstatistics,igametypewindow);
				menustatistics->add(windowstatistics);
				
				buttonstatisticsmainmenu=new _iggbutton(iggsystem,-wx/2+90-(buttonwidth-60),-wy/2+5+10,buttonwidth-60,buttonheight,strmenu,font24,11);
				buttonstatisticsmainmenu->position.addieren(0.5,0.5,0,true);
				buttonstatisticsmainmenu->position.kondition(500,1023,400,767,  5,5,-1,false);
				buttonstatisticsmainmenu->size.kondition(500,1023,400,767,  buttonwidth-80,buttonheight-10,1,false);
				buttoninitmagic(buttonstatisticsmainmenu);
				menustatistics->add(buttonstatisticsmainmenu);

				buttonstatisticsranks=new _iggbutton(iggsystem,-wx/2+90-(buttonwidth-60),-wy/2+buttonheight+5+10+10,buttonwidth-60,buttonheight,strranklist,font24,-1);
				buttonstatisticsranks->position.addieren(0.5,0.5,0,true);
				buttonstatisticsranks->position.kondition(500,1023,400,767,  5,buttonheight+5+5,-1,false);
				buttonstatisticsranks->size.kondition(500,1023,400,767,  buttonwidth-80,buttonheight-10,1,false);
				buttoninitmagic(buttonstatisticsranks);
				menustatistics->add(buttonstatisticsranks);

				_zeichenkette<_tt> hh=strstatistics;
				ttitlestatistics=new _iggtext(windowstatistics,-font30->breite(hh)/2,40,1,hh,1,0.95,0.8,font30);
				ttitlestatistics->position.addieren(0.5,0,0,true);
				windowstatisticstypelist=new _igglistbox(windowstatistics,60,80,200,290,8,1,1,1);
				windowstatisticstypelist->dynamisch(wx,wy);
				windowstatisticstypelist->selectionrect=true;
				windowstatisticstypelist->moverrect=true;
				listboxinitmagic(windowstatisticstypelist);
				//-------------------------------------- create sort box
				windowstatisticssortbox=new _iggcombobox(windowstatistics,
				60,80+255+40,200,40,
				60,-1,1,1,1  
				,260,80+255-120,210,160+40, 30, 0, font18);
				windowstatisticssortbox->dynamisch(wx,wy);
				windowstatisticssortbox->listbox->selectionrect=true;
				windowstatisticssortbox->listbox->moverrect=true;
				windowstatisticssortbox->listbox->dynamischort(wx,wy);
				comboboxinitmagic(windowstatisticssortbox);
			    _iggtext*gt;
				_tg sey=0;
				_zeichenkette<_tt> hse;
				_tg txo=210/2-35;
				_tg tx;
				hse=strgametypesortalphabetical;tx=txo-font18->breite(hse)/2;
				gt=windowstatisticssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,0);sey+=22;
				hse=strgametypesortpublicity;tx=txo-font18->breite(hse)/2;
				gt=windowstatisticssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,1);sey+=22;gt->createhilfe(strgametypesortpublicitydesc,font18,0.1,200,0);guihelpinitmagic(gt);
				hse=strgametypesortchance;tx=txo-font18->breite(hse)/2;
				gt=windowstatisticssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,2);sey+=22;gt->createhilfe(strgametypesortchancedesc,font18,0.1,200,0);guihelpinitmagic(gt);
				hse=strgametypesortskill;tx=txo-font18->breite(hse)/2;
				gt=windowstatisticssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,3);sey+=22;gt->createhilfe(strgametypesortskilldesc,font18,0.1,200,0);guihelpinitmagic(gt);
				hse=strgametypesorttime;tx=txo-font18->breite(hse)/2;
				gt=windowstatisticssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,4);sey+=22;gt->createhilfe(strgametypesorttimedesc,font18,0.1,200,0);guihelpinitmagic(gt);
				hse=strgametypesorttype;tx=txo-font18->breite(hse)/2;
				gt=windowstatisticssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,5);sey+=22;
				
				windowstatisticssortbox->listbox->superinactivity(true);
				windowstatisticssortbox->listbox->superinvisibility(true);
				windowstatisticssortbox->listbox->fadeopacity(0);
				windowstatisticssortbox->createhilfe(strsortbox,font18,0.5,0,0);
				windowstatisticssortbox->button->createhilfe(strsortboxbutton,font18,0.5,0,0);
				guihelpinitmagic(windowstatisticssortbox);
				guihelpinitmagic(windowstatisticssortbox->button);
				
				windowstatisticssortbox->clearbackground();
				windowstatisticssortbox->shadow=false;
				windowstatisticssortbox->superinvisible=true;
				windowstatisticssortbox->text->setzen(strgametypesortalphabetical);
				windowstatisticssortbox->text->textshadow=1;
				//-------------------------------------------------------
				updatelistboxgametypesorted(windowstatisticstypelist,current_preview);
				windowstatisticsuserlist=new _igglistbox(windowstatistics,60,380+40,200,250,8,1,1,1);
				windowstatisticsuserlist->dynamisch(wx,wy);
				windowstatisticsuserlist->selectionrect=true;
				windowstatisticsuserlist->moverrect=true;
				listboxinitmagic(windowstatisticsuserlist);
				updatelistboxuser(windowstatisticsuserlist,true);
				//-------------------------------------------------------
				hh=strstatisticstotal;
				windowstatisticstypetitle=new _iggtext(windowstatistics,(wx*0.4),100,1,hh,1,0.9,0.7,font24);
				windowstatisticstypetitle->dynamisch(wx,wy);
				
				hh=strstatisticsuser;
				windowstatisticsusertitle=new _iggtext(windowstatistics,(wx*0.4),410,1,hh,1,0.9,0.7,font24);
				windowstatisticsusertitle->dynamisch(wx,wy);
				
				yit=140;
				hh=L"count";
				windowstatisticstypecount=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypecount->dynamisch(wx,wy);
				hh=strcount;
				windowstatisticstypecounttext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypecounttext->dynamisch(wx,wy);
				yit+=off;
				
				hh=L"quote";
				windowstatisticstypequote=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypequote->dynamisch(wx,wy);
				hh=strwinquote;
				windowstatisticstypequotetext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypequotetext->dynamisch(wx,wy);
				yit+=off;
				
				hh=L"time";
				windowstatisticstypetime=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypetime->dynamisch(wx,wy);
				hh=strplaytime;
				windowstatisticstypetimetext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypetimetext->dynamisch(wx,wy);
				yit+=off;
				
				hh=L"discard";
				windowstatisticstypediscard=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypediscard->dynamisch(wx,wy);
				hh=strpoints;
				windowstatisticstypediscardtext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypediscardtext->dynamisch(wx,wy);
				yit+=off;
				
				hh=L"moves";
				windowstatisticstypemoves=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypemoves->dynamisch(wx,wy);
				hh=strplaymoves;
				windowstatisticstypemovestext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticstypemovestext->dynamisch(wx,wy);
				yit+=off;
								
				windowstatisticstypeclear=new _iggbutton(windowstatistics,wx*0.4,yit+10,200,65,strdeleteall,font24,-1);
				windowstatisticstypeclear->dynamisch(wx,wy);
				buttoninitmagic(windowstatisticstypeclear);
				windowstatisticstypeclear->createhilfe(strstatisticsdeleteall,font18,0.6,0,0);
				guihelpinitmagic(windowstatisticstypeclear);

				windowstatisticstypereset=new _iggbutton(windowstatistics,wx*0.68,yit+10,200,65,strbackset,font24,-1);
				windowstatisticstypereset->dynamisch(wx,wy);
				buttoninitmagic(windowstatisticstypereset);
				windowstatisticstypereset->createhilfe(strstatisticsdeleteallandgenerate,font18,0.2,0,0);
				guihelpinitmagic(windowstatisticstypereset);

				windowstatisticstyperanks=new _iggbutton(windowstatistics,wx*0.78,130,100,40,strranks,font24,-1);
				windowstatisticstyperanks->dynamisch(wx,wy);
				buttoninitmagic(windowstatisticstyperanks);
				windowstatisticstyperanks->createhilfe(strshowranks,font18,0.6,0,0);
				guihelpinitmagic(windowstatisticstyperanks);
				
				yit=450;
				hh=L"count";
				windowstatisticsusercount=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsusercount->dynamisch(wx,wy);
				hh=strcount;
				windowstatisticsusercounttext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsusercounttext->dynamisch(wx,wy);
				yit+=off;
				
				hh=L"quote";
				windowstatisticsuserquote=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsuserquote->dynamisch(wx,wy);
				hh=strwinquote;
				windowstatisticsuserquotetext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsuserquotetext->dynamisch(wx,wy);
				yit+=off;
				
				hh=L"time";
				windowstatisticsusertime=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsusertime->dynamisch(wx,wy);
				hh=strplaytime;
				windowstatisticsusertimetext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsusertimetext->dynamisch(wx,wy);
				yit+=off;
				
				hh=L"discard";
				windowstatisticsuserdiscard=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsuserdiscard->dynamisch(wx,wy);
				hh=strpoints;
				windowstatisticsuserdiscardtext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsuserdiscardtext->dynamisch(wx,wy);
				yit+=off;
				
				hh=L"moves";
				windowstatisticsusermoves=new _iggtext(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsusermoves->dynamisch(wx,wy);
				hh=strplaymoves;
				windowstatisticsusermovestext=new _iggtext(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24);
				windowstatisticsusermovestext->dynamisch(wx,wy);
				yit+=off;

				windowstatisticsuserverlauf=new _iggbutton(windowstatistics,wx*0.78,440,100,40,strquote,font24,-1);
				windowstatisticsuserverlauf->dynamisch(wx,wy);
				buttoninitmagic(windowstatisticsuserverlauf);
				windowstatisticsuserverlauf->createhilfe(strstatisticsshowverlauf,font18,0.6,0,0);
				guihelpinitmagic(windowstatisticsuserverlauf);
				
				windowstatisticsuserverlaufdiscards=new _iggbutton(windowstatistics,wx*0.78,490,100,40,strpoints,font24,-1);
				windowstatisticsuserverlaufdiscards->dynamisch(wx,wy);
				buttoninitmagic(windowstatisticsuserverlaufdiscards);
				windowstatisticsuserverlaufdiscards->createhilfe(strstatisticsshowpoints,font18,0.6,0,0);
				guihelpinitmagic(windowstatisticsuserverlaufdiscards);

				windowstatisticsuserthisclear=new _iggbutton(windowstatistics,wx*0.4,yit+10,200,65,strstatisticsdeletethis,font24,-1);
				windowstatisticsuserthisclear->dynamisch(wx,wy);
				buttoninitmagic(windowstatisticsuserthisclear);
				windowstatisticsuserthisclear->createhilfe(strstatisticsdeleteplayer,font18,0.6,0,0);
				guihelpinitmagic(windowstatisticsuserthisclear);

				windowstatisticsuserotherclear=new _iggbutton(windowstatistics,wx*0.68,yit+10,200,65,strstatisticsdeleteother,font24,-1);
				windowstatisticsuserotherclear->dynamisch(wx,wy);
				buttoninitmagic(windowstatisticsuserotherclear);
				windowstatisticsuserotherclear->createhilfe(strstatisticsdeleteplayerother,font18,0.6,0,0);
				guihelpinitmagic(windowstatisticsuserotherclear);
				updatemenustatistics();
				windowstatisticsuserlist->scrolltoselection();
				menustatistics->fadeoff();
				menustatistics->visibility(false);
				menustatistics->activity(false);
				menustatistics->fadetarget(menuopacity2);
				menustatistics->fadeopacity(0);
};
int _solitairefantasy::windowstatisticsselectedtype(){
				_zeichenkette<_tt> typ=windowstatisticstypelist->selectiontext();
				int cur=-1;
				for(int i=0;i<gametypecount;i++){
				 if(typ==gametype[i].name){
				  cur=i;
				 };
				};
				return(cur);
};
_zeichenkette<_tt> _solitairefantasy::windowstatisticsselecteduser(){
				if(windowstatisticsuserlist->selection){
				 _iggimage*gi=dynamic_cast<_iggimage*>(windowstatisticsuserlist->selection);
				 if(gi){
				  if(gi->crosslinktext){
				   return(gi->crosslinktext->lesen());
				  };
				 };
				};
				return(L"");
};
void _solitairefantasy::updatemenustatistics(){
				int cur=windowstatisticsselectedtype();
				if(cur!=-1){
				 windowstatisticstypetitle->setzen(strstatisticstotal+L" - "+gametype[cur].name);
				 windowstatisticstypecount->setzen(gamestats[cur]->entrylist.anzahl());
				 if(gamestats[cur]->entrylist.anzahl()){
				  windowstatisticstypequote->setzen(int(gamestats[cur]->quote()*100)+L" %");
				  windowstatisticstypetime->setzen(timemstohhmmss(gamestats[cur]->timeaverage()));
				  windowstatisticstypediscard->setzen(int(gamestats[cur]->discardaverage()));
				  windowstatisticstypemoves->setzen(int(gamestats[cur]->moveaverage()));
				 }else{
				  windowstatisticstypequote->setzen(L"-");
				  windowstatisticstypetime->setzen(L"-");
				  windowstatisticstypediscard->setzen(L"-");
				  windowstatisticstypemoves->setzen(L"-");
				 };
				 _zeichenkette<_tt> usr=windowstatisticsselecteduser();
				 if(usr!=L""){
				  if(cur!=-1) windowstatisticsusertitle->setzen(strstatisticsuser+L" - "+usr+L" in "+gametype[cur].name);
				  windowstatisticsusertitle->fadein();
				  windowstatisticsuserthisclear->fadein();
				  windowstatisticsuserotherclear->fadein();
				  windowstatisticsuserverlauf->fadein();
				  windowstatisticsuserverlaufdiscards->fadein();
				  windowstatisticsusercounttext->fadein();
				  windowstatisticsuserquotetext->fadein();
				  windowstatisticsusertimetext->fadein();
				  windowstatisticsuserdiscardtext->fadein();
				  windowstatisticsusermovestext->fadein();
				  windowstatisticsusercount->fadein();
				  windowstatisticsuserquote->fadein();
				  windowstatisticsusertime->fadein();
				  windowstatisticsuserdiscard->fadein();
				  windowstatisticsusermoves->fadein();
				
				  windowstatisticsusercount->setzen(gamestats[cur]->countuser(usr));
				  if(gamestats[cur]->countuser(usr)>0){
				   windowstatisticsuserquote->setzen(int(gamestats[cur]->quoteuser(usr)*100)+L" %");
				   windowstatisticsusertime->setzen(timemstohhmmss(gamestats[cur]->timeaverageuser(usr)));
				   windowstatisticsuserdiscard->setzen(int(gamestats[cur]->discardaverageuser(usr)));
				   windowstatisticsusermoves->setzen(int(gamestats[cur]->moveaverageuser(usr)));
				  }else{
				   windowstatisticsuserquote->setzen(L"-");
				   windowstatisticsusertime->setzen(L"-");
				   windowstatisticsuserdiscard->setzen(L"-");
				   windowstatisticsusermoves->setzen(L"-");
				  };
				 }else{
				  windowstatisticsusertitle->fadeout();
				  windowstatisticsuserthisclear->fadeout();
				  windowstatisticsuserotherclear->fadeout();
				  windowstatisticsuserverlauf->fadeout();
				  windowstatisticsuserverlaufdiscards->fadeout();
				  windowstatisticsusercounttext->fadeout();
				  windowstatisticsuserquotetext->fadeout();
				  windowstatisticsusertimetext->fadeout();
				  windowstatisticsuserdiscardtext->fadeout();
				  windowstatisticsusermovestext->fadeout();
				  windowstatisticsusercount->fadeout();
				  windowstatisticsuserquote->fadeout();
				  windowstatisticsusertime->fadeout();
				  windowstatisticsuserdiscard->fadeout();
				  windowstatisticsusermoves->fadeout();
				 };
				 windowstatistics->updatefadeopacity();
				};
};
void _solitairefantasy::messageverlauf(){
				_zeichenkette<_tt> usr=windowstatisticsselecteduser();
				int typ=windowstatisticsselectedtype();
				if((typ!=-1)&&(usr!=L"")){
				 iggsystem->saveactivitylist();
				 iggsystem->setactivitylist(false);
				 _zeichenkette<_tt> t=strstatisticsverlaufuser+L" "+usr+L" in "+gametype[typ].name;
				 _zeichenkette<_tt> tbutton=strok;
				 _tg tr=messageboxtextcolor.x();
				 _tg tg=messageboxtextcolor.y();
				 _tg tb=messageboxtextcolor.z();
				 _zeichensatz*f=font24;
				 _bild<_tb>*iwindow=iverlaufwindow;
				 _tg ox=gra->groessex()/2;
				 _tg oy=gra->groessey()/2;
				 gra->orthonormal();
				 _iggwindow*w0;
				 _tg px=ox;
				 _tg py=oy;
				 _tg wy=512;
				 _tg wx=800;//FONT->breite(t$)+messageboxadditiontextwidth
				 _tg maxwx=800;
				 _liste<_zeichenkette<_tt> >*lt=textsplit(t,wx-messageboxadditiontextwidth,f);
				 px-=wx/2;
				 py-=wy/2;
				 w0=new _iggwindow(iggsystem,px,py,wx,wy,1,1,1);
				 w0->position.z(-10);
				 w0->position.kondition(500,1023,400,767,px,py+35,-10,false);
				 windowinitmagic(w0,iwindow);
				 w0->setshadow(25,25);
				 _tg yit=messageboxadditiontexty;
				 _listenknoten<_zeichenkette<_tt> >*tit;
				 if(lt->anfang(tit))do{//for(Local tit:String=EachIn lt
				  new _iggtext(w0,wx/2-font24->breite(tit->objekt())/2,yit,messageboxtextz,*(tit->objekt()),tr,tg,tb,font24);
			 	  yit+=25;
				 }while(lt->naechstes(tit));
				 lt->loeschen();
				 deletesecure(lt);
				 _iggbutton*k0;
				 _tg buw=100;
				 k0=new _iggbutton(w0,wx/2-buw/2-5,wy-60+messageboxadditionbuttony-5,buw,40,tbutton,0);
				 buttoninitmagic(k0);
				 //verlauf generieren
				 _tg diax=100-5;
				 _tg diay=140-5;
				 _tg diaw=wx-200;
				 _tg diah=wy-240;
				 _iggtext*gt=0;
				 _iggline*gl=0;
				 _zeichenkette<_tt> h;
				 _tg gridy;
				 h=L"[%]";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay-(font14->hoehe(h)*1.5+4),1,1,0.8,0.4,font14,-1);
				 gridy=diay-1;
				 h=L"100";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1);

				 gridy=diay+diah*0.25-1;
				 h=L"75";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay+diah*0.25-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				
				 gridy=diay+diah*0.5-1;
				 h=L"50";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay+diah*0.50-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1);

				 gridy=diay+diah*0.75-1;
				 h=L"25";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay+diah*0.75-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1);

				 gridy=diay+diah*1-1;
				 h=L"0";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay+diah-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 
				 _tg yc0=(gametypechancemin(typ)-0.05);
				 _tg yc1=(gametypechancemin(typ)+0.05);
				 if(yc0<0) yc0=0;
				 if(yc1>1) yc1=1;
				 _iggimage*gi=w0->insertimage(inormalrange,diax,diay+diah*(1-yc1),diaw,fabs(diah*(1-yc0)-diah*(1-yc1)),1,0.8,0.4,-1);
				 gi->color.w(0.2);
				
				 int usercount=0;
			     _gamestatsentry*eit;
				 if(gamestats[typ]->entrylist.anfang(eit))do{//for(Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist
				  if(eit->user==usr) usercount++;
				 }while(gamestats[typ]->entrylist.naechstes(eit));
				 if(usercount>0){
				  _gamestatsentry*lasteit=0;
				  _tg lastex=-1;
				  _tg lastey=-1;
				  int gamewon=0;
				  int i=0;
		 		  if(gamestats[typ]->entrylist.anfang(eit))do{//for(Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist
				   if(eit->user==usr){
				    if(eit->discards==gametype[typ].punktemaximal) gamewon++;
				    eit->quoteverlauf=_tg(gamewon)/_tg(i+1);
				    _tg xsh=0.5*diaw/_tg(usercount);
				    _tg ex=diax+diaw*_tg(i)/_tg(usercount)+xsh;
				    _tg ey=diay+diah*(1-eit->quoteverlauf);
				    _tg ew=16;
				    _tg eh=16;
				    _iggimage*gi=w0->insertimage(idonut,ex-ew/2,ey-eh/2,ew,eh,1,1,1,-1);
				    gi->position.z(gi->position.z()-1);
				    _zeichenkette<_tt> tt=L" "+strtipps;
				    _zeichenkette<_tt> tm=L" "+strplaymoves;
				    _zeichenkette<_tt> tp=L" "+strpoints;
				    if(eit->tipps==1) tt=L" "+strtipp;
				    if(eit->moves==1) tm=L" "+strplaymove;
				    if(eit->discards==1) tp=L" "+strpoint;
				   
				    _iggwindow*entryhelp=gi->createhilfe(L"",font18,0,0,0,200,true);
				    windowinitmagic(entryhelp,ilistboxwindow);
				    _iggtext*gth;
				    h=int(eit->quoteverlauf*100)+L"%";
				    if(eit->discards==gametype[typ].punktemaximal) h+=L" ("+strwon+L")"; else h+=L" ("+strlost+L")";
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,40-5,1,1,0.8,0.3,font18);
				    h=eit->discards+tp;
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,60+20-5,1,1,0.8,0.3,font18);
				    h=strduration+L" "+timemstohhmmss(eit->time);
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,60+40-5,1,1,0.8,0.3,font18);
				    h=eit->moves+tm;
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,60+60-5,1,1,0.8,0.3,font18);
				    h=eit->tipps+tt;
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,60+80-5,1,1,0.8,0.3,font18);

				    entryhelp->color.setzen(1,1,1,1);
				    entryhelp->colortransformed=entryhelp->color;
				    entryhelp->fadetarget(1);
				    entryhelp->setshadow(10,10);
				    entryhelp->size.x(200);
				    entryhelp->size.y(_tg(200));
				    entryhelp->animieren(maus,tastatur);
				    if(lasteit){
				     _iggline*gl=w0->insertline(lastex,lastey-1,ex,ey-1,0.4,0.3,0.08);
				     gl->color.w(0.7);
				     gl->position.z(gl->position.z()-0.5);
				    };
				    i++;
				    lasteit=eit;
				    lastex=ex;
				    lastey=ey;
				   };
				  }while(gamestats[typ]->entrylist.naechstes(eit));
				 };
				 w0->visibility(false);
				 w0->activity(false);
				 w0->fadeopacity(0);
				 w0->fadein();
				 w0->fadetarget(menuopacity);
				 menustatistics->fadeout();
				 bool ap;
				 if(game){
				  ap=game->allowpick;
				  game->allowpick=false;
				 };
				 bool q=false;
				 windowstatisticsuserverlauf->hilfe->fadeout();
				 do{
				  iggsystem->nullstates(maus,tastatur);
				  if(animatestandard()) q=true;
				  drawstandard();
				 }while((iggsystem->button==0)&&(tastatur->escape()==false)&&(tastatur->enter()==false)&&(tastatur->knopflinks()==false)&&(tastatur->knopfrechts()==false)&&(q==false));
				 iggsystem->button=0;
				 w0->fadeout(false,false,true);
				 menustatistics->fadein();
				 if(game) game->allowpick=ap;
				 iggsystem->restoreactivitylist();
				};
};
void _solitairefantasy::messagediscards(){
				_zeichenkette<_tt> usr=windowstatisticsselecteduser();
				int typ=windowstatisticsselectedtype();
				if((typ!=-1)&&(usr!=L"")){
				 iggsystem->saveactivitylist();
				 iggsystem->setactivitylist(false);
				 _zeichenkette<_tt> t=strstatisticspointsuser+L" "+usr+L" in "+gametype[typ].name;
				 _zeichenkette<_tt> tbutton=strok;
				 _to tr=messageboxtextcolor.x();
				 _to tg=messageboxtextcolor.y();
				 _to tb=messageboxtextcolor.z();
				 _zeichensatz*f=font24;
				 _bild<_tb>*iwindow=iverlaufwindow;
				 _tg ox=gra->groessex()/2;
				 _tg oy=gra->groessey()/2;
				 gra->orthonormal();
				 _iggwindow*w0;
				 _tg px=ox;
				 _tg py=oy;
				 _tg wy=512;
				 _tg wx=800;
				 _tg maxwx=800;
				 _liste<_zeichenkette<_tt> >*lt=textsplit(t,wx-messageboxadditiontextwidth,f);
				 px-=wx/2;
				 py-=wy/2;
				 w0=new _iggwindow(iggsystem,px,py,wx,wy,1,1,1);
				 w0->position.z(-10);
				 w0->position.kondition(500,1023,400,767,px,py+35,-10,false);
				 windowinitmagic(w0,iwindow);
				 w0->setshadow(25,25);
				 _tg yit=messageboxadditiontexty;
				 _listenknoten<_zeichenkette<_tt> >*tit;
				 if(lt->anfang(tit))do{//for(Local tit:String=EachIn lt
				  new _iggtext(w0,wx/2-font24->breite(tit->objekt())/2-5,yit,messageboxtextz,*(tit->objekt()),tr,tg,tb,font24);
			 	  yit+=25;
				 }while(lt->naechstes(tit));
				 lt->loeschen();
				 deletesecure(lt);
				 _iggbutton*k0;
				 _tg buw=100;
				 k0=new _iggbutton(w0,wx/2-buw/2-5,wy-60+messageboxadditionbuttony-5,buw,40,tbutton,0);
				 buttoninitmagic(k0);
				
				 //verlauf generieren
				 _tg diax=100-5;
				 _tg diay=140-5;
				 _tg diaw=wx-200;
				 _tg diah=wy-240;
				 _iggtext*gt=0;
				 _iggline*gl=0;
				 _zeichenkette<_tt> h;
				 _tg gridy;
				 h=L"[%]";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay-(font14->hoehe(h)*1.5+4),1,1,0.8,0.4,font14,-1);

				 gridy=diay-1;
				 h=L"100";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
			
				 gridy=diay+diah*0.25-1;
				 h=L"75";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay+diah*0.25-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				
				 gridy=diay+diah*0.5-1;
				 h=L"50";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay+diah*0.50-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1);

				 gridy=diay+diah*0.75-1;
				 h=L"25";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay+diah*0.75-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1);

				 gridy=diay+diah*1-1;
				 h=L"0";
			     gt=w0->inserttext(h,diax+diaw*0.5-font14->breite(h)/2,diay+diah-font14->hoehe(h)/2-1,1,1,0.8,0.4,font14,-1);
				 gl=w0->insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2);
				 gl->color.w(0.1);
				 gl=w0->insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2);
				 gl->color.w(0.1); 
				 _gamestatsentry*eit;
				 int usercount=0;
				 if(gamestats[typ]->entrylist.anfang(eit))do{//for(Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist
				  if(eit->user==usr) usercount++;
				 }while(gamestats[typ]->entrylist.naechstes(eit));
				 if(usercount>0){
				  _gamestatsentry*lasteit=0;
				  _tg lastex=-1;
				  _tg lastey=-1;
				  int gamewon=0;
				  int i=0;
				  if(gamestats[typ]->entrylist.anfang(eit))do{//for(Local =EachIn gamestats[typ].entrylist
				   if(eit->user==usr){
				    if(eit->discards==gametype[typ].punktemaximal) gamewon++;
				    eit->quoteverlauf=_tg(gamewon)/_tg(i+1);
					_tg eitpoints=_tg(eit->discards)/_tg(gametype[typ].punktemaximal);
				    _tg xsh=0.5*diaw/_tg(usercount);
				    _tg ex=diax+diaw*_tg(i)/_tg(usercount)+xsh;
				    _tg ey=diay+diah*(1-eitpoints);
				    _tg ew=16;
				    _tg eh=16;
				    _iggimage*gi=w0->insertimage(idonut,ex-ew/2,ey-eh/2,ew,eh,1,1,1,-1);
				    gi->position.z(gi->position.z()-1);
				    _zeichenkette<_tt> tt=L" "+strtipps;
				    _zeichenkette<_tt> tm=L" "+strplaymoves;
				    _zeichenkette<_tt> tp=L"% "+strquote;
				    if(eit->tipps==1) tt=L" "+strtipp;
				    if(eit->moves==1) tm=L" "+strplaymove;
				    _iggwindow*entryhelp=gi->createhilfe(L"",font18,0,0,0,200,true);
				    windowinitmagic(entryhelp,ilistboxwindow);
				    _iggtext*gth;
				    h=_zeichenkette<_tt>(int(eitpoints*100))+L"% ("+_zeichenkette<_tt>(eit->discards)+L"/"+gametype[typ].punktemaximal+L")";
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,40-5,1,1,0.8,0.3,font18);
				
				    h=int(eit->quoteverlauf*100)+tp;
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,60+20-5,1,1,0.8,0.3,font18);

				    h=strduration+L" "+timemstohhmmss(eit->time);
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,60+40-5,1,1,0.8,0.3,font18);

				    h=eit->moves+tm;
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,60+60-5,1,1,0.8,0.3,font18);

				    h=eit->tipps+tt;
				    gth=entryhelp->inserttext(h,100-font18->breite(h)/2-5,60+80-5,1,1,0.8,0.3,font18);
				    entryhelp->color.setzen(1,1,1,1);
				    entryhelp->colortransformed=entryhelp->color;
				    entryhelp->fadetarget(1);
				    entryhelp->setshadow(10,10);
				    entryhelp->size.x(200);
				    entryhelp->size.y(_tg(200));
				    entryhelp->animieren(maus,tastatur);
				    if(lasteit){
				     _iggline*gl=w0->insertline(lastex,lastey-1,ex,ey-1,0.4,0.3,0.08);
				     gl->color.w(0.7);
				     gl->position.z(gl->position.z()-0.5);
				    };
				    i+=1;
				    lasteit=eit;
				    lastex=ex;
				    lastey=ey;
				   };
				  }while(gamestats[typ]->entrylist.naechstes(eit));
				 };
				 w0->visibility(false);
				 w0->activity(false);
				 w0->fadeopacity(0);
				 w0->fadein();
				 w0->fadetarget(menuopacity);
				 menustatistics->fadeout();
				 bool ap;
				 if(game){
				  ap=game->allowpick;
				  game->allowpick=false;
				 };
				 bool q=false;
				 windowstatisticsuserverlauf->hilfe->fadeout();
				 do{
				  iggsystem->nullstates(maus,tastatur);
				  if(animatestandard()) q=true;
				  drawstandard();
				 }while((iggsystem->button==0)&&(tastatur->escape()==false)&&(tastatur->enter()==false)&&(tastatur->knopflinks()==false)&&(tastatur->knopfrechts()==false)&&(q==false));
				 iggsystem->button=0;
				 w0->fadeout(false,false,true);
				 menustatistics->fadein();
				 if(game) game->allowpick=ap;
				 iggsystem->restoreactivitylist();
				};
};
//******************************************************************************************************************
//										R A N K S  M E N U 
//******************************************************************************************************************				
void _solitairefantasy::createmenuranks(){
				_to tr=1,tg=0.8,tb=0.4;
				_tg lx=250;
				_tg ly=100;
				_tg y=80;
				_tg x=670;
				_tg wx=800;
				_tg wy=650;
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg yit=0;
				_tg off=28;
	
				menuranks=menuman->createmenu();
				windowranks=new _iggwindow(iggsystem,int(-wx/2+90),int(-wy/2),wx,wy+40,1,1,1);
				windowranks->position.addieren(0.5,0.5,0,true);
				windowranks->position.kondition(500,1023,400,767,  100,5,-1,false);
				windowranks->size.kondition(500,1023,400,767,  690,590,1,false);
				windowranks->shadow=false;
				windowinitmagic(windowranks,igametypewindow);
				menuranks->add(windowranks);
				
				buttonranksmainmenu=new _iggbutton(iggsystem,-wx/2-(buttonwidth-50)-10+90,-wy/2,buttonwidth-40,buttonheight,strmenu,font24,11);
				buttonranksmainmenu->position.addieren(0.5,0.5,0,true);
				buttonranksmainmenu->position.kondition(500,1023,400,767,  5,5,-1,false);
				buttonranksmainmenu->size.kondition(500,1023,400,767,  buttonwidth-80,buttonheight-10,1,false);
				buttoninitmagic(buttonranksmainmenu);
				menuranks->add(buttonranksmainmenu);
				
				buttonranksstatistics=new _iggbutton(iggsystem,-wx/2-(buttonwidth-50)-10+90,-wy/2+bh+off,buttonwidth-40,buttonheight,strstatistics,font24,-1);
				buttonranksstatistics->position.addieren(0.5,0.5,0,true);
				buttonranksstatistics->position.kondition(500,1023,400,767,  5,buttonheight+5+5,-1,false);
				buttonranksstatistics->size.kondition(500,1023,400,767,  buttonwidth-80,buttonheight-10,1,false);

				buttoninitmagic(buttonranksstatistics);
				menuranks->add(buttonranksstatistics);
			    _tg wxx=windowranks->breite();
			    _tg wyy=windowranks->hoehe();
				_zeichenkette<_tt> hh=strranks;
				windowrankstitle=new _iggtext(windowranks,0.5,60/(wy+40),1,hh,1,0.95,0.8,font30);
				windowrankstitle->position.dynamik(true);
				
				windowrankstypelist=new _igglistbox(windowranks,60,100,200,wy-180,8,1,1,1);
				windowrankstypelist->selectionrect=true;
				windowrankstypelist->moverrect=true;
				windowrankstypelist->dynamisch(wx,wy+40);
				listboxinitmagic(windowrankstypelist);
				//-------------------------------------- create sort box
				windowrankssortbox=new _iggcombobox(windowranks,60,100+(wy-180)+5,200,40,60,-1,1,1,1  ,260,(100+(wy-180)+5)-150,210,200, 30, 0, font18);
				windowrankssortbox->dynamisch(wx,wy+40);
				windowrankssortbox->listbox->selectionrect=true;
				windowrankssortbox->listbox->moverrect=true;
				windowrankssortbox->listbox->dynamischort(wx,wy+40);
				comboboxinitmagic(windowrankssortbox);
				_iggtext*gt;
				_tg sey=0;
				_zeichenkette<_tt> hse;
				_tg txo=210/2-35;
				_tg tx;
				hse=strgametypesortalphabetical;tx=txo-font18->breite(hse)/2;
				gt=windowrankssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,0);sey+=22;
				
				hse=strgametypesortpublicity;tx=txo-font18->breite(hse)/2;
				gt=windowrankssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,1);sey+=22;gt->createhilfe(strgametypesortpublicitydesc,font18,0.1,200,0);guihelpinitmagic(gt);
				
				hse=strgametypesortchance;tx=txo-font18->breite(hse)/2;
				gt=windowrankssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,2);sey+=22;gt->createhilfe(strgametypesortchancedesc,font18,0.1,200,0);guihelpinitmagic(gt);
				
				hse=strgametypesortskill;tx=txo-font18->breite(hse)/2;
				gt=windowrankssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,3);sey+=22;gt->createhilfe(strgametypesortskilldesc,font18,0.1,200,0);guihelpinitmagic(gt);
				
				hse=strgametypesorttime;tx=txo-font18->breite(hse)/2;
				gt=windowrankssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,4);sey+=22;gt->createhilfe(strgametypesorttimedesc,font18,0.1,200,0);guihelpinitmagic(gt);
				
				hse=strgametypesorttype;tx=txo-font18->breite(hse)/2;
				gt=windowrankssortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,5);sey+=22;
				
				windowrankssortbox->listbox->superinactivity(true);
				windowrankssortbox->listbox->superinvisibility(true);
				windowrankssortbox->listbox->fadeopacity(0);
				windowrankssortbox->createhilfe(strsortbox,font18,0.5,0,0);
				windowrankssortbox->button->createhilfe(strsortboxbutton,font18,0.5,0,0);
				guihelpinitmagic(windowrankssortbox);
				guihelpinitmagic(windowrankssortbox->button);
				
				windowrankssortbox->clearbackground();
				windowrankssortbox->shadow=false;
				windowrankssortbox->superinvisible=true;
				windowrankssortbox->text->setzen(strgametypesortalphabetical);
				windowrankssortbox->text->textshadow=1;
				updatelistboxgametypesorted(windowrankstypelist,current_preview);
				windowranksranklist=new _igglistbox(windowranks,270,100,wx-270-70,wy-140,8,1,1,1);
				windowranksranklist->selectionrect=true;
				windowranksranklist->moverrect=true;
				windowranksranklist->dynamisch(wx,wy+40);
				listboxinitmagic(windowranksranklist);
				//-------------------------------------------------------
				updatemenuranks();
				menuranks->fadeoff();
				menuranks->visibility(false);
				menuranks->activity(false);
				menuranks->fadetarget(menuopacity2);
				menuranks->fadeopacity(0);
};
int _solitairefantasy::windowranksselectedtype(){
				_zeichenkette<_tt> typ=windowrankstypelist->selectiontext();
				int cur=-1;
				for(int i=0;i<gametypecount;i++){
				 if(typ==gametype[i].name) cur=i;
				};
				return(cur);
};				
void _solitairefantasy::updatemenuranks(){
        		_listenknoten<_benutzer>*uit;
        		_listesortierung<_benutzer> userlist;
        		_iggtext*gt;
				int typ=windowranksselectedtype();
				windowranksranklist->loeschen();
				if(typ!=-1){
				 // alle user ermitteln
				 _gamestatsentry*eit;
				 if(gamestats[typ]->entrylist.anfang(eit))do{//for(Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist
				  _benutzer*eu=usermanagement->benutzer(eit->user);
				  if(eu) userlist.einhaengenunredundant(eu);
				 }while(gamestats[typ]->entrylist.naechstes(eit));
				 if(userlist.anzahl()>0){
				  // score dieser user ermitteln
				  if(userlist.anfang(uit))do{//for(Local uit:_user=EachIn userlist
				   uit->objekt()->punkte(0);
				   _tg ce=0;
				   if(gamestats[typ]->entrylist.anfang(eit))do{//for(Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist  
				    if(eit->user==uit->objekt()->name()){
				     uit->objekt()->punkte(uit->objekt()->punkte()+eit->score());
				     ce+=1;
				    };
				   }while(gamestats[typ]->entrylist.naechstes(eit));
				   if(ce>0) uit->objekt()->punkte(uit->objekt()->punkte()/ce);
				  }while(userlist.naechstes(uit));
				  userlist.sortieren();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				  _tg yit=20;
				  _tg wx=128;
				  _tg wy=128;
				  int platz=1;
				  _iggimage*gim;
				  _iggimage*gimf;
				  
				  if(userlist.anfang(uit))do{//for(Local uit:_user=EachIn userlist
				   gim=windowranksranklist->insertimage(uit->objekt()->bild(),windowranksranklist->breite()/2-wx/2,yit,wx,wy,1,1,1,-1);
				   gim->selectable=false;		
				   gimf=windowranksranklist->insertimage(iframe,windowranksranklist->breite()/2-wx/2-5,yit-5,wx+10,wy+10,1,1,1,-1);
				   gimf->selectable=false;
				   gt=windowranksranklist->inserttext(uit->objekt()->name(),windowranksranklist->breite()/2-font30->breite(uit->objekt()->name())/2,yit+wy+20,1,1,0.8,0.5,font30,-1);
				   gt->selectable=false;
				   _zeichenkette<_tt> h;
				   h=strrank+L" : "+platz;
				   if(userlist.anzahl()==1) h+=L" ("+strunrivaled+L")";//(außer Konkurrenz)"
				   gt=windowranksranklist->inserttext(h,windowranksranklist->breite()/2-font18->breite(h)/2,yit+wy+20+35,1,1,0.8,0.5,font18,-1);
 				   gt->selectable=false;

				   h=strscore+L" : "+int(uit->objekt()->punkte());
				   gt=windowranksranklist->inserttext(h,windowranksranklist->breite()/2-font18->breite(h)/2,yit+wy+20+55,1,1,0.8,0.5,font18,-1);
 				   gt->selectable=false;
				   yit+=120+wy;
				   platz+=1; 
				  }while(userlist.naechstes(uit));
				 }else{
				  _zeichenkette<_tt> h=L"("+strnoentries+L")";
				  gt=windowranksranklist->inserttext(h,windowranksranklist->breite()/2-font30->breite(h)/2,windowranksranklist->hoehe()/2-font30->hoehe(h)/2,1,1,0.8,0.5,font30,-1);
				  gt->selectable=false;
				  gt->color.w(0.45);
				 };
				 _zeichenkette<_tt> hh=strranklist+L" "+strfor+L" "+gametype[typ].name;
				 windowrankstitle->setzen(hh);
				 windowrankstitle->position.x(0.5-(windowrankstitle->font->breite(hh)/windowranks->breite())*0.5);
				 windowranks->animieren(maus,tastatur);
				};
};				
//******************************************************************************************************************
//										O P T I O N S  M E N U 
//******************************************************************************************************************
void _solitairefantasy::createmenuoptionsacoustics(){
				_to tr=1,tg=0.8,tb=0.6;
				_tg lx=250;
				_tg ly=100;
				_tg wx=512;
				_tg wy=723;
				
				menuoptionsacoustics=menuman->createmenu();
				windowoptionsacoustics=new _iggwindow(iggsystem,int(-wx/2),int(-wy/2),wx,wy,1,1,1);
				windowoptionsacoustics->position.addieren(0.5,0.5,0,true);
				windowoptionsacoustics->position.kondition(500,1023,400,767,280,3,-1,false);
				windowoptionsacoustics->size.kondition(500,1023,400,767,wx,600,1,false);
				windowoptionsacoustics->setshadow(10,10);
				windowinitmagic(windowoptionsacoustics,iguiwindow);
				menuoptionsacoustics->add(windowoptionsacoustics);
				
				buttonoptionsacousticsmainmenu=new _iggbutton(iggsystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,font24,11);
				buttonoptionsacousticsmainmenu->position.addieren(0.5,0.5,0,true);
				buttonoptionsacousticsmainmenu->position.kondition(500,1023,400,767, 20,10,-1,false);
				buttoninitmagic(buttonoptionsacousticsmainmenu);
				menuoptionsacoustics->add(buttonoptionsacousticsmainmenu);
				
				createmenuoptionsbutton(windowoptionsacoustics,menuoptionsacoustics,0);
				_zeichenkette<_tt> hh=strgeneral;
				ttitleacoustics=new _iggtext(windowoptionsacoustics,(wx/2)-font30->breite(hh)/2,50,1.25,hh,0.97,0.84,0.68,font30);
				
				_tg y=150;
				_tg off=35;
				//tva=new _iggtext
				//tva.init(windowoptionsacoustics,50,y,2,ambient,tr,tg,tb,font18)
				//tbva=new _iggtrackbar
				//tbva.init(windowoptionsacoustics,250,y,150,25,1,1,1,volumeambience,0,1,12);y+=off
				//trackbarinitmagic(tbva)
				
				_zeichenkette<_tt> htx;
				_tg txo=256-5;
				_tg tx;
				_tg ex=256+5;
				
				htx=strambience;
				tx=font18->breite(htx);
				tva=new _iggtext(windowoptionsacoustics,txo-tx-30,y,1,htx,tr,tg,tb,font18);
				tbva=new _iggtrackbar(windowoptionsacoustics,ex-30,y,150,25,font18,1,1,1,volumeambience,0,1);y+=off;
				tbva->displaymultiplier=100;
				tbva->displayaddition=L" %";
				tbva->displayrounding=true;
				trackbarinitmagic(tbva);

				htx=strsounds;
				tx=font18->breite(htx);
				tvs=new _iggtext(windowoptionsacoustics,txo-tx-30,y,1,htx,tr,tg,tb,font18);
				tbvs=new _iggtrackbar(windowoptionsacoustics,ex-30,y,150,25,font18,1,1,1,volumesound,0,1);y+=off;
				tbvs->displaymultiplier=100;
				tbvs->displayaddition=L" %";
				tbvs->displayrounding=true;				
				trackbarinitmagic(tbvs);
				
				htx=strmusic;
				tx=font18->breite(htx);
				tvm=new _iggtext(windowoptionsacoustics,txo-tx-30,y,1,strmusic,tr,tg,tb,font18);
				tbvm=new _iggtrackbar(windowoptionsacoustics,ex-30,y,150,25,font18,1,1,1,musicman->lautstaerke(),0,1);y+=off;
				tbvm->displaymultiplier=100;
				tbvm->displayaddition=L" %";
				tbvm->displayrounding=true;
				trackbarinitmagic(tbvm);
				/*
				tfs=new _iggtext
				tfs.init(windowoptionsacoustics,50,y,2,strmusicsequence,tr,tg,tb,font18)
				cbms=new _iggcheckbox
				cbms.init(windowoptionsacoustics,250,y,19,19,16);y+=off
				checkboxinitmagic(cbms)
				cbms.checked=musicsequence
				*/
				
				y+=off+20;

				htx=strfullscreen;
				tx=font18->breite(htx);
				tfs=new _iggtext(windowoptionsacoustics,txo-tx,y,1,htx,tr,tg,tb,font18);
				cbfs=new _iggcheckbox(windowoptionsacoustics,ex,y+checkboxoffy,checkboxwidth,checkboxheight);y+=off;
				checkboxinitmagic(cbfs);
				cbfs->checked=fullscreen;
				updatefullscreenhelp();
				
				htx=strsystemaccellerate;
				tx=font18->breite(htx);
				tsp=new _iggtext(windowoptionsacoustics,txo-tx,y,1,strsystemaccellerate,tr,tg,tb,font18);
				tsp->createhilfe(strsystemaccelleratehelp,font18,0.1,0,0);
				guihelpinitmagic(tsp);
				cbsp=new _iggcheckbox(windowoptionsacoustics,ex,y+checkboxoffy,checkboxwidth,checkboxheight);y+=off;
				cbsp->createhilfe(strsystemaccelleratehelp,font18,1,0,0);
				guihelpinitmagic(cbsp);
				checkboxinitmagic(cbsp);
				cbsp->checked=systemaccellerate;

				htx=strfastvideomode;
				tx=font18->breite(htx);
				tfv=new _iggtext(windowoptionsacoustics,txo-tx,y,1,strfastvideomode,tr,tg,tb,font18);
				tfv->createhilfe(strfastvideomodehelp,font18,0.1,0,0);
				guihelpinitmagic(tfv);

				cbfv=new _iggcheckbox(windowoptionsacoustics,ex,y+checkboxoffy,checkboxwidth,checkboxheight);y+=off;
				checkboxinitmagic(cbfv);
				cbfv->checked=fastvideomode;

				htx=strvideosynchronisation;
				tx=font18->breite(htx);
				tsy=new _iggtext(windowoptionsacoustics,txo-tx,y,1,strvideosynchronisation,tr,tg,tb,font18);
				tsy->createhilfe(strvideosynchronisationhelp,font18,0.1,0,0);
				guihelpinitmagic(tsy);
				cbsy=new _iggcheckbox(windowoptionsacoustics,ex,y+checkboxoffy,checkboxwidth,checkboxheight);y+=off;
				checkboxinitmagic(cbsy);
				cbsy->checked=videosynchronisation;
				/*
				tmb=new _iggtext
				tmb.init(windowoptionsacoustics,50,y,2,strmybenchmark,tr,tg,tb,font18)
				cbmb=new _iggcheckbox
				cbmb.init(windowoptionsacoustics,250,y,19,19,16);y+=off
				checkboxinitmagic(cbmb)
				cbmb.checked=mybenchmark
				*/
				menuoptionsacoustics->visibility(false);
				menuoptionsacoustics->activity(false);
				menuoptionsacoustics->fadetarget(menuopacity2);
				menuoptionsacoustics->fadeopacity(0);
};			
void _solitairefantasy::updatefullscreenhelp(){
				if(fastvideomode==false){
				 _zeichenkette<_tt> hx=desktopwidth;//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! initialisierung noch mchen !!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 _zeichenkette<_tt> hy=desktopheight;
				 tfs->createhilfe(strfullscreenhelp+hx+L" x "+hy+L".",font18,0.1,0,0);
				 cbfs->createhilfe(strfullscreenhelp+hx+L" x "+hy+L".",font18,1,0,0);
				}else{
				 tfs->createhilfe(strfullscreenfasthelp,font18,0.1,0,0);
				 cbfs->createhilfe(strfullscreenfasthelp,font18,1,0,0);
				};
				guihelpinitmagic(tfs);
				guihelpinitmagic(cbfs);
				updatemenumain();
};
void _solitairefantasy::createmenuoptionsgraphics(){
				_to tr=1,tg=0.8,tb=0.6;
				_tg lx=250;
				_tg ly=100;
				_tg wx=512;
				_tg wy=723;
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg y=100;
				_tg x=650;
				_tg off=15;
				_tg cboy=-6;
				_tg cbw=checkboxwidth-4;
				_tg cbh=checkboxheight-4;
				_tg tbw=150;
				
				gra->orthonormal();
				menuoptionsgraphics=menuman->createmenu();
				windowoptionsgraphics=new _iggwindow(iggsystem,int(-wx/2),int(-wy/2),wx,wy,1,1,1);
				windowoptionsgraphics->position.addieren(0.5,0.5,0,true);
				windowoptionsgraphics->position.kondition(500,1023,400,767,280,3,-1,false);
				windowoptionsgraphics->size.kondition(500,1023,400,767,wx,600,1,false);
				windowoptionsgraphics->setshadow(10,10);
				windowinitmagic(windowoptionsgraphics,iguiwindow);
				menuoptionsgraphics->add(windowoptionsgraphics);
				
				buttonoptionsgraphicsmainmenu=new _iggbutton(iggsystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,font24,11);
				buttonoptionsgraphicsmainmenu->position.addieren(0.5,0.5,0,true);
				buttonoptionsgraphicsmainmenu->position.kondition(500,1023,400,767, 20,10,-1,false);
				buttoninitmagic(buttonoptionsgraphicsmainmenu);
				menuoptionsgraphics->add(buttonoptionsgraphicsmainmenu);
				createmenuoptionsbutton(windowoptionsgraphics,menuoptionsgraphics,1);
						
				_zeichenkette<_tt> hh=strgraphics;
				ttitlegraphics=new _iggtext(windowoptionsgraphics,(wx/2)-font30->breite(hh)/2,50,1.25,hh,0.97,0.84,0.68,font30);
				off=27;
				y=100;
				_zeichenkette<_tt> htx;
				_tg tx;			
				_tg txo=wx/2-5;
				_tg ex=wx/2+5;	
				htx=strtimeduringgame;
				tx=font18->breite(htx);				
				tgrtd=new _iggtext(windowoptionsgraphics,txo-tx,y,1,htx,tr,tg,tb,font18);
				cbgrtd=new _iggcheckbox(windowoptionsgraphics,ex,y+cboy,cbw,cbh);y+=off;
				checkboxinitmagic(cbgrtd);
				cbgrtd->checked=timeduringgame;
				
				htx=strgamebuttons;
				tx=font18->breite(htx);
				tgrgp=new _iggtext(windowoptionsgraphics,txo-tx,y,1,strgamebuttons,tr,tg,tb,font18);
				tgrgp->createhilfe(strgamebuttonshelp,font18,0.2,0,0);
				guihelpinitmagic(tgrgp);
				cbgrgp=new _iggcheckbox(windowoptionsgraphics,ex,y+cboy,cbw,cbh);y+=off;
				cbgrgp->createhilfe(strgamebuttonshelp,font18,1,0,0);
				guihelpinitmagic(cbgrgp);
				checkboxinitmagic(cbgrgp);
				cbgrgp->checked=gameplaybuttons;

				htx=strmenubuttons;
				tx=font18->breite(htx);
				tgrmb=new _iggtext(windowoptionsgraphics,txo-tx,y,1,strmenubuttons,tr,tg,tb,font18);
				tgrmb->createhilfe(strmenubuttonshelp,font18,0.2,0,0);
				guihelpinitmagic(tgrmb);
				cbgrmb=new _iggcheckbox(windowoptionsgraphics,ex,y+cboy,cbw,cbh);y+=off;
				cbgrmb->createhilfe(strmenubuttonshelp,font18,1,0,0);
				guihelpinitmagic(cbgrmb);
				checkboxinitmagic(cbgrmb);
				cbgrmb->checked=menubuttons;

				htx=strsparkingmouse;
				tx=font18->breite(htx);
				tgrsm=new _iggtext(windowoptionsgraphics,txo-tx,y,1,strsparkingmouse,tr,tg,tb,font18);
				cbgrsm=new _iggcheckbox(windowoptionsgraphics,ex,y+cboy,cbw,cbh);y+=off;
				checkboxinitmagic(cbgrsm);
				cbgrsm->checked=sparkingmouse;

				htx=strmouseovercard;
				tx=font18->breite(htx);
				tgrmo=new _iggtext(windowoptionsgraphics,txo-tx,y,1,strmouseovercard,tr,tg,tb,font18);
				tgrmo->createhilfe(strmouseovercardhelp,font18,0.2,0,0);
				guihelpinitmagic(tgrmo);
				cbgrmo=new _iggcheckbox(windowoptionsgraphics,ex,y+cboy,cbw,cbh);y+=off;
				cbgrmo->createhilfe(strmouseovercardhelp,font18,1,0,0);
				guihelpinitmagic(cbgrmo);
				checkboxinitmagic(cbgrmo);
				cbgrmo->checked=mouseovercard;

				htx=strmouseoverpile;
				tx=font18->breite(htx);
				tgrmp=new _iggtext(windowoptionsgraphics,txo-tx,y,1,strmouseoverpile,tr,tg,tb,font18);
				cbgrmp=new _iggcheckbox(windowoptionsgraphics,ex,y+cboy,cbw,cbh);y+=off;
				checkboxinitmagic(cbgrmp);
				cbgrmp->checked=mouseoverpile;

				htx=strgreenboard;
				tx=font18->breite(htx);
				tgrgr=new _iggtext(windowoptionsgraphics,txo-tx,y,1,htx,tr,tg,tb,font18);
				cbgrgr=new _iggcheckbox(windowoptionsgraphics,ex,y+cboy,cbw,cbh);y+=off;
				checkboxinitmagic(cbgrgr);
				cbgrgr->checked=greenboard;

				htx=strnaturalpiles;
				tx=font18->breite(htx);
				tgrnp=new _iggtext(windowoptionsgraphics,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgrnp->createhilfe(strnaturalpileshelp,font18,0.2,0,0);
				guihelpinitmagic(tgrnp);
				tbgrnp=new _iggtrackbar(windowoptionsgraphics,ex,y,tbw,25,font18,1,1,1,0,0,1);y+=off;
				tbgrnp->createhilfe(strnaturalpileshelp,font18,1,0,0);
				guihelpinitmagic(tbgrnp);
				trackbarinitmagic(tbgrnp);
				tbgrnp->setzen(naturalpiles);
				y+=10+20;
				y+=15+20+50+12+5;

				txo-=30;
				ex-=30;
				tbw-=20;
				htx=strcardlighting;
				tx=font18->breite(htx);
				tgrci=new _iggtext(windowoptionsgraphics,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgrci->position.kondition(500,1023,400,767, txo-tx,y-30,-1,false);
				_tg lighty=y;
				tbgrci=new _iggtrackbar(windowoptionsgraphics,ex,y,tbw,25,font18,1,1,1,0,0,1);
				tbgrci->position.kondition(500,1023,400,767,ex,y-30,-1,false);y+=off;
				trackbarinitmagic(tbgrci);
				tbgrci->setzen(cardlighting);

				_tg oy=y;
				htx=strcandle;
				tx=font18->breite(htx);
				tfarbekerzer=new _iggtext(windowoptionsgraphics,txo-tx,y,1,strcandle,tr,tg,tb,font18);
				tfarbekerzer->position.kondition(500,1023,400,767, txo-tx,y-30,-1,false);
				_iggimage*gii=windowoptionsgraphics->insertimage(idonutred,ex,y+2.5,20,20,1,1,1,-1);
				gii->position.kondition(500,1023,400,767,   ex-tbw-10,y-5,-1,false);
				sfarbekerzer=new _iggtrackbar(windowoptionsgraphics,ex+20,y,tbw-20,25,font18,1,1,1,0,0.0,1);y+=off;
				sfarbekerzer->position.kondition(500,1023,400,767,   ex+20 - (tbw+10),y-35,-1,false);
				trackbarinitmagic(sfarbekerzer);
				sfarbekerzer->setzen(farbekerze.x());

				tfarbekerzeg=new _iggtext(windowoptionsgraphics,50,y,1,L"",tr,tg,tb,font18);
				gii=windowoptionsgraphics->insertimage(idonutgreen,ex,y+2.5,20,20,1,1,1,-1);
				gii->position.kondition(500,1023,400,767,   ex-tbw-10,y-5,-1,false);
				sfarbekerzeg=new _iggtrackbar(windowoptionsgraphics,ex+20,y,tbw-20,25,font18,1,1,1,0,0.0,1);y+=off;
				sfarbekerzeg->position.kondition(500,1023,400,767,   ex+20 - (tbw+10),y-35,-1,false);
				trackbarinitmagic(sfarbekerzeg);
				sfarbekerzeg->setzen(farbekerze.y());

				tfarbekerzeb=new _iggtext(windowoptionsgraphics,50,y,1,L"",tr,tg,tb,font18);
				gii=windowoptionsgraphics->insertimage(idonutblue,ex,y+2.5,20,20,1,1,1,-1);
				gii->position.kondition(500,1023,400,767,   ex-tbw-10,y-5,-1,false);
				sfarbekerzeb=new _iggtrackbar(windowoptionsgraphics,ex+20,y,tbw-20,25,font18,1,1,1,0,0.0,1);y+=off;
				sfarbekerzeb->position.kondition(500,1023,400,767,   ex+20 - (tbw+10),y-35,-1,false);
				trackbarinitmagic(sfarbekerzeb);
				sfarbekerzeb->setzen(farbekerze.z());

				_tg ky=oy;

				htx=strambiencelight;
				tx=font18->breite(htx);
				tfarbeambienzr=new _iggtext(windowoptionsgraphics,txo-tx,y,1,strambiencelight,tr,tg,tb,font18);
				tfarbeambienzr->position.kondition(500,1023,400,767, 40+ex+20,ky-30,-1,false);
				gii=windowoptionsgraphics->insertimage(idonutred,ex,y+2.5,20,20,1,1,1,-1);
				gii->position.kondition(500,1023,400,767,   ex+40,ky-5,-1,false);
				sfarbeambienzr=new _iggtrackbar(windowoptionsgraphics,ex+20,y,tbw-20,25,font18,1,1,1,0,0.0,1);y+=off;
				sfarbeambienzr->position.kondition(500,1023,400,767,   ex+60,ky-5,-1,false);ky+=off;
				trackbarinitmagic(sfarbeambienzr);
				sfarbeambienzr->setzen(world->lichtambient().x());

				tfarbeambienzg=new _iggtext(windowoptionsgraphics,50,y,1,L"",tr,tg,tb,font18);
				gii=windowoptionsgraphics->insertimage(idonutgreen,ex,y+2.5,20,20,1,1,1,-1);
				gii->position.kondition(500,1023,400,767,   ex+40,ky-5,-1,false);
				sfarbeambienzg=new _iggtrackbar(windowoptionsgraphics,ex+20,y,tbw-20,25,font18,1,1,1,0,0.0,1);y+=off;
				sfarbeambienzg->position.kondition(500,1023,400,767,   ex+60,ky-5,-1,false);ky+=off;
				trackbarinitmagic(sfarbeambienzg);
				sfarbeambienzg->setzen(world->lichtambient().y());

				tfarbeambienzb=new _iggtext(windowoptionsgraphics,50,y,1,L"",tr,tg,tb,font18);
				gii=windowoptionsgraphics->insertimage(idonutblue,ex,y+2.5,20,20,1,1,1,-1);
				gii->position.kondition(500,1023,400,767,   ex+40,ky-5,-1,false);
				sfarbeambienzb=new _iggtrackbar(windowoptionsgraphics,ex+20,y,tbw-20,25,font18,1,1,1,0,0.0,1);y+=off;
				sfarbeambienzb->position.kondition(500,1023,400,767,   ex+60,ky-5,-1,false);ky+=off;
				trackbarinitmagic(sfarbeambienzb);
				sfarbeambienzb->setzen(world->lichtambient().z());

				y=320;
				lx=265;
				_tg bhl=50;
				_tg bwl=140;
				buttonoptionsgraphicslightbright=new _iggbutton(windowoptionsgraphics,lx-5-bwl,y,bwl,bhl,strlightbright,font24);
				buttonoptionsgraphicslightbright->position.kondition(500,1023,400,767,  lx-5-bwl,y, -1,false);
				buttonoptionsgraphicslightbright->size.kondition(500,1023,400,767,  bwl,bhl-10,1,false);
				buttoninitmagic(buttonoptionsgraphicslightbright);

				buttonoptionsgraphicslightmedium=new _iggbutton(windowoptionsgraphics,lx-5-bwl,y+bhl+5,bwl,bhl,strlightmedium,font24);
				buttonoptionsgraphicslightmedium->position.kondition(500,1023,400,767,  lx-5-bwl,y+bhl-5,-1,false);
				buttonoptionsgraphicslightmedium->size.kondition(500,1023,400,767,  bwl,bhl-10,1,false);
				buttoninitmagic(buttonoptionsgraphicslightmedium);

				buttonoptionsgraphicslightnatural=new _iggbutton(windowoptionsgraphics,lx,y,bwl,bhl,strlightnatural,font24);
				buttonoptionsgraphicslightnatural->position.kondition(500,1023,400,767,  lx,y,-1,false);
				buttonoptionsgraphicslightnatural->size.kondition(500,1023,400,767,  bwl,bhl-10,1,false);
				buttoninitmagic(buttonoptionsgraphicslightnatural);

				buttonoptionsgraphicslightnight=new _iggbutton(windowoptionsgraphics,lx,y+bhl+5,bwl,bhl,strlightnight,font24);
				buttonoptionsgraphicslightnight->position.kondition(500,1023,400,767,  lx,y+bhl-5, -1,false);
				buttonoptionsgraphicslightnight->size.kondition(500,1023,400,767,  bwl,bhl-10,1,false);
				buttoninitmagic(buttonoptionsgraphicslightnight);
				
				menuoptionsgraphics->visibility(false);
				menuoptionsgraphics->activity(false);
				menuoptionsgraphics->fadetarget(menuopacity2);
				menuoptionsgraphics->fadeopacity(0);
};
void _solitairefantasy::createmenuoptionsgame(){
				_to tr=1,tg=0.8,tb=0.6;
				_tg lx=250;
				_tg ly=100;
				_tg wx=512;
				_tg wy=723;
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg y=100;
				_tg x=650;
				_tg xg;
				_tg off=20;
	
				menuoptionsgame=menuman->createmenu();
				windowoptionsgame=new _iggwindow(iggsystem,int(-wx/2),int(-wy/2),wx,wy,1,1,1);
				windowoptionsgame->position.addieren(0.5,0.5,0,true);
				windowoptionsgame->position.kondition(500,1023,400,767,280,3,-1,false);
				windowoptionsgame->size.kondition(500,1023,400,767,wx,600,1,false);
				windowoptionsgame->setshadow(10,10);
				windowinitmagic(windowoptionsgame,iguiwindow);
				menuoptionsgame->add(windowoptionsgame);
				
				buttonoptionsgamemainmenu=new _iggbutton(iggsystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,font24,11);
				buttonoptionsgamemainmenu->position.addieren(0.5,0.5,0,true);
				buttonoptionsgamemainmenu->position.kondition(500,1023,400,767, 20,10,-1,false);
				buttoninitmagic(buttonoptionsgamemainmenu);
				menuoptionsgame->add(buttonoptionsgamemainmenu);
				
				createmenuoptionsbutton(windowoptionsgame,menuoptionsgame,2); 
				_zeichenkette<_tt> hh=strgame; 
				ttitlegame=new _iggtext(windowoptionsgame,(wx/2)-font30->breite(hh)/2,50,1.25,hh,0.97,0.84,0.68,font30);
				y=150;
				off=35;
				x=50;
				_zeichenkette<_tt> htx;
				_tg tx;
				_tg txo=wx/2-5+35;
				_tg ex=wx/2+5+35;
				
				htx=strtouchpad;
				tx=font18->breite(htx);
				tgpc=new _iggtext(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgpc->createhilfe(strtouchpadhelp,font18,0.2,0,0);
				guihelpinitmagic(tgpc);
				cbgpc=new _iggcheckbox(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight);y+=off;
				cbgpc->createhilfe(strtouchpadhelp,font18,1,0,0);
				guihelpinitmagic(cbgpc);
				cbgpc->checked=pointandclick;
    			checkboxinitmagic(cbgpc);
				
				htx=strtouchpadalternative;
				tx=font18->breite(htx);
				tgpa=new _iggtext(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgpa->createhilfe(strtouchpadalternativehelp,font18,0.2,0,0);
				guihelpinitmagic(tgpa);
				cbgpa=new _iggcheckbox(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight);y+=off;
				cbgpa->createhilfe(strtouchpadalternativehelp,font18,1,0,0);
				guihelpinitmagic(cbgpa);
				cbgpa->checked=pointandclickalternative;
				checkboxinitmagic(cbgpa);
				
				htx=strexitconf;
				tx=font18->breite(htx);
				tgcq=new _iggtext(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgcq->createhilfe(strexitconfhelp,font18,1,0,0);
				guihelpinitmagic(tgcq);
				cbgcq=new _iggcheckbox(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight);y+=off;
				cbgcq->createhilfe(strexitconfhelp,font18,1,0,0);
				guihelpinitmagic(cbgcq); 
				checkboxinitmagic(cbgcq);
				cbgcq->checked=confirmonquit;
				
				y+=off+off;
				hh=strgameautomatics;
				tgaa=new _iggtext(windowoptionsgame,(wx/2)-font24->breite(hh)/2,y+5,1,hh,0.97,0.84,0.68,font24);
				tgaa->position.kondition(500,1023,400,767,  (wx/2)-font24->breite(hh)/2,y+5-40,-1,false);y+=off+10;

				y+=off;
				
				htx=strautomaticturn;
				tx=font18->breite(htx);
				tgat=new _iggtext(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgat->position.kondition(500,1023,400,767,  txo-tx,y-60,-1,false);
				tgat->createhilfe(strautomaticturnhelp,font18,0.2,0,0);
				guihelpinitmagic(tgat);
				cbgat=new _iggcheckbox(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight);
				cbgat->position.kondition(500,1023,400,767, ex,y+checkboxoffy-60,-1,false) ;y+=off;
				cbgat->createhilfe(strautomaticturnhelp,font18,1,0,0);
				guihelpinitmagic(cbgat);
				checkboxinitmagic(cbgat);
				cbgat->checked=autoturncard;
				
				htx=strautomaticdiscard;
				tx=font18->breite(htx);
				tgad=new _iggtext(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgad->position.kondition(500,1023,400,767,  txo-tx,y-60,-1,false);
				tgad->createhilfe(strautomaticdiscardhelp,font18,0.2,0,0);
				guihelpinitmagic(tgad);
				cbgad=new _iggcheckbox(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight);
				cbgad->position.kondition(500,1023,400,767,  ex,y+checkboxoffy-60,-1,false);y+=off;				
				cbgad->createhilfe(strautomaticdiscardhelp,font18,1,0,0);
				guihelpinitmagic(cbgad);
				checkboxinitmagic(cbgad);
				cbgad->checked=autodiscard;
				
				htx=strautomaticempty;
				tx=font18->breite(htx);
				tgae=new _iggtext(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgae->position.kondition(500,1023,400,767,  txo-tx,y-60,-1,false);
				tgae->createhilfe(strautomaticemptyhelp,font18,0.2,0,0);
				guihelpinitmagic(tgae);
				cbgae=new _iggcheckbox(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight);
				cbgae->position.kondition(500,1023,400,767,  ex,y+checkboxoffy-60,-1,false);y+=off;
				cbgae->createhilfe(strautomaticemptyhelp,font18,1,0,0);
				guihelpinitmagic(cbgae);
				checkboxinitmagic(cbgae);
				cbgae->checked=autoempty;
				
				htx=strautomaticrightclick;
				tx=font18->breite(htx);
				tgcr=new _iggtext(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgcr->position.kondition(500,1023,400,767,  txo-tx,y-60,-1,false);
				tgcr->createhilfe(strautomaticrightclickhelp,font18,0.2,0,0);
				guihelpinitmagic(tgcr);
				cbgcr=new _iggcheckbox(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight);
				cbgcr->position.kondition(500,1023,400,767,  ex,y+checkboxoffy-60,-1,false);y+=off;
				cbgcr->createhilfe(strautomaticrightclickhelp,font18,1,0,0);
				guihelpinitmagic(cbgcr);
				checkboxinitmagic(cbgcr);
				cbgcr->checked=clickplayright;
				
				htx=strautomaticdoubleclick;
				tx=font18->breite(htx);
				tgcd=new _iggtext(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgcd->position.kondition(500,1023,400,767,  txo-tx,y-60,-1,false);
				tgcd->createhilfe(strautomaticdoubleclickhelp,font18,0.2,0,0);
				guihelpinitmagic(tgcd);
				cbgcd=new _iggcheckbox(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight);
				cbgcd->position.kondition(500,1023,400,767,  ex,y+checkboxoffy-60,-1,false);y+=off;
				cbgcd->createhilfe(strautomaticdoubleclickhelp,font18,1,0,0);
				guihelpinitmagic(cbgcd);
				checkboxinitmagic(cbgcd);
				cbgcd->checked=clickplaydouble;
				
				menuoptionsgame->visibility(false);
				menuoptionsgame->activity(false);
				menuoptionsgame->fadetarget(menuopacity2);
				menuoptionsgame->fadeopacity(0);
};
void _solitairefantasy::createmenuoptionscard(){
				_to tr=1,tg=0.8,tb=0.6;
				_tg lx=250;
				_tg ly=100;
				_tg wx=512;
				_tg wy=723;
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg y=100;
				_tg x=650;
				_tg off=20;		
				_tg cw=128*0.7;
				_tg ch=200*0.7;
				_netz*mt;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,0);
				_iggcheckbox*cbt;
				_tg cboy=checkboxoffy+10;
				_tg cbw=checkboxwidth;
				_tg cbh=checkboxheight;

				menuoptionscard=menuman->createmenu();
				windowoptionscard=new _iggwindow(iggsystem,int(-wx/2),int(-wy/2),wx,wy,1,1,1);
				windowoptionscard->position.addieren(0.5,0.5,0,true);
				windowoptionscard->position.kondition(500,1023,400,767,280,3,-1,false);
				windowoptionscard->size.kondition(500,1023,400,767,wx,600,1,false);
				windowoptionscard->setshadow(10,10);
				windowinitmagic(windowoptionscard,iguiwindow);
				menuoptionscard->add(windowoptionscard);
				createmenuoptionsbutton(windowoptionscard,menuoptionscard,3);
				buttonoptionscardmainmenu=new _iggbutton(iggsystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,font24,11);
				buttonoptionscardmainmenu->position.addieren(0.5,0.5,0,true);
				buttonoptionscardmainmenu->position.kondition(500,1023,400,767, 20,10,-1,false);
				buttoninitmagic(buttonoptionscardmainmenu);
				menuoptionscard->add(buttonoptionscardmainmenu);
				
				_zeichenkette<_tt> hh=strcards;
				ttitlecard=new _iggtext(windowoptionscard,(wx/2)-font30->breite(hh)/2,40,1.25,hh,0.97,0.84,0.68,font30);
				hh=strcardsback;
				ttitleback=new _iggtext(windowoptionscard,(wx/2)-font24->breite(hh)/2,70,1.25,hh,0.97,0.84,0.68,font24);
				hh=strcardsfront;
				ttitledeck=new _iggtext(windowoptionscard,(wx/2)-font24->breite(hh)/2,350,1.25,hh,0.97,0.84,0.68,font24);
				ttitledeck->position.kondition(500,1023,400,767,  (wx/2)-font24->breite(hh)/2,310,-1,false);
				
				lbcardtexture=new _igglistbox(windowoptionscard,55,100,385,230,8,1,1,1);
				lbcardtexture->size.kondition(500,1023,400,767,  385,190,1,false);
				listboxinitmagic(lbcardtexture);
				int i=0;
				_cardsetback*cb;
				if(cardsetmanager->cardsetbacklist.anfang(cb))do{//for(Local cit:_cardsetback=EachIn cardsetmanager->cardsetbacklist
				 gg.textur(cb->texturpreview);
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 //mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzadditiv(true);
				 x=80;
				 y=20+i*(ch+20);
				 _iggmesh*gm=lbcardtexture->insertmesh(mt,x,y,cw,ch+20,0.8,0.8,0.8,100+i);
				 cbt=new _iggcheckbox(lbcardtexture,x+cw+20,y+cboy,cbw,cbh,100+i); 
				 checkboxinitmagic(cbt);
				 checkboxoptionscardbacklist.einhaengen(cbt);
				 cbt->crosslinkmesh=gm;
				 gm->crosslinkcheckbox=cbt;
				 if(cb->statisch==false){
				  _iggbutton*gb=new _iggbutton(lbcardtexture,x+cw+20,y+40,100,40,strchange,font24,200+i);
				  buttoninitmagic(gb);
				  buttonoptionscardchangebacklist.einhaengen(gb);
				 };				
				 i++;
				}while(cardsetmanager->cardsetbacklist.naechstes(cb));	
				updatemenuoptionscardcheckboxback(&checkboxoptionscardbacklist);
				lbdecktexture=new _igglistbox(windowoptionscard,55,380,385,230,8,1,1,1);
				lbdecktexture->position.kondition(500,1023,400,767,  55,340,-1,false);
				lbdecktexture->size.kondition(500,1023,400,767,  385,190,1,false);
				listboxinitmagic(lbdecktexture);
				cw=64;
				ch=96;
				i=0;
				_cardsetfront*cf;
				if(cardsetmanager->cardsetfrontlist.anfang(cf))do{//for(Local cit:_cardsetfront=EachIn cardsetmanager->cardsetfrontlist
				 _iggmesh*gm=0;
				 for(unsigned int j=0;j<4;j++){
				  _tg w=j*40+60;
				  _vektor3<_tg> v;
				  gg.ort(80+cos(w*_ph)*90,110-sin(w*_ph)*90,0);
				  w-=60;
				  gg.textur(cf->texturpreview[j]);
				  v.setzen(cw,0,0);
				  v.rotz(-w/2);
                  gg.vektor(0,v);
				  v.setzen(0,ch,0);
				  v.rotz(-w/2);
                  gg.vektor(1,v);
				  mt=gg.erzeugen();
				  mt->zweiseitig(true);
				  //mt->ausschussflaeche(false);
				  mt->transparenz(true);
				  mt->transparenzadditiv(false);
				  gm=lbdecktexture->insertmesh(mt,20,20+i*(ch+60),200,128,0.8,0.8,0.8,200+i);
				 };
				 _tg yy=40+i*(ch+60)+ch/2-50;
				 cbt=new _iggcheckbox(lbdecktexture,220,yy+cboy,cbw,cbh,200+i);
				 checkboxinitmagic(cbt);
				 checkboxoptionscardfrontlist.einhaengen(cbt);
				 cbt->crosslinkmesh=gm;
				 gm->crosslinkcheckbox=cbt;
				 if(cf->statisch==false){
				  _iggbutton*gb=new _iggbutton(lbdecktexture,220,yy+40,100,40,strchange,font24,200+i);
				  buttoninitmagic(gb);
				  buttonoptionscardchangefrontlist.einhaengen(gb);
				 };
				 i++;
				}while(cardsetmanager->cardsetfrontlist.naechstes(cf));
				updatemenuoptionscardcheckboxfront(&checkboxoptionscardfrontlist);
				lbcardtexture->scrolltoselection();
				lbdecktexture->scrolltoselection();
				menuoptionscard->visibility(false);
				menuoptionscard->activity(false);
				menuoptionscard->fadetarget(menuopacity2);
				menuoptionscard->fadeopacity(0);
};
void _solitairefantasy::createmenuoptionscardfront(){
				_to tr=1,tg=0.8,tb=0.6;
				_tg lx=250;
				_tg ly=100;
				_tg wx=512;
				_tg wy=723;
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg y=100;
				_tg x=650;
				_tg off=20;		
				_tg cw=128*0.7;
				_tg ch=200*0.7;
				_netz*mt;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),64,96,0);
				_iggcheckbox*cbt;
				_tg cboy=checkboxoffy+10;
				_tg cbw=checkboxwidth;
				_tg cbh=checkboxheight;				

				menuoptionscardfront=menuman->createmenu();
				windowoptionscardfront=new _iggwindow(iggsystem,int(-wx/2+80),int(-wy/2),wx,wy,1,1,1);
				windowoptionscardfront->position.addieren(0.5,0.5,0,true);
				windowoptionscardfront->position.kondition(500,1023,400,767,280,3,-1,false);
				windowoptionscardfront->size.kondition(500,1023,400,767,wx,600,1,false);
				windowoptionscardfront->setshadow(10,10);
				windowinitmagic(windowoptionscardfront,iguiwindow);
				menuoptionscardfront->add(windowoptionscardfront);
				//createmenuoptionsbutton(windowoptionscard,menuoptionscard,3)
				buttonoptionscardfrontnext=new _iggbutton(iggsystem,-wx/2-buttonwidth-20+80,-wy/2,buttonwidth,buttonheight,strnext,font24,11);
				buttonoptionscardfrontnext->position.addieren(0.5,0.5,0,true);
				buttonoptionscardfrontnext->position.kondition(500,1023,400,767, 20,10,-1,false);
				buttoninitmagic(buttonoptionscardfrontnext);
				menuoptionscardfront->add(buttonoptionscardfrontnext);
				
				_zeichenkette<_tt> hh=strcardsfirstchoice;
				titleoptionscardfront=new _iggtext(windowoptionscardfront,(wx/2)-font30->breite(hh)/2,50,1,hh,0.97,0.84,0.68,font30);
				titleoptionscardfront->dynamisch(wx,wy);
				
				listboxoptionscardfront=new _igglistbox(windowoptionscardfront,55,90,385,200+(350-80)+65,8,1,1,1);
				listboxoptionscardfront->dynamisch(wx,wy);
				listboxinitmagic(listboxoptionscardfront);
				cw=64;
				ch=96;				
				unsigned int i=0;
				_cardsetfront*cit;
				if(cardsetmanager->cardsetfrontlist.anfang(cit))do{//for(Local cit:_cardsetfront=EachIn cardsetmanager->cardsetfrontlist
				 _iggmesh*gm=0;
				 for(unsigned int j=0;j<4;j++){
				  _tg w=j*40+60;
				  _vektor3<_tg> v;
				  gg.ort(80+cos(w*_ph)*90,110-sin(w*_ph)*90,0);
				  w-=60;
				  gg.textur(cit->texturpreview[j]);
				  v.setzen(cw,0,0);
				  v.rotz(-w/2);
                  gg.vektor(0,v);
				  v.setzen(0,ch,0);
				  v.rotz(-w/2);
                  gg.vektor(1,v);
				  mt=gg.erzeugen();
				  mt->zweiseitig(true);
				  //mt->ausschussflaeche(false);
				  mt->transparenz(true);
				  mt->transparenzadditiv(false);
				  gm=listboxoptionscardfront->insertmesh(mt,40,20+i*(ch+60),200,128,0.8,0.8,0.8,200+i);
				 };
				 _tg yy=40+i*(ch+60)+ch/2-50;
				 cbt=new _iggcheckbox(listboxoptionscardfront,240,yy+cboy,cbw,cbh,200+i);
				 checkboxinitmagic(cbt);
				 checkboxoptionscardfrontlist.einhaengen(cbt);
				 cbt->crosslinkmesh=gm;
				 gm->crosslinkcheckbox=cbt;
				 i++;
				}while(cardsetmanager->cardsetfrontlist.naechstes(cit));
				updatemenuoptionscardcheckboxfront(&checkboxoptionscardfrontlist);
				listboxoptionscardfront->scrolltoselection();
				menuoptionscardfront->visibility(false);
				menuoptionscardfront->activity(false);
				menuoptionscardfront->fadetarget(menuopacity2);
				menuoptionscardfront->fadeopacity(0);
};				
_iggcheckbox*_solitairefantasy::updatemenuoptionscardcheckboxback(_liste<_iggcheckbox>*l){
				_iggcheckbox*gr=0;
				_listenknoten<_iggcheckbox>*lncit;
				if(l->anfang(lncit))do{//for(Local cit:_iggcheckbox=EachIn l
				 if(cardtexturebackindex==(lncit->objekt()->index-100)){
				  lncit->objekt()->checked=true;
				  if(lncit->objekt()->crosslinkmesh) lbcardtexture->selection=lncit->objekt()->crosslinkmesh;
				  gr=lncit->objekt();
				 }else{
				  lncit->objekt()->checked=false;
				 };
				}while(l->naechstes(lncit));
				return(gr);
};		
_iggcheckbox*_solitairefantasy::updatemenuoptionscardcheckboxfront(_liste<_iggcheckbox>*l){
				_iggcheckbox*gr=0;
				_listenknoten<_iggcheckbox>*lncit;
				L->schreiben("cardtexturefrontindex start");
				if(l->anfang(lncit))do{//for(Local cit:_iggcheckbox=EachIn l
				 if(cardtexturefrontindex==(lncit->objekt()->index-200)){
				  lncit->objekt()->checked=true;
				  if(lncit->objekt()->crosslinkmesh){
				   _igglistbox*parentlist=dynamic_cast<_igglistbox*>(lncit->objekt()->parent);
				   if(parentlist){
				    parentlist->selection=lncit->objekt()->crosslinkmesh;
				   };
				  };
				  gr=lncit->objekt();
				 }else{ 
				  lncit->objekt()->checked=false;
				 };
				}while(l->naechstes(lncit));
				L->schreiben("cardtexturefrontindex ende");
				return(gr);
};		
void _solitairefantasy::createmenuoptionscredits(){
				_tg wx=512;
				_tg wy=723;
				menuoptionscredits=menuman->createmenu();
				windowoptionscredits=new _iggwindow(iggsystem,int(-wx/2),int(-wy/2),wx,wy,1,1,1);
				windowoptionscredits->position.addieren(0.5,0.5,0,true);
				windowoptionscredits->position.kondition(500,1023,400,767,280,3,-1,false);
				windowoptionscredits->size.kondition(500,1023,400,767,wx,600,1,false);
				windowoptionscredits->setshadow(10,10);
				windowinitmagic(windowoptionscredits,iguiwindow);
				menuoptionscredits->add(windowoptionscredits);
				createmenuoptionsbutton(windowoptionscredits,menuoptionscredits,4);
				buttonoptionscreditsmainmenu=new _iggbutton(iggsystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,font24,11);
				buttonoptionscreditsmainmenu->position.addieren(0.5,0.5,0,true);
				buttonoptionscreditsmainmenu->position.kondition(500,1023,400,767, 20,10,-1,false);
				buttoninitmagic(buttonoptionscreditsmainmenu);

				_tg yit=90;
				_iggtext*gt;
				_zeichenkette<_tt> hh=strcreditsfantasysolitaire;
				gt=new _iggtext(windowoptionscredits,(wx/2)-font30->breite(hh)/2,yit,1.25,hh,0.97,0.84,0.68,font30);
				_tg fwx=0.5;
				yit+=120;
				hh=strcreditscreatedby;
				gt=new _iggtext(windowoptionscredits,wx*fwx-font18->breite(hh)/2,yit,1,hh,0.9,0.7,0.3,font18);
				yit+=25;
				hh=strcreditsjoerghenseler;
				gt=new _iggtext(windowoptionscredits,wx*fwx-font24->breite(hh)/2,yit,1,hh,0.9,0.83,0.5,font24);
				yit+=30;
				hh=strcreditsrobinhuehn;
				gt=new _iggtext(windowoptionscredits,wx*fwx-font24->breite(hh)/2,yit,1,hh,0.9,0.83,0.5,font24);
				yit+=30;
				//hh=strcreditsremivalantin;
				//gt=new _iggtext(windowoptionscredits,wx*fwx-font24->breite(hh)/2,yit,1,hh,0.9,0.83,0.5,font24);
				yit+=65;
				hh=strcreditsspecialthanksto;
				gt=new _iggtext(windowoptionscredits,wx*fwx-font18->breite(hh)/2,yit,1,hh,0.9,0.7,0.3,font18);
				yit+=25;
				hh=strcreditscarmendrescher;
				gt=new _iggtext(windowoptionscredits,wx*fwx-font24->breite(hh)/2,yit,1,hh,0.9,0.83,0.5,font24);
				yit+=30;
				//hh=strcreditstassilorau;
				//gt=new _iggtext(windowoptionscredits,wx*fwx-font24->breite(hh)/2,yit,1,hh,0.9,0.83,0.5,font24);
				hh=strcreditsversion;
				gt=new _iggtext(windowoptionscredits,(wx/2)-font14->breite(hh)/2,wy-80,1,hh,0.9,0.7,0.3,font14);
				gt->position.kondition(500,1023,400,767,  (wx/2)-font14->breite(hh)/2,600-80,-1,false);
				menuoptionscredits->add(buttonoptionscreditsmainmenu);
				menuoptionscredits->visibility(false);
				menuoptionscredits->activity(false);
				menuoptionscredits->fadetarget(menuopacity2);
				menuoptionscredits->fadeopacity(0);
};
void _solitairefantasy::createmenuoptionsbutton(_iggwindow*w,_iggmenu*menu,int excl){
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg y=0;
				_tg x=0+w->breite()+20;
				_tg wi=w->breite();
				_tg he=w->hoehe();
				_tg off=10;
				_iggbutton*kit;
				_tg wx=450;
				_tg wy=600;
				_iggbutton*bac=0;
				_iggbutton*bgr=0;
				_iggbutton*bga=0;
				_iggbutton*bcd=0;
				_iggbutton*bcr=0;
				_iggbutton*bge=0;
				_iggbutton*bm=0;

				bac=new _iggbutton(iggsystem,+wi/2+20,-he/2+y,bw,bh,strgeneral,font24,7);
				bac->position.addieren(0.5,0.5,0,true);
				bac->position.kondition(500,1023,400,767, 20,185+y,-1,false);
				buttoninitmagic(bac);
				menu->add(bac);
				if(excl==0){
				 bac->marking(2);
				 bac->superinactive=true;
				};
				y+=bh+off;

				bgr=new _iggbutton(iggsystem,+wi/2+20,-he/2+y,bw,bh,strgraphics,font24,8);
				bgr->position.addieren(0.5,0.5,0,true);
				bgr->position.kondition(500,1023,400,767, 20,185+y,-1,false);
				buttoninitmagic(bgr);
				menu->add(bgr);
				if(excl==1){
				 bgr->marking(2);
				 bgr->superinactive=true;
				};
				y+=bh+off;

				bga=new _iggbutton(iggsystem,+wi/2+20,-he/2+y,bw,bh,strgame,font24,9);
				bga->position.addieren(0.5,0.5,0,true);
				bga->position.kondition(500,1023,400,767, 20,185+y,-1,false);
				buttoninitmagic(bga);
				menu->add(bga);
				if(excl==2){
				 bga->marking(2);
				 bga->superinactive=true;
				};
				y+=bh+off;

				bcd=new _iggbutton(iggsystem,+wi/2+20,-he/2+y,bw,bh,strcards,font24,10);
				bcd->position.addieren(0.5,0.5,0,true);
				bcd->position.kondition(500,1023,400,767, 20,185+y,-1,false);
				buttoninitmagic(bcd);
				menu->add(bcd);
				if(excl==3){
				 bcd->marking(2);
				 bcd->superinactive=true;
				};
				y+=bh+off;
				bcr=new _iggbutton(iggsystem,+wi/2+20,-he/2+y,bw,bh,strcredits,font24,12);
				bcr->position.addieren(0.5,0.5,0,true);
				bcr->position.kondition(500,1023,400,767, 20,185+y,-1,false);
				buttoninitmagic(bcr);
				menu->add(bcr);
				if(excl==4){
				 bcr->marking(2);
				 bcr->superinactive=true;
				};
				y+=bh+off;
};				
//******************************************************************************************************************
//										G A M E T Y P E M E N U 
//******************************************************************************************************************
void _solitairefantasy::createmenugametype(){
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg y=80;
				_tg x=670;
				_tg wx=850;
				_tg wy=760;
				_tg off=20;
				_iggbutton*kit=0;
				bool keyraus=false;
				
				menugametype=menuman->createmenu();
				windowgametype=new _iggwindow(iggsystem,int(-wx/2+90),int(-wy/2+10),wx,wy,1,1,1);
				windowgametype->position.addieren(0.5,0.5,0,true);
				windowgametype->position.kondition(500,1023,400,767,  100,5,-1,false);
				windowgametype->size.kondition(500,1023,400,767,  690,590,1,false);
				windowgametype->shadow=false;//setshadow(10,10)
				windowgametype->clearbackground();
				//windowgametype.colortransformed.setzen(0.7,0.5,0.35,0.8)
				windowgametype->color=windowgametype->colortransformed;
				windowgametype->background[0].einhaengen(igametypewindow);
				windowgametype->background[1].einhaengen(igametypewindow);
				windowgametype->background[2].einhaengen(igametypewindow);
				menugametype->add(windowgametype);
				
				buttongametypemainmenu=new _iggbutton(iggsystem,-wx/2+90-(buttonwidth-60),-wy/2+10+10,buttonwidth-60,buttonheight,strmenu,font24,37);
				buttongametypemainmenu->position.addieren(0.5,0.5,0,true);
				buttongametypemainmenu->position.kondition(500,1023,400,767,  5,5,-1,false);
				buttongametypemainmenu->size.kondition(500,1023,400,767,  buttonwidth-80,buttonheight-10,1,false);
				buttoninitmagic(buttongametypemainmenu);
				menugametype->add(buttongametypemainmenu);
				
				buttongametypestart=new _iggbutton(iggsystem,-wx/2+90-(buttonwidth-60),-wy/2+buttonheight+10+10+10,buttonwidth-60,buttonheight,strstart,font24,37);
				buttongametypestart->position.addieren(0.5,0.5,0,true);
				buttongametypestart->position.kondition(500,1023,400,767,  5,buttonheight+5+5,-1,false);
				buttongametypestart->size.kondition(500,1023,400,767,  buttonwidth-80,buttonheight-10,1,false);
				buttoninitmagic(buttongametypestart);
				menugametype->add(buttongametypestart);

				previewwindow=new _previewwindow(this,windowgametype,0,0,20,20,1,1,1);
				previewwindow->position.kondition(500,1023,400,767,  -30,-10,-1,false);
				current=new _iggtext(windowgametype,70,50,1,gametype[currentgame].name,0.97,0.84,0.68,font24);
				current->dynamisch(wx,wy);
				//-------------------------------------- create game class list
				typelist=new _igglistbox(windowgametype,60,80,200,570,8,1,1,1);
				typelist->selectionrect=true;
				typelist->moverrect=true;
				typelist->dynamisch(wx,wy);
				listboxinitmagic(typelist);
				current_preview=currentgame;
				updatelistboxgametypesorted(typelist,current_preview);
				//-------------------------------------- create sort box
				sortbox=new _iggcombobox(windowgametype,60,655,200,40,60,-1,1,1,1  ,260,650-160,210,160+40, 30, 0, font18);
				sortbox->dynamisch(wx,wy);
				sortbox->listbox->selectionrect=true;
				sortbox->listbox->moverrect=true;
				sortbox->listbox->dynamischort(wx,wy);
				comboboxinitmagic(sortbox);
				_iggtext*gt;
				_to tr=1;
				_to tg=0.8;
				_to tb=0.4;
				_tg sey=0;
				_zeichenkette<_tt> hse;
				_tg txo=210/2-35;
				_tg tx;
				hse=strgametypesortalphabetical;tx=txo-font18->breite(hse)/2;
				gt=sortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,0);sey+=22;
				hse=strgametypesortpublicity;tx=txo-font18->breite(hse)/2;
				gt=sortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,1);sey+=22;gt->createhilfe(strgametypesortpublicitydesc,font18,0.1,200,0);guihelpinitmagic(gt);
				hse=strgametypesortchance;tx=txo-font18->breite(hse)/2;
				gt=sortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,2);sey+=22;gt->createhilfe(strgametypesortchancedesc,font18,0.1,200,0);guihelpinitmagic(gt);
				hse=strgametypesortskill;tx=txo-font18->breite(hse)/2;
				gt=sortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,3);sey+=22;gt->createhilfe(strgametypesortskilldesc,font18,0.1,200,0);guihelpinitmagic(gt);
				hse=strgametypesorttime;tx=txo-font18->breite(hse)/2;
				gt=sortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,4);sey+=22;gt->createhilfe(strgametypesorttimedesc,font18,0.1,200,0);guihelpinitmagic(gt);
				hse=strgametypesorttype;tx=txo-font18->breite(hse)/2;
				gt=sortbox->listbox->inserttext(hse,tx,sey,1,tr,tg,tb,font18,5);sey+=22;
				sortbox->listbox->superinactivity(true);
				sortbox->listbox->superinvisibility(true);
				sortbox->listbox->fadeopacity(0);
				sortbox->createhilfe(strsortbox,font18,0.5,0,0);
				sortbox->button->createhilfe(strsortboxbutton,font18,0.5,0,0);
				guihelpinitmagic(sortbox);
				guihelpinitmagic(sortbox->button);
				sortbox->clearbackground();
				sortbox->shadow=false;
				sortbox->superinvisible=true;
				sortbox->text->setzen(strgametypesortalphabetical);
				sortbox->text->textshadow=1;
				//-------------------------------------- create game manual help list
				desclist=new _igglistbox(windowgametype,270,80,500,260,8,1,1,1);
				desclist->dynamisch(wx,wy);
				listboxinitmagic(desclist);
				updatemenugametype();
				menugametype->fadeopacity(0);
				menugametype->visibility(false);
				menugametype->activity(false);
				menugametype->fadetarget(menuopacity2);
};				
void _solitairefantasy::createmenugametypehelp(){
				_tg bw=buttonwidth;
				_tg bh=buttonheight;
				_tg y=100;
				_tg x=650;
				_tg wx=612;
				_tg wy=723;
				_tg off=20;	
				_iggbutton*kit=0;
				bool keyraus=false;
				menugametypehelp=menuman->createmenu();
				windowgametypehelp=new _iggwindow(iggsystem,100+int(-wx/2),int(-wy/2),wx,wy,1,1,1);
				windowgametypehelp->position.addieren(0.5,0.5,0,true);
				windowgametypehelp->shadow=false;//setshadow(10,10)
				windowgametypehelp->clearbackground();
				//windowgametype.colortransformed.setzen(0.7,0.5,0.35,0.8)
				windowgametypehelp->color=windowgametypehelp->colortransformed;
				windowgametypehelp->background[0].einhaengen(igametypewindow);
				windowgametypehelp->background[1].einhaengen(igametypewindow);
				windowgametypehelp->background[2].einhaengen(igametypewindow);
				windowgametypehelp->position.kondition(500,1023,400,767,180,3,-1,false);
				windowgametypehelp->size.kondition(500,1023,400,767,wx,600,1,false);
				menugametypehelp->add(windowgametypehelp);
				
				buttongametypehelpback=new _iggbutton(iggsystem,100+-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strback,font24,-1);
				buttongametypehelpback->position.addieren(0.5,0.5,0,true);
				buttongametypehelpback->position.kondition(500,1023,400,767, 20,10,-1,false);
				buttoninitmagic(buttongametypehelpback);
				menugametypehelp->add(buttongametypehelpback);
				
				windowgametypehelppreviewwindow=new _previewwindow(this,windowgametypehelp,-50,3,20,20,1,1,1);
				windowgametypehelppreviewwindow->position.kondition(500,1023,400,767,  -50,-8,-1,false);
				windowgametypehelptitle=new _iggtext(windowgametypehelp,40,50,1,gametype[currentgame].name,97,0.84,0.68,font24);
				//-------------------------------------- create game manual help list
				windowgametypehelplist=new _igglistbox(windowgametypehelp,50,80,500,260,8,1,1,1);
				windowgametypehelplist->size.kondition(500,1023,400,767,  500,200,1,false);
				listboxinitmagic(windowgametypehelplist);
				updatemenugametypehelp(windowgametypehelplist,currentgame);
				menugametypehelp->fadeopacity(0);
				menugametypehelp->visibility(false);
				menugametypehelp->activity(false);
				menugametypehelp->fadetarget(menuopacity2);
};				
//******************************************************************************************************************
//										G A M E  M E N U 
//******************************************************************************************************************
void _solitairefantasy::createmenugame(){
				menugame=menuman->createmenu();
				//ottombuttons=CreateList()
				_iggbutton*kit;
				_tg bw=buttonwidth-100;
				_tg bh=buttonheight-20;
				_tg off=10;
				_tg y=10;
				_tg x=10;
				/*
				windowgamemenu=new _iggwindow
				windowgamemenu.init(iggsystem,0,0,141,768,255,255,255)
				windowgamemenu.shadow=false
				windowgamemenu.background[0].einhaengen(ilederstreifen)
				windowgamemenu.background[1].einhaengen(ilederstreifen)
				windowgamemenu.background[2].einhaengen(ilederstreifen)
				menugame.add(windowgamemenu)		
				*/		
				y=10;
				buttongamemainmenu=new _iggbutton(iggsystem,x,y,bw,bh,strmenu,font24,42);
				buttongamemainmenu->position.setzen(x,y,-1,false);
				buttoninitmagic(buttongamemainmenu,font18);
				menugame->add(buttongamemainmenu);
				y+=(bh+off);
				buttongameoptions=new _iggbutton(iggsystem,x,y,bw,bh,stroptions,font24,3442);
				buttongameoptions->position.setzen(x,y,-1,false);
				buttoninitmagic(buttongameoptions,font18);
				menugame->add(buttongameoptions);
				y+=(bh+off);
				y=-7*(off+bh);
				buttongamerules=new _iggbutton(iggsystem,x,y,bw,bh,strrules,font24,-1);
				buttongamerules->position.addieren(0,1,-1,true);
				buttoninitmagic(buttongamerules,font18);
				menugame->add(buttongamerules);
				y+=off+bh;
				buttongamenew=new _iggbutton(iggsystem,x,y,bw,bh,strnew,font24,45);
				buttongamenew->position.addieren(0,1,-1,true);
				buttoninitmagic(buttongamenew,font18);
				menugame->add(buttongamenew);
				y+=off+bh;
				buttontipp=new _iggbutton(iggsystem,x,y,bw,bh,strhint,font24,63);
				buttontipp->position.addieren(0,1,-1,true);
				buttoninitmagic(buttontipp,font18);
				menugame->add(buttontipp);
				y+=bh+off;
				//buttonauto=new _iggbutton
				//buttonauto.init(iggsystem,x,y,bw,bh,"Automatik",64)
				//buttoninitmagic(buttonauto)
				//menugame.add(buttonauto)
				//y+=bh+off
				buttonundo=new _iggbutton(iggsystem,x,y,bw,bh,strundo,font24,40);
				buttonundo->position.addieren(0,1,-1,true);
				buttoninitmagic(buttonundo,font18);
				menugame->add(buttonundo);
				y+=bh+off;
				buttonredo=new _iggbutton(iggsystem,x,y,bw,bh,strredo,font24,41);
				buttonredo->position.addieren(0,1,-1,true);
				buttoninitmagic(buttonredo,font18);
				menugame->add(buttonredo);
				y+=bh+off;
				buttongamesave=new _iggbutton(iggsystem,x,y,bw,bh,strsave,font24,62);
				buttongamesave->position.addieren(0,1,-1,true);
				buttoninitmagic(buttongamesave,font18);
				menugame->add(buttongamesave);
				y+=(bh+off);
				buttongameload=new _iggbutton(iggsystem,x,y,bw,bh,strload,font24,61);
				buttongameload->position.addieren(0,1,-1,true);
				buttoninitmagic(buttongameload,font18);
				menugame->add(buttongameload);
				y+=(bh+off);
				//Print "--------------------------------------offset+BH="+(off+bh)
				tgmcurgame=new _iggtext(iggsystem,0,10,1,L"hu",1,0.95,0.6,font30);
				menugame->add(tgmcurgame);
				tgmtime=new _iggtext(iggsystem,0,50,1,L"hu",1,0.95,0.6,font18);
				menugame->add(tgmtime);
				tgmscore=new _iggtext(iggsystem,0,75,1,L"hu",1,0.95,0.6,font18);
				menugame->add(tgmscore);
				menugame->visibility(false);
				menugame->activity(false);
				menugame->fadeopacity(0);
				menugame->fadetarget(menuopacity);
				bottombuttons.einhaengen(buttongameload);
				bottombuttons.einhaengen(buttongamesave);
				bottombuttons.einhaengen(buttonredo);
				bottombuttons.einhaengen(buttonundo);
				bottombuttons.einhaengen(buttontipp);
				bottombuttons.einhaengen(buttongamenew);
				bottombuttons.einhaengen(buttongamerules);
};
void _solitairefantasy::updatemenugame(){
};
void _solitairefantasy::updategamemenu(){//--------------------- diese wird aufgerufen ------------------
				//update class&time display
				_tg x;
				x=gra->groessex()-tgmcurgame->font->breite(gametype[currentgame].name)-10;
				tgmcurgame->position.x(x);
				tgmcurgame->setzen(gametype[currentgame].name);
				if(timeduringgame){
				 _zeichenkette<_tt> h;
				 _zeichenkette<_tt> hs;
				 if(game){
				  if(game->inuse){
				   h=timemstohhmmss(game->time);
				   hs=int(game->score())+L" "+strpoints;
				  }else{
				   h=L"("+strnotbegun+L")";
				   hs=L"";
				  };
				 };
				 x=gra->groessex()-tgmtime->font->breite(h)-10;
				 tgmtime->position.x(x);
				 tgmtime->positiontransformed.x(x);
				 tgmtime->setzen(h);
				 x=gra->groessex()-tgmscore->font->breite(hs)-10;
				 tgmscore->position.x(x);
				 tgmscore->positiontransformed.x(x);
				 tgmscore->setzen(hs);
				}else{
				 _zeichenkette<_tt> h;
				 tgmscore->setzen(L"");
				 h=strgameruns;
				 x=gra->groessex()-tgmtime->font->breite(h)-10;
				 tgmtime->position.x(x);
				 tgmtime->positiontransformed.x(x);
				 tgmtime->setzen(h);			
				};
				
				_tg bh=buttonheight-20;
				_tg off=10;
				_tg yit=-1*(off+bh);
				//Print "offset+BH="+(off+bh)
                _listenknoten<_iggbutton>*bit;
				if(bottombuttons.anfang(bit))do{
				 if(bit->objekt()->visible){
				  _tg y=bit->objekt()->position.y();
				  bit->objekt()->position.y(y*0.9+yit*0.1);
				  yit-=(off+bh);
				 };
				}while(bottombuttons.naechstes(bit));			
};					
//******************************************************************************************************************
//										M A I N L O O P 
//******************************************************************************************************************
void _solitairefantasy::showmenumain(){
				menuman->show(menumain);
				if(game){
				 game->allowpick=true;
				 gamedelaytime=clock->system();
				};
				demoplay=false;
};		
void _solitairefantasy::showmenugame(){
				_tg bh=buttonheight;
				_tg off=10;
				menuman->show(menugame);
				bool bl;
				if(game) if(dateiexistiert("game"+gametype[game->index].namespeicherung+".sol")==false){
				 buttongameload->fadeout();
				 bl=false;
				}else{ 
				 buttongameload->fadein();
				 bl=true;
				};
				if(gameplaybuttons){
				 buttontipp->fadein();
				 buttonundo->fadein();
				 buttonredo->fadein();
				// buttongamenew->position->sety(-6*(off+bh))
				}else{
				 buttontipp->fadeout();
				 buttonundo->fadeout();
				 buttonredo->fadeout();
				// buttongamenew->position->sety(-3*(off+bh))
				};
				if(menubuttons){
				 buttongamemainmenu->fadein();
				 buttongameoptions->fadein();
				}else{
				 buttongamemainmenu->fadeout();
				 buttongameoptions->fadeout();
				};
};	
void _solitairefantasy::showmenuoptions(_iggmenu*menu,bool fromgame,bool subfadeout){
				menuman->show(menu);
				gamedelaytime=clock->system();
				optionscalledfromgame=fromgame;
				if(game) game->allowpick=false;
				if(subfadeout){
				 _listenknoten<_igg>*lngit;
				 if(menu->anfang(lngit))do{
				  _igg*git=lngit->objekt();
				  if((git->index==7)||(git->index==8)||(git->index==9)||(git->index==10)||(git->index==12)) git->fadeout();
				 }while(menu->naechstes(lngit));
				};
				menuoptionslast=menu;
				_iggbutton*b=0;
				if(menu==menuoptionsacoustics) b=buttonoptionsacousticsmainmenu;
				if(menu==menuoptionsgraphics) b=buttonoptionsgraphicsmainmenu;
				if(menu==menuoptionsgame) b=buttonoptionsgamemainmenu;
				if(menu==menuoptionscard) b=buttonoptionscardmainmenu;
				if(menu==menuoptionscredits) b=buttonoptionscreditsmainmenu;
				if((fromgame)&&(b)){
				 b->text=strback;
				}else{
				 b->text=strmenu;
				};
};											
void _solitairefantasy::activatestatusgame(){
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				/*musicman->channelmenufadeswitch=true;
				musicman->channelmenuswitchto=1;
				if(game) musicman->channelmenuswitchto=game->index%musicman->count;
				musicman->channelmenufadeup=false;
				musicman->channelmenufadedown=false;*/
				
				setworldfieldgame();
	            _listenknoten<_candle>*cit;
	            if(candlegamelist.anfang(cit))do{
				 cit->objekt()->flamme->aktiv(true);
				}while(candlegamelist.naechstes(cit));
				if(candlemenulist.anfang(cit))do{
				 cit->objekt()->flamme->aktiv(false);
				}while(candlemenulist.naechstes(cit));	
				kamin->deactivate();
}; 
void _solitairefantasy::activatestatusmenu(){
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				/*musicman->channelmenufadeswitch=true;
				musicman->channelmenuswitchto=0;
				musicman->channelmenufadeup=false;
				musicman->channelmenufadedown=false;*/
				setworldfieldmenu();
	            _listenknoten<_candle>*cit;
	            if(candlegamelist.anfang(cit))do{
				 cit->objekt()->flamme->aktiv(false);
				}while(candlegamelist.naechstes(cit));
				if(candlemenulist.anfang(cit))do{
				 cit->objekt()->flamme->aktiv(true);
				}while(candlemenulist.naechstes(cit));	
	 			kamin->activate();
};
void _solitairefantasy::gamefadein(){
				pgamefadein=true;
				pgamefadeout=false;
				gameopacitytime=clock->system();
				if(game) game->allowpick=true;
};
void _solitairefantasy::gamefadeout(){
				pgamefadein=false;
				pgamefadeout=true;
				gameopacitytime=clock->system();
				if(game) game->allowpick=false;
};
void _solitairefantasy::mainloopmenugame(){
				 //----------------------------------------game menue--------------------------------------------------------------
				 if(game){
				  if((game->picklist.anzahl()==0)&&(game->animationlist.erstes()==0)){
				   if(game->keyboardinputblocked==false){
				    if(((iggsystem->button==buttontipp)||(tastatur->enter())||(tastatur->escape()))&&(game->allowpick)){
				     if(game->tipp()){ 
				      game->starttime-=10000;
				      _zeichenkette<_tt> hh=strminustime+L" 10 "+strseconds+L".";
				      messagestatusbar(hh,1,500);
			 		 }else{
				 	  if(game->ended==false) messagestatusbar(strnotipp,1,500); else messagestatusbar(strgamealreadywon,1,500);
				     };
				     game->tipps+=1;
				    };
				    if(((iggsystem->button==buttonundo)||(tastatur->backspace()))&&(game->allowpick)) game->undo();
				    if((iggsystem->button==buttonredo)&&(game->allowpick)) game->redo();
				   };
				  };
				 };
			 	 if(iggsystem->button){
				  if(game){
				   if(game->picklist.anzahl()==0){
				    if((iggsystem->button->index==45)||(iggsystem->button->index==53)){
				     bool neu=true;
					 if(game){
					  if((game->inuse)&&(game->ended==false)&&(confirmonquit)){
					   if(abfrage2z(strnewgame0,strnewgame1,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)==false) neu=false;
				      };
				     };
				     if(neu){
				      _liste<_card>*bl=game->deinsertforblow();
				      deletesecure(game);
				      initgame(0,true);
				      transformgame();
					  updatescene();
				      game->insertblowlist(bl);
				      deletesecure(bl);
				     };
				    };
				    if(iggsystem->button==buttongamerules){
				     showmenugametypehelp();
				    };
				    if(iggsystem->button==buttongameload){
				     if(dateiexistiert("game"+gametype[currentgame].namespeicherung+".sol")){
				      bool laden=true;
				      if(game) if(game->inuse){
				       if(abfrage2z(strloadgame0,strloadgame1,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)==false) laden=false;
				 	  };
					  if(laden){
				       messagestatusbar(strloading,1,1500);
				       drawstandard();
				       _liste<_card>*bl=0;
				       if(game){//vor dem laden zwingend!
				        bl=game->deinsertforblow();
				        deletesecure(game);
				       };
				       game=loadgame(this,currentgame);
				       game->insertblowlist(bl);
				       deletesecure(bl);
				       messagestatusbar(strloaded,1,1500);
				       updatescene();
				      };
				     }else{
					  messagestatusbar(strnosavegamefile,1,1500);
				     };
				    };
				    if(iggsystem->button==buttongamesave){
				     savegame(game);
				     buttongameload->fadein();
				     messagestatusbar(strsaved,1,1500);
				    };
				    if(iggsystem->button) if(iggsystem->button==buttongamemainmenu){
				     keyraus=true;
				     if(game) if((game->inuse)&&(game->ended==false)&&(confirmonquit)){
				      if(abfrage(strquit,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)==false) keyraus=false;
				     };
				     if(keyraus){
				      showmenumain();
					  gamefadeout();
				      activatestatusmenu();
				     };
				     keyraus=false;
				    };
					if(iggsystem->button==buttongameoptions) showmenuoptions(menuoptionslast,true,false);
			       };
			      };			
				 };
};								
void _solitairefantasy::mainloopmenugametype(){
				 //----------------------------------------gametype menu----------------------------------------------------------------------
				 if(iggsystem->listbox){
				  if(iggsystem->listbox==typelist){
				   unsigned int old=current_preview;
				   int neu=-1;
				   _zeichenkette<_tt> typ=typelist->selectiontext();
				   for( int i=0;i<gametypecount;i++){
				    if(typ==gametype[i].name){
				     neu=i;
				    };
				   };				
				   if((old!=neu)&&(neu!=-1)){
				    //volumesoundfadein=0.2;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					demoplay=false;
					current_preview=neu;
					initgamepreview(0,current_preview);
					transformgamepreview();
					updatemenugametype();
					if(game) game->allowpick=false;
				   };
				   if(iggsystem->doubleclickleft){
				    bool wechseln=true;
				    if(game) if((game->inuse)&&(game->ended==false)&&(confirmonquit)) if(abfragegametype(font18,imessagewindow)==false) wechseln=false;
				    //updatefantasywindowtype()				
				    demoplay=false;
				    if(wechseln){
					 currentgame=current_preview;
				 	 //initgame(false)
				    };
				    updatemenumain();
				    initgame(0,false);
				    transformgame();
				    demoplay=false;		
				    showmenugame();
				    gamefadein();
				    activatestatusgame();
				    if(game) game->allowpick=true;
				   };
				  };
				 };
				 if(iggsystem->button){
				  if(gamepreview){
				   if(iggsystem->button==buttonfoundation){
				    _pilefoundation*pit;
				    if(gamepreview->pilefoundationlist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->pilefoundationlist.naechstes(pit));
				   };
				   if(iggsystem->button==buttondiscard){
				    _pilediscard*pit;
				    if(gamepreview->pilediscardlist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->pilediscardlist.naechstes(pit));
				   };
				   if(iggsystem->button==buttontableau){
				    _piletableau*pit;
				    if(gamepreview->piletableaulist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->piletableaulist.naechstes(pit));
				   };
				   if(iggsystem->button==buttonstock){
				    _pilestock*pit;
				    if(gamepreview->pilestocklist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->pilestocklist.naechstes(pit));
				   };
				   if(iggsystem->button==buttonwaste){
				    _pilewaste*pit;
				    if(gamepreview->pilewastelist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->pilewastelist.naechstes(pit));
				   };
				   if(iggsystem->button==buttonredeal){
				    _pileredeal*pit;
				    if(gamepreview->pileredeallist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->pileredeallist.naechstes(pit));
				   };
				   if(iggsystem->button==buttonreserve){
				    _pilereserve*pit;
				    if(gamepreview->pilereservelist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->pilereservelist.naechstes(pit));
				   };
				   if(iggsystem->button==buttonfreecell){
				    _pilefreecell*pit;
				    if(gamepreview->pilefreecelllist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->pilefreecelllist.naechstes(pit));
				   };
				   if(iggsystem->button==buttonpyramid){
				    _pilepyramid*pit;
				    if(gamepreview->pilepyramidlist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->pilepyramidlist.naechstes(pit));
				   };
				   if(iggsystem->button==buttonlabyrinth){
				    _pilelabyrinth*pit;
				    if(gamepreview->pilelabyrinthlist.anfang(pit))do{
				     pit->show();
				    }while(gamepreview->pilelabyrinthlist.naechstes(pit));
				   };
				   if(iggsystem->button==buttondemoplayplay){
				    if((gamepreview->ended)||(gamepreview->autoplay()==false)){
				     initgamepreview(0,current_preview);
				     transformgamepreview();
				    };
				    if(demoplay==false) sgong->abspielen(0.5,1.05,1.1);
				    demoplay=true;
				    demoplaylasttime=clock->system()-2000;
				   };
				   if(iggsystem->button==buttondemoplaystop){
				    if(demoplay) sgong->abspielen(0.5,0.95,1.05);
				    demoplay=false;
				   };
				  };
		   		  if(iggsystem->button==buttongametypehelpback){
		           demoplay=false;	
		  		   showmenugame();
				   if(game) game->allowpick=true;
		          };
				  if(iggsystem->button==buttongametypemainmenu){
				   demoplay=false;
				   currentgame=current_preview;
				   updatemenumain();
				   showmenumain();
				  };
				  if(iggsystem->button==buttongametypestart){
				   //Local wechseln=true
				   //if(game if(game->inuse && game->ended=false && confirmonquit if(abfragegametype(font18,imessagewindow)=false wechseln=false
				   //if(wechseln 
				   currentgame=current_preview;
				   //};
				   initgame(0,false);
				   transformgame();
				   updatemenumain();
				   demoplay=false;		
				   showmenugame();
				   gamefadein();
				   activatestatusgame();
				   if(game) game->allowpick=true;
				  };
				 };
				 if(iggsystem->combobox==sortbox){
				  _zeichenkette<_tt> t=iggsystem->combobox->text->lesen();
				  if(t==strgametypesortalphabetical) gametypesortmethod=0;
				  if(t==strgametypesortpublicity) gametypesortmethod=1;
				  if(t==strgametypesortchance) gametypesortmethod=2;
				  if(t==strgametypesortskill) gametypesortmethod=3;
				  if(t==strgametypesorttime) gametypesortmethod=4;
				  if(t==strgametypesorttype) gametypesortmethod=5;
				  updatelistboxgametypesorted(typelist,current_preview);
				 };				 
};								
void _solitairefantasy::showmenugametype(){
	 			current_preview=currentgame;
	   			initgamepreview(0,current_preview);
				transformgamepreview();
				updatelistboxgametypesorted(typelist,current_preview);
				updatemenugametype();
				menuman->show(menugametype);
				iggsystem->focus=typelist;
				if(game){
				 deletesecure(game);
				 setworldfieldmenu();
				};								
		   		gamepreview->opacity(0);
		        iggsystem->animierenfadekind();
};				
void _solitairefantasy::showmenugametypehelp(){
	 			current_preview=currentgame;
	   			initgamepreview(0,current_preview);
				transformgamepreview();
				updatemenugametypehelp(windowgametypehelplist,currentgame);
				if(game) game->allowpick=false;
				//SetImageFont(windowgametypehelptitle.font);
				_zeichenkette<_tt> hh=gametype[currentgame].name;
				windowgametypehelptitle->position.x(windowgametypehelp->breite()/2-windowgametypehelptitle->font->breite(hh)/2);
				windowgametypehelptitle->setzen(hh);
				menuman->show(menugametypehelp);
				gamedelaytime=clock->system();
				iggsystem->focus=0;
		   		gamepreview->opacity(0);
		        iggsystem->animierenfadekind();
};					
void _solitairefantasy::showmenuuser(){
				optionscalledfromgame=false;
				menuman->show(menuuser);
				iggsystem->focus=windowuserlist;
				if(game) game->allowpick=false;
};
void _solitairefantasy::mainloopmenumain(){
				if(iggsystem->button){
				 //-----------------------------------------mainmenu-------------------------------------------------------------------------
				 // -------------- Hauptmenu : start ---------------------
				 if(iggsystem->button==buttonstart){
				  if(game){ 
				   if(game->ended){
				    initgame(0,true);
				    transformgame();
				   };
				  }else{
				   initgame(0,true);
				   transformgame();
				  };
				  gamefadein();
				  showmenugame();
				  activatestatusgame();
				 };
				 // -------------- Hauptmenu : Optionen & exit ---------------------
				 if(iggsystem->button==buttonmenumainoptions) showmenuoptions(menuoptionslast,false,false);
				 if(iggsystem->button==buttonmenumainclose) buttonraus=true;
				 // -------------- Hauptmenu : gametype ---------------------
				 if(iggsystem->button==buttonmenumaingametype) showmenugametype();
				 // -------------- Hauptmenu : scenetype --------------------
				 if(iggsystem->button==buttonmenumainscene){
				  menuman->show(menuscene);
  				  optionscalledfromgame=false;
				  iggsystem->focus=lbscene;
				  if(game) game->allowpick=false;
				 };
				 // -------------- Hauptmenu : user --------------------
				 if(iggsystem->button==buttonmenumainplayer) showmenuuser();
				 // -------------- Hauptmenu : statistics --------------------
				 if(iggsystem->button==buttonmenumainstatistics){
				  updatelistboxuser(windowstatisticsuserlist,true);
				  optionscalledfromgame=false;
				  menuman->show(menustatistics);
				  windowstatisticstypelist->selectbytext(gametype[currentgame].name);
				  windowstatisticstypelist->scrolltoselection();
				  updatemenustatistics();
				  windowstatisticsuserlist->scrolltoselection();
				  //iggsystem->focus=lbscene
				  if(game) game->allowpick=false;
				 };
				 if(iggsystem->button==buttonmenumainhighscoreclear){
				  if(abfrage(strfaclearhighscore,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)){
				   gamestats[currentgame]->clearhighscorelist();
				   updatemenumain();
				   windowstatisticsshort->animieren(maus,tastatur);
				  };
				 };
				 //--------------- scenen änderung -------------------------
				 /*
				 if(iggsystem->button if(iggsystem->button.index=49
				  currentscene+=1
				  if(currentscene>scenecount-1 currentscene=0
				  updatescene()
				  //updatefantasywindowscene()
				  //windowfantasyscene.animieren()
				  if(cardtexturebackuser=false
				   //cardtexturebackindex=currentscene
				   if(game game->updatetexture()
				  };
				  if(musicsequence && currentmusic!=currentscene
				   currentmusic=currentscene
				   if(currentmusic>musiccount-2 currentmusic=musiccount-2
				   musicman.channelmenufadeswitch=true
				   musicman.channelmenuswitchto=currentmusic
				   musicman.channelmenufadeup=false
				   musicman.channelmenufadedown=false
				  };
				  //updatefantasywindowmusic()
				 };
				 
			  	 if(iggsystem->button if(iggsystem->button.index=48
				  currentscene-=1
				  if(currentscene<0 currentscene=scenecount-1
				  updatescene()
				  //updatefantasywindowscene()
				  //windowfantasyscene.animieren()
				  if(cardtexturebackuser=false
				   //cardtexturebackindex=currentscene
				   if(game game->updatetexture()
				  };
				  if(musicsequence && currentmusic!=currentscene
				   currentmusic=currentscene
				   if(currentmusic>musiccount-2 currentmusic=musiccount-2
				    musicman.channelmenufadeswitch=true
				    musicman.channelmenuswitchto=currentmusic
				    musicman.channelmenufadeup=false
				    musicman.channelmenufadedown=false
				   };
				   //updatefantasywindowmusic()
				  };
				  */
				  //-------------------- karten options aufruf -------------------------
				  // if(iggsystem->button if(iggsystem->button=buttonmenumain showmenuoptions(menuoptionscard,false,true)
				  //--------------- musik änderung -------------------------
				  /*
				  if(iggsystem->button if(iggsystem->button.index=52 || iggsystem->button.index=50
				   currentmusic+=1
				   if(currentmusic>musiccount-2 currentmusic=0
				   //updatefantasywindowmusic()
				   musicman.play(currentmusic,false,true)
				   windowfantasymusic.animieren()
				   musicsequence=false
				   cbms.checked=musicsequence
				   currentmusicuser=true
				  };
				  if(iggsystem->button if(iggsystem->button.index=51
				   currentmusic-=1
				   if(currentmusic<0 currentmusic=musiccount-2
				   //updatefantasywindowmusic()
				   windowfantasymusic.animieren()
				   musicman.play(currentmusic,false,true)
				   musicsequence=false
				   cbms.checked=musicsequence
				   currentmusicuser=true
				  };
				  */
				  //------------------ statistik ----------------------------
				  if(iggsystem->button) if(iggsystem->button->index==54){//highscore löschen
				   if(abfrage(strfaclearhighscore,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)){
				    gamestats[currentgame]->highscorelist.loeschen();
				    updatemenumain();
				   };
				  };
				  if(iggsystem->button) if(iggsystem->button->index==55){//statisitk löschen
				   if(abfrage(strfaclearstatistics,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)){
				    gamestats[currentgame]->entrylist.loeschen();
				    updatemenumain();
				   };
				  };
				 };	
};								
void _solitairefantasy::mainloopmenuuser(){
				_igg*it;
				_iggcheckbox*cit;
 				_iggtext*tit;
 				_iggimage*iit;
				//--------------------------------------------------------------------- usermenu ------------------------------------------------------
				if(menuusercreate->active()){
				 if(tastatur->enter()){
				  onusercreatecreate();
				 };					 
				};
				if((usermanagement->aktuell()==0)&&(menuusercreate->active()==false)){
					L->schreiben("HHHHHHHHHHHHHHHHHHHHHH");
				 menuusercreatefrom=2;
				 windowusercreatename->text=L"";
				 windowusercreateimagelist->selection=0;
				 windowusercreateimagelist->setpositiony(_tg(150)/_tg(710));
				 windowusercreateimagelist->setsizey(_tg(440)/_tg(700));
				 if(windowusercreateimagelist->anfang(it))do{//for(Local cit:_iggcheckbox=EachIn windowusercreateimagelist.childlist
				  cit=dynamic_cast<_iggcheckbox*>(it);
				  if(cit) cit->checked=false;
				 }while(windowusercreateimagelist->naechstes(it));
				 buttonusercreatecreate->text=strcreate;
				 buttonusercreatecancel->superinvisible=true;
				 windowusercreatetitle->setzen(strusercreatefirst0);
				 windowusercreatetitle1->superinvisible=false;
				 windowusercreatetitle2->superinvisible=false;
				 windowusercreatetitle->zeichensatz(font24);
				 windowusercreatetitle1->zeichensatz(font24);
				 windowusercreatetitle2->zeichensatz(font24);

				// windowusercreatetitle->centerx(0.5);//windowusercreate->width()/2-5)
				// windowusercreatetitle1->centerx(0.5);//windowusercreate->width()/2-5)
				// windowusercreatetitle2->centerx(0.5);//windowusercreate->width()/2-5)
				 menuman->show(menuusercreate);	
				};
				if(iggsystem->button){
										//   L->schreiben("ON MENU USER CREATE  : button");

				 if(iggsystem->button==buttonusercreate){
					  L->schreiben("ON MENU USER CREATE  : buttonusercreate");
				  menuusercreatefrom=0;
				  windowusercreatename->text=L"";
				  buttonusercreatecancel->superinvisible=false;
				  windowusercreateimagelist->setpositiony(_tg(90)/_tg(710));
				  windowusercreateimagelist->setsizey(_tg(500)/_tg(700));
				  windowusercreatetitle1->superinvisible=true;
				  windowusercreatetitle2->superinvisible=true;
				  windowusercreatetitle->zeichensatz(font30);
				  windowusercreatetitle1->zeichensatz(font30);
				  windowusercreatetitle2->zeichensatz(font30);
				  windowusercreateimagelist->selection=0;
				  if(windowusercreateimagelist->anfang(it))do{//for(Local cit:_iggcheckbox=EachIn windowusercreateimagelist.childlist
				   cit=dynamic_cast<_iggcheckbox*>(it);
				   if(cit) cit->checked=false;
				  }while(windowusercreateimagelist->naechstes(it));
				  buttonusercreatecreate->text=strcreate;
				  windowusercreatetitle->setzen(strcreateuser);
				  //windowusercreatetitle->centerx(0.5);//windowusercreate.width()/2-5)
				  //windowusercreatetitle1->centerx(0.5);//windowusercreate.width()/2-5)
				  //windowusercreatetitle2->centerx(0.5);//windowusercreate.width()/2-5)
				  menuman->show(menuusercreate);
				 };
				 if((iggsystem->button==buttonuseredit)&&(usermanagement->aktuell())){
				  menuusercreatefrom=1;
				  windowusercreatename->text=usermanagement->aktuell()->name();
				  buttonusercreatecancel->superinvisible=false;
				  windowusercreateimagelist->setpositiony(_tg(90)/_tg(710));
				  windowusercreateimagelist->setsizey(_tg(500)/_tg(700));
				  windowusercreatetitle1->superinvisible=true;
				  windowusercreatetitle2->superinvisible=true;
				  windowusercreatetitle->zeichensatz(font30);
				  windowusercreatetitle1->zeichensatz(font30);
				  windowusercreatetitle2->zeichensatz(font30);
				  int imageindex=-1;
				  int ii=0;
				  ii=0;
				  if(windowusercreateimagelist->anfang(it))do{
				   cit=dynamic_cast<_iggcheckbox*>(it);
				   if(cit){
				    if(ii==usermanagement->aktuell()->bildindex()){
				     cit->checked=true;
				     windowusercreateimagelist->selection=cit->crosslinkimage;
				    }else{ 
				     cit->checked=false;
				    };
				    ii++;
				   };
				  }while(windowusercreateimagelist->naechstes(it));
				  buttonusercreatecreate->text=strsetzen;
				  windowusercreatetitle->setzen(stredituser);
				  //windowusercreatetitle->centerx(0.5);//windowusercreate.width()/2-5)
				  //windowusercreatetitle1->centerx(0.5);//windowusercreate.width()/2-5)
				  //windowusercreatetitle2->centerx(0.5);//windowusercreate.width()/2-5)
				  menuman->show(menuusercreate);
				 };
				 if((iggsystem->button==buttonuserdelete)&&(usermanagement->aktuell())){
				  if(abfrage(struserdelete,stryes,strno,gra->groessex()/2,gra->groessey()/2,font24,imessagewindow)){
				   for( int i=0;i<gametypecount;i++){
				    if(gamestats[i]){
				     _gamestatsentry*eit;
				     if(gamestats[i]->entrylist.anfang(eit))do{
				      if(usermanagement->aktuell()->name()==eit->user) eit->_listenknotenbasis<_gamestatsentry>::loeschmarkierung(true);
				     }while(gamestats[i]->entrylist.naechstes(eit));
				     if(gamestats[i]->highscorelist.anfang(eit))do{
				      if(usermanagement->aktuell()->name()==eit->user) eit->_listenknotenbasis<_gamestatsentry>::loeschmarkierung(true);
				     }while(gamestats[i]->highscorelist.naechstes(eit));
				     gamestats[i]->entrylist.loeschenmarkiert();
				     gamestats[i]->highscorelist.loeschenmarkiert();
				    };
				   };
				   usermanagement->loeschenbenutzer(usermanagement->aktuell()->name());
				   updatelistboxuser(windowuserlist,false);
				   updatelistboxuserselection();
				   windowuser->updatefadeopacity();
				   updatemenumain();
				  };
				 };
				 if((iggsystem->button==buttonusercreatecancel)){
				  if((menuusercreatefrom==0)||(menuusercreatefrom==1)){
				   menuman->show(menuuser);
				  };
				 };
				 if(iggsystem->button==buttonusercreatecreate){
					 L->schreiben("ON MENU USER CREATE  : buttonusercreatecreate");
				  onusercreatecreate();				
				 };
				};
				if(iggsystem->checkbox){
				 if((iggsystem->checkbox->index>=8000)&&(iggsystem->checkbox->index<8100)){
				  if(windowusercreateimagelist->anfang(it))do{//for(Local cit:_iggcheckbox=EachIn windowusercreateimagelist.childlist
				   cit=dynamic_cast<_iggcheckbox*>(it);
				   if(cit) cit->checked=false;
				  }while(windowusercreateimagelist->naechstes(it));
				  iggsystem->checkbox->checked=true;
				  if(iggsystem->checkbox->crosslinkimage) windowusercreateimagelist->selection=iggsystem->checkbox->crosslinkimage;
				 };
				 if((iggsystem->checkbox->index>=7000)&&(iggsystem->checkbox->index<7100)){
				  if(windowuserlist->anfang(it))do{//for(Local cit:_iggcheckbox=EachIn windowuserlist.childlist
				   cit=dynamic_cast<_iggcheckbox*>(it);
				   if(cit){
				    if(cit!=iggsystem->checkbox) cit->checked=false; else cit->checked=true;
				   };
				  }while(windowuserlist->naechstes(it));
				  int ii=0;
				  if(windowuserlist->anfang(it))do{//for(Local iit:_iggimage=EachIn windowuserlist.childlist
				   iit=dynamic_cast<_iggimage*>(it);
				   if(iit){
				    if(ii==(iggsystem->checkbox->index-7000)*2) windowuserlist->selection=iit;
				    ii++;
				   };
				  }while(windowuserlist->naechstes(it));;		
				  ii=0;
				  if(windowuserlist->anfang(it))do{//for(Local tit:_iggtext=EachIn windowuserlist.childlist
				   tit=dynamic_cast<_iggtext*>(it);
				   if(tit){
				    if(ii==(iggsystem->checkbox->index-7000)) usermanagement->benutzer(tit->lesen());
				    ii++;
				   };
				  }while(windowuserlist->naechstes(it));				   
				 };
				 updatemenumain();
				};
				/*
				if(iggsystem->text
				 Print "tttt"
				 if(iggsystem->text.index>=7100 && iggsystem->text.index<7200
				  usermanagement->setuser(iggsystem->text.get())
				  updatelistboxuserselection()
				 };
				};
				*/
				if(iggsystem->listbox){
				 if(iggsystem->listbox==windowuserlist){
				  if(windowuserlist->selection){
				   _iggtext*gt=dynamic_cast<_iggtext*>(windowuserlist->selection);
				   if(gt){
				    if((gt->index>=7100)&&(gt->index<=7200)){
				     usermanagement->benutzer(gt->lesen());
				     updatelistboxuserselection();
				     updatemenumain();
				    };
				   };
				  }; 
				 };
				};
				if((iggsystem->image)&&(iggsystem->listbox==windowusercreateimagelist)||(iggsystem->listbox==windowuserlist)){ 
				 if((iggsystem->image->index>=8100)&&(iggsystem->image->index<8200)){
				  int ii=0;
				  if(windowusercreateimagelist->anfang(it))do{//for(Local cit:_iggcheckbox=EachIn windowusercreateimagelist.childlist
				   cit=dynamic_cast<_iggcheckbox*>(it);
				   if(cit) cit->checked=false;
				  }while(windowusercreateimagelist->naechstes(it));
				  windowusercreateimagelist->selection=iggsystem->image;
				  if(iggsystem->image->crosslinkcheckbox){
				   iggsystem->image->crosslinkcheckbox->checked=true;
				  };
				  updatemenumain();
				 };
				 if((iggsystem->image->index>=7100)&&(iggsystem->image->index<7200)){
				  int ii=0;
				  if(windowuserlist->anfang(it))do{//for(Local cit:_iggcheckbox=EachIn windowuserlist.childlist
				   tit=dynamic_cast<_iggtext*>(it);
				   if(tit){
				    if(ii==(iggsystem->image->index-7100)) cit->checked=true; else cit->checked=false;
				    ii++;
				   };
				  }while(windowuserlist->naechstes(it));
				  ii=0;
				  if(windowuserlist->anfang(it))do{//for(Local tit:_iggtext=EachIn windowuserlist.childlist
				   tit=dynamic_cast<_iggtext*>(it);
				   if(tit){
				    if(ii==(iggsystem->image->index-7100)){
				     usermanagement->benutzer(tit->lesen());
				     updatemenumain();
				    };
				    ii++;
				   };
				  }while(windowuserlist->naechstes(it));
				 };
				};
};
void _solitairefantasy::onusercreatecreate(){
					   L->schreiben("ON MENU USER CREATE ");

				  bool mist=false;
				  if(windowusercreatename->text==L""){
				   messagebox(strusercreateerrorname,strok,gra->groessex()/2,gra->groessey()/2,font24,imessagewindow);
				   mist=true;
				  };
				  if(menuusercreatefrom==0){
				   if((mist==false)&&(usermanagement->existiert(windowusercreatename->text))){
				    messagebox(strusercreateerrorexist,strok,gra->groessex()/2,gra->groessey()/2,font24,imessagewindow);
				    mist=true;
				   };
				  }else if(menuusercreatefrom==1){
				   if(mist==false){
				    if(windowusercreatename->text!=usermanagement->aktuell()->name()){
				     bool exists=false;
				     _benutzer*uit;
				     if(usermanagement->anfang(uit))do{//for(Local uit:_user=EachIn usermanagement->list
				      if(uit!=usermanagement->aktuell()){
				       if(uit->name()==windowusercreatename->text) exists=true;
				      };
				     }while(usermanagement->naechstes(uit));
				     if(exists){
				      messagebox(strusercreateerrorexist,strok,gra->groessex()/2,gra->groessey()/2,font24,imessagewindow);
				      mist=true;
				     };
				    };
				   };
				  };
				  if((mist==false)&&(windowusercreateimagelist->selection==0)){
				   messagebox(strusercreateerrorfigure,strok,gra->groessex()/2,gra->groessey()/2,font24,imessagewindow);
				   mist=true;
				  };
				  if(mist==false){
				   if(menuusercreatefrom==0){
					   L->schreiben("ON MENU USER CREATE  : FALL 0");
				    usermanagement->erzeugenbenutzer(windowusercreatename->text,windowusercreateimagelist->selection->index-8100,0);
					L->schreiben("ERSTER BENUTZER WEURDE ERZEUGT");
				    menuman->show(menuuser);
				    updatelistboxuser(windowuserlist,false);
				    updatelistboxuserselection();
				    windowuserlist->animieren(maus,tastatur);
				    updatemenumain();
				   }else if(menuusercreatefrom==1){//------------------------------ names änderung ---------------------------
					   L->schreiben("ON MENU USER CREATE  : FALL 1");
				    for(int i=0;i<gametypecount;i++){
				     if(gamestats[i]){
				      _gamestatsentry*eit;
				      if(gamestats[i]->entrylist.anfang(eit))do{//for(Local eit:_gamestatsentry=EachIn gamestats[i].entrylist
				       if(eit->user==usermanagement->aktuell()->name()) eit->user=windowusercreatename->text;
				      }while(gamestats[i]->entrylist.naechstes(eit));
				      if(gamestats[i]->highscorelist.anfang(eit))do{//for(Local eit:_gamestatsentry=EachIn gamestats[i].highscorelist
				       if(eit->user==usermanagement->aktuell()->name()) eit->user=windowusercreatename->text;
				      }while(gamestats[i]->highscorelist.naechstes(eit));
				     };
				    };
				    usermanagement->aktuell()->name(windowusercreatename->text);
				    usermanagement->aktuell()->bildindex(windowusercreateimagelist->selection->index-8100);
				    menuman->show(menuuser);
				    updatelistboxuser(windowuserlist,false);
				    updatelistboxuserselection();
				    windowuser->animierenfade();
					windowuserlist->animieren(maus,tastatur);
				    updatemenumain();
				   }else if(menuusercreatefrom==2){
					   L->schreiben("ON MENU USER CREATE  : FALL 2");
				    usermanagement->erzeugenbenutzer(windowusercreatename->text,windowusercreateimagelist->selection->index-8100,0);
				    updatelistboxuser(windowuserlist,false);
				    updatelistboxuserselection();
				    windowuserlist->animieren(maus,tastatur);
				    updatemenumain();
					if((usermanagement->aktuell())&&(showedoptionscard==false)){
					 optionscalledfromgame=false;
					 showedoptionscard=true;
					 menuman->show(menuoptionscardfront);
	 				 if(game) game->allowpick=false;
					}else if((usermanagement->aktuell())&&(showedoptionscard)){
				     windowuser->animierenfade();
				 	 windowuserlist->animieren(maus,tastatur);
				     updatemenumain();
					 showmenumain();
					};					
				   };
				  };
};				
void _solitairefantasy::mainloopmenucardgenerator(){
				if(menucardgenerator->active()){
				 if(iggsystem->button){
				  if(iggsystem->button==cardgeneratorbuttonback){
				   cardsetmanager->actualedit->generatetexture(gra);
				   menuman->show(menuoptionscard);
				   cardsetmanager->cleartexturehardwaresources();
				  }; 
				  if(iggsystem->button==cardgeneratorbuttonreset){
				   cardsetmanager->actualedit->reset();
				   updatemenucardgenerator(cardsetmanager->actualedit);
				   cardgeneratorwindow->animieren(maus,tastatur);
				  }; 
				 };
				 if(iggsystem->listbox){//all selections
				  _iggmesh*m=0;
				  if(iggsystem->mesh){
				   m=iggsystem->mesh;
				   iggsystem->listbox->checkboxes(false);
				   iggsystem->mesh->crosslinkcheckbox->checked=true;
				 //  Print "LISTBOX MESH"
				 //  if(m.parent=iggsystem->listbox Print "ist parent"
				  // for(Local pit:_polygon=EachIn m.mesh.polygonlist
				    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				   // if(pit.texture[0,0] Print pit.texture[0,0].file
				  // };
				  };
				  if(iggsystem->checkbox){
				   iggsystem->listbox->checkboxes(false);
				   iggsystem->checkbox->checked=true;
				   m=iggsystem->checkbox->crosslinkmesh;
				   iggsystem->listbox->selection=m;
				  };
				  if(m){
				   if(iggsystem->listbox==cardgeneratorlistboxground) cardsetmanager->actualedit->groundselection=m->crosslinkname.ascii();
				   if(iggsystem->listbox==cardgeneratorlistboxframe)  {
					   cardsetmanager->actualedit->frameselection=m->crosslinkname.ascii();
					   L->schreiben(" checkbiox crosslin mesh = ",m->crosslinkname.ascii());
				   };
				   if(iggsystem->listbox==cardgeneratorlistboxgroundstructure) cardsetmanager->actualedit->structuregroundselection=m->crosslinkname.ascii();
				   if(iggsystem->listbox==cardgeneratorlistboxframestructure)  cardsetmanager->actualedit->structureframeselection=m->crosslinkname.ascii();
				   if(iggsystem->listbox==cardgeneratorlistboximpurity) cardsetmanager->actualedit->impurityselection=m->crosslinkname.ascii();
				   cardsetmanager->actualedit->generatetexturepreview(gra);
				  };
				 };
				 if(iggsystem->checkbox){
				  if(iggsystem->checkbox==cardgeneratorcheckboxgroundstructurebehind) cardsetmanager->actualedit->structuregroundbehind=cardgeneratorcheckboxgroundstructurebehind->checked;
				  cardsetmanager->actualedit->generatetexturepreview(gra);
				 };
				 if(iggsystem->trackbar){
				  if(iggsystem->trackbar==cardgeneratortrackbargroundstructure) cardsetmanager->actualedit->structureground=cardgeneratortrackbargroundstructure->lesen();
				  if(iggsystem->trackbar==cardgeneratortrackbarframestructure) cardsetmanager->actualedit->structureframe=cardgeneratortrackbarframestructure->lesen();

				  if(iggsystem->trackbar==cardgeneratortrackbarframebackside) cardsetmanager->actualedit->frameforbacksides=cardgeneratortrackbarframebackside->lesen();
				  if(iggsystem->trackbar==cardgeneratortrackbarframepicture) cardsetmanager->actualedit->frameforpictures=cardgeneratortrackbarframepicture->lesen();
				  if(iggsystem->trackbar==cardgeneratortrackbarframenumber) cardsetmanager->actualedit->framefornumbers=cardgeneratortrackbarframenumber->lesen();

				  if(iggsystem->trackbar==cardgeneratortrackbarimpurity) cardsetmanager->actualedit->impurity=cardgeneratortrackbarimpurity->lesen();
				  if(iggsystem->trackbar==cardgeneratortrackbarimpurityyellowing) cardsetmanager->actualedit->impurityyellowing=cardgeneratortrackbarimpurityyellowing->lesen();
				  if(iggsystem->trackbar==cardgeneratortrackbarimpurityscratchs) cardsetmanager->actualedit->impurityscratchs=cardgeneratortrackbarimpurityscratchs->lesen();
			      cardsetmanager->actualedit->generatetexturepreview(gra);
				 };
				};
};		
void _solitairefantasy::mainloopmenuoptions(){
				if(menuoptionscardfront->active()){
				 if(tastatur->enter()){
				  optionscalledfromgame=false;
				  showedmenugametype=true;
				  showmenugametype();
				 };					 
				};							
				//-----------------------------------------options menu-----------------------------------------------------------------------
				if(iggsystem->button){
				 if(iggsystem->button->index==7) showmenuoptions(menuoptionsacoustics,optionscalledfromgame,false);
				 if(iggsystem->button->index==8) showmenuoptions(menuoptionsgraphics,optionscalledfromgame,false);
				 if(iggsystem->button->index==9) showmenuoptions(menuoptionsgame,optionscalledfromgame,false);
				 if(iggsystem->button->index==10) showmenuoptions(menuoptionscard,optionscalledfromgame,false);
				 if(iggsystem->button->index==12) showmenuoptions(menuoptionscredits,optionscalledfromgame,false);
				 if(iggsystem->button->index==11){//options - zurück button 
				  if(optionscalledfromgame){
				   showmenugame();
				  }else{ 
				   if(showedmenugametype==false){
				    optionscalledfromgame=false;
				    showedmenugametype=true;
				    showmenugametype();		 
				   }else{
					showmenumain();
				   };
				  };
				  if(game) game->allowpick=true;
				 };
				 int texgenbuttonfront=-1;
				 _listenknoten<_iggbutton>*bit;
				 if(buttonoptionscardchangefrontlist.anfang(bit))do{
				  if(iggsystem->button==bit->objekt()){
				   texgenbuttonfront=bit->objekt()->index;
				  };
				 }while(buttonoptionscardchangefrontlist.naechstes(bit));
				 if(texgenbuttonfront!=-1){
				  cardtexturefrontindex=texgenbuttonfront-200;
				  updatemenuoptionscardcheckboxfront(&checkboxoptionscardfrontlist);
				  lbdecktexture->selection=updatemenuoptionscardcheckboxfront(&checkboxoptionscardfrontlist)->crosslinkmesh;
				  updatemenucardgenerator(cardsetmanager->cardsetfront(cardtexturefrontindex));
				  menucardgenerator->fadetarget(menuopacity2);
				  menucardgenerator->fadeopacity(0);
				  menuman->show(menucardgenerator);
				 };
				 int texgenbuttonback=-1;
				 if(buttonoptionscardchangebacklist.anfang(bit))do{
				  if(iggsystem->button==bit->objekt()){
				   texgenbuttonback=bit->objekt()->index;
				  };
				 }while(buttonoptionscardchangebacklist.naechstes(bit));
				 if(texgenbuttonback!=-1){
				  cardtexturebackindex=texgenbuttonback-200;
				  lbcardtexture->selection=updatemenuoptionscardcheckboxback(&checkboxoptionscardbacklist)->crosslinkmesh;
				  updatemenucardgenerator(cardsetmanager->cardsetback(cardtexturebackindex));
				  menucardgenerator->fadetarget(menuopacity2);
				  menucardgenerator->fadeopacity(0);	
				  menuman->show(menucardgenerator);
				 };				

				 if(iggsystem->button==buttonoptionsgraphicslightbright){
				  farbekerze.setzen(1,1,1);
				  world->lichtambient().setzen(1,1,1);
				  cardlighting=0.123;
                  mainloopmenuoptionsupdatelighting();
				 };		
				 if(iggsystem->button==buttonoptionsgraphicslightmedium){
				  world->lichtambient().setzen(0.32,0.42,0.58);
				  cardlighting=0.32;
				  farbekerze.setzen(1,0.96,0.77);
                  mainloopmenuoptionsupdatelighting();
				 };		
				 if(iggsystem->button==buttonoptionsgraphicslightnatural){
				  farbekerze.setzen(1,0.65,0.29);
				  world->lichtambient().setzen(0.61,0.46,0.21);
				  cardlighting=0.26;
                  mainloopmenuoptionsupdatelighting();
				 };		
				 if(iggsystem->button==buttonoptionsgraphicslightnight){
				  farbekerze.setzen(0.27,0.49,0.09);
				  world->lichtambient().setzen(0.16,0.18,0.99);
				  cardlighting=0.3;
                  mainloopmenuoptionsupdatelighting();
				 };
				};
				if(iggsystem->checkbox){
				 if((iggsystem->checkbox->index>=100)&&(iggsystem->checkbox->index<200)){
				  cardtexturebackindex=iggsystem->checkbox->index-100;
				  cardsetmanager->generatetextureback(gra,cardtexturebackindex);
				  cardsetmanager->cleartexturehardwaresources();
				  updatemenuoptionscardcheckboxback(&checkboxoptionscardbacklist);
				  cardtexturebackuser=true;
				  lbcardtexture->selection=iggsystem->checkbox->crosslinkmesh;
				 }else if((iggsystem->checkbox->index>=200)&&(iggsystem->checkbox->index<300)){
				  int ni=iggsystem->checkbox->index-200;
				  if(ni!=cardtexturefrontindex){
				   cardtexturefrontindex=ni;
				   cardsetmanager->generatetexture(gra);
				   cardsetmanager->cleartexturehardwaresources();
				   updatemenuoptionscardcheckboxfront(&checkboxoptionscardfrontlist);
				   lbdecktexture->selection=iggsystem->checkbox->crosslinkmesh;
				  };
				 }else if((iggsystem->checkbox->index>=700)&&(iggsystem->checkbox->index<800)){
				  int ni=iggsystem->checkbox->index-700;
				  if(ni!=currentscene){
				   currentscene=ni;
				  // updatemenuscenecheckbox(checkboxscenelist);
				   updatescene();
				   unsigned int iii=0;
				   _igg*it;
				   if(lbscene->anfang(it))do{
				    _iggimage*iit=dynamic_cast<_iggimage*>(it);
				    if(iit){
				     if(currentscene==iii) lbscene->selection=iit;
				     iii++;
				    };
				   }while(lbscene->naechstes(it));
				  };
				 };
				};
				if(iggsystem->mesh){
				 if((iggsystem->mesh->index>=100)&&(iggsystem->mesh->index<200)){
				  cardtexturebackindex=iggsystem->mesh->index-100;
				  cardsetmanager->generatetextureback(gra,cardtexturebackindex);
				  cardsetmanager->cleartexturehardwaresources();
				  updatemenuoptionscardcheckboxback(&checkboxoptionscardbacklist);
				  cardtexturebackuser=true;
				 }else if((iggsystem->mesh->index>=200)&&(iggsystem->mesh->index<300)){
				  int ni=iggsystem->mesh->index-200;
				  if(ni!=cardtexturefrontindex){
				   cardtexturefrontindex=ni;
				   cardsetmanager->generatetexturefront(gra,cardtexturefrontindex);
				   cardsetmanager->cleartexturehardwaresources();
				   updatemenuoptionscardcheckboxfront(&checkboxoptionscardfrontlist);
				  };
				 };
				};	
				if(iggsystem->image){
				 if((iggsystem->image->index>=700)&&(iggsystem->image->index<800)){
				  int ni=iggsystem->image->index-700;
				  if(ni!=currentscene){
				   currentscene=ni;
				  // updatemenuscenecheckbox(checkboxscenelist);
				   updatescene();
				  };
				 };
				};
				if(iggsystem->trackbar){
				 _iggtrackbar*t=iggsystem->trackbar;
				 if(t==tbgrcs) cardslope=tbgrcs->lesen();
				 if(t==tbgrct) cardthickness=tbgrct->lesen();
				 if(t==tbgrcl) cardtableaulift=tbgrcl->lesen();
				 if(t==tbgrcw){
				  cardwidth=tbgrcw->lesen();
				  if(game) game->update();
				 };	
				 if(t==tbgrch){
				  cardheight=tbgrch->lesen();
				  if(game) game->update();
				 };
				 if(t==tbgrci){
				  cardlighting=tbgrci->lesen();
				  if(game) game->sigmadiffuse(cardlighting);
				 };
				 if(t==sfarbekerzer){
				  farbekerze.x(sfarbekerzer->lesen());
				  _listenknoten<_candle>*cit;
				  if(candlegamelist.anfang(cit))do{
				   cit->objekt()->lightcolor.x(farbekerze.x());
				  }while(candlegamelist.naechstes(cit));
				 };
				 if(t==sfarbekerzeg){
				  farbekerze.y(sfarbekerzeg->lesen());
				  _listenknoten<_candle>*cit;
				  if(candlegamelist.anfang(cit))do{
				   cit->objekt()->lightcolor.y(farbekerze.y());
				  }while(candlegamelist.naechstes(cit));
				 };
				 if(t==sfarbekerzeb){
				  farbekerze.z(sfarbekerzeb->lesen());
				  _listenknoten<_candle>*cit;
				  if(candlegamelist.anfang(cit))do{
				   cit->objekt()->lightcolor.z(farbekerze.z());
				  }while(candlegamelist.naechstes(cit));
				 };
				 if(t==sfarbeambienzr){ 
				  world->lichtambient().x(sfarbeambienzr->lesen());
				  farbeambienz=world->lichtambient();
				 };
				 if(t==sfarbeambienzg){
				  world->lichtambient().y(sfarbeambienzg->lesen());
				  farbeambienz=world->lichtambient();
				 };
				 if(t==sfarbeambienzb){
				  world->lichtambient().z(sfarbeambienzb->lesen());
				  farbeambienz=world->lichtambient();
				 };
				 if(t==tbgrnp){
				  naturalpiles=tbgrnp->lesen();
				  if(game) game->updatenaturality();
				 }; 
				 if(t==tbgrgo){
				  menugameopacity=tbgrgo->lesen();
				  menugame->fadetarget(menugameopacity);
				 }; 
				 if(t==tbva){
				  volumeambience=tbva->lesen();
				  //channelambience->setvolume(volumeambience);!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 };
				 if(t==tbvs) volumesound=tbvs->lesen();
				 if(t==tbvm){
				  musicman->lautstaerke(tbvm->lesen());
				  //channelmusic->setvolume(volumemusic);
				 };
				 if(t==tbgdi) difficulty=tbgdi->lesen();
				 if(t==tbgav) autospeed=tbgav->lesen();
				 if(t==tbsp) systemperformance=tbsp->lesen();
				 t->sliderimageindex++;
				 if(t->sliderimageindex>5) t->sliderimageindex=0;
				};
				if(iggsystem->checkbox){
				 _iggcheckbox*c=iggsystem->checkbox;
				 if(c==cbgrsm){
				  sparkingmouse=cbgrsm->checked;
				  if(sparkingmouse){
				   _listenknoten<_candle>*cit;
				   if(candlegamelist.anfang(cit))do{//for(Local cit:_candle=EachIn candlegamelist
				    cit->objekt()->intensitaetdynamisch(50);
				   }while(candlegamelist.naechstes(cit));
				  };
				 };
				 if(c==cbgrtd) timeduringgame=cbgrtd->checked;
				 if(c==cbgrlp) buttonpanel=cbgrlp->checked;
				 if(c==cbgrgp) gameplaybuttons=cbgrgp->checked;
				 if(c==cbgrmb) menubuttons=cbgrmb->checked;
				 if(c==cbgrca){
				  cardanimation=cbgrca->checked;
				  updatescene();
				 };
				 if(c==cbms) musicsequence=cbms->checked;
				 if(c==cbsp){
				  systemaccellerate=cbsp->checked;
				  if(game) game->markforupdateshadow(0);
				 };
				 if(c==cbfv){
				  fastvideomode=cbfv->checked;
				  grafikmodus(0);
				  saveoptions(strfileoptions);
				  updatefullscreenhelp();
				  updatemenumain();			
				 };
				 if(c==cbsy) videosynchronisation=cbsy->checked;
				 if(c==cbmb) mybenchmark=cbmb->checked;
				 if(iggsystem->checkbox==cbfs){
				  fullscreen=cbfs->checked;
				  grafikmodus(0);
				  saveoptions(strfileoptions);
				  updatemenumain();		
				 };
				 if(c==cbgrmo) mouseovercard=cbgrmo->checked;
				 if(c==cbgrmp) mouseoverpile=cbgrmp->checked;
				 if(c==cbgrgr){
				  greenboard=cbgrgr->checked;
				  tbackgroundgamea->loeschen();
				  tbackgroundgamel->loeschen();
				  deletesecure(tbackgroundgamea);
				  deletesecure(tbackgroundgamel);
				  if(greenboard){
				   tbackgroundgamea=ladentextur(datenpfad+"fantasy/scene/table_08_2048_1024.jpg");
				   tbackgroundgamel=ladentextur(datenpfad+"fantasy/scene/table_08_2048_1024hl.jpg");
				  }else{
				   tbackgroundgamea=ladentextur(datenpfad+"fantasy/scene/table_07_2048_1024.jpg");
				   tbackgroundgamel=ladentextur(datenpfad+"fantasy/scene/table_07_2048_1024hl.jpg");
				  };		
				  if(background) background->updatetexture();
				 };
			  	 if(c==cbgas) autostart=cbgas->checked;
			  	 if(c==cbgat) autoturncard=cbgat->checked;
			  	 if(c==cbgad){
			      autodiscard=cbgad->checked;
			      autofoundation=cbgad->checked;
			     };
			  	 if(c==cbgaf) autofoundation=cbgaf->checked;
			  	 if(c==cbgae) autoempty=cbgae->checked;
			  	 if(c==cbgcr) clickplayright=cbgcr->checked;
			  	 if(c==cbgcd) clickplaydouble=cbgcd->checked;
			  	 if((c==cbgpc)||(c==cbgpa)){
			 	  if(c==cbgpc){
			       pointandclick=cbgpc->checked;
			 	   if(pointandclickalternative){
			  		cbgpa->checked=false;
			        pointandclickalternative=false;
				   };
				  };
			 	  if(c==cbgpa){
			       pointandclickalternative=cbgpa->checked;
			 	   if(pointandclick){
			  		cbgpc->checked=false;
			        pointandclick=false;
				   };
				  };
			 	 };
			  	 if(c==cbgcq) confirmonquit=cbgcq->checked;
				};	
};		
void _solitairefantasy::mainloopmenuoptionsupdatelighting(){
				  _listenknoten<_candle>*cit;
				  if(candlegamelist.anfang(cit)){
				   cit->objekt()->lightcolor=farbekerze;
				  }while(candlegamelist.naechstes(cit));		
				  tbgrci->setzen(cardlighting);
				  if(game) game->sigmadiffuse(cardlighting);
				  sfarbekerzer->setzen(farbekerze.x());
				  sfarbekerzeg->setzen(farbekerze.y());
				  sfarbekerzeb->setzen(farbekerze.z());
				  sfarbeambienzr->setzen(world->lichtambient().x());
				  sfarbeambienzg->setzen(world->lichtambient().y());
				  sfarbeambienzb->setzen(world->lichtambient().z());
				  farbeambienz=world->lichtambient();
};				  
void _solitairefantasy::mainloopmenustatistics(){
				//--------------------------------------------------------------------- statistics --------------------------
				if(iggsystem->combobox==windowstatisticssortbox){
				 _zeichenkette<_tt> t=iggsystem->combobox->text->lesen();
				 if(t==strgametypesortalphabetical) gametypesortmethod=0;
				 if(t==strgametypesortpublicity) gametypesortmethod=1;
				 if(t==strgametypesortchance) gametypesortmethod=2;
				 if(t==strgametypesortskill) gametypesortmethod=3;
				 if(t==strgametypesorttime) gametypesortmethod=4;
				 if(t==strgametypesorttype) gametypesortmethod=5;
				 updatelistboxgametypesorted(windowstatisticstypelist,current_preview);
				};
				if(iggsystem->listbox){
				 if(iggsystem->listbox==windowstatisticstypelist){
				  updatemenustatistics();
				 };
				 if(iggsystem->listbox==windowstatisticsuserlist){
				  if(iggsystem->image){
				   windowstatisticsuserlist->selection=iggsystem->image;
				  }else{
				   if(windowstatisticsuserlist->selection){
				    _iggtext*gt=dynamic_cast<_iggtext*>(windowstatisticsuserlist->selection);
				    if(gt){
				     if(gt->crosslinkimage){
				      windowstatisticsuserlist->selection=gt->crosslinkimage;
				     };
				    };
				   };
				  };
				  /* 
				  // wird nie benutzt, da texte die gui ereigniszeiger nicht setzen
				  if(iggsystem->text
				   if(iggsystem->text.crosslinkimage
				    windowstatisticsuserlist.selection=iggsystem->text.crosslinkimage
				   };
				  };
				  */
				  updatemenustatistics();
				 };
				};
				if(iggsystem->button){
				 if(iggsystem->button==windowstatisticstypeclear){
				  if(abfrage(strfaclearstatistics,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)){
				   unsigned int cur=windowstatisticsselectedtype();
				   if(cur!=-1){
				    gamestats[cur]->clearentrylist();
				    updatemenustatistics();
				    updatemenumain();
				   };
				  };
				 };
				 if(iggsystem->button==windowstatisticstypereset){
				  if(abfrage(strfaclearstatistics,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)){
				   unsigned int cur=windowstatisticsselectedtype();
				   if(cur!=-1){
				    gamestats[cur]->clearentrylist();
				    for(unsigned int j=0;j<5;j++){
				     _gamestatsentry*eit=new _gamestatsentry(gamestats[cur]);
				     if(zufall<unsigned int>(0,1)==0){
				      eit->discards=zufall<unsigned int>(1,gametype[cur].punktemaximal/2);
				     }else{ 
				      eit->discards=gametype[cur].punktemaximal;
				     }; 
				     eit->time=gametype[j].dauer*60*1000+zufall<_tg>(60*500,60*2500);//20*1000+(15*60*1000)*gametypetime[cur]+ Rnd(0,5*1000*60)
				     eit->moves=zufall<unsigned int>(eit->discards*2,eit->discards*5);
				     eit->user=strdummynames[zufall<unsigned int>(0,9)];
				     eit->undos=0;
				     eit->tipps=0;				
				    };
				    updatemenustatistics();
				    updatemenumain();
				   };
				  };				
				 };
				 if(iggsystem->button==windowstatisticsuserthisclear){
				  if(abfrage(strfaclearstatisticsentry,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)){
				   _zeichenkette<_tt> usr=windowstatisticsselecteduser();
				   unsigned int cur=windowstatisticsselectedtype();
				   if((cur!=-1)&&(usr!=L"")){
				    _gamestatsentry*eit=0;
				    if(gamestats[cur]->entrylist.anfang(eit))do{
				     if(eit->user==usr) eit->_listenknotenbasis<_gamestatsentry>::loeschmarkierung(true);
				    }while(gamestats[cur]->entrylist.naechstes(eit));
				    gamestats[cur]->entrylist.loeschenmarkiert();
				    updatemenustatistics();
				    updatemenumain();
				   };
				  };
				 };
				 if(iggsystem->button==windowstatisticsuserotherclear){
				  if(abfrage(strfaclearstatisticsentry,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)){
				   _zeichenkette<_tt> usr=windowstatisticsselecteduser();
				   unsigned int cur=windowstatisticsselectedtype();
				   if((cur!=-1)&&(usr!=L"")){
				    _gamestatsentry*eit=0;
			        if(gamestats[cur]->entrylist.anfang(eit))do{
				     if(eit->user!=usr) eit->_listenknotenbasis<_gamestatsentry>::loeschmarkierung(true);
				    }while(gamestats[cur]->entrylist.naechstes(eit));
				    gamestats[cur]->entrylist.loeschenmarkiert();
				    updatemenustatistics();
				   };
				  };
				 };
				 if(iggsystem->button==windowstatisticsuserverlauf){
				  messageverlauf();
				 };
				 if(iggsystem->button==windowstatisticsuserverlaufdiscards){
				  messagediscards();
				 };
				 if(iggsystem->button==windowstatisticstyperanks){
				  optionscalledfromgame=false;
				  menuman->show(menuranks);
				  updatemenuranks();
				  windowranks->animierenfade();
				 };
				 if(iggsystem->button==buttonstatisticsranks){
				  optionscalledfromgame=false;
				  menuman->show(menuranks);
				  updatemenuranks();
				  windowranks->animierenfade();
				 };
				};
};	
void _solitairefantasy::mainloopmenuranks(){
				//--------------------------------------------------------------------- ranks --------------------------
				if(iggsystem->combobox==windowrankssortbox){
				 _zeichenkette<_tt> t=iggsystem->combobox->text->lesen();
				 if(t==strgametypesortalphabetical) gametypesortmethod=0;
				 if(t==strgametypesortpublicity) gametypesortmethod=1;
				 if(t==strgametypesortchance) gametypesortmethod=2;
				 if(t==strgametypesortskill) gametypesortmethod=3;
				 if(t==strgametypesorttime) gametypesortmethod=4;
				 if(t==strgametypesorttype) gametypesortmethod=5;
				 updatelistboxgametypesorted(windowrankstypelist,current_preview);
				};
				if(iggsystem->listbox){
				 if(iggsystem->listbox==windowrankstypelist){
				  updatemenuranks();
				 };
				};
				if(iggsystem->button){
				 if(iggsystem->button==buttonranksstatistics){
				  optionscalledfromgame=false;
				  menuman->show(menustatistics);
				 };
				};
};														
void _solitairefantasy::mainloop(){
				keyraus=false;
				buttonraus=false;
				do{
				/*  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 if(volumesoundfadein<1){
				  volumesoundfadein+=0.005;
				  if(volumesoundfadein>1) volumesoundfadein=1;
				 };*/
				 //--------------------------------------------------------------------- animieren--------------------------------------------------------
				 //currentkey=GetChar()
				 animatestandard();
				 animatesystem();
				// if (showedmenugametype==false) L->schreiben("false");
				 buttonraus=false;
				 mainloopmenumain();
				 mainloopmenuoptions();
				 mainloopmenucardgenerator();
				 mainloopmenugametype();
				 mainloopmenugame();
				 mainloopmenuuser();
				 mainloopmenustatistics();			
				 mainloopmenuranks();
				 updategamemenu();

				 if((gamemenu==0)&&(gameopacity<1)){
				  if((usermanagement->aktuell())&&(showedoptionscard)&&(showedmenugametype)){
				   initgamemenu(0,currentgame);
				   transformgamemenu();
				  };
				 }else if((gamemenu)&&(gameopacity==1)){
				  deletesecure(gamemenu);
				 }else if((gamemenu)&&(gameopacity==0)){
				  if(gamemenu->index!=currentgame){
				   initgamemenu(0,currentgame);
				   transformgamemenu();
				  };
				 };

				 if((menugametype->visible()==false)&&(menugametypehelp->visible()==false)){
				  deletesecure(gamepreview);
				 };		
				 if(game){
				  if(game->endedbygiveupburn){
				   _liste<_card>*bl;
				   bl=game->deinsertforblow();
				   deletesecure(game);
				   initgame(0,true);
				   transformgame();
				   game->insertblowlist(bl);
				   deletesecure(bl);

				   //bl.clear()
				  };
			     };	
				 //L->schreiben( "shadowpreviewlist count : "+shadowpreviewlist->anzahl());
				 //L->schreiben( "shadowlist count : "+shadowlist->anzahl());
				 //L->schreiben( "particlesourcegamelist count="+particlesourcegamelist->anzahl());
				 //L->schreiben( "particlegamelist count="+particlegamelist->anzahl());
				 //L->schreiben( "world meshlist count : "+world.meshlist->anzahl());
				 //L->schreiben( "world lightlist count : "+world.lightlist->anzahl());
				 //L->schreiben( "storeable list count : "+storeablelist->anzahl());
				 //if(game){
				 // L->schreiben( "game blowlist : "+game->blowlist->anzahl());
				 // L->schreiben( "game drawlist : "+game->drawlist->anzahl());
				 // L->schreiben( "game cardlist : "+game->cardlist->anzahl());
				 //};
	
				 //--------------------------------------------------------------- keyboard && application animation
			
				 if(tastatur->escape()){ 
				  if(menugame->active()){
				   keyraus=true;
				   if(game) if((game->inuse)&&(game->ended==false)&&(confirmonquit)){
				    if(abfrage(strquit,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)==false) keyraus=false;
				   };
				   if(keyraus){
				    activatestatusmenu();
				    showmenumain();
				    gamefadeout();
				   };
				   keyraus=false;
				  }else if(menumain->active()){
				   keyraus=true;
				  }else if(menugametypehelp->active()){
				   demoplay=false;	
				   showmenugame();
				   if(game) game->allowpick=true;
				  }else if((menuoptionsacoustics->active() || menuoptionsgraphics->active() || menuoptionsgame->active() || menuoptionscard->active() || menuoptionscredits->active()) && optionscalledfromgame){
					showmenugame();
				    if(game) game->allowpick=true;
				  }else if((menuoptionsacoustics->active() || menuoptionsgraphics->active() || menuoptionsgame->active() || menuoptionscard->active() || menuoptionscredits->active()) && optionscalledfromgame==false){
				    showmenumain();
				  }else if(menucardgenerator->active()){
				   cardsetmanager->actualedit->generatetexture(gra);
				   cardsetmanager->cleartexturehardwaresources();
				   menuman->show(menuoptionscard);
				  }else if(menuusercreate->active()){
				   if((usermanagement->aktuell()==0)||(showedmenugametype==false)||(showedoptionscard==false)){
				   //nichts machen
				   }else{
				    showmenumain();
				   };
				  }else if(menuoptionscardfront->active()){
				   if(showedmenugametype==false){
				    optionscalledfromgame=false;
				    showedmenugametype=true;
				    showmenugametype();
				   }else{
					showmenumain();
				   };
				  }else if(menugametype->active()){
				   showmenumain();
				  }else if(menuuser->active()){
				   showmenumain();
				  }else if(menustatistics->active()){
				   showmenumain();
				  }else if(menuranks->active()){
				   showmenumain();
				  };
				 };
			//	L->schreiben("i");
				 if(animateapplication()){
				  keyraus=true;
				  if(game) if((game->inuse)&&(confirmonquit)){
				   if(abfrage(strquit,stryes,strno,gra->groessex()/2,gra->groessey()/2,font18,imessagewindow)==false) keyraus=false;
				  };
				 };
				 //--------------------------------------------------------------------- draw
				// L->schreiben("i0");
				 drawstandard();
				// L->schreiben("i1");
				 iggsystem->nullstates(maus,tastatur);
				// L->schreiben("i2");
				}while((buttonraus==false)&&(keyraus==false));
			//	L->schreiben("e");
				//FlushKeys()
				//return(0);
};
void _solitairefantasy::fadeout(){
				iggsystem->saveactivitylist();
				iggsystem->setactivitylist(false);
				_tg start=clock->system();
				_to op=0;
				musicman->ausblenden();
				do{
				 op=(clock->system()-start)*0.001;
				 if(op>1) op=1;
				 animatestandard();
				 if((game) && ((pgamefadein)||(pgamefadeout))){
				  drawgame();
				  drawmenu(1-gameopacity);
				 }else if(game==0){
				  drawmenu();
				 }else{
				  drawgame();
				 };
			 	 gra->orthonormal();	
			     //gra->wrap(true);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 iggsystem->zeichnen(gra,cam);
				 iggsystem->zeichnencursor(maus,gra,cam);
				 drawblendscreen();
				 drawpause();
				 _vektor4<_to> c(0,0,0,op);
				 gra->transparenzmultiplikativ();
				 gra->rechteck(iblack,0,0,gra->groessex(),gra->groessey(),c);
				 gra->anzeigebufferumschalten(videosynchronisation);
				 iggsystem->nullstates(maus,tastatur);
				}while(op<1);
};
bool _solitairefantasy::checkdate(){
                _activity*ait;
				_activity*ao=0;
                if(activitylist.anfang(ait)){
				 if(ao!=0){
				  int d=ait->dayindex-ao->dayindex;
				  if(ait->dayindex<0) return(true);
				  if(d<0) return(true);
				 };
				 ao=ait;
				}while(activitylist.naechstes(ait));
				return(false);
};
bool _solitairefantasy::checklimitation(){
                _activity*ait;
                if(activitylist.anfang(ait)){
				 if(ait->dayindex>=(3195+62)) return(true);
				}while(activitylist.naechstes(ait));
				return(false);
};


//********************************************************************************************************************************************************************************
//										M A I N F U N C T I O N 
//********************************************************************************************************************************************************************************

int PASCAL WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,LPSTR lpszCmdLine, int nCmdShow){
                int ret = 0;
                L=new _logbuch("_solitairelogbuch.txt");
                L->aktiv(true);				
                
                _guikonfiguration config;
                //config.icon=IDI_TITANIC;
                guiinitialisieren(&config);  
                
                
				_solitairefantasy*solitaire=new _solitairefantasy();
			/*	if((solitaire->desktopwidth<800)||(solitaire->desktopheight<600)){
				 solitaire->messagedesktopsizetoosmall();
				 deletesecure(solitaire);
				}else if(solitaire->checkdate()){
				 solitaire->messagetrialdeactivated();
				 deletesecure(solitaire);
				}else if(solitaire->checklimitation()){
				 solitaire->messagetrialexhausted();
				 deletesecure(solitaire);
				}else{*/
				 solitaire->initfinish();
				 solitaire->mainloop();
				 //solitaire->fadeout();
				 deletesecure(solitaire);
				//};
				
				guideinitialisieren();
                deletesecure(L);
                return(ret);
};