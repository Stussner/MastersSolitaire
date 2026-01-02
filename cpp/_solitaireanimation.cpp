//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitaireanimation.cpp
//  Datum       : 02.12.2008
//******************************************************************************************************************************************************************************************************
 
#include "../hpp/_solitaireanimation.hpp"
#include "../hpp/_solitairegame.hpp"
#include "../hpp/_solitairepile.hpp"


//******************************************************************************************************************
//										A N I M A T I O N
//******************************************************************************************************************
_animation::_animation(_game*g,_tg spd,_tg intv):_speicherbarbinaer(g->solitaire),_listenknotenbasis<_animation>(&g->animationlist){
				game=g;
				countiterator=0;
                timestart=0;
                actiontime=0;
                actionakku=0;
                started=false;
                skipable=true;
                preparative=false;
                cardinpreparationafteranimation=true;
                cardcounttotal=0;
                soundstartvolume=0.9;
                soundactionvolume=0.7;
                usesoundstart=true;
	            usesoundaction=false;
				soundstart=game->solitaire->smove;
				soundaction=game->solitaire->sturn;
				curvespeed=spd;
				actionintervall=intv;
};
_animation::~_animation(){
				//clearstoreablelink();
};				
void _animation::insertgame(){
				deinsertgame();
				game->animationlist.einhaengen(this);
};
void _animation::deinsertgame(){
                _listenknotenbasis<_animation>::aushaengen();
};
void _animation::start(bool){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 curvingcardlist.aushaengen();
				};
};
bool _animation::checkend(){
				if(curvingcardlist.anzahl()>0){
				 bool curving=false;
				 _listenknoten<_card>*cit;
				 if(curvingcardlist.anfang(cit))do{
				  if(cit->objekt()->curving){
				   curving=true;
				  }else{
				   if(cardinpreparationafteranimation==false) cit->objekt()->inpreparation=false;
				  };
				 }while(curvingcardlist.naechstes(cit));
				 if(curving==false) return(true);
				};
				return(false);
};
bool _animation::checkendcount(){
				if(int(curvingcardlist.anzahl())>=cardcounttotal){
				 bool curving=false;
				 _listenknoten<_card>*cit;
				 if(curvingcardlist.anfang(cit))do{
				  if(cit->objekt()->curving){
				   curving=true;
				  }else{
				   if(cardinpreparationafteranimation==false) cit->objekt()->inpreparation=false;
				  };
				 }while(curvingcardlist.naechstes(cit));
				 if(curving==false) return(true);
				};
				return(false);
};

void _animation::skipcurvingcards(){
				_listenknoten<_card>*cit;
				if(curvingcardlist.anfang(cit))do{
				 cit->objekt()->position=cit->objekt()->curveposition.ort(1);
				 cit->objekt()->vx=cit->objekt()->curvevx.ort(1);
				 cit->objekt()->vy=cit->objekt()->curvevy.ort(1);
				 cit->objekt()->updatemesh();
				 cit->objekt()->curving=false;
				}while(curvingcardlist.naechstes(cit));
				//curvingcardlist.aushaengen()
};
void _animation::load(_datei*d){
};
void _animation::save(_datei*d){
};
void _animation::assoziieren(){
};

//******************************************************************************************************************
//										A N I M A T I O N C O U N T
//******************************************************************************************************************
_animationcount::_animationcount(_animation*a):_listenknotenbasis<_animationcount>(&a->counts){
                value=0;
                anzahl=0;
                index=0;
                index2=0;
                angle=0;
                iterator=0;
                iteratoroffset=0;
                pile=0;
                card=0;
                cardindex=-1;
};
_animationcount::~_animationcount(){
};
void _animationcount::scale(_tg f){
				position.mul(f);
				vx.mul(f);
				vy.mul(f);
				vector.mul(f);
};
void _animationcount::translate(const _vektor3<_tg>&d){
	 			position.add(d);
};

