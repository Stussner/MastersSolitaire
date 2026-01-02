//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitaireeffekt.cpp
//  Datum       : 18.12.2008
//******************************************************************************************************************************************************************************************************
#include "../hpp/_solitaireeffect.hpp"
#include "../hpp/_solitaire.hpp"
#include "../hpp/_solitairefantasy.hpp"
#include "../hpp/_solitairecardset.hpp"
 //******************************************************************************************************************
//										B A C K G R O U N D
//******************************************************************************************************************
_background::_background(_solitaire*s){
				mesh=0;
				meshlight=0;
				solitaire=s;
				icandleholder=0;
				world=s->world;
				opacity=1;
				//------------------------ create diffuse grid --------------------
				_tg vx,vy;
				vx=36.3;
				vy=-33;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),vx,vy,0);
				gg.textur(solitaire->tbackgroundgamea);
				gg.ort(-vx/2,-vy/2-2,0);
				mesh=gg.erzeugen();
				//mesh->vertexlichtdynamisch(false);
				mesh->zweiseitig(true);
				//mesh->ausschussflaeche(false);
				//mesh->sigmadiffuse(0.34);!!!!!!!!!!!!!!!!!!
				mesh->transparenzadditiv(false);
				mesh->welt(world);
				// ---------------------- create highlight grid ------------------				
				gg.textur(solitaire->tbackgroundgamel);
				gg.aufloesung(8,6);
				meshlight=gg.erzeugen();
				//meshlight->vertexlichtdynamisch(false);
				meshlight->zweiseitig(true);
				//meshlight->ausschussflaeche(false);
				meshlight->transparenzadditiv(true);
				meshlight->transparenz(true);
				//meshlight->sigmadiffuse(17);
				meshlight->welt(world);
};
_background::~_background(){
};
void _background::draw(_grafik*gra,_kamera<_tg>*cam){
				//------ calulate ambient+diffuse vertexcolors for(diffuse grid && draw ---------
				//mesh->clearvertexlight(true);
				//_licht<_tg,_to>*lit;
				//if(world->anfang(lit))do{
				 mesh->erzeugenvertexlicht();
				//}while(world->naechstes(lit));
				if(opacity<1){
				 mesh->transparenz(true);
				 mesh->opazitaetverbinder(opacity);
				}else{
				 mesh->transparenz(false);
				};
				if(solitaire->blackscreenopacity>0){
				 mesh->multiplizierenfarbeverbinder(solitaire->blackscreentransparency);
				};
				mesh->zeichnen(gra);
				if(solitaire->systemaccellerate==false){
				 //------ calulate highlight vertexcolors for(highlight grid && draw -------------
				 //use vertex opacity to set a local lighting 
				 _vektor4<_to> c(0,0,0,0);
				 meshlight->farbeverbinder(c);
				 _licht<_tg,_to>*lit;
				 if(world->anfang(lit))do{
				  _candle*ca=dynamic_cast<_candle*>(lit);
				  if(ca==0){
				   meshlight->erzeugenvertexlicht(lit);
				  }else{
				   if((ca->sparked)&&(solitaire->sparkingmouse)){
				    meshlight->erzeugenvertexlicht(lit);
				   };
				  };
				 }while(world->naechstes(lit));
				 //the maximum of r,g && b is set as vertexopacity
				 meshlight->markierungvertex(1);
				 _polygon*pit;
				 _vertex*vit;
				 _verbindervertexpolygon*cit;
				 if(meshlight->anfang(pit))do{
				  vit=pit->vertex();
				  if(vit)do{
				   if(vit->markierung()==1){
				    vit->markierung(0);
				    if(vit->anfang(cit))do{
				     c=cit->farbe();
				     _to m=c.x();
				     if(m<c.y()) m=c.y();
				     if(m<c.z()) m=c.z();
				     c.w(m);
				     cit->farbe(c);
				    }while(vit->naechstes(cit));
				   };
				   vit=vit->naechstes(pit);
				  }while(vit!=pit->vertex());
				 }while(meshlight->naechstes(pit));
				 meshlight->zeichnen(gra);  
				};
};
void _background::drawfront(_grafik*gra,_kamera<_tg>*cam){
				_bild<_tb>*i=solitaire->icandleholdergame;
				gra->orthonormal();
				gra->transparenzmultiplikativ();
				_vektor4<_to> c(1,1,1,opacity);
				_tg x=(_tg(1516)/_tg(1920))*gra->groessex();
				_tg y=(_tg(100)/_tg(1440))*gra->groessey();
				_tg w=(_tg(i->groesse(0))/_tg(1920))*gra->groessex();
				_tg h=(_tg(i->groesse(1))/_tg(1440))*gra->groessey();
				gra->rechteck(i,x,y,w,h,c);
				if(solitaire->systemaccellerate==false){
				};
};
void _background::updatetexture(){
                _polygon*pit;
				if(mesh){
				 if(mesh->anfang(pit))do{
				  pit->textur(solitaire->tbackgroundgamea);
				 }while(mesh->naechstes(pit));
				};
				if(meshlight){
				 if(meshlight->anfang(pit))do{
				  pit->textur(solitaire->tbackgroundgamel);
				 }while(meshlight->naechstes(pit));
				};
};
//******************************************************************************************************************
//										U H R
//******************************************************************************************************************
_uhr::_uhr(_solitaire*s){
				solitaire=s;
                opacity=1;
                schlagmodus=0;
                schlagstatus=0;
                schlagstart=0;
                schlagzahl=0;
                schlagvolumen=1;
				position.setzen(-7,7.5,0);
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),0.15,0.7,0);
				gg.textur(s->tdigith);
				gg.ort(position);
				gg.farbe(0.8,0.6,0.3,0.9);
				gg.texturvektor(1,-1);
				mhour=gg.erzeugen();
				//mhour->vertexlichtdynamisch(false);
				mhour->transparenz(true);
				mhour->zweiseitig(true);
				//mhour->ausschussflaeche(false);
				mhour->transparenzadditiv(false);
				mhourorg=mhour->duplizieren();
				gg.textur(s->tdigit);
				mminute=gg.erzeugen();
				//mminute->vertexlichtdynamisch(false);
				mminute->transparenz(true);
				mminute->zweiseitig(true);
				//mminute->ausschussflaeche(false);
				mminute->transparenzadditiv(false);
				mminuteorg=mminute->duplizieren();

				gg.textur(s->tdigits);
				msecond=gg.erzeugen();
				//msecond->vertexlichtdynamisch(false);
				msecond->transparenz(true);
				msecond->zweiseitig(true);
				//msecond->ausschussflaeche(false);
				msecond->transparenzadditiv(false);
				msecondorg=msecond->duplizieren();

				gg.textur(s->tpendulum);
				gg.ort(-8.25,5.65+0.28,2);
				gg.farbe(0.8,0.6,0.3,1);
				gg.groesse(1.5,-5.5);
				gg.texturvektor(1,1);
				mpendulum=gg.erzeugen();
				//mpendulum->vertexlichtdynamisch(false);
				mpendulum->transparenz(true);
				mpendulum->zweiseitig(true);
				//mpendulum->ausschussflaeche(false);
				mpendulum->transparenzadditiv(false);
				mpendulumorg=mpendulum->duplizieren();
				animatevoid();
};
_uhr::~_uhr(){
                deletesecure(mhour);
                deletesecure(mminute);
                deletesecure(msecond);
                deletesecure(mpendulum);
                deletesecure(mhourorg);
                deletesecure(mminuteorg);
                deletesecure(msecondorg);
                deletesecure(mpendulumorg);
};
void _uhr::animatevoid(){
				_zeichenkette<_tt> time;
				//=CurrentTime();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				_zeichenkette<_tt> sep=L":";
				_liste<_zeichenkette<_tt> > l;
				time.teilen(sep,&l);
				int hour=l[0]->integer();
				int minute=l[1]->integer();
				int second=l[2]->integer();
				om=minute;
				oh=hour;
				os=second;
};
void _uhr::animate(){
				_zeichenkette<_tt> time;
				//=CurrentTime();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				_zeichenkette<_tt> sep=L":";
				_liste<_zeichenkette<_tt> > l;
				time.teilen(sep,&l);
				int hour=l[0]->integer();
				int minute=l[1]->integer();
				int second=l[2]->integer();
				if(om!=minute){
				 if(minute==0){
				  if(oh!=hour){
				   schlagmodus=1;
				   schlagstatus=0;
				   schlagstart=solitaire->clock->system();
				   if(hour>12) schlagzahl=hour-12; else schlagzahl=hour;
				  };
				 }else if(minute==15){
				  solitaire->suhrschlag0->abspielen(schlagvolumen,0.99,1.001);
				 }else if(minute==30){
				  schlagmodus=2;
				  schlagstatus=0;
				  schlagstart=solitaire->clock->system();
				 }else if(minute=45){
				  schlagmodus=3;
				  schlagstatus=0;
				  schlagstart=solitaire->clock->system();
				 };
				};
				//********************** DEBUG ********************
				if(om!=minute){
				};
				//*************************************************
				int t=solitaire->clock->system();
				int dt=t-schlagstart;
				if(schlagmodus==1){//stunden schlag
				 if(schlagstatus==2){
				  if(schlagzahl>0){
				   if(dt>2000){
				    solitaire->suhrschlag0->abspielen(schlagvolumen,0.99,1.001);
				    schlagzahl-=1;
				    schlagstart=solitaire->clock->system();
				   };
				  }else{
				   schlagmodus=0;
				   schlagstatus=0;
				  };
				 }else if(schlagstatus==1){
				  if(dt>11990){
				   schlagstatus=2;
				   schlagstart+=10000;
				  };
 				 }else if(schlagstatus==0){
				  solitaire->suhrschlagstunde->abspielen(schlagvolumen,0.99,1.001);
				  schlagstatus=1;
 				 };
				};
				if(schlagmodus==2){//zweimal schlagen
				 if(schlagstatus=1){
				  if(dt>2000){
				   solitaire->suhrschlag0->abspielen(schlagvolumen,0.99,1.001);
				   schlagstatus=0;
				   schlagmodus=0;
				  };
				 }else if(schlagstatus==0){
				  solitaire->suhrschlag0->abspielen(schlagvolumen,0.99,1.001);
				  schlagstatus=1;
				 };
				};
				if(schlagmodus==3){//dreimal schlagen
				 if(schlagstatus==2){
				  if(dt>4000){
				   solitaire->suhrschlag0->abspielen(schlagvolumen,0.99,1.001);
				   schlagstatus=0;
				   schlagmodus=0;
				  };
				 }else if(schlagstatus=1){
				  if(dt>2000){
				   solitaire->suhrschlag0->abspielen(schlagvolumen,0.99,1.001);
				   schlagstatus=2;
				  };
				 }else if(schlagstatus==0){
				  solitaire->suhrschlag0->abspielen(schlagvolumen,0.99,1.001);
				  schlagstatus=1;
				 };
				};
				if(os!=second){
				 if((os%2)==0) solitaire->spendulum->abspielen(schlagvolumen,0.99,1.001);
				};
				om=minute;
				oh=hour;
				os=second;
};
void _uhr::draw(_grafik*gra,_kamera<_tg>*cam){
				_tg ahour=oh;
				_tg aminute=om;
				_tg asecond=os;
				_tg apendulum;
				ahour/=12;
				ahour+=((aminute/60)/12);
				ahour*=360;
				aminute*=6;
				asecond*=6;
				apendulum=sin(_ph*250+500+solitaire->clock->system()*(_tg(180)/_tg(1000)))*2;
				rotate(mhour,mhourorg,position.x()+0.075,position.y()+0.1,position.z(),ahour);
				rotate(mminute,mminuteorg,position.x()+0.075,position.y()+0.1,position.z(),aminute);
				rotate(msecond,msecondorg,position.x()+0.075,position.y()+0.1,position.z(),asecond);
				//gra->wrap(true);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				mhour->opazitaetverbinder(opacity);
				mminute->opazitaetverbinder(opacity);
				msecond->opazitaetverbinder(opacity);
				mhour->zeichnen(gra);
				mminute->zeichnen(gra);
				msecond->zeichnen(gra);
				rotate(mpendulum,mpendulumorg,-8.25+0.75,6.28,2,-1+apendulum);
				_to li=solitaire->kamin->intensity();
				_vektor4<_to> v4((0.9+li*0.1)*solitaire->blackscreentransparency,(0.6+li*0.2)*solitaire->blackscreentransparency,(0.3+li*0.1)*solitaire->blackscreentransparency,opacity);
				mpendulum->farbeverbinder(v4);
				mpendulum->zeichnen(gra);
				//gra->ausschussflaeche(false);//culloff();
};
void _uhr::rotate(_netz*o0,_netz*o1,_tg mx,_tg my,_tg mz,_tg angle){
                _polygon*p0;
                _polygon*p1;
                _vertex*v0;
                _vertex*v1;
				_vektor3<_tg> a(0,0,1);
				/*if((o0->anfang(p0))&&(o1->anfang(p1)))do{
				 v0=p0->vertex();
				 v1=p1->vertex();
				 if((v0)&&(v1))do{
				  *v0=*v1;
				  v0=v0->naechstes(p0);
				  v1=v1->naechstes(p1);
				 }while((v0!=p0->vertex())&&(v1!=p1->vertex()));
				}while((o0->naechstes(p0))&&(o1->naechstes(p1)));
				o0->rotieren(_vektor3<_tg>(mx,my,mz),a,angle);*/
};
//******************************************************************************************************************
//										F I G U R E
//******************************************************************************************************************
_figure::_figure(_solitairefantasy*s,_bild<_tb>*i,_tg x,_tg y){
				solitaire=s;
				nx=x;
				ny=y;
				imagefigure=i;
				opacity=1;
};
_figure::~_figure(){
};
void _figure::draw(_grafik*gra,_kamera<_tg>*cam){
				_tg li=solitaire->kamin->intensity();
				gra->orthonormal();
				gra->transparenz(true);
				gra->transparenzmultiplikativ();
			
				_vektor4<_to> c((0.9+li*0.1)*solitaire->blackscreentransparency,(0.7+li*0.2)*solitaire->blackscreentransparency,(0.4+li*0.1)*solitaire->blackscreentransparency,opacity);

				_bild<_tb>*i=imagefigure;
				_tg x=nx*gra->groessex();
				_tg y=ny*gra->groessey();
				_tg w=(i->groesse(0)/_tg(1920))*gra->groessex();
				_tg h=(i->groesse(1)/_tg(1440))*gra->groessey();
				gra->textur(true);
				gra->rechteck(i,x,y,w,h,c);
};
void _figure::animate(){
};
bool _figure::inner(){
				_tg mx=solitaire->maus->x()/_tg(solitaire->gra->groessex());
				_tg my=solitaire->maus->y()/_tg(solitaire->gra->groessey());
				_tg wx=imagefigure->groesse(0)/_tg(1920);
				_tg wy=imagefigure->groesse(1)/_tg(1440);
				if((mx>nx)&&(my>ny)&&(mx<(nx+wx))&&(my<(ny+wy))&&(solitaire->innergamemenu()==false)) return(true); else return(false);
};
//******************************************************************************************************************
//										K A M I N F E U E R 
//******************************************************************************************************************
_kaminfeuer::_kaminfeuer(_welt*w,_zeit*z,_listebasis<_partikelquelle>*pql,_listebasis<_partikel>*pl):_partikelquelle(w,z,pql,pl){
};
_kaminfeuer::~_kaminfeuer(){
};
_partikel*_kaminfeuer::erzeugenpartikel(const _vektor3<_tg>&pos){
	            _partikel*ps=_partikelquelle::erzeugenpartikel(pos);
				ps->rotationreibung(-0.01);
				if((ps->netz())&&(ps->rotation()!=0)){
				 _tg w=((ps->ort().x()-ort().x())/1.2);//-1..+1
				 w*=0.5;
				 w+=0.5;
				 w*=90;
				 ps->netz()->rotieren(ps->rotationachse(),w);
				 ps->netz()->aktualisieren();
				 ps->rotationvektor((w-45)*5);
				};
				return(ps);
};
//******************************************************************************************************************
//										K A M I N 2
//******************************************************************************************************************
_kamin2::_kamin2(_solitaire*s,_tg x,_tg y,_tg z,_tg scale,_listebasis<_partikel>*pl){
                solitaire=s;
				_geometrienetz gg(0,_vektor3<_tg>(-scale/2,-scale/2,0),scale,scale,0);
				gg.textur(s->tfeuer2);
				m=gg.erzeugen();
				//m->vertexlichtdynamisch(false);
				m->transparenz(true);
				m->transparenzadditiv(true);

				gg.textur(s->tfeuer3);
				m2=gg.erzeugen();
				//m2->vertexlichtdynamisch(false);
				m2->transparenz(true);
				m2->transparenzadditiv(true);
				
				_tg sf=0.17;
				gg.textur(s->tfunken[0]);
				gg.ort(-sf/2,-sf/2,0);
				gg.groesse(sf,sf);
				mf=gg.erzeugen();
				//mf->vertexlichtdynamisch(false);
				mf->transparenz(true);
				mf->transparenzadditiv(true);
				//channel=playambiencenormal(solitaire->sfireplace,	1);//!!!!!!!!!!!!!!!!!!
				position.setzen(x,y,z);
				for(int i=0;i<2;i++){
				 flamme[i]=new _kaminfeuer(s->world,s->clock,&s->particlesourcemenulist,pl);
				 flamme[i]->positionbase.setzen(x,y,z);
				 flamme[i]->groesse(0.6);
				 flamme[i]->groessetoleranz(0.8);
				 flamme[i]->vektor(0,0,0);
				 flamme[i]->vektortoleranz(0.7);
				 flamme[i]->lebensdauerpartikel(0.5);
				 flamme[i]->lebensdauerpartikeltoleranz(0.5);
				 flamme[i]->rotation(220);
				 flamme[i]->rotationtoleranz(20.5);
				 flamme[i]->opazitaet(1);
				 flamme[i]->feldkraftg(-0.3);
				 flamme[i]->ortraum(0,0.6,0,0);
				 flamme[i]->ortraum(1,0,0.2,0);
				 flamme[i]->ortraum(2,0,0,0.2);
				 flamme[i]->transparenzadditiv();
  				 flamme[i]->feldkraftghomogen().setzen(0,-1,0);
				 pumptime[i]=0;
				 pumpup[i]=0;
				 pumpgenrate[i]=50;
				 pumplifetime[i]=1000;
				 rotfac[i]=zufall<_tg>(0.02,0.04);
				 flamme[i]->einfuegennetz(m);
				 flamme[i]->einfuegennetz(m2);
				 flamme[i]->axialdivergenz(true);
				 flamme[i]->axialdivergenzort(x,y,z);
				 flamme[i]->axialdivergenzvektor(0,0.06,0);
				 flamme[i]->kurvefarbe(true);
				 flamme[i]->kurvefarbe().setzen(0.0,0.0,0.0,0.05  ,  0.8,0.2,0.0,0.0,  2,1,0.5,3, -3,-2,-2.5,-2);
				 flamme[i]->aktiv(true);
				 offsetrnd[i]=zufall<_tg>(0,3000);
				};
				flamme[0]->ort(x-0.5,y,z);
				flamme[1]->ort(x+0.5,y,z);
				
				funken=new _partikelquelle(s->world,s->clock,&s->particlesourcemenulist,pl);
				funken->ort(x,y,z);
				funken->groesse(1);
				funken->groessetoleranz(0.2);
				funken->vektor(0,0.0,0);
				funken->vektortoleranz(0.3);
				funken->generationsrate(5);
				funken->lebensdauerpartikel(850);
				funken->lebensdauerpartikeltoleranz(0.2);
				funken->rotation(0);
				funken->rotationtoleranz(300);
				funken->opazitaet(1);
				funken->feldkraftg(-0.4);
				funken->ortraum(0,1,0,0);
				funken->ortraum(1,0,0.2,0);
				funken->ortraum(2,0,0,0.2);
				funken->transparenzadditiv();
				funken->feldkraftghomogen().setzen(0,-1,0);
				funken->einfuegennetz(mf);
				funken->axialdivergenz(true);
				funken->axialdivergenzort(x,y,z);
				funken->axialdivergenzvektor(0,0.2,0);
				funken->kurvefarbe(true);
				funken->kurvefarbe().setzen(1,0.7,0.1,0.5  ,  0.8,0.0,0.0,0.1,  0,0,0,3, 0,0,0,-4);
				funken->aktiv(true);
				oldintensity=0;
				newintensity=0;
};
_kamin2::~_kamin2(){
                deletesecure(m);
                deletesecure(m2);
                deletesecure(mf);
                deletesecure(flamme[0]);
                deletesecure(flamme[1]);
                deletesecure(funken);
};
_tg _kamin2::intensity(){
				_tg i=flamme[0]->listepartikelintern()->anzahl()+flamme[1]->listepartikelintern()->anzahl();
				i=(i-72)/(100-72);
				if(i<0) i=0;
				if(i>1) i=1;
				newintensity=oldintensity*0.95 + i*0.05;
				oldintensity=newintensity;
				return(newintensity);
};
void _kamin2::animate(){
				//channel.setvolume(1*volumeambience*volumesoundfadein);//!!!!!!!!!!!!!!!!!!
				_tg tt=solitaire->clock->system();
				for(int i=0;i<2;i++){
				 flamme[i]->animieren();
				 funken->animieren();
				 flamme[i]->axialdivergenzvektor().y(cos(_ph*tt*0.2231+offsetrnd[i])*0.1+0.15);
				 flamme[i]->axialdivergenzort(position.x()+sin(_ph*offsetrnd[i]+tt*0.0031)*0.4,position.y(),position.z());
				 int tt=500-(solitaire->clock->system()-pumptime[i]);
				 if(tt<0) tt=0;
				 if(pumpup[i]) tt/=2;
				 if((zufall<int>(0,tt)==0)||(tt==0)){
				  pumptime[i]=solitaire->clock->system();
				  if(pumpup[i]==false ){
				   pumpup[i]=true;
  				   pumpgenrate[i]=zufall<int>(50,80);
				   pumplifetime[i]=zufall<int>(475,550);
				  }else{
				   pumpup[i]=false;
  				   pumpgenrate[i]=zufall<int>(70,100);
				   pumplifetime[i]=zufall<int>(500,600);
				  };
				 };
  			     flamme[i]->generationsrate(pumpgenrate[i]);
				 flamme[i]->lebensdauerpartikel(pumplifetime[i]);
				};
};
void _kamin2::deactivate(){
				flamme[0]->aktiv(false);
				flamme[1]->aktiv(false);
				funken->aktiv(false);
};
void _kamin2::activate(){
				flamme[0]->aktiv(true);
				flamme[1]->aktiv(true);
				funken->aktiv(true);
};
void _kamin2::opacity(_to op){
                _listenknoten<_partikel>*pit;
				if(flamme[0]->listepartikelintern()->anfang(pit))do{
				 pit->objekt()->opazitaetexternekontrolle(op);
				}while(flamme[0]->listepartikelintern()->naechstes(pit));
				if(flamme[1]->listepartikelintern()->anfang(pit))do{
				 pit->objekt()->opazitaetexternekontrolle(op);
				}while(flamme[1]->listepartikelintern()->naechstes(pit));
				if(funken->listepartikelintern()->anfang(pit))do{
				 pit->objekt()->opazitaetexternekontrolle(op);
				}while(funken->listepartikelintern()->naechstes(pit));
};
//******************************************************************************************************************
//										C A N D L E
//******************************************************************************************************************
_candle::_candle(_solitaire*s,_tg x,_tg y,_tg z,_tg i,_tg scalecorona,_tg scaleparticle,_listebasis<_partikel>*pl,bool im):_licht<_tg,_to>(s->world,x,y,z,1,0.85,0.6,i),_listenknotenbasis<_candle>(&s->candlelist){
				inmenu=im;
				solitaire=s;
				position.setzen(x,y,z);
				positionoriginal.setzen(x,y,z);
	            intensityorg=i;
	            popacity=1;
	            flamme=0;
	            pumptime=0;
	            pumpup=0;
	            pumpgenrate=50;
	            pumplifetime=1000;
	            windfactor=1;
	            windflicker=0;
	            windflickeramplitude=0;
	            curvet=0;
	            curvespeed=1;
	            curvetime=0;
	            sparked=false;
	            inmenu=false;
	            corona=0;
				curve.setzen(0,0,0, 0,0,0, 0,1,0, -1,0,0);
				coronaoffset.setzen(0,0,-1);
				coronavx.setzen(5,0,0);
				coronavy.setzen(0,5,0);
				coronavxuse.setzen(5,0,0);
				coronavyuse.setzen(0,5,0);
				lightcolor.setzen(1,0.85,0.2);
				if(im){
				 flamme=new _partikelquelle(s->world,s->clock,&s->particlesourcemenulist,pl);
				}else{
				 flamme=new _partikelquelle(s->world,s->clock,&s->particlesourcegamelist,pl);
				};
				flamme->groesse(1);
				flamme->groessetoleranz(0.1);
				flamme->vektor(0,0,-0.007);
				flamme->vektortoleranz(0.8);
				flamme->generationsrate(3);
				flamme->lebensdauerpartikel(1);
				flamme->lebensdauerpartikeltoleranz(0.01);
				flamme->rotation(0);
				flamme->rotationtoleranz(0);
				flamme->opazitaet(1);
				flamme->feldkraftg(-1);
				flamme->ort(-16.3,9.1,-7);
				flamme->ortraum(0,0,0,0);
				flamme->ortraum(1,0,0,0);
				flamme->ortraum(2,0,0,0);
				flamme->transparenzadditiv();
				flamme->feldkraftghomogen().setzen(0,0,1);
				curvevector.setzen(0,0,0);
				_netz*m;
				_geometrienetz gg(0,_vektor3<_tg>(-scaleparticle/2,-scaleparticle/2,0),scaleparticle,scaleparticle,s->tfeuercandle);
				m=gg.erzeugen();
				//m->vertexlichtdynamisch(false);
				m->transparenz(true);
				m->transparenzadditiv(true);
				flamme->einfuegennetz(m);
				flamme->axialdivergenz(true);
				flamme->axialdivergenzort(x,y,z);
				flamme->axialdivergenzvektor(0,0,1);
				flamme->kurvefarbe(true);
				flamme->kurvefarbe().setzen(0.0,0.0,0.8,0.6  ,  0.8,0.2,0.05,0,  0,0,0,1, -3,-2,0,-4);
				flamme->aktiv(true);
				gg.textur(s->tcorona);
				coronavx.setzen(scalecorona,0,0);
				coronavy.setzen(0,scalecorona,0);
				gg.groesse(coronavx,coronavy);
				corona=gg.erzeugen();
				corona->transparenz(true);
				corona->transparenzadditiv(true);
};
_candle::~_candle(){
                deletesecure(flamme);
};
void _candle::draw(_grafik*gra,_kamera<_tg>*cam){
				updatecoronamesh();
				gra->transparenzadditiv();
				corona->zeichnen(gra);
};
void _candle::updatecoronamesh(){
				//function updates the vertex coordinates of the card mesh
				//along the plane vectors position, vx,vy
				_polygon*pit;
				_vertex*vit;
				int i=0;
				_vektor3<_tg> h;
				_vektor3<_tg> k;
				_vektor3<_tg> l;
				l=curvevector;
				l*=0.4;
				h=windvector;
				h*=-0.06;
				l+=h+ort()+coronaoffset;
				coronavxuse=coronavx;
				coronavyuse=coronavy;
				coronavxuse*=1-windflicker*windflickeramplitude*0.2;
				coronavyuse*=1-windflicker*windflickeramplitude*0.2;
				_to popacityuse=0.6*popacity*(1-windflicker*windflickeramplitude*0.4);
				if(corona->anfang(pit)){
				 vit=pit->vertex();
				 if(vit)do{
				  if(i==0){
				   h=coronavxuse*-0.5;
				   k=coronavyuse*-0.5;
				   h+=k+l;
				   vit->setzen(h);
				   vit->opazitaetverbinder(popacityuse);
				  }else if(i==1){
				   h=coronavxuse*+0.5;
				   k=coronavyuse*-0.5;
				   h+=k+l;
				   vit->setzen(h);
				   vit->opazitaetverbinder(popacityuse);
				  }else if(i==2){
				   h=coronavxuse*+0.5;
				   k=coronavyuse*+0.5;
				   h+=k+l;
				   vit->setzen(h);
				   vit->opazitaetverbinder(popacityuse);
				  }else if(i==3){
				   h=coronavxuse*-0.5;
				   k=coronavyuse*+0.5;
				   h+=k+l;
				   vit->setzen(h);
				   vit->opazitaetverbinder(popacityuse);
				  }; 
				  i+=1;
				  vit=vit->naechstes(pit);
				 }while(vit!=pit->vertex());
				 pit->aktualisieren();
				};
};
void _candle::animatecurve(_zeit*clock){
				_tg newtime=clock->system();
				_tg deltat=_tg(newtime-curvetime)/1000.0f;
				curvetime=newtime;
				if(curvet<1){
				 curve.berechnen(curvet);
				 _tg deltal=curvespeed*deltat;
				 _tg dt;
				 if(curve.laenge()<nahenull){
				  dt=1;
				 }else{
				  dt=(deltal/curve.laenge());
				 };
				 curvet+=dt;
				 curvevector=curve.e();
				}else{
				 curvet=0;
				 curvevector=curve.ort(1);
				 curve.vektor(0)=curve.vektor(1);
				 curve.vektor(1).zufall();
				 curve.vektor(1).mul(zufall<_tg>(0.3,0.6));
				 curvespeed=zufall<_tg>(0.1,0.5);
				 curve.aktualisieren();
				};
};
void _candle::animate(_zeit*c){
				animatecurve(c);
				_tg time=solitaire->clock->system();
				if(inmenu==false){
				 flamme->axialdivergenz(true);
				 if((solitaire->sparkingmouse)&&(sparked)){//----------------------- sparkled ingame candle -------------------------
				  flamme->generationsdichtedynamisch(0.3);
				  flamme->feldkraftg(-1);
				  flamme->groesse(2.3+sin(_ph*time/5)*0.8);
				  flamme->rotation(sin(_ph*time/10)*90);
				  flamme->kurvefarbe().setzen(0.0,0.0,0.8,0.6  ,  0.8,0.2,0.05,0,  0,0,0,1, -3,-2,0,-4);
				  _vektor3<_tg> h=solitaire->mousevector;
				  _tg z=-7;
				  if(solitaire->game){
				   _listenknoten<_card>*it=solitaire->game->picklist.erstes();
				   if(it) z=it->objekt()->position.z()-7;
				  };
				  _tg gamma=(z-solitaire->cam->z())/solitaire->mousevector.z();
				  h*=gamma;
				  h+=*solitaire->cam;
				  h*=0.3;
				  
				  _vektor3<_tg> lo=ort();
				  lo*=0.7;
				  lo+=h;
				  ort(lo);
				  flamme->axialdivergenzvektor(0,0,0.001);
				  windfactor=0;
				  intensitaetdynamisch(50);
				  if(solitaire->game) solitaire->game->markforupdateshadow(this);
				 }else{//---------------------------------------------------------- ingame candle normal -----------------------------
				  if(solitaire->game){
				   if(solitaire->game->picklist.erstes()){
					_vektor3<_tg> d=solitaire->game->pickpositionold-position;
					_tg df=_tg(350)/(1+5*d.laengelaenge()*d.laenge());
				    windfactor=solitaire->game->pickvector.laenge()*df;
				 	d=solitaire->game->pickvector * -windfactor;
				    windvector+=d;
				   }else{ 
				    windfactor*=0.95;
				   };
				  };
				  intensitaetdynamisch(5000);
				  flamme->feldkraftg(-0.31);
				  flamme->generationsdichtedynamisch(0);
				  ort(position);
				  flamme->groesse(1.5);
				  flamme->rotation(0);
				  flamme->kurvefarbe().setzen(0.0,0.0,0.8,0.6  ,  0.8,0.2,0.05,0,  0,0,0,3, -3,-2,0,-4);
				  flamme->axialdivergenzvektor(windvector);
				  flamme->axialdivergenzvektor()*=(0.04);
				  flamme->axialdivergenzvektor().z(flamme->axialdivergenzvektor().z()+2);
				 };
				}else{//----------------------------------------------------------- menu candle -------------------------------------
				 ort(position);
				 windfactor=0;
				 flamme->feldkraftg(-0.02*2);
				 flamme->axialdivergenzvektor(0,1*2,0);
				 coronaoffset.setzen(0,0.2,0);
				};//------------------------------------------------------------------------------------------------------------
				windvector*=0.93;
				flamme->ort(ort());
				//----------------------feuer pumpend-------------------
				int tt=(100)-(c->system()-pumptime);
				if(tt<0) tt=0;
				if(pumpup) tt/=5;
				if((zufall<int>(0,tt)==0)||(tt==0)){
				 pumptime=c->system();
				 if(pumpup==false){
				  pumpup=true;
  				  pumpgenrate=zufall<int>(80,100);
				  pumplifetime=zufall<int>(1500,1800);
				 }else{
				  pumpup=false;
  				  pumpgenrate=zufall<int>(50,70);
				  pumplifetime=zufall<int>(1000,1300);
				 };
				};				
				if((solitaire->sparkingmouse)&&(sparked)){
				 flamme->lebensdauerpartikel(zufall<int>(400,800));
				}else{
				 if(inmenu){
  			      flamme->generationsrate((pumpgenrate/6)*2);
				  flamme->lebensdauerpartikel(pumplifetime/2);
				 }else{
				  windflicker+=windfactor*0.15;
				  if(windflicker>1) windflicker=1;
				  windflickeramplitude=(sin(_ph*time*1.5)*windflicker+1)*0.5;
  			      flamme->generationsrate((pumpgenrate/4)*2*windflickeramplitude);
				  flamme->lebensdauerpartikel(pumplifetime/2);
				  windflicker*=0.98;
				 };
				};
				//----------------------------------------------------
				_vektor3<_tg> v(cos(_ph*c->system()*3.2)*0.01,sin(_ph*c->system()*2.7)*0.01,0);
				_vektor3<_to> q(cos(_ph*c->system()*3.2)*0.01,sin(_ph*c->system()*2.7)*0.01,0);
				flamme->axialdivergenzort(ort() + v);
				_tg fb=1;
				if(flamme->aktiv()){
				 _tg ff=_tg(60-(flamme->listepartikelintern()->anzahl()-40))/_tg(60);
				 ff-=0.5;
				 ff*=3;
				 ff+=0.5;
				 if(ff>2) ff=2;
				 q.setzen((lightcolor.x()-0.1*ff)*fb,(lightcolor.y()-0.2*ff)*fb,(lightcolor.z()-0.04*ff)*fb);
				 q*=0.3;
				 _vektor3<_to> f=farbedynamisch();
				 f*=0.7;
				 f+=q;
				 f.begrenzen(0,1);
				 farbedynamisch(f);
				}else{
				 q.setzen((lightcolor.x())*fb,(lightcolor.y()-(sin(_ph*c->system()*30)*0.05+0.05))*fb,(lightcolor.z()-sin(_ph*c->system()*40)*0.01+0.01)*fb);
				 q*=0.3;
				 _vektor3<_to> f=farbedynamisch();
				 f*=0.7;
				 f+=q;
				 f.begrenzen(0,1);
				 farbedynamisch(f);
				};
};
void _candle::opacity(_to op){
				popacity=op;
				_listenknoten<_partikel>*pit;
				if(flamme->listepartikelintern()->anfang(pit))do{
				 pit->objekt()->opazitaetexternekontrolle(op);
				}while(flamme->listepartikelintern()->naechstes(pit));
};

