
'******************************************************************************************************************
'										P A G E 
'******************************************************************************************************************
Type _page
	Method New()
				hp=New _hermiteplane
				gg=New _geometrygrid
				shadowlist=CreateList()
				meshfront=Null
				meshback=Null
				EndMethod
	Method Delete()
				EndMethod				
	Method Create(s:_solitaire,tf:_texture,tb:_texture,tex:_texture,w#,h#)	
				solitaire=s
				width=w
				height=h
				gg.texture[0,1]=tex
				gg.texture[0,0]=tf
				gg.texture[1,0]=tb
				gg.position.set(0,10,-1)
				gg.vy.set(width,0,0)
				gg.vx.set(0,-height,0)
				gg.resolution[0]=4
				gg.resolution[1]=9
				gg.tvx[0].set(0,1)
				gg.tvy[0].set(1,0)
				gg.tvx[1].set(0,10)
				gg.tvy[1].set(4,0)


				meshfront=gg.Create()
				meshfront.twosided(True)
				'gg.texture[0]=tb
				'gg.texture[1]=Null
				'meshback =gg.create()
				'meshback.cullclockwise(False)
				'meshback.dynamicvertexlight=False
				hp.oo[0].copy(gg.position)
				hp.oo[1].copy(gg.position)
				hp.oo[1].add(gg.vx)
				hp.oo[2].copy(gg.position)
				hp.oo[2].add(gg.vx)
				hp.oo[2].add(gg.vy)
				hp.oo[3].copy(gg.position)
				hp.oo[3].add(gg.vy)
				
				hp.ov[0].copy(gg.vy)
				hp.ov[1].copy(gg.vy)
				hp.ov[2].copy(gg.vy)
				hp.ov[3].copy(gg.vy)
				
				hp.vo[0].copy(gg.vx)
				hp.vo[1].copy(gg.vx)
				hp.vo[2].copy(gg.vx)
				hp.vo[3].copy(gg.vx)
				
				hp.ov[0].set(0,0,-width)
				hp.ov[1].set(0,0,-width)
				'solitaire.world.insert(meshfront)
				meshfront.world=solitaire.world
				
				For Local lit:_light=EachIn solitaire.world.lightlist
				 Local sit:_shadowsingle=New _shadowsingle
 				 sit.init(solitaire.gra,meshfront,solitaire.tshadow,solitaire.shadowlist,lit)
 			     shadowlist.addlast(sit)
				Next
				'world.insert(meshback)
				
				updateshadow()
				EndMethod
	Method updateshadow()
				Local sit:TLink=shadowlist.firstlink()
				Local shadow:_shadow=Null
				Local h:_vector3=New _vector3
				Local s:_vector3=New _vector3
				Local o:_vector3=New _vector3
				Local v:_vertex[4]'vom netz
				Local rx=gg.resolution[0]
				Local ry=gg.resolution[1]
				Local gamma#
				v[0]=meshfront.vertex(0)
				v[1]=meshfront.vertex(rx)
				v[2]=meshfront.vertex((rx+1)*ry)
				v[3]=meshfront.vertex((rx+1)*ry+rx)
				'v[0]=meshfront.vertex(0)
				'v[1]=meshfront.vertex(2)
				'v[2]=meshfront.vertex(3)
				'v[3]=meshfront.vertex(5)
				
				If sit
				For Local lit:_light=EachIn solitaire.world.lightlist	
				 shadow=_shadow(sit.value())
				 shadow.valid=True

				 For Local i=0 To 3				
				 Rem
				  v[i].get(s)
				  s.x:+2
				  s.y:+2
				  s.z=0
				  shadow.mesh.vertex(i).set(s) 
				EndRem
				
				  
				  v[i].get(h)
				  h.sub(lit)
				  gamma=-lit.z/h.z
				  If gamma>0
				   s.set(lit.x+h.x*gamma,lit.y+h.y*gamma,0)
				   shadow.mesh.vertex(i).set(s) 
				  Else
				   shadow.valid=False
				  EndIf 
				 Next
				 
				 
				


				 
				 
				 sit=sit.nextlink()
				Next
				EndIf
				EndMethod			
	Method calculatevertex()
				Local ix,iy
				Local rx=gg.resolution[0],ry=gg.resolution[1]
				Local s#,t#
				Local e:_vector3=New _vector3
				Local vi
				Local vit:_vertex
				Local vib:_vertex
				For iy=0 To ry
				 For ix=0 To rx
				  s=Float(ix)/Float(rx)
				  t=Float(iy)/Float(ry)
				  hp.calculate(s,t,e)
				  vi=iy*(rx+1)+ix
				  vit=meshfront.vertex(vi)
				  vit.set(e)
				  'vib=meshback.vertex(vi)
				  'vib.set(e)
				 Next
				Next
				meshfront.update()
				updateshadow()
				EndMethod	
	Method copyvertexcolor()'from front to back
				Local ix,iy
				Local rx=gg.resolution[0],ry=gg.resolution[1]
				Local e:_vector3=New _vector3
				Local vi
				Local vit:_vertex
				Local vib:_vertex
				For iy=0 To ry
				 For ix=0 To rx
				  vi=iy*(rx+1)+ix
				  vit=meshfront.vertex(vi)
				  vit.getrgb(e)
				  vib=meshback.vertex(vi)
				  vib.setrgb(e)
				 Next
				Next
				
				EndMethod				
    Method set(x#,y#)'-1..+1
				If x<-1 x=-1
				If x>+1 x=+1
				If y<-1 y=-1
				If y>+1 y=+1
				parax=x
				paray=y
				Local w#=90*parax
				' c0.hp.oo[1].z=Sin(ff)*6
				' c0.hp.oo[0].z=Sin(ff+90)*6
				' c0.hp.oo[1].y=10+Sin(90+ff*2)*5
				' c0.hp.oo[0].y=10+Sin(180+ff*2)*5

				' c0.hp.oo[2].z=Cos(ff)*10
				' c0.hp.oo[3].z=Cos(ff)*10
				' c0.hp.oo[2].y=-10+Sin(90+ff*2)*5
				' c0.hp.oo[3].y=-10+Sin(90+ff*2)*5
				Local vr:_vector3=New _vector3
				vr.set(Cos(270+w),0,Sin(270+w))
				Local aussenrad#
				aussenrad=width-(hp.ov[1].angle(vr)/Float(180))*(width/2)'ist abhängig von ov[2]
				hp.oo[2].x=0+vr.x*aussenrad
				hp.oo[2].z=gg.position.z+vr.z*aussenrad
				
				aussenrad=width-(hp.ov[0].angle(vr)/Float(180))*(width/2)'ist abhängig von ov[2]
				hp.oo[3].x=0+vr.x*aussenrad
				hp.oo[3].z=gg.position.z+vr.z*aussenrad
				
				hp.ov[3].copy(hp.oo[3])
				hp.ov[3].sub(hp.oo[0])
 				hp.ov[3].y=0

				hp.ov[2].copy(hp.oo[2])
				hp.ov[2].sub(hp.oo[1])
 				hp.ov[2].y=0
			
 			    calculatevertex()
				End Method
	Method animate(c:_clock)
				Local mx#=solitaire.mouse.x
				Local my#=solitaire.mouse.y
				'Local myf#=(Float((768-my)-384)/Float(384))*0.1
				Local myf0#=0.2*(768-my)/Float(768)
				Local mxnn#=mx-512
				targetdx:+(mxnn-mxn)
				Local ff#=(targetdx-dx)*0.1
				dx=dx+ff'dx defines a factor that shiftes position-tangents at hermitepoint 0 and 1
				If solitaire.mousebutton[0] And solitaire.pickedpage=Self
				 hp.ov[0].x:+dx*myf0
				 hp.ov[1].x:+dx*(0.2-myf0)
				 limittangent()
				 Local paradx#=(mxnn/512)-parax
				 set(parax+paradx*0.3,paray)
				Else
				 set(parax,paray)
				 If parax>=0 parax:+((1-parax)*0.1)
				 If parax<0  parax:-((1+parax)*0.1)
				 targetdx=0
				 dx=0
			    EndIf
				mxn=mxnn 
				targetdx:-ff
				dx:*0.1
				
				
				If parax>0'all the next page to shift
				 
				Else'all the prev pages to -shift
				
				EndIf
				EndMethod		
	Method limittangent()
				If hp.ov[0].x>+(width-4) hp.ov[0].x=+(width-4)
				If hp.ov[0].x<-(width-4) hp.ov[0].x=-(width-4)
				hp.ov[0].z=-Sqr(width*width-hp.ov[0].x*hp.ov[0].x)'-(Sin( ((hp.ov[0].x+16)/Float(16))*180 )*4 +16)
				If hp.ov[1].x>+(width-4) hp.ov[1].x=+(width-4)
				If hp.ov[1].x<-(width-4) hp.ov[1].x=-(width-4)
				hp.ov[1].z=-Sqr(width*width-hp.ov[1].x*hp.ov[1].x)'-(Sin( ((hp.ov[0].x+16)/Float(16))*180 )*4 +16)
				EndMethod
	Field link:TLink=Null
	Field solitaire:_solitaire=Null	
	Field shadowlist:TList=Null						
	Field hp:_hermiteplane=Null
	Field gg:_geometrygrid=Null
	Field meshfront:_mesh
	Field meshback:_mesh
	Field parax#=0
	Field paray#=0
	Field mxn#=0
	Field targetdx#=0
	Field dx#=0
	Field width#=20,height#=20
	EndType
'******************************************************************************************************************
'										B L A S E
'******************************************************************************************************************
Type _blase 
	Field link:TLink=Null
	Field solitaire:_solitaire=Null	
	Field game:_game=Null
	Field hp:_hermiteplane=Null
	Field gg:_geometrygrid=Null
	Field meshfront:_mesh
	Field width#=20,height#=20
	Field tanz:_vector3[4]	
	Field tanzmust:_vector3[4]
	Field tanzvector:_vector3[4]
	Field tanzvelocity#=0.1
	Field tanzfriction#=0.98
	Method New()
				hp=New _hermiteplane
				gg=New _geometrygrid
				meshfront=Null
				For Local i=0 To 3
				 tanz[i]=New _vector3
				 tanzmust[i]=New _vector3
				 tanzvector[i]=New _vector3
				Next
				tanzmust[0].set(0,0,-8)
				tanzmust[1].set(0,0,-8)
				tanzmust[2].set(0,0,+8)
				tanzmust[3].set(0,0,+8)
				EndMethod
	Method Delete()
				EndMethod				
	Method clear()
				For Local pit:_polygon=EachIn meshfront.polygonlist
				 If pit.drawlink RemoveLink pit.drawlink
				Next
				EndMethod
	Method Create(s:_solitaire,g:_game,o:_vector3,w#,h#,rx,ry,tf:_texture,tb:_texture)	
				solitaire=s
				game=g
				width=w
				height=h
				'gg.texture[0,1]=tex
				gg.texture[0,0]=tf
				gg.texture[1,0]=tb
				gg.position.copy(o)
				gg.vy.set(width,0,0)
				gg.vx.set(0,-height,0)
				gg.resolution[0]=rx
				gg.resolution[1]=ry
				gg.tvx[0].set(0,1)
				gg.tvy[0].set(1,0)
				gg.tvx[1].set(0,10)
				gg.tvy[1].set(4,0)


				meshfront=gg.Create()
				meshfront.twosided(True)
				meshfront.blend(True)
				meshfront.blendadditive(True)
				
				'gg.texture[0]=tb
				'gg.texture[1]=Null
				'meshback =gg.create()
				'meshback.cullclockwise(False)
				'meshback.dynamicvertexlight=False
				hp.oo[0].copy(gg.position)
				hp.oo[1].copy(gg.position)
				hp.oo[1].add(gg.vx)
				hp.oo[2].copy(gg.position)
				hp.oo[2].add(gg.vx)
				hp.oo[2].add(gg.vy)
				hp.oo[3].copy(gg.position)
				hp.oo[3].add(gg.vy)
				
				hp.ov[0].copy(gg.vy)
				hp.ov[1].copy(gg.vy)
				hp.ov[2].copy(gg.vy)
				hp.ov[3].copy(gg.vy)
				
				hp.vo[0].copy(gg.vx)
				hp.vo[1].copy(gg.vx)
				hp.vo[2].copy(gg.vx)
				hp.vo[3].copy(gg.vx)
				
				hp.ov[0].copy(tanz[0])
				hp.ov[1].copy(tanz[1])
				hp.ov[2].copy(tanz[2])
				hp.ov[3].copy(tanz[3])
				'solitaire.world.insert(meshfront)
				meshfront.world=solitaire.world
				For Local pit:_polygon=EachIn meshfront.polygonlist
				 pit.drawlink=game.drawlist.addlast(pit)
				Next
				calculatevertex()
				EndMethod
	Method calculatevertex()
				Local ix,iy
				Local rx=gg.resolution[0],ry=gg.resolution[1]
				Local s#,t#
				Local e:_vector3=New _vector3
				Local vi
				Local vit:_vertex
				Local vib:_vertex
				For iy=0 To ry
				 For ix=0 To rx
				  s=Float(ix)/Float(rx)
				  t=Float(iy)/Float(ry)
				  hp.calculate(s,t,e)
				  vi=iy*(rx+1)+ix
				  vit=meshfront.vertex(vi)
				  vit.set(e)
				  'vib=meshback.vertex(vi)
				  'vib.set(e)
				 Next
				Next
				meshfront.update()
				'updateshadow()
				EndMethod	
				Rem	
	Method draw(gra:_graphics,cam:_camera)
				meshfront.clearvertexlight()
	    		For Local lit:_light=EachIn solitaire.world.lightlist
				 meshfront.determinevertexlight(lit)
				Next
	
				meshfront.draw(gra,cam)
				EndMethod		
				EndRem
	Method impuls(s#)
				For Local i=0 To 3
				 tanz[i].copy(tanzmust[i])
				 tanz[i].x:+Rnd(-s,s)
				 tanz[i].y:+Rnd(-s,s)
				 tanz[i].z:+Rnd(-s,s)
				Next
				EndMethod				
	Method animate()	
				Local v:_vector2=New _vector2
				v.set(Sin(solitaire.clock.ms()*0.04)*0.02,0.0)
				meshfront.shifttexture(0,v)	
				
				Local h:_vector3=New _vector3
				For Local i=0 To 3 
				 h.copy(tanzmust[i])
				 h.sub(tanz[i])
				 h.mul(tanzvelocity)
				 tanzvector[i].add(h)
				 tanz[i].add(tanzvector[i])
				 tanzvector[i].mul(tanzfriction)				 
				Next
				
				hp.ov[0].copy(tanz[0])
				hp.ov[1].copy(tanz[1])
				hp.ov[2].copy(tanz[2])
				hp.ov[3].copy(tanz[3])
				calculatevertex()
				EndMethod
	EndType								
'******************************************************************************************************************
'										C A N D L E
'******************************************************************************************************************
Type _candle Extends _light
	Method New()
				position=New _vector3
				positionoriginal=New _vector3
				curve=New _hermitecurve
				curvevector=New _vector3
				curve.set(0,0,0, 0,0,0, 0,1,0, -1,0,0)
				coronaoffset=New _vector3
				coronaoffset.set(0,0,-1)
				coronavx=New _vector3
				coronavy=New _vector3
				coronavx.set(5,0,0)
				coronavy.set(0,5,0)
				coronavxuse=New _vector3
				coronavyuse=New _vector3
				coronavxuse.set(5,0,0)
				coronavyuse.set(0,5,0)
				coronaposition=New _vector3
				lightcolor=New _Vector3
				lightcolor.set(1,0.85,0.2)
				flamme=New _particlesource
				flamme.particlelist=Null'!
				flamme.active=True
				flamme.size=1
				flamme.sizetolerance=0.1
				flamme.vector.set(0,0,-0.007)
				flamme.vectortolerance=0.8
				flamme.generationrate=3
				flamme.lifetimeparticle=1
				flamme.lifetimeparticletolerance=0.01
				flamme.rotation=0'180
				flamme.rotationtolerance=0'1.5
				flamme.opacity=1
				flamme.gfieldforce=-1
				flamme.position.set(-16.3,9.1,-7)
				flamme.room[0].set(0,0,0)
				flamme.room[1].set(0,0,0)
				flamme.room[2].set(0,0,0)
				flamme.drawadd=True
				flamme.drawmul=False
				flamme.drawalpha=False
				flamme.gfieldforcehomogen.set(0,0,1)
				windvector=New _vector3
				EndMethod
	Method Delete()
				EndMethod
	Method initcandle(s:_solitaire,x#,y#,z#,i#,scalecorona#,scaleparticle#,pl:TList,im=False)
				inmenu=im
				solitaire=s
				'flamme.einfuegentextur(s.tfeuer)
				intensityorg=i
				init(s.world,x,y,z,lightcolor.x,lightcolor.y,lightcolor.z,i)
				position.set(x,y,z)
				positionoriginal.set(x,y,z)
				
				curvevector.set(0,0,0)
				If im
				 flamme.init(s.world,s.gra,s.particlesourcemenulist,pl,s.clock)
				Else
				 flamme.init(s.world,s.gra,s.particlesourcegamelist,pl,s.clock)
				EndIf
				
				'For Local i=0 To 
				'mesh init for the particlesource
				Local m:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=s.tfeuercandle
				gg.position.set(-scaleparticle/2,-scaleparticle/2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(scaleparticle,0,0)
				gg.vy.set(0,scaleparticle,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				flamme.insertmesh(m)
				
				flamme.axialdivergence=True
				flamme.axialposition.set(x,y,z)
				flamme.axialvector.set(0,0,1)
				flamme.colorcurved=True
				flamme.colorcurve.set(0.0,0.0,0.8,0.6  ,  0.8,0.2,0.05,0,  0,0,0,1, -3,-2,0,-4)
				flamme.activate()
				gg.texture[0,0]=s.tcorona
				coronavx.set(scalecorona,0,0)
				coronavy.set(0,scalecorona,0)
				gg.vx.copy(coronavx)
				gg.vy.copy(coronavy)
				corona=gg.Create()
				corona.blend(True)
				corona.blendadditive(True)
				EndMethod
	Method draw(gra:_graphics,cam:_camera)
				updatecoronamesh()
				gra.blendadditive()
				corona.draw(gra,cam)
				EndMethod
	Method updatecoronamesh()								
				'function updates the vertex coordinates of the card mesh
				'along the plane vectors position, vx,vy
				Local pit:_polygon
				Local vit:_vertex
				Local i=0
				Local h:_vector3=New _vector3
				Local k:_vector3=New _vector3
				Local l:_vector3=New _vector3
				
				l.copy(curvevector)
				l.mul(0.4)
				h.copy(windvector)
				h.mul(-0.06)
				l.add(h)
				l.add(Self)
				
				l.add(coronaoffset)
				
				
				coronavxuse.copy(coronavx)
				coronavyuse.copy(coronavy)
				coronavxuse.mul(1-windflicker*windflickeramplitude*0.2)
				coronavyuse.mul(1-windflicker*windflickeramplitude*0.2)
				Local popacityuse#=0.6*popacity*(1-windflicker*windflickeramplitude*0.4)
				'l.copy(Self)
				'l.set(0,0,-1)
				For pit=EachIn corona.polygonlist
				 For vit=EachIn pit.vertexlist
				  If i=0 
				   h.copy(coronavxuse)
				   h.mul(-0.5)
				   k.copy(coronavyuse)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(l)
				   vit.set(h)
				   vit.seta(popacityuse)
				  ElseIf i=1
				   h.copy(coronavxuse)
				   h.mul(+0.5)
				   k.copy(coronavyuse)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(l)
				   vit.set(h)
				   vit.seta(popacityuse)
				  ElseIf i=2
				   h.copy(coronavxuse)
				   h.mul(+0.5)
				   k.copy(coronavyuse)
				   k.mul(+0.5)
				   h.add(k)
				   h.add(l)
				   vit.set(h)
				   vit.seta(popacityuse)
				  ElseIf i=3
				   h.copy(coronavxuse)
				   h.mul(-0.5)
				   k.copy(coronavyuse)
				   k.mul(+0.5)
				   h.add(k)
				   h.add(l)
				   vit.set(h)
				   vit.seta(popacityuse)
				  EndIf 
				  i:+1
				 Next
				 pit.update()
				Next
				EndMethod				
	Method animatecurve(clock:_clock)	
				Local newtime#=clock.ms()
				Local deltat#=Float(newtime-curvetime)/1000.0#
				curvetime=newtime
				
				 If curvet<1
				  curve.calculate(curvet)
				  Local deltal#=curvespeed*deltat
				  Local dt#
				  If curve.curvelength<nearzero
				   dt=1
				  Else
				   dt=(deltal/curve.curvelength)
				  EndIf
				  curvet:+dt
				  curvevector.copy(curve.e)
				 Else
				  curvet=0
				  curvevector.copy(curve.o1)
				  curve.v0.copy(curve.v1)
				  curve.v1.calculaterandom()
				  curve.v1.mul(Rnd(0.3,0.6))
				  curvespeed=Rnd(0.1,0.5)

				  curve.updatelength()
				 EndIf				  
				EndMethod
	Method animate(c:_clock)			
				animatecurve(c)
				' Local sp:_vector3=New _vector3
				Local time#=solitaire.clock.ms()
				If inmenu=False
				 flamme.axialdivergence=True 
				 If solitaire.sparkingmouse And sparked'----------------------- sparkled ingame candle -------------------------
				  flamme.particlegenerationdensity=0.3
				  flamme.gfieldforce=-1
				 ' flamme.particlelist=solitaire.particlegamelist
				  flamme.size=2.3+Sin(time/5)*0.8
				  flamme.rotation=Sin(time/10)*90'180+Sin(solitaire.clock.ms()/(50+Cos(solitaire.clock.ms()/20)*45))*360
				  flamme.colorcurve.set(0.0,0.0,0.8,0.6  ,  0.8,0.2,0.05,0,  0,0,0,1, -3,-2,0,-4)
				  Local h:_vector3=New _vector3
				  h.copy(solitaire.mousevector)
				  Local z#=-7
				  If solitaire.game
				   Local it:TLink=solitaire.game.picklist.firstlink()
				   If it
				    Local c:_card=_card(it.value())
				    z=c.position.z-7
				   EndIf
				  EndIf
				  Local gamma#=(z-solitaire.cam.position.z)/solitaire.mousevector.z
				  h.mul(gamma)
				  h.add(solitaire.cam.position)
				  h.mul(0.3)
				  mul(0.7)
				  add(h)
				  flamme.axialvector.set(0,0,0.001)
				  windfactor=0
				  intensity=50
				  If solitaire.game
				   solitaire.game.markforupdateshadow(Self)
				  EndIf
				
				  'flamme.axialdivergence=False				
				  'intensity=
				 Else'---------------------------------------------------------- ingame candle normal -----------------------------
				  If solitaire.game 
				   If solitaire.game.picklist.firstlink()
					Local d:_vector3=New _vector3
					d.copy(solitaire.game.pickpositionold)
					d.sub(position)
					Local df#=Float(350)/(1+5*d.lengthlength()*d.length())
				    windfactor=solitaire.game.pickvector.length()*df
				 	d.copy(solitaire.game.pickvector)
					d.mul(-windfactor)
				    windvector.add(d)
				   Else 
				    windfactor:*0.95
				   EndIf
				  EndIf
				  intensity=5000
				  flamme.gfieldforce=-0.31
				  flamme.particlegenerationdensity=0
				  copy(position)
				  flamme.size=1.5
				  'flamme.particlelist=solitaire.particlelistbackground
				  flamme.rotation=0
				  flamme.colorcurve.set(0.0,0.0,0.8,0.6  ,  0.8,0.2,0.05,0,  0,0,0,3, -3,-2,0,-4)
				  flamme.axialvector.copy(windvector)'set(0,0,1*2)
				  flamme.axialvector.mul(0.04)
				  flamme.axialvector.z:+2
				 EndIf
				Else'----------------------------------------------------------- menu candle -------------------------------------
				 copy(position)
				 windfactor=0
				 flamme.gfieldforce=-0.02*2
				 flamme.axialvector.set(0,1*2,0)
				 coronaoffset.set(0,0.2,0)
				EndIf'------------------------------------------------------------------------------------------------------------

				
				windvector.mul(0.93)
				'add(curvevector)
				flamme.position.copy(Self)
				'----------------------feuer pumpend-------------------
				Local tt=(100)-(c.ms()-pumptime)
				If tt<0 tt=0
				If pumpup tt:/5
				If Rand(0,tt)=0 Or tt=0
				 pumptime=c.ms()
				 If pumpup=False 
				  pumpup=True
  				  pumpgenrate=Rand(80,100)
				  pumplifetime=Rand(1500,1800)
				 Else
				  pumpup=False
  				  pumpgenrate=Rand(50,70)
				  pumplifetime=Rand(1000,1300)
				 EndIf
				EndIf				
				If solitaire.sparkingmouse And sparked
				 flamme.lifetimeparticle=Rand(400,800)
				Else
				 If inmenu
  			      flamme.generationrate=(pumpgenrate/6)*2'*pumpgenratefactor
				  flamme.lifetimeparticle=pumplifetime/2
				 Else
				  windflicker:+windfactor*0.15
				  If windflicker>1 windflicker=1
				
				 ' Print "wf="+wf+"  windfoactor="+windfactor
				  windflickeramplitude=(Sin(time*1.5)*windflicker+1)*0.5
  			      flamme.generationrate=((pumpgenrate/4)*2*windflickeramplitude)
				  flamme.lifetimeparticle=pumplifetime/2
				  windflicker:*0.98
				 EndIf				
				EndIf
				'----------------------------------------------------
				Local v:_vector3=New _Vector3
				v.set(Cos(c.ms()*3.2)*0.01,Sin(c.ms()*2.7)*0.01,0)
				flamme.axialposition.copy(Self)
				flamme.axialposition.add(v)
				Local fb#=1'0.2+0.6*((solitaire.blackscreentransparency-0.4)/Float(0.6))
				If flamme.active
				 Local ff#=Float(60-(flamme.particleinternallist.count()-40))/Float(60)
				 ff:-0.5
				 ff:*3
				 ff:+0.5
				 If ff>2 ff=2
				 'Print flamme.particleinternallist.count()
				' Print ff
				 'Print fb
				 'Print solitaire.blackscreentransparency+"  ...."
				 v.set((lightcolor.x-0.1*ff)*fb,(lightcolor.y-0.2*ff)*fb,(lightcolor.z-0.04*ff)*fb)
				 v.mul(0.3)
				 color.mul(0.7)
				  color.add(v)
				 'color.set(lightcolor.x,lightcolor.y,lightcolor.z)
				Else
				 v.set((lightcolor.x)*fb,(lightcolor.y-(Sin(c.count*30)*0.05+0.05))*fb,(lightcolor.z-Sin(c.count*40)*0.01+0.01)*fb)
				 v.mul(0.3)
				 color.mul(0.7)
				  color.add(v)
				 'color.set(lightcolor.x,lightcolor.y,lightcolor.z)
				EndIf
				If color.x<0 color.x=0
				If color.y<0 color.y=0
				If color.z<0 color.z=0
				EndMethod
	Method opacity(op#)
				popacity=op
				For Local pit:_particle=EachIn flamme.particleinternallist
				 pit.opacityexternalcontrol=op
				Next
				EndMethod				
	Field solitaire:_solitaire=Null
	Field position:_vector3=Null
	Field positionoriginal:_vector3=Null
	Field intensityorg#=0
	Field popacity#=1
	Field lightcolor:_vector3=Null
	Field flamme:_particlesource=Null
	Field pumptime#=0
	Field pumpup=0
	Field pumpgenrate=50
	Field pumplifetime=1000
	Field windfactor#=1
	Field windvector:_vector3=Null
	Field windflicker#=0
	Field windflickeramplitude#=0
	
	Field corona:_mesh=Null
	Field coronavx:_vector3=Null
	Field coronavy:_vector3=Null
	Field coronavxuse:_vector3=Null
	Field coronavyuse:_vector3=Null
	Field coronaposition:_vector3=Null
	Field coronaoffset:_vector3=Null
	Field curve:_hermitecurve=Null
	Field curvet#=0
	Field curvespeed#=1
	Field curvetime#=0
	Field curvevector:_vector3=Null
	Field sparked=False
	Field inmenu=False
	
	
	EndType
'******************************************************************************************************************
'										S M O K E 
'******************************************************************************************************************
Type _smoke Extends _light
	Method New()
				position=New _vector3
				positionoriginal=New _vector3
				curve=New _hermitecurve
				curvevector=New _vector3
				curve.set(0,0,0, 0,0,0, 0,1,0, -1,0,0)
				coronaoffset=New _vector3
				coronaoffset.set(0,0,-1)
				coronavx=New _vector3
				coronavy=New _vector3
				coronavx.set(5,0,0)
				coronavy.set(0,5,0)
				coronaposition=New _vector3
				flamme=New _particlesource
				flamme.particlelist=Null'!
				flamme.active=True
				flamme.size=1
				flamme.sizetolerance=0.1
				flamme.vector.set(0,0,0.1)
				flamme.vectortolerance=0.05
				flamme.lifetimeparticletolerance=0.01
				flamme.rotation=180
				flamme.rotationtolerance=100.5
				flamme.opacity=1
				flamme.gfieldforce=-1
				flamme.position.set(-16.3,9.1,-7)
				flamme.room[0].set(0,0,0)
				flamme.room[1].set(0,0,0)
				flamme.room[2].set(0,0,0)
				flamme.drawadd=True
				flamme.drawmul=False
				flamme.drawalpha=False
				flamme.scale=True
				flamme.scalevalue=1.02
				EndMethod
	Method Delete()
				EndMethod
	Method initsmoke(s:_solitaire,x#,y#,z#,i#,scalecorona#,scaleparticle#,pl:TList,im=False)
				inmenu=im
				solitaire=s
				'flamme.einfuegentextur(s.tfeuer)
				init(s.world,x,y,z,0.8,0.5,0.2,i)
				position.set(x,y,z)
				positionoriginal.set(x,y,z)
				
				curvevector.set(0,0,0)
				flamme.init(s.world,s.gra,s.particlesourcemenulist,pl,s.clock)
				

				Local m:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=s.tfeuer2
				gg.position.set(-scaleparticle/2,-scaleparticle/2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(scaleparticle,0,0)
				gg.vy.set(0,scaleparticle,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(False)
				flamme.insertmesh(m)
				
				flamme.axialdivergence=False
				flamme.axialposition.set(x,y,z)
				flamme.axialvector.set(0,0,1)
				flamme.horizontaldivergenz=True
				flamme.horizontaldivergenzwert=4.5
				flamme.horizontaldivergenzstaerke=0.093
				flamme.colorcurved=True
				flamme.colorcurve.set(1,0.0,1,0.3  ,  0,0,1,0,  0,1,0,1, -3,-2,0,-2)
				flamme.activate()
				gg.texture[0,0]=s.tcorona
				coronavx.set(scalecorona,0,0)
				coronavy.set(0,scalecorona,0)
				gg.vx.copy(coronavx)
				gg.vy.copy(coronavy)
				corona=gg.Create()
				corona.blend(True)
				corona.blendadditive(True)
				deinsert()
				EndMethod
	Method draw(gra:_graphics,cam:_camera)
				updatecoronamesh()
				gra.blendadditive()
				corona.draw(gra,cam)
				EndMethod
	Method updatecoronamesh()								
				'function updates the vertex coordinates of the card mesh
				'along the plane vectors position, vx,vy
				Local pit:_polygon
				Local vit:_vertex
				Local i=0
				Local h:_vector3=New _vector3
				Local k:_vector3=New _vector3
				Local l:_vector3=New _vector3
				
				l.copy(curvevector)
				l.mul(0.4)
				l.add(Self)
				l.add(coronaoffset)
				For pit=EachIn corona.polygonlist
				 For vit=EachIn pit.vertexlist
				  If i=0 
				   h.copy(coronavx)
				   h.mul(-0.5)
				   k.copy(coronavy)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(l)
				   vit.set(h)
				  ElseIf i=1
				   h.copy(coronavx)
				   h.mul(+0.5)
				   k.copy(coronavy)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(l)
				   vit.set(h)
				  ElseIf i=2
				   h.copy(coronavx)
				   h.mul(+0.5)
				   k.copy(coronavy)
				   k.mul(+0.5)
				   h.add(k)
				   h.add(l)
				   vit.set(h)
				  ElseIf i=3
				   h.copy(coronavx)
				   h.mul(-0.5)
				   k.copy(coronavy)
				   k.mul(+0.5)
				   h.add(k)
				   h.add(l)
				   vit.set(h)
				  EndIf 
				  i:+1
				 Next
				 pit.update()
				Next
				EndMethod				
	Method animatecurve(clock:_clock)	
				Local newtime#=clock.ms()
				Local deltat#=Float(newtime-curvetime)/1000.0#
				curvetime=newtime
				
				 If curvet<1
				  curve.calculate(curvet)
				  Local deltal#=curvespeed*deltat
				  Local dt#
				  If curve.curvelength<nearzero
				   dt=1
				  Else
				   dt=(deltal/curve.curvelength)
				  EndIf
				  curvet:+dt
				  curvevector.copy(curve.e)
				 Else
				  curvet=0
				  curvevector.copy(curve.o1)
				  curve.v0.copy(curve.v1)
				  curve.v1.calculaterandom()
				  curve.v1.mul(Rnd(0.2,0.4))
				  curvespeed=Rnd(0.1,0.5)

				  curve.updatelength()
				 EndIf				  
				EndMethod
	Method animate(c:_clock)			

				animatecurve(c)
				

				copy(position)
				flamme.gfieldforce=-0.05
				flamme.axialvector.set(0,1,0)
				coronaoffset.set(0,0.2,0)

				add(curvevector)
				flamme.position.copy(Self)

				
				'feuer pumpend
				Local tt=1000-(c.ms()-pumptime)
				If tt<0 tt=0
				If pumpup tt:/50
				If Rand(0,tt)=0 Or tt=0
				 pumptime=c.ms()
				 If pumpup=False 
				  pumpup=True
  				  pumpgenrate=Rand(20*(inmenu+1),30*(inmenu+1))
				  pumplifetime=Rand(2000,4000)
				  flamme.vector.calculaterandom()
				  flamme.vector.y=Abs(flamme.vector.y)
				  flamme.vector.mul(0.05)
				 Else
				  flamme.vector.set(0,0.02,0)
				  pumpup=False
  				  pumpgenrate=Rand(2*(inmenu+1),3*(inmenu+1))
				  pumplifetime=Rand(1000,2500)
				 EndIf
				EndIf				
			    flamme.rotation=Sin(solitaire.clock.ms()*3)*180
  			    flamme.generationrate=pumpgenrate
				flamme.lifetimeparticle=pumplifetime
				Local v:_vector3=New _Vector3
				v.set(Cos(c.ms()*3.2)*0.01,Sin(c.ms()*2.7)*0.01,0)
				flamme.axialposition.copy(Self)
				flamme.axialposition.add(v)
				If flamme.active
				 Local ff#=Float(60-(flamme.particleinternallist.count()-40))/Float(60)
				 ff:-0.5
				 ff:*3
				 ff:+0.5
				 If ff>2 ff=2
				 color.set(0.8-0.1*ff,0.5-0.2*ff,0.2-0.04*ff)
				Else
				 color.set(0.8,0.5-(Sin(c.count*30)*0.05+0.05),0.2-Sin(c.count*40)*0.01+0.01)
				EndIf
				EndMethod
	Field position:_vector3=Null
	Field positionoriginal:_vector3=Null
	Field solitaire:_solitaire=Null
	Field flamme:_particlesource=Null
	Field pumptime#=0
	Field pumpup=0
	Field pumpgenrate=50
	Field pumplifetime=1000
	Field corona:_mesh=Null
	Field coronavx:_vector3=Null
	Field coronavy:_vector3=Null
	Field coronaposition:_vector3=Null
	Field coronaoffset:_vector3=Null
	Field curve:_hermitecurve=Null
	Field curvet#=0
	Field curvespeed#=1
	Field curvetime#=0
	Field curvevector:_vector3=Null
	Field sparked=False
	Field inmenu=False
	EndType
	
'******************************************************************************************************************
'										K A M I N
'******************************************************************************************************************
Type _kamin
	Method New()
				For Local i=0 To 1 
				 flamme[i]=New _particlesource
				 flamme[i].particlelist=Null'!
				 flamme[i].active=True
				 flamme[i].size=0.5
				 flamme[i].sizetolerance=0.4
				 flamme[i].vector.set(0,0,0)
				 flamme[i].vectortolerance=0.7
				 flamme[i].lifetimeparticle=0.5
				 flamme[i].lifetimeparticletolerance=0.5
				 flamme[i].rotation=220
				 flamme[i].rotationtolerance=20.5
				 flamme[i].opacity=1
				 flamme[i].gfieldforce=-0.3
				 flamme[i].room[0].set(0.8,0,0)
				 flamme[i].room[1].set(0,0.2,0)
				 flamme[i].room[2].set(0,0,0.2)
				 flamme[i].drawadd=True
				 flamme[i].drawmul=False
				 flamme[i].drawalpha=False
				 pumptime[i]=0
				 pumpup[i]=0
				 pumpgenrate[i]=50
				 pumplifetime[i]=1000
				 rotfac[i]=Rnd(0.02,0.04)				
				Next
				
				EndMethod	
	Method init(s:_solitaire,x#,y#,z#,scale#=5,pl:TList)
				solitaire=s
				Local m:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=s.tfeuer2
				gg.position.set(scale/2,scale/2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(scale,0,0)
				gg.vy.set(0,scale,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				flamme[0].position.set(x-0.8,y,z)
				flamme[1].position.set(x+0.8,y,z)
				For Local i=0 To 1 
				 flamme[i].init(s.world,s.gra,s.particlesourcemenulist,pl,s.clock)
				 flamme[i].insertmesh(m)
				 flamme[i].axialdivergence=True
				 flamme[i].axialposition.set(x,y,z)
				 'flamme[i].axialposition.set(x-0.5+Float(i),y,z)
				 flamme[i].axialvector.set(0,0.06,0)
				 flamme[i].colorcurved=True
				 flamme[i].colorcurve.set(0.0,0.0,0.0,0.2  ,  0.8,0.2,0.0,0.0,  2,0,-0.1,5, -3,-2,-1,-2)
				 flamme[i].activate()
				 offsetrnd[i]=Rnd(0,3000)
				Next
				channel=playsoundnormal(solitaire.sfireplace,	1)
				EndMethod
	Method intensity:Float()
				Local i#=flamme[0].particleinternallist.count()+flamme[1].particleinternallist.count()
				i=(i-70)/170
				If i<0 i=0 
				If i>1 i=1		
				newintensity=oldintensity*0.7 + i*0.3
				oldintensity=newintensity
				Return(newintensity)
				EndMethod				
	Method animate()
				channel.setvolume(1*volumesound*volumesoundfadein)
				Local tt#=solitaire.clock.ms()
				For Local i=0 To 1 
				 
				 flamme[i].animate()
				 flamme[i].rotation=Sin(tt*rotfac[i])*280
				 flamme[i].axialvector.set(Sin(tt*0.0013131+offsetrnd[i])*0.06,Cos(tt*0.002231+offsetrnd[i])*0.1+0.1,0)

				 Local tt=500-(solitaire.clock.ms()-pumptime[i])
				 If tt<0 tt=0
				 If pumpup[i] tt:/2
				 If Rand(0,tt)=0 Or tt=0
				  pumptime[i]=solitaire.clock.ms()
				  If pumpup[i]=False 
				   pumpup[i]=True
  				   pumpgenrate[i]=Rand(80*2,200*2)
				   pumplifetime[i]=Rand(375,500)
				  Else
				   pumpup[i]=False
  				   pumpgenrate[i]=Rand(100*2,240*2)
				   pumplifetime[i]=Rand(625,1000)
				  EndIf
				 EndIf				
  			     flamme[i].generationrate=pumpgenrate[i]
				 flamme[i].lifetimeparticle=pumplifetime[i]
				Next	
				EndMethod				
	Method deactivate()				
				flamme[0].active=False
				flamme[1].active=False
				EndMethod
	Method activate()
				flamme[0].activate()
				flamme[1].activate()
				EndMethod				
				
	Field solitaire:_solitaire=Null
	Field channel:TChannel=Null				
	Field flamme:_particlesource[2]
	Field pumptime#[2]
	Field pumpup[2]
	Field pumpgenrate[2]
	Field pumplifetime[2]
	Field rotfac#[2]
	Field offsetrnd#[2]
	Field oldintensity#=0
	Field newintensity#=0
	EndType			
'******************************************************************************************************************
'										K A M I N F E U E R 
'******************************************************************************************************************
Type _kaminfeuer Extends _particlesource
	Method New()
				positionbase=New _vector3
				EndMethod
	Method createparticle:_particle(pos:_vector3)
                Local ps:_particle=Null
            	ps=New _particle
 				If insertfirst
				 ps.link=particlelist.addfirst(ps)
				Else
				 ps.link=particlelist.addlast(ps)
				EndIf
				ps.linkinternal=particleinternallist.addlast(ps)
				ps.pq=Self
				ps.world=world
				ps.position.copy(pos)
				
				ps.vector.copy(calculatevector())
				ps.color.copy(color)
				If meshiterator
				 
				 Local mt:_mesh=_mesh(meshiterator.value())
				 ps.mesh=mt.duplicate()
				 If ps.mesh.link
				  RemoveLink ps.mesh.link
				  ps.mesh.link=Null
				 EndIf
				
				 ps.mesh.scale(size*Rnd(1-sizetolerance,1+sizetolerance))
				 ps.mesh.add(ps.position)
				 ps.mesh.updatemiddle()
				
				 meshiterator=meshiterator.nextlink()
				 If meshiterator=Null meshiterator=meshlist.firstlink()
				EndIf
				If texturiterator
				 ps.texture=Timage(texturiterator.value())
				 texturiterator=texturiterator.nextlink()
				 If texturiterator=Null texturiterator=texturliste.firstlink()
				EndIf
				ps.size[0]=size+Rnd(-sizetolerance,+sizetolerance)	
				ps.size[1]= ps.size[0]'size	+Rnd(-sizetolerance,+sizetolerance)	
				If(benutzenoffset)
				 ps.xoffset=-ps.size[0]/2
				 ps.yoffset=-ps.size[1]/2
				EndIf
				ps.lifetime=0
				ps.lifetimeoriginal=calculatelifetimeparticle()
				ps.fadein=fadein
				ps.fadeout=fadeout
                ps.rotation=rotation+ Rnd(-rotationtolerance,+rotationtolerance)
                ps.rotationvector=rotationvector+ Rnd(-rotationvectortolerance,+rotationvectortolerance)
				ps.rotationaxis.copy(calculaterotationaxis())
				ps.rotationfriction=-0.01
				If ps.mesh And ps.rotation<>0
				 Local w#=((ps.position.x-positionbase.x)/1.2)'-1..+1
				 w=w*0.5
				 w=w+0.5
				 w=w*90
				 ps.mesh.rotate(ps.rotationaxis,w)
				 ps.mesh.update()
				 ps.rotationvector=(w-45)*5
				EndIf


				ps.handlex=handlex
				ps.handley=handley
				ps.mass=mass
                ps.reflektiv=reflektiv
                ps.projektil=projektil
                ps.collision=collision
                ps.gfieldforce=calculateforce(gfieldforce,gfieldforcetolerance)
                ps.efieldforce=calculateforce(efieldforce,efieldforcetolerance)
                ps.bfieldforce=calculateforce(bfieldforce,bfieldforcetolerance)
                ps.mfieldforce=calculateforce(mfieldforce,mfieldforcetolerance)
				ps.drawmul=drawmul
				ps.drawadd=drawadd
				ps.drawalpha=drawalpha
				ps.opacity=opacity
                'ps.pqlife=pqlife
				If pqlife
				 ps.pqlife=New _particlesource
				 ps.pqlife.copy(pqlife)
				 ps.pqlife.position.copy(ps.position)
				 ps.pqlife.activate()
				EndIf
				
                ps.pqdeath=pqdeath
				ps.sounddeath=sounddeath
				ps.sounddeathvolume=sounddeathvolume+Rnd(+sounddeathvolumetolerance,+sounddeathvolumetolerance)
				ps.sounddeathpitch=sounddeathpitch+Rnd(+sounddeathpitchtolerance,+sounddeathpitchtolerance)
				ps.sounddeathpitchdoppler=sounddeathpitchdoppler
				
				ps.horizontaldivergenz=horizontaldivergenz
				ps.horizontaldivergenzwert=horizontaldivergenzwert
				ps.horizontaldivergenzstaerke=horizontaldivergenzstaerke
				ps.axialdivergence=axialdivergence
				If colorcurved ps.colorcurve.copy(colorcurve)
				ps.colorcurved=colorcurved
				ps.simplekollisionz=simplekollisionz
				ps.simplekollisionzvalue=simplekollisionzvalue
				'ps.simpleshadowz=simpleshadowz
				'ps.simpleshadowzvalue=simpleshadowzvalue
				If simpleshadowz And ps.mesh And world
				 For Local lit:_light=EachIn world.lightlist
				  Local sit:_shadowsingle=New _shadowsingle
 				  sit.init(gra,ps.mesh,simpleshadowtexture,ps.shadowlist,lit)
 			      'ps.shadowlist.addlast(sit)				   
				 Next
				EndIf
				ps.scale=scale
				ps.scalevalue=scalevalue
				ps.sinusopacity=sinusopacity
				ps.sinusopacityoffset=sinusopacityoffset+Rnd(-sinusopacityoffsettolerance,+sinusopacityoffsettolerance)
				ps.sinusopacityrate=sinusopacityrate
				ps.sinusopacityratedifference=sinusopacityratedifference+Rnd(-sinusopacityratedifferencetolerance,+sinusopacityratedifferencetolerance)
				
				'ps.dynamiclight=dynamiclight
				ps.init(clock)
				Return(ps)
				EndMethod
	Field positionbase:_vector3=Null				
	EndType
'******************************************************************************************************************
'										K A M I N 2
'******************************************************************************************************************
Type _kamin2
	Method New()
				position=New _vector3
				For Local i=0 To 1 
				 flamme[i]=New _kaminfeuer
				 flamme[i].particlelist=Null'!
				 flamme[i].active=True
				 flamme[i].size=0.6
				 flamme[i].sizetolerance=0.8
				 flamme[i].vector.set(0,0,0)
				 flamme[i].vectortolerance=0.7
				 flamme[i].lifetimeparticle=0.5
				 flamme[i].lifetimeparticletolerance=0.5
				 flamme[i].rotation=220
				 flamme[i].rotationtolerance=20.5
				 flamme[i].opacity=1
				 flamme[i].gfieldforce=-0.3
				 flamme[i].room[0].set(0.6,0,0)
				 flamme[i].room[1].set(0,0.2,0)
				 flamme[i].room[2].set(0,0,0.2)
				 flamme[i].drawadd=True
				 flamme[i].drawmul=False
				 flamme[i].drawalpha=False
  				 flamme[i].gfieldforcehomogen.set(0,-1,0)
				 pumptime[i]=0
				 pumpup[i]=0
				 pumpgenrate[i]=50
				 pumplifetime[i]=1000
				 rotfac[i]=Rnd(0.02,0.04)				
				Next
				
				funken=New _particlesource
				funken.particlelist=Null'!
				funken.active=True
				funken.size=1
				funken.sizetolerance=0.2
				funken.vector.set(0,0.0,0)
				funken.vectortolerance=0.3
				funken.generationrate=5
				funken.lifetimeparticle=850
				funken.lifetimeparticletolerance=0.2
				funken.rotation=0
				funken.rotationtolerance=300
				funken.opacity=1
				funken.gfieldforce=-0.4
				funken.room[0].set(1,0,0)
				funken.room[1].set(0,0.2,0)
				funken.room[2].set(0,0,0.2)
				funken.drawadd=True
				funken.drawmul=False
				funken.drawalpha=False
				funken.gfieldforcehomogen.set(0,-1,0)
				
				EndMethod	
	Method init(s:_solitaire,x#,y#,z#,scale#=5,pl:TList)
				solitaire=s
				Local m:_mesh
				Local m2:_mesh
				Local mf:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=s.tfeuer2
				gg.position.set(-scale/2,-scale/2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(scale,0,0)
				gg.vy.set(0,scale,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)

				gg.texture[0,0]=s.tfeuer3
				m2=gg.Create()
				m2.dynamicvertexlight=False
				m2.blend(True)
				m2.blendadditive(True)
				
				Local sf#=0.17
				gg.texture[0,0]=s.tfunken[0]
				gg.position.set(-sf/2,-sf/2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(sf,0,0)
				gg.vy.set(0,sf,0)
				mf=gg.Create()
				mf.dynamicvertexlight=False
				mf.blend(True)
				mf.blendadditive(True)
				
				position.set(x,y,z)
				flamme[0].positionbase.set(x,y,z)
				flamme[1].positionbase.set(x,y,z)
				flamme[0].position.set(x-0.5,y,z)
				flamme[1].position.set(x+0.5,y,z)
				For Local i=0 To 1 
				 flamme[i].init(s.world,s.gra,s.particlesourcemenulist,pl,s.clock)
				 flamme[i].insertmesh(m)
				 flamme[i].insertmesh(m2)
				 flamme[i].axialdivergence=True
				 flamme[i].axialposition.set(x,y,z)
				 'flamme[i].axialposition.set(x-0.5+Float(i),y,z)
				 flamme[i].axialvector.set(0,0.06,0)
				 flamme[i].colorcurved=True
				' flamme[i].colorcurve.set(0.0,0.0,0.0,0.05  ,  0.8,0.2,0.0,0.0,  2,0,-0.1,5, -3,-2,-1,-2)
				 flamme[i].colorcurve.set(0.0,0.0,0.0,0.05  ,  0.8,0.2,0.0,0.0,  2,1,0.5,3, -3,-2,-2.5,-2)
				 flamme[i].activate()
				 offsetrnd[i]=Rnd(0,3000)
				Next
				funken.position.set(x,y,z)
				funken.init(s.world,s.gra,s.particlesourcemenulist,pl,s.clock)
				funken.insertmesh(mf) 
				funken.axialdivergence=True
				funken.axialposition.set(x,y,z)
				funken.axialvector.set(0,0.2,0)
				funken.colorcurved=True
				funken.colorcurve.set(1,0.7,0.1,0.5  ,  0.8,0.0,0.0,0.1,  0,0,0,3, 0,0,0,-4)
				funken.activate()
				
				channel=playambiencenormal(solitaire.sfireplace,	1)
				EndMethod
	Method intensity:Float()
				Local i#=flamme[0].particleinternallist.count()+flamme[1].particleinternallist.count()
				'Print i
				i=(i-72)/(100-72)
				If i<0 i=0 
				If i>1 i=1		
				newintensity=oldintensity*0.95 + i*0.05
				oldintensity=newintensity
				Return(newintensity)
				EndMethod				
	Method animate()
				channel.setvolume(1*volumeambience*volumesoundfadein)
				Local tt#=solitaire.clock.ms()
				For Local i=0 To 1 
				 
				 flamme[i].animate()
				 funken.animate()
				 'flamme[i].rotation=0'(tt*0.001)*20'Sin(tt*rotfac[i])*80
				 'flamme[i].rotationvector=(tt*0.001)*20'Sin(tt*rotfac[i])*80
				 flamme[i].axialvector.y=Cos(tt*0.2231+offsetrnd[i])*0.1+0.15
				 flamme[i].axialposition.set(position.x+Sin(offsetrnd[i]+tt*0.0031)*0.4,position.y,position.z)
				 Local tt=500-(solitaire.clock.ms()-pumptime[i])
				 If tt<0 tt=0
				 If pumpup[i] tt:/2
				 If Rand(0,tt)=0 Or tt=0
				  pumptime[i]=solitaire.clock.ms()
				  If pumpup[i]=False 
				   pumpup[i]=True
  				   pumpgenrate[i]=Rand(50,80)
				   pumplifetime[i]=Rand(475,550)
				  Else
				   pumpup[i]=False
  				   pumpgenrate[i]=Rand(70,100)
				   pumplifetime[i]=Rand(500,600)
				  EndIf
				 EndIf				
  			     flamme[i].generationrate=pumpgenrate[i]
				 flamme[i].lifetimeparticle=pumplifetime[i]
				Next	
				EndMethod				
	Method deactivate()				
				flamme[0].active=False
				flamme[1].active=False
				funken.active=False
				EndMethod
	Method activate()
				flamme[0].activate()
				flamme[1].activate()
				funken.activate()
				EndMethod				
	Method opacity(op#)
				For Local pit:_particle=EachIn flamme[0].particleinternallist
				 pit.opacityexternalcontrol=op
				Next
				For Local pit:_particle=EachIn flamme[1].particleinternallist
				 pit.opacityexternalcontrol=op
				Next
				For Local pit:_particle=EachIn funken.particleinternallist
				 pit.opacityexternalcontrol=op
				Next
				
				EndMethod				
	Field position:_vector3=Null				
	Field solitaire:_solitaire=Null
	Field channel:TChannel=Null				
	Field flamme:_kaminfeuer[2]
	Field funken:_particlesource=Null
	Field pumptime#[2]
	Field pumpup[2]
	Field pumpgenrate[2]
	Field pumplifetime[2]
	Field rotfac#[2]
	Field offsetrnd#[2]
	Field oldintensity#=0
	Field newintensity#=0
	EndType					
'******************************************************************************************************************
'										U H R
'******************************************************************************************************************
Type _uhr
	Field position:_vector3=Null
	Field solitaire:_solitaire=Null
	Field opacity#=1
	Field mhourorg:_mesh
	Field mhour:_mesh
	Field mminuteorg:_mesh
	Field mminute:_mesh
	Field msecondorg:_mesh
	Field msecond:_mesh
	Field mpendulumorg:_mesh
	Field mpendulum:_mesh
	
	
	Field schlagmodus:Int=0;
	Field schlagstatus:Int=0;
	Field schlagstart:Int=0;
	Field schlagzahl:Int=0;
	Field schlagvolumen#=1;
	
	Field oh:Int
	Field om:Int
	Field os:Int
	
	Method New()	
				position=New _vector3
				EndMethod
	Method init(s:_solitaire)
				solitaire=s
				position.set(-7,7.5,0)
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=s.tdigith
				gg.texture[1,0]=s.tdigith
				gg.position.copy(position)
				gg.color.set(0.8,0.6,0.3,0.9)
				gg.vx.set(0.15,0,0)
				gg.vy.set(0,0.7,0)
				gg.tvy[0].set(0,-1)
				gg.tvy[1].set(0,-1)
				gg.resolution[0]=1
				gg.resolution[1]=1
				mhour=gg.Create()
				mhour.dynamicvertexlight=False
				mhour.blend(True)
				mhour.twosided(True)
				mhour.cull(False)
				'mhour.wrap(True)
				mhour.blendadditive(False)
				mhourorg=mhour.duplicate()
				
				
				
				
				
				gg.texture[0,0]=s.tdigit
				gg.texture[1,0]=s.tdigit
				mminute=gg.Create()
				mminute.dynamicvertexlight=False
				mminute.blend(True)
				mminute.twosided(True)
				mminute.cull(False)
				mminute.blendadditive(False)
				mminuteorg=mminute.duplicate()

				gg.texture[0,0]=s.tdigits
				gg.texture[1,0]=s.tdigits
				msecond=gg.Create()
				msecond.dynamicvertexlight=False
				msecond.blend(True)
				msecond.twosided(True)
				msecond.cull(False)
				msecond.blendadditive(False)
				msecondorg=msecond.duplicate()

				gg=New _geometrygrid
				gg.texture[0,0]=s.tpendulum
				gg.texture[1,0]=s.tpendulum
				gg.position.set(-8.25,5.65+0.28,2)

				gg.color.set(0.8,0.6,0.3,1)
				gg.vx.set(1.5,0,0)
				gg.vy.set(0,-5.5,0)
				gg.tvy[0].set(0,1)
				gg.tvy[1].set(0,1)
				gg.resolution[0]=1
				gg.resolution[1]=1
				mpendulum=gg.Create()
				mpendulum.dynamicvertexlight=False
				mpendulum.blend(True)
				mpendulum.twosided(True)
				mpendulum.cull(False)
				'mhour.wrap(True)
				mpendulum.blendadditive(False)
				mpendulumorg=mpendulum.duplicate()
				'playsoundnormal(solitaire.spendulum,1)
				animatevoid();
				EndMethod	

	Method animatevoid()
				Local time$=CurrentTime()		
				Local sep$[]=New String[1]
				sep[0]=":"
				Local frags$[]=time.split(sep[0])
				Local hour=frags[0].toint()
				Local minute=frags[1].toint()
				Local second=frags[2].toint()

				om=minute
				oh=hour
				os=second
				EndMethod


	Method animate()
				Local time$=CurrentTime()		
				Local sep$[]=New String[1]
				sep[0]=":"
				Local frags$[]=time.split(sep[0])
				Local hour=frags[0].toint()
				Local minute=frags[1].toint()
				Local second=frags[2].toint()

				
				If(om<>minute)
				 If(minute=0)
				  If(oh<>hour)
				   schlagmodus=1;
				   schlagstatus=0;
				   schlagstart=solitaire.clock.ms();
				   If(hour>12) schlagzahl=hour-12; Else schlagzahl=hour;
				  EndIf
				 ElseIf (minute=15) 
				  playambiencestretched(solitaire.suhrschlag0,schlagvolumen,0.99,1.001);
				 ElseIf (minute=30) 
				  schlagmodus=2;
				  schlagstatus=0;
				  schlagstart=solitaire.clock.ms();
				 ElseIf (minute=45) 
				  schlagmodus=3;
				  schlagstatus=0;
				  schlagstart=solitaire.clock.ms();
				 EndIf
				EndIf
				
				'********************** DEBUG ********************
				If(om<>minute)
				 
				EndIf
				'*************************************************
				
				Local t=solitaire.clock.ms();
				Local dt=t-schlagstart;
				
				If(schlagmodus=1)'stunden schlag
				 If(schlagstatus=2)
				  If(schlagzahl>0)
				   If(dt>2000)
				    playambiencestretched(solitaire.suhrschlag0,schlagvolumen,0.99,1.001);
				    schlagzahl:-1;
				    schlagstart=solitaire.clock.ms();
				   EndIf
				  Else
				   schlagmodus=0;
				   schlagstatus=0;
				  EndIf
				 ElseIf(schlagstatus=1)
				  If(dt>11990)
				   schlagstatus=2;
				   schlagstart:+10000
				  EndIf
 				 ElseIf(schlagstatus=0)
				  playambiencestretched(solitaire.suhrschlagstunde,schlagvolumen,0.99,1.001);
				  schlagstatus=1;
 				 EndIf
				EndIf
				
				If(schlagmodus=2)'zweimal schlagen
				 If(schlagstatus=1)
				  If(dt>2000)
				   playambiencestretched(solitaire.suhrschlag0,schlagvolumen,0.99,1.001);
				   schlagstatus=0;
				   schlagmodus=0;
				  EndIf
				 ElseIf(schlagstatus=0)
				  playsoundstretched(solitaire.suhrschlag0,schlagvolumen,0.99,1.001);
				  schlagstatus=1;
				 EndIf
				EndIf
				
				If(schlagmodus=3)'dreimal schlagen
				 If(schlagstatus=2)
				  If(dt>4000)
				   playambiencestretched(solitaire.suhrschlag0,schlagvolumen,0.99,1.001);
				   schlagstatus=0;
				   schlagmodus=0;
				  EndIf
				 ElseIf(schlagstatus=1)
				  If(dt>2000)
				   playambiencestretched(solitaire.suhrschlag0,schlagvolumen,0.99,1.001);
				   schlagstatus=2;
				  EndIf
				 ElseIf(schlagstatus=0)
				  playambiencestretched(solitaire.suhrschlag0,schlagvolumen,0.99,1.001);
				  schlagstatus=1;
				 EndIf
				EndIf
				
				If os<>second
				 If (os Mod 2)=0 playambiencenormal(solitaire.spendulum,schlagvolumen)
				EndIf
				om=minute
				oh=hour
				os=second
				EndMethod
	Method draw(gra:_graphics,cam:_camera)				
				
				Local ahour#=oh
				Local aminute#=om
				Local asecond#=os
				Local apendulum#
				
				ahour:/12
				ahour:+((aminute/60)/12)
				ahour:*360
				aminute:*6
				asecond:*6
				apendulum=Sin(250+500+solitaire.clock.ms()*(Float(180)/Float(1000)))*2
				
				rotate(mhour,mhourorg,position.x+0.075,position.y+0.1,position.z,ahour)
				rotate(mminute,mminuteorg,position.x+0.075,position.y+0.1,position.z,aminute)
				rotate(msecond,msecondorg,position.x+0.075,position.y+0.1,position.z,asecond)
				gra.wrap(True)
				mhour.vertexalpha(opacity)	
				mminute.vertexalpha(opacity)	
				msecond.vertexalpha(opacity)	
				mhour.draw(gra,cam)
				mminute.draw(gra,cam)
				msecond.draw(gra,cam)
				
				
				rotate(mpendulum,mpendulumorg,-8.25+0.75,6.28,2,-1+apendulum)
				Local li#=solitaire.kamin.intensity()
				Local v4:_vector4=New _vector4
				v4.set((0.9+li*0.1)*solitaire.blackscreentransparency,(0.6+li*0.2)*solitaire.blackscreentransparency,(0.3+li*0.1)*solitaire.blackscreentransparency,opacity)
				mpendulum.vertexcolor(v4)
				
				mpendulum.draw(gra,cam)
				gra.culloff()			
				
				
				EndMethod							
	Method rotate(m:_mesh,o:_mesh,mx#,my#,mz#,angle#)				
				Local mit:TLink
				Local oit:TLink
				Local h:_vector3=New _vector3
				Local a:_vector3=New _vector3

				a.set(0,0,1)
				mit=m.vertexlist.firstlink()
				oit=o.vertexlist.firstlink()
				Repeat
				 Local mv:_vertex=_vertex(mit.value())
				 Local ov:_vertex=_vertex(oit.value())
				 ov.get(h)
				 mv.set(h)
				 mit=mit.nextlink()
				 oit=oit.nextlink()
				Until mit=Null 
				m.middle.set(mx,my,mz)
				m.rotate(a,angle)
				EndMethod					
				
							
	EndType	
'******************************************************************************************************************
'										F I G U R E
'******************************************************************************************************************
Type _figure
	Field position:_vector3=Null
	Field solitaire:_solitairefantasy=Null
	Field opacity#=1
	'Field mesh:_mesh
	Field nx#,ny#
	Field imagefigure:timage=Null
	Method New()	
				position=New _vector3
				EndMethod
	Method init(s:_solitairefantasy,i:timage,x#,y#)
				solitaire=s
				nx=x
				ny=y
				imagefigure=i
				
				Rem
				position.set(-23,-22,0)
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=s.tsister
				gg.texture[1,0]=s.tsister
				gg.position.copy(position)
				gg.color.set(0.8,0.6,0.3,1)
				gg.vx.set(25,0,0)
				gg.vy.set(0,25,0)
				gg.tvy[0].set(0,-1)
				gg.tvy[1].set(0,-1)
				gg.resolution[0]=1
				gg.resolution[1]=1
				mesh=gg.Create()
				mesh.dynamicvertexlight=False
				mesh.blend(True)
				mesh.twosided(True)
				mesh.cull(False)
				mesh.blendadditive(False)
				EndRem
				EndMethod	
	Method draw(gra:_graphics,cam:_camera)				
				'gra.wrap(True)	
				'mesh.draw(gra,cam)
				'gra.culloff()			
				Local li#=solitaire.kamin.intensity()
				gra.enabletext2d()
				SetBlend(SOLIDBLEND|ALPHABLEND)
				'SetColor((0.8+li*0.2)*255*solitaire.blackscreentransparency,(0.5+li*0.4)*255*solitaire.blackscreentransparency,(0.3+li*0.2)*255*solitaire.blackscreentransparency)
				SetColor((0.9+li*0.1)*255*solitaire.blackscreentransparency,(0.7+li*0.2)*255*solitaire.blackscreentransparency,(0.4+li*0.1)*255*solitaire.blackscreentransparency)
				SetAlpha(1*opacity)
				Local i:timage=imagefigure
				Local x#=nx*gra.screenw
				Local y#=ny*gra.screenh
				Local w#=(ImageWidth(i)/Float(1920))*gra.screenw
				Local h#=(ImageHeight(i)/Float(1440))*gra.screenh
				DrawImageRect(i,x,y,w,h)
				EndMethod							
	Method animate()
				EndMethod				
	Method inner()
				Local mx#=MouseX()/Float(solitaire.gra.screenw)
				Local my#=MouseY()/Float(solitaire.gra.screenh)
				Local wx#=ImageWidth(imagefigure)/Float(1920)
				Local wy#=ImageHeight(imagefigure)/Float(1440)
				If((mx>nx)And(my>ny)And(mx<(nx+wx))And(my<(ny+wy))And(solitaire.innergamemenu()=False)) Return(True) Else Return(False)
				EndMethod
							
	EndType		
	Rem
'******************************************************************************************************************
	'										F I G U R E D A M E
'******************************************************************************************************************
Type _figuredame Extends _figure
	Method draw(gra:_graphics,cam:_camera)				
				'gra.wrap(True)	
				'mesh.draw(gra,cam)
				'gra.culloff()			
				Local li#=solitaire.kamin.intensity()
				Local i:timage=solitaire.idame
				gra.enabletext2d()
				SetBlend(SOLIDBLEND|ALPHABLEND)
				SetColor((0.9+li*0.1)*255*solitaire.blackscreentransparency,(0.7+li*0.2)*255*solitaire.blackscreentransparency,(0.4+li*0.1)*255*solitaire.blackscreentransparency)
				SetAlpha(1*opacity)
				'Local x#=0.120*gra.screenw
				'Local y#=0.538*gra.screenh
				Local x#=(0.167)*gra.screenw
				Local y#=(0.494)*gra.screenh
				Local w#=(Float(ImageWidth(i))/Float(1920))*gra.screenw
				Local h#=(Float(ImageHeight(i))/Float(1440))*gra.screenh
				DrawImageRect(i,x,y,w,h)
				EndMethod							
	EndType
	EndRem
'******************************************************************************************************************
'										F I R E W O R K S H E E P C A R D S 
'******************************************************************************************************************
Type _fireworksheepcards Extends _particlesource
	Field solitaire:_solitaire=Null
	Method initfireworksheepcards(s:_solitaire,world:_world,psl:TList,pl:TList,c:_clock)
				solitaire=s
				init(world,s.gra,psl,pl,c)
				active=False
				position.set(0,0,-2)
				size=1
				sizetolerance=0.5
				vector.set(0,0,3.5)
				vectortolerance=0.2
				generationrate=20
				lifetimeparticle=5000
				lifetimeparticletolerance=0
				rotation=0
				rotationtolerance=400
				rotationaxistolerance=0.1
				opacity=1
				gfieldforce=1
				insertfirst=True
				room[0].set(10,0,0)
				room[1].set(0,10,0)
				room[2].set(0,0,1)
				drawadd=False
				drawmul=True
				drawalpha=False	
				For Local kk=0 To 10
				 Local m:_mesh
				 Local gg:_geometrygrid=New _geometrygrid
				 gg.texture[0,0]=s.cardsetmanager.texturefront[Rand(0,51)]'tcard[Rand(0,51)]
				 gg.texture[1,0]=s.cardsetmanager.textureback'tcardback[s.cardtexturebackindex]
				 gg.position.set(-0.5,-0.75,0)
				 gg.color.set(1,1,1,0)
				 gg.vx.set(1,0,0)
				 gg.vy.set(0,1.5,0)
				 gg.resolution[0]=1
				 gg.resolution[1]=1
				 m=gg.Create()
				 m.dynamicvertexlight=False
				 m.blend(True)
				 m.blendadditive(False)
				 m.dynamicvertexlight=True
				 m.twosided(True)
				 m.world=world
				 insertmesh(m)
				Next
				axialdivergence=False
				axialposition.set(0,0,0)
				axialvector.set(0,0,1)
				colorcurved=False
				fadeout=True
				fadein=True
				lightdeath=New _light
				lightdeath.init(world,0,0,0, 0.1,0.5,1, 0,True)
				lightdeath.deinsert()
				lightdeathaddition=2
				lightdeathmultiplication=0.93
				'dynamiclight=True
				colorcurve.set(1,0.8,0.5,1  ,  1,0.2,0.05,0,  0,0,0,0, 0,0,0,0)
				simplekollisionz=True
				simplekollisionzvalue=1
				scale=False
				scalevalue=0.95
				simpleshadowz=True
				simpleshadowtexture=solitaire.tshadow
				'simpleshadowlist=solitaire.shadowlist
				EndMethod
				Rem
	Method animate()
                'If(active) 
  				 'If Rand(0,50)=10
  				  generate()
 				 'EndIf
 				Local t#=solitaire.clock.ms()
				 lightdeath.color.set(0.5+Sin(t*0.03)*0.5,0.5+Sin(t*0.04212313)*0.5,0.5+Sin(t*0.024123123311)*0.5)
                EndIf
				End Method
	Method generate()
                Local ps:_particle=Null
				Local i:Int=generationrate
                For Local j:Int=0 To i-1 
   				 ps=createparticle(calculateposition())
                Next
				EndMethod
				EndRem
	EndType	
'******************************************************************************************************************
'										F I R E W O R K C A R D S 
'******************************************************************************************************************
Type _fireworkcards Extends _particlesource
	Field solitaire:_solitaire=Null
	Method initfireworkcards(s:_solitaire,world:_world,psl:TList,pl:TList,c:_clock)
				solitaire=s
				init(world,s.gra,psl,pl,c)
				active=False
				position.set(0,0,-2)
				size=4
				sizetolerance=0
				vector.set(0,0,-1)
				vectortolerance=0.002
				generationrate=1
				lifetimeparticle=1000
				lifetimeparticletolerance=0
				rotation=180
				rotationtolerance=0
				rotationaxistolerance=0.001
				opacity=1
				
				gfieldforce=1
				insertfirst=True
				room[0].set(0,0,0)
				room[1].set(0,0,0)
				room[2].set(0,0,0)
				drawadd=False
				drawmul=True
				drawalpha=False	
				For Local kk=0 To 10
				 Local m:_mesh
				 Local gg:_geometrygrid=New _geometrygrid

				 gg.texture[0,0]=solitaire.cardsetmanager.texturefront[Rand(0,3)+Rand(0,12)*4]'vorher : solitaire.tcard[suit+number*4]
				 gg.texture[1,0]=solitaire.cardsetmanager.textureback'vorher : solitaire.tcardback[solitaire.cardtexturebackindex]

				 'gg.texture[0,0]=s.tcard[Rand(0,51)]
				 'gg.texture[1,0]=s.tcardback[s.cardtexturebackindex]
				 gg.position.set(-0.5,-0.75,0)
				 gg.color.set(1,1,1,0)
				 gg.vx.set(1,0,0)
				 gg.vy.set(0,1.5,0)
				 gg.resolution[0]=1
				 gg.resolution[1]=1
				 m=gg.Create()
				 m.dynamicvertexlight=False
				 m.blend(True)
				 m.blendadditive(False)
				 m.dynamicvertexlight=True
				 m.twosided(True)
				 m.world=world
				 m.vertexalpha(0)
				 insertmesh(m)
				Next
				axialdivergence=False
				axialposition.set(0,0,0)
				axialvector.set(0,0,1)
				colorcurved=False
				fadeout=False
				fadein=True
				lightdeath=New _light
				lightdeath.init(world,0,0,0, 0.1,0.5,1, 0,True)
				lightdeath.deinsert()
				lightdeathaddition=2
				lightdeathmultiplication=0.93
				sounddeath=solitaire.sspark
				sounddeathpitchtolerance=0.05
				sounddeathpitchdoppler=True
				'dynamiclight=True
				colorcurve.set(1,0.8,0.5,1  ,  1,0.2,0.05,0,  0,0,0,0, 0,0,0,0)
				'simplekollisionz=True
				'simplekollisionzvalue=-1
				scale=True
				scalevalue=0.95
				simpleshadowz=True
				simpleshadowtexture=solitaire.tshadow
				'simpleshadowlist=solitaire.shadowlist
				' -----------------------death source------------------------
				pqdeath=New _particlesource
				pqdeath.init(world,s.gra,psl,pl,c)
				pqdeath.active=False
				pqdeath.position.set(0,0,-2)
				pqdeath.size=2
				pqdeath.sizetolerance=0.9
				pqdeath.vector.set(0,0,-0.9)
				pqdeath.vectortolerance=0.6
				pqdeath.generationrate=10
				pqdeath.lifetime=10
				pqdeath.lebenbegrenzt=True
				pqdeath.lifetimeparticle=200
				pqdeath.lifetimeparticletolerance=0.8
				pqdeath.rotation=1390
				pqdeath.rotationtolerance=2950
				pqdeath.opacity=1
				pqdeath.gfieldforce=1
				pqdeath.insertfirst=False
				pqdeath.room[0].set(0,0,0)
				pqdeath.room[1].set(0,0,0)
				pqdeath.room[2].set(0,0,0)
				
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=s.tcoronablue
				gg.texture[1,0]=s.tcoronablue
				gg.position.set(-0.5,-0.5,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(1,0,0)
				gg.vy.set(0,1,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				Local m:_mesh=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				m.dynamicvertexlight=False
				m.twosided(True)
				m.world=world
				pqdeath.insertmesh(m)
				pqdeath.fadeout=True
				pqdeath.fadein=False
				'pqdeath.colorcurve.set(1,1,1,1  ,  1,1,1,0,  0,0,0,0, 0,0,0,0)
				'pqdeath.simplekollisionz=True
				'pqdeath.simplekollisionzvalue=-1
				pqdeath.sinusopacity=True
				pqdeath.sinusopacityrate=10
				pqdeath.sinusopacityratedifference=0.5
				pqdeath.sinusopacityratedifferencetolerance=0.5			
				pqdeath.scale=True
				pqdeath.scalevalue=0.95	
				'sounddeath=solitaire.sexplosion[0]				
				EndMethod
	Method animate()
                If(active) 
  				 'If Rand(0,50)=10
  				  generate()
 				 'EndIf
 				Local t#=solitaire.clock.ms()
				 lightdeath.color.set(0.5+Sin(t*0.03)*0.5,0.5+Sin(t*0.04212313)*0.5,0.5+Sin(t*0.024123123311)*0.5)
                EndIf
				End Method
	Method generate()
                Local ps:_particle=Null
				Local i:Int=generationrate
                For Local j:Int=0 To i-1 
   				 ps=createparticle(calculateposition())
                Next
				EndMethod
	EndType	
'******************************************************************************************************************
'										F I R E W O R K I M A G E 
'******************************************************************************************************************
Type _fireworkimage Extends _particlesource
	Field solitaire:_solitaire=Null
	Field lightborder:_particlesource=Null
	Field sheepmode=False
	'Field pixmaplist:TPixmap=Null
	'Method addpixmap(pm:TPixmap)
'				pixmaplist.addlast(pm)
				'EndMethod
								
	Method initfireworkimage(s:_solitaire,world:_world,psl:TList,pl:TList,c:_clock)
				solitaire=s
				init(world,s.gra,psl,pl,c)
				active=False
				position.set(0,0,-2)
				size=1
				sizetolerance=0.1
				vector.set(0,0,0)
				vectortolerance=0.01
				generationrate=1
				lifetimeparticle=3400
				lifetimeparticletolerance=0.2
				rotation=0
				rotationtolerance=90
				opacity=1
				gfieldforce=1
				insertfirst=True
				room[0].set(5,0,0)
				room[1].set(0,-5,0)
				room[2].set(0,0,1)
				drawadd=False
				drawmul=True
				drawalpha=False	
				Local m:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=s.tsymbolsuit[Rand(0,3)]
				gg.texture[1,0]=gg.texture[0,0]
				gg.position.set(-0.5,-0.5,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(1,0,0)
				gg.vy.set(0,1,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(False)
				m.dynamicvertexlight=False
				m.twosided(True)
				m.world=world
				insertmesh(m)
				colorcurved=True
				fadeout=False
				fadein=False
				colorcurve.set(1,0.8,0.5,0  ,  1,1,1,0,  0,0,0,2, 0,0,0,0)
				simplekollisionz=True
				simplekollisionzvalue=-1
				
				lightborder=New _particlesource
				lightborder.init(world,s.gra,psl,pl,c)
				lightborder.active=False
				lightborder.position.set(0,0,-2)
				lightborder.size=1
				lightborder.sizetolerance=0.1
				lightborder.vector.set(0,0,0)
				lightborder.vectortolerance=0.01
				lightborder.generationrate=1
				lightborder.lifetimeparticle=3400
				lightborder.lifetimeparticletolerance=0.2
				lightborder.rotation=0
				lightborder.rotationtolerance=90
				lightborder.opacity=1
				lightborder.gfieldforce=1
				lightborder.insertfirst=True
				lightborder.room[0].set(5,0,0)
				lightborder.room[1].set(0,-5,0)
				lightborder.room[2].set(0,0,1)
				lightborder.drawadd=False
				lightborder.drawmul=True
				lightborder.drawalpha=False	
				
				gg=New _geometrygrid
				gg.texture[0,0]=s.tcoronared
				gg.texture[1,0]=s.tcoronared

				gg.position.set(-0.5,-0.5,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(1,0,0)
				gg.vy.set(0,1,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				m.dynamicvertexlight=False
				m.twosided(True)
				m.world=world
				lightborder.insertmesh(m)
				lightborder.colorcurved=True
				lightborder.fadeout=False
				lightborder.fadein=False
				lightborder.colorcurve.set(1,1,1,1  ,  1,1,1,0,  0,0,0,4, 0,0,0,-4)
				lightborder.simplekollisionz=True
				lightborder.simplekollisionzvalue=-1
				lightborder.sinusopacity=True
				lightborder.sinusopacityrate=1
				lightborder.sinusopacityratedifference=0.5
				lightborder.sinusopacityratedifferencetolerance=0.5
				lightborder.scale=True
				lightborder.scalevalue=0.97
				
				lightbirth=New _light
				lightbirth.init(world,0,0,0, 1,0.5,1, 0,True)
				lightbirth.deinsert()
				lightbirthaddition=2000
				lightbirthmultiplication=0.9				
				
				EndMethod
	Method activate()
				active=True
				letztegenerierung=clock.ms()
				particlegenerationpositionold.copy(position)
 				'If lightdeath
 				' lightdeath.insert()
				'EndIf
				'If lightbirth
				' lightbirth.copy(position)
				' lightbirth.insert()
				'EndIf
				End Method				
	Method animate()
                If(active) 
 				 Local r=Rand(0,50)
				 If sheepmode r=Rand(0,100)
  				 If r=10
  				  generate()
 				 EndIf
				 'If lightbirth
				 ' lightbirth.intensity:*lightbirthmultiplication
				 'EndIf
				Local littoclear:TList=CreateList()
				For Local lit:_light=EachIn lightdeathlist
				 lit.intensity:*lightdeathmultiplication
				 If lit.intensity<0.001 littoclear.addlast(lit)
				Next
				For Local lit:_light=EachIn lightbirthlist'If lightbirth
				 lit.intensity:*lightbirthmultiplication
				 If lit.intensity<0.001 littoclear.addlast(lit)
				Next
				For Local lit:_light=EachIn littoclear
				 lit.clear()
				Next				
                EndIf
				End Method
	Method generate()
				Local ir=Rand(0,3)
                Local ps:_particle=Null
				Local h:_vector3=New _vector3
				Local hx:_vector3=New _vector3
				Local hy:_vector3=New _vector3
				Local hz:_vector3=New _vector3
				Local pos:_vector3=calculateposition()
				Local pixmap:TPixmap=solitaire.pmsymbolsuit[ir]
				Local pixmaprand:TPixmap=solitaire.pmsymbolsuitrand[ir]
				Local wi=PixmapWidth(pixmap)
				Local he=PixmapHeight(pixmap)
				Local staerke#=Rnd(0.05,0.15)
				If sheepmode staerke:*0.6
				Local staerkez#=Rnd(0.5,3)
				If sheepmode
				 If Rand(0,1)=1
				  pixmaprand=solitaire.pmblumerand[Rand(0,3)]
				  For Local mit:_mesh=EachIn meshlist
				   mit.blendadditive(False)
				  Next
				 Else
				  For Local mit:_mesh=EachIn meshlist
				   For Local pit:_polygon=EachIn mit.polygonlist
				    pit.blendadditive=True
				   Next
				  Next
				 EndIf
				 staerkez:*1.5
				EndIf

				If solitaire.systemaccellerate=False
				 If lightbirth
				  Local lit:_light=New _light
				  lit.copylight(lightbirth)
				  lit.insert()
				  lit.linkparticlesource=lightbirthlist.addlast(lit)
				  lit.copy(position)
				  lit.z:-4
				  lit.intensity:+Rnd(lightbirthaddition/2,lightbirthaddition)
				  If ir=0 Or ir=3
				   lit.color.set(Rnd(0,0.05),Rnd(0.01,0.1),Rnd(0.8,1))
				  Else
				   lit.color.set(Rnd(0.8,1),Rnd(0.2,0.3),Rnd(0.05,0.1))
				  EndIf				
				 EndIf
				EndIf
				
				room[0].set(5,0,0)
				room[1].set(0,-5,0)
				room[2].set(0,0,1)
				Local e:_vector3=New _vector3
				Local ax:_vector3=New _vector3
				ax.set(0,0,1)'calculaterandom()
				Local aw#=Rnd(0,360)
				For Local k=0 To 1
				 rotatevector(ax,room[k],aw,e);room[k].copy(e)
				Next
				
				Local rn#=Rnd(4,7)
								
				'Local it:TLink=pixmaplist.firstlink
				
				'For Local k=0 To ir-1
				' it=it.nextlink()
				'Next
				'pixmap=
				For Local mit:_mesh=EachIn meshlist
				 For Local pit:_polygon=EachIn mit.polygonlist
				  'If sheepmode=False
				   pit.texture[0,0]=solitaire.tsymbolsuit[ir]
				   pit.texture[1,0]=solitaire.tsymbolsuit[ir]
				  'EndIf
				 Next
				Next
				For Local mit:_mesh=EachIn lightborder.meshlist
				 For Local pit:_polygon=EachIn mit.polygonlist
				  If ir=0 Or ir=3
				   pit.texture[0,0]=solitaire.tcoronablue
				   pit.texture[1,0]=solitaire.tcoronablue
				  Else
				   pit.texture[0,0]=solitaire.tcoronared
				   pit.texture[1,0]=solitaire.tcoronared
				  EndIf
				 Next
				Next
				playsoundstretched(solitaire.sexplosion[0],Rnd(0.7,1),0.7,1.2)
				Local geninner=Rand(0,1)
				If sheepmode geninner=0
                For Local y:Int=0 To he-2 Step 2
                 For Local x:Int=0 To wi-2 Step 2 
   				  Local alpha#=Float(x)/Float(wi)
				  Local beta#=Float(y)/Float(he)
				  alpha:-0.5
				  beta:-0.5	
				  Local i:Int=ReadPixel(pixmap,x,y)
				  If ((i&$ff000000) Shr 24) >240 And geninner 
 				   h.copy(pos)
				   hx.copy(room[0])
				   hx.mul(alpha)
				   hy.copy(room[1])
				   hy.mul(beta)
 				   h.add(hx)
				   h.add(hy)
				
				   ps=Null
   				   ps=createparticle(h)

				   hx.mul(staerke)
				   hy.mul(staerke)
				   ps.vector.copy(hx)
				   ps.vector.add(hy)
				   hz.copy(room[2])
				   Local dz#=Sqr(alpha*alpha+beta*beta)
				   hz.mul((0.7-dz)/0.7)	
				   hz.mul(staerkez)
				   ps.vector.add(hz)
				  EndIf
				  Local r:Int=ReadPixel(pixmaprand,x,y)
				  r=((r&$ff000000) Shr 24)
				  If r>20
 				   h.copy(pos)
				   hx.copy(room[0])
				   hx.mul(alpha)
				   hy.copy(room[1])
				   hy.mul(beta)
 				   h.add(hx)
				   h.add(hy)
				   lightborder.size=(Float(r)/Float(255))*8+1
				   lightborder.rotation=Float(r)/Float(255)*10
				   lightborder.rotationtolerance=Float(r)/Float(255)*2000
   				   ps=lightborder.createparticle(pos)

				   hx.mul(staerke*rn)
				   hy.mul(staerke*rn)
				   ps.vector.copy(hx)
				   ps.vector.add(hy)
				   hz.copy(room[2])
				   Local dz#=Sqr(alpha*alpha+beta*beta)
				   hz.mul((0.7-dz)/0.7)	
				   hz.mul(staerkez)
				   ps.vector.add(hz)
				  EndIf
				
                 Next
				Next				
				EndMethod				
	EndType	
'******************************************************************************************************************
'										F I R E W O R K S H E E P I M A G E 
'******************************************************************************************************************
Type _fireworksheepimage Extends _fireworkimage

	Method initfireworksheepimage(s:_solitaire,world:_world,psl:TList,pl:TList,c:_clock)
				initfireworkimage(s,world,psl,pl,c)
				EndMethod
	Method generate()
				Local ir=Rand(0,3)
                Local ps:_particle=Null
				Local h:_vector3=New _vector3
				Local hx:_vector3=New _vector3
				Local hy:_vector3=New _vector3
				Local hz:_vector3=New _vector3
				Local pos:_vector3=calculateposition()
				Local pixmap:TPixmap=solitaire.pmsymbolsuit[ir]
				Local pixmaprand:TPixmap=solitaire.pmsymbolsuitrand[ir]
				Local wi=PixmapWidth(pixmap)
				Local he=PixmapHeight(pixmap)
				Local staerke#=Rnd(0.1,0.3)
				If sheepmode staerke:*0.4
				Local staerkez#=Rnd(0.5,3)
				Local blumenrand=False
				If sheepmode
				 If Rand(0,1)=1
				  blumenrand=True
				  lightborder.sinusopacity=False
 				  lightborder.rotationtolerance=20
				  lightborder.size=0.1
				  pixmaprand=solitaire.pmblumerand[Rand(0,3)]'------------------- blumenrand 
				  For Local mit:_mesh=EachIn lightborder.meshlist
				   mit.blendadditive(False)
				   Local rrr=Rand(0,3)
				   For Local mit:_mesh=EachIn lightborder.meshlist
				    For Local pit:_polygon=EachIn mit.polygonlist
				     pit.texture[0,0]=solitaire.tblume[rrr]
				     pit.texture[1,0]=solitaire.tblume[rrr]
				    Next
				   Next
				  Next
				 Else
				  lightborder.sinusopacity=True
 				  lightborder.rotationtolerance=90
				  lightborder.size=1
				  For Local mit:_mesh=EachIn lightborder.meshlist'.-------------- normaler lichterrand
				   mit.blendadditive(True)
				   For Local mit:_mesh=EachIn lightborder.meshlist
				    For Local pit:_polygon=EachIn mit.polygonlist
				     If ir=0 Or ir=3
				      pit.texture[0,0]=solitaire.tcoronablue
				      pit.texture[1,0]=solitaire.tcoronablue
				     Else
				      pit.texture[0,0]=solitaire.tcoronared
				      pit.texture[1,0]=solitaire.tcoronared
				     EndIf
				    Next
				   Next
				  Next
				 EndIf
				 staerkez:*1.2
				
				Else
				 For Local mit:_mesh=EachIn meshlist
				  For Local pit:_polygon=EachIn mit.polygonlist
				   pit.texture[0,0]=solitaire.tsymbolsuit[ir]
				   pit.texture[1,0]=solitaire.tsymbolsuit[ir]
				  Next
				 Next				
				EndIf

				If lightbirth
				 lightbirth.insert()
				 lightbirth.copy(position)
				 lightbirth.intensity:+lightbirthaddition
				 If ir=0 Or ir=3
				  lightbirth.color.set(0.05,0.1,1)
				 Else
				  lightbirth.color.set(1,0.1,0.05)
				 EndIf				
				EndIf
				
				room[0].set(5,0,0)
				room[1].set(0,-5,0)
				room[2].set(0,0,1)
				Local e:_vector3=New _vector3
				Local ax:_vector3=New _vector3
				ax.set(0,0,1)'calculaterandom()
				Local aw#=Rnd(0,360)
				For Local k=0 To 1
				 rotatevector(ax,room[k],aw,e);room[k].copy(e)
				Next
				
				Local rn#=Rnd(4,7)
								
				'Local it:TLink=pixmaplist.firstlink
				
				'For Local k=0 To ir-1
				' it=it.nextlink()
				'Next
				'pixmap=

				
				
				
				playsoundstretched(solitaire.sexplosion[0],Rnd(0.5,1),0.7,1.2)
				Local geninner=Rand(0,1)
				'If sheepmode geninner=0
                For Local y:Int=0 To he-2 Step 4
                 For Local x:Int=0 To wi-2 Step 4
   				  Local alpha#=Float(x)/Float(wi)
				  Local beta#=Float(y)/Float(he)
				  alpha:-0.5
				  beta:-0.5	
				  Local i:Int=ReadPixel(pixmap,x,y)
				  If ((i&$ff000000) Shr 24) >240 And geninner 
 				   h.copy(pos)
				   hx.copy(room[0])
				   hx.mul(alpha)
				   hy.copy(room[1])
				   hy.mul(beta)
 				   h.add(hx)
				   h.add(hy)
				
				   ps=Null
   				   ps=createparticle(h)

				   hx.mul(staerke)
				   hy.mul(staerke)
				   ps.vector.copy(hx)
				   ps.vector.add(hy)
				   hz.copy(room[2])
				   Local dz#=Sqr(alpha*alpha+beta*beta)
				   hz.mul((0.7-dz)/0.7)	
				   hz.mul(staerkez)
				   ps.vector.add(hz)
				  EndIf
				  Local r:Int=ReadPixel(pixmaprand,x,y)
				  r=((r&$ff000000) Shr 24)
				  If r>20
 				   h.copy(pos)
				   hx.copy(room[0])
				   hx.mul(alpha)
				   hy.copy(room[1])
				   hy.mul(beta)
 				   h.add(hx)
				   h.add(hy)
				   If blumenrand=False
				    lightborder.size=(Float(r)/Float(255))*8+1
				    lightborder.rotation=Float(r)/Float(255)*10
				    lightborder.rotationtolerance=Float(r)/Float(255)*2000
				   Else
				    lightborder.size=(Float(r)/Float(255))*3+1
				    lightborder.rotation=0'Float(r)/Float(255)*10
				    lightborder.rotationtolerance=Float(r)/Float(255)*200
				   EndIf
   				   ps=lightborder.createparticle(pos)

				   hx.mul(staerke*rn)
				   hy.mul(staerke*rn)
				   ps.vector.copy(hx)
				   ps.vector.add(hy)
				   hz.copy(room[2])
				   Local dz#=Sqr(alpha*alpha+beta*beta)
				   hz.mul((0.7-dz)/0.7)	
				   hz.mul(staerkez)
				   ps.vector.add(hz)
				  EndIf
				
                 Next
				Next				
				EndMethod				
	EndType		
'******************************************************************************************************************
'										F I R E W O R K R O C K E T
'******************************************************************************************************************
Type _fireworkrocket Extends _particlesource
	Field solitaire:_solitaire=Null
	Method initfireworkrocket(s:_solitaire,world:_world,psl:TList,pl:TList,c:_clock)
				solitaire=s
				init(world,s.gra,psl,pl,c)
				active=False
				position.set(0,0,-2)
				size=1
				sizetolerance=0.9
				vector.set(0,0,-1)
				vectortolerance=0.4
				generationrate=3
				lifetimeparticle=1400
				lifetimeparticletolerance=0.2
				rotation=90
				rotationtolerance=150
				opacity=1
				gfieldforce=1
				insertfirst=True
				room[0].set(0,0,0)
				room[1].set(0,0,0)
				room[2].set(0,0,0)
				drawadd=False
				drawmul=True
				drawalpha=False	
				Local m:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=s.tcorona
				gg.texture[1,0]=s.tcorona
				gg.position.set(-1.5,-1.5,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(3,0,0)
				gg.vy.set(0,3,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				m.dynamicvertexlight=False
				m.twosided(True)
				m.world=world
				insertmesh(m)
				colorcurved=True
				fadeout=False
				fadein=False
				colorcurve.set(1,0.8,0.5,0  ,  1,1,1,1,  0,0,0,1, 0,0,0,0)
				simplekollisionz=True
				simplekollisionzvalue=-1

				' -----------------------life source------------------------
				pqlife=New _particlesource
				pqlife.particlelist=Null'!
				pqlife.active=False
				pqlife.size=1
				pqlife.sizetolerance=0.1
				pqlife.vector.set(0,0,-0.007)
				pqlife.vectortolerance=0.8
				pqlife.generationrate=50
				pqlife.lifetimeparticle=1000
				pqlife.lifetimeparticletolerance=0.01
				pqlife.rotationtolerance=1.5
				pqlife.opacity=1
				pqlife.position.set(-16.3,9.1,-7)
				pqlife.room[0].set(0,0,0)
				pqlife.room[1].set(0,0,0)
				pqlife.room[2].set(0,0,0)
				pqlife.drawadd=True
				pqlife.drawmul=False
				pqlife.drawalpha=False
	
				pqlife.init(s.world,s.gra,s.particlesourcegamelist,pl,s.clock)
				gg=New _geometrygrid
				gg.texture[0,0]=s.tfeuer
				gg.position.set(-0.5,-0.5,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(2,0,0)
				gg.vy.set(0,2,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				pqlife.insertmesh(m)
				pqlife.colorcurved=True
				pqlife.particlegenerationdensity=0.2
				pqlife.gfieldforce=-1
				pqlife.size=3'+Sin(solitaire.clock.ms()/5)*0.9
				pqlife.rotation=Sin(solitaire.clock.ms()/10)*90'180+Sin(solitaire.clock.ms()/(50+Cos(solitaire.clock.ms()/20)*45))*360
				pqlife.colorcurve.set(0.0,0.0,0.8,0.5  ,  0.8,0.2,0.05,0,  0,0,0,0, -3,-2,0,-4)
				'pqlife.activate()				
				lightdeath=New _light
				lightdeath.init(world,0,0,0, 1,0.8,0.56, 0,True)
				lightdeath.deinsert()
				lightdeathaddition=150
				lightdeathmultiplication=0.85
				
				' -----------------------death source------------------------
				pqdeath=New _particlesource
				pqdeath.init(world,s.gra,psl,pl,c)
				pqdeath.active=False
				pqdeath.position.set(0,0,-2)
				pqdeath.size=1
				pqdeath.sizetolerance=0.9
				pqdeath.vector.set(0,0,-0.7)
				pqdeath.vectortolerance=0.6
				pqdeath.generationrate=100
				pqdeath.lifetime=10
				pqdeath.lebenbegrenzt=True
				pqdeath.lifetimeparticle=3000
				pqdeath.lifetimeparticletolerance=0.2
				pqdeath.rotation=390
				pqdeath.rotationtolerance=950
				pqdeath.opacity=1
				pqdeath.gfieldforce=1
				pqdeath.insertfirst=True
				pqdeath.room[0].set(0,0,0)
				pqdeath.room[1].set(0,0,0)
				pqdeath.room[2].set(0,0,0)
				pqdeath.sinusopacity=True
				pqdeath.sinusopacityrate=1
				pqdeath.sinusopacityratedifference=0.5
				pqdeath.sinusopacityratedifferencetolerance=0.5				
				pqdeath.scale=True
				pqdeath.scalevalue=0.99						
				gg=New _geometrygrid
				gg.texture[0,0]=s.tcorona
				gg.texture[1,0]=s.tcorona
				gg.position.set(-0.5,-0.5,0)
				gg.color.set(1,0,0,1)
				gg.vx.set(1,0,0)
				gg.vy.set(0,1,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				m=gg.Create()
				m.dynamicvertexlight=False
				m.blend(True)
				m.blendadditive(True)
				m.dynamicvertexlight=False
				m.twosided(True)
				m.world=world
				pqdeath.insertmesh(m)
				pqdeath.colorcurved=True
				pqdeath.colorcurve.set(1,0,0,1  ,  1,0,0,0,  -10,10,0,0, 0,0,0,0)
				pqdeath.simplekollisionz=True
				pqdeath.simplekollisionzvalue=-1
				
				sounddeath=solitaire.sexplosion[0]
				EndMethod
	Method animate()
                If(active) 
  				 If Rand(0,50)=10
  				  generate()
 				 EndIf
				 'If lightdeath
				 ' lightdeath.intensity:*lightdeathmultiplication
				 'EndIf
				Print "lightdeathlist count?"+lightdeathlist.count()
				Local littoclear:TList=CreateList()
				For Local lit:_light=EachIn lightdeathlist
				 lit.intensity:*lightdeathmultiplication
				 If lit.intensity<0.001 littoclear.addlast(lit)
				Next
				For Local lit:_light=EachIn lightbirthlist'If lightbirth
				 lit.intensity:*lightbirthmultiplication
				 If lit.intensity<0.001 littoclear.addlast(lit)
				Next
				For Local lit:_light=EachIn littoclear
				 lit.clear()
				Next				
                EndIf
				End Method
	Method generate()
                Local ps:_particle=Null
				Local i:Int=generationrate
                For Local j:Int=0 To i-1 
   				 ps=createparticle(calculateposition())
                Next
				EndMethod
	EndType		
'******************************************************************************************************************
'										B A C K G R O U N D
'******************************************************************************************************************
Type _background
	Method New()
				mesh=Null
				meshlight=Null
				world=Null
				solitaire=Null
				EndMethod
	Method Delete()
				EndMethod
	Method init(s:_solitaire)
				solitaire=s
			 	
				world=s.world
				'------------------------ create diffuse grid --------------------
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=solitaire.tbackgroundgamea
				gg.texture[1,0]=solitaire.tbackgroundgamea
				Local vx#,vy#
				vx=36.3
				vy=-33
				gg.position.set(-vx/2,-vy/2-2,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(vx,0,0)
				gg.vy.set(0,vy,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				'gg.tvx[0].set(Float(1280)/Float(2048),0)
				mesh=gg.Create()
				mesh.dynamicvertexlight=False
				mesh.twosided(True)
				mesh.cull(False)
				mesh.sigmadiffuse(0.34)
				mesh.blendadditive(False)
				mesh.world=world
				' ---------------------- create highlight grid ------------------				
				gg.texture[0,0]=solitaire.tbackgroundgamel
				gg.texture[1,0]=solitaire.tbackgroundgamel
				gg.resolution[0]=8
				gg.resolution[1]=6
				meshlight=gg.Create()
				meshlight.dynamicvertexlight=False
				meshlight.twosided(True)
				meshlight.cull(False)
				meshlight.blendadditive(True)
				meshlight.blend(True)
				meshlight.sigmadiffuse(17)
				meshlight.world=world
				EndMethod
	Method draw(gra:_graphics,cam:_camera)				
				'------ calulate ambient+diffuse vertexcolors for diffuse grid and draw ---------
				mesh.clearvertexlight(True)
				For Local lit:_light=EachIn world.lightlist
				 mesh.determinevertexlight(lit)
				Next
				If opacity<1 
				 mesh.blend(True)
				 mesh.vertexalpha(opacity)
				 
				Else
				 mesh.blend(False)
				EndIf
				If solitaire.blackscreenopacity>0
				' Print "blbl"+solitaire.blackscreentransparency
				 mesh.mulvertexcolor(solitaire.blackscreentransparency)
				EndIf
				mesh.draw(gra,cam)	
				If solitaire.systemaccellerate=False
				'------ calulate highlight vertexcolors for highlight grid and draw -------------
				'use vertex opacity to set a local lighting 
				meshlight.clearvertexlight(False)
				For Local lit:_light=EachIn world.lightlist
				 Local ca:_candle=_candle(lit)
				 If ca=Null 
				  meshlight.determinevertexlight(lit)
				 Else
				  If ca.sparked And solitaire.sparkingmouse=True
				   meshlight.determinevertexlight(lit)
				  EndIf
				 EndIf
				Next
				'the maximum of r,g and b is set as vertexopacity
				Local c:_vector3=New _vector3
				For Local vit:_vertex=EachIn meshlight.vertexlist
				 vit.getrgb(c)
				 Local m#=c.x
				 If m<c.y m=c.y
				 If m<c.z m=c.z
				 vit.seta(m)
				Next
				meshlight.draw(gra,cam)		
				EndIf
									
				
				EndMethod
	Method drawfront(gra:_graphics,cam:_camera)			
				Local i:timage=solitaire.icandleholdergame
				gra.enabletext2d()
				gra.blendmultiplicative()
				SetBlend(SOLIDBLEND|MASKBLEND)
				SetColor(255,255,255)'(0.9+li*0.1)*255*blackscreentransparency,(0.7+li*0.2)*255*blackscreentransparency,(0.4+li*0.1)*255*blackscreentransparency)
				SetAlpha(opacity)
				Local x#=(Float(1516)/Float(1920))*gra.screenw
				Local y#=(Float(100)/Float(1440))*gra.screenh
				Local w#=(Float(ImageWidth(i))/Float(1920))*gra.screenw
				Local h#=(Float(ImageHeight(i))/Float(1440))*gra.screenh					
				DrawImageRect(i,x,y,w,h)					
				If solitaire.systemaccellerate=False
				EndIf
				EndMethod
	Method updatetexture()
				If mesh
				 For Local pit:_polygon=EachIn mesh.polygonlist
				  pit.texture[0,0]=solitaire.tbackgroundgamea
				  pit.texture[1,0]=solitaire.tbackgroundgamea
				 Next
				EndIf
				If meshlight
				 For Local pit:_polygon=EachIn meshlight.polygonlist
				  pit.texture[0,0]=solitaire.tbackgroundgamel
				  pit.texture[1,0]=solitaire.tbackgroundgamel
				 Next
				EndIf
				EndMethod
									
	Field solitaire:_solitaire=Null
	Field world:_world=Null
	Field mesh:_mesh=Null
	Field meshlight:_mesh=Null
	Field opacity#=1
	Field icandleholder:timage=Null
	EndType