//******************************************************************************************************************
//										A N I M A T I O N U N D O 
//******************************************************************************************************************
_animationundo::_animationundo(_game*g,_tg spd,_tg intv,bool r):_animation(g,spd,intv),_listenknotenbasis<_animationundo>(&g->undolist){
				constantsort=r;
				skipable=false;
            	iterator=0;
	            forward=false;
	            redealdelta=0;
	            redealpile=0;
	            loadproccc=0;
	            loadprocii=-1;
};
_animationundo::~_animationundo(){
};
void _animationundo::scale(_tg f){
                _animationundoentry*eit;
				if(anfang(eit))do{
				 eit->curveposition.ort(0)*=f;
				 eit->curveposition.ort(1)*=f;
				 eit->curveposition.aktualisieren();
				}while(naechstes(eit));
};
void _animationundo::translate(const _vektor3<_tg>&d){
                _animationundoentry*eit;
				if(anfang(eit))do{
				 eit->curveposition.ort(0)+=d;
				 eit->curveposition.ort(1)+=d;
				}while(naechstes(eit));
};
void _animationundo::use(_card*c,_pile*pt,bool firstt,int indxt,int indyt,int indzt,_pile*pf,bool firstf,int indxf,int indyf,int indzf,const _kurvehermite3<_tg>&p,const _kurvehermite3<_tg>&vx,const _kurvehermite3<_tg>&vy,bool firstinsert){
				new _animationundoentry(this,c,pt,firstt,indxt,indyt,indzt,pf,firstf,indxf,indyf,indzf,p,vx,vy,firstinsert);
};
void _animationundo::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 curvingcardlist.aushaengen();
				 if(constantsort){
				  iterator=_listebasis<_animationundoentry>::erstes();
				 }else{
				  if(forward){
				   iterator=_listebasis<_animationundoentry>::erstes();
				  }else{ 
				   iterator=_listebasis<_animationundoentry>::letztes();
				  }; 
				 };
				 if((redealpile)&&(redealdelta!=0)){
				  if(forward){
				   redealpile->redealcount-=redealdelta;
				  }else{
				   redealpile->redealcount+=redealdelta;
				  };
				 };
				};
};
bool _animationundo::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(iterator){
				  _animationundoentry*eit=iterator;
				  _card*card=eit->card;
				  _pilepyramid*pp=dynamic_cast<_pilepyramid*>(card->pile);
				  _pilelabyrinth*pl=dynamic_cast<_pilelabyrinth*>(card->pile);
				  _pilesweetmatch*ps=dynamic_cast<_pilesweetmatch*>(card->pile);
				  _pilearray*pa=dynamic_cast<_pilearray*>(card->pile);
				  if(pp) card->deinsertpyramid();
				  if(pl) card->deinsertlabyrinth();
				  if(ps) card->deinsertsweetmatch();
				  if(pa) card->deinsertarray();
				  card->deinsertpile();
				  card->curveposition=eit->curveposition;
				  card->curvevx=eit->curvevx;
				  card->curvevy=eit->curvevy;
				  card->curvespeed=curvespeed;
				  if(forward){
				   card->insertpile(eit->pileto,eit->firstto,eit->indexto[0]);
				   pl=dynamic_cast<_pilelabyrinth*>(eit->pileto);
				   if(pl) card->insertlabyrinth(pl,eit->indexto[0],eit->indexto[1]);
				   ps=dynamic_cast<_pilesweetmatch*>(eit->pileto);
				   if(ps) card->insertsweetmatch(ps,eit->indexto[0],eit->indexto[1]);
				   pa=dynamic_cast<_pilearray*>(eit->pileto);
				   if(pa) card->insertarray(pa,eit->indexto[0],eit->indexto[1]);
				  }else{
				   card->curveposition.invertieren();
				   card->curvevx.invertieren();
				   card->curvevy.invertieren();
				   card->insertpile(eit->pilefrom,eit->firstfrom,eit->indexfrom[0]);
				   pp=dynamic_cast<_pilepyramid*>(eit->pilefrom);
				   if(pp) card->insertpyramid(eit->parentfrom[0],eit->parentfrom[1],eit->childfrom[0],eit->childfrom[1]);
				   pl=dynamic_cast<_pilelabyrinth*>(eit->pilefrom);
				   if(pl) card->insertlabyrinth(pl,eit->indexfrom[0],eit->indexfrom[1]);
				   ps=dynamic_cast<_pilesweetmatch*>(eit->pilefrom);
				   if(ps) card->insertsweetmatch(ps,eit->indexfrom[0],eit->indexfrom[1]);
				   pa=dynamic_cast<_pilearray*>(eit->pilefrom);
				   if(pa) card->insertarray(pa,eit->indexfrom[0],eit->indexfrom[1]);
				  };
				  card->curveposition.ort(0,card->position);
				  card->curveposition.aktualisieren();
				  card->startcurve();
				  curvingcardlist.einhaengen(card);
				  if(constantsort){
				   iterator=iterator->naechstes();if(iterator==iterator->liste()->erstes()) iterator=0;
				  }else{
				   if(forward){
				    iterator=iterator->naechstes();if(iterator==iterator->liste()->erstes()) iterator=0;
				   }else{ 
				    iterator=iterator->vorheriges();if(iterator==iterator->liste()->letztes()) iterator=0;
				   };
				  };
				 };
				};
				return(!checkend());
};
void _animationundo::skip(){
};
int _animationundo::iteratorindex(){
				int i=0;
				_animationundoentry*it;
				if((anfang(it))&&(iterator))do{
				 if(it!=iterator) i++; else return(i);
				 //!!!!!!!!!!!!!!!!!!!!!!!! Achtung : diese Stelle in blitzmax prüfen, möglicherweise fehlerhaft
				 /*
				 while(it!=iterator && it!=){
				  i+=1;
				  it=it->naechstes();
				 };
				 */
				 
				}while(naechstes(it)); 
				return(i);
};
void _animationundo::save(_datei*d){
				d->speichern("_animationundo");
				d->speichern(speichername());
				d->speichern(game->solitaire->clock->system()-actiontime);
				d->speichern(actionintervall);
				d->speichern(actionakku);
				d->speichern(curvespeed);
				d->speichern(curvingcardlist.anzahl());
				_listenknoten<_card>*cit;
				if(curvingcardlist.anfang(cit))do{
				 speichernzeiger(d,cit->objekt());
				}while(curvingcardlist.naechstes(cit));
				d->speichern(started);
				//animationundo
				d->speichern(_listebasis<_animationundoentry>::anzahl());
				_animationundoentry*eit;
				if(anfang(eit))do{
				 eit->save(d);
				}while(naechstes(eit));
				if(iterator) d->speichern(int(1)); else d->speichern(int(0));
				if(iterator) d->speichern(iteratorindex());
				d->speichern(forward);
				d->speichern(constantsort);
};
void _animationundo::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				_tg t;
				d->laden(t);
				actiontime=game->solitaire->clock->system()-t;
				d->laden(actionintervall);
				d->laden(actionakku);
				d->laden(curvespeed);
				curvingcardlist.aushaengen();
				d->laden(loadproccc);
				for(int i=0;i<loadproccc;i++){
				 ladenzeiger(d);
				};
				d->laden(started);
    			_listebasis<_animationundoentry>::loeschen();//alle entries löschen und neuladen
				int uc;
				d->laden(uc);
			    for(int i=0;i<uc;i++){
				 _kurvehermite3<_tg> dc;
				 _animationundoentry*eit=new _animationundoentry(this,0,0,true,0,0,0,0,true,0,0,0,dc,dc,dc);
				 _zeichenkette<char> typ;
				 d->laden(typ);
				 eit->load(d);
				};
				int it;
				d->laden(it);
				loadprocii=-1;
				if(it) d->laden(loadprocii);
				d->laden(forward);
				d->laden(constantsort);
};
void _animationundo::assoziieren(){
				if(zeigergeladen()){
				 for(int i=0;i<loadproccc;i++){
				  _card*c;
				  assoziierenzeiger(c);
				  curvingcardlist.einhaengen(c);
				 };
				 loeschenzeiger();
				};
				iterator=erstes();
				if(loadprocii!=-1){
				 for(int i=0;i<loadprocii;i++){
				  iterator=iterator->naechstes();
				 };
				};
				_animationundoentry*eit;
				if(anfang(eit))do{
				 eit->assoziieren();
				}while(naechstes(eit));
};
//******************************************************************************************************************
//										A N I M A T I O N U N D O E N T R Y
//******************************************************************************************************************
_animationundoentry::_animationundoentry(_animationundo*u,_card*c,_pile*pt,bool firstt,int indxt,int indyt,int indzt,_pile*pf,bool firstf,int indxf,int indyf,int indzf,const _kurvehermite3<_tg>&p,const _kurvehermite3<_tg>&vx,const _kurvehermite3<_tg>&vy,bool firstinsert):_speicherbarbinaer(u->game->solitaire){
				pileto=0;
				parentfrom[0]=0;
				parentfrom[1]=0;
				childfrom[0]=0;
				childfrom[1]=0;
				undo=u;
				card=c;
				pileto=pt;
				pilefrom=pf;
				firstto=firstt;
				firstfrom=firstf;
				indexfrom[0]=indxf;
				indexto[0]=indxt;
				indexfrom[1]=indyf;
				indexto[1]=indyt;
				indexfrom[2]=indzf;
				indexto[2]=indzt;
				if(firstinsert) _listenknotenbasis<_animationundoentry>::einhaengenerstes(u); else _listenknotenbasis<_animationundoentry>::einhaengen(u);
				curveposition=p;
				curvevx=vx;
				curvevy=vy;
				if(c){
				 parentfrom[0]=c->parent[0];
				 parentfrom[1]=c->parent[1];
				 childfrom[0]=c->child[0];
				 childfrom[1]=c->child[1];
				};
};
_animationundoentry::~_animationundoentry(){
};
void _animationundoentry::save(_datei*d){
				d->speichern("_animationundoentry");
				d->speichern(speichername());
				speichernzeiger(d,card);
				speichernzeiger(d,pileto);
				speichernzeiger(d,pilefrom);
				speichernzeiger(d,parentfrom[0]);
				speichernzeiger(d,parentfrom[1]);
				speichernzeiger(d,childfrom[0]);
				speichernzeiger(d,childfrom[1]);
				d->speichern(firstto);
				d->speichern(firstfrom);
				d->speichern(indexto[0]);
				d->speichern(indexfrom[0]);
				d->speichern(indexto[1]);
				d->speichern(indexfrom[1]);
				d->speichern(indexto[2]);
				d->speichern(indexfrom[2]);
				undo->game->solitaire->speichernkurve(d,curveposition);
				undo->game->solitaire->speichernkurve(d,curvevx);
				undo->game->solitaire->speichernkurve(d,curvevy);
};
void _animationundoentry::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				ladenzeiger(d);
				ladenzeiger(d);
				ladenzeiger(d);
				ladenzeiger(d);
				ladenzeiger(d);
				ladenzeiger(d);
				ladenzeiger(d);
				d->laden(firstto);
				d->laden(firstfrom);
				d->laden(indexto[0]);
				d->laden(indexfrom[0]);
				d->laden(indexto[1]);
				d->laden(indexfrom[1]);
				d->laden(indexto[2]);
				d->laden(indexfrom[2]);
				undo->game->solitaire->ladenkurve(d,curveposition);
				undo->game->solitaire->ladenkurve(d,curvevx);
				undo->game->solitaire->ladenkurve(d,curvevy);
				
};
void _animationundoentry::assoziieren(){
				if(zeigergeladen()){
				 assoziierenzeiger(card);
				 assoziierenzeiger(pileto);
				 assoziierenzeiger(pilefrom);
				 assoziierenzeiger(parentfrom[0]);
				 assoziierenzeiger(parentfrom[1]);
				 assoziierenzeiger(childfrom[0]);
				 assoziierenzeiger(childfrom[1]);
				 loeschenzeiger();
				};
};
//******************************************************************************************************************
//										A N I M A T I O N M O V E 
//******************************************************************************************************************
_animationmove::_animationmove(_game*g,_tg px,_tg py,_tg pz,_tg spd,_tg intv,bool iv,bool td,bool vt):_animation(g,spd,intv){
				iterator=0;
				anzahl=0;
				target.setzen(px,py,pz);
				invers=iv;
				turndirection=td;
				turnvertical=vt;
};
_animationmove::~_animationmove(){
};
void _animationmove::scale(_tg f){
				target*=f;
};
void _animationmove::translate(const _vektor3<_tg>&d){
				target+=d;
};
void _animationmove::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 cardcounttotal=game->cardlist.anzahl();
				 curvingcardlist.aushaengen();
				 if(invers) iterator=game->cardlist.erstes(); else iterator=game->cardlist.letztes();
				 anzahl=0;
				 if(usesoundstart) if(sk==false) if(game->preview==false) soundstart->abspielen(1,0.95,1.01);
				};
};
bool _animationmove::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(iterator){
				  _card*c=iterator; 
				  c->curvespeed=curvespeed;
				  _vektor3<_tg> t;
				  t=target;
				  t.z(t.z()-anzahl*game->solitaire->cardthickness);
				  c->curveposition.setzen(c->position,t,0,0,-10, 0,0,10);
				  _tg dx=c->position.x()-t.x();
				  _tg dy=c->position.y()-t.y();
				  if(turnvertical==false){
				   if(turndirection){
				    c->curvevx.setzen(c->vx,-c->vx,0,0,10,0,0,-10);
				   }else{
				    c->curvevx.setzen(c->vx,-c->vx,0,0,-10,0,0,10);
				   }; 
				   c->curvevy.setzen(c->vy,c->vy,0,0,10, 0,0,10);
				  }else{
				   c->curvevx.setzen(c->vx,c->vx,0,0,10, 0,0,10);
				   if(turndirection){
				    c->curvevy.setzen(c->vy,-c->vy,0,0,-10,0,0,10);
				   }else{
				    c->curvevy.setzen(c->vy,-c->vy,0,0,10, 0,0,-10);
				   };
				  };
				  c->startcurve();
				  curvingcardlist.einhaengen(c);
				  anzahl+=1;
				  if(invers){
				   iterator=iterator->naechstes();
				   if(iterator==iterator->liste()->erstes()) iterator=0;
				  }else{ 
				   iterator=iterator->vorheriges();
				   if(iterator==iterator->liste()->letztes()) iterator=0;
				  };
				 };
				};
				return(!checkendcount());
};
void _animationmove::skip(){
				 L->schreiben("animationmove::skip einstieg");

				while(iterator){
				 _card*c=iterator;
				 _vektor3<_tg> t=target;
				 t.z(t.z()-anzahl*game->solitaire->cardthickness);
				 c->position=t;
				 if(turnvertical==false){
				  c->vx=-c->vx;
				  c->vy= c->vy;
				 }else{
				  c->vx= c->vx;
				  c->vy=-c->vy;
				 };
				 c->updatemesh();
				 curvingcardlist.einhaengen(c);
				 anzahl+=1;
				 if(invers){
				  iterator=iterator->naechstes();
				  if(iterator==iterator->liste()->erstes()) iterator=0;
				 }else{ 
				  iterator=iterator->vorheriges();
				  if(iterator==iterator->liste()->letztes()) iterator=0;
				 };
				};
};

