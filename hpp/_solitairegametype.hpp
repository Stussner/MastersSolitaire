//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitairegametype.hpp
//  Datum       : 23.12.2008
//******************************************************************************************************************************************************************************************************
#ifndef _solitairegametype_included_
#define _solitairegametype_included_
 
class _gamespideronesuit;
class _gamespidertwosuit;
class _gamespiderfoursuit;
class _gamescorpion;
class _gamespiderette;
class _gamespiderlinge;
class _gameklondikeone;
class _gameklondikeonetwodeck;
class _gamegargantua;
class _gameindian;
class _gamegiant;
class _gamemissmilligan;
class _gameklondikecontra;
class _gamecontraflow;
class _gameklondikethree;
class _gameklondikethreetwodeck;
class _gameklondikethreetwodeck;
class _gamefortythieves;
class _gamefortythievesdoublestock;
class _gamefortythievesredeal;
class _gameblindalleys;
class _gamelimited;
class _gamelimitedcovered;
class _gameladypalk;
class _gameacme;
class _gameauntmary;
class _gameauntfreemary;
class _gamesinglerail;
class _gamecarrenapoleon;
class _gamefreecell;
class _gamefreecelldouble;
class _gamefreewall;
class _gameeightoff;
class _gameforecell;
class _gamefourcolor;
class _gameseatowers;
class _gamebakersgame;
class _gameaustralian;
class _gamebethoral;
class _gameblanket;
class _gameblankettwosuit;
class _gamemaze;
class _gamemazeeasy;
class _gamemazetwosuit;
class _gamemazeeasytwosuit;
class _gamecancan;
class _gamecruel;
class _gamesolidsquare;
class _gamenapoleonssquare;
class _gamelabellelucie;
class _gamelafacilelucie;
class _gamepyramid;
class _gamepyramiddouble;
class _gamepyramidreserve;
class _gamegolf;
class _gamegolfeasy;
class _gameyukon;
class _gamerussian;
class _gamerussianeasy;
class _gamerussianfree;
class _gamelabyrinth;
class _gamelabyrintheasier;
class _gamelabyrinthrodenbach;
class _gamelabyrinthdouble;
class _gamesweetmatch;
class _gamekingspeak;
class _gameacesup;
class _gameacesupeasy;
class _gameosmosis;
class _gameveryeasy;
class _gameant;
class _gamebakersdozen;
class _gamemartha;
class _gameflowergarden;
class _gamestonewall;
class _gamestonewalleasy;
class _gamepairscross;
class _gamespidersuperstock;
 
#include <_global.hpp>
#include <_text.hpp>
 
