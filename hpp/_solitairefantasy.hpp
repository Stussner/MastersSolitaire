//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitairefantasy.hpp , Hauptmodul
//  Datum       : 15.11.2008
//******************************************************************************************************************************************************************************************************
#ifndef _solitairefantasy_included_
#define _solitairefantasy_included_


class _figuredrawentry;
class _solitairefantasy;



#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <_global.hpp>
#include <_struktur.hpp>
#include <_funktion.hpp>
#include <_text.hpp>
#include <_textbuffer.hpp>
#include <_datei.hpp>
#include <_bild.hpp>
#include <_grafikdirectx.hpp>
#include <_welt.hpp>
#include <_weltpolygon.hpp>
#include <_weltoptik.hpp>   
#include <_weltfigur.hpp>
#include <_weltmechanik.hpp>
#include <_weltkollision.hpp>
#include <_editionwin.hpp>
#include <_editionigg.hpp>

#include "../hpp/_solitaire.hpp"
#include "../hpp/_solitaireeffect.hpp"
#include "../hpp/_solitairegame.hpp"
#include "../hpp/_solitairecard.hpp"
#include "../hpp/_solitairepile.hpp"
#include "../hpp/_solitairegametype.hpp"
#include "../hpp/_solitaireanimation.hpp"
#include "../hpp/_solitairecardset.hpp"

#define WIN32_LEAN_AND_MEAN



//******************************************************************************************************************
//										F I G U R E D R A W E N T R Y
//******************************************************************************************************************
class _figuredrawentry:public _listenknotenbasis<_figuredrawentry>{
        public:
                _figuredrawentry(_solitairefantasy*s,_figure*f);
                virtual ~_figuredrawentry();
                void fadeout();
                void draw(_grafik*gra,_kamera<_tg>*cam,_to op);
                void animate();
        public:
	            _solitairefantasy*solitaire;
	            _figure*figure;
	            _to pfadeopacity;
	            _tg pfadeopacitytime;
	            bool pfadein;
	            bool pfadeout;
	            int marked;
};	 

