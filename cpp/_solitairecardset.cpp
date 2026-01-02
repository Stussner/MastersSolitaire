//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitairecardset.cpp
//  Datum       : 29.11.2008
//******************************************************************************************************************************************************************************************************
#include "../hpp/_solitairecardset.hpp"
#include "../hpp/_solitaire.hpp"
    
//******************************************************************************************************************
//										C A R D S E T M A N A G E R
//******************************************************************************************************************                    
_cardsetmanager::_cardsetmanager(_solitaire*s){	    
	            width=256;
	            height=256;
	            widthsmall=64;
	            heightsmall=128;
	            widthmicro=32;
	            heightmicro=32;
                yellowingpointcount=0;			
				yellowingdeltamap=new _to[width*height*4];
				scratchsdeltamap=new _to[width*height*4];
				generateyellowingdeltamap();
				solitaire=s;
				bildback=new _bild<_tb>(width,height,4);
				for(int i=0;i<52;i++) bildfront[i]=new _bild<_tb>(width,height,4);
				bildbacksmall=new _bild<_tb>(widthsmall,heightsmall,4);
				for(int i=0;i<52;i++) bildfrontsmall[i]=new _bild<_tb>(widthsmall,heightsmall,4);
				bildbackmicro=new _bild<_tb>(widthmicro,heightmicro,4);
				for(int i=0;i<52;i++) bildfrontmicro[i]=new _bild<_tb>(widthmicro,heightmicro,4);

				texturback=new _textur<_tb>();
				texturback->einfuegenbitmap(bildback);
				for(int i=0;i<52;i++) {
				 texturfront[i]=new _textur<_tb>();
				 texturfront[i]->einfuegenbitmap(bildfront[i]);
				};
				texturbacksmall=new _textur<_tb>();
				texturbacksmall->einfuegenbitmap(bildbacksmall);
				for(int i=0;i<52;i++) {
				 texturfrontsmall[i]=new _textur<_tb>();
				 texturfrontsmall[i]->einfuegenbitmap(bildfrontsmall[i]);
				};
				texturbackmicro=new _textur<_tb>();
				texturbackmicro->einfuegenbitmap(bildbackmicro);
				for(int i=0;i<52;i++) {
				 texturfrontmicro[i]=new _textur<_tb>();
				 texturfrontmicro[i]->einfuegenbitmap(bildfrontmicro[i]);
				};
};
_cardsetmanager::~_cardsetmanager(){
                delete yellowingdeltamap;
                delete scratchsdeltamap;
                texturback->loeschen();
				deletesecure(texturback);
				for(int i=0;i<52;i++) {
				 texturfront[i]->loeschen();
				 deletesecure(texturfront[i]);
				};
				texturbacksmall->loeschen();
				deletesecure(texturbacksmall);
				for(int i=0;i<52;i++) {
				 texturfrontsmall[i]->loeschen();
				 deletesecure(texturfrontsmall[i]);
				};
				texturbackmicro->loeschen();
				deletesecure(texturbackmicro);
				for(int i=0;i<52;i++) {
				 texturfrontmicro[i]->loeschen();
				 deletesecure(texturfrontmicro[i]);
				};
};	
void _cardsetmanager::createhardwaresourcesurfaces(_grafik*gra){
				gra->bindenbild(bildback);
				gra->bindenbild(bildbacksmall);
				gra->bindenbild(bildbackmicro);
				for(int i=0;i<52;i++){
				 gra->bindenbild(bildfront[i]);
				 gra->bindenbild(bildfrontsmall[i]);
				 gra->bindenbild(bildfrontmicro[i]);
				};
			
};				
void _cardsetmanager::cleartexturehardwaresources(){
				_cardsetbild*tit;
				if(groundlist.anfang(tit))do{
				 tit->loeschenbildhardware();
				}while(groundlist.naechstes(tit));
				if(structurelist.anfang(tit))do{
				 tit->loeschenbildhardware();
				}while(structurelist.naechstes(tit));
				if(motivefrontlist.anfang(tit))do{
				 tit->loeschenbildhardware();
				}while(motivefrontlist.naechstes(tit));
				if(motivebacklist.anfang(tit))do{
				 tit->loeschenbildhardware();
				}while(motivebacklist.naechstes(tit));
				if(framelist.anfang(tit))do{
				 tit->loeschenbildhardware();
				}while(framelist.naechstes(tit));
				if(impuritylist.anfang(tit))do{
				 tit->loeschenbildhardware();
				}while(impuritylist.naechstes(tit));
};				
_cardsetbild*_cardsetmanager::ground(const _zeichenkette<char>&n){
				if(n=="") return(0);
				_cardsetbild*tit;
				if(groundlist.anfang(tit))do{
				 if(tit->name==n) return(tit);
				}while(groundlist.naechstes(tit));
				return(0);
};				
_cardsetbild*_cardsetmanager::motivefront(const _zeichenkette<char>&n,int pos){
				if(n=="") return(0);
				_cardsetbild*tit;
				if(motivefrontlist.anfang(tit))do{
				 if(tit->name==n){
				  if(pos<=0) return(tit);
				  if(pos>51) return(tit);
				  unsigned int i=0;
				  do{ 
				   motivefrontlist.naechstes(tit);
				   i++;
				  }while(i!=pos);
				  return(tit);//else{ return(0)
				 };
				}while(motivefrontlist.naechstes(tit));
				return(0);
};				
_cardsetbild*_cardsetmanager::motiveback(const _zeichenkette<char>&n){
				if(n=="") return(0);
				_cardsetbild*tit;
				if(motivebacklist.anfang(tit))do{
				 if(tit->name==n) return(tit);
				}while(motivebacklist.naechstes(tit));
				return(0);
};			
_cardsetbild*_cardsetmanager::frame(const _zeichenkette<char>&n){
				if(n=="") return(0);
				_cardsetbild*tit;
				if(framelist.anfang(tit))do{
				 if(tit->name==n) return(tit);
				}while(framelist.naechstes(tit));
				return(0);
};				
_cardsetbild*_cardsetmanager::structure(const _zeichenkette<char>&n){
				if(n=="") return(0);
				_cardsetbild*tit;
				if(structurelist.anfang(tit))do{
				 if(tit->name==n) return(tit);
				}while(structurelist.naechstes(tit));
				return(0);
};				
_cardsetbild*_cardsetmanager::impurity(const _zeichenkette<char>&n){
				if(n=="") return(0);
				_cardsetbild*tit;
				if(impuritylist.anfang(tit))do{
				 if(tit->name==n) return(tit);
				}while(impuritylist.naechstes(tit));
				return(0);
};


				
bool _cardsetmanager::load(const _zeichenkette<char>&path){					
				//alles einlesen, cardsets und die texturelisten aufbauen
				//cardsets selektionen setzen
                _zeichenkette<char> h=path+"\\*.sol";
                HANDLE fHandle; 
                WIN32_FIND_DATAA wfd; 
                fHandle=FindFirstFileA(h,&wfd); 
                if(fHandle==INVALID_HANDLE_VALUE) return(false);
                loadcardset(path+"\\"+wfd.cFileName);
                
                while(FindNextFileA(fHandle,&wfd)){ 
                 if (wfd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY){ 
                  //Datei ist keine, sondern ein Verzeichnis... 
                 }else{ 
                  loadcardset(path+"\\"+wfd.cFileName);
                 };
                };
                FindClose(fHandle);				
				return(true);
				/*
				Local dir=ReadDir(path)
				if(Not dir 
				 RuntimeError "failed to read card sets directory"
				}else{
				 Repeat
				  Local t$=NextFile(dir)
				  if(t="" Exit
				  if(t="." || t=".." Continue
				  if(t.find(".sol")!=-1 loadcardset(path+"\"+t)	
				 Forever
				 CloseDir(dir)
				};
				*/
};
void _cardsetmanager::savedynamicsets(){
                _cardsetfront*fit;
                _cardsetback*bit;
                if(cardsetfrontlist.anfang(fit))do{
                 if(fit->statisch==false) fit->save(fit->file);
                }while(cardsetfrontlist.naechstes(fit));
                if(cardsetbacklist.anfang(bit))do{
                 if(bit->statisch==false) bit->save(bit->file);
                }while(cardsetbacklist.naechstes(bit));
};				
_cardsetbild*_cardsetmanager::erzeugenbild(const _zeichenkette<char>&file,const _zeichenkette<char>&name){
				return(new _cardsetbild(this,file,name));
};	
bool _cardsetmanager::fileiscardsetfront(const _zeichenkette<char>&file){				
				_zeichenkette<char> h;
                _datei d(file);
                if(d.oeffnennurlesen()){
				 d.laden(h);
                 d.schliessen();
                };				
				if(h=="front") return(true); else return(false);
};
void _cardsetmanager::loadcardset(const _zeichenkette<char>&file){
				L->schreiben("_cardsetmanager::loadcardset : ",file);
	 			_cardset*cs;
				if(fileiscardsetfront(file)){
				 L->schreiben("_ist front : ",file);
				 cs=new _cardsetfront(this);
				 cs->load(file);
				}else{
				 L->schreiben("_ist back : ",file);
				 cs=new _cardsetback(this);
				 cs->load(file);
				};
};			
_cardsetfront*_cardsetmanager::cardsetfront(unsigned int i){
				return(cardsetfrontlist[i]);
};	
_cardsetback*_cardsetmanager::cardsetback(unsigned int i){
				return(cardsetbacklist[i]);
};
void _cardsetmanager::generatetexturefront(_grafik*gra,int i){
				_cardsetfront*csf=cardsetfront(i);
				if(csf) csf->generatetexture(gra);
};
void _cardsetmanager::generatetextureback(_grafik*gra,int i){
				_cardsetback*csb=cardsetback(i);
				if(csb) csb->generatetexture(gra);
};
void _cardsetmanager::generatetexture(_grafik*gra){
				_cardsetfront*csf=cardsetfront(solitaire->cardtexturefrontindex);
				_cardsetback*csb=cardsetback(solitaire->cardtexturebackindex);
				if(csf) csf->generatetexture(gra);
				if(csb) csb->generatetexture(gra);
};				
void _cardsetmanager::generatetexturepreviewall(_grafik*gra){
				_cardsetfront*csf;
				_cardsetback*csb;
                if(cardsetfrontlist.anfang(csf))do{
                 csf->generatetexturepreview(gra);
                }while(cardsetfrontlist.naechstes(csf));
                if(cardsetbacklist.anfang(csb))do{
                 csb->generatetexturepreview(gra);
                }while(cardsetbacklist.naechstes(csb));				
};				
void _cardsetmanager::generateyellowingdeltamap(){			
				yellowingpointcount=zufall<unsigned int>(10,15);
				//Local h#=0.001
				//Local t#=Float(0.001)/Float(burnpointcount)
				for(unsigned int i=0;i<yellowingpointcount;i++){
				 yellowingpoint[i*4+0]=zufall<_to>(-1,+1);
				 yellowingpoint[i*4+1]=zufall<_to>(-1,+1);
				 yellowingpoint[i*4+2]=_to(1)/zufall<_to>(0.1,0.4);
				 yellowingpoint[i*4+3]=zufall<_to>(0.03,0.08);
				};					
				_to fx=-1;
				_to fy=-1;
				_to dx,dy;
				_to e0;
				_to e1;
				unsigned int bi;
				unsigned int gi;
				unsigned int ri;
				_to ss=_to(1)/_to(2*0.3*0.3);//optimation gauss
				_to*dm=yellowingdeltamap;
				_to wh=_to(width)/2;
				_to hh=_to(height)/2;
				_to fsx=_to(1)/wh;//optimation step
				_to fsy=_to(1)/hh;//optimation step
				fy=-1;
			    for(int y=0;y<height;y++){
			  	 fx=-1;
				 for(int x=0;x<width;x++){
				  fx=(_to(x)-wh)/wh;
				  fy=(_to(y)-hh)/hh;
				  e0=0;
				  e1=0;
				  for(int i=0;i<yellowingpointcount;i++){
				   dx=yellowingpoint[i*4+0]-fx;
				   dy=-yellowingpoint[i*4+1]-fy;
				   e0+=exp(-(dx*dx+dy*dy)*yellowingpoint[i*4+2])*yellowingpoint[i*4+3];//e0+(burnpoint[i,2]*(dx*dx+dy*dy))
   				  };
				  dm[0]=0.18+e0*0.9;
				  dm+=1;
				  dm[0]=0.22+e0*1.2;
				  dm+=1;
				  dm[0]=0.32+e0*1.8;
				  dm+=1;
				  dm[0]=0.3+e0;
				  dm+=1;
				  fx+=fsx;
				 };
				 fy+=fsy;
			 	};					
};

