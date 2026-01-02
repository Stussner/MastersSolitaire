//******************************************************************************************************************************************************************************************************
//  Project     : Fantasy Solitaire
//  Library     : 
//  Module      : _solitaire.hpp
//  Date        : 14.03.2002
//  Description : 
//******************************************************************************************************************************************************************************************************

#ifndef _solitaire_included_
#define _solitaire_included_

class _solitaire;
class _watchdogspeedentry;
class _watchdogspeed;
class _sortentry;
class _previewwindow;
class _activity;
class _statusbarentry;
class _pileinfoentry;
class _camerasolitaire;

#include <_weltpolygon.hpp>
#include <_bild.hpp>
#include <_editionigg.hpp>
#include <_editionwin.hpp>
#include <_akustikopenal.hpp>
#include "../hpp/_solitairegame.hpp"
#include "../hpp/_solitaireeffect.hpp"

extern _zeichenkette<_tt> gameobjective[1000];

class _cardsetmanager;
class _animation;
/*
class _pile;

class _piletableau:public _pile,public _listenknotenbasis<_piletableau>;
class _pilecruel;
class _pileacesup;
class _pilestock;
class _pilestockpyramid;
class _pileredeal;
class _pilediscard;
class _pilewaste;
class _pilewastepyramid;
class _pilefoundation;
class _pilereserve;
class _pilefreecell;
class _pilepyramid;
class _pilebethoral;
class _pileblanket;
class _pilemaze;
class _pilearray;
class _pilelabyrinth;
class _pilesweetmatch;
*/
#include "../hpp/_solitairepile.hpp"
//******************************************************************************************************************
//										W A T C H D O G S P E E D E N T R Y
//******************************************************************************************************************
class _watchdogspeedentry:public _listenknotenbasis<_watchdogspeedentry>{
        public:
                _watchdogspeedentry(_watchdogspeed*w,_tg v);
        public:
	            _watchdogspeed*watchdogspeed;
            	_tg value;
};
//******************************************************************************************************************
//										W A T C H D O G S P E E D
//******************************************************************************************************************
class _watchdogspeed:public _listebasis<_watchdogspeedentry>{
        public:
                _watchdogspeed();
                virtual ~_watchdogspeed();
                void reset();
                unsigned int animate();
                void calculatestatistics();
                void save(_datei*d);
                void load(_datei*d);              
        public:
	            _zeit*clock;
	            bool firstanimation;
	            _tg firstanimationtime;
	            bool hintgiven;
	            _tg hintvalue;
	            _tg fpscurrent;
	            _tg fpscurrenttimeold;
                unsigned int fpscurrentcount;
	            _tg fpscurrentintervall;	
	            _tg fpsresultaverage;
	            _tg fpsresultvariance;
	            _tg fpsresultmaximum;        
};
//******************************************************************************************************************
//										S O R T E N T R Y 
//******************************************************************************************************************
class _sortentry{
        public:
                _sortentry(const _zeichenkette<_tt>&n,_tg c);
                bool vergleichen(_sortentry*e);
        public:
	            _tg criterium;
	            _zeichenkette<_tt> name;
	            bool selectable;
	            _vektor4<_to> color;
};	            
//***************************************************************************************************************
//										P R E V I E W W I N D O W 
//******************************************************************************************************************
class _previewwindow:public _igg{
        public:
                _previewwindow(_solitaire*s,_igg*pg,_tg px,_tg py,_tg pw,_tg ph,_to pr,_to pgr,_to pb);
                virtual ~_previewwindow();
                virtual void zeichnen(_grafik*gra,_kamera<_tg>*cam);
                virtual void animieren(_maus<_tg>*mau,_tastatur*tas);
                virtual void setzenstatus();
        public:
	            _solitaire*solitaire;
};
//******************************************************************************************************************
//										A C T I V I T Y
//******************************************************************************************************************
class _activity:public _listenknotenbasis<_activity>{
        public:
                _activity();
                unsigned int getdayindex();
                unsigned int getdaycountofmonth(unsigned int m,unsigned int y);
                unsigned int getminuteindex();
                bool istschaltjahr(unsigned int year);
                void load(_datei*d);
                void save(_datei*d);
        public:
	            _zeichenkette<char> date;
	            unsigned int dayindex;//nach christus
	            _zeichenkette<char> time;
	            unsigned int minuteindex;//tagesminute
};	
//******************************************************************************************************************
//										S T A T U S B A R E N T R Y
//******************************************************************************************************************
class _statusbarentry:public _listenknotenbasis<_statusbarentry>{
        public:
                _statusbarentry(_solitaire*s,const _zeichenkette<_tt>&t,_tg o=1,_tg dt=2000);
                virtual ~_statusbarentry();
                void fadeout();
                void fadein();
                void draw(_grafik*gra,_kamera<_tg>*cam);
        public:
	            _solitaire*solitaire;
            	_zeichenkette<_tt> text;
	            _to opacity;
	            _tg time;
	            bool duration;
	            _tg durationtime;
            	_to pfadeopacity;
	            _tg pfadeopacitytime;
	            bool pfadein;
	            bool pfadeout;
};
			
