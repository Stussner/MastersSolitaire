'Project : Solitaire
'Modul : gamepile
'date of create : 01.11.2007
'date of change : 01.11.2007

'******************************************************************************************************************
'										P I L E
'******************************************************************************************************************
Type _pile Extends _storeable
	Field game:_game=Null
	Field gamelink:TLink=Null
	Field cardlist:TList=Null
	Field position:_vector3=Null'its the postion of the last card in list
	Field positionfirst:_vector3=Null'position of the first element (real)
	Field positionfirstunstretched:_vector3=Null'position of the first card (unstretched)
	
	Field camerastretch=True
	Field stretchfactor#=1'ist
	Field stretch#=1'soll
	Field stretchvector#=0
	Field stretchhaerte#=0.07
	Field stretchfriction#=0.89
	
	Field maximumlength#=10
	
	Field radiusx#=10
	Field radiusy#=9
	Field anglestep#=8
	Field mesh:_mesh=Null
	Field meshsuit:_mesh=Null
	Field meshnumber:_mesh=Null
	Field polygon:_polygon=Null
	Field polygonsuit:_polygon=Null
	Field polygonnumber:_polygon=Null
	Field vertex:_vertex[4]
	Field vertexsuit:_vertex[4]
	Field vertexnumber:_vertex[4]
	Field vector:_vector3=Null
	Field nopickifcardcurving=True
	Field discardcount=False
	
	'Field localrule=False
	
	
	Field giverestriction=False
	Field giverestrictionfreecell=False
	Field givesamesuit=False
	Field giveothersuit=False
	Field givealteratecolor=False
	Field givedescending=False
	Field giveascending=False
	Field givemaximal:Int=-1
	
	Field takerestriction=False
	Field takesamesuit=False
	Field takeothersuit=False
	Field takealteratecolor=False
	Field takeascending=False
	Field takedescending=False	
	Field takeboth=False
	Field takewrapped=False
	Field takemirrored=False
	Field takeemptysuit:Int=-1
	Field takeemptynumber:Int=-1
	Field takeemptymaximal:Int=-1
	Field takeemptyrestriction=False
	Field takemaximal:Int=-1
	
	Field tableaufill=False
	Field redealvalue=-1
	Field redealcount=0	
	
	Rem
	'foundation rule states
	Field foundationdescending=False
	Field foundationascending=False
	Field foundationboth=False
	Field foundationbothwrapped=False
	Field foundationmirrored=False
	Field foundationpickrestriction=False
	'freecell rule states
	Field freecellpickrestriction=False	
	EndRem
	Field showdescription=True
	Field drawownshadow=False
	Field shadowlist:TList=Null	
	Field name$=""
	Field description0$=""
	Field description1$=""
	
	Field flag=0
	
	Field showz#=0
	
	Method New()
				shadowlist=CreateList()
				cardlist=CreateList()
				position=New _vector3
				positionfirst=New _vector3
				positionfirstunstretched=New _vector3
				vector=New _vector3
				vector.set(0,-1,0)
				name=strpile
				EndMethod
	Method Delete()
				EndMethod		
	Method initpile(g:_game,px#,py#)				
				game=g
				gamelink=game.pilelist.addlast(Self)
				Local vx#=game.cardwidth
				Local vy#=game.cardheight
				position.set(px,py,0)
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=game.solitaire.tempty
				gg.position.copy(position)
				gg.position.x:-vx/2
				gg.position.y:-vy/2
				gg.color.set(1,1,1,1)
				gg.vx.set(vx,0,0)
				gg.vy.set(0,vy,0)
				gg.tvy[0].set(0,-1)

				gg.resolution[0]=1
				gg.resolution[1]=1
				mesh=gg.Create()
				mesh.dynamicvertexlight=True
				mesh.visible(True)
				mesh.blend(True)
				mesh.blendadditive(False)
				mesh.world=game.solitaire.world
				mesh.update()
				
				'mesh.reversevertex()
				Local ss#=1.4*vy/Float(6)
				gg=New _geometrygrid
				gg.texture[0,0]=game.solitaire.tsymbolsuit[0]
				gg.position.copy(position)
				gg.position.x:-ss/2
				gg.position.y:-ss/2 + ss
				gg.color.set(1,1,1,1)
				gg.vx.set(ss,0,0)
				gg.vy.set(0,ss,0)
				gg.tvy[0].set(0,-1)
				gg.resolution[0]=1
				gg.resolution[1]=1
				meshsuit=gg.Create()
				meshsuit.dynamicvertexlight=True
				meshsuit.visible(True)
				meshsuit.blend(True)
				meshsuit.blendadditive(False)
				meshsuit.world=game.solitaire.world
				meshsuit.update()

				gg=New _geometrygrid
				gg.texture[0,0]=game.solitaire.tsymbolnumber[0]
				gg.position.copy(position)
				gg.position.x:-ss/2
				gg.position.y:-ss/2 - ss
				gg.color.set(1,1,1,1)
				gg.vx.set(ss,0,0)
				gg.vy.set(0,ss,0)
				gg.tvy[0].set(0,-1)
				gg.resolution[0]=1
				gg.resolution[1]=1
				meshnumber=gg.Create()
				meshnumber.dynamicvertexlight=True
				meshnumber.visible(True)
				meshnumber.blend(True)
				meshnumber.blendadditive(False)
				meshnumber.world=game.solitaire.world
				meshnumber.update()

				updatevertexarray()
				EndMethod
	Method opacity(o#)
				If mesh mesh.vertexalpha(o)
				If meshnumber meshnumber.vertexalpha(o)
				If meshsuit meshsuit.vertexalpha(o)
				EndMethod				
	Method clear()
				Print "pile clear() call"
				clearshadow()
				Local ll:TList=CreateList()
				For Local c:_card=EachIn cardlist
				 ll.addlast(c)
				Next				
				For Local c:_card=EachIn ll
				 c.clear()
				Next
				cardlist.clear()
				ll.clear()'not neccessary
				If mesh mesh.clear()
				If meshsuit meshsuit.clear()
				If meshnumber meshnumber.clear()
				clearstoreablelink()
				EndMethod				
	Method clearshadow()
				For Local sit:_shadow=EachIn shadowlist
				 sit.clear()
				 'RemoveLink sit.link
				Next
				shadowlist.clear()
				EndMethod	
	Method createshadow()
				EndMethod
	Method createshadowstripe()
				clearshadow()
				For Local lit:_light=EachIn game.solitaire.world.lightlist
				 If lit.noshadow=False
				  Local sit:_shadowstripe=New _shadowstripe
				  Local l:TList=game.solitaire.shadowpreviewlist
				  If game.preview=False l=game.solitaire.shadowlist
 				  sit.init(game.solitaire.gra,game.solitaire.tshadowblock,l,lit)
 			      shadowlist.addlast(sit)
  				 EndIf
				Next
				'updateshadowstripe()
				EndMethod	
	Method createshadowblock()
				clearshadow()
				For Local lit:_light=EachIn game.solitaire.world.lightlist
				 If lit.noshadow=False
				  Local sit:_shadowblock=New _shadowblock
				  Local l:TList=game.solitaire.shadowpreviewlist
				  If game.preview=False l=game.solitaire.shadowlist
 				  sit.init(game.solitaire.gra,game.solitaire.tshadowblock,l,lit)
 			      shadowlist.addlast(sit)
  				 EndIf
				Next
				'updateshadowblock()
				EndMethod	
	Method updateshadowstripe()
	 			'Print "updateshadowstripe0"
				updateshadowblock()
	 			'Print "updateshadowstripe1"
				EndMethod
	Method updateshadowblock()
	   			'Print "updateshadowblock0"

				'Print "game : updateshadowblock "
				'Print "cardlist.count()="+cardlist.count()
				Local it:TLink=cardlist.firstlink()
				Local cf:_card=Null
				Local cl:_card=Null
				If it
				 Repeat
				  Local cit:_card=_card(it.value())
				  If cit.curving=False And cit.picked=False cf=cit
				  it=it.nextlink()
				 Until cf Or it=Null
				EndIf
				If cf=Null'keine first karte in Ruhe gefunden
				 For Local sit:_shadow=EachIn shadowlist
				  sit.valid=False
				 Next
				 Return;
				EndIf
				cl=cf
				If it'letzte Karte setzen
				 Repeat
				  cl=_card(it.value())
				  it=it.nextlink()
				 Until(it=Null)
				EndIf
				
				'Print "usb02"

				
								
				Local h:_vector3=New _vector3;
				Local j:_vector3=New _vector3;
				Local pf:_polygon=_polygon(cf.mesh.polygonlist.firstlink().value());
				Local pl:_polygon=_polygon(cl.mesh.polygonlist.firstlink().value());
				Local vf:_vertex[4];
				Local vl:_vertex[4];
				Local sf:_vector3[4];
				Local sl:_vector3[4];
				
				
				
				Local p:_vector3[4];
			 	For Local i=0 To 3
				 p[i]=New _Vector3;
				Next				
				Local vi=0;
				For Local vit:_vertex=EachIn pf.vertexlist
				 vf[vi]=vit;
				 vi=vi+1;
				Next
				'Print "usb03"
				
				'------------------------------------------ cl = cf Fall abfangen -----------------------------------------
				If cl=cf

				 For Local sit:_shadow=EachIn shadowlist
				  sit.valid=True;
				  project(vf[0],sit,p[0]);
				  project(vf[1],sit,p[1]);
				  project(vf[2],sit,p[2]);
				  project(vf[3],sit,p[3]);
				  it=_polygon(sit.mesh.polygonlist.firstlink().value()).vertexlist.firstlink();
				  _vertex(it.value()).set(p[0]);it=it.nextlink();
				  _vertex(it.value()).set(p[1]);it=it.nextlink();
				  _vertex(it.value()).set(p[2]);it=it.nextlink();
				  _vertex(it.value()).set(p[2]);it=it.nextlink();
				  _vertex(it.value()).set(p[2]);it=it.nextlink();
				  _vertex(it.value()).set(p[3]);it=it.nextlink();
			  	  _polygon(sit.mesh.polygonlist.firstlink().value()).update();			 
				 Next
				 Return;
				EndIf
				Rem
				'---------------------------------------- normalen bestimmen ---------------------------------------------
				Local nf:_vector3=New _vector3
				Local nl:_vector3=New _vector3
				nf.copy(pf.normal)
				nl.copy(pl.normal)
				If nf.z>0 nf.mul(-1)
				If nl.z<0 nl.mul(-1)
				'---------------------------------------- first - last zuordnung -----------------------------------------
				Local tm:_vector3=New _vector3
				tm.copy(pl.middle);
				tm.sub(pf.middle);
				Local vm:_vector3=New _vector3
				vm.copy(pl.middle);
				vm.add(pf.middle);
				vm.mul(0.5);
				For Local i=0 To 3
				 sf[i]=New _vector3
				 sl[i]=New _vector3
				 vf[i].get(sf[i]);
				 h.copy(sf[i])
				 h.add(tm);
				 vl[i]=Null;
				 Local dm#=100000;
				 For Local vit:_Vertex=EachIn pl.vertexlist
				  vit.get(j);
				  j.sub(h);
				  Local d#=j.length();
				  If d<dm
				   vl[i]=vit;
				   vl[i].get(sl[i]);
				   dm=d;
				  EndIf
				 Next
				Next
				'**************** DEBBUG ****************
				'For Local ii=0 To 3 
				' Print "--- sf [ii] ---- "+ sf[ii].x+ ", "+sf[ii].y+", "+sf[ii].z
				' Print "--- sl [ii] ---- "+ sl[ii].x+ ", "+sl[ii].y+", "+sl[ii].z
				'Next
				'****************************************
				'Print "usb04"
				'---------------------------------------- seitliche normalen bestimmen ---------------------------------
				Local nsf:_vector3[4];
				Local kmf:_vector3[4];
				Local kmm:_vector3[4];
				Local kml:_vector3[4];
				Local k;
				For Local i=0 To 3 
				 k=i+1;
				 If k>3 k=0;
				 nsf[i]=New _vector3;
				 kmf[i]=New _vector3;
				 kmm[i]=New _vector3;
				 kml[i]=New _vector3;
				
				 kmf[i].copy(sf[k]);
				 kmf[i].sub(sf[i]);'=kante f
				'Print "--- kmf[i] ---- "+ kmf[i].x+ ", "+kmf[i].y+", "+kmf[i].z


				 kmm[i].copy(sl[i]);
				 kmm[i].sub(sf[i]);'=kante m
				'Print "--- kmm[i] ---- "+ kmm[i].x+ ", "+kmm[i].y+", "+kmm[i].z

				
				 kml[i].copy(sl[k]);
				 kml[i].sub(sl[i]);
				 kml[i].mul(0.5);
				 kml[i].add(sl[i]);
				
				 nsf[i].copy(kmf[i]);
				 nsf[i].crossproduct(kmm[i]);
				 nsf[i].norm();
				
				 'inversion prüfen
				 h.copy(sf[i])
				 h.sub(vm)
				 Local ss#=h.product(nsf[i])
				 If ss<0 nsf[i].mul(-1)
				
				 kmf[i].mul(0.5);
				 kmf[i].add(sf[i]);
				
				 kmm[i].mul(0.5);
				 kmm[i].add(sf[i]);

				Next
				'************* DEBUG *************
				'Print "--- nf ---- "+ nf.x+ ", "+nf.y+", "+nf.z
				'For Local ii=0 To 3 
				' Print "--- nsf [ii] ---- "+ nsf[ii].x+ ", "+nsf[ii].y+", "+nsf[ii].z
				'Next
				'*********************************
				'Print "usb05"

				'---------------------------------------- schattenfläche generieren -----------------------------------------
				For Local sit:_shadow=EachIn shadowlist
				
				 Local silf[4]
				 Local sill[4]
				 For Local i=0 To 3 
				  silf[i]=silhouette(sit,kmf[i],nf,nsf[i]);
				  sill[i]=silhouette(sit,kml[i],nl,nsf[i]);
				 Next
				 
				 sit.valid=True
				 it=_polygon(sit.mesh.polygonlist.firstlink().value()).vertexlist.firstlink()
				 
				 If ((silf[0] And silf[1] And silf[2] And silf[3]) Or (silf[0]=False And silf[1]=False And silf[2]=False And silf[3]=False)) Or ((sill[0] And sill[1] And sill[2] And sill[3]) Or (sill[0]=False And sill[1]=False And sill[2]=False And sill[3]=False))
				  'fall abfangen : alle silf gesetzt, d.h. nur vertex des first projizieren und den schatten
				  'daran setzen 
				  project(vf[0],sit,p[0]);
				  project(vf[1],sit,p[1]);
				  project(vf[2],sit,p[2]);
				  project(vf[3],sit,p[3]);
				  _vertex(it.value()).set(p[0]);it=it.nextlink()
				  _vertex(it.value()).set(p[1]);it=it.nextlink()
				  _vertex(it.value()).set(p[2]);it=it.nextlink()
				  _vertex(it.value()).set(p[2]);it=it.nextlink()
				  _vertex(it.value()).set(p[2]);it=it.nextlink()
				  _vertex(it.value()).set(p[3]);it=it.nextlink()
			  	  _polygon(sit.mesh.polygonlist.firstlink().value()).update()				 
			 	 Else
				  'Print "usb06"
			
			      Local kn=0
			  	  Repeat
			       If silf[kn]=True 
			        kn=kn+1;
			  		If kn>3 kn=0
				   EndIf
				   'Print "e0"
			   	  Until silf[kn]=False
			      Local ks=kn
				  'Print "usb07"
			
			 	  Repeat
			       If silf[ks]=False 
					ks=ks+1
					If ks>3 ks=0
				   EndIf
				   'Print "e1"+ks+"  "+silf[ks]
			   	  Until silf[ks]=True
				 ' Print "usb08"
			
			      '-------------------------ks bezeichnet die erste silhouetten kante
				  kn=ks
				  project(vf[kn],sit,p[kn]);
				  _vertex(it.value()).set(p[kn]);it=it.nextlink()
			 	  Local knn
			  	  Repeat
			   	   If silf[kn]
				    If it
			 	     knn=kn+1
			 	     If knn>3 knn=0
				     project(vf[knn],sit,p[knn]);
				     _vertex(it.value()).set(p[knn]);
				     it=it.nextlink()
				    EndIf
			 	   EndIf
			       'Print "e2"
			 	   kn=kn+1
			 	   If kn>3 kn=0
				  Until silf[kn]=False
				 ' Print "usb09"
				
				  '------------------------übergang zum last polygon
				  If sill[kn]=False 'error
				   'Print "error : silhouette"
				   it=_polygon(sit.mesh.polygonlist.firstlink().value()).vertexlist.firstlink()
				   project(vf[0],sit,p[0]);
				   project(vf[1],sit,p[1]);
				   project(vf[2],sit,p[2]);
				   project(vf[3],sit,p[3]);
				   _vertex(it.value()).set(p[0]);it=it.nextlink()
				   _vertex(it.value()).set(p[1]);it=it.nextlink()
				   _vertex(it.value()).set(p[2]);it=it.nextlink()
				   _vertex(it.value()).set(p[2]);it=it.nextlink()
				   _vertex(it.value()).set(p[2]);it=it.nextlink()
				   _vertex(it.value()).set(p[3]);it=it.nextlink()
			  	   _polygon(sit.mesh.polygonlist.firstlink().value()).update()				 
				
				  Else
				   If it
				    project(vl[kn],sit,p[kn]);'ersten vertex der last kante einhängen
				    _vertex(it.value()).set(p[kn]);
					it=it.nextlink();
				   EndIf
				
				   Repeat
			   	    If sill[kn]
				     If it
			 	      knn=kn+1
			 	      If knn>3 knn=0
				      project(vl[knn],sit,p[knn]);
				      _vertex(it.value()).set(p[knn]);
				      it=it.nextlink()
				     EndIf
			 	    EndIf
			 	    kn=kn+1
			 	    If kn>3 kn=0
				   Until sill[kn]=False
				  ' Print "usb10"
				
				  EndIf
				  If it=Null'alles ok
				   _polygon(sit.mesh.polygonlist.firstlink().value()).update()				 
				  Else
				   it=_polygon(sit.mesh.polygonlist.firstlink().value()).vertexlist.firstlink()
				   project(vf[0],sit,p[0]);
				   project(vf[1],sit,p[1]);
				   project(vf[2],sit,p[2]);
				   project(vf[3],sit,p[3]);
				   _vertex(it.value()).set(p[0]);it=it.nextlink()
				   _vertex(it.value()).set(p[1]);it=it.nextlink()
				   _vertex(it.value()).set(p[2]);it=it.nextlink()
				   _vertex(it.value()).set(p[2]);it=it.nextlink()
				   _vertex(it.value()).set(p[2]);it=it.nextlink()
				   _vertex(it.value()).set(p[3]);it=it.nextlink()
			  	   _polygon(sit.mesh.polygonlist.firstlink().value()).update()				 

				  EndIf
				 EndIf
				Next
				EndRem
	   			'Print "updateshadowblock1"


				
				'Local vf:_vertex[4]'[0] ist der naheste, [3] der entfernteste
				'Local vl:_vertex[4]
				
				
				For Local sit:_shadow=EachIn shadowlist
				 sit.valid=True
				 'nähesten vertex der ersten Kartte bestimmen
				 Local dn#=10000':_vector3=New _vector3
				 Local df#=-1
				 vf[0]=Null
				 vf[3]=Null
				 For Local vit:_vertex=EachIn pf.vertexlist
				  vit.get(h)
				  h.sub(sit.light)
				  Local dh#=h.length()
				  If dn>dh 
				   vf[0]=vit
				   dn=dh
				  EndIf
				  If df<dh
				   vf[3]=vit
				   df=dh
				  EndIf
				 Next
				
				 'entferntesten Vertex in der letzten Karte holen
				 dn=10000
				 df=-1
				 vl[0]=Null
				 vl[3]=Null
				 For Local vit:_vertex=EachIn pl.vertexlist
				  vit.get(h)
				  h.sub(sit.light)
				  Local dh#=h.length()
				  If dn>dh 
				   vl[0]=vit
				   dn=dh
				  EndIf
				  If df<dh 
				   vl[3]=vit
				   df=dh
				  EndIf
				 Next
				
				 'die seitlichen vertex der ersten Karte bestimmen
				 For Local vit:_vertex=EachIn pf.vertexlist
				  If vit<>vf[0] And vit<>vf[3] 
				   If vf[1]=Null 
				    vf[1]=vit 
				   ElseIf vf[2]=Null
				    vf[2]=vit
				   EndIf
				  EndIf
				 Next
				 
				 'die seitlichen vertex der letzten Karte bestimmen
				 For Local vit:_vertex=EachIn pl.vertexlist
				  If vit<>vl[0] And vit<>vl[3] 
				   If vl[1]=Null 
				    vl[1]=vit 
				   ElseIf vl[2]=Null
				    vl[2]=vit
				   EndIf
				  EndIf
				 Next
				 'projektion durchführen und mesh aktualisieren
				 Local of:_vector3[3]
				 Local ol:_vector3[3]
			 	 For Local i=0 To 2 
				  of[i]=New _Vector3
				  ol[i]=New _Vector3
				 Next
				 project(vf[3],sit,of[0]);
				 project(vf[1],sit,of[1]);
				 project(vf[2],sit,of[2]);
				 project(vl[0],sit,ol[0]);
				 project(vl[1],sit,ol[1]);
				 project(vl[2],sit,ol[2]);
				
				 If sit.valid
				  Local nf:_vector3=New _vector3
				  Local nl:_vector3=New _vector3
				  Local sn#=0
				  it=_polygon(sit.mesh.polygonlist.firstlink().value()).vertexlist.firstlink()
				  
				  h.copy(of[1])
				  h.sub(of[0])
				  nf.copy(of[2])
				  nf.sub(of[0])
				  nf.crossproduct(h)
				
				  h.copy(ol[1])
				  h.sub(ol[0])
				  nl.copy(ol[2])
				  nl.sub(ol[0])
				  nl.crossproduct(h)
				  
				  sn=nl.product(nf)
				  If sn<0
				   _vertex(it.value()).set(of[1]);it=it.nextlink()
				   _vertex(it.value()).set(of[0]);it=it.nextlink()
				   _vertex(it.value()).set(of[2]);it=it.nextlink()
				   _vertex(it.value()).set(ol[2]);it=it.nextlink()
				   _vertex(it.value()).set(ol[0]);it=it.nextlink()
				   _vertex(it.value()).set(ol[1]);it=it.nextlink()
				  Else
				   _vertex(it.value()).set(of[1]);it=it.nextlink()
				   _vertex(it.value()).set(of[0]);it=it.nextlink()
				   _vertex(it.value()).set(of[2]);it=it.nextlink()
				   _vertex(it.value()).set(ol[1]);it=it.nextlink()
				   _vertex(it.value()).set(ol[0]);it=it.nextlink()
				   _vertex(it.value()).set(ol[2]);it=it.nextlink()
				  EndIf
				  _polygon(sit.mesh.polygonlist.firstlink().value()).update()
				 EndIf
				
				Next
				
				EndMethod
	Method silhouette:Int(sit:_shadow,km:_vector3,n0:_vector3,n1:_vector3)
			  	Local h:_vector3=New _vector3
				h.copy(km)
				h.sub(sit.light)
				Local s0#=h.product(n0)
				Local s1#=h.product(n1)
				If (s0<=0 And s1>0) Or (s0>0 And s1<=0) Return(True) Else Return(False)
				EndMethod
	Method project(v:_vertex,sit:_shadow,p:_vector3)
				Local h:_vector3=New _vector3
				v.get(h)
				h.sub(sit.light)
				Local gamma#=-sit.light.z/h.z
				If gamma>0
				 p.set(sit.light.x+h.x*gamma,sit.light.y+h.y*gamma,0)
				Else
				 sit.valid=False
				EndIf 
				EndMethod
	Method updateshadow()
				EndMethod
	Method updatevertexarray()
				Local pit:_polygon
				Local vit:_vertex
				Local i=0
				For pit=EachIn mesh.polygonlist
				 polygon=pit
				 For vit=EachIn pit.vertexlist
				  If i<4 vertex[i]=vit
				  i:+1
				 Next
				Next
				i=0
				For pit=EachIn meshsuit.polygonlist
				 polygonsuit=pit
				 For vit=EachIn pit.vertexlist
				  If i<4 vertexsuit[i]=vit
				  i:+1
				 Next
				Next
				i=0
				For pit=EachIn meshnumber.polygonlist
				 polygonnumber=pit
				 For vit=EachIn pit.vertexlist
				  If i<4 vertexnumber[i]=vit
				  i:+1
				 Next
				Next
				EndMethod					
	Method updatemesh()
				'function updates the vertex coordinates of the card mesh
				'along the plane vectors position, vx,vy
				Local pit:_polygon
				Local vit:_vertex
				Local i=0
				Local vx#=game.cardwidth
				Local vy#=game.cardheight
				Local ss#=1.4*vy/Float(6)
				Local h:_vector3=New _vector3
				Local k:_vector3=New _vector3
				Local p:_vector3=New _vector3
				Local vvx:_vector3=New _vector3
				Local vvy:_vector3=New _vector3
				vvx.set(vx,0,0)
				vvy.set(0,vy,0)
				'Print "um"
				'i=0
				'For pit=EachIn mesh.polygonlist
				' For vit=EachIn pit.vertexlist
				'  If i=0 
				   h.copy(vvx)
				   h.mul(-0.5)
				   k.copy(vvy)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(position)
				   vertex[0].set(h)
				'  ElseIf i=1
				 '  h.copy(vvx)
				  ' h.mul(+0.5)
				  ' k.copy(vvy)
				  ' k.mul(-0.5)
				  ' h.add(k)
				  ' h.add(position)
				   h.add(vvx)
				   vertex[1].set(h)
				 ' ElseIf i=2
				   'h.copy(vvx)
				   'h.mul(+0.5)
				   'k.copy(vvy)
				   'k.mul(+0.5)
				   'h.add(k)
				   'h.add(position)
				   h.add(vvy)
				   vertex[2].set(h)
				 ' ElseIf i=3
				   'h.copy(vvx)
				   'h.mul(-0.5)
				   'k.copy(vvy)
				   'k.mul(+0.5)
				   'h.add(k)
				   'h.add(position)
				   h.sub(vvx)
				   vertex[3].set(h)
				 ' EndIf 
				 ' i:+1
				 'Next
				' pit.update()
				'Next
				'mesh.update()
				polygon.middle.copy(position)
				'--------------------------------------
				p.copy(position)
				p.y:- ss				
				vvx.set(ss,0,0)
				vvy.set(0,ss,0)
				h.copy(vvx)
				h.mul(-0.5)
				k.copy(vvy)
				k.mul(-0.5)
				h.add(k)
				h.add(p)
				vertexsuit[0].set(h)
		   		h.add(vvx)
				vertexsuit[1].set(h)
				h.add(vvy)
				vertexsuit[2].set(h)
				h.sub(vvx)
				vertexsuit[3].set(h)
				polygonsuit.middle.copy(p)
				'meshsuit.update()
				'--------------------------------------
				'p.copy(position)
				'p.x:-ss/2
				p.y:+2*ss				
				'vvx.set(ss,0,0)
				'vvy.set(0,ss,0)
				'i=0
				'For pit=EachIn meshnumber.polygonlist
				' For vit=EachIn pit.vertexlist
				 ' If i=0 
				   h.copy(vvx)
				   h.mul(-0.5)
				   k.copy(vvy)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(p)
				   vertexnumber[0].set(h)
				 ' ElseIf i=1
				 '  h.copy(vvx)
				 '  h.mul(+0.5)
				 '  k.copy(vvy)
				 '  k.mul(-0.5)
				 '  h.add(k)
				 '  h.add(p)
				   h.add(vvx)
				   vertexnumber[1].set(h)
				 ' ElseIf i=2
				 '  h.copy(vvx)
				 '  h.mul(+0.5)
				 '  k.copy(vvy)
				 '  k.mul(+0.5)
				 '  h.add(k)
				 '  h.add(p)
				   h.add(vvy)
				   vertexnumber[2].set(h)
				 ' ElseIf i=3
				 '  h.copy(vvx)
				 '  h.mul(-0.5)
				 '  k.copy(vvy)
				 '  k.mul(+0.5)
				 '  h.add(k)
				 '  h.add(p)
				   h.sub(vvx)
				   vertexnumber[3].set(h)
				  'EndIf 
				 ' i:+1
				' Next
				' pit.update()
				'Next
				polygonnumber.middle.copy(p)
				'meshnumber.update()				
				EndMethod				
	Method compare:Int(o:Object)
				If game.menu=False
				 Local c:_pile=_pile(o)
				 If c
				  Local x#=position.x
				  Local y#=position.y
				  Local z#=position.z
				  Local ox#=c.position.x
				  Local oy#=c.position.y
				  Local oz#=c.position.z
				  Local c#=z+Sqr(x*x+y*y)*0.000005
				  Local co#=oz+Sqr(ox*ox+oy*oy)*0.000005
	 			   If(c<co)
	               Return(True)
				  EndIf
				 EndIf
				 Return(False)
				Else
				 Local c:_pile=_pile(o)
				 If c
				  If position.y > c.position.y Return(True)
				  'If position.y*100+position.x < c.position.y*100+c.position.x Return(True)
				  Return(False)
				 EndIf
				EndIf
				EndMethod	
	Method samerule:Int(p:_pile)
				If giverestriction<>p.giverestriction Return(False)
				If giverestrictionfreecell<>p.giverestrictionfreecell Return(False)
				If givesamesuit<>P.givesamesuit Return(False)
				If giveothersuit<>p.giveothersuit Return(False)
				If givealteratecolor<>p.givealteratecolor Return(False)
				If givedescending<>p.givedescending Return(False)
				If giveascending<>p.giveascending Return(False)
				If givemaximal<>p.givemaximal Return(False)
				If takerestriction<>p.takerestriction Return(False)
				If takesamesuit<>p.takesamesuit Return(False)
				If takeothersuit<>p.takeothersuit Return(False)
				If takealteratecolor<>p.takealteratecolor Return(False)
				If takeascending<>p.takeascending Return(False)
				If takedescending<>p.takedescending Return(False)
				If takeboth<>p.takeboth Return(False)
				If takewrapped<>p.takewrapped Return(False)
				If takemirrored<>p.takemirrored Return(False)
				'If takeemptysuit<>p.takeemptysuit Return(False)
				'If takeemptynumber<>p.takeemptynumber Return(False)
				If takeemptymaximal<>p.takeemptymaximal Return(False)
				If takeemptyrestriction<>p.takeemptyrestriction Return(False)
				If takemaximal<>p.takemaximal Return(False)
				If tableaufill<>p.tableaufill Return(False)
				If redealvalue<>p.redealvalue Return(False)
				Return(True)
				EndMethod									
	Method cardcount:Int()
				Return(cardlist.count())
				EndMethod
							
	Method turncard(clock:_clock,index)
				Local i=0
				Local cit:_card=Null
				For cit=EachIn cardlist
				 If i=index
				  cit.turn(clock)
				 EndIf
				 i:+1
				Next
				EndMethod	
	Method turn(c:_card,clock:_clock,spd#,useundo)				
				Local v:_vector3=New _vector3
				c.deinsertpile()
			    v.copy(dropposition())
				c.insertpile(Self,True)
				'nun auf die dropposition v den differnzvektor mit der next karte bilden
				'wenn es keiune nächste karte gibt dann pileposition nehmen
				c.curvespeed=spd
				c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-10,0,0,10)
			 	c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, -c.vx.x,-c.vx.y,-c.vx.z, 0,0,10 ,0,0,-10)  
			 	c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z-game.solitaire.cardslope, 0,0,0 ,0,0,0)  
			     'undo record move
			    If useundo
				 Local m:_animationundo=game.createundo(spd,1)
				 m.use(c,Self,True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy)
				EndIf
				If game.preview=False playsoundstretched(game.solitaire.sturn,0.7,0.95,1.05)
				'end undo record move
				c.startcurve(clock)	
				EndMethod
	Method canturn:Int(c:_card)
				If(c.pilelink.prevlink()<>Null) Return(False)	
				Return(True)
				EndMethod				
	Method card:_card(index)
				Local i=0
				Local cit:_card=Null
				For cit=EachIn cardlist
				 If i=index
				  Return(cit)
				 EndIf
				 i:+1
				Next
				Return(Null)
				EndMethod	
	Method nocardcurving:Int()				
	 			'if no card are moving (curving) then true
				For Local c:_card=EachIn cardlist
				 If c.curving Return(False)
				Next
				Return(True)
				EndMethod	
	Method cardcurving:Int()
				Return(Not(nocardcurving()))
				EndMethod					
	Method drawshadow(gra:_graphics,cam:_camera)
				If drawownshadow
				 For Local sit:_shadow=EachIn shadowlist
				  sit.draw(gra,cam)
				 Next
				EndIf
				EndMethod						
	Method draw(gra:_graphics,cam:_camera)
				mesh.clearvertexlight()
	    		For Local lit:_light=EachIn game.solitaire.world.lightlist
				 mesh.determinevertexlight(lit)
				Next
				mesh.draw(gra,cam)
				EndMethod
	Method show()
				showz=-10
				EndMethod				
	Method drawshow(gra:_graphics,cam:_camera)				
				If showz<0
				 position.z=showz
				 updatemesh()
				 Local v4:_vector4=New _vector4
				 v4.set(1,0.8,0.1,Abs(showz)/Float(10))
				 mesh.vertexcolor(v4)
				 mesh.draw(gra,cam)
				 showz:+0.5
				 If showz>0 showz=0
				 v4.set(1,1,1,1)
				 mesh.vertexcolor(v4)
				 position.z=showz
				 updatemesh()
				EndIf
				EndMethod
	Method updatecardmesh()
	 			'Local posy:_vector3=New _vector3
	 			'Local off:_vector3=New _vector3
				'off.set(0,-1,0)
				'posy.copy(position)
				For Local cit:_card=EachIn cardlist
				 cit.updatemesh()
				' posy.add(off)
				Next 
				EndMethod
	Method updatedescription()
				description0=""
				description1=""
				EndMethod				
	Method inner:Int(withcards=True)	
				Local a#
				Local b#
				Local vx#=game.cardwidth
				Local vy#=game.cardheight
				Local vxh:_vector3=New _vector3
				Local vyh:_vector3=New _vector3
				Local mvn:_vector3=New _vector3
				Local e:_vector3=New _vector3
				vxh.set(vx*0.5,0,0)
				vyh.set(0,vy*0.5,0)
				'Print vy
				mvn.copy(game.solitaire.mousevector)
				mvn.mul(-1)
				e.copy(game.solitaire.cam.position)
				e.sub(position)
				Local D#=determine3(vxh,vyh,mvn)
				If Abs(D)>nearzero
				 a=determine3(e,vyh,mvn)/D
				 If (a>=-1) And (a<=1)
				  b=determine3(vxh,e,mvn)/D
				  If (b>=-1) And (b<=1) Return(True)
				 EndIf
				EndIf
				If withcards
				 Local firstpicked:_card=Null
				 Local fit:TLink=game.picklist.firstlink()
				 If fit firstpicked=_card(fit.value())
				 If game.solitaire.pointandclick=False If firstpicked If innercard(firstpicked) Return(True)
				 For Local c:_card=EachIn cardlist
				  Local check=True
				  For Local cp:_card=EachIn game.picklist
				   If cp=c check=False
				  Next
				  If check 
				   If c.inner() Return(True)
				   If game.solitaire.pointandclick=False If firstpicked If c.innercard(firstpicked) Return(True)
				  EndIf
			 	 Next				
				EndIf
				Return(False)
				EndMethod	
	Method innercard:Int(c:_card)
				Local a#
				Local b#
				Local vx#=game.cardwidth
				Local vy#=game.cardheight
				Local vxh:_vector3=New _vector3
				Local vyh:_vector3=New _vector3
				Local mvn:_vector3=New _vector3
				Local e:_vector3=New _vector3
				vxh.set(vx*0.5,0,0)
				vyh.set(0,vy*0.5,0)
				mvn.copy(c.position)
				mvn.sub(game.solitaire.cam.position)
				mvn.norm()
				mvn.mul(-1)
				e.copy(game.solitaire.cam.position)
				e.sub(position)
				Local D#=determine3(vxh,vyh,mvn)
				If Abs(D)>nearzero
				 a=determine3(e,vyh,mvn)/D
				 If (a>=-1) And (a<=1)
				  b=determine3(vxh,e,mvn)/D
				  If (b>=-1) And (b<=1) Return(True)
				 EndIf
				EndIf
				EndMethod				
	Method takeruleset:Int()
				If takerestriction Return(True);
				If takesamesuit Return(True);
				If takeothersuit Return(True);
				If takealteratecolor Return(True);
				If takeascending Return(True);
				If takedescending Return(True);	
				If takeboth Return(True);
				If takewrapped Return(True);
				If takemirrored Return(True);
				Return(False);
				EndMethod				
	Method takeemptyruleset:Int()
				If takeemptyrestriction Return(True);
				If takeemptysuit<>-1 Return(True);
				If takeemptynumber<>-1 Return(True);
				If takeemptymaximal<>-1 Return(True);
				Return(False);
				EndMethod				
	Method giveruleset:Int()
				If giverestriction Return(True);
				If giverestrictionfreecell Return(True);
				If givesamesuit Return(True);
				If giveothersuit Return(True);
				If givealteratecolor Return(True);
				If givedescending Return(True);
				If giveascending Return(True);
				If givemaximal<>-1 Return(True);
				Return(False);
				EndMethod				
	Method pickslopeplane(c:_card,vvx:_vector3,vvy:_vector3)
				vvx.z:+c.neigungx*((c.position.x-game.solitaire.cam.position.x)/15)
				EndMethod
	Method pickslopeposition(c:_card,p:_vector3)
				p.z:+c.neigungx*0.8
				EndMethod
	Method pickslopeplanearc(c:_card,vvx:_vector3,vvy:_vector3)
				vvx.z:+c.neigungx*((c.position.x-game.solitaire.cam.position.x)/15)
				EndMethod
	Method pickslopepositionarc(c:_card,p:_vector3)
				Local w#=((Float(c.index())-Float(cardlist.count())/2)*anglestep)+90
				Local h:_vector3=New _vector3
				h.x=Cos(w)*c.neigungx
				h.y=Sin(w)*c.neigungx
				h.z=-0.5*c.neigungx
				p.sub(h)
				EndMethod
	Method nextcardinsequence:Int(cf:_card)
		        Local cn:_card=Null
		        Local itn:TLink=Null
			    If cf.pilelink itn=cf.pilelink.nextlink()
			    If itn
			     cn=_card(itn.value())
			     If cn.suit=cf.suit 
				  Rem
			      If takeboth 
			       If game.pilefoundationlist.firstlink()
			        'foundations müssen untersucht werden
			        'zunächst diejenige foundation identifizieren, die zu dieser suit gehört
				    Local fs:_pilefoundation=Null
				    For Local fit:_pilefoundation=EachIn game.pilefoundationlist
				     If fit.takeemptysuit=cf.suit And fs=Null fs=fit
				    Next
				    If fs
				     Print "fs."+fs.ascendingmirrored()
				     If fs.ascendingmirrored() If cf.number=cn.number-1 Return(True)
				     If fs.descendingmirrored() If cf.number=cn.number+1 Return(True)
					Else
			         If Abs(cn.number-cf.number)=1 Return(True)
					EndIf
				   Else
			        If Abs(cn.number-cf.number)=1 Return(True)
			  	   EndIf
				  Else
			      EndIf
				  EndRem
			      If takedescending If cf.number=cn.number-1 Return(True)
			      If takeascending If cf.number=cn.number+1 Return(True)
				  If takeboth If Abs(cn.number-cf.number)=1 Return(True)


			     EndIf
				Else
			    EndIf
				Return(False)
				EndMethod									
	Method canpick:Int(c:_card)Abstract
	Method pick(c:_card)'picks the card c to the picklist
				'concrete piles can override this function
				c.pick()
				Local it:TLink=c.pilelink.prevlink()
				If(it)
				 Local cit:_card=_card(it.value())
				 pick(cit)
				EndIf
				EndMethod
	Method pickextern(c:_card,l:TList)'picks the card c to the external list
				'concrete piles can override this function
				l.addlast(c)
				Local it:TLink=c.pilelink.prevlink()
				If(it)
				 Local cit:_card=_card(it.value())
				 pickextern(cit,l)
				EndIf
				EndMethod
	Method pickrowlengthfromfirst:Int()
				Local i=0
				For Local cit:_card=EachIn cardlist
				 If canpick(cit) i:+1
				Next
				Return(i)
				EndMethod					
	Method candrop:Int(list:TList,samesuit:Int=False)Abstract
	Method dropposition:_vector3(backdrop=False)
				Local v:_vector3=New _vector3
				v.copy(position)
				v.z:-game.solitaire.cardthickness*Float(cardlist.count())
				Return(v)
				EndMethod	
	Method droppositionvector:_vector3(backdrop=False)	
				'letzte rückseitige kartenposition holen
				Local v:_vector3=New _vector3
				Local cit:_card
				Local lc:_card=Null
				Local lcup=False
				Local lifted=False
				Local lit:TLink

				Local lb:_card=Null
				Local frontcount#=0

				lit=cardlist.lastlink()
				If lit
				 Repeat
 				  cit=_card(lit.value())
 				  Local up=False
				  If cit.curving
				   If cit.turnedupatcurveend() up=True'lb=cit Else frontcount:+1
				  Else
				   If cit.turnedup() up=True'lb=cit Else frontcount:+1
				  EndIf
				  If up And lifted=False lifted=True
				  lc=cit
				  lcup=up
				  lit=lit.prevlink()
				 Until lit=Null
				EndIf
				
				'If lb'frontcount korrigieren
				' lit=lb.pilelink.prevlink()
				' frontcount=0
				' If lit
				'  Repeat
				'   frontcount:+1
				'   lit=lit.prevlink()
				'  Until lit=Null
				' EndIf
				'EndIf
				
				
				Local offfront:_vector3=New _vector3
				offfront.copy(vector)
				offfront.mul(game.cardshiftfront*stretchfactor)
				offfront.z=-game.solitaire.cardthickness
				'offfront.mul(frontcount)
				
				Local offback:_vector3=New _vector3
				offback.copy(vector)
				offback.mul(game.cardshiftback*stretchfactor)
				offback.z=-game.solitaire.cardthickness
				'If lb
				' If lb.curving=False
				'  v.copy(lb.position)
				' Else
				'  v.copy(lb.curveposition.o1)
				' EndIf
				' v.add(offback)
				'Else
			 	' v.copy(position)
				'EndIf
				'If backdrop=False
				' v.z:-game.solitaire.cardtableaulift
				'Else
				' If frontcount>0 v.z:-game.solitaire.cardtableaulift
				'EndIf
				'v.add(offfront)
				If lc
				 If lc.curving=False
				  v.copy(lc.position)
				 Else
				  v.copy(lc.curveposition.o1)
				 EndIf
				 If lcup=False v.add(offback) Else v.add(offfront)
				Else
				 v.copy(position)
				EndIf
				If lifted=False And backdrop=False v.z:-game.solitaire.cardtableaulift
				Return(v)
				EndMethod		
	Method droppositionarc:_vector3(backdrop=False)
				Local v:_vector3=New _vector3
				v.copy(position)
				v.z:-game.solitaire.cardtableaulift
				v.z:-1.5
				Local c=cardlist.count()
				Local w#=(-c/2)*anglestep+90
				Local x#=Cos(w)*radiusx
				Local y#=Sin(w)*radiusy
				v.x=v.x+x
				v.y=v.y+(y-radiusy)
				'v.z:-game.solitaire.cardthickness*Float(c)
				'v.x:+game.cardshiftfront*Float(cardlist.count())*stretchfactor
				Return(v)
				EndMethod				
	Method dropvy:_vector3()
				Local v:_vector3=New _vector3
				v.set(0,game.cardheight,0)
				Return(v)
				EndMethod	
	Method dropvx:_vector3()
				Local v:_vector3=New _vector3
				v.set(game.cardwidth,0,0)
				Return(v)
				EndMethod	
	Method dropvxarc:_vector3()
				Local h:_vector3=New _vector3
				Local v:_vector3=New _vector3
				Local n:_vector3=New _vector3
				n.set(0,0,-1)
				Local c=cardlist.count()
				Local w#=(-c/2)*anglestep+90
				h.set(game.cardwidth,0,0)
				rotatevector(n,h,w-90,v)
				Return(v)
				EndMethod				
	Method dropvyarc:_vector3()
				Local h:_vector3=New _vector3
				Local v:_vector3=New _vector3
				Local n:_vector3=New _vector3
				n.set(0,0,-1)
				Local c=cardlist.count()
				Local w#=(-c/2)*anglestep+90
				h.set(0,game.cardheight,-game.solitaire.cardslope-2)
				rotatevector(n,h,w-90,v)
				Return(v)
				EndMethod					
	Method drop(clock:_clock)
				'drop the picklist to the pile pit and record the moves
				Local i#=0
				Local m:_animationundo=game.createundo(30,0.1,True)
				If game.picklist.count()=13 If game.preview=False playsoundstretched(game.solitaire.smove,1,0.95,1.05)
				Print "gamepicklistcount"+game.picklist.count()
				While(game.picklist.firstlink())
				 Local c:_card=_card(game.picklist.firstlink().value())
				 Local pilefrom:_pile=c.pile
				 c.deinsertpick()
				 Local v:_vector3=New _vector3
				 Local dvx:_vector3=dropvx()
				 Local dvy:_vector3=dropvy()
				 c.curvespeed=20
			 	 c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,-2*i ,0,0,0)  
			 	 c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,-2*i ,0,0,0)  
			     v.copy(dropposition())
				 c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-3,0,0,0)
			     c.startcurve(clock)
			     'undo record move
			     Local cupo:_hermitecurve=New _hermitecurve
			     Local cuvx:_hermitecurve=New _hermitecurve
			     Local cuvy:_hermitecurve=New _hermitecurve
			     cupo.o0.copy(c.pickposition)
			     cupo.v0.set(0,0,-10)
			 	 cupo.o1.copy(c.curveposition.o1)
			 	 cupo.v1.set(0,0,10)
			     cupo.updatelength()
				 cuvx.o0.copy(c.pickvx)
				 cuvx.v0.set(0,0,0)
				 cuvx.o1.copy(c.curvevx.o1)
				 cuvx.v1.set(0,0,0)
			     cuvx.updatelength()
				 cuvy.o0.copy(c.pickvy)
				 cuvy.v0.set(0,0,0)
				 cuvy.o1.copy(c.curvevy.o1)
				 cuvy.v1.set(0,0,0)
			     cuvy.updatelength()
				 m.use(c,Self,True,0,0,0,pilefrom,True,0,0,0,cupo,cuvx,cuvy)
				 'end undo record move
				 c.deinsertpile()
				 c.deinsertpyramid()
				 c.deinsertlabyrinth()
				 c.deinsertarray()
				 c.deinsertsweetmatch()
				 c.insertpile(Self,True)
				 i:+1
				Wend
				EndMethod						
	Method adjustcardposition()
				If game.animationlist.firstlink()=Null
				'Local v:_vector3=New _vector3
				 positionfirst.copy(position)
				 Local it:TLink=cardlist.lastlink()
				 If it
				  Repeat
				   Local cit:_card=_card(it.value())
				   If cit.curving=False And cit.picked=False cit.position.copy(positionfirst)
				   positionfirst.z:-game.solitaire.cardthickness
				   it=it.prevlink()
				  Until it=Null
				 EndIf
  				 positionfirstunstretched.copy(positionfirst)
				EndIf
				EndMethod		
	Method adjustcardpositionvector()
				
				If game.activepreparation()=False
				 Local h:_vector3=New _vector3
				 Local j:_vector3=New _vector3
				 Local back=True
				 positionfirst.copy(position)
				 positionfirstunstretched.copy(position)
				 Local it:TLink=cardlist.lastlink()
				 If it
				  Repeat
				   Local cit:_card=_card(it.value())
				   Local tu=cit.turnedup()
				   If back=True And tu=True
				    back=False
				    positionfirst.z:-game.solitaire.cardtableaulift
				    positionfirstunstretched.z:-game.solitaire.cardtableaulift
				   EndIf
				   If cit.curving=False And cit.picked=False
				    h.copy(positionfirst)
				    h.mul(0.5)
				    cit.position.mul(0.5)
				    cit.position.add(h)
				   EndIf
				   If cit.curving=True And cit.picked=False
				    cit.curveposition.o1.copy(positionfirst)
				    cit.curveposition.updatelength()
				   EndIf
				   If tu=False'vorher : if back !!!!!
				    'positionfirst.y:-game.cardshiftback*stretchfactor
				    h.copy(vector)
				    h.mul(game.cardshiftback*stretchfactor)
				    positionfirst.add(h)
				    'positionfirstunstretched.y:-game.cardshiftback
				    h.copy(vector)
				    h.mul(game.cardshiftback)
				    positionfirstunstretched.add(h)
				    positionfirst.z:-game.solitaire.cardthickness
				    positionfirstunstretched.z:-game.solitaire.cardthickness
				   Else 
				    'positionfirst.y:-game.cardshiftfront*stretchfactor
				    h.copy(vector)
				    h.mul(game.cardshiftfront*stretchfactor)
				    positionfirst.add(h)
				    'positionfirstunstretched.y:-game.cardshiftfront
				    h.copy(vector)
				    h.mul(game.cardshiftfront)
				    positionfirstunstretched.add(h)
				    positionfirst.z:-game.solitaire.cardthickness
				    positionfirstunstretched.z:-game.solitaire.cardthickness
				   EndIf
				   it=it.prevlink()
				  Until it=Null
				 EndIf
				EndIf
				
				EndMethod
	Method adjustcardpositionarc(always=False)
				If game.activepreparation()=False Or always
				 Local c#=cardlist.count()
				 Local i#=0
				 Local h:_vector3=New _vector3
				 Local z#=0
				 Local dz#=0.001
				 For Local cit:_card=EachIn cardlist
				  cit.anglemust=((i-c/2)*anglestep)+90+anglestep/2
				  
				  h.copy(position)
				  h.z:-game.solitaire.cardtableaulift
				  h.z:-1.5
				  h.z:+z
				  z=z+dz
				  Local x#=Cos(cit.angle)*radiusx
				  Local y#=Sin(cit.angle)*radiusy
				  h.x=h.x+x
				  h.y=h.y+(y-radiusy)
				  If cit.curving=False And cit.picked=False 
				   cit.position.add(h)
				   cit.position.mul(0.5)
				  Else
				   cit.curveposition.o1.copy(h)
				   cit.curveposition.updatelength()
				  EndIf
				  cit.animateangle()
				  i=i+1
				 Next
				EndIf
				EndMethod					
	Method adjustcardvy()
				If game.activepreparation()=False
				 For Local cit:_card=EachIn cardlist
				  If cit.curving=False And cit.picked=False cit.vy.set(0,game.cardheight,0)
				 Next
				EndIf
				EndMethod 			
	Method adjustcardvx()
				If game.activepreparation()=False And game.preview=False
				 Local c:_card=Null
				 Local it:TLink
				 it=cardlist.firstlink()
				 If game.solitaire.mouseovercard And it
				  Local cfi:_card=Null
				  If game.picklist.count()=0
	   			   For Local cit:_card=EachIn cardlist
	 			    If cfi=Null If cit.picked=False If cit.inner() And canpick(cit)  cfi=cit
				   Next				
				  EndIf
				  If cfi 'Or solitaire.pointandclick'ist null wenn etwas gepickt ist
				   Repeat
				    c=_card(it.value())
				    If c.picked=False And game.allowpick
				     c.neigungx=-(game.solitaire.cardslopepick*0.1-c.neigungx*0.9)
				     c.neigungactive=True
				    EndIf
				    it=it.nextlink()
				   Until it=Null Or c=cfi
				   If it
				    Repeat
				     c=_card(it.value())
				     If c.picked=False
				      c.neigungx:*0.9
				      c.neigungactive=False
				     EndIf
				     it=it.nextlink()
				    Until it=Null
				   EndIf
				  Else
				   Repeat
				    c=_card(it.value())
				    If c.picked=False 
				     If canpick(c)=False c.neigungx:*0.35
				     c.neigungx:*0.9
				     c.neigungactive=False
				    EndIf
				    it=it.nextlink()
				   Until it=Null
				  EndIf
				 EndIf
				EndIf
				EndMethod		
	Method adjustcardvxsingle()
				If game.activepreparation()=False And game.preview=False
				 Local c:_card=Null
				 Local it:TLink
				 it=cardlist.firstlink()
				 If game.solitaire.mouseovercard And it
				  Local cfi:_card=Null
				  If game.picklist.count()=0
	   			   For Local cit:_card=EachIn cardlist
	 			    If cfi=Null If cit.picked=False If cit.inner() And canpick(cit)  cfi=cit
				   Next				
				  EndIf
				  For c=EachIn cardlist
				   If c=cfi 'Or (c.inner() And solitaire.pointandclick)
				    If c.picked=False And game.allowpick
				     c.neigungx=-(game.solitaire.cardslopepick*0.1-c.neigungx*0.9)
				     c.neigungactive=True

				    EndIf
				   Else
				    If c.picked=False
				     c.neigungx:*0.9
				     c.neigungactive=False

				    EndIf
				   EndIf
				  Next
				 EndIf
				EndIf
				EndMethod		
	Method setangle(c:_card)
				EndMethod					
	Method setanglearc(c:_card)
				c.angle=((Float(c.index())-Float(cardlist.count())/2)*anglestep)+90
				c.anglemust=c.angle
				EndMethod								
					
					
	Method adjustcardvxarc(always=False)
				If game.activepreparation()=False Or always
				 Local c#=cardlist.count()
				 Local i#=0
				 Local h:_vector3=New _vector3
				 Local j:_vector3=New _vector3
				 Local n:_vector3=New _vector3
				 n.set(0,0,-1)
	   			 For Local cit:_card=EachIn cardlist
				  Local w#=((i-c/2)*anglestep)+90
	     		  h.set(game.cardwidth,0,0)
	 			  rotatevector(n,h,w-90,j)
	  			  If cit.curving=False And cit.picked=False
	 			   cit.vx.add(j)
				   cit.vx.mul(0.5)
				  Else
				   cit.curvevx.o1.add(j)
				   cit.curvevx.o1.mul(0.5)
				  EndIf
				  i=i+1;
				 Next
				EndIf
				EndMethod		
	Method adjustcardvyarc(always=False)
				If game.activepreparation()=False Or always
				 Local c#=cardlist.count()
				 Local i#=0
				 Local h:_vector3=New _vector3
				 Local j:_vector3=New _vector3
				 Local n:_vector3=New _vector3
				 n.set(0,0,-1)
	   			 For Local cit:_card=EachIn cardlist
				  Local w#=((i-c/2)*anglestep)+90
	     		  h.set(0,game.cardheight,-game.solitaire.cardslope-2)
	 			  rotatevector(n,h,w-90,j)
	  			  If cit.curving=False And cit.picked=False
	 			   cit.vy.add(j)
				   cit.vy.mul(0.5)
				  Else
				   cit.curvevy.o1.add(j)
				   cit.curvevy.o1.mul(0.5)
				  EndIf
				  i=i+1;
				 Next
				EndIf
				EndMethod		
	Method animatemouseovercardarc()
				Local cfi:_card=Null
				If game.solitaire.mouseovercard
				 If game.picklist.count()=0
	   			  For Local cit:_card=EachIn cardlist
	 			   If cfi=Null If cit.picked=False If cit.inner()  cfi=cit
				  Next				
				 EndIf				
				EndIf
				For Local c:_card=EachIn cardlist
				 If c=cfi And game.allowpick And c.canpick()
				  c.neigungx=-(game.solitaire.cardslopepick*0.1-c.neigungx*0.9)
				 Else
				  c.neigungx:*0.9
				 EndIf
				 c.animate()				
				Next
				EndMethod
				
	Method animatestretch()
				Local d#=stretch-stretchfactor
				d:*stretchhaerte
				stretchvector:+d
				stretchfactor:+stretchvector
				stretchvector:*stretchfriction
				EndMethod						
	Method animate(clock:_clock)Abstract
	Method animatepileinfo()
				Local nt#=game.solitaire.clock.ms()
				
				If game.solitaire.mouseoverpile And game.ended=False And game.inuse And game.picklist.firstlink()=Null
				 For Local cit:_card=EachIn cardlist
				  If cit.inner() And cit.curving=False
				   If showdescription
				   game.pileinfo=Self
				   game.pileinfoopacity=1
				   game.pileinfotime=nt
				   game.pileinfoname=name
				   game.pileinfodescription0=description0
				   game.pileinfodescription1=description1
				   EndIf
				  EndIf
				 Next
				 If game.pileinfo=Null 
				  If inner(False) 
				   If showdescription
				   game.pileinfo=Self
				   game.pileinfoopacity=1
				   game.pileinfotime=nt
				   game.pileinfoname=name
				   game.pileinfodescription0=description0
				   game.pileinfodescription1=description1
				   EndIf
				  EndIf
				 EndIf
				EndIf
				EndMethod
	Method animateinput()
				
	
				Local mx#=game.solitaire.mouse.x'512'MouseX()
				Local my#=game.solitaire.mouse.y'370'MouseY()
				Local mb[]=[game.solitaire.mousebutton[0],game.solitaire.mousebutton[1]]
				Local i
				Local cf:_card=Null
			
				If game.allowpick And game.animationlist.firstlink()=Null' And game.solitaire.guisystem.mouseovergui()=False


				
				 If (mb[0] Or mb[1])
				  
				  'If game.solitaire.mouseoverpile=False
				   For Local cit:_card=EachIn cardlist
				    If cit.inner() And cit.picked=False And cf=Null cf=cit
				   Next
				  'EndIf
				  If cf
				 
				   If cf.turnedup()=False
					
				
				    If cf.canturn() 
				     cf.turn(game.solitaire.clock)
				     game.startusing()
			  	    EndIf
				   Else
				    

				    '------------------------------- pick und autoplay check left -------------
				    If mb[0]
				     'Print "ififi"
				     Local doppel=False
				     If cf.clickleft=False 
				      If game.solitaire.clock.ms()-cf.clicktime<300 doppel=True
				      cf.clickleft=True
				      cf.clicktime=game.solitaire.clock.ms()
				     EndIf
				     If doppel
				      If game.solitaire.clickplaydouble 
				  	   Print "ja0"
				       'If game.canpick() '???????????????? was das ???????????????????????????
				  	   ' Print "ja1"
				        If cf.pile.canpick(cf) 
				  	     Print "ja2"
				         
				         game.clickplay(cf)
						 cf.doubleclicked=True
				   	    EndIf
				  	   'EndIf
				      EndIf
				     Else
				  	  Print "canpick1"
				      If cf.canpick() 
				  	  Print "canpick2"
				       If cf.picked=False
				  	  Print "canpick3"
				        cf.insertpick()
				       EndIf
				      EndIf 
				     EndIf
				    EndIf
				    '------------------------------- autoplay check right ----------------------
		            If cf.curving=False And mb[1] And cf.canpick() And game.solitaire.clickplayright game.clickplay(cf)
			       EndIf'turnedup
			      EndIf'cf
			     EndIf'mbx
				 
				 For Local cit:_card=EachIn cardlist
				  If mb[0]=False
				   If cit.clickleft=True
				    cit.clickleft=False
				   EndIf
				  EndIf
				 Next
				
				EndIf
				EndMethod
	Method animatetableaufill()				
				If tableaufill And game.automoveundodelay=False And game.tableau And cardlist.firstlink() And game.animationlist.firstlink()=Null
				 Local pt:_piletableau=Null
				 For Local tit:_piletableau=EachIn game.tableau.pilelist
				  If pt=Null And tit.cardlist.firstlink()=Null
				   pt=tit
				  EndIf
				 Next
				 If pt
				  Local a:_animationpiletopile=New _animationpiletopile
				  Local l:TList=CreateList()
				  l.addlast(_card(cardlist.firstlink().value()))
				  a.init(game,l,pt,game.solitaire.autospeed,0.1,True,True,True)
				  a.undoconstantsort=False
				  a.skipable=False
				 EndIf
				EndIf
				EndMethod
	Method save(s:TStream)Abstract				
	Method savepile(s:TStream)
				'saveassociation(game)
				'Field gamelink:TLink=Null
				'Field cardlist:TList=Null
				position.save(s)
				positionfirst.save(s)
				positionfirstunstretched.save(s)
				WriteFloat(s,camerastretch)
				WriteFloat(s,stretchfactor)
				WriteFloat(s,stretch)
				WriteFloat(s,stretchvector)
				WriteFloat(s,stretchhaerte)
				WriteFloat(s,stretchfriction)
				WriteFloat(s,maximumlength)
				WriteFloat(s,radiusx)
				WriteFloat(s,radiusy)
				WriteFloat(s,anglestep)
				WriteInt(s,drawownshadow)
				vector.save(s)
				WriteInt(s,nopickifcardcurving)
				WriteInt(s,discardcount)
				
	
				
				'WriteInt(s,localrule)
				WriteInt(s,giverestriction)
				WriteInt(s,giverestrictionfreecell)
				WriteInt(s,givesamesuit)
				WriteInt(s,giveothersuit)
				WriteInt(s,givealteratecolor)
				WriteInt(s,givedescending)
				WriteInt(s,giveascending)
				WriteInt(s,givemaximal)
				
				WriteInt(s,takerestriction)
				WriteInt(s,takesamesuit)
				WriteInt(s,takeothersuit)
				WriteInt(s,takealteratecolor)
				WriteInt(s,takeascending)
				WriteInt(s,takedescending)	
				WriteInt(s,takeboth)
				WriteInt(s,takewrapped)
				WriteInt(s,takemirrored)
				WriteInt(s,takeemptysuit)
				WriteInt(s,takeemptynumber)
				WriteInt(s,takeemptymaximal)
				WriteInt(s,takeemptyrestriction)
				WriteInt(s,takemaximal)
				WriteInt(s,tableaufill)
				WriteInt(s,redealvalue)
				WriteInt(s,redealcount)
				WriteInt(s,showdescription)
				WriteInt(s,flag)
				WriteInt(s,cardlist.count())
				For Local cit:_card=EachIn cardlist
				 cit.save(s)
				Next					
				'Field mesh:_mesh=Null				
				EndMethod
	Method Load(s:TStream)Abstract	
	Method loadpile(s:TStream)
				position.Load(s)
				positionfirst.Load(s)
				positionfirstunstretched.Load(s)
				camerastretch=ReadInt(s)
				stretchfactor=ReadFloat(s)
				stretch=ReadFloat(s)
				stretchvector=ReadFloat(s)
				stretchhaerte=ReadFloat(s)
				stretchfriction=ReadFloat(s)
				maximumlength=ReadFloat(s)
				radiusx=ReadFloat(s)
				radiusy=ReadFloat(s)
				anglestep=ReadFloat(s)
				drawownshadow=ReadInt(s)
				vector.Load(s)
				nopickifcardcurving=ReadInt(s)
				discardcount=ReadInt(s)
				'localrule=ReadInt(s)
				giverestriction=ReadInt(s)
				giverestrictionfreecell=ReadInt(s)
				givesamesuit=ReadInt(s)
				giveothersuit=ReadInt(s)
				givealteratecolor=ReadInt(s)
				givedescending=ReadInt(s)
				giveascending=ReadInt(s)
				givemaximal=ReadInt(s)
				
				takerestriction=ReadInt(s)
				takesamesuit=ReadInt(s)
				takeothersuit=ReadInt(s)
				takealteratecolor=ReadInt(s)
				takeascending=ReadInt(s)
				takedescending=ReadInt(s)	
				takeboth=ReadInt(s)
				takewrapped=ReadInt(s)
				takemirrored=ReadInt(s)
				takeemptysuit=ReadInt(s)
				takeemptynumber=ReadInt(s)
				takeemptymaximal=ReadInt(s)
				takeemptyrestriction=ReadInt(s)
				takemaximal=ReadInt(s)
				tableaufill=ReadInt(s)
				redealvalue=ReadInt(s)
				redealcount=ReadInt(s)
				showdescription=ReadInt(s)
				flag=ReadInt(s)
				cardlist.clear()
				Local cc=ReadInt(s)
				If cc>0
				 For Local i=0 To cc-1
				  Local cit:_card=New _card
				  cit.init(game.solitaire,game,0,0)
				  cit.insertpile(Self)
				  Local typ$=ReadLine(s)
				  cit.Load(s)				  
				 Next
				EndIf
				updatemesh()
				EndMethod	
	Method assoziieren()Abstract
				
	EndType