//******************************************************************************************************************
//										A N I M A T I O N P I L E T O C L E A R
//******************************************************************************************************************
_animationpiletoclear::_animationpiletoclear(_game*g,int numb,int sui,_tg px, _tg py,_tg pz,_tg spd,_tg intv):_animation(g,spd,intv){
				target.setzen(px,py,pz);
				number=numb;
				suit=sui;
};
_animationpiletoclear::~_animationpiletoclear(){
};
void _animationpiletoclear::scale(_tg f){
				target*=f;
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->scale(f);
				}while(counts.naechstes(ait));
};
void _animationpiletoclear::translate(const _vektor3<_tg>&d){
				target+=d;
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->translate(d);
				}while(counts.naechstes(ait));
};
void _animationpiletoclear::use(_card*){
};
void _animationpiletoclear::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 curvingcardlist.aushaengen();
				 _piletableau*pit;
				 _card*cit;
				 if(game->piletableaulist.anfang(pit))do{
				  if(pit->anfang(cit))do{
				   if((cit->number==number)&&(cit->suit==suit)){
				    _animationcount*ac=new _animationcount(this);
				    ac->card=cit;
				    
				   };
				  }while(pit->naechstes(cit));
			 	 }while(game->piletableaulist.naechstes(pit));
				 countiterator=counts.erstes();
				};
};
bool _animationpiletoclear::checkend(){
				if(curvingcardlist.anzahl()>0){
				 bool curving=false;
				 _listenknoten<_card>*cit;
				 if(curvingcardlist.anfang(cit))do{
				  if(cit->objekt()->curving) curving=true;
				 }while(curvingcardlist.naechstes(cit));
				 if(curving==false){
				  //alle karten löschen
				  curvingcardlist.loeschen();
				  return(true);
				 };
				};
				return(false);
};
bool _animationpiletoclear::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(countiterator){
				  _animationcount*ac=countiterator;
				  _card*c=ac->card;
				  c->curvespeed=curvespeed;
				  c->curveposition.setzen(c->position, target, 0,0,-10, 0,0,10);
				  c->curvevx.setzen(c->vx,-c->vx,0,0,10, 0,0,-10);
				  c->curvevy.setzen(c->vy, c->vy,0,0,10, 0,0,10);
				  c->startcurve();
				  curvingcardlist.einhaengen(c);
				  countiterator=countiterator->naechstes();if(countiterator==countiterator->liste()->erstes()) countiterator=0;
				 };
				};
				_listenknoten<_card>*cit;
				if(curvingcardlist.anfang(cit))do{
				 cit->objekt()->opacity*=_to(0.95);//=1-cit.curvepositiont
				}while(curvingcardlist.naechstes(cit));
				return(!checkend());
};
void _animationpiletoclear::skip(){
				while(countiterator){
				 _animationcount*ac=countiterator;
				 _card*c=ac->card;//???????????????????????????!!!!!!!!!!!!!!!!!!!!!!!!!
				 c->position=target;
				 c->vx=-c->vx;
				 c->vy=c->vy;
				 c->updatemesh();
				 curvingcardlist.einhaengen(c);
				 countiterator=countiterator->naechstes();if(countiterator==countiterator->liste()->erstes()) countiterator=0;
				};
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 deletesecure(ait->card);
				}while(counts.naechstes(ait));
				counts.loeschen();
};

//******************************************************************************************************************
//										A N I M A T I O N P S E U D O C L E A R
//******************************************************************************************************************
_animationpseudoclear::_animationpseudoclear(_game*g,int numb,_tg px,_tg py,_tg pz,_tg spd,_tg intv):_animation(g,spd,intv){
				target.setzen(px,py,pz);
				number=numb;
};
_animationpseudoclear::~_animationpseudoclear(){
};
void _animationpseudoclear::scale(_tg f){
				target*=f;
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->scale(f);
				}while(counts.naechstes(ait));
};
void _animationpseudoclear::translate(const _vektor3<_tg>&d){
				target+=d;
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->translate(d);
				}while(counts.naechstes(ait));
};
void _animationpseudoclear::use(_card*){
};
void _animationpseudoclear::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 curvingcardlist.aushaengen();
				 _piletableau*pit;
				 _card*cit;
				 if(game->piletableaulist.anfang(pit))do{
				  if(pit->anfang(cit))do{
				   if(cit->number==number){
				    _animationcount*ac=new _animationcount(this);
				    ac->card=cit;
				    ac->position=cit->position;
				    ac->vx=cit->vx;
				    ac->vy=cit->vy;
				    
				   };
				  }while(pit->naechstes(cit));
				 }while(game->piletableaulist.naechstes(pit));
				 countiterator=counts.erstes();
				};
};
bool _animationpseudoclear::checkend(){
				if(curvingcardlist.anzahl()>0){
				 bool curving=false;
				 _listenknoten<_card>*cit;
				 if(curvingcardlist.anfang(cit))do{
				  if(cit->objekt()->curving) curving=true;
				 }while(curvingcardlist.naechstes(cit));
				 if(curving==false){
				  //alle karten unsichtbar machen und zurücksetzen
				  _animationcount*ait;
				  if(counts.anfang(ait))do{
				   ait->card->visible=false;
				   ait->card->position=ait->position;
				   ait->card->vx=ait->vx;
				   ait->card->vy=ait->vy;
				   ait->card->updatemesh();
				  }while(counts.naechstes(ait));
				  curvingcardlist.aushaengen();
				  return(true);
				 };
				};
				return(false);
};
bool _animationpseudoclear::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(countiterator){
				  _animationcount*act=countiterator;
				  _card*c=act->card;
				  c->curvespeed=curvespeed;
				  c->curveposition.setzen(c->position,target,0,0,-10, 0,0,10);
				  c->curvevx.setzen(c->vx,c->vx,0,0,10,0,0,-10);
				  c->curvevy.setzen(c->vy,c->vy,0,0,10,0,0,10);
				  c->startcurve();
				  curvingcardlist.einhaengen(c);
				  countiterator=countiterator->naechstes();if(countiterator==countiterator->liste()->erstes()) countiterator=0;
				 };
				};
				_listenknoten<_card>*cit;
				if(curvingcardlist.anfang(cit))do{
				 cit->objekt()->opacity*=_to(0.95);//=1-cit.curvepositiont
				}while(curvingcardlist.naechstes(cit));
				return(!checkend());
};
void _animationpseudoclear::skip(){
				while(countiterator){
				 _animationcount*ac=countiterator;
				 _card*c=ac->card;
				 c->position=target;
				 c->vx.setzen(c->vx);
				 c->vy.setzen(c->vy);
				 c->updatemesh();
				 curvingcardlist.einhaengen(c);
				 countiterator=countiterator->naechstes();if(countiterator==countiterator->liste()->erstes()) countiterator=0;
				};
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->card->visible=false;
				 ait->card->position=ait->position;
				 ait->card->vx=ait->vx;
				 ait->card->vy=ait->vy;
				 ait->card->updatemesh();
				 curvingcardlist.einhaengen(ait->card);
				}while(counts.naechstes(ait));
};
//******************************************************************************************************************
//										A N I M A T I O N R O T A T I O N
//******************************************************************************************************************
_animationrotation::_animationrotation(_game*g,_tg px,_tg py,_tg pz,_tg a,_tg spd,_tg intv,int cc,int io):_animation(g,spd,intv){
				iterator=0;
				countiterator=0;
                anzahl=0;
                cardcount=0;
                cardcountarg=0;
                entrymode=false;
                relative=true;
				soundstart=game->solitaire->sspend;
				target.setzen(px,py,pz);
				angle=a;
				cardcountarg=cc;
				if(cc==-1) cardcount=game->cardlist.anzahl(); else cardcount=cc;
				iteratoroffset=io;
};
_animationrotation::~_animationrotation(){
};
void _animationrotation::scale(_tg f){
				target*=f;
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->scale(f);
				}while(counts.naechstes(ait));
};
void _animationrotation::translate(const _vektor3<_tg>&d){
				if(relative==false) target+=d;
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->translate(d);
				}while(counts.naechstes(ait));
};
void _animationrotation::use(_card*c,_tg a,_vektor3<_tg> v){
				_animationcount*e=new _animationcount(this);
				e->card=c;
				e->angle=a;
				e->vector=v;
				entrymode=true;
};
void _animationrotation::useindex(int cardindex,_tg a,_vektor3<_tg> v){
				_animationcount*e=new _animationcount(this);
				e->card=0;
				e->cardindex=cardindex;
				e->angle=a;
				e->vector=v;
				entrymode=true;
};
void _animationrotation::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 if(entrymode==false){
				  if(cardcountarg==-1) cardcounttotal=game->cardlist.anzahl()-iteratoroffset; else cardcounttotal=cardcountarg;
				  if(game->cardlist.ende(iterator)) for(int i=0;i<iteratoroffset;i++) iterator=iterator->vorheriges();
				  countiterator=0;
				 }else{
				  countiterator=counts.erstes();
				  cardcounttotal=counts.anzahl();
				  iterator=0;
				 };
				 anzahl=0;
				 curvingcardlist.aushaengen();
				 if(sk==false) if(usesoundstart) if(game->preview==false) soundstart->abspielen(0.7,0.95,1.01);
				};
};
bool _animationrotation::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				/* bool it=false;
				 if(entrymode){
				  if(countiterator) it=true;
				 }else{
				  if(iterator) it=true;
				 };*/
				 if((iterator)||(countiterator)){
				  _card*c=0;
				  _tg a;
				  _vektor3<_tg> t;
				  if(entrymode==false){
				   if(anzahl<cardcount) c=iterator; 
				   a=angle;
				   t=target;
				  }else{
				   _animationcount*ac=countiterator;
				   c=ac->card;
				   if(c==0) if(ac->cardindex!=-1) c=game->cardfromlast(ac->cardindex);
				   a=ac->angle;
				   t=ac->vector;
				  };
				  if(c){
				   c->curvespeed=curvespeed;
				   _vektor3<_tg> tvx=c->vx;
				   _vektor3<_tg> tvy=c->vy;
				   _vektor3<_tg> tvxt;
				   _vektor3<_tg> tvyt;
				   tvx.rotz(a);
				   tvy.rotz(a);
				   tvxt=tvx;
				   tvyt=tvy;
				   tvxt.rotz(90);
				   tvyt.rotz(90);
				   tvxt.normalisieren();
				   tvyt.normalisieren();
				   tvxt*=10;
				   tvyt*=10;
				   if(relative) t+=c->position;
				   c->curveposition.setzen(c->position,t,1,1,0, 0,0,0);
				   c->curvevx.setzen(c->vx,tvx,tvxt,0,0,0);
				   c->curvevy.setzen(c->vy,tvy,tvyt,0,0,0);
				   c->startcurve();
				   curvingcardlist.einhaengen(c);
				   anzahl+=1;
				  };
				  if(entrymode==false){
				   iterator=iterator->vorheriges();if(iterator==iterator->liste()->letztes()) iterator=0;
				  }else{
				   countiterator=countiterator->naechstes();if(countiterator==countiterator->liste()->erstes()) countiterator=0;
				  };
				 };
				};			    				
				return(!checkendcount());
};
void _animationrotation::skip(){
				L->schreiben("animationrotation::skip einstieg");
				while((iterator)||(countiterator)){
				 _card*c=0;
				 _tg a;
				 _vektor3<_tg> t;
				 if(entrymode==false){
				  if(anzahl<cardcount) c=iterator; else iterator=0;
				  a=angle;
				  t=target;
				  if(iterator) {
				   iterator=iterator->vorheriges();
				   if(iterator==iterator->liste()->letztes()) iterator=0;
				  };
				 }else{
				  _animationcount*ac=countiterator;
				  c=ac->card;
				  if(c==0) if(ac->cardindex!=-1) c=game->cardfromlast(ac->cardindex);
				  a=ac->angle;
				  t=ac->vector;
				  countiterator=countiterator->naechstes();if(countiterator==countiterator->liste()->erstes()) countiterator=0;
				 };
				 if(c){
				  _vektor3<_tg> tvx=c->vx;
				  _vektor3<_tg> tvy=c->vy;
				  tvx.rotz(a);
				  tvy.rotz(a);
				  if(relative) t+=c->position;
				  c->position=t;
				  c->vx.setzen(tvx.x(),tvx.y(),tvx.z());
				  c->vy.setzen(tvy.x(),tvy.y(),tvy.z());
				  c->updatemesh();
				  curvingcardlist.einhaengen(c);
				  anzahl+=1;
				 };
				};
};
//******************************************************************************************************************
//										A N I M A T I O N C A R D T O F R E E C E L L 
//******************************************************************************************************************
_animationcardtofreecell::_animationcardtofreecell(_game*g,_tg spd,_tg intv):_animation(g,spd,intv){
				iterator=0;
				freecelliterator=0;
};
_animationcardtofreecell::~_animationcardtofreecell(){
};
void _animationcardtofreecell::scale(_tg f){
};
void _animationcardtofreecell::translate(const _vektor3<_tg>&d){
};
void _animationcardtofreecell::use(_pilefreecell*pf){
				freecelllist.einhaengen(pf);
};
void _animationcardtofreecell::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 iterator=game->cardlist.letztes();
				 freecelliterator=freecelllist.erstes();
				 curvingcardlist.aushaengen();
				};
};
bool _animationcardtofreecell::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if((iterator)&&(freecelliterator)){
				  _pilefreecell*pfc=freecelliterator->objekt();
				  _card*c=iterator;
				  c->curvespeed=curvespeed;
				  _vektor3<_tg> t=pfc->dropposition();
				  c->deinsertgame();
				  c->insertpile(pfc,true);
				  c->curveposition.setzen(c->position,t,0,0,-10,0,0,10);
				  c->curvevx.setzen(c->vx,c->vx,0,0,0,0,0,0);
				  c->curvevy.setzen(c->vy,c->vy,0,0,10,0,0,10);
				  c->startcurve();
				  curvingcardlist.einhaengen(c);
				  iterator=iterator->vorheriges();if(iterator==iterator->liste()->letztes()) iterator=0;
				  freecelliterator=freecelliterator->naechstes();if(freecelliterator==freecelliterator->liste()->erstes()) freecelliterator=0;
				 };
				};
				return(!checkend());
};
void _animationcardtofreecell::skip(){
				while((iterator)&&(freecelliterator)){
				  _pilefreecell*pfc=freecelliterator->objekt();
				 _card*c=iterator;
				 _vektor3<_tg> t=pfc->dropposition();
				 c->deinsertgame();
				 c->insertpile(pfc,true);
				 c->position=t;
				 c->updatemesh();
				 curvingcardlist.einhaengen(c);
				 iterator=iterator->vorheriges();if(iterator==iterator->liste()->letztes()) iterator=0;
				 freecelliterator=freecelliterator->naechstes();if(freecelliterator==freecelliterator->liste()->erstes()) freecelliterator=0;
				};
};
//******************************************************************************************************************
//										A N I M A T I O N C A R D T O F O U N D A T I O N 
//******************************************************************************************************************
_animationcardtofoundation::_animationcardtofoundation(_game*g,_tg spd,_tg intv):_animation(g,spd,intv){
};
_animationcardtofoundation::~_animationcardtofoundation(){
};
void _animationcardtofoundation::scale(_tg f){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->scale(f);
				}while(counts.naechstes(ait));
};
void _animationcardtofoundation::translate(const _vektor3<_tg>&d){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->translate(d);
				}while(counts.naechstes(ait));
};
void _animationcardtofoundation::use(_pilefoundation*pf,_card*c){
				_animationcount*ac=new _animationcount(this);
				ac->pile=pf;
				ac->card=c;
};
void _animationcardtofoundation::start(bool sk){
				if(started==false){
				 started=true;
			 	 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 countiterator=counts.erstes();
				 curvingcardlist.aushaengen();
				};
};
bool _animationcardtofoundation::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(countiterator){
				 _animationcount*ac=countiterator;
				 _pilefoundation*pf=dynamic_cast<_pilefoundation*>(ac->pile);
				 _vektor3<_tg> t=pf->dropposition();
				 _card*c=0;
				 _card*it=game->cardlist.erstes();
				  if(it){
				   c=ac->card;
				   if(c){
				    c->curvespeed=curvespeed;
				    c->deinsertgame();
				    c->insertpile(pf,true);
				    c->curveposition.setzen(c->position,t,0,0,-10, 0,0,10);
				    c->curvevx.setzen(c->vx,c->vx,0,0,0, 0,0,0);
				    c->curvevy.setzen(c->vy,c->vy,0,0,10, 0,0,10);
				    c->startcurve();
				    curvingcardlist.einhaengen(c);
				   };
				  };
				  countiterator=countiterator->naechstes();if(countiterator==countiterator->liste()->erstes()) countiterator=0;
				 };
				};
				return(!checkend());
};
void _animationcardtofoundation::skip(){
				while(countiterator){
				 _animationcount*ac=countiterator;
				 _pilefoundation*pf=dynamic_cast<_pilefoundation*>(ac->pile);
				 _vektor3<_tg> t=pf->dropposition();
				 _card*c=0;
				 _card*it=game->cardlist.erstes();
				 if(it){
				  c=ac->card;
				  if(c){
				   c->deinsertgame();
				   c->insertpile(pf,true);
				   c->position.setzen(t);
				   c->updatemesh();
				   curvingcardlist.einhaengen(c);
				  };
				 };
				 countiterator=countiterator->naechstes();if(countiterator==countiterator->liste()->erstes()) countiterator=0;
				};
};