//******************************************************************************************************************
//										P I L E I N F O E N T R Y
//******************************************************************************************************************
class _pileinfoentry:public _listenknotenbasis<_pileinfoentry>{
        public:
                _pileinfoentry(_solitaire*s,const _zeichenkette<_tt>&n,const _zeichenkette<_tt>&d0,const _zeichenkette<_tt>&d1,_to o=1,_tg dt=100);
                virtual ~_pileinfoentry();
                void fadeout();
                void fadein();
                void draw(_grafik*gra,_kamera<_tg>*cam);
        public:
	            _solitaire*solitaire;
            	_zeichenkette<_tt>name;
	            _zeichenkette<_tt>desc0;
	            _zeichenkette<_tt> desc1;
	            _to opacity;
	            _tg time;
	            bool duration;
	            _tg durationtime;
	            _to pfadeopacity;
	            _tg pfadeopacitytime;
	            bool pfadein;
	            bool pfadeout;
};	
			
//******************************************************************************************************************
//										S O L I T A I R E
//******************************************************************************************************************
class _solitaire:public _listebasis<_speicherbarbinaer>,public _guifensterhaupt{
        public:
        using _listebasis<_speicherbarbinaer>::anfang;
        using _listebasis<_speicherbarbinaer>::naechstes;
        public:
                _solitaire();
                virtual ~_solitaire();
				HRESULT HandleModeChanges();
                void zeichnen(_guiereignisdaten*);
                void beigroesse(_guiereignisdaten*);
                void beischliessen(_guiereignisdaten*);
                void beizerstoeren(_guiereignisdaten*);
                void beimauslinksein(_guiereignisdaten*);  
                void beimausbewegung(_guiereignisdaten*);                
                void bearbeitenloeschmarkierung();
                unsigned int countstatsstoreables();
                unsigned int countanimationstoreables();
                unsigned int countcardstoreables();
                unsigned int countpilestoreables();
                unsigned int countgamestoreables();
                void ladenkurve(_datei*d,_kurvehermite3<_tg>&k);
                void speichernkurve(_datei*d,_kurvehermite3<_tg>&k);
                void getmousevector(_grafik*gra,_kamera<_tg>*cam);
                void grafikmodus(unsigned int index=5);
                void updatetextureload(const _zeichenkette<char>&shortcut,const _zeichenkette<char>&path,bool loadscreen);
                void loadstatistics(const _zeichenkette<char>&filename);
                void savestatistics(const _zeichenkette<char>&filename);
                virtual void generatestatistics();
                _gamestatsentry*createstatisticsentry();
                virtual void takestatistics(bool showhighscore);
                void adjustcamera();
                void loadoptions(const _zeichenkette<char>&filename);
                void saveoptions(const _zeichenkette<char>&filename);
                _game*newgame(unsigned int cur_game,unsigned int mode, bool prev,bool menue);
                _tg gametypechancemin(unsigned int i);
                _zeichenkette<_tt> timemstohhmmss(_tg mso);
                _liste<_zeichenkette<_tt> >*textsplit(const _zeichenkette<_tt>&t,_tg wx,_zeichensatz*f);
                void messagestatusbar(const _zeichenkette<_tt>&t,_to o=1,_tg dt=2000);
                void messagepileinfo(const _zeichenkette<_tt>&n,const _zeichenkette<_tt>&d0,const _zeichenkette<_tt>&d1,_to o=1,_tg dt=100);
                bool messagebox(const _zeichenkette<_tt>&t,const _zeichenkette<_tt>&tbutton,_tg ox,_tg oy,_zeichensatz*f,_bild<_tb>*iwindow);
                bool abfrage(const _zeichenkette<_tt>&t,const _zeichenkette<_tt>&tbutton,const _zeichenkette<_tt>&tbutton2,_tg ox,_tg oy,_zeichensatz*f,_bild<_tb>*iwindow);
                bool abfrage2z(const _zeichenkette<_tt>&t,const _zeichenkette<_tt>&t2,const _zeichenkette<_tt>&tbutton,const _zeichenkette<_tt>&tbutton2,_tg ox,_tg oy,_zeichensatz*f,_bild<_tb>*iwindow);
                bool abfragegametype(_zeichensatz*f,_bild<_tb>*iwindow);
                bool animateapplication();
                void updateopacitygamepreview(_to o);
                void initgame(unsigned int mode,bool showhighscore=true);
                void initgamepreview(unsigned int mode,unsigned int number);
                void initgamemenu(unsigned int mode,unsigned int number);
                virtual bool animatestandard()=0;
                virtual void animatesystem()=0;
                virtual void animategame()=0;
                virtual void animatemusic()=0;
                virtual void drawstandard()=0;
                virtual void drawloadscreen(bool swap=true,_to op=1)=0;
                void drawpause();
                void drawblendscreen();
                void drawgamepreviewshadowcurving(bool curving);
                void drawgamepreview(_tg pox,_tg poy);
                void drawgamemenu(_to op);
                void drawgameshadowcurving(bool curving,_to oppile=0.5,_to opglobal=0.35);
                void transformcameramenu();
                void transformcamerapreview(_tg pox,_tg poy);
                void transformgamepreview();
                void transformgamemenu();
                _candle*createcandle(_liste<_candle>*l,_tg x,_tg y,_tg z,_tg i,_tg sc,_tg sp,_listebasis<_partikel>*pl);
                _page*createpage(_textur<_tb>*tf,_textur<_tb>*tb,_textur<_tb>*tex,const _zeichenkette<_tt>&text);
                void copypagevertexcolor();
                virtual void buttoninitmagic(_iggbutton*g,_zeichensatz*f=0,_bild<_tb>*bs=0,_bild<_tb>*bsh=0,_bild<_tb>*bl=0,_bild<_tb>*blh=0)=0;
                virtual void windowinitmagic(_iggwindow*w,_bild<_tb>*i)=0;		
                virtual void guihelpinitmagic(_igg*g)=0;		
                virtual void updatemenumain()=0;
                virtual void updatemenugame()=0;
                void updatelistboxgametypesorted(_igglistbox*tl,unsigned int sel);
                void updatemenugametype();
                void updatemenugametypehelp(_igglistbox*destination,unsigned int gameindex);
                void inserthelpalteratecolor(_iggwindow*w,_tg y);
                void inserthelpsamesuit(_iggwindow*w,_tg y,_pile*p,bool drop);
                void inserthelpothersuit(_iggwindow*w,_tg y);
                void inserthelpascending(_iggwindow*w,_tg y);
                void inserthelpdescending(_iggwindow*w,_tg y);
                void inserthelpboth(_iggwindow*w,_tg y);
                void inserthelpmirrored(_iggwindow*w,_tg y,_pile*p);
                _tg inserthelpwrapped(_iggwindow*w,_tg y,_pile*p);
                _tg inserthelpmaximal(_iggwindow*w,_tg y,int m,bool empty=false);
                _tg inserthelprestriction(_iggwindow*w,_tg y,bool empty=false);
                _tg inserthelpsuitnumber(_iggwindow*w,_tg y,_piletableau*pt,bool empty=false);


