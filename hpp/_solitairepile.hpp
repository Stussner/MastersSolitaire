//******************************************************************************************************************************************************************************************************
//  Project     : Fantasy Solitaire
//  Library     : 
//  Module      : _solitairepile.hpp
//  Date        : 14.03.2002
//  Description : 
//******************************************************************************************************************************************************************************************************

#ifndef _solitairepile_included_
#define _solitairepile_included_


class _pile;
class _piletableau;
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

#include <_struktur.hpp>
#include <_vektor.hpp>
#include <_text.hpp>
#include <_weltpolygon.hpp>
#include <_weltgeometrie.hpp>


#include "../hpp/_solitairegame.hpp"
#include "../hpp/_solitairestrings.hpp"
#include "../hpp/_solitairecard.hpp"
#include "../hpp/_solitaireanimation.hpp"

class _blase;
//******************************************************************************************************************
//										P I L E
//******************************************************************************************************************
class _pile:public _speicherbarbinaer,public _listenknotenbasis<_pile>,public _listebasissortierung<_card>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        using _listebasissortierung<_card>::einhaengen;
        using _listebasissortierung<_card>::loeschen;
        
        public:
                _pile(_game*g,_tg px,_tg py);
                virtual ~_pile();
                void clearshadow();
                virtual void opacity(_to o);
                virtual void createshadow();
                void createshadowstripe();
                void createshadowblock();
                void updateshadowstripe();
                void updateshadowblock();
                bool silhouette(_schatten<_tg,_to>*sit,const _vektor3<_tg>&km,const _vektor3<_tg>&n0,const _vektor3<_tg>&n1);
                void project(_vertex*v,_schatten<_tg,_to>*sit,_vektor3<_tg>&p);
                virtual void updateshadow();
                void updatevertexarray();
                void updatemesh();
                bool vergleichen(_pile*p);
                bool samerule(_pile*p);
                int cardcount();
                virtual void turncard(_zeit*clock,int index);
                virtual void turn(_card*c,_tg spd,bool useundo);
                virtual bool canturn(_card*c);
                _card*card(int index);
                bool nocardcurving();
                bool cardcurving();
                void drawshadow(_grafik*gra,_kamera<_tg>*cam);
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                void show();
                void drawshow(_grafik*gra,_kamera<_tg>*cam);
                void updatecardmesh();
                virtual void updatedescription();
                virtual bool inner(bool withcards=true);
                virtual bool innercard(_card*c);
                bool takeruleset();
                bool takeemptyruleset();
                bool giveruleset();
                virtual void pickslopeplane(_card*c,_vektor3<_tg>&vvx,_vektor3<_tg>&vvy);
                virtual void pickslopeposition(_card*c,_vektor3<_tg>&p);
                virtual void pickslopeplanearc(_card*c,_vektor3<_tg>&vvx,_vektor3<_tg>&vvy);
                virtual void pickslopepositionarc(_card*c,_vektor3<_tg>&p);
                bool nextcardinsequence(_card*cf);
                virtual bool canpick(_card*c)=0;
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                int pickrowlengthfromfirst();
                virtual bool candrop(_liste<_card>*list,bool samesuit=false)=0;
                virtual _vektor3<_tg> dropposition(bool backdrop=false);
                virtual _vektor3<_tg> droppositionvector(bool backdrop=false);
                virtual _vektor3<_tg> droppositionarc(bool backdrop=false);
                virtual _vektor3<_tg> dropvy();
                virtual _vektor3<_tg> dropvx();
                virtual _vektor3<_tg> dropvxarc();
                virtual _vektor3<_tg> dropvyarc();
                virtual void drop();
                virtual void adjustcardposition();
                virtual void adjustcardpositionvector();
                virtual void adjustcardpositionarc(bool always=false);
                virtual void adjustcardvy();
                virtual void adjustcardvx();
                virtual void adjustcardvxsingle();
                virtual void setangle(_card*c);
                virtual void setanglearc(_card*c);
                virtual void adjustcardvxarc(bool always=false);
                virtual void adjustcardvyarc(bool always=false);
                virtual void animatemouseovercardarc();
                void animatestretch();
                virtual void animate(_zeit*clock)=0;
                virtual void animatepileinfo();
                virtual void animateinput();
                void animatetableaufill();
                virtual void save(_datei*d)=0;
                void savepile(_datei*d);
                virtual void load(_datei*d)=0;
                void loadpile(_datei*d);
                virtual void assoziieren()=0;

        public:
                _game*game;
                _vektor3<_tg> position;//its the postion of the last card in list
                _vektor3<_tg> positionfirst;//position of the first element (real)
                _vektor3<_tg> positionfirstunstretched;//position of the first card (unstretched)

                bool camerastretch;
                _tg stretchfactor;
                _tg stretch;
                _tg stretchvector;
                _tg stretchhaerte;
                _tg stretchfriction;
                _tg maximumlength;

                _tg radiusx;
                _tg radiusy;
                _tg anglestep;
                _netz*mesh;
                _netz*meshsuit;
                _netz*meshnumber;
                _polygon*polygon;
                _polygon*polygonsuit;
                _polygon*polygonnumber;
                _vertex*vertex[4];
                _vertex*vertexsuit[4];
                _vertex*vertexnumber[4];
                _vektor3<_tg> vector;
                bool nopickifcardcurving;
                bool discardcount;

                bool giverestriction;
                bool giverestrictionfreecell;
                bool givesamesuit;
                bool giveothersuit;
                bool givealteratecolor;
                bool givedescending;
                bool giveascending;
                int givemaximal;

                bool takerestriction;
                bool takesamesuit;
                bool takeothersuit;
                bool takealteratecolor;
                bool takeascending;
                bool takedescending;
                bool takeboth;
                bool takewrapped;
                bool takemirrored;
                int takeemptysuit;
                int takeemptynumber;
                int takeemptymaximal;
                bool takeemptyrestriction;
                int takemaximal;

                bool tableaufill;
                int redealvalue;
                int redealcount;

                bool showdescription;
                bool drawownshadow;
                _liste<_schatten<_tg,_to> > shadowlist;
                _zeichenkette<_tt> name;
                _zeichenkette<_tt> description0;
                _zeichenkette<_tt> description1;

                int flag;
                _tg showz;
};
//******************************************************************************************************************
//										P I L E T A B L E A U 
//******************************************************************************************************************
class _piletableau:public _pile,public _listenknotenbasis<_piletableau>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        
        
        public:
                _piletableau(_game*g,_tg px,_tg py);
                virtual ~_piletableau();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                virtual bool canpick(_card*c);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual _vektor3<_tg> dropposition(bool backdrop=false);
                virtual _vektor3<_tg> dropvy();
                virtual void adjustcardposition();
                virtual void adjustcardvy();
                virtual void animate(_zeit*c);
                virtual void createshadow();
                virtual void updateshadow();
                virtual void updatedescription();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
};
//******************************************************************************************************************
//										P I L E C R U E L 
//******************************************************************************************************************
class _pilecruel:public _piletableau{
        public:
                _pilecruel(_game*g,_tg px,_tg py);
                virtual ~_pilecruel();
                virtual bool canpick(_card*c);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual _vektor3<_tg> dropvy();
                virtual _vektor3<_tg> dropposition(bool backdrop=false);
                virtual void adjustcardposition();
                virtual void animate(_zeit*c);
                virtual void createshadow();
                virtual void updateshadow();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
};
//******************************************************************************************************************
//										P I L E A C E S U P 
//******************************************************************************************************************
class _pileacesup:public _piletableau{
        public:
                _pileacesup(_game*g,_tg px,_tg py);
                virtual ~_pileacesup();
                virtual bool canpick(_card*c);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void animate(_zeit*c);
                virtual void createshadow();
                virtual void updateshadow();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
};
//******************************************************************************************************************
//										P I L E S T O C K 
//******************************************************************************************************************
class _pilestock:public _pile,public _listenknotenbasis<_pilestock>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        public:
                _pilestock(_game*g,_tg px,_tg py,int tpc,int twc,int tfc,bool tlc);
                virtual ~_pilestock();
                _pilewaste*waste();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                virtual void deal();
                virtual bool canpick(_card*c);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual bool candeal();
                virtual bool canredeal();
                int cardcountinwaste();
                bool nocardcurvinginwaste();
                int cardcountwastes();
                virtual void animate(_zeit*clock);
                virtual void createshadow();
                virtual void updateshadow();
                virtual void updatedescription();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
                int towastecount;
                int topilecount;
                int tofoundationcount;
                bool tolabyrinthcount;
                int tableaucount;
                bool verticalredeal;
                int status;
                bool open;
                bool backsort;
                _tg backsorttime;
                _tg backsortintervall;
                _tg backsortakku;
                int backsortpilewastecount;
                _animationundo*backsortundo;
                int wastepartner;
                bool wasteiteration;
};
//******************************************************************************************************************
//										P I L E S T O C K P Y R A M I D 
//******************************************************************************************************************
class _pilestockpyramid:public _pilestock{
        public:
                _pilestockpyramid(_game*g,_tg px,_tg py,int tpc,int twc,int tfc,bool tlc);
                virtual ~_pilestockpyramid();
                virtual void deal();
                virtual bool canpick(_card*);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void drop();
                virtual void animate(_zeit*clock);
                virtual void createshadow();
                virtual void updateshadow();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
};
//******************************************************************************************************************
//										P I L E R E D E A L
//******************************************************************************************************************
class _pileredeal:public _pile,public _listenknotenbasis<_pileredeal>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        public:
                _pileredeal(_game*g,_tg px,_tg py,int tpc);
                virtual ~_pileredeal();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                virtual bool canpick(_card*);
                virtual bool candrop(_liste<_card>*,bool samesuit=false);
                bool canredeal();
                bool nocardcurvingintableau();
                bool nocardcurvinginwaste();
                void redeal();
                bool ready();
                virtual void animate(_zeit*clock);
                virtual void createshadow();
                virtual void updateshadow();
                bool blanketbacksort(_card*c);
                virtual void updatedescription();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
                int topilecount;
                bool blanketmode;
                bool shuffle;
                int status;
                bool frontsort;
                bool waitsort;
                bool backsort;
                bool shufflewait;
                bool shufflewaitnormal;
                bool shufflewait2;
                bool shufflesort;
                bool shufflesortnormal;
                int shufflecount;
                _tg backsorttime;
                _tg backsortintervall;
                _tg backsortakku;
                _animationundo*backsortundo;
};
//******************************************************************************************************************
//										P I L E D I S C A R D 
//******************************************************************************************************************
class _pilediscard:public _pile,public _listenknotenbasis<_pilediscard>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        
        
        public:
                _pilediscard(_game*g,_tg px,_tg py);
                virtual ~_pilediscard();
                virtual bool canpick(_card*c);
                virtual void effect();
                virtual void animateeffect();
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void animate(_zeit*clock);
                virtual void createshadow();
                virtual void updateshadow();
                virtual void updatedescription();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
                bool acesupmode;
                bool pyramidmode;
                _partikelquelle*effectsource;
                int effectstatus;
                _tg effecttimestart;
                _feld<_tg>*effectgravity;
                int cardcountactual;
                int cardcountold;
};
//******************************************************************************************************************
//										P I L E W A S T E 
//******************************************************************************************************************
class _pilewaste:public _pile,public _listenknotenbasis<_pilewaste>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        public:
                _pilewaste(_game*g,_tg px,_tg py);
                virtual ~_pilewaste();
                _pilestock* stock();
                virtual bool canpick(_card*c);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                bool cardcurvingstock();
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void animate(_zeit*clock);
                virtual void createshadow();
                virtual void updateshadow();
                virtual void updatedescription();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            int stockpartner;
};
//******************************************************************************************************************
//										P I L E W A S T E P Y R A M I D
//******************************************************************************************************************
class _pilewastepyramid:public _pilewaste{
        public:
                _pilewastepyramid(_game*g,_tg px,_tg py);
                virtual ~_pilewastepyramid();
                virtual bool canpick(_card*c);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);//picks the card c to the external list
                bool cardcurvingindiscard();
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void drop(_zeit*clock);
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
};
//******************************************************************************************************************
//										P I L E F O U N D A T I O N 
//******************************************************************************************************************
class _pilefoundation:public _pile,public _listenknotenbasis<_pilefoundation>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        public:
                _pilefoundation(_game*g,_tg px,_tg py);
                virtual ~_pilefoundation();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                virtual bool canpick(_card*c);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                bool ascendingmirrored();
                bool descendingmirrored();
                virtual void drop(_zeit*clock);
                virtual _vektor3<_tg> dropposition(bool backdrop=false);
                virtual void adjustcardposition();
                virtual void effect();
                virtual void animateeffect();
                virtual void animate(_zeit*c);
                virtual void createshadow();
                virtual void updateshadow();
                virtual void updatedescription();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            bool osmosismode;
	            _partikelquelle*effectsource;
	            int effectstatus;
	            _tg effecttimestart;
	            _feld<_tg>*effectgravity;
	            int cardcountactual;
	            int cardcountold;
};
//******************************************************************************************************************
//										P I L E R E S E R V E 
//******************************************************************************************************************
class _pilereserve:public _pile,public _listenknotenbasis<_pilereserve>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        public:
                _pilereserve(_game*g,_tg px,_tg py);
                virtual ~_pilereserve();
                virtual bool canpick(_card*c);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void pickslopeposition(_card*c,_vektor3<_tg>&p);
                virtual void pickslopeplane(_card*c,_vektor3<_tg>&vvx,_vektor3<_tg>&vvy);
                virtual _vektor3<_tg> dropposition(bool backdrop=false);
                virtual _vektor3<_tg> dropvy();
                virtual _vektor3<_tg> dropvx();
                virtual void adjustcardvy();
                virtual void animate(_zeit*c);
                virtual void createshadow();
                virtual void updateshadow();
                virtual void updatedescription();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            bool flowermode;
	            bool arcmode;
	            bool pyramidmode;// bewirkt, daß könige nicht gepickt werden, sondern discarded
};
//******************************************************************************************************************
//										P I L E F R E E C E L L 
//******************************************************************************************************************
class _pilefreecell:public _pile,public _listenknotenbasis<_pilefreecell>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        
        using _listenknotenbasis<_pilefreecell>::naechstes;
        using _listenknotenbasis<_pilefreecell>::vorheriges;
	    public:
	            _pilefreecell(_game*g,_tg px,_tg py,int s);
	            virtual ~_pilefreecell();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                virtual bool canpick(_card*c);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void animate(_zeit*clock);
                virtual void updatedescription();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
	    public:
	            int suit;
};
//******************************************************************************************************************
//										P I L E P Y R A M I D 
//******************************************************************************************************************
class _pilepyramid:public _pile,public _listenknotenbasis<_pilepyramid>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        public:
                _pilepyramid(_game*g,_tg px,_tg py);
                virtual ~_pilepyramid();
                _card*cardfromlast(int index);
                void initcardpyramid();
                virtual bool canpick(_card*c);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                bool cardcurvingindiscard();
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void drop(_zeit*clock);
                virtual _vektor3<_tg> dropvy();
                virtual _vektor3<_tg> dropposition(bool backdrop=false);
                virtual void adjustcardvy();
                virtual void adjustcardposition();
                virtual void animate(_zeit*clock);
                virtual void updatedescription();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            bool initialized;
	            _card*dropcard;
};
//******************************************************************************************************************
//										P I L E B E T H O R A L
//******************************************************************************************************************
class _pilebethoral:public _piletableau{
        public:
                _pilebethoral(_game*g,_tg px,_tg py);
                virtual bool canpick(_card*c);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void discard(_card*card);
                virtual void pickslopeplane(_card*c,_vektor3<_tg>&vvx,_vektor3<_tg>&vvy);
                virtual void pickslopeposition(_card*c,_vektor3<_tg>&p);
                virtual _vektor3<_tg> dropposition(bool backdrop=false);
                virtual _vektor3<_tg> dropvx();
                virtual _vektor3<_tg> dropvy();
                virtual void setangle(_card*c);
                virtual void animate(_zeit*clock);
                virtual void createshadow();
                virtual void updateshadow();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
                int status;
};
//******************************************************************************************************************
//										P I L E B L A N K E T
//******************************************************************************************************************
class _pileblanket:public _piletableau{
        public:
                _pileblanket(_game*g,_tg px,_tg py);
                virtual ~_pileblanket();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                bool leftestcard(_card*c);
                bool rightestcard(_card*c);
                _card*cardat(const _vektor3<_tg>&o);
                virtual bool canpick(_card*c);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual bool candropat(_card*card,_card*cd);
                virtual void drop();
                virtual void swap(_card*c,_card*ass,bool unused=false);
                virtual _vektor3<_tg> dropvy();
                virtual _vektor3<_tg> dropposition(bool backdrop=false);
                virtual void adjustcardvy();
                virtual void adjustcardposition();
                virtual void animate(_zeit*clock);
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            int status;
	            _card*dropass;
};
//******************************************************************************************************************
//										P I L E M A Z E
//******************************************************************************************************************
class _pilemaze:public _pileblanket{
        public:
                _pilemaze(_game*g,_tg px,_tg py,int d);
                virtual ~_pilemaze();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                virtual bool canpick(_card*c);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual bool candropat(_card*card,_card*cd);
                virtual bool candropcardatcard(_card*card,_card*cit);
                virtual void animate(_zeit*clock);
                _pilemaze*iteratevector(_vektor3<_tg>&v,_pilemaze*pm);
                void save(_datei*d);
                void load(_datei*d);
        public:
	            int size;
};
//******************************************************************************************************************
//										P I L E A R R A Y
//******************************************************************************************************************
class _pilearray:public _pile,public _listenknotenbasis<_pilearray>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        public:
                _pilearray(_game*g,_tg px,_tg py,int dx,int dy);
                virtual ~_pilearray();
                void resetfeld();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                virtual bool canturn(_card*c);
                virtual void turn(_card*c,_tg spd,bool useundo);
                virtual bool canpick(_card*c);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual bool candropat(_card*c,int dropx,int dropy);
                virtual void drop();
                virtual void move(int sx,int sy,int dx,int dy);
                virtual bool inner(bool withcards=true);
                virtual _vektor3<_tg> droppositionat(int fx,int fy);
                virtual _vektor3<_tg> dropvy();
                virtual void adjustcardposition();
                virtual void adjustcardvy();
                virtual void animateinput();
                virtual void animate(_zeit*c);
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            _card**feld;
	            int dimx;
	            int dimy;
	            int dropx;
	            int dropy;
};
//******************************************************************************************************************
//										P I L E L A B Y R I N T H 
//******************************************************************************************************************
class _pilelabyrinth:public _pile,public _listenknotenbasis<_pilelabyrinth>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        public:
                _pilelabyrinth(_game*g,_tg px,_tg py,int dx,int dy);
                virtual ~_pilelabyrinth();
                void resetfeld();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                bool hasfreeline();
                int freeline();
                virtual bool canpick(_card*c);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual _vektor3<_tg> droppositionat(int fx,int fy);
                virtual _vektor3<_tg> dropvy();
                virtual void adjustcardposition();
                virtual void adjustcardvy();
                void fillfirstline(_animationundo*m);
                virtual void animate(_zeit*c);
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            _card**feld;
	            int dimx;
	            int dimy;
	            bool fillfirst;
	            bool bothdirection;
};
//******************************************************************************************************************
//										P I L E S W E E T M A T C H
//******************************************************************************************************************
class _pilesweetmatch:public _pile,public _listenknotenbasis<_pilesweetmatch>{
        public:
        using _listebasissortierung<_card>::anfang;
        using _listebasissortierung<_card>::naechstes;
        using _listebasissortierung<_card>::vorheriges;
        using _listebasissortierung<_card>::anzahl;
        using _listebasissortierung<_card>::erstes;
        using _listebasissortierung<_card>::letztes;
        public:
                _pilesweetmatch(_game*g,_tg px,_tg py,int dx,int dy);
                virtual ~_pilesweetmatch();
                void resetfeld();
                void updateblase();
                virtual void draw(_grafik*gra,_kamera<_tg>*cam);
                virtual bool canpick(_card*c);
                virtual void pick(_card*c);
                virtual void pickextern(_card*c,_liste<_card>*l);
                bool neighbour(_card*c0,_card*c1);
                bool match(_card*c0,_card*c1);
                bool cardbuildsrow(_card*c,int x,int y);
                bool swapbuildsrow(_card*c,_card*cs);
                virtual bool candrop(_liste<_card>*list,bool samesuit=false);
                virtual void drop(_zeit*clock);
                void swap(_card*s,_card*ass,bool unused=false);
                virtual _vektor3<_tg> droppositionat(int fx,int fy);
                virtual _vektor3<_tg> dropvy();
                virtual void adjustcardposition();
                virtual void adjustcardvy();
                void cardfall(_card*c,int dx,int dy);
                void animatecardfall();
                void getrow(_card*c,int x,int y);
                bool redundant(_liste<_vektor2<int> >*ll,int xx,int yy);
                void moverow();
                void animatediscardmatch();
                virtual void animate(_zeit*c);
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
                void checkintegrity();
        public:
                _card**feld;
                int*status;
                _blase**blase;
                int dimx;
                int dimy;
                _card*dropcard;
                //private, no storage
                int dir;
                _liste<_card> row;
                int rowdir;
};


#endif