//******************************************************************************************************************
//										C A R D S E T B I L D
//******************************************************************************************************************
_cardsetbild::_cardsetbild(_cardsetmanager*cm,const _zeichenkette<char>&f,const _zeichenkette<char>&n):_bild<_tb>(1,1,1),_listenknotenbasis<_cardsetbild>(0){	
				cardsetmanager=cm;
				name=n;
				dateiname(f);
				if(f!=""){
				 _bild<_tb>::laden();//init(f);
				 //if(image=0 return
				 //if(image.width!=cardsetmanager->width return
				 //if(image.height!=cardsetmanager->height return
				}else{
				 _bild<_tb>::groesse(cardsetmanager->width,cardsetmanager->height,4);
				};
				
				ptextur=new _textur<_tb>();
				ptextur->einfuegenbitmap(this);
};
_cardsetbild::~_cardsetbild(){
				//deletesecure(linkmanager);
				deletesecure(linkset);
				deletesecure(ptextur);
};		
_textur<_tb>*_cardsetbild::textur(){
                return(ptextur);
};
void _cardsetbild::save(_datei*d){		
				d->speichern(name);
				d->speichern(dateiname());
				//Local data:Byte Ptr=PixmapPixelPtr(LockImage(image))	;			
				datentausch(0,2);
				d->speichern((char*)daten(),cardsetmanager->width*cardsetmanager->height*4);
				datentausch(0,2);
				//UnlockImage(image);
};		
void _cardsetbild::load(_datei*d){		
				d->laden(name);
				_zeichenkette<char> fn;
				
				d->laden(fn);
				dateiname(fn);
				//Local data:Byte Ptr=PixmapPixelPtr(LockImage(image));				
				unsigned long int l=0;
				d->laden((char*)daten(),cardsetmanager->width*cardsetmanager->height*4,l);
				datentausch(0,2);
				//UnlockImage(image);
};	


