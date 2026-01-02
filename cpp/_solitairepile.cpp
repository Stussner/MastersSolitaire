//******************************************************************************************************************************************************************************************************
//  Project     : Fantasy Solitaire
//  Library     : 
//  Module      : _solitairepile.cpp
//  Date        : 14.03.2002
//  Description : 
//******************************************************************************************************************************************************************************************************
#include "../hpp/_solitairepile.hpp"


//******************************************************************************************************************
//										P I L E
//******************************************************************************************************************
_pile::_pile(_game*g,_tg px,_tg py):_speicherbarbinaer(g->solitaire),_listenknotenbasis<_pile>(&g->pilelist){
                game=g;
                position.setzen(px,py,0);
                camerastretch=true;
                stretchfactor=1;//ist
                stretch=1;//soll
                stretchvector=0;
                stretchhaerte=0.07;
                stretchfriction=0.89;
                maximumlength=10;
                radiusx=10;
                radiusy=9;
                anglestep=8;
                mesh=0;
                meshsuit=0;
                meshnumber=0;
                polygon=0;
                polygonsuit=0;
                polygonnumber=0;
                for(int t=0;t<4;t++){
                 vertex[t]=0;
                 vertexsuit[t]=0;
                 vertexnumber[t]=0;
                };
                nopickifcardcurving=true;
                discardcount=false;
                giverestriction=false;
                giverestrictionfreecell=false;
                givesamesuit=false;
                giveothersuit=false;
                givealteratecolor=false;
                givedescending=false;
                giveascending=false;
                givemaximal=-1;
                takerestriction=false;
                takesamesuit=false;
                takeothersuit=false;
                takealteratecolor=false;
                takeascending=false;
                takedescending=false;
                takeboth=false;
                takewrapped=false;
                takemirrored=false;
                takeemptysuit=-1;
                takeemptynumber=-1;
                takeemptymaximal=-1;
                takeemptyrestriction=false;
                takemaximal=-1;
                tableaufill=false;
                redealvalue=-1;
                redealcount=0;
                showdescription=true;
                drawownshadow=false;
                name=L"";
                description0=L"";
                description1=L"";
                flag=0;
                showz=0;
				vector.setzen(0,-1,0);
				name=strpile;
				_tg vx=game->cardwidth;
				_tg vy=game->cardheight;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),vx,vy,0);
				gg.textur(game->solitaire->tempty);
				gg.ort(position.x()-vx/2,position.y()-vy/2,0);
				gg.texturvektor(1,-1);
				mesh=gg.erzeugen();
				//mesh->dynamicvertexlight=true;
				mesh->zeichnenflaeche(true);
				mesh->transparenz(true);
				mesh->transparenzadditiv(false);
				mesh->welt(game->solitaire->world);
				mesh->aktualisieren();
				
				_tg ss=1.4*vy/_tg(6);
				gg.textur(game->solitaire->tsymbolsuit[0]);
				gg.ort(position.x()-ss/2,position.y()-ss/2+ss,0);
				gg.groesse(ss,ss);
				gg.texturvektor(1,-1);
				meshsuit=gg.erzeugen();
				//meshsuit->dynamicvertexlight=true;
				meshsuit->zeichnenflaeche(true);
				meshsuit->transparenz(true);
				meshsuit->transparenzadditiv(false);
				meshsuit->welt(game->solitaire->world);
				meshsuit->aktualisieren();

				gg.textur(game->solitaire->tsymbolnumber[0]);
				gg.ort(position.x()-ss/2,position.y()-ss/2-ss,0);
				gg.groesse(ss,ss);
				gg.texturvektor(1,-1);
				meshnumber=gg.erzeugen();
				//meshnumber->dynamicvertexlight=true;
				meshnumber->zeichnenflaeche(true);
				meshnumber->transparenz(true);
				meshnumber->transparenzadditiv(false);
				meshnumber->welt(game->solitaire->world);
				meshnumber->aktualisieren();
				updatevertexarray();
};
_pile::~_pile(){
				L->schreiben("PILEDESTRUKTOR einsteig",(int)this);
				_listebasissortierung<_card>::loeschen();
			/*	clearshadow();
				deletesecure(mesh);
				deletesecure(meshsuit);
				deletesecure(meshnumber);*/
				L->schreiben("PILEDESTRUKTOR austeig");
};
void _pile::clearshadow(){
                shadowlist.loeschen();
};
void _pile::opacity(_to o){
				if(mesh) mesh->opazitaetverbinder(o);
				if(meshnumber) meshnumber->opazitaetverbinder(o);
				if(meshsuit) meshsuit->opazitaetverbinder(o);
};
void _pile::createshadow(){
};
void _pile::createshadowstripe(){
                /*
				clearshadow()
				_licht<_tg,_to>*lit;if(game->solitaire->world->anfang(lit))do{  .... }while(game->solitaire->world->naechstes(lit));
				 if(lit.noshadow=false
				  Local sit:_shadowstripe=new _shadowstripe
				  Local l:TList=game->solitaire->shadowpreviewlist
				  if(game->preview=false l=game->solitaire->shadowlist
 				  sit.init(game->solitaire->gra,game->solitaire->tshadowblock,l,lit)
 			      shadowlist.einhaengen(sit)
  				 };
				};
				//updateshadowstripe()
				*/
};
void _pile::createshadowblock(){
                /*
				clearshadow()
				_licht<_tg,_to>*lit;if(game->solitaire->world->anfang(lit))do{  .... }while(game->solitaire->world->naechstes(lit));
				 if(lit.noshadow=false
				  Local sit:_shadowblock=new _shadowblock
				  Local l:TList=game->solitaire->shadowpreviewlist
				  if(game->preview=false l=game->solitaire->shadowlist
 				  sit.init(game->solitaire->gra,game->solitaire->tshadowblock,l,lit)
 			      shadowlist.einhaengen(sit)
  				 };
				};
				*/
};
void _pile::updateshadowstripe(){
				updateshadowblock();
};
void _pile::updateshadowblock(){
                /*
				Local it:TLink=cardlist->erstes()
				_card*cf=0;
				Local cl:_card=0
				if(it
				 Repeat
				  Local cit:_card=_card(it->objekt())
				  if(cit.curving=false && cit.picked=false cf=cit
				  it=it->naechstes()
				 Until cf || it=0
				};
				if(cf=0//keine first karte in Ruhe gefunden
				 for(Local sit:_shadow=EachIn shadowlist
				  sit.valid=false
				 };
				 return;
				};
				cl=cf
				if(it//letzte Karte setzen
				 Repeat
				  cl=_card(it->objekt())
				  it=it->naechstes()
				 Until(it=0)
				};
				_vektor3<_tg> h;;
				Local j:_vektor3=new _vektor3;
				Local pf:_polygon=_polygon(cf.mesh->polygonlist->erstes()->objekt());
				Local pl:_polygon=_polygon(cl.mesh->polygonlist->erstes()->objekt());
				Local vf:_vertex[4];
				Local vl:_vertex[4];
				Local sf:_vektor3[4];
				Local sl:_vektor3[4];
				Local p:_vektor3[4];
			 	for(Local i=0 To 3
				 p[i]=new _vektor3;
				};				
				Local vi=0;
				for(Local vit:_vertex=EachIn pf.vertexlist
				 vf[vi]=vit;
				 vi=vi+1;
				};
				//------------------------------------------ cl = cf Fall abfangen -----------------------------------------
				if(cl=cf
				 for(Local sit:_shadow=EachIn shadowlist
				  sit.valid=true;
				  project(vf[0],sit,p[0]);
				  project(vf[1],sit,p[1]);
				  project(vf[2],sit,p[2]);
				  project(vf[3],sit,p[3]);
				  it=_polygon(sit.mesh->polygonlist->erstes()->objekt()).vertexlist->erstes();
				  _vertex(it->objekt()).setzen(p[0]);it=it->naechstes();
				  _vertex(it->objekt()).setzen(p[1]);it=it->naechstes();
				  _vertex(it->objekt()).setzen(p[2]);it=it->naechstes();
				  _vertex(it->objekt()).setzen(p[2]);it=it->naechstes();
				  _vertex(it->objekt()).setzen(p[2]);it=it->naechstes();
				  _vertex(it->objekt()).setzen(p[3]);it=it->naechstes();
			  	  _polygon(sit.mesh->polygonlist->erstes()->objekt()).update();			 
				 };
				 return;
				};
				for(Local sit:_shadow=EachIn shadowlist
				 sit.valid=true
				 //nähesten vertex der ersten Kartte bestimmen
				 Local dn#=10000//:_vektor3=new _vektor3
				 Local df#=-1
				 vf[0]=0
				 vf[3]=0
				 for(Local vit:_vertex=EachIn pf.vertexlist
				  vit.get(h)
				  h-=sit.light)
				  Local dh#=h.length()
				  if(dn>dh 
				   vf[0]=vit
				   dn=dh
				  };
				  if(df<dh
				   vf[3]=vit
				   df=dh
				  };
				 };
				
				 //entferntesten Vertex in der letzten Karte holen
				 dn=10000
				 df=-1
				 vl[0]=0
				 vl[3]=0
				 for(Local vit:_vertex=EachIn pl.vertexlist
				  vit.get(h)
				  h-=sit.light)
				  Local dh#=h.length()
				  if(dn>dh 
				   vl[0]=vit
				   dn=dh
				  };
				  if(df<dh 
				   vl[3]=vit
				   df=dh
				  };
				 };
				
				 //die seitlichen vertex der ersten Karte bestimmen
				 for(Local vit:_vertex=EachIn pf.vertexlist
				  if(vit!=vf[0] && vit!=vf[3] 
				   if(vf[1]=0 
				    vf[1]=vit 
				   }else if(vf[2]=0
				    vf[2]=vit
				   };
				  };
				 };
				 
				 //die seitlichen vertex der letzten Karte bestimmen
				 for(Local vit:_vertex=EachIn pl.vertexlist
				  if(vit!=vl[0] && vit!=vl[3] 
				   if(vl[1]=0 
				    vl[1]=vit 
				   }else if(vl[2]=0
				    vl[2]=vit
				   };
				  };
				 };
				 //projektion durchführen und mesh aktualisieren
				 Local of:_vektor3[3]
				 Local ol:_vektor3[3]
			 	 for(Local i=0 To 2 
				  of[i]=new _vektor3
				  ol[i]=new _vektor3
				 };
				 project(vf[3],sit,of[0]);
				 project(vf[1],sit,of[1]);
				 project(vf[2],sit,of[2]);
				 project(vl[0],sit,ol[0]);
				 project(vl[1],sit,ol[1]);
				 project(vl[2],sit,ol[2]);
				
				 if(sit.valid
				  Local nf:_vektor3=new _vektor3
				  Local nl:_vektor3=new _vektor3
				  Local sn#=0
				  it=_polygon(sit.mesh->polygonlist->erstes()->objekt()).vertexlist->erstes()
				  
				  h=of[1])
				  h-=of[0])
				  nf.copy(of[2])
				  nf-=of[0])
				  nf.crossproduct(h)
				
				  h=ol[1])
				  h-=ol[0])
				  nl.copy(ol[2])
				  nl-=ol[0])
				  nl.crossproduct(h)
				  sn=nl.product(nf)
				  if(sn<0
				   _vertex(it->objekt()).setzen(of[1]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(of[0]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(of[2]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(ol[2]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(ol[0]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(ol[1]);it=it->naechstes()
				  }else{
				   _vertex(it->objekt()).setzen(of[1]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(of[0]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(of[2]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(ol[1]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(ol[0]);it=it->naechstes()
				   _vertex(it->objekt()).setzen(ol[2]);it=it->naechstes()
				  };
				  _polygon(sit.mesh->polygonlist->erstes()->objekt()).update()
				 };
				};
				*/
};
bool _pile::silhouette(_schatten<_tg,_to>*sit,const _vektor3<_tg>&km,const _vektor3<_tg>&n0,const _vektor3<_tg>&n1){
			  	_vektor3<_tg> h;
				h=km;
				h-=sit->licht()->ort();
				_tg s0=h.produkt(n0);
				_tg s1=h.produkt(n1);
				if(((s0<=0)&&(s1>0))||((s0>0)&&(s1<=0))) return(true); else return(false);
};
void _pile::project(_vertex*v,_schatten<_tg,_to>*sit,_vektor3<_tg>&p){
				_vektor3<_tg> h;
				h=*v;
				h-=sit->licht()->ort();
				_tg gamma=-sit->licht()->ort().z()/h.z();
				if(gamma>0){
				 p.setzen(sit->licht()->ort().x()+h.x()*gamma,sit->licht()->ort().y()+h.y()*gamma,0);
				}else{
				 sit->gueltig(false);
				}; 
};
void _pile::updateshadow(){
};
void _pile::updatevertexarray(){
				_polygon*pit;
				_vertex*vit;
				int i=0;
				if(mesh->anfang(pit))do{//for(pit=EachIn mesh->polygonlist
				 polygon=pit;
				 vit=pit->vertex();
				 if(vit)do{//for(vit=EachIn pit.vertexlist
				  if(i<4) vertex[i]=vit;
				  i++;
				  vit=vit->naechstes(pit);
				 }while(vit!=pit->vertex());
				}while(mesh->naechstes(pit));
				i=0;
				if(meshsuit->anfang(pit))do{
				 polygonsuit=pit;
				 vit=pit->vertex();
				 if(vit)do{
				  if(i<4) vertexsuit[i]=vit;
				  i++;
				  vit=vit->naechstes(pit);
				 }while(vit!=pit->vertex());
				}while(meshsuit->naechstes(pit));
				i=0;
				if(meshnumber->anfang(pit))do{
				 polygonnumber=pit;
				 vit=pit->vertex();
				 if(vit)do{
				  if(i<4) vertexnumber[i]=vit;
				  i++;
				  vit=vit->naechstes(pit);
				 }while(vit!=pit->vertex());
				}while(meshnumber->naechstes(pit));
};
void _pile::updatemesh(){
				//function updates the vertex coordinates of the card mesh
				//along the plane vectors position, vx,vy
				int i=0;
				_tg jvx=game->cardwidth;
				_tg jvy=game->cardheight;
				_tg ss=1.4*jvy/_tg(6);
				_vektor3<_tg> h;
				_vektor3<_tg> k;
				_vektor3<_tg> p;
				_vektor3<_tg> vvx(jvx,0,0);
				_vektor3<_tg> vvy(0,jvy,0);
				h=vvx;
				h*=-0.5;
				k=vvy;
				k*=-0.5;
				h+=k;
				h+=position;
				vertex[0]->setzen(h);
				h+=vvx;
				vertex[1]->setzen(h);
				h+=vvy;
				vertex[2]->setzen(h);
				h-=vvx;
				vertex[3]->setzen(h);
				polygon->mitte(position);
				//--------------------------------------
				p=position;
				p.y(p.y()-ss);
				vvx.setzen(ss,0,0);
				vvy.setzen(0,ss,0);
				h=vvx;
				h*=-0.5;
				k=vvy;
				k*=-0.5;
				h+=k;
				h+=p;
				vertexsuit[0]->setzen(h);
		   		h+=vvx;
				vertexsuit[1]->setzen(h);
				h+=vvy;
				vertexsuit[2]->setzen(h);
				h-=vvx;
				vertexsuit[3]->setzen(h);
				polygonsuit->mitte(p);
				//--------------------------------------
				p.y(p.y()+2*ss);
				h=vvx;
				h*=-0.5;
				k=vvy;
				k*=-0.5;
				h+=k;
				h+=p;
				vertexnumber[0]->setzen(h);
				h+=vvx;
				vertexnumber[1]->setzen(h);
				h+=vvy;
				vertexnumber[2]->setzen(h);
				h-=vvx;
				vertexnumber[3]->setzen(h);
				polygonnumber->mitte(p);
				//meshnumber.update();
};
bool _pile::vergleichen(_pile*p){
				if(game->menu==false){
				 if(p){
				  _tg x=position.x();
				  _tg y=position.y();
				  _tg z=position.z();
				  _tg ox=p->position.x();
				  _tg oy=p->position.y();
				  _tg oz=p->position.z();
				  _tg c=z+sqrt(x*x+y*y)*0.000005;
				  _tg co=oz+sqrt(ox*ox+oy*oy)*0.000005;
	 			  if(c<co) return(true);
				 };
				 return(false);
				}else{
				 if(p){
				  if(position.y()>p->position.y()) return(true);
				  return(false);
				 };
				};
				return(true);
};
bool _pile::samerule(_pile*p){
				if(giverestriction!=p->giverestriction) return(false);
				if(giverestrictionfreecell!=p->giverestrictionfreecell) return(false);
				if(givesamesuit!=p->givesamesuit) return(false);
				if(giveothersuit!=p->giveothersuit) return(false);
				if(givealteratecolor!=p->givealteratecolor) return(false);
				if(givedescending!=p->givedescending) return(false);
				if(giveascending!=p->giveascending)return(false);
				if(givemaximal!=p->givemaximal) return(false);
				if(takerestriction!=p->takerestriction) return(false);
				if(takesamesuit!=p->takesamesuit) return(false);
				if(takeothersuit!=p->takeothersuit) return(false);
				if(takealteratecolor!=p->takealteratecolor) return(false);
				if(takeascending!=p->takeascending) return(false);
				if(takedescending!=p->takedescending) return(false);
				if(takeboth!=p->takeboth) return(false);
				if(takewrapped!=p->takewrapped) return(false);
				if(takemirrored!=p->takemirrored) return(false);
				//if(takeemptysuit!=p->takeemptysuit) return(false);
				//if(takeemptynumber!=p->takeemptynumber) return(false);
				if(takeemptymaximal!=p->takeemptymaximal) return(false);
				if(takeemptyrestriction!=p->takeemptyrestriction) return(false);
				if(takemaximal!=p->takemaximal) return(false);
				if(tableaufill!=p->tableaufill) return(false);
				if(redealvalue!=p->redealvalue) return(false);
				return(true);
};
int _pile::cardcount(){
				return(_listebasis<_card>::anzahl());
};
void _pile::turncard(_zeit*clock,int index){
				int i=0;
				_card*c;
				if(anfang(c))do{
				 if(i==index) c->turn();
				 i++;
				}while(naechstes(c));
};
void _pile::turn(_card*c,_tg spd,bool useundo){
				_vektor3<_tg> v;
				c->deinsertpile();
			    v=dropposition();
				c->insertpile(this,true);
				//nun auf die dropposition v den differnzvektor mit der }; karte bilden
				//wenn es keiune nächste karte gibt dann pileposition nehmen
				c->curvespeed=spd;
				c->curveposition.setzen(c->position, v, 0,0,-10,0,0,10);
			 	c->curvevx.setzen(c->vx, -c->vx, 0,0,10 ,0,0,-10);
			 	c->curvevy.setzen(c->vy, c->vy.x(),c->vy.y(),c->vy.z()-game->solitaire->cardslope, 0,0,0 ,0,0,0);
			     //undo record move
			    if(useundo){
				 _animationundo*m=game->createundo(spd,1);
				 m->use(c,this,true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				};
				if(game->preview==false) game->solitaire->sturn->abspielen(0.7,0.95,1.05);
				//end undo record move
				c->startcurve();
};
bool _pile::canturn(_card*c){
				if(c->vorheriges()==c->_listenknotenbasis<_card>::liste()->letztes()) return(false);
				return(true);
};
_card*_pile::card(int index){
				int i=0;
				_card*c;
				if(anfang(c))do{
				 if(i==index) return(c);
				 i++;
				}while(naechstes(c));
				return(0);
};
bool _pile::nocardcurving(){
				_card*c;
				if(anfang(c))do{
				 if(c->curving) return(false);
				}while(naechstes(c));
				return(true);
};
bool _pile::cardcurving(){
				return(!nocardcurving());
};
void _pile::drawshadow(_grafik*gra,_kamera<_tg>*cam){
				if(drawownshadow){
				 _listenknoten<_schatten<_tg,_to> >*sit;
				 if(shadowlist.anfang(sit))do{
				  sit->objekt()->zeichnen(gra);
				 }while(shadowlist.naechstes(sit));
				};
};
void _pile::draw(_grafik*gra,_kamera<_tg>*cam){
				mesh->erzeugenvertexlicht();
	    		//_licht<_tg,_to>*lit;
	    		//if(game->solitaire->world->anfang(lit))do{
				// mesh->determinevertexlight(lit);
				//}while(game->solitaire->world->naechstes(lit));
				mesh->zeichnen(gra);
};
void _pile::show(){
				showz=-10;
};
void _pile::drawshow(_grafik*gra,_kamera<_tg>*cam){
				if(showz<0){
				 position.z(showz);
				 updatemesh();
				 _vektor4<_to> v4(1,_to(0.8),_to(0.1),_to(fabs(showz))/_to(10));
				 mesh->farbeverbinder(v4);
				 mesh->zeichnen(gra);
				 showz+=0.5;
				 if(showz>0) showz=0;
				 v4.setzen(1,1,1,1);
				 mesh->farbeverbinder(v4);
				 position.z(showz);
				 updatemesh();
				};
};
void _pile::updatecardmesh(){
                _card*c;
				if(anfang(c))do{
				 c->updatemesh();
				}while(naechstes(c));
};
void _pile::updatedescription(){
				description0=L"";
				description1=L"";
};
bool _pile::inner(bool withcards){
				_tg a;
				_tg b;
				_tg jvx=game->cardwidth;
				_tg jvy=game->cardheight;
				_vektor3<_tg> vxh(jvx*0.5,0,0);
				_vektor3<_tg> vyh(0,jvy*0.5,0);
				_vektor3<_tg> mvn=game->solitaire->mousevector*-1;
				_vektor3<_tg> e= *game->solitaire->cam - position;
				_tg D=determinieren(vxh,vyh,mvn);
				if(fabs(D)>nahenull){
				 a=determinieren(e,vyh,mvn)/D;
				 if((a>=-1)&&(a<=1)){
				  b=determinieren(vxh,e,mvn)/D;
				  if((b>=-1)&&(b<=1)) return(true);
				 };
				};
				if(withcards){
				 _card*firstpicked=0;
				 _listenknoten<_card>*fit=game->picklist.erstes();
				 if(fit) firstpicked=fit->objekt();
				 if(game->solitaire->pointandclick==false) if(firstpicked) if(innercard(firstpicked)) return(true);
				 _card*c;
				 if(anfang(c))do{
				  bool check=true;
				  _listenknoten<_card>*cp;
				  if(game->picklist.anfang(cp))do{
				   if(cp->objekt()==c) check=false;
				  }while(game->picklist.naechstes(cp));
				  if(check){
				   if(c->inner()) return(true);
				   if(game->solitaire->pointandclick==false) if(firstpicked) if(c->innercard(firstpicked)) return(true);
				  };
			 	 }while(naechstes(c));
				};
				return(false);
};
bool _pile::innercard(_card*c){
				_tg a;
				_tg b;
				_tg jvx=game->cardwidth;
				_tg jvy=game->cardheight;
				_vektor3<_tg> vxh(jvx*0.5,0,0);
				_vektor3<_tg> vyh(0,jvy*0.5,0);
				_vektor3<_tg> mvn=c->position- *game->solitaire->cam;
				_vektor3<_tg> e= *game->solitaire->cam - position;
				mvn.normalisieren();
				mvn*=-1;
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
bool _pile::takeruleset(){
				if(takerestriction) return(true);
				if(takesamesuit) return(true);
				if(takeothersuit) return(true);
				if(takealteratecolor) return(true);
				if(takeascending) return(true);
				if(takedescending) return(true);
				if(takeboth) return(true);
				if(takewrapped) return(true);
				if(takemirrored) return(true);
				return(false);
};
bool _pile::takeemptyruleset(){
				if(takeemptyrestriction) return(true);
				if(takeemptysuit!=-1) return(true);
				if(takeemptynumber!=-1) return(true);
				if(takeemptymaximal!=-1) return(true);
				return(false);
};
bool _pile::giveruleset(){
				if(giverestriction) return(true);
				if(giverestrictionfreecell) return(true);
				if(givesamesuit) return(true);
				if(giveothersuit) return(true);
				if(givealteratecolor) return(true);
				if(givedescending) return(true);
				if(giveascending) return(true);
				if(givemaximal!=-1) return(true);
				return(false);
};
void _pile::pickslopeplane(_card*c,_vektor3<_tg>&vvx,_vektor3<_tg>&vvy){
				vvx.z(vvx.z()+c->neigungx*((c->position.x()-game->solitaire->cam->x())/15));
};
void _pile::pickslopeposition(_card*c,_vektor3<_tg>&p){
				p.z(p.z()+c->neigungx*0.8);
};
void _pile::pickslopeplanearc(_card*c,_vektor3<_tg>&vvx,_vektor3<_tg>&vvy){
				vvx.z(vvx.z()+c->neigungx*((c->position.x()-game->solitaire->cam->x())/15));
};
void _pile::pickslopepositionarc(_card*c,_vektor3<_tg>&p){
				_tg w=((_tg(c->index())-_tg(anzahl())/2)*anglestep)+90;
				_vektor3<_tg> h(cos(_ph*w)*c->neigungx,sin(_ph*w)*c->neigungx,-0.5*c->neigungx);
				p-=h;
};
bool _pile::nextcardinsequence(_card*cf){
		        _card*cn=0;
			    if(cf->pile) cn=cf->naechstes();
			    if(cn!=cf->liste()->erstes()){
			     if(cn->suit==cf->suit){
			      if(takedescending) if(cf->number==(cn->number-1)) return(true);
			      if(takeascending) if(cf->number==(cn->number+1)) return(true);
				  if(takeboth) if(abs(cn->number-cf->number)==1) return(true);
			     };
			    };
				return(false);
};
void _pile::pick(_card*c){
				c->pick();
				_card*it=c->vorheriges();
				if(it!=c->liste()->letztes()) pick(it);
};
void _pile::pickextern(_card*c,_liste<_card>*l){
				l->einhaengen(c);
				_card*it=c->vorheriges();
				if(it!=c->liste()->letztes()) pickextern(it,l);
};
int _pile::pickrowlengthfromfirst(){
				int i=0;
				_card*c;
				if(anfang(c))do{
				 if(canpick(c)) i++;
				}while(naechstes(c));
				return(i);
};
_vektor3<_tg> _pile::dropposition(bool backdrop){
				_vektor3<_tg> v=position;
				v.z(v.z()-game->solitaire->cardthickness*_tg(anzahl()));
				return(v);
};
_vektor3<_tg> _pile::droppositionvector(bool backdrop){
				//letzte rückseitige kartenposition holen
				_vektor3<_tg> v;
				_card*lc=0;
				bool lcup=false;
				bool lifted=false;
				_card*lit;
				_card*lb=0;
				_tg frontcount=0;
				if(ende(lit))do{
 				 bool up=false;
				 if(lit->curving){
				  if(lit->turnedupatcurveend()) up=true;
				 }else{
				  if(lit->turnedup()) up=true;
				 };
				 if((up)&&(lifted==false)) lifted=true;
				 lc=lit;
				 lcup=up;
				}while(vorheriges(lit));
				_vektor3<_tg> offfront=vector;
				offfront*=game->cardshiftfront*stretchfactor;
				offfront.z(offfront.z()-game->solitaire->cardthickness);
				_vektor3<_tg> offback=vector;
				offback*=game->cardshiftback*stretchfactor;
				offback.z(offback.z()-game->solitaire->cardthickness);
				if(lc){
				 if(lc->curving==false){
				  v=lc->position;
				 }else{
				  v=lc->curveposition.ort(1);
				 };
				 if(lcup==false) v+=offback; else v+=offfront;
				}else{
				 v=position;
				};
				if((lifted==false)&&(backdrop==false)) v.z(v.z()-game->solitaire->cardtableaulift);
				return(v);
};
_vektor3<_tg> _pile::droppositionarc(bool backdrop){
				_vektor3<_tg> v=position;
				v.z(v.z()-game->solitaire->cardtableaulift-1.5);
				int c=anzahl();
				_tg w=(-c/2)*anglestep+90;
				_tg x=cos(_ph*w)*radiusx;
				_tg y=sin(_ph*w)*radiusy;
				v.x(v.x()+x);
				v.y(v.y()+y-radiusy);
				return(v);
};
_vektor3<_tg> _pile::dropvy(){
				return(_vektor3<_tg>(0,game->cardheight,0));
};
_vektor3<_tg> _pile::dropvx(){
				return(_vektor3<_tg>(game->cardwidth,0,0));
};
_vektor3<_tg> _pile::dropvxarc(){
				_vektor3<_tg> h;
				_vektor3<_tg> v;
				_vektor3<_tg> n(0,0,-1);
				int c=anzahl();
				_tg w=(-c/2)*anglestep+90;
				h.setzen(game->cardwidth,0,0);
				rotieren(n,h,w-90,v);
				return(v);
};
_vektor3<_tg> _pile::dropvyarc(){
				_vektor3<_tg> h;
				_vektor3<_tg> v;
				_vektor3<_tg> n(0,0,-1);
				int c=anzahl();
				_tg w=(-c/2)*anglestep+90;
				h.setzen(0,game->cardheight,-game->solitaire->cardslope-2);
				rotieren(n,h,w-90,v);
				return(v);
};
void _pile::drop(){
				//drop the picklist to the pile pit && record the moves
				_tg i=0;
				_animationundo*m=game->createundo(30,0.1,true);
				if(game->picklist.anzahl()==13) if(game->preview==false) game->solitaire->smove->abspielen(1,0.95,1.05);
				while(game->picklist.erstes()){
				 _card*c=game->picklist.erstes()->objekt();
				 _pile*pilefrom=c->pile;
				 c->deinsertpick();
				 _vektor3<_tg> v;
				 _vektor3<_tg> dvx=dropvx();
				 _vektor3<_tg> dvy=dropvy();
				 c->curvespeed=20;
			 	 c->curvevx.setzen(c->vx,dvx,0,0,-2*i ,0,0,0);
			 	 c->curvevy.setzen(c->vy,dvy,0,0,-2*i ,0,0,0);
			     v=dropposition();
				 c->curveposition.setzen(c->position,v,0,0,-3,0,0,0);
			     c->startcurve();
			     //undo record move
			     _kurvehermite3<_tg> cupo;
			     _kurvehermite3<_tg> cuvx;
			     _kurvehermite3<_tg> cuvy;
			     cupo.ort(0,c->pickposition);
			     cupo.vektor(0,0,0,-10);
			 	 cupo.ort(1,c->curveposition.ort(1));
			 	 cupo.vektor(1,0,0,10);
			     cupo.aktualisieren();
				 cuvx.ort(0,c->pickvx);
				 cuvx.vektor(0,0,0,0);
				 cuvx.ort(1,c->curvevx.ort(1));
				 cuvx.vektor(1,0,0,0);
			     cuvx.aktualisieren();
				 cuvy.ort(0,c->pickvy);
				 cuvy.vektor(0,0,0,0);
				 cuvy.ort(1,c->curvevy.ort(1));
				 cuvy.vektor(1,0,0,0);
			     cuvy.aktualisieren();
				 m->use(c,this,true,0,0,0,pilefrom,true,0,0,0,cupo,cuvx,cuvy);
				 //end undo record move
				 c->deinsertpile();
				 c->deinsertpyramid();
				 c->deinsertlabyrinth();
				 c->deinsertarray();
				 c->deinsertsweetmatch();
				 c->insertpile(this,true);
				 i+=1;
				};
};
void _pile::adjustcardposition(){
				if(game->animationlist.erstes()==0){
				 positionfirst=position;
				 _card*it;
				 if(ende(it))do{
				  if((it->curving==false)&&(it->picked==false)) it->position=positionfirst;
				  positionfirst.z(positionfirst.z()-game->solitaire->cardthickness);
				 }while(vorheriges(it));
  				 positionfirstunstretched=positionfirst;
				};
};
void _pile::adjustcardpositionvector(){
				if(game->activepreparation()==false){
				 _vektor3<_tg> h;
				 _vektor3<_tg> j;
				 bool back=true;
				 positionfirst=position;
				 positionfirstunstretched=position;
				 _card*it=letztes();
				 if(it){
				  do{
				   bool tu=it->turnedup();
				   if((back)&&(tu)){
				    back=false;
				    positionfirst.z(positionfirst.z()-game->solitaire->cardtableaulift);
				    positionfirstunstretched.z(positionfirstunstretched.z()-game->solitaire->cardtableaulift);
				   };
				   if((it->curving==false)&&(it->picked==false)){
				    h=positionfirst*0.5;
				    it->position*=0.5;
				    it->position+=h;
				   };
				   if((it->curving)&&(it->picked==false)){
				    it->curveposition.ort(1,positionfirst);
				    it->curveposition.aktualisieren();
				   };
				   if(tu==false){//vorher : if(back !!!!!
				    h=vector*game->cardshiftback*stretchfactor;
				    positionfirst+=h;
				    h=vector*game->cardshiftback;
				    positionfirstunstretched+=h;
				    positionfirst.z(positionfirst.z()-game->solitaire->cardthickness);
				    positionfirstunstretched.z(positionfirstunstretched.z()-game->solitaire->cardthickness);
				   }else{ 
				    h=vector*game->cardshiftfront*stretchfactor;
				    positionfirst+=h;
				    h=vector*game->cardshiftfront;
				    positionfirstunstretched+=h;
				    positionfirst.z(positionfirst.z()-game->solitaire->cardthickness);
				    positionfirstunstretched.z(positionfirstunstretched.z()-game->solitaire->cardthickness);
				   };
				   it=it->vorheriges();if(it==letztes()) it=0;
				  }while(it);
				 };
				};
};
void _pile::adjustcardpositionarc(bool always){
				if((game->activepreparation()==false)||(always)){
				 _tg c=anzahl();
				 _tg i=0;
				 _vektor3<_tg> h;
				 _tg z=0;
				 _tg dz=0.001;
				 _card*cit;
				 if(anfang(cit))do{
				  cit->anglemust=((i-c/2)*anglestep)+90+anglestep/2;
				  h=position;
				  h.z((h.z()-game->solitaire->cardtableaulift-1.5)+z);
				  z=z+dz;
				  _tg x=cos(_ph*cit->angle)*radiusx;
				  _tg y=sin(_ph*cit->angle)*radiusy;
				  h.x(h.x()+x);
				  h.y(h.y()+(y-radiusy));
				  if((cit->curving==false)&&(cit->picked==false)){
				   cit->position+=h;
				   cit->position*=0.5;
				  }else{
				   cit->curveposition.ort(1,h);
				   cit->curveposition.aktualisieren();
				  };
				  cit->animateangle();
				  i=i+1;
				 }while(naechstes(cit));
				};
};
void _pile::adjustcardvy(){
				if(game->activepreparation()==false){
				 _card*c;
				 if(anfang(c))do{
				  if((c->curving==false)&&(c->picked==false)) c->vy.setzen(0,game->cardheight,0);
				 }while(naechstes(c));
				};
};
void _pile::adjustcardvx(){
				if((game->activepreparation()==false)&&(game->preview==false)){
				 _card*c=0;
				 _card*it=0;
				 it=erstes();
				 if((game->solitaire->mouseovercard)&&(it)){
				  _card*cfi=0;
				  if(game->picklist.anzahl()==0){
				   _card*cit;
	   			   if(anfang(cit))do{
	 			    if(cfi==0) if(cit->picked==false) if((cit->inner())&&(canpick(cit))) cfi=cit;
				   }while(naechstes(cit));
				  };
				  if(cfi){
				   do{
				    c=it;
				    if((c->picked==false)&&(game->allowpick)){
				     c->neigungx=-(game->solitaire->cardslopepick*0.1-c->neigungx*0.9);
				     c->neigungactive=true;
				    };
				    it=it->naechstes();if(it==erstes()) it=0;
				   }while((it)&&(c!=cfi));//Until it=0 || c=cfi
				   if(it){
				    do{
				     c=it;
				     if(c->picked==false){
				      c->neigungx*=0.9;
				      c->neigungactive=false;
				     };
				     it=it->naechstes();if(it==erstes()) it=0;
				    }while(it);
				   };
				  }else{
				   do{
				    c=it;
				    if(c->picked==false){
				     if(canpick(c)==false) c->neigungx*=0.35;
				     c->neigungx*=0.9;
				     c->neigungactive=false;
				    };
				    it=it->naechstes();if(it==erstes()) it=0;
				   }while(it);
				  };
				 };
				};
};
void _pile::adjustcardvxsingle(){
				if((game->activepreparation()==false)&&(game->preview==false)){
				 _card*it=erstes();
				 if((game->solitaire->mouseovercard)&&(it)){
				  _card*cfi=0;
				  _card*c;
				  if(game->picklist.anzahl()==0){
	   			   if(anfang(c))do{
	 			    if(cfi==0) if(c->picked==false) if((c->inner())&&(canpick(c))) cfi=c;
				   }while(naechstes(c));
				  };
				  if(anfang(c))do{
				   if(c==cfi){
				    if((c->picked==false)&&(game->allowpick)){
				     c->neigungx=-(game->solitaire->cardslopepick*0.1-c->neigungx*0.9);
				     c->neigungactive=true;
				    };
				   }else{
				    if(c->picked==false){
				     c->neigungx*=0.9;
				     c->neigungactive=false;
				    };
				   };
				  }while(naechstes(c));
				 };
				};
};
void _pile::setangle(_card*c){
};
void _pile::setanglearc(_card*c){
				c->angle=((_tg(c->index())-_tg(anzahl())/2)*anglestep)+90;
				c->anglemust=c->angle;
};
void _pile::adjustcardvxarc(bool always){
				if((game->activepreparation()==false)||(always)){
				 _tg c=anzahl();
				 _tg i=0;
				 _vektor3<_tg> h;
				 _vektor3<_tg> j;
				 _vektor3<_tg> n(0,0,-1);
				 _card*cit;
	   			 if(anfang(cit))do{
				  _tg w=((i-c/2)*anglestep)+90;
	     		  h.setzen(game->cardwidth,0,0);
	 			  rotieren(n,h,w-90,j);
	  			  if((cit->curving==false)&&(cit->picked==false)){
	 			   cit->vx+=j;
				   cit->vx*=0.5;
				  }else{
				   cit->curvevx.ort(1)+=j;
				   cit->curvevx.ort(1)*=0.5;
				  };
				  i=i+1;
				 }while(naechstes(cit));
				};
};
void _pile::adjustcardvyarc(bool always){
				if((game->activepreparation()==false)||(always)){
				 _tg c=anzahl();
				 _tg i=0;
				 _vektor3<_tg> h;
				 _vektor3<_tg> j;
				 _vektor3<_tg> n(0,0,-1);
				 _card*cit;
	   			 if(anfang(cit))do{
				  _tg w=((i-c/2)*anglestep)+90;
	     		  h.setzen(0,game->cardheight,-game->solitaire->cardslope-2);
	 			  rotieren(n,h,w-90,j);
	  			  if((cit->curving==false)&&(cit->picked==false)){
	 			   cit->vy+=j;
				   cit->vy*=0.5;
				  }else{
				   cit->curvevy.ort(1)+=j;
				   cit->curvevy.ort(1)*=0.5;
				  };
				  i=i+1;
				 }while(naechstes(cit));
				};
};
void _pile::animatemouseovercardarc(){
				_card*cfi=0;
				_card*cit;
				if(game->solitaire->mouseovercard){
				 if(game->picklist.anzahl()==0){
	   			  if(anfang(cit))do{
	 			   if(cfi==0) if(cit->picked==false) if(cit->inner()) cfi=cit;
				  }while(naechstes(cit));
				 };
				};
				_card*c;
				if(anfang(c))do{
				 if((c==cfi)&&(game->allowpick)&&(c->canpick())){
				  c->neigungx=-(game->solitaire->cardslopepick*0.1-c->neigungx*0.9);
				 }else{
				  c->neigungx*=0.9;
				 };
				 c->animate();
				}while(naechstes(c));
};
void _pile::animatestretch(){
				_tg d=stretch-stretchfactor;
				d*=stretchhaerte;
				stretchvector+=d;
				stretchfactor+=stretchvector;
				stretchvector*=stretchfriction;
};
void _pile::animatepileinfo(){
				_tg nt=game->solitaire->clock->system();
				if((game->solitaire->mouseoverpile)&&(game->ended==false)&&(game->inuse)&&(game->picklist.erstes()==0)){
				 _card*cit;
				 if(anfang(cit))do{
				  if((cit->inner())&&(cit->curving==false)){
				   if(showdescription){
				    game->pileinfo=this;
				    game->pileinfoopacity=1;
				    game->pileinfotime=nt;
				    game->pileinfoname=name;
				    game->pileinfodescription0=description0;
				    game->pileinfodescription1=description1;
				   };
				  };
				 }while(naechstes(cit));
				 if(game->pileinfo==0){
				  if(inner(false)){
				   if(showdescription){
				    game->pileinfo=this;
				    game->pileinfoopacity=1;
				    game->pileinfotime=nt;
				    game->pileinfoname=name;
				    game->pileinfodescription0=description0;
				    game->pileinfodescription1=description1;
				   };
				  };
				 };
				};
};
void _pile::animateinput(){
				_tg mx=game->solitaire->mouse.x();
				_tg my=game->solitaire->mouse.y();
				bool mb[2]={game->solitaire->mousebutton[0],game->solitaire->mousebutton[1]};
				_card*cf=0;
				_card*cit;
				if((game->allowpick)&&(game->animationlist.erstes()==0)){// && game->solitaire->iggsystem->mouseovergui()=false
				 if((mb[0])||(mb[1])){
				  if(anfang(cit))do{
				   if((cit->inner())&&(cit->picked==false)&&(cf==0)) cf=cit;
				  }while(naechstes(cit));
				  if(cf){
				   if(cf->turnedup()==false){
				    if(cf->canturn()){
				     cf->turn();
				     game->startusing();
			  	    };
				   }else{
				    //------------------------------- pick und autoplay check left -------------
				    if(mb[0]){
				     bool doppel=false;
				     if(cf->clickleft==false){
				      if((game->solitaire->clock->system()-cf->clicktime)<300) doppel=true;
				      cf->clickleft=true;
				      cf->clicktime=game->solitaire->clock->system();
				     };
				     if(doppel){
				      if(game->solitaire->clickplaydouble){
				       if(cf->pile->canpick(cf)){
				        game->clickplay(cf);
				        cf->doubleclicked=true;
				       };
				      };
				     }else{
				      if(cf->canpick()){
				       if(cf->picked==false){
				        cf->insertpick();
				       };
				      }; 
				     };
				    };
				    //------------------------------- autoplay check right ----------------------
		            if((cf->curving==false)&&(mb[1])&&(cf->canpick())&&(game->solitaire->clickplayright)) game->clickplay(cf);
			       };//turnedup
			      };//cf
			     };//mbx
				 if(anfang(cit))do{
				  if(mb[0]==false){
				   if(cit->clickleft){
				    cit->clickleft=false;
				   };
				  };
				 }while(naechstes(cit));
				};
};
void _pile::animatetableaufill(){
				if((tableaufill)&&(game->automoveundodelay==false)&&(erstes())&&(game->animationlist.erstes()==0)){
				 _piletableau*pt=0;
				 _piletableau*tit;
				 if(game->piletableaulist.anfang(tit))do{
				  if((pt==0)&&(tit->erstes()==0)) pt=tit;
				 }while(game->piletableaulist.naechstes(tit));
				 if(pt){
				  _liste<_card> l;
				  l.einhaengen(erstes());
				  _animationpiletopile*a=new _animationpiletopile(game,&l,pt,game->solitaire->autospeed,0.1,true,true,true);
				  a->undoconstantsort=false;
				  a->skipable=false;
				 };
				};
};
void _pile::savepile(_datei*d){
				d->speichern(position);
				d->speichern(positionfirst);
				d->speichern(positionfirstunstretched);
				d->speichern(camerastretch);
				d->speichern(stretchfactor);
				d->speichern(stretch);
				d->speichern(stretchvector);
				d->speichern(stretchhaerte);
				d->speichern(stretchfriction);
				d->speichern(maximumlength);
				d->speichern(radiusx);
				d->speichern(radiusy);
				d->speichern(anglestep);
				d->speichern(drawownshadow);
				d->speichern(vector);
				d->speichern(nopickifcardcurving);
				d->speichern(discardcount);
				d->speichern(giverestriction);
				d->speichern(giverestrictionfreecell);
				d->speichern(givesamesuit);
				d->speichern(giveothersuit);
				d->speichern(givealteratecolor);
				d->speichern(givedescending);
				d->speichern(giveascending);
				d->speichern(givemaximal);
				d->speichern(takerestriction);
				d->speichern(takesamesuit);
				d->speichern(takeothersuit);
				d->speichern(takealteratecolor);
				d->speichern(takeascending);
				d->speichern(takedescending);	
				d->speichern(takeboth);
				d->speichern(takewrapped);
				d->speichern(takemirrored);
				d->speichern(takeemptysuit);
				d->speichern(takeemptynumber);
				d->speichern(takeemptymaximal);
				d->speichern(takeemptyrestriction);
				d->speichern(takemaximal);
				d->speichern(tableaufill);
				d->speichern(redealvalue);
				d->speichern(redealcount);
				d->speichern(showdescription);
				d->speichern(flag);
				d->speichern(anzahl());
				_card*c;
				if(anfang(c))do{
				 c->save(d);
				}while(naechstes(c));
};
void _pile::loadpile(_datei*d){
				d->laden(position);
				d->laden(positionfirst);
				d->laden(positionfirstunstretched);
				d->laden(camerastretch);
				d->laden(stretchfactor);
				d->laden(stretch);
				d->laden(stretchvector);
				d->laden(stretchhaerte);
				d->laden(stretchfriction);
				d->laden(maximumlength);
				d->laden(radiusx);
				d->laden(radiusy);
				d->laden(anglestep);
				d->laden(drawownshadow);
				d->laden(vector);
				d->laden(nopickifcardcurving);
				d->laden(discardcount);
				d->laden(giverestriction);
				d->laden(giverestrictionfreecell);
				d->laden(givesamesuit);
				d->laden(giveothersuit);
				d->laden(givealteratecolor);
				d->laden(givedescending);
				d->laden(giveascending);
				d->laden(givemaximal);
				d->laden(takerestriction);
				d->laden(takesamesuit);
				d->laden(takeothersuit);
				d->laden(takealteratecolor);
				d->laden(takeascending);
				d->laden(takedescending);	
				d->laden(takeboth);
				d->laden(takewrapped);
				d->laden(takemirrored);
				d->laden(takeemptysuit);
				d->laden(takeemptynumber);
				d->laden(takeemptymaximal);
				d->laden(takeemptyrestriction);
				d->laden(takemaximal);
				d->laden(tableaufill);
				d->laden(redealvalue);
				d->laden(redealcount);
				d->laden(showdescription);
				d->laden(flag);
				_listebasis<_card>::loeschen();
				unsigned int cc;
				d->laden(cc);
				for(unsigned int i=0;i<cc;i++){
				 _card*cit=new _card(game->solitaire,game,0,0);
				 cit->insertpile(this);
				 _zeichenkette<char> typ;
				 d->laden(typ);
				 cit->load(d);
				};
				updatemesh();
};
//******************************************************************************************************************
//										P I L E T A B L E A U 
//******************************************************************************************************************
_piletableau::_piletableau(_game*g,_tg px,_tg py):_pile(g,px,py),_listenknotenbasis<_piletableau>(&g->piletableaulist){
				name=strpiletableau;
				//createshadow();
				drawownshadow=false;
};
_piletableau::~_piletableau(){
				L->schreiben("PILETABLEAU DESTRUKTOR");
};
void _piletableau::draw(_grafik*gra,_kamera<_tg>*cam){
				mesh->erzeugenvertexlicht();
	    		//_licht<_tg,_to>*lit;
	    		//if(game->solitaire->world->anfang(lit))do{
				// mesh->determinevertexlight(lit);
				//}while(game->solitaire->world->naechstes(lit));
				mesh->zeichnen(gra);
				int s=takeemptysuit;
				int n=takeemptynumber;
				_polygon*pit;

				if(s!=-1){
				 if(meshsuit->anfang(pit))do{
				  pit->textur(game->solitaire->tsymbolsuit[s]);
				 }while(meshsuit->naechstes(pit));
				 meshsuit->erzeugenvertexlicht();
	    		 //if(game->solitaire->world->anfang(lit))do{
				 // meshsuit->determinevertexlight(lit);
				 //}while(game->solitaire->world->naechstes(lit));
				 meshsuit->zeichnen(gra);
				};
				if(n!=-1){
				 if(meshnumber->anfang(pit))do{
				  pit->textur(game->solitaire->tsymbolnumber[n]);
				 }while(meshnumber->naechstes(pit));
				 meshnumber->erzeugenvertexlicht();
	    		 //if(game->solitaire->world->anfang(lit))do{
				 // meshnumber.determinevertexlight(lit);
				 //}while(game->solitaire->world->naechstes(lit));
				 meshnumber->zeichnen(gra);
				};
};
bool _piletableau::canpick(_card*c){
				//apply the pickrule states (pilegive)
				_card*cit=0;
				if(giverestriction) return(false);
				if(c->vorheriges()==letztes()){ 
				 return(true);//das ist die erste karte im stapel
				}else{
				 //turn check
				 if(c->turnedup()==false) return(false);
				 //turn check in prev sequence
				 cit=c;
				 while(vorheriges(cit)){
				  if(cit->turnedup()==false) return(false);
				 };
				 //givemaximal check
				 if(givemaximal!=-1){
				  int wg=c->index()+1;
				  if(wg>givemaximal) return(false);
				 };
				 //checksuit
				 int actsuit;
				 if(givesamesuit){
				  cit=c;
				  while(vorheriges(cit)){
				   if(c->suit!=cit->suit) return(false);
				  };
				 };
				 if(giveothersuit){
				  actsuit=c->suit;
				  cit=c;
				  while(vorheriges(cit)){
				   if(actsuit==cit->suit) return(false);
				   actsuit=cit->suit;
				  };
				 }; 
				 if(givealteratecolor){
				  actsuit=c->suit;
				  cit=c;
				  while(vorheriges(cit)){
				   if(actsuit==0) if((cit->suit==0)||(cit->suit==3)) return(false);
				   if(actsuit==1) if((cit->suit==1)||(cit->suit==2)) return(false);
				   if(actsuit==2) if((cit->suit==1)||(cit->suit==2)) return(false);
				   if(actsuit==3) if((cit->suit==0)||(cit->suit==3)) return(false);
				   actsuit=cit->suit;
				  };
				 };
				 //check numbers
				 int actnumber=c->number;
				 if(givedescending){
				  cit=c;
				  while(vorheriges(cit)){
				   if(cit->number!=(actnumber-1)) return(false);
				   actnumber-=1;
				  };
				 };
				 if(giveascending){
				  cit=c;
				  while(vorheriges(cit)){
				   if(cit->number!=(actnumber+1)) return(false);
				   actnumber+=1;
				  };
				 };
				 //check special freecell pick
				 if(giverestrictionfreecell){//game->freecellpickrestriction
				  if(game->hasfreecells()){
				   int cf=game->countfreefreecells();
				   int cp=0;
				   cit=c;
				   while(vorheriges(cit)) cp++;
				   if(cp>cf) return(false);
				  };
				 };
				};
				return(true);
};
bool _piletableau::candrop(_liste<_card>*list,bool samesuit){
				//can the picked be dropped on the pile?
				//apply the droprule states (piletake)
				if(takerestriction) return(false);
				if((takeemptyrestriction)&&(anzahl()==0)) return(false);
				if(takemaximal!=-1){
				 if(int(anzahl())>=takemaximal) return(false);
				};
				if(takeemptymaximal!=-1){
				 if(anzahl()==0){
				  if(int(list->anzahl())>takeemptymaximal) return(false);
				 };
				};
				if(list->anzahl()>0){
				 _card*cp=list->erstes()->objekt();
				 _card*cit=erstes();
				 if(cit){
				   if(cit->turnedup()==false) return(false);
				   if(samesuit==false){//zur vereinfachung der tipp-algorithmik im spidertyp
				    if(takesamesuit) if(cit->suit!=cp->suit) return(false);
					if(takeothersuit) if(cit->suit==cp->suit) return(false);
				    if(takealteratecolor){
				     if(cit->suit==0) if((cp->suit==0)||(cp->suit==3)) return(false);
				     if(cit->suit==1) if((cp->suit==1)||(cp->suit==2)) return(false);
				     if(cit->suit==2) if((cp->suit==1)||(cp->suit==2)) return(false);
				     if(cit->suit==3) if((cp->suit==0)||(cp->suit==3)) return(false);
				    };
				   }else{
				    if(cit->suit!=cp->suit) return(false);
				   };
				   if(takedescending){
				    if(cit->number!=(cp->number+1)) return(false);
				   };
				   if(takeascending){
				    if(cit->number!=(cp->number-1)) return(false);
				   };
				 }else{//empty pile
				  if(takeemptysuit!=-1) if(cp->suit!=takeemptysuit) return(false);
				  if(takeemptynumber!=-1) if(cp->number!=takeemptynumber) return(false);
				 };
				 return(true);
				};
				return(false);
};
_vektor3<_tg> _piletableau::dropposition(bool backdrop){
			    return(droppositionvector(backdrop));
};
_vektor3<_tg> _piletableau::dropvy(){
				return(_vektor3<_tg>(0,game->cardheight,-game->solitaire->cardslope));
};	
void _piletableau::adjustcardposition(){
				adjustcardpositionvector();
};
void _piletableau::adjustcardvy(){
                _card*c;
	   			if(anfang(c))do{
	 			 if((c->curving==false)&&(c->picked==false)){
	 			  if(c->turnedup()){
	     		   c->vy.setzen(0,game->cardheight,-game->solitaire->cardslope);
	  			  }else{
	  			   c->vy.setzen(0,game->cardheight,0);
	 			  };
	 			 };
				}while(naechstes(c));
};
void _piletableau::animate(_zeit*c){
				//set the stretch dependent To the intersection
				if((game->statsclosed==false)&&(discardcount)) game->discards+=cardcount();
				adjustcardposition();
				if(game->activepreparation()==false){
				 adjustcardvy();
				 adjustcardvx();
				 if((camerastretch)||(game->mode>0)){
				  _kamera<_tg>*cam=game->solitaire->cam;
				  _tg pox=position.x();
				  _tg poy=position.y();
				  _tg poz=positionfirstunstretched.z();
				  _tg pvx=positionfirstunstretched.x()-position.x();
				  _tg pvy=positionfirstunstretched.y()-position.y();
				  _tg pvz=0;
				  _tg ox=cam->x();
				  _tg oy=cam->y();
				  _tg oz=cam->z();
				  _tg vx=cam->vektor().x()+cam->ebene(0).x();
				  _tg vy=cam->vektor().y()-cam->ebene(1).y();
				  _tg vz=cam->vektor().z()-cam->ebene(1).z();
				  _tg ex;
				  _tg ey;
				  _tg ez;
				  _tg D;
				  _tg alpha=0;
				  stretch=1;
				  bool clipped=false;
				  //-------------------------------- an der unteren kante clippen
				  if(pvy<0){
				   D=determinieren2(vy,vz,-pvy,-pvz);
				   if(fabs(D)>nahenull){
				    ey=poy-oy;
				    ez=poz-oz;
				    alpha=determinieren2(vy,vz,ey,ez)/D;
				    if((alpha<=1)&&(alpha>0)){
				     if(alpha<stretch){
				      stretch=alpha;
				      clipped=true;
				     };
				    };
				   };
				  };
				  //-------------------------------- an der oberen kante clippen
				  if(pvy>0){
				   D=determinieren2(-vy,-vz,-pvy,-pvz);
				   if(fabs(D)>nahenull){
				    ey=poy-oy;
				    ez=poz-oz;
				    alpha=determinieren2(-vy,-vz,ey,ez)/D;
				    if((alpha<=1)&&(alpha>0)){
				     if(alpha<stretch){
				      stretch=alpha;
				      clipped=true;
				     };
				    };
				   };
			 	  };
				  vz=cam->vektor().z()-cam->ebene(0).z();
				  if(pvx>0){
				   //-------------------------------- an der rechten kante clippen
				   D=determinieren2(vx,vz,-pvx,-pvz);
				   if(fabs(D)>nahenull){
				    ex=pox-ox;
				    ez=poz-oz;
				    alpha=determinieren2(vx,vz,ex,ez)/D;
				    if((alpha<=1)&&(alpha>0)){
				     if(alpha<stretch){
				      stretch=alpha;
				      clipped=true;
				     };
				    };
				   };
				  };
				  if(pvx<0){
				   //-------------------------------- an der linken kante clippen
				   D=determinieren2(-vx,-vz,-pvx,-pvz);
				   if(fabs(D)>nahenull){
				    ex=pox-ox;
				    ez=poz-oz;
				    alpha=determinieren2(-vx,-vz,ex,ez)/D;
				    if((alpha<=1)&&(alpha>0)){
				     if(alpha<stretch){
				      stretch=alpha;
				      clipped=true;
				     };
				    };
				   };
				  };
				 }else{
				  _vektor3<_tg> h=positionfirstunstretched-position;
				  _tg l=h.laenge();
				  if(l>(maximumlength*game->scaleglobal)) stretch=(maximumlength*game->scaleglobal)/l; else stretch=1;
				 };
				}else{ 
				 stretch=1;
				};
				animatestretch();
				animatepileinfo();
				animateinput();
				_card*cit;
				if(anfang(cit))do{
				 cit->animate();
				}while(naechstes(cit));
				if(giverestrictionfreecell) updatedescription();
				//updateshadow();
};
void _piletableau::createshadow(){
				//createshadowstripe();
};
void _piletableau::updateshadow(){
				//updateshadowstripe();
};
void _piletableau::updatedescription(){
				_zeichenkette<_tt> d=L"";
				if(takedescending) d=strpiletakedescending;
				if(takeascending) d=strpiletakeascending;
				if((takeboth)&&(takeascending==false)&&(takedescending==false)) d=strpiletakeboth;
				if(takealteratecolor) d+=strpiletakealteratecolor;
				if(takesamesuit) d+=strpiletakesamesuit;
				if(takeothersuit) d+=strpiletakeothersuit;
				if(d!=L"") d+=strpileplace;
				if(takewrapped){
				 if(takeboth){
				  d+=strpiletakewrapped;
				 }else{ 
				  if(takedescending) d+=strpiletakewrappeddescending;
				  if(takeascending) d+=strpiletakewrappedascending;
				 };
				};
				if(takerestriction) d+=strpiletakerestriction;
				if(takemaximal!=-1){
				 if(takemaximal==1){
				  d+=strpiletakemaximalsingular;
				 }else{
				  d+=strpiletakemaximalplural0+takemaximal+strpiletakemaximalplural1;
				 };
				};
				description0=d;
				description1=L"";
				if(giverestrictionfreecell){
				 int cf=1;
				 if(game->hasfreecells()) cf+=game->countfreefreecells();
				 description1+=strpilefreecellpickrestriction0+cf+strpilefreecellpickrestriction1;
				};
};
void _piletableau::save(_datei*d){
				d->speichern(_zeichenkette<char>("_piletableau"));
				d->speichern(speichername());
				savepile(d);
};
void _piletableau::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
};
void _piletableau::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};
//******************************************************************************************************************
//										P I L E C R U E L 
//******************************************************************************************************************
_pilecruel::_pilecruel(_game*g,_tg px,_tg py):_piletableau(g,px,py){
				name=strpiletableau;
				//createshadow();
				drawownshadow=false;
				takeemptyrestriction=true;
				givemaximal=1;
};
_pilecruel::~_pilecruel(){
};
bool _pilecruel::canpick(_card*c){
				//only first card can be picked up
				if(giverestriction) return(false);
				if(c->vorheriges()==letztes()) return(true);
				return(false);
};
bool _pilecruel::candrop(_liste<_card>*list,bool samesuit){
				//only one card of same suit an right order
				if(takerestriction) return(false);
				if(list->anzahl()!=1) return(false);
				_card*c=list->erstes()->objekt();
				if(c){
				 if(anzahl()==0){
				  if(takeemptyrestriction) return(false); else return(true);
				 }else{
				  _card*cf=erstes();
				  if(cf->suit!=c->suit) return(false);
				  if(takeascending) if(c->number==(cf->number+1)) return(true);
				  if(takedescending) if(c->number==(cf->number-1)) return(true);
				  if(takeboth) if(abs(c->number-cf->number)==1) return(true);
				  if(takewrapped){
				   if((c->number==12)&&(cf->number==0)) return(true);
				   if((c->number==0)&&(cf->number==12)) return(true);
				  };
				 };
				};
				return(false);
};
_vektor3<_tg> _pilecruel::dropvy(){
				return(_vektor3<_tg>(0,game->cardheight,0));
};
_vektor3<_tg> _pilecruel::dropposition(bool backdrop){
				_vektor3<_tg> v=position;
				v.z(v.z()-game->solitaire->cardtableaulift);
				v.z(v.z()-game->solitaire->cardthickness*_tg(anzahl()));
				return(v);
};
void _pilecruel::adjustcardposition(){
				if(game->activepreparation()==false){
				 bool back=true;
				 _tg t=game->solitaire->cardthickness;
				 positionfirst=position;
				 positionfirstunstretched=position;
				 _card*it;
				 if(ende(it))do{
				  bool tu=it->turnedup();
				  if((back)&&(tu)){
				   back=false;
				   positionfirst.z(positionfirst.z()-game->solitaire->cardtableaulift);
				   positionfirstunstretched.z(positionfirstunstretched.z()-game->solitaire->cardtableaulift);
				  };
				  if((it->curving==false)&&(it->picked==false)){
				   it->position=positionfirst;
				  };
				  if((it->curving)&&(it->picked==false)){
				   it->curveposition.ort(1,positionfirst);
				   it->curveposition.aktualisieren();
				  };
				  positionfirst.z(positionfirst.z()-t);
				  positionfirstunstretched.z(positionfirstunstretched.z()-t);
				 }while(vorheriges(it));
				};
};
void _pilecruel::animate(_zeit*c){
				animateinput();
				adjustcardposition();
				adjustcardvx();
				adjustcardvy();
				int i=0;
				_card*cit;
				if(anfang(cit))do{
				 if(i>0) cit->neigungx=0;
				 cit->animate();
				 i++;
				}while(naechstes(cit));
				animatepileinfo();
				updateshadow();
				//updatedescription();
};
void _pilecruel::createshadow(){
				//createshadowblock();
};
void _pilecruel::updateshadow(){
				//updateshadowblock();
};
void _pilecruel::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilecruel"));
				d->speichern(speichername());
				savepile(d);
};
void _pilecruel::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
};
void _pilecruel::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};

