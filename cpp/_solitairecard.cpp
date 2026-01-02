//******************************************************************************************************************************************************************************************************
//  Projekt     : Fantasy Solitaire
//  Modul       : _solitairecard.cpp
//  Datum       : 29.11.2008
//******************************************************************************************************************************************************************************************************
#include "../hpp/_solitairecard.hpp"
#include "../hpp/_solitairegame.hpp"
#include "../hpp/_solitaire.hpp"
#include "../hpp/_solitairecardset.hpp"


//******************************************************************************************************************
//										C A R D S M O K E
//******************************************************************************************************************
_cardsmoke::_cardsmoke(_solitaire*s,_cardfire*cf):_partikelquelle(s->world,s->clock,&s->particlesourcegamelist,&s->particlegamelist){
				cardfire=cf;
				card=cf->card;
				solitaire=card->game->solitaire;
	            pumpdeathfactor=1;
	            m=0;
	            m2=0;
				groesse(0.6);
				groessetoleranz(0.2);
				vektor(0,0,-0.2);
				vektortoleranz(0.2);
				lebensdauerpartikel(0.5);
				lebensdauerpartikeltoleranz(0.5);
				rotation(220);
				rotationtoleranz(20.5);
				opazitaet(1);
				feldkraftg(+0.65);
				ortraum(0,1.5,0,0);
				ortraum(1,0,2.25,0);
				ortraum(2,0,0,0.2);
				transparenzadditiv();
  				feldkraftghomogen().setzen(0,0,-1);
				generationsdichtedynamisch(0.5);
				axialdivergenz(true);
				axialdivergenzort(card->position);
				axialdivergenzvektor(_vektor3<_tg>(0,0,-0.02));
				kurvefarbe(true);
				kurvefarbe().setzen(0.0,0.0,0.0,0.07  ,  0.0,0.0,0.0,0.0,  0,0,0,2, -1,-1,-1,-0.5);

				_tg scale=8;//vorher 4
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),scale,scale,solitaire->tsmoke[0]);
				gg.ort(-scale/2,-scale/2,0);
				gg.farbe(1,1,1,1);
				m=gg.erzeugen();
				//m->vertexlichtdynamisch(false);//!!!!!!!!!!!!!!!!!!!
				m->transparenz(true);
				m->transparenzadditiv(true);
				m2=gg.erzeugen();
				//m2->vertexlichtdynamisch(false);//!!!!!!!!!!!!!!!!!!!
				m2->transparenz(true);
				m2->transparenzadditiv(false);		
				einfuegennetz(m);
				einfuegennetz(m2);

				offsetrnd=zufall<_tg>(0,3000);
				//particlegenerationpositionold.copy(card->position)
};					
_cardsmoke::~_cardsmoke(){
	            deletesecure(m);
	            deletesecure(m2);
};						
void _cardsmoke::animieren(){
				if(aktiv()){
				 _tg ttt=solitaire->clock->system();
				 ort(cardfire->ort());
				 ortraum(0,cardfire->ortraum(0));
				 ortraum(1,cardfire->ortraum(1));
				 ortraum(2,cardfire->ortraum(2));
				 //axialvector.y=Cos(ttt*0.2231+offsetrnd)*0.1+0.15
				 axialdivergenzort(card->position.x()+sin(_ph*offsetrnd+ttt*0.0031)*0.4,card->position.y()+cos(_ph*offsetrnd+ttt*0.0021)*0.4,card->position.z());
				 int tt=500-(ttt-pumptime);
				 if(tt<0) tt=0;
				 if(pumpup) tt/=2;
				 if((zufall<int>(0,tt)==0)||(tt==0)){
				  pumptime=ttt;
				  if(pumpup==false){
				   pumpup=true;
  				   pumpgenrate=zufall<int>(50,80);
				   pumplifetime=zufall<int>(475,550);
				  }else{
				   pumpup=false;
  				   pumpgenrate=zufall<int>(70,100);
				   pumplifetime=zufall<int>(500,600);
				  };
				 };
  			     generationsrate(pumpgenrate*0.3);
				 lebensdauerpartikel(pumplifetime*3*(_tg(1)/(1+cardfire->firevector.laenge()))*cardfire->pumpdeathfactor);//vorher 1.5
				 _partikelquelle::animieren();
				};
};
_partikel* _cardsmoke::erzeugenpartikel(const _vektor3<_tg>&pos){
	            _partikel*ps=_partikelquelle::erzeugenpartikel(pos);
				ps->rotationreibung(-0.01);
				if((ps->netz())&&(ps->rotation()!=0)){
				 _tg w=((ps->ort().x()-ort().x())/1.2);//-1..+1
				 w=w*0.5;
				 w=w+0.5;
				 w=w*90;
				 ps->netz()->rotieren(ps->rotationachse(),w);
				 ps->netz()->aktualisieren();
				 ps->rotationvektor((w-45)*4*(1+cardfire->firevector.laenge()));
				};
				return(ps);
};
void _cardsmoke::generieren(){
                _partikel*ps;
                _tg n=generationsrate();
				_tg u=zeit()->system();
				_tg dt=(u-generationsrateletztegenerierung());///Float(1000)
				_tg anz=dt*n*0.001;
				generationsratesollpartikelinkrementieren(anz);
				bool particlegenerated=false;
				_vektor3<_tg> particlegeneratedposition;
				if(generationsdichtedynamisch()==0){
				 int i=floor(generationsratesollpartikel());
				 if(i>2000)i=2000;
				 if(i>0){
                  for(int j=0;j<i;j++) ps=erzeugenpartikel(ortpartikel());
                  generationsratesollpartikeldekrementieren(i);
                 };
                }else{
                 ps=erzeugenpartikel(ortpartikel());
                 particlegeneratedposition=ort();
                 _tg d=generationsrateletzterort().abstand(particlegeneratedposition);
				 if(d>=generationsdichtedynamisch()){
				  int ic=int(d/generationsdichtedynamisch());
				  _vektor3<_tg> h;
				  _vektor3<_tg> r;
				  _vektor3<_tg> a;
				  _vektor3<_tg> b;
				  _vektor3<_tg> c;
				  _vektor3<_tg> pit;
				  pit=generationsrateletzterort();
				  h=particlegeneratedposition-pit;
				  _tg dh=_tg(1)/_tg(ic+1);
				  h*=dh;
				  pit+=h;
		          for(int n=0;n<ic;n++){
				  //for(Local i=0 To ic-1
				   a=ortraum(0);
				   b=ortraum(1);
				   c=ortraum(2);
				   r.zufall();
                   r*=zufall<_tg>(0,orttoleranz());
				   a*=zufall<_tg>(-1,1);
				   b*=zufall<_tg>(-1,1);
				   c*=zufall<_tg>(-1,1);
				   r+=pit;
				   r.add(a);
				   r.add(b);
				   r.add(c);
				   erzeugenpartikel(r);
				   pit+=h;
				  };
				 };
				 generationsrateletzterort(particlegeneratedposition);
				};
			    generationsrateletztegenerierung(u);
};