//******************************************************************************************************************
//										C A R D S E T 
//******************************************************************************************************************
_cardset::_cardset(_cardsetmanager*cm){
    			cardsetmanager=cm;
                loaded=false;
        	    statisch=false;
	            framefornumbers=0;
	            frameforpictures=0;
	            frameforbacksides=0;
	            framefornumbersdefault=0;
	            frameforpicturesdefault=0;
	            frameforbacksidesdefault=0;
                structureground=0;
                structuregrounddefault=0;
                structuregroundbehind=false;
                structuregroundbehinddefault=false;
                structureframe=0;
                structureframedefault=0;
                impurity=0;
                impuritydefault=0;
                impurityyellowing=0;
                impurityyellowingdefault=0;
                impurityscratchs=0;
                impurityscratchsdefault=0;
	            sourcetexture=0;
	            surftexture=0;
	            sourceground=0;
	            surfground=0;
	            sourcegroundstructure=0;
	            surfgroundstructure=0;
	            sourceimpurity=0;
	            surfimpurity=0;
	            sourcemotive=0;
	            surfmotive=0;
	            sourceframe=0;
	            surfframe=0;
	            sourceframestructure=0;
	            surfframestructure=0;
	            destination=0;
	            destinationtexture=0;
	            destinationsurface=0;
	            destinationhardware=false;			
};				
_cardset::~_cardset(){
				clearlocallists();
};				
void _cardset::clearlocallists(){
				groundlist.aushaengen();
				motivelist.aushaengen();
				framelist.aushaengen();
				structurelist.aushaengen();
				impuritylist.aushaengen();
};
void _cardset::reset(){
				groundselection=groundselectiondefault;
				motiveselection=motiveselectiondefault;
				frameselection=frameselectiondefault;
				framefornumbers=framefornumbersdefault;
				frameforpictures=frameforpicturesdefault;
				frameforbacksides=frameforbacksidesdefault;
				structureground=structuregrounddefault;
				structuregroundselection=structuregroundselectiondefault;
				structuregroundbehind=structuregroundbehinddefault;
				structureframe=structureframedefault;
				structureframeselection=structureframeselectiondefault;
				impurity=impuritydefault;
				impurityselection=impurityselectiondefault;
				impurityyellowing=impurityyellowingdefault;
				impurityscratchs=impurityscratchsdefault;
};				
void _cardset::addstructure(const _zeichenkette<char>&file,const _zeichenkette<char>&name){
				_cardsetbild*t=cardsetmanager->erzeugenbild(file,name);
				t->linkset=structurelist.einhaengen(t);
				/*t->linkmanager=*/cardsetmanager->structurelist.einhaengen(t);
};								
void _cardset::addground(const _zeichenkette<char>&file,const _zeichenkette<char>&name){
				_cardsetbild*t=cardsetmanager->erzeugenbild(file,name);
				t->linkset=groundlist.einhaengen(t);
				/*t->linkmanager=*/cardsetmanager->groundlist.einhaengen(t);
};						
//void _cardset::addmotive(const _zeichenkette<char>&file,const _zeichenkette<char>&name)=0;
void _cardset::addframe(const _zeichenkette<char>&file,const _zeichenkette<char>&name){
				_cardsetbild*t=cardsetmanager->erzeugenbild(file,name);
				t->linkset=framelist.einhaengen(t);
				/*t->linkmanager=*/cardsetmanager->framelist.einhaengen(t);
};						
void _cardset::addimpurity(const _zeichenkette<char>&file,const _zeichenkette<char>&name){
				_cardsetbild*t=cardsetmanager->erzeugenbild(file,name);
				t->linkset=impuritylist.einhaengen(t);
				/*t->linkmanager=*/cardsetmanager->impuritylist.einhaengen(t);
};						
void _cardset::setground(const _zeichenkette<char>&n){
				groundselection=n;
				groundselectiondefault=n;
};				
void _cardset::setmotive(const _zeichenkette<char>&n){
				motiveselection=n;
				motiveselectiondefault=n;
};		
void _cardset::setframe(const _zeichenkette<char>&n,_to fn,_to fp,_to fb){
				frameselection=n;
				frameselectiondefault=n;
				frameforbacksides=fb;
				frameforpictures=fp;
				framefornumbers=fn;
				frameforbacksidesdefault=fb;
				frameforpicturesdefault=fp;
				framefornumbersdefault=fn;
};		
void _cardset::setstructureframe(const _zeichenkette<char>&n,_to v){
				structureframe=v;
				structureframedefault=v;
				structureframeselection=n;
				structureframeselectiondefault=n;
};									
void _cardset::setstructureground(const _zeichenkette<char>&n,_to v,bool beh){
				structureground=v;
				structuregrounddefault=v;
				structuregroundselection=n;
				structuregroundselectiondefault=n;
				structuregroundbehind=beh;
				structuregroundbehinddefault=beh;
};	
void _cardset::setimpurity(const _zeichenkette<char>&n,_to v,_to vy,_to vs){
			    impurity=v; //Regler Verunreinigungstextur
			    impuritydefault=v;
			    impurityselection=n;//Selektion Verunreinungstextur
			    impurityselectiondefault=n;
			    impurityyellowing=vy;//Regler alrorithmische Vergilbung
			    impurityyellowingdefault=vy;
			    impurityscratchs=vs;//Regler Algorithmische Verkratzung
			    impurityscratchsdefault=vs;
};
bool _cardset::opensource(_grafik*gra,bool front){
				sourceground=0;
				surfground=0;
				sourcegroundstructure=0;
				surfgroundstructure=0;
				sourceimpurity=0;
				surfimpurity=0;
				sourcemotive=0;
				surfmotive=0;
				sourceframe=0;
				surfframe=0;
				sourceframestructure=0;
				surfframestructure=0;
	
				_cardsetbild*texground=cardsetmanager->ground(groundselection);
				_cardsetbild*texmotive=0;
				if(front){
				 texmotive=cardsetmanager->motivefront(motiveselection);
				}else{
				 texmotive=cardsetmanager->motiveback(motiveselection);
				};
				_cardsetbild*texframe=cardsetmanager->frame(frameselection);
				_cardsetbild*texgroundstructure=cardsetmanager->structure(structuregroundselection);
				_cardsetbild*texframestructure=cardsetmanager->structure(structureframeselection);
				_cardsetbild*teximpurity=cardsetmanager->impurity(impurityselection);
				if(texground==0) return(false);
				
				
				if(texground->bildhardware()==0) gra->bindenbild(texground);
				if(texground->bildhardware()){
				 surfground=texground->bildhardware();
				 surfground->oeffnen();
				 sourceground=surfground->daten();					
				};
				
				if(texgroundstructure){
				 if(texgroundstructure->bildhardware()==0) gra->bindenbild(texgroundstructure);
				 if(texgroundstructure->bildhardware()){
				  surfgroundstructure=texgroundstructure->bildhardware();
				  surfgroundstructure->oeffnen();
				  sourcegroundstructure=surfgroundstructure->daten();
				 };				
				};
				
				if(teximpurity){
				 if(teximpurity->bildhardware()==0) gra->bindenbild(teximpurity);
				 if(teximpurity->bildhardware()){
				  surfimpurity=teximpurity->bildhardware();
				  surfimpurity->oeffnen();
				  sourceimpurity=surfimpurity->daten();
				 };
				};				

				if(texmotive){
				 if(texmotive->bildhardware()==0) gra->bindenbild(texmotive);
				 if(texmotive->bildhardware()){
				  surfmotive=texmotive->bildhardware();
				  surfmotive->oeffnen();
				  sourcemotive=surfmotive->daten();
				 };				
				};
				
				if(texframe){
				 if(texframe->bildhardware()==0) gra->bindenbild(texframe);
				 if(texframe->bildhardware()){
				  surfframe=texframe->bildhardware();
				  surfframe->oeffnen();
				  sourceframe=surfframe->daten();
				 };
				};				
				
				if(texframestructure){
				 if(texframestructure->bildhardware()==0) gra->bindenbild(texframestructure);
				 if(texframestructure->bildhardware()){
				  if(texframestructure!=texgroundstructure){
				   surfframestructure=texframestructure->bildhardware();
				   surfframestructure->oeffnen();
				   sourceframestructure=surfframestructure->daten();
				  }else{
				   sourceframestructure=sourcegroundstructure;
				  };
				 };
				};	
				
				return(true);		
};						
void _cardset::closesource(){
                
				if(surfground) surfground->schliessen();
				if(surfframe) surfframe->schliessen();
				if(surfgroundstructure) surfgroundstructure->schliessen();
				if(surfframestructure) surfframestructure->schliessen();
				if(surfmotive) surfmotive->schliessen();
				if(surfimpurity) surfimpurity->schliessen();

				sourceground=0;
				surfground=0;
				sourcegroundstructure=0;
				surfgroundstructure=0;
				sourceimpurity=0;
				surfimpurity=0;
				sourcemotive=0;
				surfmotive=0;
				sourceframe=0;
				surfframe=0;
				sourceframestructure=0;
				surfframestructure=0;
				
};	
bool _cardset::opensourcetexture(_bild<_tb>*t){
				sourcetexture=0;
				surftexture=0;
				if(t->bildhardware()){
				 surftexture=t->bildhardware();
				 surftexture->oeffnen();
				 sourcetexture=surftexture->daten();
				 return(true);
				};
				return(false);			
};						
void _cardset::closesourcetexture(){
				if(surftexture) surftexture->schliessen();
				surftexture=0;
};								
void _cardset::opendestination(_bild<_tb>*t){
				destination=0;
				destinationsurface=0;
				destinationhardware=false;
				destinationtexture=t;
				
				if(destinationtexture->bildhardware()){
				 destinationhardware=true;
				 destinationsurface=destinationtexture->bildhardware();
				 destinationsurface->oeffnen();
				 destination=destinationsurface->daten();			  
				}else{
				 //Local pmd:TPixmap=LockImage(destinationtexture.image)
				 destination=destinationtexture->daten();
				};
								
};		
void _cardset::closedestination(){				
                
				if(destinationhardware){
				 destinationsurface->schliessen();
				}else{
				 //UnlockImage(destinationtexture.image)
				};
										
};
void _cardset::generate(int index,bool frontset){
				unsigned int m=0;
				_to r=0;
				_to g=0;
				_to b=0;
				_to a=0;
				_to rd=_to(1)/_to(256);
				_to*yellowit=cardsetmanager->yellowingdeltamap;
				bool drawframe=false;
				_to drawframeopacity=0;
				_to structureoffset=20;
				_to structurefactor=1.1;
				if(sourceframe){
				 if(frontset){
				  if((index<4)||(index>39)){
				   if(frameforpictures>nahenull){
				    drawframe=true;
				    drawframeopacity=frameforpictures;
				   };
				  }else{
				   if(framefornumbers>nahenull){
				    drawframe=true;
				    drawframeopacity=framefornumbers;
				   };
				  };
				 }else{
				  if(frameforbacksides>nahenull){
				   drawframe=true;
				   drawframeopacity=frameforbacksides;
				   };
				 };
				};
				
				unsigned int dit=cardsetmanager->width*cardsetmanager->height-1;
				for(unsigned int j=0;j<dit;j++){
				 //-------------------------------------------- load ground --------------------------------------------------
				 r=sourceground[m+2];
				 g=sourceground[m+1];
				 b=sourceground[m+0];
				 a=sourceground[m+3];
				 r*=rd;
				 g*=rd;
				 b*=rd;
				 a*=rd;
				 //-------------------------------------------- add groundstructure if(fronted -------------------------------
				 if(structuregroundbehind){
				  if((sourcegroundstructure)&&(structureground>0)){
				   r=r*(1-structureground)+((sourcegroundstructure[m+2]+structureoffset)*rd*structurefactor*r)*structureground;
				   g=g*(1-structureground)+((sourcegroundstructure[m+1]+structureoffset)*rd*structurefactor*g)*structureground;
				   b=b*(1-structureground)+((sourcegroundstructure[m+0]+structureoffset)*rd*structurefactor*b)*structureground;
				  };
				 };
				 //-------------------------------------------- add frame && structure --------------------------------------
				 if(drawframe){
				  _to fr=(sourceframe[m+2]*rd);
				  _to fg=(sourceframe[m+1]*rd);
				  _to fb=(sourceframe[m+0]*rd);
				  if((sourceframestructure)&&(structureframe>0)){
				   fr=fr*(1-structureframe)+((sourceframestructure[m+2]+structureoffset)*rd*structurefactor*fr)*structureframe;
				   fg=fg*(1-structureframe)+((sourceframestructure[m+1]+structureoffset)*rd*structurefactor*fg)*structureframe;
				   fb=fb*(1-structureframe)+((sourceframestructure[m+0]+structureoffset)*rd*structurefactor*fb)*structureframe;
				  };
				  _to op=sourceframe[m+3]*rd*drawframeopacity;
				  _to oq=1-op;
				  r=r*oq+fr*op;
				  g=g*oq+fg*op;
				  b=b*oq+fb*op;				
				 };
				 //-------------------------------------------- add motive ---------------------------------------------------
				 if(sourcemotive){
				  _to op=sourcemotive[m+3]*rd;
				  _to oq=1-op;
				  r=r*oq+(sourcemotive[m+2]*rd)*op;
				  g=g*oq+(sourcemotive[m+1]*rd)*op;
				  b=b*oq+(sourcemotive[m+0]*rd)*op;				
				 };
				 //-------------------------------------------- add impurity -------------------------------------------------
				 if((sourceimpurity)&&(impurity>0)){
				  _to op=impurity*(sourceimpurity[m+3]*rd);
				  _to oq=1-op;
				  r=r*oq+(sourceimpurity[m+2]*rd)*op;
				  g=g*oq+(sourceimpurity[m+1]*rd)*op;
				  b=b*oq+(sourceimpurity[m+0]*rd)*op;
				 };				
				 //-------------------------------------------- add groundstructure if(fronted -------------------------------
				 if(structuregroundbehind==false){
				  if((sourcegroundstructure)&&(structureground>0)){
				   r=r*(1-structureground)+((sourcegroundstructure[m+2]+structureoffset)*rd*structurefactor*r)*structureground;
				   g=g*(1-structureground)+((sourcegroundstructure[m+1]+structureoffset)*rd*structurefactor*g)*structureground;
				   b=b*(1-structureground)+((sourcegroundstructure[m+0]+structureoffset)*rd*structurefactor*b)*structureground;
				  };
				 };
				 //-------------------------------------------- add yellowing ------------------------------------------
				 if(impurityyellowing>0){
				  r-=yellowit[0]*impurityyellowing;
				  g-=yellowit[1]*impurityyellowing;
				  b-=yellowit[2]*impurityyellowing;
				 };				
				 //-------------------------------------------- set result to destination ------------------------------------
				 if(r<0) r=0;
				 if(g<0) g=0;
				 if(b<0) b=0;
				 if(r>1) r=1;
				 if(g>1) g=1;
				 if(b>1) b=1;
				 if(destinationhardware){
				  destination[m+2]=unsigned char(r*255);
				  destination[m+1]=unsigned char(g*255);
				  destination[m+0]=unsigned char(b*255);
				  destination[m+3]=unsigned char(a*255);	
				 }else{
				  destination[m+0]=unsigned char(r*255);
				  destination[m+1]=unsigned char(g*255);
				  destination[m+2]=unsigned char(b*255);
				  destination[m+3]=unsigned char(a*255);	
				 };			
				 m+=4;
				 yellowit+=4;
				};
};	
void _cardset::generatesmall(){
				unsigned int di=0;
				_to r=0;
				_to g=0;
				_to b=0;
				_to a=0;
				_to rd=_tg(1)/_tg(256);
				unsigned int dit=cardsetmanager->widthsmall*cardsetmanager->heightsmall-1;
				unsigned int sx;
			    unsigned int sy;
				unsigned int fx=cardsetmanager->width/cardsetmanager->widthsmall;
				unsigned int fy=cardsetmanager->height/cardsetmanager->heightsmall;
				_to fc=_to(1)/_to(fx*fy);
				for(unsigned int dy=0;dy<cardsetmanager->heightsmall;dy++){
				 for(unsigned int dx=0;dx<cardsetmanager->widthsmall;dx++){
				  sx=dx*fx;
				  sy=dy*fy;
				  r=0;
				  g=0;
				  b=0;
				  a=0;
				  for(unsigned int siy=sy;siy<(sy+fy);siy++){
				   for(unsigned int six=sx;six<(sx+fx);six++){
				    unsigned int si=(siy*cardsetmanager->width+six)*4;
				    r+=_to(sourcetexture[si+2])*rd;
				    g+=_to(sourcetexture[si+1])*rd;
				    b+=_to(sourcetexture[si+0])*rd;
				    a+=_to(sourcetexture[si+3])*rd;
				   };
				  };
				  r*=fc;
				  g*=fc;
				  b*=fc;
				  a*=fc;
				  a=1;
				  if(dx==0) a*=0.5;
				  if(dy==0) a*=0.5;
				  if(dx==(cardsetmanager->widthsmall-1)) a*=0.5;
				  if(dy==(cardsetmanager->heightsmall-1)) a*=0.5;
				  if(destinationhardware){
				   destination[di+2]=unsigned char(r*255);
				   destination[di+1]=unsigned char(g*255);
				   destination[di+0]=unsigned char(b*255);
				   destination[di+3]=unsigned char(a*255);	
				  }else{
				   destination[di+0]=unsigned char(r*255);
				   destination[di+1]=unsigned char(g*255);
				   destination[di+2]=unsigned char(b*255);
				   destination[di+3]=unsigned char(a*255);	
				  };			
				  di+=4;
				 };
				};
};							
void _cardset::generatemicro(){
				unsigned int di=0;
				_to r=0;
				_to g=0;
				_to b=0;
				_to a=0;
				_to rd=_to(1)/_to(256);
				unsigned int dit=cardsetmanager->widthmicro*cardsetmanager->heightmicro-1;
				unsigned int sx;
				unsigned int sy;
				unsigned int fx=cardsetmanager->width/cardsetmanager->widthmicro;
				unsigned int fy=cardsetmanager->height/cardsetmanager->heightmicro;
				_to fc=_to(1)/_to(fx*fy);
				for(unsigned int dy=0;dy<cardsetmanager->heightmicro;dy++){
				 for(unsigned int dx=0;dx<cardsetmanager->widthmicro;dx++){
				  sx=dx*fx;
				  sy=dy*fy;
				  r=0;
				  g=0;
				  b=0;
				  a=0;
				  for(unsigned int siy=sy;siy<(sy+fy);siy++){
				   for(unsigned int six=sx;six<(sx+fx);six++){
				    unsigned int si=(siy*cardsetmanager->width+six)*4;
				    r+=_to(sourcetexture[si+2])*rd;
				    g+=_to(sourcetexture[si+1])*rd;
				    b+=_to(sourcetexture[si+0])*rd;
				    a+=_to(sourcetexture[si+3])*rd;
				   };
				  };
				  r*=fc;
				  g*=fc;
				  b*=fc;
				  a*=fc;
				  a=1;
				  if(dx==0) a*=0.5;
				  if(dy==0) a*=0.5;
				  if(dx==(cardsetmanager->widthmicro-1)) a*=0.5;
				  if(dy==(cardsetmanager->heightmicro-1)) a*=0.5;
				  if(destinationhardware){
				   destination[di+2]=unsigned char(r*255);
				   destination[di+1]=unsigned char(g*255);
				   destination[di+0]=unsigned char(b*255);
				   destination[di+3]=unsigned char(a*255);	
				  }else{
				   destination[di+0]=unsigned char(r*255);
				   destination[di+1]=unsigned char(g*255);
				   destination[di+2]=unsigned char(b*255);
				   destination[di+3]=unsigned char(a*255);	
				  };			
				  di+=4;
				 };
				};
};							
void _cardset::savecardset(_datei*d){
				_listenknoten<_cardsetbild>*tit;
				d->speichern(statisch);
    			d->speichern(groundlist.anzahl());
				if(groundlist.anfang(tit))do{
				 tit->objekt()->save(d);
				}while(groundlist.naechstes(tit));
			    d->speichern(groundselection);
			    d->speichern(groundselectiondefault);

    			d->speichern(motivelist.anzahl());
				if(motivelist.anfang(tit))do{
				 tit->objekt()->save(d);
				}while(motivelist.naechstes(tit));
				d->speichern(motiveselection);
				d->speichern(motiveselectiondefault);

    			d->speichern(framelist.anzahl());
				if(framelist.anfang(tit))do{
				 tit->objekt()->save(d);
				}while(framelist.naechstes(tit));
			    d->speichern(frameselection);
			    d->speichern(frameselectiondefault);
				d->speichern(framefornumbers);
				d->speichern(frameforpictures);
				d->speichern(frameforbacksides);
				d->speichern(framefornumbersdefault);
				d->speichern(frameforpicturesdefault);
				d->speichern(frameforbacksidesdefault);

    			d->speichern(structurelist.anzahl());
				if(structurelist.anfang(tit))do{
				 tit->objekt()->save(d);
				}while(structurelist.naechstes(tit));
    			d->speichern(structureground);
    			d->speichern(structuregrounddefault);
    			d->speichern(structuregroundselection);
    			d->speichern(structuregroundselectiondefault);
				d->speichern(structuregroundbehind);
				d->speichern(structuregroundbehinddefault);
    			d->speichern(structureframe);
    			d->speichern(structureframedefault);
    			d->speichern(structureframeselection);
    			d->speichern(structureframeselectiondefault);

    			d->speichern(impuritylist.anzahl());
				if(impuritylist.anfang(tit))do{
				 tit->objekt()->save(d);
				}while(impuritylist.naechstes(tit));
    			d->speichern(impurity);
    			d->speichern(impuritydefault);
    			d->speichern(impurityselection);
    			d->speichern(impurityselectiondefault);
    			d->speichern(impurityyellowing);
    			d->speichern(impurityyellowingdefault);
    			d->speichern(impurityscratchs);
    			d->speichern(impurityscratchsdefault);
};				
void _cardset::loadcardset(_datei*d){
				unsigned int c=0;
				_cardsetbild*tit;
				_zeichenkette<char> typ;
				d->laden(typ);
				clearlocallists();			
				d->laden(statisch);
				d->laden(c);
				L->schreiben("cardset::loadcardset : ",(int)c);
				for(unsigned int i=0;i<c;i++){
				 tit=new _cardsetbild(cardsetmanager,"","");
				 tit->load(d);
				 tit->linkset=groundlist.einhaengen(tit);
				 /*tit->linkmanager=*/cardsetmanager->groundlist.einhaengen(tit);
				};
			    d->laden(groundselection);
			    d->laden(groundselectiondefault);
			
				d->laden(c);
				for(unsigned int i=0;i<c;i++){
				 tit=new _cardsetbild(cardsetmanager,"","");
				 tit->load(d);
				 tit->linkset=motivelist.einhaengen(tit);
				 if(typ=="front"){
				  /*tit->linkmanager=*/cardsetmanager->motivefrontlist.einhaengen(tit);
				 }else{
				  /*tit->linkmanager=*/cardsetmanager->motivebacklist.einhaengen(tit); 
				 };
				};
			    d->laden(motiveselection);
			    d->laden(motiveselectiondefault);
			
				d->laden(c);
				for(unsigned int i=0;i<c;i++){
				 tit=new _cardsetbild(cardsetmanager,"","");
				 tit->load(d);
				 tit->linkset=framelist.einhaengen(tit);
				 /*tit->linkmanager=*/cardsetmanager->framelist.einhaengen(tit);
				};
			    d->laden(frameselection);
			    d->laden(frameselectiondefault);
				d->laden(framefornumbers);
				d->laden(frameforpictures);
				d->laden(frameforbacksides);
				d->laden(framefornumbersdefault);
				d->laden(frameforpicturesdefault);
				d->laden(frameforbacksidesdefault);

				d->laden(c);
				for(unsigned int i=0;i<c;i++){
				 tit=new _cardsetbild(cardsetmanager,"","");
				 tit->load(d);
				 tit->linkset=structurelist.einhaengen(tit);
				 /*tit->linkmanager=*/cardsetmanager->structurelist.einhaengen(tit);
				};
				
    			d->laden(structureground);
    			d->laden(structuregrounddefault);
    			d->laden(structuregroundselection);
    			d->laden(structuregroundselectiondefault);
				d->laden(structuregroundbehind);
				d->laden(structuregroundbehinddefault);
    			d->laden(structureframe);
    			d->laden(structureframedefault);
    			d->laden(structureframeselection);
    			d->laden(structureframeselectiondefault);

				d->laden(c);
				for(unsigned int i=0;i<c;i++){
				 tit=new _cardsetbild(cardsetmanager,"","");
				 tit->load(d);
				 tit->linkset=impuritylist.einhaengen(tit);
				 /*tit->linkmanager=*/cardsetmanager->impuritylist.einhaengen(tit);
				};

    			d->laden(impurity);
    			d->laden(impuritydefault);
    			d->laden(impurityselection);
    			d->laden(impurityselectiondefault);
    			d->laden(impurityyellowing);
    			d->laden(impurityyellowingdefault);
    			d->laden(impurityscratchs);
    			d->laden(impurityscratchsdefault);
				
};