//******************************************************************************************************************
//										S O L I T A I R E F A N T A S Y 
//******************************************************************************************************************
class _solitairefantasy:public _solitaire{
        public:
                _solitairefantasy();
                virtual ~_solitairefantasy();
                void initfinish();
				void clearscreen();
                _bild<_tb>* ladenbild(_zeichenkette<char> s,bool clamp=true);
                _textur<_tb>* ladentextur(_zeichenkette<char> s,bool clamp=true);                
                _ton*ladenton(const _zeichenkette<char>&datei);
                void drawloadscreen(bool swap=true,_to op=1);
                void drawsplashsurricate(bool swap=true,_to op=1);
                void drawsplashportal(bool swap=true,_to op=1);
                void fadeinloadscreen();
                void fadeinsplashsurricate();
                void fadeinsplashportal();
                void messageboxblack(const _zeichenkette<_tt>&t,const _zeichenkette<_tt>&tbutton,_tg ox,_tg oy,_zeichensatz*f,_bild<_tb>*iwindow);
                void messagedesktopsizetoosmall();
                void messagetrialexhausted();
                void messagetrialdeactivated();
                void generatestandardcardset(const _zeichenkette<char>&pf);
                virtual void generatestatistics();
                virtual void takestatistics(bool showhighscore);
                void setworldfieldgame();
                void setworldfieldmenu();
                bool innergamemenu();
                virtual bool animatestandard();
                virtual void animatesystem();
                virtual void animatemusic();
                virtual void animatemenu();
                virtual void animategame();
                void drawstandard();
                void drawmenu(_to op=1);//**** 9ms ?
                void drawmenubackground(_to op);
                void drawmenueffects(_to op);
                void drawmenufigure(_to op);
                void drawgame();
                void transformbackground();
                void transformbackgroundcandle();
                void transformscene();
                void getmousevectorstatic();
                void transformgame();
                void updatescene();
                _zeichenkette<char> usernamendialog(_tg ox,_tg oy);
                virtual void buttoninitmagic(_iggbutton*g,_zeichensatz*f=0,_bild<_tb>*bs=0,_bild<_tb>*bsh=0,_bild<_tb>*bl=0,_bild<_tb>*blh=0);
                void buttoninitmagicleft(_iggbutton*g);
                void buttoninitmagicright(_iggbutton*g);
                void checkboxinitmagic(_iggcheckbox*g);
                void trackbarinitmagic(_iggtrackbar*g);
                void listboxinitmagic(_igglistbox*g);
                virtual void windowinitmagic(_iggwindow*w,_bild<_tb>*i);
                void comboboxinitmagic(_iggcombobox*g);
                virtual void guihelpinitmagic(_igg*g);
                void guihelpinitmagicwindow();
                void createmenumain();
                virtual void updatemenumain();
                void createmenuuser();
                void updatelistboxuser(_igglistbox*ul,bool smallbild);
                void updatelistboxuserselection();
                void createmenuusercreate();
                void createmenucardgenerator();
                void updatemenucardgenerator(_cardset*c);
                void createmenustatistics();
                int windowstatisticsselectedtype();
                _zeichenkette<_tt> windowstatisticsselecteduser();
                void updatemenustatistics();
                void messageverlauf();
                void messagediscards();
                void createmenuranks();
                int windowranksselectedtype();
                void updatemenuranks();
                void createmenuoptionsacoustics();
                void updatefullscreenhelp();
                void createmenuoptionsgraphics();
                void createmenuoptionsgame();
                void createmenuoptionscard();
                void createmenuoptionscardfront();
                _iggcheckbox*updatemenuoptionscardcheckboxback(_liste<_iggcheckbox>*l);
                _iggcheckbox*updatemenuoptionscardcheckboxfront(_liste<_iggcheckbox>*l);
                void createmenuoptionscredits();
                void createmenuoptionsbutton(_iggwindow*w,_iggmenu*menu,int excl);
                void createmenugametype();
                void createmenugametypehelp();
                void createmenugame();
                virtual void updatemenugame();
                void updategamemenu();//--------------------- diese wird aufgerufen ------------------
                void showmenumain();
                void showmenugame();
                void showmenuoptions(_iggmenu*menu,bool fromgame,bool subfadeout);
                void activatestatusgame();
                void activatestatusmenu();
                void gamefadein();
                void gamefadeout();
                void mainloopmenugame();
                void mainloopmenugametype();
                void showmenugametype();
                void showmenugametypehelp();
                void showmenuuser();
                void mainloopmenumain();
                void mainloopmenuuser();
                void onusercreatecreate();
                void mainloopmenucardgenerator();
                void mainloopmenuoptions();
                void mainloopmenuoptionsupdatelighting();
                void mainloopmenustatistics();
                void mainloopmenuranks();
                void mainloop();
                void fadeout();
                bool checkdate();
                bool checklimitation();
        public:
	            //--------------------------------- figures ----------------------------------	
	            _figure*sister;
	            _figure*prinzessin;
	            _figure*dame;
	            _figure*ritter;
	            _figure*zauberer;
	            _figure*fee;
	            _figure*drachen;
	            _figure*koenig;
	            _figure*lehrerin;
	            _bild<_tb>*isister;
	            _bild<_tb>*iprinzessin;
	            _bild<_tb>*idame; 
	            _bild<_tb>*iritter;
	            _bild<_tb>*izauberer;
	            _bild<_tb>*ifee;
	            _bild<_tb>*idrachen;
	            _bild<_tb>*ikoenig;
	            _bild<_tb>*ilehrerin;
	            _listebasis<_figuredrawentry> figuredrawlist;
	            int figureindexold;
	            _uhr*uhr;
	            //_fireworkcards*fireworkcards;
	            _fireworkrocket*fireworkrocket;
	            _fireworkimage*fireworkimage;
	            _candle*candlegame[10];
	            _candle*candlemenu[10];
	            _smoke*smokemenu;
	            //----------------------------------- gui ------------------------------