//******************************************************************************************************************
//										P I L E A C E S U P 
//******************************************************************************************************************
_pileacesup::_pileacesup(_game*g,_tg px,_tg py):_piletableau(g,px,py){
};
_pileacesup::~_pileacesup(){
};
bool _pileacesup::canpick(_card*c){
				//only first card can be picked up
				if(giverestriction) return(false);
				if(c->vorheriges()==letztes()) return(true);
				return(false);
};
bool _pileacesup::candrop(_liste<_card>*list,bool samesuit){
				if(anzahl()>0){
				 return(false);
				}else{
				 if(list->anzahl()==1) return(true);
				};
				return(false);
};
void _pileacesup::animate(_zeit*c){
				//set the stretch dependent To the intersection
				adjustcardposition();
				if(game->animationlist.erstes()==0) adjustcardvy();
				adjustcardvx();
				if(game->statsclosed==false){
				 if(anzahl()==1){
				  _card*cit=erstes();
				  if(cit->number==0) game->discards++;
				 };
				};
				if(game->activepreparation()==false){
				 _kamera<_tg>*cam=game->solitaire->cam;
				 _tg poy=position.y();
				 _tg poz=positionfirstunstretched.z();
				 _tg pvy=positionfirstunstretched.y()-position.y();
				 _tg pvz=0;
				 _tg oy=cam->y();
				 _tg oz=cam->z();
				 _tg vy=cam->vektor().y()-cam->ebene(0).y();
				 _tg vz=cam->vektor().z()-cam->ebene(0).z();
				 if(fabs(pvy)>nahenull){
				  _tg D=determinieren2(vy,vz,-pvy,-pvz);
				  if(fabs(D)>nahenull){
				   _tg ey=poy-oy;
				   _tg ez=poz-oz;
				   _tg alpha=determinieren2(vy,vz,ey,ez)/D;
				   if(alpha<=1){
				    //nun stretch anpassen
				    stretch=alpha;
				   }else{ 
				    if(stretch<1) stretch=1;
				   };
				  };
				 }else{
				  stretch=1;
				 };
				}else{ 
				 stretch=1;
				};
				animatestretch();
				animateinput();
				_card*cit;
				if(anfang(cit))do{
				 cit->animate();
				}while(naechstes(cit));
				animatepileinfo();
				updateshadow();
};
void _pileacesup::createshadow(){
				//createshadowstripe();
};
void _pileacesup::updateshadow(){
				//updateshadowstripe();
};
void _pileacesup::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pileacesup"));
				d->speichern(speichername());
				savepile(d);
};
void _pileacesup::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
};
void _pileacesup::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};

