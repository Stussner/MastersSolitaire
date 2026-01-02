//******************************************************************************************************************************************************************************************************
//  Project     : Fantasy Solitaire
//  Library     : 
//  Module      : _solitairegame.hpp
//  Date        : 14.03.2002
//  Description : 
//******************************************************************************************************************************************************************************************************

#ifndef _solitairegame_included_
#define _solitairegame_included_

class _gamestats;
class _gamestatsentry;
class _game;


#include <_struktur.hpp>
#include <_vektor.hpp>
#include <_text.hpp>

#include "../hpp/_solitaire.hpp"
#include "../hpp/_solitairepile.hpp"


class _card;
class _animationundo;
class _animationpiletopile;

unsigned int countstatsstoreables();
unsigned int countanimationstoreables();
unsigned int countcardstoreables();
unsigned int countpilestoreables();
unsigned int countgamestoreables();
void savegame(_game*game);
_game*loadgame(_solitaire*solitaire,int cur_game);

//******************************************************************************************************************
//										G A M E S T A T I S T I C S
//******************************************************************************************************************
class _gamestats:public _speicherbarbinaer{
        public:
                _gamestats(_solitaire*s,unsigned int typ);
                virtual ~_gamestats();
                void clearhighscorelist();
                void clearentrylist();
                int countuser(const _zeichenkette<_tt>&u);
                _tg timeaverage();
                _tg timeaverageuser(const _zeichenkette<_tt>&u);
                _tg timemaximum();
                _tg timeminimum();
                _tg moveaverage();
                _tg moveaverageuser(const _zeichenkette<_tt>&u);
                _tg discardaverage();
                _tg discardaverageuser(const _zeichenkette<_tt>&u);
                _tg quote();
                _tg quoteuser(const _zeichenkette<_tt>&u);
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();

        public:
	            _listebasissortierung<_gamestatsentry> entrylist;
	            _listebasissortierung<_gamestatsentry> highscorelist;
	            unsigned int gametype;
	            _solitaire*solitaire;
};	
//******************************************************************************************************************
//										G A M E S T A T I S T I C S E N T R Y
//******************************************************************************************************************
class _gamestatsentry:public _speicherbarbinaer,public _listenknotenbasis<_gamestatsentry>{
        public:
        using _listenknotenbasis<_gamestatsentry>::vorheriges;
        using _listenknotenbasis<_gamestatsentry>::naechstes;
        public:
                _gamestatsentry(_gamestats*g,bool high=false);
                virtual ~_gamestatsentry();
                void copy(_gamestatsentry*g);
                _tg score();
                bool successful();
                bool vergleichen(_gamestatsentry*o);
                void close();
                unsigned int index();
                void save(_datei*d);
                void load(_datei*d);
                void assoziieren();
        public:
	            _gamestats*gamestats;
	            _zeichenkette<_tt> user;
	            int date;
	            unsigned int discards;
	            _tg time;//seconds
	            unsigned int moves;//count of moves
	            unsigned int undos;//count of undos
                unsigned int tipps;//count of tipps	
	            bool closed;
	            bool highscored;//is the current statsentry copied to highscorelist
	            bool inhighscorelist;//is this a highscoreentry
	            _tg quoteverlauf;// not for(storage, will always be calculated at time
};	            
//******************************************************************************************************************
//										G A M E 
//******************************************************************************************************************
class _game:public _speicherbarbinaer{
        public:
                _game(_solitaire*s,unsigned int m,bool prev,bool menue);
                virtual ~_game();
                