        public:                
	            //------------------------------------options switches && values
	            unsigned int currentgame;
                unsigned int currentscene;
                unsigned int currentmusic;
                bool currentmusicuser;
                _tg cardslope;
                _tg cardslopepick;
                _tg cardthickness;
                _tg cardtableaulift;
                _tg naturalpiles;
                _tg cardwidth;
                _tg cardheight;
                _tg carddistance;
                _tg cardshiftfront;
                _tg cardshiftback;
                bool sparkingmouse;
                bool timeduringgame;
                bool buttonpanel;
                bool gameplaybuttons;
                bool menubuttons;
                _to menugameopacity;
                bool mouseovercard;
                bool mouseoverpile;
                bool greenboard;
                bool musicsequence;
                bool fullscreen;
                bool chimesound;
                _tg volumesound;
                _tg volumeambience;
                _tg systemperformance;
                bool systemaccellerate;
                bool fastvideomode;
                bool videosynchronisation;
                bool mybenchmark;
                bool cardanimation;
                _to cardlighting;
                unsigned int gametypesortmethod;
                _zeichenkette<_tt> lastuser;
                bool showedoptionscard;
                bool showedmenugametype;
                unsigned int usedskipanimation;
                _listebasis<_activity> activitylist;
                //game options
                bool pointandclick;
                bool pointandclickalternative;
                bool confirmonquit;
                _tg difficulty;
                bool autostart;
                bool autoturncard;
                bool autodiscard;
                bool autofoundation;
                bool autoempty;
                bool clickplayright;
                bool clickplaydouble;
                _tg autospeed;
                _tg tippspeed;
                bool cardtexturebackuser; 
                unsigned int cardtexturebackindex;
                unsigned int cardtexturefrontindex;
                unsigned int cardtexturebackcount;
                unsigned int cardtexturefrontcount;
                unsigned int musiccount;
                unsigned int scenecount;
                //----------------------------------allgemeine repräsentation
                unsigned int desktopwidth;
                unsigned int desktopheight;
                unsigned int desktopdepth;
                unsigned int desktoprate;
                