'******************************************************************************************************************
'										P I L E T A B L E A U 
'******************************************************************************************************************
Type _piletableau Extends _pile
	Field tableau:_tableau=Null
	Field linktableau:TLink=Null
	Method New()
				EndMethod
	Method Delete()
				EndMethod				
	Method init(t:_tableau,px#,py#)
				initpile(t.game,px,py)
				tableau=t
				linktableau=tableau.pilelist.addlast(Self)
				name=strpiletableau
				'createshadow()
				drawownshadow=False
				EndMethod	
				Rem
	Method draw(gra:_graphics,cam:_camera)
				'If game.autoplaysourpileiterator=linktableau Or game.autoplaydestpileiterator=linktableau
				' Local c:_vector4=New _Vector4
				' Local s:_vector4=New _Vector4
				' Local d:_vector4=New _Vector4
				' s.set(0,1,0,1)
				' d.set(1,0,0,1)
				' If game.autoplaysourpileiterator=linktableau c.add(s) 
				' If game.autoplaydestpileiterator=linktableau c.add(d) 
				' mesh.vertexcolor(c)
				'Else 
				 mesh.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  mesh.determinevertexlight(lit)
				 Next
				 gra.blendmultiplicative()
				'EndIf
				 mesh.draw(gra,cam)
				 gra.blend(False)
				EndMethod
				EndRem
	Method draw(gra:_graphics,cam:_camera)
				mesh.clearvertexlight()
	    		For Local lit:_light=EachIn game.solitaire.world.lightlist
				 mesh.determinevertexlight(lit)
				Next
				mesh.draw(gra,cam)
				Local s=takeemptysuit
				Local n=takeemptynumber

				If s<>-1
				 For Local pit:_polygon=EachIn meshsuit.polygonlist
				  pit.texture[0,0]=game.solitaire.tsymbolsuit[s]
				 Next
				 meshsuit.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  meshsuit.determinevertexlight(lit)
				 Next
				 meshsuit.draw(gra,cam)
				EndIf
				If n<>-1
				 For Local pit:_polygon=EachIn meshnumber.polygonlist
				  pit.texture[0,0]=game.solitaire.tsymbolnumber[n]
				 Next
				 meshnumber.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  meshnumber.determinevertexlight(lit)
				 Next
				 meshnumber.draw(gra,cam)
				EndIf
				EndMethod				
	Method canpick:Int(c:_card)
				'apply the pickrule states (pilegive)
				Local cit:_card=Null
				Local it:TLink
				 Rem
				Local gsame
				Local gothe
				Local galte
				Local gdesc
				Local gasc
				If localrule
				 gsame=givesamesuit
				 gothe=giveothersuit
				 galte=givealteratecolor
				 gdesc=givedescending
				 gasc=giveascending
				Else
				 gsame=game.pilegivesamesuit
				 gothe=game.pilegiveothersuit
				 galte=game.pilegivealteratecolor
				 gdesc=game.pilegivedescending
				 gasc=game.pilegiveascending
				EndIf
				EndRem
				
				If giverestriction Return(False)
				If c.pilelink.prevlink()=Null 
				 Return(True)'it is the first (topmost) card in pile
				Else
				 'turn check
				 If c.turnedup()=False Return(False)
				
				
				 'turn check in prev sequence
				 it=c.pilelink.prevlink()
				 While(it)
				  cit=_card(it.value())
				  If cit.turnedup()=False Return(False)
				  it=it.prevlink()
				 Wend
				 
				 'givemaximal check
				 If givemaximal<>-1
				  Local wg=c.index()+1
				  If wg>givemaximal Return(False)
				 EndIf				
				 
				 'checksuit
				 Local actsuit

				 If givesamesuit
				  it=c.pilelink.prevlink()
				  While(it)
				   cit=_card(it.value())
				   If c.suit<>cit.suit Return(False)
				   it=it.prevlink()
				  Wend
				 EndIf
				
				 If giveothersuit
				  actsuit=c.suit
				  it=c.pilelink.prevlink()
				  While(it)
				   cit=_card(it.value())
				   If actsuit=cit.suit Return(False)
				   it=it.prevlink()
				   actsuit=cit.suit
				  Wend
				 EndIf 
				
				 If givealteratecolor
				  actsuit=c.suit
				  it=c.pilelink.prevlink()
				  While(it)
				   cit=_card(it.value())
				   If (actsuit=0) If (cit.suit=0)Or(cit.suit=3) Return(False)
				   If (actsuit=1) If (cit.suit=1)Or(cit.suit=2) Return(False)
				   If (actsuit=2) If (cit.suit=1)Or(cit.suit=2) Return(False)
				   If (actsuit=3) If (cit.suit=0)Or(cit.suit=3) Return(False)
				   actsuit=cit.suit
				   it=it.prevlink()
				  Wend
				 EndIf
				
				 'check numbers
				 Local actnumber=c.number
				 If givedescending
				  it=c.pilelink.prevlink()
				  While(it)
				   cit=_card(it.value())
				   If(cit.number<>(actnumber-1)) Return(False)
				   it=it.prevlink()
				   actnumber:-1
				  Wend
				 EndIf
				 If giveascending
				  it=c.pilelink.prevlink()
				  While(it)
				   cit=_card(it.value())
				   If(cit.number<>(actnumber+1)) Return(False)
				   it=it.prevlink()
				   actnumber:+1
				  Wend
				 EndIf
				 'check special freecell pick
				 If giverestrictionfreecell'game.freecellpickrestriction
				  If game.hasfreecells()
				   Local cf=game.countfreefreecells()
				   Local cp=0
				   it=c.pilelink
				   While(it.prevlink())
				    cp:+1 
				    it=it.prevlink()
				   Wend
				   If cp>cf Return(False)
				  EndIf
				 EndIf
				EndIf				 
				Return(True)
				EndMethod				
	Method candrop:Int(list:TList,samesuit:Int=False)
				'can the picked be dropped on the pile?
				'apply the droprule states (piletake)
				Rem
				Local tsame
				Local tothe
				Local talte
				Local tdesc
				Local tasc
				Local tesuit
				Local tenumber
				If localrule
				 tsame=takesamesuit
				 tothe=takeothersuit
				 talte=takealteratecolor
				 tdesc=takedescending
				 tasc=takeascending
				 tesuit=takeemptysuit
				 tenumber=takeemptynumber
				Else
				 tsame=game.piletakesamesuit
				 tothe=game.piletakeothersuit
				 talte=game.piletakealteratecolor
				 tdesc=game.piletakedescending
				 tasc=game.piletakeascending
				 tesuit=game.piletakeemptysuit
				 tenumber=game.piletakeemptynumber
				EndIf
				EndRem
				If takerestriction Return(False)
				If takeemptyrestriction And cardlist.count()=0 Return(False)
				If takemaximal<>-1
				 If cardlist.count()>=takemaximal Return(False)
				EndIf
				If takeemptymaximal<>-1
				 If cardlist.count()=0
				  If list.count()>takeemptymaximal Return(False)
				 EndIf
				EndIf
				If list.count()>0
				 Local cp:_card=_card(list.firstlink().value())
				 Local it:TLink=cardlist.firstlink()
				 If it
				  Local cit:_card=_card(it.value())
				  If cit
				   If cit.turnedup()=False Return(False)
				   If samesuit=False'zur vereinfachung der tipp-algorithmik im spidertyp
				
				    If takesamesuit
				     If cit.suit<>cp.suit Return(False)
				    EndIf
				
					If takeothersuit
					 If cit.suit=cp.suit Return(False)
					EndIf
				
				    If takealteratecolor
				     If cit.suit=0 If ((cp.suit=0)Or(cp.suit=3)) Return(False)
				     If cit.suit=1 If ((cp.suit=1)Or(cp.suit=2)) Return(False)
				     If cit.suit=2 If ((cp.suit=1)Or(cp.suit=2)) Return(False)
				     If cit.suit=3 If ((cp.suit=0)Or(cp.suit=3)) Return(False)
				    EndIf
				
				   Else
				    If cit.suit<>cp.suit Return(False)
				   EndIf
				   If takedescending
				    If cit.number<>(cp.number+1) Return(False)
				   EndIf
				   If takeascending
				    If cit.number<>(cp.number-1) Return(False)
				   EndIf
				  EndIf
				 Else'empty pile
				  If takeemptysuit<>-1 If cp.suit<>takeemptysuit Return(False)
				  If takeemptynumber<>-1 If cp.number<>takeemptynumber Return(False)
				 EndIf
				 Return(True)
				EndIf
				Return(False)
				EndMethod			

	Method dropposition:_vector3(backdrop=False)
			    Return(droppositionvector(backdrop))
				EndMethod
	Method dropvy:_vector3()
				Local v:_vector3=New _vector3
				v.set(0,game.cardheight,-game.solitaire.cardslope)
				Return(v)
				EndMethod	
	Method adjustcardposition()
				adjustcardpositionvector()
				EndMethod
	Method adjustcardvy()
	   			For Local cit:_card=EachIn cardlist
	 			 If cit.curving=False And cit.picked=False
	 			  If cit.turnedup()
	     		   cit.vy.set(0,game.cardheight,-game.solitaire.cardslope)
	  			  Else
	  			   cit.vy.set(0,game.cardheight,0)
	 			  EndIf
	 			 EndIf
				Next
				EndMethod								
	Method animate(c:_clock)
				
				'set the stretch dependent To the intersection
				If game.statsclosed=False And discardcount game.discards:+cardcount()
				adjustcardposition()
		
				If game.activepreparation()=False 
				
				 adjustcardvy()
				 adjustcardvx()
				 
				
				 If camerastretch Or game.mode>0
				 
				
				  Local cam:_camera=game.solitaire.cam
				  Local pox#=position.x
				  Local poy#=position.y
				  Local poz#=positionfirstunstretched.z
				
				  Local pvx#=positionfirstunstretched.x-position.x
				  Local pvy#=positionfirstunstretched.y-position.y
				  Local pvz#=0
				
				  Local ox#=cam.position.x
				  Local oy#=cam.position.y
				  Local oz#=cam.position.z
				
				  Local vx#=cam.view.x+cam.side.x
				  Local vy#=cam.view.y-cam.up.y
				  Local vz#=cam.view.z-cam.up.z
				
				  Local ex#
				  Local ey#
				  Local ez#
				  Local D#
				  Local alpha#=0
				  stretch=1
				  Local clipped=False
				
				 'If Abs(pvy)>nearzero
				  
				  '-------------------------------- an der unteren kante clippen
				  If pvy<0
				   D=determine2(vy,vz,-pvy,-pvz)
				   If Abs(D)>nearzero
				    ey=poy-oy
				    ez=poz-oz
				    alpha=determine2(vy,vz,ey,ez)/D
				    If alpha<=1 And alpha>0
				     If alpha<stretch
				      stretch=alpha
				      clipped=True
				     EndIf
				    EndIf
				   EndIf
				  EndIf
				  '-------------------------------- an der oberen kante clippen
				  If pvy>0
				   D=determine2(-vy,-vz,-pvy,-pvz)
				   If Abs(D)>nearzero
				    ey=poy-oy
				    ez=poz-oz
				    alpha=determine2(-vy,-vz,ey,ez)/D
				    If alpha<=1 And alpha>0
				     If alpha<stretch
				      stretch=alpha
				      clipped=True
				     EndIf
				    EndIf
				   EndIf
			 	  EndIf				

				  vz=cam.view.z-cam.side.z

				  If pvx>0
				  ' Print "sdf<"+ pvx+"  vx= "+vx+  "  vz="+vz
				   '-------------------------------- an der rechten kante clippen
				   D=determine2(vx,vz,-pvx,-pvz)
				   If Abs(D)>nearzero
				   'Print "sdf<1"
				    ex=pox-ox
				    ez=poz-oz
				    alpha=determine2(vx,vz,ex,ez)/D
				    'Print alpha
				    If alpha<=1 And alpha>0
				   'Print "sdf<2"
				     If alpha<stretch 
				      stretch=alpha
				   'Print "sdf<3"
				      clipped=True
				      Print "rechts"
				     EndIf
				    EndIf
				   EndIf
				  EndIf
				  If pvx<0
				   '-------------------------------- an der linken kante clippen
				   D=determine2(-vx,-vz,-pvx,-pvz)
				   If Abs(D)>nearzero
				    ex=pox-ox
				    ez=poz-oz
				    alpha=determine2(-vx,-vz,ex,ez)/D
				    If alpha<=1 And alpha>0
				     If alpha<stretch
				      stretch=alpha
				      clipped=True
			 	
				     EndIf
				    EndIf
				   EndIf
				  EndIf				
			
				 'If clipped=False stretch=1 'Else stretch=alpha
				

				 Else

				  Local h:_vector3=New _vector3
				  h.copy(positionfirstunstretched)
				  h.sub(position)
				  Local l#=h.length()
				  'Print l
				  If l>(maximumlength*game.scaleglobal) stretch=(maximumlength*game.scaleglobal)/l Else stretch=1
				 
				 EndIf

				Else 
				 stretch=1
				EndIf



				animatestretch()
				animatepileinfo()	
				animateinput()	
					
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next
				
				If giverestrictionfreecell
				 updatedescription()
				EndIf
					
				'updateshadow()
				
				EndMethod
	Method createshadow()				
				'createshadowstripe()
				EndMethod
	Method updateshadow()				
				
				'updateshadowstripe()
				EndMethod
	Method updatedescription()
				Rem
				Local tsame
				Local tothe
				Local talte
				Local tdesc
				Local tasc
				Local tesuit
				Local tenumber
				If localrule
				 tsame=takesamesuit
				 tothe=takeothersuit
				 talte=takealteratecolor
				 tdesc=takedescending
				 tasc=takeascending
				 tesuit=takeemptysuit
				 tenumber=takeemptynumber
				Else
				 tsame=game.piletakesamesuit
				 tothe=game.piletakeothersuit
				 talte=game.piletakealteratecolor
				 tdesc=game.piletakedescending
				 tasc=game.piletakeascending
				 tesuit=game.piletakeemptysuit
				 tenumber=game.piletakeemptynumber
				EndIf		
				EndRem		
				Local d$=""
				If takedescending d=strpiletakedescending
				If takeascending d=strpiletakeascending
				If takeboth And takeascending=False And takedescending=False 
				 d=strpiletakeboth
				EndIf
				If takealteratecolor d:+strpiletakealteratecolor
				If takesamesuit d:+strpiletakesamesuit
				If takeothersuit d:+strpiletakeothersuit
				'If takealteratecolor=False And takesamesuit=False And takeothersuit=False And d<>"" d:+strpileplace
				If d<>"" d:+strpileplace
				If takewrapped
				 If takeboth 
				  d:+strpiletakewrapped 
				 Else 
				  If takedescending d:+strpiletakewrappeddescending
				  If takeascending d:+strpiletakewrappedascending
				 EndIf
				EndIf
				If takerestriction d:+strpiletakerestriction
				If takemaximal<>-1 
				 If takemaximal=1
				  d:+strpiletakemaximalsingular
				 Else
				  d:+strpiletakemaximalplural0+takemaximal+strpiletakemaximalplural1
				 EndIf
				EndIf
				description0=d
				
				description1=""
				If giverestrictionfreecell 
				 Local cf=1
				 If game.hasfreecells() cf:+game.countfreefreecells()
				 description1:+strpilefreecellpickrestriction0+cf+strpilefreecellpickrestriction1
				EndIf
				EndMethod									
	Method save(s:TStream)
				WriteLine(s,"_piletableau")
				WriteLine(s,savename)
				savepile(s)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				'Print "loadpile count"+cardlist.count()				
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod						
	EndType
'******************************************************************************************************************
'										P I L E C R U E L 
'******************************************************************************************************************
Type _pilecruel Extends _piletableau
	'Field tableau:_tableau=Null
	'Field linktableau:TLink=Null
	Method New()
				EndMethod
	Method Delete()
				EndMethod	
	Method init(t:_tableau,px#,py#)
				initpile(t.game,px,py)
				tableau=t
				linktableau=tableau.pilelist.addlast(Self)
				name=strpiletableau
				'createshadow()
				drawownshadow=False
				takeemptyrestriction=True
				givemaximal=1
				EndMethod	
				
	Method canpick:Int(c:_card)
				'only first card can be picked up
				If giverestriction Return(False)
				If c.pilelink.prevlink()=Null Return(True)
				Return(False)
				EndMethod	
				
	Method candrop:Int(list:TList,samesuit:Int=False)
				'only one card of same suit an right order
				If takerestriction Return(False)
				If list.count()<>1 Return(False)
				Local c:_card=_card(list.firstlink().value())
				If c
				 If cardlist.count()=0
				  If takeemptyrestriction Return(False) Else Return(True)
				 Else
				  Local cf:_card=_card(cardlist.firstlink().value())
				  If cf.suit<>c.suit Return(False)	
				  If takeascending If (c.number=(cf.number+1)) Return(True)
				  If takedescending If (c.number=(cf.number-1)) Return(True)
				  If takeboth If Abs(c.number-cf.number)=1 Return(True)
				  If takewrapped
				   If c.number=12 And cf.number=0 Return(True)
				   If c.number=0 And cf.number=12 Return(True)
				  EndIf
				
				 EndIf
				EndIf
				Return(False)
				EndMethod	
	Method dropvy:_vector3()
				Local v:_vector3=New _vector3
				v.set(0,game.cardheight,0)
				Return(v)
				EndMethod		
	Method dropposition:_vector3(backdrop=False)
				Local v:_vector3=New _vector3
				v.copy(position)
				v.z:-game.solitaire.cardtableaulift
				v.z:-game.solitaire.cardthickness*Float(cardlist.count())
				Return(v)
				EndMethod								
	Method adjustcardposition()
				If game.activepreparation()=False
				 Local back=True
				 Local t#=game.solitaire.cardthickness
				 positionfirst.copy(position)
				 positionfirstunstretched.copy(position)
				 Local it:TLink=cardlist.lastlink()
				 If it
				  Repeat
				   Local cit:_card=_card(it.value())
				   Local tu=cit.turnedup()
				   If back=True And tu=True
				    back=False
				    positionfirst.z:-game.solitaire.cardtableaulift
				    positionfirstunstretched.z:-game.solitaire.cardtableaulift
				   EndIf
				   If cit.curving=False And cit.picked=False
				    cit.position.copy(positionfirst)
				   EndIf
				   If cit.curving=True And cit.picked=False
				    cit.curveposition.o1.copy(positionfirst)
				    cit.curveposition.updatelength()
				   EndIf
				   positionfirst.z:-t
				   positionfirstunstretched.z:-t
				   it=it.prevlink()
				  Until it=Null
				 EndIf
				EndIf
				EndMethod					
	Method animate(c:_clock)
				animateinput()
				adjustcardposition()					
				adjustcardvx()
				adjustcardvy()
				Local i=0
				For Local cit:_card=EachIn cardlist
				 If i>0 cit.neigungx=0
				 cit.animate()
				 i:+1
				Next
				animatepileinfo()				
				updateshadow()
				'updatedescription()
				EndMethod	
	Method createshadow()				
				'createshadowblock()
				EndMethod
	Method updateshadow()				
				'updateshadowblock()
				EndMethod
	Method save(s:TStream)
				WriteLine(s,"_pilecruel")
				WriteLine(s,savename)
				savepile(s)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod				
	EndType					
'******************************************************************************************************************
'										P I L E A C E S U P 
'******************************************************************************************************************
Type _pileacesup Extends _piletableau
	'Field tableau:_tableau=Null
	'Field linktableau:TLink=Null
	Method New()
				EndMethod
	Method Delete()
				EndMethod	
	Method canpick:Int(c:_card)
				'only first card can be picked up
				If giverestriction Return(False)
				If c.pilelink.prevlink()=Null 
				 Return(True)
				EndIf
				Return(False)
				EndMethod	
	Method candrop:Int(list:TList,samesuit:Int=False)
				If cardlist.count()>0
				 Return(False)
				Else
				 If list.count()=1 Return(True)
				EndIf
				Return(False)
				EndMethod	
	Method animate(c:_clock)
				'set the stretch dependent To the intersection
				adjustcardposition()
				If game.animationlist.firstlink()=Null adjustcardvy()
				adjustcardvx()
				If game.statsclosed=False 
				 If cardlist.count()=1
				  Local c:_card=_card(cardlist.firstlink().value())
				  If c.number=0 game.discards:+1
				 EndIf
				EndIf
				If game.activepreparation()=False
				 

				 Local cam:_camera=game.solitaire.cam
				 Local poy#=position.y
				 Local poz#=positionfirstunstretched.z
				 Local pvy#=positionfirstunstretched.y-position.y
				 Local pvz#=0
				 Local oy#=cam.position.y
				 Local oz#=cam.position.z
				 Local vy#=cam.view.y-cam.up.y
				 Local vz#=cam.view.z-cam.up.z
				 If Abs(pvy)>nearzero
				  Local D#=determine2(vy,vz,-pvy,-pvz)
				  If Abs(D)>nearzero
				   Local ey#=poy-oy
				   Local ez#=poz-oz
				   Local alpha#=determine2(vy,vz,ey,ez)/D
				   If alpha<=1
				    'nun stretch anpassen
				    stretch=alpha
				   'Print stretch
				   Else 
				    If stretch<1 stretch=1
				   EndIf
				  EndIf
				 Else
				  stretch=1
				 EndIf
				Else 
				 stretch=1
				EndIf
				animatestretch()
				animateinput()
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next
				
				animatepileinfo()	
				updateshadow()
							
				EndMethod			
	Method createshadow()				
				'createshadowstripe()
				EndMethod
	Method updateshadow()				
				'updateshadowstripe()
				EndMethod
							
	Method save(s:TStream)
				WriteLine(s,"_pileacesup")
				WriteLine(s,savename)
				savepile(s)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod				
	EndType		
'******************************************************************************************************************
'										P I L E S T O C K 
'******************************************************************************************************************
Type _pilestock Extends _pile
	Field gamestocklink:TLink=Null
	Field towastecount=0
	Field topilecount=0
	Field tofoundationcount=0
	Field tolabyrinthcount=False
	Field tableaucount=-1
	Field verticalredeal=False
	Field status=0
	Field open=False
	Field backsort=False
	Field backsorttime#=0
	Field backsortintervall#=50'ms
	Field backsortakku#=0
	Field backsortpilewastecount=0
	Field backsortundo:_animationundo=Null
	Field wastepartner:Int=0
	Field wasteiteration=False
	Method New()
				EndMethod
	Method Delete()
				EndMethod	
	Method init(g:_game,px#,py#,tpc,twc,tfc,tlc)
				initpile(g,px,py)
				topilecount=tpc
				towastecount=twc
				tofoundationcount=tfc
				tolabyrinthcount=tlc
				gamestocklink=game.pilestocklist.addlast(Self)
				name=strpilestock
				'createshadow()
				drawownshadow=False
				EndMethod	
	Method waste:_pilewaste()
				Return(game.pilewaste(wastepartner))
				EndMethod	
	Method draw(gra:_graphics,cam:_camera)
				mesh.clearvertexlight()
	    		For Local lit:_light=EachIn game.solitaire.world.lightlist
				 mesh.determinevertexlight(lit)
				Next
				mesh.draw(gra,cam)
				If canredeal()=False
				 For Local pit:_polygon=EachIn meshsuit.polygonlist
				  pit.texture[0,0]=game.solitaire.tsymbolfine
				 Next
				 meshsuit.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  meshsuit.determinevertexlight(lit)
				 Next
				 meshsuit.draw(gra,cam)
				Else
				 If redealvalue<>-1
				  For Local pit:_polygon=EachIn meshsuit.polygonlist
				   pit.texture[0,0]=game.solitaire.tnumber[(redealvalue-redealcount)]
				  Next
				  meshsuit.clearvertexlight()
	    		  For Local lit:_light=EachIn game.solitaire.world.lightlist
				   meshsuit.determinevertexlight(lit)
				  Next
				  meshsuit.draw(gra,cam)
				 EndIf
				EndIf
				EndMethod					
	Method deal(clock:_clock)
				
				If(towastecount>0)
				 If waste()=Null Return'no waste, error
				 If(game.picklist.firstlink()=Null)
				  If cardlist.count()>0
				   If game.preview=False playsoundstretched(game.solitaire.sturn,0.8,0.95,1.05)
				
				   
				   'If pit
				    Local m:_animationundo=Null;
				    If cardlist.firstlink() m=game.createundo(20,0.1)
				    For Local cw=0 To towastecount-1
				     Local pit:_pile=waste()
				     If cardlist.firstlink()
				      Local c:_card=_card(cardlist.firstlink().value())
				      c.deinsertpile()
				      c.insertpile(pit,True)
				      Local v:_vector3=pit.dropposition()
	c.curvespeed=15
				      c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, -Float(cw)*7,0,-10,0,0,10)
				      If open c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, c.vx.x,c.vx.y,c.vx.z, 0,0,-10,0,0,10) Else c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, -c.vx.x,-c.vx.y,-c.vx.z, 0,0,-10,0,0,10)
				      c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z, 0,0,-10,0,0,0)
				      c.startcurve(clock)
					  m.use(c,pit,True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy) 
					  If wasteiteration
					   wastepartner:+1
					   If wastepartner>game.pilewastelist.count()-1 wastepartner=0
					  EndIf
				     EndIf
		 		    Next
		           'EndIf
				  Else 
				    Print "nocard"
				   If(nocardcurving() And nocardcurvinginwaste() And backsort=False)
				    Print "candeal"
				    If canredeal()
				     Print "DEAL"+redealcount
				     redealcount:+1
				     If game.preview=False playsoundstretched(game.solitaire.smove,0.8,0.95,1.05)
				
				     backsort=True
				     backsortundo=game.createundo(30,30)
					 backsortundo.redealdelta=-1
					 backsortundo.redealpile=Self
				     backsorttime=clock.ms()
				     backsortpilewastecount=cardcountwastes();'waste().cardlist.count()
				    EndIf
				   EndIf
				  EndIf
			 	 EndIf
				EndIf


				If(topilecount>0)
				 'If game.tableau.emptypile() Return'no deal if any pile is empty
				 If(game.picklist.firstlink()=Null)
				  Local m:_animationundo=Null;
				  If cardlist.firstlink() m=game.createundo(25,0.1)
				  For Local pit:_pile=EachIn game.tableau.pilelist
				   For Local c=0 To topilecount-1
				    If cardlist.firstlink()
				     Local c:_card=_card(cardlist.firstlink().value())
				     c.deinsertpile()
				     Local v:_vector3=pit.dropposition()
				     Local vvx:_vector3=pit.dropvx()
				     Local vvy:_vector3=pit.dropvy()
				     c.insertpile(pit,True)
				     c.curvespeed=25
				     c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-20,0,0,20)
				     c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, vvx.x,vvx.y,vvx.z, 0,0,-10,0,0,10)
				     c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, vvy.x,vvy.y,vvy.z, 0,0,0,0,0,0)
				     c.startcurve(clock)
				 	 m.use(c,pit,True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy) 
				     pit.setangle(c)
				    EndIf
				   Next
		 		  Next
			 	 EndIf
			     If tableaucount<>-1
			      tableaucount:-1
				  
				  If tableaucount=0
				   tableaucount=-1
			       topilecount=0
			 	   towastecount=1
			  	   
				  EndIf
				  updatedescription()
				 EndIf
				EndIf
				
				
				If(tofoundationcount>0)
				 If(game.picklist.firstlink()=Null)
				  Local m:_animationundo=Null;
				  If cardlist.firstlink() m=game.createundo(25,0.1)
				  If game.preview=False playsoundstretched(game.solitaire.sturn,0.8,0.95,1.05)

				  For Local pit:_pile=EachIn game.pilefoundationlist
				   For Local c=0 To tofoundationcount-1
				    If cardlist.firstlink()
				     Local c:_card=_card(cardlist.firstlink().value())
				     c.deinsertpile()
				     Local v:_vector3=pit.dropposition()
				     c.insertpile(pit,True)
				     c.curvespeed=25
				     c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-20,0,0,20)
				     c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, -c.vx.x,-c.vx.y,-c.vx.z, 0,0,-10,0,0,10)
				     c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z, 0,0,0,0,0,0)
				     c.startcurve(clock)
				 	 m.use(c,pit,True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy) 
				    EndIf
				   Next
		 		  Next
			 	 EndIf
				EndIf
				
				If tolabyrinthcount
				 If(game.picklist.firstlink()=Null)
				  Local m:_animationundo=Null;
				  If cardlist.firstlink() m=game.createundo(25,0.1)
				  For Local lit:_pilelabyrinth=EachIn game.pilelabyrinthlist
				   If lit.hasfreeline()
				    Local ll=lit.freeline()
  				    For Local i=0 To lit.dimx-1	 
				     If cardlist.firstlink()
				      Local c:_card=_card(cardlist.firstlink().value())
				      c.deinsertpile()
				      Local v:_vector3=lit.droppositionat(i,ll)
				      c.insertpile(lit,True)
				 	  c.insertlabyrinth(lit,i,ll)
		 			  c.curvespeed=25
				      c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-20,0,0,20)
				      c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, -c.vx.x,-c.vx.y,-c.vx.z, 0,0,-10,0,0,10)
				      v=lit.dropvy()
				      c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, v.x,v.y,v.z, 0,0,0,0,0,0)
				      c.startcurve(clock)
				  	  m.use(c,lit,True,c.labindex[0],c.labindex[1],0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy) 
				     EndIf
				    Next
				   EndIf
				  Next
				 EndIf								 
				EndIf
				
				
				updatedescription()
				EndMethod				
	Method canpick:Int(c:_card)
				Return(False)
				EndMethod
	Method candrop:Int(list:TList,samesuit:Int=False)
				Return(False)
				EndMethod
	Method candeal:Int()
				Return(nocardcurving())' And nocardcurvinginwaste())
				EndMethod
	Method canredeal:Int()				
				If redealvalue=-1 
				 Return(True)
				Else
				 If redealcount<redealvalue
				  Return(True)
				 EndIf
				EndIf
				Return(False)
				EndMethod
	Method cardcountinwaste:Int()
				Local i=0
				If wasteiteration=False			
				 Local pw:_pilewaste=waste()
				 If pw
				  For Local c:_card=EachIn pw.cardlist
				   i:+1
				  Next
				 EndIf
				Else
				 For Local pwit:_pilewaste=EachIn game.pilewastelist
				  For Local c:_card=EachIn pwit.cardlist
				   i:+1
				  Next
				 Next
				EndIf
				Return(i)
				EndMethod				
	Method nocardcurvinginwaste:Int()	
				If wasteiteration=False			
				 Local pw:_pilewaste=waste()
				 If pw
				  For Local c:_card=EachIn pw.cardlist
				   If c.curving Return(False)
				  Next
				 EndIf
				Else
				 For Local pwit:_pilewaste=EachIn game.pilewastelist
				  For Local c:_card=EachIn pwit.cardlist
				   If c.curving Return(False)
				  Next
				 Next
				EndIf
				Return(True)
				EndMethod
	Method cardcountwastes:Int()
				Local i=0
				For Local pit:_pilewaste=EachIn game.pilewastelist
				 i:+pit.cardlist.count()
				Next
				Return(i);
				EndMethod
	Method animate(clock:_clock)
	  			
				Local nt#=clock.ms()
				Local dt#=nt-backsorttime
				backsorttime=nt
			    
				If game.animationlist.firstlink()=Null 
				 If backsort=False
				  Local mx#=game.solitaire.mouse.x'MouseX()
				  Local my#=game.solitaire.mouse.y'MouseY()
				 
				  If inner() And game.allowpick And game.solitaire.guisystem.mouseovergui()=False And game.picklist.count()=0
				   If game.solitaire.mousebutton[0] Or game.solitaire.mousebutton[1]
				    If status=0
				     status=1
				     If candeal() 
				      deal(clock)
				      game.startusing()
				     EndIf
				    EndIf
				   EndIf
				  EndIf
				  If game.solitaire.mousebutton[0]=False And game.solitaire.mousebutton[1]=False
				   status=0
				  EndIf
				 Else
  			      If waste()
				   backsortakku:+dt
				   While(backsortakku>=backsortintervall)
				    backsortakku:-backsortintervall
				
				
					Local source:_pilewaste=Null
					Local clink:TLink=Null
					Local wlink:TLink=game.pilewastelist.firstlink()
					If wasteiteration 
					 If wlink
					  Repeat
					   clink=_pilewaste(wlink.value()).cardlist.firstlink()
					   If clink source=_pilewaste(wlink.value())
					   wlink=wlink.nextlink()
					  Until clink Or wlink=Null
					 EndIf
					Else
					 clink=waste().cardlist.firstlink();
					 source=waste();
					EndIf					
				
				
				
				    If clink And source

				     Local c:_card=_card(clink.value())
				     c.deinsertpile()
				     c.insertpile(Self,True)
				     Local v:_vector3=dropposition()
				     c.curvespeed=20
				     Local fs#=(1*Float(backsortpilewastecount-cardcountwastes()))
				     c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-10-fs,0,0,10+fs)
				     If verticalredeal
				      c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, -c.vx.x,-c.vx.y,-c.vx.z, 0,0,-10,0,0,10)
				      c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z, 0,0,10,0,0,-10)
				     Else
				      If open c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, c.vx.x,c.vx.y,c.vx.z, 0,0,-10,0,0,10) Else c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, -c.vx.x,-c.vx.y,-c.vx.z, 0,0,-10,0,0,10)
				      c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z, 0,0,-10,0,0,0)
				     EndIf
				     c.startcurve(clock)
					 If backsortundo
					  backsortundo.use(c,Self,True,0,0,0,source,True,0,0,0,c.curveposition,c.curvevx,c.curvevy)
					 EndIf
					
					
				    Else
			 		 backsort=False
					 backsortundo=Null
		 		    EndIf
		
		
		
				   'Print "fff"+game.pilewaste.cardlist.count()
				   Wend
				  EndIf
				 EndIf
				EndIf
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next	
				animatetableaufill()
				adjustcardposition()			
				animatepileinfo()				
				'updateshadow()
				
				EndMethod	
	Method createshadow()				
				'createshadowblock()
				EndMethod
	Method updateshadow()				
				'updateshadowblock()
				EndMethod
									
	Method updatedescription()
				Local d$=""
				If towastecount 
				 If towastecount=1
				  d=strstockdealsingular+strstockdealtowaste
				 Else
				  d=strstockdeal0+towastecount+strstockdeal1+strstockdealtowaste
				 EndIf
				EndIf

				If topilecount 
				 If topilecount=1
				  d=strstockdealsingular+strstockdealtotableau
				 Else
				  d=strstockdeal0+topilecount+strstockdeal1+strstockdealtotableau
				 EndIf
				EndIf
				
				If tofoundationcount 
				 If tofoundationcount=1
				  d=strstockdealsingular+strstockdealtofoundation
				 Else
				  d=strstockdeal0+tofoundationcount+strstockdeal1+strstockdealtofoundation
				 EndIf
				EndIf
				
				If tolabyrinthcount 
				 If tolabyrinthcount=1
				  d=strstockdealsingular+strstockdealtolabyrinth
				 Else
				  d=strstockdeal0+tolabyrinthcount+strstockdeal1+strstockdealtolabyrinth
				 EndIf
				EndIf
				
				If tableaucount>0
				 d:+strstockswitch0+tableaucount+strstockswitch1
				EndIf
				description0=d
				
				
				
				
				d=""
				If tableaucount>0
				 d:+strstockswitch2
				EndIf
				If topilecount=0 Or tableaucount>0
				 If redealvalue=-1
				  d:+strstockendless
				 Else
				  Local dd=redealvalue-redealcount
				  If dd>0
				   d:+strstockredeal0+dd+strstockredeal1
				  Else
				   d:+strstockend
				  EndIf
				 EndIf
				EndIf
				description1=d

				EndMethod						
	Method save(s:TStream)
				WriteLine(s,"_pilestock")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,towastecount)
				WriteInt(s,topilecount)
				WriteInt(s,tofoundationcount)
				WriteInt(s,tolabyrinthcount)
				WriteInt(s,tableaucount)
				WriteInt(s,verticalredeal)
				WriteInt(s,status)
				WriteInt(s,open)
				WriteInt(s,backsort)
				WriteInt(s,backsortpilewastecount)
				WriteFloat(s,backsorttime)
				WriteFloat(s,backsortintervall)
				WriteFloat(s,backsortakku)
				savepointer(s,backsortundo)
				WriteInt(s,wastepartner)
				WriteInt(s,wasteiteration)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				towastecount=ReadInt(s)
				topilecount=ReadInt(s)
				tofoundationcount=ReadInt(s)
				tolabyrinthcount=ReadInt(s)
				tableaucount=ReadInt(s)
				verticalredeal=ReadInt(s)
				status=ReadInt(s)
				open=ReadInt(s)
				backsort=ReadInt(s)
				backsortpilewastecount=ReadFloat(s)
				backsorttime=ReadFloat(s)
				backsortintervall=ReadFloat(s)
				backsortakku=ReadFloat(s)
				loadpointer(s)
				wastepartner=ReadInt(s)
				wasteiteration=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 backsortundo=_animationundo(associatepointer())
				 releasepointer()
				EndIf
				EndMethod							

	EndType
	