//******************************************************************************************************************
//										A N I M A T I O N C A R D T O S T O C K 
//******************************************************************************************************************
_animationcardtostock::_animationcardtostock(_game*g,_pilestock*p,int c,_tg spd,_tg intv,bool il):_animation(g,spd,intv){
				pilestock=p;
				anzahl=c;
				actual=0;
				inverselist=il;
};
_animationcardtostock::~_animationcardtostock(){
};
void _animationcardtostock::scale(_tg f){
};
void _animationcardtostock::translate(const _vektor3<_tg>&d){
};
void _animationcardtostock::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 curvingcardlist.aushaengen();
				 if(sk==false) if(usesoundstart) if(game->preview==false) soundstart->abspielen(1,0.95,1.01);
				};
};
bool _animationcardtostock::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(actual<anzahl){
				  _card*c=game->cardlist.letztes();
				  if(inverselist) c=game->cardlist.erstes();
				  if(c){
				   c->curvespeed=curvespeed;
				   _vektor3<_tg> t=pilestock->position;
				   t.z(t.z()-_tg(pilestock->anzahl())*game->solitaire->cardthickness);
				   c->curveposition.setzen(c->position,t,0,0,-10, 0,0,10);
				   c->curvevx.setzen(c->vx,-c->vx,0,0,10, 0,0,-10);
				   c->curvevy.setzen(c->vy,c->vy,0,0,0, 0,0,0);
				   c->startcurve();
				   c->deinsertgame();
				   c->insertpile(pilestock,true);
				   curvingcardlist.einhaengen(c);
				   actual+=1;
				  };
				 };
				};
				return(!checkend());
};
void _animationcardtostock::skip(){
				L->schreiben("animationcardtostock::skip einstieg");

				while(actual<anzahl){
				 _card*c=game->cardlist.letztes();
				 if(c){
				  _vektor3<_tg> t=pilestock->position;
				  t.z(t.z()-_tg(pilestock->anzahl())*game->solitaire->cardthickness);
				  c->position=t;
				  c->vx*=-1;
				  c->updatemesh();
				  c->deinsertgame();
				  c->insertpile(pilestock,true);
				  curvingcardlist.einhaengen(c);
				 };
				 actual+=1;
				};
};


