//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitairecard.hpp
//  Datum       : 29.11.2008
//******************************************************************************************************************************************************************************************************
#ifndef _solitairecard_included_
#define _solitairecard_included_

class _cardsmoke;
class _cardfire;
class _card;

#include <_global.hpp>
#include <_struktur.hpp>
#include <_datei.hpp>
#include <_grafik.hpp>
#include <_weltpolygon.hpp>
//#include <_solitairefantasy.hpp>
class _solitaire;
class _game;
class _pile;
class _pilearray;
class _pilelabyrinth;
class _pilesweetmatch;

//******************************************************************************************************************
//										C A R D S M O K E
//******************************************************************************************************************
class _cardsmoke:public _partikelquelle{
        public:
                _cardsmoke(_solitaire*s,_cardfire*cf);
                virtual ~_cardsmoke();
                virtual void animieren();
                virtual _partikel*erzeugenpartikel(const _vektor3<_tg>&pos);
                virtual void generieren();
        public:
	            _card*card;
	            _cardfire*cardfire;
	            _solitaire*solitaire;
	            _tg pumptime;
	            int pumpup;
	            int pumpgenrate;
	            int pumplifetime;
	            _tg pumpdeathfactor;
	            _tg rotfac;
	            _tg offsetrnd;
	            _netz*m;
	            _netz*m2;
};

//******************************************************************************************************************
//										C A R D F I R E
//******************************************************************************************************************
class _cardfire:public _partikelquelle{
        public:
                _cardfire(_solitaire*s,_card*c);
                virtual ~_cardfire();
                void activate();
                virtual void animieren();
                virtual _partikel*erzeugenpartikel(const _vektor3<_tg>&pos);
                virtual void generieren();
                void generateburnpoints(const _vektor2<_tg>&para);
                void animateburnpoints();
                void drawburnpoints();
                void setopacity(_to op);
        public:
                _card*card;
	            _solitaire*solitaire;
	            _tg pumptime;
	            int pumpup;
	            int pumpgenrate;
	            int pumplifetime;
	            _tg pumpdeathfactor;
	            _tg rotfac;
	            _tg offsetrnd;
	            _tg burnpoint[20*4];
	            int burnpointcount;
	            int burncounter;
	            int burnstatus;
	            _tg burnfactor;
	            _to burnopacity;
	            _to*deltamap;
	            _to*texturemap;
	            _vektor2<_tg> positionshift;
	            _vektor3<_tg> positionold;
	            _vektor3<_tg> firevector;
	            _cardsmoke*smoke;
	            _netz*m;
	            _netz*m2;
	            _netz*m4;
};
//******************************************************************************************************************
//										C A R D 
//******************************************************************************************************************
class _card:public _speicherbarbinaer,public _listenknotenbasis<_card>{
        public:
        using _listenknotenbasis<_card>::naechstes;
        using _listenknotenbasis<_card>::vorheriges;
        using _listenknotenbasis<_card>::liste;
        public:
                _card(_solitaire*s,_game*g,int su,int n,_tg px=0,_tg py=-30);
                _card(_card*c);
                virtual ~_card();
                void copy(_card*c);
                void copytexture();
                void cleareffects();
                void clearshadow();
                void createshadow();
                void updateshadow();
                void discard(bool beth=false);
                int index();
                bool canturn();
                bool canpick();
                void pick();
                void depick(_tg tz=0);
                void deinsertforblow();
                void insertblow(_game*g);
                void deinsertblow();
                void insertpile(_pile*p,bool first=false,int asindex=0);
                void deinsertpile();
                void insertgame();
                void deinsertgame();
                void insertpick();
                void deinsertpick();
                void insertpyramid(_card*p0,_card*p1,_card*c0,_card*c1);
                void deinsertpyramid();
                void insertlabyrinth(_pilelabyrinth*l,int fx,int fy);
                void deinsertlabyrinth();
                void insertsweetmatch(_pilesweetmatch*l,int fx,int fy);
                void deinsertsweetmatch();
                void insertarray(_pilearray*l,int fx,int fy);
                void deinsertarray();
                _polygon*polygon();
                void draw(_grafik*gra,_kamera<_tg>*cam);
                void startcurve();
                void animatecurve();
                void animatenaturality();
                void animateangle();
                void animatephysics();
                void animate();
                bool vergleichen(_card*c);
                bool turnedup();
                bool turnedupatcurveend();
                void turn(_tg spd=15,bool useundo=true);
                void normcardplane();
                void normcardplanetransformed(_vektor3<_tg>&vvx,_vektor3<_tg>&vvy,_vektor3<_tg>&n);
                void updatevertexarray();
                void updatemesh();
                bool inner();
                bool innerline(const _vektor3<_tg>&o,const _vektor3<_tg>&v,_vektor2<_tg>&para);
                bool innercard(_card*c);
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            _solitaire*solitaire;
	            _game*game;
	            _listenknoten<_card>*picklink;
	            _listenknoten<_card>*blowlink;
	            _pile*pile; 				        // cardstack of which card is part
	            //Field pilelink:TLink=0;			// link in cardpile cards list; used for(various cards move operations
	            bool visible;   					// true if(card is visible on screen
	            int suit;  	    				// card suit (color)
	            int number; 					    // card number, symbol (0-12, 0=ACE, 12=KING)
	            _card*parent[2];				    // pyramid pointers to parents 
	            _card*child[2];				        // pyramid pointers to childs
	            _pilelabyrinth*labyrinth;           // labyrinth pointer
	            int labindex[2];					// x,y-field indices for(the labyrinthpile
	            _pilesweetmatch*sweetmatch;         // sweetmatchpile pointer
	            int sweetindex[2];					// x,y-field indices for(the sweetmatchpile
	            bool sweetblocked;      			// if(true, this card is an blocked field like in jewel match
	            _pilearray*array;                   // sweetmatchpile pointer
	            int arrayindex[2];		 		    // x,y-field indices for(the sweetmatchpile
	            _netz*mesh;
	            _vektor3<_tg> position;
	            _vektor3<_tg> vx;
	            _vektor3<_tg> vy;
	            _vektor3<_tg> vektor;
	            _vektor3<_tg> rollvector;
	            _kurvehermite4<_to> colorcurve;
	            _tg timephysicslast;
	            _tg timephysicsstart;
	            bool dynamictexture;
	            bool backsided;
            	