//******************************************************************************************************************
//										S M O K E 
//******************************************************************************************************************
_smoke::_smoke(_solitaire*s,_tg x,_tg y,_tg z,_tg i,_tg scalecorona,_tg scaleparticle,_listebasis<_partikel>*pl,bool im){
				inmenu=im;
				solitaire=s;
	            pumptime=0;
	            pumpup=0;
	            pumpgenrate=50;
	            pumplifetime=1000;
	            corona=0;
	            curvet=0;
	            curvespeed=1;
	            curvetime=0;
	            sparked=false;
	            inmenu=false;
				curve.setzen(0,0,0, 0,0,0, 0,1,0, -1,0,0);
				coronaoffset.setzen(0,0,-1);
				coronavx.setzen(5,0,0);
				coronavy.setzen(0,5,0);
				flamme=new _partikelquelle(s->world,s->clock,&s->particlesourcemenulist,pl);
				flamme->groesse(1);
				flamme->groessetoleranz(0.1);
				flamme->vektor(0,0,0.1);
				flamme->vektortoleranz(0.05);
				flamme->lebensdauerpartikeltoleranz(0.01);
				flamme->rotation(180);
				flamme->rotationtoleranz(100.5);
				flamme->opazitaet(1);
				flamme->feldkraftg(-1);
				flamme->ort(-16.3,9.1,-7);
				flamme->ortraum(0,0,0,0);
				flamme->ortraum(1,0,0,0);
				flamme->ortraum(2,0,0,0);
				flamme->transparenzadditiv();
				flamme->skalierung(true);
				flamme->skalierung(1.02);
				position.setzen(x,y,z);
				farbe.setzen(1,1,1,1);
				positionoriginal.setzen(x,y,z);
				curvevector.setzen(0,0,0);

				_geometrienetz gg(0,_vektor3<_tg>(-scaleparticle/2,-scaleparticle/2,0),scaleparticle,scaleparticle,0);
				gg.textur(s->tfeuer2);
				netz=gg.erzeugen();
				//netz->vertexlichtdynamisch(false);
				netz->transparenz(true);
				netz->transparenzadditiv(false);
				flamme->einfuegennetz(netz);
				flamme->axialdivergenz(false);
				flamme->axialdivergenzort(x,y,z);
				flamme->axialdivergenzvektor(0,0,1);
				flamme->planarydivergenz(true);
				flamme->planarydivergenzort(4.5);
				flamme->planarydivergenzintensitaet(0.093);
				flamme->kurvefarbe(true);
				flamme->kurvefarbe().setzen(1,0.0,1,0.3  ,  0,0,1,0,  0,1,0,1, -3,-2,0,-2);
				flamme->aktiv(true);
				
				gg.textur(s->tcorona);
				coronavx.setzen(scalecorona,0,0);
				coronavy.setzen(0,scalecorona,0);
				gg.groesse(coronavx,coronavy);
				corona=gg.erzeugen();
				corona->transparenz(true);
				corona->transparenzadditiv(true);
};
_smoke::~_smoke(){
                deletesecure(netz);
                deletesecure(corona);
                deletesecure(flamme);
};
void _smoke::draw(_grafik*gra,_kamera<_tg>*cam){
				updatecoronamesh();
				gra->transparenzadditiv();
				corona->zeichnen(gra);
};				
void _smoke::updatecoronamesh(){
				//function updates the vertex coordinates of the card mesh
				//along the plane vectors position, vx,vy
				_polygon*pit;
				_vertex*vit;
				int i=0;
				_vektor3<_tg> h;
				_vektor3<_tg> k;
				_vektor3<_tg> l;
				l=curvevector*0.4;
				l+=position+coronaoffset;
				if(corona->anfang(pit)){
				 vit=pit->vertex();
				 if(vit)do{
				  if(i==0){
				   h=coronavx*-0.5;
				   k=coronavy*-0.5;
				   h+=k+l;
				   vit->setzen(h);
				   vit->opazitaetverbinder(farbe.w());
				  }else if(i==1){
				   h=coronavx*+0.5;
				   k=coronavy*-0.5;
				   h+=k+l;
				   vit->setzen(h);
				   vit->opazitaetverbinder(farbe.w());
				  }else if(i==2){
				   h=coronavx*+0.5;
				   k=coronavy*+0.5;
				   h+=k+l;
				   vit->setzen(h);
				   vit->opazitaetverbinder(farbe.w());
				  }else if(i==3){
				   h=coronavx*-0.5;
				   k=coronavy*+0.5;
				   h+=k+l;
				   vit->setzen(h);
				   vit->opazitaetverbinder(farbe.w());
				  }; 
				  i+=1;
				  vit=vit->naechstes(pit);
				 }while(vit!=pit->vertex());
				 pit->aktualisieren();
				};
};
void _smoke::animatecurve(_zeit*clock){
				_tg newtime=clock->system();
				_tg deltat=_tg(newtime-curvetime)/1000.0f;
				curvetime=newtime;
				if(curvet<1){
				 curve.berechnen(curvet);
				 _tg deltal=curvespeed*deltat;
				 _tg dt;
				 if(curve.laenge()<nahenull){
				  dt=1;
				 }else{
				  dt=(deltal/curve.laenge());
				 };
				 curvet+=dt;
				 curvevector=curve.e();
				}else{
				 curvet=0;
				 curvevector=curve.ort(1);
				 curve.vektor(0)=curve.vektor(1);
				 curve.vektor(1).zufall();
				 curve.vektor(1).mul(zufall<_tg>(0.2,0.4));
				 curvespeed=zufall<_tg>(0.1,0.5);
				 curve.aktualisieren();
				};
};
void _smoke::animate(_zeit*c){
				animatecurve(c);
				flamme->feldkraftg(-0.05);
				flamme->axialdivergenzvektor(0,1,0);
				coronaoffset.setzen(0,0.2,0);
				position+=curvevector;
				flamme->ort(position);
				//feuer pumpend
				int tt=1000-(c->system()-pumptime);
				if(tt<0) tt=0;
				if(pumpup) tt/=50;
				if((zufall<int>(0,tt)==0)||(tt==0)){
				 pumptime=c->system();
				 if(pumpup==false){
				  pumpup=true;
  				  pumpgenrate=zufall<int>(20*(inmenu+1),30*(inmenu+1));
				  pumplifetime=zufall<int>(2000,4000);
				  flamme->vektor().zufall();
				  flamme->vektor().y(fabs(flamme->vektor().y()));
				  flamme->vektor()*=0.05;
				 }else{
				  flamme->vektor(0,0.02,0);
				  pumpup=false;
  				  pumpgenrate=zufall<int>(2*(inmenu+1),3*(inmenu+1));
				  pumplifetime=zufall<int>(1000,2500);
				 };
				};				
			    flamme->rotation(sin(_ph*solitaire->clock->system()*3)*180);
  			    flamme->generationsrate(pumpgenrate);
				flamme->lebensdauerpartikel(pumplifetime);
				_vektor3<_tg> v(cos(_ph*c->system()*3.2)*0.01,sin(_ph*c->system()*2.7)*0.01,0);
				flamme->axialdivergenzort(position+v);
				if(flamme->aktiv()){
				 _tg ff=_tg(60-(flamme->listepartikelintern()->anzahl()-40))/_tg(60);
				 ff-=0.5;
				 ff*=3;
				 ff+=0.5;
				 if(ff>2) ff=2;
				 farbe.setzen(0.8-0.1*ff,0.5-0.2*ff,0.2-0.04*ff,farbe.w());
				}else{
				 farbe.setzen(0.8,0.5-(sin(_ph*c->system()*30)*0.05+0.05),0.2-sin(_ph*c->system()*40)*0.01+0.01,farbe.w());
				};
};