//******************************************************************************************************************
//										A N I M A T I O N S T O C K T O P I L E
//******************************************************************************************************************
_animationstocktopile::_animationstocktopile(_game*g,_pilestock*p,_tg spd,_tg intv,bool rot):_animation(g,spd,intv){
				soundstart=game->solitaire->sspend;
                labyrinth=0;
                labindex=0;
                soundsingle=true;
                lastdoit=0;
				pilestock=p;
				rotate=rot;
};
_animationstocktopile::~_animationstocktopile(){
};
void _animationstocktopile::scale(_tg f){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->scale(f);
				}while(counts.naechstes(ait));
};
void _animationstocktopile::translate(const _vektor3<_tg>&d){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->translate(d);
				}while(counts.naechstes(ait));
};
void _animationstocktopile::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 curvingcardlist.aushaengen();
				 if(sk==false) if(game->preview==false) if(usesoundstart) soundstart->abspielen(1,0.95,1.01);
				 lastdoit=0;
				};
};
void _animationstocktopile::use(_piletableau*p,int c){
				pilelist.einhaengen(p);
				_animationcount*ac=new _animationcount(this);
				ac->value=c;
				labyrinth=0;
};
void _animationstocktopile::uselabyrinth(_pilelabyrinth*p){
				labyrinth=p;
				labindex=0;
};
bool _animationstocktopile::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(pilestock->anzahl()>0){
				  if(labyrinth==0){
				   //-------------------------------------------- tableau mode -----------------------------------------------
				   _piletableau*pt;
				   _piletableau*doit=0;
				   _animationcount*ac;
				   if((game->piletableaulist.anfang(pt))&&(counts.anfang(ac)))do{
				    if(int(pt->anzahl())<ac->value) doit=pt;
				    if(doit==0) ac=ac->naechstes();
				   }while((game->piletableaulist.naechstes(pt))&&(doit==0));
				 
				   if(doit){
				    
				    if(pilestock->erstes()){
				     _card*c=pilestock->erstes();
				     c->curvespeed=curvespeed;
				     _vektor3<_tg> t;
				     t=doit->position;
				     t.z(t.z()-_tg(doit->anzahl())*game->solitaire->cardthickness);
				     c->curveposition.setzen(c->position, t, -20,0,-10, 0,20,10);
				     if(rotate==false){
				      c->curvevx.setzen(c->vx,c->vx,0,0,10, 0,0,-10);
				      c->curvevy.setzen(c->vy,c->vy,0,0,0, 0,0,0);
				     }else{
				      _vektor3<_tg> tvx;
				      _vektor3<_tg> tvy;
				      _vektor3<_tg> tvxt;
				      _vektor3<_tg> tvyt;
				      tvx=c->vx;
				      tvy=c->vy;
				      tvx.rotz(180);
				      tvy.rotz(180);
				      tvxt=tvx;
				      tvyt=tvy;
				      tvxt.rotz(90);
				      tvyt.rotz(90);
				      tvxt.normalisieren();
				      tvyt.normalisieren();
				      tvxt*=10;
				      tvyt*=10;
				      c->curvevx.setzen(c->vx,tvx,tvxt,0,0,0);
				      c->curvevy.setzen(c->vy,tvy,tvyt,0,0,0);
				 	 };
				     c->startcurve();
				     c->deinsertpile();
				     c->insertpile(doit,true);
				     curvingcardlist.einhaengen(c);
				     if(usesoundaction) if(game->preview==false) soundaction->abspielen(0.5,0.95,1.05);
				    };
				   };
				   if(lastdoit!=doit){
					//if(game->preview=false && soundsingle=false playsoundstretched(game->solitaire->sturn,0.5,0.95,1.01)
				    lastdoit=doit;
				   };
				  }else{//---------------------------------- labyrinth mode -----------------------------------------------
				   if(labindex<labyrinth->dimx){
				    if(pilestock->erstes()){
				     _card*c=pilestock->erstes();
				     c->curvespeed=curvespeed;
				     _vektor3<_tg> t=labyrinth->droppositionat(labindex,0);
				     c->curveposition.setzen(c->position,t,-20,0,-10, 0,20,10);
				     c->curvevx.setzen(c->vx,-c->vx,0,0,10, 0,0,-10);
					 t=labyrinth->dropvy();
				     c->curvevy.setzen(c->vy,t,0,0,0, 0,0,0);
				     c->startcurve();
				     c->deinsertpile();
				     c->insertpile(labyrinth,true);
					 c->insertlabyrinth(labyrinth,labindex,0);
				     curvingcardlist.einhaengen(c);
				     labindex+=1;
				    }; 
				   };//labindex
				  };//mode
				 };//card in stock
				};
				return(!checkend());
};
void _animationstocktopile::skip(){
				_piletableau*doit=0;
				 L->schreiben("animationstocktopile::skip einstieg");
				bool loop=true;
				while((pilestock->anzahl()>0)&&(loop)){
				 L->schreiben("animationstockto pile ::skip");
				 if(labyrinth==0){//----------------------------  tableau mode ------------------------------
				 
				  doit=0;
				  _piletableau*pt;
				  _animationcount*ac;
				  if((game->piletableaulist.anfang(pt))&&(counts.anfang(ac)))do{
				   if(int(pt->anzahl())<ac->value) doit=pt;
				   if(doit==0) ac=ac->naechstes();
				  }while((game->piletableaulist.naechstes(pt))&&(doit==0));
				  if(doit){
				   if(pilestock->erstes()){
				    _card*c=pilestock->erstes();
				    _vektor3<_tg> t=doit->position;
				    t.z(t.z()-_tg(doit->anzahl())*game->solitaire->cardthickness);
				    c->position=t;
				    if(rotate){
 				     c->vx*=-1;
				     c->vy*=-1;
				    };
				    c->updatemesh();
				    c->deinsertpile();

				    c->insertpile(doit,true);
					L->schreiben("animationstockto pile ::skip ;: insertcard",(int)doit->anzahl() );

				    curvingcardlist.einhaengen(c);
				   };
				  }else{
				   loop=false;
				  };
				 }else{//-------------------------------------- labyrinth mode ----------------------------------
				   if(labindex<labyrinth->dimx){
				    if(pilestock->erstes()){
				     _card*c=pilestock->erstes();
				     _vektor3<_tg> t=labyrinth->droppositionat(labindex,0);
				     c->position=t;
				     c->vx*=-1;
				     //c->vy=c->vy;
				     c->updatemesh();
				     c->deinsertpile();
				     c->insertpile(labyrinth,true);
				     c->insertlabyrinth(labyrinth,labindex,0);
				     curvingcardlist.einhaengen(c);
				     labindex+=1;
				    }; 
				   }else{
				    loop=false;
				   };//labindex
				 };//labyrinthmode
				};
};
//******************************************************************************************************************
//										A N I M A T I O N P I L E T O P I L E
//******************************************************************************************************************
_animationpiletopile::_animationpiletopile(_game*g,_liste<_card>*cl,_pile*pd,_tg spd,_tg intv,bool cu,bool usedx,bool usedy):_animation(g,spd,intv){
				vector.setzen(-20,0,-10);
				vectortarget.setzen(0,20,10);
                pilesour=0;
                piledest=0;
                iterator=0;
                undoconstantsort=true;
                undo=0;
                zvector=0;
                zoffset=3;
                insertindex=0;
                if(cl->anfang(iterator))do{
				 cardlist.einhaengen(iterator->objekt());
				}while(cl->naechstes(iterator));
				iterator=cardlist.erstes();
				if(iterator) pilesour=iterator->objekt()->pile;
				iterator=0;
				piledest=pd;
				createundo=cu;
				usedropvx=usedx;
				usedropvy=usedy;
};
_animationpiletopile::~_animationpiletopile(){
};
void _animationpiletopile::scale(_tg f){
				vector*=f;
				vectortarget*=f;
};
void _animationpiletopile::translate(const _vektor3<_tg>&d){
};
void _animationpiletopile::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 curvingcardlist.aushaengen();
				 iterator=cardlist.erstes();
				 zvector=0;
				 if(createundo) undo=game->createundo(30,0.1,undoconstantsort);//vorher : true
				 if(game->preview==false){ 
				  _pilediscard*pd=dynamic_cast<_pilediscard*>(piledest);
				  if((pd)&&(cardlist.anzahl()==13)){
		           if(usesoundstart) if(sk==false) soundstart->abspielen(1,0.95,1.01);
		 		  };
		 		 };
				};
};
bool _animationpiletopile::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(iterator){//vorher : if(pilesour.cardlist.anzahl()>0 && iterator
				  _card*c=iterator->objekt();
				  c->curvespeed=curvespeed;
				  _vektor3<_tg> undoquelle;
				  _vektor3<_tg> undoquellevx;
				  _vektor3<_tg> undoquellevy;
				  if(c->curving==false){
				   undoquelle=c->position;
				   undoquellevx=c->vx;
				   undoquellevy=c->vy;
				  }else{ 
				   undoquelle=c->pickposition;
				   undoquellevx=c->pickvx;
				   undoquellevy=c->pickvy;
				  };
				  _vektor3<_tg> cardziel;
				  _vektor3<_tg> cardzielvx;
				  _vektor3<_tg> cardzielvy;
				  cardziel=piledest->dropposition();
				  if(usedropvx){
				   cardzielvx=piledest->dropvx();
				  }else{ 
				   if(c->curving==false){
				    cardzielvx=c->vx;
				   }else{
				    cardzielvx=c->curvevx.ort(1);
				   };
				  };
				  if(usedropvy){
				   cardzielvy=piledest->dropvy();
				  }else{
				   if(c->curving==false){
				    cardzielvy=c->vy;
				   }else{
				    cardzielvy=c->curvevy.ort(1);
				   };
				  };
				  c->curveposition.setzen(c->position, cardziel, vector.x(),vector.y(),vector.z()-zvector, vectortarget.x(),vectortarget.y(),vectortarget.z());
				  c->curvevx.setzen(c->vx,cardzielvx,0,0,10, 0,0,-10);
				  c->curvevy.setzen(c->vy,cardzielvy,0,0,0, 0,0,0);
				  c->startcurve();
			      _kurvehermite3<_tg> cupo;
			      _kurvehermite3<_tg> cuvx;
			      _kurvehermite3<_tg> cuvy;
			      cupo.ort(0,undoquelle);
			 	  cupo.ort(1,cardziel);//c->curveposition.o1)
			      cupo.vektor(0,0,0,-10);
			      cupo.vektor(1,0,0,10);
				  cuvx.ort(0,undoquellevx);
				  cuvx.ort(1,cardzielvx);
				  cuvx.vektor(0,0,0,0);
				  cuvx.vektor(1,0,0,0);
		 		  cuvy.ort(0,undoquellevy);
		 		  cuvy.ort(1,cardzielvy);
				  cuvy.vektor(0,0,0,0);
			 	  cuvy.vektor(1,0,0,0);
				  _pilelabyrinth*warlab=c->labyrinth;
				  if(insertindex==0){
				   if(createundo) undo->use(c,piledest,true,0,0,0,c->pile,true,c->labindex[0],c->labindex[1],0,cupo,cuvx,cuvy);//vorher pilesour statt c->pile
				  }else{
				   if(createundo) undo->use(c,piledest,true,insertindex,0,0,c->pile,true,c->index(),0,0,cupo,cuvx,cuvy);//vorher pilesour statt c->pile
				  };
				  c->deinsertlabyrinth();
				  c->deinsertpyramid();
				  c->deinsertpile();
				  c->insertpile(piledest,true,insertindex);
				  if(warlab){ //karte wird aus dem labyrinth gehängt, also spezielle firstline-füllung ausführen
				   warlab->fillfirstline(undo);
				  };
				  curvingcardlist.einhaengen(c);
				  zvector+=zoffset;
				  iterator=iterator->naechstes();if(iterator==cardlist.erstes()) iterator=0;
				 };
				};
				return(!checkend());
};
void _animationpiletopile::skip(){
				while(( pilesour->anzahl()>0)&&(iterator)){
				 _card*c=iterator->objekt();
				 c->position=piledest->dropposition();
				 c->updatemesh();
				 if(insertindex==0){
				  if(createundo) undo->use(c,piledest,true,0,0,0,c->pile,true,c->labindex[0],c->labindex[1],0,c->curveposition,c->curvevx,c->curvevy);//vorher pilesour statt c->pile				
				 }else{
				  if(createundo) undo->use(c,piledest,true,insertindex,0,0,c->pile,true,c->index(),0,0,c->curveposition,c->curvevx,c->curvevy);//vorher pilesour statt c->pile				
				 };
				 c->deinsertlabyrinth();
				 c->deinsertpyramid();
				 c->deinsertpile();
				 c->insertpile(piledest,true,insertindex);
				 curvingcardlist.einhaengen(c);
				 iterator=iterator->naechstes();if(iterator==cardlist.erstes()) iterator=0;
				};
};
//******************************************************************************************************************
//										A N I M A T I O N C A R D T O P I L E
//******************************************************************************************************************
_animationcardtopile::_animationcardtopile(_game*g,_tg spd,_tg intv):_animation(g,spd,intv){
	            cardcountarg=0;
	            sweetmatch=0;
	            sweetx=0;
	            sweety=0;
	            array=0;
	            arrayx=0;
	            arrayy=0;
	            turn=true;
	            usedropvy=false;
	            invers=false;
};
_animationcardtopile::~_animationcardtopile(){
};
void _animationcardtopile::scale(_tg f){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->scale(f);
				}while(counts.naechstes(ait));
};
void _animationcardtopile::translate(const _vektor3<_tg>&d){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->translate(d);
				}while(counts.naechstes(ait));
};
void _animationcardtopile::use(_pile*p,int c,bool t,bool udy,_card*ca){
				//pilelist.einhaengen(p)
				_animationcount*ac=new _animationcount(this);
				ac->pile=p;
				ac->value=c;
				ac->card=ca;
				//if(ca usecardpointer=true
				ac->index=t;//missbrauch
				ac->index2=udy;
				cardcounttotal+=c;
				sweetmatch=0;
				array=0;
				turn=t;
				usedropvy=udy;
};
void _animationcardtopile::usesweetmatch(_pilesweetmatch*p,bool t,bool udy){
				sweetmatch=p;
				sweetx=0;
				sweety=0;
				turn=t;
				usedropvy=udy;
};
void _animationcardtopile::usearray(_pilearray*p,bool t,bool udy){
				array=p;
				arrayx=0;
				arrayy=0;
				turn=t;
				usedropvy=udy;
};
void _animationcardtopile::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 curvingcardlist.aushaengen();
				 if(sk==false) if(usesoundstart) if(game->preview==false) soundstart->abspielen(1,0.95,1.01);
				 if((sweetmatch)||(array)){
				  cardcounttotal=game->cardlist.anzahl();
				 }else{
				  countiterator=counts.erstes();
				  cardcounttotal-=countiterator->pile->anzahl();
				  //cardcounttotal=game->cardlist.anzahl()
				 };
				};
};
bool _animationcardtopile::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(game->cardlist.anzahl()>0){
				  if((sweetmatch==0)&&(array==0)){
				   //-------------------------------------------- tableau mode -----------------------------------------------
				   _animationcount*doac=0;
				   if(countiterator){
				    doac=countiterator;
				    if(int(doac->pile->anzahl())>=doac->value){
				     countiterator=countiterator->naechstes();
				     doac=0;
				     if(countiterator!=countiterator->liste()->erstes()){
				      doac=countiterator;
				      cardcounttotal-=doac->pile->anzahl();
				     };
				    };
				   };
				 
				   if(doac){
				    _card*c=0;
				    if(doac->card==0){
				     if(invers) c=game->cardlist.erstes(); else c=game->cardlist.letztes();
				    }else{
				     c=doac->card;
					};
				    if(c){
				     c->curvespeed=curvespeed;
				     _vektor3<_tg> t;
				     _vektor3<_tg> vn;
				     if(doac->index2){
				      bool backdrop=false;
				  	  if(((c->turnedup())&&(doac->index))|| ((c->turnedup()==false)&&(doac->index==false))) backdrop=true;
				      t=doac->pile->dropposition(backdrop);
				     }else{ 
				      t=doac->pile->position;
				      t.z(t.z()-_tg(doac->pile->anzahl())*game->solitaire->cardthickness);
				     };
				     c->curveposition.setzen(c->position,t,-20,0,-10, 0,20,10);
				     if(doac->index){
				      c->curvevx.setzen(c->vx,-c->vx,0,0,-10,0,0,10);
				     }else{
				      c->curvevx.setzen(c->vx, c->vx,0,0,-10,0,0,10);
				 	 };
			 		 if(doac->index2){
				      c->curvevy.setzen(c->vy,doac->pile->dropvy(),vn,vn);
				     }else{
				      c->curvevy.setzen(c->vy,c->vy,vn,vn);
				     };
				     c->startcurve();
				     c->deinsertgame();
				     if(usesoundaction) if(game->preview==false) soundaction->abspielen(0.5,0.95,1.05);
				     c->insertpile(doac->pile,true);
				     curvingcardlist.einhaengen(c);
				    };
				   };
				  }else if(sweetmatch){//---------------------------------- sweet mode --------------------------------------------------------
				   _card*c=game->cardlist.erstes();
				   if(c){
				    c->curvespeed=curvespeed;
				    _vektor3<_tg> t=sweetmatch->droppositionat(sweetx,sweety);
				    c->curveposition.setzen(c->position,t,-20,0,-10, 0,20,10);
				    c->curvevx.setzen(c->vx,-c->vx,0,0,10,0,0,-10);
					t=sweetmatch->dropvy();
				    c->curvevy.setzen(c->vy,t,0,0,0, 0,0,0);
				    c->startcurve();
				    c->deinsertgame();
				    c->insertpile(sweetmatch,true);
					c->insertsweetmatch(sweetmatch,sweetx,sweety);
				    curvingcardlist.einhaengen(c);
				    sweetx++;
				    if(sweetx>=sweetmatch->dimx){
				     sweetx=0;
				     sweety++;
				    };
				   }; 
				  }else if(array){//-------------------------------------- array mode -------------------------------------------------------
				   _card*c=game->cardlist.erstes();
				   if(c){
				    c->curvespeed=curvespeed;
				    _vektor3<_tg> t=array->droppositionat(arrayx,arrayy);
				    c->curveposition.setzen(c->position,t,-20,0,-10, 0,20,10);
				    c->curvevx.setzen(c->vx,-c->vx,0,0,10,0,0,-10);
					t=array->dropvy();
				    c->curvevy.setzen(c->vy,t,0,0,0,0,0,0);
				    c->startcurve();
				    c->deinsertgame();
				    c->insertpile(array,true);
					c->insertarray(array,arrayx,arrayy);
				    curvingcardlist.einhaengen(c);
				    arrayx++;
				    if(arrayx>=array->dimx){
				     arrayx=0;
				     arrayy++;
				    };
				   }; 
				  };
				 };
				};
				return(!checkendcount());
};
void _animationcardtopile::skip(){
	 			bool loop=true;
				while((game->cardlist.anzahl()>0)&&(loop)){
				 if((sweetmatch==0)&&(array==0)){//----------------------------  tableau mode ------------------------------
				  _animationcount*ac=0;
				  _animationcount*doac=0;
				  if(counts.anfang(ac))do{
				   if(int(ac->pile->anzahl())<ac->value) doac=ac;
				  }while((counts.naechstes(ac))&&(doac==0));//Until (lac=0) || doac
				  if(doac){
				   _card*c=0;
				   if(doac->card==0){
				    c=game->cardlist.letztes();
				   }else{
				    c=doac->card;
				   };
				   if(c){
				    _vektor3<_tg> t;
				    _vektor3<_tg> vn;
				    if(doac->index2){
				     bool backdrop=false;
				  	 if(((c->turnedup())&&(doac->index))||((c->turnedup()==false)&&(doac->index==false))) backdrop=true;
				     t=doac->pile->dropposition(backdrop);
				    }else{ 
				     t=doac->pile->position;
				     t.z(t.z()-_tg(doac->pile->anzahl())*game->solitaire->cardthickness);
				    };
				    c->position=t;
				    if(doac->index){
				     c->vx*=-1;
				    }else{
				     //c->vx.setzen( c->vx)
				    };
				    if(doac->index2){
				     c->vy=doac->pile->dropvy();
				    };
				    c->updatemesh();
				    c->deinsertgame();
				    c->insertpile(doac->pile,true);
				    curvingcardlist.einhaengen(c);
				   };
				  }else{
				   loop=false;
				  };
				 }else if(sweetmatch){//-------------------------------------- sweet mode ----------------------------------
				  _card*c=game->cardlist.erstes();
				  if(c){
				   _vektor3<_tg> t=sweetmatch->droppositionat(sweetx,sweety);
				   c->position=t;
				   c->vx*=-1;//.setzen(-c->vx.x, -c->vx.y, -c->vx.z)
				   t=sweetmatch->dropvy();
				   c->vy=t;
				   c->updatemesh();
				   curvingcardlist.einhaengen(c);
				   c->deinsertgame();
				   c->insertpile(sweetmatch,true);
				   c->insertsweetmatch(sweetmatch,sweetx,sweety);
				   curvingcardlist.einhaengen(c);
				   sweetx++;
				   if(sweetx>=sweetmatch->dimx){
				    sweetx=0;
				    sweety++;
				   };
				  }; 
				 }else if(array){//------------------------------------------- array mode ------------------------------------
				  _card*c=game->cardlist.erstes();
				  if(c){
				   _vektor3<_tg> t=array->droppositionat(arrayx,arrayy);
				   c->position=t;
				   c->vx*=-1;
				   t=array->dropvy();
				   c->vy=t;
				   c->updatemesh();
				   curvingcardlist.einhaengen(c);
				   c->deinsertgame();
				   c->insertpile(array,true);
				   c->insertarray(array,arrayx,arrayy);
				   curvingcardlist.einhaengen(c);
				   arrayx++;
				   if(arrayx>=array->dimx){
				    arrayx=0;
				    arrayy++;
				   };
				  }; 
				 };
				};
};

