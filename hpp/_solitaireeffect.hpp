//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitaireeffect.cpp
//  Datum       : 18.12.2008
//******************************************************************************************************************************************************************************************************
#ifndef _solitaireeffect_included_
#define _solitaireeffect_included_

class _background;
class _uhr;
class _figure;
class _kamin2;
class _kaminfeuer;
class _candle;
class _smoke;
class _blase;
class _fireworkrocket;
class _fireworkimage;
class _page;

#include <_bild.hpp>
#include <_weltpolygon.hpp>
//#include <_bild.hpp>
//#include <_solitaire.hpp>

class _solitairefantasy;
class _solitaire;
class _cardsetmanager;
class _game;
//******************************************************************************************************************
//										B A C K G R O U N D
//******************************************************************************************************************
class _background{
        public:
                _background(_solitaire*s);
                virtual ~_background();
                void draw(_grafik*gra,_kamera<_tg>*cam);
                void drawfront(_grafik*gra,_kamera<_tg>*cam);
                void updatetexture();
        public:
                _solitaire*solitaire;
                _welt*world;
                _netz*mesh;
                _netz*meshlight;
                _to opacity;
                _bild<_tb>*icandleholder;
};
//******************************************************************************************************************
//										U H R
//******************************************************************************************************************
class _uhr{
        public:
                _uhr(_solitaire*s);
                virtual ~_uhr();
                void animatevoid();
                void animate();
                void draw(_grafik*gra,_kamera<_tg>*cam);
                void rotate(_netz*o0,_netz*o1,_tg mx,_tg my,_tg mz,_tg angle);
        public:
                _vektor3<_tg> position;
                _solitaire*solitaire;
                _to opacity;
                _netz*mhourorg;
                _netz*mhour;
                _netz*mminuteorg;
                _netz*mminute;
                _netz*msecondorg;
                _netz*msecond;
                _netz*mpendulumorg;
                _netz*mpendulum;
                int schlagmodus;
                int schlagstatus;
                int schlagstart;
                int schlagzahl;
                _tg schlagvolumen;
                int oh;
                int om;
                int os;
};
//******************************************************************************************************************
//										F I G U R E
//******************************************************************************************************************
class _figure{
        public:
                _figure(_solitairefantasy*s,_bild<_tb>*i,_tg x,_tg y);
                virtual ~_figure();
                void draw(_grafik*gra,_kamera<_tg>*cam);
                void animate();
                bool inner();
        public:
	            _vektor3<_tg> position;
	            _solitairefantasy*solitaire;
	            _to opacity;
	            _tg nx,ny;
	            _bild<_tb>*imagefigure;
};