//******************************************************************************************************************
//										B L A S E
//******************************************************************************************************************
_blase::_blase(_solitaire*s,_game*g,const _vektor3<_tg>&o,_tg w,_tg h,int rx,int ry,_textur<_tb>*tf,_textur<_tb>*tb){
                solitaire=s;
                game=g;
                meshfront=0;
                tanzvelocity=0.1;
                tanzfriction=0.98;
				gg=new _geometrienetz(0,_vektor3<_tg>(0,0,0),width,-height,0);
				tanzmust[0].setzen(0,0,-8);
				tanzmust[1].setzen(0,0,-8);
				tanzmust[2].setzen(0,0,+8);
				tanzmust[3].setzen(0,0,+8);
				width=w;
				height=h;
				gg->texturfront(tf);
				gg->texturrueck(tb);
				gg->ort(o);
				gg->aufloesung(rx,ry);
                gg->texturvektor(0).setzen(0,10);
                gg->texturvektor(1).setzen(4,0);
				//gg->tvx[0].setzen(0,1);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				///gg->tvy[0].setzen(1,0);
				//gg->tvx[1].setzen(0,10);
				//gg->tvy[1].setzen(4,0);
				meshfront=gg->erzeugen();
				meshfront->zweiseitig(true);
				meshfront->transparenz(true);
				meshfront->transparenzadditiv(true);
				
				hp.ortort(0,gg->ort());
				hp.ortort(1,gg->ort()+gg->vektor(0));
				hp.ortort(2,gg->ort()+gg->vektor(0)+gg->vektor(1));
				hp.ortort(3,gg->ort());
				hp.ortort(3,gg->vektor(1));
				hp.ortvektor(0,gg->vektor(1));
				hp.ortvektor(1,gg->vektor(1));
				hp.ortvektor(2,gg->vektor(1));
				hp.ortvektor(3,gg->vektor(1));
				hp.vektorort(0,gg->vektor(0));
				hp.vektorort(1,gg->vektor(0));
				hp.vektorort(2,gg->vektor(0));
				hp.vektorort(3,gg->vektor(0));
				hp.ortvektor(0,tanz[0]);
				hp.ortvektor(1,tanz[1]);
				hp.ortvektor(2,tanz[2]);
				hp.ortvektor(3,tanz[3]);
				
				meshfront->welt(solitaire->world);
				_polygon*pit;
				if(meshfront->anfang(pit))do{
				 pit->knotenzeichnung(&game->drawlist);
				}while(meshfront->naechstes(pit));
				calculatevertex();
};
_blase::~_blase(){
				_polygon*pit;
				if(meshfront->anfang(pit))do{
				 pit->loeschenknotenzeichnung();
				}while(meshfront->naechstes(pit));
				deletesecure(gg);
				deletesecure(meshfront);
};
void _blase::calculatevertex(){
				int ix,iy;
				int rx=gg->aufloesung(0);
				int ry=gg->aufloesung(1);
				_tg s,t;
				_vektor3<_tg> e;
				int vi;
				_vertex*vit;
				_vertex*vib;
				
				for(iy=0;iy<ry;iy++){
				 for(ix=0;ix<rx;ix++){
				  s=_tg(ix)/_tg(rx);
				  t=_tg(iy)/_tg(ry);
				  e=hp.berechnen(s,t);
				  vi=iy*(rx+1)+ix;
				  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! indizierte vertexen übersetzen in listen zugriff auf das netz (grid)
				  //vit=meshfront.vertex(vi)
				  //vit.setzen(e)
				 };
				};
				meshfront->aktualisieren();
};
void _blase::impuls(_tg s){
				for(int i=0;i<4;i++){
				 tanz[i]=tanzmust[i];
				 tanz[i].x(tanz[i].x()+zufall<_tg>(-s,s));
				 tanz[i].y(tanz[i].y()+zufall<_tg>(-s,s));
				 tanz[i].z(tanz[i].z()+zufall<_tg>(-s,s));
				};
};
void _blase::animate(){
				_vektor2<_tg> v(sin(_ph*solitaire->clock->system()*0.04)*0.02,0.0);
				meshfront->verschiebentexturkoordinaten(v,0);
				_vektor3<_tg> h;
				for(int i=0;i<4;i++){
				 h=tanzmust[i];
				 h-=tanz[i];
				 h*=tanzvelocity;
				 tanzvector[i]+=h;
				 tanz[i].add(tanzvector[i]);
				 tanzvector[i]*=tanzfriction;
				};
				hp.ortvektor(0,tanz[0]);
				hp.ortvektor(1,tanz[1]);
				hp.ortvektor(2,tanz[2]);
				hp.ortvektor(3,tanz[3]);
				calculatevertex();
};

