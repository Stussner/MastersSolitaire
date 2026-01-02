//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitaire.cpp
//  Datum       : 15.11.2008
//******************************************************************************************************************************************************************************************************
#include <_solitaire.hpp>

//******************************************************************************************************************
//										W A T C H D O G S P E E D E N T R Y
//******************************************************************************************************************
_watchdogspeedentry::_watchdogspeedentry(_watchdogspeed*w,_tg v):_basis::_listenknoten<_watchdogspeedentry>(w){
				value=v;
				watchdogspeed=w;
};


//******************************************************************************************************************
//										W A T C H D O G S P E E D
//******************************************************************************************************************
_watchdogspeed::_watchdogspeed(){
				clock=new _win::_zeit();
	            firstanimation=true;
	            firstanimationtime=0;
	            hintgiven=false;
	            hintvalue=40;
	            fpscurrent=-1;
	            fpscurrenttimeold=0;
                fpscurrentcount=0;
	            fpscurrentintervall=500;	
	            fpsresultaverage=-1;
	            fpsresultvariance=-1;
	            fpsresultmaximum=-1;        
};
_watchdogspeed::~_watchdogspeed(){
                deletesecure(clock);
};				
void _watchdogspeed::reset(){
				firstanimation=true;
				firstanimationtime=0;
				fpscurrent=-1;
				fpscurrenttimeold=0;
				fpscurrentcount=0;
				fpsresultaverage=-1;
};
unsigned int _watchdogspeed::animate(){
	 			if(hintgiven==false){
				 _tg ms=clock->system();
				 if(firstanimation){
				  reset();
				  firstanimationtime=ms;
				  fpscurrenttimeold=ms;
				  firstanimation=false;
				  fpscurrentcount=0;
				  return(0);
			 	 }else{
				  if(ms-firstanimationtime>1000){
				   if(ms-firstanimationtime<21000){//record the fps values for(20s
				    fpscurrentcount+=1;
				    _tg dt=ms-fpscurrenttimeold;
				    if(dt>fpscurrentintervall){
				     fpscurrenttimeold=ms;
				     fpscurrent=_tg(fpscurrentcount)/(dt*0.001);
				     fpscurrentcount=0;
				     _watchdogspeedentry*w=new _watchdogspeedentry(this,fpscurrent);
				    };
				   }else{//end recording, validate the measurement
				    if(fpsresultaverage==-1){
				     calculatestatistics();
					 if(fpsresultvariance<0.25){//valid measurment, lower than 25% normalized stadnard variance 
					  if(fpsresultaverage<=hintvalue){
					   //Print "Watchdog Speed : giving hint with normalized standard variance = "+fpsresultvariance
				       return(1);
				      }else{//the average is high enough, let the dog sleep for(a while (1h)
				       //Print "Watchdog Speed : going sleep with normalized standard variance = "+fpsresultvariance
				       return(0);
				      };
				     }else{// invalid measurement -> reset abnd try again
				      //Print "Watchdog Speed : invalid measurement with normalized standard variance = "+fpsresultvariance
				      _watchdogspeedentry*wit;
				      if(anfang(wit))do{
				       //Print Int(wit.value)
				      }while(naechstes(wit));				
				      reset();
				      fpscurrenttimeold=ms;
					  return(0);
				     };
				    }else{
				   	 if((ms-firstanimationtime)<(1000*60*60)){
				      //it sleeps
				 	 }else{
				  	  //wake up
				      reset();
				      fpscurrenttimeold=ms;
					 };
				    };
				   };
				  }else{ 
				   fpscurrentcount=0;
				   fpscurrenttimeold=ms;
				  };
				  return(0);
				 };
				};
				return(0);
};
void _watchdogspeed::calculatestatistics(){
				fpsresultaverage=0;
				fpsresultvariance=0;
				fpsresultmaximum=0;
				_tg c=anzahl();
				if(c>0){
				 _watchdogspeedentry*wit;
				 if(anfang(wit))do{
				  fpsresultaverage+=wit->value;
				  if(fpsresultmaximum<wit->value) fpsresultmaximum=wit->value;
				 }while(naechstes(wit));
				 fpsresultaverage/=c;
				 if(anfang(wit))do{
				  _tg df=wit->value-fpsresultaverage;
				  df*=df;
				  fpsresultvariance+=df;
				 }while(naechstes(wit));
				 fpsresultvariance=sqrt(fpsresultvariance)/fpsresultaverage;
				};
};
void _watchdogspeed::save(_datei*d){
				d->speichern(firstanimation);
				d->speichern(clock->system()-firstanimationtime);
				d->speichern(hintgiven);
				d->speichern(hintvalue);
				d->speichern(fpscurrent);
				d->speichern(clock->system()-fpscurrenttimeold);
				d->speichern(fpscurrentcount);
				d->speichern(fpscurrentintervall);
				d->speichern(fpsresultaverage);
				d->speichern(fpsresultvariance);
				d->speichern(fpsresultmaximum);
};				
void _watchdogspeed::load(_datei*d){	
				_basis::_liste<_watchdogspeedentry>::loeschen();
				_tg f;
				d->laden(firstanimation);
				d->laden(f);
				firstanimationtime=clock->system()-f;
				d->laden(hintgiven);
				d->laden(hintvalue);	
				d->laden(fpscurrent);
				d->laden(f);
				fpscurrenttimeold=clock->system()-f;
				d->laden(fpscurrentcount);
				d->laden(fpscurrentintervall);
				d->laden(fpsresultaverage);
				d->laden(fpsresultvariance);
				d->laden(fpsresultmaximum);
};

//******************************************************************************************************************
//										S O R T E N T R Y 
//******************************************************************************************************************
_sortentry::_sortentry(const _zeichenkette<_tt>&n,_tg c){
                name=n;
				color=new _vektor4<_to>(1,0.8,0.5,1);
				selectable=true;
				criterium=c;
};
void compare(_sortentry*e){
                if(e==0) return;
 			    if(criterium>e.criterium) return(true);
				return(false);
};	

//***************************************************************************************************************
//										P R E V I E W W I N D O W 
//******************************************************************************************************************
_previewwindow::_previewwindow(_solitaire*s,_igg*pg,_tg px,_tg py,_tg pw,_tg ph,_to pr,_to pgr,_to pb):_igg(pg,px,py,-1,pw,ph,1){
				color.setzen(pr,pgr,pb,color.w);
				colortransformed=color;
				solitaire=s;
};
_previewwindow::~_previewwindow(){
};
void _previewwindow::draw(_grafik*gra,_kamera<_tg>*cam){
				if(visible){
				// SetViewport(0,0,iggsystem().width(),iggsystem().height())
				 solitaire->updateopacitygamepreview(pfadeopacity*pfadeopacity*pfadeopacity*pfadeopacity*pfadeopacity);
				 solitaire->drawgamepreview(position.x(),position.y());
				 gra->orthonormal();
				};
};
void _previewwindow::animate(_maus<_tg>*mau,_tastatur*tas){
				animatechild(mau,tas);
				animatehelp();
};
void _previewwindow::setstate(){
};	
//******************************************************************************************************************
//										A C T I V I T Y
//******************************************************************************************************************
_activity::_activity(){
				date=CurrentDate();
				//Print "The current date is "+date
				dayindex=getdayindex();
				time=CurrentTime();
				minuteindex=getminuteindex();
				
};
unsigned int _activity::getdayindex(){//tagesindex seit 2000
				_zeichenkette<cha> h,o;
				/*
				Local l:TList=CreateList()
				Local sep$[]=new String[1]
				sep[0]=" "
				Local ar$[]=date.split(sep[0])
				Local i
				
				Local d=ar[0].toint()
				Local m=0
				Local mo$=ar[1]
				if(mo=="Jan" m=1
				if(mo=="Feb" m=2
				if(mo=="Mar" m=3
				if(mo=="Apr" m=4
				if(mo=="May" m=5
				if(mo=="Jun" m=6
				if(mo=="Jul" m=7
				if(mo=="Aug" m=8
				if(mo=="Sep" m=9
				if(mo=="Oct" m=10
				if(mo=="Nov" m=11
				if(mo=="Dec" m=12
				Local y=ar[2].toint()
				
				*/
				if(y<2000) return(-1);
				unsigned int di=0
				for(unsigned int yit=2000;yit<y;yit++){
				 if(istschaltjahr(yit)) di+=366; else di+=365;
				};
				if(m>1){
				 for(unsigned int mit=1;mit<m;mit++){
				  di+=getdaycountofmonth(mit,y);
				 };
				};
				di+=d-1;
				return(di);
};
unsigned int _activity::getdaycountofmonth(unsigned int m,unsigned int y){
	 			if(m==2){
	  			 if(istschaltjahr(y)) return(29) else return(28);
				}else{
				 if(m==1) return(31); 
				 if(m==3) return(31);
				 if(m==4) return(30);
				 if(m==5) return(31);
				 if(m==6) return(30);
				 if(m==7) return(31);
				 if(m==8) return(31);
				 if(m==9) return(30);
				 if(m==10) return(31);
				 if(m==11) return(30);
				 if(m==12) return(31);
				};
				return(0);
};
unsigned int _activity::getminuteindex(){
				return(0);
};
bool _activity::istschaltjahr(unsigned int year){
				if((year%4)>0) return(false);
				if((year%100)==0){
				 if((year%400)==0) return(true); else return(false);
				}else{
				 return(true);
				};
};				
void _activity::load(_datei*d){
				d->laden(date);
				d->laden(ddayindex);
				d->laden(dtime);
				d->laden(dminuteindex);
};
void _activity::save(_datei*d){
				d->speichern(date);
				d->speichern(dayindex);
				d->speichern(time);
				d->speichern(minuteindex);
};
//******************************************************************************************************************
//										S T A T U S B A R E N T R Y
//******************************************************************************************************************
_statusbarentry::_statusbarentry(_solitaire*s,_zeichenkette<char>&t,_tg o,_tg dt):_basis::_listenknoten<_statusbarentry>(&s->statusbarlist){
				solitaire=s;
				text=t;
				opacity=o;
				duration=true;
				durationtime=dt;
				pfadein=true;
				pfadeout=false;
				pfadeopacitytime=solitaire->clock->system();
				pfadeopacity=0;
            	time=0:
};
_statusbarentry::~_statusbarentry(){
};
void _statusbarentry::fadeout(){
				if(pfadeout==false){
				 pfadein=false;
				 pfadeout=true;
				 pfadeopacitytime=solitaire->clock->system();
				};
};						
void _statusbarentry::fadein(){
				if(pfadein==false){
				 pfadein=true;
				 pfadeout=false;
				 pfadeopacitytime=solitaire->clock->system();
				};
};						
void _statusbarentry::draw(_grafik*gra,_kamera<_tg>*cam){
				_tg speed=1;
				_vektor4<_to> c;
				_vektor3<_tg> o;
				_zeichenkette<char> h;
				gra->orthonormal();
				_tg wm=solitaire->font18->breite(text);
				_tg bw=wm+10+10;
				o.setzen(70+gra->groessex()/2-wm/2-10,10,0);
				if((solitaire->buttonpanel==false)&&(solitaire->menubuttons==false)) o.x(o.x()-340);
				if(o.x()<10) o.x(10);
				c.setzen(0.6,0.4,0.12,pfadeopacity):
				//drawguiboxinvers(o,bw,27,c)
				//SetAlpha(c.w);
				//SetColor(255,255,255);
				//SetBlend(SOLIDBLEND|ALPHABLEND);
				gra->transparenzmultiplikativ();
				_tg breite=bw+40;
				_bild<_tb>*bild;
				if(breite<300){
				 bild=solitaire->iguihelp24389;
				}else if((breite>=300)&&(breite<600)){
				 bild=solitaire->iguihelp51280;
				}else{
				 bild=solitaire->iguihelp85093;
				};
				gra->rechteck(bild,o.x()-20,o.y(),breite,60);
				h=text;
				o.setzen(70+gra->groessex()/2-wm/2,15+12,1);
				if((solitaire->buttonpanel==false)&&(solitaire->menubuttons==false)) o.x(o.x()-340);
				if(o.x()<10) o.x(10);
				c.setzen(1,0.9,0.6,pfadeopacity);
				drawguitext(gra,h,solitaire->font18,o,c);
				if((pfadein==false)&&(pfadeout==false)){
				 _tg nt=solitaire->clock->system();
				 _tg dt=nt-time;
				 if(duration){
				  if(dt>durationtime){
				   duration=false;
				   time=nt;
				  };
				 }else{
				  if(pfadeout==false) fadeout();
				 };				
				};
				_tg fadetimenew=solitaire->clock->system();
				_tg ds=(fadetimenew-pfadeopacitytime)*0.001;
				pfadeopacitytime=fadetimenew;
				if(pfadein){
				 pfadeopacity+=speed*5*ds;
				 if(pfadeopacity>opacity){
				  pfadeopacity=opacity;
				  pfadein=false;
  				  time=solitaire->clock->system();
				 };
				};
				if(pfadeout){
				 pfadeopacity-=speed*ds;
				 if(pfadeopacity<0){
				  pfadeopacity=0;
				  //pfadeout=false
				 };
				};					
};	
//******************************************************************************************************************
//										P I L E I N F O E N T R Y
//******************************************************************************************************************
_pileinfoentry::_pileinfoentry(_solitaire*s,const _zeichenkette<char>&n,const _zeichenkette<char>&d0,const _zeichenkette<char>&d1,_to o=1,_tg dt=100):_basis::_listenknoten<_pileinfoentry>(&s->pileinfolist){
				solitaire=s;
				name=n;
				desc0=d0;
				desc1=d1;
				opacity=o;
				duration=true;
				durationtime=dt;
				pfadein=true;
				pfadeout=false;
				pfadeopacitytime=solitaire->clock->system();
				pfadeopacity=0;
				time=0;
};
_pileinfoentry::~_pileinfoentry(){
};		
void _pileinfoentry::fadeout(){
				if(pfadeout==false){
				 pfadein=false;
				 pfadeout=true;
				 pfadeopacitytime=solitaire->clock->system();
				};
};						
void _pileinfoentry::fadein(){
				if(pfadein==false){
				 pfadein=true;
				 pfadeout=false;
				 pfadeopacitytime=solitaire->clock->system();
				};
};						
void _pileinfoentry::draw(_grafik*gra,_kamera<_tg>*cam){
				_tg speed=2.5;
				_vektor4<_to> c;
				_vektor3<_tg> o
				_zeichenkette<char> h;
				gra->orthonormal();
				// SetImageFont(solitaire->font16);
				_tg wd0=solitaire->font16->breite(desc0);
				_tg wd1=solitaire->font16->breite(desc1);
				_tg wm=wd0;
				_tg hm=25;
				if(desc1!=L"") hm=37+8;
				if(wd1>wd0) wm=wd1;
				//SetImageFont(solitaire->font18);
				_tg wpi=solitaire->font18->breite(name);
				_tg bw=wm+10+10+wpi;
				o.setzen(gra->groessex()-200-10-wm,gra->groessey()-hm-30,0);
				if((desc0==L"")&&(desc1==L"")){
				 o.x(o.x()=10);
				 bw-=10;
				};
				c.setzen(0.6,0.4,0.12,0.2*pfadeopacity)
				//SetAlpha(pfadeopacity);
				//SetBlend(SOLIDBLEND|ALPHABLEND);
                //SetColor(255,255,255);
				_tg breite=bw+40;
				_bild<_tb>*bild;
				if(desc1!=L""){
				 bild=solitaire->iguihelp839124;
				}else if((desc0==L"")&&(desc1==L"")){
				 bild=solitaire->iguihelp24389;
				}else{
				 bild=solitaire->iguihelp85093;
				};
				gra->rechteck(bild,o.x()-20,o.y(),breite,hm-5+30,c);
			    h=name;
				o.setzen(gra->groessex()-195,gra->groessey()-25-17,1);
				c.setzen(1,0.85,0.6,pfadeopacity);
				drawguitext(gra,h,solitaire->font18,o,c);
				//SetImageFont(solitaire->font16)
				h=desc0;
				if(desc1==L"") o.setzen(gra->groessex()-205-wd0,gra->groessey()-22-17,1); else o.setzen(gra->groessex()-205-wd0,gra->groessey()-(35+8)-17,1);
				c.setzen(1,0.8,0.5,pfadeopacity);
				drawguitext(gra,h,solitaire->font16,o,c);
				if(desc1!=L""){
				 h=desc1;
				 o.setzen(gra->groessex()-205-wd1,gra->groessey()-24-17,1);
				 c.setzen(1,0.8,0.5,pfadeopacity);
				 drawguitext(gra,h,solitaire->font16,o,c);
				};		
				if((pfadein==false)&&(pfadeout==false)){
				 _tg nt=solitaire->clock->system();
				 _tg dt=nt-time;
				 if(duration){
				  if(dt>durationtime){
				   duration=false;
				   time=nt;
				  };
				 }else{
				  if(pfadeout==false) fadeout();
				 };				
				};
				_tg fadetimenew=solitaire->clock->system();
				_tg ds=(fadetimenew-pfadeopacitytime)*0.001;
				pfadeopacitytime=fadetimenew;
				if(pfadein){
				 pfadeopacity+=speed*2*ds;
				 if(pfadeopacity>opacity){
				  pfadeopacity=opacity;
				  pfadein=false;
  				  time=solitaire->clock->system();
				 };
				};
				if(pfadeout){
				 pfadeopacity-=speed*ds;
				 if(pfadeopacity<0){
				  pfadeopacity=0;
				 };
				};					
};	