//******************************************************************************************************************
//										C A R D F I R E
//******************************************************************************************************************
_cardfire::_cardfire(_solitaire*s,_card*c):_partikelquelle(s->world,s->clock,&s->particlesourcegamelist,&s->particlegamelist){
				card=c;
				solitaire=s;
				deltamap=0;
				texturemap=0;
	            pumpdeathfactor=1;
	            burnpointcount=0;
	            burncounter=0;
	            burnstatus=0;
	            burnfactor=1;
	            burnopacity=1;
				groesse(0.6);
				groessetoleranz(0.5);
				vektor().setzen(0,0,0);
				vektortoleranz(0.7);
				lebensdauerpartikel(0.5);
				lebensdauerpartikeltoleranz(0.5);
				rotation(220);
				rotationtoleranz(20.5);
				opazitaet(1);
				feldkraftg(+0.55);
				ortraum(0,1.5,0,0);
				ortraum(1,0,2.25,0);
				ortraum(2,0,0,0.2);
				transparenzadditiv();
  				feldkraftghomogen().setzen(0,0,-1);
				generationsdichtedynamisch(0.5);
				pumptime=0;
				pumpup=0;
				pumpgenrate=50;
				pumplifetime=1000;
				rotfac=zufall<_tg>(0.02,0.04);
				for(int i=0;i<20;i++){
				 for(int j=0;j<4;j++){
				  burnpoint[i*4+j]=0;
				 };
				};
				burnpointcount=0;
				
				_tg scale=4;
				_netz*ms0;
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),scale,scale,solitaire->tfeuer2);
				gg.ort(-scale/2,-scale/2,0);
				m=gg.erzeugen();
				//m->vertexlichtdynamisch(false);//!!!!!!!!!!!!!!!!!!!
				m->transparenz(true);
				m->transparenzadditiv(true);
				gg.textur(solitaire->tfeuer3);
				m2=gg.erzeugen();
				//m2->dynamicvertexlight=false;
				m2->transparenz(true);
				m2->transparenzadditiv(true);
				gg.textur(solitaire->tfeuer5);
				m4=gg.erzeugen();
				//m4->dynamicvertexlight=false;
				m4->transparenz(true);
				m4->transparenzadditiv(true);
				//init(solitaire->world, solitaire->gra,solitaire->particlesourcegamelist,solitaire->particlegamelist,solitaire->clock);
				einfuegennetz(m);
				einfuegennetz(m2);
				einfuegennetz(m4);
				axialdivergenz(true);
				axialdivergenzort(card->position);
				axialdivergenzvektor().setzen(0,0,-0.02);
				kurvefarbe(true);
				kurvefarbe().setzen(0.0,0.0,0.0,0.05  ,  0.8,0.2,0.0,0.0,  2,1,0.5,5, -3,-2,-2.5,-1);
				offsetrnd=zufall<_tg>(0,3000);
				generationsrateletzterort(card->position);
				positionold=card->position;
				firevector.setzen(0,0,0);
				smoke=new _cardsmoke(solitaire,this);
};
_cardfire::~_cardfire(){
				deletesecure(smoke);
				deletesecure(deltamap);
				deletesecure(texturemap);
				deletesecure(m);
				deletesecure(m2);
				deletesecure(m4);
};
void _cardfire::activate(){
				generationsrateletzterort(card->position);
				positionold=ort();
				firevector.setzen(0,0,0);
				_partikelquelle::aktiv(true);
};
void _cardfire::animieren(){
				if(aktiv()){
				 _tg ttt=solitaire->clock->system();
				 positionold=ort();
				 _vektor3<_tg> h=card->position;
				 ort(h);
				 firevector=ort()-positionold;
				 ortraum(0,card->vx*positionshift.x()*0.5);
				 ortraum(1,card->vy*positionshift.y()*0.5);
				 h+=ortraum(0);
				 h+=ortraum(1);
				 ort(h);
				 ortraum(0,card->vx);
				 ortraum(1,card->vy);
				 ortraum(2,ortraum(0)%ortraum(1));
				 ortraum(2).normalisieren();
				 ortraum(2)*=0.5;
				 ortraum(0)*=(0.5*(1-fabs(positionshift.x())));
				 ortraum(1)*=(0.5*(1-fabs(positionshift.y())));
				 positionshift*=0.99;
				 axialdivergenzort(card->position.x()+sin(_ph*offsetrnd+ttt*0.0031)*0.4,card->position.y()+cos(_ph*offsetrnd+ttt*0.0021)*0.4,card->position.z());
				 int tt=500-(ttt-pumptime);
				 if(tt<0) tt=0;
				 if(pumpup) tt/=2;
				 if((zufall<int>(0,tt)==0)||(tt==0)){
				  pumptime=ttt;
				  if(pumpup==false){
				   pumpup=true;
  				   pumpgenrate=zufall<int>(50,80);
				   pumplifetime=zufall<int>(475,550);
				  }else{
				   pumpup=false;
  				   pumpgenrate=zufall<int>(70,100);
				   pumplifetime=zufall<int>(500,600);
				  };
				 };
  			     generationsrate(pumpgenrate);
				 lebensdauerpartikel(pumplifetime*2*(_tg(1)/(1+firevector.laenge()))*pumpdeathfactor);//vorher 1.5
				 if(burnopacity<0.9){
				  if((smoke->aktiv()==false)&&(solitaire->systemaccellerate==false)){
				   smoke->generationsrateletzterort(ort());
				   smoke->ort(ort());
				   smoke->aktiv(true);
				  };
				 };
				 _partikelquelle::animieren();
				};
};
_partikel*_cardfire::erzeugenpartikel(const _vektor3<_tg>&pos){
	            _partikel*ps=_partikelquelle::erzeugenpartikel(pos);
				ps->rotationreibung(-0.01);
				if((ps->netz())&&(ps->rotation()!=0)){
				 _tg w=((ps->ort().x()-ort().x())/1.2);//-1..+1
				 w*=0.5;
				 w+=0.5;
				 w*=90;
				 ps->netz()->rotieren(ps->rotationachse(),w);
				 ps->netz()->aktualisieren();
				 ps->rotationvektor((w-45)*4*(1+firevector.laenge()));
				};
				return(ps);
};
void _cardfire::generieren(){
                _partikel*ps;
                _tg n=generationsrate();
				_tg u=zeit()->system();
				_tg dt=(u-generationsrateletztegenerierung());///Float(1000)
				_tg anz=dt*n*0.001;
				generationsratesollpartikelinkrementieren(anz);
				bool particlegenerated=false;
				_vektor3<_tg> particlegeneratedposition;
				int i=floor(generationsratesollpartikel());
				if(i>2000)i=2000;
				if(i>0){
                 for(int j=0;j<i;j++) ps=erzeugenpartikel(ortpartikel());
                 generationsratesollpartikeldekrementieren(i);
                };
				if(generationsdichtedynamisch()!=0){
                 ps=erzeugenpartikel(ortpartikel());
                 generationsrateletzterort(ort());
                 _tg d=generationsrateletzterort().abstand(particlegeneratedposition);
				 if(d>=generationsdichtedynamisch()){
				  int ic=int(d/generationsdichtedynamisch());
				  _vektor3<_tg> h;
				  _vektor3<_tg> r;
				  _vektor3<_tg> a;
				  _vektor3<_tg> b;
				  _vektor3<_tg> c;
				  _vektor3<_tg> pit;
				  pit=generationsrateletzterort();
				  h=particlegeneratedposition-pit;
				  _tg dh=_tg(1)/_tg(ic+1);
				  h*=dh;
				  pit+=h;
		          for(int n=0;n<ic;n++){
				  //for(Local i=0 To ic-1
				   a=ortraum(0);
				   b=ortraum(1);
				   c=ortraum(2);
				   r.zufall();
                   r*=zufall<_tg>(0,orttoleranz());
				   a*=zufall<_tg>(-1,1);
				   b*=zufall<_tg>(-1,1);
				   c*=zufall<_tg>(-1,1);
				   r+=pit;
				   r.add(a);
				   r.add(b);
				   r.add(c);
				   erzeugenpartikel(r);
				   pit+=h;
				  };
				 };
				 generationsrateletzterort(particlegeneratedposition);
				};
			    generationsrateletztegenerierung(u);
};
void _cardfire::generateburnpoints(const _vektor2<_tg>&para){
				positionshift=para;
				burnpointcount=zufall<int>(8,10);
				for(int i=0;i<burnpointcount;i++){
				 burnpoint[i*4+0]=zufall<_tg>(-1,+1);
				 burnpoint[i*4+1]=zufall<_tg>(-1,+1);
				 burnpoint[i*4+2]=_tg(1)/zufall<_tg>(0.01,0.2);
				 burnpoint[i*4+3]=zufall<_tg>(0.5,0.7);
				};
				
				_tg cw=solitaire->cardsetmanager->width;
				_tg ch=solitaire->cardsetmanager->height;
				deletesecure(deltamap);
				deltamap=new _to[cw*ch*4];
				_tg fx=-1;
				_tg fy=-1;
				_tg cwh=cw/2;
				_tg chh=ch/2;
				_tg fsx=_tg(1)/_tg(cwh);//optimation step
				_tg fsy=_tg(1)/_tg(chh);//optimation step
				_tg dx,dy;
				_to e0;
				_to e1;
				int bi;
				int gi;
				int ri;
				_to ss=_to(1)/(2*0.3*0.3);//optimation gauss
				_to*dm=deltamap;
				fy=-1;
			    for(int y=0;y<ch;y++){
			  	 fx=-1;
				 for(int x=0;x<cw;x++){
				  fx=_to(x-cwh)/_to(cwh);
				  fy=_to(y-chh)/_to(chh);
				  e0=0;
				  e1=0;
				  dx=para.x()-fx;//position at gauss is 0,0
				  dy=(-para.y())-fy;
				  e0=exp(-(dx*dx+dy*dy)*ss);//gauss
				  for(int i=0;i<burnpointcount;i++){
				   dx=burnpoint[i*4+0]-fx;
				   dy=-burnpoint[i*4+1]-fy;
				   e0+=exp(-(dx*dx+dy*dy)*burnpoint[i*4+2])*burnpoint[i*4+3];//e0+(burnpoint[i,2]*(dx*dx+dy*dy))
   				  };
				  dm[0]=0.3+e0*2;
				  dm+=1;
				  dm[0]=0.2+e0*1.5;
				  dm+=1;
				  dm[0]=0.18+e0*1.3;
				  dm+=1;
				  dm[0]=0.3+e0;
				  dm+=1;
				  fx+=fsx;
				 };
				 fy+=fsy;
			 	};

                //im folgenden wird einen texturemap angelegt (ein reines float array) das mit den daten der textur gefüllt wird
                //achtung: das bildhardware muss schon geladen sein.
			 	deletesecure(texturemap);
				texturemap=new _to[cw*ch*4];
				if(card->poly->texturfront()->bitmap(0)->bildhardware()){//is the _textured3d7-object of a _texture-object loaded ?
				 _bildhardware*tex=card->poly->texturfront()->bitmap(0)->bildhardware();//types defined in graphics bmx
				 tex->lesen(texturemap);
				 //Local lflags=DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR//|DDLOCK_WRITEONLY//|DDLOCK_READONLY
				 /*Local res=tex.surface.Lock(0,tex.sinfo,lflags,0)//open surface for(modification
				 Local memit:Byte Ptr=tex.sinfo.lpSurface//get memory pointer to surface data array
				 Local tm:Float Ptr=texturemap
				 for(Local y=0 To ch-1
				  for(Local x=0 To cw-1
				   for(Local i=0 To 3
				    tm[0]=memit[0]//0..255
				    tm+=1
				    memit+=1
				   };
				  };
				 };
				 tex.surface.unlock(tex.sinfo)
				 */
				};
				
				card->copytexture();
};
void _cardfire::animateburnpoints(){
				for(int i=0;i<burnpointcount;i++){
				 burnpoint[i*4+2]+=0.01;//burnpoint[i,3]
				};
};
void _cardfire::drawburnpoints(){
				//testen direct texture access
				if(aktiv()){
				 if((texturemap)&&(card->poly->texturfront()->bitmap(0)->bildhardware())){ //is the _textured3d7-Object of a _texture-Object loaded ?
				 //die daten von texure map in das daten feld von bildhardware ( der dyn. textur() scheffeln
				  _bildhardware*tex=card->poly->texturfront()->bitmap(0)->bildhardware();//[0,0].image.frames[0])//types defined in graphics bmx
				  //Local lflags=DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR//|DDLOCK_WRITEONLY//|DDLOCK_READONLY
				  //Local res=tex.surface.Lock(0,tex.sinfo,lflags,0)//open surface for(modification
				  //Local memit:Byte Ptr=tex.sinfo.lpSurface//get memory pointer to surface data array
				  tex->oeffnen();
				  _tb*memit=tex->daten();
				  
					  
				  
				  
				  
				  
				  int cw=solitaire->cardsetmanager->width;
				  int ch=solitaire->cardsetmanager->height;
				  burncounter+=1;
				  if(burnstatus==1){
				   _to*tm=texturemap;
				   _to*dm=deltamap;
				   int opa=cw*ch;
			       for(int y=0;y<ch;y++){
				    for(int x=0;x<cw;x++){
				     for(int i=0;i<3;i++){
				      tm[0]-=(dm[0]*burnfactor);
				      if(tm[0]<0) tm[0]=0;
				      memit[0]=tm[0];
				      memit+=1;
				      tm+=1;
				      dm+=1;
				     };
				     tm[0]-=(dm[0]*burnfactor);
				     if(tm[0]<0.5){
				      memit[0]=0;
				      opa-=1;
				     }else{
				      memit[0]=255;
				     };
				     memit+=1;
				     tm+=1;
				     dm+=1;
				    };
			 	   };
		           burnfactor+=0.04;
				   burnopacity=_to(opa)/_to(cw*ch);
		 		   if(opa<10000){
		  		    pumpdeathfactor=0.5+(_tg(opa)/_tg(10000))*0.5;
				    if(opa<8000){
				     card->opacity=_to(opa)/_to(8000);
			 	     if(opa==0){
			          aktiv(false);
			          smoke->aktiv(false);
			          card->opacity=0;
			          if(solitaire->game) solitaire->game->endedbygiveupburn=true;
			         };
			        };
			  	   };
				  };
				  if(burnstatus==0){
				   _to*tm=texturemap;
				   _to*dm=deltamap;
				   int opa=cw*ch;
			       for(int y=0;y<ch;y++){
				    for(int x=0;x<cw;x++){
				     for(int i=0;i<3;i++){
				      tm[0]-=dm[0];
				      if(tm[0]<0) tm[0]=0;
				      memit[0]=tm[0];
				      memit+=1;
				      tm+=1;
				      dm+=1;
				     };
				     tm[0]-=dm[0];
				     if(tm[0]<0.5){
				      memit[0]=0;
				      opa-=1;
				     }else{
				      memit[0]=255;
				     };
				     memit+=1;
				     tm+=1;
				     dm+=1;
				    };
			 	   };
			       burnopacity=_to(opa)/_to(cw*ch);
				   if(burncounter>=50){
				    burncounter=0;
				    burnstatus=1;
				   };
				  };
				  
				  
				  
				  tex->schliessen();
		      	 };
				};
};
void _cardfire::setopacity(_to op){
	            _listenknoten<_partikel>*pit;
				if(listepartikelintern()->anfang(pit))do{
				 pit->objekt()->opazitaetexternekontrolle(op);
				}while(listepartikelintern()->naechstes(pit));
				if(smoke->listepartikelintern()->anfang(pit))do{
				 pit->objekt()->opazitaetexternekontrolle(op);
				}while(smoke->listepartikelintern()->naechstes(pit));
};