//******************************************************************************************************************
//										P I L E S T O C K 
//******************************************************************************************************************
_pilestock::_pilestock(_game*g,_tg px,_tg py,int tpc,int twc,int tfc,bool tlc):_pile(g,px,py),_listenknotenbasis<_pilestock>(&g->pilestocklist){
                tableaucount=-1;
                verticalredeal=false;
                status=0;
                open=false;
                backsort=false;
                backsorttime=0;
                backsortintervall=50;//ms
                backsortakku=0;
                backsortpilewastecount=0;
                backsortundo=0;
                wastepartner=0;
                wasteiteration=false;
				topilecount=tpc;
				towastecount=twc;
				tofoundationcount=tfc;
				tolabyrinthcount=tlc;
				name=strpilestock;
				//createshadow();
				drawownshadow=false;
};
_pilestock::~_pilestock(){
				L->schreiben("PILESTOCK DESTRUKTOR");
};
_pilewaste*_pilestock::waste(){
				return(game->pilewaste(wastepartner));
};
void _pilestock::draw(_grafik*gra,_kamera<_tg>*cam){
				mesh->erzeugenvertexlicht();
	    		//_licht<_tg,_to>*lit;
	    		//if(game->solitaire->world->anfang(lit))do{
				// mesh->determinevertexlight(lit);
				//}while(game->solitaire->world->naechstes(lit));
				mesh->zeichnen(gra);
				if(canredeal()==false){
				 meshsuit->textur(game->solitaire->tsymbolfine);
				 meshsuit->erzeugenvertexlicht();
	    		 //if(game->solitaire->world->anfang(lit))do{
				 // meshsuit->determinevertexlight(lit);
				 //}while(game->solitaire->world->naechstes(lit));
				 meshsuit->zeichnen(gra);
				}else{
				 if(redealvalue!=-1){
				  meshsuit->textur(game->solitaire->tnumber[(redealvalue-redealcount)]);
				  meshsuit->erzeugenvertexlicht();
	    		  //if(game->solitaire->world->anfang(lit))do{
				  // meshsuit->determinevertexlight(lit);
				  //}while(game->solitaire->world->naechstes(lit));
				  meshsuit->zeichnen(gra);
				 };
				};
};
void _pilestock::deal(){
				if(towastecount>0){
				 if(waste()==0) return;//no waste, error
				 if(game->picklist.erstes()==0){
				  if(anzahl()>0){
				   if(game->preview==false) game->solitaire->sturn->abspielen(0.8,0.95,1.05);
				   _animationundo*m=0;
				   if(erstes()) m=game->createundo(20,0.1);
				   for(int cw=0;cw<towastecount;cw++){
				    _pile*pit=waste();
				    _card*c;
				    if(anfang(c)){
				     c->deinsertpile();
				     c->insertpile(pit,true);
				     _vektor3<_tg> v=pit->dropposition();
                     c->curvespeed=15;
				     c->curveposition.setzen(c->position,v,-_tg(cw)*7,0,-10,0,0,10);
				     if(open) c->curvevx.setzen(c->vx, c->vx, 0,0,-10,0,0,10); else c->curvevx.setzen(c->vx, -c->vx, 0,0,-10,0,0,10);
				     c->curvevy.setzen(c->vy,c->vy,0,0,-10,0,0,0);
				     c->startcurve();
				     m->use(c,pit,true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				     if(wasteiteration){
				     wastepartner+=1;
				     if(wastepartner>int(game->pilewastelist.anzahl()-1)) wastepartner=0;
				    };
				    };
		 		   };
				  }else{ 
				   if((nocardcurving())&&(nocardcurvinginwaste())&&(backsort==false)){
				    if(canredeal()){
				     redealcount+=1;
				     if(game->preview==false) game->solitaire->smove->abspielen(0.8,0.95,1.05);
				     backsort=true;
				     backsortundo=game->createundo(30,30);
					 backsortundo->redealdelta=-1;
					 backsortundo->redealpile=this;
				     backsorttime=game->solitaire->clock->system();
				     backsortpilewastecount=cardcountwastes();
				    };
				   };
				  };
			 	 };
				};
				if(topilecount>0){
				 if(game->picklist.erstes()==0){
				  _animationundo*m=0;
				  if(erstes()) m=game->createundo(25,0.1);
				  _piletableau*pit;
				  if(game->piletableaulist.anfang(pit))do{
				   for(int ct=0;ct<topilecount;ct++){
				    _card*c;
				    if(anfang(c)){
				     c->deinsertpile();
				     _vektor3<_tg> v=pit->dropposition();
				     _vektor3<_tg> vvx=pit->dropvx();
				     _vektor3<_tg> vvy=pit->dropvy();
				     c->insertpile(pit,true);
				     c->curvespeed=25;
				     c->curveposition.setzen(c->position,v,0,0,-20,0,0,20);
				     c->curvevx.setzen(c->vx,vvx,0,0,-10,0,0,10);
				     c->curvevy.setzen(c->vy,vvy,0,0,0,0,0,0);
				     c->startcurve();
				 	 m->use(c,pit,true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				     pit->setangle(c);
				    };
				   };
		 		  }while(game->piletableaulist.naechstes(pit));
			 	 };
			     if(tableaucount!=-1){
			      tableaucount-=1;
				  if(tableaucount==0){
				   tableaucount=-1;
			       topilecount=0;
			 	   towastecount=1;
				  };
				  updatedescription();
				 };
				};
				if(tofoundationcount>0){
				 if(game->picklist.erstes()==0){
				  _animationundo*m=0;
				  if(erstes()) m=game->createundo(25,0.1);
				  if(game->preview==false) game->solitaire->sturn->abspielen(0.8,0.95,1.05);
				  _pilefoundation*pit;
				  if(game->pilefoundationlist.anfang(pit))do{
				   for(int cf=0;cf<tofoundationcount;cf++){
				    _card*c;
				    if(anfang(c)){
				     c->deinsertpile();
				     _vektor3<_tg> v=pit->dropposition();
				     c->insertpile(pit,true);
				     c->curvespeed=25;
				     c->curveposition.setzen(c->position, v, 0,0,-20,0,0,20);
				     c->curvevx.setzen(c->vx, -c->vx, 0,0,-10,0,0,10);
				     c->curvevy.setzen(c->vy, c->vy, 0,0,0,0,0,0);
				     c->startcurve();
				 	 m->use(c,pit,true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				    };
				   };
		 		  }while(game->pilefoundationlist.naechstes(pit));
			 	 };
				};
				if(tolabyrinthcount){
				 if(game->picklist.erstes()==0){
				  _animationundo*m=0;
				  if(erstes()) m=game->createundo(25,0.1);
				  _pilelabyrinth*lit;
				  if(game->pilelabyrinthlist.anfang(lit))do{
				   if(lit->hasfreeline()){
				    int ll=lit->freeline();
  				    for(int i=0;i<lit->dimx;i++){
  				     _card*c;
				     if(anfang(c)){
				      c->deinsertpile();
				      _vektor3<_tg> v=lit->droppositionat(i,ll);
				      c->insertpile(lit,true);
				 	  c->insertlabyrinth(lit,i,ll);
		 			  c->curvespeed=25;
				      c->curveposition.setzen(c->position, v, 0,0,-20,0,0,20);
				      c->curvevx.setzen(c->vx, -c->vx, 0,0,-10,0,0,10);
				      v=lit->dropvy();
				      c->curvevy.setzen(c->vy, v, 0,0,0,0,0,0);
				      c->startcurve();
				  	  m->use(c,lit,true,c->labindex[0],c->labindex[1],0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				     };
				    };
				   };
				  }while(game->pilelabyrinthlist.naechstes(lit));
				 };
				};
				updatedescription();
};
bool _pilestock::canpick(_card*c){
				return(false);
};
bool _pilestock::candrop(_liste<_card>*list,bool samesuit){
				return(false);
};
bool _pilestock::candeal(){
				return(nocardcurving());
};
bool _pilestock::canredeal(){
				if(redealvalue==-1){
				 return(true);
				}else{
				 if(redealcount<redealvalue) return(true);
				};
				return(false);
};
int _pilestock::cardcountinwaste(){
				int i=0;
				_card*c;
				if(wasteiteration==false){
				 _pilewaste*pw=waste();
				 if(pw){
				  if(pw->anfang(c))do{
				   i++;
				  }while(pw->naechstes(c));
				 };
				}else{
				 _pilewaste*pwit;
				 if(game->pilewastelist.anfang(pwit))do{
				  if(pwit->anfang(c))do{
				   i++;
				  }while(pwit->naechstes(c));
				 }while(game->pilewastelist.naechstes(pwit));
				};
				return(i);
};
bool _pilestock::nocardcurvinginwaste(){
				_card*c;
				if(wasteiteration==false){
				 _pilewaste*pw=waste();
				 if(pw){
				  if(pw->anfang(c))do{
				   if(c->curving) return(false);
				  }while(pw->naechstes(c));
				 };
				}else{
				 _pilewaste*pwit;
				 if(game->pilewastelist.anfang(pwit))do{
				  if(pwit->anfang(c))do{
				   if(c->curving) return(false);
				  }while(pwit->naechstes(c));
				 }while(game->pilewastelist.naechstes(pwit));
				};
				return(true);
};
int _pilestock::cardcountwastes(){
				int i=0;
				_pilewaste*pit;
				if(game->pilewastelist.anfang(pit))do{
				 i+=pit->anzahl();
				}while(game->pilewastelist.naechstes(pit));
				return(i);
};
void _pilestock::animate(_zeit*clock){
				_tg nt=clock->system();
				_tg dt=nt-backsorttime;
				backsorttime=nt;
				if(game->animationlist.erstes()==0){
				 if(backsort==false){
				  _tg mx=game->solitaire->mouse.x();
				  _tg my=game->solitaire->mouse.y();
				  if((inner())&&(game->allowpick)&&(game->solitaire->iggsystem->mouseovergui(game->solitaire->maus)==false)&&(game->picklist.anzahl()==0)){
				   if((game->solitaire->mousebutton[0])||(game->solitaire->mousebutton[1])){
				    if(status==0){
				     status=1;
				     if(candeal()){
				      deal();
				      game->startusing();
				     };
				    };
				   };
				  };
				  if((game->solitaire->mousebutton[0]==false)&&(game->solitaire->mousebutton[1]==false)){
				   status=0;
				  };
				 }else{
  			      if(waste()){
				   backsortakku+=dt;
				   while(backsortakku>=backsortintervall){
				    backsortakku-=backsortintervall;
					_pilewaste*source=0;
					_card*cf=0;
					_pilewaste*w=game->pilewastelist.erstes();
					if(wasteiteration){
					 if(w){
					  do{
					   cf=w->erstes();
					   if(cf) source=w;
					  }while(game->pilewastelist.naechstes(w));
					 };
					}else{
					 cf=waste()->erstes();
					 source=waste();
					};
				    if((cf)&&(source)){
				     cf->deinsertpile();
				     cf->insertpile(this,true);
				     _vektor3<_tg> v=dropposition();
				     cf->curvespeed=20;
				     _tg fs=(1*_tg(backsortpilewastecount-cardcountwastes()));
				     cf->curveposition.setzen(cf->position,v,0,0,-10-fs,0,0,10+fs);
				     if(verticalredeal){
				      cf->curvevx.setzen(cf->vx,-cf->vx,0,0,-10,0,0,10);
				      cf->curvevy.setzen(cf->vy, cf->vy,0,0,10,0,0,-10);
				     }else{
				      if(open) cf->curvevx.setzen(cf->vx,cf->vx,0,0,-10,0,0,10); else cf->curvevx.setzen(cf->vx,-cf->vx,0,0,-10,0,0,10);
				      cf->curvevy.setzen(cf->vy, cf->vy,0,0,-10,0,0,0);
				     };
				     cf->startcurve();
					 if(backsortundo){
					  backsortundo->use(cf,this,true,0,0,0,source,true,0,0,0,cf->curveposition,cf->curvevx,cf->curvevy);
					 };
				    }else{
			 		 backsort=false;
					 backsortundo=0;
		 		    };
				   };
				  };
				 };
				};
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				animatetableaufill();
				adjustcardposition();
				animatepileinfo();
};
void _pilestock::createshadow(){
				//createshadowblock()
};
void _pilestock::updateshadow(){
				//updateshadowblock()
};
void _pilestock::updatedescription(){
				_zeichenkette<_tt> d=L"";
				if(towastecount){
				 if(towastecount==1){
				  d=strstockdealsingular+strstockdealtowaste;
				 }else{
				  d=strstockdeal0+towastecount+strstockdeal1+strstockdealtowaste;
				 };
				};
				if(topilecount){
				 if(topilecount==1){
				  d=strstockdealsingular+strstockdealtotableau;
				 }else{
				  d=strstockdeal0+topilecount+strstockdeal1+strstockdealtotableau;
				 };
				};
				if(tofoundationcount){
				 if(tofoundationcount==1){
				  d=strstockdealsingular+strstockdealtofoundation;
				 }else{
				  d=strstockdeal0+tofoundationcount+strstockdeal1+strstockdealtofoundation;
				 };
				};
				if(tolabyrinthcount){
				 if(tolabyrinthcount==1){
				  d=strstockdealsingular+strstockdealtolabyrinth;
				 }else{
				  int lc;
				  if(tolabyrinthcount) lc=1; else lc=0;
				  d=strstockdeal0+lc+strstockdeal1+strstockdealtolabyrinth;
				 };
				};
				if(tableaucount>0){
				 d+=strstockswitch0+tableaucount+strstockswitch1;
				};
				description0=d;
				d=L"";
				if(tableaucount>0){
				 d+=strstockswitch2;
				};
				if((topilecount==0)||(tableaucount>0)){
				 if(redealvalue=-1){
				  d+=strstockendless;
				 }else{
				  int dd=redealvalue-redealcount;
				  if(dd>0){
				   d+=strstockredeal0+dd+strstockredeal1;
				  }else{
				   d+=strstockend;
				  };
				 };
				};
				description1=d;
};
void _pilestock::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilestock"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(towastecount);
				d->speichern(topilecount);
				d->speichern(tofoundationcount);
				d->speichern(tolabyrinthcount);
				d->speichern(tableaucount);
				d->speichern(verticalredeal);
				d->speichern(status);
				d->speichern(open);
				d->speichern(backsort);
				d->speichern(backsortpilewastecount);
				d->speichern(backsorttime);
				d->speichern(backsortintervall);
				d->speichern(backsortakku);
				speichernzeiger(d,backsortundo);
				d->speichern(wastepartner);
				d->speichern(wasteiteration);
};
void _pilestock::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(towastecount);
				d->laden(topilecount);
				d->laden(tofoundationcount);
				d->laden(tolabyrinthcount);
				d->laden(tableaucount);
				d->laden(verticalredeal);
				d->laden(status);
				d->laden(open);
				d->laden(backsort);
				d->laden(backsortpilewastecount);
				d->laden(backsorttime);
				d->laden(backsortintervall);
				d->laden(backsortakku);
				ladenzeiger(d);
				d->laden(wastepartner);
				d->laden(wasteiteration);
};
void _pilestock::assoziieren(){
				if(zeigergeladen()){
				 assoziierenzeiger(backsortundo);
				 loeschenzeiger();
				};
};
//******************************************************************************************************************
//										P I L E S T O C K P Y R A M I D 
//******************************************************************************************************************
_pilestockpyramid::_pilestockpyramid(_game*g,_tg px,_tg py,int tpc,int twc,int tfc,bool tlc):_pilestock(g,px,py,tpc,twc,tfc,tlc){
};
_pilestockpyramid::~_pilestockpyramid(){
};
void _pilestockpyramid::deal(){
				if(towastecount>0){
				 if(waste()==0) return;//no waste, error
				 if(game->picklist.erstes()==0){
				  if(anzahl()>0){
				   _pile*pit=waste();
				   if(pit){
				    if(game->preview==false) game->solitaire->sturn->abspielen(0.8,0.95,1.05);
				    _animationundo*m=0;
				    if(erstes()) m=game->createundo(20,0.1);
				    for(int cw=0;cw<towastecount;cw++){
				     if(erstes()){
				      _card*c=erstes();
				      _pile*targetpile=pit;
					  if(c->number==12) targetpile=game->getpilediscardminimum();
				      c->deinsertpile();
				      c->insertpile(targetpile,true);
				      _vektor3<_tg> v=targetpile->dropposition();
      				  c->curvespeed=20;
				      c->curveposition.setzen(c->position,v,-_tg(cw)*7,0,-10,0,0,10);
				      c->curvevx.setzen(c->vx,c->vx,0,0,-10,0,0,10);
				      c->curvevy.setzen(c->vy,c->vy,0,0,-10,0,0,0);
				      c->startcurve();
					  m->use(c,targetpile,true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				     };
		 		    };
		           };
				  }else{ 
				   if((nocardcurving())&&(nocardcurvinginwaste())&&(backsort==false)){
				    if(canredeal()){
				     redealcount+=1;
				     if(game->preview==false) game->solitaire->smove->abspielen(0.8,0.95,1.05);
				     backsort=true;
				     backsortundo=game->createundo(30,30);
				     backsortundo->redealdelta=-1;
					 backsortundo->redealpile=this;
				     backsorttime=game->solitaire->clock->system();
				     backsortpilewastecount=waste()->anzahl();
				    };
				   };
				  };
			 	 };
				};
};
bool _pilestockpyramid::canpick(_card*){
				return(false);
};
void _pilestockpyramid::pick(_card*c){
				if(c->number==12){
				 c->discard();
				 _animationundo*u=game->createundo(20,20);
				 u->use(c,game->getpilediscardminimum(),true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				 c->deinsertpyramid();
				};
};
void _pilestockpyramid::pickextern(_card*c,_liste<_card>*l){
				if(c->number==12) l->einhaengen(c);
};
bool _pilestockpyramid::candrop(_liste<_card>*list,bool samesuit){
				if(takerestriction) return(false);
				if(list->anzahl()==1){
				 _card*it=list->erstes()->objekt();
				 _card*pc=it;
				 _card*itc=erstes();
				 if(itc){
				  _card*cit=itc;
				  if(cit->inner()){
				   if((cit->child[0]==0)&&(cit->child[1]==0)){
				    if(((pc->number+1)+(cit->number+1))==13){
				     return(true);
				    };
				   };
				  };
				 };
				};
				return(false);
};
void _pilestockpyramid::drop(){
				//drop the picklist to the discardpile && record the moves
				if((erstes())&&(game->picklist.erstes())){
				 _card*dropcard=erstes();
				 _animationundo*m=game->createundo(30,0.1,true);
				 //move the targetdropcard "dropcard" to the discardpile
				 _vektor3<_tg> vn(0,0,0);
				 _vektor3<_tg> vyy(0,game->cardheight,0);
				 _vektor3<_tg> vtp(0,0,5);
				 _vektor3<_tg> vtn(0,0,-5);
				 _pilediscard*pd=game->getpilediscardminimum();
				 dropcard->curvespeed=40;
				 dropcard->curvevx.setzen(dropcard->vx,dropcard->vx,vn,vn);
				 dropcard->curvevy.setzen(dropcard->vy,vyy,vn,vn);
				 dropcard->curveposition.setzen(dropcard->position,pd->dropposition(),vtn,vtp);
				 dropcard->startcurve();
				 dropcard->deinsertpile();
				 dropcard->insertpile(pd,true);
				 m->use(dropcard,pd,true,0,0,0,this,true,0,0,0,dropcard->curveposition,dropcard->curvevx,dropcard->curvevy);
				 dropcard->deinsertpyramid();
				 //move the picked card to the discardpile
				 _tg i=0;
				 _card*c=game->picklist.erstes()->objekt();
				 _pile*pilefrom=c->pile;
				 c->deinsertpick();
				 c->deinsertpile();
				 _vektor3<_tg> v;
				 _vektor3<_tg> dvx=dropvx();
				 _vektor3<_tg> dvy=dropvy();
				 c->curvespeed=30;
			 	 c->curvevx.setzen(c->vx,dvx,0,0,0 ,0,0,0);
			 	 c->curvevy.setzen(c->vy,dvy,0,0,0 ,0,0,0);
			     v=pd->dropposition();
				 c->curveposition.setzen(c->position,v, 0,0,-3,0,0,0);
			     c->startcurve();
			     //undo record move
			     _kurvehermite3<_tg> cupo;
			     _kurvehermite3<_tg> cuvx;
			     _kurvehermite3<_tg> cuvy;
			     cupo.ort(0,c->pickposition);
			     cupo.vektor(0,0,0,-10);
			 	 cupo.ort(1,c->curveposition.ort(1));
			 	 cupo.vektor(1,0,0,+10);
			     cupo.aktualisieren();
				 cuvx.ort(0,c->pickvx);
				 cuvx.vektor(0,0,0,0);
				 cuvx.ort(1,c->curvevx.ort(1));
				 cuvx.vektor(1,0,0,0);
			     cuvx.aktualisieren();
				 cuvy.ort(0,c->pickvy);
				 cuvy.vektor(0,0,0,0);
				 cuvy.ort(1,c->curvevy.ort(1));
				 cuvy.vektor(1,0,0,0);
			     cuvy.aktualisieren();
				 m->use(c,pd,true,0,0,0,pilefrom,true,0,0,0,cupo,cuvx,cuvy);
				 //end undo record move
				 c->deinsertpyramid();
				 c->insertpile(pd,true);
				};
};
void _pilestockpyramid::animate(_zeit*clock){
				_tg nt=clock->system();
				_tg dt=nt-backsorttime;
				backsorttime=nt;
				if(game->animationlist.erstes()==0){
				 if(backsort==false){
				  if(inner()){
				   if((game->solitaire->mousebutton[0])||(game->solitaire->mousebutton[1])&&(game->allowpick)&&(game->solitaire->iggsystem->mouseovergui(game->solitaire->maus)==false)&&(game->picklist.anzahl()==0)){
				    if(status==0){
				     status=1;
				     if(candeal()){
				      deal();
				      game->startusing();
				     };
				    };
				   };
				  };
				  if((game->solitaire->mousebutton[0]==false)&&(game->solitaire->mousebutton[1]==false)){
				   status=0;
				  };
				 }else{
  			      if(waste()){
				   backsortakku+=dt;
				   while(backsortakku>=backsortintervall){
				    backsortakku-=backsortintervall;
				    if(waste()->erstes()){
				     _card*c=waste()->erstes();
				     c->deinsertpile();
				     c->insertpile(this,true);
				     _vektor3<_tg> v=dropposition();
					 _vektor3<_tg> dvx=dropvx();
					 _vektor3<_tg> dvy=dropvy();
				     c->curvespeed=20;
				     _tg fs=(1*_tg(backsortpilewastecount-waste()->anzahl()));
				     c->curveposition.setzen(c->position,v,0,0,-10-fs,0,0,10+fs);
				     c->curvevx.setzen(c->vx,dvx,0,0,-10,0,0,10);
				     c->curvevy.setzen(c->vy,dvy,0,0,-10,0,0,0);
				     c->startcurve();
					 if(backsortundo){
					  backsortundo->use(c,this,true,0,0,0,waste(),true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
					 };
				    }else{
			 		 backsort=false;
					 backsortundo=0;
		 		    };
				   };
				  };
				 };
				};
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				adjustcardposition();
				adjustcardvx();
				updatedescription();
				animatepileinfo();
				updateshadow();
};
void _pilestockpyramid::createshadow(){
				//createshadowblock();
};
void _pilestockpyramid::updateshadow(){
				//updateshadowblock();
};
void _pilestockpyramid::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilestockpyramid"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(towastecount);
				d->speichern(topilecount);
				d->speichern(tofoundationcount);
				d->speichern(status);
				d->speichern(open);
				d->speichern(backsort);
				d->speichern(backsortpilewastecount);
				d->speichern(backsorttime);
				d->speichern(backsortintervall);
				d->speichern(backsortakku);
				speichernzeiger(d,backsortundo);
				d->speichern(wastepartner);
				d->speichern(wasteiteration);
};
void _pilestockpyramid::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(towastecount);
				d->laden(topilecount);
				d->laden(tofoundationcount);
				d->laden(status);
				d->laden(open);
				d->laden(backsort);
				d->laden(backsortpilewastecount);
				d->laden(backsorttime);
				d->laden(backsortintervall);
				d->laden(backsortakku);
				ladenzeiger(d);
				d->laden(wastepartner);
				d->laden(wasteiteration);
};
void _pilestockpyramid::assoziieren(){
				if(zeigergeladen()){
				 assoziierenzeiger(backsortundo);
				 loeschenzeiger();
				};
};

//******************************************************************************************************************
//										P I L E R E D E A L
//******************************************************************************************************************
_pileredeal::_pileredeal(_game*g,_tg px,_tg py,int tpc):_pile(g,px,py),_listenknotenbasis<_pileredeal>(&g->pileredeallist){
				topilecount=tpc;
                blanketmode=false;
                shuffle=false;
                status=0;
                frontsort=false;
                waitsort=false;
                backsort=false;
                shufflewait=false;
                shufflewaitnormal=false;
                shufflewait2=false;
                shufflesort=false;
                shufflesortnormal=false;
                shufflecount=100;
                backsorttime=0;
                backsortintervall=30;//ms
                backsortakku=0;
                backsortundo=0;
				name=strpileredeal;
				//createshadow();
				drawownshadow=false;
};
_pileredeal::~_pileredeal(){
};
void _pileredeal::draw(_grafik*gra,_kamera<_tg>*cam){
				mesh->erzeugenvertexlicht();
	    		//_licht<_tg,_to>*lit;
	    		//if(game->solitaire->world->anfang(lit))do{
				// mesh->determinevertexlight(lit);
				//}while(game->solitaire->world->naechstes(lit));
				mesh->zeichnen(gra);
				if(canredeal()==false){
				 meshsuit->textur(game->solitaire->tsymbolfine);
				 meshsuit->erzeugenvertexlicht();
	    		 //if(game->solitaire->world->anfang(lit))do{
				 // meshsuit->determinevertexlight(lit);
				 //}while(game->solitaire->world->naechstes(lit));
				 meshsuit->zeichnen(gra);
				}else{
				 if(redealvalue!=-1){
				  meshsuit->textur(game->solitaire->tnumber[(redealvalue-redealcount)]);
				  meshsuit->erzeugenvertexlicht();
	    		  //if(game->solitaire->world->anfang(lit))do{
				  // meshsuit->determinevertexlight(lit);
				  //}while(game->solitaire->world->naechstes(lit));
				  meshsuit->zeichnen(gra);
				 };
				};
};
bool _pileredeal::canpick(_card*){
				return(false);
};
bool _pileredeal::candrop(_liste<_card>*,bool samesuit){
				return(false);
};
bool _pileredeal::canredeal(){
				if(redealvalue==-1){
				 return(true);
				}else{
				 if(redealcount<redealvalue) return(true);
				};
				return(false);
};
bool _pileredeal::nocardcurvingintableau(){
                _piletableau*pit;
				 if(game->piletableaulist.anfang(pit))do{
				  if(pit->nocardcurving()==false) return(false);
				 }while(game->piletableaulist.naechstes(pit));
				return(true);
};
bool _pileredeal::nocardcurvinginwaste(){
                _pilewaste*pw;
                _card*c;
				if(game->pilewastelist.anfang(pw))do{
				 if(pw->anfang(c))do{
				  if(c->curving) return(false);
				 }while(pw->naechstes(c));
				}while(game->pilewastelist.naechstes(pw));
				return(true);
};
void _pileredeal::redeal(){
				redealcount+=1;
				backsort=true;
				backsortundo=game->createundo(30,30);
				backsortundo->redealdelta=-1;
				backsortundo->redealpile=this;
				backsorttime=game->solitaire->clock->system();
};
bool _pileredeal::ready(){
				if((backsort==false)&&(frontsort==false)&&(waitsort==false)&&(shufflesort==false)&&(shufflesortnormal==false)&&(shufflewaitnormal==false)&&(shufflewait==false)&&(shufflewait2==false)) return(true); else return(false);
};
void _pileredeal::animate(_zeit*clock){
				_tg nt=clock->system();
				_tg dt=nt-backsorttime;
				_vektor3<_tg> v;
				backsorttime=nt;
				if(game->animationlist.erstes()==0){
				 if(ready()){
				  if((game->solitaire->mousebutton[0])||(game->solitaire->mousebutton[1])){
				   if((inner())&&(game->solitaire->iggsystem->mouseovergui(game->solitaire->maus)==false)&&(game->allowpick)&&(nocardcurving())&&(nocardcurvingintableau())&&(game->picklist.anzahl()==0)){
				    if(status==0){
				     status=1;
				     if(canredeal()){
				      game->startusing();
				      redeal();
					 };
				    };
				   };
				  };
				  if(game->solitaire->mousebutton[1]==false){
				   status=0;
				  };
				 }else{
				  if(frontsort){
				   //alle karten wieder zu dem tableau schieben
				   backsortakku+=dt;
				   while(backsortakku>=backsortintervall){
				    backsortakku-=backsortintervall;
					_piletableau*pile=0;
					_piletableau*pit;
				    if(game->piletableaulist.anfang(pit))do{
				     if(int(pit->anzahl())<topilecount){
				 	  if(pile==0) pile=pit;
				     };
				    }while(game->piletableaulist.naechstes(pit));
				    if((pile)&&(erstes())){
				     _card*c=erstes();
				     c->deinsertpile();
				     _vektor3<_tg> v=pile->dropposition();
				     c->insertpile(pile,true);
				     c->curvespeed=30;
				     _tg fs=1;
				     c->curveposition.setzen(c->position, v, 0,0,-10-fs,0,0,10+fs);
				     c->curvevx.setzen(c->vx, -c->vx, 0,0,-10,0,0,10);
				     c->curvevy.setzen(c->vy, c->vy, 0,0,-10,0,0,0);
				     c->startcurve();
					 if(backsortundo){
					  backsortundo->use(c,pile,true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				 	 };
				    }else{
			 	     frontsort=false;
				     backsortundo=0;
		 		    };
				   };
				  };
				  if(shufflewait2){
				   if(nocardcurving()){
				    _listebasissortierung<_card>::sortieren();
				    shufflewait2=false;
				    frontsort=true;
					backsortundo=game->createundo(30,30);
					backsorttime=clock->system();
				   };
				  };

				  if(shufflewaitnormal){
				   if(nocardcurving()){
				    _listebasissortierung<_card>::sortieren();
				    shufflewaitnormal=false;
				    frontsort=true;
					backsortundo=game->createundo(30,30);
					backsorttime=clock->system();
				   };
				  };

				  if(shufflewait){
				   if(nocardcurving()){
				    _listebasissortierung<_card>::sortieren();
				    //cardlist.reverse()
			        shufflewait2=true;
				    shufflewait=false;
					//jetz die asse sortieren, zunächst die asse anzeigern
					_card*ass[4];
					int ai=0;
					int c=0;
					_card*cit;
					if(anfang(cit))do{
					 if(cit->number==0){
					  ass[ai]=cit;
					  ai++;
					 };
					}while(naechstes(cit));
					//zielindex innerhalb der pile.cardlist
					_piletableau*lit=game->piletableaulist.erstes();
					int ii=0;
					int ziel[4];
					ziel[0]=ii;
					ii+=(13-lit->anzahl());
					ziel[1]=ii;
					lit=lit->_listenknotenbasis<_piletableau>::naechstes();
					ii+=(13-lit->anzahl());
					ziel[2]=ii;
					lit=lit->_listenknotenbasis<_piletableau>::naechstes();
					ii+=(13-lit->anzahl());
					ziel[3]=ii;
					//alle asse , die schon auf einem zielindex sind
					//0 setzen und zielindex ungültig markieren (-1)
					for(int j=0;j<4;j++){
					 for(int k=0;k<4;k++){
					  if(ass[j]) if(ass[j]->index()==ziel[k]){
					   ass[j]=0;
					   ziel[k]=-1;
					  };
					 };
					};
					//nun alle noch nicht korrekt positionierten asse
					//auf einen der freien ziele bewegen
					for(int j=0;j<4;j++){
					 if(ass[j]){
					  int zk=-1;
					  for(int k=0;k<4;k++){
					   if(ziel[k]!=-1) zk=k;
					  };
					  if(zk!=-1){
					   //das ass[j] nun auf die card(ziel[zk]) bewegen
					   int zi=ziel[zk];
					   ziel[zk]=-1;
					   _card*c0=card(zi);
					   _card*c1=ass[j];
					   v=c1->position;
				       c0->curvespeed=30;
				       c0->curveposition.setzen(c0->position,v,20,0,0,-20,0,0);
				       c0->curvevx.setzen(c0->vx,c0->vx,0,0,-10,0,0,10);
				       c0->curvevy.setzen(c0->vy,c0->vy,0,0,-10,0,0,0);
				       c0->startcurve();
					   if(backsortundo) backsortundo->use(c0,this,true,0,0,0,this,true,0,0,0,c0->curveposition,c0->curvevx,c0->curvevy);
					   v=c0->position;
				       c1->curvespeed=30;
				       c1->curveposition.setzen(c1->position, v, 20,0,0,-20,0,0);
				       c1->curvevx.setzen(c1->vx,c1->vx,0,0,-10,0,0,10);
				       c1->curvevy.setzen(c1->vy,c1->vy,0,0,-10,0,0,0);
				       c1->startcurve();
					   if(backsortundo) backsortundo->use(c1,this,true,0,0,0,this,true,0,0,0,c1->curveposition,c1->curvevx,c1->curvevy);
					  };
					 };
					};
				   };
				  };

				  if(shufflesort){
				   backsortakku+=dt;
				   while(backsortakku>=backsortintervall){
				    backsortakku-=backsortintervall;
				    if(shufflecount>0){
				     //jetzt karten zufällig shufflen
					 int co=anzahl();
					 if(co>1){
					  int i0,i1;
					  _card*c0;
					  _card*c1;
					  do{
					   i0=zufall<int>(0,co-1);
					   i1=zufall<int>(0,co-1);
					   c0=card(i0);
					   c1=card(i1);
					  }while(i1==i0);
					  if((c0->curving==false)&&(c1->curving==false)){
					   //tausche die Karten c0 und c1
					   v=c1->position;
				       c0->curvespeed=30;
				       c0->curveposition.setzen(c0->position, v, 20,0,0,-20,0,0);
				       c0->curvevx.setzen(c0->vx, c0->vx, 0,0,-10,0,0,10);
				       c0->curvevy.setzen(c0->vy, c0->vy, 0,0,-10,0,0,0);
				       c0->startcurve();
					   if(backsortundo) backsortundo->use(c0,this,true,0,0,0,this,true,0,0,0,c0->curveposition,c0->curvevx,c0->curvevy);
					   v=c0->position;
				       c1->curvespeed=30;
				       c1->curveposition.setzen(c1->position, v, 20,0,0,-20,0,0);
				       c1->curvevx.setzen(c1->vx, c1->vx, 0,0,-10,0,0,10);
				       c1->curvevy.setzen(c1->vy, c1->vy, 0,0,-10,0,0,0);
				       c1->startcurve();
					   if(backsortundo) backsortundo->use(c1,this,true,0,0,0,this,true,0,0,0,c1->curveposition,c1->curvevx,c1->curvevy);
					  };
					 };
				     shufflecount-=1;
				    }else{
				     shufflesort=false;
				     shufflewait=true;
				     backsortundo=0;
				    };
				   };
				  };

				  if(shufflesortnormal){
				   backsortakku+=dt;
				   while(backsortakku>=backsortintervall){
				    backsortakku-=backsortintervall;
				    if(shufflecount>0){
				     //jetzt karten zufällig shufflen
					 int co=anzahl();
					 if(co>1){
					  int i0,i1;
					  _card*c0;
					  _card*c1;
					  do{
					   i0=zufall<int>(0,co-1);
					   i1=zufall<int>(0,co-1);
					   c0=card(i0);
					   c1=card(i1);
					  }while(i0==i1);
					  if((c0->curving==false)&&(c1->curving==false)){
					   //tausche die Karten c0 und c1
					   v=c1->position;
				       c0->curvespeed=30;
				       c0->curveposition.setzen(c0->position,v,20,0,0,-20,0,0);
				       c0->curvevx.setzen(c0->vx,c0->vx,0,0,-10,0,0,10);
				       c0->curvevy.setzen(c0->vy,c0->vy,0,0,-10,0,0,0);
				       c0->startcurve();
					   if(backsortundo) backsortundo->use(c0,this,true,0,0,0,this,true,0,0,0,c0->curveposition,c0->curvevx,c0->curvevy);
					   v=c0->position;
				       c1->curvespeed=30;
				       c1->curveposition.setzen(c1->position,v,20,0,0,-20,0,0);
				       c1->curvevx.setzen(c1->vx,c1->vx,0,0,-10,0,0,10);
				       c1->curvevy.setzen(c1->vy,c1->vy,0,0,-10,0,0,0);
				       c1->startcurve();
					   if(backsortundo) backsortundo->use(c1,this,true,0,0,0,this,true,0,0,0,c1->curveposition,c1->curvevx,c1->curvevy);
					  };
					 };
				     shufflecount-=1;
				    }else{
				     shufflesortnormal=false;
				     shufflewaitnormal=true;
				     backsortundo=0;
				    };
				   };
				  };

				  if(waitsort){
				   if(nocardcurving()){
				    if(blanketmode==false){
				     if(shuffle==false){
				      frontsort=true;
					  waitsort=false;
					  invertieren();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				      backsortundo=game->createundo(30,30);
					  backsorttime=clock->system();
					 }else{
					  shufflesortnormal=true;
					  shufflecount=anzahl();
					  waitsort=false;
				      backsortundo=game->createundo(30,30);
					  backsorttime=clock->system();
					 };
					}else{
					 shufflesort=true;
					 shufflecount=anzahl();
					 waitsort=false;
				     backsortundo=game->createundo(30,30);
					 backsorttime=clock->system();
					};
				   };
				  };
				
				  if(backsort){
				   //suck all cards from the tableau piles (in cruel from pilecruels) from behind
				   backsortakku+=dt;
				   while(backsortakku>=backsortintervall){
				    backsortakku-=backsortintervall;
				    _card*it=0;
					if(blanketmode=false){
					 _piletableau*pit=game->piletableaulist.letztes();
					 if(pit){
					  do{
				 	   if(it==0) it=pit->erstes();
				      }while((game->piletableaulist.vorheriges(pit))&&(it==0));
				     };
					}else{
					 _piletableau*pit=game->piletableaulist.letztes();
					 if(pit)do{
					  //es wird nun versucht, die rechteste Karte der Pile pit zu holen
				 	  if(it==0){
				       _tg xmax=-1000;
				       _card*cit;
				       if(pit->anfang(cit))do{
				        if(xmax<cit->position.x()){
				         xmax=cit->position.x();
				         if(blanketbacksort(cit)) it=cit;
				        };
				       }while(pit->naechstes(cit));
			          };
				     }while((game->piletableaulist.vorheriges(pit))&&(it==0));
					};
				    if(it){
				     _card*c=it;
					 _pile*from=c->pile;
				     c->deinsertpile();
				     c->insertpile(this,true);
				     _vektor3<_tg> v=dropposition();
				     c->curvespeed=30;
				     _tg fs=1;
				     c->curveposition.setzen(c->position,v,0,0,-10-fs,0,0,10+fs);
				     c->curvevx.setzen(c->vx,-c->vx,0,0,-10,0,0,10);
				     c->curvevy.setzen(c->vy,c->vy,0,0,-10,0,0,0);
				     c->startcurve();
					 if(backsortundo){
					  backsortundo->use(c,this,true,0,0,0,from,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				 	 };
				    }else{
			 	     backsort=false;
			         waitsort=true;
				     backsortundo=0;
		 		    };
				   };
				  };
				 };
				};
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				//adjustcardposition();
				//updatedescription();
				animatepileinfo();
				//updateshadow();
};
void _pileredeal::createshadow(){
				//createshadowblock();
};
void _pileredeal::updateshadow(){
				//updateshadowblock();
};
bool _pileredeal::blanketbacksort(_card*c){
				//c gehört zu einem pileblanket
				//es muss geprüft werden, ob in richtung links die Karten
				//dieselbe suit haben und eine absteigende nummerierung bis 2 haben
				//wenn ja, dann nicht rücksortieren.
				int s=c->suit;
				int n=c->number;
				_pileblanket*pk=dynamic_cast<_pileblanket*>(c->pile);
				_tg tabx=game->tabulatorx();
				_vektor3<_tg> o;
				o=c->position;
				o.x(o.x()-tabx);
				_card*cn=pk->cardat(o);
				if(cn==0) if(c->number==1) return(false); else return(true);
				n-=1;
				while(cn){
				 if(cn->suit!=s) return(true);
				 if(cn->number!=n) return(true);
				 o.x(o.x()-tabx);
				 n-=1;
				 cn=pk->cardat(o);
				};
				if(n==0) return(false);
				return(true);
};
void _pileredeal::updatedescription(){
				_zeichenkette<_tt> d;
				if(redealvalue==-1){
				 d+=strredealendless;
				}else{
				 int dd=redealvalue-redealcount;
				 if(dd>0){
				  d+=strredealredeal0+dd+strredealredeal1;
				 }else{
				  d+=strredealend;
				 };
				};
				description0=d;
				description1=L"";
};
void _pileredeal::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pileredeal"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(topilecount);
				d->speichern(blanketmode);
				d->speichern(shuffle);
				d->speichern(status);
				d->speichern(frontsort);
				d->speichern(waitsort);
				d->speichern(backsort);
				d->speichern(shufflewait);
				d->speichern(shufflewaitnormal);
				d->speichern(shufflewait2);
				d->speichern(shufflesort);
				d->speichern(shufflesortnormal);
				d->speichern(shufflecount);
				d->speichern(backsorttime);
				d->speichern(backsortintervall);
				d->speichern(backsortakku);
				speichernzeiger(d,backsortundo);
};
void _pileredeal::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(topilecount);
				d->laden(blanketmode);
				d->laden(shuffle);
				d->laden(status);
				d->laden(frontsort);
				d->laden(waitsort);
				d->laden(backsort);
				d->laden(shufflewait);
				d->laden(shufflewaitnormal);
				d->laden(shufflewait2);
				d->laden(shufflesort);
				d->laden(shufflesortnormal);
				d->laden(shufflecount);
				d->laden(backsorttime);
				d->laden(backsortintervall);
				d->laden(backsortakku);
				ladenzeiger(d);
};
void _pileredeal::assoziieren(){
				if(zeigergeladen()){
				 assoziierenzeiger(backsortundo);
				 loeschenzeiger();
				};
};
//******************************************************************************************************************
//										P I L E D I S C A R D 
//******************************************************************************************************************
_pilediscard::_pilediscard(_game*g,_tg px,_tg py):_pile(g,px,py),_listenknotenbasis<_pilediscard>(&g->pilediscardlist){
                acesupmode=false;
                pyramidmode=false;
                effectsource=0;
                effectstatus=0;
                effecttimestart=0;
                effectgravity=0;
                cardcountactual=0;
                cardcountold=0;
				_tg rs=1;
				effectsource=new _partikelquelle(game->solitaire->world,game->solitaire->clock,&game->solitaire->particlesourcegamelist,&game->solitaire->particlegamelist);
				effectsource->aktiv(false);
				effectsource->groesse(1);
				effectsource->groessetoleranz(0.5);
				effectsource->vektor(0,0,-0.1);
				effectsource->vektortoleranz(0.7);
				effectsource->lebensdauerpartikel(2700);
				effectsource->lebensdauerpartikeltoleranz(0.1);
				effectsource->rotation(0);
				effectsource->rotationtoleranz(0);
				effectsource->opazitaet(1);
				effectsource->feldkraftg(+1);
				effectsource->ortraum(0,1.5*rs,0,0);
				effectsource->ortraum(1,0,2.25*rs,0);
				effectsource->ortraum(2,0,0,0.2*0.5);
				effectsource->transparenzadditiv();
  				effectsource->feldkraftghomogen().setzen(0,0,-0.01);
				effectsource->opazitaetsinus(true);
				effectsource->opazitaetsinusrate(1);
				effectsource->opazitaetsinusratedelta(0.3);
				effectsource->opazitaetsinusratedeltatoleranz(0.2);
				effectsource->skalierung(true);
				effectsource->skalierung(0.998);
				effectsource->axialdivergenz(false);
				effectsource->axialdivergenzvektor(0,0,-0.02);
				effectsource->ausblenden(true);
				effectsource->einblenden(false);
				effectsource->kurvefarbe(true);
				effectsource->kurvefarbe().setzen(0,0,0,0  ,  0,0,1,0,  5,5,5,5, -1,0,-5,-5);
				// -----------------------life source------------------------
				effectsource->partikelquelleleben(new _partikelquelle(game->solitaire->world,game->solitaire->clock,&game->solitaire->particlesourcegamelist,&game->solitaire->particlegamelist));
				effectsource->partikelquelleleben()->aktiv(false);
				effectsource->partikelquelleleben()->vektor(0,0,0);
				effectsource->partikelquelleleben()->vektortoleranz(0.8);
				effectsource->partikelquelleleben()->generationsrate(50);
				effectsource->partikelquelleleben()->lebensdauerpartikel(1000);
				effectsource->partikelquelleleben()->lebensdauerpartikeltoleranz(0.01);
				effectsource->partikelquelleleben()->opazitaet(1);
				effectsource->partikelquelleleben()->ort(0,0,0);
				effectsource->partikelquelleleben()->ortraum(0,0,0,0);
				effectsource->partikelquelleleben()->ortraum(1,0,0,0);
				effectsource->partikelquelleleben()->ortraum(2,0,0,0);
				effectsource->partikelquelleleben()->transparenzadditiv();
				effectsource->partikelquelleleben()->generationsdichtedynamisch(0.4);
				effectsource->partikelquelleleben()->feldkraftg(-8);
				effectsource->partikelquelleleben()->groesse(3);
				effectsource->partikelquelleleben()->kurvefarbe(true);
				effectsource->partikelquelleleben()->kurvefarbe().setzen(0.0,0.0f,0.8f,0.5f  ,  0.8f,0.2f,0.05f,0,  0,0,0,0, -3,-2,0,-4);
				name=strpilediscard;
				//createshadow();
				drawownshadow=false;
				_tg scale=0.4;//vorher 4
				_netz*m;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),scale,scale,0);
				gg.textur(game->solitaire->tcoronawhite);
				gg.ort(-scale/2,-scale/2,0);
				m=gg.erzeugen();
				//m->dynamicvertexlight(false);
				m->transparenz(true);
				m->transparenzadditiv(true);
				//gg.textur(game->solitaire->tfeuer3);
				//m2=gg.erzeugen();
				//m2->dynamicvertexlight=false;
				//m2->transparenz(true);
				//m2->transparenzadditiv();
				effectsource->einfuegennetz(m);
				//effectsource->einfuegennetz(m2);
				effectsource->generationsrateletzterort(position);
				effectsource->ort(position);
				effectsource->axialdivergenzort(position);
				//effectsource->simplekollisionz=true
				effectsource->partikelquelleleben()->rotation(sin(_ph*game->solitaire->clock->system()/10)*90);//180+Sin(solitaire->clock->system()/(50+Cos(solitaire->clock->system()/20)*45))*360
				//effectsource->partikelquelleleben()->simplekollisionz=true
				scale=0.35;
				gg.textur(game->solitaire->tfeuer6);
				gg.ort(-scale/2,-scale/2,0);
				m=gg.erzeugen();
				//m->dynamicvertexlight(false);
				m->transparenz(true);
				m->transparenzadditiv(true);
				effectsource->partikelquelleleben()->einfuegennetz(m);
};
_pilediscard::~_pilediscard(){
				deletesecure(effectsource);
				deletesecure(effectgravity);
};
bool _pilediscard::canpick(_card*c){
				return(false);
};
void _pilediscard::effect(){
				effecttimestart=game->solitaire->clock->system();
				effectstatus=1;
				deletesecure(effectgravity);
				effectsource->generationsrateletzterort(position);
				effectsource->ort(position);
};
void _pilediscard::animateeffect(){
				cardcountactual=cardcount();
				_tg t=game->solitaire->clock->system();
				if(effectstatus>0){
				 if(effectstatus==4){
				  if((t-effecttimestart)>6000){
				   deletesecure(effectgravity);
				   effectstatus=0;
				  };
				 };
				 if(effectstatus==3){
				  if((t-effecttimestart)>2000){
				   effectstatus=4;
				   effectgravity->divergenzintensitaet(0,0.3);
				  }else{ 
				   //effectgravity.intensity=Sin(360*(t-effecttimestart)/1000)*3
				  };
				  
				 };
				 if(effectstatus==2){
				  if((t-effecttimestart)>50){
				   effectstatus=3;
				   effectsource->aktiv(false);
				  };
				 };
				 if(effectstatus=1){
				  if(cardcurving()==false){
				   effectstatus=2;
				   if(game->solitaire->systemaccellerate==false) effectsource->generationsrate(1500); else effectsource->generationsrate(500);
				   effectsource->aktiv(true);
				 //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  effectgravity=game->solitaire->world->feld()->erzeugengravitation(position.x(),position.y(),position.z()-3,3);
				  };
				 };
				};
				if(cardcountactual!=cardcountold){
				 if(acesupmode==false){
				  if(cardcountactual==13){
				   effect();
				  };
				 };
				 cardcountold=cardcountactual;
				};
};
bool _pilediscard::candrop(_liste<_card>*list,bool samesuit){
				if(takerestriction )return(false);
				if(acesupmode){
				 
				 if(list->anzahl()==1){
				  _card*c=list->erstes()->objekt();
				  _pilefreecell*pf=dynamic_cast<_pilefreecell*>(c->pile);
				  if(pf) return(false);
				  int cs=c->suit;
				  int cn=c->number;
				  if(cn==0) cn=13;
				  //es muss nun einen anderen pile geben,
				  //der eine firstkarte mit niedrigerer nummer hat
				  bool samelower=false;
				  _piletableau*pit;
				  if(game->piletableaulist.anfang(pit))do{//for(Local pit:_piletableau=EachIn game->tableau.pilelist
				   if(pit!=c->pile){
				    if(pit->anzahl()>0){
				     _card*v=pit->erstes();
				     if(v->suit==cs){
				      int vn=v->number;
				      if(vn==0) vn=13;
				      if(vn>cn) samelower=true;
				     };
				    };
				   };
				  }while(game->piletableaulist.naechstes(pit));
				  if(samelower) return(true);
				 };
				 return(false);
				};
	 			if(list->anzahl()==13){
	 			 _listenknoten<_card>*it=list->erstes();
	  			 bool ss=true;
	 			 int su=it->objekt()->suit;
	 			 if(list->anfang(it))do{
	 			  //if(su!=_card(it->objekt()).suit ss=false
	 			 }while(list->naechstes(it));
	             if(ss) return(true); else return(false);
	 			}else{
				 return(false);
				};
};
void _pilediscard::animate(_zeit*clock){
				animateeffect();
	  			if(game->statsclosed==false) game->discards+=cardcountactual;
				adjustcardposition();
				adjustcardvx();
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				animatepileinfo();
				updateshadow();
};
void _pilediscard::createshadow(){
				//createshadowblock();
};
void _pilediscard::updateshadow(){
				//updateshadowblock();
};
void _pilediscard::updatedescription(){
				if(acesupmode==false){
				 description0=strdiscardnormal;
				}else{
				 description0=strdiscardacesupmode;
				};
				description1=L"";
};
void _pilediscard::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilediscard"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(acesupmode);
				d->speichern(pyramidmode);
};
void _pilediscard::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(acesupmode);
				d->laden(pyramidmode);
};
void _pilediscard::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};