'******************************************************************************************************************
'										P I L E S T O C K P Y R A M I D 
'******************************************************************************************************************
Type _pilestockpyramid Extends _pilestock
	Method New()
				EndMethod
	Method Delete()
				EndMethod	
	Method deal(clock:_clock)
				If(towastecount>0)
				 If waste()=Null Return'no waste, error
				 If(game.picklist.firstlink()=Null)
				  If cardlist.count()>0
				   Local pit:_pile=waste()
				   If pit
				    If game.preview=False playsoundstretched(game.solitaire.sturn,0.8,0.95,1.05)
				    Local m:_animationundo=Null;
				    If cardlist.firstlink() m=game.createundo(20,0.1)
				    For Local cw=0 To towastecount-1
				     If cardlist.firstlink()
				      Local c:_card=_card(cardlist.firstlink().value())
				      Local targetpile:_pile=pit
					  If c.number=12 targetpile=game.getpilediscardminimum()
				      c.deinsertpile()
				      c.insertpile(targetpile,True)
				      Local v:_vector3=targetpile.dropposition()
      				  c.curvespeed=20
				      c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, -Float(cw)*7,0,-10,0,0,10)
				      c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, c.vx.x,c.vx.y,c.vx.z, 0,0,-10,0,0,10) 
				      c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z, 0,0,-10,0,0,0)
				      c.startcurve(clock)
					  m.use(c,targetpile,True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy) 
				     EndIf
		 		    Next
		           EndIf
				  Else 
				   If(nocardcurving() And nocardcurvinginwaste() And backsort=False)
				    If canredeal()
				     redealcount:+1
				     If game.preview=False playsoundstretched(game.solitaire.smove,0.8,0.95,1.05)
				     backsort=True
				     backsortundo=game.createundo(30,30)
				     backsortundo.redealdelta=-1
					 backsortundo.redealpile=Self
				     backsorttime=clock.ms()
				     backsortpilewastecount=waste().cardlist.count()
				    EndIf
				   EndIf
				  EndIf
			 	 EndIf
				EndIf
				EndMethod				
	Method canpick:Int(c:_card)
				Return(False)
				EndMethod
	Method pick(c:_card)
				If c.number=12
				 c.discard()
				 Local u:_animationundo=game.createundo(20,20)
				 u.use(c,game.getpilediscardminimum(),True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy)
				 c.deinsertpyramid()
				EndIf
				EndMethod						
	Method pickextern(c:_card,l:TList)'picks the card c to the external list
				'concrete piles can override this function
				If c.number=12 l.addlast(c)
				EndMethod
				
	Method candrop:Int(list:TList,samesuit:Int=False)
				If takerestriction Return(False)
				If list.count()=1
				 Local it:TLink=list.firstlink()
				 Local pc:_card=_card(it.value())
				 Local itc:TLink=cardlist.firstlink()
				 If itc
				  Local cit:_card=_card(itc.value())
				  If cit.inner()
				   If cit.child[0]=Null And cit.child[1]=Null
				    If ((pc.number+1)+(cit.number+1))=13
				     Return(True)
				    EndIf
				   EndIf
				  EndIf
				 EndIf
				EndIf
				Return(False)
				EndMethod
	Method drop(clock:_clock)
				'drop the picklist to the discardpile and record the moves
				If cardlist.firstlink() And game.picklist.firstlink()
				 Local dropcard:_card=_card(cardlist.firstlink().value())
				 Local m:_animationundo=game.createundo(30,0.1,True)
				 'move the targetdropcard "dropcard" to the discardpile
				 Local vn:_vector3=New _vector3
				 Local vyy:_vector3=New _vector3
				 Local vtp:_vector3=New _vector3
				 Local vtn:_vector3=New _vector3
				 Local pd:_pilediscard=game.getpilediscardminimum()
				 vtp.set(0,0,5)
				 vtn.set(0,0,-5)
				 vn.set(0,0,0)
				 vyy.set(0,game.cardheight,0)
				 dropcard.curvespeed=40
				 dropcard.curvevx.setvector(dropcard.vx,dropcard.vx,vn,vn)
				 dropcard.curvevy.setvector(dropcard.vy,vyy,vn,vn)
				 dropcard.curveposition.setvector(dropcard.position,pd.dropposition(),vtn,vtp)
				 dropcard.startcurve(game.solitaire.clock)
				 dropcard.deinsertpile()
				 dropcard.insertpile(pd,True)
				 m.use(dropcard,pd,True,0,0,0,Self,True,0,0,0,dropcard.curveposition,dropcard.curvevx,dropcard.curvevy)
				 dropcard.deinsertpyramid()
				 'move the picked card to the discardpile
				 Local i#=0
				 Local c:_card=_card(game.picklist.firstlink().value())
				 Local pilefrom:_pile=c.pile
				 c.deinsertpick()
				 c.deinsertpile()
				 Local v:_vector3=New _vector3
				 Local dvx:_vector3=dropvx()
				 Local dvy:_vector3=dropvy()
				 c.curvespeed=30
			 	 c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,0 ,0,0,0)  
			 	 c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,0 ,0,0,0)  
			     v.copy(pd.dropposition())
				 c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-3,0,0,0)
			     c.startcurve(clock)
			     'undo record move
			     Local cupo:_hermitecurve=New _hermitecurve
			     Local cuvx:_hermitecurve=New _hermitecurve
			     Local cuvy:_hermitecurve=New _hermitecurve
			     cupo.o0.copy(c.pickposition)
			     cupo.v0.set(0,0,-10)
			 	 cupo.o1.copy(c.curveposition.o1)
			 	 cupo.v1.set(0,0,+10)
			     cupo.updatelength()
				 cuvx.o0.copy(c.pickvx)
				 cuvx.v0.set(0,0,0)
				 cuvx.o1.copy(c.curvevx.o1)
				 cuvx.v1.set(0,0,0)
			     cuvx.updatelength()
				 cuvy.o0.copy(c.pickvy)
				 cuvy.v0.set(0,0,0)
				 cuvy.o1.copy(c.curvevy.o1)
				 cuvy.v1.set(0,0,0)
			     cuvy.updatelength()
				 m.use(c,pd,True,0,0,0,pilefrom,True,0,0,0,cupo,cuvx,cuvy)
				 'end undo record move
				 c.deinsertpyramid()
				 c.insertpile(pd,True)
				EndIf
				EndMethod
	Method animate(clock:_clock)
				Local nt#=clock.ms()
				Local dt#=nt-backsorttime
				backsorttime=nt
				If game.animationlist.firstlink()=Null

				 If backsort=False
				  If inner()
				   If game.solitaire.mousebutton[0] Or game.solitaire.mousebutton[1] And game.allowpick And game.solitaire.guisystem.mouseovergui()=False And game.picklist.count()=0

				    If status=0
				     status=1
				     If candeal() 
				      deal(clock)
				      game.startusing()
				     EndIf
				    EndIf
				   EndIf
				  EndIf
				  If game.solitaire.mousebutton[0]=False And game.solitaire.mousebutton[1]=False
				   status=0
				  EndIf
				 Else
  			      If waste()
				   backsortakku:+dt
				   While(backsortakku>=backsortintervall)
				    backsortakku:-backsortintervall
				    If waste().cardlist.firstlink()
				     Local c:_card=_card(waste().cardlist.firstlink().value())
				     c.deinsertpile()
				     c.insertpile(Self,True)
				     Local v:_vector3=dropposition()
					 Local dvx:_vector3=dropvx()
					 Local dvy:_vector3=dropvy()
				     c.curvespeed=20
				     Local fs#=(1*Float(backsortpilewastecount-waste().cardlist.count()))
				     c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-10-fs,0,0,10+fs)
				     c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,-10,0,0,10) 
				     c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,-10,0,0,0)
				     c.startcurve(clock)
					 If backsortundo
					  backsortundo.use(c,Self,True,0,0,0,waste(),True,0,0,0,c.curveposition,c.curvevx,c.curvevy)
					 EndIf
				    Else
			 		 backsort=False
					 backsortundo=Null
		 		    EndIf
				   'Print "fff"+game.pilewaste.cardlist.count()
				   Wend
				  EndIf
				 EndIf
				EndIf
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next	
				adjustcardposition()	
				adjustcardvx()		
				updatedescription()
				animatepileinfo()		
				updateshadow()
				EndMethod	
	Method createshadow()				
				'createshadowblock()
				EndMethod
	Method updateshadow()				
				'updateshadowblock()
				EndMethod
												
	Method save(s:TStream)
				WriteLine(s,"_pilestockpyramid")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,towastecount)
				WriteInt(s,topilecount)
				WriteInt(s,tofoundationcount)
				WriteInt(s,status)
				WriteInt(s,open)
				WriteInt(s,backsort)
				WriteInt(s,backsortpilewastecount)
				WriteFloat(s,backsorttime)
				WriteFloat(s,backsortintervall)
				WriteFloat(s,backsortakku)
				savepointer(s,backsortundo)
				WriteInt(s,wastepartner)
				WriteInt(s,wasteiteration)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				towastecount=ReadInt(s)
				topilecount=ReadInt(s)
				tofoundationcount=ReadInt(s)
				status=ReadInt(s)
				open=ReadInt(s)
				backsort=ReadInt(s)
				backsortpilewastecount=ReadFloat(s)
				backsorttime=ReadFloat(s)
				backsortintervall=ReadFloat(s)
				backsortakku=ReadFloat(s)
				loadpointer(s)
				wastepartner=ReadInt(s)
				wasteiteration=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 backsortundo=_animationundo(associatepointer())
				 releasepointer()
				EndIf
				EndMethod				
	EndType	