	            unsigned int currentkey;
	            int marked;
	            int brandingstufe;//0= unbranded (nur surricate), 1= surriacte+ bigfish , 2 = 
	            _bild<_tb>* iguiwindow;
	            _bild<_tb>* igametypewindow;
	            _bild<_tb>* imessagewindow;
	            _bild<_tb>* ilistboxwindow;
	            _bild<_tb>* iverlaufwindow;
	            _bild<_tb>* ihighscorewindow;
	            _bild<_tb>* icheck;
	            _bild<_tb>* inormalrange;
	            _bild<_tb>* itrackbar;
	            _bild<_tb>* itrackbarbutton;
	            _bild<_tb>* itrackbarleft;
	            _bild<_tb>* itrackbarright;
	            _bild<_tb>* ilistboxl;
	            _bild<_tb>* iscrollbar;
	            _bild<_tb>* iscrollbarbutton;
	            _bild<_tb>* iscrollbarhorizontal;
	            _bild<_tb>* ibuttonu;
	            _bild<_tb>* ibuttonuhl;
	            _bild<_tb>* ibuttonuson;
	            _bild<_tb>* ibuttons;
	            _bild<_tb>* ibuttonshl;
	            _bild<_tb>* ibuttonsson;
	            _bild<_tb>* ibuttonm;
	            _bild<_tb>* ibuttonmhl;
	            _bild<_tb>* ibuttonmson;
	            _bild<_tb>* ibuttonl;
	            _bild<_tb>* ibuttonlhl;
	            _bild<_tb>* ibuttonlson;
	            _bild<_tb>* ibuttong;
	            _bild<_tb>* ibuttonghl;
	            _bild<_tb>* ibuttongson;
	            _bild<_tb>* icheckbox;
	            _bild<_tb>* icheckboxhl;
	            _bild<_tb>* imenubackground;
	            _bild<_tb>* imenubackgrounda;
	            _bild<_tb>* imenubackgroundl[4];
	            _bild<_tb>* imenubackgroundglow;
	            _bild<_tb>* ibuttonarrowloff;
	            _bild<_tb>* ibuttonarrowlon;
	            _bild<_tb>* ibuttonarrowroff;
	            _bild<_tb>* ibuttonarrowron;
	            _bild<_tb>* ibuttonarrowuoff;
	            _bild<_tb>* ibuttonarrowuon;
	            _bild<_tb>* ibuttonarrowdoff;
	            _bild<_tb>* ibuttonarrowdon;
	            _bild<_tb>* ilistboxbuttonup;
	            _bild<_tb>* ilistboxbuttondown;
	            _bild<_tb>* ilogo;
	            _bild<_tb>* irose;
	            _bild<_tb>* irosecredits;
	            _bild<_tb>* isplashsurricate;;
	            _bild<_tb>* isplashportal;;
	            _bild<_tb>* ilogosurricate;;
	            _bild<_tb>* ilogoportal;;
	            _bild<_tb>* idonutred;
	            _bild<_tb>* idonutgreen;
	            _bild<_tb>* idonutblue;
	            _bild<_tb>* ibuttonshadow;
	            _bild<_tb>* ibuttonshadowon;
	            _bild<_tb>* ibuttonshadowson;
	            _bild<_tb>* iblack;
	            _bild<_tb>* iframe;
	            _bild<_tb>* iframe2;
	            //---------------------------------------mainmenu
	            _tg buttonwidth;
	            _tg buttonheight;
	            _tg checkboxwidth;
	            _tg checkboxheight;
	            _tg checkboxoffy;
	            _iggbutton*buttonstart;
	            _iggtext*tmmcurgame;
	            _iggtext*tmmtime;
	            _iggwindow*windowfantasycard;
	            _iggwindow*windowfantasyscene;
	            _iggwindow*windowfantasymusic;
	            _iggbutton*buttonmenumainplay;
	            _iggbutton*buttonmenumainplayer;
	            _iggtext*textmenumainplayer;
	            _iggbutton*buttonmenumaingametype;
	            _iggbutton*buttonmenumainstatistics;
	            _iggbutton*buttonmenumainscene;
	            _iggbutton*buttonmenumainoptions;
	            _iggbutton*buttonmenumainclose;
	            _iggwindow*windowhighscore;
	            _iggtext*textmenumainhighscorename[5];
	            _iggtext*textmenumainhighscorepoints[5];
	            _iggtext*textmenumainhighscoretime[5];
	            _iggbutton*buttonmenumainhighscoreclear;
	            _iggwindow*windowstatisticsshort;
	            _iggtext*textstatisticsshortplayer;
	            _iggtext*textstatisticsshortcount;
	            _iggtext*textstatisticsshortquote;
	            _iggtext*tfarbekerzer;
	            _iggtext*tfarbekerzeg;
	            _iggtext*tfarbekerzeb;
	            _iggtext*tfarbeambienzr;
	            _iggtext*tfarbeambienzg;
	            _iggtext*tfarbeambienzb;
	            _iggtrackbar*sfarbekerzer;
	            _iggtrackbar*sfarbekerzeg;
	            _iggtrackbar*sfarbekerzeb;
	            _iggtrackbar*sfarbeambienzr;
	            _iggtrackbar*sfarbeambienzg;
	            _iggtrackbar*sfarbeambienzb;
	            _iggwindow*guihelpinitmagicw;
	            _tg guihelpinitmagicy;
};	


#endif