//******************************************************************************************************************
//										P I L E W A S T E 
//******************************************************************************************************************
_pilewaste::_pilewaste(_game*g,_tg px,_tg py):_pile(g,px,py),_listenknotenbasis<_pilewaste>(&g->pilewastelist){
                stockpartner=0;
				name=strpilewaste;
				//createshadow();
				drawownshadow=false;
};
_pilewaste::~_pilewaste(){
				L->schreiben("PILEWASTE DESTRUKTOR");
};
_pilestock* _pilewaste::stock(){
				return(game->pilestock(stockpartner));
};
bool _pilewaste::canpick(_card*c){
				if(giverestriction) return(false);
				_pilestock*ps=stock();
				if(ps){
				 if(ps->backsort==true) return(false);
				};
				//if(cardcurving() return(false); achtung !!!!!!!!!!!!!!!!!! wurde entfernt wegen doppelklick fehlfunktion !
				if(cardcurvingstock()) return(false);
				if(c->vorheriges()==letztes()) return(true); else return(false);
};
void _pilewaste::pick(_card*c){
				c->pick();
};
void _pilewaste::pickextern(_card*c,_liste<_card>*l){
				l->einhaengen(c);
};
bool _pilewaste::cardcurvingstock(){
				_pilestock*ps=stock();
				_card*c;
				if(ps){
				 if(ps->anfang(c))do{
				  if(c->curving) return(true);
				 }while(ps->naechstes(c));
				};
				return(false);
};
bool _pilewaste::candrop(_liste<_card>*list,bool samesuit){
				return(false);
};
void _pilewaste::animate(_zeit*clock){
				animateinput();
				//adjustcardposition();
				adjustcardvx();
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				animatetableaufill();
				animatepileinfo();
				//updateshadow();
};
void _pilewaste::createshadow(){
				//createshadowblock();
};
void _pilewaste::updateshadow(){
				//updateshadowblock();
};
void _pilewaste::updatedescription(){
				description0=strwastenormal;
				description1=L"";
};
void _pilewaste::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilewaste"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(stockpartner);
};
void _pilewaste::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(stockpartner);
};
void _pilewaste::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};
//******************************************************************************************************************
//										P I L E W A S T E P Y R A M I D
//******************************************************************************************************************
_pilewastepyramid::_pilewastepyramid(_game*g,_tg px,_tg py):_pilewaste(g,px,py){
};
_pilewastepyramid::~_pilewastepyramid(){
};
bool _pilewastepyramid::canpick(_card*c){
				if(giverestriction) return(false);
				_pilestock*pw=stock();
				if(pw){
				 if(pw->backsort) return(false);
				};
				if(cardcurving()) return(false);
				if(cardcurvingstock()) return(false);
				if(c->vorheriges()!=c->liste()->letztes()) return(false); 
				if(cardcurvingindiscard()) return(false);
				return(true);
};	
void _pilewastepyramid::pick(_card*c){
				if(c->number==12){
				 c->discard();
				 _animationundo*u=game->createundo(20,20);
				 u->use(c,game->getpilediscardminimum(),true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				 c->deinsertpyramid();
				}else{
				 c->pick();
				};
				};
void _pilewastepyramid::pickextern(_card*c,_liste<_card>*l){//picks the card c to the external list
				l->einhaengen(c);
};
bool _pilewastepyramid::cardcurvingindiscard(){
				if(game->pilediscardlist.erstes()==0) return(false);
				_pilediscard*dit;
				_card*cit;
				if(game->pilediscardlist.anfang(dit))do{
				 if(dit->anfang(cit))do{
				  if(cit->curving) return(true);
				 }while(dit->naechstes(cit));
				}while(game->pilediscardlist.naechstes(dit));
				return(false);
};
bool _pilewastepyramid::candrop(_liste<_card>*list,bool samesuit){
				if(takerestriction) return(false);
				if(list->anzahl()==1){
				 _card*pc=list->erstes()->objekt();
				 _card*cit=erstes();
				 if(cit){
				  if(cit->inner()){
				   if((cit->child[0]==0)&&(cit->child[1]==0)){
				    if(((pc->number+1)+(cit->number+1))==13){
				     return(true);
				    };
				   };
				  };
				 };
				};
				return(false);
};
void _pilewastepyramid::drop(_zeit*clock){
				//drop the picklist to the discardpile && record the moves
				if((erstes())&&(game->picklist.erstes())){
				 _card*dropcard=erstes();
				 _animationundo*m=game->createundo(30,0.1,true);
				 //move the targetdropcard "dropcard" to the discardpile
				 _vektor3<_tg> vn;
				 _vektor3<_tg> vyy(0,game->cardheight,0);
				 _vektor3<_tg> vtp(0,0,5);
				 _vektor3<_tg> vtn(0,0,-5);
				 _pilediscard*pd=game->getpilediscardminimum();
				 dropcard->curvespeed=40;
				 dropcard->curvevx.setzen(dropcard->vx,dropcard->vx,vn,vn);
				 dropcard->curvevy.setzen(dropcard->vy,vyy,vn,vn);
				 dropcard->curveposition.setzen(dropcard->position,pd->dropposition(),vtn,vtp);
				 dropcard->startcurve();
				 dropcard->deinsertpile();
				 dropcard->insertpile(pd,true);
				 //Local u:_animationundo=game->createundo(20,20)
				 m->use(dropcard,pd,true,0,0,0,this,true,0,0,0,dropcard->curveposition,dropcard->curvevx,dropcard->curvevy);
				 dropcard->deinsertpyramid();
				 //move the picked card to the discardpile
				 _tg i=0;
				 _card*c=game->picklist.erstes()->objekt();
				 _pile*pilefrom=c->pile;
				 c->deinsertpick();
				 c->deinsertpile();
				 _vektor3<_tg> v;
				 _vektor3<_tg> dvx=dropvx();
				 _vektor3<_tg> dvy=dropvy();
				 c->curvespeed=30;
			 	 c->curvevx.setzen(c->vx,dvx,0,0,0,0,0,0);
			 	 c->curvevy.setzen(c->vy,dvy,0,0,0,0,0,0);
			     v=pd->dropposition();
				 c->curveposition.setzen(c->position,v,0,0,-3,0,0,0);
			     c->startcurve();
			     //undo record move
			     _kurvehermite3<_tg> cupo;
			     _kurvehermite3<_tg> cuvx;
			     _kurvehermite3<_tg> cuvy;
			     cupo.ort(0,c->pickposition);
			     cupo.vektor(0,0,0,-10);
			 	 cupo.ort(1,c->curveposition.ort(1));
			 	 cupo.vektor(1,0,0,+10);
			     cupo.aktualisieren();
				 cuvx.ort(0,c->pickvx);
				 cuvx.vektor(0,0,0,0);
				 cuvx.ort(1,c->curvevx.ort(1));
				 cuvx.vektor(1,0,0,0);
			     cuvx.aktualisieren();
				 cuvy.ort(0,c->pickvy);
				 cuvy.vektor(0,0,0,0);
				 cuvy.ort(1,c->curvevy.ort(1));
				 cuvy.vektor(1,0,0,0);
			     cuvy.aktualisieren();
				 m->use(c,pd,true,0,0,0,pilefrom,true,0,0,0,cupo,cuvx,cuvy);
				 //end undo record move
				 c->deinsertpyramid();
				 c->insertpile(pd,true);
				};
};
void _pilewastepyramid::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilewastepyramid"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(stockpartner);
};
void _pilewastepyramid::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(stockpartner);
};
void _pilewastepyramid::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};
//******************************************************************************************************************
//										P I L E F O U N D A T I O N 
//******************************************************************************************************************
_pilefoundation::_pilefoundation(_game*g,_tg px,_tg py):_pile(g,px,py),_listenknotenbasis<_pilefoundation>(&g->pilefoundationlist){
	            osmosismode=false;
	            effectsource=0;
	            effectstatus=0;
	            effecttimestart=0;
	            effectgravity=0;
	            cardcountactual=0;
	            cardcountold=0;

				effectsource=new _partikelquelle(game->solitaire->world,game->solitaire->clock,&game->solitaire->particlesourcegamelist,&game->solitaire->particlegamelist);
				effectsource->aktiv(false);
				effectsource->groesse(1);
				effectsource->groessetoleranz(0.5);
				effectsource->vektor(0,0,-0.1);
				effectsource->vektortoleranz(0.7);
				effectsource->lebensdauerpartikel(2700);
				effectsource->lebensdauerpartikeltoleranz(0.1);
				effectsource->rotation(0);
				effectsource->rotationtoleranz(0);
				effectsource->opazitaet(1);
				effectsource->feldkraftg(+1);
				_tg rs=1;
				effectsource->ortraum(0,1.5*rs,0,0);
				effectsource->ortraum(1,0,2.25*rs,0);
				effectsource->ortraum(2,0,0,0.2*0.5);
				effectsource->transparenzadditiv();
  				effectsource->feldkraftghomogen().setzen(0,0,-0.01);
				effectsource->generationsrate(1000);
				effectsource->opazitaetsinus(true);
				effectsource->opazitaetsinusrate(1);
				effectsource->opazitaetsinusratedelta(0.3);
				effectsource->opazitaetsinusratedeltatoleranz(0.2);
				effectsource->skalierung(true);
				effectsource->skalierung(0.998);
				effectsource->axialdivergenz(false);

				effectsource->axialdivergenzvektor(0,0,-0.02);
				effectsource->ausblenden(true);
				effectsource->einblenden(false);
				effectsource->kurvefarbe(true);
				effectsource->kurvefarbe().setzen(0,0,0,0 , 0,0,1,0, 5,5,5,5,-1,0,-5,-5);

				// -----------------------life source------------------------
				effectsource->partikelquelleleben(new _partikelquelle(game->solitaire->world,game->solitaire->clock,&game->solitaire->particlesourcegamelist,&game->solitaire->particlegamelist));
				effectsource->partikelquelleleben()->aktiv(false);
				effectsource->partikelquelleleben()->vektor(0,0,0);
				effectsource->partikelquelleleben()->vektortoleranz(0.8);
				effectsource->partikelquelleleben()->generationsrate(50);
				effectsource->partikelquelleleben()->lebensdauerpartikel(1000);
				effectsource->partikelquelleleben()->lebensdauerpartikeltoleranz(0.01);
				effectsource->partikelquelleleben()->opazitaet(1);
				effectsource->partikelquelleleben()->ort(0,0,0);
				effectsource->partikelquelleleben()->ortraum(0,0,0,0);
				effectsource->partikelquelleleben()->ortraum(1,0,0,0);
				effectsource->partikelquelleleben()->ortraum(2,0,0,0);
				effectsource->partikelquelleleben()->transparenzadditiv();
				effectsource->partikelquelleleben()->generationsdichtedynamisch(0.4);
				effectsource->partikelquelleleben()->feldkraftg(-8);
				effectsource->partikelquelleleben()->groesse(3);
				effectsource->partikelquelleleben()->kurvefarbe(true);
				effectsource->partikelquelleleben()->kurvefarbe().setzen(0,0,_to(0.8),_to(0.5)  ,  _to(0.8),_to(0.2),_to(0.05),0,  0,0,0,0, -3,-2,0,-4);
				name=strpilefoundation;
				//createshadow()
				drawownshadow=false;
				takesamesuit=true;
				_tg scale=0.4;//vorher 4
				_netz*m;
				_geometrienetz gg(0,_vektor3<_tg>(-scale/2,-scale/2,0),scale,scale,game->solitaire->tcoronawhite);
				m=gg.erzeugen();
				m->transparenzadditiv(true);

				effectsource->einfuegennetz(m);
				effectsource->generationsrateletzterort(position);
				effectsource->ort(position);
				effectsource->axialdivergenzort(position);
				effectsource->partikelquelleleben()->rotation(sin(_ph*game->solitaire->clock->system()/10)*90);
				scale=0.35;
				gg.textur(game->solitaire->tfeuer6);
				gg.ort(-scale/2,-scale/2,0);
				m=gg.erzeugen();
				m->transparenzadditiv(true);
				effectsource->partikelquelleleben()->einfuegennetz(m);
	
};
_pilefoundation::~_pilefoundation(){
				L->schreiben("PILEFOUNADTION DESTRUKTOR einsteig");
	   			deletesecure(effectsource);
				deletesecure(effectgravity);
				L->schreiben("PILEFOUNADTION DESTRUKTOR ausnsteig");
};
void _pilefoundation::draw(_grafik*gra,_kamera<_tg>*cam){
	    		_polygon*pit;
				mesh->erzeugenvertexlicht();
	    		//if(game->solitaire->world->anfang(lit))do{
				// mesh->determinevertexlight(lit);
				//}while(game->solitaire->world->naechstes(lit));
				mesh->zeichnen(gra);
				int s=-1;//foundation
				int n=-1;
				if(takeemptysuit!=-1) s=takeemptysuit;
				if(takeascending) n=0;
				if(takedescending) n=12;

				if(s!=-1){
				 if(meshsuit->anfang(pit))do{
				  pit->textur(game->solitaire->tsymbolsuit[s]);
				 }while(meshsuit->naechstes(pit));
				 meshsuit->erzeugenvertexlicht();
	    		 //if(game->solitaire->world->anfang(lit))do{
				 // meshsuit->determinevertexlight(lit);
				 //}while(game->solitaire->world->naechstes(lit));
				 meshsuit->zeichnen(gra);
				};
				
				if(n!=-1){
				 if(meshnumber->anfang(pit))do{
				  pit->textur(game->solitaire->tsymbolnumber[n]);
				 }while(meshnumber->naechstes(pit));
				 meshnumber->erzeugenvertexlicht();
	    		 //if(game->solitaire->world->anfang(lit))do{
				 // meshnumber->determinevertexlight(lit);
				 //}while(game->solitaire->world->naechstes(lit));
				 meshnumber->zeichnen(gra);
				};
};
bool _pilefoundation::canpick(_card*c){
				if(giverestriction) return(false);
				//only first card can be picked up
				if(c->vorheriges()==c->liste()->letztes()) return(true);
				return(false);
};
bool _pilefoundation::candrop(_liste<_card>*list,bool samesuit){
				if(takerestriction) return(false);
				if(osmosismode){//------------------------- osmosis mode --------------------------------------
				 if(list->anzahl()==1){
				  _card*cl=list->erstes()->objekt();
				  _pilefoundation*prev=_listenknotenbasis<_pilefoundation>::vorheriges();
				  if(prev==_listenknotenbasis<_pilefoundation>::liste()->letztes()){// erste Foundation
				   if(erstes()){
				    if(erstes()->suit==cl->suit) return(true);//erste Foundation. gleiche suit
				   };
				  }else{//untere Foundation
				   _pilefoundation*pf=prev;
				   if(erstes()){//wo etwas drinen ist
				    if(erstes()->suit==cl->suit){//ok suit stimmt überein, nun osmose anwenden
				     _card*cprev;
				     if(pf->anfang(cprev))do{
				      if(cprev->number==cl->number) return(true); 
				     }while(pf->naechstes(cprev));
				    };
				   }else{//wo noch nichts drinnen ist (-> suit egal, osmose anwenden)
				    _card*it=pf->letztes();
				    if(it) if(it->number==cl->number) return(true);
				   };//selfpile gefüllt
				  };//prevpile=0
				 };//list.anzahl()=1
				}else{//------------------------------------ normaler modus --------------------------------
				 //only one card of same suit an right order
				 if(list->anzahl()!=1) return(false);
			 	 _card*c=list->erstes()->objekt();
				 if(c){
				  if(anzahl()==0){
     			   if((takeemptysuit!=-1)&&(c->suit!=takeemptysuit)) return(false);
				   if(takeascending) if(c->number==0) return(true);
				   if(takedescending) if(c->number==12) return(true);
				  }else{
				   _card*cf=erstes();
				   if(takeboth){
				    if(abs(c->number-cf->number)==1) return(true);
				   };
				   if(takewrapped){
				    if((c->number==12)&&(cf->number==0)) return(true);
				    if((c->number==0)&&(cf->number==12)) return(true);
				   };
				   if(cf->suit!=c->suit) return(false);	
				   if(takemirrored){
					bool ta=takeascending;
					bool td=takedescending;
				    int m=anzahl()/13;
					int q=anzahl()%13;
				    m=m%2;
				    if(m==1){
				     ta=!ta;
				  	 td=!td;
				    };
					if(q==0){//achtung spiegelung einleiten
					 if(cf->number==12){ 
					  if(c->number==12) return(true); }else{ return(false);
					 };
					 if(cf->number==0){
					  if(c->number==0) return(true); }else{ return(false);
					 };
					};
				    if(ta) if(c->number==(cf->number+1)) return(true);
				    if(td) if(c->number==(cf->number-1)) return(true);
				   }else{
				    if(takeascending) if(c->number==(cf->number+1)) return(true);
				    if(takedescending) if(c->number==(cf->number-1)) return(true);
				   };
				  };
				 };
				};
				return(false);
};
bool _pilefoundation::ascendingmirrored(){
				if(takemirrored){
				 bool ta=takeascending;
			     int m=anzahl()/13;
				 int q=anzahl()%13;
			     m=m%2;
			     if(m==1) ta=!ta;
			     if(ta) return(true);
				}else{
				 if(takeascending) return(true); 
				};
				return(false);
};
bool _pilefoundation::descendingmirrored(){
				if(takemirrored){
				 bool td=takedescending;
			     int m=anzahl()/13;
				 int q=anzahl()%13;
			     m=m%2;
			     if(m==1) td=!td;
			     if(td) return(true);
				}else{
				 if(takedescending) return(true); 
				};
				return(false);
};
void _pilefoundation::drop(_zeit*clock){
				//drop the picklist to the pile pit && record the moves
				_tg i=0;
				_animationundo*m=game->createundo(30,0.1,false);
				while(game->picklist.erstes()){
				 _card*c=game->picklist.erstes()->objekt();
				 _pile*pilefrom=c->pile;
				 c->deinsertpick();
				 c->deinsertpile();
				 _vektor3<_tg> v;
				 _vektor3<_tg> dvx=dropvx();
				 _vektor3<_tg> dvy=dropvy();
				 c->curvespeed=50;
			 	 c->curvevx.setzen(c->vx, dvx, 0,0,-2*i ,0,0,0);  
			 	 c->curvevy.setzen(c->vy, dvy, 0,0,-2*i ,0,0,0);  
			     v=dropposition();
			     if(osmosismode){
				  c->curveposition.setzen(c->position, v, 0,10,-23,60,-60,0);
				 }else{
				  c->curveposition.setzen(c->position, v, 0,0,-3,0,0,0);
				 };
			     c->startcurve();
				 //----------------------- determine destindex for(osmosismode sorted cards -------------------
				 int destindex=0;
				 if(osmosismode){
				  bool stop=false;
				  _card*it;
				  if(anfang(it))do{
				   if(it->number>c->number){
				    destindex++;
				   }else{
				    stop=true;
				   };
				  }while((naechstes(it))&&(stop==false));
				 };//--------------------------------------------------------------------------------------
			     //undo record move
			     _kurvehermite3<_tg> cupo;
			     _kurvehermite3<_tg> cuvx;
			     _kurvehermite3<_tg> cuvy;
			     cupo.ort(0,c->pickposition);
			     cupo.vektor(0,0,0,-10);
			 	 cupo.ort(1,c->curveposition.ort(1));
			 	 cupo.vektor(1,0,0,10);
			     cupo.aktualisieren();
			
				 cuvx.ort(0,c->pickvx);
				 cuvx.vektor(0,0,0,0);
				 cuvx.ort(1,c->curvevx.ort(1));
				 cuvx.vektor(1,0,0,0);
			     cuvx.aktualisieren();

				 cuvy.ort(0,c->pickvy);
				 cuvy.vektor(0,0,0,0);
				 cuvy.ort(1,c->curvevy.ort(1));
				 cuvy.vektor(1,0,0,0);
			     cuvy.aktualisieren();
				 m->use(c,this,true,destindex,0,0,pilefrom,true,c->labindex[0],c->labindex[1],0,cupo,cuvx,cuvy);
				 //end undo record move
				 c->insertpile(this,true,destindex);
				 c->deinsertlabyrinth();
				 //-------------------------------- nun spezielle labyrinth nachfüllung mit demselben undo ---------------
				 _pilestock*ps=game->pilestock(0);
				 if(ps){
				  _pilelabyrinth*pl;
				  if(game->pilelabyrinthlist.anfang(pl))do{
				   pl->fillfirstline(m);
				  }while(game->pilelabyrinthlist.naechstes(pl));
				 };
				 i+=1;
                };
};
_vektor3<_tg> _pilefoundation::dropposition(bool backdrop){
				if(osmosismode){
			     return(droppositionvector(backdrop));
			    }else{
			     return(_pile::dropposition(backdrop));
				};
};
void _pilefoundation::adjustcardposition(){
				if(osmosismode){
				 adjustcardpositionvector();
				}else{
				 _pile::adjustcardposition();
				};
};
void _pilefoundation::effect(){
				effecttimestart=game->solitaire->clock->system();
				effectstatus=1;
				deletesecure(effectgravity);
				effectsource->generationsrateletzterort(position);
				effectsource->ort(position);
};
void _pilefoundation::animateeffect(){
				cardcountactual=cardcount();
				_tg t=game->solitaire->clock->system();
				if(effectstatus>0){
				 if(effectstatus==4){
				  if((t-effecttimestart)>6000){
				   deletesecure(effectgravity);
				   effectstatus=0;
				  };
				 };
				 if(effectstatus==3){
				  if((t-effecttimestart)>2000){
				   effectstatus=4;
				   effectgravity->divergenzintensitaet(0,0.3);
				  };
				 };
				 if(effectstatus==2){
				  if((t-effecttimestart)>50){
				   effectstatus=3;
				   effectsource->aktiv(false);
				  };
				 };
				 if(effectstatus==1){
				  if(cardcurving()==false){
				   effectstatus=2;
				   if(game->solitaire->systemaccellerate==false) effectsource->generationsrate(1500); else effectsource->generationsrate(500);
				   effectsource->aktiv(true);
				   //!!!!!!!!!!!!!!!!!!!!!!!!!!!!effectgravity=game->solitaire->world->feld()->erzeugengravitation(position.x(),position.y(),position.z()-3,3);
				  };
				 };
				};
				if(cardcountactual!=cardcountold){
				 if((cardcountactual%13==0)&&(cardcountactual>0)) effect();
				 cardcountold=cardcountactual;
				};
};
void _pilefoundation::animate(_zeit*c){
				animateeffect();
			    if(game->statsclosed==false) game->discards+=cardcountactual;
				adjustcardposition();
				adjustcardvx();
				animateinput();
				_card*cit;
				if(anfang(cit))do{
				 cit->animate();
				}while(naechstes(cit));
				//********** DEBUG ********
				//Local prev:TLink=gamefoundationlink->vorheriges()
				//if(prev=0// erste Foundation
				// Local h$="Kartenseq : "
				// if(cardlist.anfang(cit))do{  ....  }while(cardlist.naechstes(cit));
				//  h+=cit.number+" , "
				// };
				// Print h
				//};
				//*************************
				animatepileinfo();
				//updateshadow()
};
void _pilefoundation::createshadow(){
				//createshadowblock()
};
void _pilefoundation::updateshadow(){
				//updateshadowblock()
};
void _pilefoundation::updatedescription(){
				description0=L"";
				description1=L"";
				if(osmosismode){
				 description0+=strfoundationosmosismode;
				}else{
				 if(ascendingmirrored()) description0+=strpiletakeascending+strpileplace;
				 if(descendingmirrored()) description0+=strpiletakedescending+strpileplace;
				 if((takeboth)&&(takeascending==false)&&(takedescending==false)) description0=strpiletakeboth+strpileplace;
				 if(takewrapped){
				  if(takeboth){
				   description0+=strpiletakewrapped;
				  }else{ 
				   if(takedescending) description0+=strpiletakewrappeddescending;
				   if(takeascending) description0+=strpiletakewrappedascending;
				  };
				 };
				 description1=L"";
				 if(takemirrored){
				  if(takeascending) description1+=strpiletakemirroredascending;
				  if(takedescending) description1+=strpiletakemirroreddescending;
				 };
				 if(giverestriction) description1+=strpilegiverestriction;
				};
};
void _pilefoundation::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilefoundation"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(osmosismode);
};
void _pilefoundation::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(osmosismode);
};
void _pilefoundation::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};