//******************************************************************************************************************
//										C A R D 
//******************************************************************************************************************
_card::_card(_solitaire*s,_game*g,int su,int n,_tg px,_tg py):_speicherbarbinaer(s){
                solitaire=s;
                game=g;
	            picklink=0;
	            blowlink=0;
	            pile=0;
	            visible=true;
				suit=su;
				number=n;
	            parent[0]=0;
	            parent[1]=0;
	            child[0]=0;
	            child[1]=0;
	            labyrinth=0;
				labindex[0]=0;
				labindex[1]=0;
	            sweetmatch=0;
				sweetindex[0]=0;
				sweetindex[1]=0;
	            sweetblocked=false;
	            array=0;
				arrayindex[0]=0;
				arrayindex[1]=0;
	            mesh=0;
	            timephysicslast=0;
	            timephysicsstart=0;
	            dynamictexture=false;
	            backsided=false;
	            rotation=0;
	            rotationmust=0;
	            rotationvector=0;
	            rotationvelocity=0.1;
	            rotationfriction=0.9;
	            rotationold=1000;
	            angle=90;
	            anglemust=90;
	            anglevector=0;
	            anglevelocity=0.05;
	            anglefriction=0.85;
	            shiftvelocity=0.1;
	            shiftfriction=0.9;
	            neigungx=0;
	            neigungactive=false;
	            opacity=1;
	            opacityquant=0;
	            shadowarraycount=0;
	            curvepositiont=0;
	            curvevxt=0;
	            curvevyt=0;
	            curving=false;
	            curvespeed=20;
	            curvetime=0;
	            inpreparation=false;
	            clicktime=0;
	            clickleft=false;
	            doubleclicked=false;
	            picked=false;
	            pickending=false;
	            cardcontrolopacity=0;
	            fire=0;
	            fireinner=false;
	            fireakku=0;
	            fireakkustart=0;
	            poly=0;
	            meshchanged=true;
	            meshchangedlasttime=0;
				colorcurve.setzen(1,1,1,1, 0,0,0,0 ,0,0,0,0, 0,0,0,0);
				hvnold.setzen(1000,1000,1000);
				hvpold.setzen(1000,1000,1000);
				hvvvxold.setzen(1000,1000,1000);
				hvvvyold.setzen(1000,1000,1000);
				position.setzen(px,py,0);
				vx.setzen(game->cardwidth,0,0);
				vy.setzen(0,game->cardheight,0);
				_geometrienetz gg(0,_vektor3<_tg>(0,0,0),vx,vy,0);
				if((game->preview==false)&&(game->menu==false)){
				 gg.texturfront(solitaire->cardsetmanager->texturfront[suit+number*4]);//vorher : solitaire->tcard[suit+number*4]
				 gg.texturrueck(solitaire->cardsetmanager->texturback);//vorher : solitaire->tcardback[solitaire->cardtexturebackindex]
				}else if(game->preview){
				 gg.texturfront(solitaire->cardsetmanager->texturfrontsmall[suit+number*4]);//vorher : solitaire->tcard[suit+number*4]
				 gg.texturrueck(solitaire->cardsetmanager->texturbacksmall);//vorher : solitaire->tcardback[solitaire->cardtexturebackindex]
				}else if(game->menu){
				 gg.texturfront(solitaire->cardsetmanager->texturfrontmicro[suit+number*4]);
				 gg.texturrueck(solitaire->cardsetmanager->texturbackmicro);
				};
				gg.ort(0,0,0);
				gg.farbe(1,1,1,1);
				gg.texturvektor(1,-1);
				mesh=gg.erzeugen();
				mesh->zweiseitig(true);
				//mesh->sichtbar(true);
				mesh->transparenz(true);
				mesh->transparenzadditiv(false);
				//mesh->sigmadiffus(0.3);//!!!!!!!!!!!!!!!!!!!!
				mesh->welt(solitaire->world);
				mesh->anfang(poly);
				poly->knotenzeichnung(&game->drawlist);
				updatevertexarray();
				updatemesh();
				createshadow();
				//effekt
				fire=new _cardfire(solitaire,this);
				fire->aktiv(false);
				rotationmust=zufall<_tg>(-game->solitaire->naturalpiles*5,game->solitaire->naturalpiles*5);
				_tg sn=solitaire->naturalpiles*0.2;
				shiftmust.setzen(zufall<_tg>(-sn,+sn),zufall<_tg>(-sn,+sn));
};
_card::_card(_card*c):_speicherbarbinaer(c->solitaire){
                copy(c);
};                
_card::~_card(){
			//	deinsertpile();
				deinsertgame();
				deinsertpick();
			//	deinsertblow();
			/*	if(_listenknotenbasis<_card>::liste()!=&game->tipplist){//tipplink==0){ //wichtig weil sonst die pyramide destabilisiert wird
				 deinsertpyramid();
				 deinsertlabyrinth();
				 deinsertarray();
				 deinsertsweetmatch();
				};*/
				//deletesecure(tipplink);
				//if(poly) poly->loeschenknotenzeichnung();
				
				clearshadow();
				cleareffects();
				if((dynamictexture)&&(poly)) poly->loeschentextur();//texture[0,0].clear()
				deletesecure(mesh);
				poly=0;
				
};
void _card::copy(_card*c){//copies a card for(TIPP LIST , not for(general purposes
				solitaire=c->solitaire;
				picklink=0;
				game=c->game;
				//gamelink=0;
				//tipplink=0;
				pile=0;
				//pilelink=0;
				visible=c->visible;
				suit=c->suit;
				number=c->number;
				parent[0]=c->parent[0];
				parent[1]=c->parent[1];
				child[0]=c->child[0];
				child[1]=c->child[1];
				labyrinth=0;//c->labyrinth
				labindex[0]=0;//c->labindex[0]
				labindex[1]=0;//c->labindex[1]
				sweetmatch=0;
				sweetindex[0]=0;
				sweetindex[1]=0;
				sweetblocked=false;
				array=0;
				arrayindex[0]=0;
				arrayindex[1]=0;
				mesh=c->mesh->duplizieren();
				if(mesh) {
				 mesh->_listenknotenbasis<_netz>::aushaengen();//if(mesh.link RemoveLink mesh.link
				 mesh->anfang(poly);
				};
				poly->knotenzeichnung(&game->drawlist);
				position=c->position;
				vx=c->vx;
				vy=c->vy;
				rotation=c->rotation;
				rotationmust=c->rotationmust;
				rotationvector=c->rotationvector;
				rotationvelocity=c->rotationvelocity;
				rotationfriction=c->rotationfriction;
				angle=c->angle;
				anglemust=c->anglemust;
				anglevector=c->anglevector;
				anglevelocity=c->anglevelocity;
				anglefriction=c->anglefriction;
				shift=c->shift;
				shiftmust=c->shiftmust;
				shiftvector=c->shiftvector;
				shiftvelocity=c->shiftvelocity;
				shiftfriction=c->shiftfriction;
				neigungx=c->neigungx;
				opacity=c->opacity;
				opacityquant=c->opacityquant;
				curveposition.kopieren(c->curveposition);
				curvevx.kopieren(c->curvevx);
				curvevy.kopieren(c->curvevy);
				curvepositiont=c->curvepositiont;
				curvevxt=c->curvevxt;
				curvevyt=c->curvevyt;
				curving=c->curving; 
				curvespeed=c->curvespeed;
				curvetime=c->curvetime;
				picked=false;
				pickposition=c->pickposition;
				pickvx=c->pickvx;
				pickvy=c->pickvy;
				pickending=false;
				mesh->welt(solitaire->world);
				updatevertexarray();
				updatemesh();
				createshadow();
				//effekt
				fire=new _cardfire(solitaire,this);
				colorcurve.kopieren(c->colorcurve);
};
void _card::copytexture(){
				_textur<_tb>*t=new _textur<_tb>();
				_bild<_tb>*b=new _bild<_tb>(poly->textur()->bitmap(0));
				t->einfuegenbitmap(b);
				poly->textur(t);
				dynamictexture=true;
};
void _card::cleareffects(){
                deletesecure(fire);
};
void _card::clearshadow(){
				if(shadowarraycount>0){
				 for(int i=0;i<shadowarraycount;i++) deletesecure(shadowarray[i]);
				};
				shadowarraycount=0;
};
void _card::createshadow(){
				clearshadow();
				if((game->preview==false)&&(game->menu==false)){
				 _licht<_tg,_to>*lit;
				 if(solitaire->world->anfang(lit))do{
				  if(lit->schatten()){
				   _textur<_tb>*tex=solitaire->tshadow;
				   _listebasis<_schatten<_tg,_to> >*l=&solitaire->shadowpreviewlist;
				   if(game->preview==false) l=&solitaire->shadowlist;
				   _schatteneinfach<_tg,_to>*sit=new _schatteneinfach<_tg,_to>(l,lit,mesh,tex);
 				   shadowarray[shadowarraycount]=sit;
   				   shadowarraycount+=1;
  				  };
				 }while(solitaire->world->naechstes(lit));
				 updateshadow();
				};
};
void _card::updateshadow(){
				if((solitaire->systemaccellerate==false)&&(game->preview==false)&&(game->menu==false)){
				 bool machen=true;
				 if((visible==false)||(position.z()>=+0.3)) machen=false;
				 if(pile) if((pile->drawownshadow)&&(curving==false)&&(picked==false)) machen=false;
				 if(machen==false){
				  for(int i=0;i<shadowarraycount;i++) shadowarray[i]->gueltig(false);
				  return;
				 };
				 for(int i=0;i<shadowarraycount;i++) shadowarray[i]->aktualisieren();
				};
};
void _card::discard(bool beth){
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
				 curvespeed=30;
				 curvevx.setzen(vx,dvx,vn,vn);
				 curvevy.setzen(vy,dvy,vn,vn);
				 curveposition.setzen(position,pd->dropposition(),vtn,vtp);
				 startcurve();
				 deinsertpile();
				 insertpile(pd,true);
				};
};
int _card::index(){
				//return the index of the card in the pilelist
				if(pile==0) return(0);
				int i=0;
				_card*cit;
				if(pile->anfang(cit))do{
				 if(cit==this) return(i);
				 i++;
				}while(pile->naechstes(cit));
				return(0);
};
bool _card::canturn(){
				if(pile==0) return(false);
				if(curving) return(false);
				if(game->picklist.anzahl()>0) return(false);
				return(pile->canturn(this));
};
bool _card::canpick(){
				if(pile==0) return(false);
				_listenknoten<_card>*c;
				if(game->picklist.anfang(c))do{
				 if(c->objekt()->picked) return(false);
				}while(game->picklist.naechstes(c));
				if(doubleclicked) return(false);
				return(pile->canpick(this));
};
void _card::pick(){
				if(picked==false){
				 if(game->picklist.erstes()==0) game->pickpositionold=position;
				 picklink=game->picklist.einhaengen(this);
				 picked=true;
				 poly->markierung(1);
				 pickending=false;
				 if(curving==false){
				  pickposition=position;
				  pickvx=vx;
				  pickvy=vy;
				 }else{
				  pickposition=curveposition.ort(1);
				  pickvx=curvevx.ort(1);
				  pickvy=curvevy.ort(1);
				  curving=false;
				  poly->markierung(0);
				 };
				 //pickoffset bestimmen, wenn nicht bereits gesetzt
				 if(game->pickoffsetcard==0){
				  game->pickoffsetcard=this;
				  _tg g=(position.z()-game->solitaire->cam->z())/game->solitaire->mousevector.z();
				  _tg ix=game->solitaire->cam->x() + g*game->solitaire->mousevector.x();
				  _tg iy=game->solitaire->cam->y() + g*game->solitaire->mousevector.y();
				  game->pickoffsetx=ix-position.x();
				  game->pickoffsety=iy-position.y();
				 };
				};
};
void _card::depick(_tg tz){
			 	curvevx.setzen(vx,pickvx,0,0,0 ,0,0,0);
			 	curvevy.setzen(vy,pickvy,0,0,0 ,0,0,0);
				curveposition.setzen(position, pickposition, 0,0,-tz*5,0,0,0);
				curvespeed=25;
				startcurve();
				if(picklink){
				 if(picklink->naechstes()!=picklink->liste()->erstes()){ //if(picklink->naechstes())
			  	  _card*cn=picklink->naechstes()->objekt();
			      cn->depick(tz+1);
				 };
				};
				deinsertpick();
};
void _card::deinsertforblow(){
				deinsertpile();
				deinsertgame();
				deinsertpick();
				deinsertpyramid();
				deinsertlabyrinth();
				deinsertarray();
				deinsertsweetmatch();
				
				poly->loeschenknotenzeichnung();
				curving=false;
				inpreparation=false;
				game=0;
};
void _card::insertblow(_game*g){
				game=g;
				deinsertblow();
				_listenknotenbasis<_card>::einhaengen(&game->blowlist);
				poly->knotenzeichnung(&game->drawlist);
				poly->markierung(1);
				timephysicslast=solitaire->clock->system();
				timephysicsstart=timephysicslast;
				updatemesh();
};
void _card::deinsertblow(){
                _listenknotenbasis<_card>::aushaengen();
};
void _card::insertpile(_pile*p,bool first,int asindex){
				pile=p;
				if(asindex==0){
				 if(first) _listenknotenbasis<_card>::einhaengenerstes(pile); else _listenknotenbasis<_card>::einhaengen(pile);
				}else{
				 int n;
				 _card*it=0;
				 if(first){
				  it=pile->erstes();
				  for(n=0;n<asindex;n++){
				   if(it) it=it->naechstes();
				   if(it==pile->erstes()) it=0;
				  };
				  if(it){
				   _listenknotenbasis<_card>::einhaengenvor(pile,it);
				  }else{
				   _listenknotenbasis<_card>::einhaengenerstes(pile);//pilelink=pile.cardlist.einhaengen(this)//VORHER !"!!!!!!!!!!!!!!!!!!!!! : addfirst(this)
				  };
				 }else{
				  it=pile->letztes();
				  for(n=0;n<asindex;n++){
				   if(it) it=it->vorheriges();
				   if(it==pile->letztes()) it=0;
				  };
				  if(it){
				   _listenknotenbasis<_card>::einhaengennach(pile,it);//pilelink=pile.cardlist.insertafterlink(this,it)
				  }else{
				   _listenknotenbasis<_card>::einhaengen(pile);//pilelink=pile.cardlist.einhaengen(this);
				  };
				 };
				};
				game->tippresetcombination(0);
				game->tippresetcombination(1);
				game->tippresetcombination(2);
				game->tippresetcombination(3);
				pile->updatedescription();
};
void _card::deinsertpile(){
				_pile*oldpile=pile;
				if(pile){//pilelink 
				 _listenknotenbasis<_card>::aushaengen();//ERST LÖSCHEN, DA ES SONST NICHTS BRINGT !!!!
				 if(game){
				  game->tippreservepile=0;
				  game->tippreservecard=0;
				  game->tippstockpile=0;
				  game->tippwastepile=0;
				  game->tippredealpile=0;
				  if(game->tippsourcarditerator==this) game->tippresetcombination(0);
				  if(game->autoplaysourcarditerator==this) game->tippresetcombination(1);
				  if(game->automovesourcarditerator==this) game->tippresetcombination(2);
				  if(game->clickplaysourcarditerator==this) game->tippresetcombination(3);
				 };
				};
				pile=0;
				if(oldpile) oldpile->updatedescription();
};
void _card::insertgame(){
                _listenknotenbasis<_card>::einhaengen(&game->cardlist);
};
void _card::deinsertgame(){
                _listenknotenbasis<_card>::aushaengen();
				//if(gamelink RemoveLink gamelink
				//gamelink=0
};
void _card::insertpick(){
				game->startusing();
				if(picked==false) pile->pick(this);
};
void _card::deinsertpick(){
	            deletesecure(picklink);
				picked=false;
				if(game->pickoffsetcard==this) game->pickoffsetcard=0;
};
void _card::insertpyramid(_card*p0,_card*p1,_card*c0,_card*c1){
				parent[0]=p0;
				parent[1]=p1;
				child[0]=c0;
				child[1]=c1;
				if(parent[0]) parent[0]->child[1]=this;
				if(parent[1]) parent[1]->child[0]=this;
				if(child[0]) child[0]->parent[1]=this;
				if(child[1]) child[1]->parent[0]=this;
};
void _card::deinsertpyramid(){
				if(parent[0]){
				 parent[0]->child[1]=0;
				 parent[0]=0;
				};
				if(parent[1]){
				 parent[1]->child[0]=0;
				 parent[1]=0;
				};
				if(child[0]){
				 child[0]->parent[1]=0;
				 child[0]=0;
				};
				if(child[1]){
				 child[1]->parent[0]=0;
				 child[1]=0;
				};
};
void _card::insertlabyrinth(_pilelabyrinth*l,int fx,int fy){
				if(l->feld[fx+l->dimx*fy]) l->feld[fx+l->dimx*fy]->deinsertlabyrinth();
				labyrinth=l;
				labindex[0]=fx;
				labindex[1]=fy;
				labyrinth->feld[fx+l->dimx*fy]=this;
};
void _card::deinsertlabyrinth(){
				if(labyrinth){
				 labyrinth->feld[labindex[0]+labyrinth->dimx*labindex[1]]=0;
				 labindex[0]=0;
				 labindex[1]=0;
				 labyrinth=0;
				};
};
void _card::insertsweetmatch(_pilesweetmatch*l,int fx,int fy){
				//Print "insertsweet s="+suit+" n="+number+" bei "+fx+","+fy
				if(l->feld[fx+l->dimx*fy]) l->feld[fx+l->dimx*fy]->deinsertsweetmatch();
				sweetmatch=l;
				sweetindex[0]=fx;
				sweetindex[1]=fy;
				sweetmatch->feld[fx+l->dimx*fy]=this;
};
void _card::deinsertsweetmatch(){
				if(sweetmatch){
				 sweetmatch->feld[sweetindex[0]+sweetmatch->dimx*sweetindex[1]]=0;
				 sweetindex[0]=0;
				 sweetindex[1]=0;
				 sweetmatch=0;
				};
};
void _card::insertarray(_pilearray*l,int fx,int fy){
				if(l->feld[fx+l->dimx*fy]) l->feld[fx+l->dimx*fy]->deinsertarray();
				array=l;
				arrayindex[0]=fx;
				arrayindex[1]=fy;
				array->feld[fx+l->dimx*fy]=this;
};
void _card::deinsertarray(){
				if(array){
				 array->feld[arrayindex[0]+array->dimx*arrayindex[1]]=0;
				 arrayindex[0]=0;
				 arrayindex[1]=0;
				 array=0;
				};
};
_polygon*_card::polygon(){
                poly=0;
                if(mesh) mesh->anfang(poly);
				return(poly);
};
void _card::draw(_grafik*gra,_kamera<_tg>*cam){
				if(visible){
				 poly->zeichnen(gra);
				};
};
void _card::startcurve(){
				curvetime=solitaire->clock->system();
				curvepositiont=0;
				curvevxt=0;
				curvevyt=0;
				curvevx.vektor(0)*=game->scaleglobal;
				curvevx.vektor(1)*=game->scaleglobal;
				curvevy.vektor(0)*=game->scaleglobal;
				curvevy.vektor(1)*=game->scaleglobal;
				curveposition.vektor(0)*=game->scaleglobal;
				curveposition.vektor(1)*=game->scaleglobal;
				curveposition.aktualisieren();
				curvevx.aktualisieren();
				curvevy.aktualisieren();
				curving=true;
				poly->markierung(1);
};
void _card::animatecurve(){
				_tg newtime=game->solitaire->clock->system();
				_tg deltat=_tg(newtime-curvetime)/_tg(1000);
				curvetime=newtime;
				if(curving){
				 if(curvepositiont<1){
				  curveposition.berechnen(curvepositiont);
				  curvevx.berechnen(curvevxt);
				  curvevy.berechnen(curvevyt);
				  _tg deltal=curvespeed*deltat;
				  _tg dt;
				  if(curveposition.laenge()<nahenull){
				   dt=1;
				  }else{
				   dt=(deltal/curveposition.laenge());
				  };
				  curvepositiont+=dt;
				  curvevxt+=dt;
				  curvevyt+=dt;
				  position=curveposition.e();
				  vx=curvevx.e();
				  vy=curvevy.e();
				 }else{
				  curvepositiont=0;
				  curvevxt=0;
				  curvevyt=0;
				  position=curveposition.ort(1);
				  vx=curvevx.ort(1);
				  vy=curvevy.ort(1);
				  curving=false;
				  poly->markierung(0);
				  curvespeed=10;
				  doubleclicked=false;
				 };
				}else{
				 if(doubleclicked){
				  if((game->solitaire->clock->system()-clicktime)>300) doubleclicked=false;
				 };
				};
};
void _card::animatenaturality(){
				_tg d;
				d=(rotationmust)-rotation;
				d*=rotationvelocity;
				rotationvector+=d;
				rotation+=rotationvector;
				rotationvector*=rotationfriction;
				_vektor2<_tg> h=(shiftmust-shift)*shiftvelocity;
				shiftvector+=h;
				shift+=shiftvector;
				shiftvector*=shiftfriction;
};
void _card::animateangle(){
				_tg d;
				d=(anglemust)-angle;
				if(fabs(d)>nahenull){
				 d*=anglevelocity;
				 anglevector+=d;
				};
				if(fabs(anglevector)>nahenull){
				 angle+=anglevector;
				 anglevector*=anglefriction;
				};
};
void _card::animatephysics(){
				_tg timenew=game->solitaire->clock->system();
				_tg timed=timenew-timephysicslast;
				_tg fanim=timed/1000;
				_tg fanimnorm=fanim/_tg(0.0166666666);
				fanimnorm*=fanimnorm;
				if(fanimnorm<0.05) fanimnorm=0.05;
				if(fanimnorm>4) fanimnorm=4;
							
				timephysicslast=timenew;
				_vektor3<_tg> grav;
				_tg friction=(1-0.0001)*60;//1%/ 16.66msec
				_tg age=_tg(timenew-timephysicsstart)/_tg(5000);
				if(age>1) age=1;
				
				colorcurve.berechnen(age);
				opacity=colorcurve.e().w();
				
				vektor*=0.970001;//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 0.97^fanimnorm !!!!!!!  friction*fanim)
   				game->gravityblow->vektor(position,grav);
				rollvector.x(rollvector.x()+grav.x()*0.5);
				rollvector.y(rollvector.y()+grav.y()*0.5);
				grav*=_tg(0.0166666666)*fanimnorm;
				vektor+=grav;
				position+=vektor;
				vx.rotieren(vy,rollvector.x()*fanimnorm);
				vy.rotieren(vx,rollvector.y()*fanimnorm);
				rollvector*=0.97;
};
void _card::animate(){
				animatecurve();
				animatenaturality();
				updatemesh();
				if((solitaire->clock->system()-meshchangedlasttime)<1500){
				 updateshadow();
				};
				if(fire) fire->drawburnpoints();
};
bool _card::vergleichen(_card*c){
				if(c){
				 _tg x=position.x();
				 _tg y=position.y();
				 _tg z=position.z();
				 _tg ox=c->position.x();
				 _tg oy=c->position.y();
				 _tg oz=c->position.z();
				 _tg c=z+sqrt(x*x+y*y)*0.000005;
				 _tg co=oz+sqrt(ox*ox+oy*oy)*0.000005;
	 			 if(c<co) return(true);
				};
				return(false);
};
bool _card::turnedup(){
				if(polygon()->z()>0) return(true); else return(false);
};
bool _card::turnedupatcurveend(){
				_vektor3<_tg> va=curvevx.ort(1);
				_vektor3<_tg> vb=curvevy.ort(1);
				va.normalisieren();
				vb.normalisieren();
				va%=vb;
				if(va.z()<=0) return(true); else return(false);
};
void _card::turn(_tg spd,bool useundo){
				pile->turn(this,spd,useundo);
};
void _card::normcardplane(){
				hvh=vx;
				hvh%=vy;
				hvh%=vx;
				vy=hvh;
				vx.normalisieren();
				vx*=game->cardwidth;
				vy.normalisieren();
				vy*=game->cardheight;
};
void _card::normcardplanetransformed(_vektor3<_tg>&vvx,_vektor3<_tg>&vvy,_vektor3<_tg>&n){
				hvh=vvx;
				hvh%=vvy;
				hvh%=vvx;
				vvy=hvh;
				vvx.normalisieren();
				vvx*=game->cardwidth;
				vvy.normalisieren();
				vvy*=game->cardheight;
};
void _card::updatevertexarray(){
				_polygon*pit;
				_vertex*vit;
				int i=0;
				if(mesh->anfang(pit))do{
				 vit=pit->vertex();
				 if(vit)do{
				  if(i<4) {
				   vertex[i]=vit;
				   vertex[i]->anfang(verbinder[i]);
				  };
				  i+=1;
				  vit=vit->naechstes(pit);
				 }while(vit!=pit->vertex());
				}while(mesh->naechstes(pit));
};
void _card::updatemesh(){
				//neigung berechnen
				meshchanged=false;
				hvvvx=vx;
				hvvvy=vy;
				if(pile) pile->pickslopeplane(this,hvvvx,hvvvy);
				hvn=hvvvx;
				hvn%=hvvvy;
				hvn.normalisieren();
				_tg d=hvnold.abstandabstand(hvn);
				_tg dvx=hvvvxold.abstandabstand(hvvvx);
				_tg dvy=hvvvyold.abstandabstand(hvvvy);
				if((fabs(rotationold-rotation)>0.00001)||(d>0.00001)||(dvx>0.00001)||(dvy>0.00001)){//nearzero
				 meshchanged=true;
                 _tg a,b;
                 _tg sinw,cosw;
                 sinw=sin(_ph*rotation);
                 cosw=cos(_ph*rotation);
                 a=sinw;
                 b=1-cosw;
                 rotmatrix[0][0]=cosw+b*hvn.x()*hvn.x();
                 rotmatrix[1][0]=     b*hvn.x()*hvn.y()+a*+hvn.z();
                 rotmatrix[2][0]=     b*hvn.x()*hvn.z()+a*-hvn.y();
                 rotmatrix[0][1]=     b*hvn.y()*hvn.x()+a*-hvn.z();
                 rotmatrix[1][1]=cosw+b*hvn.y()*hvn.y();
                 rotmatrix[2][1]=     b*hvn.y()*hvn.z()+a*+hvn.x();
                 rotmatrix[0][2]=     b*hvn.z()*hvn.x()+a*+hvn.y();
                 rotmatrix[1][2]=     b*hvn.z()*hvn.y()+a*-hvn.x();
                 rotmatrix[2][2]=cosw+b*hvn.z()*hvn.z();
			     hvrvx.x(rotmatrix[0][0]*hvvvx.x()+rotmatrix[1][0]*hvvvx.y()+rotmatrix[2][0]*hvvvx.z());
			     hvrvx.y(rotmatrix[0][1]*hvvvx.x()+rotmatrix[1][1]*hvvvx.y()+rotmatrix[2][1]*hvvvx.z());
			     hvrvx.z(rotmatrix[0][2]*hvvvx.x()+rotmatrix[1][2]*hvvvx.y()+rotmatrix[2][2]*hvvvx.z());
			     hvrvy.x(rotmatrix[0][0]*hvvvy.x()+rotmatrix[1][0]*hvvvy.y()+rotmatrix[2][0]*hvvvy.z());
			     hvrvy.y(rotmatrix[0][1]*hvvvy.x()+rotmatrix[1][1]*hvvvy.y()+rotmatrix[2][1]*hvvvy.z());
			     hvrvy.z(rotmatrix[0][2]*hvvvy.x()+rotmatrix[1][2]*hvvvy.y()+rotmatrix[2][2]*hvvvy.z());
				};
				rotationold=rotation;
				hvnold=hvn;
				hvvvxold=hvvvx;
				hvvvyold=hvvvy;
				hvvvx=hvrvx;
				hvvvy=hvrvy;
				hvh=hvn;
				hvh%=hvvvx;
				hvvvy=hvh;
				hvvvx.normalisieren();
				hvvvx*=game->cardwidth;
				hvvvy.normalisieren();
				hvvvy*=game->cardheight;
				hvp=position;
				hvp.x(hvp.x()+shift.x());
				hvp.y(hvp.y()+shift.y());
				if(pile) pile->pickslopeposition(this,hvp);
				if(pile==0){
				 if(blowlink){
				  poly->markierung(1);
				 }else{
				  poly->markierung(2);
				 };
				}else{
				 bool neigungcheck=true;
				 _pilereserve*pr=dynamic_cast<_pilereserve*>(pile);
				 if(pr){
				  if(pr->arcmode) neigungcheck=false;
				 }else{
				  _pilebethoral*pb=dynamic_cast<_pilebethoral*>(pile);
				  if(pb){
				   neigungcheck=false;
				  };
				 };
				 if(neigungcheck){
				  if((picked)||(curving)||(neigungx<-0.01)||(inpreparation)) poly->markierung(1); else poly->markierung(0);
				 }else{
				  if((picked)||(curving)||(inpreparation)) poly->markierung(1); else poly->markierung(0);
				 }; 
				};
				d=hvpold.abstandabstand(hvp);//+hvvvxold.abstandabstand(hvvvx)+hvvvyold.abstandabstand(hvvvy)
				if(d>0.000001){
				 meshchanged=true;
				};
				hvpold=hvp;
				if(meshchanged){
				 hvn*=-1;
				 hvh=hvvvx;
				 hvh+=hvvvy;
				 hvh*=-0.5;
				 hvh+=hvp;
				 vertex[0]->setzen(hvh);
				 hvh+=hvvvx;
				 vertex[1]->setzen(hvh);
				 hvh+=hvvvy;
				 vertex[2]->setzen(hvh);
				 hvh-=hvvvx;
				 vertex[3]->setzen(hvh);
				 poly->mitte(hvp);
				 poly->setzen(hvn);
				 meshchangedlasttime=solitaire->clock->system();
				};
				if(visible){
				 //hvn.mul(-1)
				 poly->zeichnenflaeche(true);
				 for(int vi=0;vi<4;vi++){ 
				  verbinder[vi]->farbe(game->solitaire->world->lichtambient());
				  //vertex[vi]->normale(hvn);
			     };
			     _licht<_tg,_to>*lit;
				 if(game->solitaire->world->anfang(lit))do{
				  for(int vi=0;vi<4;vi++){ 
				   verbinder[vi]->berechnenlicht(lit,poly);
				  };
				 }while(game->solitaire->world->naechstes(lit));
				 for(int vi=0;vi<4;vi++){ 
				  verbinder[vi]->aktualisierenlichtergebnis();
				  verbinder[vi]->opazitaet(opacity);
				 };
				}else{
				 poly->zeichnenflaeche(false);
				};
};
bool _card::inner(){
				_tg a;
				_tg b;
				_vektor3<_tg> vxh=vx;
				_vektor3<_tg> vyh=vy;
				_vektor3<_tg> mvn=game->solitaire->mousevector;
				_vektor3<_tg> e=*game->solitaire->cam-position;
				vxh*=0.5;
				vyh*=0.5;
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
bool _card::innerline(const _vektor3<_tg>&o,const _vektor3<_tg>&v,_vektor2<_tg>&para){
				_tg a;
				_tg b;
				_vektor3<_tg> vxh=vx;
				_vektor3<_tg> vyh=vy;
				_vektor3<_tg> mvn=v;
				_vektor3<_tg> e=o-position;
				vxh*=0.5;
				vyh*=0.5;
				mvn*=-1;
			
				_tg D=determinieren(vxh,vyh,mvn);
				if(fabs(D)>nahenull){
				 a=determinieren(e,vyh,mvn)/D;
				 if((a>=-1)&&(a<=1)){
				  b=determinieren(vxh,e,mvn)/D;
				  if((b>=-1)&&(b<=1)){ 
				   para.setzen(a,b);
				   return(true);
				  };
				 };
				};
				return(false);
}; 
bool _card::innercard(_card*c){
				_tg a;
				_tg b;
				_vektor3<_tg> vxh=vx;
				_vektor3<_tg> vyh=vy;
				_vektor3<_tg> mvn=c->position- *game->solitaire->cam;
				_vektor3<_tg> e=*game->solitaire->cam - position;
				vxh*=0.5;
				vyh*=0.5;
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
void _card::save(_datei*d){
				d->speichern("_card");
				d->speichern(speichername());
				d->speichern(visible);
				d->speichern(suit);
				d->speichern(number);
				d->speichern(position);
				d->speichern(vx);
				d->speichern(vy);
				d->speichern(rotation);
				d->speichern(rotationmust);
				d->speichern(rotationvector);
				d->speichern(rotationvelocity);
				d->speichern(rotationfriction);
				d->speichern(angle);
				d->speichern(anglemust);
				d->speichern(anglevector);
				d->speichern(anglevelocity);
				d->speichern(anglefriction);
				d->speichern(shift);
				d->speichern(shiftmust);
				d->speichern(shiftvector);
				d->speichern(shiftvelocity);
				d->speichern(shiftfriction);
				
				d->speichern(neigungx);
				d->speichern(opacity);
				d->speichern(opacityquant);
				speichernzeiger(d,parent[0]);
				speichernzeiger(d,parent[1]);
				speichernzeiger(d,child[0]);
				speichernzeiger(d,child[1]);
				speichernzeiger(d,labyrinth);
				d->speichern(labindex[0]);
				d->speichern(labindex[1]);
				speichernzeiger(d,sweetmatch);
				d->speichern(sweetindex[0]);
				d->speichern(sweetindex[1]);
				d->speichern(sweetblocked);
				speichernzeiger(d,array);
				d->speichern(arrayindex[0]);
				d->speichern(arrayindex[1]);
				game->solitaire->speichernkurve(d,curveposition);
				game->solitaire->speichernkurve(d,curvevx);
				game->solitaire->speichernkurve(d,curvevy);
				d->speichern(curvepositiont);
				d->speichern(curvevxt);
				d->speichern(curvevyt);
				d->speichern(curving);
				d->speichern(curvespeed);
				d->speichern(curvetime);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				d->speichern(inpreparation);
				d->speichern(picked);
				d->speichern(pickposition);
				d->speichern(pickvx);
				d->speichern(pickvy);
				d->speichern(pickending);
				d->speichern(backsided);
};
void _card::load(_datei*d){
				ladenbeginn();
				d->laden(speichername());	
				d->laden(visible);
				d->laden(suit);
				d->laden(number);
				d->laden(position);
				d->laden(vx);
				d->laden(vy);
				d->laden(rotation);
				d->laden(rotationmust);
				d->laden(rotationvector);
				d->laden(rotationvelocity);
				d->laden(rotationfriction);
				d->laden(angle);
				d->laden(anglemust);
				d->laden(anglevector);
				d->laden(anglevelocity);
				d->laden(anglefriction);
				d->laden(shift);
				d->laden(shiftmust);
				d->laden(shiftvector);
				d->laden(shiftvelocity);
				d->laden(shiftfriction);

				d->laden(neigungx);
				d->laden(opacity);
				d->laden(opacityquant);
				ladenzeiger(d);
				ladenzeiger(d);
				ladenzeiger(d);
				ladenzeiger(d);
				ladenzeiger(d);
				d->laden(labindex[0]);
				d->laden(labindex[1]);
				ladenzeiger(d);
				d->laden(sweetindex[0]);
				d->laden(sweetindex[1]);
				d->laden(sweetblocked);
				ladenzeiger(d);
				d->laden(arrayindex[0]);
				d->laden(arrayindex[1]);
				game->solitaire->ladenkurve(d,curveposition);
				game->solitaire->ladenkurve(d,curvevx);
				game->solitaire->ladenkurve(d,curvevy);
				d->laden(curvepositiont);
				d->laden(curvevxt);
				d->laden(curvevyt);
				d->laden(curving);
				d->laden(curvespeed);
				d->laden(curvetime);//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				d->laden(inpreparation);
				d->laden(picked);
				d->laden(pickposition);
				d->laden(pickvx);
				d->laden(pickvy);
				d->laden(pickending);
				d->laden(backsided);
};
void _card::assoziieren(){
				if(zeigergeladen()){
				 assoziierenzeiger(parent[0]);
				 assoziierenzeiger(parent[1]);
				 assoziierenzeiger(child[0]);
				 assoziierenzeiger(child[1]);
				 assoziierenzeiger(labyrinth);
				 assoziierenzeiger(sweetmatch);
				 assoziierenzeiger(array);
				 loeschenzeiger();
				};
				mesh->anfang(poly);
				poly->texturfront(game->solitaire->cardsetmanager->texturfront[suit+number*4]);//vorher : solitaire->tcard[suit+number*4]
				poly->texturrueck(game->solitaire->cardsetmanager->texturback);//vorher : solitaire->tcardback[solitaire->cardtexturebackindex]
			    updatemesh();
			 	clearshadow();
				createshadow();
				updateshadow();
};