//******************************************************************************************************************
//										C A R D S E T F R O N T
//******************************************************************************************************************
_cardsetfront::_cardsetfront(_cardsetmanager*cm):_cardset(cm),_listenknotenbasis<_cardsetfront>(&cm->cardsetfrontlist){
				for(int j=0;j<4;j++) {
				 bildpreview[j]=new _bild<_tb>(cardsetmanager->width,cardsetmanager->height,4);
				 texturpreview[j]=new _textur<_tb>();
				 texturpreview[j]->einfuegenbitmap(bildpreview[j]);
				};
};
_cardsetfront::~_cardsetfront(){
				for(int j=0;j<4;j++) {
				 texturpreview[j]->loeschen();
				 deletesecure(texturpreview[j]);
				 bildpreview[j]=0;
				};
};
void _cardsetfront::addmotive(const _zeichenkette<char>&file,const _zeichenkette<char>&name){
				_cardsetbild*t=cardsetmanager->erzeugenbild(file,name);
				t->linkset=motivelist.einhaengen(t);
				/*t->linkmanager=*/cardsetmanager->motivefrontlist.einhaengen(t);
};	
unsigned int _cardsetfront::index(){
				unsigned int i=0;
				_cardsetfront*cit;
				if(cardsetmanager->cardsetfrontlist.anfang(cit))do{
				 if(cit==this) return(i);
				 i++;
				}while(cardsetmanager->cardsetfrontlist.naechstes(cit));
				return(0);
};				
void _cardsetfront::motiveiterator(_grafik*gra,unsigned int pos){
				if(surfmotive) surfmotive->schliessen();
				surfmotive=0;
				sourcemotive=0;
				
				_cardsetbild*texmotive=cardsetmanager->motivefront(motiveselection,pos);
				if(texmotive){
				 if(texmotive->bildhardware()==0) gra->bindenbild(texmotive);
				 if(texmotive->bildhardware()){
				  surfmotive=texmotive->bildhardware();
				  surfmotive->oeffnen();
				  sourcemotive=surfmotive->daten();
				 };				
				};
				
};
void _cardsetfront::generatetexture(_grafik*gra){
				if(opensource(gra,true)==false) return;
				for(unsigned int i=0;i<52;i++){
				 opendestination(cardsetmanager->bildfront[i]);
				 generate(i,true);
				 closedestination();
				 if(i<51) motiveiterator(gra,i+1);
				 if(impurityyellowing>0) if((i%4)==0) cardsetmanager->generateyellowingdeltamap();
				};
				closesource();
				for(unsigned int i=0;i<52;i++){
				 if(opensourcetexture(cardsetmanager->bildfront[i])){
				  opendestination(cardsetmanager->bildfrontsmall[i]);
				  generatesmall();
				  closedestination();
				  closesourcetexture();
				 }; 
				};
				for(unsigned int i=0;i<52;i++){
				 if(opensourcetexture(cardsetmanager->bildfront[i])){
				  opendestination(cardsetmanager->bildfrontmicro[i]);
				  generatemicro();
				  closedestination();
				  closesourcetexture();
				 }; 
				};
};							
void _cardsetfront::generatetexturepreview(_grafik*gra){
				//Print "generatetexturepreview front"
				if(opensource(gra,true)==false) return;
				unsigned int s=0;
				unsigned int n=0;
				for(unsigned int i=0;i<4;i++){
				 if(i==0){
				  s=0;
				  n=0;
				 };
				 if(i==1){
				  s=1;
				  n=6;
				 };
				 if(i==2){
				  s=3;
				  n=11;
				 };
				 if(i==3){
				  s=2;
				  n=12;
				 };
				 motiveiterator(gra,s+n*4);
				 opendestination(bildpreview[i]);
				 generate(s+n*4,true);
				 closedestination();		
				};
				closesource();
};							
void _cardsetfront::save(const _zeichenkette<char>&f){
				file=f;
				_datei d(f);
				if(d.oeffnen()){
			     d.loeschen();
				// d.speichern(f);
				 //if(s==0) RuntimeError "failed to save cardsetfront" 
				 d.speichern(_zeichenkette<char>("front"));
				 _cardset::savecardset(&d);
				 d.schliessen();
				};
};	
void _cardsetfront::load(const _zeichenkette<char>&f){
				file=f;
				_datei d(f);
				if(d.oeffnennurlesen()){ 
				 _cardset::loadcardset(&d);
				 d.schliessen();
				}else{
				 //RuntimeError "failed To Load cardsetfront" 
				};
};									

	            
//******************************************************************************************************************
//										C A R D S E T B A C K 
//******************************************************************************************************************
_cardsetback::_cardsetback(_cardsetmanager*cm):_cardset(cm),_listenknotenbasis<_cardsetback>(&cm->cardsetbacklist){
				bildpreview=new _bild<_tb>(cardsetmanager->width,cardsetmanager->height,4);
				texturpreview=new _textur<_tb>();
				texturpreview->einfuegenbitmap(bildpreview);
};
_cardsetback::~_cardsetback(){
                texturpreview->loeschen();
				deletesecure(texturpreview);
				bildpreview=0;
};				
void _cardsetback::addmotive(const _zeichenkette<char>&file,const _zeichenkette<char>&name){
				_cardsetbild*t=cardsetmanager->erzeugenbild(file,name);
				t->linkset=motivelist.einhaengen(t);
				/*t->linkmanager=*/cardsetmanager->motivebacklist.einhaengen(t);
};		
unsigned int _cardsetback::index(){
				unsigned int i=0;
				_cardsetback*cit;
				if(cardsetmanager->cardsetbacklist.anfang(cit))do{
				 if(cit==this) return(i);
				 i++;
				}while(cardsetmanager->cardsetbacklist.naechstes(cit));
				return(0);
};								
void _cardsetback::generatetexture(_grafik*gra){
				if(opensource(gra,false)==false) return;
				opendestination(cardsetmanager->bildback);
				cardsetmanager->generateyellowingdeltamap();
				generate(0,false);
				closedestination();
				closesource();
				if(opensourcetexture(cardsetmanager->bildback)){
				 opendestination(cardsetmanager->bildbacksmall);
				 generatesmall();
				 closedestination();
				 closesourcetexture();
				}; 				
				if(opensourcetexture(cardsetmanager->bildback)){
				 opendestination(cardsetmanager->bildbackmicro);
				 generatemicro();
				 closedestination();
				 closesourcetexture();
				}; 				
};							
void _cardsetback::generatetexturepreview(_grafik*gra){
				if(opensource(gra,false)==false) return;
				opendestination(bildpreview);
				generate(0,false);
				closedestination();
				closesource();
};							
void _cardsetback::save(const _zeichenkette<char>&f){
				file=f;
				_datei d(f);
				if(d.oeffnen()){
			     d.loeschen();
				 //d.speichern(f);
				 //if(s==0) RuntimeError "failed to save cardsetback" 
				 d.speichern(_zeichenkette<char>("back"));
				 _cardset::savecardset(&d);
			 	 d.schliessen();
				};
};		
void _cardsetback::load(const _zeichenkette<char>&f){
				file=f;
				_datei d(f);
				if(d.oeffnennurlesen()){
				 _cardset::loadcardset(&d);
				 d.schliessen();
				};
};							

