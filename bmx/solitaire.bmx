'Project : Solitaire
'Modul : main
'date of create : 28.02.2008
'date of change : 28.02.2008
Function enableMaximize(hWnd:Long)
				' Adds the Maximize Button "[]"
				Local tmp:Int = GetWindowLongA( hWnd, GWL_STYLE )
				tmp = tmp | WS_MAXIMIZEBOX
				SetWindowLongA( hWnd, GWL_STYLE, tmp )
				DrawMenuBar( hWnd )
				End Function

Function enableMinimize(hWnd:Long)
				' Adds the Minimize Button "_"
				Local tmp:Long = GetWindowLongA( hWnd, GWL_STYLE )
				tmp = tmp | WS_MINIMIZEBOX
				SetWindowLongA( hWnd, GWL_STYLE, tmp )
				DrawMenuBar( hWnd )
				End Function
Function fileexists(fn$)
				If OpenFile(fn)=Null Return(False) Else Return(True)
				EndFunction
Extern "Win32"

				Function GetDC( hWnd ) = "GetDC@4"
				Function ReleaseDC( hWnd, hDC ) = "ReleaseDC@8"
				Function GetDeviceCaps( hDC, nIndex ) = "GetDeviceCaps@8"
End Extern

Const HORZRES = 8
Const VERTRES = 10
Global desktopwidth,desktopheight
Function Get_Screen_Resolution()
				Local hDC,horis_res,vert_res
				hDC = GetDC( Null ) 'get device context for DESKTOP=NULL hwnd
				desktopwidth = GetDeviceCaps( hDC, HORZRES) 'get horisontal resolution
				desktopheight = GetDeviceCaps( hDC, VERTRES) 'get vertical resolution
				ReleaseDC( Null,hDC) 'release desktop DC
				EndFunction				
				