//******************************************************************************************************************
//										P I L E R E S E R V E 
//******************************************************************************************************************
_pilereserve::_pilereserve(_game*g,_tg px,_tg py):_pile(g,px,py),_listenknotenbasis<_pilereserve>(&g->pilereservelist){
	            flowermode=false;
	            arcmode=false;
	            pyramidmode=false;
				takerestriction=true;
				name=strpilereserve;
				drawownshadow=false;
};
_pilereserve::~_pilereserve(){
};
bool _pilereserve::canpick(_card*c){
				if(giverestriction) return(false);
				if(flowermode){
				 return(true);
				}else{
				 if(c->vorheriges()==c->liste()->letztes()) return(true);
				};
				return(false);
};
void _pilereserve::pick(_card*c){//picks only the card c , not others in list,to the picklist
				if(pyramidmode){
				 if(c->number==12){
				  c->discard();
				  _animationundo*u=game->createundo(20,20);
				  u->use(c,game->getpilediscardminimum(),true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				  c->deinsertpyramid();
				 }else{
				  c->pick();
				 };
				}else{
				 if(flowermode){
				  c->pick();
				 }else{
				  _pile::pick(c);
				 };
				};
};
void _pilereserve::pickextern(_card*c,_liste<_card>*l){
				if(pyramidmode){
				 l->einhaengen(c);
				}else{
				 if(flowermode){
				  l->einhaengen(c);
				 }else{
				  _pile::pickextern(c,l);
				 };
				};
};
bool _pilereserve::candrop(_liste<_card>*list,bool samesuit){
				if(takerestriction) return(false);
				//weaving check
				_pilestock*ps=game->pilestock(0);
				if(ps){
				 if(ps->erstes()==0){
				  if(ps->canredeal()==false){
				   if(erstes()==0) return(true);
				  };
				 };
				};
				return(false);
};	
void _pilereserve::pickslopeposition(_card*c,_vektor3<_tg>&p){
				if(arcmode){
				 pickslopepositionarc(c,p);
				}else{
				 _pile::pickslopeposition(c,p);
				};
};
void _pilereserve::pickslopeplane(_card*c,_vektor3<_tg>&vvx,_vektor3<_tg>&vvy){
				if(arcmode){
				 pickslopeplanearc(c,vvx,vvy);
				}else{
				 _pile::pickslopeplane(c,vvx,vvy);
				};
};
_vektor3<_tg> _pilereserve::dropposition(bool backdrop){
				if(arcmode){
				 return(droppositionarc(backdrop));
				}else{
			     return(droppositionvector(backdrop));
				};
};
_vektor3<_tg> _pilereserve::dropvy(){
				if(arcmode){
				 return(dropvyarc());
				}else{
				 _vektor3<_tg> v;
				 v.setzen(0,game->cardheight,-game->solitaire->cardslope);
				 return(v);
				};
};
_vektor3<_tg> _pilereserve::dropvx(){
				if(arcmode){
				 return(dropvxarc());
				}else{				
				 return(_pile::dropvx());
				};
};
void _pilereserve::adjustcardvy(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->curving==false)&&(cit->picked==false)){
	     		   cit->vy.setzen(0,game->cardheight,-game->solitaire->cardslope);
				  };
				 }while(naechstes(cit));
				};
};
void _pilereserve::animate(_zeit*c){
				if(arcmode){
				 adjustcardvyarc(true);
				 adjustcardvxarc(true);
				 adjustcardpositionarc(true);
				 animatemouseovercardarc();
				}else{
				 adjustcardvy();
				 adjustcardvx();
				 adjustcardpositionvector();
				 _card*cit;
				 if(anfang(cit))do{
				  cit->animate();
			 	 }while(naechstes(cit));
				};
				animateinput();
				animatetableaufill();
				animatepileinfo();
				updatedescription();
				//updateshadow();
};
void _pilereserve::createshadow(){
				//createshadowstripe()
};
void _pilereserve::updateshadow(){
				//updateshadowstripe()
};
void _pilereserve::updatedescription(){
				_zeichenkette<_tt> d=L"";
				bool weavingon=false;
				if(takerestriction==false){
				 bool r=false;
				 _pilestock*ps=game->pilestock(0);
				 if(ps){
				  if(ps->erstes()==0){
				   if(ps->canredeal()==false){
				    r=true;
				   };
				  };
				 };	
				 if(r==false){
				  d=strreserveweavingoff;
				 }else{
				  d=strreserveweavingon;
				  weavingon=true;
				 };
				};
				if(anzahl()>0){
				 if(flowermode){
				  d+=strreserveflowermode;
				 }else{
				  d+=strreservenormal;
				 };
				}else{
				 if(weavingon) d+=strreservetake;
				};
				description0=d;
				description1=L"";
};
void _pilereserve::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilereserve"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(flowermode);
				d->speichern(arcmode);
				d->speichern(pyramidmode);
};
void _pilereserve::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(flowermode);
				d->laden(arcmode);
				d->laden(pyramidmode);
};
void _pilereserve::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();

};