//******************************************************************************************************************
//										F I R E W O R K I M A G E 
//******************************************************************************************************************
_fireworkimage::_fireworkimage(_solitaire*s,_welt*w,_listebasis<_partikelquelle>*psl,_listebasis<_partikel>*pl,_zeit*c):_partikelquelle(w,c,psl,pl){
                sheepmode=false;
				solitaire=s;
				aktiv(false);
				ort(0,0,-2);
				groesse(1);
				groessetoleranz(0.1);
				vektor(0,0,0);
				vektortoleranz(0.01);
				generationsrate(1);
				lebensdauerpartikel(3400);
				lebensdauerpartikeltoleranz(0.2);
				rotation(0);
				rotationtoleranz(90);
				opazitaet(1);
				feldkraftg(1);
				listepartikeleinhaengenerstes(true);
				ortraum(0,5,0,0);
				ortraum(1,0,-5,0);
				ortraum(2,0,0,1);
				transparenzadditiv();
				_netz*m;
				_geometrienetz gg(0,_vektor3<_tg>(-0.5,-0.5,0),1,1,0);
				gg.textur(s->tsymbolsuit[zufall<int>(0,3)]);
				m=gg.erzeugen();
				//m->vertexlichtdynamisch(false);
				m->transparenz(true);
				m->transparenzadditiv(false);
				//m->vertexlichtdynamisch(false);
				m->zweiseitig(true);
				m->welt(w);
				einfuegennetz(m);
				kurvefarbe(true);
				einblenden(false);
				ausblenden(false);
				kurvefarbe().setzen(1,0.8,0.5,0  ,  1,1,1,0,  0,0,0,2, 0,0,0,0);
				kollisionz(true);
				kollisionzort(-1);
				
				lightborder=new _partikelquelle(w,c,psl,pl);
				lightborder->aktiv(false);
				lightborder->ort(0,0,-2);
				lightborder->groesse(1);
				lightborder->groessetoleranz(0.1);
				lightborder->vektor(0,0,0);
				lightborder->vektortoleranz(0.01);
				lightborder->generationsrate(1);
				lightborder->lebensdauerpartikel(3400);
				lightborder->lebensdauerpartikeltoleranz(0.2);
				lightborder->rotation(0);
				lightborder->rotationtoleranz(90);
				lightborder->opazitaet(1);
				lightborder->feldkraftg(1);
				lightborder->listepartikeleinhaengenerstes(true);
				lightborder->ortraum(0,5,0,0);
				lightborder->ortraum(1,0,-5,0);
				lightborder->ortraum(2,0,0,1);
				lightborder->transparenzadditiv();
				
				gg.textur(s->tcoronared);
				gg.ort(-0.5,-0.5,0);
				m=gg.erzeugen();
				//m->vertexlichtdynamisch(false);
				m->transparenz(true);
				m->transparenzadditiv(true);
				//m->vertexlichtdynamisch(false);
				m->zweiseitig(true);
				m->welt(w);
				lightborder->einfuegennetz(m);
				lightborder->kurvefarbe(true);
				lightborder->einblenden(false);
				lightborder->ausblenden(false);
				lightborder->kurvefarbe().setzen(1,1,1,1  ,  1,1,1,0,  0,0,0,4, 0,0,0,-4);
				lightborder->kollisionz(true);
				lightborder->kollisionzort(-1);
				lightborder->opazitaetsinus(true);
				lightborder->opazitaetsinusrate(1);
				lightborder->opazitaetsinusratedelta(0.5);
				lightborder->opazitaetsinusratedeltatoleranz(0.5);
				lightborder->skalierung(true);
				lightborder->skalierung(0.97);
				
				lichtgeburt(new _licht<_tg,_to>(w,0,0,0, 1,0.5,1, 0,true));
				lichtgeburt()->_listenknotenbasis<_licht<_tg,_to> >::aushaengen();
				lichtgeburtaddition(2000);
				lichtgeburtmultiplikation(0.9);
};
_fireworkimage::~_fireworkimage(){
};
void _fireworkimage::animieren(){
                if(aktiv()){
 				 int r=zufall<int>(0,50);
				 if(sheepmode) r=zufall<int>(0,100);
  				 if(r==10) generieren();
  				 animierenlichtliste();
                };
};
void _fireworkimage::generieren(){
				int ir=zufall<int>(0,3);
				_listenknoten<_netz>*mit;
				_polygon*pit;
                _partikel*ps=0;
				_vektor3<_tg> h;
				_vektor3<_tg> hx;
				_vektor3<_tg> hy;
				_vektor3<_tg> hz;
				_vektor3<_tg> pos=ortpartikel();
				_bild<_tb>*pixmap=solitaire->tsymbolsuit[ir]->bitmap(0);
				_bild<_tb>*pixmaprand=solitaire->tsymbolsuitrand[ir]->bitmap(0);
				int wi=pixmap->breite();
				int he=pixmap->hoehe();
				_tg staerke=zufall<_tg>(0.05,0.15);
				if(sheepmode) staerke*=0.6;
				_tg staerkez=zufall<_tg>(0.5,3);
				/*
				if(sheepmode){
				 if(zufall<int>(0,1)==1){
				  pixmaprand=solitaire->iblumerand[zufall<int>(0,3)];
				  if(listenetz()->anfang(mit))do{
				   mit->objekt()->transparenzadditiv(false);
				  }while(listenetz()->naechstes(mit));
				 }else{
				  if(listenetz()->anfang(mit))do{
				   mit->objekt()->transparenzadditiv(true);
				  }while(listenetz()->naechstes(mit));
				 };
				 staerkez*=1.5;
				};
				*/

				if(solitaire->systemaccellerate==false){
				 if(lichtgeburt()){
				  _licht<_tg,_to>*lit=new _licht<_tg,_to>(lichtgeburt());
				  lit->_listenknotenbasis<_licht<_tg,_to> >::einhaengen(welt());
				  //lit->knotenpartikelquelle(
				  //listelichtgeburt()->einhaengen(lit);
				  _vektor3<_tg> hp=ort();
				  lit->ort(hp);
				  hp.z(hp.z()-4);
				  lit->ort(hp);
				  lit->intensitaetdynamisch(lit->intensitaetdynamisch()+zufall<_tg>(lichtgeburtaddition()/2,lichtgeburtaddition()));
				  if((ir==0)||(ir==3)){
				   lit->farbedynamisch(zufall<_tg>(0,0.05),zufall<_tg>(0.01,0.1),zufall<_tg>(0.8,1));
				  }else{
				   lit->farbedynamisch(zufall<_tg>(0.8,1),zufall<_tg>(0.2,0.3),zufall<_tg>(0.05,0.1));
				  };
				 };
				};
				
				ortraum(0,5,0,0);
				ortraum(1,0,-5,0);
				ortraum(2,0,0,1);
				_vektor3<_tg> e;
				_vektor3<_tg> ax(0,0,1);
				_tg aw=zufall<_tg>(0,360);
				for(int k=0;k<2;k++){
				 rotieren(ax,ortraum(k),aw,e);
				 ortraum(k,e);
				};
				_tg rn=zufall<_tg>(4,7);
				if(listenetz()->anfang(mit))do{
				 if(mit->objekt()->anfang(pit))do{
				  pit->textur(solitaire->tsymbolsuit[ir]);
				 }while(mit->objekt()->naechstes(pit));
				}while(listenetz()->naechstes(mit));
				if(lightborder->listenetz()->anfang(mit))do{
				 if(mit->objekt()->anfang(pit))do{
				  if((ir==0)||(ir==3)){
				   pit->textur(solitaire->tcoronablue);
				  }else{
				   pit->textur(solitaire->tcoronared);
				  };
				 }while(mit->objekt()->naechstes(pit));
				}while(lightborder->listenetz()->naechstes(mit));
				solitaire->sexplosion[0]->abspielen(zufall<_tg>(0.7,1),0.7,1.2);
				int geninner=zufall<int>(0,1);
				if(sheepmode) geninner=0;
                for(int y=0;y<=(he-2);y+=2){
                 for(int x=0;x<=(wi-2);x+=2){ 
   				  _tg alpha=_tg(x)/_tg(wi);
				  _tg beta=_tg(y)/_tg(he);
				  alpha-=0.5;
				  beta-=0.5;
				  
				  _vektor<_tb> c;
				  pixmap->lesen(x,y,c);
				  if((c[3]>240)&&(geninner)){
 				   h=pos;
				   hx=ortraum(0)*alpha;
				   hy=ortraum(1)*beta;
 				   h+=hx+hy;
   				   ps=erzeugenpartikel(h);

				   hx*=staerke;
				   hy*=staerke;
				   hz=ortraum(2);
				   _tg dz=sqrt(alpha*alpha+beta*beta);
				   hz*=((0.7-dz)/0.7);
				   hz*=staerkez;
				   ps->vektor(hx+hy+hz);
				  };
				  
				  _vektor<_tb> r;
				  pixmaprand->lesen(x,y,r);
				  //r=((r&$ff000000)>>24);
				  if(r[3]>20){
 				   h=pos;
				   hx=ortraum(0)*alpha;
				   hy=ortraum(1)*beta;
 				   h+=hx+hy;
				   lightborder->groesse((_tg(r[0])/_tg(255))*8+1);
				   lightborder->rotation(_tg(r[0])/_tg(255)*10);
				   lightborder->rotationtoleranz(_tg(r[0])/_tg(255)*2000);
   				   ps=lightborder->erzeugenpartikel(pos);

				   hx*=staerke*rn;
				   hy*=staerke*rn;
				   hz=ortraum(2);
				   _tg dz=sqrt(alpha*alpha+beta*beta);
				   hz*=((0.7-dz)/0.7);
				   hz*=staerkez;
				   ps->vektor(hx+hy+hz);
				  };
                 };
				};
};
//******************************************************************************************************************
//										F I R E W O R K R O C K E T
//******************************************************************************************************************
_fireworkrocket::_fireworkrocket(_solitaire*s,_welt*w,_listebasis<_partikelquelle>*psl,_listebasis<_partikel>*pl,_zeit*c):_partikelquelle(w,c,psl,pl){
				solitaire=s;
				aktiv(false);
				ort(0,0,-2);
				groesse(1);
				groessetoleranz(0.9);
				vektor(0,0,-1);
				vektortoleranz(0.4);
				generationsrate(3);
				lebensdauerpartikel(1400);
				lebensdauerpartikeltoleranz(0.2);
				rotation(90);
				rotationtoleranz(150);
				opazitaet(1);
				feldkraftg(1);
				listepartikeleinhaengenerstes(true);
				ortraum(0,0,0,0);
				ortraum(1,0,0,0);
				ortraum(2,0,0,0);
				transparenzmultiplikativ();
				_netz*m;
				_geometrienetz gg(0,_vektor3<_tg>(-1.5,-1.5,0),3,3,s->tcorona);
				m=gg.erzeugen();
				//m->vertexlichtdynamisch(false);
				m->transparenz(true);
				m->transparenzadditiv(true);
				m->zweiseitig(true);
				m->welt(w);
				einfuegennetz(m);
				kurvefarbe(true);
				einblenden(false);
				ausblenden(false);
				kurvefarbe().setzen(1,0.8,0.5,0  ,  1,1,1,1,  0,0,0,1, 0,0,0,0);
				kollisionz(true);
				kollisionzort(-1);
				// -----------------------life source------------------------
				partikelquelleleben(new _partikelquelle(w,c,psl,pl));
				partikelquelleleben()->aktiv(false);
				partikelquelleleben()->groesse(1);
				partikelquelleleben()->groessetoleranz(0.1);
				partikelquelleleben()->vektor(0,0,-0.007);
				partikelquelleleben()->vektortoleranz(0.8);
				partikelquelleleben()->generationsrate(50);
				partikelquelleleben()->lebensdauerpartikel(1000);
				partikelquelleleben()->lebensdauerpartikeltoleranz(0.01);
				partikelquelleleben()->rotationtoleranz(1.5);
				partikelquelleleben()->opazitaet(1);
				partikelquelleleben()->ort(-16.3,9.1,-7);
				partikelquelleleben()->ortraum(0,0,0,0);
				partikelquelleleben()->ortraum(1,0,0,0);
				partikelquelleleben()->ortraum(2,0,0,0);
				partikelquelleleben()->transparenzadditiv();
	
				gg.textur(s->tfeuer);
				gg.ort(-0.5,-0.5,0);
				gg.farbe(1,1,1,1);
				gg.groesse(2,2);
				m=gg.erzeugen();
				m->transparenz(true);
				m->transparenzadditiv(true);
				partikelquelleleben()->einfuegennetz(m);
				partikelquelleleben()->kurvefarbe(true);
				partikelquelleleben()->generationsdichtedynamisch(0.2);
				partikelquelleleben()->feldkraftg(-1);
				partikelquelleleben()->groesse(3);
				partikelquelleleben()->rotation(sin(_ph*solitaire->clock->system()/10)*90);
				partikelquelleleben()->kurvefarbe().setzen(0.0,0.0,0.8,0.5, 0.8,0.2,0.05,0, 0,0,0,0, -3,-2,0,-4);
				lichttod(new _licht<_tg,_to>(w,0,0,0, 1,0.8,0.56, 0,true));
				lichttod()->_listenknotenbasis<_licht<_tg,_to> >::aushaengen();
				lichttodaddition(150);
				lichttodmultiplikation(0.85);
				// -----------------------death source------------------------
				partikelquelletod(new _partikelquelle(w,c,psl,pl));
				partikelquelletod()->aktiv(false);
				partikelquelletod()->ort(0,0,-2);
				partikelquelletod()->groesse(1);
				partikelquelletod()->groessetoleranz(0.9);
				partikelquelletod()->vektor(0,0,-0.7);
				partikelquelletod()->vektortoleranz(0.6);
				partikelquelletod()->generationsrate(100);
				partikelquelletod()->lebensdauer(10);
				partikelquelletod()->lebensdauerpartikel(3000);
				partikelquelletod()->lebensdauerpartikeltoleranz(0.2);
				partikelquelletod()->rotation(390);
				partikelquelletod()->rotationtoleranz(950);
				partikelquelletod()->opazitaet(1);
				partikelquelletod()->feldkraftg(1);
				partikelquelletod()->listepartikeleinhaengenerstes(true);
				partikelquelletod()->ortraum(0,0,0,0);
				partikelquelletod()->ortraum(1,0,0,0);
				partikelquelletod()->ortraum(2,0,0,0);
				partikelquelletod()->opazitaetsinus(true);
				partikelquelletod()->opazitaetsinusrate(1);
				partikelquelletod()->opazitaetsinusratedelta(0.5);
				partikelquelletod()->opazitaetsinusratedeltatoleranz(0.5);
				partikelquelletod()->skalierung(true);
				partikelquelletod()->skalierung(0.99);
				gg.textur(s->tcorona);
				gg.ort(-0.5,-0.5,0);
				gg.farbe(1,0,0,1);
				gg.groesse(1,1);
				m=gg.erzeugen();
				//m->vertexlichtdynamisch(false);
				m->transparenz(true);
				m->transparenzadditiv(true);
				m->zweiseitig(true);
				m->welt(w);
				partikelquelletod()->einfuegennetz(m);
				partikelquelletod()->kurvefarbe(true);
				partikelquelletod()->kurvefarbe().setzen(1,0,0,1,1,0,0,0,-10,10,0,0,0,0,0,0);
				partikelquelletod()->kollisionz(true);
				partikelquelletod()->kollisionzort(-1);
				tontod(solitaire->sexplosion[0]);
};
_fireworkrocket::~_fireworkrocket(){
};
void _fireworkrocket::animieren(){
                if(aktiv()){
  				 if(zufall<int>(0,50)==10) generieren();
  				 animierenlichtliste();
                };
};
void _fireworkrocket::generieren(){
                _partikel*ps=0;
				int i=generationsrate();
                for(int j=0;j<i;j++) ps=erzeugenpartikel(ortpartikel());
};
//******************************************************************************************************************
//										P A G E 
//******************************************************************************************************************
_page::_page(_solitaire*s,_textur<_tb>*tf,_textur<_tb>*tb,_textur<_tb>*tex,_tg w,_tg h){
				gg=new _geometrienetz(0,_vektor3<_tg>(0,0,0),1,1,tf);
	            meshfront=0;
	            meshback=0;
	            parax=0;
	            paray=0;
	            mxn=0;
	            targetdx=0;
	            dx=0;
				solitaire=s;
				width=w;
				height=h;
				gg->texturfront(tf);
				gg->texturrueck(tb);
				gg->ort(0,10,-1);
				gg->groesse(width,-height);
				gg->aufloesung(4,9);
				/*
				gg->tvx[0].setzen(0,1);//!!!!!!!!!!!!!!!!
				gg->tvy[0].setzen(1,0);
				gg->tvx[1].setzen(0,10);
				gg->tvy[1].setzen(4,0);
				*/
				meshfront=gg->erzeugen();
				meshfront->zweiseitig(true);
				hp.ortort(0,gg->ort());
				hp.ortort(1,gg->ort()+gg->vektor(0));
				hp.ortort(2,gg->ort()+gg->vektor(0)+gg->vektor(1));
				hp.ortort(3,gg->ort()+gg->vektor(1));
				
				hp.ortvektor(0,gg->vektor(1));
				hp.ortvektor(1,gg->vektor(1));
				hp.ortvektor(2,gg->vektor(1));
				hp.ortvektor(3,gg->vektor(1));
				
				hp.vektorort(0,gg->vektor(0));
				hp.vektorort(1,gg->vektor(0));
				hp.vektorort(2,gg->vektor(0));
				hp.vektorort(3,gg->vektor(0));
				
			//	hp.ortvektor(0,0,0,-width);
			//	hp.ortvektor(1,0,0,-width);
				meshfront->welt(solitaire->world);
				_licht<_tg,_to>*lit;
				
				if(solitaire->world->anfang(lit))do{
				 _schatteneinfach<_tg,_to>*sit=new _schatteneinfach<_tg,_to>(&solitaire->shadowlist,lit,meshfront,solitaire->tshadow);
 			     shadowlist.einhaengen(sit);
				}while(solitaire->world->naechstes(lit));
				updateshadow();
};
_page::~_page(){
                deletesecure(gg);
};
void _page::updateshadow(){
				_listenknoten<_schatten<_tg,_to> >*sit=shadowlist.erstes();
				_schatten<_tg,_to>*shadow=0;
				_vektor3<_tg> h;
				_vektor3<_tg> s;
				_vektor3<_tg> o;
				_vertex*v[4];//vom netz
				//int rx=gg->aufloesung(0);
				//int ry=gg->aufloesung(1);
				_tg gamma;
				//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				/*
				v[0]=meshfront->vertex(0);
				v[1]=meshfront->vertex(rx);
				v[2]=meshfront->vertex((rx+1)*ry);
				v[3]=meshfront->vertex((rx+1)*ry+rx);
				if(sit){
				 _licht<_tg,_to>*lit;
				 if(solitaire->world->anfang(lit))do{
				  shadow=sit->objekt();
				  shadow->gueltig(true);
				  for(int i=0;i<4;i++){
				   h=*v[i] - *lit;
				   gamma=-lit->z()/h.z();
				   if(gamma>0){
				    s=*lit + h*gamma;
				    s.z(0);
				    *(shadow->netz()->vertex(i))=s;//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				   }else{
				    shadow->gueltig(false);
				   }; 
				  };
				  sit=sit->naechstes();
				 }while(solitaire->world->naechstes(lit));
				};*/
};
void _page::calculatevertex(){/*
				int ix,iy;
				int rx=gg->aufloesung(0);
				int ry=gg->aufloesung(1);
				_tg s,t;
				_vektor3<_tg> e;
				int vi;
				_vertex*vit;
				_vertex*vib;
				for(iy=0;iy<=ry;iy++){
				 for(ix=0;ix<=rx;ix++){
				  s=_tg(ix)/_tg(rx);
				  t=_tg(iy)/_tg(ry);
				  e=hp.berechnen(s,t);
				  vi=iy*(rx+1)+ix;
				  vit=meshfront->vertex(vi);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				  *vit=e;
				 };
				};
				meshfront->aktualisieren();
				updateshadow();*/
};	
void _page::copyvertexcolor(){
				int ix,iy;
				//int rx=gg->aufloesung(0);
				//int ry=gg->aufloesung(1);
				_vektor3<_tg> e;
				int vi;
				_vertex*vit;
				_vertex*vib;
				/*
				for(iy=0;iy<=ry;iy++){
				 for(ix=0;ix<=rx;ix++){
				  vi=iy*(rx+1)+ix;//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				  vit=meshfront->vertex(vi);
				  vit->getrgb(e);
				  vib=meshback->vertex(vi);
				  vib->setrgb(e);
				 };
				};*/
};
void _page::set(_tg x,_tg y){//-1..+1
				if(x<-1) x=-1;
				if(x>+1) x=+1;
				if(y<-1) y=-1;
				if(y>+1) y=+1;
				parax=x;
				paray=y;
				_tg w=90*parax;
				_vektor3<_tg> vr(cos(_ph*270+w),0,sin(_ph*270+w));
				_tg aussenrad;
				aussenrad=width-(hp.ortvektor(1).winkel(vr)/_tg(180))*(width/2);//ist abhängig von ortvektor(2]
				hp.ortort(2).x(0+vr.x()*aussenrad);
				hp.ortort(2).z(gg->ort().z()+vr.z()*aussenrad);
				
				aussenrad=width-(hp.ortvektor(0).winkel(vr)/_tg(180))*(width/2);//ist abhängig von ortvektor(2]
				hp.ortort(3).x(0+vr.x()*aussenrad);
				hp.ortort(3).z(gg->ort().z()+vr.z()*aussenrad);
				
				hp.ortvektor(3,hp.ortort(3)-hp.ortort(0));
 				hp.ortvektor(3).y(0);

				hp.ortvektor(2,hp.ortort(2)-hp.ortort(1));
 				hp.ortvektor(2).y(0);
 			    calculatevertex();
};
void _page::animate(_zeit*c){
				_tg mx=solitaire->maus->x();
				_tg my=solitaire->maus->y();
				_tg myf0=0.2*(768-my)/_tg(768);
				_tg mxnn=mx-512;
				targetdx+=(mxnn-mxn);
				_tg ff=(targetdx-dx)*0.1;
				dx=dx+ff;//dx defines a factor that shiftes position-tangents at hermitepoint 0 && 1
				if((solitaire->mousebutton[0])&&(solitaire->pickedpage==this)){
				 hp.ortvektor(0).x(hp.ortvektor(0).x()+dx*myf0);
				 hp.ortvektor(1).x(hp.ortvektor(1).x()+dx*(0.2-myf0));
				 limittangent();
				 _tg paradx=(mxnn/512)-parax;
				 set(parax+paradx*0.3,paray);
				}else{
				 set(parax,paray);
				 if(parax>=0) parax+=((1-parax)*0.1);
				 if(parax<0) parax-=((1+parax)*0.1);
				 targetdx=0;
				 dx=0;
			    };
				mxn=mxnn;
				targetdx-=ff;
				dx*=0.1;
				if(parax>0){
				}else{//all the prev pages to -shift
				};
};
void _page::limittangent(){
				if(hp.ortvektor(0).x()>+(width-4)) hp.ortvektor(0).x(+(width-4));
				if(hp.ortvektor(0).x()<-(width-4)) hp.ortvektor(0).x(-(width-4));
				hp.ortvektor(0).z(-sqrt(width*width-hp.ortvektor(0).x()*hp.ortvektor(0).x()));
				if(hp.ortvektor(1).x()>+(width-4)) hp.ortvektor(1).x(+(width-4));
				if(hp.ortvektor(1).x()<-(width-4)) hp.ortvektor(1).x(-(width-4));
				hp.ortvektor(1).z(-sqrt(width*width-hp.ortvektor(1).x()*hp.ortvektor(1).x()));
};