//******************************************************************************************************************
//										A N I M A T I O N P I L E T U R N 
//******************************************************************************************************************
_animationpileturn::_animationpileturn(_game*g,_tg spd,_tg intv):_animation(g,spd,intv){
				iterator=0;
				usesoundstart=false;
				usesoundaction=true;
};
_animationpileturn::~_animationpileturn(){
};
void _animationpileturn::scale(_tg f){
};
void _animationpileturn::translate(const _vektor3<_tg>&d){
};
void _animationpileturn::use(_pile*p){
			    pilelist.einhaengen(p);
};
void _animationpileturn::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 iterator=pilelist.letztes();
				 curvingcardlist.aushaengen();
				 if(usesoundstart) if(game->preview==false) soundstart->abspielen(soundstartvolume,0.95,1.05);
				};
};
bool _animationpileturn::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 if(iterator){
				  _pile*pile=iterator->objekt();
				  _card*c;
				  if(pile->anfang(c))do{
				   if(c->canturn()){
				    _vektor3<_tg> v;
				    _pile*pileold=c->pile;
					int cx=c->arrayindex[0];
					int cy=c->arrayindex[1];
				    c->deinsertpile();
				    _pilearray*pa=dynamic_cast<_pilearray*>(pileold);
				    if(pa==0){
			         v=pileold->dropposition();
			   		}else{
			     	 v=pa->droppositionat(cx,cy);
					};
				    c->insertpile(pileold,true);
				    c->curvespeed=curvespeed;
				    c->curveposition.setzen(c->position,v,0,0,-10,0,0,10);
			 	    c->curvevx.setzen(c->vx,-c->vx,0,0,10 ,0,0,-10);
			 	    c->curvevy.setzen(c->vy, c->vy.x(),c->vy.y(),c->vy.z()-game->solitaire->cardslope,0,0,0,0,0,0);
				    c->startcurve();
				    curvingcardlist.einhaengen(c);
				    if(usesoundaction) if(game->preview==false) soundaction->abspielen(soundactionvolume,0.95,1.05);
				   };
				  }while(pile->naechstes(c));
				  iterator=iterator->vorheriges();if(iterator==pilelist.letztes()) iterator=0;
				 };
				};
				return(!checkend());
};
void _animationpileturn::skip(){
				while(iterator){
				 _pile*pile=iterator->objekt();
				 _card*c;
				 if(pile->anfang(c)){
				  if(c->canturn()){
				   _vektor3<_tg> v;
				   _pile*pileold=c->pile;
				   int cx=c->arrayindex[0];
				   int cy=c->arrayindex[1];
				   c->deinsertpile();
				   _pilearray*pa=dynamic_cast<_pilearray*>(pileold);
				   if(pa==0){
			        v=pileold->dropposition();
			   	   }else{
			        v=pa->droppositionat(cx,cy);
				   };
				   c->insertpile(pileold,true);
				   c->position.setzen(v);
			 	   c->vx.setzen(-c->vx);
			 	   c->vy.setzen( c->vy.x(),c->vy.y(),c->vy.z()-game->solitaire->cardslope);
				   c->updatemesh();
				   curvingcardlist.einhaengen(c);
			      };
				 };
				 iterator=iterator->vorheriges();if(iterator==pilelist.letztes()) iterator=0;
				};
};