'******************************************************************************************************************
'										P I L E R E D E A L
'******************************************************************************************************************
Type _pileredeal Extends _pile
	Field gameredeallink:TLink=Null
	Field topilecount=4
	Field blanketmode=False
	Field shuffle=False
	Field status=0
	Field frontsort=False
	Field waitsort=False
	Field backsort=False
	Field shufflewait=False
	Field shufflewaitnormal=False
	Field shufflewait2=False
	Field shufflesort=False
	Field shufflesortnormal=False
	Field shufflecount=100
	Field backsorttime#=0
	Field backsortintervall#=30'ms
	Field backsortakku#=0
	Field backsortundo:_animationundo=Null
	Method New()
				EndMethod
	Method Delete()
				EndMethod	
	Method init(g:_game,px#,py#,tpc)
				topilecount=tpc
				initpile(g,px,py)
				gameredeallink=game.pileredeallist.addlast(Self)
				name=strpileredeal
				'createshadow()
				drawownshadow=False
				
				EndMethod	
				Rem	
	Method draw(gra:_graphics,cam:_camera)
				mesh.clearvertexlight()
	    		For Local lit:_light=EachIn game.solitaire.world.lightlist
				 mesh.determinevertexlight(lit)
				Next
				mesh.draw(gra,cam)

				Local r=False
				If game.redealvalue=-1 
				 r=True
				Else
				 If game.redealcount<game.redealvalue
				  r=True
				 EndIf
				EndIf
				If r=False
				 For Local pit:_polygon=EachIn meshsuit.polygonlist
				  pit.texture[0,0]=game.solitaire.tsymbolfine
				 Next
				 meshsuit.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  meshsuit.determinevertexlight(lit)
				 Next
				 meshsuit.draw(gra,cam)
				EndIf
				EndMethod
				EndRem
				
	Method draw(gra:_graphics,cam:_camera)
				mesh.clearvertexlight()
	    		For Local lit:_light=EachIn game.solitaire.world.lightlist
				 mesh.determinevertexlight(lit)
				Next
				mesh.draw(gra,cam)
				If canredeal()=False
				 For Local pit:_polygon=EachIn meshsuit.polygonlist
				  pit.texture[0,0]=game.solitaire.tsymbolfine
				 Next
				 meshsuit.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  meshsuit.determinevertexlight(lit)
				 Next
				 meshsuit.draw(gra,cam)
				Else
				 If redealvalue<>-1
				  For Local pit:_polygon=EachIn meshsuit.polygonlist
				   pit.texture[0,0]=game.solitaire.tnumber[(redealvalue-redealcount)]
				  Next
				  meshsuit.clearvertexlight()
	    		  For Local lit:_light=EachIn game.solitaire.world.lightlist
				   meshsuit.determinevertexlight(lit)
				  Next
				  meshsuit.draw(gra,cam)
				 EndIf
				EndIf
				EndMethod					
				
									
	Method canpick:Int(c:_card)
				Return(False)
				EndMethod
	Method candrop:Int(list:TList,samesuit:Int=False)
				Return(False)
				EndMethod
	Method canredeal:Int()				
				If redealvalue=-1 
				 Return(True)
				' Return(nocardcurving() And nocardcurvingintableau() And game.picklist.count()=0)
				Else
				 If redealcount<redealvalue
				  Return(True);
				 ' Return(nocardcurving() And nocardcurvingintableau() And game.picklist.count()=0)
				 EndIf
				EndIf
				Return(False)
				EndMethod
	Method nocardcurvingintableau:Int()
				Local t:_tableau=game.tableau
				If t
				 For Local pit:_piletableau=EachIn t.pilelist
				  If pit.nocardcurving()=False Return(False)
				 Next
				EndIf
				Return(True)
				EndMethod
	Method nocardcurvinginwaste:Int()				
				For Local pw:_pilewaste=EachIn game.pilewastelist
				 For Local c:_card=EachIn pw.cardlist
				  If c.curving Return(False)
				 Next
				Next
				Return(True)
				EndMethod
	Method redeal()
				redealcount:+1
				backsort=True
				backsortundo=game.createundo(30,30)
				backsortundo.redealdelta=-1
				backsortundo.redealpile=Self
				backsorttime=game.solitaire.clock.ms()				
				EndMethod				
	Method ready:Int()
				If((backsort=False)And(frontsort=False)And(waitsort=False)And(shufflesort=False)And(shufflesortnormal=False)And(shufflewaitnormal=False)And(shufflewait=False)And(shufflewait2=False)) Return(True); Else Return(False);
				EndMethod
	Method animate(clock:_clock)
				Local nt#=clock.ms()
				Local dt#=nt-backsorttime
				Local v:_vector3=New _vector3
				backsorttime=nt
				If game.animationlist.firstlink()=Null 
				 If ready()
				  If game.solitaire.mousebutton[0] Or game.solitaire.mousebutton[1]
				   If inner() And game.solitaire.guisystem.mouseovergui()=False And game.allowpick And nocardcurving() And nocardcurvingintableau() And game.picklist.count()=0
				    If status=0
				     status=1
				     If canredeal() 
				      game.startusing()
				      redeal()
					 EndIf
				    EndIf
				   EndIf
				  EndIf
				  If game.solitaire.mousebutton[1]=False
				   status=0
				  EndIf
				 Else

				  If frontsort
				   'alle karten wieder zu dem tableau schieben
				   backsortakku:+dt
				   While(backsortakku>=backsortintervall)
				    backsortakku:-backsortintervall
					Local pile:_piletableau=Null

				    For Local pit:_piletableau=EachIn game.tableau.pilelist
				     If pit.cardlist.count()<topilecount
				 	  If pile=Null pile=pit
				     EndIf
				    Next
					
				    If pile And cardlist.firstlink()
				     Local c:_card=_card(cardlist.firstlink().value())
				     c.deinsertpile()
				     Local v:_vector3=pile.dropposition()
				     c.insertpile(pile,True)
				     c.curvespeed=30'vorher 40
				    'Print "curve mit speed 1"
				     Local fs#=1'(1*Float(backsortpilewastecount-game.pilewaste.cardlist.count()))
				     c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-10-fs,0,0,10+fs)
				     c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, -c.vx.x,-c.vx.y,-c.vx.z, 0,0,-10,0,0,10)
				     c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z, 0,0,-10,0,0,0)
				     c.startcurve(clock)
					 If backsortundo
					  backsortundo.use(c,pile,True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy)
				 	 EndIf
				    Else
			 	     frontsort=False
				     backsortundo=Null
		 		    EndIf
				   Wend
				  EndIf					

				  If shufflewait2
				   If nocardcurving()
				    cardlist.sort()
				    shufflewait2=False
				    frontsort=True
					backsortundo=game.createundo(30,30)
					backsorttime=clock.ms()
				   EndIf
				  EndIf

				  If shufflewaitnormal
				   If nocardcurving()
				    cardlist.sort()
				    shufflewaitnormal=False
				    frontsort=True
					backsortundo=game.createundo(30,30)
					backsorttime=clock.ms()
					' Print "shurtfflewaitnormal"
				   EndIf
				  EndIf



				  If shufflewait
				   If nocardcurving()
				    cardlist.sort()
				    'cardlist.reverse()
				    shufflewait2=True
				    shufflewait=False
					'jetz die asse sortieren, zunächst die asse anzeigern
					Local ass:_card[4]
					Local ai=0
					Local c=0
					For Local cit:_card=EachIn cardlist
					 If cit.number=0 
					  ass[ai]=cit
					  ai:+1
					 EndIf
					Next
					'zielindex innerhalb der pile.cardlist
					Local lit:TLink=game.tableau.pilelist.firstlink()
					Local ii=0
					Local pt:_piletableau=Null
					Local ziel[4]
					ziel[0]=ii
					pt=_piletableau(lit.value())
					ii:+(13-pt.cardlist.count())
					ziel[1]=ii
					lit=lit.nextlink()
					pt=_piletableau(lit.value())
					ii:+(13-pt.cardlist.count())
					ziel[2]=ii
					lit=lit.nextlink()
					pt=_piletableau(lit.value())
					ii:+(13-pt.cardlist.count())
					ziel[3]=ii
					'alle asse , die schon auf einem zielindex sind
					'null setzen und zielindex ungültig markieren (-1)
					For Local j=0 To 3
					 For Local k=0 To 3
					  If ass[j] If ass[j].index()=ziel[k] 
					   ass[j]=Null
					   ziel[k]=-1
					  EndIf
					 Next
					Next
					'nun alle noch nicht korrekt positionierten asse
					'auf einen der freien ziele bewegen
					For Local j=0 To 3 
					 If ass[j]
					  Local zk=-1
					  For Local k=0 To 3
					   If ziel[k]<>-1 zk=k
					  Next
					  If zk<>-1
					   'das ass[j] nun auf die card(ziel[zk]) bewegen
					   Local zi=ziel[zk]
					   ziel[zk]=-1
					   Local c1:_card=card(zi)
					   Local c0:_card=ass[j]
					   v.copy(c1.position)
				       c0.curvespeed=30
				       c0.curveposition.set(c0.position.x,c0.position.y,c0.position.z, v.x,v.y,v.z, 20,0,0,-20,0,0)
				       c0.curvevx.set(c0.vx.x,c0.vx.y,c0.vx.z, c0.vx.x,c0.vx.y,c0.vx.z, 0,0,-10,0,0,10)
				       c0.curvevy.set(c0.vy.x,c0.vy.y,c0.vy.z, c0.vy.x,c0.vy.y,c0.vy.z, 0,0,-10,0,0,0)
				       c0.startcurve(clock)
					   If backsortundo backsortundo.use(c0,Self,True,0,0,0,Self,True,0,0,0,c0.curveposition,c0.curvevx,c0.curvevy)
					   v.copy(c0.position)
				       c1.curvespeed=30
				       c1.curveposition.set(c1.position.x,c1.position.y,c1.position.z, v.x,v.y,v.z, 20,0,0,-20,0,0)
				       c1.curvevx.set(c1.vx.x,c1.vx.y,c1.vx.z, c1.vx.x,c1.vx.y,c1.vx.z, 0,0,-10,0,0,10)
				       c1.curvevy.set(c1.vy.x,c1.vy.y,c1.vy.z, c1.vy.x,c1.vy.y,c1.vy.z, 0,0,-10,0,0,0)
				       c1.startcurve(clock)
					   If backsortundo backsortundo.use(c1,Self,True,0,0,0,Self,True,0,0,0,c1.curveposition,c1.curvevx,c1.curvevy)
					  EndIf
					 EndIf
					Next
				   EndIf
				  EndIf

				  If shufflesort
				   backsortakku:+dt
				   While(backsortakku>=backsortintervall)
				    backsortakku:-backsortintervall
				    If shufflecount>0
				     'jetzt karten zufällig shufflen
					 Local co=cardlist.count()
					 If co>1
					  Local i0,i1
					  Local c0:_card
					  Local c1:_card
					  Repeat
					   i0=Rand(0,co-1)
					   i1=Rand(0,co-1)
					   c0=card(i0)
					   c1=card(i1)
					  Until i1<>i0 
					  If c0.curving=False And c1.curving=False
					   'tausche die Karten c0 und c1
					   v.copy(c1.position)
				       c0.curvespeed=30
				       c0.curveposition.set(c0.position.x,c0.position.y,c0.position.z, v.x,v.y,v.z, 20,0,0,-20,0,0)
				       c0.curvevx.set(c0.vx.x,c0.vx.y,c0.vx.z, c0.vx.x,c0.vx.y,c0.vx.z, 0,0,-10,0,0,10)
				       c0.curvevy.set(c0.vy.x,c0.vy.y,c0.vy.z, c0.vy.x,c0.vy.y,c0.vy.z, 0,0,-10,0,0,0)
				       c0.startcurve(clock)
					   If backsortundo backsortundo.use(c0,Self,True,0,0,0,Self,True,0,0,0,c0.curveposition,c0.curvevx,c0.curvevy)
					   v.copy(c0.position)
				       c1.curvespeed=30
				       c1.curveposition.set(c1.position.x,c1.position.y,c1.position.z, v.x,v.y,v.z, 20,0,0,-20,0,0)
				       c1.curvevx.set(c1.vx.x,c1.vx.y,c1.vx.z, c1.vx.x,c1.vx.y,c1.vx.z, 0,0,-10,0,0,10)
				       c1.curvevy.set(c1.vy.x,c1.vy.y,c1.vy.z, c1.vy.x,c1.vy.y,c1.vy.z, 0,0,-10,0,0,0)
				       c1.startcurve(clock)
					   If backsortundo backsortundo.use(c1,Self,True,0,0,0,Self,True,0,0,0,c1.curveposition,c1.curvevx,c1.curvevy)
					  EndIf
					 EndIf
				     shufflecount:-1
				    Else
				     shufflesort=False
				     shufflewait=True
				     backsortundo=Null
				    EndIf
				   Wend
				  EndIf


				  If shufflesortnormal
				   backsortakku:+dt
				   While(backsortakku>=backsortintervall)
				    backsortakku:-backsortintervall
				    If shufflecount>0
				    ' Print "shuflesortnormal"

				     'jetzt karten zufällig shufflen
					 Local co=cardlist.count()
					 If co>1
					  Local i0,i1
					  Local c0:_card
					  Local c1:_card
					  Repeat
					   i0=Rand(0,co-1)
					   i1=Rand(0,co-1)
					   c0=card(i0)
					   c1=card(i1)
					  Until i1<>i0 
					  If c0.curving=False And c1.curving=False
					   'tausche die Karten c0 und c1
					   v.copy(c1.position)
				       c0.curvespeed=30
				       c0.curveposition.set(c0.position.x,c0.position.y,c0.position.z, v.x,v.y,v.z, 20,0,0,-20,0,0)
				       c0.curvevx.set(c0.vx.x,c0.vx.y,c0.vx.z, c0.vx.x,c0.vx.y,c0.vx.z, 0,0,-10,0,0,10)
				       c0.curvevy.set(c0.vy.x,c0.vy.y,c0.vy.z, c0.vy.x,c0.vy.y,c0.vy.z, 0,0,-10,0,0,0)
				       c0.startcurve(clock)
					   If backsortundo backsortundo.use(c0,Self,True,0,0,0,Self,True,0,0,0,c0.curveposition,c0.curvevx,c0.curvevy)
					   v.copy(c0.position)
				       c1.curvespeed=30
				       c1.curveposition.set(c1.position.x,c1.position.y,c1.position.z, v.x,v.y,v.z, 20,0,0,-20,0,0)
				       c1.curvevx.set(c1.vx.x,c1.vx.y,c1.vx.z, c1.vx.x,c1.vx.y,c1.vx.z, 0,0,-10,0,0,10)
				       c1.curvevy.set(c1.vy.x,c1.vy.y,c1.vy.z, c1.vy.x,c1.vy.y,c1.vy.z, 0,0,-10,0,0,0)
				       c1.startcurve(clock)
					   If backsortundo backsortundo.use(c1,Self,True,0,0,0,Self,True,0,0,0,c1.curveposition,c1.curvevx,c1.curvevy)
					  EndIf
					 EndIf
				     shufflecount:-1
				    Else
				     shufflesortnormal=False
				     shufflewaitnormal=True
				     backsortundo=Null
				    EndIf
				   Wend
				  EndIf

					
				  If waitsort
				   If nocardcurving()
				    If blanketmode=False
					 
				     If shuffle=False 
				      frontsort=True
					  waitsort=False
					  cardlist.reverse();
				      backsortundo=game.createundo(30,30)
					  backsorttime=clock.ms()				
					 Else
					 ' Print "waitsort"
					  shufflesortnormal=True
					  shufflecount=cardlist.count()
					  waitsort=False
				      backsortundo=game.createundo(30,30)
					  backsorttime=clock.ms()				
					 EndIf
					
					
					Else
					 shufflesort=True
					 shufflecount=cardlist.count()
					 waitsort=False
				     backsortundo=game.createundo(30,30)
					 backsorttime=clock.ms()				
					EndIf
				   EndIf
				  EndIf
				
				  If backsort
				   'suck all cards from the tableau piles (in cruel from pilecruels) from behind
				   backsortakku:+dt
				   While(backsortakku>=backsortintervall)
				    backsortakku:-backsortintervall
				    Local it:TLink=Null
					If blanketmode=False
					 Local pit:TLink=game.tableau.pilelist.lastlink()
					 If pit
					  Repeat
					   Local p:_piletableau=_piletableau(pit.value())
				 	   If it=Null it=p.cardlist.firstlink()
				       pit=pit.prevlink()
				      Until pit=Null Or it
				     EndIf
					Else
					 Local pit:TLink=game.tableau.pilelist.lastlink()
					 If pit
					  Repeat
					   Local p:_piletableau=_piletableau(pit.value())
					   'es wird nun versucht, die rechteste Karte der Pile p zu holen
				 	   If it=Null 
				        Local xmax#=-1000
				        For Local cit:_card=EachIn p.cardlist
				   		 If xmax<cit.position.x 
				 		  xmax=cit.position.x
				          If blanketbacksort(cit) it=cit.pilelink
				         EndIf
				   	    Next
					   EndIf
				       pit=pit.prevlink()
				      Until pit=Null Or it
				     EndIf
					EndIf
				    If it
				     Local c:_card=_card(it.value())
					 Local from:_pile=c.pile
				     c.deinsertpile()
				     c.insertpile(Self,True)
				     Local v:_vector3=dropposition()
				     c.curvespeed=30
				     Local fs#=1'(1*Float(backsortpilewastecount-game.pilewaste.cardlist.count()))
				     c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-10-fs,0,0,10+fs)
				     c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, -c.vx.x,-c.vx.y,-c.vx.z, 0,0,-10,0,0,10)
				     c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z, 0,0,-10,0,0,0)
				     c.startcurve(clock)
					 If backsortundo
					  backsortundo.use(c,Self,True,0,0,0,from,True,0,0,0,c.curveposition,c.curvevx,c.curvevy)
				 	 EndIf
				    Else
			 	     backsort=False
			         waitsort=True
				     backsortundo=Null
		 		    EndIf
				   Wend
				  EndIf
				 EndIf
				EndIf
				
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next	
				'adjustcardposition()			
				'updatedescription()
				animatepileinfo()				
				'updateshadow()
				EndMethod	
	Method createshadow()				
				'createshadowblock()
				EndMethod
	Method updateshadow()				
				'updateshadowblock()
				EndMethod
				
	Method blanketbacksort:Int(c:_card)
				'c gehört zu einem pileblanket
				'es muss geprüft werden, ob in richtung links die Karten
				'dieselbe suit haben und eine absteigende nummerierung bis 2 haben
				'wenn ja, dann nicht rücksortieren.
				Local s=c.suit
				Local n=c.number
				Local pk:_pileblanket=_pileblanket(c.pile)
				Local tabx#=game.tabulatorx()				
				Local o:_vector3=New _vector3
				o.copy(c.position)
				o.x:-tabx
				Local cn:_card=pk.cardat(o)
				If cn=Null If c.number=1 Return(False) Else Return(True) 
				n:-1
				While(cn)
				 If cn.suit<>s Return(True)
				 If cn.number<>n Return(True)
				 o.x:-tabx
				 n:-1
				 cn=pk.cardat(o)
				Wend
				If n=0 Return(False)
				Return(True)
				EndMethod								
	Method updatedescription()
				Local d$=""
				If redealvalue=-1
				 d:+strredealendless
				Else
				 Local dd=redealvalue-redealcount
				 If dd>0
				  d:+strredealredeal0+dd+strredealredeal1
				 Else
				  d:+strredealend
				 EndIf
				EndIf
				description0=d
				description1=""
				EndMethod									
	Method save(s:TStream)
				WriteLine(s,"_pileredeal")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,topilecount)
				WriteInt(s,blanketmode)
				WriteInt(s,shuffle)
				WriteInt(s,status)
				WriteInt(s,frontsort)
				WriteInt(s,waitsort)
				WriteInt(s,backsort)
				WriteInt(s,shufflewait)
				WriteInt(s,shufflewaitnormal)
				WriteInt(s,shufflewait2)
				WriteInt(s,shufflesort)
				WriteInt(s,shufflesortnormal)
				WriteInt(s,shufflecount)
				WriteFloat(s,backsorttime)
				WriteFloat(s,backsortintervall)
				WriteFloat(s,backsortakku)
				savepointer(s,backsortundo)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				topilecount=ReadInt(s)
				blanketmode=ReadInt(s)
				shuffle=ReadInt(s)
				status=ReadInt(s)
				frontsort=ReadInt(s)
				waitsort=ReadInt(s)
				backsort=ReadInt(s)
				shufflewait=ReadInt(s)
				shufflewaitnormal=ReadInt(s)
				shufflewait2=ReadInt(s)
				shufflesort=ReadInt(s)
				shufflesortnormal=ReadInt(s)
				shufflecount=ReadInt(s)
				backsorttime=ReadFloat(s)
				backsortintervall=ReadFloat(s)
				backsortakku=ReadFloat(s)
				loadpointer(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 backsortundo=_animationundo(associatepointer())
				 releasepointer()
				EndIf
				EndMethod				

	EndType
'******************************************************************************************************************
'										P I L E D I S C A R D 
'******************************************************************************************************************
Type _pilediscard Extends _pile
	Field acesupmode=False
	Field pyramidmode=False
	Field gamediscardlink:TLink=Null
	
	Field effectsource:_particlesource=Null
	Field effectstatus:Int=0
	Field effecttimestart#=0
	Field effectgravity:_fielddivergence=Null
	
	Field cardcountactual:Int=0
	Field cardcountold:Int=0
	
	Method New()
				effectsource=New _particlesource
				effectsource.particlelist=Null'!
				effectsource.active=False
				effectsource.size=1
				effectsource.sizetolerance=0.5
				effectsource.vector.set(0,0,-0.1)
				effectsource.vectortolerance=0.7
				effectsource.lifetimeparticle=2700
				effectsource.lifetimeparticletolerance=0.1
				effectsource.rotation=0
				effectsource.rotationtolerance=0
				effectsource.opacity=1
				effectsource.gfieldforce=+1
				Local rs#=1
				effectsource.room[0].set(1.5*rs,0,0)
				effectsource.room[1].set(0,2.25*rs,0)
				effectsource.room[2].set(0,0,0.2*0.5)
				effectsource.drawadd=True
				effectsource.drawmul=False
				effectsource.drawalpha=False
  				effectsource.gfieldforcehomogen.set(0,0,-0.01)				
				effectsource.sinusopacity=True
				effectsource.sinusopacityrate=1
				effectsource.sinusopacityratedifference=0.3
				effectsource.sinusopacityratedifferencetolerance=0.2
				effectsource.scale=True
				effectsource.scalevalue=0.998				
				effectsource.axialdivergence=False

				effectsource.axialvector.set(0,0,-0.02)
				effectsource.fadeout=True
				effectsource.fadein=False
				effectsource.colorcurved=True
				effectsource.colorcurve.set(0,0,0,0  ,  0,0,1,0,  5,5,5,5, -1,0,-5,-5)

				' -----------------------life source------------------------
				effectsource.pqlife=New _particlesource
				effectsource.pqlife.particlelist=Null'!
				effectsource.pqlife.active=False
				effectsource.pqlife.vector.set(0,0,0)
				effectsource.pqlife.vectortolerance=0.8
				effectsource.pqlife.generationrate=50
				effectsource.pqlife.lifetimeparticle=1000
				effectsource.pqlife.lifetimeparticletolerance=0.01
				effectsource.pqlife.opacity=1
				effectsource.pqlife.position.set(0,0,0)
				effectsource.pqlife.room[0].set(0,0,0)
				effectsource.pqlife.room[1].set(0,0,0)
				effectsource.pqlife.room[2].set(0,0,0)
				effectsource.pqlife.drawadd=True
				effectsource.pqlife.drawmul=False
				effectsource.pqlife.drawalpha=False
				effectsource.pqlife.particlegenerationdensity=0.4
				effectsource.pqlife.gfieldforce=-8
				effectsource.pqlife.size=3'+Sin(solitaire.clock.ms()/5)*0.9
				effectsource.pqlife.colorcurved=True
				effectsource.pqlife.colorcurve.set(0.0,0.0,0.8,0.5  ,  0.8,0.2,0.05,0,  0,0,0,0, -3,-2,0,-4)				

				EndMethod
	Method Delete()
				EndMethod
	Method clear()
	   			Print "pile discard clear() call"
				effectsource.clear()
				effectsource=Null
				
				If effectgravity 
				 effectgravity.clear()
				 effectgravity=Null
				EndIf
				Super.clear()
				EndMethod								
	Method init(g:_game,px#,py#)
				initpile(g,px,py)
				gamediscardlink=g.pilediscardlist.addlast(Self)
				name=strpilediscard
				'createshadow()
				drawownshadow=False
				
				
				Local scale#=0.4'vorher 4
				Local m:_mesh
				Local m2:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=game.solitaire.tcoronawhite
				gg.position.set(-scale/2,-scale/2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(scale,0,0)
				gg.vy.set(0,scale,0)
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)

				'gg.texture[0,0]=game.solitaire.tfeuer3
				'm2=gg.Create()
				'm2.dynamicvertexlight=False
				'm2.blend(True)
				'm2.blendadditive(True)				

				effectsource.init(game.solitaire.world, game.solitaire.gra,game.solitaire.particlesourcegamelist,game.solitaire.particlegamelist,game.solitaire.clock)
				effectsource.insertmesh(m)
				'effectsource.insertmesh(m2)
				effectsource.particlegenerationpositionold.copy(position)
				effectsource.position.copy(position)
				effectsource.axialposition.copy(position)
				'effectsource.simplekollisionz=True
								
				effectsource.pqlife.init(game.solitaire.world, game.solitaire.gra,game.solitaire.particlesourcegamelist,game.solitaire.particlegamelist,game.solitaire.clock)
				effectsource.pqlife.rotation=Sin(game.solitaire.clock.ms()/10)*90'180+Sin(solitaire.clock.ms()/(50+Cos(solitaire.clock.ms()/20)*45))*360
				'effectsource.pqlife.simplekollisionz=True

				scale=0.35
				gg=New _geometrygrid
				gg.texture[0,0]=game.solitaire.tfeuer6
				gg.position.set(-scale/2,-scale/2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(scale,0,0)
				gg.vy.set(0,scale,0)
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				effectsource.pqlife.insertmesh(m)

				EndMethod	
	Method canpick:Int(c:_card)
				Return(False)
				EndMethod
	Method effect()
				effecttimestart=game.solitaire.clock.ms()
				effectstatus=1
				If effectgravity 
				 effectgravity.clear()
				 effectgravity=Null
				EndIf
				effectsource.particlegenerationpositionold.copy(position)
				effectsource.position.copy(position)
				EndMethod				
	Method animateeffect()
				cardcountactual=cardcount()
				Local t#=game.solitaire.clock.ms()
				If effectstatus>0
				 If effectstatus=4
				  If (t-effecttimestart)>6000
				   effectgravity.clear()
				   effectgravity=Null
				   effectstatus=0				  
				  EndIf
				 EndIf
				 If effectstatus=3
				  If (t-effecttimestart)>2000
				   effectstatus=4
				   effectgravity.intensity=0.3
				  Else 
				   'effectgravity.intensity=Sin(360*(t-effecttimestart)/1000)*3
				  EndIf
				  
				 EndIf
				 If effectstatus=2
				  If (t-effecttimestart)>50
				   effectstatus=3
				   effectsource.deactivate()
				  EndIf
				 EndIf
				 If effectstatus=1
				  If cardcurving()=False
				   effectstatus=2
				   If game.solitaire.systemaccellerate=False effectsource.generationrate=1500 Else effectsource.generationrate=500
				   effectsource.activate()
				   effectgravity=game.solitaire.world.worldfield.creategravitation(position.x,position.y,position.z-3,3)
				  EndIf
				 EndIf
				EndIf
				
				
				If cardcountactual<>cardcountold
				 If acesupmode=False
				  If cardcountactual=13
				   effect()
				  EndIf
				 EndIf
				 cardcountold=cardcountactual
				EndIf
				
				
				
				EndMethod				
	Method candrop:Int(list:TList,samesuit:Int=False)
				If takerestriction Return(False)
				If acesupmode
				 
				 If list.count()=1 And game.tableau
				  Local c:_card=_card(list.firstlink().value())
				  Local pf:_pilefreecell=_pilefreecell(c.pile)
				  If pf Return(False)
				  Local cs=c.suit
				  Local cn=c.number
				  If cn=0 cn=13
				  'es muss nun einen anderen pile geben,
				  'der eine firstkarte mit niedrigerer nummer hat
				  Local samelower=False
				  For Local pit:_piletableau=EachIn game.tableau.pilelist
				   If pit<>c.pile
				    If pit.cardlist.count()>0
				     Local v:_card=_card(pit.cardlist.firstlink().value())
				     If v.suit=cs
				      Local vn=v.number
				      If vn=0 vn=13
				      If vn>cn samelower=True
				     EndIf
				    EndIf
				   EndIf
				  Next
				  If samelower Return(True)
				 EndIf
				 Return(False)
				EndIf
	 			If(list.count()=13) 
	 			 Local it:TLink=list.firstlink()
	  			 Local ss=True
	 			 Local su=_card(it.value()).suit
	 			 Repeat
	 			  'If su<>_card(it.value()).suit ss=False
	  			  it=it.Nextlink()
	 			 Until (it=Null)
	             If ss Return(True) Else Return(False)
	 			Else
				 Return(False)
				EndIf
				EndMethod
	Method animate(clock:_clock)
				animateeffect()
	  			If game.statsclosed=False game.discards:+cardcountactual
	Rem
				If game.animationlist.firstlink()=Null And game.allowpick
				 
				 If inner() And MouseDown(1)
				  If(candrop(game.picklist))
				   Local u:_animationundo=game.createundo(30,0.1,True)
				   Local cc#=0'game.picklist.count()
				   While(game.picklist.lastlink())
				    Local c:_card=_card(game.picklist.firstlink().value())
				    c.deinsertpick()
					Local pilefrom:_pile=c.pile
				    c.deinsertpile()
				    c.insertpile(Self,True)
				    Local v:_vector3=dropposition()
				    Local dvx:_vector3=dropvx()
				    Local dvy:_vector3=dropvy()
				
				    c.curvespeed=30
				    c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-5*cc,0,0,5)
				    c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,0,0,0,0)
				    c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,0,0,0,0)
				    c.startcurve(clock)
			        Local cupo:_hermitecurve=New _hermitecurve
   			        Local cuvx:_hermitecurve=New _hermitecurve
			        Local cuvy:_hermitecurve=New _hermitecurve
			        cupo.o0.copy(c.pickposition)
			        cupo.v0.set(0,0,-5*cc)
			 	    cupo.o1.copy(c.curveposition.o1)
			 	    cupo.v1.set(0,0,0)
			        cupo.updatelength()
				    cuvx.o0.copy(c.pickvx)
				    cuvx.v0.set(0,0,0)
				    cuvx.o1.copy(c.curvevx.o1)
				    cuvx.v1.set(0,0,0)
			        cuvx.updatelength()
				    cuvy.o0.copy(c.pickvy)
				    cuvy.v0.set(0,0,0)
				    cuvy.o1.copy(c.curvevy.o1)
				    cuvy.v1.set(0,0,0)
			        cuvy.updatelength()
			        Print "undo.use : suit="+c.suit+" number="+c.number
				    u.use(c,Self,True,0,0,0,pilefrom,True,0,0,0,cupo,cuvx,cuvy)
				    cc:+1
				   Wend
				   'game.checkend()
				  EndIf
				 EndIf
				EndIf
				EndRem
				adjustcardposition()
				adjustcardvx()
				For Local c:_card=EachIn cardlist
				 c.animate()
				Next
				animatepileinfo()				
				updateshadow()
				EndMethod	
	Method createshadow()				
				'createshadowblock()
				EndMethod
	Method updateshadow()				
				'updateshadowblock()
				EndMethod
				
	Method updatedescription()
				If acesupmode=False
				 description0=strdiscardnormal
				Else
				 description0=strdiscardacesupmode
				EndIf
				description1=""
				EndMethod					
	Method save(s:TStream)
				WriteLine(s,"_pilediscard")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,acesupmode)
				WriteInt(s,pyramidmode)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				acesupmode=ReadInt(s)
				pyramidmode=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod				
								
	EndType