//******************************************************************************************************************
//										P I L E F R E E C E L L 
//******************************************************************************************************************
_pilefreecell::_pilefreecell(_game*g,_tg px,_tg py,int s):_pile(g,px,py),_listenknotenbasis<_pilefreecell>(&g->pilefreecelllist){
				suit=s;
				name=strpilefreecell;
};
_pilefreecell::~_pilefreecell(){
};
void _pilefreecell::draw(_grafik*gra,_kamera<_tg>*cam){
				mesh->erzeugenvertexlicht();
	    		//_licht<_tg,_to>*lit;if(game->solitaire->world->anfang(lit))do{  .... }while(game->solitaire->world->naechstes(lit));
				// mesh->determinevertexlight(lit)
				//};
				mesh->zeichnen(gra);
				int s=suit;
				int n=-1;
				_polygon*pit;
				if(s!=-1){
				 if(meshsuit->anfang(pit))do{
				  pit->textur(game->solitaire->tsymbolsuit[s]);
				 }while(meshsuit->naechstes(pit));
				 meshsuit->erzeugenvertexlicht();
	    		 //_licht<_tg,_to>*lit;if(game->solitaire->world->anfang(lit))do{  .... }while(game->solitaire->world->naechstes(lit));
				 // meshsuit.determinevertexlight(lit)
				 //};
				 meshsuit->zeichnen(gra);
				};
				if(n!=-1){
				 if(meshnumber->anfang(pit))do{
				  pit->textur(game->solitaire->tsymbolnumber[n]);
				 }while(meshnumber->naechstes(pit));
				 meshnumber->erzeugenvertexlicht();
	    		 //_licht<_tg,_to>*lit;if(game->solitaire->world->anfang(lit))do{  .... }while(game->solitaire->world->naechstes(lit));
				 // meshnumber.determinevertexlight(lit)
				 //};
				 meshnumber->zeichnen(gra);
				};
};
bool _pilefreecell::canpick(_card*c){
				if(giverestriction) return(false);
				if(anzahl()==0) return(false);
				return(true);
};
bool _pilefreecell::candrop(_liste<_card>*list,bool samesuit){
				if(takerestriction) return(false);
				if((list->anzahl()==1)&&(anzahl()==0)){ 
				 if(suit==-1) return(true);
				 _card*c=list->erstes()->objekt();
			     if(c->suit==suit) return(true);
				};
				return(false);
};
void _pilefreecell::animate(_zeit*clock){
				adjustcardposition();
				adjustcardvx();
				animateinput();
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				animatepileinfo();
};
void _pilefreecell::updatedescription(){
				_zeichenkette<_tt> d=L"";
				if(suit!=-1) d=strpilesuitbound;
				description0=d;
				description1=L"";
};
void _pilefreecell::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilefreecell"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(suit);
};
void _pilefreecell::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(suit);
};
void _pilefreecell::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};


//******************************************************************************************************************
//										P I L E P Y R A M I D 
//******************************************************************************************************************
_pilepyramid::_pilepyramid(_game*g,_tg px,_tg py):_pile(g,px,py),_listenknotenbasis<_pilepyramid>(&g->pilepyramidlist){
				name=strpilepyramid;
	            initialized=false;
	            dropcard=0;
};
_pilepyramid::~_pilepyramid(){
};
_card*_pilepyramid::cardfromlast(int index){
				if(index<0) return(0);
				if(index>=int(anzahl())) return(0);
				_card*it=letztes();
				int i=0;
				if(it){
				 do{
				  if(i==index) return(it);
				  i+=1;
				  it=it->vorheriges();
				  if(it==letztes()) it=0;
				 }while(it);
				};
				return(0);
};
void _pilepyramid::initcardpyramid(){
				//only once at startup after preparative animation
				if(initialized==false){
				 initialized=true;
				 int ci=0;
				 int zeile=0;
				 int spalte=0;
				 _card*it=letztes();
				 if(it){
				  do{
				   _card*c=it;
				   c->child[0]=cardfromlast(ci+zeile+1);
				   c->child[1]=cardfromlast(ci+zeile+2);
				   if(ci!=0){
				    if(spalte>0) c->parent[0]=cardfromlast(ci-(zeile+1));
				    if(spalte<zeile) c->parent[1]=cardfromlast((ci-(zeile+1))+1);
				   };
				   spalte+=1;
				   if(spalte>zeile){
				    spalte=0;
				    zeile+=1;
				   };				
				   ci+=1;
				   it=it->vorheriges();
				   if(it==letztes()) it=0;
				  }while(it); 
				 };
				};
};
bool _pilepyramid::canpick(_card*c){
				if(giverestriction) return(false);
				if(cardcurvingindiscard()) return(false);
				if((c->child[0]==0)&&(c->child[1]==0)) return(true);
				return(false);
};
void _pilepyramid::pick(_card*c){
				if(c->number==12){
				 c->discard();
				 _animationundo*u=game->createundo(20,20);
				 u->use(c,game->getpilediscardminimum(),true,0,0,0,this,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				 c->deinsertpyramid();
				}else{
				 c->pick();
				};
};
void _pilepyramid::pickextern(_card*c,_liste<_card>*l){
				l->einhaengen(c);
};
bool _pilepyramid::cardcurvingindiscard(){
				if(game->pilediscardlist.erstes()==0) return(false);
				_pilediscard*dit;
				_card*cit;
				if(game->pilediscardlist.anfang(dit))do{
				 if(dit->anfang(cit))do{
				  if(cit->curving) return(true);
				 }while(dit->naechstes(cit));
				}while(game->pilediscardlist.naechstes(dit));
				return(false);
};
bool _pilepyramid::candrop(_liste<_card>*list,bool samesuit){
				dropcard=0;
				if(takerestriction) return(false);
				if(list->anzahl()==1){
				 _card*pc=list->erstes()->objekt();
				 _card*cit;
				 if(anfang(cit))do{
				  if(cit->inner()){
				   if((cit->child[0]==0)&&(cit->child[1]==0)){
				    if(((pc->number+1)+(cit->number+1))==13){
				     dropcard=cit;
				     return(true);
				    };
				   };
				  };
				 }while(naechstes(cit));
				};
				return(false);
};
void _pilepyramid::drop(_zeit*clock){
				//drop the picklist to the discardpile && record the moves
				if((dropcard)&&(game->picklist.erstes())){
				 _animationundo*m=game->createundo(30,0.1,true);
				 //move the targetdropcard "dropcard" to the discardpile
				 _pilediscard*pd=game->getpilediscardminimum();
				 _vektor3<_tg> dvx=pd->dropvx();
				 _vektor3<_tg> dvy=pd->dropvy();
				 _vektor3<_tg> vn;
				 _vektor3<_tg> vyy;
				 _vektor3<_tg> vtp;
				 _vektor3<_tg> vtn;
				 _vektor3<_tg> vtm;
				 _vektor3<_tg> vto;
				 vtp.setzen(-25,-25,20);
				 vtn.setzen(30,30,-20);
				 vtm.setzen(0,0,-10);
				 vto.setzen(0,0,10);
				 vn.setzen(0,0,0);
				 vyy.setzen(0,game->cardheight,0);
				 dropcard->curvespeed=40;
				 dropcard->curvevx.setzen(dropcard->vx,dvx,vtm,vto);
				 dropcard->curvevy.setzen(dropcard->vy,dvy,vtm,vn);
				 dropcard->curveposition.setzen(dropcard->position,pd->dropposition(),vtn,vtp);
				 dropcard->startcurve();
				 dropcard->deinsertpile();
				 dropcard->insertpile(pd,true);
				 //Local u:_animationundo=game->createundo(20,20)
				 m->use(dropcard,pd,true,0,0,0,this,true,0,0,0,dropcard->curveposition,dropcard->curvevx,dropcard->curvevy);
				 dropcard->deinsertpyramid();
				 //move the picked card to the discardpile
				 _tg i=0;
				 _card*c=game->picklist.erstes()->objekt();
				 _pile*pilefrom=c->pile;
				 c->deinsertpick();
				 c->deinsertpile();
				 _vektor3<_tg> v;
				 vtp.setzen(-25,-25,25);
				 vtn.setzen(30,30,-25);
				 c->curvespeed=30;
			 	 c->curvevx.setzen(c->vx, dvx, 0,0,-10 ,0,0,10);  
			 	 c->curvevy.setzen(c->vy, dvy,vtm,vn);
			     v=pd->dropposition();
				 c->curveposition.setzen(c->position,v,vtn,vtp);
			     c->startcurve();
			     //undo record move
			     _kurvehermite3<_tg> cupo;
			     _kurvehermite3<_tg> cuvx;
			     _kurvehermite3<_tg> cuvy;
			     cupo.ort(0,c->pickposition);
			     cupo.vektor(0,0,0,-10);
			 	 cupo.ort(1,c->curveposition.ort(1));
			 	 cupo.vektor(1,0,0,+10);
			     cupo.aktualisieren();
				 cuvx.ort(0,c->pickvx);
				 cuvx.vektor(0,0,0,0);
				 cuvx.ort(1,c->curvevx.ort(1));
				 cuvx.vektor(1,0,0,0);
			     cuvx.aktualisieren();
				 cuvy.ort(0,c->pickvy);
				 cuvy.vektor(0,0,0,0);
				 cuvy.ort(1,c->curvevy.ort(1));
				 cuvy.vektor(1,0,0,0);
			     cuvy.aktualisieren();
				 m->use(c,pd,true,0,0,0,pilefrom,true,0,0,0,cupo,cuvx,cuvy);
				 //end undo record move
				 c->deinsertpyramid();
				 c->insertpile(pd,true);
				 dropcard=0;
				};
};
_vektor3<_tg> _pilepyramid::dropvy(){
				return(_vektor3<_tg>(0,game->cardheight,-game->solitaire->cardslope));
};
_vektor3<_tg> _pilepyramid::dropposition(bool backdrop){
				_vektor3<_tg> v;
				_tg n=anzahl();
				int zeile=0;
				int spalte=0;
				_tg xit=position.x();
				_tg yit=position.y();
				_tg zit=position.z()-game->solitaire->cardtableaulift;
	 			_tg tabx=game->tabulatorx();
				for(int i=0;i<n;i++){
				 xit+=tabx;
				 spalte+=1;
				 if(spalte>zeile){
				  spalte=0;
				  zeile+=1;
				  xit=position.x()-((_tg(zeile)*tabx)*0.5);
				  yit-=game->cardheight*0.5;
				  zit-=game->solitaire->cardthickness;
				 };				
				};
				v.setzen(xit,yit,zit);
				return(v);
};
void _pilepyramid::adjustcardvy(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->curving==false)&&(cit->picked==false)){
	     		   cit->vy.setzen(0,game->cardheight,-game->solitaire->cardslope);
	 			   //cit.normcardplane()
				  };
				 }while(naechstes(cit));
				};
};
void _pilepyramid::adjustcardposition(){
				bool ok=false;
				if(game->animationlist.erstes()==0 ){
				 ok=true;
				}else{
				 _animationundo*a=dynamic_cast<_animationundo*>(game->animationlist.erstes());
				 if(a) ok=true;
				};
				if(ok){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->curving==false)&&(cit->picked==false)){
	     		   cit->position.z(position.z()-game->solitaire->cardtableaulift);
	 			   cit->position.z(cit->position.z()-((position.y()-cit->position.y())/(game->cardheight*0.5))*game->solitaire->cardthickness);
				  };
				 }while(naechstes(cit));
				};
};
void _pilepyramid::animate(_zeit*clock){
				adjustcardvy();
				adjustcardvxsingle();
				adjustcardposition();
				animateinput();
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				animatepileinfo();
};
void _pilepyramid::updatedescription(){
				description0=strpyramidenormal0;
				description1=strpyramidenormal1;
};
void _pilepyramid::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilepyramid"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(initialized);
				speichernzeiger(d,dropcard);
};
void _pilepyramid::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(initialized);
				ladenzeiger(d);
};
void _pilepyramid::assoziieren(){
				if(zeigergeladen()){
				 assoziierenzeiger(dropcard);
				 loeschenzeiger();
				};
};

//******************************************************************************************************************
//										P I L E B E T H O R A L
//******************************************************************************************************************
_pilebethoral::_pilebethoral(_game*g,_tg px,_tg py):_piletableau(g,px,py){
				stretchfriction=0.8;
				stretchhaerte=0.05;
				status=0;
				//linktableau=tableau.pilelist.einhaengen(this)
				name=strpiletableau;
				//createshadow()
				drawownshadow=false;
};
bool _pilebethoral::canpick(_card*c){
				//status=1
				if(giverestriction) return(false);
				if((c->vorheriges()==c->liste()->letztes())||(c->naechstes()==c->liste()->erstes())) return(false);
				_card*cp=c->vorheriges();
				_card*cn=c->naechstes();
				if((cp->suit==cn->suit)||(cp->number==cn->number)) return(true);
				if(cn->naechstes()!=cn->liste()->erstes()){
				 _card*cnn=cn->naechstes();
				 if((cp->suit==cnn->suit)||(cp->number==cnn->number)) return(true);
				};
				if(cp->vorheriges()!=cp->liste()->letztes()){
				 _card*cpp=cp->vorheriges();
				 if((cpp->suit==cn->suit)||(cpp->number==cn->number)) return(true);
				};
				return(false);
};
void _pilebethoral::pick(_card*c){
				discard(c);
};
void _pilebethoral::pickextern(_card*c,_liste<_card>*l){
				l->einhaengen(c);
};
bool _pilebethoral::candrop(_liste<_card>*list,bool samesuit){
	 			return(false);
};
void _pilebethoral::discard(_card*card){
				//the pile is a bethoral pile
				int ci=card->index();
				if(game->pilediscardlist.erstes()){
				 _pilediscard*pd=game->getpilediscardminimum();
				 _vektor3<_tg> vn;
				 _vektor3<_tg> dvx=pd->dropvx();
				 _vektor3<_tg> dvy=pd->dropvy();
				 _vektor3<_tg> vtp;
				 _vektor3<_tg> vtn;
				 vtp.setzen(0,0,10);
				 vtn.setzen(-40,40,-8);
				 vn.setzen(0,0,0);
				 card->curvespeed=30;
				 card->curvevx.setzen(card->vx,dvx,vn,vn);
				 card->curvevy.setzen(card->vy,dvy,vn,vn);
				 card->curveposition.setzen(card->position,pd->dropposition(),vtn,vtp);
				 card->startcurve();
				 _animationundo*u=game->createundo(30,20);
				 u->use(card,pd,true,0,0,0,this,true,ci,0,0,card->curveposition,card->curvevx,card->curvevy);
				 //card->discard(true)	
				 card->deinsertpile();
				 card->insertpile(pd,true);
				};						
};
void _pilebethoral::pickslopeplane(_card*c,_vektor3<_tg>&vvx,_vektor3<_tg>&vvy){
				pickslopeplanearc(c,vvx,vvy);
};
void _pilebethoral::pickslopeposition(_card*c,_vektor3<_tg>&p){
				pickslopepositionarc(c,p);
};
_vektor3<_tg> _pilebethoral::dropposition(bool backdrop){
				return(droppositionarc(backdrop));
};
_vektor3<_tg> _pilebethoral::dropvx(){
				return(dropvxarc());
};
_vektor3<_tg> _pilebethoral::dropvy(){
				return(dropvyarc());
};
void _pilebethoral::setangle(_card*c){
				setanglearc(c);
};
void _pilebethoral::animate(_zeit*clock){
				adjustcardpositionarc();
				adjustcardvyarc();
				adjustcardvxarc();
				animatemouseovercardarc();
				if(status==0){
				 if((game->solitaire->mousebutton[0])||(game->solitaire->mousebutton[1])){
				  status=1;
				 };
				 animateinput();
				};
				if(status==1){
				 if((game->solitaire->mousebutton[0]==false)&&(game->solitaire->mousebutton[1]==false)){
				  status=0;
				 };
				};
				animatepileinfo();
				//updateshadow()
};
void _pilebethoral::createshadow(){
				//createshadowstripe()
};
void _pilebethoral::updateshadow(){
				//updateshadowstripe()
};
void _pilebethoral::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilebethoral"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(status);
};
void _pilebethoral::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(status);
};
void _pilebethoral::assoziieren(){
				if(zeigergeladen()) loeschenzeiger();
};
//******************************************************************************************************************
//										P I L E B L A N K E T
//******************************************************************************************************************
_pileblanket::_pileblanket(_game*g,_tg px,_tg py):_piletableau(g,px,py){
				name=strpiletableau;
				drawownshadow=false;
				dropass=0;
				status=0;
};
_pileblanket::~_pileblanket(){
};
void _pileblanket::draw(_grafik*gra,_kamera<_tg>*cam){
				_vektor3<_tg> p;
				_vektor3<_tg> o;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				o=position;
				for(int x=0;x<13;x++){
				 position.x(o.x()+_tg(x)*tabx);
				 updatemesh();
				 mesh->erzeugenvertexlicht();
	    		 //_licht<_tg,_to>*lit;if(game->solitaire->world->anfang(lit))do{  .... }while(game->solitaire->world->naechstes(lit));
				 // mesh->determinevertexlight(lit)
				 //};
				 gra->transparenzmultiplikativ();
				 mesh->zeichnen(gra);
				 gra->transparenz(false);
				};
				position=o;
};
bool _pileblanket::leftestcard(_card*c){
				_vektor3<_tg> q=position;
				q.z(q.z()-game->solitaire->cardtableaulift);
				q-=c->position;
				if(q.laenge()<0.1) return(true);// weil es die linkeste karte ist
				return(false);
};
bool _pileblanket::rightestcard(_card*c){
				_vektor3<_tg> q=position;
				_tg tabx=game->tabulatorx();
				q.z(q.z()-game->solitaire->cardtableaulift);
				q.x(q.x()+(anzahl()-1)*tabx);
				q-=c->position;
				if(q.laenge()<0.1) return(true);// weil es die linkeste karte ist
				return(false);
};
_card*_pileblanket::cardat(const _vektor3<_tg>&o){
				_card*r=0;
				_vektor3<_tg> h;
				_card*cit;
				if(anfang(cit))do{
				 if(cit->curving==false){
				  h=o;
				  h-=cit->position;
				  if(h.laenge()<0.1) r=cit;
				 };
				}while(naechstes(cit));
				return(r);
};
bool _pileblanket::canpick(_card*c){
				if(giverestriction) return(false);
				if(c->number==0) return(false);
				return(true);
};
void _pileblanket::pick(_card*c){//picks only the card c , not others in list,to the picklist
				c->pick();
};
void _pileblanket::pickextern(_card*c,_liste<_card>*l){
				l->einhaengen(c);
};
bool _pileblanket::candrop(_liste<_card>*list,bool samesuit){
				dropass=0;
				if(takerestriction) return(false);
				if(list->anzahl()!=1) return(false);
				
				_card*card=list->erstes()->objekt();
				_tg tabx=game->tabulatorx();
				_card*cit;
				if(anfang(cit))do{
				 if((cit->inner()) ||( cit->innercard(card))){

				  if(cit->number==0){
				   //zuerst prüfen ob cit die linkeste karte ist 
				   if(leftestcard(cit)){
				    dropass=cit;
				    return(true);
				   };
				   //die card cn ist diejenige die in der nähe von o liegt
				   _vektor3<_tg> o;
				   o=cit->position;
				   o.x(o.x()-tabx);
				   _card*cn=0;
				   _card*cii;
				   if(anfang(cii))do{
					if((cii!=cit)&&(cii!=card)){
				     _vektor3<_tg> d;
				     d=o;
				     d-=cii->position;
				     if(d.laenge()<0.1) cn=cii;
				    };
				   }while(naechstes(cii));
				   if(cn==0) return(false);//es gibt keinen nachbarn, fehler weil dies vorher abgefangen werden müßte
				   if(cn->suit!=card->suit) return(false);
				   if(cn->number==12) return(false);
				   if((cn->number+1)!=card->number) return(false);
				   dropass=cit;
				   return(true);
				  };
				 };
				}while(naechstes(cit));
	 			return(false);
};
bool _pileblanket::candropat(_card*card,_card*cd){
				//kann die Karte "card" bei
				//position cd.position gedroppt werden?
				dropass=0;
				if(cd->number!=0) return(false);
				//zuerst prüfen ob cd die linkeste karte ist 
				if(leftestcard(cd)){
				 dropass=cd;
				 return(true);
				};
				//die card cn ist diejenige die in der nähe von o liegt
				_vektor3<_tg> o;
				_tg tabx=game->tabulatorx();
				o=cd->position;
				o.x(o.x()-tabx);
				_card*cn=cardat(o);
				if(cn==0) return(false);//es gibt keinen nachbarn, fehler weil dies vorher abgefangen werden müßte
				if(cn->suit!=card->suit) return(false);
				if(cn->number==12) return(false);
				if((cn->number+1)!=card->number) return(false);
				dropass=cd;
				return(true);
};
void _pileblanket::drop(){
				//drop the picked card to the this pile && record the moves
				if(game->picklist.erstes()) swap(game->picklist.erstes()->objekt(),dropass,true);
}; 
void _pileblanket::swap(_card*c,_card*ass,bool unused){
				if(c->picked) c->depick();
				_vektor3<_tg> tquelle;
				_vektor3<_tg> tziel;
				_vektor3<_tg> cardquelle;
				_vektor3<_tg> cardquellevx;
				_vektor3<_tg> cardquellevy;
				_vektor3<_tg> cardziel;
				_vektor3<_tg> cardzielvx;
				_vektor3<_tg> cardzielvy;
				
				tquelle.setzen(0,0,-10);
				tziel.setzen(0,0,10);
				
				if(ass->curving){
				 cardziel=ass->curveposition.ort(1);
				 cardzielvx=ass->curvevx.ort(1);
				 cardzielvy=ass->curvevy.ort(1);
				}else{ 
				 cardziel=ass->position;
				 cardzielvx=ass->vx;
				 cardzielvy=ass->vy;
				};
				if(c->curving){
				 cardquelle=c->pickposition;
				 cardquellevx=c->pickvx;
				 cardquellevy=c->pickvy;
				}else{
				 cardquelle=c->position;
				 cardquellevx=c->vx;
				 cardquellevy=c->vy;
				};
				_animationundo*m=game->createundo(30,0.1,true);
				_pile*pilefrom=c->pile;
				c->deinsertpile();
				_vektor3<_tg> v;
				_vektor3<_tg> dvx=dropvx();
				_vektor3<_tg> dvy=dropvy();
				c->curvespeed=20;
			 	c->curvevx.setzen(c->vx, dvx, 0,0,10 ,0,0,-10);
			 	c->curvevy.setzen(c->vy, dvy, 0,0,-5 ,0,0,-5);
			    c->curveposition.setzen(c->position,cardziel,tquelle,tziel);
			    c->startcurve();
			    //undo record move
			    _kurvehermite3<_tg> cupo;
			    _kurvehermite3<_tg> cuvx;
			    _kurvehermite3<_tg> cuvy;
			    cupo.ort(0,cardquelle);
			 	cupo.ort(1,cardziel);//c->curveposition.o1)
			    cupo.vektor(0,0,0,-10);
			 	cupo.vektor(1,0,0,10);
				cuvx.ort(0,cardquellevx);
				cuvx.ort(1,cardzielvx);
				cuvx.vektor(0,0,0,0);
				cuvx.vektor(1,0,0,0);
		 		cuvy.ort(0,cardquellevy);
		 		cuvy.ort(1,cardzielvy);
				cuvy.vektor(0,0,0,0);
			 	cuvy.vektor(1,0,0,0);
			    cupo.aktualisieren();
			    cuvx.aktualisieren();
			    cuvy.aktualisieren();
				m->use(c,this,true,0,0,0,pilefrom,true,0,0,0,cupo,cuvx,cuvy);
				//end undo record move
				_pile*asspilefrom=ass->pile;
				c->insertpile(this,true,0);
				v.setzen(0,0,0);
				ass->curvespeed=1000;
			 	ass->curvevx.setzen(ass->vx,ass->vx,v,v);
			 	ass->curvevy.setzen(ass->vy,ass->vy,v,v);
				ass->curveposition.setzen(cardziel,cardquelle,v,v);
				ass->startcurve();
				ass->deinsertpile();
				m->use(ass,pilefrom,true,0,0,0,asspilefrom,true,0,0,0,ass->curveposition,ass->curvevx,ass->curvevy);
				ass->insertpile(pilefrom,true,0);
};
_vektor3<_tg> _pileblanket::dropvy(){
				_vektor3<_tg> v;
				v.setzen(0,game->cardheight,-game->solitaire->cardslope);
				return(v);
};
_vektor3<_tg> _pileblanket::dropposition(bool backdrop){
				_vektor3<_tg> v;
				_tg tabx=game->tabulatorx();
				v=position;
				v.z(v.z()-game->solitaire->cardtableaulift);
				v.x(v.x()+tabx*_tg(anzahl()));
				return(v);
};
void _pileblanket::adjustcardvy(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->curving==false)&&(cit->picked==false)){
	     		   cit->vy.setzen(0,game->cardheight,-game->solitaire->cardslope);
				  };
				 }while(naechstes(cit));
				};
};
void _pileblanket::adjustcardposition(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->picked==false)&&(cit->curving==false)) cit->position.z(position.z()-game->solitaire->cardtableaulift);
				 }while(naechstes(cit));
				};
};
void _pileblanket::animate(_zeit*clock){
				if(game->statsclosed==false){
				 int s=-1;
				 int n=1;
				 _vektor3<_tg> o;
				 o=position;
				 o.z(o.z()-game->solitaire->cardtableaulift);
				 bool stop=false;
				 _card*c=0;
				 _tg tabx=game->tabulatorx();
				 do{
				  c=cardat(o);
				  if(c){
				   if(s==-1) s=c->suit;
				   if(c->number!=n) stop=true;
				   if(c->suit!=s) stop=true;
				  };
				  if((c)&&(stop==false)){
				   game->discards++;
				   o.x(o.x()+tabx);
				   n++;
				  };
				 }while((c)&&(stop==false));
				};
				adjustcardvy();
				adjustcardvxsingle();
				adjustcardposition();
				animateinput();
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				animatepileinfo();
};
void _pileblanket::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pileblanket"));
				d->speichern(speichername());
				savepile(d);
				speichernzeiger(d,dropass);
				d->speichern(status);
};
void _pileblanket::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				ladenzeiger(d);
				d->laden(status);
};
void _pileblanket::assoziieren(){
				if(zeigergeladen()) {
				 assoziierenzeiger(dropass);
				 loeschenzeiger();
				};
};