                _zeichenkette<char> datenpfad;
	            bool buttonraus;
	            bool keyraus;         
	            bool initialisiert;    
	            _tg uhrprogrammstart;   
                _vektor3<_to> sceneambient[10];
                _vektor3<_to> scenediffuse[10];
                _benutzerverwaltung*usermanagement;
                _musikverwaltung*musicman;
                //_tonverwaltung*tonverwaltung;
                unsigned int windowedmodewidth;
                unsigned int windowedmodeheight;
                unsigned int fastvideomodewidth;
                unsigned int fastvideomodeheight;
                _game*game;
                _game*gamepreview;
                _game*gamemenu;
                _gamestats**gamestats;
                _to gameopacity;
                _tg gameopacitytime;
                bool pgamefadein;
                bool pgamefadeout;
                _grafik*gra;
                _akustik*akustik;
                unsigned int graphicswidthoriginal;
                _welt*world;	
                _camerasolitaire*cam;
                _camerasolitaire*campreview;
                _camerasolitaire*cammenu;
                _vektor3<_tg> mousevector;
                _zeit*clock;
                _maus<_tg>*maus;
                _tastatur*tastatur;
                _iggsystem*iggsystem;
                _listebasis<_schatten<_tg,_to> > shadowlist;
                _listebasis<_schatten<_tg,_to> > shadowpreviewlist;
                _listebasis<_partikel> particlelistbackground;
                _listebasis<_partikel> particlegamelist;
                _listebasis<_partikel> particlemenulist;
                _listebasis<_partikelquelle> particlesourcemenulist;
                _listebasis<_partikelquelle> particlesourcegamelist;
                unsigned int current_preview;
                bool demoplay;
                _tg demoplaylasttime;
                bool gametypeactive[1000];
                _vektor2<_tg> gamepreviewrectangle[2];
                _vektor2<_tg> gamemenurectangle[2];
                //------------------------------------ statusbar data
                _bild<_tb>*iguihelp300180;
                _bild<_tb>*iguihelp51280;
                _bild<_tb>*iguihelp512111;
                _bild<_tb>*iguihelp512180;
                _bild<_tb>*iguihelp839124;
                _bild<_tb>*iguihelp85093;
                _bild<_tb>*iguihelp24389;
                _listebasis<_statusbarentry> statusbarlist;
                //------------------------------------ pileinfo 
                _listebasis<_pileinfoentry> pileinfolist;
                //------------------------------------ fonts
                _zeichensatz*font;
                _zeichensatz*font30;
                _zeichensatz*font24;
                _zeichensatz*font22;
                _zeichensatz*font20;
                _zeichensatz*font18;
                _zeichensatz*font16;
                _zeichensatz*font14;
                _zeichensatz*font10;
                _zeichensatz*fontj;
                _zeichensatz*fontarial18;
                _zeichensatz*fontarial16;
                //----------------------------------allgemeine daten
                _ton*sgong;
                _ton*smove;
                _ton*sturn;
                _ton*scardsingle;
                _ton*sspend;
                _ton*sturnsmooth;
                _ton*ssingle;
                _ton*sexplosion[5];
                _ton*sfireplace;
                _ton*spendulum;
                _ton*suhrschlag0;
                _ton*suhrschlagstunde;
                _ton*sspark;
                _vektor2<_tg> mouse;
                bool mousebutton[2];
                _cardsetmanager*cardsetmanager;
                _textur<_tb>*tcard[54];
                _textur<_tb>*tcardpreview[20][4];
                _textur<_tb>*tcardspecular;
                _textur<_tb>*tempty;
                _textur<_tb>*temptykey;
                _textur<_tb>*tsymbolsuit[4];
                _textur<_tb>*tsymbolsuitrand[4];
                _textur<_tb>*tsymbolnumber[13];
                _textur<_tb>*tnumber[10];
                _textur<_tb>*tsymbolnumbersmall[13];
                _textur<_tb>*tnumbersmall[10];
                _textur<_tb>*tsymbolfine;
                _textur<_tb>*tsymbolddd;
                _textur<_tb>*tblume;
                _textur<_tb>*tblase;
                _textur<_tb>*tcardback[50];
                _textur<_tb>*tshadow;
                _textur<_tb>*tshadowblock;
                _textur<_tb>*tshadow16;
                //---------------------------------effekte
                _page*pickedpage;
                _textur<_tb>*tfeuer;
                _textur<_tb>*tfeuer2;
                _textur<_tb>*tfeuer3;
                _textur<_tb>*tfeuer4;
                _textur<_tb>*tfeuer5;
                _textur<_tb>*tfeuer6;
                _textur<_tb>*tfeuercandle;
                _textur<_tb>*tcorona;
                _textur<_tb>*tcoronared;
                _textur<_tb>*tcoronablue;
                _textur<_tb>*tcoronawhite;
                _textur<_tb>*tsmoke[10];
                _textur<_tb>*tfunken[10];
                _textur<_tb>*tdigit;
                _textur<_tb>*tdigits;
                _textur<_tb>*tdigith;
                _textur<_tb>*tpendulum;
                _textur<_tb>*tbackgroundgamea;
                _textur<_tb>*tbackgroundgamel;
                _bild<_tb>*ibackgroundgame[100];
                _vektor4<_to> backgroundcolor;
                _bild<_tb>*ibackground;
                _background*background;
                _kamin2*kamin;
                _liste<_animation> animationlist;
                _listebasis<_page> pagelist;
                _listebasis<_candle> candlelist;
                _liste<_candle> candlegamelist;
                _liste<_candle> candlemenulist;
                _bild<_tb>*icandleholdermenu;
                _bild<_tb>*icandleholdergame;
                //------------------------------------ load screen
                _bild<_tb>*iloadscreen;
                _to blendscreenopacity;
                _bild<_tb>*blendscreen;
                _tg starttimepause;
                //------------------------------------ pause data
                bool paused;
                _to pauseopacity;
                _tg gamedelaytime;	
                //-----
                _to blackscreenopacity;
                _to blackscreentransparency;
                //-----
                bool showfps;
                int showfpsstatus;
                //----------------------------------------menues
                _iggmenumanagement*menuman;
                _iggmenu*menumain;
                _iggmenu*menuoptionslast;
                _to menuopacity;
                _to menuopacity2;
                _vektor3<_tg> menucameraposition;
                _tg messageboxadditiontextwidth;
                _tg messageboxadditiontexty;
                _tg messageboxadditionbuttony;
                _tg messageboxbuttonwidth;
                _tg messageboxbuttonheight;
                _vektor4<_to> messageboxtextcolor;
                _tg messageboxtextz;
                _liste<_iggtrackbar> trackbarlist;
                _liste<_iggcheckbox> checkboxlist;
                _liste<_igglistbox> listboxlist;
                _liste<_iggeditbox> editboxlist;
                bool optionscalledfromgame;
                //------------------------------------ watchdog speed
                _watchdogspeed*watchdogspeed;
                //------------------------------------------ FPS
                _zeichenkette<_tt> fpstext;
                _tg fpstimeold;
                unsigned int fpscount;
                //-------------------------------------------audio/video options
                _iggmenu*menuoptionsacoustics;
                _iggbutton*buttonoptionsacousticsmainmenu;
                _iggwindow*windowoptionsacoustics;
                _iggtext*ttitleacoustics;
                _iggtext*tva;
                _iggtext*tvs;
                _iggtext*tvm;
                _iggtext*tms;	
                _iggtext*tsp;
                _iggtext*tfv;
                _iggtext*tsy;
                _iggtext*tmb;
                _iggtext*tfs;
                _iggtrackbar*tbva;
                _iggtrackbar*tbvs;
                _iggtrackbar*tbvm;
                _iggcheckbox*cbms;
                _iggtrackbar*tbsp;
                _iggcheckbox*cbsp;
                _iggcheckbox*cbfv;
                _iggcheckbox*cbsy;
                _iggcheckbox*cbmb;
                _iggcheckbox*cbfs;
                //----------------------------------------------game options
                _iggmenu*menuoptionsgame;
                _iggbutton*buttonoptionsgamemainmenu;
                _iggwindow*windowoptionsgame;
                _iggtext*ttitlegame;
                _iggtext*tgpc;
                _iggtext*tgpa;
                _iggtext*tgcq;
                _iggtext*tgdi;
                _iggtext*tgaa;
                _iggtext*tgas;
                _iggtext*tgat;
                _iggtext*tgad;
                _iggtext*tgaf;
                _iggtext*tgae;
                _iggtext*tgcr;
                _iggtext*tgcd;
                _iggtext*tgav;
                _iggcheckbox*cbgpc;
                _iggcheckbox*cbgpa;
                _iggcheckbox*cbgcq;
                _iggtrackbar*tbgdi;
                _iggcheckbox*cbgas;
                _iggcheckbox*cbgat;
                _iggcheckbox*cbgad;
                _iggcheckbox*cbgaf;
                _iggcheckbox*cbgae;
                _iggcheckbox*cbgcr;
                _iggcheckbox*cbgcd;
                _iggtrackbar*tbgav;
                //-------------------------------------------graphic options
                _iggmenu*menuoptionsgraphics;
                _iggbutton*buttonoptionsgraphicsmainmenu;
                _iggwindow*windowoptionsgraphics;
                _iggtext*ttitlegraphics;
                _iggtext*tgrtd;
                _iggtext*tgrlp;
                _iggtext*tgrgp;
                _iggtext*tgrmb;
                _iggtext*tgrgo;
                _iggtext*tgrca;
                _iggtext*tgrnp;
                _iggtext*tgrmo;
                _iggtext*tgrmp;
                _iggtext*tgrgr;
                _iggtext*tgrsm;
                _iggtext*tgrcs;
                _iggtext*tgrct;
                _iggtext*tgrcl;
                _iggtext*tgrcw;
                _iggtext*tgrch;
                _iggtext*tgrci;
                _iggcheckbox*cbgrtd;
                _iggcheckbox*cbgrlp;
                _iggcheckbox*cbgrgp;
                _iggcheckbox*cbgrmb;
                _iggtrackbar*tbgrgo;
                _iggcheckbox*cbgrca;
                _iggtrackbar*tbgrnp;
                _iggcheckbox*cbgrmo;
                _iggcheckbox*cbgrmp;
                _iggcheckbox*cbgrgr;
                _iggcheckbox*cbgrsm;
                _iggtrackbar*tbgrcs;
                _iggtrackbar*tbgrct;
                _iggtrackbar*tbgrcl;
                _iggtrackbar*tbgrcw;
                _iggtrackbar*tbgrch;
                _iggtrackbar*tbgrci;
                _iggbutton*buttonoptionsgraphicslightbright;
                _iggbutton*buttonoptionsgraphicslightmedium;
                _iggbutton*buttonoptionsgraphicslightnatural;
                _iggbutton*buttonoptionsgraphicslightnight;
                //----------------------------------------cards && decks options
                _iggmenu*menuoptionscard;
                _iggbutton*buttonoptionscardmainmenu;
                _iggwindow*windowoptionscard;
                _iggtext*ttitlecard;
                _iggtext*ttitleback;
                _iggtext*ttitledeck;
                _igglistbox*lbcardtexture;
                _igglistbox*lbdecktexture;
                _liste<_iggcheckbox> checkboxoptionscardbacklist;
                _liste<_iggcheckbox> checkboxoptionscardfrontlist;
                _liste<_iggbutton> buttonoptionscardchangefrontlist;
                _liste<_iggbutton> buttonoptionscardchangebacklist;
                //----------------------------------------cards front options (first)
                _iggmenu*menuoptionscardfront;
                _iggbutton*buttonoptionscardfrontnext;
                _iggwindow*windowoptionscardfront;
                _iggtext*titleoptionscardfront;
                _igglistbox*listboxoptionscardfront;
                //---------------------------------------------- credits
                _iggmenu*menuoptionscredits;
                _iggbutton*buttonoptionscreditsmainmenu;
                _iggwindow*windowoptionscredits;
                //------------------------------------------------game menu
                _iggmenu*menugame;
                _iggwindow*windowgamemenu;
                _iggbutton*buttongamerules;
                _iggbutton*buttongamenew;
                _iggbutton*buttontipp;
                _iggbutton*buttonauto;
                _iggbutton*buttonundo;
                _iggbutton*buttonredo;	
                _iggbutton*buttongamemainmenu;
                _iggbutton*buttongameoptions;
                _iggbutton*buttongamesave;
                _iggbutton*buttongameload;
                _iggtext*tgmcurgame;
                _iggtext*tgmtime;
                _iggtext*tgmscore;
                _liste<_iggbutton> bottombuttons;
                //-----------------------------------------------scene menu
                _iggmenu*menuscene;
                _iggbutton*buttonscenemainmenu;
                _iggwindow*windowscene;
                _iggtext*ttitlescene;
                _igglistbox*lbscene;
                _liste<_iggcheckbox> checkboxscenelist;
                //-----------------------------------------------user menu
                _iggmenu*menuuser;
                _iggbutton*buttonusermainmenu;
                _iggbutton*buttonusercreate;
                _iggbutton*buttonuseredit;
                _iggbutton*buttonuserdelete;
                _iggwindow*windowuser;
                _iggtext*windowusertitle;
                _igglistbox*windowuserlist;
                //-----------------------------------------------user create menu
                _iggmenu*menuusercreate;
                _iggbutton*buttonusercreatecreate;
                _iggbutton*buttonusercreatecancel;
                _iggwindow*windowusercreate;
                _iggtext*windowusercreatetitle;
                _iggtext*windowusercreatetitle1;
                _iggtext*windowusercreatetitle2;
                _igglistbox*windowusercreateimagelist;
                _iggeditbox*windowusercreatename;
                unsigned int menuusercreatefrom;
                //-----------------------------------------------cardgenerator menu
                _iggmenu*menucardgenerator;
                _liste<_iggmesh> cardgeneratormeshfrontlist;
                _liste<_iggmesh> cardgeneratormeshbacklist;
                _iggbutton*cardgeneratorbuttonback;
                _iggbutton*cardgeneratorbuttonreset;
                _iggwindow*cardgeneratorwindow;
                _iggtext*cardgeneratortexttitle;
                _iggtext*cardgeneratortextground;
                _igglistbox*cardgeneratorlistboxground;
                _iggcheckbox*cardgeneratorcheckboxgroundstructurebehind;
                _igglistbox*cardgeneratorlistboxgroundstructure;
                _iggtrackbar*cardgeneratortrackbargroundstructure;
                _iggtext*cardgeneratortextframe;
                _iggtext*cardgeneratortextframenumber;
                _iggtext*cardgeneratortextframepicture;
                _iggtext*cardgeneratortextframebackside;
                _iggtrackbar*cardgeneratortrackbarframenumber;
                _iggtrackbar*cardgeneratortrackbarframepicture;
                _iggtrackbar*cardgeneratortrackbarframebackside;
                _igglistbox*cardgeneratorlistboxframe;
                _igglistbox*cardgeneratorlistboxframestructure;
                _iggtrackbar*cardgeneratortrackbarframestructure;
                _iggtext*cardgeneratortextimpurity;
                _igglistbox*cardgeneratorlistboximpurity;
                _iggtrackbar*cardgeneratortrackbarimpurity;
                _iggtrackbar*cardgeneratortrackbarimpurityyellowing;
                _iggtrackbar*cardgeneratortrackbarimpurityscratchs;
                //-----------------------------------------------statistics menu
                _iggmenu*menustatistics;
                _iggbutton*buttonstatisticsmainmenu;
                _iggbutton*buttonstatisticsranks;
                _iggwindow*windowstatistics;
                _iggtext*windowstatisticstypetitle;
                _igglistbox*windowstatisticstypelist;
                _iggcombobox*windowstatisticssortbox;
                _iggtext*windowstatisticstypehigh[5];
                _iggtext*windowstatisticstypecounttext;
                _iggtext*windowstatisticstypequotetext;
                _iggtext*windowstatisticstypetimetext;
                _iggtext*windowstatisticstypediscardtext;
                _iggtext*windowstatisticstypemovestext;
                _iggtext*windowstatisticstypecount;
                _iggtext*windowstatisticstypequote;
                _iggtext*windowstatisticstypetime;
                _iggtext*windowstatisticstypediscard;
                _iggtext*windowstatisticstypemoves;
                _iggbutton*windowstatisticstypeclear;
                _iggbutton*windowstatisticstypereset;
                _iggbutton*windowstatisticstyperanks;
                _igglistbox*windowstatisticsuserlist;
                _iggtext*windowstatisticsusertitle;
                _iggtext*windowstatisticsusercounttext;
                _iggtext*windowstatisticsuserquotetext;
                _iggtext*windowstatisticsusertimetext;
                _iggtext*windowstatisticsuserdiscardtext;
                _iggtext*windowstatisticsusermovestext;
                _iggtext*windowstatisticsusercount;
                _iggtext*windowstatisticsuserquote;
                _iggtext*windowstatisticsusertime;
                _iggtext*windowstatisticsuserdiscard;
                _iggtext*windowstatisticsusermoves;
                _iggbutton*windowstatisticsuserthisclear;
                _iggbutton*windowstatisticsuserotherclear;
                _iggbutton*windowstatisticsuserverlauf;
                _iggbutton*windowstatisticsuserverlaufdiscards;
                _iggtext*ttitlestatistics;
                //-----------------------------------------------ranks menu
                _iggmenu*menuranks;
                _iggbutton*buttonranksmainmenu;
                _iggbutton*buttonranksstatistics;
                _iggwindow*windowranks;
                _iggtext*windowrankstitle;
                _igglistbox*windowrankstypelist;
                _iggcombobox*windowrankssortbox;
                _iggtext*windowrankstypehigh[5];
                _igglistbox*windowranksranklist;
                //---------------------------------------------------game class menu
                _iggmenu*menugametype;
                _iggbutton*buttongametypemainmenu;
                _iggbutton*buttongametypestart;
                _iggwindow*windowgametype;
                _iggtext*current;
                _igglistbox*typelist;
                _igglistbox*desclist;
                _iggcombobox*sortbox;
                _previewwindow*previewwindow;
                _bild<_tb>*idonut;
                //---------------------------------------------------game class help menu
                _iggmenu*menugametypehelp;
                _iggbutton*buttongametypehelpback;
                _iggwindow*windowgametypehelp;
                _iggtext*windowgametypehelptitle;
                _igglistbox*windowgametypehelplist;
                _previewwindow*windowgametypehelppreviewwindow;
                //----------------------------------------------------game class help shared, temporary buttons
                _iggbutton*buttondemoplayplay;
                _iggbutton*buttondemoplaystop;
                _iggbutton*buttonfoundation;
                _iggbutton*buttondiscard;
                _iggbutton*buttontableau;
                _iggbutton*buttonstock;
                _iggbutton*buttonwaste;
                _iggbutton*buttonredeal;
                _iggbutton*buttonreserve;
                _iggbutton*buttonfreecell;
                _iggbutton*buttonpyramid;
                _iggbutton*buttonlabyrinth;
                _vektor3<_to> farbekerze;
                _vektor3<_to> farbeambienz;
};                

//******************************************************************************************************************
//										C A M E R A S O L I T A I R E
//******************************************************************************************************************
class _camerasolitaire:public _kamera<_tg>{
        public:
                _camerasolitaire();
                virtual ~_camerasolitaire();
                void startcurve(_win::_zeit*clock,_tg spd);
                void animate(_zeit*clock);
                void norm();  
        public:
	            _kurvehermite3<_tg> curveposition;
	            _kurvehermite3<_tg> curveview;
	            _kurvehermite3<_tg> curveside;
	            _kurvehermite3<_tg> curveup;
	            _tg curvepositiont;
	            _tg curveviewt;
	            _tg curvesidet;
	            _tg curveupt;
	            bool curving;
	            _tg curvespeed;
	            int curvetime;
	            _tg lengthview;
	            _tg lengthside;
	            _tg lengthup;
};	

#endif