//******************************************************************************************************************
//										S O L I T A I R E
//******************************************************************************************************************
_solitaire::_solitaire(){
                currentgame=0;
                currentscene=1;
                currentmusic=2;
                currentmusicuser=false;
                cardslope=0;
                cardslopepick=0.6;
                cardthickness=0.0269;
                cardtableaulift=0.05;
                naturalpiles=0.3;
                cardwidth=3;
                cardheight=4.5;
                carddistance=0.2;
                cardshiftfront=1.2;
                cardshiftback=0.4;
                sparkingmouse=false;
                timeduringgame=true;
                buttonpanel=true;
                gameplaybuttons=true
                menubuttons=true;
                menugameopacity=1;
                mouseovercard=true;
                mouseoverpile=true;
                greenboard=false;
                musicsequence=true;
                fullscreen=true;
                chimesound=true;
                systemperformance=0.5;
                systemaccellerate=false;
                fastvideomode=false;
                videosynchronisation=false;
                mybenchmark=false;
                cardanimation=true;
                cardlighting=0.32;
                gametypesortmethod=0;
                lastuser="";
                showedoptionscard=false;
                showedmenugametype=false;
                usedskipanimation=3;
                pointandclick=false;
                pointandclickalternative=false;
                confirmonquit=true;
                difficulty=1;
                autostart=false;
                autoturncard=true;
                autodiscard=false;
                autofoundation=false;
                autoempty=false;
                clickplayright=true;
                clickplaydouble=true;
                autospeed=30;
                tippspeed=20;
                cardtexturebackuser=false; 
                cardtexturebackindex=0;
                cardtexturefrontindex=0;
                cardtexturebackcount=9;
                cardtexturefrontcount=4;
                musiccount=5;
                scenecount=5;
                game=0;
                gamepreview=0;
                gamemenu=0;
                gamestats=0;
                gameopacity=0;
                gameopacitytime=0;
                pgamefadein=false;
                pgamefadeout=false;
                graphicswidthoriginal=1024;
                current_preview=0;
                demoplay=false;
                demoplaylasttime=0;
                blendscreenopacity=0;
                starttimepause=0;
                paused=false;
                pauseopacity=0;
                gamedelaytime=0;
                blackscreenopacity=0;
                blackscreentransparency=1;
                showfps=false;
                showfpsstatus=0;
                menuopacity=1;
                menuopacity2=0.7;
                messageboxadditiontextwidth=150;
                messageboxadditiontexty=55;
                messageboxadditionbuttony=-20;
                messageboxbuttonwidth=120;
                messageboxbuttonheight=40;
                messageboxtextz=1;
                optionscalledfromgame=false;
                fpstext=L"";
                fpstimeold=0;
                fpscount=0;
				farbekerze.setzen(1,0.96,0.77);
				farbeambienz.setzen(0.32,0.42,0.58);
				desktopwidth=1024;//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! getcurrentvideomode
				desktopheight=768;
                //--------------------------------------------------------------------------------------------------------------------------------------------------
                menuusercreatefrom=0;
				menuman=new _iggmenumanagement();
				messageboxtextcolor.setzen(1,0.9,0.5,1);
			    
				campreview=new _camerasolitaire();
				campreview->setzen(0,0,-33);
				campreview->vektor(0,0,2);
				campreview->ebene(1,0,0.8,0);
				campreview->ebene(0,1,0,0);
				campreview->aktualisieren();
				
				cammenu=new _camerasolitaire();
				cammenu->setzen(0,0,-33);
				cammenu->vektor(0,0,2);
				cammenu->ebene(1,0,0.8,0);
				cammenu->ebene(0,1,0,0);
				cammenu->aktualisieren();
				
				gamepreviewrectangle[0].setzen(-7.25,-5);
				gamepreviewrectangle[1].setzen(+7.25,+5);
				gamemenurectangle[0].setzen(-9.5,-12);
				gamemenurectangle[1].setzen(15,9);
				
				watchdogspeed=new _watchdogspeed();
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
				//graphicswidthoriginal=GraphicsWidth()
				getvideomodes();

				gameobjective[0]=strobjectivetofoundation;
				gameobjective[1]=strobjectivetofoundation;
				gameobjective[2]=strobjectivetodiscardsamesuit;
				gameobjective[3]=strobjectivetodiscardsamesuit;
				gameobjective[4]=strobjectivetodiscardsamesuit;
				gameobjective[5]=strobjectivetofoundation;
				gameobjective[6]=strobjectivetofoundation;
				gameobjective[7]=strobjectivetofoundation;
				gameobjective[8]=strobjectivetofoundation;
				gameobjective[9]=strobjectivetodiscardsamesuit;
				gameobjective[10]=strobjectivetofoundation;
				gameobjective[11]=strobjectiveblanket;
				gameobjective[12]=strobjectivetofoundation;
				gameobjective[13]=strobjectivetofoundation;
				gameobjective[14]=strobjectivepyramid;
				gameobjective[15]=strobjectivegolf;
				gameobjective[16]=strobjectivetofoundation;
				gameobjective[17]=strobjectivetofoundation;
				gameobjective[18]=strobjectivetodiscardsamesuit;
				gameobjective[19]=strobjectivetofoundation;
				gameobjective[20]=strobjectivetofoundation;
				gameobjective[21]=strobjectivetofoundation;
				gameobjective[22]=strobjectivetofoundation;
				gameobjective[23]=strobjectivetofoundation;
				gameobjective[24]=strobjectivetofoundation;
				gameobjective[25]=strobjectivelabyrinth;
				gameobjective[26]=strobjectivelabyrintheasy;
				gameobjective[27]=strobjectivelabyrinthrodenbach;
				gameobjective[28]=strobjectivelabyrinth;
				gameobjective[29]=strobjectiveosmosis;
				gameobjective[30]=strobjectivegolfeasy;
				gameobjective[31]=strobjectivekingspeak;
				gameobjective[32]=strobjectivetofoundation;
				gameobjective[33]=strobjectivetofoundation;
				gameobjective[34]=strobjectivetofoundation;
				gameobjective[35]=strobjectivetofoundation;
				gameobjective[36]=strobjectivetofoundation;
				gameobjective[37]=strobjectiveacesup;
				gameobjective[38]=strobjectivetofoundation;
				gameobjective[39]=strobjectiveacesup;
				gameobjective[40]=strobjectivetodiscard;
				gameobjective[41]=strobjectivetofoundation;
				gameobjective[42]=strobjectivetofoundation;
				gameobjective[43]=strobjectivetofoundation;
				gameobjective[44]=strobjectivetofoundation;
				gameobjective[45]=strobjectivetofoundation;
				gameobjective[46]=strobjectivetofoundation;
				gameobjective[47]=strobjectivetofoundation;
				gameobjective[48]=strobjectivetofoundation;
				gameobjective[49]=strobjectivetofoundation;
				gameobjective[50]=strobjectivetofoundation;
				gameobjective[51]=strobjectivetofoundation;
				gameobjective[52]=strobjectivetofoundation;
				gameobjective[53]=strobjectivetofoundation;
				gameobjective[54]=strobjectivetofoundationmirrored;
				gameobjective[55]=strobjectivetodiscardsamesuit;
				gameobjective[56]=strobjectivetofoundation;
				gameobjective[57]=strobjectivetodiscardsamesuit;
				gameobjective[58]=strobjectivemaze;
				gameobjective[59]=strobjectivetofoundation;
				gameobjective[60]=strobjectivetofoundation;
				gameobjective[61]=strobjectivetofoundation;
				gameobjective[62]=strobjectivepyramid;
				gameobjective[63]=strobjectivetofoundation;
				gameobjective[64]=strobjectivetofoundation;
				gameobjective[65]=strobjectivemaze;
				gameobjective[66]=strobjectivemaze;
				gameobjective[67]=strobjectivemaze;
				gameobjective[68]=strobjectiveblanket;
				gameobjective[69]=strobjectivepairscross;
				gameobjective[70]=strobjectivetofoundation;
				gameobjective[71]=strobjectivetofoundation;
				gameobjective[72]=strobjectivetofoundation;
				gameobjective[73]=strobjectivepyramid;
				gameobjective[74]=strobjectivetodiscardsamesuit;
				gameobjective[75]=strobjectivetofoundation;
				gameobjective[76]=strobjectivetofoundation;
				gameobjective[77]=strobjectivetofoundation;
};
_solitaire::~_solitaire(){
};
void _solitaire::bearbeitenloeschmarkierung(){
                particlelistbackground.loeschenmarkiert();
                particlegamelist.loeschenmarkiert();
                particlemenulist.loeschenmarkiert();
                particlesourcemenulist.loeschenmarkiert();
                particlesourcegamelist.loeschenmarkiert();
};

void _solitaire::getmousevector(_grafik*gra,_kamera<_tg>*cam){
				_vektor3<_tg> xax;
				_vektor3<_tg> yax;
				xax=cam->ebene(0);//side
				yax=cam->ebene(1);//up
				mouse.setzen(maus->x(),maus->y());
				mousebutton[0]=tastatur->knopflinks();
				mousebutton[1]=tastatur->knopfrechts();
				_tg mx=mouse.x();
				_tg my=mouse.y();
				_tg ix=mx;
				_tg iy=my;
				ix-=gra->groessex()/2;
				iy-=gra->groessey()/2;
				ix/=gra->groessex()/2;
				iy/=gra->groessey()/2;
				iy*=-1;
				xax*=ix;
				yax*=iy;
				mousevector=cam->vektor();//.view
				mousevector+=xax;
				mousevector+=yax;
};			
unsigned int _solitaire::countstatsstoreables(){
				unsigned int c=0;
				_speicherbarbinar*sit;
				if(anfang(sit))do{
				 _gamestats*gst=dynamic_cast<_gamestats*>(sit);
				 _gamestatsentry*gse=dynamic_cast<_gamestatsentry*>(sit);
				 if((gst)||(gse)) c++;
				}while(naechstes(sit));
				return(c);
};
unsigned int _solitaire::countanimationstoreables(){
				unsigned int c=0;
				_speicherbarbinar*sit;
				if(anfang(sit))do{
				 _animation*a=dynamic_cast<_animation*>(sit);
				 _animationundoentry*e=dynamic_cast<_animationundoentry*>(sit);
				 if((a)||(e)){
				  c++;
				 };
				}while(naechstes(sit));
				return(c);
};
unsigned int _solitaire::countcardstoreables(){
				unsigned int c=0;
				_speicherbarbinar*sit;
				if(anfang(sit))do{
				 _card*a=dynamic_cast<_card*>(sit);
				 if(a) c++;
				}while(naechstes(sit));
				return(c);
};
unsigned int _solitaire::countpilestoreables(){
				unsigned int c=0;
				_speicherbarbinar*sit;
				if(anfang(sit))do{
				 _pile*a=dynamic_cast<_pile*>(sit);
				 if(a) c++;
				}while(naechstes(sit));
				return(c);
};
unsigned int _solitaire::countgamestoreables(){
				unsigned int c=0;
				_speicherbarbinar*sit;
				if(anfang(sit))do{
				 _game*a=dynamic_cast<_game*>(sit);
				 if(a) c++;
				}while(naechstes(sit));
				return(c);
};

