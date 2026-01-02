//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitairegame.cpp
//  Datum       : 29.11.2008
//******************************************************************************************************************************************************************************************************
#include "../hpp/_solitairegame.hpp"
#include "../hpp/_solitairegametype.hpp"

void savegame(_game*game){
				_pile*pit=0;
				_card*cit=0;
				int ip,ic,iu,ie;
				if(game){
				 game->skipanimation();
				 //------------- erstmal namen verteilen --------------------
				 ip=0;
				 ic=0;
				 iu=0;
				 ie=0;
				 game->speichername()="game";
				 _animationundo*uit;
				 if(game->undolist.anfang(uit))do{
				  uit->speichername()="undo"+iu;
				  iu++;
				  _animationundoentry*eit;
				  if(uit->anfang(eit))do{
				   eit->speichername()="undoentry"+ie;
				   ie++;
				  }while(uit->naechstes(eit));
				 }while(game->undolist.naechstes(uit));
				 
				 if(game->pilelist.anfang(pit)){
				  pit->speichername()="pile"+ip;
				  if(pit->anfang(cit))do{
				   cit->speichername()="card"+ic;
				   ic++;
				  }while(pit->naechstes(cit));
				  ip++;
				 }while(game->pilelist.naechstes(pit));
				 //---------------- nun speichern ----------------------------
				 _datei d(_zeichenkette<char>("game")+gametype[game->index].namespeicherung+".sol");
				 d.oeffnen();
                 d.speichern(game->index);
				 d.speichern(gametype[game->index].namespeicherung);
				 game->save(&d);
				 d.speichern(game->pilelist.anzahl());
				 if(game->pilelist.anfang(pit))do{
				  pit->save(&d);
				 }while(game->pilelist.naechstes(pit));
				 d.schliessen();
				};
};				
_game*loadgame(_solitaire*solitaire,int cur_game){
                _game*game=0;
				_zeichenkette<_tt> gt;
				//Print "Vor dem Laden gibt es "+storeablelist.count()+" Storeables"
				//Print "...davon stats storeables :"+countstatsstoreables()
				//Print "...davon anim storeables :"+countanimationstoreables()
				//Print "...davon game storeables :"+countgamestoreables()
				//Print "...davon pile storeables :"+countpilestoreables()
				//Print "...davon card storeables :"+countcardstoreables()
				_datei d(_zeichenkette<char>("game")+gametype[cur_game].namespeicherung+".sol");
				if(d.oeffnennurlesen()){
				 unsigned int index;
				 d.laden(index);
				 d.laden(gt);
				 game=solitaire->newgame(index,0,false,false);
				 //game->initgame(solitaire,1,index);
				 game->load(&d);
				 unsigned int pc;
				 d.laden(pc);
				 for(unsigned int i=0;i<pc;i++){
				  _pile*pit=0;
				  _zeichenkette<_tt> pt;
				  d.laden(pt);//piletyp
				  if(pt==L"_piletableau"){
				   pit=game->createpiletableau(1,0,0);
				  }else if(pt==L"_pilecruel"){
				   pit=game->createpilecruel(0,0);
				  }else if(pt==L"_pileacesup"){
				   pit=game->createpileacesup(0,0);
				  }else if(pt==L"_pilestock"){
				   pit=game->createpilestock(0,0,0,0);
				  }else if(pt==L"_pilestockpyramid"){
				   pit=game->createpilestockpyramid(0,0);
				  }else if(pt==L"_pileredeal"){
				   pit=game->createpileredeal(0,0);
				  }else if(pt==L"_pilediscard"){
				   pit=game->createpilediscard(0,0);
				  }else if(pt==L"_pilewaste"){
				   pit=game->createpilewaste(0,0);
				  }else if(pt==L"_pilewastepyramid"){
				   pit=game->createpilewastepyramid(0,0);
				  }else if(pt==L"_pilefoundation"){
				   pit=game->createpilefoundation(0,0);
				  }else if(pt==L"_pilereserve"){
				   pit=game->createpilereserve(0,0);
				  }else if(pt==L"_pilefreecell"){
				   pit=game->createpilefreecell(0,0);
				  }else if(pt==L"_pilepyramid"){
				   pit=game->createpilepyramid(0,0);
				  }else if(pt==L"_pilebethoral"){
				   pit=game->createpilebethoral(0,0);
				  }else if(pt==L"_pileblanket"){
				   pit=game->createpileblanket(0,0);
				  }else if(pt==L"_pilemaze"){
				   pit=game->createpilemaze(0,0,9);
				  }else if(pt==L"_pilearray"){
				   pit=game->createpilearray(0,0,1,1);
				  }else if(pt==L"_pilelabyrinth"){
				   pit=game->createpilelabyrinth(0,0,1,1);
				  }else if(pt==L"_pilesweetmatch"){
				   pit=game->createpilesweetmatch(0,0,1,1);
				  };
				  if(pit)pit->load(&d);
				 };
				 game->assoziieren();
				 _animationundo*ait;
				 _card*cit;
				 _pile*pit;
				 if(game->undolist.anfang(ait))do{
				  ait->assoziieren();
				 }while(game->undolist.naechstes(ait));
				 if(game->cardlist.anfang(cit))do{
				  cit->assoziieren();
				 }while(game->cardlist.naechstes(cit));
				 if(game->pilelist.anfang(pit))do{
				  pit->assoziieren();
				  if(pit->anfang(cit))do{
				   cit->assoziieren();
				  }while(pit->naechstes(cit));
				 }while(game->pilelist.naechstes(pit));
				 //************* DEBUG pilesweetmatch integrität ***************
				 //_pilesweetmatch*ps=game->pilesweetmatch(0);
				 //if(ps){
				  //Print "erster Integritätscheck nach dem Laden von pilesweetmatch"
				  //ps->checkintegrity()
				 //};
				 //*************************************************************				
				 d.schliessen();
				}else{
				 //messagebox("Dieser Spieltyp wurde bisher noch nicht gespeichert.")
				 //speicherdatei nicht vorhanden
				};
				//Print "Nach dem Laden gibt es "+storeablelist.count()+" Storeables"
				//Print "...davon stats storeables :"+countstatsstoreables()
				//Print "...davon anim storeables :"+countanimationstoreables()
				//Print "...davon game storeables :"+countgamestoreables()
				//Print "...davon pile storeables :"+countpilestoreables()
				//Print "...davon card storeables :"+countcardstoreables()
				game->update();
				return(game);
};

//******************************************************************************************************************
//										G A M E S T A T I S T I C S
//******************************************************************************************************************
_gamestats::_gamestats(_solitaire*s,unsigned int typ):_speicherbarbinaer(s){
				solitaire=s;
				gametype=typ;
};
_gamestats::~_gamestats(){
};
void _gamestats::clearhighscorelist(){
				highscorelist.loeschen();
};
void _gamestats::clearentrylist(){
				entrylist.loeschen();
};		
int _gamestats::countuser(const _zeichenkette<_tt>&u){
				unsigned int i=0;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 if(eit->user==u) i++;
				}while(entrylist.naechstes(eit));
				return(i);
};
_tg _gamestats::timeaverage(){
				_tg t=0;
				_tg c=0;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 t+=eit->time;
				 c+=1;
				}while(entrylist.naechstes(eit));
				if(c>0) t/=c;
				return(t);
};
_tg _gamestats::timeaverageuser(const _zeichenkette<_tt>&u){
				_tg t=0;
				_tg c=0;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 if(eit->user==u){
				  t+=eit->time;
				  c+=1;
				 };
				}while(entrylist.naechstes(eit));
				if(c>0) t/=c;
				return(t);
};
_tg _gamestats::timemaximum(){
				_tg t=-1;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 if(eit->time>t) t=eit->time;
				}while(entrylist.naechstes(eit));
				return(t);
};
_tg _gamestats::timeminimum(){
				_tg t=timemaximum();
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 if(eit->time<t) t=eit->time;
				}while(entrylist.naechstes(eit));
				return(t);
};
_tg _gamestats::moveaverage(){
				_tg m=0;
				_tg c=0;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 m+=eit->moves;
				 c+=1;
				}while(entrylist.naechstes(eit));
				if(c>0) m/=c;
				return(m);
};
_tg _gamestats::moveaverageuser(const _zeichenkette<_tt>&u){
				_tg m=0;
				_tg c=0;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 if(eit->user==u){
				  m+=eit->moves;
				  c+=1;
				 };
				}while(entrylist.naechstes(eit));
				if(c>0) m/=c;
				return(m);
};
_tg _gamestats::discardaverage(){
				_tg m=0;
				_tg c=0;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 m+=eit->discards;
				 c+=1;
				}while(entrylist.naechstes(eit));
				if(c>0) m/=c;
				return(m);
};
_tg _gamestats::discardaverageuser(const _zeichenkette<_tt>&u){
				_tg m=0;
				_tg c=0;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 if(eit->user==u){
				  m+=eit->discards;
				  c+=1;
				 };
				}while(entrylist.naechstes(eit));
				if(c>0) m/=c;
				return(m);
};
_tg _gamestats::quote(){
				unsigned int c=entrylist.anzahl();
				if(c==0) return(0);
				_tg n=0;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 if(eit->successful()) n+=1;
				}while(entrylist.naechstes(eit));
				return(n/c);
};
_tg _gamestats::quoteuser(const _zeichenkette<_tt>&u){
				if(entrylist.anzahl()==0) return(0);
				_tg c=0;
				_tg n=0;
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 if(eit->user==u){
				  if(eit->successful()) n+=1;
				  c+=1;
				 };
				}while(entrylist.naechstes(eit));
				return(n/c);
};
void _gamestats::save(_datei*d){
				d->speichern(_zeichenkette<char>("_gamestats"));
				d->speichern(speichername());
				d->speichern(gametype);

				d->speichern(entrylist.anzahl());
				_gamestatsentry*eit;
				if(entrylist.anfang(eit))do{
				 eit->save(d);
				}while(entrylist.naechstes(eit));
				
				d->speichern(highscorelist.anzahl());
				_gamestatsentry*hit;
				if(highscorelist.anfang(hit))do{
				 hit->save(d);
				}while(highscorelist.naechstes(hit));
};
void _gamestats::load(_datei*d){
				entrylist.loeschen();
				highscorelist.loeschen();
				ladenbeginn();
				d->laden(speichername());
				d->laden(gametype);
				unsigned int z;
				unsigned int i;
				_zeichenkette<char> t;

				d->laden(z);
				for(i=0;i<z;i++){
				 _gamestatsentry*eit=new _gamestatsentry(this);
				 d->laden(t);
				 eit->load(d);
				};
				//entrylist.sort()

				d->laden(z);
				for(i=0;i<z;i++){
				 _gamestatsentry*hit=new _gamestatsentry(this,true);
				 d->laden(t);
				 hit->load(d);
				};
				highscorelist.sortieren();//!!!!!!!!!!!!!!
				};		
void _gamestats::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};	

//******************************************************************************************************************
//										G A M E S T A T I S T I C S E N T R Y
//******************************************************************************************************************
_gamestatsentry::_gamestatsentry(_gamestats*g,bool high):_speicherbarbinaer(g->solitaire){
	            date=0;
	            discards=0;
	            time=0;
	            moves=0;
	            undos=0;
                tipps=0;
	            closed=false;
	            highscored=false;
	            inhighscorelist=false;
	            quoteverlauf=0;
				gamestats=g;
				if(high){
				 gamestats->highscorelist.einhaengen(this);
				 inhighscorelist=true;
				}else{
				 gamestats->entrylist.einhaengen(this);
				};
};
_gamestatsentry::~_gamestatsentry(){
};
void _gamestatsentry::copy(_gamestatsentry*g){
				discards=g->discards;
				time=g->time;
				moves=g->moves;
				tipps=g->tipps;
				user=g->user;
				undos=g->undos;
};
_tg _gamestatsentry::score(){
				//return((discards*10)+(Float(100)/time));
				return(discards+_tg(1)/_tg(1+time/1000));
};
bool _gamestatsentry::successful(){
                if(discards==gametype[gamestats->gametype].punktemaximal) return(true); else return(false);
};                

bool _gamestatsentry::vergleichen(_gamestatsentry*o){
				if(score()<o->score()) return(true); else return(false);
};
void _gamestatsentry::close(){
				closed=true;
};
unsigned int _gamestatsentry::index(){
				unsigned int i=0;
				_gamestatsentry*e;
				if(inhighscorelist){
				 if(gamestats->highscorelist.anfang(e))do{
				  if(e==this) return(i);
				  i++;
				 }while(gamestats->highscorelist.naechstes(e));
				}else{
				 if(gamestats->entrylist.anfang(e))do{
				  if(e==this) return(i);
				  i++;
				 }while(gamestats->entrylist.naechstes(e));
				};
				return(0);
};
void _gamestatsentry::save(_datei*d){
				d->speichern(_zeichenkette<char>("_gamestatsentry"));
				d->speichern(speichername());
				d->speichern(discards);
				d->speichern(time);
				d->speichern(moves);
				d->speichern(undos);
				d->speichern(tipps);
				d->speichern(user);
				d->speichern(date);
};
void _gamestatsentry::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				d->laden(discards);
				d->laden(time);
				d->laden(moves);
				d->laden(undos);
				d->laden(tipps);
				d->laden(user);
				d->laden(date);
};
void _gamestatsentry::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};