'******************************************************************************************************************
'										P I L E W A S T E 
'******************************************************************************************************************
Type _pilewaste Extends _pile
	Field gamewastelink:TLink=Null
	Field stockpartner:Int=0
	Method New()
				EndMethod
	Method Delete()
				EndMethod				
	Method init(g:_game,px#,py#)
				initpile(g,px,py)
				gamewastelink=game.pilewastelist.addlast(Self)

				name=strpilewaste
				'createshadow()
				drawownshadow=False
				EndMethod
	Method stock:_pilestock()
				Return(game.pilestock(stockpartner))
				EndMethod
	Method canpick:Int(c:_card)
				If giverestriction Return(False)
				Local pw:_pilestock=stock()
				If pw
				 If pw.backsort=True Return(False)
				EndIf
				'If cardcurving() Return(False) achtung !!!!!!!!!!!!!!!!!! wurde entfernt wegen doppelklick fehlfunktion !
				If cardcurvingstock() Return(False)
				If c.pilelink.prevlink()=Null Return(True) Else Return(False)
				EndMethod	
	Method pick(c:_card)
				c.pick()
				EndMethod						
	Method pickextern(c:_card,l:TList)
				l.addlast(c)
				EndMethod
				
	Method cardcurvingstock:Int()
				Local pw:_pilestock=stock()
				If pw
				 For Local c:_card=EachIn pw.cardlist
				  If c.curving Return(True)
				 Next
				EndIf
				Return(False)
				EndMethod								
	Method candrop:Int(list:TList,samesuit:Int=False)
				Return(False)
				EndMethod	
	Method animate(clock:_clock)
				
				animateinput()
				'adjustcardposition()
				adjustcardvx()
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next
				animatetableaufill()
				animatepileinfo()				
				'updateshadow()
				
				EndMethod	
	Method createshadow()				
				'createshadowblock()
				EndMethod
	Method updateshadow()				
				'updateshadowblock()
				EndMethod
										
	Method updatedescription()
				description0=strwastenormal
				description1=""
				EndMethod				
	Method save(s:TStream)
				WriteLine(s,"_pilewaste")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,stockpartner)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				stockpartner=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod								
	EndType
'******************************************************************************************************************
'										P I L E W A S T E P Y R A M I D
'******************************************************************************************************************
Type _pilewastepyramid Extends _pilewaste
	Method New()
				EndMethod
	Method Delete()
				EndMethod	
	Method canpick:Int(c:_card)
				If giverestriction Return(False)
				Local pw:_pilestock=stock()
				If pw
				 If pw.backsort=True Return(False)
				EndIf
				If cardcurving() Return(False)
				If cardcurvingstock() Return(False)
				If c.pilelink.prevlink() Return(False) 
				 If cardcurvingindiscard() Return(False)
				Return(True)
				EndMethod	
	Method pick(c:_card)
				If c.number=12
				 c.discard()
				 Local u:_animationundo=game.createundo(20,20)
				 u.use(c,game.getpilediscardminimum(),True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy)
				 c.deinsertpyramid()
				Else
				 c.pick()
				EndIf
				EndMethod
	Method pickextern(c:_card,l:TList)'picks the card c to the external list
				l.addlast(c)
				EndMethod
									
	Method cardcurvingindiscard:Int()
				If game.pilediscardlist.firstlink()=Null Return(False)
				For Local dit:_pilediscard=EachIn game.pilediscardlist
				 For Local cit:_card=EachIn dit.cardlist
				  If cit.curving Return(True)
				 Next
				Next
				Return(False)
				EndMethod											
	Method candrop:Int(list:TList,samesuit:Int=False)
				If takerestriction Return(False)
				If list.count()=1
				 Local it:TLink=list.firstlink()
				 Local pc:_card=_card(it.value())
				 Local itc:TLink=cardlist.firstlink()
				 If itc
				  Local cit:_card=_card(itc.value())
				  If cit.inner()
				   If cit.child[0]=Null And cit.child[1]=Null
				    If ((pc.number+1)+(cit.number+1))=13
				     Return(True)
				    EndIf
				   EndIf
				  EndIf
				 EndIf
				EndIf
				Return(False)
				EndMethod
	Method drop(clock:_clock)
				'drop the picklist to the discardpile and record the moves
				If cardlist.firstlink() And game.picklist.firstlink()
				 Local dropcard:_card=_card(cardlist.firstlink().value())
				 Local m:_animationundo=game.createundo(30,0.1,True)
				 'move the targetdropcard "dropcard" to the discardpile
				 Local vn:_vector3=New _vector3
				 Local vyy:_vector3=New _vector3
				 Local vtp:_vector3=New _vector3
				 Local vtn:_vector3=New _vector3
				 Local pd:_pilediscard=game.getpilediscardminimum()
				 vtp.set(0,0,5)
				 vtn.set(0,0,-5)
				 vn.set(0,0,0)
				 vyy.set(0,game.cardheight,0)
				 dropcard.curvespeed=40
				 dropcard.curvevx.setvector(dropcard.vx,dropcard.vx,vn,vn)
				 dropcard.curvevy.setvector(dropcard.vy,vyy,vn,vn)
				 dropcard.curveposition.setvector(dropcard.position,pd.dropposition(),vtn,vtp)
				 dropcard.startcurve(game.solitaire.clock)
				 dropcard.deinsertpile()
				 dropcard.insertpile(pd,True)
				 'Local u:_animationundo=game.createundo(20,20)
				 m.use(dropcard,pd,True,0,0,0,Self,True,0,0,0,dropcard.curveposition,dropcard.curvevx,dropcard.curvevy)
				 dropcard.deinsertpyramid()
				 'move the picked card to the discardpile
				 Local i#=0
				 Local c:_card=_card(game.picklist.firstlink().value())
				 Local pilefrom:_pile=c.pile
				 c.deinsertpick()
				 c.deinsertpile()
				 Local v:_vector3=New _vector3
				 Local dvx:_vector3=dropvx()
				 Local dvy:_vector3=dropvy()
				 c.curvespeed=30
			 	 c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,0 ,0,0,0)  
			 	 c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,0 ,0,0,0)  
			     v.copy(pd.dropposition())
				 c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-3,0,0,0)
			     c.startcurve(clock)
			     'undo record move
			     Local cupo:_hermitecurve=New _hermitecurve
			     Local cuvx:_hermitecurve=New _hermitecurve
			     Local cuvy:_hermitecurve=New _hermitecurve
			     cupo.o0.copy(c.pickposition)
			     cupo.v0.set(0,0,-10)
			 	 cupo.o1.copy(c.curveposition.o1)
			 	 cupo.v1.set(0,0,+10)
			     cupo.updatelength()
				 cuvx.o0.copy(c.pickvx)
				 cuvx.v0.set(0,0,0)
				 cuvx.o1.copy(c.curvevx.o1)
				 cuvx.v1.set(0,0,0)
			     cuvx.updatelength()
				 cuvy.o0.copy(c.pickvy)
				 cuvy.v0.set(0,0,0)
				 cuvy.o1.copy(c.curvevy.o1)
				 cuvy.v1.set(0,0,0)
			     cuvy.updatelength()
				 m.use(c,pd,True,0,0,0,pilefrom,True,0,0,0,cupo,cuvx,cuvy)
				 'end undo record move
				 c.deinsertpyramid()
				 c.insertpile(pd,True)
				EndIf
				EndMethod
	Method save(s:TStream)
				WriteLine(s,"_pilewastepyramid")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,stockpartner)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				stockpartner=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod				
	EndType	