//******************************************************************************************************************
//										A N I M A T I O N P I L E S H I F T O U T 
//******************************************************************************************************************
_animationpileshiftout::_animationpileshiftout(_game*g,_tg spd,_tg intv):_animation(g,spd,intv){
				cardcounttotal=0;
};
_animationpileshiftout::~_animationpileshiftout(){
};
void _animationpileshiftout::scale(_tg f){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->scale(f);
				}while(counts.naechstes(ait));
};
void _animationpileshiftout::translate(const _vektor3<_tg>&d){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->translate(d);
				}while(counts.naechstes(ait));
};
void _animationpileshiftout::use(_pile*p,int c,int io){
				pilelist.einhaengen(p);
				_animationcount*ac=new _animationcount(this);
				ac->value=c;
				cardcounttotal+=c;
				ac->anzahl=0;
				ac->iteratoroffset=io;
};
void _animationpileshiftout::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 _animationcount*ac=counts.erstes();
				 _listenknoten<_pile>*lpt;
				 if(pilelist.anfang(lpt))do{
				  ac->iterator=lpt->objekt()->letztes();
				  ac=ac->naechstes();
				 }while(pilelist.naechstes(lpt));
				 curvingcardlist.aushaengen();
				};
};
bool _animationpileshiftout::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 _pile*doit=0;
				 _animationcount*doac=0;
				 _animationcount*ac;
				 _listenknoten<_pile>*lpt;
				 if((pilelist.anfang(lpt))&&(counts.anfang(ac)))do{
				  if(ac->anzahl<int(lpt->objekt()->anzahl())){
				   doit=lpt->objekt();
				   doac=ac;
				  };
				  if(doit==0) ac=ac->naechstes();
				 }while((pilelist.naechstes(lpt))&&(doit==0));//Until (lpt=0) || doit
				 if(doit){
				  if(doac->iterator){
				   _card*c=doac->iterator; 
				   doac->iterator=doac->iterator->vorheriges();
				   _vektor3<_tg> t;
				   _vektor3<_tg> off;
				   t=c->position;
				   if(doac->anzahl<doac->iteratoroffset){
				    off=doit->vector;
				    off*=game->cardshiftback;
				    off*=doac->anzahl;
				    t+=off;
				   }else{
				    off=doit->vector;
				    off*=game->cardshiftfront;
				    off*=(doac->iteratoroffset+((doac->value-1)-doac->anzahl));
				    t+=off;
				    off=doit->vector;
				    off*=game->cardshiftback;
				    off*=doac->iteratoroffset+1;
				    t+=off;
				    off=doit->vector;
				    off*=game->cardheight;
				    t+=off;
				   };
				   doac->anzahl+=1;
				   c->curveposition.setzen(c->position,t,0,0,0, 0,0,0);
				   c->curvevx.setzen(c->vx,c->vx,0,0,0, 0,0,0);
				   c->curvevy.setzen(c->vy,c->vy,0,0,0, 0,0,0);
				   c->curvespeed=curvespeed;
				   c->startcurve();
				   curvingcardlist.einhaengen(c);
				  };
				 };
				};
				return(!checkendcount());
};
void _animationpileshiftout::skip(){
				_pile*doit=0;
				do{
				 _listenknoten<_pile>*lpt;
				 _animationcount*ac;
				 _animationcount*doac=0;
				 doit=0;
				 if((pilelist.anfang(lpt))&&(counts.anfang(ac)))do{
				  if(ac->anzahl<int(lpt->objekt()->anzahl())){//ac.value)
				   doit=lpt->objekt();
				   doac=ac;
				  };
				  if(doit==0) ac=ac->naechstes();
				 }while((pilelist.naechstes(lpt))&&(doit));//Until (lpt=0) || doit
				 if(doit){
				  if(doac->iterator){
				   _card*c=doac->iterator;
				   doac->iterator=doac->iterator->vorheriges();
				   _vektor3<_tg> t;
				   _vektor3<_tg> off;
				   t=c->position;
				   if(doac->anzahl<doac->iteratoroffset){
					off=doit->vector;
					off*=game->cardshiftback;
					off*=doac->anzahl;
					t+=off;
				   }else{
					off=doit->vector;
					off*=game->cardshiftfront;
					off*=doac->iteratoroffset+((doac->value-1)-doac->anzahl);
					t+=off;
					off=doit->vector;
					off*=game->cardshiftback;
					off*=doac->iteratoroffset+1;
					t+=off;
					off=doit->vector;
					off*=game->cardheight;
					t+=off;
				   };
				   doac->anzahl+=1;
				   c->position=t;
				   c->updatemesh();
				   curvingcardlist.einhaengen(c);
				  };
				 };
				}while(doit);
};
//******************************************************************************************************************
//										A N I M A T I O N P I L E S H I F T O U T V E R T I C A L
//******************************************************************************************************************
_animationpileshiftoutvertical::_animationpileshiftoutvertical(_game*g,_tg spd,_tg intv):_animation(g,spd,intv){
};
_animationpileshiftoutvertical::~_animationpileshiftoutvertical(){
};
void _animationpileshiftoutvertical::scale(_tg f){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->scale(f);
				}while(counts.naechstes(ait));
};
void _animationpileshiftoutvertical::translate(const _vektor3<_tg>&d){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->translate(d);
				}while(counts.naechstes(ait));
};
void _animationpileshiftoutvertical::use(_pile*p,int c){
				pilelist.einhaengen(p);
				_animationcount*ac=new _animationcount(this);
				ac->value=c;
};
void _animationpileshiftoutvertical::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 _listenknoten<_pile>*lpt;
				 _animationcount*ac;
				 if((pilelist.anfang(lpt))&&(counts.anfang(ac)))do{
				  ac->iterator=lpt->objekt()->erstes();
				  L->schreiben("iterator");
				  if(ac->iterator) L->schreiben("esetzen");
				  ac=ac->naechstes();
				 }while(pilelist.naechstes(lpt));
				 curvingcardlist.aushaengen();
				};
};
bool _animationpileshiftoutvertical::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 _listenknoten<_pile>*lpt;
				 _animationcount*ac;
				 _pile*doit=0;
				 _animationcount*doac=0;
				 if((pilelist.anfang(lpt))&&(counts.anfang(ac)))do{
				  if(ac->anzahl<ac->value){
				   doit=lpt->objekt();
				   doac=ac;
				  };
				  if(doit==0) ac=ac->naechstes();
				 }while((pilelist.naechstes(lpt))&&(doit==0));//Until (lpt=0) || doit
				 if(doit){
				  if(doac->iterator){
				   _card*c=doac->iterator; 
				   doac->iterator=doac->iterator->naechstes();if(doac->iterator==doac->iterator->liste()->erstes()) doac->iterator=0;
				   _vektor3<_tg> off=doit->vector;
				   off*=game->cardshiftback;
				   off*=(doac->value-1)-doac->anzahl;
				   _vektor3<_tg> t=c->position;
				   t+=off;
				   doac->anzahl+=1;
				   c->curveposition.setzen(c->position,t,0,0,0,0,0,0);
				   c->curvevx.setzen(c->vx,c->vx,0,0,0,0,0,0);
				   c->curvevy.setzen(c->vy,c->vy,0,0,0,0,0,0);
				   c->curvespeed=curvespeed;
				   c->startcurve();
				   curvingcardlist.einhaengen(c);
				  };
				 };
				};
				return(!checkend());
};
void _animationpileshiftoutvertical::skip(){
				_pile*doit=0;
				do{
				 _listenknoten<_pile>*lpt;
				 _animationcount*ac;
				 _animationcount*doac=0;
				 doit=0;
				 if((pilelist.anfang(lpt))&&(counts.anfang(ac)))do{
				  if(ac->anzahl<ac->value){
				   doit=lpt->objekt();
				   doac=ac;
				  };
				  if(doit==0) {
				   ac=ac->naechstes();if(ac==counts.erstes()) ac=0;
				   lpt=lpt->naechstes();if(lpt==pilelist.erstes()) lpt=0;
				  };
				 }while((lpt)&&(doit==0));//Until (lpt=0) || doit
				 if(doit){
				  if(doac->iterator){
				   _card*c=doac->iterator;
				   L->schreiben("doac iterator");
				   doac->iterator=doac->iterator->naechstes();
				   _vektor3<_tg> off(0,-game->cardshiftback,0);
				   off*=(doac->value-1)-doac->anzahl;
				   _vektor3<_tg> t=c->position;
				   t+=off;
				   doac->anzahl+=1;
				   c->position=t;
				   c->updatemesh();
				   curvingcardlist.einhaengen(c);
				  };
				 };
				}while(doit);
};
//******************************************************************************************************************
//										A N I M A T I O N P I L E T U R N V E R T I C A L
//******************************************************************************************************************
_animationpileturnvertical::_animationpileturnvertical(_game*g,_tg spd,_tg intv):_animation(g,spd,intv){
				cardcounttotal=0;
};
_animationpileturnvertical::~_animationpileturnvertical(){
};
void _animationpileturnvertical::scale(_tg f){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->scale(f);
				}while(counts.naechstes(ait));
};
void _animationpileturnvertical::translate(const _vektor3<_tg>&d){
				_animationcount*ait;
				if(counts.anfang(ait))do{
				 ait->translate(d);
				}while(counts.naechstes(ait));
};
void _animationpileturnvertical::use(_pile*p,int c){
				pilelist.einhaengen(p);
				_animationcount*ac=new _animationcount(this);
				ac->value=c;
				cardcounttotal+=c;
};
void _animationpileturnvertical::start(bool sk){
				if(started==false){
				 started=true;
				 timestart=game->solitaire->clock->system();
				 actiontime=timestart;
				 actionakku=0;
				 _listenknoten<_pile>*lpt;
				 _animationcount*ac;
				 if((pilelist.anfang(lpt))&&(counts.anfang(ac)))do{
				  ac->iterator=lpt->objekt()->erstes();
				  ac=ac->naechstes();
				 }while(pilelist.naechstes(lpt));
				 curvingcardlist.aushaengen();
				};
};
bool _animationpileturnvertical::checkendcount(){
				if(int(curvingcardlist.anzahl())>=cardcounttotal){//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 bool curving=false;
				 _listenknoten<_card>*cit;
				 if(curvingcardlist.anfang(cit))do{
				  if(cit->objekt()->curving) curving=true;
				 }while(curvingcardlist.naechstes(cit));
				 if(curving==false){
				  _listenknoten<_pile>*lit=pilelist.erstes();
				  _pile*pit=0;
				  _animationcount*acit;
				  if(counts.anfang(acit))do{
				   pit=lit->objekt();
				   if(acit->value==pit->anzahl()){
				    pit->invertieren();
				   }else{
				    //von first an ac.value stücker invertieren
				    _liste<_card> l0;
				    _liste<_card> l1;
				    _card*it=pit->erstes();
				    if(acit->value>0){
				     for(int m=0;m<acit->value;m++){
				      if(it) l0.einhaengen(it);
				      it=it->naechstes();
				     };
				     do{
				      if(it) l1.einhaengen(it);
				     }while(pit->naechstes(it));
				    };
				    pit->loeschen();
				    _listenknoten<_card>*cii;
				    it=l0.letztes()->objekt();
				    if(l0.ende(cii))do{
				     pit->einhaengen(cii->objekt());//cii.pilelink=pit.cardlist.einhaengen(it.value())
				    }while(l0.vorheriges(cii));
				    if(l1.anfang(cii))do{
				     pit->einhaengen(cii->objekt());//cii.pilelink=pit.cardlist.einhaengen(cii)
				    }while(l1.naechstes(cii));
				   };
				   lit=lit->naechstes();
				  }while(counts.naechstes(acit));
				  game->tippresetcombination(0);
				  game->tippresetcombination(1);
				  game->tippresetcombination(2);
				  game->tippresetcombination(3);
				  return(true);
				 };
				};
				return(false);
};
bool _animationpileturnvertical::animate(){
				_tg nt=game->solitaire->clock->system();
				_tg dt=nt-actiontime;
				actiontime=nt;
				actionakku+=dt;
				while(actionakku>=actionintervall){
				 actionakku-=actionintervall;
				 _listenknoten<_pile>*lpt;
				 _animationcount*ac;
				 _pile*doit=0;
				 _animationcount*doac=0;
				 if((pilelist.anfang(lpt))&&(counts.anfang(ac)))do{
				  if(ac->anzahl<ac->value){
				   doit=lpt->objekt();
				   doac=ac;
				  };
				  if(doit==0) ac=ac->naechstes();
				 }while((pilelist.naechstes(lpt))&&(doit==0));//Until (lpt=0) || doit
				 if(doit){
				  if(doac->iterator){
				   _card*c=doac->iterator;
				   doac->iterator=doac->iterator->naechstes();
				   _vektor3<_tg> off;
				   _vektor3<_tg> t=doit->position;
				   _tg sh=_tg(doit->anzahl()-(doac->value));
				   off=doit->vector;
				   off*=sh*game->cardshiftback;
				   off.z(off.z()-sh*game->solitaire->cardthickness);
				   t+=off;
				   off=doit->vector*game->cardshiftfront;
				   off.z(off.z()-game->solitaire->cardthickness);
				   off*=doac->anzahl;
				   t+=off;
				   t.z(t.z()-game->solitaire->cardtableaulift);
				   doac->anzahl+=1;
				   c->curveposition.setzen(c->position,t,0,5,-10,0,0,10);
				   c->curvevx.setzen(c->vx,c->vx,0,0,0,0,0,0);
				   c->curvevy.setzen(c->vy,-c->vy.x(), -c->vy.y(), -c->vy.z()-game->solitaire->cardslope,  0,0,-20, 0,0,20);
				   c->curvespeed=curvespeed;
				   c->startcurve();
				   curvingcardlist.einhaengen(c);
				  };
				 };
				};
				return(!checkendcount());
};
void _animationpileturnvertical::skip(){
				_pile*doit=0;
				do{
				 _listenknoten<_pile>*lpt;
				 _animationcount*ac=counts.erstes();
				 _animationcount*doac=0;
				 doit=0;
				 if((pilelist.anfang(lpt))&&(counts.anfang(ac)))do{
				  if(ac->anzahl<ac->value){
				   doit=lpt->objekt();
				   doac=ac;
				  };
				  if(doit==0) ac=ac->naechstes();
				 }while((pilelist.naechstes(lpt))&&(doit==0));//Until (lpt=0) || doit
				 if(doit){
				  if(doac->iterator){
				   _card*c=doac->iterator;
				   doac->iterator=doac->iterator->naechstes();
				   _vektor3<_tg> off;
				   _vektor3<_tg> t=doit->position;
				   _tg sh=_tg(doit->anzahl()-(doac->value));
				   off=doit->vector;
				   off*=sh*game->cardshiftback;
				   off.z(off.z()-sh*game->solitaire->cardthickness);
				   t.add(off);
				   off=doit->vector;
				   off*=game->cardshiftfront;
				   off.z(off.z()-game->solitaire->cardthickness);
				   off*=doac->anzahl;
				   t+=off;
				   t.z(t.z()-game->solitaire->cardtableaulift);
			       doac->anzahl+=1;
				   c->position=t;
				   c->vy.setzen(-c->vy.x(), -c->vy.y(), -c->vy.z()-game->solitaire->cardslope);
				   c->updatemesh();
				   curvingcardlist.einhaengen(c);
				  };
				 };
				}while(doit);
				_listenknoten<_pile>*lit=pilelist.erstes();
				_pile*pit=0;
				_animationcount*acit;
				if(counts.anfang(acit))do{//for(Local acit:_animationcount=EachIn counts
				 pit=lit->objekt();
				 if(acit->value==pit->anzahl()){
				  pit->invertieren();
				 }else{
				  //von first an ac.value stücker invertieren
				  _liste<_card> l0;
				  _liste<_card> l1;
				  _card*it=pit->erstes();
				  if(acit->value>0){
				   for(int m=0;m<acit->value;m++){
				    if(it) l0.einhaengen(it);
				    it=it->naechstes();
				   };
				   do{
				    if(it) l1.einhaengen(it);
				   }while(pit->naechstes(it));
				  };
				  pit->loeschen();
				  _listenknoten<_card>*cii;
				  it=l0.letztes()->objekt();
				  if(l0.ende(cii))do{
				   pit->einhaengen(cii->objekt());//cii.pilelink=pit.cardlist.einhaengen(it.value())
				  }while(l0.vorheriges(cii));
				  if(l1.anfang(cii))do{
				   pit->einhaengen(cii->objekt());//cii.pilelink=pit.cardlist.einhaengen(cii)
				  }while(l1.naechstes(cii));
				 };
				 lit=lit->naechstes();
				}while(counts.naechstes(acit));
				game->tippresetcombination(0);
				game->tippresetcombination(1);
				game->tippresetcombination(2);
				game->tippresetcombination(3);
};
//******************************************************************************************************************
//										A N I M A T I O N S H U F F L E 
//******************************************************************************************************************
_animationshuffle::_animationshuffle(_game*g,int t):_animation(g,10,10){
				times=t;
};
_animationshuffle::~_animationshuffle(){
};
bool _animationshuffle::animate(){
				return(false);
};
