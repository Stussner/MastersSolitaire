//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitaireanimation.cpp
//  Datum       : 07.12.2008
//******************************************************************************************************************************************************************************************************
#ifndef _solitaireanimation_included_
#define _solitaireanimation_included_




class _animation;
class _animationcount;
class _animationundo;
class _animationundoentry;
class _animationmove;
class _animationpiletoclear;
class _animationpseudoclear;
class _animationrotation;
class _animationcardtofreecell;
class _animationcardtofoundation;
class _animationcardtostock;
class _animationstocktopile;
class _animationpiletopile;
class _animationcardtopile;
class _animationpileturn;
class _animationpileshiftout;
class _animationpileshiftoutvertical;
class _animationpileturnvertical;
class _animationshuffle;


#include <_datei.hpp>

#include "../hpp/_solitairegame.hpp"

//******************************************************************************************************************
//										A N I M A T I O N
//******************************************************************************************************************
class _animation:public _speicherbarbinaer,public _listenknotenbasis<_animation>{
        public:
                _animation(_game*g,_tg spd,_tg intv);
                virtual ~_animation();
                void insertgame();
                void deinsertgame();
                virtual void scale(_tg f)=0;
                virtual void translate(const _vektor3<_tg>&d)=0;
                virtual void start(bool);
                virtual bool checkend();
                virtual bool checkendcount();
                virtual bool animate()=0;
                virtual void skip()=0;
                void skipcurvingcards();
                void load(_datei*d);
                void save(_datei*d);
                void assoziieren();
        public:
                _game*game;
                _tg timestart;
                _tg actiontime;
                _tg actionintervall;//ms
                _tg actionakku;
                _tg curvespeed;
                _liste<_card> curvingcardlist;
                bool started;
                bool skipable;
                bool preparative;
                bool cardinpreparationafteranimation;
                int cardcounttotal;
	            _animationcount*countiterator;
	            _listebasis<_animationcount> counts;
                _ton*soundstart;
                _ton*soundaction;
                _tg soundstartvolume;
                _tg soundactionvolume;
                bool usesoundstart;
                bool usesoundaction;
};
//******************************************************************************************************************
//										A N I M A T I O N C O U N T
//******************************************************************************************************************
class _animationcount:public _listenknotenbasis<_animationcount>{
        public:
                _animationcount(_animation*a);
                virtual ~_animationcount();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
        public:
                int value;
                int anzahl;
                int index;
                int index2;
                _tg angle;
                _vektor3<_tg> vector;
                _card*iterator;
                int iteratoroffset;
                _pile*pile;
                _card*card;
                int cardindex;
                _vektor3<_tg> position;
                _vektor3<_tg> vy;
                _vektor3<_tg> vx;
};
//******************************************************************************************************************
//										A N I M A T I O N U N D O 
//******************************************************************************************************************
class _animationundo:public _animation,public _listenknotenbasis<_animationundo>,public _listebasis<_animationundoentry>{
        public:
        //using _listenknotenbasis<_animation>::naechstes;
        //using _listenknotenbasis<_animation>::vorheriges;
        using _listenknotenbasis<_animationundo>::naechstes;
        using _listenknotenbasis<_animationundo>::vorheriges;
        using _listebasis<_animationundoentry>::naechstes;
        using _listebasis<_animationundoentry>::vorheriges;
        public:
                _animationundo(_game*g,_tg spd,_tg intv,bool r=false);
                virtual ~_animationundo();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_card*c,_pile*pt,bool firstt,int indxt,int indyt,int indzt,_pile*pf,bool firstf,int indxf,int indyf,int indzf,const _kurvehermite3<_tg>&p,const _kurvehermite3<_tg>&vx,const _kurvehermite3<_tg>&vy,bool firstinsert=false);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
                int iteratorindex();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
            	_animationundoentry*iterator;
	            bool forward;
	            bool constantsort;
	            int redealdelta;
	            _pile*redealpile;
	            //private
	            int loadproccc;
	            int loadprocii;
};
//******************************************************************************************************************
//										A N I M A T I O N U N D O E N T R Y
//******************************************************************************************************************
class _animationundoentry:public _speicherbarbinaer,public _listenknotenbasis<_animationundoentry>{
        public:
        using _listenknotenbasis<_animationundoentry>::naechstes;
        using _listenknotenbasis<_animationundoentry>::vorheriges;
        using _listenknotenbasis<_animationundoentry>::liste;
        public:
                _animationundoentry(_animationundo*u,_card*c,_pile*pt,bool firstt,int indxt,int indyt,int indzt,_pile*pf,bool firstf,int indxf,int indyf,int indzf,const _kurvehermite3<_tg>&p,const _kurvehermite3<_tg>&vx,const _kurvehermite3<_tg>&vy,bool firstinsert=false);
                virtual ~_animationundoentry();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            _animationundo*undo;
	            _card*card;
	            _pile*pileto;
	            _pile*pilefrom;
	            _card*parentfrom[2];
	            _card*childfrom[2];
	            bool firstto;
	            bool firstfrom;
	            int indexto[3];
	            int indexfrom[3];
	            _kurvehermite3<_tg> curveposition;
	            _kurvehermite3<_tg> curvevx;
	            _kurvehermite3<_tg> curvevy;
};
//******************************************************************************************************************
//										A N I M A T I O N M O V E 
//******************************************************************************************************************
class _animationmove:public _animation{
        public:
                _animationmove(_game*g,_tg px,_tg py,_tg pz,_tg spd,_tg intv,bool iv=false,bool td=false,bool vt=false);
                virtual ~_animationmove();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
        public:
	            _vektor3<_tg> target;
	            _card*iterator;//auf global cardliste des _game
	            _tg anzahl;
	            bool invers;
	            bool turndirection;
	            bool turnvertical;
};
//******************************************************************************************************************
//										A N I M A T I O N P I L E T O C L E A R
//******************************************************************************************************************
class _animationpiletoclear:public _animation{
        public:
                _animationpiletoclear(_game*g,int numb,int sui,_tg px, _tg py,_tg pz,_tg spd,_tg intv);
                virtual ~_animationpiletoclear();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_card*);
                virtual void start(bool sk=false);
                virtual bool checkend();
                virtual bool animate();
                virtual void skip();
        public:
	            _vektor3<_tg> target;
	            _animationcount*iterator;
	            _listebasis<_animationcount> counts;
	            int number;
	            int suit;
};
//******************************************************************************************************************
//										A N I M A T I O N P S E U D O C L E A R
//******************************************************************************************************************
class _animationpseudoclear:public _animation{
        public:
                _animationpseudoclear(_game*g,int numb,_tg px,_tg py,_tg pz,_tg spd,_tg intv);
                virtual ~_animationpseudoclear();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_card*);
                virtual void start(bool sk=false);
                virtual bool checkend();
                virtual bool animate();
                virtual void skip();
        public:
	            _vektor3<_tg> target;
	            int number;
};
//******************************************************************************************************************
//										A N I M A T I O N R O T A T I O N
//******************************************************************************************************************
class _animationrotation:public _animation{
        public:
                _animationrotation(_game*g,_tg px,_tg py,_tg pz,_tg a,_tg spd,_tg intv,int cc=-1,int io=0);
                virtual ~_animationrotation();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_card*c,_tg a,_vektor3<_tg> v);
                void useindex(int cardindex,_tg a,_vektor3<_tg> v);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
        public:
                _vektor3<_tg> target;
                _tg angle;
                _card*iterator;
                _tg anzahl;
                int cardcount;
                int cardcountarg;
                int iteratoroffset;
                bool entrymode;
                bool relative;
};
//******************************************************************************************************************
//										A N I M A T I O N C A R D T O F R E E C E L L 
//******************************************************************************************************************
class _animationcardtofreecell:public _animation{
        public:
                _animationcardtofreecell(_game*g,_tg spd,_tg intv);
                virtual ~_animationcardtofreecell();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_pilefreecell*pf);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
        public:
                _card*iterator;
                _liste<_pilefreecell> freecelllist;
                _listenknoten<_pilefreecell>*freecelliterator;
};
//******************************************************************************************************************
//										A N I M A T I O N C A R D T O F O U N D A T I O N 
//******************************************************************************************************************
class _animationcardtofoundation:public _animation{
        public:
                _animationcardtofoundation(_game*g,_tg spd,_tg intv);
                virtual ~_animationcardtofoundation();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_pilefoundation*pf,_card*c);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
};
//******************************************************************************************************************
//										A N I M A T I O N C A R D T O S T O C K 
//******************************************************************************************************************
class _animationcardtostock:public _animation{
        public:
                _animationcardtostock(_game*g,_pilestock*p,int c,_tg spd,_tg intv,bool il=false);
                virtual ~_animationcardtostock();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
        public:
	            _pilestock*pilestock;
	            int anzahl;
	            int actual;
	            bool inverselist;
};
//******************************************************************************************************************
//										A N I M A T I O N S T O C K T O P I L E
//******************************************************************************************************************
class _animationstocktopile:public _animation{
        public:
                _animationstocktopile(_game*g,_pilestock*p,_tg spd,_tg intv,bool rot=false);
                virtual ~_animationstocktopile();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                virtual void start(bool sk=false);
                void use(_piletableau*p,int c);
                void uselabyrinth(_pilelabyrinth*p);
                virtual bool animate();
                virtual void skip();
        public:
                _pilestock*pilestock;
                _liste<_pile> pilelist;
                bool rotate;
                _pilelabyrinth*labyrinth;
                int labindex;
                bool soundsingle;
                _piletableau*lastdoit;
};
//******************************************************************************************************************
//										A N I M A T I O N P I L E T O P I L E
//******************************************************************************************************************
class _animationpiletopile:public _animation{
        public:
                _animationpiletopile(_game*g,_liste<_card>*cl,_pile*pd,_tg spd,_tg intv,bool cu=false,bool usedx=false,bool usedy=false);
                virtual ~_animationpiletopile();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
        public:
                _pile* pilesour;
                _pile* piledest;
                _liste<_card> cardlist;
                _listenknoten<_card>*iterator;
                bool usedropvy;
                bool usedropvx;
                bool createundo;
                bool undoconstantsort;
                _animationundo*undo;
                _tg zvector;
                _tg zoffset;
                _vektor3<_tg> vector;
                _vektor3<_tg> vectortarget;
                int insertindex;
};
//******************************************************************************************************************
//										A N I M A T I O N C A R D T O P I L E
//******************************************************************************************************************
class _animationcardtopile:public _animation{
        public:
                _animationcardtopile(_game*g,_tg spd,_tg intv);
                virtual ~_animationcardtopile();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_pile*p,int c,bool t=true,bool udy=false,_card*ca=0);
                void usesweetmatch(_pilesweetmatch*p,bool t=true,bool udy=false);
                void usearray(_pilearray*p,bool t=true,bool udy=false);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
        public:
	            int cardcountarg;
	            _pilesweetmatch*sweetmatch;
	            int sweetx;
	            int sweety;
	            _pilearray*array;
	            int arrayx;
	            int arrayy;
	            bool turn;
	            bool usedropvy;
	            bool invers;
};
//******************************************************************************************************************
//										A N I M A T I O N P I L E T U R N 
//******************************************************************************************************************
class _animationpileturn:public _animation{
        public:
                _animationpileturn(_game*g,_tg spd,_tg intv);
                virtual ~_animationpileturn();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_pile*p);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
        public:
                _liste<_pile> pilelist;
	            _listenknoten<_pile>*iterator;
};
//******************************************************************************************************************
//										A N I M A T I O N P I L E S H I F T O U T 
//******************************************************************************************************************
class _animationpileshiftout:public _animation{
        public:
                _animationpileshiftout(_game*g,_tg spd,_tg intv);
                virtual ~_animationpileshiftout();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_pile*p,int c,int io=0);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
        public:
	            _liste<_pile> pilelist;
};
//******************************************************************************************************************
//										A N I M A T I O N P I L E S H I F T O U T V E R T I C A L
//******************************************************************************************************************
class _animationpileshiftoutvertical:public _animation{
        public:
                _animationpileshiftoutvertical(_game*g,_tg spd,_tg intv);
                virtual ~_animationpileshiftoutvertical();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_pile*p,int c);
                virtual void start(bool sk=false);
                virtual bool animate();
                virtual void skip();
        public:
	            _liste<_pile> pilelist;
};
//******************************************************************************************************************
//										A N I M A T I O N P I L E T U R N V E R T I C A L
//******************************************************************************************************************
class _animationpileturnvertical:public _animation{
        public:
                _animationpileturnvertical(_game*g,_tg spd,_tg intv);
                virtual ~_animationpileturnvertical();
                virtual void scale(_tg f);
                virtual void translate(const _vektor3<_tg>&d);
                void use(_pile*p,int c);
                virtual void start(bool sk=false);
                virtual bool checkendcount();
                virtual bool animate();
                virtual void skip();
        public:
	            _liste<_pile> pilelist;
};
//******************************************************************************************************************
//										A N I M A T I O N S H U F F L E 
//******************************************************************************************************************
class _animationshuffle:public _animation{
        public:
                _animationshuffle(_game*g,int t);
                virtual ~_animationshuffle();
                virtual bool animate();
        public:
                int times;
};
#endif