'******************************************************************************************************************
'										C A R D S E T M A N A G E R
'******************************************************************************************************************
Type _cardsetmanager

	Field solitaire:_solitaire=Null
	Field width=256
	Field height=256
	Field widthsmall=64
	Field heightsmall=128
	Field widthmicro=32
	Field heightmicro=32
	Field cardsetfrontlist:TList=Null
	Field cardsetbacklist:TList=Null
	Field actualedit:_cardset=Null
	'source lists
	Field groundlist:TList=Null
	Field motivefrontlist:TList=Null
	Field motivebacklist:TList=Null
	Field framelist:TList=Null
	Field structurelist:TList=Null
	Field impuritylist:TList=Null
	'destination textures
	Field textureback:_texture	
	Field texturefront:_texture[52]
	Field texturebacksmall:_texture	
	Field texturefrontsmall:_texture[52]
	Field texturebackmicro:_texture	
	Field texturefrontmicro:_texture[52]
	
	'algorithm
	Field yellowingpointcount:Int=0
	Field yellowingdeltamap:Float[,,]
	Field yellowingpoint:Float[100,4]	
	
	Field scratchsdeltamap:Float[,,]
	
	
	Method New()
				cardsetfrontlist=CreateList()
				cardsetbacklist=CreateList()
				
				groundlist=CreateList()
				motivefrontlist=CreateList()
				motivebacklist=CreateList()
				framelist=CreateList()
				structurelist=CreateList()
				impuritylist=CreateList()	
				
				yellowingdeltamap=New Float[width,height,4]
				scratchsdeltamap=New Float[width,height,4]
				generateyellowingdeltamap()
				EndMethod
	Method init(s:_solitaire)		
				solitaire=s		
				textureback=New _texture
				textureback.Create(width,height)
				For Local i=0 To 51 
				 texturefront[i]=New _texture
				 texturefront[i].Create(width,height)
				Next
				texturebacksmall=New _texture
				texturebacksmall.Create(widthsmall,heightsmall)
				For Local i=0 To 51 
				 texturefrontsmall[i]=New _texture
				 texturefrontsmall[i].Create(widthsmall,heightsmall)
				Next
				texturebackmicro=New _texture
				texturebackmicro.Create(widthmicro,heightmicro)
				For Local i=0 To 51 
				 texturefrontmicro[i]=New _texture
				 texturefrontmicro[i].Create(widthmicro,heightmicro)
				Next
				
				EndMethod
	Method createhardwaresourcesurfaces(gra:_graphics)
				Local tit:_cardsettexture
				Rem
				For tit=EachIn groundlist
				 gra.texture(0,tit)
				Next
				For tit=EachIn structurelist
				 gra.texture(0,tit)
				Next
				For tit=EachIn motivefrontlist
				 gra.texture(0,tit)
				Next
				For tit=EachIn motivebacklist
				 gra.texture(0,tit)
				Next
				For tit=EachIn framelist
				 gra.texture(0,tit)
				Next
				For tit=EachIn impuritylist
				 gra.texture(0,tit)
				Next
				EndRem
				gra.texture(0,textureback)
				gra.texture(0,texturebacksmall)
				gra.texture(0,texturebackmicro)
				For Local i=0 To 51 
				 gra.texture(0,texturefront[i])
				 gra.texture(0,texturefrontsmall[i])
				 gra.texture(0,texturefrontmicro[i])
				Next
			
				EndMethod				
	Method cleartexturehardwaresources()
				Local tit:_cardsettexture
				For tit=EachIn groundlist
				 tit.clearhardwaresource()
				Next
				For tit=EachIn structurelist
				 tit.clearhardwaresource()
				Next
				For tit=EachIn motivefrontlist
				 tit.clearhardwaresource()
				Next
				For tit=EachIn motivebacklist
				 tit.clearhardwaresource()
				Next
				For tit=EachIn framelist
				 tit.clearhardwaresource()
				Next
				For tit=EachIn impuritylist
				 tit.clearhardwaresource()
				Next				
				EndMethod				
	Method clear()
				textureback.clear()
				textureback=Null
				For Local i=0 To 51 
				 texturefront[i].clear()
				 texturefront[i]=Null
				Next
				texturebacksmall.clear()
				texturebacksmall=Null
				For Local i=0 To 51 
				 texturefrontsmall[i].clear()
				 texturefrontsmall[i]=Null
				Next
				texturebackmicro.clear()
				texturebackmicro=Null
				For Local i=0 To 51 
				 texturefrontmicro[i].clear()
				 texturefrontmicro[i]=Null
				Next
				EndMethod				
	Method ground:_cardsettexture(n$)
				If n="" Return(Null)
				For Local tit:_cardsettexture=EachIn groundlist 
				 If tit.name=n Return(tit)
				Next
				Return(Null)
				EndMethod				
	Method motivefront:_cardsettexture(n$,pos=0)
				If n="" Return(Null)
				For Local tit:_cardsettexture=EachIn motivefrontlist 
				 If tit.name=n 
				  If pos<=0 Return(tit)
				  If pos>51 Return(tit)
				  Local it:TLink=tit.linkmanager
				  Local i=0 
				  Repeat 
				   If it it=it.nextlink()
				   i:+1
				  Until(i=pos)
				  If it Return(_cardsettexture(it.value())) Else Return(Null)
				 EndIf
				Next
				Return(Null)
				EndMethod				
	Method motiveback:_cardsettexture(n$)
				If n="" Return(Null)
				For Local tit:_cardsettexture=EachIn motivebacklist 
				 If tit.name=n Return(tit)
				Next
				Return(Null)
				EndMethod			
	Method frame:_cardsettexture(n$)
				If n="" Return(Null)
				For Local tit:_cardsettexture=EachIn framelist 
				 If tit.name=n Return(tit)
				Next
				Return(Null)
				EndMethod				
	Method structure:_cardsettexture(n$)
				If n="" Return(Null)
				For Local tit:_cardsettexture=EachIn structurelist 
				 If tit.name=n Return(tit)
				Next
				Return(Null)
				EndMethod				
	Method impurity:_cardsettexture(n$)
				If n="" Return(Null)
				For Local tit:_cardsettexture=EachIn impuritylist 
				 If tit.name=n Return(tit)
				Next
				Return(Null)
				EndMethod				
					
	Method Load(path$)					
				'alles einlesen, cardsets und die texturelisten aufbauen
				'cardsets selektionen setzen
				Local dir=ReadDir(path)
				If Not dir 
				 RuntimeError "failed to read card sets directory"
				Else
				 Repeat
				  Local t$=NextFile(dir)
				  If t="" Exit
				  If t="." Or t=".." Continue
				  If t.find(".sol")<>-1 loadcardset(path+"\"+t)	
				 Forever
				 CloseDir(dir)
				EndIf
				EndMethod
	Method savedynamicsets()
				For Local cit:_cardsetfront=EachIn cardsetfrontlist
				 If cit.static=False cit.save(cit.file)
				Next
				For Local cit:_cardsetback=EachIn cardsetbacklist
				 If cit.static=False cit.save(cit.file)
				Next
				EndMethod				
	Method createtexture:_cardsettexture(file$,name$)
				Local ct:_cardsettexture=New _cardsettexture
				ct.initset(Self,file,name)
				Return(ct)
				EndMethod	
	Method fileiscardsetfront(file$)							
				Local s:TStream
				Local h$
				s=ReadFile(file)
				If s 
				 h=ReadLine(s)
				 CloseStream(s)
				EndIf
				If h="front" Return(True) Else Return(False)
				EndMethod
	Method loadcardset(file$)
	 			Local cs:_cardset
				If fileiscardsetfront(file)
				 Print "cardsetfront load"
				 cs=New _cardsetfront
				 cs.init(Self)
				 cs.Load(file)
				Else
				 Print "cardsetback load"
				 cs=New _cardsetback
				 cs.init(Self)
				 cs.Load(file)
				EndIf
				EndMethod			
	Method cardsetfront:_cardsetfront(i)					
				Local j=0 
				For Local cit:_cardsetfront=EachIn cardsetfrontlist
				 If j=i Return(cit)
				 j:+1
				Next
				Return(Null)
				EndMethod	
	Method cardsetback:_cardsetback(i)					
				Local j=0 
				For Local cit:_cardsetback=EachIn cardsetbacklist
				 If j=i Return(cit)
				 j:+1
				Next
				Return(Null)
				EndMethod
	Method generatetexturefront(gra:_graphics,i)
				Local csf:_cardsetfront=cardsetfront(i)
				If csf csf.generatetexture(gra)
				EndMethod
	Method generatetextureback(gra:_graphics,i)
				Local csb:_cardsetback=cardsetback(i)
				If csb csb.generatetexture(gra)
				EndMethod
	Method generatetexture(gra:_graphics)
				Local csf:_cardsetfront=cardsetfront(solitaire.cardtexturefrontindex)
				Local csb:_cardsetback=cardsetback(solitaire.cardtexturebackindex)
				If csf csf.generatetexture(gra)
				If csb csb.generatetexture(gra)
				EndMethod				
	Method generatetexturepreviewall(gra:_graphics)
				For Local csf:_cardsetfront=EachIn cardsetfrontlist
				 csf.generatetexturepreview(gra)
				Next
				For Local csb:_cardsetback=EachIn cardsetbacklist 
				 csb.generatetexturepreview(gra)
				Next
				EndMethod				
	Method generateyellowingdeltamap()				
				yellowingpointcount=Rand(10,15)
				'Local h#=0.001
				'Local t#=Float(0.001)/Float(burnpointcount)
				For Local i=0 To yellowingpointcount-1
				 yellowingpoint[i,0]=Rnd(-1,+1)
				 yellowingpoint[i,1]=Rnd(-1,+1)
				 yellowingpoint[i,2]=Float(1)/Rnd(0.1,0.4)
				 yellowingpoint[i,3]=Rnd(0.03,0.08)
				Next					
				
				Local fx#=-1
				Local fy#=-1
				Local dx#,dy#
				Local e0#
				Local e1#
				Local bi:Int
				Local gi:Int
				Local ri:Int
				Local ss#=Float(1)/(2*0.3*0.3)'optimation gauss
				Local dm:Float Ptr=yellowingdeltamap
				Local wh#=Float(width)/2
				Local hh#=Float(height)/2
				Local fsx#=Float(1)/wh'optimation step
				Local fsy#=Float(1)/hh'optimation step
				fy=-1
			    For Local y=0 To height-1
			  	 fx=-1
				 For Local x=0 To width-1
				  fx=(Float(x)-wh)/wh
				  fy=(Float(y)-hh)/hh
				  e0=0
				  e1=0
				 ' dx=para.x-fx'position at gauss is 0,0
				  'dy=(-para.y)-fy
				  'e0=Exp(-(dx*dx+dy*dy)*ss)'gauss
				  
				  For Local i=0 To yellowingpointcount-1
				   dx=yellowingpoint[i,0]-fx
				   dy=-yellowingpoint[i,1]-fy
				   e0:+Exp(-(dx*dx+dy*dy)*yellowingpoint[i,2])*yellowingpoint[i,3]'e0+(burnpoint[i,2]*(dx*dx+dy*dy))
   				  Next
				  dm[0]=0.18+e0*0.9
				  dm:+1
				  dm[0]=0.22+e0*1.2
				  dm:+1
				  dm[0]=0.32+e0*1.8
				  dm:+1
				  dm[0]=0.3+e0
				  dm:+1
				  fx:+fsx
				 Next
				 fy:+fsy
			 	Next					
				EndMethod
	EndType
'******************************************************************************************************************
'										C A R D S E T T E X T U R E 
'******************************************************************************************************************
Type _cardsettexture Extends _texture
    Field cardsetmanager:_cardsetmanager=Null
	Field linkmanager:TLink=Null
	Field linkset:TLink=Null
	'Field data:Byte Ptr=Null
	Field name$
	Method New()
				name=""
				'data=New Byte[256*256*4]
				EndMethod
	Method initset(cm:_cardsetmanager,f$,n$)
				image=Null
				Print "cardsettexture init"
				cardsetmanager=cm
				name=n
				file=f
				If f<>""
				 Super.init(f)
				 If image=Null Return
				 If image.width<>cardsetmanager.width Return
				 If image.height<>cardsetmanager.height Return
				Else
				 Create(cardsetmanager.width,cardsetmanager.height)
				EndIf
				'If f<>""
				' Local pms:TPixmap=LockImage(image)
				' Local source:Byte Ptr=PixmapPixelPtr(pms)
				' For Local n=0 To (256*256*4)-1
				'  data[n]=source[n]
				' Next
				' UnlockImage(i)
				'EndIf
				EndMethod
	Method clear()
				'data=Null
				If linkmanager
				 RemoveLink(linkmanager)
				 linkmanager=Null
				EndIf
				If linkset
				 RemoveLink(linkset)
				 linkset=Null
				EndIf
				Super.clear()
				EndMethod		
	Method save(s:TStream)		
				WriteLine(s,name)
				WriteLine(s,file)
				Local data:Byte Ptr=PixmapPixelPtr(LockImage(image))				
				s.write(data,cardsetmanager.width*cardsetmanager.height*4)
				UnlockImage(image)
				EndMethod		
	Method Load(s:TStream)		
				Print "cardsettexture load"
				
				name=ReadLine(s)
				file=ReadLine(s)
				Local data:Byte Ptr=PixmapPixelPtr(LockImage(image))				
				s.read(data,cardsetmanager.width*cardsetmanager.height*4)
				UnlockImage(image)
				EndMethod		

	EndType

'******************************************************************************************************************
'										C A R D S E T 
'******************************************************************************************************************
Type _cardset
	Field cardsetmanager:_cardsetmanager=Null
	Field file$=""
	Field linkmanager:TLink=Null



	Field loaded:Int=False
	Field static:Int=False
    Field groundlist:TList=Null'of textures [0..n]
    Field groundselection$'Selektion Hintergrund
    Field groundselectiondefault$

    Field motivelist:TList=Null'of textures [0..n] (im GUI versteckt)
    Field motiveselection$'Selektion Motive
    Field motiveselectiondefault$

    Field framelist:TList=Null'of textures [0..n]
    Field frameselection$'Selektion Rahmen
    Field frameselectiondefault$
	Field framefornumbers#=0
	Field frameforpictures#=0
	Field frameforbacksides#=0
	Field framefornumbersdefault#=0
	Field frameforpicturesdefault#=0
	Field frameforbacksidesdefault#=0

    Field structurelist:TList=Null'of textures [0..n]
    Field structureground#=0'Regler Hintergrundstrukturierung
    Field structuregrounddefault#=0
    Field structuregroundselection$'Selektion Hintergrundstrukturierung
    Field structuregroundselectiondefault$
    Field structuregroundbehind:Int=False 
    Field structuregroundbehinddefault:Int=False
    Field structureframe#=0 'Regler Rahmenstrukturierung
    Field structureframedefault#=0
    Field structureframeselection$'Selektion Rahmenstrukturierung
    Field structureframeselectiondefault$

    Field impuritylist:TList=Null'of textures [0..n]
    Field impurity#=0 'Regler Verunreinigungstextur
    Field impuritydefault#=0
    Field impurityselection$=0'Selektion Verunreinungstextur
    Field impurityselectiondefault$
    Field impurityyellowing#=0'Regler alrorithmische Vergilbung
    Field impurityyellowingdefault#=0
    Field impurityscratchs#=0'Regler Algorithmische Verkratzung
    Field impurityscratchsdefault#=0




	Field sourcetexture:Byte Ptr=Null
	Field surftexture:_textured3d7=Null

	Field sourceground:Byte Ptr=Null
	Field surfground:_textured3d7=Null
	Field sourcegroundstructure:Byte Ptr=Null
	Field surfgroundstructure:_textured3d7=Null
	Field sourceimpurity:Byte Ptr=Null
	Field surfimpurity:_textured3d7=Null
	Field sourcemotive:Byte Ptr=Null
	Field surfmotive:_textured3d7=Null
	Field sourceframe:Byte Ptr=Null
	Field surfframe:_textured3d7=Null
	Field sourceframestructure:Byte Ptr=Null
	Field surfframestructure:_textured3d7=Null
	
	Field destination:Byte Ptr=Null
	Field destinationtexture:_texture=Null
	Field destinationsurface:_textured3d7=Null
	Field destinationhardware=False
	
	Method New()
				groundlist=CreateList()
				motivelist=CreateList()
				framelist=CreateList()
				structurelist=CreateList()
				impuritylist=CreateList()

				EndMethod
	Method init(cm:_cardsetmanager)Abstract				
	Method initcardset(cm:_cardsetmanager)
				cardsetmanager=cm
				EndMethod				
	Method clear()
	
	
				clearlocallists()

				If linkmanager
				 RemoveLink(linkmanager)
				 linkmanager=Null
				EndIf
				EndMethod				
	Method clearlocallists()
				groundlist.clear()
				motivelist.clear()
				framelist.clear()
				structurelist.clear()
				impuritylist.clear()
				EndMethod
	Method reset()
				groundselection=groundselectiondefault
				motiveselection=motiveselectiondefault
				frameselection=frameselectiondefault
				framefornumbers=framefornumbersdefault
				frameforpictures=frameforpicturesdefault
				frameforbacksides=frameforbacksidesdefault
				structureground=structuregrounddefault
				structuregroundselection=structuregroundselectiondefault
				structuregroundbehind=structuregroundbehinddefault
				structureframe=structureframedefault
				structureframeselection=structureframeselectiondefault
				impurity=impuritydefault
				impurityselection=impurityselectiondefault
				impurityyellowing=impurityyellowingdefault
				impurityscratchs=impurityscratchsdefault
				EndMethod				
	Method addstructure(file$,name$)
				Local t:_cardsettexture=cardsetmanager.createtexture(file,name)
				t.linkset=structurelist.addlast(t)
				t.linkmanager=cardsetmanager.structurelist.addlast(t)
				EndMethod								
	Method addground(file$,name$)
				Local t:_cardsettexture=cardsetmanager.createtexture(file,name)
				t.linkset=groundlist.addlast(t)
				t.linkmanager=cardsetmanager.groundlist.addlast(t)
				EndMethod						
	Method addmotive(file$,name$)Abstract
	Method addframe(file$,name$)
				Local t:_cardsettexture=cardsetmanager.createtexture(file,name)
				t.linkset=framelist.addlast(t)
				t.linkmanager=cardsetmanager.framelist.addlast(t)
				EndMethod						
	Method addimpurity(file$,name$)
				Local t:_cardsettexture=cardsetmanager.createtexture(file,name)
				t.linkset=impuritylist.addlast(t)
				t.linkmanager=cardsetmanager.impuritylist.addlast(t)
				EndMethod						
	Method setground(n$)
				groundselection=n
				groundselectiondefault=n
				EndMethod				
	Method setmotive(n$)
				motiveselection=n
				motiveselectiondefault=n
				EndMethod		
	Method setframe(n$,fn#,fp#,fb#)
				frameselection=n
				frameselectiondefault=n
				frameforbacksides=fb
				frameforpictures=fp
				framefornumbers=fn
				frameforbacksidesdefault=fb
				frameforpicturesdefault=fp
				framefornumbersdefault=fn
				EndMethod		
	Method setstructureframe(n$,v#)
				structureframe=v
				structureframedefault=v
				structureframeselection=n
				structureframeselectiondefault=n
				EndMethod									
	Method setstructureground(n$,v#,beh)
				structureground=v
				structuregrounddefault=v
				structuregroundselection=n
				structuregroundselectiondefault=n
				structuregroundbehind=beh
				structuregroundbehinddefault=beh
				EndMethod	
	Method setimpurity(n$,v#,vy#,vs#)												
			    impurity=v 'Regler Verunreinigungstextur
			    impuritydefault=v
			    impurityselection=n'Selektion Verunreinungstextur
			    impurityselectiondefault=n
			    impurityyellowing=vy'Regler alrorithmische Vergilbung
			    impurityyellowingdefault=vy
			    impurityscratchs=vs'Regler Algorithmische Verkratzung
			    impurityscratchsdefault=vs
				EndMethod
	Method opensource:Int(gra:_graphics,front:Int)
				sourceground=Null
				surfground=Null
				sourcegroundstructure=Null
				surfgroundstructure=Null
				sourceimpurity=Null
				surfimpurity=Null
				sourcemotive=Null
				surfmotive=Null
				sourceframe=Null
				surfframe=Null
				sourceframestructure=Null
				surfframestructure=Null	
	
				Local texground:_cardsettexture=cardsetmanager.ground(groundselection)
				Local texmotive:_cardsettexture=Null
				If front
				 texmotive=cardsetmanager.motivefront(motiveselection)
				Else
				 texmotive=cardsetmanager.motiveback(motiveselection)
				EndIf
				Local texframe:_cardsettexture= cardsetmanager.frame(frameselection)
				Local texgroundstructure:_cardsettexture=cardsetmanager.structure(structuregroundselection)
				Local texframestructure:_cardsettexture=cardsetmanager.structure(structureframeselection)
				Local teximpurity:_cardsettexture=cardsetmanager.impurity(impurityselection)
				If texground=Null Return(False)
				
				If texground.image.frames[0]=Null gra.texture(0,texground)
				If texground.image.frames[0]
				 surfground=_textured3d7(texground.image.frames[0])
				 Local res=surfground.surface.Lock(Null,surfground.sinfo,DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR,Null)
				 sourceground=surfground.sinfo.lpSurface					
				EndIf
				
				If texgroundstructure 
				 If texgroundstructure.image.frames[0]=Null gra.texture(0,texgroundstructure)
				 If texgroundstructure.image.frames[0]
				  surfgroundstructure=_textured3d7(texgroundstructure.image.frames[0])
				  Local res=surfgroundstructure.surface.Lock(Null,surfgroundstructure.sinfo,DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR,Null)
				  sourcegroundstructure=surfgroundstructure.sinfo.lpSurface					
				 EndIf				
				EndIf
				
				If teximpurity 
				 If teximpurity.image.frames[0]=Null gra.texture(0,teximpurity)
				 If teximpurity.image.frames[0]
				  surfimpurity=_textured3d7(teximpurity.image.frames[0])
				  Local res=surfimpurity.surface.Lock(Null,surfimpurity.sinfo,DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR,Null)
				  sourceimpurity=surfimpurity.sinfo.lpSurface					
				 EndIf
				EndIf				

				If texmotive 
				 If texmotive.image.frames[0]=Null gra.texture(0,texmotive)
				 If texmotive.image.frames[0]
				  surfmotive=_textured3d7(texmotive.image.frames[0])
				  Local res=surfmotive.surface.Lock(Null,surfmotive.sinfo,DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR,Null)
				  sourcemotive=surfmotive.sinfo.lpSurface					
				 EndIf				
				EndIf
				
				If texframe 
				 If texframe.image.frames[0]=Null gra.texture(0,texframe)
				 If texframe.image.frames[0]
				  surfframe=_textured3d7(texframe.image.frames[0])
				  Local res=surfframe.surface.Lock(Null,surfframe.sinfo,DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR,Null)
				  sourceframe=surfframe.sinfo.lpSurface					
				 EndIf
				EndIf				
				
				If texframestructure 
				 If texframestructure.image.frames[0]=Null gra.texture(0,texframestructure)
				 If texframestructure.image.frames[0]
				  If texframestructure<>texgroundstructure
				   surfframestructure=_textured3d7(texframestructure.image.frames[0])
				   Local res=surfframestructure.surface.Lock(Null,surfframestructure.sinfo,DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR,Null)
				   sourceframestructure=surfframestructure.sinfo.lpSurface					
				  Else
				   sourceframestructure=sourcegroundstructure
				  EndIf
				 EndIf
				EndIf	
				Return(True)			
				EndMethod						
	Method closesource()
				If surfground surfground.surface.unlock(surfground.sinfo)
				If surfframe surfframe.surface.unlock(surfframe.sinfo)
				If surfgroundstructure surfgroundstructure.surface.unlock(surfgroundstructure.sinfo)
				If surfframestructure surfframestructure.surface.unlock(surfframestructure.sinfo)
				If surfmotive surfmotive.surface.unlock(surfmotive.sinfo)
				If surfimpurity surfimpurity.surface.unlock(surfimpurity.sinfo)	
				EndMethod	
	Method opensourcetexture:Int(t:_texture)
				sourcetexture=Null
				surftexture=Null
	
				
				If t.image.frames[0]
				 surftexture=_textured3d7(t.image.frames[0])
				 Local res=surftexture.surface.Lock(Null,surftexture.sinfo,DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR,Null)
				 sourcetexture=surftexture.sinfo.lpSurface					
				 Return(True)
				EndIf
				
				Return(False)			
				EndMethod						
				
	Method closesourcetexture()
				If surftexture surftexture.surface.unlock(surftexture.sinfo)
				EndMethod								
	Method opendestination(t:_texture)
				destination=Null
				destinationsurface=Null
				destinationhardware=False
				destinationtexture=t
				
				If destinationtexture.image.frames[0]
				 destinationhardware=True
				 destinationsurface=_textured3d7(destinationtexture.image.frames[0])
				 Local res=destinationsurface.surface.Lock(Null,destinationsurface.sinfo,DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR,Null)
				 destination=destinationsurface.sinfo.lpSurface			  
				Else
				 Local pmd:TPixmap=LockImage(destinationtexture.image)
				 destination=PixmapPixelPtr(pmd)
				EndIf				
				EndMethod		
	Method closedestination()				
				If destinationhardware
				 destinationsurface.surface.unlock(destinationsurface.sinfo)
				Else
				 UnlockImage(destinationtexture.image)
				EndIf						
				EndMethod
	Method generate(index,frontset)				
				Local m=0
				Local r#=0
				Local g#=0
				Local b#=0
				Local a#=0
				Local rd#=Float(1)/Float(256)
				Local yellowit:Float Ptr=cardsetmanager.yellowingdeltamap
				Local drawframe=False
				Local drawframeopacity#=0
				Local structureoffset=20
				Local structurefactor#=1.1
				If sourceframe
				 If frontset
				  If index<4 Or index>39
				   If frameforpictures>nearzero 
				    drawframe=True
				    drawframeopacity=frameforpictures
				   EndIf
				  Else
				   If framefornumbers>nearzero 
				    drawframe=True
				    drawframeopacity=framefornumbers
				   EndIf
				  EndIf
				 Else
				  If frameforbacksides>nearzero 
				   drawframe=True
				   drawframeopacity=frameforbacksides
				   EndIf
				 EndIf
				EndIf
				Local dit=cardsetmanager.width*cardsetmanager.height-1
				For Local j=0 To dit
				 '-------------------------------------------- load ground --------------------------------------------------
				 r=sourceground[m+2]
				 g=sourceground[m+1]
				 b=sourceground[m+0]
				 a=sourceground[m+3]
				 r:*rd
				 g:*rd
				 b:*rd
				 a:*rd
				 '-------------------------------------------- add groundstructure if fronted -------------------------------
				 If structuregroundbehind
				  If sourcegroundstructure And structureground>0
				   r=r*(1-structureground)+ ((sourcegroundstructure[m+2]+structureoffset)*rd*structurefactor*r)*structureground
				   g=g*(1-structureground)+ ((sourcegroundstructure[m+1]+structureoffset)*rd*structurefactor*g)*structureground
				   b=b*(1-structureground)+ ((sourcegroundstructure[m+0]+structureoffset)*rd*structurefactor*b)*structureground
				  EndIf
				 EndIf
				 '-------------------------------------------- add frame and structure --------------------------------------
				 If drawframe
				  Local fr#=(sourceframe[m+2]*rd)
				  Local fg#=(sourceframe[m+1]*rd)
				  Local fb#=(sourceframe[m+0]*rd)
				  If sourceframestructure And structureframe>0
				   fr=fr*(1-structureframe)+ ((sourceframestructure[m+2]+structureoffset)*rd*structurefactor*fr)*structureframe
				   fg=fg*(1-structureframe)+ ((sourceframestructure[m+1]+structureoffset)*rd*structurefactor*fg)*structureframe
				   fb=fb*(1-structureframe)+ ((sourceframestructure[m+0]+structureoffset)*rd*structurefactor*fb)*structureframe
				  EndIf
				  Local op#=sourceframe[m+3]*rd*drawframeopacity
				  Local oq#=1-op
				  r=r*oq+fr*op
				  g=g*oq+fg*op
				  b=b*oq+fb*op				
				 EndIf
				 '-------------------------------------------- add motive ---------------------------------------------------
				 If sourcemotive
				  Local op#=sourcemotive[m+3]*rd
				  Local oq#=1-op
				  r=r*oq+(sourcemotive[m+2]*rd)*op
				  g=g*oq+(sourcemotive[m+1]*rd)*op
				  b=b*oq+(sourcemotive[m+0]*rd)*op				
				 EndIf
				 '-------------------------------------------- add impurity -------------------------------------------------
				 If sourceimpurity And impurity>0
				  Local op#=impurity*(sourceimpurity[m+3]*rd)
				  Local oq#=1-op
				  r=r*oq+(sourceimpurity[m+2]*rd)*op
				  g=g*oq+(sourceimpurity[m+1]*rd)*op
				  b=b*oq+(sourceimpurity[m+0]*rd)*op
				 EndIf				
				 '-------------------------------------------- add groundstructure if fronted -------------------------------
				 If structuregroundbehind=False
				  If sourcegroundstructure And structureground>0
				   r=r*(1-structureground)+ ((sourcegroundstructure[m+2]+structureoffset)*rd*structurefactor*r)*structureground
				   g=g*(1-structureground)+ ((sourcegroundstructure[m+1]+structureoffset)*rd*structurefactor*g)*structureground
				   b=b*(1-structureground)+ ((sourcegroundstructure[m+0]+structureoffset)*rd*structurefactor*b)*structureground
				  EndIf
				 EndIf
				 '-------------------------------------------- add yellowing ------------------------------------------
				 If impurityyellowing>0
				  r:-yellowit[0]*impurityyellowing
				  g:-yellowit[1]*impurityyellowing
				  b:-yellowit[2]*impurityyellowing
				 EndIf				
				 '-------------------------------------------- set result to destination ------------------------------------
				 If r<0 r=0
				 If g<0 g=0
				 If b<0 b=0
				 If r>1 r=1
				 If g>1 g=1
				 If b>1 b=1
				 
				 If destinationhardware
				  destination[m+2]=Byte(r*255)
				  destination[m+1]=Byte(g*255)
				  destination[m+0]=Byte(b*255)
				  destination[m+3]=Byte(a*255)	
				 Else
				  destination[m+0]=Byte(r*255)
				  destination[m+1]=Byte(g*255)
				  destination[m+2]=Byte(b*255)
				  destination[m+3]=Byte(a*255)	
				 EndIf			
				 m:+4
				 yellowit:+4
				Next
				EndMethod	
	Method generatesmall()
				Local di=0
				Local r#=0
				Local g#=0
				Local b#=0
				Local a#=0
				Local rd#=Float(1)/Float(256)
				Local dit=cardsetmanager.widthsmall*cardsetmanager.heightsmall-1
				Local sx
				Local sy
				Local fx=cardsetmanager.width/cardsetmanager.widthsmall
				Local fy=cardsetmanager.height/cardsetmanager.heightsmall
				Local fc#=Float(1)/Float(fx*fy)
				For Local dy=0 To cardsetmanager.heightsmall-1
				 For Local dx=0 To cardsetmanager.widthsmall-1
				
				  sx=dx*fx
				  sy=dy*fy
				
				  r=0
				  g=0
				  b=0
				  a=0
				  
				  For Local siy=sy To (sy+fy)-1
				   For Local six=sx To (sx+fx)-1
				
				    Local si=(siy*cardsetmanager.width+six)*4
				    r:+Float(sourcetexture[si+2])*rd
				    g:+Float(sourcetexture[si+1])*rd
				    b:+Float(sourcetexture[si+0])*rd
				    a:+Float(sourcetexture[si+3])*rd
				   Next
				  Next
				
				  r:*fc
				  g:*fc
				  b:*fc
				  a:*fc

				  a=1
				  If dx=0 a:*0.5
				  If dy=0 a:*0.5
				  If dx=cardsetmanager.widthsmall-1 a:*0.5
				  If dy=cardsetmanager.heightsmall-1 a:*0.5
				
				  If destinationhardware
				   destination[di+2]=Byte(r*255)
				   destination[di+1]=Byte(g*255)
				   destination[di+0]=Byte(b*255)
				   destination[di+3]=Byte(a*255)	
				  Else
				   destination[di+0]=Byte(r*255)
				   destination[di+1]=Byte(g*255)
				   destination[di+2]=Byte(b*255)
				   destination[di+3]=Byte(a*255)	
				  EndIf			
				  di:+4
				 Next
				Next
				EndMethod							
	Method generatemicro()
				Local di=0
				Local r#=0
				Local g#=0
				Local b#=0
				Local a#=0
				Local rd#=Float(1)/Float(256)
				Local dit=cardsetmanager.widthmicro*cardsetmanager.heightmicro-1
				Local sx
				Local sy
				Local fx=cardsetmanager.width/cardsetmanager.widthmicro
				Local fy=cardsetmanager.height/cardsetmanager.heightmicro
				Local fc#=Float(1)/Float(fx*fy)
				For Local dy=0 To cardsetmanager.heightmicro-1
				 For Local dx=0 To cardsetmanager.widthmicro-1
				  sx=dx*fx
				  sy=dy*fy
				  r=0
				  g=0
				  b=0
				  a=0
				  For Local siy=sy To (sy+fy)-1
				   For Local six=sx To (sx+fx)-1
				    Local si=(siy*cardsetmanager.width+six)*4
				    r:+Float(sourcetexture[si+2])*rd
				    g:+Float(sourcetexture[si+1])*rd
				    b:+Float(sourcetexture[si+0])*rd
				    a:+Float(sourcetexture[si+3])*rd
				   Next
				  Next
				
				  r:*fc
				  g:*fc
				  b:*fc
				  a:*fc
				  a=1
				  If dx=0 a:*0.5
				  If dy=0 a:*0.5
				  If dx=cardsetmanager.widthmicro-1 a:*0.5
				  If dy=cardsetmanager.heightmicro-1 a:*0.5
				
				  If destinationhardware
				   destination[di+2]=Byte(r*255)
				   destination[di+1]=Byte(g*255)
				   destination[di+0]=Byte(b*255)
				   destination[di+3]=Byte(a*255)	
				  Else
				   destination[di+0]=Byte(r*255)
				   destination[di+1]=Byte(g*255)
				   destination[di+2]=Byte(b*255)
				   destination[di+3]=Byte(a*255)	
				  EndIf			
				  di:+4
				 Next
				Next
				EndMethod							

	Method generatetexture(gra:_graphics)Abstract
	Method generatetexturepreview(gra:_graphics)Abstract
	Method save(file$)Abstract
	Method savecardset(s:TStream)
				Local tit:_cardsettexture
				WriteInt(s,static)
    			WriteInt(s,groundlist.count())
				For tit=EachIn groundlist
				 tit.save(s)
				Next
			    WriteLine(s,groundselection)
			    WriteLine(s,groundselectiondefault)

   				WriteInt(s,motivelist.count())
				For tit=EachIn motivelist
				 tit.save(s)
				Next
				WriteLine(s,motiveselection)
				WriteLine(s,motiveselectiondefault)

    			WriteInt(s,framelist.count())
				For tit=EachIn framelist
				 tit.save(s)
				Next
			    WriteLine(s,frameselection)
			    WriteLine(s,frameselectiondefault)
				WriteFloat(s,framefornumbers)
				WriteFloat(s,frameforpictures)
				WriteFloat(s,frameforbacksides)
				WriteFloat(s,framefornumbersdefault)
				WriteFloat(s,frameforpicturesdefault)
				WriteFloat(s,frameforbacksidesdefault)

    			WriteInt(s,structurelist.count())
				For tit=EachIn structurelist
				 tit.save(s)
				Next
    			WriteFloat(s,structureground)
    			WriteFloat(s,structuregrounddefault)
    			WriteLine(s,structuregroundselection)
    			WriteLine(s,structuregroundselectiondefault)
				WriteInt(s,structuregroundbehind)
				WriteInt(s,structuregroundbehinddefault)
    			WriteFloat(s,structureframe)
    			WriteFloat(s,structureframedefault)
    			WriteLine(s,structureframeselection)
    			WriteLine(s,structureframeselectiondefault)

    			WriteInt(s,impuritylist.count())
				For tit=EachIn impuritylist
				 tit.save(s)
				Next
    			WriteFloat(s,impurity)
    			WriteFloat(s,impuritydefault)
    			WriteLine(s,impurityselection)
    			WriteLine(s,impurityselectiondefault)
    			WriteFloat(s,impurityyellowing)
    			WriteFloat(s,impurityyellowingdefault)
    			WriteFloat(s,impurityscratchs)
    			WriteFloat(s,impurityscratchsdefault)			

				EndMethod				
	Method Load(file$)Abstract
	Method loadcardset(s:TStream)	
				Local typ$=ReadLine(s)'"front","back"
				clearlocallists()			
				Local c:Int=0
				Local tit:_cardsettexture
				static=ReadInt(s)
			
				c=ReadInt(s)
				Print "ground count ="+c
				If c>0
				 For Local i=0 To c-1
				  tit=New _cardsettexture
				  tit.initset(cardsetmanager,"","")
				  tit.Load(s)
				  tit.linkset=groundlist.addlast(tit)
				  tit.linkmanager=cardsetmanager.groundlist.addlast(tit)				  
				 Next
				EndIf
			    groundselection=ReadLine(s)
			    groundselectiondefault=ReadLine(s)
			
				c=ReadInt(s)
				Print "front count ="+c
				If c>0
				 For Local i=0 To c-1
				  tit=New _cardsettexture
				  tit.initset(cardsetmanager,"","")
				  tit.Load(s)
				  tit.linkset=motivelist.addlast(tit)
				  If typ="front"
				   tit.linkmanager=cardsetmanager.motivefrontlist.addlast(tit)				  
				  Else
				   tit.linkmanager=cardsetmanager.motivebacklist.addlast(tit)				  
				  EndIf
				 Next
				EndIf
			    motiveselection=ReadLine(s)
			    motiveselectiondefault=ReadLine(s)
			
				c=ReadInt(s)
				Print "frame count ="+c
				If c>0
				 For Local i=0 To c-1
				  tit=New _cardsettexture
				  tit.initset(cardsetmanager,"","")
				  tit.Load(s)
				  tit.linkset=framelist.addlast(tit)
				  tit.linkmanager=cardsetmanager.framelist.addlast(tit)				  
				 Next
				EndIf
			    frameselection=ReadLine(s)
			    frameselectiondefault=ReadLine(s)
				framefornumbers=ReadFloat(s)
				frameforpictures=ReadFloat(s)
				frameforbacksides=ReadFloat(s)

				framefornumbersdefault=ReadFloat(s)
				frameforpicturesdefault=ReadFloat(s)
				frameforbacksidesdefault=ReadFloat(s)

				c=ReadInt(s)
				Print "structure count ="+c
				If c>0
				 For Local i=0 To c-1
				  tit=New _cardsettexture
				  tit.initset(cardsetmanager,"","")
				  tit.Load(s)
				  tit.linkset=structurelist.addlast(tit)
				  tit.linkmanager=cardsetmanager.structurelist.addlast(tit)				  
				 Next
				EndIf
				
    			structureground=ReadFloat(s)
    			structuregrounddefault=ReadFloat(s)
    			structuregroundselection=ReadLine(s)
    			structuregroundselectiondefault=ReadLine(s)
				structuregroundbehind=ReadInt(s)
				structuregroundbehinddefault=ReadInt(s)
    			structureframe=ReadFloat(s)
    			structureframedefault=ReadFloat(s)
    			structureframeselection=ReadLine(s)
    			structureframeselectiondefault=ReadLine(s)

				c=ReadInt(s)
				Print "impurity count ="+c
				
				If c>0
				 For Local i=0 To c-1
				  tit=New _cardsettexture
				  tit.initset(cardsetmanager,"","")
				  tit.Load(s)
				  tit.linkset=impuritylist.addlast(tit)
				  tit.linkmanager=cardsetmanager.impuritylist.addlast(tit)				  
				 Next
				EndIf

    			impurity=ReadFloat(s)
    			impuritydefault=ReadFloat(s)
    			impurityselection=ReadLine(s)
    			impurityselectiondefault=ReadLine(s)
    			impurityyellowing=ReadFloat(s)
    			impurityyellowingdefault=ReadFloat(s)
    			impurityscratchs=ReadFloat(s)
    			impurityscratchsdefault=ReadFloat(s)				
				
				EndMethod
	EndType
'******************************************************************************************************************
'										C A R D S E T F R O N T
'******************************************************************************************************************
Type _cardsetfront Extends _cardset
	Field texturepreview:_texture[4]	

	Method init(cm:_cardsetmanager)
				initcardset(cm)
				linkmanager=cardsetmanager.cardsetfrontlist.addlast(Self)
				For Local j=0 To 3
				 texturepreview[j]=New _texture
				 texturepreview[j].Create(cardsetmanager.width,cardsetmanager.height)
				Next	
				EndMethod
	Method clear()
				For Local j=0 To 3
				 texturepreview[j].clear()
				 texturepreview[j]=Null
				Next
				Super.clear()
				EndMethod				
	Method addmotive(file$,name$)
				Local t:_cardsettexture=cardsetmanager.createtexture(file,name)
				t.linkset=motivelist.addlast(t)
				t.linkmanager=cardsetmanager.motivefrontlist.addlast(t)
				EndMethod	
	Method index:Int()
				Local i=0
				For Local cit:_cardsetfront=EachIn cardsetmanager.cardsetfrontlist
				 If(cit=Self) Return(i)
				 i:+1
				Next
				Return(0)
				EndMethod				
	Method motiveiterator(gra:_graphics,pos)
				If surfmotive surfmotive.surface.unlock(surfmotive.sinfo)
				surfmotive=Null
				sourcemotive=Null
				
				Local texmotive:_cardsettexture=Null
				texmotive=cardsetmanager.motivefront(motiveselection,pos)
				If texmotive 
				 If texmotive.image.frames[0]=Null gra.texture(0,texmotive)
				 If texmotive.image.frames[0]
				  surfmotive=_textured3d7(texmotive.image.frames[0])
				  Local res=surfmotive.surface.Lock(Null,surfmotive.sinfo,DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR,Null)
				  sourcemotive=surfmotive.sinfo.lpSurface					
				 EndIf				
				EndIf
				EndMethod
				
	Method generatetexture(gra:_graphics)
				Print "generatetexture front"
				If opensource(gra,True)=False Return
				For Local i=0 To 51
				 opendestination(cardsetmanager.texturefront[i])
				 
				 generate(i,True)
				 closedestination()
				 If i<51 motiveiterator(gra,i+1)
				 If impurityyellowing>0 If (i Mod 4)=0 cardsetmanager.generateyellowingdeltamap()
				Next
				closesource()
				
				For Local i=0 To 51 
				 If opensourcetexture(cardsetmanager.texturefront[i])
				  opendestination(cardsetmanager.texturefrontsmall[i])
				  generatesmall()
				  closedestination()
				  closesourcetexture()
				 EndIf 
				Next
				For Local i=0 To 51 
				 If opensourcetexture(cardsetmanager.texturefront[i])
				  opendestination(cardsetmanager.texturefrontmicro[i])
				  generatemicro()
				  closedestination()
				  closesourcetexture()
				 EndIf 
				Next
				
				
				
				EndMethod							
	Method generatetexturepreview(gra:_graphics)
				Print "generatetexturepreview front"
				If opensource(gra,True)=False Return
				Local s:Int=0
				Local n:Int=0
				For Local i=0 To 3
				 If i=0 
				  s=0
				  n=0
				 EndIf
				 If i=1 
				  s=1
				  n=6
				 EndIf
				 If i=2 
				  s=3
				  n=11
				 EndIf
				 If i=3 
				  s=2
				  n=12
				 EndIf
				 motiveiterator(gra,s+n*4)
				 opendestination(texturepreview[i])
				 generate(s+n*4,True)
				 closedestination()			
				Next
				closesource()
				EndMethod							
	Method save(f$)
				file=f
				Local s:TStream
				s=WriteFile(file)
				If Not s RuntimeError "failed to save cardsetfront" 
				WriteLine(s,"front")
				Super.savecardset(s)
				CloseStream(s)
				EndMethod	
	Method Load(f$)
				file=f
				Local s:TStream
				s=ReadFile(file)
				If Not s 
				 RuntimeError "failed To Load cardsetfront" 
				Else
				 Super.loadcardset(s)
				 CloseStream(s)
				EndIf
				EndMethod									
	EndType
'******************************************************************************************************************
'										C A R D S E T B A C K 
'******************************************************************************************************************
Type _cardsetback Extends _cardset
	Field texturepreview:_texture
	Method init(cm:_cardsetmanager)
				initcardset(cm)
				linkmanager=cardsetmanager.cardsetbacklist.addlast(Self)
				texturepreview=New _texture
				texturepreview.Create(cardsetmanager.width,cardsetmanager.height)
				EndMethod
	Method clear()
				texturepreview.clear()
				texturepreview=Null
				Super.clear()
				EndMethod				
	Method addmotive(file$,name$)
				Local t:_cardsettexture=cardsetmanager.createtexture(file,name)
				t.linkset=motivelist.addlast(t)
				t.linkmanager=cardsetmanager.motivebacklist.addlast(t)
				EndMethod		
	Method index:Int()
				Local i=0
				For Local cit:_cardsetback=EachIn cardsetmanager.cardsetbacklist
				 If(cit=Self) Return(i)
				 i:+1
				Next
				Return(0)
				EndMethod								
	Method generatetexture(gra:_graphics)
				Print "generatetexture back"
				If opensource(gra,False)=False Return
				opendestination(cardsetmanager.textureback)
				cardsetmanager.generateyellowingdeltamap()
				generate(0,False)
				closedestination()
				closesource()
				
				If opensourcetexture(cardsetmanager.textureback)
				 opendestination(cardsetmanager.texturebacksmall)
				 generatesmall()
				 closedestination()
				 closesourcetexture()
				EndIf 				
				If opensourcetexture(cardsetmanager.textureback)
				 opendestination(cardsetmanager.texturebackmicro)
				 generatemicro()
				 closedestination()
				 closesourcetexture()
				EndIf 				
				EndMethod							
	Method generatetexturepreview(gra:_graphics)
				Print "generatetexturepreview back"
				If opensource(gra,False)=False Return
				opendestination(texturepreview)
				generate(0,False)
				closedestination()			
				closesource()
				EndMethod							
	Method save(f$)
				file=f
				Local s:TStream
				s=WriteFile(file)
				If Not s RuntimeError "failed to save cardsetback" 
				WriteLine(s,"back")
				Super.savecardset(s)
				CloseStream(s)
				EndMethod		
	Method Load(f$)
				file=f
				Local s:TStream
				s=ReadFile(file)
				If Not s 
				 RuntimeError "failed To Load cardsetback" 
				Else
				 Super.loadcardset(s)
				 CloseStream(s)
				EndIf
				EndMethod							
	EndType
	
'******************************************************************************************************************
'										W A T C H D O G S P E E D E N T R Y
'******************************************************************************************************************
Type _watchdogspeedentry
	Field link:TLink=Null
	Field watchdogspeed:_watchdogspeed=Null
	Field value#=-1
	Method init(w:_watchdogspeed,v#)		
				value=v
				watchdogspeed=w
				link=watchdogspeed.fpslist.addlast(Self)
				EndMethod
	EndType
'******************************************************************************************************************
'										W A T C H D O G S P E E D
'******************************************************************************************************************
Type _watchdogspeed
	Method New()
				clock=New _clock
				fpslist=CreateList()
				EndMethod
	Method clear()
				fpslist.clear()
				EndMethod				
	Method reset()
				
				fpslist.clear()
				firstanimation=True	
				firstanimationtime=0
				'*hintgiven=False			
				fpscurrent=-1
				fpscurrenttimeold=0
				fpscurrentcount=0	
				fpsresultaverage=-1
				EndMethod
									
	Method animate:Int()
	 			If hintgiven=False
				 Local ms#=clock.ms()
				 If firstanimation
				  reset()
				  firstanimationtime=ms
				  fpscurrenttimeold=ms
				  firstanimation=False
				  fpscurrentcount=0
				  Return(0)
			 	 Else
				  If ms-firstanimationtime>1000
				   If ms-firstanimationtime<21000'record the fps values for 20s
				    fpscurrentcount:+1
				    Local dt#=ms-fpscurrenttimeold
				    If (dt>fpscurrentintervall)
				     fpscurrenttimeold=ms
				
				     fpscurrent=Float(fpscurrentcount)/(dt*0.001)
				     fpscurrentcount=0
				     Local w:_watchdogspeedentry=New _watchdogspeedentry
				     w.init(Self,fpscurrent)
				    EndIf
				   Else'end recording, validate the measurement
				    If fpsresultaverage=-1
				     calculatestatistics()
					 If fpsresultvariance<0.25'valid measurment, lower than 25% normalized stadnard variance 
					  If fpsresultaverage<=hintvalue
					   Print "Watchdog Speed : giving hint with normalized standard variance = "+fpsresultvariance

				       Return(1)
				      Else'the average is high enough, let the dog sleep for a while (1h)
				       Print "Watchdog Speed : going sleep with normalized standard variance = "+fpsresultvariance
				       Return(0)
				      EndIf
				     Else' invalid measurement -> reset abnd try again
				      Print "Watchdog Speed : invalid measurement with normalized standard variance = "+fpsresultvariance
				      For Local wit:_watchdogspeedentry=EachIn fpslist
				       Print Int(wit.value)
				      Next				
				      reset()
				      fpscurrenttimeold=ms
					  Return(0)
				     EndIf
				    Else
				   	 If (ms-firstanimationtime)<1000*60*60
				      'it sleeps
				 	 Else
				  	  'wake up
				      reset()
				      fpscurrenttimeold=ms				  		 
					 EndIf
				    EndIf
				   EndIf
				  Else 
				   fpscurrentcount=0
				   fpscurrenttimeold=ms
				  EndIf
				  Return(0)
				 EndIf
				EndIf
				Return(0)
				EndMethod
	Method calculatestatistics()
				fpsresultaverage=0
				fpsresultvariance=0
				fpsresultmaximum=0
				Local c#=fpslist.count()
				If c>0
				 For Local wit:_watchdogspeedentry=EachIn fpslist
				  fpsresultaverage:+wit.value
				  If fpsresultmaximum<wit.value fpsresultmaximum=wit.value
				 Next
				 fpsresultaverage:/c
				 For Local wit:_watchdogspeedentry=EachIn fpslist
				  Local df#=wit.value-fpsresultaverage
				  df:*df
				  fpsresultvariance:+df
				 Next
				 fpsresultvariance=Sqr(fpsresultvariance)/fpsresultaverage
				EndIf
				EndMethod
	Method save(s:TStream)
				WriteInt(s,firstanimation)
				WriteFloat(s,clock.ms()-firstanimationtime)
				WriteInt(s,hintgiven)
				WriteFloat(s,hintvalue)
				WriteFloat(s,fpscurrent)
				WriteFloat(s,clock.ms()-fpscurrenttimeold)
				WriteFloat(s,fpscurrentcount)
				WriteFloat(s,fpscurrentintervall)
				WriteFloat(s,fpsresultaverage)
				WriteFloat(s,fpsresultvariance)
				WriteFloat(s,fpsresultmaximum)	
				EndMethod				
	Method Load(s:TStream)		
				fpslist.clear()	
				firstanimation=ReadInt(s)
				firstanimationtime=clock.ms()-ReadFloat(s)
				hintgiven=ReadInt(s)
				hintvalue=ReadFloat(s)		
				fpscurrent=ReadFloat(s)
				fpscurrenttimeold=clock.ms()-ReadFloat(s)
				fpscurrentcount=ReadFloat(s)
				fpscurrentintervall=ReadFloat(s)
				fpsresultaverage=ReadFloat(s)
				fpsresultvariance=ReadFloat(s)
				fpsresultmaximum=ReadFloat(s)
				EndMethod
	Field clock:_clock=Null
	Field firstanimation=True	
	Field firstanimationtime#=0	
	Field hintgiven:Int=False
	Field hintvalue#=40		
	Field fpslist:TList=Null
	Field fpscurrent#=-1
	Field fpscurrenttimeold#=0
	Field fpscurrentcount=0	
	Field fpscurrentintervall#=500	
	Field fpsresultaverage#=-1
	Field fpsresultvariance#=-1
	Field fpsresultmaximum#=-1



	EndType

	
'******************************************************************************************************************
'										S O R T E N T R Y 
'******************************************************************************************************************
Type _sortentry
	Field criterium#=0
	Field name$
	Field selectable=True
	Field color:_vector4=Null
	Field byname=False
	Method New()
				color=New _vector4
				color.set(1,0.8,0.5,1)
				EndMethod
	Method compare:Int(o:Object)
				Local g:_sortentry=_sortentry(o)
				If g
				 If(byname=False)
	 			  If(criterium>g.criterium)
	               Return(True)
				  EndIf
				 Else
				  If (name>g.name) Return(True)
				 EndIf
				EndIf
				Return(False)
				EndMethod	
	EndType
'***************************************************************************************************************
'										P R E V I E W W I N D O W 
'******************************************************************************************************************
Type _previewwindow Extends _gui
	Field solitaire:_solitaire=Null
	Method New()
				End Method
	Method init(s:_solitaire,pg:_gui,px#,py#,pw#,ph#,pr#,pgr#,pb#)
				initgui(pg,px,py,-1,pw,ph,0)
				
				color.set(pr,pgr,pb,color.w)
				colortransformed.copy(color)
				solitaire=s
				End Method
	Method draw(gra:_graphics,cam:_camera)
				If visible
				 SetViewport(0,0,guisystem().width(),guisystem().height())
				 solitaire.updateopacitygamepreview(pfadeopacity*pfadeopacity*pfadeopacity*pfadeopacity*pfadeopacity)
				 solitaire.drawgamepreview(position.getx(),position.gety())
				 gra.enabletext2d()
				EndIf
				End Method
	Method animate(currentkey:Int)
				
				animatechild(currentkey)
				animatehelp()
				End Method
	Method setstate()
				EndMethod				
	EndType

'******************************************************************************************************************
'										A C T I V I T Y
'******************************************************************************************************************
Type _activity
	Field date$
	Field dayindex'nach christus
	Field time$
	Field minuteindex'tagesminute
	Method New()
				date=CurrentDate()
				'Print "The current date is "+date
				dayindex=getdayindex()
				time=CurrentTime()
				minuteindex=getminuteindex()
	Rem			
2004
2008
2012
2016
2020
2024
2028
2032
2036
2040
2044
2048
2052
2056
2060
2064
2068
2072
2076
2080
2084
2088
2092
2096
EndRem				
				EndMethod
	Method getdayindex:Int()'tagesindex seit 2000
				Local h$,o$
				Local l:TList=CreateList()
				Local sep$[]=New String[1]
				sep[0]=" "
				Local ar$[]=date.split(sep[0])
				Local i
				
				Local d=ar[0].toint()
				Local m=0
				Local mo$=ar[1]
				If mo="Jan" m=1
				If mo="Feb" m=2
				If mo="Mar" m=3
				If mo="Apr" m=4
				If mo="May" m=5
				If mo="Jun" m=6
				If mo="Jul" m=7
				If mo="Aug" m=8
				If mo="Sep" m=9
				If mo="Oct" m=10
				If mo="Nov" m=11
				If mo="Dec" m=12
				Local y=ar[2].toint()
				
				
				
			'	Print "tag="+d
			'	Print "month="+m
			'	Print "year="+y
				
				
				
				'If istschaltjahr(y) Print "Schaltjahr!"
				If y<2000 Return(-1)
				
				
				
				Local di=0
				For Local yit=2000 To y-1
				 If istschaltjahr(yit) di:+366 Else di:+365
				Next
				If m>1
				 For Local mit=1 To m-1
				  di:+getdaycountofmonth(mit,y)
				 Next
				EndIf
				di:+d-1
				'Print "dayindex of current date="+di
				Return(di)
				EndMethod
	Method getdaycountofmonth:Int(m,y)				
	 			If m=2
	  			 If istschaltjahr(y) Return(29) Else Return(28)
				Else
				 If m=1 Return(31) 
				 If m=3 Return(31)
				 If m=4 Return(30)
				 If m=5 Return(31)
				 If m=6 Return(30)
				 If m=7 Return(31)
				 If m=8 Return(31)
				 If m=9 Return(30)
				 If m=10 Return(31)
				 If m=11 Return(30)
				 If m=12 Return(31)
				EndIf
				Return(0)
				EndMethod
	Method getminuteindex:Int()
				Return(0)
				EndMethod
	Method istschaltjahr(year)
				If (year Mod 4) > 0 Return(False)
				If (year Mod 100) = 0
				 If (year Mod 400)=0 Return(True) Else Return(False)
				Else
				 Return(True)
				EndIf
				EndMethod				
	Method Load(s:TStream)					
				date=ReadLine(s)
				dayindex=ReadInt(s)
				time=ReadLine(s)
				minuteindex=ReadInt(s)
			'	Print "act load di="+dayindex
				EndMethod
	Method save(s:TStream)			
				WriteLine(s,date)
				WriteInt(s,dayindex)
				WriteLine(s,time)
				WriteInt(s,minuteindex)
				EndMethod
	EndType
'******************************************************************************************************************
'										S T A T U S B A R E N T R Y
'******************************************************************************************************************
Type _statusbarentry
	Field solitaire:_solitaire=Null

	Field text$=""
	Field opacity#=0.6
	Field time#=0
	Field duration=True
	Field durationtime#=2000
	
	Field link:TLink=Null
	Field pfadeopacity#=0
	Field pfadeopacitytime#=0
	Field pfadein=False
	Field pfadeout=False	
	Method init(s:_solitaire,t$,o#=1,dt#=2000)
				solitaire=s
				link=solitaire.statusbarlist.addlast(Self)
				text=t
				opacity=o
				duration=True
				durationtime=dt
				pfadein=True
				pfadeout=False
				pfadeopacitytime=solitaire.clock.ms()
				pfadeopacity=0
				EndMethod
	Method clear()
				If link
				 RemoveLink(link)
				 link=Null
				EndIf
				EndMethod		
	Method fadeout()
				If pfadeout=False
				 pfadein=False
				 pfadeout=True
				 pfadeopacitytime=solitaire.clock.ms()
				EndIf
				EndMethod						
	Method fadein()
				If pfadein=False
				 pfadein=True
				 pfadeout=False
				 pfadeopacitytime=solitaire.clock.ms()
				EndIf
				EndMethod						


	Method draw(gra:_graphics,cam:_camera)
				Local speed#=1
				Local c:_vector4=New _vector4
				Local o:_vector3=New _vector3
				Local h$

				gra.enabletext2d()
				SetImageFont(solitaire.font18)
				Local wm#=TextWidth(text)
				Local bw#=wm+10+10
				o.set(70+gra.screenw/2-wm/2-10,10,0)
				If solitaire.buttonpanel=False And solitaire.menubuttons=False o.x:-340
				If o.x<10 o.x=10
				c.set(0.6,0.4,0.12,pfadeopacity)
				'drawguiboxinvers(o,bw,27,c)
				SetAlpha(c.w);
				SetColor(255,255,255);
				SetBlend(SOLIDBLEND|ALPHABLEND);
				Local breite=bw+40
				Local bild:timage
				If breite<300
				 bild=solitaire.iguihelp24389;
				ElseIf ((breite>=300)And(breite<600))
				 bild=solitaire.iguihelp51280;
				Else
				 bild=solitaire.iguihelp85093;
				EndIf
				DrawImageRect(bild,o.x-20,o.y,breite,60);
				h=text
				o.set(70+gra.screenw/2-wm/2,15+12,1)
				If solitaire.buttonpanel=False And solitaire.menubuttons=False o.x:-340
				If o.x<10 o.x=10
				c.set(1,0.9,0.6,pfadeopacity)
				Drawguitext(h,o,c)				
				
				If((pfadein=False)And(pfadeout=False))
				 Local nt#=solitaire.clock.ms()
				 Local dt#=nt-time
				 If duration
				  If dt>durationtime
				   duration=False
				   time=nt
				  EndIf
				 Else
				  If pfadeout=False
				   fadeout();
				  EndIf
				 EndIf				
				EndIf
				
				Local fadetimenew=solitaire.clock.ms()
				Local ds#=(fadetimenew-pfadeopacitytime)*0.001
				pfadeopacitytime=fadetimenew				
				If pfadein
				 pfadeopacity:+speed*5*ds
				 If pfadeopacity>opacity
				  pfadeopacity=opacity
				  pfadein=False
  				  time=solitaire.clock.ms()
				 EndIf
				EndIf
				If pfadeout
				 pfadeopacity:-speed*ds
				 If pfadeopacity<0
				  pfadeopacity=0
				  'pfadeout=False
				 EndIf
				EndIf					
				
				EndMethod				
	EndType

'******************************************************************************************************************
'										P I L E I N F O E N T R Y
'******************************************************************************************************************
Type _pileinfoentry
	Field solitaire:_solitaire=Null

	Field name$=""
	Field desc0$=""
	Field desc1$=""
	Field opacity#=0.6
	Field time#=0
	Field duration=True
	Field durationtime#=100
	
	Field link:TLink=Null
	Field pfadeopacity#=0
	Field pfadeopacitytime#=0
	Field pfadein=False
	Field pfadeout=False	
	Method init(s:_solitaire,n$,d0$,d1$,o#=1,dt#=100)
				solitaire=s;
				link=solitaire.pileinfolist.addlast(Self);
				name=n;
				desc0=d0;
				desc1=d1;
				opacity=o;
				duration=True;
				durationtime=dt;
				pfadein=True;
				pfadeout=False;
				pfadeopacitytime=solitaire.clock.ms();
				pfadeopacity=0;
				EndMethod
	Method clear()
				If link
				 RemoveLink(link);
				 link=Null;
				EndIf
				EndMethod		
	Method fadeout()
				If pfadeout=False
				 pfadein=False;
				 pfadeout=True;
				 pfadeopacitytime=solitaire.clock.ms();
				EndIf
				EndMethod						
	Method fadein()
				If pfadein=False
				 pfadein=True;
				 pfadeout=False;
				 pfadeopacitytime=solitaire.clock.ms();
				EndIf
				EndMethod						


	Method draw(gra:_graphics,cam:_camera)
				Local speed#=2.5
				Local c:_vector4=New _vector4
				Local o:_vector3=New _vector3
				Local h$





				  gra.enabletext2d();
				  SetImageFont(solitaire.font16);
				  Local wd0#=TextWidth(desc0);
				  Local wd1#=TextWidth(desc1);
				  Local wm#=wd0;
				  Local hm#=25;
				  If(desc1<>"")hm=37+8;
				  If(wd1>wd0) wm=wd1;
				  SetImageFont(solitaire.font18);
				  Local wpi#=TextWidth(name);
				  Local bw#=wm+10+10+wpi;
				  o.set(gra.screenw-200-10-wm,gra.screenh-hm-30,0);
				  If desc0="" And desc1=""
				   o.x:+10;
				   bw:-10;
				  EndIf
				  c.set(0.6,0.4,0.12,0.2*pfadeopacity)
				  SetAlpha(pfadeopacity);
				  SetBlend(SOLIDBLEND|ALPHABLEND);
				  SetColor(255,255,255);
				  Local breite=bw+40;
				  Local bild:timage
				  If(desc1<>"")
				   bild=solitaire.iguihelp839124;
				  ElseIf((desc0="")And(desc1=""))
				   bild=solitaire.iguihelp24389;
				  Else
				   bild=solitaire.iguihelp85093;
				  EndIf
				  DrawImageRect(bild,o.x-20,o.y,breite,hm-5+30);
				 'drawguiboxinvers(o,bw,hm-5,c)
				
				  h=name
				  o.set(gra.screenw-195,gra.screenh-25-17,1)
				  c.set(1,0.85,0.6,pfadeopacity)
				  Drawguitext(h,o,c)				
				  SetImageFont(solitaire.font16)
				  h=desc0
				  If desc1="" o.set(gra.screenw-205-wd0,gra.screenh-22-17,1) Else o.set(gra.screenw-205-wd0,gra.screenh-(35+8)-17,1)
				  c.set(1,0.8,0.5,pfadeopacity)
				  Drawguitext(h,o,c)				
				  If desc1<>""
				   h=desc1
				   o.set(gra.screenw-205-wd1,gra.screenh-24-17,1)
				   c.set(1,0.8,0.5,pfadeopacity)
				   Drawguitext(h,o,c)		
				  EndIf		

				
				
				
				
							
				
				If((pfadein=False)And(pfadeout=False))
				 Local nt#=solitaire.clock.ms()
				 Local dt#=nt-time
				 If duration
				  If dt>durationtime
				   duration=False
				   time=nt
				  EndIf
				 Else
				  If pfadeout=False
				   fadeout();
				  EndIf
				 EndIf				
				EndIf
				
				Local fadetimenew=solitaire.clock.ms()
				Local ds#=(fadetimenew-pfadeopacitytime)*0.001
				pfadeopacitytime=fadetimenew				
				If pfadein
				 pfadeopacity:+speed*2*ds
				 If pfadeopacity>opacity
				  pfadeopacity=opacity
				  pfadein=False
  				  time=solitaire.clock.ms()
				 EndIf
				EndIf
				If pfadeout
				 pfadeopacity:-speed*ds
				 If pfadeopacity<0
				  pfadeopacity=0
				  'pfadeout=False
				 EndIf
				EndIf					
				
				EndMethod				
	EndType
'******************************************************************************************************************
'										S O L I T A I R E
'******************************************************************************************************************
Type _solitaire
	'------------------------------------options switches and values
	Field currentgame=0
	Field currentscene=1
	Field currentmusic=2
	Field currentmusicuser:Int=False
	Field cardslope#=0'1
	Field cardslopepick#=0.6
	Field cardthickness#= 0.0269'0.0269
	Field cardtableaulift#=0.05
	Field naturalpiles#=0.3
	Field cardwidth#=3
	Field cardheight#=4.5
	Field carddistance#=0.2
	Field cardshiftfront#=1.2
	Field cardshiftback#=0.4
	Field sparkingmouse=False
	Field timeduringgame=True
	
	Field buttonpanel=True
	Field gameplaybuttons=True
	Field menubuttons=True
	Field menugameopacity#=1
	Field mouseovercard=True
	Field mouseoverpile=True
	Field greenboard=False
	Field musicsequence=True
	Field fullscreen=True
	Field chimesound=True
	Field systemperformance#=0.5
	Field systemaccellerate:Int=False	
	Field fastvideomode:Int=False
	Field videosynchronisation=False
	
	
	'Field hintgivensystemaccellerate:Int=False
	'Field hintgivenfastvideomode:Int=False
	
	
	Field mybenchmark=False	
	Field cardanimation=True
	Field cardlighting#=0.32
	Field gametypesortmethod:Int=0
	Field lastuser$=""'ist nur etwas lokals , hat nichts mit usermanagement zu zun
	
	Field showedoptionscard:Int=False
	Field showedmenugametype:Int=False
	Field usedskipanimation:Int=3;
	Field activitylist:TList=Null
	
	'game options
	Field pointandclick=False
	Field pointandclickalternative=False
	Field confirmonquit=True
	Field difficulty#=1
	Field autostart=False
	Field autoturncard=True
	Field autodiscard=False
	Field autofoundation=False
	Field autoempty=False
	Field clickplayright=True
	Field clickplaydouble=True
	Field autospeed#=30
	Field tippspeed#=20
	Field cardtexturebackuser:Int=False	  
	Field cardtexturebackindex=0
	Field cardtexturefrontindex=0
	Field cardtexturebackcount=9
	Field cardtexturefrontcount=4
	Field musiccount=5
	Field scenecount=5
	'----------------------------------allgemeine repr‰sentation
	Field hWnd% ' Save current Window handle
	Field sceneambient:_vector3[10]
	Field scenediffuse:_vector3[10]
	Field usermanagement:_usermanagement=Null
	
	Field windowedmodewidth
	Field windowedmodeheight
	Field fastvideomodewidth
	Field fastvideomodeheight
	
	Field game:_game=Null
	Field gamepreview:_game=Null
	Field gamemenu:_game=Null
	Field gamestats:_gamestats[]=Null		
	Field gameopacity#=0
	Field gameopacitytime#=0
	Field pgamefadein=False
	Field pgamefadeout=False
	
	Field gra:_graphicsd3d7=Null
	Field graphicswidthoriginal#=1024
	Field world:_world=Null				
	Field cam:_camerasolitaire=Null
	Field campreview:_camerasolitaire=Null
	Field cammenu:_camerasolitaire=Null
	Field mousevector:_vector3=Null
	Field clock:_clock=Null
	Field guisystem:_guisystem=Null				
	Field shadowlist:TList=Null
	Field shadowpreviewlist:TList=Null	
	Field particlelistbackground:TList=Null
	Field particlegamelist:TList=Null
	Field particlemenulist:TList=Null
	Field particlesourcemenulist:TList=Null
	Field particlesourcegamelist:TList=Null	
	Field current_preview=0
	Field demoplay:Int=False
	Field demoplaylasttime#=0	
	Field gametypeactive:Int[1000]
    Field gamepreviewrectangle:_vector2[2]
    Field gamemenurectangle:_vector2[2]
	'------------------------------------ statusbar data
	Field iguihelp300180:timage=Null
	Field iguihelp51280:timage=Null
	Field iguihelp512111:timage=Null
	Field iguihelp512180:timage=Null	
	Field iguihelp839124:timage=Null	
	Field iguihelp85093:timage=Null	
	Field iguihelp24389:timage=Null	
	Field statusbarlist:TList=Null
	'------------------------------------ pileinfo 
	Field pileinfolist:TList=Null
	'------------------------------------ fonts
	Field font:Timagefont=Null
	Field font30:TImageFont=Null
	Field font24:TImageFont=Null
	Field font22:TImageFont=Null
	Field font20:TImageFont=Null
	Field font18:TImageFont=Null
	Field font16:TImageFont=Null
	Field font14:TImageFont=Null
	Field font10:TImageFont=Null
	Field fontj:TImageFont=Null
	Field fontarial18:timagefont=Null
	Field fontarial16:timagefont=Null	
	
	'----------------------------------allgemeine daten
	Field sgong:TSound=Null	
	Field smove:TSound=Null
	Field sturn:TSound=Null
	Field scardsingle:TSound=Null	
	Field sspend:TSound=Null
	Field sturnsmooth:TSound=Null
	Field ssingle:TSound=Null	
	Field sexplosion:TSound[5]
	Field sfireplace:TSound=Null
	Field spendulum:TSound=Null
	Field suhrschlag0:TSound=Null
	Field suhrschlagstunde:TSound=Null
	Field sspark:TSound=Null	
	
	
	Field mouse:_vector2=Null
	Field mousebutton:Int[2]
	Field cardsetmanager:_cardsetmanager=Null
	Field tcard:_texture[54]
	Field tcardpreview:_texture[20,4]
	Field tcardspecular:_texture=Null
	Field tempty:_texture=Null
	Field temptykey:_texture=Null
	Field tsymbolsuit:_texture[4]
	Field pmsymbolsuitrand:TPixmap[4]
	Field pmsymbolsuit:TPixmap[4]
	Field pmblumerand:TPixmap[4]
	Field tsymbolnumber:_texture[13]
	Field tnumber:_texture[10]	
	Field tsymbolnumbersmall:_texture[13]
	Field tnumbersmall:_texture[10]
	Field tsymbolfine:_texture=Null
	Field tsymbolddd:_texture=Null
	Field tblume:_texture[4]
	Field tblase:_texture=Null	
	Field tcardback:_texture[50]
	Field musicman:_musicmanagement=Null
	Field tshadow:_texture=Null
	Field tshadowblock:_Texture=Null
	Field tshadow16:_texture=Null
	'---------------------------------effekte
	Field pickedpage:_page=Null	
	Field tfeuer:_texture=Null
	Field tfeuer2:_texture=Null
	Field tfeuer3:_texture=Null
	Field tfeuer4:_texture=Null
	Field tfeuer5:_texture=Null
	Field tfeuer6:_texture=Null
	Field tfeuercandle:_texture=Null
	Field tcorona:_texture=Null
	Field tcoronared:_texture=Null
	Field tcoronablue:_texture=Null
	Field tcoronawhite:_texture=Null
	Field tsmoke:_texture[10]
	Field tfunken:_texture[10]
	Field tdigit:_texture=Null
	Field tdigits:_texture=Null
	Field tdigith:_texture=Null
	Field tpendulum:_texture=Null
	Field tbackgroundgamea:_texture=Null
	Field tbackgroundgamel:_texture=Null
	Field ibackgroundgame:timage[100]
	Field backgroundcolor:_vector4=Null
	Field ibackground:timage=Null
	Field background:_background=Null	
	Field kamin:_kamin2=Null
	Field animationlist:TList=Null
	Field candlelist:TList=Null'menue
	Field pagelist:TList=Null'menue
	Field candlegamelist:TList=Null'menue
	Field candlemenulist:TList=Null'menue	
	Field icandleholdermenu:timage=Null
	Field icandleholdergame:timage=Null	
	
	
	

	
	
	
	
	'------------------------------------ load screen
	Field iloadscreen:timage=Null
	Field blendscreenopacity#=0
	Field blendscreen:timage=Null
	Field starttimepause#=0
	'------------------------------------ pause data
	Field paused:Int=False
	Field pauseopacity#=0	
	Field gamedelaytime#=0	
	'-----
	Field blackscreenopacity#=0
	Field blackscreentransparency#=1
	'-----
	Field showfps=False
	Field showfpsstatus=0
	'----------------------------------------menues
	Field menuman:_menumanagement=Null
	Field menumain:_menu=Null
	Field menuoptionslast:_menu=Null
	Field menuopacity#=1'0.9
	Field menuopacity2#=0.7'0.9	
	Field menucameraposition:_vector3=Null
	Field messageboxadditiontextwidth#=150
	Field messageboxadditiontexty#=55
	Field messageboxadditionbuttony#=-20
	
	Field messageboxbuttonwidth#=120
	Field messageboxbuttonheight#=40
	Field messageboxtextcolor:_vector4=Null
	Field messageboxtextz#=1
	Field trackbarlist:TList=Null
	Field checkboxlist:TList=Null
	Field listboxlist:TList=Null
	Field editboxlist:TList=Null
	Field optionscalledfromgame:Int=False
	'------------------------------------ watchdog speed
	Field watchdogspeed:_watchdogspeed=Null

	'------------------------------------------ FPS
	Field fpstext$=""
	Field fpstimeold#=0
	Field fpscount=0
	'-------------------------------------------audio/video options
	Field menuoptionsacoustics:_menu=Null
	Field buttonoptionsacousticsmainmenu:_guibutton=Null
	Field windowoptionsacoustics:_guiwindow=Null
	Field ttitleacoustics:_guitext=Null
	Field tva:_guitext=Null
	Field tvs:_guitext=Null
	Field tvm:_guitext=Null
	Field tms:_guitext=Null	
	Field tsp:_guitext=Null
	Field tfv:_guitext=Null
	Field tsy:_guitext=Null
	Field tmb:_guitext=Null
	Field tfs:_guitext=Null
	Field tbva:_guitrackbar=Null
	Field tbvs:_guitrackbar=Null
	Field tbvm:_guitrackbar=Null
	Field cbms:_guicheckbox=Null
	Field tbsp:_guitrackbar=Null
	Field cbsp:_guicheckbox=Null
	Field cbfv:_guicheckbox=Null
	Field cbsy:_guicheckbox=Null
	Field cbmb:_guicheckbox=Null
	Field cbfs:_guicheckbox=Null
	'----------------------------------------------game options
	Field menuoptionsgame:_menu=Null
	Field buttonoptionsgamemainmenu:_guibutton=Null
	Field windowoptionsgame:_guiwindow=Null
	Field ttitlegame:_guitext=Null
	Field tgpc:_guitext=Null
	Field tgpa:_guitext=Null
	Field tgcq:_guitext=Null
	Field tgdi:_guitext=Null
	Field tgaa:_guitext=Null
	Field tgas:_guitext=Null
	Field tgat:_guitext=Null
	Field tgad:_guitext=Null
	Field tgaf:_guitext=Null
	Field tgae:_guitext=Null
	Field tgcr:_guitext=Null
	Field tgcd:_guitext=Null
	Field tgav:_guitext=Null
	Field cbgpc:_guicheckbox=Null
	Field cbgpa:_guicheckbox=Null
	Field cbgcq:_guicheckbox=Null
	Field tbgdi:_guitrackbar=Null
	Field cbgas:_guicheckbox=Null
	Field cbgat:_guicheckbox=Null
	Field cbgad:_guicheckbox=Null
	Field cbgaf:_guicheckbox=Null
	Field cbgae:_guicheckbox=Null
	Field cbgcr:_guicheckbox=Null
	Field cbgcd:_guicheckbox=Null
	Field tbgav:_guitrackbar=Null
	'-------------------------------------------graphic options
	Field menuoptionsgraphics:_menu=Null
	Field buttonoptionsgraphicsmainmenu:_guibutton=Null
	Field windowoptionsgraphics:_guiwindow=Null
	Field ttitlegraphics:_guitext=Null
	Field tgrtd:_guitext=Null
	Field tgrlp:_guitext=Null
	Field tgrgp:_guitext=Null
	Field tgrmb:_guitext=Null
	Field tgrgo:_guitext=Null
	Field tgrca:_guitext=Null
	Field tgrnp:_guitext=Null
	Field tgrmo:_guitext=Null
	Field tgrmp:_guitext=Null
	Field tgrgr:_guitext=Null
	Field tgrsm:_guitext=Null
	Field tgrcs:_guitext=Null
	Field tgrct:_guitext=Null
	Field tgrcl:_guitext=Null
	Field tgrcw:_guitext=Null
	Field tgrch:_guitext=Null
	Field tgrci:_guitext=Null
	Field cbgrtd:_guicheckbox=Null
	Field cbgrlp:_guicheckbox=Null
	Field cbgrgp:_guicheckbox=Null
	Field cbgrmb:_guicheckbox=Null
	Field tbgrgo:_guitrackbar=Null
	Field cbgrca:_guicheckbox=Null
	Field tbgrnp:_guitrackbar=Null
	Field cbgrmo:_guicheckbox=Null
	Field cbgrmp:_guicheckbox=Null
	Field cbgrgr:_guicheckbox=Null
	Field cbgrsm:_guicheckbox=Null
	Field tbgrcs:_guitrackbar=Null
	Field tbgrct:_guitrackbar=Null
	Field tbgrcl:_guitrackbar=Null
	Field tbgrcw:_guitrackbar=Null
	Field tbgrch:_guitrackbar=Null
	Field tbgrci:_guitrackbar=Null
	
	Field buttonoptionsgraphicslightbright:_guibutton=Null
	Field buttonoptionsgraphicslightmedium:_guibutton=Null
	Field buttonoptionsgraphicslightnatural:_guibutton=Null
	Field buttonoptionsgraphicslightnight:_guibutton=Null
	
	'----------------------------------------cards and decks options
	Field menuoptionscard:_menu=Null
	Field buttonoptionscardmainmenu:_guibutton=Null
	Field windowoptionscard:_guiwindow=Null
	Field ttitlecard:_guitext=Null
	Field ttitleback:_guitext=Null
	Field ttitledeck:_guitext=Null
	Field lbcardtexture:_guilistbox=Null
	Field lbdecktexture:_guilistbox=Null
	Field checkboxoptionscardbacklist:TList=Null
	Field checkboxoptionscardfrontlist:TList=Null
	Field buttonoptionscardchangefrontlist:TList=Null
	Field buttonoptionscardchangebacklist:TList=Null
	'----------------------------------------cards front options (first)
	Field menuoptionscardfront:_menu=Null
	Field buttonoptionscardfrontnext:_guibutton=Null
	Field windowoptionscardfront:_guiwindow=Null
	Field titleoptionscardfront:_guitext=Null
	Field listboxoptionscardfront:_guilistbox=Null
	'---------------------------------------------- credits
	Field menuoptionscredits:_menu=Null
	Field buttonoptionscreditsmainmenu:_guibutton=Null
	Field windowoptionscredits:_guiwindow=Null
	'------------------------------------------------game menu
	Field menugame:_menu=Null
	Field windowgamemenu:_guiwindow=Null
	Field buttongamerules:_guibutton=Null
	Field buttongamenew:_guibutton=Null
	Field buttontipp:_guibutton=Null
	Field buttonauto:_guibutton=Null
	Field buttonundo:_guibutton=Null
	Field buttonredo:_guibutton=Null	
	Field buttongamemainmenu:_guibutton=Null
	Field buttongameoptions:_guibutton=Null
	Field buttongamesave:_guibutton=Null
	Field buttongameload:_guibutton=Null
	Field tgmcurgame:_guitext=Null
	Field tgmtime:_guitext=Null
	Field tgmscore:_guitext=Null
	Field bottombuttons:TList=Null
	'-----------------------------------------------scene menu
	Field menuscene:_menu=Null
	Field buttonscenemainmenu:_guibutton=Null
	Field windowscene:_guiwindow=Null
	Field ttitlescene:_guitext=Null
	Field lbscene:_guilistbox=Null
	Field checkboxscenelist:TList=Null
	'-----------------------------------------------user menu
	Field menuuser:_menu=Null
	Field buttonusermainmenu:_guibutton=Null
	Field buttonusercreate:_guibutton=Null
	Field buttonuseredit:_guibutton=Null
	Field buttonuserdelete:_guibutton=Null
	Field windowuser:_guiwindow=Null
	Field windowusertitle:_guitext=Null
	Field windowuserlist:_guilistbox=Null
	'-----------------------------------------------user create menu
	Field menuusercreate:_menu=Null
	Field buttonusercreatecreate:_guibutton=Null
	Field buttonusercreatecancel:_guibutton=Null
	Field windowusercreate:_guiwindow=Null
	Field windowusercreatetitle:_guitext=Null
	Field windowusercreatetitle1:_guitext=Null
	Field windowusercreatetitle2:_guitext=Null
	Field windowusercreateimagelist:_guilistbox=Null
	Field windowusercreatename:_guieditbox=Null
	Field menuusercreatefrom=0
	'-----------------------------------------------user first menu
	'Field menuuserfirst:_menu=Null
	'Field buttonuserfirstcreate:_guibutton=Null
	'Field windowuserfirst:_guiwindow=Null
	'Field windowuserfirsttitle0:_guitext=Null
	'Field windowuserfirsttitle1:_guitext=Null
	'Field windowuserfirsttitle2:_guitext=Null
	'Field windowuserfirstimagelist:_guilistbox=Null
	'Field windowuserfirstname:_guieditbox=Null
	'-----------------------------------------------cardgenerator menu
	Field menucardgenerator:_menu=Null
	Field cardgeneratormeshfrontlist:TList=Null
	Field cardgeneratormeshbacklist:TList=Null
	Field cardgeneratorbuttonback:_guibutton=Null
	Field cardgeneratorbuttonreset:_guibutton=Null
	Field cardgeneratorwindow:_guiwindow=Null
	Field cardgeneratortexttitle:_guitext=Null

	Field cardgeneratortextground:_guitext=Null
	Field cardgeneratorlistboxground:_guilistbox=Null
	'Field cardgeneratortextgroundstructure:_guitext=Null
	Field cardgeneratorcheckboxgroundstructurebehind:_guicheckbox=Null
	Field cardgeneratorlistboxgroundstructure:_guilistbox=Null
	Field cardgeneratortrackbargroundstructure:_guitrackbar=Null
	
	Field cardgeneratortextframe:_guitext=Null
	Field cardgeneratortextframenumber:_guitext=Null
	Field cardgeneratortextframepicture:_guitext=Null
	Field cardgeneratortextframebackside:_guitext=Null
	Field cardgeneratortrackbarframenumber:_guitrackbar=Null
	Field cardgeneratortrackbarframepicture:_guitrackbar=Null
	Field cardgeneratortrackbarframebackside:_guitrackbar=Null
	Field cardgeneratorlistboxframe:_guilistbox=Null
	Field cardgeneratorlistboxframestructure:_guilistbox=Null
	Field cardgeneratortrackbarframestructure:_guitrackbar=Null

	Field cardgeneratortextimpurity:_guitext=Null
	Field cardgeneratorlistboximpurity:_guilistbox=Null
	Field cardgeneratortrackbarimpurity:_guitrackbar=Null
	Field cardgeneratortrackbarimpurityyellowing:_guitrackbar=Null
	Field cardgeneratortrackbarimpurityscratchs:_guitrackbar=Null

	'-----------------------------------------------statistics menu
	Field menustatistics:_menu=Null
	Field buttonstatisticsmainmenu:_guibutton=Null
	Field buttonstatisticsranks:_guibutton=Null
	Field windowstatistics:_guiwindow=Null

	Field windowstatisticstypetitle:_guitext=Null

	Field windowstatisticstypelist:_guilistbox=Null
	Field windowstatisticssortbox:_guicombobox=Null
	Field windowstatisticstypehigh:_guitext[5]
	
	Field windowstatisticstypecounttext:_guitext=Null
	Field windowstatisticstypequotetext:_guitext=Null
	Field windowstatisticstypetimetext:_guitext=Null
	Field windowstatisticstypediscardtext:_guitext=Null
	Field windowstatisticstypemovestext:_guitext=Null

	Field windowstatisticstypecount:_guitext=Null
	Field windowstatisticstypequote:_guitext=Null
	Field windowstatisticstypetime:_guitext=Null
	Field windowstatisticstypediscard:_guitext=Null
	Field windowstatisticstypemoves:_guitext=Null

	Field windowstatisticstypeclear:_guibutton=Null
	Field windowstatisticstypereset:_guibutton=Null
	Field windowstatisticstyperanks:_guibutton=Null


	Field windowstatisticsuserlist:_guilistbox=Null

	Field windowstatisticsusertitle:_guitext=Null

	Field windowstatisticsusercounttext:_guitext=Null
	Field windowstatisticsuserquotetext:_guitext=Null
	Field windowstatisticsusertimetext:_guitext=Null
	Field windowstatisticsuserdiscardtext:_guitext=Null
	Field windowstatisticsusermovestext:_guitext=Null

	Field windowstatisticsusercount:_guitext=Null
	Field windowstatisticsuserquote:_guitext=Null
	Field windowstatisticsusertime:_guitext=Null
	Field windowstatisticsuserdiscard:_guitext=Null
	Field windowstatisticsusermoves:_guitext=Null
	
	Field windowstatisticsuserthisclear:_guibutton=Null
	Field windowstatisticsuserotherclear:_guibutton=Null
	Field windowstatisticsuserverlauf:_guibutton=Null
	Field windowstatisticsuserverlaufdiscards:_guibutton=Null
	
	Field ttitlestatistics:_guitext=Null
	'-----------------------------------------------ranks menu
	Field menuranks:_menu=Null
	Field buttonranksmainmenu:_guibutton=Null
	Field buttonranksstatistics:_guibutton=Null

	Field windowranks:_guiwindow=Null
	Field windowrankstitle:_guitext=Null

	Field windowrankstypelist:_guilistbox=Null
	Field windowrankssortbox:_guicombobox=Null
	Field windowrankstypehigh:_guitext[5]
	
	Field windowranksranklist:_guilistbox=Null
	
	'---------------------------------------------------game type menu
	Field menugametype:_menu=Null
	Field buttongametypemainmenu:_guibutton=Null
	Field buttongametypestart:_guibutton=Null
	Field windowgametype:_guiwindow=Null	
	Field current:_guitext=Null
	Field typelist:_guilistbox=Null
	Field desclist:_guilistbox=Null
	Field sortbox:_guicombobox=Null
	Field previewwindow:_previewwindow=Null
	Field idonut:timage=Null

	'---------------------------------------------------game type help menu
	Field menugametypehelp:_menu=Null
	Field buttongametypehelpback:_guibutton=Null
	Field windowgametypehelp:_guiwindow=Null	
	Field windowgametypehelptitle:_guitext=Null
	Field windowgametypehelplist:_guilistbox=Null
	Field windowgametypehelppreviewwindow:_previewwindow=Null

	'----------------------------------------------------game type help shared, temporary buttons
	Field buttondemoplayplay:_guibutton=Null
	Field buttondemoplaystop:_guibutton=Null
	Field buttonfoundation:_guibutton=Null
	Field buttondiscard:_guibutton=Null
	Field buttontableau:_guibutton=Null
	Field buttonstock:_guibutton=Null
	Field buttonwaste:_guibutton=Null
	Field buttonredeal:_guibutton=Null
	Field buttonreserve:_guibutton=Null
	Field buttonfreecell:_guibutton=Null
	Field buttonpyramid:_guibutton=Null
	Field buttonlabyrinth:_guibutton=Null

	Field farbekerze:_vector3=Null
	Field farbeambienz:_vector3=Null
	
	Method New()
				menuman=New _menumanagement
				menucameraposition=New _vector3
				
				farbekerze=New _vector3
				farbekerze.set(1,0.96,0.77)		
				farbeambienz=New _vector3
				farbeambienz.set(0.32,0.42,0.58)		
							
				mouse=New _vector2
				activitylist=CreateList()
				trackbarlist=CreateList()
				checkboxlist=CreateList()
				listboxlist=CreateList()
				editboxlist=CreateList()
				statusbarlist=CreateList()
				pileinfolist=CreateList()
				pagelist=CreateList()
				candlelist=CreateList()
				candlegamelist=CreateList()
				candlemenulist=CreateList()
				particlemenulist=CreateList()
				particlegamelist=CreateList()
				'particlelistbackground=CreateList()
				particlesourcemenulist=CreateList()
				particlesourcegamelist=CreateList()
				shadowlist=CreateList()
				shadowpreviewlist=CreateList()
				animationlist=CreateList()
				bottombuttons=CreateList()
				For Local j=0 To 9
				 sceneambient[j]=New _vector3
				 scenediffuse[j]=New _vector3
				Next
			    messageboxtextcolor=New _vector4
				messageboxtextcolor.set(1,0.9,0.5,1)
			    
				campreview=New _camerasolitaire
				campreview.position.set(0,0,-33)
				campreview.view.set(0,0,2)
				campreview.up.set(0,0.8,0)
				campreview.side.set(1,0,0)					
				
				cammenu=New _camerasolitaire
				cammenu.position.set(0,0,-33)
				cammenu.view.set(0,0,2)
				cammenu.up.set(0,0.8,0)
				cammenu.side.set(1,0,0)					
				
				gamepreviewrectangle[0]=New _vector2
				gamepreviewrectangle[1]=New _vector2
				gamepreviewrectangle[0].set(-7.25,-5)
				gamepreviewrectangle[1].set(+7.25,+5)	
				
				gamemenurectangle[0]=New _vector2
				gamemenurectangle[1]=New _vector2
				gamemenurectangle[0].set(-9.5,-12)
				gamemenurectangle[1].set(15,9)	
				
				watchdogspeed=New _watchdogspeed
				
				If(desktopwidth<=1024) 
				 windowedmodewidth=800
				 windowedmodeheight=600
				 fastvideomodewidth=800
 				 fastvideomodeheight=600
				Else
				 windowedmodewidth=1024
				 windowedmodeheight=768
				 fastvideomodewidth=1024
				 fastvideomodeheight=768
				EndIf
				
				
				graphicswidthoriginal=GraphicsWidth()
				getvideomodes()
				

				gameobjective[0]=strobjectivetofoundation
				gameobjective[1]=strobjectivetofoundation
				gameobjective[2]=strobjectivetodiscardsamesuit
				gameobjective[3]=strobjectivetodiscardsamesuit
				gameobjective[4]=strobjectivetodiscardsamesuit
				gameobjective[5]=strobjectivetofoundation
				gameobjective[6]=strobjectivetofoundation
				gameobjective[7]=strobjectivetofoundation
				gameobjective[8]=strobjectivetofoundation
				gameobjective[9]=strobjectivebethoral
				gameobjective[10]=strobjectivetofoundation
				gameobjective[11]=strobjectiveblanket
				gameobjective[12]=strobjectivetofoundation
				gameobjective[13]=strobjectivetofoundation
				gameobjective[14]=strobjectivepyramid
				gameobjective[15]=strobjectivegolf
				gameobjective[16]=strobjectivetofoundation
				gameobjective[17]=strobjectivetofoundation
				gameobjective[18]=strobjectivetodiscardsamesuit
				gameobjective[19]=strobjectivetofoundation
				gameobjective[20]=strobjectivetofoundation
				gameobjective[21]=strobjectivetofoundation
				gameobjective[22]=strobjectivetofoundation
				gameobjective[23]=strobjectivetofoundation
				gameobjective[24]=strobjectivetofoundation
				gameobjective[25]=strobjectivelabyrinth
				gameobjective[26]=strobjectivelabyrintheasy
				gameobjective[27]=strobjectivelabyrinthrodenbach
				gameobjective[28]=strobjectivelabyrinth
				gameobjective[29]=strobjectiveosmosis
				gameobjective[30]=strobjectivegolfeasy
				gameobjective[31]=strobjectivekingspeak
				gameobjective[32]=strobjectivetofoundation
				gameobjective[33]=strobjectivetofoundation
				gameobjective[34]=strobjectivetofoundation
				gameobjective[35]=strobjectivetofoundation
				gameobjective[36]=strobjectivetofoundation
				gameobjective[37]=strobjectiveacesup
				gameobjective[38]=strobjectivetofoundation
				gameobjective[39]=strobjectiveacesup
				gameobjective[40]=strobjectivetodiscard
				gameobjective[41]=strobjectivetofoundation
				gameobjective[42]=strobjectivetofoundation
				gameobjective[43]=strobjectivetofoundation
				gameobjective[44]=strobjectivetofoundation
				gameobjective[45]=strobjectivetofoundation
				gameobjective[46]=strobjectivetofoundation
				gameobjective[47]=strobjectivetofoundation
				gameobjective[48]=strobjectivetofoundation
				gameobjective[49]=strobjectivetofoundation
				gameobjective[50]=strobjectivetofoundation
				gameobjective[51]=strobjectivetofoundation
				gameobjective[52]=strobjectivetofoundation
				gameobjective[53]=strobjectivetofoundation
				gameobjective[54]=strobjectivetofoundationmirrored
				gameobjective[55]=strobjectivetodiscardsamesuit
				gameobjective[56]=strobjectivetofoundation
				gameobjective[57]=strobjectivetodiscardsamesuit
				gameobjective[58]=strobjectivemaze
				gameobjective[59]=strobjectivetofoundation
				gameobjective[60]=strobjectivetofoundation
				gameobjective[61]=strobjectivetofoundation
				gameobjective[62]=strobjectivepyramid
				gameobjective[63]=strobjectivetofoundation
				gameobjective[64]=strobjectivetofoundation
				gameobjective[65]=strobjectivemaze
				gameobjective[66]=strobjectivemaze
				gameobjective[67]=strobjectivemaze
				gameobjective[68]=strobjectiveblanket
				gameobjective[69]=strobjectivepairscross
				gameobjective[70]=strobjectivetofoundation
				gameobjective[71]=strobjectivetofoundation
				gameobjective[72]=strobjectivetofoundation
				gameobjective[73]=strobjectivepyramid
				gameobjective[74]=strobjectivetodiscardsamesuit
				gameobjective[75]=strobjectivetofoundation
				gameobjective[76]=strobjectivetofoundation
				gameobjective[77]=strobjectivetofoundation

				
				EndMethod
	Method getmousevector(gra:_graphics,cam:_camera)
				Local xax:_vector3=New _vector3
				Local yax:_vector3=New _vector3
				xax.copy(cam.side)
				yax.copy(cam.up)
				mouse.set(MouseX(),MouseY())
				mousebutton[0]=MouseDown(1)
				mousebutton[1]=MouseDown(2)
				Local mx#=MouseX()
				Local my#=MouseY()
				Local ix#=mx
				Local iy#=my
				ix:-gra.screenw/2
				iy:-gra.screenh/2
				ix:/gra.screenw/2
				iy:/gra.screenh/2
				iy:*-1
				xax.mul(ix)
				yax.mul(iy)
				mousevector.copy(cam.view)
				mousevector.add(xax)
				mousevector.add(yax)
				'Print "mv.x="+mousevector.x+"  mv.y="+mousevector.y+"  mv.z="+mousevector.z
				'Print "ix="+ix+"  iy="+iy
				EndMethod			
	
	
	Method Graphics_Setup(index=5)
				'If gra gra.deinit()
				'gra=Null
				Local frq=60'Hz
				Local tx[]=[1600,1920,1600,1680,1280,1024,1024]
				Local ty[]=[1200,1200,1200,1050,1024,768 ,768 ]
				Local tc[]=[32  ,32  ,32  ,32  ,32  ,32  ,16  ]
				For Local tit:_texture=EachIn texturelist
				 tit.reinit()
				Next
				If fullscreen
				 Rem
				 Local i=index
				 Local valid=False
				 Repeat
				  valid=False
				  If gra=Null 
				   gra=New _graphicsd3d7
				   valid=gra.init(tx[i],ty[i],tc[i],frq)
				  Else
				   valid=gra.set(tx[i],ty[i],tc[i],frq)
				  EndIf
				  i:+1
				 Until valid Or i>6
				 EndRem
				 Local wx,wy,de,ra
				 Local mode:tgraphicsmode
				 If fastvideomode
				  mode=getvideomode(fastvideomodewidth,fastvideomodeheight)
				 Else
				  mode=getvideomode(desktopwidth,desktopheight)
				 EndIf
				 If mode
				  wx=mode.width
				  wy=mode.height
				  de=mode.depth
				  ra=mode.hertz
				 Else
				  wx=windowedmodewidth
				  wy=windowedmodeheight
				  de=16
				  ra=60
				 EndIf
				 If gra=Null 
				  gra=New _graphicsd3d7
				  gra.init(wx,wy,de,ra)
				 Else
				  gra.set(wx,wy,de,ra)
				 EndIf				
				Else
				 If gra=Null 
				  gra=New _graphicsd3d7
				  gra.init(windowedmodewidth,windowedmodeheight,0,0)
				 Else
				  gra.set(windowedmodewidth,windowedmodeheight,0,0)
				 EndIf
				EndIf
				Print "Grafikmodus ist : "+gra.screenw+"*"+gra.screenh+", "+gra.screen_bpp+"bit, "+gra.screen_freq+"Hz"
				guisystem.size.set(gra.screenw,gra.screenh,1)
				guisystem.animate(0)
				hWnd = GetActiveWindow() ' Save current Window handle
				' Init Buttons
				enableMinimize(hwnd%)
				enableMaximize(hwnd%)
				If cardsetmanager cardsetmanager.createhardwaresourcesurfaces(gra)
				'SetClsColor (0,0,0)
				EndMethod	
	Method updatetextureload(shortcut$,path$,loadscreen)				
				For Local n=0 To 51 
				 If tcard[n] 
				  tcard[n].clear()
				  tcard[n]=Null
				 EndIf
				 tcard[n]=New _texture
				 Local s=(n Mod 4)+1
				 Local suit
				 If s=1 suit=4
				 If s=2 suit=1
				 If s=3 suit=2
				 If s=4 suit=3
				 Local number=(n/4)+1
				 Local h$=number;If h.length=1 h="0"+h
				
				 Local fn$="cards\card_"+shortcut+"_00"+(cardtexturefrontindex+1)+"0_"+suit+"_"+h+".tga"
				 If fileexists(fn) 
				  tcard[n].init(fn)
				 Else
  				  tcard[n].init("Incbin::"+path+"\card_"+shortcut+"_00"+(cardtexturefrontindex+1)+"0_"+suit+"_"+h+".tga")
  				 EndIf
  				 If loadscreen drawloadscreen()
				Next		
				EndMethod					
	Method loadstatistics(filename$)
				Local s:TStream
				s=ReadFile(filename)
				If Not s 
				 generatestatistics()
				 savestatistics(filename)
				Else
				 Local typecount=ReadInt(s)
				 For Local i=0 To typecount-1
				  Local typ$=ReadLine(s)
				  If typ="_gamestats"
				   gamestats[i]=New _gamestats
				   gamestats[i].init(Self,i)
				   gamestats[i].Load(s)
				  Print "loadstats"
				  EndIf
				 Next
				 CloseStream(s)
				EndIf
				EndMethod	
	Method savestatistics(filename$)
				Local si=0
				Local ei=0
				For Local i=0 To gametypecount-1
				 gamestats[i].savename="stat"+si
				 si:+1
				 For Local eit:_gamestatsentry=EachIn gamestats[i].entrylist
				  eit.savename="statsentry"+ei
				  ei:+1
				 Next
				 For Local eit:_gamestatsentry=EachIn gamestats[i].highscorelist
				  eit.savename="statsentry"+ei
				  ei:+1
				 Next
				Next
				Local s:TStream
				s=WriteFile(filename)
				If Not s RuntimeError "failed to open the save file" 
				WriteInt(s,gametypecount)
				For Local i=0 To gametypecount-1
				 gamestats[i].save(s)
				Next
				CloseStream(s)				
				EndMethod	
	Method generatestatistics()
				For Local i=0 To gametypecount-1
				 gamestats[i]=New _gamestats
				 gamestats[i].init(Self,i)
				 For Local j=0 To 4
				  Local eit:_gamestatsentry=New _gamestatsentry
				  eit.init(gamestats[i])
				  If Rand(0,1)=0
				   eit.discards=Rand(gametypediscards[i]/3,gametypediscards[i])
				  Else 
				   eit.discards=gametypediscards[i]
				  EndIf 
				  'eit.time=20*1000+(15*60*1000)*gametypetime[i]+ Rnd(0,5*1000*60)
				  eit.time=gametypetime[i]*60*1000+Rnd(60*500,60*2500)'20*1000+(15*60*1000)*gametypetime[i]+ Rnd(0,5*1000*60)
				  eit.moves=Rand(eit.discards*2,eit.discards*5)
				  eit.user=strdummynames[Rand(0,9)]
				  eit.undos=0
				  eit.tipps=0				
				 Next
				 For Local eit:_gamestatsentry=EachIn gamestats[i].entrylist
				  Local ehi:_gamestatsentry=New _gamestatsentry
				  ehi.init(gamestats[i],True)
				  ehi.copy(eit)
				 Next
				 gamestats[i].highscorelist.sort()
				 gamestats[i].entrylist.clear()
				Next
				EndMethod	
	Method createstatisticsentry:_gamestatsentry()
				Local e:_gamestatsentry=New _gamestatsentry
				e.init(gamestats[currentgame])
				Return(e)
				EndMethod															
	Method takestatistics(showhighscore)
				EndMethod
	Method adjustcamera()				
				EndMethod					
	Method loadoptions(filename$)
				activitylist.clear()
				Local s:TStream
				s=ReadFile(filename)
				If Not s 
				 saveoptions(filename)
				Else
				 currentgame=ReadInt(s)
				 currentscene=ReadInt(s)
				 currentmusic=ReadInt(s)
				 currentmusicuser=ReadInt(s)
				 cardtexturebackindex=ReadInt(s)
				 cardtexturefrontindex=ReadInt(s)
				 cardtexturebackuser=ReadInt(s)
				 cardslope=ReadFloat(s)
				 cardslopepick=ReadFloat(s)
				 cardthickness=ReadFloat(s)
				 cardtableaulift=ReadFloat(s)
				 naturalpiles=ReadFloat(s)
				' cardwidth=ReadFloat(s)
				' cardheight=ReadFloat(s)
				 carddistance=ReadFloat(s)
				 cardshiftfront=ReadFloat(s)
				 cardshiftback=ReadFloat(s)
				 sparkingmouse=ReadInt(s)
				 timeduringgame=ReadInt(s)
				 buttonpanel=ReadInt(s)
				 gameplaybuttons=ReadInt(s)
				 menubuttons=ReadInt(s)
				 menugameopacity=ReadFloat(s)
				 mouseovercard=ReadInt(s)
				 mouseoverpile=ReadInt(s)
				 greenboard=ReadInt(s)
				 fullscreen=ReadInt(s)
				 systemaccellerate=ReadInt(s)
				 fastvideomode=ReadInt(s)
				 videosynchronisation=ReadInt(s)
				
				' hintgivensystemaccellerate=ReadInt(s)
				' hintgivenfastvideomode=ReadInt(s)
				
				 cardanimation=ReadInt(s)
				 pointandclick=ReadInt(s)
				 pointandclickalternative=ReadInt(s)
				 autostart=ReadInt(s)
				 autoturncard=ReadInt(s)
				 autodiscard=ReadInt(s)
				 autofoundation=ReadInt(s)
				 autoempty=ReadInt(s)
				 clickplayright=ReadInt(s)
				 clickplaydouble=ReadInt(s)
				 confirmonquit=ReadInt(s)
				 difficulty=ReadFloat(s)
				 autospeed=ReadFloat(s)
				 tippspeed=ReadFloat(s)
				 volumeambience=ReadFloat(s)
				 volumesound=ReadFloat(s)
				 volumemusic=ReadFloat(s)
				' chimesound=ReadInt(s)
				 musicsequence=ReadInt(s)
				 systemperformance=ReadFloat(s)
				 lastuser=ReadLine(s)

				 showedoptionscard=ReadInt(s)
				 showedmenugametype=ReadInt(s)
				 usedskipanimation=ReadInt(s)
				 Local ca=ReadInt(s)
				 If ca>0
				  For Local i=0 To ca-1
				   Local a:_activity=New _activity
				 
				  activitylist.addlast(a)
				   a.Load(s)
				  Next
				 EndIf
				
				 cardlighting=ReadFloat(s)
				 farbekerze.Load(s)
				 farbeambienz.Load(s)
				 If watchdogspeed watchdogspeed.Load(s)
				 CloseStream(s)
				EndIf
				EndMethod
	Method saveoptions(filename$)
				Local s:TStream
				s=WriteFile(filename)
				If Not s RuntimeError "failed to open the save file" 
				WriteInt(s,currentgame)
				WriteInt(s,currentscene)
				WriteInt(s,currentmusic)
				WriteInt(s,currentmusicuser)
				WriteInt(s,cardtexturebackindex)
				WriteInt(s,cardtexturefrontindex)
				WriteInt(s,cardtexturebackuser)
				WriteFloat(s,cardslope)
				WriteFloat(s,cardslopepick)
				WriteFloat(s,cardthickness)
				WriteFloat(s,cardtableaulift)
				WriteFloat(s,naturalpiles)
				'WriteFloat(s,cardwidth)
				'WriteFloat(s,cardheight)
				WriteFloat(s,carddistance)
				WriteFloat(s,cardshiftfront)
				WriteFloat(s,cardshiftback)
				WriteInt(s,sparkingmouse)
				WriteInt(s,timeduringgame)
				WriteInt(s,buttonpanel)
				WriteInt(s,gameplaybuttons)
				WriteInt(s,menubuttons)
				WriteFloat(s,menugameopacity)
				WriteInt(s,mouseovercard)
				WriteInt(s,mouseoverpile)
				WriteInt(s,greenboard)
				WriteInt(s,fullscreen)
				WriteInt(s,systemaccellerate)
				WriteInt(s,fastvideomode)
				WriteInt(s,videosynchronisation)
				
				'WriteInt(s,hintgivensystemaccellerate)
				'WriteInt(s,hintgivenfastvideomode)
				
				WriteInt(s,cardanimation)
				WriteInt(s,pointandclick)
				WriteInt(s,pointandclickalternative)
				WriteInt(s,autostart)
				WriteInt(s,autoturncard)
				WriteInt(s,autodiscard)
				WriteInt(s,autofoundation)
				WriteInt(s,autoempty)
				WriteInt(s,clickplayright)
				WriteInt(s,clickplaydouble)
				WriteInt(s,confirmonquit)
				WriteFloat(s,difficulty)
				WriteFloat(s,autospeed)
				WriteFloat(s,tippspeed)
				WriteFloat(s,volumeambience)
				WriteFloat(s,volumesound)
				WriteFloat(s,volumemusic)
				'WriteInt(s,chimesound)
				WriteInt(s,musicsequence)
				WriteFloat(s,systemperformance)
				WriteLine(s,lastuser)

				WriteInt(s,showedoptionscard)
				WriteInt(s,showedmenugametype)
				WriteInt(s,usedskipanimation)
				Local ac=activitylist.count()
				WriteInt(s,ac)
				For Local ait:_activity=EachIn activitylist
				 ait.save(s) 
				Next
				
				WriteFloat(s,cardlighting)
				farbekerze.save(s)
				farbeambienz.save(s)
				If watchdogspeed watchdogspeed.save(s)
				CloseStream(s)				
				EndMethod	
	
	Method newgame:_game(cur_game)				
				Local g:_game=Null
				If cur_game<0 Or cur_game>=gametypecount cur_game=3
				If cur_game=0
				 g=New _gameklondikeone
				ElseIf cur_game=1
				 g=New _gameklondikethree
				ElseIf cur_game=2 
				 g=New _gamespideronesuit
				ElseIf cur_game=3 
				 g=New _gamespidertwosuit
				ElseIf cur_game=4
				 g=New _gamespiderfoursuit
				ElseIf cur_game=5
				 g=New _gameeightoff
				ElseIf cur_game=6
				 g=New _gamefreecell
				ElseIf cur_game=7
				 g=New _gameforecell
				ElseIf cur_game=8
				 g=New _gameaustralian
				ElseIf cur_game=9
				 g=New _gamebethoral
				ElseIf cur_game=10
				 g=New _gameblindalleys
				ElseIf cur_game=11
				 g=New _gameblanket
				ElseIf cur_game=12
				 g=New _gamecancan
				ElseIf cur_game=13
				 g=New _gamecruel
				ElseIf cur_game=14
				 g=New _gamepyramid
				ElseIf cur_game=15
				 g=New _gamegolf
				ElseIf cur_game=16
				 g=New _gameyukon
				ElseIf cur_game=17
				 g=New _gamefourcolor
				ElseIf cur_game=18
				 g=New _gamescorpion
				ElseIf cur_game=19
				 g=New _gameklondikeonetwodeck
				ElseIf cur_game=20
				 g=New _gameklondikethreetwodeck
				ElseIf cur_game=21
				 g=New _gamerussian
				ElseIf cur_game=22
				 g=New _gameseatowers
				ElseIf cur_game=23
				 g=New _gamelimitedcovered
				ElseIf cur_game=24
				 g=New _gameladypalk
				ElseIf cur_game=25
				 g=New _gamelabyrinth
				ElseIf cur_game=26
				 g=New _gamelabyrintheasier
				ElseIf cur_game=27
				 g=New _gamelabyrinthrodenbach
				ElseIf cur_game=28
				 g=New _gamelabyrinthdouble
				ElseIf cur_game=29
				 g=New _gameosmosis
				ElseIf cur_game=30
				 g=New _gamegolfeasy
				ElseIf cur_game=31
				 g=New _gamekingspeak
				ElseIf cur_game=32
				 g=New _gamefortythieves
				ElseIf cur_game=33
				 g=New _gamelabellelucie
				ElseIf cur_game=34
				 g=New _gamelafacilelucie
				ElseIf cur_game=35
				 g=New _gamerussianeasy
				ElseIf cur_game=36
				 g=New _gamerussianfree
				ElseIf cur_game=37
				 g=New _gameacesup
				ElseIf cur_game=38
				 g=New _gameacme
				ElseIf cur_game=39
				 g=New _gameacesupeasy
				ElseIf cur_game=40
				 g=New _gameant
				ElseIf cur_game=41
				 g=New _gameauntmary
				ElseIf cur_game=42
				 g=New _gameauntfreemary
				ElseIf cur_game=43
				 g=New _gamebakersdozen
				ElseIf cur_game=44
				 g=New _gamebakersgame
				ElseIf cur_game=45
				 g=New _gameflowergarden
				ElseIf cur_game=46
				 g=New _gamegargantua
				ElseIf cur_game=47
				 g=New _gamegiant
				ElseIf cur_game=48
				 g=New _gameindian
				ElseIf cur_game=49
				 g=New _gamemissmilligan
				ElseIf cur_game=50
				 g=New _gameklondikecontra
				ElseIf cur_game=51
				 g=New _gamecontraflow
				ElseIf cur_game=52
				 g=New _gamefreecelldouble
				ElseIf cur_game=53
				 g=New _gamesinglerail
				ElseIf cur_game=54
				 g=New _gamesolidsquare
				ElseIf cur_game=55
				 g=New _gamespiderette
				ElseIf cur_game=56
				 g=New _gamestonewall
				ElseIf cur_game=57
				 g=New _gamespiderlinge
				ElseIf cur_game=58
				 g=New _gamemaze
				ElseIf cur_game=59
				 g=New _gamemartha
				ElseIf cur_game=60
				 g=New _gamelimited
				ElseIf cur_game=61
				 g=New _gamenapoleonssquare
				ElseIf cur_game=62
				 g=New _gamepyramiddouble
				ElseIf cur_game=63
				 g=New _gamefreewall
				ElseIf cur_game=64
				 g=New _gamecarrenapoleon
				ElseIf cur_game=65
				 g=New _gamemazeeasy
				ElseIf cur_game=66
				 g=New _gamemazetwosuit
				ElseIf cur_game=67
				 g=New _gamemazeeasytwosuit
				ElseIf cur_game=68
				 g=New _gameblankettwosuit
				ElseIf cur_game=69
				 g=New _gamepairscross
				ElseIf cur_game=70
				 g=New _gamestonewalleasy
				ElseIf cur_game=71
				 g=New _gamefortythievesdoublestock
				ElseIf cur_game=72
				 g=New _gamefortythievesredeal
				ElseIf cur_game=73
				 g=New _gamepyramidreserve
				ElseIf cur_game=74
				 g=New _gamespidersuperstock
				ElseIf cur_game=75
				 g=New _gamesweetmatch
				ElseIf cur_game=76
				 g=New _gameveryeasy
				EndIf
				Return(g)
				EndMethod
	Method gametypechancemin#(i)
				Local c#=Float(gametypechance[i*2])/Float(gametypechance[i*2]+gametypechance[i*2+1])
				Return(c)
				EndMethod				
	Method timemstohhmmss$(mso#)
				Local ms#=mso'+1000*60*59
	
				Local e$
				Local s=ms/1000
				Local m=s/60
				Local h=m/60
				m=m Mod 60
				Local t
				Local vs,vm,vh
				
				
				t=s
			    t:-h*60*60
				t:-m*60
				vs=t
				Local strs$=vs
				
				
				t=s
				t:-h*60*60
				t:-vs
				vm=t/60
				Local strm$=vm
				
				
				t=s
				t:-vs
				t:-vm
				vh=t/3600
				Local strh$=vh
				
				
				If strh.length=1 strh="0"+strh
				If strm.length=1 strm="0"+strm
				If strs.length=1 strs="0"+strs
				If strh="00"
				 e=strm$+":"+strs$
				Else
				 e=strh$+":"+strm$+":"+strs$
				EndIf
				Return(e)
				EndMethod					
	Method textsplit:TList(t$,wx#,f:timagefont)
				Local h$,o$
				Local l:TList=CreateList()
				gra.enabletext2d()
				SetImageFont(f)
				Local sep$[]=New String[1]
				sep[0]=" "
				Local ar$[]=t.split(sep[0])
				Local i
				i=0
				
				
				
				While i<ar.length
				 Print ar[i]
				 h=""
				 While TextWidth(h)<wx And i<ar.length
				  o=h
				  h:+ar[i]+" "
				  i:+1
				 Wend
				 If TextWidth(h)>=wx
				  h=o
				  i:-1
				 EndIf
				 If h<>"" And h<>" " l.addlast(h)
				Wend
				
				
				Return(l)
				EndMethod
	Method messagestatusbar(t$,o#=1,dt#=2000)
				Local exist=False
				For Local sit:_statusbarentry=EachIn statusbarlist
				 If (sit.text=t)
				  exist=True;
				  If(sit.pfadein=False)And(sit.pfadeout=False)'wartet zeitstart erneuern
				   sit.time=clock.ms()
				  ElseIf (sit.pfadein=False)And(sit.pfadeout=True)' wieder einblenden 
 				   sit.fadein();
				  EndIf
				 Else
				  sit.fadeout()
				 EndIf
				Next	
				If (exist=False)
				 Local s:_statusbarentry=New _statusbarentry
				 s.init(Self,t,o,dt);
				EndIf
				EndMethod		
	Method messagepileinfo(n$,d0$,d1$,o#=1,dt#=100)
				Local exist=False
				For Local pit:_pileinfoentry=EachIn pileinfolist
				 If ((pit.name=n)And(pit.desc0=d0)And(pit.desc1=d1))
				  exist=True;
				  If(pit.pfadein=False)And(pit.pfadeout=False)'wartet zeitstart erneuern
				   pit.time=clock.ms()
				  ElseIf (pit.pfadein=False)And(pit.pfadeout=True)' wieder einblenden 
 				   pit.fadein();
				  EndIf
				 Else
				  pit.fadeout()
				 EndIf
				Next	
				If (exist=False)
				 Local p:_pileinfoentry=New _pileinfoentry
				 p.init(Self,n,d0,d1,o,dt);
				EndIf
				EndMethod	
						
'*****************************************************************************************************************
'									    M E S S A G E B O X
'*****************************************************************************************************************
    Method messagebox:Int(t$,tbutton$,ox#,oy#,f:timagefont,iwindow:timage)


				guisystem.saveactivitylist()
				guisystem.setactivitylist(False)
				
				Local tr#=messageboxtextcolor.x
				Local tg#=messageboxtextcolor.y
				Local tb#=messageboxtextcolor.z
				gra.enabletext2d()
				SetImageFont(f)
				FlushKeys()
				FlushMouse()
				Local w0:_guiwindow
				Local px#=ox
				Local py#=oy
				Local wy#=200
				Local wx#=TextWidth(t$)+messageboxadditiontextwidth
				Local maxwx=400

				If wx<100 wx=100
				If wx>maxwx wx=maxwx
				Local lt:TList=textsplit(t,wx-messageboxadditiontextwidth,f)
				px:-wx/2
				py:-wy/2
				wy=180+lt.count()*20
				w0=New _guiwindow
				w0.init(guisystem,px,py,wx,wy,150,150,150)
				w0.position.setz(-10)
				windowinitmagic(w0,iwindow)
				w0.setshadow(25,25)
				Local yit#=messageboxadditiontexty
				For Local tit:String=EachIn lt
				 Local t0:_guitext
				 t0=New _guitext
				 t0.init(w0,wx/2-TextWidth(tit)/2,yit,messageboxtextz,tit,tr,tg,tb,f)
				 yit:+25
				Next
				Local k0:_guibutton
				k0=New _guibutton
				k0.init(w0,wx/2-messageboxbuttonwidth/2,wy-60+messageboxadditionbuttony-10,messageboxbuttonwidth,messageboxbuttonheight,tbutton,0)
				buttoninitmagic(k0)
				w0.visibility(False)
				w0.activity(False)
				w0.fadeopacity(0)
				w0.fadein()
				w0.fadetarget(menuopacity)		
				Local ap
				If game 
				 ap=game.allowpick
				 game.allowpick=False
				EndIf
				Local q=False
				Repeat
				 Local cc=GetChar()
				 guisystem.nullstates()
				 If animatestandard(cc) q=True
				 guisystem.animatehelpfadeoutglobal()
				 'clearlinklist()
				 drawstandard()
				Until guisystem.button Or KeyHit(KEY_ESCAPE) Or KeyHit(KEY_RETURN) Or MouseHit(MOUSE_LEFT) Or MouseHit(MOUSE_RIGHT) Or q
				guisystem.button=Null
				FlushKeys()
				FlushMouse()
				w0.fadeout(False,False,True)
				'Repeat
				' guisystem.nullstates()
				' Local cc=GetChar()
				' animatestandard(cc)
				' clearlinklist()
				' drawstandard()
				'Until w0.visible=False
				'w0.clear()
				'clearlinklist()
				If game game.allowpick=ap
				guisystem.restoreactivitylist()
				Return(0)
				EndMethod									
'*****************************************************************************************************************
'									    A B F R A G E
'*****************************************************************************************************************
	Method abfrage:Int(t$,tbutton$,tbutton2$,ox#,oy#,f:timagefont,iwindow:timage)
				guisystem.saveactivitylist()
				guisystem.setactivitylist(False)

				gra.enabletext2d()
				Local tr#=messageboxtextcolor.x
				Local tg#=messageboxtextcolor.y
				Local tb#=messageboxtextcolor.z
				
				SetImageFont(f)
				FlushKeys()
				Local w0:_guiwindow
				Local px#=ox
				Local py#=oy
				Local wy#=200
				
				
				
				Local wx#=500'TextWidth(t$)+messageboxadditiontextwidth
				'Local maxwx=400

				'If wx<100 wx=100
				'If wx>maxwx wx=maxwx
				Local lt:TList=textsplit(t,wx-messageboxadditiontextwidth,f)

				wy=180+lt.count()*20
				px:-wx/2
				py:-wy/2				
				w0=New _guiwindow
				w0.init(guisystem,px,py,wx,wy,1,1,1)
				w0.position.setz(-10)
				windowinitmagic(w0,iwindow)
				w0.setshadow(25,25)
				Local yit#=messageboxadditiontexty
				For Local tit:String=EachIn lt
				 Local t0:_guitext
				 t0=New _guitext
				 t0.init(w0,wx/2-TextWidth(tit)/2,yit,messageboxtextz,tit,tr,tg,tb,f)
				 yit:+25
				Next
				
				
				
				
				'‰Local wx#=TextWidth(t$)+messageboxadditiontextwidth
				Local bw0#=messageboxbuttonwidth
				Local bw1#=messageboxbuttonwidth				
				'If wx<180 wx=180
				'px:-wx/2
				'py:-wy/2
				'Print wx
				'w0=New _guiwindow
				'w0.init(guisystem,px,py,wx,wy,150,150,150)
				'w0.position.setz(-10)
				
				'windowinitmagic(w0,iwindow)
				'w0.setshadow(25,25)

				'Local t0:_guitext
				't0=New _guitext
				't0.init(w0,messageboxadditiontextwidth/2,messageboxadditiontexty,messageboxtextz,t,tr,tg,tb,f)

				Local k0:_guibutton
				k0=New _guibutton
				k0.init(w0,wx/2-10-bw0,wy-60+messageboxadditionbuttony-20,bw0,messageboxbuttonheight,tbutton,0)
				buttoninitmagic(k0)
				k0.font=f
				
				Local k1:_guibutton
				k1=New _guibutton
				k1.init(w0,wx/2+10,wy-60+messageboxadditionbuttony-20,bw1,messageboxbuttonheight,tbutton2,0)
				buttoninitmagic(k1)
				k1.font=f

				w0.visibility(False)
				w0.activity(False)
				w0.fadeopacity(0)
				w0.fadein()
				w0.fadetarget(menuopacity)	
				Local ap=True
				If(game)
				 ap=game.allowpick
				 game.allowpick=False
				EndIf
				Local q=False
				Repeat
				 guisystem.nullstates()
				 Local cc=GetChar()
				 If animatestandard(cc) q=True
				 guisystem.animatehelpfadeoutglobal()
				
				 'clearlinklist()
				 drawstandard()
				Until guisystem.button Or KeyHit(KEY_ESCAPE) Or q
				FlushKeys()
				w0.fadeout(False,False,True)
				Local r
				If guisystem.button=k0 r=True Else r=False
				'Repeat
				' guisystem.nullstates()
				' Local cc=GetChar()
				' animatestandard(cc)
				' clearlinklist()
				' drawstandard()
				'Until w0.visible=False				
				'w0.clear()
				'clearlinklist()
				If(game) game.allowpick=ap
				guisystem.button=Null
				guisystem.restoreactivitylist()
				Return(r)
				EndMethod
'*****************************************************************************************************************
'									    A B F R A G E 2 Z
'*****************************************************************************************************************
	Method abfrage2z:Int(t$,t2$,tbutton$,tbutton2$,ox#,oy#,f:timagefont,iwindow:timage)
				guisystem.saveactivitylist()
				guisystem.setactivitylist(False)
				Local tr#=messageboxtextcolor.x
				Local tg#=messageboxtextcolor.y
				Local tb#=messageboxtextcolor.z
				
				FlushKeys()
				SetImageFont(f)
				Local w0:_guiwindow
				Local px#=ox
				Local py#=oy
				Local wy#=200
				Local wx#=TextWidth(t$)+messageboxadditiontextwidth'+TextWidth(tbutton2)
				Local wt#=TextWidth(t2$)+messageboxadditiontextwidth'+TextWidth(tbutton2)
				Local bw0#=messageboxbuttonwidth
				Local bw1#=messageboxbuttonwidth
				If wt>wx wx=wt
				If wx<180 wx=180
				px:-wx/2
				py:-wy/2
				w0=New _guiwindow
				w0.init(guisystem,px,py,wx,wy,150,150,150)
				windowinitmagic(w0,iwindow)
				w0.setshadow(25,25)
				w0.position.setz(-10)
				
				Local t0:_guitext
				t0=New _guitext
				t0.init(w0,messageboxadditiontextwidth/2,messageboxadditiontexty,messageboxtextz,t,tr,tg,tb,f)
				Local t1:_guitext
				t1=New _guitext
				t1.init(w0,messageboxadditiontextwidth/2,messageboxadditiontexty+TextHeight(t),messageboxtextz,t2,tr,tg,tb,f)
				Local k0:_guibutton
				k0=New _guibutton
				k0.init(w0,wx/2-10-bw0,wy-60+messageboxadditionbuttony-20,bw0,messageboxbuttonheight,tbutton,0)
				buttoninitmagic(k0)
				k0.font=f
				Local k1:_guibutton
				k1=New _guibutton
				k1.init(w0,wx/2+10,wy-60+messageboxadditionbuttony-20,bw1,messageboxbuttonheight,tbutton2,0)
				buttoninitmagic(k1)
				k1.font=f
				w0.visibility(False)
				w0.activity(False)
				w0.fadeopacity(0)
				w0.fadein()
				w0.fadetarget(menuopacity)	
				Local ap=True
				If(game)
				 ap=game.allowpick
				 game.allowpick=False
				EndIf
				Local q=False
				Repeat
				 guisystem.nullstates()
				 If animatestandard(GetChar()) q=True
				 guisystem.animatehelpfadeoutglobal()
				
				 'clearlinklist()
				 drawstandard()
				Until guisystem.button Or KeyHit(KEY_ESCAPE) Or q
				FlushKeys()
				w0.fadeout(False,False,True)
				Local r
				If guisystem.button=k0 r=True Else r=False
				'Repeat
				' guisystem.nullstates()
				' animatestandard(GetChar())
				' clearlinklist()
				' drawstandard()
				'Until w0.visible=False
				'w0.clear()
				'clearlinklist()
				If(game) game.allowpick=ap
				guisystem.button=Null
				guisystem.restoreactivitylist()
				Return(r)
				EndMethod				
	Method abfragegametype:Int(f:timagefont,iwindow:timage)
			    Local hhh$
			    If currentgame=current_preview
			     hhh=strgametyperestart1+gamenames[currentgame]+strgametyperestart2
			     If abfrage2z(strgametyperestart0,hhh,stryes,strno,gra.screenw/2,gra.screenh/2,f,iwindow)=False
			      Return(False)
			     EndIf		
				Else
			     hhh=strgametypeset+" "+gamenames[currentgame]+" "+strto+" "+gamenames[current_preview];
			     If abfrage2z(strchangegametype,hhh,stryes,strno,gra.screenw/2,gra.screenh/2,f,iwindow)=False
			      Return(False)
			     EndIf		
			    EndIf
				Return(True);		
				EndMethod	
	'-------------------------------------------------------- ANIMATION --------------------------------------------------------------------				
								
	Method animateapplication:Int(quit=False,gi=0)
				If menugame.active()=False
				 Local nt#=clock.ms()
				 Local dt#=nt-gamedelaytime
				 If game 
				  If game.inuse game.starttime:+dt
				 EndIf
				 gamedelaytime=nt
				EndIf
				
				If iszoomed(hwnd)
				 cbfs.checked=True
				 fullscreen=cbfs.checked
				 graphics_setup(gi)
				EndIf
				
				If AppTerminate()
				 Return(True)
				EndIf
				If AppSuspended()
				 volumesoundfadein=0;
				 If paused=False
				  paused=True
				  starttimepause=clock.ms()
				  musicman.fadedown()
				 EndIf
				 If musicman.channelmenu.playing()=False And Abs(pauseopacity-0.5)<nearzero
				  'suspend with delay
				  Delay(700)
				 EndIf
				Else
				 If paused=True
				  paused=False
				  If game
				   If game.inuse 
				    game.starttime:+(clock.ms()-starttimepause)
				   EndIf
				  EndIf
				  
				  If menumain.active() musicman.fadeupmenu() Else musicman.fadeupmenu()
				 EndIf
				EndIf
				Return(0)
				EndMethod				
	Method updateopacitygamepreview(o#)
				If gamepreview
				 gamepreview.opacity(o);
				EndIf
				EndMethod	
	Method initgame(mode,showhighscore=True)
				'Local g:_game=Null
				'If preview=False
				 If game game.clear(showhighscore)
				 game=newgame(currentgame)				
				'Else
				' If gamepreview gamepreview.deinit(False)
				' gamepreview=Null
				'EndIf
				
				'If preview=False
				 game.init(Self,mode)
				 game.createshadow()
				 'If menugame.active()=False
				 ' movecamera(game.camerapositionmenu[mode])
				 'EndIf
				'Else
				' gamepreview=g
				' gamepreview.preview=True
				' gamepreview.init(Self,2)
				' gamepreview.allowpick=False
				' gamepreview.skipanimation()
				' If gamepreview gamepreview.createshadow()
				' gamepreview.updateplane()
				'EndIf
				updatemenumain()
				'updatescene()
				'FlushKeys()
				EndMethod		
				
	Method initgamepreview(mode,number)				
				If gamepreview gamepreview.clear(False)
				gamepreview=newgame(number)
				gamepreview.preview=True
				
				gamepreview.init(Self,mode)
				gamepreview.allowpick=False
				gamepreview.skipanimation()
				gamepreview.createshadow()
				gamepreview.updateplane()
					
				EndMethod				
	Method initgamemenu(mode,number)				
				If gamemenu gamemenu.clear(False)
				gamemenu=newgame(number)
				gamemenu.menu=True
				
				gamemenu.init(Self,mode)
				gamemenu.allowpick=False
				'gamepreview.skipanimation()
				gamemenu.createshadow()
				gamemenu.updateplane()
					
				EndMethod				


	Method animatestandard:Int(keypress)Abstract				
	Method animategame(keypress)Abstract

	Method animatemusic()Abstract
	Method drawstandard()Abstract
	Method drawloadscreen(swap=True,op#=1)Abstract
	Method drawpause()
				If pauseopacity>0
				 gra.enabletext2d()
				 SetColor(0,0,0)
				 SetAlpha(pauseopacity)
				 SetBlend(ALPHABLEND)
				 DrawRect(0,0,gra.screenw,gra.screenh)
				 SetImageFont(font30)
				 Local o:_vector3=New _vector3
				 Local c:_vector4=New _Vector4
				 Local h$
				 h=strpause
				 o.set(gra.screenw/2-TextWidth(h)/2,gra.screenh/2-TextHeight(h)-100/2,2)
				 c.set(1,0.3,0.2,pauseopacity*2)
				 Drawguitext(h,o,c)
				EndIf
				If paused
				 If pauseopacity<0.5 pauseopacity:+0.01
				 If pauseopacity>0.5 pauseopacity=0.5
				Else
				 If pauseopacity>0 pauseopacity:-0.01
				 If pauseopacity<0 pauseopacity=0
				EndIf
				EndMethod	
	Method drawblendscreen()
				If blendscreen
				 gra.enabletext2d()
				 gra.blendmultiplicative()
				 gra.wrap(True)
				 SetBlend(SOLIDBLEND|ALPHABLEND)
				 SetColor(255,255,255)
				 'Print "blendscreop="+blendscreenopacity
				 SetAlpha(blendscreenopacity)
				 DrawImageRect(blendscreen,0,0,gra.screenw,gra.screenh)
				 If blendscreenopacity>0 blendscreenopacity:-0.01
				 If blendscreenopacity<0 
				  blendscreenopacity=0
				  blendscreen=Null
				 EndIf
				EndIf
				EndMethod							
	Method drawgamepreviewshadowcurving(curving)				
				gra.wrap(True)
				gra.blendmultiplicative()
				If gamepreview
				 If curving=False'-------------------------------------------------------- pileschatten zeichnen
				  For Local pit:_pile=EachIn gamepreview.pilelist
				   pit.drawshadow(gra,cam)
				  Next
				 EndIf
				 For Local pit:_pile=EachIn gamepreview.pilelist'------------------------- Kartenschatten in Piles ohne selbstzeichnung zeichnen
				  For Local cit:_card=EachIn pit.cardlist
				   Local machen=False
				   If curving
				    If cit.curving=True Or cit.picked=True machen=True
				   Else
				    If cit.curving=False And cit.picked=False And pit.drawownshadow=False machen=True
				   EndIf
				   If machen
				    If cit.shadowarraycount>0
				     For Local i=0 To cit.shadowarraycount-1'sit:_shadow=EachIn cit.shadowlist
				      Local sit:_shadowsingle=cit.shadowarray[i]
				      sit.calculateopacity(cit.opacityquant)
				      sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.35)
				      sit.draw(gra,cam)
				     Next
				    EndIf
				   EndIf
				  Next
				 Next
				EndIf
				EndMethod					
	Method drawgamepreview(pox#,poy#)
				If gamepreview
				 
				 transformcamerapreview(pox,poy)
				 gra.wrap(True)
				
				
				
				
				Rem
				 Local o0:_vector3=New _vector3
				 Local o1:_vector3=New _vector3
				 Local co:_vector4=New _vector4

				 co.set(0,1,1,1)
				 o0.set(gamepreviewrectangle[0].x,gamepreviewrectangle[0].y,0)
				 o1.set(gamepreviewrectangle[1].x,gamepreviewrectangle[0].y,0)
				 gra.line(o0,o1,co)
				 o0.set(gamepreviewrectangle[1].x,gamepreviewrectangle[0].y,0)
				 o1.set(gamepreviewrectangle[1].x,gamepreviewrectangle[1].y,0)
				 gra.line(o0,o1,co)
				 o0.set(gamepreviewrectangle[1].x,gamepreviewrectangle[1].y,0)
				 o1.set(gamepreviewrectangle[0].x,gamepreviewrectangle[1].y,0)
				 gra.line(o0,o1,co)
				 o0.set(gamepreviewrectangle[0].x,gamepreviewrectangle[1].y,0)
				 o1.set(gamepreviewrectangle[0].x,gamepreviewrectangle[0].y,0)
				 gra.line(o0,o1,co)				
				EndRem
				
				
				
				
				 'Print "gp"
				
				
				
				
				 gamepreview.drawpile(gra,cam)
				 gamepreview.drawlist.sort()
				 'If systemaccellerate=False drawgamepreviewshadowcurving(False)
				 gamepreview.drawpilecard(gra,cam)
				 'If systemaccellerate=False drawgamepreviewshadowcurving(True)
				 gamepreview.drawcard(gra,cam)
				 gamepreview.drawcurving(gra,cam)		
				 gamepreview.drawshow(gra,campreview)		
				
				
				 Rem			
				 'gra.wrap(True)
				 'gra.blend(False)
				 'Local zz#=6'-campreview.position.z
				 'Local maxx#=zz/2
				 'Local maxy#=zz/2
				 'maxx:-10
				 'maxy:-10
				 'SetViewport(-maxx+campreview.position.x,-maxy+campreview.position.y,maxx*2,maxy*2)
				 gamepreview.drawpile(gra,campreview)
				 gamepreview.draw(gra,campreview)
				 gamepreview.drawshow(gra,campreview)
				 'SetViewport(0,0,gra.screenw,gra.screenh)
				 EndRem
				EndIf
				gra.blend(False)
				EndMethod	
	Method drawgamemenu(op#)
				If gamemenu
				 
				 transformcameramenu()
				 gra.wrap(True)
				 gamemenu.opacity(op);
				 gamemenu.drawpile(gra,cammenu)
				 gamemenu.drawlist.sort()
				 'If systemaccellerate=False drawgamepreviewshadowcurving(False)
				 gamemenu.drawpilecard(gra,cammenu)
				 'If systemaccellerate=False drawgamepreviewshadowcurving(True)
				 gamemenu.drawcard(gra,cammenu)
				 gamemenu.drawcurving(gra,cammenu)		
				 gamemenu.drawshow(gra,cammenu)		
				EndIf
				gra.blend(False)
				EndMethod				
				Rem			
	Method drawgameshadow()				
				world.transform(gra,cam)
				gra.wrap(True)
				gra.blendmultiplicative()
				If game
				 For Local pit:_pile=EachIn game.pilelist
				  For Local cit:_card=EachIn pit.cardlist
				   If cit.picked=False
				    For Local sit:_shadow=EachIn cit.shadowlist
				     sit.calculateopacity()
				     If gra.screen_bpp=16
				      sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.35)
				     Else
				      sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.35)
				 	 EndIf
				     sit.draw(gra,cam)
				    Next
				   Else
				    For Local sit:_shadow=EachIn cit.shadowlist
				     sit.mesh.vertexalpha(cit.opacity*0.7*0.35)
				     sit.draw(gra,cam)
				    Next
				   EndIf
				  Next
				 Next
				 For Local cit:_card=EachIn game.cardlist
				  For Local sit:_shadow=EachIn cit.shadowlist
				   sit.calculateopacity()
				   If gra.screen_bpp=16
				    sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.35)
				   Else
				    sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.35)
				   EndIf
				   sit.draw(gra,cam)
				  Next
				 Next
				EndIf
				EndMethod	
				EndRem
	Method drawgameshadowcurving(curving,oppile#=0.5,opglobal#=0.35)				
				'world.transform(gra,cam)
				'gra.wrap(True)
				'gra.blendmultiplicative()
				Local ii=0
				If game
				 'If curving=False'------------------------------------------------- pileschatten zeichnen
				 ' For Local pit:_pile=EachIn game.pilelist
				 ''  pit.drawshadow(gra,cam)
				 ' Next
				 'EndIf
				 Local sit:_shadowsingle
				 For Local pit:_pile=EachIn game.pilelist'------------------------- Kartenschatten in Piles ohne selbstzeichnung zeichnen
				  For Local cit:_card=EachIn pit.cardlist
				   
				   Local machen=False
				   If curving
				    If cit.curving=True Or cit.picked=True machen=True
				    'If cit.poly.flag=1 machen=True
				   Else
				    If cit.curving=False And cit.picked=False machen=True
				    'If cit.poly.flag=0 machen=True
				   EndIf
				   If machen 				     
				    If cit.shadowarraycount>0
				     For Local i=0 To cit.shadowarraycount-1'sit:_shadow=EachIn cit.shadowlist
				      sit=cit.shadowarray[i]
				    ' If mybenchmark=False 
				      If cit.picked=False
				       If (clock.ms()-cit.meshchangedlasttime)<500 
				        sit.calculateopacity(cit.opacityquant)
				      ' Local pf:_pilefoundation=_pilefoundation(pit)
				   	 	'If pf
				       '  Print "sms="+sit.opacity 
				 		'   sit.opacity=1
				  		' opglobal=1
				  		'EndIf
				  	'	 Print "cit.meshchangedlasttime="+cit.meshchangedlasttime
				       EndIf
				        ii:+1
				        sit.mesh.vertexalpha(cit.opacity*sit.opacity*opglobal)
				 	   	
				      Else
				       sit.opacity=0.7
				       sit.mesh.vertexalpha(cit.opacity*sit.opacity*opglobal)
			 	      EndIf
					' EndIf
			         
				      sit.draw(gra,cam)
				     Next
				    EndIf
				   EndIf
				  
				  Next
				 Next
				
				
				 For Local cit:_card=EachIn game.cardlist'--------------------------- globale Karten schatten zeichnen
				  Local machen=False
				  If curving
				   If cit.curving=True And cit.picked=False machen=True
				  Else
				   If cit.curving=False And cit.picked=False machen=True
				  EndIf
				  If machen
				   If cit.shadowarraycount>0
				    For Local i=0 To cit.shadowarraycount-1'sit:_shadow=EachIn cit.shadowlist
				     sit=cit.shadowarray[i]
				 	 sit.calculateopacity(cit.opacityquant)
				     sit.mesh.vertexalpha(cit.opacity*sit.opacity*opglobal)
				     sit.draw(gra,cam)
				    Next
				   EndIf
				  EndIf
				 Next
				 If curving
				  For Local cit:_card=EachIn game.blowlist'--------------------------- blowing Karten schatten zeichnen
				   If cit.shadowarraycount>0
				    For Local i=0 To cit.shadowarraycount-1'sit:_shadow=EachIn cit.shadowlist
				     sit=cit.shadowarray[i]
				 	 sit.calculateopacity(cit.opacityquant)
				     sit.mesh.vertexalpha(cit.opacity*sit.opacity*opglobal)
				    ' Print "ja"
				     sit.draw(gra,cam)
				    Next
				   EndIf
				  Next
				 EndIf
				
				


				EndIf
				'Print "curving card opacities ="+curving+"  "+ii
				EndMethod	
					Rem
	Method drawgameshadowpreview()		
				transformcamerapreview()
				gra.wrap(True)
				gra.blendmultiplicative()
				If gamepreview
				 For Local pit:_pile=EachIn gamepreview.pilelist
				  For Local cit:_card=EachIn pit.cardlist
				   For Local sit:_shadow=EachIn cit.shadowlist
				    sit.calculateopacity()
				    If gra.screen_bpp=16
				     sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.3)
				    Else
				     sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.2)
					EndIf
				    sit.draw(gra,cam)
				   Next
				  Next
				 Next
				 For Local cit:_card=EachIn gamepreview.cardlist
				  For Local sit:_shadow=EachIn cit.shadowlist
				   sit.calculateopacity()
				   If gra.screen_bpp=16
				    sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.3)
				   Else
				    sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.2)
				   EndIf
				   sit.draw(gra,cam)
				  Next
				 Next
				EndIf				
				
				
				'For Local sit:_shadow=EachIn shadowpreviewlist
				' sit.draw(gra,cam)
				'Next
				EndMethod

			EndRem				
			
			
			Rem	
	Method transformcamerapreview()	
				If gamepreview 
				 Local m#=gamepreview.vector[0].length()
				 If m<gamepreview.vector[1].length() m=gamepreview.vector[1].length()
				 'Print m
				 
				 campreview.position.copy(gamepreview.position)'camerapositionpreview[1])
				 campreview.position.z=gamepreview.camerapositionpreview[2].z'-(m*2)
				 If gra.screenw>1024 campreview.position.z:*(Float(gra.screenw)/Float(1024))
				
				
				 Local yg#=70'=yw/zw * sh
				 Local xg#=90'=yw/zw * sh
				 Local sw#=gra.screenw*0.5
				 Local sh#=gra.screenh*0.5
				 Local zw#=campreview.position.z
				 Local yw#=(yg/sh)*zw
				 Local xw#=(xg/sw)*zw
				
				 'campreview.position.y:-gamepreview.camerapositionpreview[1].z/2
				 campreview.position.y:-yw
				 campreview.position.y:+gamepreview.camerapositionpreview[2].y
				 campreview.position.x:+xw
				' campreview.position.x:*0.2
				 'campreview.position.y:*0.2
				EndIf
				world.transform(gra,campreview)
				EndMethod							
				EndRem
	Method transformcameramenu()	
				'If gamepreview 
				 cammenu.position.set(61,83,-56)
				
				' cammenu.position.roty(20)
				 'cammenu.view.copy(cammenu.position)
				 'cammenu.view.mul(-1)
				 'cammenu.view.norm()
				 'cammenu.view.mul(2)
				 cammenu.view.set(0,1.75,0)
				 cammenu.view.rotx(13)
				 cammenu.view.rotz(143)
				
				 
				
				 Local h:_vector3=New _vector3
				 h.set(0,0,-1)
				 cammenu.side.copy(h)
				 cammenu.side.crossproduct(cammenu.view)
				 cammenu.side.norm()
				 cammenu.side.mul(-1)
				 'cammenu.side.set(-0.707,0.707,0)

				 cammenu.up.copy(cammenu.side) 
				 cammenu.up.crossproduct(cammenu.view)
				 cammenu.up.norm()
				' cammenu.up.set(0,0,-1)
				' Print "-------------------------------------"
				' Print "cm view ="+cammenu.view.x+"  "+cammenu.view.y+"  "+cammenu.view.z
				 'Print "cm side ="+cammenu.side.x+"  "+cammenu.side.y+"  "+cammenu.side.z
				' Print "cm up   ="+cammenu.up.x+"  "+cammenu.up.y+"  "+cammenu.up.z
				 
				Rem
 				 If gra.screenw>1024 cammenu.position.z:*(Float(gra.screenw)/Float(1024))
				 Local yg#=70'=yw/zw * sh
				 Local xg#=90'=yw/zw * sh
				 Local sw#=gra.screenw*0.5
				 Local sh#=gra.screenh*0.5
				 Local zw#=cammenu.position.z
				 Local yw#=(yg/sh)*zw
				 Local xw#=(xg/sw)*zw				
				 cammenu.position.y:-yw
				 cammenu.position.x:+xw
				EndRem
				 world.transform(gra,cammenu)
				EndMethod					
	Method transformcamerapreview(pox#,poy#)	
				'If gamepreview 
				 campreview.position.x=0
				 campreview.position.y=0
				 campreview.position.z=-31
 				 If gra.screenw>1024 campreview.position.z:*(Float(gra.screenw)/Float(1024))
				 Local yg#=53+poy'=yw/zw * sh
				 Local xg#=90+pox'=yw/zw * sh
				 Local sw#=gra.screenw*0.5
				 Local sh#=gra.screenh*0.5
				 Local zw#=campreview.position.z
				 Local yw#=(yg/sh)*zw
				 Local xw#=(xg/sw)*zw				
				 campreview.position.y:-yw
				 campreview.position.x:+xw
				
				 world.transform(gra,campreview)
				EndMethod							
	Method transformgamepreview()
	  			If gamepreview
	  				
	 			 Local h:_vector3=New _vector3
				 h.copy(gamepreview.translationglobal)
				 h.mul(-1)
	 			 gamepreview.translate(h)
	 			 gamepreview.scale(1.0/gamepreview.scaleglobal)
				 

				 Local smx#=(gamepreviewrectangle[0].x+gamepreviewrectangle[1].x)*0.5
				 Local smy#=(gamepreviewrectangle[0].y+gamepreviewrectangle[1].y)*0.5
				 Local sdx#=Abs(gamepreviewrectangle[1].x-gamepreviewrectangle[0].x)
				 Local sdy#=Abs(gamepreviewrectangle[1].y-gamepreviewrectangle[0].y)
				
				 Local gmx#=(gamepreview.rectangle[1].x+gamepreview.rectangle[0].x)*0.5
				 Local gmy#=(gamepreview.rectangle[1].y+gamepreview.rectangle[0].y)*0.5
				 Local gdx#=Abs(gamepreview.rectangle[1].x-gamepreview.rectangle[0].x)
				 Local gdy#=Abs(gamepreview.rectangle[1].y-gamepreview.rectangle[0].y)
				 
				 Local ds:_vector3=New _vector3
				 ds.x=smx
				 ds.y=smy
				 ds.z=0
				
				 Local dn:_vector3=New _vector3
				 dn.set(-gmx,-gmy,0)				
				 gamepreview.translate(dn)
				
				 Local dx#=gdx/sdx
				 Local dy#=gdy/sdy
				 Local f# 
				
				 If dx>dy
				  f=sdx/gdx
				  'Print "preview dx="+dx
				  'Print "preview sdx="+sdx
				  'Print "preview gdx="+gdx
				  'Print "gamepreview.rectangle[1].x="+gamepreview.rectangle[1].x+"   gamepreview.rectangle[0].x="+gamepreview.rectangle[0].x
				 Else
				  'Print "preview dy"
				  f=sdy/gdy
				 EndIf
				 'Print "preview f="+f
				 gamepreview.scale(f)
				 gamepreview.translate(ds)
				
				EndIf
				EndMethod

	Method transformgamemenu()
	  			If gamemenu
	  				
	 			 Local h:_vector3=New _vector3
				 h.copy(gamemenu.translationglobal)
				 h.mul(-1)
	 			 gamemenu.translate(h)
	 			 gamemenu.scale(1.0/gamemenu.scaleglobal)
				 

				 Local smx#=(gamemenurectangle[0].x+gamemenurectangle[1].x)*0.5
				 Local smy#=(gamemenurectangle[0].y+gamemenurectangle[1].y)*0.5
				 Local sdx#=Abs(gamemenurectangle[1].x-gamemenurectangle[0].x)
				 Local sdy#=Abs(gamemenurectangle[1].y-gamemenurectangle[0].y)
				
				 Local gmx#=(gamemenu.rectangle[1].x+gamemenu.rectangle[0].x)*0.5
				 Local gmy#=(gamemenu.rectangle[1].y+gamemenu.rectangle[0].y)*0.5
				 Local gdx#=Abs(gamemenu.rectangle[1].x-gamemenu.rectangle[0].x)
				 Local gdy#=Abs(gamemenu.rectangle[1].y-gamemenu.rectangle[0].y)
				 
				 Local ds:_vector3=New _vector3
				 ds.x=smx
				 ds.y=smy
				 ds.z=0
				
				 Local dn:_vector3=New _vector3
				 dn.set(-gmx,-gmy,0)				
				 gamemenu.translate(dn)
				
				 Local dx#=gdx/sdx
				 Local dy#=gdy/sdy
				 Local f# 
				
				 If dx>dy
				  f=sdx/gdx
				  'Print "menu dx="+dx
				  'Print "menu sdx="+sdx
				  'Print "menu gdx="+gdx
				  'Print "gamemenu.rectangle[1].x="+gamemenu.rectangle[1].x+"   gamepreview.rectangle[0].x="+gamemenu.rectangle[0].x
				 Else
				  'Print "preview dy"
				  f=sdy/gdy
				 EndIf
				 'Print "preview f="+f
				 gamemenu.scale(f)
				 gamemenu.translate(ds)
				
				EndIf
				EndMethod
				

				
	'------------------------------------------------ old effects -------------------------------------------------------------				
	Method createcandle:_candle(l:TList,x#,y#,z#,i#,sc#,sp#,pl:TList)
				Local c0:_candle=New _candle
				Local im=False
				If l=candlemenulist im=True
				c0.initcandle(Self,x,y,z,i,sc,sp,pl,im)
				If im 
				 c0.deinsert()
				EndIf
				l.addlast(c0)
				Return(c0)
				EndMethod
	Method createpage:_page(tf:_texture,tb:_texture,tex:_texture,text$)
				Local c0:_page=New _page
				c0.Create(Self,tf,tb,tex,15,20)
				c0.link=pagelist.addlast(c0)
				Return(c0)
				EndMethod	
	Method copypagevertexcolor()
				For Local pit:_page=EachIn pagelist
				 pit.copyvertexcolor()
				Next
				EndMethod		
	
			
			
			
	Method buttoninitmagic(g:_guibutton,f:timagefont=Null,bs:timage=Null,bsh:timage=Null,bl:timage=Null,blh:timage=Null)Abstract
	Method windowinitmagic(w:_guiwindow,i:timage)Abstract		
	Method guihelpinitmagic(g:_gui)Abstract		
			
			
			
	Method updatemenumain()Abstract
	Method updatemenugame()Abstract
	Method updatelistboxgametypesorted(tl:_guilistbox,sel)
				Local el:TList=CreateList()
				Local sll:TList=CreateList()
				Local slls:String
				tl.clearchild()
				If gametypesortmethod=0'-------------------alphabetisch
				 For Local i=0 To gametypecount-1
				  If gametypeactive[i]
				   Local eit:_sortentry=New _sortentry
				   eit.name=gamenames[i]
				   'eit.criterium=0
				   'Local h#=100000;
				   'For Local l=0 To gamenames[i].length-1
				    '	eit.criterium:+Float(gamenames[i][l])*h
					'h:*0.1;
				   'Next
				   'Print eit.name+"   "+eit.criterium;
				   eit.byname=True
				   sll.addlast(eit)
				  EndIf
				 Next
				 sll.sort()
				ElseIf gametypesortmethod=1'----------------- bekanntheit
				 For Local i=0 To gametypecount-1
				  If gametypeactive[i]
				   Local eit:_sortentry=New _sortentry
				   Local h$
				   h=gamenames[i]
				   eit.name=h
				   eit.criterium=(1-gametypepublicity[i])
				   sll.addlast(eit)
				  EndIf
				 Next
				 sll.sort()
				ElseIf gametypesortmethod=2'----------------chance
				 For Local i=0 To gametypecount-1
				  If gametypeactive[i]
				   Local eit:_sortentry=New _sortentry
				   Local h$
				   h=gamenames[i]
				   eit.name=h
				   eit.criterium=(1-gametypechancemin(i))
				   sll.addlast(eit)
				  EndIf
				 Next
				 sll.sort()
				ElseIf gametypesortmethod=3'----------------skill
				 For Local i=0 To gametypecount-1
				  If gametypeactive[i]
				   Local eit:_sortentry=New _sortentry
				   Local h$
				   h=gamenames[i]
				   eit.name=h
				   eit.criterium=gametypeskill[i]
				   sll.addlast(eit)
				  EndIf
				 Next
				 sll.sort()
				ElseIf gametypesortmethod=4'----------------time
				 For Local i=0 To gametypecount-1
				  If gametypeactive[i]
				   Local eit:_sortentry=New _sortentry
				   Local h$
				   h=gamenames[i]
				   eit.name=h
				   eit.criterium=gametypetime[i]
				   sll.addlast(eit)
				  EndIf
				 Next
				 sll.sort()
				ElseIf gametypesortmethod=5'------------------ typgruppen
				
				
				 For Local i=0 To gametypecount-1
				  If gametypeactive[i]
				   Local eit:_sortentry=New _sortentry
				   Local h$
				   h=gamenames[i]
				   eit.name=h
				   eit.criterium=gametypegroup[i]
				   el.addlast(eit)
				  EndIf
				 Next
				 Local aci=-1
				 el.sort()
				 For Local eit:_sortentry=EachIn el
				  If Int(eit.criterium)<>aci
				   aci:+1
				
				   Local git:_sortentry=New _sortentry
				   git.color.set(0.2,0.7,0.1,1);
				   git.name=gametypegroupnames[aci]
				   git.selectable=False
				   sll.addlast(git)
				  EndIf
				  sll.addlast(eit)
				 Next				 
				
				 Local i=0;
				 Local j=0;
				 Local gso:_guishiftout=Null
				 Local gsoprev:_guishiftout=Null
				 For Local eit:_sortentry=EachIn  sll
				  If eit.selectable=False
				   gsoprev=gso
				   gso=New _guishiftout
				   gso.init(tl,5,5+i,tl.width()-50,45,eit.name,-1,1,1,1,font18)
				   gso.selectable=False
				   gso.positionmatch=gsoprev
				   buttoninitmagic(gso.button)
				   i:+40
				   j=0
				  Else
				   gso.window.inserttext(eit.name,5,5+j,1,eit.color.x,eit.color.y,eit.color.z,font18)
				   'Local gt:_guitext=tl.inserttext()
				   j:+30
				  EndIf
				 Next				

				 For Local gsoit:_guishiftout=EachIn tl.childlist
				  Local hatsel=False
				  For Local git:_guitext=EachIn gsoit.window.childlist 
				   If git.get()=gamenames[sel] 
				    hatsel=True
				    tl.selection=git
				   EndIf
				  Next
				  If hatsel gsoit.setshiftout(True) Else gsoit.setshiftout(False)
				 Next
				 tl.scrolltoselection()

				EndIf
				
				
				'-------------------------------------------------------------------------------------------------
				If gametypesortmethod<>5
				 Local i=0;
				 For Local eit:_sortentry=EachIn  sll
				 
				  If eit.selectable=False
				   Local gso:_guishiftout=New _guishiftout
				   gso.init(tl,5,5+i,tl.width()-40,40,eit.name,-1,1,1,1,font18)
				   gso.selectable=False
				   buttoninitmagic(gso.button)
				   i:+40
				  Else
				   Local gt:_guitext=tl.inserttext(eit.name,5,5+i,1,eit.color.x,eit.color.y,eit.color.z,font18)
				   i:+30
				  EndIf
				
				 Next
				 tl.selectbytext(gamenames[sel])
				 tl.scrolltoselection()
				
				EndIf
				
				'Local slli:TLink=sll.firstlink()
				'For Local i=0 To gametypecount-1
				' slls=String(slli.value())
				' Local gt:_guitext=typelist.inserttext(slls,5,5+(i)*30,0,0,0,0,font18)
				' If gt.get()="--------- Gruppe --------" gt.selectable=False
				' slli=slli.nextlink()
				'Next
				EndMethod
	Method updatemenugametype()
				
				Local typ$=typelist.selectiontext()
				For Local i=0 To gametypecount-1
				 If typ=gamenames[i] 
				  current_preview=i
				  current.set(gamenames[current_preview])
				 EndIf
				Next
				'Print "desclist.clhildlist.clear()"+ desclist.childlist.count()
				updatemenugametypehelp(desclist,current_preview);
				EndMethod
				
	Method updatemenugametypehelp(destination:_guilistbox,gameindex:Int)		
				Local gl:_guiline		
				destination.clearchild()
				'desclist.childlist.clear()
				buttondemoplayplay=Null
				buttondemoplaystop=Null
				buttonfoundation=Null
				buttondiscard=Null
				buttontableau=Null
				buttonstock=Null
				buttonwaste=Null
				buttonredeal=Null
				buttonreserve=Null
				buttonfreecell=Null
				buttonpyramid=Null
				buttonlabyrinth=Null				
				destination.selection=Null
				If(gameindex>=0) And (gameindex<gametypecount)
				 Local h$
				 Local t#
				 Local yit#=10
				 Local xit#=20'225-90
				 Local off#=20
				
				 t=gametypechancemin(gameindex)
				 If t>0.0 And t<=0.2 h=strverylow
				 If t>0.2 And t<=0.4 h=strlow
				 If t>0.4 And t<=0.6 h=strmedium
				 If t>0.6 And t<=0.8 h=strhigh
				 If t>0.8 And t<=1.0 h=strveryhigh
				
				 
				 If ((gametypechance[gameindex*2]+gametypechance[gameindex*2+1])=0) h="NOCH NICHT ERMITTELT"
				 Local hv$=t*100
				 Local sepa$[]=New String[1]
				 sepa[0]="."
				 Local frags$[]=hv.split(sepa[0])
				 hv=" ("+frags[0]+"%  "+gametypechance[gameindex*2]+" "+strof+" "+Int(gametypechance[gameindex*2]+gametypechance[gameindex*2+1])+")"
				 h:+hv
				
				 Local gtt:_guitext=destination.inserttext(strchance+": "+h,5,yit,1,1,0.8,0.5,font18);yit:+off
				 gtt.createhelp(strwinchance,font18,0.2,0,0)
				 guihelpinitmagic(gtt);

				
				 t=gametypeskill[gameindex]
				 If t>=0.0 And t<=0.2 h=strveryeasy
				 If t>0.2 And t<=0.4 h=streasy
				 If t>0.4 And t<=0.6 h=strmediumdifficult
				 If t>0.6 And t<=0.8 h=strhard
				 If t>0.8 And t<=1.0 h=strveryhard
				 destination.inserttext(strdifficulty+" : "+h,5,yit,1,1,0.8,0.5,font18);yit:+off
				
				 t=gametypetime[gameindex]
				 If t<7 h=strshort
				 If t>=7 And t<=12 h=strmedium
				 If t>=12 h=strlong
				 destination.inserttext(strtimeexposure+" : "+h,5,yit,1,1,0.8,0.5,font18);yit:+off
   			     destination.inserttext(strdecks+" : "+gametypedeckscount[gameindex],5,yit,1,1,0.8,0.5,font18);yit:+off
				
				 'Local hanz$=strdisplay
				 'destination.inserttext(hanz,100,yit,0,1,0.8,0.5,font18)
				 gl=destination.insertline(5,yit+10,500,yit+10,0.4,0.25,0.05)
				 gl.color.w=0.3
				 SetImageFont(font18)
				 yit:+20
				
				
				
				  Local lbyit#=yit
				 If gamepreview
				
				  

				 ' desclist.insertline(100+TextWidth(hbes)+5,yit+10,500,yit+10,0.4,0.25,0.05);
				
				  'desclist.inserttext(hbes,5,yit,0,0,0,0,font18);yit:+off
				
				
				  'desclist.inserttext("Beschreibung : ", 5,yit,2,1,0.8,0.4,font18);yit:+off
				  'yit:+off
				  Local absatzlist:TList=CreateList()
				  gra.enabletext2d()
				  SetImageFont(font18)
				  Local sep$[]=New String[1]
				  sep[0]="|"
				  Local ar$[]=gameobjective[gameindex].split(sep[0])
				  Local i
				  i=0
				  While i<ar.length
				   absatzlist.addlast(ar[i])
				   i:+1
				  Wend
				  Local ac=absatzlist.count()
				  Local ai=0
				  For Local tab:String=EachIn absatzlist
				   Local lt:TList=textsplit(tab,450-20,font18)
				   For Local tit:String=EachIn lt
				    destination.inserttext(tit,20,yit,1,1,0.8,0.5,font18)
				    yit:+off
				   Next
				   ai:+1
				   If ai<ac yit:+10
				  Next
				  			
				
				
				 ' desclist.inserttext(hbes,100,yit,0,1,0.8,0.5,font18)
				  gl=destination.insertline(5,yit+10,500,yit+10,0.4,0.25,0.05)
				  gl.color.w=0.3		  
				  SetImageFont(font18)
				  yit:+20				
				  gamepreview.updatepiledescription()
				  For Local p=0 To 9
				   Local but:_guibutton=Null
				   Local tb$=""
				   Local pl:TList=Null
				   Local buttontextlist:TList=CreateList()
				   If p=0 
				    pl=gamepreview.pilefoundationlist
				    tb=strpilefoundationshort
				   EndIf
				   If p=1 
				    pl=gamepreview.pilediscardlist
				    tb=strpilediscardshort
				   EndIf
				   If p=2
				    If gamepreview.tableau
				     pl=gamepreview.tableau.pilelist
				     tb=strtableau
				    EndIf
				   EndIf
				   If p=3
				    pl=gamepreview.pilestocklist
				    tb=strpilestock
				   EndIf
				   If p=4
				    pl=gamepreview.pilewastelist
				    tb=strpilewasteshort
				   EndIf
				   If p=5
				    pl=gamepreview.pileredeallist
				    tb=strpileredealshort
				   EndIf
				   If p=6
				    pl=gamepreview.pilereservelist
				    tb=strpilereserveshort
				   EndIf
				   If p=7
				    pl=gamepreview.pilefreecelllist
				    tb=strpilefreecellshort
				   EndIf
				   If p=8
				    pl=gamepreview.pilepyramidlist
				    tb=strpilepyramidshort
				   EndIf
				   If p=9
				    pl=gamepreview.pilelabyrinthlist
				    tb=strpilelabyrinthshort
				   EndIf
				   If pl
				    If pl.count()>0 
				     
				     but=New _guibutton;
				     but.init(destination,xit,yit,160,45,tb,4000+p);
				     buttoninitmagic(but);
					 If tb=strtableau'------------------------------------------- tableau pile help description -------------------------------
				 	  'Local tit:TLink=Null
					  'If gamepreview.tableau tit=gamepreview.tableau.pilelist.firstlink()
					  'Local pt:_piletableau=Null
					  'If tit pt=_piletableau(tit.value())
					  Local ptlist:TList=CreateList()
					  Local ptindex=0
					  If gamepreview.tableau
					   For Local ptit:_piletableau=EachIn gamepreview.tableau.pilelist
					    Local exist=False
					    For Local ptii:_piletableau=EachIn ptlist
					     If ptit.samerule(ptii) exist=True
					    Next
					    If exist=False And ptit.showdescription
					     ptlist.addlast(ptit)
					    EndIf
					   Next					
					  EndIf
					  
					  For Local pt:_piletableau=EachIn ptlist
					   Local pickhelp:_guiwindow
					   Local drophelp:_guiwindow
					   Local dropemptyhelp:_guiwindow
					   Local pyit#=10
					   Local dyit#=10
					   Local eyit#=10
					
					   Local hdrop$=strdrop
				       If ptlist.count()>1 
				        If ptindex=0 hdrop:+" ("+strleft+")"
				        If ptindex=1 hdrop:+" ("+strright+")"
				       EndIf
				       If pt.takeruleset() 
				        drophelp=but.createhelp(hdrop,font18,0.3,125,0,350,True);
					    If pt.takesamesuit
					     inserthelpsamesuit(drophelp,dyit,pt,True);dyit:+25
						EndIf
					    If pt.takeothersuit
					     inserthelpothersuit(drophelp,dyit);dyit:+25
						EndIf
					    If pt.takealteratecolor 
					     inserthelpalteratecolor(drophelp,dyit);dyit:+25
						EndIf
						If pt.takeascending
					     inserthelpascending(drophelp,dyit);dyit:+25
						EndIf
						If pt.takedescending
					     inserthelpdescending(drophelp,dyit);dyit:+25
						EndIf
						If pt.takeboth
						 inserthelpboth(drophelp,dyit);dyit:+25+16;
						EndIf
						If pt.takewrapped
						 dyit=inserthelpwrapped(drophelp,dyit,pt);
						EndIf
						If pt.takemirrored
						 inserthelpmirrored(drophelp,dyit,pt);dyit:+25+14+20;
						EndIf
						If pt.takerestriction
						 dyit=inserthelprestriction(drophelp,dyit);
						EndIf
						
						buttontextlist.addlast(pt.description0+pt.description1)
						 
						
						
					 	'drophelp.size.sety(drophelp.childheight()+10)
					   EndIf
					   If pt.takeemptyruleset()
					    If drophelp=Null drophelp=but.createhelp(hdrop,font18,0.3,125,0,350,True);
					   
				        'dropemptyhelp=but.createhelp(stremptyfield,font18,0.3,125,0,250,True);
						If pt.takeemptysuit<>-1 Or pt.takeemptynumber<>-1
						 dyit=inserthelpsuitnumber(drophelp,dyit,pt,True);
						 If pt.takeemptysuit<>-1 And pt.takeemptynumber=-1
						  buttontextlist.addlast(strdescriptiontakeemptysuit)
						 ElseIf pt.takeemptysuit=-1 And pt.takeemptynumber<>-1
						  If pt.takeemptynumber=12 
						   buttontextlist.addlast(strdescriptiontakeemptyking)
						  Else
						   buttontextlist.addlast(strdescriptiontakeemptynumber)
						  EndIf
						 ElseIf pt.takeemptysuit<>-1 And pt.takeemptynumber<>-1
						  If pt.takeemptynumber=12 
						   buttontextlist.addlast(strdescriptiontakeemptysuitking)
						  Else
						   buttontextlist.addlast(strdescriptiontakeemptysuitnumber)
						  EndIf
						 EndIf
						EndIf
						If pt.takeemptymaximal<>-1 
						 dyit=inserthelpmaximal(drophelp,dyit,pt.takeemptymaximal,True);
						 Local hh$=strdescriptiontakeemptymaximal+" "+pt.takeemptymaximal+" "
						 If pt.takeemptymaximal=1 hh:+strdescriptiontakeemptymaximalcard Else hh:+strdescriptiontakeemptymaximalcards
						 buttontextlist.addlast(hh)
						EndIf
						If pt.takeemptyrestriction
						 dyit=inserthelprestriction(drophelp,dyit,True);
						 buttontextlist.addlast(strdescriptiontakeemptyrestriction)
						EndIf
					 	'dropemptyhelp.size.sety(drophelp.childheight()+10)
					     
					   Else
					    If pt.takerestriction=False buttontextlist.addlast(strdescriptiontakeemptyany)
					   EndIf
					   If drophelp drophelp.size.sety(drophelp.childheight()+10)
					   
					
				       If pt.giveruleset() 
				        Local hpick$=strpick
				        If ptlist.count()>1 
				         If ptindex=0 hpick:+" ("+strleft+")"
				         If ptindex=1 hpick:+" ("+strright+")"
				        EndIf
				        pickhelp=but.createhelp(hpick,font18,0.3,125,0,350,True);
					    If pt.givesamesuit
					     inserthelpsamesuit(pickhelp,pyit,pt,False);pyit:+25
						EndIf
					    If pt.giveothersuit
					     inserthelpothersuit(pickhelp,pyit);pyit:+25
						EndIf
					    If pt.givealteratecolor
					     inserthelpalteratecolor(pickhelp,pyit);pyit:+25
					    EndIf	
					    If pt.giveascending
					     inserthelpascending(pickhelp,pyit);pyit:+25
					    EndIf	
					    If pt.givedescending
					     inserthelpdescending(pickhelp,pyit);pyit:+25
					    EndIf	
						If pt.giverestriction
						 dyit=inserthelprestriction(pickhelp,pyit);
						EndIf
						If pt.givemaximal<>-1
						 dyit=inserthelpmaximal(pickhelp,pyit,pt.givemaximal);
						EndIf
						pickhelp.size.sety(pickhelp.childheight()+10)
				        Local hpt$=""
				        If pt.givedescending hpt=strdescriptiongivedescending
				        If pt.giveascending hpt=strdescriptiongiveascending
				'If takeboth And takeascending=False And takedescending=False 
				' hpt=strpiletakeboth
				'EndIf
				        If pt.givealteratecolor hpt:+strdescriptiongivealteratecolor
				        If pt.givesamesuit hpt:+strdescriptiongivesamesuit
				        If pt.giveothersuit hpt:+strdescriptiongiveothersuit
				        If hpt<>"" hpt:+strdescriptiongive
				

				        If pt.giverestriction hpt:+strdescriptiongiverestriction
				        If pt.givemaximal<>-1 
				        If pt.givemaximal=1
				         hpt:+strdescriptiongivemaximalsingular
				        Else
			    	     hpt:+strdescriptiongivemaximalplural0+pt.givemaximal+strpiletakemaximalplural1
				        EndIf
				       EndIf
				       buttontextlist.addlast(hpt)
					  Else
				       buttontextlist.addlast(strdescriptiongiveanysequence)
					  EndIf
					
 					  
					
					  ' If but.help
						'but.help.visibility(False)
						'but.help.activity(False)
						'but.help.fadeopacity(0)	
					   'EndIf
					   ptindex:+1
				 	  Next
				      If but guihelpinitmagic(but)
				     ElseIf tb=strpilefoundationshort'------------------------------------------- foundation pile help description -------------------------------

					  Local pflist:TList=CreateList()
					  Local pfindex=0
					  For Local pfit:_pilefoundation=EachIn gamepreview.pilefoundationlist
					   Local exist=False
					   For Local pfii:_pilefoundation=EachIn pflist
					    If pfit.samerule(pfii) exist=True
					   Next
					   If exist=False
					    pflist.addlast(pfit)
					   EndIf
					  Next
					
				 	  'Local tit:TLink=Null
					  'tit=gamepreview.pilefoundationlist.firstlink()
					  'Local pf:_pilefoundation=Null
					  'If tit pf=_pilefoundation(tit.value())
					
					
					  For Local pf:_pilefoundation=EachIn pflist
					   Local pickhelp:_guiwindow
					   Local drophelp:_guiwindow
					   Local pyit#=10
					   Local dyit#=10
				       Local hdrop$=strdrop
				       If pflist.count()>1 
				        If pfindex=0 hdrop:+" ("+strleft+")"
				        If pfindex=1 hdrop:+" ("+strright+")"
				       EndIf
				       If pf.takeruleset() 
				        drophelp=but.createhelp(hdrop,font18,0.3,125,0,350,True);
					    If pf.takesamesuit
					     inserthelpsamesuit(drophelp,dyit,pf,True);dyit:+25
						EndIf
					    If pf.takeothersuit
					     inserthelpothersuit(drophelp,dyit);dyit:+25
						EndIf
					    If pf.takealteratecolor 
					     inserthelpalteratecolor(drophelp,dyit);dyit:+25
						EndIf
						If pf.takeascending And pf.takemirrored=False
					     inserthelpascending(drophelp,dyit);dyit:+25
						EndIf
						If pf.takedescending And pf.takemirrored=False
					     inserthelpdescending(drophelp,dyit);dyit:+25
						EndIf
						If pf.takeboth
						 inserthelpboth(drophelp,dyit);dyit:+25+16;
						EndIf
						If pf.takewrapped
						 dyit=inserthelpwrapped(drophelp,dyit,pf);
						EndIf
						If pf.takemirrored
						 inserthelpmirrored(drophelp,dyit,pf);dyit:+25+14+16;
						EndIf
						If pf.takerestriction
						 dyit=inserthelprestriction(drophelp,dyit);
						EndIf
						buttontextlist.addlast(pf.description0+pf.description1)
						
						drophelp.size.sety(drophelp.childheight()+10)
					   EndIf
				       If pf.giveruleset() 
				        Local hpick$=strpick
				        If pflist.count()>1 
				         If pfindex=0 hpick:+" ("+strleft+")"
				         If pfindex=1 hpick:+" ("+strright+")"
				        EndIf
				        pickhelp=but.createhelp(hpick,font18,0.3,125,0,350,True);
					    If pf.givesamesuit
					     inserthelpsamesuit(pickhelp,pyit,pf,False);pyit:+25
						EndIf
					    If pf.giveothersuit
					     inserthelpothersuit(pickhelp,pyit);pyit:+25
						EndIf
					    If pf.givealteratecolor
					     inserthelpalteratecolor(pickhelp,pyit);pyit:+25
					    EndIf	
					    If pf.giveascending
					     inserthelpascending(pickhelp,pyit);pyit:+25
					    EndIf	
					    If pf.givedescending
					     inserthelpdescending(pickhelp,pyit);pyit:+25
					    EndIf	
						If pf.giverestriction
						 dyit=inserthelprestriction(pickhelp,pyit);
						EndIf
						If pf.givemaximal<>-1
						 dyit=inserthelpmaximal(pickhelp,pyit,pf.givemaximal);
						EndIf
						pickhelp.size.sety(pickhelp.childheight()+10)
						
					   EndIf
					   If pf.giverestriction
					   ' buttontextlist.addlast(strdescriptiongiverestriction)
					   Else
					    buttontextlist.addlast(strdescriptiongivefirst)
					   EndIf
 					   pfindex:+1
				 	  Next
				      If but guihelpinitmagic(but)
				     ElseIf tb=strpilediscardshort'------------------------------------------- discard pile help description -------------------------------
				      Local tl:TLink=gamepreview.pilediscardlist.firstlink()
				      If tl
				  	   Local pd:_pilediscard=_pilediscard(tl.value())
				   	   If pd.acesupmode
				        but.createhelp(strdiscardacesupmode,font18,0.3,100,0,200,True)
					   ElseIf pd.pyramidmode
				        but.createhelp(strdiscardpyramidmode,font18,0.3,100,0,200,True)
					   Else	
				        If (pd.showdescription) but.createhelp(strdiscardnormal,font18,0.3,100,0,200,True)
				  	   EndIf
				       If but guihelpinitmagic(but)
 
				      EndIf
				     ElseIf tb=strpilewasteshort'--------------------------------------------- waste pile help description ---------------------------------
				      Local dyit#=10
				      Local pickhelp:_guiwindow=but.createhelp(strpick,font18,0.3,125,0,300,True);
				      dyit=inserthelpmaximal(pickhelp,dyit,1);
				      If but guihelpinitmagic(but)
				     ElseIf tb=strpilereserveshort'------------------------------------------- reserve pile help description -------------------------------

					  Local prlist:TList=CreateList()
					  For Local prit:_pilereserve=EachIn gamepreview.pilereservelist
					   Local exist=False
					   For Local prii:_pilereserve=EachIn prlist
					    If prit.samerule(prii) exist=True
					   Next
					   If exist=False
					    prlist.addlast(prit)
					    Local hr$=prit.description0+prit.description1
					    but.createhelp(hr,font18,0.3,100,0,200,True)
					   EndIf
					  Next
					  If but guihelpinitmagic(but)

				      For Local pr:_pilereserve=EachIn prlist
					   buttontextlist.addlast(pr.description0+pr.description1)
					  Next
				   
					 ElseIf tb=strpileredealshort'-------------------------------------------- redeal pile help description --------------------------------
					  For Local pit:_pileredeal=EachIn gamepreview.pileredeallist
					   Local hr$=pit.description0+pit.description1
					   but.createhelp(hr,font18,0.3,100,0,200,True)
					  Next
					  If but guihelpinitmagic(but)

					 ElseIf tb=strpilefreecellshort'-------------------------------------------- freecell pile help description --------------------------------

					 ElseIf tb=strpilestock'-------------------------------------------------- talon pile help description ---------------------------------

					  Local pslist:TList=CreateList()
					  For Local psit:_pilestock=EachIn gamepreview.pilestocklist
					   Local exist=False
					   For Local psii:_pilestock=EachIn pslist
					    If psit.samerule(psii) exist=True
					   Next
					   If exist=False
					    pslist.addlast(psit)
					    Local hr$=psit.description0+psit.description1
					    but.createhelp(hr,font18,0.3,100,0,300,True)
					   EndIf
					  Next
					  If but guihelpinitmagic(but)
					
					
					
					
					  'Local already:TList=CreateList()
					  'For Local pit:_pilestock=EachIn gamepreview.pilestocklist
					  ' Local hr$=pit.description0+pit.description1
					  ' Local exist=False
					  ' For Local sit$=EachIn already
					  '  If sit=hr exist=True
					  ' Next
					  ' If exist=False 
					  '  but.createhelp(hr,font18,0.3,100,0,200,True)
					  '  already.addlast(hr)
					  ' EndIf
					  'Next
					
					
					
				     EndIf'----------------------------------------------------------------------------------------------------------------------------------
					 If but.help
					  but.help.visibility(False)
					  but.help.activity(False)
					  but.help.fadeopacity(0)	
					 EndIf				
				
				     'lbyit=yit
				    EndIf
				   EndIf
				   'If pe
				   ' but=New _guibutton;
				   ' but.init(desclist,xit,yit,240,35,tb,4000+p);
				   ' buttoninitmagic(but);
				    
				    'desclist.childlist.addlast(but)
			       ' lbyit=yit
				   'EndIf
				   If p=0 buttonfoundation=but
				   If p=1 buttondiscard=but
				   If p=2 buttontableau=but
				   If p=3 buttonstock=but
				   If p=4 buttonwaste=but
				   If p=5 buttonredeal=but
				   If p=6 buttonreserve=but
				   If p=7 buttonfreecell=but
				   If p=8 buttonpyramid=but
				   If p=9 buttonlabyrinth=but

				   If but
				    Local ac=buttontextlist.count()
				    If ac>0
				     Local yitl#=13
				     Local ai=0
				     For Local tab:String=EachIn buttontextlist
                      Local gi:_guiimage=destination.insertimage(idonut,190,yit+yitl,20,20,1,1,1,-1)				  
				      Local lt:TList=textsplit(tab,200,font18)
				      For Local tit:String=EachIn lt
				       destination.inserttext(tit,210,yit+yitl,1,1,0.8,0.5,font18)
				       yitl:+off
				      Next
				      ai:+1
				      'If ai<ac yit:+10
				     Next
				     If (yitl)<off+35 yit:+off+35 Else yit:+yitl
				    Else
			         yit:+off+35
				    EndIf	
				   EndIf
				
				
				  Next
				 EndIf
				 yit=lbyit+off+20
				

				 buttondemoplayplay=New _guibutton
				 buttondemoplayplay.init(destination,-200,10,160,40,strdemoplay,1000)
				 buttondemoplayplay.position.add(1,0,0,True)
				 buttoninitmagic(buttondemoplayplay)
				 'desclist.childlist.addlast(buttondemoplayplay)
				 buttondemoplaystop=New _guibutton
				 buttondemoplaystop.init(destination,-200,55,160,40,strdemostop,1000)
				 buttondemoplaystop.position.add(1,0,0,True)
				 buttoninitmagic(buttondemoplaystop)
				 'desclist.childlist.addlast(buttondemoplaystop)
				 destination.updatefadeopacity()
				 destination.parent.animate(0)
				 destination.animate(0)
				EndIf
				EndMethod
	Method inserthelpalteratecolor(w:_guiwindow,y#)
				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cw#=20
				Local ch#=20
				Local x#=180
	 	 	    gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
  				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				Local suit=Rand(0,3)
				For Local i=0 To 6
				 gg.texture[0,0]=tsymbolsuit[suit]
				 gg.texture[1,0]=tsymbolsuit[suit]
				 If suit=3 Or suit=0 
				  suit=Rand(1,2) 
				 ElseIf suit=1 Or suit=2 
				  suit=Rand(0,1)*3
				 EndIf
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 gm=w.insertmesh(mt,x+i*cw,y,cw,ch,1,1,1,100)
				 gm.selectable=False
				Next					
				EndMethod
	Method inserthelpsamesuit(w:_guiwindow,y#,p:_pile,drop)
				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cw#=20
				Local ch#=20
				Local suit=Rand(0,3)
				If drop
				 If p.takeemptysuit<>-1 suit=p.takeemptysuit
				EndIf
	 	 	    gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
  				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				For Local i=0 To 6
				 gg.texture[0,0]=tsymbolsuit[suit]
				 gg.texture[1,0]=tsymbolsuit[suit]
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 Local x#=180
				 gm=w.insertmesh(mt,x+i*cw,y,cw,ch,1,1,1,100)
				 gm.selectable=False
				Next					
				EndMethod
	Method inserthelpothersuit(w:_guiwindow,y#)
				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cw#=20
				Local ch#=20
				Local suit=Rand(0,3)
			    Local x#=180
	 	 	    gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
  				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				For Local i=0 To 6
				 gg.texture[0,0]=tsymbolsuit[suit]
				 gg.texture[1,0]=tsymbolsuit[suit]
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 gm=w.insertmesh(mt,x+i*cw,y,cw,ch,1,1,1,100)
				 gm.selectable=False
				 Local oldsuit=suit
				 Repeat
				  suit=Rand(0,3)
				 Until oldsuit<>suit
				Next					
				EndMethod
	Method inserthelpascending(w:_guiwindow,y#)
				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cw#=20
				Local ch#=20
				Local s=Rand(0,6)
			    Local x#=180
	 	 	    gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
  				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				Local j=0
				For Local i=s To s+6
				 gg.texture[0,0]=tsymbolnumbersmall[i]
				 gg.texture[1,0]=tsymbolnumbersmall[i]
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 gm=w.insertmesh(mt,x+j*cw,y,cw,ch,1,1,1,100)
				 gm.selectable=False
				 j:+1
				Next					
				EndMethod
	Method inserthelpdescending(w:_guiwindow,y#)
				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cw#=20
				Local ch#=20
				Local s=Rand(6,12)
				Local x#=180
	 	 	    gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
  				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				Local j=0
				For Local i=s To s-6 Step -1
				 gg.texture[0,0]=tsymbolnumbersmall[i]
				 gg.texture[1,0]=tsymbolnumbersmall[i]
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 gm=w.insertmesh(mt,x+j*cw,y,cw,ch,1,1,1,100)
				 gm.selectable=False
				 j:+1
				Next					
				EndMethod
	Method inserthelpboth(w:_guiwindow,y#)
				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cw#=20
				Local ch#=20
				Local n=Rand(0,12)
			 	Local x#=180
	 	 	    gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
  				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				For Local j=0 To 6 
				 gg.texture[0,0]=tsymbolnumbersmall[n]
				 gg.texture[1,0]=tsymbolnumbersmall[n]
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 gm=w.insertmesh(mt,x+j*cw,y,cw,ch,1,1,1,100)
				 gm.selectable=False
				 If n=12 
				  n=11
				 ElseIf n=0
				  n=1
				 Else
				  If Rand(0,1)
				   n:+1
				  Else
				   n:-1
				  EndIf
				 EndIf
				Next					
				Local gt:_guitext
				gt=w.inserttext(strbothdirections,x,y+22,1,1,0.8,0.5,font18)
				gt.selectable=False
				EndMethod

	Method inserthelpmirrored(w:_guiwindow,y#,p:_pile)
				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cw#=20
				Local ch#=20
				Local n
			 	Local x#=180
	 	 	    gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
  				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				If p.takeascending n=0
				If p.takedescending n=12

				For Local j=0 To 5 
				 If j<>1 And j<>4
				  If p.takeascending 
				   If j=2 Or j=3
				    n=12
				   Else
				    n=0
				   EndIf
				  EndIf
				  If p.takedescending 
				   If j=2 Or j=3
				    n=0
				   Else
				    n=12
				   EndIf
				  EndIf
				  gg.texture[0,0]=tsymbolnumbersmall[n]
				  gg.texture[1,0]=tsymbolnumbersmall[n]
				 Else
				  gg.texture[0,0]=tsymbolddd
				  gg.texture[1,0]=tsymbolddd
				 EndIf
				  mt=gg.Create()
				  mt.twosided(True)
				  mt.cull(False)		
				  mt.blend(True)
				  mt.blendadditive(False)
				  gm=w.insertmesh(mt,x+j*(cw+4.5),y,cw,ch,1,1,1,100)
				  gm.selectable=False
				Next
						
				If p.takeascending		
				 Local gt:_guitext
				 gt=w.inserttext(strafterascending,x,y+22,1,1,0.8,0.5,font18)
				 gt.selectable=False
				 gt=w.inserttext(strfollowsdescending,x,y+22+20,1,1,0.8,0.5,font18)
				 gt.selectable=False
				ElseIf p.takedescending
				 Local gt:_guitext
				 gt=w.inserttext(strafterdescending,x,y+22+20,1,1,0.8,0.5,font18)
				 gt.selectable=False
				 gt=w.inserttext(strfollowsascending,x,y+22,1,1,0.8,0.5,font18)
				 gt.selectable=False
				EndIf
				
				EndMethod
	Method inserthelpwrapped:Float(w:_guiwindow,y#,p:_pile)
			 	Local x#=180
				If p.takeascending		
				 Local gt:_guitext
				 gt=w.inserttext(strmaykona,x,y,1,1,0.8,0.5,font18);y:+20;
				 gt.selectable=False
				ElseIf p.takedescending
				 Local gt:_guitext
				 gt=w.inserttext(strmayaonk,x,y,1,1,0.8,0.5,font18);y:+20;
				 gt.selectable=False
				ElseIf p.takeboth
				 Local gt:_guitext
				 gt=w.inserttext(strmaykona,x,y,1,1,0.8,0.5,font18);y:+20;
				 gt.selectable=False
				 gt=w.inserttext(strmayaonk,x,y,1,1,0.8,0.5,font18);y:+20;
				 gt.selectable=False
				EndIf
				Return(y)
				EndMethod
	Method inserthelpmaximal:Float(w:_guiwindow,y#,m,empty=False)
			 	Local x#=180
				Local gt:_guitext
				Local h$=strmaximal+" "+m
				If empty h=stronemptypile+" : "+h
				gt=w.inserttext(h,x,y,1,1,0.8,0.5,font18);y:+25;
				gt.selectable=False
				Return(y)
				EndMethod
	Method inserthelprestriction:Float(w:_guiwindow,y#,empty=False)
				Local h$=""
				If empty
			 	 Local x#=180
				 Local gt:_guitext
				 h=stronemptypile+" : "
				 gt=w.inserttext(h,x,y,1,1,0.8,0.5,font18);
				 gt.selectable=False
				EndIf


				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cw#=20
				Local ch#=20
				SetImageFont(font18)
			 	Local x#=180+TextWidth(h)
	 	 	    gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
  				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				gg.texture[0,0]=tsymbolfine
				gg.texture[1,0]=tsymbolfine
				mt=gg.Create()
				mt.twosided(True)
				mt.cull(False)		
				mt.blend(True)
				mt.blendadditive(False)
				gm=w.insertmesh(mt,x,y,cw,ch,1,1,1,100)
				gm.selectable=False
				y:+25
				Return(y)
				EndMethod
	Method inserthelpsuitnumber(w:_guiwindow,y#,pt:_piletableau,empty=False)
				Local h$=""
				If empty
			 	 Local x#=180
				 Local gt:_guitext
				 h=stronemptypile+" : "
				 gt=w.inserttext(h,x,y,1,1,0.8,0.5,font18);
				 gt.selectable=False
				EndIf

				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cw#=20
				Local ch#=20
				SetImageFont(font18)

				Local x#=180+TextWidth(h)

	 	 	    gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
  				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				If pt.takeemptysuit<>-1
				 gg.texture[0,0]=tsymbolsuit[pt.takeemptysuit]
				 gg.texture[1,0]=tsymbolsuit[pt.takeemptysuit]
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 gm=w.insertmesh(mt,x,y,cw,ch,1,1,1,100);x:+cw
				 gm.selectable=False
				EndIf
				If pt.takeemptynumber<>-1
				 gg.texture[0,0]=tsymbolnumbersmall[pt.takeemptynumber]
				 gg.texture[1,0]=tsymbolnumbersmall[pt.takeemptynumber]
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 gm=w.insertmesh(mt,x,y,cw,ch,1,1,1,100)
				 gm.selectable=False
				EndIf
				y:+25					
				EndMethod
															
	EndType
'******************************************************************************************************************
'										C A M E R A S O L I T A I R E
'******************************************************************************************************************
Type _camerasolitaire Extends _camera
	Field curveposition:_hermitecurve=Null
	Field curveview:_hermitecurve=Null
	Field curveside:_hermitecurve=Null
	Field curveup:_hermitecurve=Null
	Field curvepositiont#=0
	Field curveviewt#=0
	Field curvesidet#=0
	Field curveupt#=0
	Field curving:Int=False
	
	Field curvespeed#=20
	Field curvetime:Int=0	
	Field lengthview#
	Field lengthside#
	Field lengthup#
	Method New()
				'fantasy einstellungen :
				'position.set(0,-4,-40)
				'view.set(0,0.18,1.8)
				'up.set(0,1,-0.1)
				'up.norm()
				'side.set(1.1,0,0)				
				position.set(0,0,-40)
				
				view.set(0,0,2)
				side.set(1,0,0)
				up.set(0,1,0)
				
				curving=False
				curveposition=New _hermitecurve
				curveside=New _hermitecurve
				curveview=New _hermitecurve
				curveup=New _hermitecurve
				curvepositiont=0
				curveviewt=0
				curvesidet=0
				curveupt=0
				EndMethod
	Method startcurve(clock:_clock,spd#)
				curvespeed=spd
				curvetime=clock.ms()
				curvepositiont=0
				lengthview=view.length()
				lengthside=side.length()
				lengthup=up.length()
				curveviewt=0
				curvesidet=0
				curveupt=0
				curving=True
				EndMethod					
	Method animate(clock:_clock)
				Local newtime#=clock.ms()
				Local deltat#=Float(newtime-curvetime)/1000.0#
				curvetime=newtime
				If curving
				 If curvepositiont<1
				  curveposition.calculate(curvepositiont)
				  curveside.calculate(curvesidet)
				  curveview.calculate(curveviewt)
				  curveup.calculate(curveupt)
				  Local deltal#=curvespeed*deltat
				  Local dt#
				  If curveposition.curvelength<nearzero
				   dt=1
				  Else 				
				   dt=(deltal/curveposition.curvelength)
				  EndIf
				  curvepositiont:+dt
				  curveviewt:+dt
				  curvesidet:+dt
				  curveupt:+dt
				  position.copy(curveposition.e)
				  view.copy(curveview.e)
				  side.copy(curveside.e)
				  up.copy(curveup.e)
				  'norm()
				 Else
				  curvepositiont=0
				  curveviewt=0
				  curvesidet=0
				  curveupt=0
				  position.copy(curveposition.o1)
				  view.copy(curveview.o1)
				  side.copy(curveside.o1)
				  up.copy(curveup.o1)
				  'norm()
				  curving=False
				 EndIf				  
				EndIf				
				EndMethod
	Method norm()
				Local h:_vector3=New _vector3
				h.copy(view)
				h.crossproduct(side)
				h.crossproduct(view)
				side.copy(h)
				view.norm()
				view.mul(lengthview)
				side.norm()
				side.mul(lengthside)
				up.copy(view)
				up.crossproduct(side)
				up.norm()
				up.mul(lengthup)
				EndMethod			
					
					
	EndType	