                void tableaugiverestrictionfreecell(bool b);
                void tableaugivesamesuit(bool b);
                void tableaugiveothersuit(bool b);
                void tableaugivealteratecolor(bool b);
                void tableaugivedescending(bool b);
                void tableaugiveascending(bool b);
                void tableautakesamesuit(bool b);
                void tableautakeothersuit(bool b);
                void tableautakealteratecolor(bool b);
                void tableautakeascending(bool b);
                void tableautakedescending(bool b);
                void tableautakeboth(bool b);
                void tableautakewrapped(bool b);
                void tableautakeemptynumber(int i);
                void tableautakeemptysuit(int i);
                void tableaumaximumlength(_tg i);
                void foundationdescending(bool b);
                void foundationascending(bool b);
                void foundationsamesuit(bool b);
                void foundationboth(bool b);
                void foundationwrapped(bool b);
                void foundationmirrored(bool b);
                void foundationgiverestriction(bool b);
                void startusing();
                void endusing();
                _tg score();
                void startanimation();
                void skipanimation();
                void endpreparation();
                void setanimationpreparative();
                _piletableau*createpiletableau(unsigned int count,_tg px,_tg py,_tg dx=-1,_tg dy=0);
                _pilecruel*createpilecruel(_tg px,_tg py);
                _pileacesup*createpileacesup(_tg px,_tg py);
                _pilebethoral*createpilebethoral(_tg px,_tg py);
                _pileblanket*createpileblanket(_tg px,_tg py);
                _pilemaze*createpilemaze(_tg px,_tg py,unsigned int dim);
                _pilestock*createpilestock(_tg px,_tg py,int tpc,int twc,int tfc=0,bool tlc=false);
                _pilestockpyramid*createpilestockpyramid(_tg px,_tg py);
                _pileredeal*createpileredeal(_tg px,_tg py,int counts=4);
                _pilereserve*createpilereserve(_tg px,_tg py);
                _pilewaste*createpilewaste(_tg px,_tg py);
                _pilewastepyramid*createpilewastepyramid(_tg px,_tg py);
                _pilefoundation*createpilefoundation(_tg px,_tg py);
                _pilefreecell*createpilefreecell(_tg px,_tg py,int suit=-1);
                _pilediscard*createpilediscard(_tg px,_tg py);
                _pilepyramid*createpilepyramid(_tg px,_tg py);
                _pilelabyrinth*createpilelabyrinth(_tg px,_tg py,unsigned int dimx,unsigned int dimy);
                _pilearray*createpilearray(_tg px,_tg py,unsigned int dimx,unsigned int dimy);
                _pilesweetmatch*createpilesweetmatch(_tg px,_tg py,unsigned int dimx,unsigned int dimy);
                void clearcards();
                void createcards(unsigned int deckscount=1,unsigned int suit=0);
                _card*createcard(unsigned int suit,unsigned int number);
                void clearcard(unsigned int index);
                _piletableau*piletableau(unsigned int index);
                _pilelabyrinth*pilelabyrinth(unsigned int index);
                _pilearray*pilearray(unsigned int index);
                _pilefoundation*pilefoundation(unsigned int index);
                _pilesweetmatch*pilesweetmatch(unsigned int index);
                _pilereserve*pilereserve(unsigned int index);
                _pilestock*pilestock(unsigned int index);
                _pilewaste*pilewaste(unsigned int index);
                _pileredeal*pileredeal(unsigned int index);
                void pilesort();
                bool hasfreecells();
                unsigned int countfreefreecells();
                void cardposition(_tg px,_tg py,_tg pz);
                void shufflecards(int imin=0,int imax=-1);
                _card*card(unsigned int index);
                _card*cardfromlast(unsigned int index);
                void swapcards(unsigned int i0,unsigned int i1);
                unsigned int cardcount();//returns the total count of cards in the game
                bool checkend();
                void drawpile(_grafik*gra,_kamera<_tg>*cam);
                void drawpilecard(_grafik*gra,_kamera<_tg>*cam);
                void drawpilecardshadowneigung(_grafik*gra,_kamera<_tg>*cam);
                void drawcard(_grafik*gra,_kamera<_tg>*cam);//alle die in cardlist sind, aber sortiert
                void drawnocurving(_grafik*gra,_kamera<_tg>*cam);
                void drawcurving(_grafik*gra,_kamera<_tg>*cam);
                void draw(_grafik*gra,_kamera<_tg>*cam);
                void drawshow(_grafik*gra,_kamera<_tg>*cam);
                void animate(_zeit*c);
                void animateeffects();
                void deinsertpick();
                _liste<_card>*deinsertforblow();
                void insertblowlist(_liste<_card>*cl);
                void update();
                void updatepiledescription();
                void opacity(_to o);
                void markforupdateshadow(_licht<_tg,_to>*l);
                void updateplane();
                void enlargerectangle();
                void scale(_tg f);
                void translate(_vektor3<_tg> d);
                _tg tabulatorx();
                _tg tabulatory();
                bool inner();
                void createshadow();
                void updateshadowarray();
                void sigmadiffuse(_tg sd);
                void updatetexture();
                void updatenaturality();
                bool tipp();
                bool autoplay();
                bool automove();
                bool clickplay(_card*card);
                _animationundo*createundo(_tg spd,_tg intv,bool reverseiteration=false);
                void undo();
                void redo();
                void playundo(bool forward=true);
                bool cardcurving();
                bool activeanimationbutundo();//returns true, if(an not-undo-animation is active
                bool activepreparation();//returns true, if(an not-undo-animation is active
                bool tipptableaucompleterowpile(_piletableau*ps);
                _pilediscard*getpilediscardminimum();
                bool tipptableaucompleterow();
                void tippexecutecompleterow();						
                bool tipptableauturn();
                void tippexecuteturn();
                bool tipptableauemptypile();
                void tippinitcombination(unsigned int iteratorpack);
                void tippresetcombination(unsigned int iteratorpack);
                void tippiteratecombinationcardwise(unsigned int iteratorpack);
                void tippiteratecombinationpilewise(unsigned int iteratorpack);
                void tippiteratecombination(unsigned int iteratorpack);			
                bool tippendedcombinationpilewise(unsigned int iteratorpack,_pile*sourstart);
                bool tippendedcombinationcardwise(unsigned int iteratorpack,_pile*sourstart,_card*cardstart);
                bool tippendedcombination(unsigned int iteratorpack,_pile*sourstart,_card*cardstart,_pile*deststart);
                bool tippcanmove(unsigned int iteratorpack,bool samesuit,bool rowgrow,bool noempty);
                bool tipptableau(unsigned int iteratorpack,bool samesuit=false,bool rowgrow=true,bool noempty=false);
                void tippexecutemove();			
                bool tippwaste();
                bool tippstock();
                bool tippstockpyramid();
                void tippexecutestock();
                bool tippredeal();
                void tippexecuteredeal();
                bool tippfoundationcanmove(unsigned int iteratorpack);
                bool tippfoundation(unsigned int iteratorpack);
                bool tippreservetableau(unsigned int iteratorpack);
                bool tippreserve(unsigned int iteratorpack);
                void autoplayiteratecombination(unsigned int iteratorpack);
                bool autoplayendedcombination(unsigned int iteratorpack,_pile*sourstart,_card*cardstart);
                _piletableau*autoplaymovelist(_pile*sourpile,_liste<_card>*ft,bool samesuit,bool rowgrow,bool clickplay,bool noempty);
                bool autoplaymovecard(_pile*sourpile,_card*sourcard,bool samesuit=false,bool rowgrow=true,bool clickplay=false,bool noempty=false);
                bool autoplaymove(unsigned int iteratorpack,bool samesuit=false,bool rowgrow=true,bool noempty=false);
                bool autoplaymovetableau(unsigned int iteratorpack,bool samesuit=false,bool rowgrow=true,bool noempty=false);
                _animationpiletopile*autoplayanimationpiletopile(bool udx=false,bool udy=false,_tg vx=-20,_tg vy=0,_tg vz=-10,bool undoconstantsort=true);
                bool clickplaytableaumove(_card*c,bool samesuit=false,bool rowgrow=true,bool noempty=false);
                bool clickplaywaste(_card*c,bool noempty=false);
                bool clickplaycompleterow(_card*c);
                bool clickplaytableauemptypile(_card*c);
                bool clickplayfoundation(_card*c);
                bool clickplayfreecell(_card*card);
                void save(_datei*d);
                unsigned int undoiteratorindex();
                void load(_datei*d);
                void assoziieren();
        public:
	            _solitaire*solitaire;
	            _listebasis<_animation> animationlist;
	            bool allowpick;
	            _vektor3<_tg> cameraposition[10];
	            _vektor3<_tg> camerapositionmenu[10];
	            _vektor3<_tg> camerapositionpreview[10];
	            _vektor3<_tg> cameraview[10];
	            _vektor3<_tg> cameraviewmenu[10];
	            _vektor3<_tg> cameraviewpreview[10];
	            _vektor3<_tg> cameraside[10];
	            _vektor3<_tg> camerasidemenu[10];
	            _vektor3<_tg> camerasidepreview[10];
	            _vektor3<_tg> cameraup[10];
	            _vektor3<_tg> cameraupmenu[10];
	            _vektor3<_tg> camerauppreview[10];
	            unsigned int music;
	            bool preview;
	            bool menu;
	            unsigned int mode;//0=fantasy, 1=sheepworld
	            unsigned int index;//for(external storage !
	            bool inuse;
	            bool ended;
	            bool endedbygiveupburn;
	            _pile*pileinfo;
	            _zeichenkette<_tt> pileinfoname;
	            _zeichenkette<_tt> pileinfodescription0;
	            _zeichenkette<_tt> pileinfodescription1;
	            _to pileinfoopacity;
	            _tg pileinfotime;
	            _tg starttime;
	            int pickstate;
	            _card*pickoffsetcard;
	            _tg pickoffsetx;
	            _tg pickoffsety;
	            _vektor3<_tg> pickvector;
	            _vektor3<_tg> pickpositionold;
	            _vektor3<_tg> position;
	            _vektor3<_tg> vector[2];
	            _vektor2<_tg> rectangle[2];
	            _vektor2<_tg> rectangletransformed[2];
	            _tg cardwidth;
	            _tg cardheight;
	            _tg carddistance;
	            _tg cardshiftfront;
	            _tg cardshiftback;
	            _tg scaleglobal;
	            _vektor3<_tg> translationglobal;
	            _feld<_tg>*gravityblow;
	            bool blowing;
	            _listebasissortierung<_pile> pilelist;
	            _listebasis<_piletableau> piletableaulist;
	            _listebasis<_pilestock> pilestocklist;
	            _listebasis<_pilewaste> pilewastelist;
	            _listebasis<_pilediscard> pilediscardlist;
	            _listebasis<_pileredeal> pileredeallist;
	            _listebasis<_pilefoundation> pilefoundationlist;
	            _listebasis<_pilefreecell> pilefreecelllist;
	            _listebasis<_pilereserve> pilereservelist;
	            _listebasis<_pilepyramid> pilepyramidlist;
	            _listebasis<_pilelabyrinth> pilelabyrinthlist;
	            _listebasis<_pilearray> pilearraylist;
	            _listebasis<_pilesweetmatch> pilesweetmatchlist;
	            _listebasis<_card> cardlist;
	            _listesortierung<_polygon> drawlist;
	            _liste<_card> picklist;
	            _listebasis<_card> tipplist;
	            _listebasis<_card> blowlist;
	            _listebasis<_animationundo> undolist;
	            _animationundo*undoiterator;
	            //statistics
	            bool statsclosed;
	            unsigned int discards;
	            _tg time;//seconds
	            unsigned int moves;//count of moves
	            unsigned int undos;//count of undos
	            unsigned int tipps;//count of tipps	
	            //------------------- tableau tipp iteratoren ---------------------------
	            _piletableau*tippsourpileiterator;//tertiäriterator
	            _card*tippsourcarditerator;//sekundäriterator
	            _piletableau*tippdestpileiterator;//primäriterator
	            _piletableau*autoplaysourpileiterator;
	            _card*autoplaysourcarditerator;
	            _piletableau*autoplaydestpileiterator;
	            _piletableau*automovesourpileiterator;
	            _card*automovesourcarditerator;
	            _piletableau*automovedestpileiterator;
	            _piletableau*clickplaysourpileiterator;
	            _card*clickplaysourcarditerator;
	            _piletableau*clickplaydestpileiterator;
	            //------------------ spezialpile tipp iteratoren -----------------------------
	            int tippreservepile;
	            int tippreservecard;
	            int tippstockpile;
	            int tippwastepile;
	            int tippredealpile;
	            //------------------ tipp results ----------------------------------------
	            _liste<_card> foundlist;
	            _pile*foundsour;
	            _pile*founddest;
	            _liste<_vektor3<_tg> > founddestposition;
	            _liste<_card> founddestcard;
	            //private not for(storage
	            int loadprocuii;
	            int loadprocpc;
	            bool automoveundodelay;
	            _tg automoveundostart;
	            bool keyboardinputblocked;
	            int effectindex;
};



#endif