'******************************************************************************************************************
'										P I L E F O U N D A T I O N 
'******************************************************************************************************************
Type _pilefoundation Extends _pile
	Field gamefoundationlink:TLink=Null
	Field osmosismode=False
	
	Field effectsource:_particlesource=Null
	Field effectstatus:Int=0
	Field effecttimestart#=0
	Field effectgravity:_fielddivergence=Null
	
	Field cardcountactual:Int=0
	Field cardcountold:Int=0
	
	Method New()
				effectsource=New _particlesource
				effectsource.particlelist=Null'!
				effectsource.active=False
				effectsource.size=1
				effectsource.sizetolerance=0.5
				effectsource.vector.set(0,0,-0.1)
				effectsource.vectortolerance=0.7
				effectsource.lifetimeparticle=2700
				effectsource.lifetimeparticletolerance=0.1
				effectsource.rotation=0
				effectsource.rotationtolerance=0
				effectsource.opacity=1
				effectsource.gfieldforce=+1
				Local rs#=1
				effectsource.room[0].set(1.5*rs,0,0)
				effectsource.room[1].set(0,2.25*rs,0)
				effectsource.room[2].set(0,0,0.2*0.5)
				effectsource.drawadd=True
				effectsource.drawmul=False
				effectsource.drawalpha=False
  				effectsource.gfieldforcehomogen.set(0,0,-0.01)				
				effectsource.generationrate=1000
				effectsource.sinusopacity=True
				effectsource.sinusopacityrate=1
				effectsource.sinusopacityratedifference=0.3
				effectsource.sinusopacityratedifferencetolerance=0.2
				effectsource.scale=True
				effectsource.scalevalue=0.998				
				effectsource.axialdivergence=False

				effectsource.axialvector.set(0,0,-0.02)
				effectsource.fadeout=True
				effectsource.fadein=False
				effectsource.colorcurved=True
				effectsource.colorcurve.set(0,0,0,0  ,  0,0,1,0,  5,5,5,5, -1,0,-5,-5)

				' -----------------------life source------------------------
				effectsource.pqlife=New _particlesource
				effectsource.pqlife.particlelist=Null'!
				effectsource.pqlife.active=False
				effectsource.pqlife.vector.set(0,0,0)
				effectsource.pqlife.vectortolerance=0.8
				effectsource.pqlife.generationrate=50
				effectsource.pqlife.lifetimeparticle=1000
				effectsource.pqlife.lifetimeparticletolerance=0.01
				effectsource.pqlife.opacity=1
				effectsource.pqlife.position.set(0,0,0)
				effectsource.pqlife.room[0].set(0,0,0)
				effectsource.pqlife.room[1].set(0,0,0)
				effectsource.pqlife.room[2].set(0,0,0)
				effectsource.pqlife.drawadd=True
				effectsource.pqlife.drawmul=False
				effectsource.pqlife.drawalpha=False
				effectsource.pqlife.particlegenerationdensity=0.4
				effectsource.pqlife.gfieldforce=-8
				effectsource.pqlife.size=3'+Sin(solitaire.clock.ms()/5)*0.9
				effectsource.pqlife.colorcurved=True
				effectsource.pqlife.colorcurve.set(0.0,0.0,0.8,0.5  ,  0.8,0.2,0.05,0,  0,0,0,0, -3,-2,0,-4)				
	
				EndMethod
	Method Delete()
				EndMethod		
	Method clear()
	   			Print "pile foundation clear() call"
				effectsource.clear()
				effectsource=Null
				If effectgravity 
				 effectgravity.clear()
				 effectgravity=Null
				EndIf
				Super.clear()
				EndMethod								
	Method init(g:_game,px#,py#)
				initpile(g,px,py)
				gamefoundationlink=g.pilefoundationlist.addlast(Self)
				name=strpilefoundation
				'createshadow()
				drawownshadow=False
				takesamesuit=True
				
				
				
				Local scale#=0.4'vorher 4
				Local m:_mesh
				Local m2:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=game.solitaire.tcoronawhite
				gg.position.set(-scale/2,-scale/2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(scale,0,0)
				gg.vy.set(0,scale,0)
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				effectsource.init(game.solitaire.world, game.solitaire.gra,game.solitaire.particlesourcegamelist,game.solitaire.particlegamelist,game.solitaire.clock)
				effectsource.insertmesh(m)
				effectsource.particlegenerationpositionold.copy(position)
				effectsource.position.copy(position)
				effectsource.axialposition.copy(position)
				effectsource.pqlife.init(game.solitaire.world, game.solitaire.gra,game.solitaire.particlesourcegamelist,game.solitaire.particlegamelist,game.solitaire.clock)
				effectsource.pqlife.rotation=Sin(game.solitaire.clock.ms()/10)*90'180+Sin(solitaire.clock.ms()/(50+Cos(solitaire.clock.ms()/20)*45))*360
				scale=0.35
				gg=New _geometrygrid
				gg.texture[0,0]=game.solitaire.tfeuer6
				gg.position.set(-scale/2,-scale/2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(scale,0,0)
				gg.vy.set(0,scale,0)
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				effectsource.pqlife.insertmesh(m)
				EndMethod	
	Method draw(gra:_graphics,cam:_camera)
				mesh.clearvertexlight()
	    		For Local lit:_light=EachIn game.solitaire.world.lightlist
				 mesh.determinevertexlight(lit)
				Next
				mesh.draw(gra,cam)
				Local s=-1'foundation
				Local n=-1
				Rem
				Local tasc
				Local tdesc
				If localrule
				 tasc=takeascending
				 tdesc=takedescending
				Else
				 tasc=game.foundationascending
				 tdesc=game.foundationdescending
				EndIf				
				EndRem
				
				If takeemptysuit<>-1 s=takeemptysuit
				
				If takeascending n=0
				If takedescending n=12

				If s<>-1
				 For Local pit:_polygon=EachIn meshsuit.polygonlist
				  pit.texture[0,0]=game.solitaire.tsymbolsuit[s]
				 Next
				 meshsuit.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  meshsuit.determinevertexlight(lit)
				 Next
				 meshsuit.draw(gra,cam)
				EndIf
				
				If n<>-1
				 For Local pit:_polygon=EachIn meshnumber.polygonlist
				  pit.texture[0,0]=game.solitaire.tsymbolnumber[n]
				 Next
				 meshnumber.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  meshnumber.determinevertexlight(lit)
				 Next
				 meshnumber.draw(gra,cam)
				EndIf
				EndMethod					
	Method canpick:Int(c:_card)
				If giverestriction Return(False)
				'If game.foundationpickrestriction=False
				 'only first card can be picked up
				 If c.pilelink.prevlink()=Null Return(True)
				'EndIf
				Return(False)
				EndMethod	
	Method candrop:Int(list:TList,samesuit:Int=False)
				If takerestriction Return(False)

				If osmosismode'------------------------- osmosis mode --------------------------------------
				 If list.count()=1 
				  Local cl:_card=_card(list.firstlink().value())
				  Local prev:TLink=gamefoundationlink.prevlink()
				  If prev=Null' erste Foundation
				   If cardlist.firstlink()
				    Local cf:_card=_card(cardlist.firstlink().value())
				    If cf.suit=cl.suit
				     Return(True)'erste Foundation. gleiche suit
				    EndIf
				   EndIf
				  Else'untere Foundation
				   Local pf:_pilefoundation=_pilefoundation(prev.value())
				   If cardlist.firstlink()'wo etwas drinen ist
				    Local cfself:_card=_card(cardlist.firstlink().value())
				    If cfself.suit=cl.suit'ok suit stimmt überein, nun osmose anwenden
				     For Local cprev:_card=EachIn pf.cardlist
				      If cprev.number=cl.number Return(True) 
				     Next
				    EndIf
				   Else'wo noch nichts drinnen ist (-> suit egal, osmose anwenden)
				    Local it:TLink=pf.cardlist.lastlink()
				    If it
				     Local pfcf:_card=_card(it.value())
				     If pfcf.number=cl.number Return(True)
				    EndIf
				    'For Local cprev:_card=EachIn pf.cardlist
				    ' If cprev.number=cl.number Return(True)
				    'Next
				   EndIf'selfpile gefüllt
				  EndIf'prevpile=null
				 EndIf'list.count()=1
				Else'------------------------------------ normaler modus --------------------------------
				 'only one card of same suit an right order
				 Rem
				 Local tasc
				 Local tdesc
				 If localrule
				  tasc=takeascending
				  tdesc=takedescending
				 Else
				  tasc=game.foundationascending
				  tdesc=game.foundationdescending
				 EndIf
				 EndRem
				
				 If list.count()<>1 Return(False)
			 	 Local c:_card=_card(list.firstlink().value())
				 If c
				  If cardlist.count()=0
     			   If takeemptysuit<>-1 And c.suit<>takeemptysuit Return(False)
				   If takeascending If c.number=0 Return(True)
				   If takedescending If c.number=12 Return(True)
				  Else
				   Local cf:_card=_card(cardlist.firstlink().value())
				   If takeboth 
				    If Abs(c.number-cf.number)=1 Return(True)
				   EndIf
				   If takewrapped
				    If c.number=12 And cf.number=0 Return(True)
				    If c.number=0 And cf.number=12 Return(True)
				   EndIf
				   If cf.suit<>c.suit Return(False)	
				   If takemirrored
					Local ta=takeascending
					Local td=takedescending
				    Local m=cardlist.count()/13
					Local q=cardlist.count() Mod 13
				    m=m Mod 2
				    If m=1
				     ta=1-ta
				  	 td=1-td
				    EndIf
					If q=0'achtung spiegelung einleiten
					 If cf.number=12 
					  If c.number=12 Return(True) Else Return(False)
					 EndIf
					 If cf.number=0 
					  If c.number=0 Return(True) Else Return(False)
					 EndIf
					EndIf
				    If ta If (c.number=(cf.number+1)) Return(True)
				    If td If (c.number=(cf.number-1)) Return(True)
				   Else
				    If takeascending If (c.number=(cf.number+1)) Return(True)
				    If takedescending If (c.number=(cf.number-1)) Return(True)
				   EndIf
				  EndIf
				  
				 EndIf
				EndIf
				Return(False)
				EndMethod	
	Method ascendingmirrored:Int()
				If takemirrored
				 Local ta=takeascending
			     Local m=cardlist.count()/13
				 Local q=cardlist.count() Mod 13
			     m=m Mod 2
			     If m=1 ta=1-ta
			     If ta Return(True)
				Else
				 If takeascending Return(True) 
				EndIf
				Return(False)
				EndMethod				
	Method descendingmirrored:Int()
				If takemirrored
				 Local td=takedescending
			     Local m=cardlist.count()/13
				 Local q=cardlist.count() Mod 13
			     m=m Mod 2
			     If m=1 td=1-td
			     If td Return(True)
				Else
				 If takedescending Return(True) 
				EndIf
				Return(False)
				EndMethod				
	Method drop(clock:_clock)
				'drop the picklist to the pile pit and record the moves
				Local i#=0
				Local m:_animationundo=game.createundo(30,0.1,False)
				While(game.picklist.firstlink())
				 Local c:_card=_card(game.picklist.firstlink().value())
				 Local pilefrom:_pile=c.pile
				 c.deinsertpick()
				 c.deinsertpile()
				 Local v:_vector3=New _vector3
				 Local dvx:_vector3=dropvx()
				 Local dvy:_vector3=dropvy()
				 c.curvespeed=50
			 	 c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,-2*i ,0,0,0)  
			 	 c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,-2*i ,0,0,0)  
			     v.copy(dropposition())
			     If osmosismode
				  c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,10,-23,60,-60,0)
				 Else
				  c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-3,0,0,0)
				 EndIf
			     c.startcurve(clock)
				 '----------------------- determine destindex for osmosismode sorted cards -------------------
				 Local destindex=0
				 If osmosismode
				  Local it:TLink=cardlist.firstlink()
				  If it
				   Local stop=False
				   Repeat
				    Local cp:_card=_card(it.value())
				    If cp.number > c.number 
				     it=it.nextlink()
				     destindex:+1
				    Else
				     stop=True
				    EndIf
				   Until stop Or it=Null
				  EndIf
				  'Print "destindex="+destindex
				 EndIf'--------------------------------------------------------------------------------------
			
			     'undo record move
			     Local cupo:_hermitecurve=New _hermitecurve
			     Local cuvx:_hermitecurve=New _hermitecurve
			     Local cuvy:_hermitecurve=New _hermitecurve
			     cupo.o0.copy(c.pickposition)
			     cupo.v0.set(0,0,-10)
			 	 cupo.o1.copy(c.curveposition.o1)
			 	 cupo.v1.set(0,0,10)
			     cupo.updatelength()
			
				 cuvx.o0.copy(c.pickvx)
				 cuvx.v0.set(0,0,0)
				 cuvx.o1.copy(c.curvevx.o1)
				 cuvx.v1.set(0,0,0)
			     cuvx.updatelength()

				 cuvy.o0.copy(c.pickvy)
				 cuvy.v0.set(0,0,0)
				 cuvy.o1.copy(c.curvevy.o1)
				 cuvy.v1.set(0,0,0)
			     cuvy.updatelength()
				 m.use(c,Self,True,destindex,0,0,pilefrom,True,c.labindex[0],c.labindex[1],0,cupo,cuvx,cuvy)
				 'end undo record move
				 c.insertpile(Self,True,destindex)
				 c.deinsertlabyrinth()
				 '-------------------------------- nun spezielle labyrinth nachfüllung mit demselben undo ---------------
				 Local ps:_pilestock=game.pilestock(0)
				 If ps
				  For Local pl:_pilelabyrinth=EachIn game.pilelabyrinthlist
				   pl.fillfirstline(m)
				  Next
				 EndIf
				 i:+1
				Wend
				
				
				EndMethod	
				
	Method dropposition:_vector3(backdrop=False)
				If osmosismode
			     Return(droppositionvector(backdrop))
			    Else
			     Return(Super.dropposition(backdrop))
				EndIf
				EndMethod
	Method adjustcardposition()
				If osmosismode
				 adjustcardpositionvector()
				Else
				 Super.adjustcardposition()
				EndIf
				EndMethod
	Method effect()
				effecttimestart=game.solitaire.clock.ms()
				effectstatus=1
				If effectgravity 
				 effectgravity.clear()
				 effectgravity=Null
				EndIf
				effectsource.particlegenerationpositionold.copy(position)
				effectsource.position.copy(position)
				EndMethod					
	Method animateeffect()
				cardcountactual=cardcount()
				Local t#=game.solitaire.clock.ms()
				If effectstatus>0
				 If effectstatus=4
				  If (t-effecttimestart)>6000
				   effectgravity.clear()
				   effectgravity=Null
				   effectstatus=0				  
				  EndIf
				 EndIf
				 If effectstatus=3
				  If (t-effecttimestart)>2000
				   effectstatus=4
				   effectgravity.intensity=0.3
				  EndIf
				 EndIf
				 If effectstatus=2
				  If (t-effecttimestart)>50
				   effectstatus=3
				   effectsource.deactivate()
				  EndIf
				 EndIf
				 If effectstatus=1
				  If cardcurving()=False
				   effectstatus=2
				   If game.solitaire.systemaccellerate=False effectsource.generationrate=1500 Else effectsource.generationrate=500
				   effectsource.activate()
				   effectgravity=game.solitaire.world.worldfield.creategravitation(position.x,position.y,position.z-3,3)
				  EndIf
				 EndIf
				EndIf
				
				If cardcountactual<>cardcountold
				 If cardcountactual Mod 13=0 And cardcountactual>0
				  effect()
				 EndIf
				 cardcountold=cardcountactual
				EndIf
				EndMethod									
	Method animate(c:_clock)
				
				animateeffect()
			    If game.statsclosed=False game.discards:+cardcountactual
				adjustcardposition()
				adjustcardvx()
				animateinput()
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next
				'********** DEBUG ********
				'Local prev:TLink=gamefoundationlink.prevlink()
				'If prev=Null' erste Foundation
				' Local h$="Kartenseq : "
				' For Local cit:_card=EachIn cardlist
				'  h:+cit.number+" , "
				' Next
				' Print h
				'EndIf
				'*************************
				
				animatepileinfo()		
				
			'Print "afoun6"
				'updateshadow()
				EndMethod	
	Method createshadow()				
				'createshadowblock()
				EndMethod
	Method updateshadow()				
				'updateshadowblock()
				EndMethod
								
	Method updatedescription()
				description0=""
				description1=""
				If osmosismode 
				 description0:+strfoundationosmosismode
				Else
				 Rem
				 Local tasc
				 Local tdesc
				 If localrule
				  tasc=takeascending
				  tdesc=takedescending
				 Else
				  tasc=game.foundationascending
				  tdesc=game.foundationdescending
				 EndIf
				 EndRem
				 If ascendingmirrored() description0:+strpiletakeascending+strpileplace
				 If descendingmirrored() description0:+strpiletakedescending+strpileplace
				 If takeboth And takeascending=False And takedescending=False description0=strpiletakeboth+strpileplace

				 If takewrapped
				  If takeboth 
				   description0:+strpiletakewrapped 
				  Else 
				   If takedescending description0:+strpiletakewrappeddescending
				   If takeascending description0:+strpiletakewrappedascending
				  EndIf
				 EndIf
				
				 Rem
				 If takeboth=False And takewrapped And takeascending description0:+strfoundationwrappedascending
				 If takeboth=False And takewrapped And takedescending description0:+strfoundationwrappeddescending
				 If takeboth And takewrapped=False description0:+strtakeboth
				 If takeboth And takewrapped       description0:+strfoundationbothwrapped
				EndRem
				
				 description1=""
				 If takemirrored 
				  If takeascending description1:+strpiletakemirroredascending
				  If takedescending description1:+strpiletakemirroreddescending
				 EndIf
				 If giverestriction description1:+strpilegiverestriction
				EndIf				
				
				EndMethod	
	Method save(s:TStream)
				WriteLine(s,"_pilefoundation")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,osmosismode)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				osmosismode=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod				
	EndType
'******************************************************************************************************************
'										P I L E R E S E R V E 
'******************************************************************************************************************
Type _pilereserve Extends _pile
	Field gamereservelink:TLink=Null
	Field flowermode=False
	Field arcmode=False
	Field pyramidmode=False' bewirkt, daß könige nicht gepickt werden, sondern discarded
	Method New()
				EndMethod
	Method Delete()
				EndMethod				
	Method init(g:_game,px#,py#)
				initpile(g,px,py)
				gamereservelink=game.pilereservelist.addlast(Self)
				takerestriction=True
				name=strpilereserve
				drawownshadow=False
				EndMethod	
	Method canpick:Int(c:_card)
				If giverestriction Return(False)
				
				If flowermode
				 Return(True)
				Else
				 If c.pilelink.prevlink()=Null Return(True)
				EndIf
				Return(False)
				EndMethod	
	Method pick(c:_card)'picks only the card c , not others in list,to the picklist
				If pyramidmode
				 If c.number=12
				  c.discard()
				  Local u:_animationundo=game.createundo(20,20)
				  u.use(c,game.getpilediscardminimum(),True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy)
				  c.deinsertpyramid()
				 Else
				  c.pick()
				 EndIf
				Else
				 If flowermode
				  c.pick()
				 Else
				  Super.pick(c)
				 EndIf
				EndIf
				EndMethod				
	Method pickextern(c:_card,l:TList)
				If pyramidmode
				 l.addlast(c)
				Else
				 If flowermode
				  l.addlast(c)
				 Else
				  Super.pickextern(c,l)
				 EndIf
				EndIf
				EndMethod
				
	Method candrop:Int(list:TList,samesuit:Int=False)
				If takerestriction Return(False)
				'weaving check
				Local ps:_pilestock=game.pilestock(0)
				If ps
				 If ps.cardlist.firstlink()=Null
				  If ps.canredeal()=False
				   If cardlist.firstlink()=Null Return(True)
				  EndIf
				 EndIf
				EndIf
				Return(False)
				EndMethod	
	Method pickslopeposition(c:_card,p:_vector3)
				If arcmode
				 pickslopepositionarc(c,p)
				Else
				 Super.pickslopeposition(c,p)
				EndIf
				EndMethod
	Method pickslopeplane(c:_card,vvx:_vector3,vvy:_vector3)
				If arcmode
				 pickslopeplanearc(c,vvx,vvy)
				Else
				 Super.pickslopeplane(c,vvx,vvy)
				EndIf
				EndMethod
	Method dropposition:_vector3(backdrop=False)
				If arcmode
				 Return(droppositionarc(backdrop))
				Else
			     Return(droppositionvector(backdrop))
				EndIf
				EndMethod				
	Method dropvy:_vector3()
				If arcmode
				 Return(dropvyarc())
				Else
				 Local v:_vector3=New _vector3
				 v.set(0,game.cardheight,-game.solitaire.cardslope)
				 Return(v)
				EndIf
				EndMethod	
	Method dropvx:_vector3()
				If arcmode
				 Return(dropvxarc())
				Else				
				 Return(Super.dropvx())
				EndIf
				EndMethod
	Method adjustcardvy()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.curving=False And cit.picked=False
	     		   cit.vy.set(0,game.cardheight,-game.solitaire.cardslope)
	 			   'cit.normcardplane()
				  EndIf
				 Next
				EndIf
				EndMethod					
	Method animate(c:_clock)
				
				If arcmode
				 adjustcardvyarc(True)
				 adjustcardvxarc(True)
				 adjustcardpositionarc(True)
				 animatemouseovercardarc()
				Else
				 adjustcardvy()
				 adjustcardvx()
				 adjustcardpositionvector()
				 For Local cit:_card=EachIn cardlist
				  cit.animate()
			 	 Next
				EndIf
				
				animateinput()
				
				animatetableaufill()
				
				animatepileinfo()	
					
				updatedescription()	
				
				'updateshadow()
				EndMethod		
	Method createshadow()				
				'createshadowstripe()
				EndMethod
	Method updateshadow()				
				'updateshadowstripe()
				EndMethod
	Method updatedescription()
				Local d$=""
				Local weavingon=False
				If takerestriction=False 
				 Local r=False
				 Local ps:_pilestock=game.pilestock(0)
				 If ps
				  If ps.cardlist.firstlink()=Null
				   'Print "null"
				   If ps.canredeal()=False
				    'Print "redeal"
				     r=True
				   EndIf
				  EndIf
				 EndIf	
				 If r=False			
				  d=strreserveweavingoff
				 Else
				  d=strreserveweavingon
				  weavingon=True
				 EndIf
				EndIf
				
				If cardlist.count()>0
				 If flowermode 
				  d:+strreserveflowermode
				 Else
				  d:+strreservenormal
				 EndIf
				Else
				 If weavingon d:+strreservetake
				EndIf
				description0=d
				description1=""
				EndMethod						
	Method save(s:TStream)
				WriteLine(s,"_pilereserve")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,flowermode)
				WriteInt(s,arcmode)
				WriteInt(s,pyramidmode)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				flowermode=ReadInt(s)
				arcmode=ReadInt(s)
				pyramidmode=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod				
	EndType
'******************************************************************************************************************
'										P I L E F R E E C E L L 
'******************************************************************************************************************
Type _pilefreecell Extends _pile
	Field gamefreecelllink:TLink=Null
	Field suit:Int=-1'no suit bound as default
	Method New()
				EndMethod
	Method Delete()
				EndMethod				
	Method init(g:_game,px#,py#,s#)
				initpile(g,px,py)
				gamefreecelllink=game.pilefreecelllist.addlast(Self)
				suit=s
				name=strpilefreecell
				EndMethod	
	Method draw(gra:_graphics,cam:_camera)
				mesh.clearvertexlight()
	    		For Local lit:_light=EachIn game.solitaire.world.lightlist
				 mesh.determinevertexlight(lit)
				Next
				mesh.draw(gra,cam)
				Local s=suit
				Local n=-1
				If s<>-1
				 For Local pit:_polygon=EachIn meshsuit.polygonlist
				  pit.texture[0,0]=game.solitaire.tsymbolsuit[s]
				 Next
				 meshsuit.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  meshsuit.determinevertexlight(lit)
				 Next
				 meshsuit.draw(gra,cam)
				EndIf
				
				If n<>-1
				 For Local pit:_polygon=EachIn meshnumber.polygonlist
				  pit.texture[0,0]=game.solitaire.tsymbolnumber[n]
				 Next
				 meshnumber.clearvertexlight()
	    		 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  meshnumber.determinevertexlight(lit)
				 Next
				 meshnumber.draw(gra,cam)
				EndIf
				EndMethod					
	Method canpick:Int(c:_card)
				If giverestriction Return(False)
				If cardlist.count()=0 Return(False)
				Return(True)
				EndMethod
	Method candrop:Int(list:TList,samesuit:Int=False)
				If takerestriction Return(False)
				If list.count()=1 And cardlist.count()=0 
				 If suit=-1 Return(True)
				 Local c:_card=_card(list.firstlink().value()) 
			     If c.suit=suit Return(True)
				EndIf
				Return(False)
				EndMethod
	Method animate(clock:_clock)
				adjustcardposition()
				adjustcardvx()
				animateinput()
				For Local c:_card=EachIn cardlist
				 c.animate()
				Next
				animatepileinfo()				
				EndMethod	
	Method updatedescription()
				Local d$=""
				If suit<>-1 d=strpilesuitbound
				description0=d
				description1=""
				EndMethod					
	Method save(s:TStream)
				WriteLine(s,"_pilefreecell")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,suit)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				suit=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod				
	EndType
'******************************************************************************************************************
'										P I L E P Y R A M I D 
'******************************************************************************************************************
Type _pilepyramid Extends _pile
	Field gamepyramidlink:TLink=Null
	Field initialized=False
	Field dropcard:_card=Null

	Method New()
				EndMethod
	Method Delete()
				EndMethod				
	Method init(g:_game,px#,py#)
				initpile(g,px,py)
				gamepyramidlink=game.pilepyramidlist.addlast(Self)
				name=strpilepyramid
				EndMethod	
	Method cardfromlast:_card(index)	
				If index<0 Return(Null)
				If index>=cardlist.count() Return(Null)			
				Local it:TLink=cardlist.lastlink()
				Local i=0
				If it
				 Repeat
				  If i=index Return(_card(it.value()))
				  i:+1
				  it=it.prevlink()
				 Until it=Null
				EndIf
				Return(Null)
				EndMethod
	Method initcardpyramid()
				'only once at startup after preparative animation
				If initialized=False
				 initialized=True
				 Local ci=0
				 Local zeile=0
				 Local spalte=0
				 Local it:TLink=cardlist.lastlink()
				 If it
				  Repeat
				   Local c:_card=_card(it.value())
				    c.child[0]=cardfromlast(ci+zeile+1)
				    c.child[1]=cardfromlast(ci+zeile+2)
				   If ci<>0
				    If spalte>0 c.parent[0]=cardfromlast(ci-(zeile+1))
				    If spalte<zeile c.parent[1]=cardfromlast((ci-(zeile+1))+1)
				   EndIf
				   spalte:+1
				   If(spalte>zeile)	
				    spalte=0
				    zeile:+1
				   EndIf				
				   ci:+1
				   it=it.prevlink()
				  Until it=Null 
				 EndIf
				EndIf
				EndMethod
	Method canpick:Int(c:_card)
				If giverestriction Return(False)
				If cardcurvingindiscard() Return(False)
				If c.child[0]=Null And c.child[1]=Null Return(True)
				Return(False)
				EndMethod
	Method pick(c:_card)
				If c.number=12
				 c.discard()
				 Local u:_animationundo=game.createundo(20,20)
				 u.use(c,game.getpilediscardminimum(),True,0,0,0,Self,True,0,0,0,c.curveposition,c.curvevx,c.curvevy)
				 c.deinsertpyramid()
				Else
				 c.pick()
				EndIf
				EndMethod		
	Method pickextern(c:_card,l:TList)
				l.addlast(c)
				EndMethod
								
	Method cardcurvingindiscard:Int()
				If game.pilediscardlist.firstlink()=Null Return(False)
				For Local dit:_pilediscard=EachIn game.pilediscardlist
				 For Local cit:_card=EachIn dit.cardlist
				  If cit.curving Return(True)
				 Next
				Next
				Return(False)
				EndMethod					
	Method candrop:Int(list:TList,samesuit:Int=False)
				dropcard=Null
				If takerestriction Return(False)

				If list.count()=1
				 Local it:TLink=list.firstlink()
				 Local pc:_card=_card(it.value())
				 For Local cit:_card=EachIn cardlist
				  If cit.inner()
				   If cit.child[0]=Null And cit.child[1]=Null
				    If ((pc.number+1)+(cit.number+1))=13
				     dropcard=cit
				     Return(True)
				    EndIf
				   EndIf
				  EndIf
				 Next
				EndIf
				Return(False)
				EndMethod
	Method drop(clock:_clock)
				'drop the picklist to the discardpile and record the moves
				If dropcard And game.picklist.firstlink()
				 Local m:_animationundo=game.createundo(30,0.1,True)
				 'move the targetdropcard "dropcard" to the discardpile
				 Local pd:_pilediscard=game.getpilediscardminimum()
				 Local dvx:_vector3=pd.dropvx()
				 Local dvy:_vector3=pd.dropvy()
				 Local vn:_vector3=New _vector3
				 Local vyy:_vector3=New _vector3
				 Local vtp:_vector3=New _vector3
				 Local vtn:_vector3=New _vector3
				 Local vtm:_vector3=New _vector3
				 Local vto:_vector3=New _vector3
				 vtp.set(-25,-25,20)
				 vtn.set(30,30,-20)
				 vtm.set(0,0,-10)
				 vto.set(0,0,10)
				 vn.set(0,0,0)
				 vyy.set(0,game.cardheight,0)
				 dropcard.curvespeed=40
				 dropcard.curvevx.setvector(dropcard.vx,dvx,vtm,vto)
				 dropcard.curvevy.setvector(dropcard.vy,dvy,vtm,vn)
				 dropcard.curveposition.setvector(dropcard.position,pd.dropposition(),vtn,vtp)
				 dropcard.startcurve(game.solitaire.clock)
				 dropcard.deinsertpile()
				 dropcard.insertpile(pd,True)
				 'Local u:_animationundo=game.createundo(20,20)
				 m.use(dropcard,pd,True,0,0,0,Self,True,0,0,0,dropcard.curveposition,dropcard.curvevx,dropcard.curvevy)
				 dropcard.deinsertpyramid()
				 'move the picked card to the discardpile
				 Local i#=0
				 Local c:_card=_card(game.picklist.firstlink().value())
				 Local pilefrom:_pile=c.pile
				 c.deinsertpick()
				 c.deinsertpile()
				 Local v:_vector3=New _vector3
				 vtp.set(-25,-25,25)
				 vtn.set(30,30,-25)
				 c.curvespeed=30
			 	 c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,-10 ,0,0,10)  
			 	 c.curvevy.setvector(c.vy, dvy,vtm,vn)',dvy.y,dvy.z, 0,0,0 ,0,0,0)  
			     v.copy(pd.dropposition())
				 c.curveposition.setvector(c.position,v,vtn,vtp)
			     c.startcurve(clock)
			     'undo record move
			     Local cupo:_hermitecurve=New _hermitecurve
			     Local cuvx:_hermitecurve=New _hermitecurve
			     Local cuvy:_hermitecurve=New _hermitecurve
			     cupo.o0.copy(c.pickposition)
			     cupo.v0.set(0,0,-10)
			 	 cupo.o1.copy(c.curveposition.o1)
			 	 cupo.v1.set(0,0,+10)
			     cupo.updatelength()
				 cuvx.o0.copy(c.pickvx)
				 cuvx.v0.set(0,0,0)
				 cuvx.o1.copy(c.curvevx.o1)
				 cuvx.v1.set(0,0,0)
			     cuvx.updatelength()
				 cuvy.o0.copy(c.pickvy)
				 cuvy.v0.set(0,0,0)
				 cuvy.o1.copy(c.curvevy.o1)
				 cuvy.v1.set(0,0,0)
			     cuvy.updatelength()
				 m.use(c,pd,True,0,0,0,pilefrom,True,0,0,0,cupo,cuvx,cuvy)
				 'end undo record move
				 c.deinsertpyramid()
				 c.insertpile(pd,True)
				 dropcard=Null
				EndIf
				EndMethod				
	Method dropvy:_vector3()
				Local v:_vector3=New _vector3
				v.set(0,game.cardheight,-game.solitaire.cardslope)
				Return(v)
				EndMethod		
	Method dropposition:_vector3(backdrop=False)	
				Local v:_vector3=New _vector3
				Local n#=cardlist.count()
				Local zeile=0
				Local spalte=0
				Local xit#=position.x
				Local yit#=position.y
				Local zit#=position.z-game.solitaire.cardtableaulift
	 			Local tabx#=game.tabulatorx()
				If n>0
				 For Local i=0 To n-1
				  xit:+tabx
				  spalte:+1
				  If(spalte>zeile)	
				   spalte=0
				   zeile:+1
				   xit=position.x-((Float(zeile)*tabx)*0.5)
				   yit:-game.cardheight*0.5
				   zit:-game.solitaire.cardthickness
				  EndIf				
				 Next
				EndIf
				v.set(xit,yit,zit)
				Return(v)
				EndMethod		
	Method adjustcardvy()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.curving=False And cit.picked=False
	     		   cit.vy.set(0,game.cardheight,-game.solitaire.cardslope)
	 			   'cit.normcardplane()
				  EndIf
				 Next
				EndIf
				EndMethod			
								
	Method adjustcardposition()
				Local ok=False
				If game.animationlist.firstlink()=Null 
				 ok=True
				Else
				 Local a:_animationundo=_animationundo(game.animationlist.firstlink().value())
				 If a ok=True
				EndIf
				If ok
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.curving=False And cit.picked=False
	     		   cit.position.z=position.z-game.solitaire.cardtableaulift
	 			   cit.position.z:-((position.y-cit.position.y)/(game.cardheight*0.5))*game.solitaire.cardthickness
				  EndIf
				 Next
				EndIf
				EndMethod							
	Method animate(clock:_clock)
				adjustcardvy()
				adjustcardvxsingle()
				adjustcardposition()
				animateinput()
				For Local c:_card=EachIn cardlist
				 c.animate()
				Next
				animatepileinfo()				
				EndMethod	
	Method updatedescription()
				description0=strpyramidenormal0
				description1=strpyramidenormal1
				EndMethod					
	Method save(s:TStream)
				WriteLine(s,"_pilepyramid")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,initialized)
				savepointer(s,dropcard)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				initialized=ReadInt(s)
				loadpointer(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 dropcard=_card(associatepointer())
				 releasepointer()
				EndIf
				EndMethod				
								
	EndType	

	
'******************************************************************************************************************
'										P I L E B E T H O R A L
'******************************************************************************************************************
Type _pilebethoral Extends _piletableau
	Field status=0
	Method New()
				stretchfriction=0.8
				stretchhaerte=0.05
				EndMethod
	Method Delete()
				EndMethod				
	Method init(t:_tableau,px#,py#)
				initpile(t.game,px,py)
				tableau=t
				linktableau=tableau.pilelist.addlast(Self)
				name=strpiletableau
				'createshadow()
				drawownshadow=False
				EndMethod					
	Method canpick:Int(c:_card) 
				'status=1
				If giverestriction Return(False)
				If c.pilelink.prevlink()=Null Or c.pilelink.nextlink()=Null Return(False)
				Local cp:_card=_card(c.pilelink.prevlink().value())
				Local cn:_card=_card(c.pilelink.nextlink().value())
				If cp.suit=cn.suit Or cp.number=cn.number Return(True)
				If cn.pilelink.nextlink()
				 Local cnn:_card=_card(cn.pilelink.nextlink().value())
				 If cp.suit=cnn.suit Or cp.number=cnn.number Return(True)
				EndIf
				If cp.pilelink.prevlink()
				 Local cpp:_card=_card(cp.pilelink.prevlink().value())
				 If cpp.suit=cn.suit Or cpp.number=cn.number Return(True)
				EndIf
				Return(False)
				EndMethod
	Method pick(c:_card)
				discard(c)
				EndMethod
	Method pickextern(c:_card,l:TList)
				l.addlast(c)
				EndMethod
	Method candrop:Int(list:TList,samesuit:Int=False)
	 			Return(False)
				EndMethod
	Method discard(card:_card)				
				'the pile is a bethoral pile
				Local ci=card.index()
				If game.pilediscardlist.firstlink()
				 Local pd:_pilediscard=game.getpilediscardminimum()	
				 Local vn:_vector3=New _vector3
				 Local dvx:_vector3=pd.dropvx()
				 Local dvy:_vector3=pd.dropvy()
				 Local vtp:_vector3=New _vector3
				 Local vtn:_vector3=New _vector3
				 vtp.set(0,0,10)
				 vtn.set(-40,40,-8)
				 vn.set(0,0,0)
				 card.curvespeed=30
				 card.curvevx.setvector(card.vx,dvx,vn,vn)
				 card.curvevy.setvector(card.vy,dvy,vn,vn)
				 'card.curvevx.v0.mul(game.scaleglobal);
				 'card.curvevx.v1.mul(game.scaleglobal);
				 card.curveposition.setvector(card.position,pd.dropposition(),vtn,vtp)
				 card.startcurve(game.solitaire.clock)				
				 Local u:_animationundo=game.createundo(30,20)
				 u.use(card,pd,True,0,0,0,Self,True,ci,0,0,card.curveposition,card.curvevx,card.curvevy)
				 'card.discard(True)	
				 card.deinsertpile()
				 card.insertpile(pd,True)
				EndIf						
				EndMethod
	Method pickslopeplane(c:_card,vvx:_vector3,vvy:_vector3)
				pickslopeplanearc(c,vvx,vvy)
				EndMethod
	Method pickslopeposition(c:_card,p:_vector3)
				pickslopepositionarc(c,p)
				EndMethod				
	Method dropposition:_vector3(backdrop=False)
				Return(droppositionarc(backdrop))
				EndMethod					
	Method dropvx:_vector3()
				Return(dropvxarc())
				EndMethod				
	Method dropvy:_vector3()
				Return(dropvyarc())
				EndMethod		
	Method setangle(c:_card)
				setanglearc(c)
				EndMethod						
	Method animate(clock:_clock)
				adjustcardpositionarc()
				adjustcardvyarc()
				adjustcardvxarc()
				animatemouseovercardarc()
				If status=0
				 If game.solitaire.mousebutton[0] Or game.solitaire.mousebutton[1]
				  status=1
				 EndIf
				 animateinput()
				EndIf
				If status=1
				 If game.solitaire.mousebutton[0]=False And game.solitaire.mousebutton[1]=False
				  status=0
				 EndIf
				EndIf
				animatepileinfo()				
				'updateshadow()
				EndMethod	
	Method createshadow()				
				'createshadowstripe()
				EndMethod
	Method updateshadow()				
				'updateshadowstripe()
				EndMethod
	Method save(s:TStream)
				WriteLine(s,"_pilebethoral")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,status)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				status=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf
				EndMethod								
	EndType
'******************************************************************************************************************
'										P I L E B L A N K E T
'******************************************************************************************************************
Type _pileblanket Extends _piletableau
	Field status=0
	Field dropass:_card=Null
	
	Method New()
				EndMethod
	Method Delete()
				EndMethod	
	Method init(t:_tableau,px#,py#)
				initpile(t.game,px,py)
				tableau=t
				linktableau=tableau.pilelist.addlast(Self)
				name=strpiletableau
				drawownshadow=False
				EndMethod				
	Method draw(gra:_graphics,cam:_camera)
				
				Local p:_vector3=New _vector3
				Local o:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				o.copy(position)
				
				 For Local x=0 To 13-1
				  position.x=o.x+Float(x)*tabx
				  
				  updatemesh()
				  mesh.clearvertexlight()
	    		  For Local lit:_light=EachIn game.solitaire.world.lightlist
				   mesh.determinevertexlight(lit)
				  Next
				  gra.blendmultiplicative()
				  mesh.draw(gra,cam)
				  gra.blend(False)
				 Next
				
				position.copy(o)				
	
				
				
				EndMethod							
	Method leftestcard:Int(c:_card)
				Local q:_vector3=New _vector3
				q.copy(position)
				q.z:-game.solitaire.cardtableaulift
				q.sub(c.position)
				If q.length()<0.1 Return(True)' weil es die linkeste karte ist
				Return(False)
				EndMethod
	Method rightestcard:Int(c:_card)
				Local q:_vector3=New _vector3
				Local tabx#=game.tabulatorx()

				q.copy(position)
				q.z:-game.solitaire.cardtableaulift
				q.x:+(cardlist.count()-1)*tabx
				q.sub(c.position)
				If q.length()<0.1 Return(True)' weil es die linkeste karte ist
				Return(False)
				EndMethod

	Method cardat:_card(o:_vector3)
				Local r:_card=Null
				Local h:_vector3=New _vector3
				For Local cit:_card=EachIn cardlist
				 If cit.curving=False
				  h.copy(o)
				  h.sub(cit.position)
				  If h.length()<0.1 r=cit
				 EndIf
				Next
				Return(r)
				EndMethod							
	Method canpick:Int(c:_card) 
				If giverestriction Return(False)
				If c.number=0 Return(False)
				'If game.cardcurving()=False Return(True)
				Return(True)
				EndMethod
	Method pick(c:_card)'picks only the card c , not others in list,to the picklist
				c.pick()
				EndMethod
	Method pickextern(c:_card,l:TList)
				l.addlast(c)
				EndMethod
				
	Method candrop:Int(list:TList,samesuit:Int=False)
				dropass=Null
				If takerestriction Return(False)
				If list.count()<>1 Return(False)
				Print "cabndrop"
				Local card:_card=_card(list.firstlink().value())
				Local tabx#=game.tabulatorx()			
				For Local cit:_card=EachIn cardlist
				 If (cit.inner() Or cit.innercard(card))

				  If cit.number=0
				   'zuerst prüfen ob cit die linkeste karte ist 
				   If leftestcard(cit) 
				    dropass=cit
				    Return(True)
				   EndIf
				   'die card cn ist diejenige die in der nähe von o liegt
				   Local o:_vector3=New _vector3
				   o.copy(cit.position)
				   o.x:-tabx
				   Local cn:_card=Null
				   For Local cii:_card=EachIn cardlist
					If cii<>cit And cii<>card
				     Local d:_vector3=New _vector3
				     d.copy(o)
				     d.sub(cii.position)
				     If d.length()<0.1 cn=cii
				    EndIf
				   Next
				   If cn=Null Return(False)'es gibt keinen nachbarn, fehler weil dies vorher abgefangen werden müßte
				   If cn.suit<>card.suit Return(False)
				   If cn.number=12 Return(False)
				   If (cn.number+1)<>card.number Return(False)
				   dropass=cit
				   Return(True)
				  EndIf
				 EndIf
				Next
	 			Return(False)
				EndMethod
	Method candropat:Int(card:_card,cd:_card)
				'kann die Karte "card" bei
				'position cd.position gedroppt werden?
				dropass=Null
				If cd.number<>0 Return(False)
				'zuerst prüfen ob cd die linkeste karte ist 
				If leftestcard(cd) 
				 dropass=cd
				 Return(True)
				EndIf
				'die card cn ist diejenige die in der nähe von o liegt
				Local o:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				o.copy(cd.position)
				o.x:-tabx
				Local cn:_card=cardat(o)
				If cn=Null Return(False)'es gibt keinen nachbarn, fehler weil dies vorher abgefangen werden müßte
				If cn.suit<>card.suit Return(False)
				If cn.number=12 Return(False)
				If (cn.number+1)<>card.number Return(False)
				dropass=cd
				Return(True)
				EndMethod				
	Method drop(clock:_clock)
				'drop the picked card to the this pile and record the moves
				If(game.picklist.firstlink())
				 Local c:_card=_card(game.picklist.firstlink().value())
				 swap(c,dropass,True)
				EndIf
				EndMethod 
	Method swap(c:_card,ass:_card,unused=False)				
				If c.picked c.depick(game.solitaire.clock)
				Local tquelle:_vector3=New _vector3
				Local tziel:_vector3=New _vector3
				Local cardquelle:_vector3=New _Vector3
				Local cardquellevx:_vector3=New _Vector3
				Local cardquellevy:_vector3=New _Vector3
				Local cardziel:_vector3=New _vector3
				Local cardzielvx:_vector3=New _vector3
				Local cardzielvy:_vector3=New _vector3
				
				tquelle.set(0,0,-10)
				tziel.set(0,0,10)
				
				If ass.curving 
				 cardziel.copy(ass.curveposition.o1) 
				 cardzielvx.copy(ass.curvevx.o1) 
				 cardzielvy.copy(ass.curvevy.o1) 
				Else 
				 cardziel.copy(ass.position)
				 cardzielvx.copy(ass.vx)
				 cardzielvy.copy(ass.vy)
				EndIf
				If c.curving 
				 cardquelle.copy(c.pickposition) 
				 cardquellevx.copy(c.pickvx) 
				 cardquellevy.copy(c.pickvy) 
				Else
				 cardquelle.copy(c.position)
				 cardquellevx.copy(c.vx)
				 cardquellevy.copy(c.vy)
				EndIf
				
				
				
				Local m:_animationundo=game.createundo(30,0.1,True)
				Local pilefrom:_pile=c.pile
				
				
				
				
				
				
				
				'Local usepick=False
				'If c.picked Or c.pickending usepick=True				
				'Print "swap usepick ="+usepick
				'If usepick c.deinsertpick()
				c.deinsertpile()
				Local v:_vector3=New _vector3
				Local dvx:_vector3=dropvx()
				Local dvy:_vector3=dropvy()
				c.curvespeed=20
			 	c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,10 ,0,0,-10)  
			 	c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,-5 ,0,0,-5)  
			    c.curveposition.setvector(c.position,cardziel,tquelle,tziel)
			    'If ass.curving v.copy(ass.curveposition.o1) Else v.copy(ass.position)
				'If usepick c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-3,0,0,0) Else c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-10,0,0,10)
			    c.startcurve(game.solitaire.clock)
			    'undo record move
			    Local cupo:_hermitecurve=New _hermitecurve
			    Local cuvx:_hermitecurve=New _hermitecurve
			    Local cuvy:_hermitecurve=New _hermitecurve
			    cupo.o0.copy(cardquelle)
			 	cupo.o1.copy(cardziel)'c.curveposition.o1)
			    cupo.v0.set(0,0,-10)
			 	cupo.v1.set(0,0,10)
				cuvx.o0.copy(cardquellevx)
				cuvx.o1.copy(cardzielvx)
				cuvx.v0.set(0,0,0)
				cuvx.v1.set(0,0,0)
		 		cuvy.o0.copy(cardquellevy)
		 		cuvy.o1.copy(cardzielvy)
				cuvy.v0.set(0,0,0)
			 	cuvy.v1.set(0,0,0)
			    'If usepick
			    ' cupo.o0.copy(c.pickposition)
				' cuvx.o0.copy(c.pickvx)
				' cuvy.o0.copy(c.pickvy)
			    'Else
			 	' cupo.o0.copy(c.curveposition.o0)
				' cuvx.o0.copy(c.curvevx.o0)
		 		' cuvy.o0.copy(c.curvevy.o0)
				'EndIf
			    cupo.updatelength()
			    cuvx.updatelength()
			    cuvy.updatelength()
				m.use(c,Self,True,0,0,0,pilefrom,True,0,0,0,cupo,cuvx,cuvy)
				'end undo record move
				Local asspilefrom:_pile=ass.pile
				c.insertpile(Self,True,0)
				v.set(0,0,0)
				ass.curvespeed=1000
			 	ass.curvevx.setvector(ass.vx,ass.vx, v,v)  
			 	ass.curvevy.setvector(ass.vy,ass.vy, v,v)  
				'If usepick ass.curveposition.setvector(ass.position,c.pickposition,v,v) Else ass.curveposition.setvector(ass.position,c.curveposition.o0,v,v)
				ass.curveposition.setvector(cardziel,cardquelle,v,v)
				ass.startcurve(game.solitaire.clock)
				ass.deinsertpile()
				m.use(ass,pilefrom,True,0,0,0,asspilefrom,True,0,0,0,ass.curveposition,ass.curvevx,ass.curvevy)
				ass.insertpile(pilefrom,True,0)
				EndMethod					
	Method dropvy:_vector3()
				Local v:_vector3=New _vector3
				v.set(0,game.cardheight,-game.solitaire.cardslope)
				Return(v)
				EndMethod		
	Method dropposition:_vector3(backdrop=False)
				Local v:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				v.copy(position)
				v.z:-game.solitaire.cardtableaulift
				v.x:+tabx*Float(cardlist.count())
				Return(v)
				EndMethod			
	Method adjustcardvy()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.curving=False And cit.picked=False
	     		   cit.vy.set(0,game.cardheight,-game.solitaire.cardslope)
				  EndIf
				 Next
				EndIf
				EndMethod
									
	Method adjustcardposition()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.picked=False And cit.curving=False cit.position.z=position.z-game.solitaire.cardtableaulift
				 Next
				EndIf
				EndMethod									
	Method animate(clock:_clock)
				If game.statsclosed=False 
				 Local s=-1
				 Local n=1
				 Local o:_vector3=New _vector3
				 o.copy(position)
				 o.z:-game.solitaire.cardtableaulift
				 Local stop=False
				 Local c:_card=Null
				 Local tabx#=game.tabulatorx()
				 Repeat
				  c=cardat(o)
				  If c
				   If s=-1 s=c.suit
				   If c.number<>n stop=True
				   If c.suit<>s stop=True
				  EndIf
				  If c And stop=False
				   game.discards:+1
				   o.x:+tabx 
				   n:+1
				  EndIf
				 Until c=Null Or stop
				EndIf
				adjustcardvy()
				adjustcardvxsingle()
				adjustcardposition()
				animateinput()
				For Local c:_card=EachIn cardlist
				 c.animate()				
				Next
				animatepileinfo()				
				EndMethod	
	Method save(s:TStream)
				WriteLine(s,"_pileblanket")
				WriteLine(s,savename)
				savepile(s)
				savepointer(s,dropass)
				WriteInt(s,status)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				loadpointer(s)
				status=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 dropass=_card(associatepointer())
				 releasepointer()
				EndIf
				EndMethod				
	EndType	