//******************************************************************************************************************
//										P I L E M A Z E
//******************************************************************************************************************
 _pilemaze::_pilemaze(_game*g,_tg px,_tg py,int d):_pileblanket(game,px,py){
				size=d;
				//linktableau=tableau.pilelist.einhaengen(this)
				name=strpiletableau;
				drawownshadow=false;
};
_pilemaze::~_pilemaze(){
};
void _pilemaze::draw(_grafik*gra,_kamera<_tg>*cam){
				
				_vektor3<_tg> p;
				_vektor3<_tg> o;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				o=position;
				for(int x=0;x<size;x++) {
				 position.x(o.x()+_tg(x)*tabx);
				 updatemesh();
				 mesh->erzeugenvertexlicht();
	    		 //_licht<_tg,_to>*lit;if(game->solitaire->world->anfang(lit))do{  .... }while(game->solitaire->world->naechstes(lit));
				 // mesh->determinevertexlight(lit)
				 //};
				 gra->transparenzmultiplikativ();
				 mesh->zeichnen(gra);
				 gra->transparenz(false);
				};
				position=o;
};
bool _pilemaze::canpick(_card*c){
				if(giverestriction) return(false);
				if(c->number==12) return(false);
				return(true);
};
bool _pilemaze::candrop(_liste<_card>*list,bool samesuit){
				dropass=0;
				if(takerestriction) return(false);
				if(list->anzahl()!=1) return(false);
				_card*card=list->erstes()->objekt();
				_card*cit;
				if(anfang(cit))do{
				 if((cit->inner())||(cit->innercard(card))){
				  if(cit->number==12){
				   if(candropcardatcard(card,cit)){
				    dropass=cit;
				    return(true);
				   };
				  };
				 };
				}while(naechstes(cit));
	 			return(false);
};
bool _pilemaze::candropat(_card*card,_card*cd){
				//kann die Karte "card" bei
				//karte cd gedroppt werden?
				dropass=0;
				if(cd->number!=12) return(false);
				if(candropcardatcard(card,cd)){
				 dropass=cd;
				 return(true);
				};
				return(false);
};
bool _pilemaze::candropcardatcard(_card*card,_card*cit){
				_card*cp=0;
				_card*cn=0;
			    _vektor3<_tg> o;
			    _tg tabx=game->tabulatorx();
				//------------------------------------------------------------------die previous card cp ermitteln :				
				//die card cp ist diejenige die in der nähe von o liegt
				//zuerst prüfen ob cit die linkeste karte ist 
				if(leftestcard(cit)){
				 _pilemaze*pp;
				 if(_listenknotenbasis<_piletableau>::vorheriges()!=game->piletableaulist.letztes()){
				  pp=dynamic_cast<_pilemaze*>(_listenknotenbasis<_piletableau>::vorheriges());
				 }else{
				  pp=dynamic_cast<_pilemaze*>(game->piletableaulist.letztes());
				 };
				 o=pp->position;
				 o.x(o.x()+tabx*(pp->anzahl()-1));
				 o.z(o.z()-game->solitaire->cardtableaulift);
				 cp=pp->cardat(o);
				}else{
				 cp=0;
				 _vektor3<_tg> o;
				 o=cit->position;
				 o.x(o.x()-tabx);
				 _card*cii;
				 if(anfang(cii))do{
				  if((cii!=cit)&&(cii!=card)){
				   _vektor3<_tg> d=o-cii->position;
				   if(d.laenge()<0.1) cp=cii;
				  };
				 }while(naechstes(cii));
				};
				//------------------------------------------------------------------die }; card cn ermitteln :				
				//die card cp ist diejenige die in der nähe von o liegt
				//zuerst prüfen ob cit die linkeste karte ist 
				if(rightestcard(cit)){
				 _pilemaze*pn;
				 if(_listenknotenbasis<_piletableau>::naechstes()!=game->piletableaulist.erstes()){
				  pn=dynamic_cast<_pilemaze*>(_listenknotenbasis<_piletableau>::naechstes());
				 }else{
				  pn=dynamic_cast<_pilemaze*>(game->piletableaulist.erstes());
				 };
				 o=pn->position;
				 o.z(o.z()-game->solitaire->cardtableaulift);
				 cn=pn->cardat(o);
				}else{
				 cn=0;
				 o=cit->position;
				 o.x(o.x()+tabx);
				 _card*cii;
				 if(anfang(cii))do{
				  if((cii!=cit)&&(cii!=card)){
				   _vektor3<_tg> d=o-cii->position;
				   if(d.laenge()<0.1) cn=cii;
				  };
				 }while(naechstes(cii));
				};
				//--------------------------------------------------- auswertung --------------------------------
				if(cp){// || cn=0 return(false);//fehler, maze hat zyklische piles
				 if((cp->suit==card->suit)&&((cp->number+1)==card->number)&&(cp->number!=12)){
				  return(true);
				 };
				};
				if(cn){
				 if((cn->suit==card->suit)&&((cn->number-1)==card->number)&&(cn->number!=12)){
				  return(true);
				 };
				};
				return(false);
};
void _pilemaze::animate(_zeit*clock){
				if(game->statsclosed==false){
				 if(_listenknotenbasis<_piletableau>::vorheriges()==game->piletableaulist.letztes()){//nur der erste mazepile zählt die punkte
				  _card*ace[4];
				  _card*cit;
				  _vektor3<_tg> acepos[4];
				  int ai=0;
				  for(int i=0;i<4;i++){
				   ace[i]=0;
				  };
				  ai=0;
				  _piletableau*pit;
				  if(game->piletableaulist.anfang(pit))do{
				   if(pit->anfang(cit))do{
				    if(cit->number==0){
				     ace[ai]=cit;
				     acepos[ai]=cit->position;
				     ai+=1;
				    };
				   }while(pit->naechstes(cit));
				  }while(game->piletableaulist.naechstes(pit));
				  for(ai=0;ai<4;ai++){
				   if(ace[ai]){
				    int n=0;
				    int s=ace[ai]->suit;
				    bool stop=false;
				    _pilemaze*pit=dynamic_cast<_pilemaze*>(ace[ai]->pile);
				    pit=iteratevector(acepos[ai],pit);
				    do{
				     cit=pit->cardat(acepos[ai]);
				     if(cit){
				      if((cit->number==(n+1))&&(cit->suit==s)&&(cit->number<12)){
				       n+=1;
				       game->discards+=1;
				       pit=iteratevector(acepos[ai],pit);
				      }else{
				       stop=true;
				      };
					 };
				    }while((stop==false)&&(cit));//Until stop || cit=0
				   };
				  };
				 };
				};
				adjustcardvy();
				adjustcardvxsingle();
				adjustcardposition();
				animateinput();
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				animatepileinfo();
};
_pilemaze*_pilemaze::iteratevector(_vektor3<_tg>&v,_pilemaze*pm){
				_tg cc=anzahl()-1;
				_pilemaze*fp=dynamic_cast<_pilemaze*>(game->piletableaulist.erstes());
				_pilemaze*lp=dynamic_cast<_pilemaze*>(game->piletableaulist.letztes());
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				v.x(v.x()+tabx);
				if(v.x()>(position.x()+cc*tabx+0.5)){
				 v.x(position.x());
				 v.y(v.y()-taby);
				 if(v.y()<(lp->position.y()-0.5)){
				  v.y(fp->position.y());
				 };
				 pm=dynamic_cast<_pilemaze*>(pm->_listenknotenbasis<_piletableau>::naechstes());
				};
				return(pm);
};
void _pilemaze::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilemaze"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(size);
				speichernzeiger(d,dropass);
				d->speichern(status);
};
void _pilemaze::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(size);
				ladenzeiger(d);
				d->laden(status);
};
//******************************************************************************************************************
//										P I L E A R R A Y
//******************************************************************************************************************
_pilearray::_pilearray(_game*g,_tg px,_tg py,int dx,int dy):_pile(g,px,py),_listenknotenbasis<_pilearray>(&g->pilearraylist){
				dimx=dx;
				dimy=dy;
	            feld=0;
	            dropx=0;
	            dropy=0;
				resetfeld();
				name=strpilearray;
};
_pilearray::~_pilearray(){
};
void _pilearray::resetfeld(){
                deletesecure(feld);
				feld=new _card*[dimx*dimy];
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  feld[x+dimx*y]=0;
				 };
				};
};
void _pilearray::draw(_grafik*gra,_kamera<_tg>*cam){
				_vektor3<_tg> p;
				_vektor3<_tg> o;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				o=position;
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  position.x(o.x()+_tg(x)*tabx);
				  position.y(o.y()-_tg(y)*taby);
				  updatemesh();
				  mesh->erzeugenvertexlicht();
	    		  //_licht<_tg,_to>*lit;
	    		  //if(game->solitaire->world->anfang(lit))do{
				  // mesh->determinevertexlight(lit);
				  //}while(game->solitaire->world->naechstes(lit));
				  gra->transparenzmultiplikativ();
				  mesh->zeichnen(gra);
				  gra->transparenz(false);
				 };
				};
				position=o;
};
bool _pilearray::canturn(_card*c){
				if((c->number==0)&&(c->suit==3)) return(false); else return(true);
};
void _pilearray::turn(_card*c,_tg spd,bool useundo){
				_vektor3<_tg> v;
				c->deinsertpile();
			    v=droppositionat(c->arrayindex[0],c->arrayindex[1]);
				c->insertpile(this,true);
				//nun auf die dropposition v den differnzvektor mit der }; karte bilden
				//wenn es keiune nächste karte gibt dann pileposition nehmen
				c->curvespeed=spd;
				c->curveposition.setzen(c->position, v, 0,0,-10,0,0,10);
			 	c->curvevx.setzen(c->vx, -c->vx, 0,0,10 ,0,0,-10);
			 	c->curvevy.setzen(c->vy, c->vy.x(),c->vy.y(),c->vy.z()-game->solitaire->cardslope, 0,0,0 ,0,0,0);
			     //undo record move
			    if(useundo){
				 _animationundo*m=game->createundo(spd,1);
				 m->use(c,this,true,c->arrayindex[0],c->arrayindex[1],0,this,true,c->arrayindex[0],c->arrayindex[1],0,c->curveposition,c->curvevx,c->curvevy);
				};
				if(game->preview==false) game->solitaire->sturn->abspielen(0.7,0.95,1.05);
				//end undo record move
				c->startcurve();
};
bool _pilearray::canpick(_card*c){
				if(giverestriction) return(false);
				return(true);
};
void _pilearray::pick(_card*c){
				c->pick();
};
void _pilearray::pickextern(_card*c,_liste<_card>*l){
				l->einhaengen(c);
};
bool _pilearray::candrop(_liste<_card>*list,bool samesuit){
				if(list->anzahl()>1) return(false);
				if(list->anzahl()==0) return(false);
				_card*c=list->erstes()->objekt();
				_vektor3<_tg> cm;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				cm=c->position;
				cm-=*game->solitaire->cam;
				_tg c0x;
				_tg c0y;
				//g: cam.position + cm*a
				//pz= cam.postion.z + cm.z*a
				_tg alpha=-game->solitaire->cam->z()/cm.z();
				c0x=game->solitaire->cam->x()+ cm.x()*alpha;
				c0y=game->solitaire->cam->y()+ cm.y()*alpha;
				dropx= int(((c0x)-(position.x()-tabx*0.5))/tabx);
				dropy=-int(((c0y)-(position.y()+taby*0.5))/taby);
				//Print "cx="+c0x
				//Print "p0x="+position.x
				//Print "px="+(position.x-tabx*0.5)
				//Print "dxy="+dropx+"  "+dropy
				return(candropat(c,dropx,dropy));
				};	
bool _pilearray::candropat(_card*c,int dropx,int dropy){
				if((dropx>=0)&&(dropx<dimx)&&(dropy>=0)&&(dropy<dimy)){
				 if(abs(c->arrayindex[0]-dropx)>1) return(false);
				 if(abs(c->arrayindex[1]-dropy)>1) return(false);
				 if((abs(c->arrayindex[0]-dropx)==1)&&(abs(c->arrayindex[1]-dropy)!=0)) return(false);
				 if((abs(c->arrayindex[1]-dropy)==1)&&(abs(c->arrayindex[0]-dropx)!=0)) return(false);
				 if(c->number==11){
				  if(dropx!=0) if(feld[(dropx-1)+dimx*dropy]) if((feld[(dropx-1)+dimx*dropy]->number==12)&&(feld[(dropx-1)+dimx*dropy]->suit!=c->suit)) return(false);
				  if(dropx!=4) if(feld[(dropx+1)+dimx*dropy]) if((feld[(dropx+1)+dimx*dropy]->number==12)&&(feld[(dropx+1)+dimx*dropy]->suit!=c->suit)) return(false);
				  if(dropy!=0) if(feld[dropx+dimx*(dropy-1)]) if((feld[dropx+dimx*(dropy-1)]->number==12)&&(feld[dropx+dimx*(dropy-1)]->suit!=c->suit)) return(false);
				  if(dropy!=4) if(feld[dropx+dimx*(dropy+1)]) if((feld[dropx+dimx*(dropy+1)]->number==12)&&(feld[dropx+dimx*(dropy+1)]->suit!=c->suit)) return(false);
				 };
				 if(c->number==12){
				  if(dropx!=0) if(feld[(dropx-1)+dimx*dropy]) if((feld[(dropx-1)+dimx*dropy]->number==11)&&(feld[(dropx-1)+dimx*dropy]->suit!=c->suit)) return(false);
				  if(dropx!=4) if(feld[(dropx+1)+dimx*dropy]) if((feld[(dropx+1)+dimx*dropy]->number==11)&&(feld[(dropx+1)+dimx*dropy]->suit!=c->suit)) return(false);
				  if(dropy!=0) if(feld[dropx+dimx*(dropy-1)]) if((feld[dropx+dimx*(dropy-1)]->number==11)&&(feld[dropx+dimx*(dropy-1)]->suit!=c->suit)) return(false);
				  if(dropy!=4) if(feld[dropx+dimx*(dropy+1)]) if((feld[dropx+dimx*(dropy+1)]->number==11)&&(feld[dropx+dimx*(dropy+1)]->suit!=c->suit)) return(false);
				 };
				 if(feld[dropx+dimx*dropy]==0) return(true);
				};
				return(false);
};
void _pilearray::drop(){
				//drop the picklist to the pile pit && record the moves
				_tg i=0;
				_animationundo*m=game->createundo(30,0.1,true);
				if(game->picklist.anzahl()==13) if(game->preview==false) game->solitaire->smove->abspielen(1,0.95,1.05);
				while(game->picklist.erstes()){
				 _card*c=game->picklist.erstes()->objekt();
				 _pile*pilefrom=c->pile;
				 c->depick();
				 _vektor3<_tg> v;
				 _vektor3<_tg> dvx=dropvx();
				 _vektor3<_tg> dvy=dropvy();
				 c->curvespeed=20;
				
				 if(c->backsided) dvx*=-1;
			 	 c->curvevx.setzen(c->vx, dvx, 0,0,-2*i ,0,0,0);
			 	 c->curvevy.setzen(c->vy, dvy, 0,0,-2*i ,0,0,0);
			     v=droppositionat(dropx,dropy);
				 c->curveposition.setzen(c->position, v, 0,0,-3,0,0,0);
			     c->startcurve();
			     //undo record move
			     _kurvehermite3<_tg> cupo;
			     _kurvehermite3<_tg> cuvx;
			     _kurvehermite3<_tg> cuvy;
			     cupo.ort(0,c->pickposition);
			     cupo.vektor(0,0,0,-10);
			 	 cupo.ort(1,c->curveposition.ort(1));
			 	 cupo.vektor(1,0,0,10);
			     cupo.aktualisieren();
			
				 cuvx.ort(0,c->pickvx);
				 cuvx.vektor(0,0,0,0);
				 cuvx.ort(1,c->curvevx.ort(1));
				 cuvx.vektor(1,0,0,0);
			     cuvx.aktualisieren();

				 cuvy.ort(0,c->pickvy);
				 cuvy.vektor(0,0,0,0);
				 cuvy.ort(1,c->curvevy.ort(1));
				 cuvy.vektor(1,0,0,0);
			     cuvy.aktualisieren();
				 m->use(c,this,true,dropx,dropy,0,pilefrom,true,c->arrayindex[0],c->arrayindex[1],0,cupo,cuvx,cuvy);
				 //end undo record move
				 c->deinsertpile();
				 c->deinsertpyramid();
				 c->deinsertlabyrinth();
				 c->deinsertarray();
				 c->deinsertsweetmatch();
				 c->insertpile(this,true);
				 c->insertarray(this,dropx,dropy);
				 i+=1;
				};
};
void _pilearray::move(int sx,int sy,int dx,int dy){
				if((feld[sx+dimx*sy])&&(feld[dx+dimx*dy]==0)){
				 _animationundo*m=game->createundo(30,0.1,true);
				 _card*c=feld[sx+dimx*sy];
				 _pile*pilefrom=c->pile;
				 _vektor3<_tg> v;
				 _vektor3<_tg> dvx=dropvx();
				 _vektor3<_tg> dvy=dropvy();
				 c->curvespeed=20;
				 if(c->backsided) dvx*=-1;
			 	 c->curvevx.setzen(c->vx, dvx, 0,0,-8 ,0,0,0);
			 	 c->curvevy.setzen(c->vy, dvy, 0,0,-8 ,0,0,0);
			     v=droppositionat(dx,dy);
				 c->curveposition.setzen(c->position,v,0,0,-5,0,0,5);
			     c->startcurve();
			     //undo record move
			     _kurvehermite3<_tg> cupo;
			     _kurvehermite3<_tg> cuvx;
			     _kurvehermite3<_tg> cuvy;
			     cupo.ort(0,c->curveposition.ort(0));
			     cupo.vektor(0,0,0,-10);
			 	 cupo.ort(1,c->curveposition.ort(1));
			 	 cupo.vektor(1,0,0,10);
			     cupo.aktualisieren();
			
				 cuvx.ort(0,c->curvevx.ort(0));
				 cuvx.vektor(0,0,0,0);
				 cuvx.ort(1,c->curvevx.ort(1));
				 cuvx.vektor(1,0,0,0);
			     cuvx.aktualisieren();

				 cuvy.ort(0,c->curvevy.ort(0));
				 cuvy.vektor(0,0,0,0);
				 cuvy.ort(1,c->curvevy.ort(1));
				 cuvy.vektor(1,0,0,0);
			     cuvy.aktualisieren();
				 m->use(c,this,true,dx,dy,0,pilefrom,true,c->arrayindex[0],c->arrayindex[1],0,cupo,cuvx,cuvy);
				 //end undo record move
				 c->deinsertpile();
				 c->deinsertarray();
				 c->insertpile(this,true);
				 c->insertarray(this,dx,dy);
				};
};
bool _pilearray::inner(bool withcards){
				_tg a;
				_tg b;
				_tg vx=game->cardwidth;
				_tg vy=game->cardheight;
				_vektor3<_tg> vxh;
				_vektor3<_tg> vyh;
				_vektor3<_tg> mvn;
				_vektor3<_tg> e;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				
				vxh.setzen(vx,0,0);
				vyh.setzen(0,vy,0);
				vxh.normalisieren();
				vyh.normalisieren();
				vxh*=tabx*dimx*0.5;
				vyh*=taby*dimy*0.5;
				mvn=game->solitaire->mousevector;
				mvn*=-1;
				e=*game->solitaire->cam;
				_vektor3<_tg> h=position;
				h.x(h.x()-vx*0.5); 
				h.y(h.y()+vy*0.5);
				h+=vxh;
				h-=vyh;
				
				e-=h;
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
_vektor3<_tg> _pilearray::droppositionat(int fx,int fy){
				_vektor3<_tg> v;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				v=position;
				v.x(v.x()+tabx*fx);
				v.y(v.y()-taby*fy);
				v.z(v.z()-game->solitaire->cardtableaulift);
				return(v);
};
_vektor3<_tg> _pilearray::dropvy(){
				return(_vektor3<_tg>(0,game->cardheight,-game->solitaire->cardslope));
};
void _pilearray::adjustcardposition(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->picked==false)&&(cit->curving==false)) cit->position.z(position.z()-game->solitaire->cardtableaulift);
				 }while(naechstes(cit));
				};
};
void _pilearray::adjustcardvy(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->curving==false)&&(cit->picked==false)){
	     		   cit->vy.setzen(0,game->cardheight,-game->solitaire->cardslope);
				  };
				}while(naechstes(cit));
				};
};
void _pilearray::animateinput(){
				_tg mx=game->solitaire->maus->x();//MouseX()
				_tg my=game->solitaire->maus->y();//MouseY()
				_card*cit;
				bool mb[]={game->solitaire->mousebutton[0],game->solitaire->mousebutton[1]};
				_card*cf=0;
				if((game->allowpick)&&(game->animationlist.erstes()==0)&&(game->solitaire->iggsystem->mouseovergui(game->solitaire->maus)==false)){
				 if((mb[0])||(mb[1])){
				  if(anfang(cit))do{
				   if((cit->inner())&&(cf==0)) cf=cit;
				  }while(naechstes(cit));
				  if(cf){
				   //------------------------------- pick und autoplay check left -------------
				   if(mb[0]){
				    bool doppel=false;
				    if(cf->clickleft==false){
				     if((game->solitaire->clock->system()-cf->clicktime)<300) doppel=true;
				      cf->clickleft=true;
				      cf->clicktime=game->solitaire->clock->system();
				     };
				     if(doppel){
				      if(game->solitaire->clickplaydouble){
  			           if(cf->pile->canpick(cf)){
				       game->clickplay(cf);
					   cf->doubleclicked=true;
					  };
		 		     };
	 			    }else{
		 		     if(cf->canpick()){
		 		      if(cf->picked==false){
		 		       cf->insertpick();
 				      }; 
				     }; 
  				    };
			       };//mb0
				   //------------------------------- autoplay check right ----------------------
	               if((cf->curving==false)&&(mb[1])&&(cf->canpick())&&(game->solitaire->clickplayright)) game->clickplay(cf);
			      };//cf
			     };//mbx
				 if(anfang(cit))do{
				  if(mb[0]==false){
				   if(cit->clickleft){
				    cit->clickleft=false;
				   };
				  };
				 }while(naechstes(cit));
				};
};
void _pilearray::animate(_zeit*c){
	  			if(game->statsclosed==false){
	   			 //links
	   		     if(feld[1+dimx*2]){
	  			  if(feld[1+dimx*2]->number==12){
	  			   game->discards+=1;
	 			   if(feld[0+dimx*2]){
	  				if((feld[0+dimx*2]->number==11)&&(feld[0+dimx*2]->suit==feld[1+dimx*2]->suit) )game->discards+=1;
				   };  
				  };
	 			 };
	   			 //rechts
	   		     if(feld[3+dimx*2]){
	  			  if(feld[3+dimx*2]->number==12){
	  			   game->discards+=1;
	 			   if(feld[4+dimx*2]){
	  				if((feld[4+dimx*2]->number==11)&&(feld[4+dimx*2]->suit==feld[3+dimx*2]->suit)) game->discards+=1;
				   };  
				  };
	 			 };
	   			 //oben
	   		     if(feld[2+dimx*1]){
	  			  if(feld[2+dimx*1]->number==12){
	  			   game->discards+=1;
	 			   if(feld[2+dimx*0]){
	  				if((feld[2+dimx*0]->number==11)&&(feld[2+dimx*0]->suit==feld[2+dimx*1]->suit)) game->discards+=1;
				   };  
				  };
	 			 };
	   			 //unten
	   		     if(feld[2+dimx*3]){
	  			  if(feld[2+dimx*3]->number==12){
	  			   game->discards+=1;
	 			   if(feld[2+dimx*4]){
	  				if((feld[2+dimx*4]->number==11)&&(feld[2+dimx*4]->suit==feld[2+dimx*3]->suit)) game->discards+=1;
				   };  
				  };
	 			 };
				};
				adjustcardvy();
				adjustcardvxsingle();
				adjustcardposition();
				animateinput();
				_card*cit;
				if(anfang(cit))do{
				 cit->animate();
				}while(naechstes(cit));
				animatepileinfo();
};
void _pilearray::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilearray"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(dimx);
				d->speichern(dimy);
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  speichernzeiger(d,feld[x+dimx*y]);
				 };
				};
				d->speichern(dropx);
				d->speichern(dropy);
};
void _pilearray::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(dimx);
				d->laden(dimy);
				deletesecure(feld);
				feld=new _card*[dimx*dimy];
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  ladenzeiger(d);
				  feld[x+dimx*y]=0;
				 };
				};
				d->laden(dropx);
				d->laden(dropy);
};
void _pilearray::assoziieren(){
				if(zeigergeladen()){
				 for(int y=0;y<dimy;y++){ 
				  for(int x=0;x<dimx;x++){ 
				   assoziierenzeiger(feld[x+dimx*y]);
				  };
				 };
				 loeschenzeiger();
				};
};