//******************************************************************************************************************
//										K A M I N F E U E R 
//******************************************************************************************************************
class _kaminfeuer:public _partikelquelle{
        public:
                _kaminfeuer(_welt*w,_zeit*z,_listebasis<_partikelquelle>*pql,_listebasis<_partikel>*pl);
                virtual ~_kaminfeuer();
                virtual _partikel*erzeugenpartikel(const _vektor3<_tg>&pos);
        public:
                _vektor3<_tg> positionbase;
};
//******************************************************************************************************************
//										K A M I N 2
//******************************************************************************************************************
class _kamin2{
        public:
                _kamin2(_solitaire*s,_tg x,_tg y,_tg z,_tg scale,_listebasis<_partikel>*pl);
                virtual ~_kamin2();
                _tg intensity();
                void animate();
                void deactivate();
                void activate();
                void opacity(_to op);
        public:
                _vektor3<_tg> position;
                _solitaire*solitaire;
                //Field channel:TChannel=0;//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                _kaminfeuer*flamme[2];
                _partikelquelle*funken;
                _tg pumptime[2];
                bool pumpup[2];
                int pumpgenrate[2];
                int pumplifetime[2];
                _tg rotfac[2];
                _tg offsetrnd[2];
                _tg oldintensity;
                _tg newintensity;
				_netz*m;
				_netz*m2;
				_netz*mf;
};
//******************************************************************************************************************
//										C A N D L E
//******************************************************************************************************************
class _candle:public _licht<_tg,_to>,public _listenknotenbasis<_candle>{
        public:
                _candle(_solitaire*s,_tg x,_tg y,_tg z,_tg i,_tg scalecorona,_tg scaleparticle,_listebasis<_partikel>*pl,bool im=false);
                virtual ~_candle();
                void draw(_grafik*gra,_kamera<_tg>*cam);
                void updatecoronamesh();
                void animatecurve(_zeit*clock);
                void animate(_zeit*c);
                void opacity(_to op);
        public:
	            _solitaire*solitaire;
	            _vektor3<_tg> position;
	            _vektor3<_tg> positionoriginal;
	            _tg intensityorg;
	            _to popacity;
	            _vektor3<_to> lightcolor;
	            _partikelquelle*flamme;
	            _tg pumptime;
	            int pumpup;
	            int pumpgenrate;
	            int pumplifetime;
	            _tg windfactor;
	            _vektor3<_tg> windvector;
	            _tg windflicker;
	            _tg windflickeramplitude;
	            _netz*corona;
	            _vektor3<_tg> coronavx;
	            _vektor3<_tg> coronavy;
	            _vektor3<_tg> coronavxuse;
	            _vektor3<_tg> coronavyuse;
	            _vektor3<_tg> coronaposition;
	            _vektor3<_tg> coronaoffset;
	            _kurvehermite3<_tg> curve;
	            _tg curvet;
	            _tg curvespeed;
	            _tg curvetime;
	            _vektor3<_tg> curvevector;
	            bool sparked;
	            bool inmenu;
};
//******************************************************************************************************************
//										S M O K E 
//******************************************************************************************************************
class _smoke{
        public:
	            _smoke(_solitaire*s,_tg x,_tg y,_tg z,_tg i,_tg scalecorona,_tg scaleparticle,_listebasis<_partikel>*pl,bool im=false);
	            virtual ~_smoke();
                void draw(_grafik*gra,_kamera<_tg>*cam);
                void updatecoronamesh();
                void animatecurve(_zeit*clock);
                void animate(_zeit*c);
        public:	
	            _solitaire*solitaire;
	            _vektor3<_tg> position;
	            _vektor3<_tg> positionoriginal;
	            _partikelquelle*flamme;
	            _tg pumptime;
	            int pumpup;
	            int pumpgenrate;
	            int pumplifetime;
	            _netz*corona;
	            _vektor3<_tg> coronavx;
	            _vektor3<_tg> coronavy;
	            _vektor3<_tg> coronavxuse;
	            _vektor3<_tg> coronavyuse;
	            _vektor3<_tg> coronaposition;
	            _vektor3<_tg> coronaoffset;
	            _kurvehermite3<_tg> curve;
	            _tg curvet;
	            _tg curvespeed;
	            _tg curvetime;
	            _vektor3<_tg> curvevector;
	            bool sparked;
	            bool inmenu;	
				_netz*netz;
				_vektor4<_to> farbe;
};
//******************************************************************************************************************
//										B L A S E
//******************************************************************************************************************
class _blase:public _listenknotenbasis<_blase>{
        public:
                _blase(_solitaire*s,_game*g,const _vektor3<_tg>&o,_tg w,_tg h,int rx,int ry,_textur<_tb>*tf,_textur<_tb>*tb);
                virtual ~_blase();
                void calculatevertex();
                void impuls(_tg s);
                void animate();
        public:
                _solitaire*solitaire;
                _game*game;
                _flaechehermite<_tg> hp;
                _geometrienetz*gg;
                _netz*meshfront;
                _tg width;
                _tg height;
                _vektor3<_tg> tanz[4];
                _vektor3<_tg> tanzmust[4];
                _vektor3<_tg> tanzvector[4];
                _tg tanzvelocity;
                _tg tanzfriction;
};
//******************************************************************************************************************
//										F I R E W O R K I M A G E 
//******************************************************************************************************************
class _fireworkimage:public _partikelquelle{
        public:
                _fireworkimage(_solitaire*s,_welt*w,_listebasis<_partikelquelle>*psl,_listebasis<_partikel>*pl,_zeit*c);
                virtual ~_fireworkimage();
                virtual void animieren();
                virtual void generieren();
        public:
                _solitaire*solitaire;
                _partikelquelle*lightborder;
                bool sheepmode;
};	
//******************************************************************************************************************
//										F I R E W O R K R O C K E T
//******************************************************************************************************************
class _fireworkrocket:public _partikelquelle{
        public:
                _fireworkrocket(_solitaire*s,_welt*w,_listebasis<_partikelquelle>*psl,_listebasis<_partikel>*pl,_zeit*c);
                virtual ~_fireworkrocket();
                virtual void animieren();
                virtual void generieren();
        public:
	            _solitaire*solitaire;
};
//******************************************************************************************************************
//										P A G E 
//******************************************************************************************************************
class _page:public _listenknotenbasis<_page>{
        public:
                _page(_solitaire*s,_textur<_tb>*tf,_textur<_tb>*tb,_textur<_tb>*tex,_tg w,_tg h);
                virtual ~_page();
                void updateshadow();
                void calculatevertex();
                void copyvertexcolor();
                void set(_tg x,_tg y);
                void animate(_zeit*c);
                void limittangent();
        public:
	            _solitaire*solitaire;
	            _liste<_schatten<_tg,_to> > shadowlist;
	            _flaechehermite<_tg> hp;
	            _geometrienetz*gg;
	            _netz*meshfront;
	            _netz*meshback;
	            _tg parax;
	            _tg paray;
	            _tg mxn;
	            _tg targetdx;
	            _tg dx;
	            _tg width;
	            _tg height;
};
#endif