'******************************************************************************************************************
'										P I L E M A Z E
'******************************************************************************************************************
Type _pilemaze Extends _pileblanket
	Field size:Int=9
	Method initmaze(t:_tableau,px#,py#,d)
				initpile(t.game,px,py)
				tableau=t
				size=d
				linktableau=tableau.pilelist.addlast(Self)
				name=strpiletableau
				drawownshadow=False
				EndMethod					
	Method draw(gra:_graphics,cam:_camera)
				
				Local p:_vector3=New _vector3
				Local o:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				o.copy(position)
				
				 For Local x=0 To size-1
				  position.x=o.x+Float(x)*tabx
				  
				  updatemesh()
				  mesh.clearvertexlight()
	    		  For Local lit:_light=EachIn game.solitaire.world.lightlist
				   mesh.determinevertexlight(lit)
				  Next
				  gra.blendmultiplicative()
				  mesh.draw(gra,cam)
				  gra.blend(False)
				 Next
				
				position.copy(o)				
	
				
				
				EndMethod	
	Method canpick:Int(c:_card) 
				If giverestriction Return(False)
				If c.number=12 Return(False)
				'If game.cardcurving()=False Return(True)

				Return(True)
				EndMethod
	Method candrop:Int(list:TList,samesuit:Int=False)
				dropass=Null
				If takerestriction Return(False)
				If list.count()<>1 Return(False)
				Local card:_card=_card(list.firstlink().value())
				For Local cit:_card=EachIn cardlist
				 If (cit.inner() Or cit.innercard(card))
				  If cit.number=12
				   If candropcardatcard(card,cit)
				    dropass=cit
				    Return(True)
				   EndIf
				  EndIf
				 EndIf
				Next
	 			Return(False)
				EndMethod
	Method candropat:Int(card:_card,cd:_card)
				'kann die Karte "card" bei
				'karte cd gedroppt werden?
				dropass=Null
				If cd.number<>12 Return(False)
				If candropcardatcard(card,cd)
				 dropass=cd
				 Return(True)
				EndIf
				EndMethod	
	Method candropcardatcard:Int(card:_card,cit:_card)				
				Local cp:_card=Null
				Local cn:_card=Null
			    Local o:_vector3=New _vector3
			    Local tabx#=game.tabulatorx()
				'------------------------------------------------------------------die previous card cp ermitteln :				
				'die card cp ist diejenige die in der nähe von o liegt
				'zuerst prüfen ob cit die linkeste karte ist 
				If leftestcard(cit) 
				 Local pp:_pilemaze
				 If linktableau.prevlink()
				  pp=_pilemaze(linktableau.prevlink().value())
				 Else
				  pp=_pilemaze(game.tableau.pilelist.lastlink().value())
				 EndIf
				 o.copy(pp.position)
				 o.x:+tabx*(pp.cardlist.count()-1)
				 o.z:-game.solitaire.cardtableaulift
				 cp=pp.cardat(o)
				Else
				 cp=Null
				 Local o:_vector3=New _vector3
				 o.copy(cit.position)
				 o.x:-tabx
				 For Local cii:_card=EachIn cardlist
				  If cii<>cit And cii<>card
				   Local d:_vector3=New _vector3
				   d.copy(o)
				   d.sub(cii.position)
				   If d.length()<0.1 cp=cii
				  EndIf
				 Next
				EndIf
				'------------------------------------------------------------------die next card cn ermitteln :				
				'die card cp ist diejenige die in der nähe von o liegt
				'zuerst prüfen ob cit die linkeste karte ist 
				If rightestcard(cit) 
				 Local pn:_pilemaze
				 If linktableau.nextlink()
				  pn=_pilemaze(linktableau.nextlink().value())
				 Else
				  pn=_pilemaze(game.tableau.pilelist.firstlink().value())
				 EndIf
				 o.copy(pn.position)
				 o.z:-game.solitaire.cardtableaulift
				 cn=pn.cardat(o)
				Else
				 cn=Null
				 o.copy(cit.position)
				 o.x:+tabx
				 For Local cii:_card=EachIn cardlist
				  If cii<>cit And cii<>card
				   Local d:_vector3=New _vector3
				   d.copy(o)
				   d.sub(cii.position)
				   If d.length()<0.1 cn=cii
				  EndIf
				 Next
				EndIf
				'--------------------------------------------------- auswertung --------------------------------
				If cp' Or cn=Null Return(False)'fehler, maze hat zyklische piles
				 If (cp.suit=card.suit) And ((cp.number+1)=card.number) And cp.number<>12
				  Return(True)
				 EndIf
				EndIf
				If cn
				 If (cn.suit=card.suit) And ((cn.number-1)=card.number) And cn.number<>12
				  Return(True)
				 EndIf
				EndIf
				Return(False)
				EndMethod
	Method animate(clock:_clock)
				If game.statsclosed=False 
				 Rem
				 Local s=-1
				 Local n=1
				 Local o:_vector3=New _vector3
				 o.copy(position)
				 o.z:-game.solitaire.cardtableaulift
				 Local stop=False
				 Local c:_card=Null
				 Repeat
				  c=cardat(o)
				  If c
				   If s=-1 s=c.suit
				   If c.number<>n stop=True
				   If c.suit<>s stop=True
				  EndIf
				  If c And stop=False
				   game.discards:+1
				   o.x:+tabx 
				   n:+1
				  EndIf
				 Until c=Null Or stop
				 EndRem
				
				 If linktableau.prevlink()=Null'nur der erste mazepile zählt die punkte
				  Local ace:_card[4]
				  Local acepos:_vector3[4]
				  Local ai=0
				  For Local i=0 To 3 
				   acepos[i]=New _vector3
				   ace[i]=Null
				  Next
				  ai=0
				  For Local pit:_piletableau=EachIn game.tableau.pilelist
				   'Print "itit"
				   For Local cit:_card=EachIn pit.cardlist
				    If cit.number=0
				     ace[ai]=cit
				     acepos[ai].copy(cit.position)
				     ai:+1
				    EndIf
				   Next
				  Next
				  For ai=0 To 3 
				   If ace[ai]
				    Local n=0
				    Local s=ace[ai].suit
				    Local stop=False
				    Local pit:_pilemaze=_pilemaze(ace[ai].pile)
				   
				    pit=iteratevector(acepos[ai],pit)
					Local cit:_card
				    Repeat
				     cit=pit.cardat(acepos[ai])
				     If cit
				      If cit.number=n+1 And cit.suit=s And cit.number<12
				       n:+1
				       game.discards:+1
				       pit=iteratevector(acepos[ai],pit)
				      Else
				       stop=True
				      EndIf
					 EndIf
				    Until stop Or cit=Null
				   EndIf
				  Next
				 EndIf
				EndIf
				adjustcardvy()
				adjustcardvxsingle()
				adjustcardposition()
				animateinput()
				For Local c:_card=EachIn cardlist
				 c.animate()				
				Next
				animatepileinfo()				
				EndMethod	
	Method iteratevector:_pilemaze(v:_vector3,pm:_pilemaze)				
				Local cc#=cardlist.count()-1
				Local fp:_pilemaze=_pilemaze(game.tableau.pilelist.firstlink().value())
				Local lp:_pilemaze=_pilemaze(game.tableau.pilelist.lastlink().value())
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				v.x:+tabx
				If v.x>position.x+cc*tabx+0.5
				 v.x=position.x
				 v.y:-taby
				 If v.y<lp.position.y-0.5
				  v.y=fp.position.y
				 EndIf
				 If pm.linktableau.nextlink()
				  pm=_pilemaze(pm.linktableau.nextlink().value())
				 Else
				  pm=_pilemaze(game.tableau.pilelist.firstlink().value())
				 EndIf
				EndIf
				
				Return(pm)
				EndMethod
	Method save(s:TStream)
				WriteLine(s,"_pilemaze")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,size)
				savepointer(s,dropass)
				WriteInt(s,status)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				size=ReadInt(s)
				loadpointer(s)
				status=ReadInt(s)
				EndMethod		
	EndType
	
'******************************************************************************************************************
'										P I L E A R R A Y
'******************************************************************************************************************
Type _pilearray Extends _pile
	Field feld:_card[,]=Null
	Field dimx=1
	Field dimy=1
	Field gamearraylink:TLink=Null
	Field dropx:Int=0
	Field dropy:Int=0
	Method init(g:_game,px#,py#,dx,dy)
				initpile(g,px,py)
				dimx=dx
				dimy=dy
				gamearraylink=game.pilearraylist.addlast(Self)
				resetfeld()
				name=strpilearray
				EndMethod	
	Method resetfeld()
				feld=New _card[dimx,dimy]
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  feld[x,y]=Null
				 Next
				Next
				EndMethod
	Method draw(gra:_graphics,cam:_camera)
				Local p:_vector3=New _vector3
				Local o:_vector3=New _vector3
				Local tabx#=game.tabulatorx()				
				Local taby#=game.tabulatory()				
				o.copy(position)
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  position.x=o.x+Float(x)*tabx
				  position.y=o.y-Float(y)*taby
				  updatemesh()
				  mesh.clearvertexlight()
	    		  For Local lit:_light=EachIn game.solitaire.world.lightlist
				   mesh.determinevertexlight(lit)
				  Next
				  gra.blendmultiplicative()
				  mesh.draw(gra,cam)
				  gra.blend(False)
				 Next
				Next
				position.copy(o)
				EndMethod				
	Method canturn:Int(c:_card)
				If c.number=0 And c.suit=3 Return(False) Else Return(True)
				EndMethod			
	Method turn(c:_card,clock:_clock,spd#,useundo)				
				Local v:_vector3=New _vector3
				c.deinsertpile()
			    v.copy(droppositionat(c.arrayindex[0],c.arrayindex[1]))
				c.insertpile(Self,True)
				'nun auf die dropposition v den differnzvektor mit der next karte bilden
				'wenn es keiune nächste karte gibt dann pileposition nehmen
				c.curvespeed=spd
				c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-10,0,0,10)
			 	c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, -c.vx.x,-c.vx.y,-c.vx.z, 0,0,10 ,0,0,-10)  
			 	c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z-game.solitaire.cardslope, 0,0,0 ,0,0,0)  
			     'undo record move
			    If useundo
				 Local m:_animationundo=game.createundo(spd,1)
				 m.use(c,Self,True,c.arrayindex[0],c.arrayindex[1],0,Self,True,c.arrayindex[0],c.arrayindex[1],0,c.curveposition,c.curvevx,c.curvevy)
				EndIf
				If game.preview=False playsoundstretched(game.solitaire.sturn,0.7,0.95,1.05)
				'end undo record move
				c.startcurve(clock)	
				EndMethod					
	Method canpick:Int(c:_card)
				If giverestriction Return(False)
				Return(True)
				EndMethod	
	Method pick(c:_card)
				c.pick()	
				EndMethod
	Method pickextern(c:_card,l:TList)
				l.addlast(c)
				EndMethod
	Method candrop:Int(list:TList,samesuit:Int=False)
				If list.count()>1 Return(False)
				Local c:_card=_card(list.firstlink().value())
				Local cm:_vector3=New _Vector3
				Local tabx#=game.tabulatorx()				
				Local taby#=game.tabulatory()				

				cm.copy(c.position)
				cm.sub(game.solitaire.cam.position)
				Local c0x#
				Local c0y#
				'g: cam.position + cm*a
				'pz= cam.postion.z + cm.z*a
				Local alpha#=-game.solitaire.cam.position.z/cm.z
				c0x=game.solitaire.cam.position.x+ cm.x*alpha
				c0y=game.solitaire.cam.position.y+ cm.y*alpha
				dropx= ((c0x)-(position.x-tabx*0.5))/tabx
				dropy=-((c0y)-(position.y+taby*0.5))/taby
				Print "cx="+c0x
				Print "p0x="+position.x
				Print "px="+(position.x-tabx*0.5)
				Print "dxy="+dropx+"  "+dropy
				Return(candropat(c,dropx,dropy))
				EndMethod	
	Method candropat:Int(c:_card,dropx,dropy)
				If dropx>=0 And dropx<dimx And dropy>=0 And dropy<dimy 
				 If Abs(c.arrayindex[0]-dropx)>1 Return(False)
				 If Abs(c.arrayindex[1]-dropy)>1 Return(False)
				 If Abs(c.arrayindex[0]-dropx)=1 And Abs(c.arrayindex[1]-dropy)<>0 Return(False)
				 If Abs(c.arrayindex[1]-dropy)=1 And Abs(c.arrayindex[0]-dropx)<>0 Return(False)
				 If c.number=11
				  If dropx<>0 If feld[dropx-1,dropy] If feld[dropx-1,dropy].number=12 And feld[dropx-1,dropy].suit<>c.suit Return(False)
				  If dropx<>4 If feld[dropx+1,dropy] If feld[dropx+1,dropy].number=12 And feld[dropx+1,dropy].suit<>c.suit Return(False)
				  If dropy<>0 If feld[dropx,dropy-1] If feld[dropx,dropy-1].number=12 And feld[dropx,dropy-1].suit<>c.suit Return(False)
				  If dropy<>4 If feld[dropx,dropy+1] If feld[dropx,dropy+1].number=12 And feld[dropx,dropy+1].suit<>c.suit Return(False)
				 EndIf
				 If c.number=12
				  If dropx<>0 If feld[dropx-1,dropy] If feld[dropx-1,dropy].number=11 And feld[dropx-1,dropy].suit<>c.suit Return(False)
				  If dropx<>4 If feld[dropx+1,dropy] If feld[dropx+1,dropy].number=11 And feld[dropx+1,dropy].suit<>c.suit Return(False)
				  If dropy<>0 If feld[dropx,dropy-1] If feld[dropx,dropy-1].number=11 And feld[dropx,dropy-1].suit<>c.suit Return(False)
				  If dropy<>4 If feld[dropx,dropy+1] If feld[dropx,dropy+1].number=11 And feld[dropx,dropy+1].suit<>c.suit Return(False)
				 EndIf
				 If feld[dropx,dropy]=Null Return(True)
				EndIf
				Return(False)
				EndMethod				
	Method drop(clock:_clock)
				'drop the picklist to the pile pit and record the moves
				Local i#=0
				Local m:_animationundo=game.createundo(30,0.1,True)
				If game.picklist.count()=13 If game.preview=False playsoundstretched(game.solitaire.smove,1,0.95,1.05)
				While(game.picklist.firstlink())
				 Local c:_card=_card(game.picklist.firstlink().value())
				 Local pilefrom:_pile=c.pile
				 c.depick(clock)
				 Local v:_vector3=New _vector3
				 Local dvx:_vector3=dropvx()
				 Local dvy:_vector3=dropvy()
				 c.curvespeed=20
				
				 If c.backsided dvx.mul(-1)
			 	 c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,-2*i ,0,0,0)  
			 	 c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,-2*i ,0,0,0)  
			     v.copy(droppositionat(dropx,dropy))
				 c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-3,0,0,0)
			     c.startcurve(clock)
			     'undo record move
			     Local cupo:_hermitecurve=New _hermitecurve
			     Local cuvx:_hermitecurve=New _hermitecurve
			     Local cuvy:_hermitecurve=New _hermitecurve
			     cupo.o0.copy(c.pickposition)
			     cupo.v0.set(0,0,-10)
			 	 cupo.o1.copy(c.curveposition.o1)
			 	 cupo.v1.set(0,0,10)
			     cupo.updatelength()
			
				 cuvx.o0.copy(c.pickvx)
				 cuvx.v0.set(0,0,0)
				 cuvx.o1.copy(c.curvevx.o1)
				 cuvx.v1.set(0,0,0)
			     cuvx.updatelength()

				 cuvy.o0.copy(c.pickvy)
				 cuvy.v0.set(0,0,0)
				 cuvy.o1.copy(c.curvevy.o1)
				 cuvy.v1.set(0,0,0)
			     cuvy.updatelength()
				 m.use(c,Self,True,dropx,dropy,0,pilefrom,True,c.arrayindex[0],c.arrayindex[1],0,cupo,cuvx,cuvy)
				 'end undo record move
				 c.deinsertpile()
				 c.deinsertpyramid()
				 c.deinsertlabyrinth()
				 c.deinsertarray()
				 c.deinsertsweetmatch()
				 c.insertpile(Self,True)
				 c.insertarray(Self,dropx,dropy)
				 i:+1
				Wend
				EndMethod		
	Method move(sx,sy,dx,dy)
				If feld[sx,sy] And feld[dx,dy]=Null
				 Local m:_animationundo=game.createundo(30,0.1,True)
				 Local c:_card=feld[sx,sy]
				 
				 Local pilefrom:_pile=c.pile
				 Local v:_vector3=New _vector3
				 Local dvx:_vector3=dropvx()
				 Local dvy:_vector3=dropvy()
				 c.curvespeed=20
				
				 If c.backsided dvx.mul(-1)
			 	 c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,-8 ,0,0,0)  
			 	 c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,-8 ,0,0,0)  
			     v.copy(droppositionat(dx,dy))
				 c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-5,0,0,5)
			     c.startcurve(game.solitaire.clock)
			     'undo record move
			     Local cupo:_hermitecurve=New _hermitecurve
			     Local cuvx:_hermitecurve=New _hermitecurve
			     Local cuvy:_hermitecurve=New _hermitecurve
			     cupo.o0.copy(c.curveposition.o0)
			     cupo.v0.set(0,0,-10)
			 	 cupo.o1.copy(c.curveposition.o1)
			 	 cupo.v1.set(0,0,10)
			     cupo.updatelength()
			
				 cuvx.o0.copy(c.curvevx.o0)
				 cuvx.v0.set(0,0,0)
				 cuvx.o1.copy(c.curvevx.o1)
				 cuvx.v1.set(0,0,0)
			     cuvx.updatelength()

				 cuvy.o0.copy(c.curvevy.o0)
				 cuvy.v0.set(0,0,0)
				 cuvy.o1.copy(c.curvevy.o1)
				 cuvy.v1.set(0,0,0)
			     cuvy.updatelength()
				 m.use(c,Self,True,dx,dy,0,pilefrom,True,c.arrayindex[0],c.arrayindex[1],0,cupo,cuvx,cuvy)
				 'end undo record move
				 c.deinsertpile()
				 c.deinsertarray()
				 c.insertpile(Self,True)
				 c.insertarray(Self,dx,dy)
				
				
				EndIf
				EndMethod							
	Method inner:Int(withcards=True)	
				Local a#
				Local b#
				Local vx#=game.cardwidth
				Local vy#=game.cardheight
				Local vxh:_vector3=New _vector3
				Local vyh:_vector3=New _vector3
				Local mvn:_vector3=New _vector3
				Local e:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				
				vxh.set(vx,0,0)
				vyh.set(0,vy,0)
				vxh.norm()
				vyh.norm()
				vxh.mul(tabx*dimx*0.5)
				vyh.mul(taby*dimy*0.5)
				mvn.copy(game.solitaire.mousevector)
				mvn.mul(-1)
				e.copy(game.solitaire.cam.position)
				Local h:_vector3=New _vector3
				h.copy(position)
				h.x:-vx*0.5 
				h.y:+vy*0.5
				h.add(vxh)
				h.sub(vyh)
				
				e.sub(h)
				Local D#=determine3(vxh,vyh,mvn)
				If Abs(D)>nearzero
				 a=determine3(e,vyh,mvn)/D
				 If (a>=-1) And (a<=1)
				  b=determine3(vxh,e,mvn)/D
				  If (b>=-1) And (b<=1) Return(True)
				 EndIf
				EndIf
				Return(False)
				EndMethod					
			
	Method droppositionat:_vector3(fx,fy)
				Local v:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				v.copy(position)
				v.x:+tabx*fx
				v.y:-taby*fy
				v.z:-game.solitaire.cardtableaulift
				Return(v)
				EndMethod				
	Method dropvy:_vector3()
				Local v:_vector3=New _vector3
				v.set(0,game.cardheight,-game.solitaire.cardslope)
				Return(v)
				EndMethod	
	Method adjustcardposition()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.picked=False And cit.curving=False cit.position.z=position.z-game.solitaire.cardtableaulift
				 Next
				EndIf
				EndMethod					
	Method adjustcardvy()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.curving=False And cit.picked=False
	     		   cit.vy.set(0,game.cardheight,-game.solitaire.cardslope)
				  EndIf
				 Next
				EndIf
				EndMethod					

	Method animateinput()
				Local mx#=game.solitaire.mouse.x'MouseX()
				Local my#=game.solitaire.mouse.y'MouseY()
				Local mb[]=[game.solitaire.mousebutton[0],game.solitaire.mousebutton[1]]
				Local i
				Local cf:_card=Null
				If game.allowpick And game.animationlist.firstlink()=Null And game.solitaire.guisystem.mouseovergui()=False
				 If (mb[0] Or mb[1])
				  For Local cit:_card=EachIn cardlist
				   If cit.inner() And cf=Null cf=cit
				  Next
				  If cf
				   '------------------------------- pick und autoplay check left -------------
				   If mb[0]
				    Local doppel=False
				    If cf.clickleft=False 
				     If game.solitaire.clock.ms()-cf.clicktime<300 doppel=True
				      cf.clickleft=True
				      cf.clicktime=game.solitaire.clock.ms()
				     EndIf
				     If doppel
				      If game.solitaire.clickplaydouble 
  			           If cf.pile.canpick(cf) 
				       game.clickplay(cf)
					   cf.doubleclicked=True
					  EndIf
		 		     EndIf
	 			    Else
		 		     If cf.canpick() 
		 		      If cf.picked=False
		 		       cf.insertpick()
 				      EndIf 
				     EndIf 
  				    EndIf
			       EndIf'mb0
				   '------------------------------- autoplay check right ----------------------
	               If cf.curving=False And mb[1] And cf.canpick() And game.solitaire.clickplayright game.clickplay(cf)
			      EndIf'cf
			     EndIf'mbx
				 
				 For Local cit:_card=EachIn cardlist
				  If mb[0]=False
				   If cit.clickleft=True
				    cit.clickleft=False
				   EndIf
				  EndIf
				 Next
				
				EndIf
				EndMethod				
	Method animate(c:_clock)
	  			If game.statsclosed=False  
	   			 'links
	   		     If feld[1,2]
	  			  If feld[1,2].number=12
	  			   game.discards:+1
	 			   If feld[0,2]
	  				If feld[0,2].number=11 And feld[0,2].suit=feld[1,2].suit game.discards:+1
				   EndIf  
				  EndIf
	 			 EndIf
	   			 'rechts
	   		     If feld[3,2]
	  			  If feld[3,2].number=12
	  			   game.discards:+1
	 			   If feld[4,2]
	  				If feld[4,2].number=11 And feld[4,2].suit=feld[3,2].suit game.discards:+1
				   EndIf  
				  EndIf
	 			 EndIf
	   			 'oben
	   		     If feld[2,1]
	  			  If feld[2,1].number=12
	  			   game.discards:+1
	 			   If feld[2,0]
	  				If feld[2,0].number=11 And feld[2,0].suit=feld[2,1].suit game.discards:+1
				   EndIf  
				  EndIf
	 			 EndIf
	   			 'unten
	   		     If feld[2,3]
	  			  If feld[2,3].number=12
	  			   game.discards:+1
	 			   If feld[2,4]
	  				If feld[2,4].number=11 And feld[2,4].suit=feld[2,3].suit game.discards:+1
				   EndIf  
				  EndIf
	 			 EndIf
				EndIf
				adjustcardvy()
				adjustcardvxsingle()
				adjustcardposition()
				animateinput()
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next
				animatepileinfo()				
				EndMethod				
	Method save(s:TStream)
				WriteLine(s,"_pilearray")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,dimx)
				WriteInt(s,dimy)
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  savepointer(s,feld[x,y])
				 Next
				Next
				WriteInt(s,dropx)
				WriteInt(s,dropy)
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				dimx=ReadInt(s)
				dimy=ReadInt(s)
				feld=New _card[dimx,dimy]
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  loadpointer(s)
				 Next
				Next
				dropx=ReadInt(s)
				dropy=ReadInt(s)
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 For Local y=0 To dimy-1 
				  For Local x=0 To dimx-1 
				   feld[x,y]=_card(associatepointer())
				  Next
				 Next
				 releasepointer()
				EndIf
				EndMethod					
	
	EndType
