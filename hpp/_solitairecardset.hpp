//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitairecardset.hpp
//  Datum       : 01.01.2009
//******************************************************************************************************************************************************************************************************
#ifndef _solitairecardset_included_
#define _solitairecardset_included_

#include <_datei.hpp>
#include <_bild.hpp>
#include <_grafik.hpp>

class _cardsetmanager;
class _cardsetbild;
class _cardset;
class _cardsetfront;
class _cardsetback;


class _solitaire;

//******************************************************************************************************************
//										C A R D S E T M A N A G E R
//******************************************************************************************************************
class _cardsetmanager{
	public:
               _cardsetmanager(_solitaire*s);
               virtual ~_cardsetmanager();
               void cleartexturehardwaresources();
               void createhardwaresourcesurfaces(_grafik*gra);
               _cardsetbild*ground(const _zeichenkette<char>&n);
               _cardsetbild*motivefront(const _zeichenkette<char>&n,int pos=0);
               _cardsetbild*motiveback(const _zeichenkette<char>&n);
               _cardsetbild*frame(const _zeichenkette<char>&n);
               _cardsetbild*structure(const _zeichenkette<char>&n);
               _cardsetbild*impurity(const _zeichenkette<char>&n);
               
               bool load(const _zeichenkette<char>&path);
               void savedynamicsets();
               _cardsetbild*erzeugenbild(const _zeichenkette<char>&file,const _zeichenkette<char>&name);
               bool fileiscardsetfront(const _zeichenkette<char>&file);			
               void loadcardset(const _zeichenkette<char>&file);
               _cardsetfront*cardsetfront(unsigned int i);			
               _cardsetback*cardsetback(unsigned int i);	
                void generatetexturefront(_grafik*gra,int i);
                void generatetextureback(_grafik*gra,int i);
                void generatetexture(_grafik*gra);
                void generatetexturepreviewall(_grafik*gra);
                void generateyellowingdeltamap();

    public:
                _solitaire*solitaire;
	            unsigned int width;
	            unsigned int height;
	            unsigned int widthsmall;
	            unsigned int heightsmall;
	            unsigned int widthmicro;
	            unsigned int heightmicro;
	            _listebasis<_cardsetfront> cardsetfrontlist;
	            _listebasis<_cardsetback> cardsetbacklist;
	            _cardset*actualedit;
	            //source lists
	            _listebasis<_cardsetbild> groundlist;
	            _listebasis<_cardsetbild> motivefrontlist;
	            _listebasis<_cardsetbild> motivebacklist;
	            _listebasis<_cardsetbild> framelist;
	            _listebasis<_cardsetbild> structurelist;
	            _listebasis<_cardsetbild> impuritylist;
	            //destination textures
	            _bild<_tb>*bildback;
	            _bild<_tb>*bildfront[52];
	            _bild<_tb>*bildbacksmall;
                _bild<_tb>*bildfrontsmall[52];
	            _bild<_tb>*bildbackmicro;
	            _bild<_tb>*bildfrontmicro[52];
	            _textur<_tb>*texturback;
	            _textur<_tb>*texturfront[52];
	            _textur<_tb>*texturbacksmall;
                _textur<_tb>*texturfrontsmall[52];
	            _textur<_tb>*texturbackmicro;
	            _textur<_tb>*texturfrontmicro[52];
	            //algorithm
	            unsigned int yellowingpointcount;
	            _to*yellowingdeltamap;
	            _to yellowingpoint[400];	
	            _to*scratchsdeltamap;  
};	 

//******************************************************************************************************************
//										C A R D S E T B I L D
//******************************************************************************************************************
class _cardsetbild:public _bild<_tb>,public _listenknotenbasis<_cardsetbild>{
        public:
                _cardsetbild(_cardsetmanager*cm,const _zeichenkette<char>&f,const _zeichenkette<char>&n);
                virtual ~_cardsetbild();
                _textur<_tb>*textur();
                void save(_datei*d);
                void load(_datei*d);
        public:
                _cardsetmanager*cardsetmanager;
        	    //_listenknoten<_cardsetbild>*linkmanager;
	            _listenknoten<_cardsetbild>*linkset;
	            _zeichenkette<char> name;
	            _textur<_tb>*ptextur;
};	