	            _tg rotation;    				    //actual, displayed && performed rotation value
	            _tg rotationmust;				    //the value that should be matched
	            _tg rotationvector;
	            _tg rotationvelocity;
	            _tg rotationfriction;
	            _tg rotmatrix[3][3];
	            _tg rotationold;

	            _tg angle;  					    //actual, displayed && performed angle value
	            _tg anglemust;  				    //the value that should be matched
	            _tg anglevector;
	            _tg anglevelocity;
	            _tg anglefriction;

	            _vektor2<_tg> shift;    		    //actual, displayed && performed shift, is along x && y , not z
	            _vektor2<_tg> shiftmust;
	            _vektor2<_tg> shiftvector;
	            _tg shiftvelocity;
	            _tg shiftfriction;
            	
	            _tg neigungx;
	            bool neigungactive;
	            _to opacity;
	            int opacityquant;
            	
	            //Field shadowlist:TList=0	
	            _schatteneinfach<_tg,_to>*shadowarray[10];
	            int shadowarraycount;
            						
	            _kurvehermite3<_tg> curveposition;
	            _kurvehermite3<_tg>  curvevx;
	            _kurvehermite3<_tg>  curvevy;
	            _tg curvepositiont;
	            _tg curvevxt;
	            _tg curvevyt;
	            bool curving;
	            _tg curvespeed;
	            _tg curvetime;
            	
	            bool inpreparation;

	            _tg clicktime;
	            bool clickleft;
	            bool doubleclicked;
            	
	            bool picked;
	            _vektor3<_tg> pickposition;
	            _vektor3<_tg> pickvx;
	            _vektor3<_tg> pickvy;
	            bool pickending;
            	
	            //tipp elements, not for(storages
	            _kurvehermite1<_to> curveopacity;
	            _card*cardcontrolopacity;
            	
	            //effekt
	            _cardfire*fire;
	            bool fireinner;
	            _tg fireakku;
	            _tg fireakkustart;
            	
	            //optimierung
	            _verbindervertexpolygon*verbinder[4];
	            _vertex*vertex[4];
	            _polygon*poly;
	            _vektor3<_tg> hvh;
	            _vektor3<_tg> hvk;
	            _vektor3<_tg> hvn;
	            _vektor3<_tg> hvnold;
	            _vektor3<_tg> hvp;
	            _vektor3<_tg> hvvvx;
	            _vektor3<_tg> hvvvy;
	            _vektor3<_tg> hvpold;
	            _vektor3<_tg> hvvvxold;
	            _vektor3<_tg> hvvvyold;
	            _vektor3<_tg> hvrvx;
	            _vektor3<_tg> hvrvy;
	            bool meshchanged;
	            _tg meshchangedlasttime;

	            //old fields, not used
	            bool isfloating;
	            bool imgidx;
	            bool ordr;
	            bool forced;
	            bool mark;
	            bool selected;
	            bool hovered;
};

#endif