//******************************************************************************************************************
//										G A M E 
//******************************************************************************************************************
_game::_game(_solitaire*s,unsigned int m,bool prev,bool menue):_speicherbarbinaer(s){
				solitaire=s;
				mode=m;
				index=0;
	            allowpick=true;
	            music=0;
	            preview=prev;
	            menu=menu;
	            inuse=false;
	            ended=false;
	            endedbygiveupburn=false;
	            pileinfo=0;
	            pileinfoname=L"";
	            pileinfodescription0=L"";
	            pileinfodescription1=L"";
	            pileinfoopacity=0;
	            pileinfotime=0;
	            starttime=0;
	            pickstate=0;
	            pickoffsetcard=0;
	            pickoffsetx=0;
	            pickoffsety=0;
	            cardwidth=0;
	            cardheight=0;
	            carddistance=0;
	            cardshiftfront=0;
	            cardshiftback=0;
	            scaleglobal=1;
	            gravityblow=0;
	            blowing=false;
	            undoiterator=0;
	            statsclosed=false;
	            discards=0;
	            time=0;
	            moves=0;
	            undos=0;
	            tipps=0;
	            tippsourpileiterator=0;
	            tippsourcarditerator=0;
	            tippdestpileiterator=0;
	            autoplaysourpileiterator=0;
	            autoplaysourcarditerator=0;
	            autoplaydestpileiterator=0;
	            automovesourpileiterator=0;
	            automovesourcarditerator=0;
	            automovedestpileiterator=0;
	            clickplaysourpileiterator=0;
	            clickplaysourcarditerator=0;
	            clickplaydestpileiterator=0;
	            tippreservepile=0;
	            tippreservecard=0;
	            tippstockpile=0;
	            tippwastepile=0;
	            tippredealpile=0;
	            foundsour=0;
	            founddest=0;
	            loadprocuii=0;
	            loadprocpc=0;
	            automoveundodelay=false;
	            automoveundostart=0;
	            keyboardinputblocked=false;
	            effectindex=0;
				for(int i=0;i<10;i++){ 
				 cameraposition[i].setzen(0,0,-39);
				 camerapositionmenu[i].setzen(3,1,-50);
				 camerapositionpreview[i].setzen(0,4,-120);
				 cameraview[i].setzen(0,0,2);
				 cameraviewmenu[i].setzen(0,0,2);
				 cameraviewpreview[i].setzen(0,0,2);
				 cameraside[i].setzen(1,0,0);
				 camerasidemenu[i].setzen(1,0,0);
				 camerasidepreview[i].setzen(1,0,0);
				 cameraup[i].setzen(0,0.8,0);
				 cameraupmenu[i].setzen(0,0.75,0);
				 camerauppreview[i].setzen(0,0.8,0);
				};
				position.setzen((-13.2+18.5)*0.5,(-12.5+10)*0.5,0);
				vector[0].setzen((18.5- -13.2)*0.5,0,0);
				vector[1].setzen(0,(10- -12.5)*0.5,0);
				music=zufall<unsigned int>(0,2);
				//SeedRnd(MilliSecs());//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				
				effectindex=zufall<unsigned int>(0,1);
				//gravityblow=new _feld<_tg>();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				//gravityblow->homogen.setzen(0,0,0);
				//gravityblow->erzeugengravitation(0,0,0,-20);
				autoplaysourpileiterator=0;
				autoplaysourcarditerator=0;
				autoplaydestpileiterator=0;
				
				animationlist.loeschen();
				//disableallrules()
				clearcards();
				cardwidth=solitaire->cardwidth;
				cardheight=solitaire->cardheight;
				carddistance=solitaire->carddistance;
				cardshiftfront=solitaire->cardshiftfront;
				cardshiftback=solitaire->cardshiftback;				
};