//******************************************************************************************************************
//										C A R D S E T 
//******************************************************************************************************************
class _cardset:public _listenknotenbasis<_cardset>{
        public:
                _cardset(_cardsetmanager*);
                virtual ~_cardset();
                void clearlocallists();
                void reset();
                virtual void addstructure(const _zeichenkette<char>&file,const _zeichenkette<char>&name);
                virtual void addground(const _zeichenkette<char>&file,const _zeichenkette<char>&name);
                virtual void addmotive(const _zeichenkette<char>&file,const _zeichenkette<char>&name)=0;
                virtual void addframe(const _zeichenkette<char>&file,const _zeichenkette<char>&name);
                virtual void addimpurity(const _zeichenkette<char>&file,const _zeichenkette<char>&name);
                void setground(const _zeichenkette<char>&n);
                void setmotive(const _zeichenkette<char>&n);
                void setframe(const _zeichenkette<char>&n,_to fn,_to fp,_to fb);
                void setstructureframe(const _zeichenkette<char>&n,_to v);
                void setstructureground(const _zeichenkette<char>&n,_to v,bool beh);
                void setimpurity(const _zeichenkette<char>&n,_to v,_to vy,_to vs);
                bool opensource(_grafik*gra,bool front);
                void closesource();
                bool opensourcetexture(_bild<_tb>*t);
                void closesourcetexture();
                void opendestination(_bild<_tb>*t);
                void closedestination();
                void generate(int index,bool frontset);
                void generatesmall();
                void generatemicro();
                virtual void generatetexture(_grafik*g)=0;
                virtual void generatetexturepreview(_grafik*g)=0;
                virtual void save(const _zeichenkette<char>&file)=0;
                void savecardset(_datei*d);
                virtual void load(const _zeichenkette<char>&file)=0;
                void loadcardset(_datei*d);
    public:
	            _cardsetmanager*cardsetmanager;
	            _zeichenkette<char> file;
                bool loaded;
        	    bool statisch;
                
                _liste<_cardsetbild> groundlist;
                _zeichenkette<char> groundselection;//Selektion Hintergrund
                _zeichenkette<char> groundselectiondefault;

                _liste<_cardsetbild> motivelist;//of textures [0..n] (im GUI versteckt)
                _zeichenkette<char> motiveselection;//Selektion Motive
                _zeichenkette<char> motiveselectiondefault;

                _liste<_cardsetbild> framelist;//of textures [0..n]
                _zeichenkette<char> frameselection;//Selektion Rahmen
                _zeichenkette<char> frameselectiondefault;
	            _to framefornumbers;
	            _to frameforpictures;
	            _to frameforbacksides;
	            _to framefornumbersdefault;
	            _to frameforpicturesdefault;
	            _to frameforbacksidesdefault;

                _liste<_cardsetbild> structurelist;//of textures [0..n]
                _to structureground;//Regler Hintergrundstrukturierung
                _to structuregrounddefault;
                _zeichenkette<char> structuregroundselection;//Selektion Hintergrundstrukturierung
                _zeichenkette<char> structuregroundselectiondefault;
                bool structuregroundbehind;
                bool structuregroundbehinddefault;
                _to structureframe; //Regler Rahmenstrukturierung
                _to structureframedefault;
                _zeichenkette<char> structureframeselection;//Selektion Rahmenstrukturierung
                _zeichenkette<char> structureframeselectiondefault;

                _liste<_cardsetbild> impuritylist;//of textures [0..n]
                _to impurity;//Regler Verunreinigungstextur
                _to impuritydefault;
                _zeichenkette<char> impurityselection;//Selektion Verunreinungstextur
                _zeichenkette<char> impurityselectiondefault;
                _to impurityyellowing;//Regler alrorithmische Vergilbung
                _to impurityyellowingdefault;
                _to impurityscratchs;//Regler Algorithmische Verkratzung
                _to impurityscratchsdefault;

	            _tb*sourcetexture;
	            _bildhardware*surftexture;
	            _tb*sourceground;
	            _bildhardware*surfground;
	            _tb*sourcegroundstructure;
	            _bildhardware*surfgroundstructure;
	            _tb*sourceimpurity;
	            _bildhardware*surfimpurity;
	            _tb*sourcemotive;
	            _bildhardware*surfmotive;
	            _tb*sourceframe;
	            _bildhardware*surfframe;
	            _tb*sourceframestructure;
	            _bildhardware*surfframestructure;
	            _tb*destination;
	            _bild<_tb>*destinationtexture;
	            _bildhardware*destinationsurface;
	            bool destinationhardware;
};	

//******************************************************************************************************************
//										C A R D S E T F R O N T
//******************************************************************************************************************
class _cardsetfront:public _cardset,public _listenknotenbasis<_cardsetfront>{
        public:
                _cardsetfront(_cardsetmanager*cm);
                virtual ~_cardsetfront();
                virtual void addmotive(const _zeichenkette<char>&file,const _zeichenkette<char>&name);
                unsigned int index();
                void motiveiterator(_grafik*gra,unsigned int pos);
                virtual void generatetexture(_grafik*gra);
                virtual void generatetexturepreview(_grafik*gra);
                virtual void save(const _zeichenkette<char>&f);
                virtual void load(const _zeichenkette<char>&f);
        public:
	            _bild<_tb>*bildpreview[4];
	            _textur<_tb>*texturpreview[4];
};

//******************************************************************************************************************
//										C A R D S E T B A C K 
//******************************************************************************************************************
class _cardsetback:public _cardset,public _listenknotenbasis<_cardsetback>{
        public:
                _cardsetback(_cardsetmanager*cm);
                virtual ~_cardsetback();
                virtual void addmotive(const _zeichenkette<char>&file,const _zeichenkette<char>&name);
                unsigned int index();
                virtual void generatetexture(_grafik*gra);
                virtual void generatetexturepreview(_grafik*gra);
                virtual void save(const _zeichenkette<char>&f);
                virtual void load(const _zeichenkette<char>&f);
        public:                
	            _bild<_tb>*bildpreview;
	            _textur<_tb>*texturpreview;
};

#endif