//******************************************************************************************************************
//										P I L E L A B Y R I N T H 
//******************************************************************************************************************
_pilelabyrinth::_pilelabyrinth(_game*g,_tg px,_tg py,int dx,int dy):_pile(g,px,py),_listenknotenbasis<_pilelabyrinth>(&g->pilelabyrinthlist){
	            fillfirst=true;
	            bothdirection=false;
				dimx=dx;
				dimy=dy;
				feld=0;
				resetfeld();
				name=strpilelabyrinth;
};
_pilelabyrinth::~_pilelabyrinth(){
};
void _pilelabyrinth::resetfeld(){
                deletesecure(feld);
				feld=new _card*[dimx*dimy];
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  feld[x+dimx*y]=0;
				 };
				};
};
void _pilelabyrinth::draw(_grafik*gra,_kamera<_tg>*cam){
				_vektor3<_tg> p;
				_vektor3<_tg> o;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				o=position;
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  position.x(o.x()+_tg(x)*tabx);
				  position.y(o.y()-_tg(y)*taby);
				  updatemesh();
				  mesh->erzeugenvertexlicht();
	    		  //_licht<_tg,_to>*lit;
	    		  //if(game->solitaire->world->anfang(lit))do{
				  // mesh->determinevertexlight(lit);
				  //}while(game->solitaire->world->naechstes(lit));
				  gra->transparenzmultiplikativ();
				  mesh->zeichnen(gra);
				  gra->transparenz(false);
				 };
				};
				position=o;
};
bool _pilelabyrinth::hasfreeline(){
				int l=freeline();
				if(l==-1) return(false); else return(true);
};
int _pilelabyrinth::freeline(){
				int free=-1;
				for(int y=0;y<dimy;y++){
				 if(free==-1){
				  bool lf=true;
				  for(int x=0;x<dimx;x++){
				   if(feld[x+dimx*y]!=0) lf=false;
				  };
				  if(lf) free=y;
				 };
				};
				return(free);
};
bool _pilelabyrinth::canpick(_card*c){
				if(giverestriction) return(false);
				//----------------------------- originale regeln ---------------------
				int cfx=c->labindex[0];//Feldindex der Karte x
				int cfy=c->labindex[1];//Feldindex der Karte y
				if(cfy==0) return(true);//Karte in oberster Zeile
				if(cfy==dimy-1) return(true);//Karte in unterster Zeile
				if(feld[cfx+dimx*(cfy-1)]==0) return(true);//über der Karte ist leeres Feld
				if(feld[cfx+dimx*(cfy+1)]==0) return(true);//unter der Karte ist leeres Feld
				//--------------------------------------------------------------------
				if(bothdirection){
				 if(cfx==0) return(true);//Karte in linkesteer Spalte
				 if(cfx==dimx-1) return(true);//Karte in rechtester Spalte
				 if(feld[(cfx-1)+dimx*cfy]==0) return(true);//links der Karte ist leeres Feld
				 if(feld[(cfx+1)+dimx*cfy]==0) return(true);//rechts der Karte ist leeres Feld
				};
				return(false);
};
void _pilelabyrinth::pick(_card*c){
				c->pick();
};
void _pilelabyrinth::pickextern(_card*c,_liste<_card>*l){
				l->einhaengen(c);
};
bool _pilelabyrinth::candrop(_liste<_card>*list,bool samesuit){
				return(false);
};
_vektor3<_tg> _pilelabyrinth::droppositionat(int fx,int fy){
				_vektor3<_tg> v;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				v=position;
				v.x(v.x()+tabx*fx);
				v.y(v.y()-taby*fy);
				v.z(v.z()-game->solitaire->cardtableaulift);
				return(v);
};
_vektor3<_tg> _pilelabyrinth::dropvy(){
				return(_vektor3<_tg>(0,game->cardheight,-game->solitaire->cardslope));
};
void _pilelabyrinth::adjustcardposition(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->picked==false)&&(cit->curving==false)) cit->position.z(position.z()-game->solitaire->cardtableaulift);
				 }while(naechstes(cit));
				};
};
void _pilelabyrinth::adjustcardvy(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->curving==false)&&(cit->picked==false)){
	     		   cit->vy.setzen(0,game->cardheight,-game->solitaire->cardslope);
	 			   //cit->normcardplane()
				  };
				 }while(naechstes(cit));
				};
};
void _pilelabyrinth::fillfirstline(_animationundo*m){
				_pilestock*ps=game->pilestock(0);
				if((ps)&&(fillfirst)){
				 for(int i=0;i<dimx;i++){
				  if(feld[i+dimx*0]==0){
				   if(ps->erstes()){
				    _card*c=ps->erstes();
				    //pilefrom=c->pile
				    c->deinsertpile();
				    _vektor3<_tg> v;
				    _vektor3<_tg> dvx=dropvx();
				    _vektor3<_tg> dvy=dropvy();
			        v=droppositionat(i,0);
				    c->curvespeed=20;
				    c->curveposition.setzen(c->position, v, 0,0,-13,0,0,20);
			 	    c->curvevx.setzen(c->vx, dvx, 0,0,-10 ,0,0,+10);
			 	    c->curvevy.setzen(c->vy, dvy, 0,0,-2*i ,0,0,0);
			        c->startcurve();
					c->insertpile(this,true);
					c->insertlabyrinth(this,i,0);
				    m->use(c,this,true,i,0,0,ps,true,0,0,0,c->curveposition,c->curvevx,c->curvevy);
				   };
				  };
				 };
				};
};
void _pilelabyrinth::animate(_zeit*){
				adjustcardvy();
				adjustcardvxsingle();
				adjustcardposition();
				animateinput();
				_card*c;
				if(anfang(c))do{
				 c->animate();
				}while(naechstes(c));
				animatepileinfo();
};
void _pilelabyrinth::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilelabyrinth"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(dimx);
				d->speichern(dimy);
				d->speichern(fillfirst);
				d->speichern(bothdirection);
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  speichernzeiger(d,feld[x+dimx*y]);
				 };
				};
};
void _pilelabyrinth::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(dimx);
				d->laden(dimy);
				d->laden(fillfirst);
				d->laden(bothdirection);
				deletesecure(feld);
				feld=new _card*[dimx*dimy];
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  ladenzeiger(d);
				  feld[x+dimx*y]=0;
				 };
				};
};
void _pilelabyrinth::assoziieren(){
				if(zeigergeladen()){
				 for(int y=0;y<dimy;y++){ 
				  for(int x=0;x<dimx;x++){ 
				   assoziierenzeiger(feld[x+dimx*y]);
				  };
				 };
				 loeschenzeiger();
				};
};
//******************************************************************************************************************
//										P I L E S W E E T M A T C H
//******************************************************************************************************************
_pilesweetmatch::_pilesweetmatch(_game*g,_tg px,_tg py,int dx,int dy):_pile(g,px,py),_listenknotenbasis<_pilesweetmatch>(&g->pilesweetmatchlist){
                dir=0;
                rowdir=0;
                feld=0;
                status=0;
                blase=0;
                dropcard=0;
				nopickifcardcurving=false;
				dimx=dx;
				dimy=dy;
				resetfeld();
				name=strpilesweetmatch;
};
_pilesweetmatch::~_pilesweetmatch(){
};
void _pilesweetmatch::resetfeld(){
                deletesecure(feld);
                deletesecure(status);
                deletesecure(blase);
				feld=new _card*[dimx*dimy];
				status=new int[dimx*dimy];
				blase=new _blase*[dimx*dimy];
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  feld[x+dimx*y]=0;
				  status[x+dimx*y]=0;
				  blase[x+dimx*y]=0;
				 };
				};
};
void _pilesweetmatch::updateblase(){
				_vektor3<_tg> o;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  if(status[x+dimx*y]==3){
				   blase[x+dimx*y]=new _blase(game->solitaire,game,o,tabx,taby,4,4,game->solitaire->tblase,game->solitaire->tblase);
				   o=position;
				   o.x(o.x()+_tg(x)*tabx);
				   o.y(o.y()-_tg(y)*taby);
				   o.x(o.x()-tabx/2);
				   o.y(o.y()+taby/2);
				  };
				 };
			    };
};
void _pilesweetmatch::draw(_grafik*gra,_kamera<_tg>*cam){
				_vektor3<_tg> p;
				_vektor3<_tg> o;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				o=position;
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  if((status[x+dimx*y]!=1)&&(status[x+dimx*y]!=2)){//visible && unblocked
				   position.x(o.x()+_tg(x)*tabx);
				   position.y(o.y()-_tg(y)*taby);
				   updatemesh();
				   mesh->erzeugenvertexlicht();
	    		   //_licht<_tg,_to>*lit;
	    		   //if(game->solitaire->world->anfang(lit))do{
				   // mesh->determinevertexlight(lit);
				   //}while(game->solitaire->world->naechstes(lit));
				   mesh->zeichnen(gra);
				  };
				 };
				};
				position=o;
};
bool _pilesweetmatch::canpick(_card*c){
				if(giverestriction) return(false);
				return(true);
};
void _pilesweetmatch::pick(_card*c){
				if(c->sweetmatch){
				 int x=c->sweetindex[0];
				 int y=c->sweetindex[1];
				 if(blase[x+dimx*y]){
				  blase[x+dimx*y]->impuls(3);
				 };
				};
				c->pick();
};
void _pilesweetmatch::pickextern(_card*c,_liste<_card>*l){
				l->einhaengen(c);
};
bool _pilesweetmatch::neighbour(_card*c0,_card*c1){
				int c0x=c0->sweetindex[0];
				int c0y=c0->sweetindex[1];
				int c1x=c1->sweetindex[0];
				int c1y=c1->sweetindex[1];
				int dx=abs(c0x-c1x);
				int dy=abs(c0y-c1y);
				if((dx==1)&&(dy==0)) return(true);;
				if((dy==1)&&(dx==0)) return(true);
				return(false);
};
bool _pilesweetmatch::match(_card*c0,_card*c1){
				if((c0->suit==c1->suit)&&(c0->number==c1->number)) return(true);
				return(false);
};
bool _pilesweetmatch::cardbuildsrow(_card*c,int x,int y){
				int s=c->suit;
				_card*c0=0;
				_card*c1=0;
				//----------------nach rechts prüfen
				c0=0;
				c1=0;
				if(x<(dimx-1)) c0=feld[(x+1)+dimx*y];
				if(x<(dimx-2)) c1=feld[(x+2)+dimx*y];
				if((c0)&&(c1)){
				 if((match(c0,c))&&(match(c1,c))){
				  rowdir=0;
				  return(true);
				 };
				};
				//----------------nach links prüfen
				c0=0;
				c1=0;
				if(x>0) c0=feld[(x-1)+dimx*y];
				if(x>1) c1=feld[(x-2)+dimx*y];
				if((c0)&&(c1)){
				 if((match(c0,c))&&(match(c1,c))){
				  rowdir=0;
				  return(true);
				 };
				};
				//----------------nach unten prüfen
				c0=0;
				c1=0;
				if(y<(dimy-1)) c0=feld[x+dimx*(y+1)];
				if(y<(dimy-2)) c1=feld[x+dimx*(y+2)];
				if((c0)&&(c1)){
				 if((match(c0,c))&&(match(c1,c))){
				  rowdir=1;
				  return(true);
				 };
				};
				//---------------nach oben prüfen
				c0=0;
				c1=0;
				if(y>0) c0=feld[x+dimx*(y-1)];
				if(y>1) c1=feld[x+dimx*(y-2)];
				if((c0)&&(c1)){
				 if((match(c0,c))&&(match(c1,c))){
				  rowdir=1;
				  return(true);
				 };
				};
				//--------------mitte horizontal prüfen
				c0=0;
				c1=0;
				if(x>0) c0=feld[(x-1)+dimx*y];
				if(x<(dimx-1)) c1=feld[(x+1)+dimx*y];
				if((c0)&&(c1)){
				 if((match(c0,c))&&(match(c1,c))){
				  rowdir=0;
				  return(true);
				 };
				};
				//--------------mitte vertikal prüfen
				c0=0;
				c1=0;
				if(y>0) c0=feld[x+dimx*(y-1)];
				if(y<(dimy-1)) c1=feld[x+dimx*(y+1)];
				if((c0)&&(c1)){
				 if((match(c0,c))&&(match(c1,c))){
				  rowdir=1;
				  return(true);
				 };
				};
				return(false);
};
bool _pilesweetmatch::swapbuildsrow(_card*c,_card*cs){
				int cx=c->sweetindex[0];
				int cy=c->sweetindex[1];
				int csx=cs->sweetindex[0];
				int csy=cs->sweetindex[1];
				bool r=false;
				c->deinsertsweetmatch();
				cs->deinsertsweetmatch();
				c->insertsweetmatch(this,csx,csy);
				cs->insertsweetmatch(this,cx,cy);
				if(cardbuildsrow(cs,cx,cy)) r=true;
				if(cardbuildsrow(c,csx,csy)) r=true;
				c->deinsertsweetmatch();
				cs->deinsertsweetmatch();
				c->insertsweetmatch(this,cx,cy);
				cs->insertsweetmatch(this,csx,csy);
				return(r);
};
bool _pilesweetmatch::candrop(_liste<_card>*list,bool samesuit){
				dropcard=0;
				if(takerestriction) return(false);
				if(list->anzahl()!=1) return(false);
				_card*card=list->erstes()->objekt();
				_card*cit;
				if(anfang(cit))do{
				 if((cit!=card)&&((cit->inner())||(cit->innercard(card)))){
				  if((neighbour(card,cit))&&(swapbuildsrow(card,cit))){
				   if((cit->curving==false)&&(cit->picked==false)){
				    dropcard=cit;
				    return(true);
				   };
				  };
				 };
				}while(naechstes(cit));
	 			return(false);
};
void _pilesweetmatch::drop(_zeit*clock){
				//drop the picked card to the this pile && record the moves
				if((game->picklist.erstes())&&(dropcard)){
				 _card*c=game->picklist.erstes()->objekt();
				 swap(c,dropcard,true);
				};
};
void _pilesweetmatch::swap(_card*c,_card*ass,bool unused){
				int cx=c->sweetindex[0];
				int cy=c->sweetindex[1];
				int ax=ass->sweetindex[0];
				int ay=ass->sweetindex[1];
				bool usepick=false;
				if((c->picked)||(c->pickending)) usepick=true;
				_animationundo*m=game->createundo(30,0.1,false);
				if(usepick) c->deinsertpick();
				c->pickending=false;
				_vektor3<_tg> v;
				_vektor3<_tg> dvx=dropvx();
				_vektor3<_tg> dvy=dropvy();
				c->curvespeed=40;
			 	c->curvevx.setzen(c->vx, dvx, 0,0,0 ,0,0,0);
			 	c->curvevy.setzen(c->vy, dvy, 0,0,0 ,0,0,0);
			    v=ass->position;
				if(usepick) c->curveposition.setzen(c->position, v, 0,0,-3,0,0,0); else c->curveposition.setzen(c->position, v, 0,0,-10,0,0,10);
			    c->startcurve();
			    //undo record move
			    _kurvehermite3<_tg> cupo;
			    _kurvehermite3<_tg> cuvx;
			    _kurvehermite3<_tg> cuvy;
			    cupo.vektor(0,0,0,-10);
			 	cupo.vektor(1,0,0,10);
				cuvx.vektor(0,0,0,0);
				cuvx.vektor(1,0,0,0);
				cuvy.vektor(0,0,0,0);
			 	cuvy.vektor(1,0,0,0);
			 	cupo.ort(1,c->curveposition.ort(1));
				cuvx.ort(1,c->curvevx.ort(1));
		 		cuvy.ort(1,c->curvevy.ort(1));
			    if(usepick){
			     cupo.ort(0,c->pickposition);
				 cuvx.ort(0,c->pickvx);
				 cuvy.ort(0,c->pickvy);
			    }else{
			 	 cupo.ort(0,c->curveposition.ort(0));
				 cuvx.ort(0,c->curvevx.ort(0));
		 		 cuvy.ort(0,c->curvevy.ort(0));
				};
			    cupo.aktualisieren();
			    cuvx.aktualisieren();
			    cuvy.aktualisieren();
				m->use(c,this,true,ax,ay,0,this,true,cx,cy,0,cupo,cuvx,cuvy);
				//end undo record move
				v.setzen(0,0,0);
				ass->curvespeed=40;
			 	ass->curvevx.setzen(ass->vx,ass->vx, v,v);
			 	ass->curvevy.setzen(ass->vy,ass->vy, v,v);
				if(usepick) ass->curveposition.setzen(ass->position,c->pickposition,v,v); else ass->curveposition.setzen(ass->position,c->curveposition.ort(0),v,v);
				ass->startcurve();
				m->use(ass,this,true,cx,cy,0,this,true,ax,ay,0,ass->curveposition,ass->curvevx,ass->curvevy);
				c->deinsertsweetmatch();
				ass->deinsertsweetmatch();
				c->insertsweetmatch(this,ax,ay);
				ass->insertsweetmatch(this,cx,cy);
				if(c->sweetmatch){
				 int x=c->sweetindex[0];
				 int y=c->sweetindex[1];
				 if(blase[x+dimx*y]){
				  blase[x+dimx*y]->impuls(3);
				 };
				};
				if(ass->sweetmatch){
				 int x=ass->sweetindex[0];
				 int y=ass->sweetindex[1];
				 if(blase[x+dimx*y]){
				  blase[x+dimx*y]->impuls(3);
				 };
				};
};
_vektor3<_tg> _pilesweetmatch::droppositionat(int fx,int fy){
				_vektor3<_tg> v;
				_tg tabx=game->tabulatorx();
				_tg taby=game->tabulatory();
				v=position;
				v.x(v.x()+tabx*fx);
				v.y(v.y()-taby*fy);
				v.z(v.z()-game->solitaire->cardtableaulift);
				return(v);
};
_vektor3<_tg> _pilesweetmatch::dropvy(){
				_vektor3<_tg> v;
				v.setzen(0,game->cardheight,-game->solitaire->cardslope);
				return(v);
};
void _pilesweetmatch::adjustcardposition(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->picked==false)&&(cit->curving==false)) cit->position.z(position.z()-game->solitaire->cardtableaulift);
				 }while(naechstes(cit));
				};
};
void _pilesweetmatch::adjustcardvy(){
				if(game->activepreparation()==false){
				 _card*cit;
	   			 if(anfang(cit))do{
	  			  if((cit->curving==false)&&(cit->picked==false)){
	     		   cit->vy.setzen(0,game->cardheight,-game->solitaire->cardslope);
				  };
				 }while(naechstes(cit));
				};
};
void _pilesweetmatch::cardfall(_card*c,int dx,int dy){
				_vektor3<_tg> v;
				int cx=c->sweetindex[0];
				int cy=c->sweetindex[1];
			    v=droppositionat(cx+dx,cy+dy);
				c->curvespeed=20;
				c->curveposition.setzen(c->position, v, 0,0,-13,0,0,13);
			 	c->curvevx.setzen(c->vx, c->vx, 0,0,-10 ,0,0,-10);
			 	c->curvevy.setzen(c->vy, c->vy, 0,0,0 ,0,0,0);
			    //undo record move
				_animationundo*m=game->createundo(60,1,false);
				m->use(c,this,true,cx+dx,cy+dy,0,this,true,cx,cy,0,c->curveposition,c->curvevx,c->curvevy);
				//end undo record move
				c->deinsertsweetmatch();
				c->insertsweetmatch(this,cx+dx,cy+dy);
				if(c->sweetmatch){
				 int x=c->sweetindex[0];
				 int y=c->sweetindex[1];
				 if(blase[x+dimx*y]) blase[x+dimx*y]->impuls(3);
				};
				c->startcurve();
};
void _pilesweetmatch::animatecardfall(){
				_card*c;
				_card*cd;
				_card*cdr;
				_card*cdl;
				_card*cr;
				_card*cl;
				int sd,sdr,sdl,sr,sl;
				for(int y=0;y<dimy-1;y++){
				 for(int x=0;x<dimx;x++){
				  c=feld[x+dimx*y];
				 // Print "animatecardfall   y="+y
				 // if(c Print "animatecardfall c.y="+c.sweetindex[1]
				  cd=feld[x+dimx*(y+1)];
				  sd=status[x+dimx*(y+1)];
				  if(x<(dimx-1)){
				   cdr=feld[(x+1)+dimx*(y+1)];
				   sdr=status[(x+1)+dimx*(y+1)];
				   cr=feld[(x+1)+dimx*y];
				   sr=status[(x+1)+dimx*y];
				  }else{
				   cdr=0;
				   sdr=2;
				   cr=0;
				   sr=2;
				  };
				  if(x>0){
				   cdl=feld[(x-1)+dimx*(y+1)];
				   sdl=status[(x-1)+dimx*(y+1)];
				   cl=feld[(x-1)+dimx*y];
				   sl=status[(x-1)+dimx*y];
				  }else{
				   cdl=0;
				   sdl=2;
				   cl=0;
				   sl=2;
				  };	
				  
				  if((c)&&(c->curving==false)&&(c->picked==false)){
				   if((cd==0)&&(sd!=2)){
				    cardfall(c,0,1);
				   }else{
				    if(dir==0){
				     if((cdr==0)&&(sdr!=2)){
				      cardfall(c,1,1);
				     }else if((cdl==0)&&(sdl!=2)){
				      cardfall(c,-1,1);
				     };
				    }else{
				     if((cdl==0)&&(sdl!=2)){
				      cardfall(c,-1,1);
				     }else if((cdr==0)&&(sdr!=2)){
				      cardfall(c,1,1);
				     };
				    };
				    dir=1-dir;
				   };
				  };
				 };
				};
};
void _pilesweetmatch::getrow(_card*c,int x,int y){
				int ix,iy;
				int s=c->suit;
				_card*cit;
				bool stop;
				row.aushaengen();
				if(rowdir==0){//horizontale reihe holen
				 ix=x;
				 iy=y;
				 stop=false;
				 do{
				  cit=feld[ix+dimx*iy];
				  if(cit){
				   if(match(cit,c)) row.einhaengen(cit); else stop=true;
				  }else{ 
				   stop=true;
				  };
				  ix+=1;
				 }while((stop==false)&&(ix<=(dimx-1)));
				 ix=x-1;
				 iy=y;
				 if(ix>=0){
				  stop=false;
				  do{
				   cit=feld[ix+dimx*iy];
				   if(cit){
				    if(match(cit,c)) row.einhaengen(cit); else stop=true;
				   }else{
				    stop=true;
				   };
				   ix-=1;
				  }while((stop==false)&&(ix>=0));
				 };
				};
				if(rowdir==1){//vertikale reihe holen
				 ix=x;
				 iy=y;
				 stop=false;
				 do{
				  cit=feld[ix+dimx*iy];
				  if(cit){
				   if(match(cit,c)) row.einhaengen(cit); else stop=true;
				  }else{
				   stop=true;
				  };
				  iy+=1;
				 }while((stop==false)&&(iy<=(dimy-1)));
				 ix=x;
				 iy=y-1;
				 if(iy>=0){
				  stop=false;
				  do{
				   cit=feld[ix+dimx*iy];
				   if(cit){
				    if(match(cit,c)) row.einhaengen(cit); else stop=true;
				   }else{
				    stop=true;
				   };
				   iy-=1;
				  }while((stop==false)&&(iy>=0));
				 };
				};
};
bool _pilesweetmatch::redundant(_liste<_vektor2<int> >*ll,int xx,int yy){
                _listenknoten<_vektor2<int> >*v;
				if(ll->anfang(v))do{
				 if((v->objekt()->x()==xx)&&(v->objekt()->y()==yy)) return(true);
				}while(ll->naechstes(v));
				return(false);
};
void _pilesweetmatch::moverow(){
				bool machen=true;
				if(row.anzahl()<2) return;
				_listenknoten<_card>*c;
				if(row.anfang(c))do{
				 if((c->objekt()->curving)||(c->objekt()->picked)) machen=false;
				}while(row.naechstes(c));
				int freex=-1;
				int freey=-1;
				_liste<_vektor2<int> > ll;
				for(int i=0;i<int(row.anzahl());i++){
				 freex=-1;
				 freey=-1;
				 int cc=0;
				 do{
				  int yy=zufall<int>(0,3);
				  int xx=zufall<int>(0,dimx-1);
				  if(freex==-1){
				   if((feld[xx+dimx*yy]==0)&&(redundant(&ll,xx,yy)==false)){
				    freex=xx;
				    freey=yy;
				   };
				  };
				  cc+=1;
				 }while((freex==-1)&&(cc<=1000));
				 if(freex!=-1){
				  _vektor2<int>*v=new _vektor2<int>(freex,freey);
				  ll.einhaengen(v);
				 };
				 //if(freex=-1) Print "Alarm : nichts freies zum hochwerfen gefunden"
				};
				if(ll.anzahl()!=row.anzahl()) machen=false;
				if(machen){
				 _animationundo*m=game->createundo(60,1,false);
				 _listenknoten<_vektor2<int> >*vit=ll.erstes();
				 _listenknoten<_card>*r;
				 if(row.anfang(r))do{
				  if(vit){
				   _vektor2<int>&w=*(vit->objekt());
				   freex=w.x();
				   freey=w.y();
				   _vektor3<_tg> v;
				   _card*card=c->objekt();
				   int cx=card->sweetindex[0];
				   int cy=card->sweetindex[1];
				   int s=status[cx+dimx*cy];
				   _pilediscard*pd=game->getpilediscardminimum();
				   card->curvespeed=60;
				   if(s==3){
				    v=pd->dropposition();
				    card->curveposition.setzen(card->position,v,0,0,-15,0,0,25);
				   }else{
				    v=droppositionat(freex,freey);
				    _tg w=(_tg(cx)/9)*180+180;
				    card->curveposition.setzen(card->position,v,cos(_ph*w)*150,sin(_ph*w)*150,-7,0,0,3);
				   };
			 	   card->curvevx.setzen(card->vx, card->vx, 0,0,-10 ,0,0,-10);
			 	   card->curvevy.setzen(card->vy, card->vy, 0,0,0 ,0,0,0);
			       //undo record move
				   if(s==3) m->use(card,pd,true,0,0,0,this,true,cx,cy,0,card->curveposition,card->curvevx,card->curvevy); else m->use(card,this,true,freex,freey,0,this,true,cx,cy,0,card->curveposition,card->curvevx,card->curvevy);
				   //end undo record move
				   card->deinsertsweetmatch();
				   if(status[cx+dimx*cy]==3){
				    card->deinsertpile();
				    card->insertpile(pd,true);
				    status[cx+dimx*cy]=0;//!!!!!!!!!!!!!!! EFFEKT !!!!!!!!!!!!!!!!!!!
				    if(blase[cx+dimx*cy]) delete(blase[cx+dimx*cy]); //else Print "ALARAM blase"
				    blase[cx+dimx*cy]=0;
				   }else{
				    card->insertsweetmatch(this,freex,freey);
				   };
				   card->startcurve();
				  };
				  vit=vit->naechstes();
				 }while(row.naechstes(r));
				};
				ll.loeschen();
};
void _pilesweetmatch::animatediscardmatch(){
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  if(feld[x+dimx*y]){
				   if(cardbuildsrow(feld[x+dimx*y],x,y)){
				    getrow(feld[x+dimx*y],x,y);
				    moverow();
				   };
				  };
				 };
				};
};
void _pilesweetmatch::animate(_zeit*c){
				if(game->activepreparation()==false){
				 animatecardfall();
				 animatediscardmatch();
				};
				adjustcardvy();
				adjustcardvxsingle();
				adjustcardposition();
				animateinput();
				_card*cit;
				if(anfang(cit))do{
				 cit->animate();
				}while(naechstes(cit));
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  if(blase[x+dimx*y]) blase[x+dimx*y]->animate();
				 };
				};
				animatepileinfo();
				//checkintegrity();
};
void _pilesweetmatch::save(_datei*d){
				d->speichern(_zeichenkette<char>("_pilesweetmatch"));
				d->speichern(speichername());
				savepile(d);
				d->speichern(dimx);
				d->speichern(dimy);
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  speichernzeiger(d,feld[x+dimx*y]);
				 };
				};
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  d->speichern(status[x+dimx*y]);
				 };
				};
};
void _pilesweetmatch::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());
				loadpile(d);
				d->laden(dimx);
				d->laden(dimy);
				resetfeld();
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  ladenzeiger(d);
				 };
				};
				for(int y=0;y<dimy;y++){ 
				 for(int x=0;x<dimx;x++){ 
				  d->laden(status[x+dimx*y]);
				 };
				};
};
void _pilesweetmatch::assoziieren(){
				if(zeigergeladen()){
				 for(int y=0;y<dimy;y++){ 
				  for(int x=0;x<dimx;x++){ 
				   assoziierenzeiger(feld[x+dimx*y]);
				   //**************** DEBUG ********************
				   //if(feld[x][y]=0
				   // Print "asso feld 0 [x][y] x="+x+"  y="+y
				   //}else{
				   // Print "asso feld      [x][y] x="+x+"  y="+y
				   //};
				   //*******************************************
				  };
				 };
				 loeschenzeiger();
				 updateblase();
				};
};
void _pilesweetmatch::checkintegrity(){
				//Print "Pilesweetmatch Integrität wird geprüft:"
				for(int y=0;y<dimy;y++){
				 for(int x=0;x<dimx;x++){
				  _card*c=feld[x+dimx*y];
				  if(c){
				   /*
				   if(c->sweetmatch==0) Print "Fehler : Karte ist im Feld, aber pile nicht in der Karte."
				   if(c->sweetindex[0]!==x) Print "Fehler x index"
				   if(c->sweetindex[1]!==y) Print "Fehler y index"
				   */
				  };
				 };
				};
};