_game::~_game(){
				
				if((preview==false)&&(menu==false)) solitaire->takestatistics(true);//destruktorargument : bool showhighscore);//!!!!!!!!!!!!!!!!!!!!!!!!!!
				L->schreiben("_game:: DESTRUKTOR :");
				L->schreiben("pile list vor =",(int)pilelist.anzahl());
				L->schreiben("pile foundationlist vor =",(int)pilefoundationlist.anzahl());
				//while(pilelist.letztes()) {
			    pilelist.loeschen();
				 L->schreiben("nachIT =",(int)pilelist.anzahl());
				 L->schreiben("pile foundationlist nachIT =",(int)pilefoundationlist.anzahl());
				//};
				 //piletableaulist.loeschen();
				 L->schreiben("nach =",(int)pilelist.anzahl());
				 L->schreiben("pile foundationlist navh =",(int)pilefoundationlist.anzahl());


};			
//tableau pile rule states
void _game::tableaugiverestrictionfreecell(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->giverestrictionfreecell=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableaugivesamesuit(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->givesamesuit=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableaugiveothersuit(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->giveothersuit=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableaugivealteratecolor(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->givealteratecolor=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableaugivedescending(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->givedescending=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableaugiveascending(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->giveascending=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableautakesamesuit(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->takesamesuit=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableautakeothersuit(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->takeothersuit=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableautakealteratecolor(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->takealteratecolor=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableautakeascending(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->takeascending=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableautakedescending(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->takedescending=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableautakeboth(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->takeboth=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableautakewrapped(bool b){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->takewrapped=b;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableautakeemptynumber(int i){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->takeemptynumber=i;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableautakeemptysuit(int i){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->takeemptysuit=i;
				}while(piletableaulist.naechstes(tit));
};
void _game::tableaumaximumlength(_tg i){
				_piletableau*tit;
				if(piletableaulist.anfang(tit))do{
				 tit->camerastretch=false;
				 tit->maximumlength=i;
				}while(piletableaulist.naechstes(tit));
};
//foundation rule states
void _game::foundationdescending(bool b){
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 fit->takedescending=b;
				}while(pilefoundationlist.naechstes(fit));
};
void _game::foundationascending(bool b){
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 fit->takeascending=b;
				}while(pilefoundationlist.naechstes(fit));
};
void _game::foundationsamesuit(bool b){
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 fit->takesamesuit=b;
				}while(pilefoundationlist.naechstes(fit));
};
void _game::foundationboth(bool b){
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 fit->takeboth=b;
				}while(pilefoundationlist.naechstes(fit));
};
void _game::foundationwrapped(bool b){
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 fit->takewrapped=b;
				}while(pilefoundationlist.naechstes(fit));
};
void _game::foundationmirrored(bool b){
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 fit->takemirrored=b;
				}while(pilefoundationlist.naechstes(fit));
};
void _game::foundationgiverestriction(bool b){
				_pilefoundation*fit;
				if(pilefoundationlist.anfang(fit))do{
				 fit->giverestriction=b;
				}while(pilefoundationlist.naechstes(fit));
};
void _game::startusing(){
				if(preview==false){
				 solitaire->adjustcamera();
				 if((inuse==false)&&(ended==false)){
				  inuse=true;
				  if(preview==false) solitaire->sgong->abspielen(1,0.999,1.00);
				  starttime=solitaire->clock->system();
				  statsclosed=false;
				  discards=0;
				  time=0;
				  moves=0;
				  undos=0;
				  tipps=0;
				 };
				};
};
void _game::endusing(){
};
_tg _game::score(){
				return(discards+_tg(1)/_tg(1+time));
};	
void _game::startanimation(){
                _animation*ait;
				if(animationlist.anfang(ait))do{
				 ait->start(false);
				}while(animationlist.naechstes(ait));
};
void _game::skipanimation(){
				L->schreiben("_game::skipanimation() : einstieg");
				_animation*a;
				if(animationlist.anfang(a)){
				 if(a->started){
				  a->skipcurvingcards();
				  a->skip();
				  a->checkend();
				  delete a;
				  //RemoveLink(animationlist.erstes());
				 };
				};
				while(animationlist.anfang(a)){
				 L->schreiben("_game::skipanimation() : a wird geskip.");
				 a->start(true);
				 a->skip();
				 a->checkend();
				 delete a;
				};
				//end of preparative animation
				//pyramide initialisation
				endpreparation();
};
void _game::endpreparation(){
                _pile*pit;
                _card*cit;
				if(pilelist.anfang(pit))do{
				 _pilepyramid*pp=dynamic_cast<_pilepyramid*>(pit);
				 if(pp) pp->initcardpyramid();
				 if(pit->anfang(cit))do{
				  cit->inpreparation=false;
				 }while(pit->naechstes(cit));
			    }while(pilelist.naechstes(pit));
				if(cardlist.anfang(cit))do{
				 cit->inpreparation=false;
				}while(cardlist.naechstes(cit));
				tippresetcombination(0);
				tippresetcombination(1);
				tippresetcombination(2);
				tippresetcombination(3);
};
void _game::setanimationpreparative(){
                _animation*ait;
                _card*cit;
				if(animationlist.anfang(ait))do{
				 ait->preparative=true;
				}while(animationlist.naechstes(ait));
				//weiterhin alle karten in den animationszustand bringen
				if(cardlist.anfang(cit))do{
				 cit->inpreparation=true;
				}while(cardlist.naechstes(cit));
};
_piletableau*_game::createpiletableau(unsigned int count,_tg px,_tg py,_tg dx,_tg dy){
				_tg tabx=tabulatorx();
				_tg taby=tabulatory();
				if(dx==-1) dx=tabx;
				_piletableau*pt=0;
				for(unsigned int i=0;i<count;i++){
				 _piletableau*pit=new _piletableau(this,px+_tg(i)*dx,py+_tg(i)*dy);
				 pt=pit;
				};
				return(pt);
};
_pilecruel*_game::createpilecruel(_tg px,_tg py){
				return(new _pilecruel(this,px,py));
};
_pileacesup*_game::createpileacesup(_tg px,_tg py){
				return(new _pileacesup(this,px,py));
};
_pilebethoral*_game::createpilebethoral(_tg px,_tg py){
				return(new _pilebethoral(this,px,py));
};	
_pileblanket*_game::createpileblanket(_tg px,_tg py){
				return(new _pileblanket(this,px,py));
};
_pilemaze*_game::createpilemaze(_tg px,_tg py,unsigned int dim){
				return(new _pilemaze(this,px,py,dim));
};
_pilestock*_game::createpilestock(_tg px,_tg py,int tpc,int twc,int tfc,bool tlc){
				return(new _pilestock(this,px,py,tpc,twc,tfc,tlc));
};	
_pilestockpyramid*_game::createpilestockpyramid(_tg px,_tg py){
				return(new _pilestockpyramid(this,px,py,0,1,0,false));
};	
_pileredeal*_game::createpileredeal(_tg px,_tg py,int counts){
				return(new _pileredeal(this,px,py,counts));
};
_pilereserve*_game::createpilereserve(_tg px,_tg py){
				return(new _pilereserve(this,px,py));
};				
_pilewaste*_game::createpilewaste(_tg px,_tg py){
				return(new _pilewaste(this,px,py));
};
_pilewastepyramid*_game::createpilewastepyramid(_tg px,_tg py){
				return(new _pilewastepyramid(this,px,py));
};
_pilefoundation*_game::createpilefoundation(_tg px,_tg py){
				return(new _pilefoundation(this,px,py));
};
_pilefreecell*_game::createpilefreecell(_tg px,_tg py,int suit){
				return(new _pilefreecell(this,px,py,suit));
};
_pilediscard*_game::createpilediscard(_tg px,_tg py){
				return(new _pilediscard(this,px,py));
};
_pilepyramid*_game::createpilepyramid(_tg px,_tg py){
				return(new _pilepyramid(this,px,py));
};
_pilelabyrinth*_game::createpilelabyrinth(_tg px,_tg py,unsigned int dimx,unsigned int dimy){
				return(new _pilelabyrinth(this,px,py,dimx,dimy));
};			
_pilearray*_game::createpilearray(_tg px,_tg py,unsigned int dimx,unsigned int dimy){
				return(new _pilearray(this,px,py,dimx,dimy));
};			
_pilesweetmatch*_game::createpilesweetmatch(_tg px,_tg py,unsigned int dimx,unsigned int dimy){
				return(new _pilesweetmatch(this,px,py,dimx,dimy));
};						
void _game::clearcards(){
	 			cardlist.loeschen();
};
void _game::createcards(unsigned int deckscount,unsigned int suit){
				_card*cit;
				for(unsigned int deck=0;deck<deckscount;deck++){
				 for(unsigned int number=0;number<13;number++){
				  cit=new _card(solitaire,this,suit,number);
				  cit->insertgame();
				 };
				};
};
_card*_game::createcard(unsigned int suit,unsigned int number){
				_card*cit;
				cit=new _card(solitaire,this,suit,number);
				cit->insertgame();
				return(cit);
};
void _game::clearcard(unsigned int index){
				_card*c=card(index);
				deletesecure(c);
};
_piletableau*_game::piletableau(unsigned int index){
                return(piletableaulist[index]);
};
_pilelabyrinth*_game::pilelabyrinth(unsigned int index){
				return(pilelabyrinthlist[index]);
};
_pilearray*_game::pilearray(unsigned int index){
				return(pilearraylist[index]);
};	
_pilefoundation*_game::pilefoundation(unsigned int index){
				return(pilefoundationlist[index]);
};
_pilesweetmatch*_game::pilesweetmatch(unsigned int index){
				return(pilesweetmatchlist[index]);
};		
_pilereserve*_game::pilereserve(unsigned int index){
				return(pilereservelist[index]);
};		
_pilestock*_game::pilestock(unsigned int index){
				return(pilestocklist[index]);
};		
_pilewaste*_game::pilewaste(unsigned int index){
				return(pilewastelist[index]);
};
_pileredeal*_game::pileredeal(unsigned int index){
				return(pileredeallist[index]);
};
void _game::pilesort(){
				pilelist.sortieren();//!!!!!!!!!!!!!!!!!!!!!!!!
};
bool _game::hasfreecells(){
				if(pilefreecelllist.anzahl()>0) return(true); else return(false);
};				
unsigned int _game::countfreefreecells(){
				unsigned int c=0;
				_pilefreecell*pf;
				if(pilefreecelllist.anfang(pf))do{
				 if(pf->anzahl()==0) c++;
				}while(pilefreecelllist.naechstes(pf));
				return(c);
};
void _game::cardposition(_tg px,_tg py,_tg pz){
				_tg i=0;
				_card*cit;
				if(cardlist.anfang(cit))do{
				 cit->position.setzen(px,py,pz+i);
				 cit->updatemesh();
				 cit->updateshadow();
				 i-=solitaire->cardthickness;
 			    }while(cardlist.naechstes(cit));
};
void _game::shufflecards(int imin,int imax){
				int c=cardlist.anzahl();
				int inmin=imin;
				int inmax=imax;
				if(inmax==-1) inmax=c-1;
				_card**temp=new _card*[c];
				int i0,i1;
				int index=0;
				_card*cit;
				if(cardlist.anfang(cit))do{
				 temp[index]=cit;
				 index++;
				}while(cardlist.naechstes(cit));
				unsigned int t=cardlist.anzahl()*10;//*solitaire->difficulty
				for(unsigned int n=0;n<t;n++){
				 i0=zufall<int>(inmin,inmax);
				 i1=zufall<int>(inmin,inmax);
				 if(i1!=i0){
				  cit=temp[i0];
				  temp[i0]=temp[i1];
				  temp[i1]=cit;
				 };
				};
				_liste<_card> newlist;
				for(index=0;index<c;index++){
				 //temp[index].gamelink=
				 newlist.einhaengen(temp[index]);
				};
				while(cardlist.anfang(cit)) cit->_listenknotenbasis<_card>::aushaengen();
				_listenknoten<_card>*lncit;
				if(newlist.anfang(lncit))do{
				 cardlist.einhaengen(lncit->objekt());
				}while(newlist.naechstes(lncit));
				//cardlist=newlist
				int i=0;
				int q;
				if(cardlist.anfang(cit))do{
				 q=i%8;
				 cit->opacityquant=_to(q);
				 i++;
				}while(cardlist.naechstes(cit));
};
_card*_game::card(unsigned int index){
				return(cardlist[index]);
};
_card*_game::cardfromlast(unsigned int index){
				unsigned int i=0;
				_card*it;
				if(cardlist.anfang(it)){
				 it=it->vorheriges();
				 do{
				  if(i==index) return(it);
				  i++;
				  it=it->vorheriges();
				 }while(it);
				};
				return(0);
};
void _game::swapcards(unsigned int i0,unsigned int i1){
				unsigned int n;
				_textur<_tb>*t;
				_card*c0=card(i0);
				_card*c1=card(i1);
				n=c0->suit;
				c0->suit=c1->suit;
				c1->suit=n;
				
				n=c0->number;
				c0->number=c1->number;
				c1->number=n;
				_polygon*p0;//=_polygon(c0.mesh.polygonlist->erstes().value())
				_polygon*p1;//=_polygon(c1.mesh.polygonlist->erstes().value())
				c0->mesh->anfang(p0);
				c1->mesh->anfang(p1);
				//for(Local i=0 To 1
				// for(Local j=0 To 3 
				  t=p0->textur();
				  p0->textur(p1->textur());
				  p1->textur(t);
				// };
				//};
};
unsigned int _game::cardcount(){//returns the total count of cards in the game
				unsigned int c=0;
				_pile*pit;
				if(pilelist.anfang(pit))do{//pit:_pile=EachIn pilelist
				 c+=pit->cardcount();
				}while(pilelist.naechstes(pit));
				return(c);
};
bool _game::checkend(){
				if((discards==gametype[solitaire->currentgame].punktemaximal)&&(ended==false)){
				 //statsclosed=true
				 ended=true;
				 if(preview==false) solitaire->sgong->abspielen(1,1.5,1.6);
				 if((preview==false)&&(menu==false)) solitaire->takestatistics(true);
				 return(true);
				};
				return(false);
};
void _game::drawpile(_grafik*gra,_kamera<_tg>*cam){
				_pile*pit;
				if(pilelist.anfang(pit))do{
				 pit->draw(gra,cam);
				}while(pilelist.naechstes(pit));
};
void _game::drawpilecard(_grafik*gra,_kamera<_tg>*cam){
				_pile*pit;
				_card*cit;
				if(pilelist.anfang(pit))do{
				 if(pit->anfang(cit)){
				  cit=cit->vorheriges();
				  do{
				   if((cit->poly->markierung()==0)&&(cit->inpreparation==false)) cit->draw(gra,cam);
				   cit=cit->vorheriges();if(cit==cit->liste()->letztes()) cit=0;
				  }while(cit);
				 };
				}while(pilelist.naechstes(pit));
};
void _game::drawpilecardshadowneigung(_grafik*gra,_kamera<_tg>*cam){
				_pile*pit;
				_card*cit;
				if(pilelist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  if(cit->neigungx<-0.01){
				   _to op=fabs(cit->neigungx/solitaire->cardslopepick);
				   _schatteneinfach<_tg,_to>*sit=0;
				   for(unsigned int i=0;i<cit->shadowarraycount;i++){//sit:_shadow=EachIn cit.shadowlist
				    sit=cit->shadowarray[i];
				    sit->mesh->opazitaetverbinder(op*cit->opacity*sit->opacity*0.35);
				    sit->zeichnen(gra);
				   };
				  };
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
};
void _game::drawcard(_grafik*gra,_kamera<_tg>*cam){//alle die in cardlist sind, aber sortiert
				_listenknoten<_polygon>*c;
				if(drawlist.anfang(c))do{
				 if(c->objekt()->markierung()==2) c->objekt()->zeichnen(gra);
				}while(drawlist.naechstes(c));
};
void _game::drawnocurving(_grafik*gra,_kamera<_tg>*cam){
				_listenknoten<_polygon>*c;
				if(drawlist.anfang(c))do{
				 if(c->objekt()->markierung()==0) c->objekt()->zeichnen(gra);
				}while(drawlist.naechstes(c));
};
void _game::drawcurving(_grafik*gra,_kamera<_tg>*cam){
				_listenknoten<_polygon>*c;
				if(drawlist.anfang(c))do{
				 if(c->objekt()->markierung()==1) c->objekt()->zeichnen(gra);
				}while(drawlist.naechstes(c));
};
void _game::draw(_grafik*gra,_kamera<_tg>*cam){
				//drawlist.sort();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				_listenknoten<_polygon>*c;
				if(drawlist.anfang(c))do{
				 c->objekt()->zeichnen(gra);
				}while(drawlist.naechstes(c));
};
void _game::drawshow(_grafik*gra,_kamera<_tg>*cam){
				_pile*pit;
				if(pilelist.anfang(pit))do{
				 pit->drawshow(gra,cam);
				}while(pilelist.naechstes(pit));
};
void _game::animate(_zeit*c){
				//--------------------------------------------------- general animation ----------------------------------------------------
	   			if((solitaire->tastatur->knopflinks())&&(allowpick)){
	             if((inner())&&(solitaire->iggsystem->mouseovergui(solitaire->maus)==false)) startusing();
				};
				if(statsclosed==false){
				 if(solitaire->paused==false) time=solitaire->clock->system()-starttime;
				 discards=0;//will be add be eachin pile now later
				};
				if(animationlist.erstes()){//process the animations, all inputs must be blocked
				 bool skip=false;
				 if(
				 (((((solitaire->mousebutton[0])||(solitaire->mousebutton[1]))&&(inner())) || (solitaire->tastatur->taste())) && (allowpick))
				 ){ //&& au=0
				 //if((((solitaire->mousebutton[0] || solitaire->mousebutton[1])) || keypress!=0) && allowpick //&& au=0
				  skip=true;
				  _animation*a;
				  animationlist.anfang(a);
				  if(a->skipable==false) skip=false;
				 };
				 if(skip){
				  if(solitaire->usedskipanimation>0) solitaire->usedskipanimation-=1;
				  skipanimation();
				  keyboardinputblocked=true;
				 }else{
				  _animation*a;
				  animationlist.anfang(a);
				  a->start(false);
				  if(a->animate()==false){
				   //Print "animate ended"
				   delete a;
				   //a.clear()
				   //RemoveLink animationlist.erstes()
				   if(animationlist.anfang(a)){
				    a->start(false);
				   }else{
				    //end of preparative animation
				    //pyramide initialisation
					endpreparation();
				   };
				  }else{
				   if((solitaire->usedskipanimation>0)&&(a->skipable)){
				    solitaire->messagestatusbar(strskipanimationhint,1,100);
				   };
				  };
				 };
				};
				//--------------------------------------------------- tipp animation --------------------------------------------------
				_card*cit;
				if(tipplist.anfang(cit))do{
				 cit->animatecurve();
				 cit->animatenaturality();
				 //cit->updatelighting()
				 cit->updatemesh();
				 cit->updateshadow();
				 cit->opacity=cit->curveopacity.berechnen(cit->curvepositiont);
				 if(cit->opacity>1) cit->opacity=1;
				 if(cit->opacity<0) cit->opacity=0;
				 cit->cardcontrolopacity->opacity=1-cit->opacity;
				 if(cit->curving==false) cit->_listenknotenbasis<_card>::loeschmarkierung(true);
				}while(tipplist.naechstes(cit));
				tipplist.loeschenmarkiert();
				//------------------------------------------------ PICKLISTTRANSFORMATION ----------------------------------------------				
				_tg g=(-2.6-solitaire->cam->z())/solitaire->mousevector.z();
				_tg ix=solitaire->cam->x()+g*solitaire->mousevector.x();
				_tg iy=solitaire->cam->y()+g*solitaire->mousevector.y();
				_tg i=0;
				_tg wirk=0.5;
				_tg wiri=1-wirk;
				_tg df=0.1/_tg(picklist.anzahl());
				_listenknoten<_card>*lit;//Local lit:TLink=picklist->erstes()
				_tg offy=pickoffsety;
				_tg offx=pickoffsetx;
				_tg ff=0;
				if(picklist.anfang(lit)){
				 do{
				  _card*c=lit->objekt();
				  ff-=df;
				  if(c->pickending==false){
				   if(solitaire->mouseovercard) c->neigungx=-(solitaire->cardslopepick*0.1-c->neigungx*0.9);
				   if(solitaire->pointandclickalternative){
				    c->position.z(_tg(-3.5-solitaire->cardtableaulift-i*solitaire->cardthickness)*(wirk)+c->position.z()*(wiri));
				   }else{ 
				    c->position.setzen((ix-offx)*(wirk+ff)+c->position.x()*(wiri-ff),
	                (((-i*cardshiftfront)+iy)-offy)*(wirk+ff)+c->position.y()*(wiri-ff),
  		            _tg(-2.6-solitaire->cardtableaulift-i*solitaire->cardthickness)*(wirk)+c->position.z()*(wiri));
 				   };
				   c->vy.setzen(0,cardheight,(-solitaire->cardslope*wirk)+c->vy.z()*(wiri));
				   _vektor3<_tg> hvx;
				   hvx.setzen(cardwidth,0,0);
				   if(c->backsided==false){
				    c->vx+=hvx;
				    c->vx*=0.5;
				   }else{
				    hvx*=-1;
				    c->vx+=hvx;
				    c->vx*=0.5;
				   };
				  };
				  i+=1;
				 }while(picklist.naechstes(lit));
				};
				//--------------------------------------------- PICKLISTANIMATION ---------------------------------------------				
				if(animationlist.erstes()==0){
				 bool drop=false;
				 if((solitaire->pointandclick)||(solitaire->pointandclickalternative)){
				  if(pickstate==3){
				   if(solitaire->mousebutton[0]==false){
				    pickstate=0;
				    drop=true;
				   };
				  };
				  if(pickstate==2){
				   if(solitaire->mousebutton[0]){
				    pickstate=3;
				   };
				  };
				 }else{
				  if(solitaire->mousebutton[0]==false) drop=true;
				 };
				 if((drop)&&(picklist.anfang(lit))){
				  _card*card=lit->objekt();//_card(picklist->erstes().value())
				  if(solitaire->pointandclickalternative==false){//----------------------
				   _pile*firstpile=card->pile;
				   if(firstpile->inner()){
				    if(firstpile->candrop(&picklist)){
					 firstpile->drop();
					}else{
					 card->depick();
					};
				   }else{
				    //check other piles
				    bool dr=false;
				    _pile*pit;
				    if(pilelist.anfang(pit))do{//for(Local pit:_pile=EachIn pilelist
				     if(pit!=card->pile){
				      if(pit->inner()){
				       if(pit->candrop(&picklist)){
				        if(dr==false){
	 			         pit->drop();
		 		         dr=true;
			 	        };
				       };
				      };
				     };
				    }while(pilelist.naechstes(pit));
				    if(dr==false) card->depick();
				   };
				  }else{//----------------------------------------------------------
				   //check other piles
				   bool dr=false;
				   _pile*pit;
				   if(pilelist.anfang(pit))do{//for(Local pit:_pile=EachIn pilelist
				    if(pit->inner()){
				     if(pit->candrop(&picklist)){
				      if(dr==false){
	 			       pit->drop();
		 		       dr=true;
			 	      };
				     };
				    };
				   }while(pilelist.naechstes(pit));
				   if(dr==false) card->depick();
				  };
				 };

				 if((solitaire->pointandclick)||(solitaire->pointandclickalternative)){
				  if(pickstate==1){
				   if(solitaire->mousebutton[0]==false) pickstate=2;
				  }; 
				  if(pickstate==0){
				   if(solitaire->mousebutton[0]){
				    bool ps1=false;
				    _listenknoten<_card>*lncit;
				    if(picklist.anfang(lncit))do{
				     if((lncit->objekt()->picked)&&(lncit->objekt()->pickending==false)) ps1=true;
				    }while(picklist.naechstes(lncit));
				    if(ps1) pickstate=1;
				   };
				  };
				 };
				};
				//--------------------------------------- pile & card animation-----------------------------------------
				pileinfo=0;
				_pile*pit;
				
				if(pilelist.anfang(pit))do{
				 pit->animate(c);
				}while(pilelist.naechstes(pit));
				if(cardlist.anfang(cit))do{
				 cit->animate();
				}while(cardlist.naechstes(cit));
				_tg ntpit=c->system();
				_tg dtpit=ntpit-pileinfotime;
				pileinfotime=ntpit;
				dtpit/=1000;
				if(pileinfoopacity>0){
				 pileinfoopacity-=dtpit;
				 if(pileinfoopacity<0) pileinfoopacity=0;
				};
				//--------------------------------------- animate effects --------------------------------------------
				animateeffects();
				//--------------------------------------- auto moves -------------------------------------------------
				if(automoveundodelay==false){
				 automove();
				}else{
				 if((solitaire->clock->system()-automoveundostart)>3500) automoveundodelay=false;
				};
				//-------------------------------------- keyboard ------------------------------------------------
				if(keyboardinputblocked){
				 if(solitaire->tastatur->taste()==false){
				  keyboardinputblocked=false;
				 };
				};
				//-------------------------------------- end checking ------------------------------------------------
				checkend();
};
void _game::animateeffects(){
				//-------------------------------------------- card fire animation ------------------------------------------------------
				if(picklist.erstes()){
				 _vektor3<_tg> o;
				 _vektor3<_tg> v;
				 _vektor2<_tg> para;
				 _tg time=solitaire->clock->system();
				 o=*(solitaire->cam);
				 _listenknoten<_card>*cit;
				 if(picklist.anfang(cit))do{//for(Local cit:_card=EachIn picklist
				  bool inner=false;
				  _listenknoten<_candle>*lit;
				  if(solitaire->candlegamelist.anfang(lit))do{
				   if((lit->objekt()->sparked)&&(solitaire->sparkingmouse)){
				    //nicht mit dieser
				   }else{
				    v=lit->objekt()->ort();
				    v-=*(solitaire->cam);
				    if(cit->objekt()->innerline(o,v,para)){
				     inner=true;
				    };
				   };
				  }while(solitaire->candlegamelist.naechstes(lit));
				  if(inner){
				   if(cit->objekt()->fire){
				    if(cit->objekt()->fire->aktiv()==false) solitaire->messagestatusbar(strcardburn,1,500);
				    if(cit->objekt()->fireinner==false){
				     cit->objekt()->fireinner=true;
				     cit->objekt()->fireakkustart=time;
				    }else{
				     cit->objekt()->fireakku=time-cit->objekt()->fireakkustart;
				    };
				    if(cit->objekt()->fireakku>1000 ){
				     if((cit->objekt()->fire->aktiv()==false)&&(cit->objekt()->fire->burnopacity>0.99)){
				      cit->objekt()->fire->aktiv(true);
				      cit->objekt()->fire->generateburnpoints(para);
				     };
				    };
			       };	
				  }else{ 
				   cit->objekt()->fireakku=0;
				   cit->objekt()->fireinner=false;
				  };
				  //cit.fire.animateburnpoints()
				 }while(picklist.naechstes(cit));
				};
				//------------------------------------------------- blow effect animation -----------------------------------------
				if(blowlist.erstes()){
				 if(blowing==false) blowing=true;
				 _vektor3<_tg> s;
				 _tg gamma;
				 s=solitaire->mousevector;
				 gamma=-solitaire->cam->z()/s.z(); 
				 s*=gamma;
				 s+=*(solitaire->cam);
				 gravityblow->divergenzort(0,s);
				 _card*c;
				 if(blowlist.anfang(c))do{
				  c->position.z(c->position.z()-0.0001);
				  c->position.z(c->position.z()*1.0001);
				  c->animatephysics();
				  c->updatemesh();
				  c->updateshadow();
				  if(c->opacity<0.01) c->_listenknotenbasis<_card>::loeschmarkierung(true);
				 }while(blowlist.naechstes(c));
				 blowlist.loeschenmarkiert();
				}else{
				 if(blowing){
				  blowing=false;
				  updateshadowarray();
				 };
				};
				//----------------------------------------------- pickvector effect -------------------------------------------------
				_listenknoten<_card>*pc;
				if(picklist.anfang(pc)){
				 _card*fc=pc->objekt();
				 pickvector=fc->position-pickpositionold;
				 pickpositionold=fc->position;
				};
};
void _game::deinsertpick(){
                _listenknoten<_card>*c;
				while(picklist.anfang(c)) c->objekt()->depick();
};				
_liste<_card>*_game::deinsertforblow(){
                _pile*pit;
                _card*cit;
				_liste<_card>*cl=new _liste<_card>();
				if(cardlist.anfang(cit))do{
				 cl->einhaengen(cit);
				}while(cardlist.naechstes(cit));
				
				if(pilelist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  cl->einhaengen(cit);
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
				
				_listenknoten<_card>*c;
				if(cl->anfang(c))do{//for(Local cit:_card=EachIn cl
				 c->objekt()->deinsertforblow();
				}while(cl->naechstes(c));
				return(cl);
};
void _game::insertblowlist(_liste<_card>*cl){
				_listenknoten<_card>*c;
				if(cl->anfang(c))do{
				 c->objekt()->insertblow(this);
				}while(cl->naechstes(c));
				updateshadowarray();
				cl->aushaengen();
};
void _game::update(){
                _pile*pit;
				//update all
				if(pilelist.anfang(pit))do{
				 pit->updatecardmesh();
				 pit->updatemesh();
				}while(pilelist.naechstes(pit));
				sigmadiffuse(solitaire->cardlighting);
				updatepiledescription();
};
void _game::updatepiledescription(){
                _pile*pit;
				if(pilelist.anfang(pit))do{
				 pit->updatedescription();
				}while(pilelist.naechstes(pit));
};
void _game::opacity(_to o){
                _card*cit;
				if(cardlist.anfang(cit))do{
				 cit->opacity=o;
				 cit->updatemesh();
				}while(cardlist.naechstes(cit));
                _pile*pit;
				if(pilelist.anfang(pit))do{
				 pit->opacity(o);
				 if(pit->anfang(cit))do{
				  cit->opacity=o;
				  cit->updatemesh();
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
};
void _game::markforupdateshadow(_licht<_tg,_to>*l){
				_tg ms=solitaire->clock->system();
                _card*cit;
				if(cardlist.anfang(cit))do{
				 cit->meshchangedlasttime=ms;
				 cit->updateshadow();
				}while(cardlist.naechstes(cit));
                _pile*pit;
				if(pilelist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  cit->meshchangedlasttime=ms;
				  cit->updateshadow();
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
};
void _game::updateplane(){
				//update game geometric plane
				/*
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()
				Local x0#=1000,x1#=-1000
				Local y0#=1000,y1#=-1000
				Local cw2#=cardwidth/2
				Local ch2#=cardheight/2
				for(Local pit:_pile=EachIn pilelist
				 if(pit.position.x+cw2>x1 x1=pit.position.x+cw2
				 if(pit.position.x-cw2<x0 x0=pit.position.x-cw2
				 if(pit.position.y+ch2>y1 y1=pit.position.y+ch2
				 if(pit.position.y-ch2<y0 y0=pit.position.y-ch2
				 for(Local cit:_card=EachIn pit.cardlist
				  if(cit.position.x+cw2>x1 x1=cit.position.x+cw2
				  if(cit.position.x-cw2<x0 x0=cit.position.x-cw2
				  if(cit.position.y+ch2>y1 y1=cit.position.y+ch2
				  if(cit.position.y-ch2<y0 y0=cit.position.y-ch2
				 };
				};
				Local xm#=(x0+x1)/2
				Local ym#=(y0+y1)/2
				position.setzen(xm,ym,0)
				Local dx#=(x1-x0)/2
				Local dy#=(y1-y0)/2
				if(dx<3*tabx dx=3*tabx
				if(dy<1.5*taby dx=1.5*taby
				vector[0].setzen(dx,0,0)
				vector[1].setzen(0,dy,0)
				*/
};
void _game::enlargerectangle(){
				rectangle[0].x(rectangle[0].x()-(cardwidth/2));
				rectangle[0].y(rectangle[0].y()-(cardheight/2));
				rectangle[1].x(rectangle[1].x()+(cardwidth/2));
				rectangle[1].y(rectangle[1].y()+(cardheight/2));
				rectangletransformed[0]=rectangle[0];
				rectangletransformed[1]=rectangle[1];
};
void _game::scale(_tg f){
                _pile*pit;
                _card*cit;
				scaleglobal*=f;
				cardwidth*=f;
				cardheight*=f;
				carddistance*=f;
				cardshiftfront*=f;
				cardshiftback*=f;
				rectangletransformed[0]*=f;
				rectangletransformed[1]*=f;
				if(pilelist.anfang(pit))do{
				 pit->position*=f;
				 pit->radiusx*=f;
				 pit->radiusy*=f;
				// pit.vector*=f
				 if(pit->anfang(cit))do{
				  cit->position*=f;
				  cit->vx*=f;
				  cit->vy*=f;
				  cit->curveposition.ort(0)*=f;
				  cit->curveposition.ort(1)*=f;
				  cit->curveposition.aktualisieren();
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
				
				if(cardlist.anfang(cit))do{
				 cit->position*=f;
				 cit->vx*=f;
				 cit->vy*=f;
				 cit->curveposition.ort(0)*=f;
				 cit->curveposition.ort(1)*=f;
			     cit->curveposition.aktualisieren();
				}while(cardlist.naechstes(cit));
				//for(Local uit:_animationundo=EachIn undolist
				// uit.scale(f)
				//};
				_animation*ait;
				if(animationlist.anfang(ait))do{
				 ait->scale(f);
				}while(animationlist.naechstes(ait));
				update();
};
void _game::translate(_vektor3<_tg> d){
                _pile*pit;
                _card*cit;
				translationglobal+=d;
				rectangletransformed[0].x(rectangletransformed[0].x()+d.x());
				rectangletransformed[0].y(rectangletransformed[0].y()+d.y());
				rectangletransformed[1].x(rectangletransformed[1].x()+d.x());
				rectangletransformed[1].y(rectangletransformed[1].y()+d.y());
				if(pilelist.anfang(pit))do{
				 pit->position+=d;
				 if(pit->anfang(cit))do{
				  cit->position.add(d);
				  cit->curveposition.ort(0).add(d);
				  cit->curveposition.ort(1).add(d);
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));

				if(cardlist.anfang(cit))do{//for(Local cit:_card=EachIn cardlist
				 cit->position.add(d);
				 cit->curveposition.ort(0).add(d);
				 cit->curveposition.ort(1).add(d);
				}while(cardlist.naechstes(cit));
				//for(Local uit:_animationundo=EachIn undolist
				// uit.translate(d)
				//};
				_animation*a;
				if(animationlist.anfang(a))do{
				 a->translate(d);
				}while(animationlist.naechstes(a));
				update();
};
_tg _game::tabulatorx(){
				return(cardwidth+carddistance);
};
_tg _game::tabulatory(){
				return(cardheight+carddistance);
};
bool _game::inner(){
				_tg a;
				_tg b;
				_vektor3<_tg> vxh;
				_vektor3<_tg> vyh;
				_vektor3<_tg> mvn;
				_vektor3<_tg> e;
				vxh=vector[0];
				vyh=vector[1];
				mvn=solitaire->mousevector*-1;
				e=*(solitaire->cam)-position;
				_tg D=determinieren(vxh,vyh,mvn);
				if(fabs(D)>nahenull){
				 a=determinieren(e,vyh,mvn)/D;
				 if((a>=-1)&&(a<=1)){
				  b=determinieren(vxh,e,mvn)/D;
				  if((b>=-1)&&(b<=1)) return(true);
				 };
				};
				return(false);
};
void _game::createshadow(){
                _pile*pit;
                _card*cit;
				if(pilelist.anfang(pit))do{
				 //pit.createshadow()
				 if(pit->anfang(cit))do{
				  cit->createshadow();
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
				if(cardlist.anfang(cit))do{
				 cit->createshadow();
				}while(cardlist.naechstes(cit));
				updateshadowarray();
};
void _game::updateshadowarray(){
                _pile*pit;
                _card*cit;
				if(pilelist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  _schatteneinfach<_tg,_to>*sit;
				  for(unsigned int i=0;i<cit->shadowarraycount;i++){
				   cit->shadowarray[i]->aktualisierenarray();
				  };
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
				if(cardlist.anfang(cit))do{
				 for(unsigned int i=0;i<cit->shadowarraycount;i++){
				  cit->shadowarray[i]->aktualisierenarray();
				 };
				}while(cardlist.naechstes(cit));
};
void _game::sigmadiffuse(_tg sd){
                _card*cit;
                _polygon*pit;
                _pile*it;
				if(cardlist.anfang(cit))do{
				 if(cit->mesh->anfang(pit))do{
				  //pit->sigmadiffuse=sd;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 }while(cit->mesh->naechstes(pit));
				}while(cardlist.naechstes(cit));
				if(pilelist.anfang(it))do{
				 //if(it->mesh)       it->mesh->sigmadiffuse(sd);!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 //if(it->meshsuit)   it->meshsuit->sigmadiffuse(sd);
				 //if(it->meshnumber) it->meshnumber->sigmadiffuse(sd);
				 if(it->anfang(cit))do{
				  if(cit->mesh->anfang(pit))do{
				   //pit->sigmadiffuse=sd;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				  }while(cit->mesh->naechstes(pit));
				 }while(it->naechstes(cit));
				}while(pilelist.naechstes(it));
};		
void _game::updatetexture(){
                _pile*pit;
                _card*cit;
				if(pilelist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  _polygon*poly;
				  cit->mesh->anfang(poly);
				  poly->texturfront(solitaire->tcard[cit->suit+cit->number*4]);
			 	  poly->texturrueck(solitaire->tcardback[solitaire->cardtexturebackindex]);
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
				if(cardlist.anfang(cit))do{//for(Local cit:_card=EachIn cardlist
				 _polygon*poly;
				 cit->mesh->anfang(poly);
				 poly->texturfront(solitaire->tcard[cit->suit+cit->number*4]);
			 	 poly->texturrueck(solitaire->tcardback[solitaire->cardtexturebackindex]);
				}while(cardlist.naechstes(cit));
};
void _game::updatenaturality(){
				_tg sn=solitaire->naturalpiles*0.2;
                _pile*pit;
                _card*cit;
				if(pilelist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  cit->rotationmust=zufall<_tg>(-solitaire->naturalpiles*5,solitaire->naturalpiles*5);
				  cit->shiftmust.setzen(zufall<_tg>(-sn,+sn),zufall<_tg>(-sn,+sn));
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
				if(cardlist.anfang(cit))do{//for(Local cit:_card=EachIn cardlist
				 cit->rotationmust=zufall<_tg>(-solitaire->naturalpiles*5,solitaire->naturalpiles*5);
				 cit->shiftmust.setzen(zufall<_tg>(-sn,+sn),zufall<_tg>(-sn,+sn));
				}while(cardlist.naechstes(cit));
};
bool _game::tipp(){
				return(false);
};
bool _game::autoplay(){
				return(false);
};
bool _game::automove(){
				return(false);
};
bool _game::clickplay(_card*card){
				return(false);
};
_animationundo* _game::createundo(_tg spd,_tg intv,bool reverseiteration){
				//achtung alles löschen was nach dem aktuellen iterator kommt
				if(undoiterator){
				 while(undolist.letztes()!=undoiterator){
				  _animationundo*a=undolist.letztes();
				  deletesecure(a);
				 };
				}else{
				 undolist.loeschen();
				};
				_animationundo*u=new _animationundo(this,spd,intv,reverseiteration);
				u->deinsertgame();//animation deinsert
				undoiterator=u;
				if(statsclosed==false) moves+=1;
				return(u);
};
void _game::undo(){
				if(cardcurving()==false){
				 if(undoiterator){
				  playundo(false);
				  if(statsclosed==false) undos+=1;
				  undoiterator=undoiterator->_listenknotenbasis<_animationundo>::vorheriges();//achtung wird 0
				  if(undoiterator==undolist.letztes()) undoiterator=0;
				 };
				};
};
void _game::redo(){
				if(cardcurving()==false){
				 if(undoiterator==0){
				  undoiterator=undolist.erstes();
		          playundo(true);
				 }else{
				  if(undoiterator->_listenknotenbasis<_animationundo>::naechstes()!=undolist.erstes()){
			 	   undoiterator=undoiterator->_listenknotenbasis<_animationundo>::naechstes();
			       playundo(true);
			      };
			     };
				};
};
void _game::playundo(bool forward){
				if(undoiterator){
				 _animationundo*undo=undoiterator;
				 undo->forward=forward;
				 undo->insertgame();
				 undo->started=false;
				 undo->start();
				 automoveundodelay=true;
				 automoveundostart=solitaire->clock->system();
				};
};
bool _game::cardcurving(){
                _pile*pit;
                _card*cit;
				if(pilelist.anfang(pit))do{
				 if(pit->anfang(cit))do{
				  if(cit->curving) return(true);
				 }while(pit->naechstes(cit));
				}while(pilelist.naechstes(pit));
				//check the complete movelist for(cards that are in move
				//for(Local uit:_animationundo=EachIn undolist
				// for(Local eit:_animationundoentry=EachIn uit.list
				//  if(eit.card.curving return(true)
				// };
				//};
				return(false);
};
bool _game::activeanimationbutundo(){//returns true, if(an not-undo-animation is active
				bool ja=true;
				if(animationlist.erstes()==0 ){
				 ja=false;
				}else{
				 _animationundo*a=dynamic_cast<_animationundo*>(animationlist.erstes());
				 if(a) ja=false;
				};
				return(ja);
};
bool _game::activepreparation(){//returns true, if(an not-undo-animation is active
				if(animationlist.erstes()==0){
				 return(false);
				}else{
				 _animation*a;
				 if(animationlist.anfang(a)) if(a->preparative) return(true);
				};
				return(false);
};
//--------------------------------------- GENERAL TIPPS -----------------------------------------------------				
bool _game::tipptableaucompleterowpile(_piletableau*ps){
				_card*cit;
				bool cp=false;
				if(ps->anfang(cit)) for(int i=0;i<12;i++) if(cit) if(ps->naechstes(cit)==false) cit=0;
				if(cit){
				 _card*c=cit;
				 if(c->number!=12) return(false);
				 _card*iit=cit;
				 for(int i=12;i>=0;i--){
				  if(i!=iit->number) return(false);
				  iit=iit->vorheriges();
				 };
				
				 
				 if(c->canpick()){
				  cp=true;
				  foundlist.aushaengen();
				  _card*iit=c;
				  do{
				   foundlist.einhaengen(iit);
				  }while(ps->vorheriges(iit));
				 };
				};
				return(cp);
};
_pilediscard*_game::getpilediscardminimum(){
				_pilediscard*r=0;
				_pilediscard*p=0;
				unsigned int c=0;
				if(pilediscardlist.anfang(p))do{
				 if(r==0) if(p->anzahl()==c) r=p;
				}while(pilediscardlist.naechstes(p));
				if(r==0){
				 if(pilediscardlist.anfang(p))do{
				  if(r==0) r=p;
				 }while(pilediscardlist.naechstes(p));
				};
				return(r);
};
bool _game::tipptableaucompleterow(){
				if(pilediscardlist.erstes()){
				 foundlist.aushaengen();
				 _piletableau*ps=0;
				 _piletableau*pit;
				 if(piletableaulist.anfang(pit))do{
				  if(tipptableaucompleterowpile(pit)) ps=pit;
				 }while(piletableaulist.naechstes(pit));
				 if(ps){
				  foundsour=ps;
				  founddest=getpilediscardminimum();
				  return(true);
				 }else{ 
			 	  return(false);
				 };
				};
				return(false);
};
void _game::tippexecutecompleterow(){						
				_tg i=0;//foundlist.count()
				if(pilediscardlist.erstes()){
				 _listenknoten<_card>*card;
				 if(foundlist.anfang(card))do{
				  _card*cn=new _card(card->objekt());
				  _vektor3<_tg> vn;
				  _vektor3<_tg> t0;
				  _vektor3<_tg> t1;
				  _vektor3<_tg> t;
				  t0.setzen(0,0,-20-i*2);
				  t1.setzen(0,0,0);
				  t.setzen(0,0,-solitaire->cardthickness);
				  t*=i;
				  _pilediscard*pd=getpilediscardminimum();
				  t+=pd->dropposition();
				  cn->curveposition.setzen(cn->position,t,t0,t1);
				  cn->curvevx.setzen(cn->vx,pd->dropvx(),vn,vn);
				  cn->curvevy.setzen(cn->vy,pd->dropvy(),vn,vn);
				  cn->curvespeed=40;
				  cn->startcurve();
				  tipplist.einhaengen(cn);
				  cn->cardcontrolopacity=card->objekt();
				  cn->curveopacity.setzen(0,0,2,-10);
				  i+=1;
				 }while(foundlist.naechstes(card));
				};
};
bool _game::tipptableauturn(){
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 _card*c;
				 if(pit->anfang(c)){
				  if(c->turnedup()==false){
				   foundlist.aushaengen();
				   foundlist.einhaengen(c);
				   founddest=c->pile;
				   foundsour=c->pile;
				  };
				 };
				}while(piletableaulist.naechstes(pit));
				if(founddest) return(true); else return(false);
};		
void _game::tippexecuteturn(){
                _listenknoten<_card>*card;
				if(foundlist.anfang(card))do{
				 _card*cn=new _card(card->objekt());
				 _vektor3<_tg> v=card->objekt()->pile->dropposition();
				 cn->curvespeed=solitaire->autospeed/2;
				 cn->curveposition.setzen(cn->position,v.x(),v.y(),v.z()-1, 0,0,-10,0,0,10);
			 	 cn->curvevx.setzen(cn->vx,-cn->vx, 0,0,10 ,0,0,-10);
			 	 cn->curvevy.setzen(cn->vy, cn->vy.x(),cn->vy.y(),cn->vy.z()-solitaire->cardslope, 0,0,0 ,0,0,0);
				 tipplist.einhaengen(cn);
				 cn->cardcontrolopacity=card->objekt();
				 cn->curveopacity.setzen(0,0,2,-10);
				 cn->startcurve();
				}while(foundlist.naechstes(card));
};
bool _game::tipptableauemptypile(){
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 if((pit->erstes()==0)&&(founddest==0)) founddest=pit;
				}while(piletableaulist.naechstes(pit));
				if(founddest){
				 if(piletableaulist.anfang(pit))do{
				  if((foundsour==0)&&(pit!=foundsour)){
				   _card*c=pit->letztes();
				   if(c){
				    if(c->turnedup()==false){
				     bool stop=false;
				     do{
				      if(c->turnedup()){
				       stop=true; 
				      }else if(pit->vorheriges(c)==false) {
				       stop=true;
				       c=0;
				      };
				     }while(stop==false);
				     if(c){
				      //es gibt eine karte, die 
				      //nach einer verdeckten Karte nun umgedreht ist
					  if(c->canpick()){
					   foundlist.aushaengen();
				       _card*iit=c;
				       do{
				        foundlist.einhaengen(iit);
				       }while(c->pile->vorheriges(iit));
					   if(founddest->candrop(&foundlist)){
					    foundsour=pit;
					    return(true);
					   };
					  };
				 	 };
					};
				   };
				  };
				 }while(piletableaulist.naechstes(pit));
				};
				return(false);
};						
void _game::tippinitcombination(unsigned int iteratorpack){
				if(iteratorpack==0){
				 if(tippsourpileiterator==0){
				  tippsourpileiterator=piletableaulist.erstes();
				  tippsourcarditerator=tippsourpileiterator->letztes();//achtung kann 0 bleiben
				  tippdestpileiterator=piletableaulist.erstes();
				 };
				}else if(iteratorpack==1){
				 if(autoplaysourpileiterator==0){
				  autoplaysourpileiterator=piletableaulist.erstes();
				  autoplaysourcarditerator=autoplaysourpileiterator->letztes();//achtung kann 0 bleiben
				  autoplaydestpileiterator=piletableaulist.erstes();
				 };
				}else if(iteratorpack==2){
				 if(automovesourpileiterator==0){
				  automovesourpileiterator=piletableaulist.erstes();
				  automovesourcarditerator=automovesourpileiterator->letztes();//achtung kann 0 bleiben
				  automovedestpileiterator=piletableaulist.erstes();
				 };
				}else if(iteratorpack==3){
				 if(clickplaysourpileiterator==0){
				  clickplaysourpileiterator=piletableaulist.erstes();
				  clickplaysourcarditerator=clickplaysourpileiterator->letztes();//achtung kann 0 bleiben
				  clickplaydestpileiterator=piletableaulist.erstes();
				 };
				};
};
void _game::tippresetcombination(unsigned int iteratorpack){
				if(iteratorpack==0) tippsourpileiterator=0;
				if(iteratorpack==1) autoplaysourpileiterator=0;
				if(iteratorpack==2) automovesourpileiterator=0;
				if(iteratorpack==3) clickplaysourpileiterator=0;
				tippinitcombination(iteratorpack);
};
void _game::tippiteratecombinationcardwise(unsigned int iteratorpack){
				if(iteratorpack==0){
				 if(tippsourcarditerator) if(tippsourcarditerator->liste()->vorheriges(tippsourcarditerator)==false){
				  tippsourpileiterator=tippsourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				  tippsourcarditerator=tippsourpileiterator->letztes();
				 };
				}else if(iteratorpack==1){
				 if(autoplaysourcarditerator) if(autoplaysourcarditerator->liste()->vorheriges(autoplaysourcarditerator)==false){
				  autoplaysourpileiterator=autoplaysourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				  autoplaysourcarditerator=autoplaysourpileiterator->letztes();
				 };
				}else if(iteratorpack==2){
				 if(automovesourcarditerator) if(automovesourcarditerator->liste()->vorheriges(automovesourcarditerator)==false){
				  automovesourpileiterator=automovesourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				  automovesourcarditerator=automovesourpileiterator->letztes();
				 };
				}else if(iteratorpack==3){
				 if(clickplaysourcarditerator) if(clickplaysourcarditerator->liste()->vorheriges(clickplaysourcarditerator)==false){
				  clickplaysourpileiterator=clickplaysourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				  clickplaysourcarditerator=clickplaysourpileiterator->letztes();
				 };
				};
};
void _game::tippiteratecombinationpilewise(unsigned int iteratorpack){
				if(iteratorpack==0){
				 if(tippdestpileiterator==0) tippdestpileiterator=piletableaulist.erstes();
				 tippsourpileiterator=tippsourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				 tippsourcarditerator=tippsourpileiterator->letztes();
				}else if(iteratorpack==1){
				 if(autoplaydestpileiterator==0) autoplaydestpileiterator=piletableaulist.erstes();
			     autoplaysourpileiterator=autoplaysourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				 autoplaysourcarditerator=autoplaysourpileiterator->letztes();
				}else if(iteratorpack==2){
				 if(automovedestpileiterator==0) automovedestpileiterator=piletableaulist.erstes();
				 automovesourpileiterator=automovesourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				 automovesourcarditerator=automovesourpileiterator->letztes();
				}else if(iteratorpack==3){
				 if(clickplaydestpileiterator==0) clickplaydestpileiterator=piletableaulist.erstes();
				 clickplaysourpileiterator=clickplaysourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				 clickplaysourcarditerator=clickplaysourpileiterator->letztes();
				};
};
void _game::tippiteratecombination(unsigned int iteratorpack){			
				if(iteratorpack==0){
				 if(tippdestpileiterator->_listenknotenbasis<_piletableau>::liste()->naechstes(tippdestpileiterator)==false){
				  if(tippsourcarditerator) if(tippsourcarditerator->liste()->vorheriges(tippsourcarditerator)==false){
				   tippsourpileiterator=tippsourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				   tippsourcarditerator=tippsourpileiterator->letztes();
				  };
				 };
				}else if(iteratorpack==1){
				 if(autoplaydestpileiterator->_listenknotenbasis<_piletableau>::liste()->naechstes(autoplaydestpileiterator)==false){
				  if(autoplaysourcarditerator) if(autoplaysourcarditerator->liste()->vorheriges(autoplaysourcarditerator)==false){
				   autoplaysourpileiterator=autoplaysourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				   autoplaysourcarditerator=autoplaysourpileiterator->letztes();
				  };
				 };
				}else if(iteratorpack==2){
				 if(automovedestpileiterator->_listenknotenbasis<_piletableau>::liste()->naechstes(automovedestpileiterator)==false){
				  if(automovesourcarditerator) if(automovesourcarditerator->liste()->vorheriges(automovesourcarditerator)==false){
				   automovesourpileiterator=automovesourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				   automovesourcarditerator=automovesourpileiterator->letztes();
				  };
				 };
				}else if(iteratorpack==3){
				 if(clickplaydestpileiterator->_listenknotenbasis<_piletableau>::liste()->naechstes(clickplaydestpileiterator)==false){
				  if(clickplaysourcarditerator) if(clickplaysourcarditerator->liste()->vorheriges(clickplaysourcarditerator)==false){
				   clickplaysourpileiterator=clickplaysourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				   clickplaysourcarditerator=clickplaysourpileiterator->letztes();
				  };
				 };
				};
};
bool _game::tippendedcombinationpilewise(unsigned int iteratorpack,_pile*sourstart){
				if(iteratorpack==0){
				 if(tippsourpileiterator==sourstart) return(true); else return(false);
				}else if(iteratorpack==1){
				 if(autoplaysourpileiterator==sourstart) return(true); else return(false);
				}else if(iteratorpack==2){
				 if(automovesourpileiterator==sourstart) return(true); else return(false);
				}else if(iteratorpack==3){
				 if(clickplaysourpileiterator==sourstart) return(true); else return(false);
				};
				return(true);
};
bool _game::tippendedcombinationcardwise(unsigned int iteratorpack,_pile*sourstart,_card*cardstart){
				if(iteratorpack==0){
				 if((tippsourpileiterator==sourstart)&&(tippsourcarditerator==cardstart)) return(true); else return(false);
				}else if(iteratorpack==1){
				 if((autoplaysourpileiterator==sourstart)&&(autoplaysourcarditerator==cardstart)) return(true); else return(false);
				}else if(iteratorpack==2){
				 if((automovesourpileiterator==sourstart)&&(automovesourcarditerator==cardstart)) return(true); else return(false);
				}else if(iteratorpack==3){
				 if((clickplaysourpileiterator==sourstart)&&(clickplaysourcarditerator==cardstart)) return(true); else return(false);
				};
				return(true);
};
bool _game::tippendedcombination(unsigned int iteratorpack,_pile*sourstart,_card*cardstart,_pile*deststart){
				if(iteratorpack==0){
				 if((tippsourpileiterator==sourstart)&&(tippsourcarditerator==cardstart)&&(tippdestpileiterator==deststart)) return(true); else return(false);
				}else if(iteratorpack==1){
				 if((autoplaysourpileiterator==sourstart)&&(autoplaysourcarditerator==cardstart)&&(autoplaydestpileiterator==deststart)) return(true); else return(false);
				}else if(iteratorpack==2){
				 if((automovesourpileiterator==sourstart)&&(automovesourcarditerator==cardstart)&&(automovedestpileiterator==deststart)) return(true); else return(false);
				}else if(iteratorpack==3){
				 if((clickplaysourpileiterator==sourstart)&&(clickplaysourcarditerator==cardstart)&&(clickplaydestpileiterator==deststart)) return(true); else return(false);
				};
				return(true);
};
bool _game::tippcanmove(unsigned int iteratorpack,bool samesuit,bool rowgrow,bool noempty){
				_card*sourcard=0;
				_pile*sourpile=0;
				_pile*destpile=0;
				if(iteratorpack==0){
				 if(tippsourcarditerator) sourcard=tippsourcarditerator;
				 sourpile=tippsourpileiterator;
				 destpile=tippdestpileiterator;
				}else if(iteratorpack==1){
				 if(autoplaysourcarditerator) sourcard=autoplaysourcarditerator;
				 sourpile=autoplaysourpileiterator;
				 destpile=autoplaydestpileiterator;
				}else if(iteratorpack==2){
				 if(automovesourcarditerator) sourcard=automovesourcarditerator;
				 sourpile=automovesourpileiterator;
				 destpile=automovedestpileiterator;
				}else if(iteratorpack==3){
				 if(clickplaysourcarditerator) sourcard=clickplaysourcarditerator;
				 sourpile=clickplaysourpileiterator;
				 destpile=clickplaydestpileiterator;
				};
				
				_liste<_card> ft;
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				if((destpile!=sourpile)&&(sourcard)){
				 if(sourcard->canpick()){//achtung gilt nicht für umgedrehte Karten turnedup()=false
				  ft.aushaengen();
				  _card*iit=sourcard;
				  do{
				   ft.einhaengen(iit);
				   iit=iit->vorheriges();
				  }while(iit->liste()->vorheriges(iit));
				  if(destpile->candrop(&ft,samesuit)){
				   //nun die längenprüfung
				   bool listen=false;
				   unsigned int ls=sourpile->pickrowlengthfromfirst();
				   unsigned int ld=destpile->pickrowlengthfromfirst();
				   if(rowgrow){				
 				    if(destpile->anzahl()==0){//leeres Feld
				     if((ft.anzahl()==ls)&&(ft.anzahl()<sourpile->anzahl())) listen=true;
				    }else{ 
				 	 if((ft.anzahl()+ld)>ls) listen=true;
				     //spezielle cruel pile move restriction -----------
				     _pilecruel*pc=dynamic_cast<_pilecruel*>(sourpile);
				     if(pc)if(pc->nextcardinsequence(ft.erstes()->objekt())) listen=false;
					 //--------------------------------------------------
				    };
				   }else{
				    listen=true;
				    if((ft.anzahl()+ld)<=ls) listen=false;
				   };
				   if(noempty){
				    if(destpile->anzahl()==0) listen=false;
				   };
				   if(listen){
				    founddest=destpile;
				    foundsour=sourpile;
				    foundlist.aushaengen();
				    _listenknoten<_card>*cit;
				    if(ft.anfang(cit))do{//for(Local cit:_card=EachIn ft
				     foundlist.einhaengen(cit->objekt());
				    }while(ft.naechstes(cit));
				    return(true);
				   };
  			 	  };
				 };
				};
				return(false);
};				
bool _game::tipptableau(unsigned int iteratorpack,bool samesuit,bool rowgrow,bool noempty){
				bool found=false;
				tippinitcombination(iteratorpack);
			    _pile*deststart=0;
				_pile*sourstart=0;
				_card*cardstart=0;
				if(iteratorpack==0){
				 deststart=tippdestpileiterator;
				 sourstart=tippsourpileiterator;
				 cardstart=tippsourcarditerator;
				}else if(iteratorpack==1){
				 deststart=autoplaydestpileiterator;
				 sourstart=autoplaysourpileiterator;
				 cardstart=autoplaysourcarditerator;
				}else if(iteratorpack==2){
				 deststart=automovedestpileiterator;
				 sourstart=automovesourpileiterator;
				 cardstart=automovesourcarditerator;
				}else if(iteratorpack==3){
				 deststart=clickplaydestpileiterator;
				 sourstart=clickplaysourpileiterator;
				 cardstart=clickplaysourcarditerator;
				};
				do{
				 if(tippcanmove(iteratorpack,samesuit,rowgrow,noempty)) found=true;
				 tippiteratecombination(iteratorpack);
			 	}while((tippendedcombination(iteratorpack,sourstart,cardstart,deststart)==false)&&(found==false));
				return(found);
};	
void _game::tippexecutemove(){			
				_tg i=0;
				_listenknoten<_card>*card;
				if(foundlist.anfang(card))do{//for(Local card:_card=EachIn foundlist
				 _card*cn=new _card(card->objekt());
				 _vektor3<_tg> vn;
				 _vektor3<_tg> t0(0,0,-20);
				 _vektor3<_tg> t1(0,0,+20);
				 tipplist.einhaengen(cn);
				 _vektor3<_tg> off(0,-cardshiftfront,-solitaire->cardthickness);
				 off*=i;
				 off+=founddest->dropposition();
				 cn->curveposition.setzen(cn->position,off,t0,t1);
				 cn->curvevx.setzen(cn->vx,founddest->dropvx(),vn,vn);
				 cn->curvevy.setzen(cn->vy,founddest->dropvy(),vn,vn);
				 cn->curvespeed=solitaire->tippspeed;
				 cn->startcurve();
				 cn->cardcontrolopacity=card->objekt();
				 cn->curveopacity.setzen(0,0,2,-5);//vorher -10 statt -5
				 i+=1;
				}while(foundlist.naechstes(card));
};
bool _game::tippwaste(){
				foundlist.aushaengen();
				foundsour=0;
				if(pilewastelist.erstes()==0) return(false);
				_pilewaste*pwit=0;
				bool found=false;
				if(tippwastepile>(int(pilewastelist.anzahl())-1)) tippwastepile=0;
				unsigned int startpile=tippwastepile;
				do{  
				 pwit=pilewaste(tippwastepile);
				 if(pwit->erstes()){
				  foundlist.aushaengen();
				  foundlist.einhaengen(pwit->erstes());
				  _piletableau*ptit;
				  if(piletableaulist.anfang(ptit))do{
				   if((found==false)&&(ptit->candrop(&foundlist))){
				    found=true;
				    foundsour=pwit;
				    founddest=ptit;
				   };
				  }while(piletableaulist.naechstes(ptit));
				 };
				 tippwastepile+=1;
				 if(tippwastepile>(int(pilewastelist.anzahl())-1)) tippwastepile=0;
				}while((found==false)&&(tippwastepile!=startpile));
				return(found);
};	
bool _game::tippstock(){
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				if(pilestocklist.erstes()==0) return(false);
				_pilestock*psit=0;
				bool found=false;
				if(tippstockpile>(int(pilestocklist.anzahl())-1)) tippstockpile=0;
				unsigned int startpile=tippstockpile;
				do{
				 psit=pilestock(tippstockpile);
				
				
				 if(psit->tolabyrinthcount){
				  if(psit->anzahl()>0){
				   _card*fit=psit->erstes();
				   _pilelabyrinth*pl=pilelabyrinth(0);
				   if((pl)&&(pl->hasfreeline())){
				    foundsour=psit;
				    founddest=pl;
				    for(int j=0;j<pl->dimx;j++){
				     if(fit){
				      foundlist.einhaengen(fit);
				      if(psit->naechstes(fit)==false) fit=0;
				     };
				    };
				   };
				  };
				 };
				
				 if(psit->candeal()){
				  if(psit->anzahl()>0){
				   _card*fit=psit->erstes();
				   for(unsigned int i=0;i<piletableaulist.anzahl();i++){
				    for( int j=0;j<psit->topilecount;j++){
				     if(fit){
				      foundlist.einhaengen(fit);
				      if(psit->naechstes(fit)==false) fit=0;
				     };
				    };
				   }; 
				   for( int i=0;i<psit->towastecount;i++){
				    if(fit){
				     foundlist.einhaengen(fit);
				     if(psit->naechstes(fit)==false) fit=0;
				    };
				   };
				   _pilefoundation*pfit;				   
				   if(pilefoundationlist.anfang(pfit))do{
				    for( int c=0;c<psit->tofoundationcount;c++){
				     if(fit){
				      foundlist.einhaengen(fit);
				      if(psit->naechstes(fit)==false) fit=0;
				     };      
				    };
		 		   }while(pilefoundationlist.naechstes(pfit));
				   if(foundlist.erstes()){
				    foundsour=psit;
				    found=true;
				   };
				  };
			 	 };
				 if((psit->erstes()==0)&&(psit->waste())&&(psit->towastecount>0)){// redeal
				  if((psit->canredeal())&&(psit->cardcountinwaste()>0)){
				   foundlist.aushaengen();
				   if(psit->wasteiteration==false){
				    _card*it;
				    if(psit->waste()->anfang(it))do{
				     foundlist.einhaengen(it);
				    }while(psit->waste()->naechstes(it));
				   }else{
				    _pilewaste*pwit;
				    if(pilewastelist.anfang(pwit))do{
				     _card*it;
				     if(pwit->anfang(it))do{
				      foundlist.einhaengen(it);
				     }while(pwit->naechstes(it));
				    }while(pilewastelist.naechstes(pwit));
				   };
				   foundsour=psit;
				   found=true;
				  };
				 };
				 tippstockpile+=1;
				 if(tippstockpile>(pilestocklist.anzahl()-1)) tippstockpile=0;
				}while((found==false)&&(tippstockpile!=startpile));
				return(found);
};
bool _game::tippstockpyramid(){
				foundlist.aushaengen();
				if(pilestocklist.erstes()==0) return(false);
				_pilestock*psit=0;
				bool found=false;
				if(tippstockpile>(pilestocklist.anzahl()-1)) tippstockpile=0;
				unsigned int startpile=tippstockpile;
				do{
				 psit=pilestock(tippstockpile);
				 if((psit->candeal())&&(psit->cardcountinwaste()>0)){
				  if(psit->anzahl()>0){
			       foundlist.einhaengen(psit->erstes());
				   foundsour=psit;
			       found=true;//dealen
				  }else{
				   if(psit->waste()){
				    if(psit->canredeal()){
				     foundsour=psit;
				     found=true;//backsort
				    };
				   };
				  };
				 };
				 tippstockpile+=1;
				 if(tippstockpile>(int(pilestocklist.anzahl())-1)) tippstockpile=0;
				}while((found==false)&&(tippstockpile!=startpile));
				return(found);
};
void _game::tippexecutestock(){
                _card*cn;
	            _listenknoten<_card>*card;
	            _listenknoten<_card>*fit;
	            
	            _piletableau*pt;
	            _pilefoundation*pf;
	            _pilelabyrinth*pl;
	            _pilewaste*pw;
	            _pilestock*ps=dynamic_cast<_pilestock*>(foundsour);
			    fit=foundlist.erstes();
			    
				if(ps->tolabyrinthcount){
				 pl=dynamic_cast<_pilelabyrinth*>(founddest);//pilelabyrinth(0)
				 if((pl)&&(pl->hasfreeline())){
				  int free=pl->freeline();
				  for( int j=0;j<pl->dimx;j++){
				   if(fit){
				    card=fit;
				    cn=new _card(card->objekt());
				    _vektor3<_tg> v=pl->droppositionat(j,free);
				    tipplist.einhaengen(cn);
				    cn->curvespeed=solitaire->tippspeed;
				    cn->curveposition.setzen(cn->position,v,0,0,-20,0,0,20);
				    cn->curvevx.setzen(cn->vx,-cn->vx,0,0,-10,0,0,10);
				    cn->curvevy.setzen(cn->vy, cn->vy.x(),cn->vy.y(),cn->vy.z()-solitaire->cardslope,0,0,0,0,0,0);
				    cn->startcurve();
				    cn->cardcontrolopacity=card->objekt();
				    cn->curveopacity.setzen(0,0,2,-10);
				    if(foundlist.naechstes(fit)==false) fit=0;
				   };
				  };
				 };
				};
								
				if(ps->topilecount>0){
			 	 if(piletableaulist.anfang(pt))do{
				  for( int c=0;c<ps->topilecount;c++){
				   if(fit){
				    card=fit;
				    cn=new _card(card->objekt());
    			    _vektor3<_tg> v=pt->dropposition();
				    tipplist.einhaengen(cn);
				    cn->curvespeed=solitaire->tippspeed;
				    cn->curveposition.setzen(cn->position,v,0,0,-20,0,0,20);
				    cn->curvevx.setzen(cn->vx,-cn->vx, 0,0,-10,0,0,10);
				    cn->curvevy.setzen(cn->vy, cn->vy.x(),cn->vy.y(),cn->vy.z()-solitaire->cardslope, 0,0,0,0,0,0);
				    cn->startcurve();
				    cn->cardcontrolopacity=card->objekt();
				    cn->curveopacity.setzen(0,0,2,-10);
				    if(foundlist.naechstes(fit)==false) fit=0;
				   };
				  };
		 		 }while(piletableaulist.naechstes(pt));
				};
				
				if(ps->towastecount){
				 if(foundsour->anzahl()>0){
				  pw=ps->waste();
				  if(pw){
				   unsigned int wpit=ps->wastepartner;
				   _card*fii=foundsour->erstes();
				   for( int cw=0;cw<ps->towastecount;cw++){
				    if(fii){
				     cn=new _card(fii);
				     tipplist.einhaengen(cn);
				     _vektor3<_tg> v=pw->dropposition();
				     cn->curvespeed=solitaire->tippspeed*0.5;
				     cn->curveposition.ort(0)=cn->position;
					 cn->curveposition.ort(1)=v;
					 cn->curveposition.vektor(0).setzen(-_tg(cw)*7,0,-10);
					 cn->curveposition.vektor(1).setzen(0,0,10);
					 cn->curveposition.aktualisieren();
				     if(ps->open) cn->curvevx.setzen(cn->vx,cn->vx,0,0,-10,0,0,10); else cn->curvevx.setzen(cn->vx,-cn->vx,0,0,-10,0,0,10);
				     cn->curvevy.setzen(cn->vy,cn->vy,0,0,-10,0,0,0);
				     cn->startcurve();
				     cn->cardcontrolopacity=fii;
				     cn->curveopacity.setzen(0,0,2,-10);
					 if(ps->wasteiteration){
					  wpit+=1;
					  if(wpit>(pilewastelist.anzahl()-1)) wpit=0;
					  pw=pilewaste(wpit);
					 };
				     if(foundsour->naechstes(fii)==false) fii=0;
				    };
		 		   };
		          };
				 }else{ 
				  if(ps->canredeal()){
				   _tg fs=0;
				   if(foundlist.anfang(card))do{
				    cn=new _card(card->objekt());
				    tipplist.einhaengen(cn);
				    cn->cardcontrolopacity=card->objekt();
				    cn->curveopacity.setzen(0,0,2,-10);
				    _vektor3<_tg> v=foundsour->dropposition();
				    cn->curvespeed=solitaire->tippspeed*3*(_tg(0.5)/(1+(fs*0.1)));
				    cn->curveposition.setzen(cn->position,v,0,0,-10-fs,0,0,10+fs);
				    if(ps->open) cn->curvevx.setzen(cn->vx,cn->vx,0,0,-10,0,0,10); else cn->curvevx.setzen(cn->vx,-cn->vx, 0,0,-10,0,0,10);
				    cn->curvevy.setzen(cn->vy,cn->vy,0,0,-10,0,0,0);
				    cn->startcurve();
				    fs+=1;
				   }while(foundlist.naechstes(card));
				  };
				 };
				};
				
				if(ps->tofoundationcount>0){
				 if(pilefoundationlist.anfang(pf))do{
				  for( int c=0;c<dynamic_cast<_pilestock*>(foundsour)->tofoundationcount;c++){
				   if(fit){
				    card=fit;
				    cn=new _card(card->objekt());
				    tipplist.einhaengen(cn);
				    cn->cardcontrolopacity=card->objekt();
				    cn->curveopacity.setzen(0,0,2,-10);
				    _vektor3<_tg> v=pf->dropposition();
				    cn->curvespeed=solitaire->tippspeed;
				    cn->curveposition.setzen(cn->position,v,0,0,-20,0,0,20);
				    cn->curvevx.setzen(cn->vx,-cn->vx,0,0,-10,0,0,10);
				    cn->curvevy.setzen(cn->vy,cn->vy,0,0,0,0,0,0);
				    cn->startcurve();
				    if(foundlist.naechstes(fit)==false) fit=0;
				   };
				  };
		 		 }while(pilefoundationlist.naechstes(pf));
				};
};
bool _game::tippredeal(){
				foundlist.aushaengen();
				foundsour=0;
				if(pileredeallist.erstes()==0) return(false);
				_pileredeal*psit=0;
				bool found=false;
				if(tippredealpile>(int(pileredeallist.anzahl())-1)) tippredealpile=0;
				unsigned int startpile=tippredealpile;
				do{ 
				 psit=pileredeal(tippredealpile);
				 if(psit->canredeal()){
				  foundsour=psit;
			      found=true;
				 };
				 tippredealpile+=1;
				 if(tippredealpile>(int(pileredeallist.anzahl())-1)) tippredealpile=0;
				}while((found==false)&&(tippredealpile!=startpile));
				return(found);
};
void _game::tippexecuteredeal(){
	 			if(foundsour){
				 _vektor3<_tg> v=foundsour->dropposition();
				 _piletableau*pit;
				 _card*cs;
				 if(piletableaulist.anfang(pit))do{
				  if(pit->anfang(cs))do{
				   _card*cn=new _card(cs);
				   tipplist.einhaengen(cn);
				   cn->curvespeed=solitaire->tippspeed;
				   cn->cardcontrolopacity=cs;
				   cn->curveopacity.setzen(0,0,2,-10);
				   cn->curveposition.setzen(cn->position,v,0,0,-15,0,0,15);
				   cn->curvevx.setzen(cn->vx,-cn->vx,0,0,-10,0,0,0);
				   cn->curvevy.setzen(cn->vy, cn->vy,0,0,-10,0,0,10);
				   cn->startcurve();
				  }while(pit->naechstes(cs));
			 	 }while(piletableaulist.naechstes(pit));
				};
};		
bool _game::tippfoundationcanmove(unsigned int iteratorpack){
				_card*sourcard=0;
				_pile*sourpile=0;
				if(iteratorpack==0){
				 sourpile=tippsourpileiterator;
				 if(tippsourcarditerator) sourcard=tippsourcarditerator;
				}else if(iteratorpack==1){
				 sourpile=autoplaysourpileiterator;
				 if(autoplaysourcarditerator) sourcard=autoplaysourcarditerator;
				}else if(iteratorpack==2){
				 sourpile=automovesourpileiterator;
				 if(automovesourcarditerator) sourcard=automovesourcarditerator;
				}else if(iteratorpack==3){
				 sourpile=clickplaysourpileiterator;
				 if(clickplaysourcarditerator) sourcard=clickplaysourcarditerator;
				};
				if(sourcard==0) return(false);
				_pilefoundation*destpile;
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				if(sourpile->erstes()==0) return(false);
				if((sourcard->canpick()==false)||(sourcard->turnedup()==false)) return(false);
				if(sourpile->erstes()!=sourcard) return(false);
				foundlist.aushaengen();
				foundlist.einhaengen(sourcard);
				if(pilefoundationlist.anfang(destpile))do{
				 if(founddest==0) if(destpile->candrop(&foundlist)) founddest=destpile;
				}while(pilefoundationlist.naechstes(destpile));
				if(founddest){
				 foundsour=sourpile;
				 return(true);		 
				};
				return(false);				
};
bool _game::tippfoundation(unsigned int iteratorpack){
				bool found=false;//-----------------probiere tableau---------------------------------
				tippinitcombination(iteratorpack);
				_pile*deststart=0;
				_pile*sourstart=0;
				_card*cardstart=0;
				if(iteratorpack==0){
				 deststart=tippdestpileiterator;
				 sourstart=tippsourpileiterator;
				 cardstart=tippsourcarditerator;
				}else if(iteratorpack==1){
				 deststart=autoplaydestpileiterator;
				 sourstart=autoplaysourpileiterator;
				 cardstart=autoplaysourcarditerator;
				}else if(iteratorpack==2){
				 deststart=automovedestpileiterator;
				 sourstart=automovesourpileiterator;
				 cardstart=automovesourcarditerator;
				}else if(iteratorpack==3){
				 deststart=clickplaydestpileiterator;
				 sourstart=clickplaysourpileiterator;
				 cardstart=clickplaysourcarditerator;
				};
				do{ 
				 if(tippfoundationcanmove(iteratorpack)) found=true;
				 tippiteratecombinationcardwise(iteratorpack);
			 	}while((tippendedcombinationcardwise(iteratorpack,sourstart,cardstart)==false)&&(found==false));
			    if(found==false){//---------------------probiere waste pile-----------------------------
			     if(pilewastelist.erstes()){
				  foundlist.aushaengen();
				  foundsour=0;
				  founddest=0;
				  if(tippwastepile>(int(pilewastelist.anzahl())-1)) tippwastepile=0; 
				  unsigned int startpile=tippwastepile;
				  _pilewaste*pwit=0;
				  do{
				   pwit=pilewaste(tippwastepile);			   
				   _card*sourcard=pwit->erstes();
			       if(sourcard){
				    if(sourcard->canpick()){
				 	 foundlist.aushaengen();
			 		 foundlist.einhaengen(sourcard);
			 		 _pilefoundation*destpile;
					 if(pilefoundationlist.anfang(destpile))do{
					  if(founddest==0) if(destpile->candrop(&foundlist)) founddest=destpile;
					 }while(pilefoundationlist.naechstes(destpile));
					 if(founddest){
					  foundsour=pwit;
					  found=true;
				 	 };
				    };
				   };
				   tippwastepile+=1;
				   if(tippwastepile>(int(pilewastelist.anzahl())-1)) tippwastepile=0;
				  }while((found==false)&&(tippwastepile!=startpile));
			     };
			    };
			    if(found==false){//---------------------probiere reserve piles-----------------------------
				 if(pilereservelist.erstes()){
				  if(tippreservepile>(int(pilereservelist.anzahl())-1)) tippreservepile=0 ;
				  if(tippreservecard>(int(pilereserve(tippreservepile)->anzahl())-1)) tippreservecard=0;
				  unsigned int startpile=tippreservepile;
				  unsigned int startcard=tippreservecard;
				  do{
				   if(pilereserve(tippreservepile)->anzahl()>0){
				    _pilefoundation*pf;
				    if(pilefoundationlist.anfang(pf))do{
				     if(found==false){
				      _card*cr=pilereserve(tippreservepile)->card(tippreservecard);
				      if(cr->canpick()){
				       foundlist.aushaengen();
				       cr->pile->pickextern(cr,&foundlist);
				       if(pf->candrop(&foundlist)){
				        founddest=pf;
				        foundsour=pilereserve(tippreservepile);
				        found=true;
				       };			
	  			      };
				     };
				    }while(pilefoundationlist.naechstes(pf));
				   };
				   tippreservecard+=1;
				   if(tippreservecard>(int(pilereserve(tippreservepile)->anzahl())-1)){ 
				    tippreservecard=0;
  				    tippreservepile+=1;
				    if(tippreservepile>(int(pilereservelist.anzahl())-1)) tippreservepile=0;
				   };
				  }while((found==false) && (((startpile==tippreservepile) && (startcard==tippreservecard))==false));
			     };
				};			
				return(found);
};	
bool _game::tippreservetableau(unsigned int iteratorpack){
				//Local destcard:_card=0 // source iteratoren werden als dest iteratoren missbraucht
				_pile*destpile=0;
				if(iteratorpack==0){
				 destpile=tippsourpileiterator;
				}else if(iteratorpack==1){
				 destpile=autoplaysourpileiterator;
				}else if(iteratorpack==2){
				 destpile=automovesourpileiterator;
				}else if(iteratorpack==3){
				 destpile=clickplaysourpileiterator;
				};
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				bool found=false;
				if(destpile==0) return(false);
				unsigned int startpile=tippreservepile;
				unsigned int startcard=tippreservecard;
				if(pilereservelist.anzahl()==0) return(false);
				if(tippreservepile>(int(pilereservelist.anzahl())-1)) tippreservepile=0;
				if(tippreservecard>(int(pilereserve(tippreservepile)->anzahl())-1)) tippreservecard=0;
				do{
				 if(pilereserve(tippreservepile)->anzahl()>0){
				  _card*cr=pilereserve(tippreservepile)->card(tippreservecard);
				  if(cr->canpick()){
				   foundlist.aushaengen();
				   cr->pile->pickextern(cr,&foundlist);
				   if(destpile->candrop(&foundlist)){
				    founddest=destpile;
				    foundsour=pilereserve(tippreservepile);
				    found=true;
				   };			
				  };
				 };
				 tippreservecard+=1;
				 if(tippreservecard>(pilereserve(tippreservepile)->anzahl()-1)){
				  tippreservecard=0;
  				  tippreservepile+=1;
				  if(tippreservepile>(int(pilereservelist.anzahl())-1)) tippreservepile=0;
				 };
				}while((found==false)&&(((startpile==tippreservepile)&&(startcard==tippreservecard))==false));
				return(found);
};					
bool _game::tippreserve(unsigned int iteratorpack){
				bool found=false;
				_pile*sourstart=0;
				//------------------------------ kann etwas auf die foundation bewegt werden ? -------------------
				
				//------------------------------ kann etwas auf das tableau bewegt werden ? -------------------
				if(found==false){
				 tippinitcombination(iteratorpack);
				 if(iteratorpack==0){
				  sourstart=tippsourpileiterator;
				 }else if(iteratorpack==1){
				  sourstart=autoplaysourpileiterator;
				 }else if(iteratorpack==2){
				  sourstart=automovesourpileiterator;
				 }else if(iteratorpack==3){
				  sourstart=clickplaysourpileiterator;
				 };
				 do{
				  if(tippreservetableau(iteratorpack)) found=true;
				  tippiteratecombinationpilewise(iteratorpack);
			 	 }while((tippendedcombinationpilewise(iteratorpack,sourstart)==false)&&(found==false));
				};
				return(found);
};
//-------------------------------------------- AUTO PLAY -------------------------------------------------				
void _game::autoplayiteratecombination(unsigned int iteratorpack){
				
				if(iteratorpack==0){
				 tippdestpileiterator=piletableaulist.erstes();
				 if(tippsourcarditerator) if(tippsourcarditerator->liste()->vorheriges(tippsourcarditerator)==false){
				  tippsourpileiterator=tippsourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				  tippsourcarditerator=tippsourpileiterator->letztes();
				 };
				}else if(iteratorpack==1){
				 autoplaydestpileiterator=piletableaulist.erstes();
				 if(autoplaysourcarditerator) if(autoplaysourcarditerator->liste()->vorheriges(autoplaysourcarditerator)==false){
				  autoplaysourpileiterator=autoplaysourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				  autoplaysourcarditerator=autoplaysourpileiterator->letztes();
				 };
				}else if(iteratorpack==2){
				 automovedestpileiterator=piletableaulist.erstes();
				 if(automovesourcarditerator) if(automovesourcarditerator->liste()->vorheriges(automovesourcarditerator)==false){
				  automovesourpileiterator=automovesourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				  automovesourcarditerator=automovesourpileiterator->letztes();
				 };
				}else if(iteratorpack==3){
				 clickplaydestpileiterator=piletableaulist.erstes();
				 if(clickplaysourcarditerator) if(clickplaysourcarditerator->liste()->vorheriges(clickplaysourcarditerator)==false){
				  clickplaysourpileiterator=clickplaysourpileiterator->_listenknotenbasis<_piletableau>::naechstes();
				  clickplaysourcarditerator=clickplaysourpileiterator->letztes();
				 };
				};
};
bool _game::autoplayendedcombination(unsigned int iteratorpack,_pile*sourstart,_card*cardstart){
				if(iteratorpack==0){
				 if((tippsourpileiterator==sourstart)&&(tippsourcarditerator==cardstart)) return(true); else return(false);
				}else if(iteratorpack==1){
				 if((autoplaysourpileiterator==sourstart)&&(autoplaysourcarditerator==cardstart)) return(true); else return(false);
				}else if(iteratorpack==2){
				 if((automovesourpileiterator==sourstart)&&(automovesourcarditerator==cardstart)) return(true); else return(false);
				}else if(iteratorpack==3){
				 if((clickplaysourpileiterator==sourstart)&&(clickplaysourcarditerator==cardstart)) return(true); else return(false);
				};
				return(true);
};	
_piletableau*_game::autoplaymovelist(_pile*sourpile,_liste<_card>*ft,bool samesuit,bool rowgrow,bool clickplay,bool noempty){
				//kernfunktion sucht ein ziel 
				//für die liste ft und gibt es in destpile zurück			
				_liste<_piletableau> l;
				_piletableau*destpile;
				if(piletableaulist.anfang(destpile))do{//for(Local destpile:_piletableau=EachIn tableau.pilelist
				 if(destpile!=sourpile){
				  if(destpile->candrop(ft,samesuit)){
				   //nun die längenprüfung
				   bool listen=false;
				   unsigned int ls=sourpile->pickrowlengthfromfirst();
			 	   unsigned int ld=destpile->pickrowlengthfromfirst();
				   if(rowgrow){
 				    if(destpile->anzahl()==0){//leeres Feld
				     if((ft->anzahl()==ls)&&(ft->anzahl()<sourpile->anzahl())) listen=true;
				    }else{ 
				     if((ft->anzahl()+ld)>ls) listen=true;
				     //spezielle cruel pile move restriction -----------
				     if((sourpile->givemaximal==1)&&(clickplay==false)){
				      if(sourpile->nextcardinsequence(ft->erstes()->objekt())) listen=false;
					 };
					 //--------------------------------------------------
				    };
				   }else{
		 	        listen=true;
				    if(clickplay==false) if((ft->anzahl()+ld)<=ls) listen=false;
				   };
				   if(noempty){
				    //noempty schalter hier nur anwenden, wenn es um eine Karte innerhalb des Tableaus geht
				    _card*cf=ft->erstes()->objekt();
				    _piletableau*pt=dynamic_cast<_piletableau*>(cf->pile);
				    if(pt) if(destpile->anzahl()==0) listen=false;
				   };
				   if(listen) l.einhaengen(destpile);
				  };
				 };
				}while(piletableaulist.naechstes(destpile));
			    _piletableau*dest=0;
				if((rowgrow)||(clickplay==false)){
				 int c=-1;
				 _listenknoten<_piletableau>*pit;
			 	 if(l.anfang(pit))do{//for(Local pit:_piletableau=EachIn l
			      int r=pit->objekt()->pickrowlengthfromfirst();
				  if(c<r){
				   c=r;
				   dest=pit->objekt();
				  };
				 }while(l.naechstes(pit));
				}else{
				 if(l.anzahl()>0){
				  _listenknoten<_piletableau>*it;
				  l.anfang(it);
				  unsigned int r=zufall<unsigned int>(0,l.anzahl()-1);
				  for(unsigned int ii=0;ii<r;ii++) it=it->naechstes();
				  dest=l.erstes()->objekt();
				 };
				};
				return(dest);
};
bool _game::autoplaymovecard(_pile*sourpile,_card*sourcard,bool samesuit,bool rowgrow,bool clickplay,bool noempty){
				_piletableau*destpile=0;//_piletableau(tippdestpileiterator.value())
				_card*iit=sourcard;
				_liste<_card> ft;
				sourpile->pickextern(sourcard,&ft);
				//vorher :
				//wurde verallgemeinert !!!!!
				//Repeat
				// ft.einhaengen(_card(iit.value()))
				// iit=iit->vorheriges()
				//Until iit=0
				destpile=autoplaymovelist(sourpile,&ft,samesuit,rowgrow,clickplay,noempty);
				if(destpile){
				 founddest=destpile;
				 foundsour=sourpile;
				 foundlist.aushaengen();
				 _listenknoten<_card>*cit;
				 if(ft.anfang(cit))do{//for(Local cit:_card=EachIn ft
				  foundlist.einhaengen(cit->objekt());
				 }while(ft.naechstes(cit));
				 return(true);
				}else{
				 return(false);
				};
};
bool _game::autoplaymove(unsigned int iteratorpack,bool samesuit,bool rowgrow,bool noempty){
				_card*sourcard=0;
				_pile*sourpile=0;
				if(iteratorpack==0){
				 if(tippsourcarditerator) sourcard=tippsourcarditerator;
				 sourpile=tippsourpileiterator;
				}else if(iteratorpack==1){
				 if(autoplaysourcarditerator) sourcard=autoplaysourcarditerator;
				 sourpile=autoplaysourpileiterator;
				}else if(iteratorpack==2){
				 if(automovesourcarditerator) sourcard=automovesourcarditerator;
				 sourpile=automovesourpileiterator;
				}else if(iteratorpack==3){
				 if(clickplaysourcarditerator) sourcard=clickplaysourcarditerator;
				 sourpile=clickplaysourpileiterator;
				};
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				if(sourcard){
				 if(sourcard->canpick()){
				  if(autoplaymovecard(sourpile,sourcard,samesuit,rowgrow,false,noempty)){
				   return(true);
				  };
				 }; 
				};
				return(false);
};				
bool _game::autoplaymovetableau(unsigned int iteratorpack,bool samesuit,bool rowgrow,bool noempty){
				bool found=false;
				_pile*sourstart=0;
				_card*cardstart=0;
				tippinitcombination(iteratorpack);
				if(iteratorpack==0){
				 sourstart=tippsourpileiterator;
				 cardstart=tippsourcarditerator;//ACHTUNG KANN 0 SEIN
				}else if(iteratorpack==1){
				 sourstart=autoplaysourpileiterator;
				 cardstart=autoplaysourcarditerator;//ACHTUNG KANN 0 SEIN
				}else if(iteratorpack==2){
				 sourstart=automovesourpileiterator;
				 cardstart=automovesourcarditerator;//ACHTUNG KANN 0 SEIN
				}else if(iteratorpack==3){
				 sourstart=clickplaysourpileiterator;
				 cardstart=clickplaysourcarditerator;//ACHTUNG KANN 0 SEIN
				};
				do{
				 if(autoplaymove(iteratorpack,samesuit,rowgrow,noempty)) found=true;
				 autoplayiteratecombination(iteratorpack);
			 	}while((autoplayendedcombination(iteratorpack,sourstart,cardstart)==false)&&(found==false));
				return(found);
};					
_animationpiletopile*_game::autoplayanimationpiletopile(bool udx,bool udy,_tg vx,_tg vy,_tg vz,bool undoconstantsort){
				_animationpiletopile*a=new _animationpiletopile(this,&foundlist,founddest,solitaire->autospeed,0.1,true,udx,udy);
				a->undoconstantsort=undoconstantsort;
				a->vector.setzen(vx,vy,vz);
				a->skipable=false;
				return(a);
};
//-------------------------------------------- CLICK PLAY CARD ------------------------------------------------				
bool _game::clickplaytableaumove(_card*c,bool samesuit,bool rowgrow,bool noempty){
				_pile*sourpile=c->pile;
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				if(autoplaymovecard(sourpile,c,samesuit,rowgrow,true,noempty)) return(true);
				return(false);
};		
bool _game::clickplaywaste(_card*c,bool noempty){
				bool found=false;
				_pilewaste*pw=dynamic_cast<_pilewaste*>(c->pile);
				if(pw==0) return(false);
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				foundlist.einhaengen(c);
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 if((found==false)&&(pit->candrop(&foundlist))){
				  if(noempty){
				   if(pit->erstes()) found=true;
				  }else{
				   found=true;
				  };
				  foundsour=pw;
				  founddest=pit;
				 };
				}while(piletableaulist.naechstes(pit));
				return(found);
};
bool _game::clickplaycompleterow(_card*c){
				
				if(c->number!=12) return(false);
				if(pilediscardlist.erstes()==0) return(false);
				founddest=getpilediscardminimum();
				int s=c->suit;
				foundsour=c->pile;
				foundlist.aushaengen();
				_card*it=c;
				for(int n=12;n>=0;n--){
				 if(it==0) return(false);
				 if(it->number!=n) return(false);
				 foundlist.einhaengen(it);
				 if(it->liste()->vorheriges(it)==false) it=0;
				};
				return(true);
};				
bool _game::clickplaytableauemptypile(_card*c){
				foundlist.aushaengen();
				foundsour=0;
				founddest=0;
				_piletableau*pit;
				if(piletableaulist.anfang(pit))do{
				 if((pit->erstes()==0)&&(founddest==0)) founddest=pit;
				}while(piletableaulist.naechstes(pit));
				if(founddest){
				 if(c->canpick()){
				  foundlist.aushaengen();
				  c->pile->pickextern(c,&foundlist);
				  if(founddest->candrop(&foundlist)){
				   foundsour=c->pile;
   			       return(true);
				  };
				 };
				};
				return(false);
};
bool _game::clickplayfoundation(_card*c){
				founddest=0;
				foundsour=c->pile;
				foundlist.aushaengen();
				//achtung vorher : if(c.pilelink->vorheriges()!=0 return(false)
				if(c->canpick()==false) return(false);
				c->pile->pickextern(c,&foundlist);
				_pilefoundation*destpile;
				if(pilefoundationlist.anfang(destpile))do{
				 if(founddest==0) if(destpile->candrop(&foundlist)) founddest=destpile;
				}while(pilefoundationlist.naechstes(destpile));
				if(founddest) return(true);
				return(false);
};
bool _game::clickplayfreecell(_card*card){
				foundlist.aushaengen();
				founddest=0;
				foundsour=0;
				_pilefreecell*pf=0;
				_pilefreecell*fit=0;
				card->pile->pickextern(card,&foundlist);
				if(pilefreecelllist.anfang(fit))do{
				 if(pf==0) if(fit->candrop(&foundlist)) pf=fit;
				}while(pilefreecelllist.naechstes(fit));
				if(pf){
				 founddest=pf;
				 foundsour=card->pile;
				 return(true);
				};
				return(false);
};
void _game::save(_datei*d){
				d->speichern(speichername());
				d->speichern(allowpick);
				d->speichern(preview);
				d->speichern(inuse);
				d->speichern(ended);
				d->speichern(_tg(solitaire->clock->system()-starttime));
				for(unsigned int i=0;i<10 ;i++){
				 d->speichern(cameraposition[i]);
				 d->speichern(camerapositionmenu[i]);
				 d->speichern(camerapositionpreview[i]);
				 d->speichern(cameraview[i]);
				 d->speichern(cameraviewmenu[i]);
				 d->speichern(cameraviewpreview[i]);
				 d->speichern(cameraside[i]);
				 d->speichern(camerasidemenu[i]);
				 d->speichern(camerasidepreview[i]);
				 d->speichern(cameraup[i]);
				 d->speichern(cameraupmenu[i]);
				 d->speichern(camerauppreview[i]);
				};
				d->speichern(position);
				d->speichern(vector[0]);
				d->speichern(vector[1]);
				d->speichern(rectangle[0]);
				d->speichern(rectangle[1]);
				d->speichern(rectangletransformed[0]);
				d->speichern(rectangletransformed[1]);
				d->speichern(cardwidth);
				d->speichern(cardheight);
				d->speichern(carddistance);
				d->speichern(cardshiftfront);
				d->speichern(cardshiftback);
				d->speichern(scaleglobal);
				d->speichern(translationglobal);

				_card*cit;
				_listenknoten<_card>*lncit;
				d->speichern(cardlist.anzahl());
				if(cardlist.anfang(cit))do{
				 cit->save(d);
				}while(cardlist.naechstes(cit));	

				d->speichern(picklist.anzahl());
				if(picklist.anfang(lncit))do{
				 speichernzeiger(d,lncit->objekt());
				}while(picklist.naechstes(lncit));

				unsigned int uc=undolist.anzahl();
				d->speichern(uc);
				if(uc){
				 _animationundo*uit;
				 if(undolist.anfang(uit))do{
				  uit->save(d);
				 }while(undolist.naechstes(uit));
				 d->speichern(undoiteratorindex());
				};
				d->speichern(statsclosed);
				d->speichern(discards);
				d->speichern(time);
				d->speichern(moves);
				d->speichern(undos);
				d->speichern(tipps);
};
unsigned int _game::undoiteratorindex(){
				unsigned int i=0;
				_animationundo*it;
				if(undolist.anfang(it)&&(undoiterator)){
				 while((it!=undoiterator)&&(it)){
				  i++;
				  it=it->_listenknotenbasis<_animationundo>::naechstes();
				 };
				}; 
				return(i);
};
void _game::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				d->laden(allowpick);
				d->laden(preview);
				d->laden(inuse);
				d->laden(ended);
				_tg t;
				d->laden(t);
				starttime=solitaire->clock->system()-t;
				for(unsigned int i=0;i<10;i++){
				 d->laden(cameraposition[i]);
				 d->laden(camerapositionmenu[i]);
				 d->laden(camerapositionpreview[i]);
				 d->laden(cameraview[i]);
				 d->laden(cameraviewmenu[i]);
				 d->laden(cameraviewpreview[i]);
				 d->laden(cameraside[i]);
				 d->laden(camerasidemenu[i]);
				 d->laden(camerasidepreview[i]);
				 d->laden(cameraup[i]);
				 d->laden(cameraupmenu[i]);
				 d->laden(camerauppreview[i]);
				};
				d->laden(position);
				d->laden(vector[0]);
				d->laden(vector[1]);
				d->laden(rectangle[0]);
				d->laden(rectangle[1]);
				d->laden(rectangletransformed[0]);
				d->laden(rectangletransformed[1]);
				d->laden(cardwidth);
				d->laden(cardheight);
				d->laden(carddistance);
				d->laden(cardshiftfront);
				d->laden(cardshiftback);
				d->laden(scaleglobal);
				d->laden(translationglobal);
				cardlist.loeschen();
				unsigned int cc;
				d->laden(cc);//cardlist.count()
				for(unsigned int i=0;i<cc;i++){
				 _card*cit=new _card(solitaire,this,0,0);
				 cit->insertgame();
				 _zeichenkette<char> typ;
				 d->laden(typ);
				 cit->load(d);
				};	
				picklist.aushaengen();
				d->laden(loadprocpc);//picklist.anzahl()
				for( int i=0;i<loadprocpc;i++){
				 ladenzeiger(d);
				};
				undolist.loeschen();
				undoiterator=0;
				loadprocuii=-1;
				unsigned int uc;
				d->laden(uc);//undolist.count()
				for(unsigned int i=0;i<uc;i++){
				 _animationundo*undo=new _animationundo(this,0,0);
				 undo->deinsertgame();//animation deinsert
				 _zeichenkette<char> ut;
				 d->laden(ut);
				 undo->load(d);
				};
				d->laden(loadprocuii);//undoiteratorindex
				d->laden(statsclosed);
				d->laden(discards);
				d->laden(time);
				d->laden(moves);
				d->laden(undos);
				d->laden(tipps);
};	
void _game::assoziieren(){
				//Print "asso undoitindex="+loadprocuii
				if(undolist.anfang(undoiterator)){
				 for( int i=0;i<loadprocuii;i++){
				  undoiterator=undoiterator->_listenknotenbasis<_animationundo>::naechstes();
				 };
				};
				//if(undoiterator==0) Print "alarm"
				if(zeigergeladen()){
				 for( int i=0;i<loadprocpc;i++){
				  _card*c;
				  assoziierenzeiger(c);
				  picklist.einhaengen(c);
				 };
				 loeschenzeiger();
				};
};					