void _solitaire::grafikmodus(unsigned int index=5){
				unsigned int frq=60;//Hz
				unsigned int tx[]={1600,1920,1600,1680,1280,1024,1024};
				unsigned int ty[]={1200,1200,1200,1050,1024,768 ,768 };
				unsigned int tc[]={32  ,32  ,32  ,32  ,32  ,32  ,16  };
				/*
				for(Local tit:_texture=EachIn texturelist
				 tit.reinit();
				};
				*/
				if(fullscreen){
				 unsigned int wx,wy,de,ra;
				 _grafikmodus*mode;
				 if(fastvideomode){
				  mode=getvideomode(fastvideomodewidth,fastvideomodeheight);
				 }else{
				  mode=getvideomode(desktopwidth,desktopheight);
				 };
				 if(mode){
				  wx=mode->breite();
				  wy=mode->hoehe();
				  de=mode->tiefe();
				  ra=mode->rate();
				 }else{
				  wx=windowedmodewidth;
				  wy=windowedmodeheight;
				  de=16;
				  ra=60;
				 };
				 if(gra==0){
				  gra=new _grafikdirectx(handle(),false,wx,wy,de,ra);
				  //gra.init(wx,wy,de,ra)
				 }else{
				  gra->setzen(wx,wy,de,ra);
				 };				
				}else{
				 if(gra==0){
				  gra=new _grafikdirectx(handle(),false,windowedmodewidth,windowedmodeheight,0,0);
				 }else{
				  gra->setzen(windowedmodewidth,windowedmodeheight,0,0);
				 };
				};
				//Print "Grafikmodus ist : "+gra->groessex()+"*"+gra->groessey()+", "+gra.screen_bpp+"bit, "+gra.screen_freq+"Hz"
				iggsystem->size.setzen(gra->groessex(),gra->groessey(),1);
				iggsystem->animate(0);
				//hWnd=GetActiveWindow() // Save current Window handle
				// Init Buttons
				//enableMinimize(hwnd%)
				//enableMaximize(hwnd%)
				if(cardsetmanager) cardsetmanager->createhardwaresourcesurfaces(gra);
				//SetClsColor (0,0,0)
};	
void _solitaire::updatetextureload(const _zeichenkette<char>&shortcut,const _zeichenkette<char>&path,bool loadscreen){
                /*
				for(unsigned int n=0;n<52;n++){
				 deletesecure(tcard[n]);
				 tcard[n]=new _texture
				 Local s=(n Mod 4)+1
				 Local suit
				 if(s=1 suit=4
				 if(s=2 suit=1
				 if(s=3 suit=2
				 if(s=4 suit=3
				 Local number=(n/4)+1
				 Local h$=number;if(h.length=1 h="0"+h
				
				 Local fn$="cards\card_"+shortcut+"_00"+(cardtexturefrontindex+1)+"0_"+suit+"_"+h+".tga"
				 if(fileexists(fn) 
				  tcard[n].init(fn)
				 }else{
  				  tcard[n].init("Incbin::"+path+"\card_"+shortcut+"_00"+(cardtexturefrontindex+1)+"0_"+suit+"_"+h+".tga")
  				 };
  				 if(loadscreen drawloadscreen()
				};		
				*/ 
};					
void _solitaire::loadstatistics(const _zeichenkette<char>&filename){
				_datei d(filename);
				
				if(d.oeffnennurlesen()==false){
				 generatestatistics();
				 savestatistics(filename);
				}else{
				
				 unsigned int typecount
			     _zeichenkette<char> typ;
				 d.laden(typecount);
				 for(unsigned int i=0;i<typecount;i++){
				  d.laden(typ);
				  if(typ=="_gamestats"){
				   gamestats[i]=new _gamestats(this,i);
				   gamestats[i]->load(&d);
				  };
				 };
				 d.schliessen();
				};
};	
void _solitaire::savestatistics(const _zeichenkette<char>&filename){
				unsigned int si=0;
				unsigned int ei=0;
				char buf[024];
				for(unsigned int i=0;i<gametypecount;i++){
				 itoa(si,buf,10);
				 gamestats[i]->savename="stat"+buf;
				 si++;
				 _gamestatsentry*eit;
				 if(gamestats[i]->entrylist.anfang(eit))do{
				  itoa(ei,buf,10);
				  eit->savename="statsentry"+buf;
				  ei++;
				 }while(gamestats[i]->entrylist.naechstes(eit));
				 if(gamestats[i]->heighscorelist.anfang(eit))do{
				  itoa(ei,buf,10);
				  eit->savename="statsentry"+buf;
				  ei++;
				 }while(gamestats[i]->highscorelist.naechstes(eit));
				};
				_datei d(filename);
				if(d.oeffnen()){
				 d.speichern(gametypecount);
				 for(unsigned int i=0;i<gametypecount;i++){
				  gamestats[i].save(&d);
				 };
				 d.schliessen();
				};
};	
void _solitaire::generatestatistics(){
				for(unsigned int i=0;i<gametypecount;i++){
				 gamestats[i]=new _gamestats(this,i);
				 for(unsigned int j=0;j<5;j++){
				  _gamestatsentry*eit=new _gamestatsentry(gamestats[i]);
				  if(zufall<unsigned int>(0,1)=0){
				   eit->discards=_zufall<unsigned int>(gametypediscards[i]/3,gametypediscards[i]);
				  }else{ 
				   eit->discards=gametypediscards[i];
				  }; 
				  eit->time=gametypetime[i]*60*1000+zufall<_tg>(60*500,60*2500);//20*1000+(15*60*1000)*gametypetime[i]+ Rnd(0,5*1000*60)
				  eit->moves=_zufall<unsigned int>(eit->discards*2,eit->discards*5);
				  eit->user=strdummynames[_zufall<unsigned int>(0,9)];
				  eit->undos=0;
				  eit->tipps=0;
				 };
				 _gamestatsentry*eit;
				 if(gamestats[i]->entrylist.anfang(eit))do{
				  _gamestatsentry*ehi=new _gamestatsentry(gamestats[i],true);
				  ehi->copy(eit);
				 }while(gamestats[i]->entrylist.naechstes(eit));
				 gamestats[i]->highscorelist.sortieren();
				 gamestats[i]->entrylist.loeschen();
				};
};	
_gamestatsentry*_solitaire::createstatisticsentry(){
				_gamestatsentry*e=new _gamestatsentry(gamestats[currentgame]);
				return(e);
};
void _solitaire::takestatistics(bool showhighscore){
};
void _solitaire::adjustcamera(){
};
void _solitaire::loadoptions(const _zeichenkette<char>&filename){
				activitylist.loeschen();
				_datei d(filename);
				if(d.oeffnennulesen()==false){ 
				 saveoptions(filename);
				}else{
				 d.laden(currentgame);
				 d.laden(currentscene);
				 d.laden(currentmusic);
				 d.laden(currentmusicuser);
				 d.laden(cardtexturebackindex);
				 d.laden(cardtexturefrontindex);
				 d.laden(cardtexturebackuser);
				 d.laden(cardslope);
				 d.laden(cardslopepick);
				 d.laden(cardthickness);
				 d.laden(cardtableaulift);
				 d.laden(naturalpiles);
				 d.laden(carddistance);
				 d.laden(cardshiftfront);
				 d.laden(cardshiftback);
				 d.laden(sparkingmouse);
				 d.laden(timeduringgame);
				 d.laden(buttonpanel);
				 d.laden(gameplaybuttons);
				 d.laden(menubuttons);
				 d.laden(menugameopacity);
				 d.laden(mouseovercard);
				 d.laden(mouseoverpile);
				 d.laden(greenboard);
				 d.laden(fullscreen);
				 d.laden(systemaccellerate);
				 d.laden(fastvideomode);
				 d.laden(videosynchronisation);
				 d.laden(cardanimation);
				 d.laden(pointandclick);
				 d.laden(pointandclickalternative);
				 d.laden(autostart);
				 d.laden(autoturncard);
				 d.laden(autodiscard);
				 d.laden(autofoundation);
				 d.laden(autoempty);
				 d.laden(clickplayright);
				 d.laden(clickplaydouble);
				 d.laden(confirmonquit);
				 d.laden(difficulty);
				 d.laden(autospeed);
				 d.laden(tippspeed); 
				 d.laden(volumeambience);
				 d.laden(volumesound);
				 _tg l;
				 d.laden(l);
				 musicman->lautstaerke(l);
				 d.laden(musicsequence);
				 d.laden(systemperformance);
				 d.laden(lastuser);
				 d.laden(showedoptionscard);
				 d.laden(showedmenugametype);
				 d.laden(usedskipanimation);
				 unsigned int ca;
				 unsigned int i;
				 d.laden(ca);
				 for(i=0;i<ca;i++){
				  _activity*a=new _activity();
				  activitylist.einhaengen(a);
				  a->load(&d);
				 };
				
				 d.laden(cardlighting);
				 farbekerze.laden(&d)
				 farbeambienz.laden(&d)
				 if(watchdogspeed) watchdogspeed.load(s);
				 d.schliessen();
				};
};
void _solitaire::saveoptions(const _zeichenkette<char>&filename){
				_datei d(filename);
				if(d.oeffnen()){
				 d.speichern(currentgame);
				 d.speichern(currentscene);
				 d.speichern(currentmusic);
				 d.speichern(currentmusicuser);
				 d.speichern(cardtexturebackindex);
				 d.speichern(cardtexturefrontindex);
				 d.speichern(cardtexturebackuser);
				 d.speichern(cardslope);
				 d.speichern(cardslopepick);
				 d.speichern(cardthickness);
				 d.speichern(cardtableaulift);
				 d.speichern(naturalpiles);
				 d.speichern(carddistance);
				 d.speichern(cardshiftfront);
				 d.speichern(cardshiftback);
				 d.speichern(sparkingmouse);
				 d.speichern(timeduringgame);
				 d.speichern(buttonpanel);
				 d.speichern(gameplaybuttons);
				 d.speichern(menubuttons);
				 d.speichern(menugameopacity);
				 d.speichern(mouseovercard);
				 d.speichern(mouseoverpile);
				 d.speichern(greenboard);
				 d.speichern(fullscreen);
				 d.speichern(systemaccellerate);
				 d.speichern(fastvideomode);
				 d.speichern(videosynchronisation);
				 d.speichern(cardanimation);
				 d.speichern(pointandclick);
				 d.speichern(pointandclickalternative);
				 d.speichern(autostart);
				 d.speichern(autoturncard);
				 d.speichern(autodiscard);
				 d.speichern(autofoundation);
				 d.speichern(autoempty);
				 d.speichern(clickplayright);
				 d.speichern(clickplaydouble);
				 d.speichern(confirmonquit);
				 d.speichern(difficulty);
				 d.speichern(autospeed);
				 d.speichern(tippspeed);
				 d.speichern(volumeambience);
				 d.speichern(volumesound);
				 d.speichern(musicman->lautstaerke());
				 d.speichern(musicsequence);
				 d.speichern(systemperformance);
				 d.speichern(lastuser);
				 d.speichern(showedoptionscard);
				 d.speichern(showedmenugametype);
				 d.speichern(usedskipanimation);
				 unsigned int ac=activitylist.anzahl();
				 d.speichern(ac);
				 _activity*ait;
				 if(activitylist.anfang(ait))do{
				  ait->save(&d);
				 }while(activitylist.naechstes(ait));
				 d.speichern(cardlighting);
				 farbekerze.speichern(&d);
				 farbeambienz.speichern(&d);
				 if(watchdogspeed) watchdogspeed->save(s);
				 d.schliessen();
				};
};	
_game*_solitaire::newgame(unsigned int cur_game){
				_game*g=0;
				if((cur_game<0)||(cur_game>=gametypecount)) cur_game=3;
				if(cur_game==0){
				 g=new _gameklondikeone();
				}else if(cur_game==1){
				 g=new _gameklondikethree();
				}else if(cur_game==2){ 
				 g=new _gamespideronesuit();
				}else if(cur_game==3 ){
				 g=new _gamespidertwosuit();
				}else if(cur_game==4){
				 g=new _gamespiderfoursuit();
				}else if(cur_game==5){
				 g=new _gameeightoff();
				}else if(cur_game==6){
				 g=new _gamefreecell();
				}else if(cur_game==7){
				 g=new _gameforecell();
				}else if(cur_game==8){
				 g=new _gameaustralian();
				}else if(cur_game==9){
				 g=new _gamebethoral();
				}else if(cur_game==10){
				 g=new _gameblindalleys();
				}else if(cur_game==11){
				 g=new _gameblanket();
				}else if(cur_game==12){
				 g=new _gamecancan();
				}else if(cur_game==13){
				 g=new _gamecruel();
				}else if(cur_game==14){
				 g=new _gamepyramid();
				}else if(cur_game==15){
				 g=new _gamegolf();
				}else if(cur_game==16){
				 g=new _gameyukon();
				}else if(cur_game==17){
				 g=new _gamefourcolor();
				}else if(cur_game==18){
				 g=new _gamescorpion();
				}else if(cur_game==19){
				 g=new _gameklondikeonetwodeck();
				}else if(cur_game==20){
				 g=new _gameklondikethreetwodeck();
				}else if(cur_game==21){
				 g=new _gamerussian();
				}else if(cur_game==22){
				 g=new _gameseatowers();
				}else if(cur_game==23){
				 g=new _gamelimitedcovered();
				}else if(cur_game==24){
				 g=new _gameladypalk();
				}else if(cur_game==25){
				 g=new _gamelabyrinth();
				}else if(cur_game==26){
				 g=new _gamelabyrintheasier();
				}else if(cur_game==27){
				 g=new _gamelabyrinthrodenbach();
				}else if(cur_game==28){
				 g=new _gamelabyrinthdouble();
				}else if(cur_game==29){
				 g=new _gameosmosis();
				}else if(cur_game==30){
				 g=new _gamegolfeasy();
				}else if(cur_game==31){
				 g=new _gamekingspeak();
				}else if(cur_game==32){
				 g=new _gamefortythieves();
				}else if(cur_game==33){
				 g=new _gamelabellelucie();
				}else if(cur_game==34){
				 g=new _gamelafacilelucie();
				}else if(cur_game==35){
				 g=new _gamerussianeasy();
				}else if(cur_game==36){
				 g=new _gamerussianfree();
				}else if(cur_game==37){
				 g=new _gameacesup();
				}else if(cur_game==38){
				 g=new _gameacme();
				}else if(cur_game==39){
				 g=new _gameacesupeasy();
				}else if(cur_game==40){
				 g=new _gameant();
				}else if(cur_game==41){
				 g=new _gameauntmary();
				}else if(cur_game==42){
				 g=new _gameauntfreemary();
				}else if(cur_game==43){
				 g=new _gamebakersdozen();
				}else if(cur_game==44){
				 g=new _gamebakersgame();
				}else if(cur_game==45){
				 g=new _gameflowergarden();
				}else if(cur_game==46){
				 g=new _gamegargantua();
				}else if(cur_game==47){
				 g=new _gamegiant();
				}else if(cur_game==48){
				 g=new _gameindian();
				}else if(cur_game==49){
				 g=new _gamemissmilligan();
				}else if(cur_game==50){
				 g=new _gameklondikecontra();
				}else if(cur_game==51){
				 g=new _gamecontraflow();
				}else if(cur_game==52){
				 g=new _gamefreecelldouble();
				}else if(cur_game==53){
				 g=new _gamesinglerail();
				}else if(cur_game=054){
				 g=new _gamesolidsquare();
				}else if(cur_game==55){
				 g=new _gamespiderette();
				}else if(cur_game==56){
				 g=new _gamestonewall();
				}else if(cur_game==57){
				 g=new _gamespiderlinge();
				}else if(cur_game==58){
				 g=new _gamemaze();
				}else if(cur_game==59){
				 g=new _gamemartha();
				}else if(cur_game==60){
				 g=new _gamelimited();
				}else if(cur_game==61){
				 g=new _gamenapoleonssquare();
				}else if(cur_game==62){
				 g=new _gamepyramiddouble();
				}else if(cur_game==63){
				 g=new _gamefreewall();
				}else if(cur_game==64){
				 g=new _gamecarrenapoleon();
				}else if(cur_game==65){
				 g=new _gamemazeeasy();
				}else if(cur_game==66){
				 g=new _gamemazetwosuit();
				}else if(cur_game==67){
				 g=new _gamemazeeasytwosuit();
				}else if(cur_game==68){
				 g=new _gameblankettwosuit();
				}else if(cur_game==69){
				 g=new _gamepairscross();
				}else if(cur_game==70){
				 g=new _gamestonewalleasy();
				}else if(cur_game==71){
				 g=new _gamefortythievesdoublestock();
				}else if(cur_game==72){
				 g=new _gamefortythievesredeal();
				}else if(cur_game==73){
				 g=new _gamepyramidreserve();
				}else if(cur_game==74){
				 g=new _gamespidersuperstock();
				}else if(cur_game==75){
				 g=new _gamesweetmatch();
				}else if(cur_game==76){
				 g=new _gameveryeasy();
				};
				return(g);
};
_tg _solitaire::gametypechancemin(unsigned int i){
				_tg c=_tg(gametypechance[i*2])/_tg(gametypechance[i*2]+gametypechance[i*2+1]);
				return(c);
};				
_zeichenkette<_tt> _solitaire::timemstohhmmss(_tg mso){
				_tg ms=mso;
				_zeichenkette<_tt> e;
				unsigned int s=ms/1000;
				unsigned int m=s/60;
				unsigned int h=m/60;
				m=m%60;
				unsigned int t;
				unsigned int vs,vm,vh;
				t=s;
			    t-=h*60*60;
				t-=m*60;
				vs=t;
				_zeichenkette<_tt> strs=vs;
				t=s;
				t-=h*60*60;
				t-=vs;
				vm=t/60;
				_zeichenkette<_tt> strm=vm;
				t=s;
				t-=vs;
				t-=vm;
				vh=t/3600;
				_zeichenkette<_tt> strh=vh;
				
				
				if(strh.groesse()==1) strh=L"0"+strh;
				if(strm.groesse()==1) strm=L"0"+strm;
				if(strs.groesse()==1) strs=L"0"+strs;
				if(strh==L"00"){
				 e=strm+L":"+strs;
				}else{
				 e=strh+L":"+strm+L":"+strs;
				};
				return(e);
};					
_liste<_zeichenkette<_tt>*_solitaire::textsplit(const _zeichenkette<_tt>&t,_tg wx,_zeichensatz*f){
				_zeichenkette<_tt> h,o;
				_liste<_zeichenkette<_tt> >*l=new _liste<_zeichenkette<_tt> >();
				_zeichenkette<_tt> sep(L" ");
				_liste<_zeichenkette<_tt> > li;
				unsigned int count;
				unsigned int i;
				t.teilen(sep,&li);
				count=li.anzahl();
				i=0;
				while(i<count){
				 h=L"";
				 while((f->breite(h)<wx)&&(i<count)){
				  o=h;
				  h+=(*li[i])+_zeichenkette<_tt>(L" ");
				  i++;
				 };
				 if(f->breite(h)>=wx){
				  h=o;
				  i--;
				 };
				 if((h!=L"")&&(h!=L" ")) l->einhaengen(new _zeichenkette<_tt>(h));
				};
				li.loeschen();
				return(l)
};
void _solitaire::messagestatusbar(const _zeichenkette<_tt>&t,_to o=1,_tg dt=2000){
				bool exist=false;
				_statusbarentry*sit;
				if(statusbarlist.anfang(sit))do{
				 if(sit->text==t){
				  exist=true;
				  if((sit->pfadein==false)&&(sit->pfadeout==false)){//wartet zeitstart erneuern
				   sit->time=clock->system();
				  }else if((sit->pfadein==false)&&(sit->pfadeout==true)){// wieder einblenden 
 				   sit->fadein();
				  };
				 }else{
				  sit->fadeout();
				 };
				}while(statusbarlist.naechstes(sit));
				if(exist==false){
				 new _statusbarentry(this,t,o,dt);
				};
};
void _solitaire::messagepileinfo(const _zeichenkette<_tt>&n,const _zeichenkette<_tt>&d0,const _zeichenkette<_tt>&d1,_to o=1,_tg dt=100){
				bool exist=false;
				_pileinfoentry*pit;
				if(pileinfolist.anfang(pit))do{
				 if((pit->name==n)&&(pit->desc0==d0)&&(pit->desc1==d1)){
				  exist=true;
				  if((pit->pfadein==false)&&(pit->pfadeout==false)){//wartet zeitstart erneuern
				   pit->time=clock->system();
				  }else if((pit->pfadein==false)&&(pit->pfadeout==true)){// wieder einblenden 
 				   pit->fadein();
				  };
				 }else{
				  pit->fadeout();
				 };
				}while(pileinfolist.naechstes(pit));
				if(exist==false){
				 new _pileinfoentry(this,n,d0,d1,o,dt);
				};
};	
//*****************************************************************************************************************
//									    M E S S A G E B O X
//*****************************************************************************************************************
bool _solitaire::messagebox(const _zeichenkette<_tt>&t,const _zeichenkette<_tt>&tbutton,_tg ox,_tg oy,_zeichensatz*f,_bild<_tb>*iwindow){
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
				px-=wx/2;
				py-=wy/2;
				wy=180+lt.anzahl()*20;
				w0=new _iggwindow(iggsystem,px,py,wx,wy,1,1,1);
				w0->position.z(-10);
				windowinitmagic(w0,iwindow);
				w0->setshadow(25,25);
				_tg yit=messageboxadditiontexty;
				_listenknoten<_zeichenkette<_tt> >*lntit;
				if(lt->anfang(lntit)do{
				 new _iggtext(w0,wx/2-f->breite(*(tit->object()))/2,yit,messageboxtextz,*(tit->objekt()),tr,tg,tb,f)
				 yit+=25;
				}while(lt->naechstes(lntit));
				lt->loeschen();
				deletesecure(lt);
				_iggbutton*k0=new _iggbutton(w0,wx/2-messageboxbuttonwidth/2,wy-60+messageboxadditionbuttony-10,messageboxbuttonwidth,messageboxbuttonheight,tbutton,0);
				buttoninitmagic(k0);
				w0->visibility(false);
				w0->activity(false);
				w0->fadeopacity(0);
				w0->fadein();
				w0->fadetarget(menuopacity);
				bool ap;
				if(game){
				 ap=game->allowpick;
				 game->allowpick=false;
				};
				bool q=false:
				do{
				 unsigned int cc=0;//getchar
				 iggsystem->nullstates();
				 if(animatestandard(cc)) q=true;
				 iggsystem->animatehelpfadeoutglobal();
				 drawstandard();
				}while((iggsystem->button==0)&&(tastatur->escape()==false)&&(tastatur->enter()==false)&&(tastatur->knopflinks()==false)&&(tastatur->knopfrechts()==false)&&(q==false));
				iggsystem->button=0;
				w0->fadeout(false,false,true);
				if(game) game->allowpick=ap;
				iggsystem->restoreactivitylist();
				return(true);
};
//*****************************************************************************************************************
//									    A B F R A G E
//*****************************************************************************************************************
bool _solitaire::abfrage(const _zeichenkette<_tt>&t,const _zeichenkette<_tt>&tbutton,const _zeichenkette<_tt>&tbutton2,_tg ox,_tg oy,_zeichensatz*f,_bild<_tb>*iwindow){
				iggsystem->saveactivitylist();
				iggsystem->setactivitylist(false);
				gra->orthonormal();
				_to tr=messageboxtextcolor.x();
				_to tg=messageboxtextcolor.y();
				_to tb=messageboxtextcolor.z();
				_iggwindow*w0;
				_tg px=ox;
				_tg py=oy;
				_tg wy=200;
				_tg wx=500;
				_liste<_zeichenkette<_tt> >*lt=textsplit(t,wx-messageboxadditiontextwidth,f);
				wy=180+lt.anzahl()*20;
				px-=wx/2;
				py-=wy/2;
				w0=new _iggwindow(iggsystem,px,py,wx,wy,1,1,1);
				w0->position.setz(-10);
				windowinitmagic(w0,iwindow);
				w0->setshadow(25,25);
				_tg yit=messageboxadditiontexty;
				_listenknoten<_zeichenkette<_tt> >*lntit;
				if(lt->anfang(lntit)do{
				 new _iggtext(w0,wx/2-f->breite(*(tit->object()))/2,yit,messageboxtextz,*(tit->objekt()),tr,tg,tb,f);
				 yit+=25;
				}while(lt->naechstes(lntit));
				lt->loeschen();
				deletesecure(lt);
				_tg bw0=messageboxbuttonwidth;
				_tg bw1=messageboxbuttonwidth;
				_iggbutton*k0==new _iggbutton(w0,wx/2-10-bw0,wy-60+messageboxadditionbuttony-20,bw0,messageboxbuttonheight,tbutton,0);
				buttoninitmagic(k0);
				k0->font=f;
				_iggbutton*k1=new _iggbutton(w0,wx/2+10,wy-60+messageboxadditionbuttony-20,bw1,messageboxbuttonheight,tbutton2,0);
				buttoninitmagic(k1);
				k1->font=f;
				w0.visibility(false);
				w0.activity(false);
				w0.fadeopacity(0);
				w0.fadein();
				w0.fadetarget(menuopacity);
				bool ap=game->allowpick;
				game->allowpick=false;
				bool q=false;
				do{
				 iggsystem->nullstates();
				 unsigned int cc=0;//GetChar()
				 if(animatestandard(cc)) q=true;
				 iggsystem->animatehelpfadeoutglobal();
				 drawstandard();
				}while((iggsystem->button==0)&&(tastatur->escape()==false)&&(q==false));
				w0->fadeout(false,false,true);
				bool r;
				if(iggsystem->button==k0) r=true; else r=false;
				game->allowpick=ap;
				iggsystem->button=0;
				iggsystem->restoreactivitylist();
				return(r);
};
//*****************************************************************************************************************
//									    A B F R A G E 2 Z
//*****************************************************************************************************************
bool _solitaire::abfrage2z(const _zeichenkette<_tt>&t,const _zeichenkette<_tt>&t2,const _zeichenkette<_tt>&tbutton,const _zeichenkette<_tt>&tbutton2,_tg ox,_tg oy,_zeichensatz*f,_bild<_tb>*iwindow){
				iggsystem->saveactivitylist();
				iggsystem->setactivitylist(false);
				_to tr=messageboxtextcolor.x();
				_to tg=messageboxtextcolor.y();
				_to tb=messageboxtextcolor.z();
				_iggwindow*w0;
				_tg px=ox;
				_tg py=oy;
				_tg wy=200;
				_tg wx=f->breite(t)+messageboxadditiontextwidth;
				_tg wt=f->breite(t2)+messageboxadditiontextwidth;
				_tg bw0=messageboxbuttonwidth;
				_tg bw1=messageboxbuttonwidth;
				if(wt>wx) wx=wt;
				if(wx<180) wx=180;
				px-=wx/2;
				py-=wy/2;
				w0=new _iggwindow(iggsystem,px,py,wx,wy,1,1,1);
				windowinitmagic(w0,iwindow);
				w0->setshadow(25,25);
				w0->position.setz(-10);
				_iggtext*t0=new _iggtext(w0,messageboxadditiontextwidth/2,messageboxadditiontexty,messageboxtextz,t,tr,tg,tb,f);
				_iggtext*t1=new _iggtext(w0,messageboxadditiontextwidth/2,messageboxadditiontexty+f->hoehe(t),messageboxtextz,t2,tr,tg,tb,f);
				_iggbutton*k0=new _iggbutton(w0,wx/2-10-bw0,wy-60+messageboxadditionbuttony-20,bw0,messageboxbuttonheight,tbutton,0);
				buttoninitmagic(k0);
				k0->font=f;
				_iggbutton*k1=new _iggbutton(w0,wx/2+10,wy-60+messageboxadditionbuttony-20,bw1,messageboxbuttonheight,tbutton2,0);
				buttoninitmagic(k1);
				k1->font=f;
				w0->visibility(false);
				w0->activity(false);
				w0->fadeopacity(0);
				w0->fadein();
				w0->fadetarget(menuopacity);
				bool ap=game->allowpick;
				game->allowpick=false;
				bool q=false;
				do{
				 iggsystem->nullstates();
				 if(animatestandard(0) q=true;
				 iggsystem->animatehelpfadeoutglobal():
				 drawstandard();
			    }while((iggsystem->button==0)&&(tastatur->escape()==false)&&(q==false));
				w0->fadeout(false,false,true);
				bool r;
				if(iggsystem->button==k0) r=true; else r=false;
				game->allowpick=ap;
				iggsystem->button=0;
				iggsystem->restoreactivitylist();
				return(r);
};				
bool _solitaire::abfragegametype(_zeichensatz*f,_bild<_tb>*iwindow){
			    _zeichenkette<_tt> hhh;
			    if(currentgame==current_preview){
			     hhh=strgametyperestart1+gamenames[currentgame]+strgametyperestart2
			     if(abfrage2z(strgametyperestart0,hhh,stryes,strno,gra->groessex()/2,gra->groessey()/2,f,iwindow)==false){
			      return(false)
			     };		
				}else{
			     hhh=strgametypeset+" "+gamenames[currentgame]+" "+strto+" "+gamenames[current_preview];
			     if(abfrage2z(strchangegametype,hhh,stryes,strno,gra->groessex()/2,gra->groessey()/2,f,iwindow)==false){
			      return(false);
			     };		
			    };
				return(true);		
};	
//-------------------------------------------------------- ANIMATION --------------------------------------------------------------------				
int _solitaire::animateapplication(bool quit=false,unsigned int gi=0){
				if(menugame->active()==false){
				 _tg nt=clock->system();
				 _tg dt=nt-gamedelaytime;
				 if(game){
				  if(game->inuse) game->starttime+=dt;
				 };
				 gamedelaytime=nt;
				};
				if(iszoomed(hwnd)){//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 cbfs->checked=true;
				 fullscreen=cbfs->checked;
				 grafikmodus(gi);
				};
				if(AppTerminate()){//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 return(true);
				};
				if(AppSuspended()){//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 volumesoundfadein=0;
				 if(paused==false){
				  paused=true;
				  starttimepause=clock->system();
				  musicman->fadedown();
				 };
				 if((musicman->channelmenu->playing()==false)&&(fabs(pauseopacity-0.5)<nahenull)){
				  //suspend with delay
				  Delay(700);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 };
				}else{
				 if(paused==true){
				  paused=false;
				  if(game){
				   if(game->inuse){
				    game->starttime+=(clock->system()-starttimepause);
				   };
				  };
				  if(menumain->active()) musicman->fadeupmenu(); else musicman->fadeupmenu();
				 };
				};
				return(0);
};				
void _solitaire::updateopacitygamepreview(_to o){
				if(gamepreview)
				 gamepreview->opacity(o);
				};
};	
void _solitaire::initgame(unsigned int mode,bool showhighscore=true){
                deletesecure(game);
				//if(game) delete gamegame.clear(showhighscore);
				game=newgame(currentgame);
				game->init(this,mode);
				game->createshadow();
				updatemenumain();
};
void _solitaire::initgamepreview(unsigned int mode,unsigned int number){
                deletesecure(gamepreview);
				//if(gamepreview gamepreview->clear(false)
				gamepreview=newgame(number);
				gamepreview->preview=true;
				gamepreview->init(this,mode);
				gamepreview->allowpick=false;
				gamepreview->skipanimation();
				gamepreview->>createshadow();
				gamepreview->updateplane();
};				
void _solitaire::initgamemenu(unsigned int mode,unsigned int number){
                deletesecure(gamemenu);
				//if(gamemenu gamemenu->clear(false)
				gamemenu=newgame(number);
				gamemenu->menu=true;
				gamemenu->init(this,mode);
				gamemenu->allowpick=false;
				//gamepreview->skipanimation()
				gamemenu->createshadow();
				gamemenu->updateplane();
};				
void _solitaire::animatestandard:Int(keypress)=0;
void _solitaire::animategame(keypress)=0;
void _solitaire::animatemusic()=0;
void _solitaire::drawstandard()=0;
void _solitaire::drawloadscreen(swap=true,op#=1)=0;
void _solitaire::drawpause(){
				if(pauseopacity>0){
				 gra->orthonormal();
				 gra->vollbild(_vektor4<_to>(0,0,0,pauseopacity));
				 _vektor3<_tg> o;
				 _vektor4<_to> c;
				 _zeichenkette<_tt> h;
				 h=strpause;
				 o.setzen(gra->groessex()/2-font30->breite(h)/2,gra->groessey()/2-font30->hoehe(h)-100/2,2)
				 c.setzen(1,0.3,0.2,pauseopacity*2);
				 drawguitext(gra,h,font30,o,c);
				};
				if(paused){
				 if(pauseopacity<0.5) pauseopacity+=0.01;
				 if(pauseopacity>0.5) pauseopacity=0.5;
				}else{
				 if(pauseopacity>0) pauseopacity-=0.01;
				 if(pauseopacity<0) pauseopacity=0;
				};
};	
void _solitaire::drawblendscreen(){
				if(blendscreen){
				 gra->orthonormal();
				 gra->transparenzmultiplikativ();
				 gra.wrap(true);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 gra->rechteck(blendscreen,0,0,gra->groessex(),gra->groessey(),_vektor4<_to>(1,1,1,blendscreenopacity));
				 if(blendscreenopacity>0) blendscreenopacity-=0.01;
				 if(blendscreenopacity<0){
				  blendscreenopacity=0;
				  blendscreen=0;
				 };
				};
};							
void _solitaire::drawgamepreviewshadowcurving(bool curving){
				gra.wrap(true);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				gra->transparenzmultiplikativ();
				_pile*pit;
				_card*cit;
				if(gamepreview){
				 if(curving==false){//-------------------------------------------------------- pileschatten zeichnen
				  if(gamepreview->pilelist.anfang(pit))do{
				   pit->drawshadow(gra,cam);
				  }while(gamepreview->pilelist.naechstes(pit));
				 };
				 if(gamepreview->pilelist.anfang(pit))do{//------------------------- Kartenschatten in Piles ohne selbstzeichnung zeichnen
				  if(pit->cardlist.anfang(cit))do{
				   bool machen=false;
				   if(curving){
				    if((cit->curving==true)||(cit->picked==true)) machen=true;
				   }else{
				    if((cit.curving==false)&&(cit->picked==false)&&(pit->drawownshadow==false)) machen=true;
				   };
				   if(machen){
				    if(cit->shadowarraycount>0){
				     for(unsigned int i=0;i<cit->shadowarraycount;i++){
				      _shadowsingle*sit=cit->shadowarray[i];
				      sit->calculateopacity(cit->opacityquant);
				      sit->mesh->vertexalpha(cit->opacity*sit->opacity*0.35);
				      sit->draw(gra,cam);
				     };
				    };
				   };
				  }while(pit->cardlist.naechstes(cit));
				 }while(gamepreview->pilelist.naechstes(pit));
				};
};					
void _solitaire::drawgamepreview(_tg pox,_tg poy){
				if(gamepreview){
				 transformcamerapreview(pox,poy);
				 gra->wrap(true);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 gamepreview->drawpile(gra,cam);
				 gamepreview->drawlist.sort();
				 //if(systemaccellerate=false drawgamepreviewshadowcurving(false)
				 gamepreview->drawpilecard(gra,cam);
				 //if(systemaccellerate=false drawgamepreviewshadowcurving(true)
				 gamepreview->drawcard(gra,cam);
				 gamepreview->drawcurving(gra,cam);
				 gamepreview->drawshow(gra,campreview);
				};
				gra->transparenz(false);
};	
void _solitaire::drawgamemenu(_to op){
				if(gamemenu){
				 transformcameramenu();
				 gra->wrap(true);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 gamemenu->opacity(op);
				 gamemenu->drawpile(gra,cammenu);
				 gamemenu->drawlist.sort();
				 //if(systemaccellerate=false drawgamepreviewshadowcurving(false)
				 gamemenu->drawpilecard(gra,cammenu);
				 //if(systemaccellerate=false drawgamepreviewshadowcurving(true)
				 gamemenu->drawcard(gra,cammenu);
				 gamemenu->drawcurving(gra,cammenu);
				 gamemenu->drawshow(gra,cammenu);
				};
				gra->transparenz(false);
};				
void _solitaire::drawgameshadowcurving(bool curving,_to oppile=0.5,_to opglobal=0.35){
				unsigned int ii=0;
				_pile*pit;
				_card*cit;
				if(game){
				 _shadowsingle*sit;
				 if(game->pilelist.anfang(pit))do{//------------------------- Kartenschatten in Piles ohne selbstzeichnung zeichnen
				  if(pit->cardlist.anfang(cit))do{
				   bool machen=false;
				   if(curving){
				    if((cit->curving==true)||(cit->picked==true)) machen=true;
				   }else{
				    if((cit->curving==false)&&(cit->picked==false)) machen=true;
				   };
				   if(machen){
				    for(unsigned int i=0;i<cit->shadowarraycount;i++){//sit:_shadow=EachIn cit.shadowlist
				     sit=cit->shadowarray[i];
				     if(cit->picked==false){
				      if((clock->system()-cit->meshchangedlasttime)<500){
				       sit->calculateopacity(cit->opacityquant);
				      };
				      ii++;
				      sit->mesh->vertexalpha(cit->opacity*sit->opacity*opglobal);
				     }else{
				      sit->opacity=0.7;
				      sit->mesh->vertexalpha(cit->opacity*sit->opacity*opglobal);
			 	     };
				     sit->draw(gra,cam);
				    };
				   };
				  }while(pit->cardlist.naechstes(cit));
				 }while(game->pilelist.naechstes(pit));
				 
				 if(game->cardlist.anfang(cit))do{//--------------------------- globale Karten schatten zeichnen
				  bool machen=false;
				  if(curving){
				   if(cit->curving==true)&&(cit->picked==false)) machen=true;
				  }else{
				   if(cit->curving==false)&&(cit->icked==false)) machen=true;
				  };
				  if(machen){
				   for(unsigned int i=0;i<cit->shadowarraycount;i++){//sit:_shadow=EachIn cit->shadowlist
				    sit=cit->shadowarray[i];
				    sit->calculateopacity(cit->opacityquant);
				    sit->mesh->vertexalpha(cit->opacity*sit->opacity*opglobal);
				    sit->draw(gra,cam);
				   };
				  };
				 }while(game->cardlist.naechstes(cit));
				 if(curving){
				  if(game->blowlist.anfang(cit))do{//--------------------------- blowing Karten schatten zeichnen
				   for(unsigned int i=0;i<cit->shadowarraycount;i++){//sit:_shadow=EachIn cit->shadowlist
				    sit=cit->shadowarray[i];
				    sit->calculateopacity(cit->opacityquant);
				    sit->mesh->vertexalpha(cit->opacity*sit->opacity*opglobal);
				    sit->draw(gra,cam);
				   };
				  }while(game->blowlist.naechstes(cit));
				 };
				};
};	
void _solitaire::transformcameramenu(){
				 cammenu->setzen(61,83,-56);//position
				 cammenu->view.setzen(0,1.75,0);
				 cammenu->view.rotx(13);
				 cammenu->view.rotz(143);
				 _vektor3<_tg>h(0,0,-1);
				 cammenu->side.copy(h);
				 cammenu->side.crossproduct(cammenu->view);
				 cammenu->side.norm();
				 cammenu->side.mul(-1);
				 cammenu->up.copy(cammenu->side);
				 cammenu->up.crossproduct(cammenu->view);
				 cammenu->up.norm();
				 world->transform(gra,cammenu);
};
void _solitaire::transformcamerapreview(pox#,poy#){
				 campreview->setzen(0,0,-31);
 				 if(gra->groessex()>1024) campreview->z(campreview->z()*(_tg(gra->groessex())/_tg(1024)));
				 _tg yg=53+poy;//=yw/zw * sh
				 _tg xg=90+pox;//=yw/zw * sh
				 _tg sw=gra->groessex()*0.5;
				 _tg sh=gra->groessey()*0.5;
				 _tg zw=campreview->z();
				 _tg yw=(yg/sh)*zw;
				 _tg xw=(xg/sw)*zw;
				 campreview->y(campreview->y()-yw);
				 campreview->x(campreview->x()+xw);
				 world->transform(gra,campreview);
};
void _solitaire::transformgamepreview(){
	  			if(gamepreview){
	 			 _vektor3<_tg> h=gamepreview->translationglobal;
				 h*=-1;
	 			 gamepreview->translate(h);
	 			 gamepreview->scale(_tg(1)/gamepreview->scaleglobal);
				 _tg smx=(gamepreviewrectangle[0].x()+gamepreviewrectangle[1].x())*0.5;
				 _tg smy=(gamepreviewrectangle[0].y()+gamepreviewrectangle[1].y())*0.5;
				 _tg sdx=fabs(gamepreviewrectangle[1].x()-gamepreviewrectangle[0].x());
				 _tg sdy=fabs(gamepreviewrectangle[1].y()-gamepreviewrectangle[0].y());
				 _tg gmx=(gamepreview->rectangle[1].x()+gamepreview->rectangle[0].x())*0.5;
				 _tg gmy=(gamepreview->rectangle[1].y()+gamepreview->rectangle[0].y())*0.5;
				 _tg gdx=fabs(gamepreview->rectangle[1].x()-gamepreview->rectangle[0].x());
				 _tg gdy=fabs(gamepreview->rectangle[1].y()-gamepreview->rectangle[0].y());
				 _vektor3<_tg> ds(smx,smy,0);
				 _vektor3<_tg> dn(-gmx,-gmy,0);
				 gamepreview->translate(dn);
				 _tg dx=gdx/sdx;
				 _tg dy=gdy/sdy;
				 _tg f;
    			 if(dx>dy){
				  f=sdx/gdx;
				 }else{
				  f=sdy/gdy;
				 };
				 gamepreview->scale(f);
				 gamepreview->translate(ds);
				};
};
void _solitaire::transformgamemenu(){
	  			if(gamemenu){
	 			 _vektor3<_tg> h=gamemenu->translationglobal;
				 h*=-1;
	 			 gamemenu->translate(h);
	 			 gamemenu->scale(_tg(1)/gamemenu->scaleglobal);
				 _tg smx=(gamemenurectangle[0].x()+gamemenurectangle[1].x())*0.5;
				 _tg smy=(gamemenurectangle[0].y()+gamemenurectangle[1].y())*0.5;
				 _tg sdx=fabs(gamemenurectangle[1].x()-gamemenurectangle[0].x());
				 _tg sdy=fabs(gamemenurectangle[1].y()-gamemenurectangle[0].y());
				 _tg gmx=(gamemenu->rectangle[1].x()+gamemenu->rectangle[0].x())*0.5;
				 _tg gmy=(gamemenu->rectangle[1].y()+gamemenu->rectangle[0].y())*0.5;
				 _tg gdx=fabs(gamemenu->rectangle[1].x()-gamemenu->rectangle[0].x());
				 _tg gdy=fabs(gamemenu->rectangle[1].y()-gamemenu->rectangle[0].y());
				 _vektor3<_tg> ds(smx,smy,0);
				 _vektor3<_tg> dn(-gmx,-gmy,0);
				 gamemenu->translate(dn);
				 _tg dx=gdx/sdx;
				 _tg dy=gdy/sdy;
				 _tg f; 
				 if(dx>dy){
				  f=sdx/gdx;
				 }else{
				  f=sdy/gdy;
				 };
				 gamemenu->scale(f);
				 gamemenu->translate(ds);
				};
}; 
//------------------------------------------------ old effects -------------------------------------------------------------				
_candle*_solitaire::createcandle(_liste<_candle>*l,_tg x,_tg y,_tg z,_tg i,_tg sc,_tg sp,_basis::_liste<_partikel>*pl){
				_candle*c0;
				bool im=false;
				if(l==&candlemenulist) im=true;
				c0=new _candle(this,x,y,z,i,sc,sp,pl,im);
				if(im){
				 c0->_basis::_listenknoten<_candle>::aushaengen();//!!!!!!!!!!!!?????????????? ja ?
				};
				l->einhaengen(c0);
				return(c0);
};
_page*_solitaire::createpage(_bild<_tb>*tf,_bild<_tb>*tb,_bild<_tb>*tex,const _zeichenkette<_tt>&text){
				_page*c0=new _page(this,tf,tb,tex,15,20);
				return(c0);
};	
void _solitaire::copypagevertexcolor(){
                _page*pit;
				if(pagelist.anfang(pit))do{
				 pit->copyvertexcolor();
				}while(pagelist.naechstes(pit));
};		
void _solitaire::buttoninitmagic(_iggbutton*g,_zeichensatz*f=0,_bild<_tb>*bs=0,_bild<_tb>*bsh=0,_bild<_tb>*bl=0,_bild<_tb>*blh=0)=0;
void _solitaire::windowinitmagic(_iggwindow*w,_bild<_tb>*i)=0;		
void _solitaire::guihelpinitmagic(_igg*g)=0;		
void _solitaire::updatemenumain()=0;
void _solitaire::updatemenugame()=0;
void _solitaire::updatelistboxgametypesorted(_igglistbox*tl,unsigned int sel){
				_liste<_zeichenkette<_tt> > el;
				_liste<_zeichenkette<_tt> > sll;
				_zeichenkette<_tt> slls;
				_sortentry*eit;
				tl->clearchild();
				if(gametypesortmethod==0){//-------------------alphabetisch
				 for(unsigned int i=0;i<gametypecount;i++){
				  if(gametypeactive[i]){
				   eit=new _sortentry(gamenames[i],(_tg)gamenames[i][0]);
				   eit->criterium=0;
				   _tg h=100000000;
				   for(int l=0;l<gamenames[i].groesse();l++){ 
					eit->criterium:+_tg(gamenames[i][l])*h;
					h*=0.1;
				   };				   
				   sll.einhaengen(eit);
				  };
				 };
				 sll.sort();
				}else if(gametypesortmethod==1){//----------------- bekanntheit
				 for(unsigned int i=0;i<gametypecount;i++){
				  if(gametypeactive[i]){
				   eit=new _sortentry(gamenames[i],(1-gametypepublicity[i]));
				   sll.einhaengen(eit);
				  };
				 };
				 sll.sort();
				}else if(gametypesortmethod==2){//----------------chance
				 for(unsigned int i=0;i<gametypecount;i++){
				  if(gametypeactive[i]){
				   eit=new _sortentry(gamenames[i],(1-gametypechancemin(i)));
				   sll.einhaengen(eit);
				  };
				 };
				 sll.sort();
				}else if(gametypesortmethod==3){//----------------skill
				 for(unsigned int i=0;i<gametypecount;i++){
				  if(gametypeactive[i]){
				   eit=new _sortentry(gamenames[i],gametypeskill[i]);
				   sll.einhaengen(eit);
				  };
				 };
				 sll.sort();
				}else if(gametypesortmethod==4){//----------------time
				 for(unsigned int i=0;i<gametypecount;i++){
				  if(gametypeactive[i]){
				   eit=new _sortentry(gamenames[i],gametypetime[i]);
				   sll.einhaengen(eit);
				  };
				 };
				 sll.sort();
				}else if(gametypesortmethod==5){//------------------ typgruppen
				 for(unsigned int i=0;i<gametypecount;i++){
				  if(gametypeactive[i]){
				   eit=new _sortentry(gamenames[i],gametypegroup[i]);
				   el.einhaengen(eit);
				  };
				 };
				 int aci=-1;
				 el.sort();
				 _listenknoten<_zeichenkette<_tt> >*lneit;
				 if(el.anfang(lneit))do{//for(Local eit:_sortentry=EachIn el
				  if(int(lneit->objekt()->criterium)!=aci){
				   aci++;
				   _sortentry*git=new _sortentry(gametypegroupnames[aci],0);
				   git->color.setzen(0.2,0.7,0.1,1);
				   git->selectable=false:
				   sll.einhaengen(git);
				  };
				  sll.einhaengen(lneit->objekt());
				 }while(el.naechstes(lneit));
				
				 unsigned int i=0;
				 unsigned int j=0;
				 _guishiftout*gso=0;
				 _guishiftout*gsoprev=0;
				 
				 if(sll.anfang(lneit))do{//for(Local eit:_sortentry=EachIn  sll
				  if(lneit->objekt()->selectable==false){
				   gsoprev=gso;
				   gso=new _guishiftout(tl,5,5+i,tl->width()-50,45,lneit->objekt()->name,-1,1,1,1,font18)
				   gso->selectable=false;
				   gso->positionmatch=gsoprev;
				   buttoninitmagic(gso->button);
				   i+=40;
				   j=0;
				  }else{
				   gso->window.inserttext(lneit->objekt()->name,5,5+j,1,lneit->objekt()->color.x,lneit->objekt()->color.y,lneit->objekt()->color.z,font18);
				   j+=30;
				  };
				 }while(sll.naechstes(lneit));
                 _igg*igg;
                 _igg*igi;
                 if(tl->anfang(igg))do{
                  _iggshiftout*gsoit=dynamic_cast<_iggshiftout*>(igg);
                  if(gsoit){
				   //for(Local gsoit:_guishiftout=EachIn tl.childlist
				   bool hatsel=false;
				   if(gsoit->window->anfang(igi))do{
				    _iggtext*te=dynamic_cast<_iggtext*>(igi);
				    if(te){
				    //for(Local git:_iggtext=EachIn gsoit.window.childlist 
				     if(te->get()==gamenames[sel]){
				      hatsel=true;
				      tl->selection=igi;
				     };
				    };
				   }while(gsoit->window->naechstes(igi));
				   if(hatsel) gsoit->setshiftout(true); else gsoit->setshiftout(false);
				  };
				 }while(tl->naechstes(igg));
				 tl->scrolltoselection();
				};
				//-------------------------------------------------------------------------------------------------
				if(gametypesortmethod!=5){
				 unsigned int i=0;
				 if(sll.anfang(lneit))do{
				 //for(Local eit:_sortentry=EachIn  sll
				 
				  if(eit->selectable==false){
				   _iggshiftout*gso=new _guishiftout(tl,5,5+i,tl->width()-40,40,lneit->objekt()->name,-1,1,1,1,font18);
				   gso->selectable=false;
				   buttoninitmagic(gso->button);
				   i+=40;
				  }else{
				   _iggtext*gt=tl->inserttext(lneit->objekt()->name,5,5+i,1,lneit->objekt()->color.x,lneit->objekt()->color.y,lneit->objekt()->color.z,font18);
				   i+=30;
				  };
				 }while(sll.naechste(lneit));
				 tl->selectbytext(gamenames[sel]);
				 tl->scrolltoselection();
				};
};
void _solitaire::updatemenugametype(){
				_zeichenkette<_tt> typ=typelist->selectiontext();
				for(unsigned int i=0;i<gametypecount;i++){
				 if(typ==gamenames[i]){
				  current_preview=i;
				  current.set(gamenames[current_preview]);
				 };
				};
				//Print "desclist.clhildlist.clear()"+ desclist.childlist.count()
				updatemenugametypehelp(desclist,current_preview);
};
void _solitaire::updatemenugametypehelp(_igglistbox*destination,unsigned int gameindex){
				_iggline*gl;
				destination->clearchild();
				//desclist.childlist.clear()
				buttondemoplayplay=0;
				buttondemoplaystop=0;
				buttonfoundation=0;
				buttondiscard=0;
				buttontableau=0;
				buttonstock=0;
				buttonwaste=0;
				buttonredeal=0;
				buttonreserve=0;
				buttonfreecell=0;
				buttonpyramid=0;
				buttonlabyrinth=0;	
				destination->selection=0;
				if((gameindex>=0)&&(gameindex<gametypecount)){
				 //------------------------------------------------------------ Kennzahlen des Typs anzeigen ------------------------------------
				 _zeichenkette<_tt> h;
				 _tg t;
				 _tg yit=10;
				 _tg xit=20;//225-90
				 _tg off=20;
				 t=gametypechancemin(gameindex);
				 if((t>0.0)&&(t<=0.2)) h=strverylow;
				 if((t>0.2)&&(t<=0.4)) h=strlow;
				 if((t>0.4)&&(t<=0.6)) h=strmedium;
				 if((t>0.6)&&(t<=0.8)) h=strhigh;
				 if((t>0.8)&&(t<=1.0)) h=strveryhigh;
				 
				 if((gametypechance[gameindex*2]+gametypechance[gameindex*2+1])==0) h=L"NOCH NICHT ERMITTELT";
				 _zeichenkette<_tt> hv=int(t*100);
				 //Local sepa$[]=new String[1]
				 //_zeichenkettesepa[0]="."
				 //Local frags$[]=hv.split(sepa[0])
				 hv=L" ("+hv+L"%  "+gametypechance[gameindex*2]+L" "+strof+L" "+Int(gametypechance[gameindex*2]+gametypechance[gameindex*2+1])+L")";
				 h+=hv;
				 _iggtext*gtt=destination->inserttext(strchance+L": "+h,5,yit,1,1,0.8,0.5,font18);yit+=off;
				 gtt->createhelp(strwinchance,font18,0.2,0,0);
				 guihelpinitmagic(gtt);
				 
				 t=gametypeskill[gameindex];
				 if((t>=0.0)&&(t<=0.2)) h=strveryeasy;
				 if((t>0.2)&&(t<=0.4)) h=streasy;
				 if((t>0.4)&&(t<=0.6)) h=strmediumdifficult;
				 if((t>0.6)&&(t<=0.8)) h=strhard;
				 if((t>0.8)&&(t<=1.0)) h=strveryhard;
				 destination->inserttext(strdifficulty+L" : "+h,5,yit,1,1,0.8,0.5,font18);yit+=off;
				
				 t=gametypetime[gameindex];
				 if(t<7) h=strshort;
				 if((t>=7)&&(t<=12)) h=strmedium;
				 if(t>=12) h=strlong;
				 destination->inserttext(strtimeexposure+L" : "+h,5,yit,1,1,0.8,0.5,font18);yit+=off;
   			     destination->inserttext(strdecks+L" : "+gametypedeckscount[gameindex],5,yit,1,1,0.8,0.5,font18);yit+=off;
				
				 //--------------------------------------------------- Beschreibungstext mit Absätzen ----------------------------------------
				 gl=destination->insertline(5,yit+10,500,yit+10,0.4,0.25,0.05);
				 gl->color.w(0.3);
				 //SetImageFont(font18);
				 yit+=20;
				 _tg lbyit=yit;
				 if(gamepreview){
				  gra->orthonormal();
				  _listenknoten<_zeichenkette<_tt> >*lnzit;
				  _listenknoten<_zeichenkette<_tt> >*lnzii;
				  _liste<_zeichenkette<_tt> > absatzlist;
				  _zeichenkette<_tt> sep=L"|";
				  gameobjective[gameindex].teilen(sep,&absatzlist);
				  unsigned int ac=absatzlist.anzahl();
				  unsigned int ai=0;
				  if(absatzlist.anfang(lnzit))do{
				   _liste<_zeichenkette<_tt> >*lt=textsplit(lnzit->objekt(),450-20,font18);//for(Local tab:String=EachIn absatzlist
				   if(lt->anfang(lnzii))do{//for(Local tit:String=EachIn lt
				    destination->inserttext(lnzii->objekt(),20,yit,1,1,0.8,0.5,font18);
				    yit+=off;
				   }while(lt->naechstes(lnzii));
				   ai++;
				   if(ai<ac) yit+=10;
				   lt->loeschen();
				   deletesecure(lt);
				  }while(absatzlist.naechstes(lnzit));
				  absatzlist.loeschen();
				  //------------------------------------------------- BUttons und deren Texte und Hilfen -----------------------------------------
				  gl=destination->insertline(5,yit+10,500,yit+10,0.4,0.25,0.05);
				  gl->color.w(0.3);		  
				  //SetImageFont(font18)
				  yit+=20;
				  gamepreview->updatepiledescription();
				  for(unsigned int p=0;p<10;p++){
				   _iggbutton*but=0;
				   _zeichenkette<_tt> tb=L"";
				   _list<_pile>*pl;
				   _liste<_zeichenkette<_tt> > buttontextlist;
				   if(p==0) {pl=gamepreview->pilefoundationlist;tb=strpilefoundationshort;};
				   if(p==1) {pl=gamepreview->pilediscardlist;tb=strpilediscardshort;};
				   if(p==2) if(gamepreview->tableau) {pl=gamepreview->tableau->pilelist;tb=strtableau;};
				   if(p==3) {pl=gamepreview->pilestocklist;tb=strpilestock;};
				   if(p==4) {pl=gamepreview->pilewastelist;tb=strpilewasteshort;};
				   if(p==5) {pl=gamepreview->pileredeallist;tb=strpileredealshort;};
				   if(p==6) {pl=gamepreview->pilereservelist;tb=strpilereserveshort;};
				   if(p==7( {pl=gamepreview->pilefreecelllist;tb=strpilefreecellshort;};
				   if(p==8) {pl=gamepreview->pilepyramidlist;tb=strpilepyramidshort;};
				   if(p==9) {pl=gamepreview->pilelabyrinthlist;tb=strpilelabyrinthshort;};
				   if(pl){
				    if(pl->anzahl()>0){
				     
				     but=new _iggbutton(destination,xit,yit,160,45,tb,4000+p);
				     buttoninitmagic(but);
					 if(tb==strtableau){//------------------------------------------- tableau pile help description -------------------------------
					  _liste<_piletableau> ptlist;
					  _listenknoten<_piletableau> *lnptit;
					  _listenknoten<_piletableau> *lnptii;
					  unsigned int ptindex=0;
					  if(gamepreview->tableau){
					   if(gamepreview->tableau->pilelist.anfang(lnptit))do{
					    bool exist=false;
					    if(ptlist.anfang(lnptii))do{//for(Local ptii:_piletableau=EachIn ptlist
					     if(lnptit->objekt()->samerule(lnptii->objekt()) exist=true;
					    }while(ptlist.naechstes(lnptii));
					    if((exist==false)&&(lnptit->objekt()->showdescription)) ptlist.einhaegen(lnptit->objekt());
					   }while(gamepreview->tableau->pilelist.naechstes(lnptit));
					  };
					  
					  _piletableau*pt;
					  if(ptlist.anfang(lnptit))do{//for(Local pt:_piletableau=EachIn ptlist
					   pt=lnptit->objekt();
					   _iggwindow*pickhelp;
					   _iggwindow*drophelp;
					   _iggwindow*dropemptyhelp;
					   _tg pyit=10;
					   _tg dyit=10;
					   _tg eyit=10;
					
					   _zeichenkette<_tt> hdrop=strdrop;
				       if(ptlist.anzahl()>1){
				        if(ptindex==0) hdrop+=L" ("+strleft+L")";
				        if(ptindex==1) hdrop+=L" ("+strright+L")";
				       };
				       if(pt->takeruleset()){
				        drophelp=but->createhelp(hdrop,font18,0.3,125,0,350,true);
					    if(pt->takesamesuit) {inserthelpsamesuit(drophelp,dyit,pt,true);dyit+=25;};
					    if(pt->takeothersuit) {inserthelpothersuit(drophelp,dyit);dyit+=25;};
					    if(pt->takealteratecolor) {inserthelpalteratecolor(drophelp,dyit);dyit+=25;};
						if(pt->takeascending) {inserthelpascending(drophelp,dyit);dyit+=25;};
						if(pt->takedescending) {inserthelpdescending(drophelp,dyit);dyit+=25;};
						if(pt->takeboth) {inserthelpboth(drophelp,dyit);dyit+=25+16;};
						if(pt->takewrapped) {dyit=inserthelpwrapped(drophelp,dyit,pt);};
						if(pt->takemirrored) {inserthelpmirrored(drophelp,dyit,pt);dyit+=25+14+20;};
						if(pt->takerestriction) dyit=inserthelprestriction(drophelp,dyit);
						buttontextlist.einhaengen(pt->description0+pt->description1);
					   };
					   if(pt->takeemptyruleset()){
					    if(drophelp==0) drophelp=but->createhelp(hdrop,font18,0.3,125,0,350,true);
						if((pt->takeemptysuit!=-1)||(pt->takeemptynumber!=-1)){
						 dyit=inserthelpsuitnumber(drophelp,dyit,pt,true);
						 if((pt->takeemptysuit!=-1)&&(pt->takeemptynumber==-1)){
						  buttontextlist.einhaengen(strdescriptiontakeemptysuit);
						 }else if((pt->takeemptysuit==-1)&&(pt->takeemptynumber!=-1)){
						  if(pt->takeemptynumber==12) buttontextlist.einhaengen(strdescriptiontakeemptyking); else buttontextlist.einhaengen(strdescriptiontakeemptynumber);
						 }else if((pt->takeemptysuit!=-1)&&(pt->takeemptynumber!=-1)){
						  if(pt->takeemptynumber==12) buttontextlist.einhaengen(strdescriptiontakeemptysuitking); else buttontextlist.einhaengen(strdescriptiontakeemptysuitnumber);
						 };
						};
						if(pt->takeemptymaximal!=-1){
						 dyit=inserthelpmaximal(drophelp,dyit,pt->takeemptymaximal,true);
						 _zeichenkette<_tt> hh=strdescriptiontakeemptymaximal+L" "+pt->takeemptymaximal+L" ";
						 if(pt->takeemptymaximal==1) hh+=strdescriptiontakeemptymaximalcard; else hh+=strdescriptiontakeemptymaximalcards;
						 buttontextlist.einhaengen(hh);
						};
						if(pt->takeemptyrestriction){
						 dyit=inserthelprestriction(drophelp,dyit,true);
						 buttontextlist.einhaengen(strdescriptiontakeemptyrestriction);
						};
					   }else{
					    if(pt->takerestriction==false) buttontextlist.einhaengen(strdescriptiontakeemptyany);
					   };
					   if(drophelp) drophelp->size.y(drophelp->childheight()+10);					   
					
				       if(pt->giveruleset()){
				        _zeichenkette<_tt> hpick=strpick;
				        if(ptlist.anzahl()>1){
				         if(ptindex==0) hpick+=L" ("+strleft+L")";
				         if(ptindex==1) hpick+=L" ("+strright+L")";
				        };
				        pickhelp=but->createhelp(hpick,font18,0.3,125,0,350,true);
					    if(pt->givesamesuit) {inserthelpsamesuit(pickhelp,pyit,pt,false);pyit+=25;};
					    if(pt->giveothersuit) {inserthelpothersuit(pickhelp,pyit);pyit+=25;};
					    if(pt->givealteratecolor) {inserthelpalteratecolor(pickhelp,pyit);pyit+=25;};	
					    if(pt->giveascending) {inserthelpascending(pickhelp,pyit);pyit+=25;};
					    if(pt->givedescending) {inserthelpdescending(pickhelp,pyit);pyit+=25;};
						if(pt->giverestriction) {dyit=inserthelprestriction(pickhelp,pyit);};
						if(pt->givemaximal!=-1) {dyit=inserthelpmaximal(pickhelp,pyit,pt->givemaximal);};
						pickhelp->size.y(pickhelp->childheight()+10);
				        _zeichenkette<_tt> hpt=L"";
				        if(pt->givedescending) hpt=strdescriptiongivedescending;
				        if(pt->giveascending) hpt=strdescriptiongiveascending;
				        if(pt->givealteratecolor) hpt+=strdescriptiongivealteratecolor;
				        if(pt->givesamesuit) hpt+=strdescriptiongivesamesuit;
				        if(pt->giveothersuit) hpt+=strdescriptiongiveothersuit;
				        if(hpt!=L"") hpt+=strdescriptiongive;
				        if(pt->giverestriction) hpt+=strdescriptiongiverestriction
				        if(pt->givemaximal!=-1) if(pt->givemaximal==1) hpt+=strdescriptiongivemaximalsingular; else hpt+=strdescriptiongivemaximalplural0+pt->givemaximal+strpiletakemaximalplural1;
			            buttontextlist.einhaengen(hpt);
				       }else{
				        buttontextlist.einhaengen(strdescriptiongiveanysequence);
					   };
					   ptindex++;
				 	  }while(ptlist.naechstes(lnptit));
				      if(but) guihelpinitmagic(but);
				     }else if(tb==strpilefoundationshort){//------------------------------------------- foundation pile help description -------------------------------
					  _listenknoten<_pilefoundation>*lnpfit;
					  _listenknoten<_pilefoundation>*lnpfii;
					  _liste<_pilefoundation> pflist;
					  unsigned int pfindex=0;
					  if(gamepreview->pilefoundationlist.anfang(lnpfit))do{//for(Local pfit:_pilefoundation=EachIn gamepreview->pilefoundationlist
					   bool exist=false;
					   if(pflist.anfang(lnpfii))do{//for(Local pfii:_pilefoundation=EachIn pflist
					    if(lnpfit->objekt()->samerule(lnpfii->objekt())) exist=true;
					   }while(pflist.naechstes(lnpfii));
					   if(exist==false) pflist.einhaengen(lnpfit->objekt());
					  }while(gamepreview->pilefoundationlist.naechstes(lnpfit));

                      _pilefoundation*pf;
					  if(pflist.anfang(lnpfit))do{//for(Local pf:_pilefoundation=EachIn pflist
					   pf=lnpfit->objekt();
					   _iggwindow*pickhelp;
					   _iggwindow*drophelp;
					   _tg pyit=10;
					   _tg dyit=10;
				       _zeichenkette<_tt> hdrop=strdrop;
				       if(pflist.anzahl()>1){
				        if(pfindex==0) hdrop+=L" ("+strleft+L")";
				        if(pfindex==1) hdrop+=L" ("+strright+L")";
				       };
				       if(pf->takeruleset()){ 
				        drophelp=but->createhelp(hdrop,font18,0.3,125,0,350,true);
					    if(pf->takesamesuit) {inserthelpsamesuit(drophelp,dyit,pf,true);dyit+=25;};
					    if(pf->takeothersuit) {inserthelpothersuit(drophelp,dyit);dyit+=25;};
					    if(pf->takealteratecolor) {inserthelpalteratecolor(drophelp,dyit);dyit+=25;};
						if((pf->takeascending)&&(pf->takemirrored==false)) {inserthelpascending(drophelp,dyit);dyit+=25;};
						if((pf->takedescending)&&(pf->takemirrored==false)) {inserthelpdescending(drophelp,dyit);dyit+=25;};
						if(pf->takeboth) {inserthelpboth(drophelp,dyit);dyit+=25+16;};
						if(pf->takewrapped) {dyit=inserthelpwrapped(drophelp,dyit,pf);};
						if(pf->takemirrored) {inserthelpmirrored(drophelp,dyit,pf);dyit+=25+14+16;};
						if(pf->takerestriction) {dyit=inserthelprestriction(drophelp,dyit);};
						buttontextlist.einhaengen(pf->description0+pf->description1);
						drophelp->size.sety(drophelp->childheight()+10);
					   };
				       if(pf->giveruleset()){
				        _zeichenkette<_tt> hpick=strpick;
				        if(pflist.anzahl()>1){
				         if(pfindex==0) hpick+=L" ("+strleft+L")";
				         if(pfindex==1) hpick+=L" ("+strright+L")";
				        };
				        pickhelp=but->createhelp(hpick,font18,0.3,125,0,350,true);
					    if(pf->givesamesuit) {inserthelpsamesuit(pickhelp,pyit,pf,false);pyit+=25;};
					    if(pf->giveothersuit) {inserthelpothersuit(pickhelp,pyit);pyit+=25;};
					    if(pf->givealteratecolor) {inserthelpalteratecolor(pickhelp,pyit);pyit+=25;};	
					    if(pf->giveascending) {inserthelpascending(pickhelp,pyit);pyit+=25;};
					    if(pf->givedescending) {inserthelpdescending(pickhelp,pyit);pyit+=25;};
						if(pf->giverestriction) {dyit=inserthelprestriction(pickhelp,pyit);};
						if(pf->givemaximal!=-1) {dyit=inserthelpmaximal(pickhelp,pyit,pf->givemaximal);};
						pickhelp->size.y(pickhelp->childheight()+10);
					   };
					   if(pf->giverestriction){
					   // buttontextlist.einhaengen(strdescriptiongiverestriction);
					   }else{
					    buttontextlist.einhaengen(strdescriptiongivefirst);
					   };
 					   pfindex++;
				 	  }while(pflist.naechstes(lnpfit));
				      if(but) guihelpinitmagic(but);
				     }else if(tb==strpilediscardshort){//------------------------------------------- discard pile help description -------------------------------
				      _pilediscard*pd;
				      _listenknoten<_pilediscard>*lnpdit;
				      if(gamepreview->pilediscardlist->anfang(lnpdit)){
				       pd=lnpdit->objekt();
				   	   if(pd->acesupmode){
				        but->createhelp(strdiscardacesupmode,font18,0.3,100,0,200,true);
					   }else if(pd->pyramidmode){
				        but->createhelp(strdiscardpyramidmode,font18,0.3,100,0,200,true);
					   }else{	
				        if(pd->showdescription) but->createhelp(strdiscardnormal,font18,0.3,100,0,200,true);
				  	   };
				       if(but) guihelpinitmagic(but);
 				      };
				     }else if(tb==strpilewasteshort){//--------------------------------------------- waste pile help description ---------------------------------
				      _tg dyit=10;
				      _iggwindow*pickhelp=but->createhelp(strpick,font18,0.3,125,0,300,true);
				      dyit=inserthelpmaximal(pickhelp,dyit,1);
				      if(but) guihelpinitmagic(but);
				     }else if(tb==strpilereserveshort){//------------------------------------------- reserve pile help description -------------------------------
					  _liste<_pilereserve> prlist;
					  _listenknoten<_pilereserve>*lnprit;
					  _listenknoten<_pilereserve>*lnprii;
					  if(gamepreview->pilereservelist.anfang(lnprit))do{//for(Local prit:_pilereserve=EachIn gamepreview->pilereservelist
					   bool exist=false;
					   if(prlist.anfang(lnprii))do{//for(Local prii:_pilereserve=EachIn prlist
					    if(lnprit->objekt()->samerule(lnprii->objekt()) exist=true;
					   }while(prlist.naechstes(lnprii));
					   if(exist==false){
					    prlist.einhaengen(prit);
					    _zeichenkette<_tt> hr=lnprit->objekt()->description0+lnprit->objekt()->description1;
					    but->createhelp(hr,font18,0.3,100,0,200,true);
					   };
					  }while(gamepreview->pilereservelist.naechstes(lnprit));
					  if(but) guihelpinitmagic(but);
				      if(prlist.anfang(lnprit))do{//for(Local pr:_pilereserve=EachIn prlist
					   buttontextlist.einhaengen(pr->description0+pr->description1);
					  }while(prlist.naechstes(lnprit));
					 }else if(tb==strpileredealshort){//-------------------------------------------- redeal pile help description --------------------------------
					  _listenknoten<_pileredeal>*lnpeit;
					  if(gamepreview->pileredeallist.anfang(lnpeit))do{//for(Local pit:_pileredeal=EachIn gamepreview->pileredeallist
					   _zeichenkette<_tt> hr=lnpeit->objekt()->description0+lnpeit->objekt()->description1;
					   but->createhelp(hr,font18,0.3,100,0,200,true);
					  }while(gamepreview->pileredeallist.naechstes(lnpeit));
					  if(but) guihelpinitmagic(but);
					 }else if(tb==strpilefreecellshort){//-------------------------------------------- freecell pile help description --------------------------------

					 }else if(tb==strpilestock){//-------------------------------------------------- talon pile help description ---------------------------------
                      _listenknoten<_pilestock>*lnpsit;
                      _listenknoten<_pilestock>*lnpsii;
					  _liste<_pilestock> pslist;
					  if(gamepreview->pilestocklist.anfang(lnpsit))do{//for(Local psit:_pilestock=EachIn gamepreview->pilestocklist
					   bool exist=false;
					   if(pslist.anfang(lnpsii))do{//for(Local psii:_pilestock=EachIn pslist
					    if(lnpsit->objket()->samerule(lnpsii->objekt())) exist=true;
					   }while(pslist.naechstes(lnpsii));
					   if(exist==false){
					    pslist.einhaengen(psit);
					    _zeichenkette<_tt> hr=lnpsit->objekt()->description0+lnpsit->objekt()->description1;
					    but->createhelp(hr,font18,0.3,100,0,300,true);
					   };
					  }while(gamepreview->pilestocklist.naechstes(lnpsit));
					  if(but) guihelpinitmagic(but);
				     };//----------------------------------------------------------------------------------------------------------------------------------
					 if(but->help){
					  but->help->visibility(false);
					  but->help->activity(false);
					  but->help->fadeopacity(0)	;
					 };				
				    };
				   };
				   if(p==0) buttonfoundation=but;
				   if(p==1) buttondiscard=but;
				   if(p==2) buttontableau=but;
				   if(p==3) buttonstock=but;
				   if(p==4) buttonwaste=but;
				   if(p==5) buttonredeal=but;
				   if(p==6) buttonreserve=but;
				   if(p==7) buttonfreecell=but;
				   if(p==8) buttonpyramid=but;
				   if(p==9) buttonlabyrinth=but;
				   if(but){
				    unsigned int ac=buttontextlist.anzahl();
				    if(ac>0){
				     _tg yitl=13;
				     unsigned int ai=0;
				     _listenknoten<_zeichenkette<_tt> >*lnzit;
				     if(buttontextlist.anfang(lnzit))do{//for(Local tab:String=EachIn buttontextlist
				      _zeichenkette<_tt>*tab=lnzit->objekt();
                      _iggimage*gi=destination->insertimage(idonut,190,yit+yitl,20,20,1,1,1,-1);
				      _liste<_zeichenkette<_tt> >*lt=textsplit(*tab,200,font18);
				      _listenknoten<_zeichenkette<_tt> >*lnzii;
				      if(lt->anfang(lnzii))do{//for(Local tit:String=EachIn lt
				       destination->inserttext(tit,210,yit+yitl,1,1,0.8,0.5,font18);
				       yitl+=off;
				      }while(lt->naechstes(lnzii));
				      lt->loeschen();
				      deletesecure(lt);
				      ai++;
				     }while(buttontextlist.naechstes(lnzit));
				     if(yitl<(off+35)) yit+=off+35; else yit+=yitl;
				    }else{
			         yit+=off+35;
				    };	
				   };
				  };
				 };
				 yit=lbyit+off+20

				 buttondemoplayplay=new _iggbutton(destination,-200,10,160,40,strdemoplay,1000);
				 buttondemoplayplay->position.add(1,0,0,true);
				 buttoninitmagic(buttondemoplayplay);
				 buttondemoplaystop=new _iggbutton(destination,-200,55,160,40,strdemostop,1000);
				 buttondemoplaystop->position.add(1,0,0,true);
				 buttoninitmagic(buttondemoplaystop);
				 destination->updatefadeopacity();
				 destination->parent->animate(0);
				 destination->animate(0);
				};
};
void _solitaire::inserthelpalteratecolor(_iggwindow*w,_tg y){
				_netz*mt;
				_iggmesh*gm;
				_tg cw=20;
				_tg ch=20;
				_tg x=180;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,tsymbolsuit[suit]);
				unsigned int suit=_zufall<unsigned int>(0,3);
				for(unsigned int i=0;i<7;i++){
				 gg.texture(tsymbolsuit[suit]):
				 if((suit==3)||(suit==0)) suit=_zufall<unsigned int>(1,2); else if((suit==1)||(suit==2)) suit=_zufall<unsigned int>(0,1)*3;
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzmultiplikativ();
				 gm=w->insertmesh(mt,x+i*cw,y,cw,ch,1,1,1,100);
				 gm->selectable=false;
				};					
};
void _solitaire::inserthelpsamesuit(_iggwindow*w,_tg y,_pile*p,bool drop){
				_netz*mt;
				_iggmesh*gm;
				_tg cw=20;
				_tg ch=20;
				_tg x=180;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,tsymbolsuit[suit]);
				unsigned int suit=_zufall<unsigned int>(0,3);
				if(drop) if(p->takeemptysuit!=-1) suit=p->takeemptysuit;
				for(unsigned int i=0;i<7;i++){
				 gg.texture(tsymbolsuit[suit]):
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzmultiplikativ();
				 gm=w->insertmesh(mt,x+i*cw,y,cw,ch,1,1,1,100);
				 gm->selectable=false;
				};					
};
void _solitaire::inserthelpothersuit(_iggwindow*w,_tg y){
				_netz*mt;
				_iggmesh*gm;
				_tg cw=20;
				_tg ch=20;
				_tg x=180;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,tsymbolsuit[suit]);
				unsigned int suit=_zufall<unsigned int>(0,3)
				for(unsigned int i=0;i<7;i++){
				 gg.texture(tsymbolsuit[suit]);
				 mt=gg.erzeugen();
				 mt->zweiseitig(true):
				 mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzmultiplikativ();
				 gm=w->insertmesh(mt,x+i*cw,y,cw,ch,1,1,1,100);
				 gm->selectable=false;
				 unsigned int oldsuit=suit;
				 do{
				  suit=_zufall<unsigned int>(0,3);
				 }while(oldsuit==suit);
				};					
};
void _solitaire::inserthelpascending(_iggwindow*w,_tg y){
				_netz*mt;
				_iggmesh*gm;
				_tg cw=20;
				_tg ch=20;
				_tg x=180;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,tsymbolsuit[suit]);
				unsigned int s=_zufall<unsigned int>(0,6);
				unsigned int j=0;
				for(unsigned int i=s;i<=s+6;i++){
				 gg.texture(tsymbolnumbersmall[i]);
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzmultiplikativ();
				 gm=w->insertmesh(mt,x+j*cw,y,cw,ch,1,1,1,100);
				 gm->selectable=false;
				 j++;
				};					
};
void _solitaire::inserthelpdescending(_iggwindow*w,_tg y){
				_netz*mt;
				_iggmesh*gm;
				_tg cw=20;
				_tg ch=20;
				_tg x=180;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,tsymbolsuit[suit]);
				unsigned int s=_zufall<unsigned int>(6,12);
				unsigned int j=0;
				for(unsigned int i=s;i>=s-6;i--){
				 gg.texture(tsymbolnumbersmall[i]);
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzmultiplikativ();
				 gm=w->insertmesh(mt,x+j*cw,y,cw,ch,1,1,1,100);
				 gm->selectable=false;
				 j++;
				};					
};
void _solitaire::inserthelpboth(_iggwindow*w,_tg y){
				_netz*mt;
				_iggmesh*gm;
				_tg cw=20;
				_tg ch=20;
				_tg x=180;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,tsymbolsuit[suit]);
				unsigned int n=_zufall<unsigned int>(0,12);
				for(unsigned int j=0;j<7;j++){
				 gg.texture(tsymbolnumbersmall[n]);
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzmultiplikativ();
				 gm=w->insertmesh(mt,x+j*cw,y,cw,ch,1,1,1,100);
				 gm->selectable=false;
				 if(n==12){
				  n=11;
				 }else if(n==0){
				  n=1;
				 }else{
				  if(_zufall<unsigned int>(0,1)==1){
				   n+=1;
				  }else{
				   n-=1;
				  };
				 };
				};					
				_iggtext*gt=w->inserttext(strbothdirections,x,y+22,1,1,0.8,0.5,font18);
				gt->selectable=false;
};
void _solitaire::inserthelpmirrored(_iggwindow*w,_tg y,_pile*p){
				_netz*mt;
				_iggmesh*gm;
				_tg cw=20;
				_tg ch=20;
				_tg x=180;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,tsymbolsuit[suit]);
				unsigned int n;
				if(p->takeascending) n=0;
				if(p->takedescending) n=12;
				for(unsigned int j=0;j<6;j++){
				 if((j!=1)&&(j!=4)){
				  if(p->takeascending){
				   if((j==2)||(j==3)){
				    n=12;
				   }else{
				    n=0;
				   };
				  };
				  if(p->takedescending){
				   if((j==2)||(j==3)){
				    n=0;
				   }else{
				    n=12;
				   };
				  };
				  gg.texture(tsymbolnumbersmall[n]);
				 }else{
				  gg.texture(tsymbolddd);
				 };
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzmultiplikativ();
				 gm=w->insertmesh(mt,x+j*(cw+4.5),y,cw,ch,1,1,1,100);
				 gm->selectable=false;
				};
				if(p->takeascending){
				 _iggtext*gt;
				 gt=w->inserttext(strafterascending,x,y+22,1,1,0.8,0.5,font18);
				 gt->selectable=false;
				 gt=w->inserttext(strfollowsdescending,x,y+22+20,1,1,0.8,0.5,font18);
				 gt->selectable=false;
				}else if(p->takedescending){
				 _iggtext*gt;
				 gt=w->inserttext(strafterdescending,x,y+22+20,1,1,0.8,0.5,font18);
				 gt->selectable=false;
				 gt=w->inserttext(strfollowsascending,x,y+22,1,1,0.8,0.5,font18);
				 gt->selectable=false;
				};
};
_tg _solitaire::inserthelpwrapped(_iggwindow*w,_tg y,_pile*p){
			 	_tg x=180;
				if(p->takeascending){
				 _iggtext*gt=w->inserttext(strmaykona,x,y,1,1,0.8,0.5,font18);y+=20;
				 gt->selectable=false;
				}else if(p->takedescending){
				 _iggtext*gt=w->inserttext(strmayaonk,x,y,1,1,0.8,0.5,font18);y+=20;
				 gt->selectable=false;
				}else if(p->takeboth){
				 _iggtext*gt=w->inserttext(strmaykona,x,y,1,1,0.8,0.5,font18);y+=20;
				 gt->selectable=false;
				 gt=w->inserttext(strmayaonk,x,y,1,1,0.8,0.5,font18);y+=20;
				 gt->selectable=false;
				};
				return(y);
};
_tg _solitaire::inserthelpmaximal(_iggwindow*w,_tg y,int m,bool empty=false){
			 	_tg x=180;
				_iggtext*gt;
				_zeichenkette<_tt> h=strmaximal+L" "+m;
				if(empty) h=stronemptypile+L" : "+h;
				gt=w->inserttext(h,x,y,1,1,0.8,0.5,font18);y+=25;
				gt->selectable=false;
				return(y);
};
_tg _solitaire::inserthelprestriction(_iggwindow*w,_tg y,bool empty=false){
				_zeichenkette<_tt> h;
				if(empty){
			 	_tg x=180;
				 _iggtext*gt;
				 h=stronemptypile+L" : ";
				 gt=w->inserttext(h,x,y,1,1,0.8,0.5,font18);
				 gt->selectable=false;
				};
				_netz*mt;
				_iggmesh*gm;
				_tg cw=20;
				_tg ch=20;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,tsymbolsuit[suit]);
			 	_tg x=180+font18->breite(h);
				gg.texture(tsymbolfine);
				mt=gg.erzeugen();
				mt->zweiseitig(true);
				mt->ausschussflaeche(false);
				mt->transparenz(true);
				mt->transparenzmultiplikativ();
				gm=w->insertmesh(mt,x,y,cw,ch,1,1,1,100);
				gm->selectable=false;
				y+=25;
				return(y);
};
void _solitaire::inserthelpsuitnumber(_iggwindow*w,_tg y,_piletableau*pt,bool empty=false){
				_zeichenkette<_tt> h;
				if(empty){
			 	 _tg x=180;
				 _iggtext*gt;
				 h=stronemptypile+L" : ";
				 gt=w->inserttext(h,x,y,1,1,0.8,0.5,font18);
				 gt->selectable=false;
				};
				_netz*mt;
				_iggmesh*gm;
				_tg cw=20;
				_tg ch=20;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),cw,ch,tsymbolsuit[suit]);
				_tg x=180+font18->breite(h);
				if(pt->takeemptysuit!=-1){
				 gg.texture(tsymbolsuit[pt->takeemptysuit]);
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzmultiplikativ();
				 gm=w->insertmesh(mt,x,y,cw,ch,1,1,1,100);x+=cw;
				 gm->selectable=false;
				};
				if(pt->takeemptynumber!=-1){
				 gg.texture(tsymbolnumbersmall[pt->takeemptynumber]);
				 mt=gg.erzeugen();
				 mt->zweiseitig(true);
				 mt->ausschussflaeche(false);
				 mt->transparenz(true);
				 mt->transparenzmultiplikativ();
				 gm=w->insertmesh(mt,x,y,cw,ch,1,1,1,100);
				 gm->selectable=false;
				};
				y+=25;					
};