struct _gametype {
                int gruppe;
                _tg bekanntheit;
                _tg dauer;
                int gewonnen;
                int verloren;
                _tg schwierigkeit;
                int deckanzahl;
                int punktemaximal;
                _zeichenkette<_tt> name;
                _zeichenkette<char> namespeicherung;
}; 
extern const _gametype gametype[77];
extern const int gametypecount;
extern _zeichenkette<_tt> gameobjective[1000];
extern _zeichenkette<_tt> gametypegroupnames[];
#include "../hpp/_solitairegame.hpp" 
#include "../hpp/_solitaireanimation.hpp"
 //class _solitaire;
 /*
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
*/
//******************************************************************************************************************
//										G A M E S P I D E R O N E S U I T E
//******************************************************************************************************************
class _gamespideronesuit:public _game{
        protected:
                _gamespideronesuit(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamespideronesuit(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E S P I D E R T W O S U I T 
//******************************************************************************************************************
class _gamespidertwosuit:public _gamespideronesuit{
        protected:
                _gamespidertwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamespidertwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool clickplay(_card*card);
                
                
};
//******************************************************************************************************************
//										G A M E S P I D E R F O U R S U I T 
//******************************************************************************************************************
class _gamespiderfoursuit:public _gamespidertwosuit{
        public:
                _gamespiderfoursuit(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E S C O R P I O N 
//******************************************************************************************************************
class _gamescorpion:public _gamespideronesuit{
        public:
                _gamescorpion(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E S P I D E R E T T E
//******************************************************************************************************************
class _gamespiderette:public _gamespideronesuit{
        public:
                _gamespiderette(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E S P I D E R L I N G E
//******************************************************************************************************************
class _gamespiderlinge:public _gamespideronesuit{
        public:
                _gamespiderlinge(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E K L O N D I K E O N E 
//******************************************************************************************************************
class _gameklondikeone:public _game{
        protected:
                _gameklondikeone(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gameklondikeone(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E K L O N D I K E O N E T W O D E C K
//******************************************************************************************************************
class _gameklondikeonetwodeck:public _gameklondikeone{
        public:
                _gameklondikeonetwodeck(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E G A R G A N T U A 
//******************************************************************************************************************
class _gamegargantua:public _gameklondikeone{
        public:
                _gamegargantua(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E I N D I A N 
//******************************************************************************************************************
class _gameindian:public _gameklondikeone{
        public:
                _gameindian(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E G I A N T
//******************************************************************************************************************
class _gamegiant:public _gameklondikeone{
        public:
                _gamegiant(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E M I S S M I L L I G A N
//******************************************************************************************************************
class _gamemissmilligan:public _gameklondikeone{
        public:
                _gamemissmilligan(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E C A R R E N A P O L E O N 
//******************************************************************************************************************
class _gamecarrenapoleon:public _game{
        protected:
                _gamecarrenapoleon(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamecarrenapoleon(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E K L O N D I K E C O N T R A
//******************************************************************************************************************
class _gameklondikecontra:public _gamecarrenapoleon{
        public:
                _gameklondikecontra(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E C O N T R A F L O W
//******************************************************************************************************************
class _gamecontraflow:public _gameklondikeone{
        public:
                _gamecontraflow(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
};
//******************************************************************************************************************
//										G A M E K L O N D I K E T H R E E 
//******************************************************************************************************************
class _gameklondikethree:public _gameklondikeone{
        public:
                _gameklondikethree(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
/*
//******************************************************************************************************************
//										G A M E K L O N D I K E O N E T W O D E C K
//******************************************************************************************************************
class _gameklondikeonetwodeck:public _gameklondikeone{
        public:
                _gameklondikeonetwodeck(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
*/
//******************************************************************************************************************
//										G A M E K L O N D I K E T H R E E T W O D E C K
//******************************************************************************************************************
class _gameklondikethreetwodeck:public _gameklondikeone{
        public:
                _gameklondikethreetwodeck(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E F O R T Y T H I E V E S
//******************************************************************************************************************
class _gamefortythieves:public _gameklondikeone{
        protected:
                _gamefortythieves(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned i);
        public:
                _gamefortythieves(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool autoplay();
};
//******************************************************************************************************************
//										G A M E F O R T Y T H I E V E S D O U B L E S T O C K
//******************************************************************************************************************
class _gamefortythievesdoublestock:public _gamefortythieves{
        public:
                _gamefortythievesdoublestock(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E F O R T Y T H I E V E S R E D E A L
//******************************************************************************************************************
class _gamefortythievesredeal:public _gamefortythieves{
        public:
                _gamefortythievesredeal(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E B L I N D A L L E Y S  
//******************************************************************************************************************
class _gameblindalleys:public _gameklondikeone{
        public:
                _gameblindalleys(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E L I M I T E D 
//******************************************************************************************************************
class _gamelimited:public _gameklondikeone{
        protected:
                _gamelimited(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamelimited(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E L I M I T E D C O V E R E D
//******************************************************************************************************************
class _gamelimitedcovered:public _gamelimited{
        public:
                _gamelimitedcovered(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E L A D Y P A L K
//******************************************************************************************************************
class _gameladypalk:public _gameklondikeone{
        public:
                _gameladypalk(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E A C M E 
//******************************************************************************************************************
class _gameacme:public _gameklondikeone{
        public:
                _gameacme(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E A U N T M A R Y 
//******************************************************************************************************************
class _gameauntmary:public _gameklondikeone{
        public:
                _gameauntmary(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E A U N T F R E E M A R Y 
//******************************************************************************************************************
class _gameauntfreemary:public _gameklondikeone{
        public:
                _gameauntfreemary(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E S I N G L E R A I L 
//******************************************************************************************************************
class _gamesinglerail:public _game{
        public:
                _gamesinglerail(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E F R E E C E L L 
//******************************************************************************************************************
class _gamefreecell:public _game{
        public:
                _gamefreecell(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
                bool tippfreecelltofoundation();
        private:
                _card* getcardtableau(int ss,int sn);
                _card* getcardfoundation(int ss,int sn);
                _card* getsearchedcard(int b);
                bool tippfreecelltotableau();
                bool validateblockade();
                void initblockade();
                void nextblockade();
                bool tippclearblockade();
        protected:
                _gamefreecell(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        private:
	            int blockade;//bezieht sich auf die foundations ! 0-pilefoundation.count()
	            int blockadecount;
};
//******************************************************************************************************************
//										G A M E F R E E C E L L D O U B L E
//******************************************************************************************************************
class _gamefreecelldouble:public _gamefreecell{
        public:
                _gamefreecelldouble(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E F R E E W A L L
//******************************************************************************************************************
class _gamefreewall:public _gamefreecell{
        public:
                _gamefreewall(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E E I G H T O F F
//******************************************************************************************************************
class _gameeightoff:public _gamefreecell{
        public:
                _gameeightoff(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E F O R E C E L L 
//******************************************************************************************************************
class _gameforecell:public _gamefreecell{
        public:
                _gameforecell(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E F O U R C O L O R
//******************************************************************************************************************
class _gamefourcolor:public _gamefreecell{
        public:
                _gamefourcolor(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E S E A T O W E R S 
//******************************************************************************************************************
class _gameseatowers:public _gamefreecell{
        public:
                _gameseatowers(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E B A K E R S G A M E 
//******************************************************************************************************************
class _gamebakersgame:public _gamefreecell{
        public:
                _gamebakersgame(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E A U S T R A L I A N 
//******************************************************************************************************************
class _gameaustralian:public _game{
        public:
                _gameaustralian(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
                
};
//******************************************************************************************************************
//										G A M E B E T H O R A L
//******************************************************************************************************************
class _gamebethoral:public _game{
        public:
                _gamebethoral(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
        private:
                bool tippbethoral();
        private:
                int sourcarditerator;
};
//******************************************************************************************************************
//										G A M E B L A N K E T
//******************************************************************************************************************
class _gameblanket:public _game{
        protected:
                _gameblanket(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gameblanket(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
        private:
                bool tippblanket();
                void tippexecuteblanket();
                bool clickplayblanket(_card*card);
        private:
                int souriterator;
                int destiterator;
                _card*foundsourcard;
                _card*founddestcard;
};
//******************************************************************************************************************
//										G A M E B L A N K E T T W O S U I T
//******************************************************************************************************************
class _gameblankettwosuit:public _gameblanket{
        public:
                _gameblankettwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E M A Z E 
//******************************************************************************************************************
class _gamemaze:public _game{
        protected:
                _gamemaze(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamemaze(_solitaire*s,unsigned int mo,bool prev,bool menue);
                bool tippmaze();
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
        private:
                void tippexecutemaze();
                bool clickplaymaze(_card*card);

        private:
	            int souriterator;
	            int destiterator;
	            _card*foundsourcard;
	            _card*founddestcard;
};
//******************************************************************************************************************
//										G A M E M A Z E E A S Y
//******************************************************************************************************************
class _gamemazeeasy:public _gamemaze{
        public:
                _gamemazeeasy(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E M A Z E T W O S U I T
//******************************************************************************************************************
class _gamemazetwosuit:public _gamemaze{
        public:
                _gamemazetwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E M A Z E E A S Y T W O S U I T
//******************************************************************************************************************
class _gamemazeeasytwosuit:public _gamemaze{
        public:
                _gamemazeeasytwosuit(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E C A N C A N 
//******************************************************************************************************************
class _gamecancan:public _game{
        public:
                _gamecancan(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E C R U E L
//******************************************************************************************************************
class _gamecruel:public _game{
        protected:
                _gamecruel(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamecruel(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E S O L I D S Q U A R E
//******************************************************************************************************************
class _gamesolidsquare:public _game{
        protected:
                _gamesolidsquare(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamesolidsquare(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E N A P O L E O N S S Q U A R E
//******************************************************************************************************************
class _gamenapoleonssquare:public _gamesolidsquare{
        public:
                _gamenapoleonssquare(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E L A B E L L E L U C I E
//******************************************************************************************************************
class _gamelabellelucie:public _gamecruel{
        public:
                _gamelabellelucie(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E L A F A C I L E L U C I E
//******************************************************************************************************************
class _gamelafacilelucie:public _gamecruel{
        public:
                _gamelafacilelucie(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E P Y R A M I D
//******************************************************************************************************************
class _gamepyramid:public _game{
        protected:
                _gamepyramid(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamepyramid(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
        private:
                bool tippkingtodiscardcard(_card*c);
                bool tippkingtodiscard();
                bool tipppyramidcard(_card*cs);
                bool tipppyramidpyramid(_card*cs,_card*cd);
                bool tipppyramid();
                void tippexecutepyramid();
                bool clickplaypilecard(_card*card,_pile*pile);
        private:
	            int sourcarditerator;
	            int destcarditerator;

};
//******************************************************************************************************************
//										G A M E P Y R A M I D D O U B L E 
//******************************************************************************************************************
class _gamepyramiddouble:public _gamepyramid{
        public:
                _gamepyramiddouble(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E P Y R A M I D R E S E R V E
//******************************************************************************************************************
class _gamepyramidreserve:public _gamepyramid{
        public:
                _gamepyramidreserve(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E G O L F
//******************************************************************************************************************
class _gamegolf:public _game{
        public:
                _gamegolf(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
        private:                
                bool tippreservetofoundation();
};
//******************************************************************************************************************
//										G A M E G O L F E A S Y
//******************************************************************************************************************
class _gamegolfeasy:public _gamegolf{
        public:
                _gamegolfeasy(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E Y U K O N 
//******************************************************************************************************************
class _gameyukon:public _game{
        protected:
                _gameyukon(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gameyukon(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
                
};
//******************************************************************************************************************
//										G A M E R U S S I A N 
//******************************************************************************************************************
class _gamerussian:public _gameyukon{
        public:
                _gamerussian(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E R U S S I A N E A S Y
//******************************************************************************************************************
class _gamerussianeasy:public _gameyukon{
        public:
                _gamerussianeasy(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E R U S S I A N F R E E 
//******************************************************************************************************************
class _gamerussianfree:public _gameyukon{
        public:
                _gamerussianfree(_solitaire*s,unsigned int mo,bool prev,bool menue);
                bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E L A B Y R I N T H 
//******************************************************************************************************************
class _gamelabyrinth:public _game{
        protected:
                _gamelabyrinth(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamelabyrinth(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
        private:
                bool tipplabyrinth();
                bool clickplayfoundationlabyrinth(_card*c);
        private:
                int sourcardx;
                int sourcardy;
};
//******************************************************************************************************************
//										G A M E L A B Y R I N T H E A S I E R
//******************************************************************************************************************
class _gamelabyrintheasier:public _gamelabyrinth{
        public:
                _gamelabyrintheasier(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E L A B Y R I N T H R O D E N B A C H
//******************************************************************************************************************
class _gamelabyrinthrodenbach:public _gamelabyrinth{
        public:
                _gamelabyrinthrodenbach(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E L A B Y R I N T H D O U B L E
//******************************************************************************************************************
class _gamelabyrinthdouble:public _gamelabyrinth{
        public:
                _gamelabyrinthdouble(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E S W E E T M A T C H 
//******************************************************************************************************************
class _gamesweetmatch:public _game{//_gamelabyrinth
        public:
                _gamesweetmatch(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
        private:
                bool tippsweetmatch();
                void tippexecutesweetmatch();
                bool clickplaysweetmatch(_card*c);
        private:
	            int sourx;
	            int soury;
	            int sourn;
};
//******************************************************************************************************************
//										G A M E K I N G S P E A K	
//******************************************************************************************************************
class _gamekingspeak:public _game{
        public:
                _gamekingspeak(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);

};
//******************************************************************************************************************
//										G A M E A C E S U P 
//******************************************************************************************************************
class _gameacesup:public _game{
        public:
                _gameacesup(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
        private:
                bool tippacesup();
                bool clickplayacesup(_card*c);
	            int sourpile;
};
//******************************************************************************************************************
//										G A M E A C E S U P E A S Y
//******************************************************************************************************************
class _gameacesupeasy:public _gameacesup{
        public:
                _gameacesupeasy(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E O S M O S I S
//******************************************************************************************************************
class _gameosmosis:public _game{
        public:
                _gameosmosis(_solitaire*s,unsigned int mo,bool prev,bool menue);
                bool tipp();
                bool autoplay();
                bool automove();
                bool clickplay(_card*card);
        private:
                _animationpiletopile*autoplayanimationpiletopile(bool udx=false,bool udy=false,_tg vx=-20,_tg vy=0,_tg vz=-10,bool undoconstantsort=true);
};
//******************************************************************************************************************
//										G A M E V E R Y E A S Y 
//******************************************************************************************************************
class _gameveryeasy:public _gameklondikeone{
        public:
                _gameveryeasy(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E A N T 
//******************************************************************************************************************
class _gameant:public _game{
        public:
                _gameant(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E B A K E R S D O Z E N 
//******************************************************************************************************************
class _gamebakersdozen:public _game{
        protected:
                _gamebakersdozen(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gamebakersdozen(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E M A R T H A
//******************************************************************************************************************
class _gamemartha:public _gamebakersdozen{
        public:
                _gamemartha(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E F L O W E R G A R D E N
//******************************************************************************************************************
class _gameflowergarden:public _game{
        protected:
                _gameflowergarden(_solitaire*s,unsigned int mo,bool prev,bool menue,unsigned int i);
        public:
                _gameflowergarden(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
};
//******************************************************************************************************************
//										G A M E S T O N E W A L L 
//******************************************************************************************************************
class _gamestonewall:public _gameflowergarden{
        public:
                _gamestonewall(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E S T O N E W A L L E A S Y
//******************************************************************************************************************
class _gamestonewalleasy:public _gameflowergarden{
        public:
                _gamestonewalleasy(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
//******************************************************************************************************************
//										G A M E P A I R S C R O S S
//******************************************************************************************************************
class _gamepairscross:public _game{
        public:
                _gamepairscross(_solitaire*s,unsigned int mo,bool prev,bool menue);
                virtual bool tipp();
                virtual bool autoplay();
                virtual bool automove();
                virtual bool clickplay(_card*card);
        protected:
                bool tipppairscross();
                void tippexecutepairscross();
                bool clickplaypairscross(_card*card);
        private:
	            int destiterator;
	            int foundsourcard[2];
	            int founddestcard[2];
};
//******************************************************************************************************************
//										G A M E S P I D E R S U P E R S T O C K
//******************************************************************************************************************
class _gamespidersuperstock:public _gamespideronesuit{
        public:
                _gamespidersuperstock(_solitaire*s,unsigned int mo,bool prev,bool menue);
};
#endif