'******************************************************************************************************************
'										P I L E L A B Y R I N T H 
'******************************************************************************************************************
Type _pilelabyrinth Extends _pile
	Field feld:_card[,]=Null
	Field dimx=1
	Field dimy=1
	Field gamelabyrinthlink:TLink=Null
	Field fillfirst=True
	Field bothdirection=False
	Method init(g:_game,px#,py#,dx,dy)
				initpile(g,px,py)
				dimx=dx
				dimy=dy
				gamelabyrinthlink=game.pilelabyrinthlist.addlast(Self)
				resetfeld()
				name=strpilelabyrinth
				EndMethod	
	Method resetfeld()
				feld=New _card[dimx,dimy]
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  feld[x,y]=Null
				 Next
				Next
				EndMethod
						
	Method draw(gra:_graphics,cam:_camera)
				Local p:_vector3=New _vector3
				Local o:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				o.copy(position)
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  position.x=o.x+Float(x)*tabx
				  position.y=o.y-Float(y)*taby
				  updatemesh()
				  mesh.clearvertexlight()
	    		  For Local lit:_light=EachIn game.solitaire.world.lightlist
				   mesh.determinevertexlight(lit)
				  Next
				  gra.blendmultiplicative()
				  mesh.draw(gra,cam)
				  gra.blend(False)
				 Next
				Next
				position.copy(o)
				EndMethod				
	Method hasfreeline:Int()
				Local l=freeline()
				If l=-1 Return(False) Else Return(True)
				EndMethod				
	Method freeline:Int()
				Local free=-1
				For Local y=0 To dimy-1
				 If free=-1
				  Local lf=True
				  For Local x=0 To dimx-1
				   If feld[x,y]<>Null lf=False
				  Next
				  If lf free=y
				 EndIf
				Next
				Return(free)
				EndMethod					
	Method canpick:Int(c:_card)
				If giverestriction Return(False)
				'----------------------------- originale regeln ---------------------
				Local cfx=c.labindex[0]'Feldindex der Karte x
				Local cfy=c.labindex[1]'Feldindex der Karte y
				If cfy=0 Return(True)'Karte in oberster Zeile
				If cfy=dimy-1 Return(True)'Karte in unterster Zeile
				If feld[cfx,cfy-1]=Null Return(True)'über der Karte ist leeres Feld
				If feld[cfx,cfy+1]=Null Return(True)'unter der Karte ist leeres Feld
				'--------------------------------------------------------------------
				If bothdirection
				 If cfx=0 Return(True)'Karte in linkesteer Spalte
				 If cfx=dimx-1 Return(True)'Karte in rechtester Spalte
				 If feld[cfx-1,cfy]=Null Return(True)'links der Karte ist leeres Feld
				 If feld[cfx+1,cfy]=Null Return(True)'rechts der Karte ist leeres Feld
				EndIf
				
				Return(False)
				EndMethod	
	Method pick(c:_card)
				c.pick()	
				EndMethod
	Method pickextern(c:_card,l:TList)
				l.addlast(c)
				EndMethod
				
	Method candrop:Int(list:TList,samesuit:Int=False)
				Return(False)
				EndMethod	
				
	Method droppositionat:_vector3(fx,fy)
				Local v:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				v.copy(position)
				v.x:+tabx*fx
				v.y:-taby*fy
				v.z:-game.solitaire.cardtableaulift
				Return(v)
				EndMethod				
	Method dropvy:_vector3()
				Local v:_vector3=New _vector3
				v.set(0,game.cardheight,-game.solitaire.cardslope)
				Return(v)
				EndMethod	
	Method adjustcardposition()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.picked=False And cit.curving=False cit.position.z=position.z-game.solitaire.cardtableaulift
				 Next
				EndIf
				EndMethod					
	Method adjustcardvy()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.curving=False And cit.picked=False
	     		   cit.vy.set(0,game.cardheight,-game.solitaire.cardslope)
	 			   'cit.normcardplane()
				  EndIf
				 Next
				EndIf
				EndMethod					
				
	Method fillfirstline(m:_animationundo)
				Local ps:_pilestock=game.pilestock(0)
				If ps And fillfirst
				 For Local i=0 To dimx-1
				  If feld[i,0]=Null
				   Local it:TLink=ps.cardlist.firstlink()
				   If it
				    Local c:_card=_card(it.value())
				    'pilefrom=c.pile
				    c.deinsertpile()
				    Local v:_vector3=New _vector3
				    Local dvx:_vector3=dropvx()
				    Local dvy:_vector3=dropvy()
			        v.copy(droppositionat(i,0))
				    c.curvespeed=20
				    c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-13,0,0,20)
			 	    c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,-10 ,0,0,+10)  
			 	    c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,-2*i ,0,0,0)  
			        c.startcurve(game.solitaire.clock)
					c.insertpile(Self,True)
					c.insertlabyrinth(Self,i,0)
				    m.use(c,Self,True,i,0,0,ps,True,0,0,0,c.curveposition,c.curvevx,c.curvevy)

				   EndIf
				  EndIf
				 Next
				EndIf
				EndMethod	
	Method animate(c:_clock)
				adjustcardvy()
				adjustcardvxsingle()
				adjustcardposition()
				animateinput()
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next
				animatepileinfo()				
				EndMethod				
	Method save(s:TStream)
				WriteLine(s,"_pilelabyrinth")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,dimx)
				WriteInt(s,dimy)
				WriteInt(s,fillfirst)
				WriteInt(s,bothdirection)
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  savepointer(s,feld[x,y])
				 Next
				Next
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				dimx=ReadInt(s)
				dimy=ReadInt(s)
				fillfirst=ReadInt(s)
				bothdirection=ReadInt(s)
				feld=New _card[dimx,dimy]
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  loadpointer(s)
				 Next
				Next
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 For Local y=0 To dimy-1 
				  For Local x=0 To dimx-1 
				   feld[x,y]=_card(associatepointer())
				  Next
				 Next
				 releasepointer()
				EndIf
				EndMethod					
	
	EndType


'******************************************************************************************************************
'										P I L E S W E E T M A T C H
'******************************************************************************************************************
Type _pilesweetmatch Extends _pile
	Field feld:_card[,]=Null
	Field status:Int[,]=Null
	Field blase:_blase[,]=Null
	Field dimx=1
	Field dimy=1
	Field gamesweetmatchlink:TLink=Null
	Field dropcard:_card=Null	
	
	
	'private, no storage
	Field dir=0
	Field row:TList=Null		
	Field rowdir=0		
	Method New()
				row=CreateList()
				nopickifcardcurving=False
				EndMethod
	Method init(g:_game,px#,py#,dx,dy)
				initpile(g,px,py)
				dimx=dx
				dimy=dy
				gamesweetmatchlink=game.pilesweetmatchlist.addlast(Self)
				resetfeld()
				name=strpilesweetmatch
				EndMethod	
	Method resetfeld()
				feld=New _card[dimx,dimy]
				status=New Int[dimx,dimy]
				blase=New _blase[dimx,dimy]
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  feld[x,y]=Null
				  status[x,y]=0
				  blase[x,y]=Null
				 Next
				Next
				EndMethod
	Method updateblase()
				Local o:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  If status[x,y]=3
				   blase[x,y]=New _blase
				   o.copy(position)
				   o.x=o.x+Float(x)*tabx
				   o.y=o.y-Float(y)*taby
				   o.x:-tabx/2
				   o.y:+taby/2
				   blase[x,y].Create(game.solitaire,game,o,tabx,taby,4,4,game.solitaire.tblase,game.solitaire.tblase)
				  EndIf
				 Next
			    Next
				EndMethod
						
	Method draw(gra:_graphics,cam:_camera)
				Local p:_vector3=New _vector3
				Local o:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				o.copy(position)
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  If status[x,y]<>1 And status[x,y]<>2'visible and unblocked
				   position.x=o.x+Float(x)*tabx
				   position.y=o.y-Float(y)*taby
				   updatemesh()
				   mesh.clearvertexlight()
	    		   For Local lit:_light=EachIn game.solitaire.world.lightlist
				    mesh.determinevertexlight(lit)
				   Next
				   'If status[x,y]<>3
				   ' Local p:_polygon=_polygon(mesh.polygonlist.firstlink().value())
				   ' p.texture[0,0]=game.solitaire.tempty
				   'Else
				   ' Local p:_polygon=_polygon(mesh.polygonlist.firstlink().value())
				   ' p.texture[0,0]=game.solitaire.temptykey
				   'EndIf
				   mesh.draw(gra,cam)
				   

				
					
				
				  EndIf
				 Next
				Next
				position.copy(o)
				EndMethod				
	Method canpick:Int(c:_card)
				If giverestriction Return(False)
				Return(True)
				EndMethod	
	Method pick(c:_card)
				If c.sweetmatch
				 Local x=c.sweetindex[0]
				 Local y=c.sweetindex[1]
				 If blase[x,y]
				  blase[x,y].impuls(3)
				 EndIf
				EndIf
				c.pick()	
				EndMethod
	Method pickextern(c:_card,l:TList)
				l.addlast(c)
				EndMethod
				
	Method neighbour(c0:_card,c1:_card)
				Local c0x=c0.sweetindex[0]
				Local c0y=c0.sweetindex[1]
				Local c1x=c1.sweetindex[0]
				Local c1y=c1.sweetindex[1]
				Local dx=Abs(c0x-c1x)
				Local dy=Abs(c0y-c1y)
				If dx=1 And dy=0 Return(True)
				If dy=1 And dx=0 Return(True)
				Return(False)
				EndMethod	
	Method match:Int(c0:_card,c1:_card)
				If c0.suit=c1.suit And c0.number=c1.number Return(True)
				Return(False)
				EndMethod			
	Method cardbuildsrow(c:_card,x,y)
				Local s=c.suit
				Local c0:_card=Null
				Local c1:_card=Null
				'----------------nach rechts prüfen
				c0=Null
				c1=Null
				If x<dimx-1 c0=feld[x+1,y]
				If x<dimx-2 c1=feld[x+2,y]
				If c0 And c1
				 If match(c0,c) And match(c1,c)
				  rowdir=0
				  Return(True)
				 EndIf
				EndIf
				'----------------nach links prüfen
				c0=Null
				c1=Null
				If x>0 c0=feld[x-1,y]
				If x>1 c1=feld[x-2,y]
				If c0 And c1
				 If match(c0,c) And match(c1,c)
				  rowdir=0
				  Return(True)
				 EndIf
				EndIf
				'----------------nach unten prüfen
				c0=Null
				c1=Null
				If y<dimy-1 c0=feld[x,y+1]
				If y<dimy-2 c1=feld[x,y+2]
				If c0 And c1
				 If match(c0,c) And match(c1,c) 
				  rowdir=1
				  Return(True)
				 EndIf
				
				EndIf
				'---------------nach oben prüfen
				c0=Null
				c1=Null
				If y>0 c0=feld[x,y-1]
				If y>1 c1=feld[x,y-2]
				If c0 And c1
				 If match(c0,c) And match(c1,c) 
				  rowdir=1
				  Return(True)
				 EndIf
				
				EndIf
				'--------------mitte horizontal prüfen
				c0=Null
				c1=Null
				If x>0 c0=feld[x-1,y]
				If x<dimx-1 c1=feld[x+1,y]
				If c0 And c1
				 If match(c0,c) And match(c1,c) 
				  rowdir=0
				  Return(True)
				 EndIf
				
				EndIf
				'--------------mitte vertikal prüfen
				c0=Null
				c1=Null
				If y>0 c0=feld[x,y-1]
				If y<dimy-1 c1=feld[x,y+1]
				If c0 And c1
				 If match(c0,c) And match(c1,c) 
				  rowdir=1
				  Return(True)
				 EndIf
				
				EndIf
				
				
				Return(False)
				EndMethod							
	Method swapbuildsrow:Int(c:_card,cs:_card)
	
				Local cx=c.sweetindex[0]
				Local cy=c.sweetindex[1]
				Local csx=cs.sweetindex[0]
				Local csy=cs.sweetindex[1]
				Local r=False
				c.deinsertsweetmatch()
				cs.deinsertsweetmatch()
				c.insertsweetmatch(Self,csx,csy)
				cs.insertsweetmatch(Self,cx,cy)
				If cardbuildsrow(cs,cx,cy) r=True
				If cardbuildsrow(c,csx,csy) r=True
				c.deinsertsweetmatch()
				cs.deinsertsweetmatch()
				c.insertsweetmatch(Self,cx,cy)
				cs.insertsweetmatch(Self,csx,csy)
				Return(r)
				
				EndMethod				
	Method candrop:Int(list:TList,samesuit:Int=False)
				dropcard=Null
				If takerestriction Return(False)
				'Print "ii0"
				If list.count()<>1 Return(False)
				'Print "ii1"
				Local card:_card=_card(list.firstlink().value())
				For Local cit:_card=EachIn cardlist
				 'Print "ii"
				 If cit<>card And (cit.inner() Or cit.innercard(card))
				  If neighbour(card,cit) And swapbuildsrow(card,cit)
				   If cit.curving=False And cit.picked=False
			        'Print "iidrop"
				    dropcard=cit
				    Return(True)
				   EndIf
				  EndIf
				 EndIf
				Next
	 			Return(False)
				EndMethod
	Method drop(clock:_clock)
				'drop the picked card to the this pile and record the moves
				If(game.picklist.firstlink()) And dropcard
				 Local c:_card=_card(game.picklist.firstlink().value())
				 swap(c,dropcard,True)
				EndIf
				EndMethod 
	Method swap(c:_card,ass:_card,unused=False)	
				Local cx=c.sweetindex[0]
				Local cy=c.sweetindex[1]
				Local ax=ass.sweetindex[0]
				Local ay=ass.sweetindex[1]
				'Print "pickcard s="+c.suit+" n="+c.number
				'Print "cx="+cx
				'Print "cy="+cy
				'Print "swapcard s="+ass.suit+" n="+ass.number
				'Print "ax="+ax
				'Print "ay="+ay
				Local usepick=False
				If c.picked Or c.pickending usepick=True
				
				Local m:_animationundo=game.createundo(30,0.1,False)
				If usepick c.deinsertpick()
				c.pickending=False
				Local v:_vector3=New _vector3
				Local dvx:_vector3=dropvx()
				Local dvy:_vector3=dropvy()
				c.curvespeed=40
			 	c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, dvx.x,dvx.y,dvx.z, 0,0,0 ,0,0,0)  
			 	c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, dvy.x,dvy.y,dvy.z, 0,0,0 ,0,0,0)  
			    v.copy(ass.position)
				If usepick c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-3,0,0,0) Else c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-10,0,0,10)
			    c.startcurve(game.solitaire.clock)
			    'undo record move
			    Local cupo:_hermitecurve=New _hermitecurve
			    Local cuvx:_hermitecurve=New _hermitecurve
			    Local cuvy:_hermitecurve=New _hermitecurve
			    cupo.v0.set(0,0,-10)
			 	cupo.v1.set(0,0,10)
				cuvx.v0.set(0,0,0)
				cuvx.v1.set(0,0,0)
				cuvy.v0.set(0,0,0)
			 	cuvy.v1.set(0,0,0)
			 	cupo.o1.copy(c.curveposition.o1)
				cuvx.o1.copy(c.curvevx.o1)
		 		cuvy.o1.copy(c.curvevy.o1)
			    If usepick
			     cupo.o0.copy(c.pickposition)
				 cuvx.o0.copy(c.pickvx)
				 cuvy.o0.copy(c.pickvy)
			    Else
			 	 cupo.o0.copy(c.curveposition.o0)
				 cuvx.o0.copy(c.curvevx.o0)
		 		 cuvy.o0.copy(c.curvevy.o0)
				EndIf
			    cupo.updatelength()
			    cuvx.updatelength()
			    cuvy.updatelength()
				m.use(c,Self,True,ax,ay,0,Self,True,cx,cy,0,cupo,cuvx,cuvy)
				'end undo record move
				v.set(0,0,0)
				ass.curvespeed=40
			 	ass.curvevx.setvector(ass.vx,ass.vx, v,v)  
			 	ass.curvevy.setvector(ass.vy,ass.vy, v,v)  
				If usepick ass.curveposition.setvector(ass.position,c.pickposition,v,v) Else ass.curveposition.setvector(ass.position,c.curveposition.o0,v,v)
				ass.startcurve(game.solitaire.clock)
				m.use(ass,Self,True,cx,cy,0,Self,True,ax,ay,0,ass.curveposition,ass.curvevx,ass.curvevy)
				
				c.deinsertsweetmatch()
				ass.deinsertsweetmatch()
				c.insertsweetmatch(Self,ax,ay)
				ass.insertsweetmatch(Self,cx,cy)
				'ass.insertpile(pilefrom,True,0)
				If c.sweetmatch
				 Local x=c.sweetindex[0]
				 Local y=c.sweetindex[1]
				 If blase[x,y]
				  blase[x,y].impuls(3)
				 EndIf
				EndIf				
				If ass.sweetmatch
				 Local x=ass.sweetindex[0]
				 Local y=ass.sweetindex[1]
				 If blase[x,y]
				  blase[x,y].impuls(3)
				 EndIf
				EndIf				
				EndMethod					
				
	Method droppositionat:_vector3(fx,fy)
				Local v:_vector3=New _vector3
				Local tabx#=game.tabulatorx()
				Local taby#=game.tabulatory()
				v.copy(position)
				v.x:+tabx*fx
				v.y:-taby*fy
				v.z:-game.solitaire.cardtableaulift
				Return(v)
				EndMethod				
	Method dropvy:_vector3()
				Local v:_vector3=New _vector3
				v.set(0,game.cardheight,-game.solitaire.cardslope)
				Return(v)
				EndMethod	
	Method adjustcardposition()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.picked=False And cit.curving=False cit.position.z=position.z-game.solitaire.cardtableaulift
				 Next
				EndIf
				EndMethod					
	Method adjustcardvy()
				If game.activepreparation()=False
	   			 For Local cit:_card=EachIn cardlist
	  			  If cit.curving=False And cit.picked=False
	     		   cit.vy.set(0,game.cardheight,-game.solitaire.cardslope)
	 			   'cit.normcardplane()
				  EndIf
				 Next
				EndIf
				EndMethod					

	Method cardfall(c:_card,dx,dy)
				Local v:_vector3=New _vector3
				Local cx=c.sweetindex[0]
				Local cy=c.sweetindex[1]
				'Print "cardfall dy="+dy
				'Print "cardfall cy="+cy
			    v.copy(droppositionat(cx+dx,cy+dy))
				c.curvespeed=20
				c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-13,0,0,13)
			 	c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, c.vx.x,c.vx.y,c.vx.z, 0,0,-10 ,0,0,-10)  
			 	c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z, 0,0,0 ,0,0,0)  
			    'undo record move
				Local m:_animationundo=game.createundo(60,1,False)
				m.use(c,Self,True,cx+dx,cy+dy,0,Self,True,cx,cy,0,c.curveposition,c.curvevx,c.curvevy)
				'end undo record move
				c.deinsertsweetmatch()
				c.insertsweetmatch(Self,cx+dx,cy+dy)
				If c.sweetmatch
				 Local x=c.sweetindex[0]
				 Local y=c.sweetindex[1]
				 If blase[x,y]
				  blase[x,y].impuls(3)
				 EndIf
				EndIf				
				c.startcurve(game.solitaire.clock)					
				EndMethod				
	Method animatecardfall()
				Local c:_card
				Local cd:_card
				Local cdr:_card
				Local cdl:_card
				Local cr:_card
				Local cl:_card
				Local sd,sdr,sdl,sr,sl
				For Local y=0 To dimy-2
				 
				 For Local x=0 To dimx-1
				  c=feld[x,y]
				 ' Print "animatecardfall   y="+y
				 ' If c Print "animatecardfall c.y="+c.sweetindex[1]
				  cd=feld[x,y+1]
				  sd=status[x,y+1]
				  If x<dimx-1
				   cdr=feld[x+1,y+1]
				   sdr=status[x+1,y+1]
				   cr=feld[x+1,y]
				   sr=status[x+1,y]
				  Else
				   cdr=Null
				   sdr=2
				   cr=Null
				   sr=2
				  EndIf
				  If x>0
				   cdl=feld[x-1,y+1]
				   sdl=status[x-1,y+1]
				   cl=feld[x-1,y]
				   sl=status[x-1,y]
				  Else
				   cdl=Null
				   sdl=2
				   cl=Null
				   sl=2
				  EndIf	
				  
				  If c And c.curving=False And c.picked=False
				   If cd=Null And sd<>2
				    cardfall(c,0,1)
				   Else
				    If dir=0
				     If cdr=Null And sdr<>2' And cr=Null And sr<>2  
				      cardfall(c,1,1)
				     ElseIf cdl=Null And sdl<>2' And cl=Null And sl<>2
				      cardfall(c,-1,1)
				     EndIf
				    Else
				     If cdl=Null And sdl<>2' And cl=Null And sl<>2
				      cardfall(c,-1,1)
				     ElseIf cdr=Null And sdr<>2' And cr=Null And sr<>2
				      cardfall(c,1,1)
				     EndIf
				    EndIf
				    dir=1-dir
				   EndIf
				  EndIf
				 Next
				Next
				EndMethod
	Method getrow(c:_card,x,y)
				Local ix,iy
				Local s=c.suit
				Local cit:_card
				Local stop
				row.clear()
				If rowdir=0'horizontale reihe holen
				
				 ix=x
				 iy=y
				 stop=False
				 Repeat
				  cit=feld[ix,iy]
				  If cit
				   If match(cit,c) row.addlast(cit) Else stop=True
				  Else 
				   stop=True
				  EndIf
				  ix:+1
				 Until stop Or ix>dimx-1
				 ix=x-1
				 iy=y
				 If ix>=0
				  stop=False
				  Repeat
				   cit=feld[ix,iy]
				   If cit
				    If match(cit,c) row.addlast(cit) Else stop=True
				   Else
				    stop=True
				   EndIf
				   ix:-1
				  Until stop Or ix<0
				 EndIf
				 
				EndIf
				If rowdir=1'vertikale reihe holen

				 ix=x
				 iy=y
				 stop=False
				 Repeat
				  cit=feld[ix,iy]
				  If cit
				   If match(cit,c) row.addlast(cit) Else stop=True
				  Else
				   stop=True
				  EndIf
				  iy:+1
				 Until stop Or iy>dimy-1
				 ix=x
				 iy=y-1
				 If iy>=0
				  stop=False
				  Repeat
				   cit=feld[ix,iy]
				   If cit
				    If match(cit,c) row.addlast(cit) Else stop=True
				   Else
				    stop=True
				   EndIf
				   iy:-1
				  Until stop Or iy<0
				 EndIf
				EndIf
				'Print "getrow "+rowdir+" count= "+row.count()
				EndMethod	
	Method redundant(ll:TList,xx,yy)
				For Local v:_vector2i=EachIn ll
				 If v.x=xx And v.y=yy Return(True)
				Next
				Return(False)
				EndMethod				
	Method moverow()
				Local machen=True
				If row.count()<2 Return
				For Local c:_card=EachIn row
				 If c.curving Or c.picked machen=False
				Next
				Local freex=-1
				Local freey=-1				
				Local ll:TList=CreateList()
				For Local i=0 To row.count()-1
				 freex=-1
				 freey=-1
				 Local cc=0
				 Repeat
				  Local yy=Rand(0,3)
				  Local xx=Rand(0,dimx-1)
				  If freex=-1
				   If feld[xx,yy]=Null And redundant(ll,xx,yy)=False
				    freex=xx
				    freey=yy
				   EndIf
				  EndIf
				  cc:+1
				 Until freex<>-1 Or cc>1000
				 If freex<>-1
				  Local v:_vector2i=New _vector2i
				  v.set(freex,freey)
				  ll.addlast(v)
				 EndIf
				 If freex=-1 Print "Alarm : nichts freies zum hochwerfen gefunden"
				Next
				If ll.count()<>row.count() machen=False
				If machen
				 Local m:_animationundo=game.createundo(60,1,False)
				 Local vit:TLink=ll.firstlink()
				 For Local c:_card=EachIn row

				  
				
				  If vit
				   Local w:_vector2i=_vector2i(vit.value())
				   freex=w.x
				   freey=w.y
				   Local v:_vector3=New _vector3
				   Local cx=c.sweetindex[0]
				   Local cy=c.sweetindex[1]
				   Local s=status[cx,cy]
				   Local pd:_pilediscard=game.getpilediscardminimum()
			      
				   c.curvespeed=60
				   If s=3
				    v.copy(pd.dropposition())
				    c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, 0,0,-15,0,0,25)
				   Else
				    v.copy(droppositionat(freex,freey))
				    Local w#=(Float(cx)/9)*180+180
				    c.curveposition.set(c.position.x,c.position.y,c.position.z, v.x,v.y,v.z, Cos(w)*150,Sin(w)*150,-7,0,0,3)
				   EndIf
			 	   c.curvevx.set(c.vx.x,c.vx.y,c.vx.z, c.vx.x,c.vx.y,c.vx.z, 0,0,-10 ,0,0,-10)  
			 	   c.curvevy.set(c.vy.x,c.vy.y,c.vy.z, c.vy.x,c.vy.y,c.vy.z, 0,0,0 ,0,0,0)  
			       'undo record move
				   If s=3 m.use(c,pd,True,0,0,0,Self,True,cx,cy,0,c.curveposition,c.curvevx,c.curvevy) Else m.use(c,Self,True,freex,freey,0,Self,True,cx,cy,0,c.curveposition,c.curvevx,c.curvevy)
				   'end undo record move
				   c.deinsertsweetmatch()
				   If status[cx,cy]=3
				    c.deinsertpile()
				    c.insertpile(pd,True)
				    status[cx,cy]=0'!!!!!!!!!!!!!!! EFFEKT !!!!!!!!!!!!!!!!!!!
				    If blase[cx,cy] blase[cx,cy].clear() Else Print "ALARAM blase"
				    blase[cx,cy]=Null
				   Else
				    c.insertsweetmatch(Self,freex,freey)
				   EndIf
				   c.startcurve(game.solitaire.clock)					
				  EndIf
				  vit=vit.nextlink()
				 Next
				EndIf
				EndMethod							
	Method animatediscardmatch()
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  If feld[x,y]
				   If cardbuildsrow(feld[x,y],x,y)
				    getrow(feld[x,y],x,y)
				    moverow()
				   EndIf
				  EndIf
				 Next
				Next
				EndMethod				
	Method animate(c:_clock)
				If game.activepreparation()=False
				 animatecardfall()
				 animatediscardmatch()
				EndIf
				adjustcardvy()
				adjustcardvxsingle()
				adjustcardposition()
				animateinput()
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  If blase[x,y] blase[x,y].animate()
				 Next
				Next
				animatepileinfo()				
				'checkintegrity()
				EndMethod				
	Method save(s:TStream)
				WriteLine(s,"_pilesweetmatch")
				WriteLine(s,savename)
				savepile(s)
				WriteInt(s,dimx)
				WriteInt(s,dimy)
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  savepointer(s,feld[x,y])
				 Next
				Next
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  WriteInt(s,status[x,y])
				 Next
				Next
				EndMethod				
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				loadpile(s)	
				dimx=ReadInt(s)
				dimy=ReadInt(s)
				resetfeld()
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  loadpointer(s)
				 Next
				Next
				For Local y=0 To dimy-1 
				 For Local x=0 To dimx-1 
				  status[x,y]=ReadInt(s)
				  'Print "load status [x,y]="+status[x,y]+" x="+x+"  y="+y
				 Next
				Next
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 For Local y=0 To dimy-1 
				  For Local x=0 To dimx-1 
				   feld[x,y]=_card(associatepointer())
				   '**************** DEBUG ********************
				   'If feld[x,y]=Null
				   ' Print "asso feld null [x,y] x="+x+"  y="+y
				   'Else
				   ' Print "asso feld      [x,y] x="+x+"  y="+y
				   'EndIf
				   '*******************************************
				  Next
				 Next
				 releasepointer()
				 updateblase()
				EndIf
				EndMethod					
	Method checkintegrity()				
				 Print "Pilesweetmatch Integrität wird geprüft:"
				 For Local y=0 To dimy-1
				  For Local x=0 To dimx-1
				   Local c:_card=feld[x,y]
				   If c
				    If c.sweetmatch=Null Print "Fehler : Karte ist im Feld, aber pile nicht in der Karte."
				    If c.sweetindex[0]<>x Print "Fehler x index"
				    If c.sweetindex[1]<>y Print "Fehler y index"
				   EndIf
				  Next
				 Next
				EndMethod
	
	EndType