//******************************************************************************************************************
//										C A M E R A S O L I T A I R E
//******************************************************************************************************************
_camerasolitaire::_camerasolitaire(){
	            curvepositiont=0;
	            curveviewt=0;
	            curvesidet=0;
	            curveupt=0;
	            curving=false;
	            curvespeed=20;
	            curvetime=0;
	            lengthview=2;
	            lengthside=1;
	            lengthup=1;
				position.setzen(0,0,-40);
				view.setzen(0,0,2);
				side.setzen(1,0,0);
				up.setzen(0,1,0);
};
_camerasolitaire::~_camerasolitaire(){
};
void _camerasolitaire::startcurve(_win::_zeit*clock,_tg spd){
				curvespeed=spd;
				curvetime=clock->system();
				curvepositiont=0;
				lengthview=view.laenge();
				lengthside=side.laenge();
				lengthup=up.laenge()
				curveviewt=0;
				curvesidet=0;
				curveupt=0;
				curving=true;
};					
void _camerasolitaire::animate(_win::_zeit*clock){
				_tg newtime=clock->system();
				_tg deltat=_tg(newtime-curvetime)/_tg(1000);
				curvetime=newtime;
				if(curving){
				 if(curvepositiont<1){
				  curveposition.calculate(curvepositiont);
				  curveside.calculate(curvesidet);
				  curveview.calculate(curveviewt);
				  curveup.calculate(curveupt);
				  _tg deltal=curvespeed*deltat;
				  _tg dt;
				  if(curveposition.laenge()<nahenull){
				   dt=1;
				  }else{ 				
				   dt=(deltal/curveposition.laenge());
				  };
				  curvepositiont+=dt;
				  curveviewt+=dt;
				  curvesidet+=dt;
				  curveupt+=dt;
				  position=curveposition.e();
				  view=curveview.e();
				  side=curveside.e();
				  up=curveup.e();
				 }else{
				  curvepositiont=0;
				  curveviewt=0;
				  curvesidet=0;
				  curveupt=0;
				  position=curveposition.ort(1);
				  view=curveview.ort(1);
				  side=curveside.ort(1);
				  up=curveup.ort(1);
				  curving=false;
				 };				  
				};				
};
void _camerasolitaire::norm(){
				_vektor3<_tg> h=view;
				h%=side;
				h%=view;
				side=h;
				view.normalisieren();
				view*=lengthview;
				side.normalisieren();
				side*=lengthside;
				up=view;
				up%=side;
				up.normalisieren();
				up*=lengthup;
};			












