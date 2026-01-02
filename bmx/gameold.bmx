'Project : Solitaire
'Modul : game
'date of create : 01.11.2007
'date of change : 01.11.2007


Global tabx#=3.2
Global taby#=6.2

Global cardtableaushift#=1.2
Global cardtableaushiftbacksided#=0.4
Global camfovfacx#=25
Global camfovfacy#=25
Global pickneigungx#=0.6

'02.11.07,1:05 uhr : hund hat gebellt (5-10mal)


Function countstatsstoreables:Int()
				Local c=0
				For Local sit:_storeable=EachIn storeablelist
				 Local gst:_gamestats=_gamestats(sit)
				 Local gse:_gamestatsentry=_gamestatsentry(sit)
				 If gst Or gse c:+1
				Next
				Return(c)
				EndFunction					
Function countanimationstoreables:Int()
				Local c=0
				For Local sit:_storeable=EachIn storeablelist
				 Local a:_animation=_animation(sit)
				 Local eit:_animationundoentry=_animationundoentry(sit)
				 If a Or eit
				  c:+1
				 EndIf
				Next
				Return(c)
				EndFunction					
Function countcardstoreables:Int()				
				Local c=0
				For Local sit:_storeable=EachIn storeablelist
				 Local a:_card=_card(sit)
				 If a
				  c:+1
				 EndIf
				Next
				Return(c)
				EndFunction					
Function countpilestoreables:Int()				
				Local c=0
				For Local sit:_storeable=EachIn storeablelist
				 Local a:_pile=_pile(sit)
				 If a
				  c:+1
				 EndIf
				Next
				Return(c)
				EndFunction					
Function countgamestoreables:Int()				
				Local c=0
				For Local sit:_storeable=EachIn storeablelist
				 Local a:_game=_game(sit)
				 If a
				  c:+1
				 EndIf
				Next
				Return(c)
				EndFunction					

Function savegame(game:_game)
				Local pit:_pile=Null
				Local cit:_card=Null
				Local ip,ic,iu,ie
				If game
				 game.skipanimation()
				 '------------- erstmal namen verteilen --------------------
				 ip=0
				 ic=0
				 iu=0
				 game.savename="game"
				 For Local uit:_animationundo=EachIn game.undolist
				  uit.savename="undo"+iu
				  iu:+1
				  For Local eit:_animationundoentry=EachIn uit.list
				   eit.savename="undoentry"+ie
				   ie:+1
				  Next
				 Next
				 For pit=EachIn game.pilelist
				  pit.savename="pile"+ip
				  For cit=EachIn pit.cardlist
				   cit.savename="card"+ic
				   ic:+1
				  Next
				  ip:+1
				 Next
				 '---------------- nun speichern ----------------------------
				 Local s:TStream
				 s=WriteFile("game"+gamenamesstore[game.index]+".sol")
				 If Not s RuntimeError "failed to open the save file" 

				 WriteInt(s,game.index)
				 WriteLine(s,gamenamesstore[game.index])
				 game.save(s) 
				 WriteInt(s,game.pilelist.count())
				 For pit=EachIn game.pilelist
				  pit.save(s)
				 Next
				 CloseStream s									
				EndIf
				EndFunction		
Function loadgame:_game(solitaire:_solitaire,cur_game:Int)
				Local game:_game=Null
				Local gt$
				Print "Vor dem Laden gibt es "+storeablelist.count()+" Storeables"
				Print "...davon stats storeables :"+countstatsstoreables()
				Print "...davon anim storeables :"+countanimationstoreables()
				Print "...davon game storeables :"+countgamestoreables()
				Print "...davon pile storeables :"+countpilestoreables()
				Print "...davon card storeables :"+countcardstoreables()
				
				Local s:TStream
				s=ReadFile("game"+gamenamesstore[cur_game]+".sol")
				If s 
				 Local index=ReadInt(s)
				 
				 gt=ReadLine(s)
				 If index=0
				  game=New _gameklondikeone
				 ElseIf index=1
				  game=New _gameklondikethree
				 ElseIf index=2 
				  game=New _gamespideronesuit
				 ElseIf index=3 
				  game=New _gamespidertwosuit
				 ElseIf index=4
				  game=New _gamespiderfoursuit
				 ElseIf index=5
				  game=New _gameeightoff
				 ElseIf index=6
				  game=New _gamefreecell
				 ElseIf index=7
				  game=New _gameforecell
				 ElseIf index=8
				  game=New _gameaustralian
				 ElseIf index=9
				  game=New _gamebethoral
				 ElseIf index=10
				  game=New _gameblindalleys
				 ElseIf index=11
				  game=New _gameblanket
				 ElseIf index=12
				  game=New _gamecancan
				 ElseIf index=13
				  game=New _gamecruel
				 ElseIf index=14
				  game=New _gamepyramid
				 ElseIf index=15
				  game=New _gamegolf
				 ElseIf index=16
				  game=New _gameyukon
				 ElseIf index=17
				  game=New _gamefourcolor
				 ElseIf index=18
				  game=New _gamescorpion
				 ElseIf index=19
				  game=New _gameklondikeonetwodeck
				 ElseIf index=20
				  game=New _gameklondikethreetwodeck
				 ElseIf index=21
				  game=New _gamerussian
				 ElseIf index=22
				  game=New _gameseatowers
				 ElseIf index=23
				  game=New _gamelimited
				 ElseIf index=24
				  game=New _gameladypalk
				 ElseIf index=25
				  game=New _gamelabyrinth
				 ElseIf index=26
				  game=New _gamelabyrintheasier
				 ElseIf index=27
				  game=New _gamelabyrinthrodenbach
				 ElseIf index=28
				  game=New _gamelabyrinthdouble
				 ElseIf index=29
				  game=New _gamesweetmatch
				 ElseIf index=30
				  game=New _gamegolfeasy
				 ElseIf index=31
				  game=New _gamekingspeak
				 ElseIf index=32
				  game=New _gamefortythieves
				 ElseIf index=33
				  game=New _gamelabellelucie
				 ElseIf index=34
				  game=New _gamelafacilelucie
				 ElseIf index=35
				  game=New _gamerussianeasy
				 ElseIf index=36
				  game=New _gamerussianfree
				 ElseIf index=37
				  game=New _gameacesup
				 ElseIf index=38
				  game=New _gameosmosis
				 EndIf		
				 game.initgame(solitaire,1,index)
				 game.Load(s)
				 Local pc=ReadInt(s)
				 If pc>0
				  For Local i=0 To pc-1
				   Local pit:_pile=Null
				   Local pt$=ReadLine(s)
					'Print pt				
				   If pt="_piletableau"
				    pit=game.createpiletableau(1,0,0)
				   ElseIf pt="_pilecruel"
				    pit=game.createpilecruel(0,0)
				   ElseIf pt="_pileacesup"
				    pit=game.createpileacesup(0,0)
				   ElseIf pt="_pilestock"
				    pit=game.createpilestock(0,0,0,0)
				   ElseIf pt="_pilestockpyramid"
				    pit=game.createpilestockpyramid(0,0)
				   ElseIf pt="_pileredeal"
				    pit=game.createpileredeal(0,0)
				   ElseIf pt="_pilediscard"
				    pit=game.createpilediscard(0,0)
				   ElseIf pt="_pilewaste"
				    pit=game.createpilewaste(0,0)
				   ElseIf pt="_pilewastepyramid"
				    pit=game.createpilewastepyramid(0,0)
				   ElseIf pt="_pilefoundation"
				    pit=game.createpilefoundation(0,0)
				   ElseIf pt="_pilereserve"
				    pit=game.createpilereserve(0,0)
				   ElseIf pt="_pilefreecell"
				    pit=game.createpilefreecell(0,0)
				   ElseIf pt="_pilepyramid"
				    pit=game.createpilepyramid(0,0)
				   ElseIf pt="_pilebethoral"
				    pit=game.createpilebethoral(0,0)
				   ElseIf pt="_pileblanket"
				    pit=game.createpileblanket(0,0)
				   ElseIf pt="_pilelabyrinth"
				    pit=game.createpilelabyrinth(0,0,1,1)
				   ElseIf pt="_pilesweetmatch"
				    pit=game.createpilesweetmatch(0,0,1,1)
				   EndIf
				   If pit
				    pit.Load(s)
				   EndIf
				  Next
				 EndIf
				
				 game.assoziieren()
				 For Local ait:_animationundo=EachIn game.undolist
				  ait.assoziieren()
				 Next
				 For Local cit:_card=EachIn game.cardlist
				  cit.assoziieren()
				 Next
				 For Local pit:_pile=EachIn game.pilelist
				  pit.assoziieren()
				  For Local cii:_card=EachIn pit.cardlist
				   cii.assoziieren()
				  Next
				 Next
				 '************* DEBUG pilesweetmatch integrität ***************
				 Local ps:_pilesweetmatch=game.pilesweetmatch(0)
				 If ps
				  Print "erster Integritätscheck nach dem Laden von pilesweetmatch"
				  ps.checkintegrity()
				 EndIf
				 '*************************************************************				
				 CloseStream s
				Else
				 'messagebox("Dieser Spieltyp wurde bisher noch nicht gespeichert.")
				 'speicherdatei nicht vorhanden
				EndIf
				Print "Nach dem Laden gibt es "+storeablelist.count()+" Storeables"
				Print "...davon stats storeables :"+countstatsstoreables()
				Print "...davon anim storeables :"+countanimationstoreables()
				Print "...davon game storeables :"+countgamestoreables()
				Print "...davon pile storeables :"+countpilestoreables()
				Print "...davon card storeables :"+countcardstoreables()
				Return(game)
				EndFunction




'******************************************************************************************************************
'										G A M E S T A T I S T I C S
'******************************************************************************************************************
Type _gamestats Extends _storeable
	Field entrylist:TList=Null
	Field highscorelist:TList=Null
	Field gametype:Int=0
	Field solitaire:_solitaire=Null
	Method New()
				entrylist=CreateList()
				highscorelist=CreateList()
				EndMethod
	Method init(s:_solitaire,t)
				solitaire=s
				gametype=t
				entrylist.clear()
				EndMethod				
	Method timeaverage#()
				Local t#=0
				Local c=0
				For Local eit:_gamestatsentry=EachIn entrylist
				 t:+eit.time
				 c:+1
				Next
				If c>0 t:/Float(c)
				Return(t)
				EndMethod
	Method timemaximum#()
				Local t#=-1
				For Local eit:_gamestatsentry=EachIn entrylist
				 If eit.time>t t=eit.time
				Next
				Return(t)
				EndMethod
	Method timeminimum#()
				Local t#=timemaximum()
				For Local eit:_gamestatsentry=EachIn entrylist
				 If eit.time<t t=eit.time
				Next
				Return(t)
				EndMethod
	Method moveaverage#()
				Local m#=0
				Local c=0
				For Local eit:_gamestatsentry=EachIn entrylist
				 m:+eit.moves
				 c:+1
				Next
				If c>0 m:/Float(c)
				Return(m)
				EndMethod
	Method quote:Float()
				Local c#=entrylist.count()
				If c=0 Return(0)
				Local n#=0
				For Local eit:_gamestatsentry=EachIn entrylist
				 If eit.successful() n:+1
				Next
				Return(n/c)
				EndMethod				
	Method save(s:TStream)
				WriteLine(s,"_gamestats")
				WriteLine(s,savename)
				WriteInt(s,gametype)
				WriteInt(s,entrylist.count())
				For Local eit:_gamestatsentry=EachIn entrylist
				 eit.save(s)
				Next
				WriteInt(s,highscorelist.count())
				For Local hit:_gamestatsentry=EachIn highscorelist
				 hit.save(s)
				Next
				EndMethod
	Method Load(s:TStream)
				entrylist.clear()
				highscorelist.clear()
				loadbegin()
				savename=ReadLine(s)
				gametype=ReadInt(s)
				Local z=ReadInt(s)
				If z>0
				 For Local i=0 To z-1
				  Local eit:_gamestatsentry=New _gamestatsentry
				  eit.init(Self)
				  Local t$=ReadLine(s)
				  eit.Load(s)
				 Next
				EndIf
				entrylist.sort()
				z=ReadInt(s)
				If z>0
				 For Local i=0 To z-1
				  Local hit:_gamestatsentry=New _gamestatsentry
				  hit.init(Self,True)
				  Local t$=ReadLine(s)
				  hit.Load(s)
				 Next
				EndIf
				highscorelist.sort()
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf	
				EndMethod	
								
				
	EndType
'******************************************************************************************************************
'										G A M E S T A T I S T I C S E N T R Y
'******************************************************************************************************************
Type _gamestatsentry Extends _storeable
	Field link:TLink=Null
	Field gamestats:_gamestats=Null
	Field user$=""
	Field discards:Int=0
	Field time#=0'seconds
	Field moves:Int=0'count of moves
	Field undos:Int=0'count of undos
	Field tipps:Int=0'count of tipps	
	Field closed=False
	Field highscored=False'is the current statsentry copied to highscorelist
	Field inhighscorelist=False'is this a highscoreentry
	Method init(g:_gamestats,high=False)
				gamestats=g
				If high
				 link=gamestats.highscorelist.addlast(Self)
				 inhighscorelist=True
				Else
				 link=gamestats.entrylist.addlast(Self)
				EndIf
				EndMethod
	Method copy(g:_gamestatsentry)				
				discards=g.discards
				time=g.time
				moves=g.moves
				tipps=g.tipps
				user=g.user
				undos=g.undos
				EndMethod
	Method score:Float()
				'Return((discards*10)+(Float(100)/time))				
				Return(discards+Float(1)/Float(1+time/1000))				
				EndMethod				
	Method successful:Int()
				If discards=gametypediscards[gamestats.gametype] Return(True) Else Return(False)
				EndMethod				
	Method compare:Int(o:Object)
				Local g:_gamestatsentry=_gamestatsentry(o)
				If score()<g.score() Return(True) Else Return(False)
				EndMethod		
	Method close()
				closed=True
				EndMethod
	'Method checkhighscore()
	'			If highscored=False
	'			 highscored=True
	'			 Local e:_gamestatsentry=New _gamestatsentry
	'			 e.init(gamestats,True)
	'			 e.copy(Self)
	'			 gamestats.highscorelist.sort()
	'			 gamestats.solitaire.checkhighscore(gamestats,e)
	'			EndIf
	'			EndMethod
	Method index:Int()
				Local i=0
				If inhighscorelist
				 For Local e:_gamestatsentry=EachIn gamestats.highscorelist
				  If e=Self Return(i)
				  i:+1
				 Next
				Else
				 For Local e:_gamestatsentry=EachIn gamestats.entrylist
				  If e=Self Return(i)
				  i:+1
				 Next
				EndIf
				Return(0)
				EndMethod												
	Method save(s:TStream)
				WriteLine(s,"_gamestatsentry")
				WriteLine(s,savename)
	
				WriteInt(s,discards)
				WriteFloat(s,time)
				WriteInt(s,moves)
				WriteInt(s,undos)
				WriteInt(s,tipps)
				WriteLine(s,user)
				EndMethod
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)	
				discards=ReadInt(s)
				time=ReadFloat(s)
				moves=ReadInt(s)
				undos=ReadInt(s)
				tipps=ReadInt(s)	
				user=ReadLine(s)							
				EndMethod		
	Method assoziieren()
				If pointerloaded()
				 releasepointer()
				EndIf	
				EndMethod					
	EndType
'******************************************************************************************************************
'										G A M E H I G H S C O R E 
'******************************************************************************************************************
Rem
Type _gamehighscore Extends _gamestatsentry
	

	Method init(g:_gamestats)	
				initentry(g)
				EndMethod
	Method load(s:TStream)
				super.load(s)
				
				EndMethod
	Method save(s:TStream)
				super.save(s)

				EndMethod
			
	Method compare:Int(o:Object)
				Local g:_gamehighscore=_gamehighscore(o)
				If score()<g.score() Return(True) Else Return(False)
				EndMethod					
			
			
	EndType	
	EndRem
'******************************************************************************************************************
'										G A M E 
'******************************************************************************************************************
Type _game Extends _storeable
	Field solitaire:_solitaire=Null
	Field animationlist:TList=Null
	Field allowpick=True
	Field cameraposition:_vector3[10]
	Field camerapositionmenu:_vector3[10]
	Field camerapositionpreview:_vector3[10]
	Field cameraview:_vector3[10]
	Field cameraviewmenu:_vector3[10]
	Field cameraviewpreview:_vector3[10]
	Field cameraside:_vector3[10]
	Field camerasidemenu:_vector3[10]
	Field camerasidepreview:_vector3[10]
	Field cameraup:_vector3[10]
	Field cameraupmenu:_vector3[10]
	Field camerauppreview:_vector3[10]

	Field music=0
	Field preview=False
	Field mode=0'0=fantasy, 1=sheepworld
	Field index=0'for external storage !
	Field inuse=False
	Field starttime#=0
	Field pickstate:Int=0
	Field position:_vector3=Null
	Field vector:_vector3[2]
	'Field statsentry:_gamestatsentry=Null
	Field tableau:_tableau=Null
	Field pilestock:_pilestock=Null
	Field pilewaste:_pilewaste=Null
	Field pilediscard:_pilediscard=Null
	Field pileredeal:_pileredeal=Null
	Field pilefoundationlist:TList=Null
	Field pilefreecelllist:TList=Null
	Field pilereservelist:TList=Null
	Field pilepyramidlist:TList=Null
	Field pilelabyrinthlist:TList=Null
	Field pilesweetmatchlist:TList=Null
	Field cardlist:TList=Null
	Field pilelist:TList=Null
	Field drawlist:TList=Null
	Field picklist:TList=Null
	Field tipplist:TList=Null
	Field undolist:TList=Null
	Field undoiterator:TLink=Null
	

	'tableau pile rule states
	Field pilegivesamesuit=False
	Field pilegivealteratecolor=False
	Field pilegivedescending=False
	Field pilegiveascending=False
	
	Field piletakesamesuit=False
	Field piletakealteratecolor=False
	Field piletakeascending=False
	Field piletakedescending=False
	Field piletakeemptynumber:Int=-1
	Field piletakeemptysuit:Int=-1
	'Field pileemptyanycard=False'if true, the any card could be set on a free tableaupile
	'vorher : Field pileemptyace=False
	'vorher : Field pileemptyking=False
	'foundation rule states
	Field foundationdescending=False
	Field foundationascending=False
	Field foundationboth=False
	Field foundationbothwrapped=False
	Field foundationpickrestriction=False
	'freecell rule states
	Field freecellpickrestriction=False
	'redeal rules
	Field redealvalue=-1
	Field redealcount=0
	Field ended=False
	'statistics
	Field statsclosed=False
	Field discards:Int=0
	Field time#=0'seconds
	Field moves:Int=0'count of moves
	Field undos:Int=0'count of undos
	Field tipps:Int=0'count of tipps	

	Field tippsourpileiterator:TLink=Null'tertiäriterator
	Field tippsourcarditerator:TLink=Null'sekundäriterator
	Field tippdestpileiterator:TLink=Null'primäriterator
	
	Field autoplaysourpileiterator:TLink=Null
	Field autoplaysourcarditerator:TLink=Null
	Field autoplaydestpileiterator:TLink=Null

	Field automovesourpileiterator:TLink=Null
	Field automovesourcarditerator:TLink=Null
	Field automovedestpileiterator:TLink=Null

	Field clickplaysourpileiterator:TLink=Null
	Field clickplaysourcarditerator:TLink=Null
	Field clickplaydestpileiterator:TLink=Null
	
	Field foundlist:TList=Null
	Field foundsour:_pile=Null
	Field founddest:_pile=Null
	Field founddestposition:TList=Null
	Field founddestcard:TList=Null	
	
	
	
	'private not for storage
	Field loadprocuii=0
	Field loadprocpc=0	
	Field automoveundodelay:Int=False
	Field automoveundostart#=0
	Method New()
				animationlist=CreateList()
				cardlist=CreateList()
				pilelist=CreateList()
				drawlist=CreateList()
				picklist=CreateList()
				tipplist=CreateList()
				undolist=CreateList()
				undoiterator=Null
				pilefoundationlist=CreateList()
				pilefreecelllist=CreateList()
				pilereservelist=CreateList()
				pilepyramidlist=CreateList()
				pilelabyrinthlist=CreateList()
				pilesweetmatchlist=CreateList()
				For Local i=0 To 9 
				 cameraposition[i]=New _vector3;cameraposition[i].set(0,0,-39)
				 camerapositionmenu[i]=New _vector3;camerapositionmenu[i].set(3,1,-50)
				 camerapositionpreview[i]=New _vector3;camerapositionpreview[i].set(0,4,-120)
				
				 cameraview[i]=New _vector3;cameraview[i].set(0,0,2)
				 cameraviewmenu[i]=New _vector3;cameraviewmenu[i].set(0,0,2)
				 cameraviewpreview[i]=New _vector3;cameraviewpreview[i].set(0,0,2)

				 cameraside[i]=New _vector3;cameraside[i].set(1,0,0)
				 camerasidemenu[i]=New _vector3;camerasidemenu[i].set(1,0,0)
				 camerasidepreview[i]=New _vector3;camerasidepreview[i].set(1,0,0)

				 cameraup[i]=New _vector3;cameraup[i].set(0,1,0)
				 cameraupmenu[i]=New _vector3;cameraupmenu[i].set(0,1,0)
				 camerauppreview[i]=New _vector3;camerauppreview[i].set(0,1,0)
				Next
				
				position=New _vector3
				vector[0]=New _vector3
				vector[1]=New _vector3
				position.set(3,0,0)
				vector[0].set(13,0,0)
				vector[1].set(0,21,0)
				music=Rand(0,2)
				SeedRnd(MilliSecs())
				foundlist=CreateList()
				founddestposition=CreateList()
				founddestcard=CreateList()
				EndMethod
	Method Delete()
				EndMethod	
	Method init(s:_solitaire,mode=0)Abstract	
	Method deinit()
				'ganz sauber entfernen die listenknoten 
				'der _storeable - basen 
				Local cc=0
				clearstoreablelink()
				cc:+1
				For Local cit:_card=EachIn cardlist
				 cit.clearstoreablelink()
				 cc:+1
				Next
				For Local pit:_pile=EachIn pilelist
				 pit.clearstoreablelink()
				 cc:+1
				 For Local cit:_card=EachIn pit.cardlist
				  cit.clearstoreablelink()
				  cc:+1
				 Next
				Next
				For Local ait:_animation=EachIn animationlist
				 ait.clearstoreablelink()
				 cc:+1
				 Local au:_animationundo=_animationundo(ait)
				 If au
				  For Local eit:_animationundoentry=EachIn au.list
				   eit.clearstoreablelink()
				   cc:+1
				  Next
				 EndIf
				Next
				For Local uit:_animationundo=EachIn undolist
				 uit.clearstoreablelink()
				 cc:+1
				 For Local eit:_animationundoentry=EachIn uit.List
				  eit.clearstoreablelink()
				  cc:+1
				 Next
				Next
				Print "game::deinit() : Es wurden "+cc+" Storablelinks gelöscht."
				'--------------------------------------
				'For Local c:_card=EachIn drawlist
				' c.clearshadow()
				'Next
				Local c:_card
				For c=EachIn cardlist
				 c.clearshadow()
				Next
				For Local pit:_pile=EachIn pilelist
				 For c=EachIn pit.cardlist
				  c.clearshadow()
				 Next
				Next
				animationlist.clear()
				If preview=False solitaire.takestats()
				pilesweetmatchlist.clear()
				pilelist.clear()
				EndMethod			
	Method initgame(s:_solitaire,m,i)
				solitaire=s
				mode=m
				index=i
				animationlist.clear()
				disableallrules()
				clearcards()
				EndMethod
	Method startusing()
				solitaire.adjustcamera()
				
				If inuse=False And ended=False
				 inuse=True
				 
				 'statsentry=solitaire.createstatsentry()
				 starttime=solitaire.clock.ms()
				 statsclosed=False
				 discards=0
				 time=0
				 moves=0
				 undos=0
				 tipps=0
				EndIf
				EndMethod
	Method endusing()
				EndMethod				
	Method score:Float()
				Return(discards+Float(1)/Float(1+time))				
				EndMethod						
	Method disableallrules()
				'tableau pile rule states
				pilegivesamesuit=False
				pilegivealteratecolor=False
				pilegivedescending=False
				pilegiveascending=False
				piletakesamesuit=False
				piletakealteratecolor=False
				piletakedescending=False
				piletakeascending=False
				piletakeemptysuit=-1
				piletakeemptynumber=-1
				'foundation rule states
				foundationdescending=False
				foundationascending=False
				foundationboth=False
				foundationbothwrapped=False
				foundationpickrestriction=False
				'freecell rule states
				freecellpickrestriction=False
				'redeal rules
				redealvalue=-1
				redealcount=0
				EndMethod
	Method startanimation()
				For Local ait:_animation=EachIn animationlist
				 ait.start()
				Next
				
				EndMethod			
	Method skipanimation()
				Local a:_animation
				If animationlist.firstlink()
				 a=_animation(animationlist.firstlink().value())
				 If a
				  If a.started
				   a.skipcurvingcards()
				   a.skip()
				   a.checkend()
				   RemoveLink(animationlist.firstlink())
				  EndIf
				 EndIf
				EndIf
				While animationlist.firstlink()
				 a=_animation(animationlist.firstlink().value())
				 a.start()
				 a.skip()
				 a.checkend()
				 RemoveLink(animationlist.firstlink())
				Wend
				'end of preparative animation
				'pyramide initialisation
				For Local pit:_pile=EachIn pilelist
				 Local pp:_pilepyramid=_pilepyramid(pit)
				 If pp
				  pp.initcardpyramid()
				 EndIf
			    Next
				
				EndMethod				
	Method createpiletableau:_piletableau(count:Int,px#,py#,dx#=-1,dy#=0)
				If tableau=Null
				 tableau=New _tableau
				 tableau.init(Self)
				EndIf
				If dx=-1 dx=tabx
				Local pt:_piletableau=Null
				For Local i=0 To count-1
				 Local pit:_piletableau=New _piletableau
				 pit.init(tableau,px+Float(i)*dx,py+Float(i)*dy)
				 pt=pit
				Next
				Return(pt)
				EndMethod	
	Method createpilecruel:_pilecruel(px#,py#)
				If tableau=Null
				 tableau=New _tableau
				 tableau.init(Self)
				EndIf
				Local pit:_pilecruel=New _pilecruel
				pit.init(tableau,px,py)
				Return(pit)
				EndMethod		
	Method createpileacesup:_pileacesup(px#,py#)
				If tableau=Null
				 tableau=New _tableau
				 tableau.init(Self)
				EndIf
				Local pit:_pileacesup=New _pileacesup
				pit.init(tableau,px,py)
				Return(pit)
				EndMethod	
	Method createpilebethoral:_pilebethoral(px#,py#)
				If tableau=Null
				 tableau=New _tableau
				 tableau.init(Self)
				EndIf
				Local pit:_pilebethoral=New _pilebethoral
				pit.init(tableau,px,py)
				Return(pit)
				EndMethod	
	Method createpileblanket:_pileblanket(px#,py#)
				If tableau=Null
				 tableau=New _tableau
				 tableau.init(Self)
				EndIf
				Local pit:_pileblanket=New _pileblanket
				pit.init(tableau,px,py)
				Return(pit)
				EndMethod
	Method createpilestock:_pilestock(px#,py#,tpc,twc,tfc=0,tlc=False)
				pilestock=New _pilestock
				pilestock.init(Self,px,py,tpc,twc,tfc,tlc)
				Return(pilestock)
				EndMethod	
	Method createpilestockpyramid:_pilestockpyramid(px#,py#)
				pilestock=New _pilestockpyramid
				pilestock.init(Self,px,py,0,1,0,False)
				Return(_pilestockpyramid(pilestock))
				EndMethod	
	Method createpileredeal:_pileredeal(px#,py#,counts=4)
				pileredeal=New _pileredeal
				pileredeal.init(Self,px,py,counts)
				Return(pileredeal)
				EndMethod
	Method createpilereserve:_pilereserve(px#,py#)
				Local p:_pilereserve=New _pilereserve
				p.init(Self,px,py)
				Return(p)
				EndMethod				
	Method createpilewaste:_pilewaste(px#,py#)
				pilewaste=New _pilewaste
				pilewaste.init(Self,px,py)
				Return(pilewaste)
				EndMethod
	Method createpilewastepyramid:_pilewastepyramid(px#,py#)
				pilewaste=New _pilewastepyramid
				pilewaste.init(Self,px,py)
				Return(_pilewastepyramid(pilewaste))
				EndMethod
	Method createpilefoundation:_pilefoundation(px#,py#)
				Local p:_pilefoundation=New _pilefoundation
				p.init(Self,px,py)
				Return(p)
				EndMethod
	Method createpilefreecell:_pilefreecell(px#,py#,suit:Int=-1)
				Local p:_pilefreecell=New _pilefreecell
				p.init(Self,px,py,suit)
				Return(p)
				EndMethod
	Method createpilediscard:_pilediscard(px#,py#)
				pilediscard=New _pilediscard
				pilediscard.init(Self,px,py)
				Return(pilediscard)
				EndMethod
	Method createpilepyramid:_pilepyramid(px#,py#)
				Local p:_pilepyramid=New _pilepyramid
				p.init(Self,px,py)
				Return(p)
				EndMethod
	Method createpilelabyrinth:_pilelabyrinth(px#,py#,dimx,dimy)
				Local p:_pilelabyrinth=New _pilelabyrinth
				p.init(Self,px,py,dimx,dimy)
				Return(p)
				EndMethod			
	Method createpilesweetmatch:_pilesweetmatch(px#,py#,dimx,dimy)
				Local p:_pilesweetmatch=New _pilesweetmatch
				p.init(Self,px,py,dimx,dimy)
				Return(p)
				EndMethod						
	Method clearcards()
	 			cardlist.clear()				
				EndMethod
	Method createcards(deckscount=1,suit=0)				
				Local cit:_card
				For Local deck=0 To deckscount-1
				 For Local number=0 To 12
				  cit=New _card
				  cit.init(solitaire,Self,suit,number)
				 ' cit.vx.mul(-1)
				  cit.insertgame()
				 Next
				Next
				EndMethod
	Method createcard(suit,number)				
				Local cit:_card
				cit=New _card
				cit.init(solitaire,Self,suit,number)
				cit.insertgame()
				EndMethod
	Method clearcard(index)
				Local c:_card=card(index)
				c.deinsertgame()
				EndMethod				
	Method piletableau:_piletableau(index)
				If tableau
				 Local i=0
				 For Local pt:_piletableau=EachIn tableau.pilelist
				  If i=index Return(pt)
				  i:+1
				 Next
				EndIf
				Return(Null)
				EndMethod		
	Method pilelabyrinth:_pilelabyrinth(index)
				Local i=0
				For Local pl:_pilelabyrinth=EachIn pilelabyrinthlist
				 If i=index Return(pl)
				 i:+1
				Next
				Return(Null)
				EndMethod	
	Method pilefoundation:_pilefoundation(index)
				Local i=0
				For Local pl:_pilefoundation=EachIn pilefoundationlist
				 If i=index Return(pl)
				 i:+1
				Next
				Return(Null)
				EndMethod							
	Method pilesweetmatch:_pilesweetmatch(index)
				Local i=0
				For Local pl:_pilesweetmatch=EachIn pilesweetmatchlist
				 If i=index Return(pl)
				 i:+1
				Next
				Return(Null)
				EndMethod		
	Method pilereserve:_pilereserve(index)
				Local i=0
				For Local pr:_pilereserve=EachIn pilereservelist
				 If i=index Return(pr)
				 i:+1
				Next
				Return(Null)
				EndMethod		
	Method hasfreecells:Int()
				If pilefreecelllist.count()>0 Return(True) Else Return(False)
				EndMethod				
	Method countfreefreecells:Int()
				Local c=0
				For Local pf:_pilefreecell=EachIn pilefreecelllist
				 If pf.cardlist.count()=0 c:+1
				Next
				Return(c)
				EndMethod				
	Method cardposition(px#,py#,pz#)
				Local i#=0
				For Local card:_card=EachIn cardlist
				 card.position.set(px,py,pz+i)
				 card.updatemesh()
				 card.updateshadow()
				 i:-solitaire.cardthickness
 			    Next
				EndMethod						
	Method shufflecards(imin=0,imax=-1)
				Local c=cardlist.count()
				Local inmin=imin	
				Local inmax=imax
				If inmax=-1 inmax=c-1
				Local temp:_card[]=New _card[c]
				Local i0,i1
				Local index=0
				Local cit:_card
				For cit=EachIn cardlist
				 temp[index]=cit
				 index:+1
				Next
				Local t=cardlist.count()*10*solitaire.difficulty
				If t>0
				 For Local n=0 To t
				  i0=Rand(inmin,inmax)
				  i1=Rand(inmin,inmax)
				  If i1<>i0
				   cit=temp[i0]
				   temp[i0]=temp[i1]
				   temp[i1]=cit
				  EndIf
				 Next
				EndIf
				Local newlist:TList=CreateList()
				For index=0 To c-1
				 temp[index].gamelink=newlist.addlast(temp[index])
				Next
				cardlist=newlist
				EndMethod
	Method card:_card(index)
				Local i=0
				Local cit:_card=Null
				For cit=EachIn cardlist
				 If i=index Return(cit)
				 i:+1
				Next
				EndMethod					
	Method swapcards(i0,i1)
				Local n
				Local t:_texture
				Local c0:_card=card(i0)
				Local c1:_card=card(i1)
				n=c0.suit
				c0.suit=c1.suit
				c1.suit=n
				n=c0.number
				c0.number=c1.number
				c1.number=n
				Local p0:_polygon=_polygon(c0.mesh.polygonlist.firstlink().value())
				Local p1:_polygon=_polygon(c1.mesh.polygonlist.firstlink().value())
				For Local i=0 To 1
				 For Local j=0 To 3 
				  t=p0.texture[i,j]
				  p0.texture[i,j]=p1.texture[i,j]
				  p1.texture[i,j]=t
				 Next
				Next
				EndMethod				 				
	Method givecardtableau(pileindex:Int,cardcount:Int)
				'give the first cardcount cards to the tableau pile with pileindex
				If tableau
				 Local pile:_pile=tableau.pile(pileindex)
				 Local i=0
				 Local l:TLink=Null
				 Local card:_card=Null
				 If pile
				  For i=0 To cardcount-1
				   l=cardlist.firstlink()
				   If l
				    card=_card(l.value())
				    card.deinsertgame()
				    card.insertpile(pile,True)
					card.position.copy(pile.position)
					card.position.z:-solitaire.cardthickness*Float(pile.cardlist.count())
					card.vx.mul(-1)
					card.updatemesh()
				   Else
				    'error
				    Print "ERROR : _game::givecardstableau : no cards in game's card list"
				   EndIf
				  Next
				 Else
				  Print "ERROR : _game::givecardstableau : no pile with index "+pileindex+" on tableau"
				 EndIf
				EndIf
				EndMethod			
	Method givecardstock(cardcount:Int)
				'give the first cardcount cards to the stockpile
				
				If pilestock
				' Local pile:_pile=tableau.pile(pileindex)
				 Local i=0
				 Local l:TLink=Null
				 Local card:_card=Null
				 For i=0 To cardcount-1
				  l=cardlist.firstlink()
				  If l
				   card=_card(l.value())
				   card.deinsertgame()
				   card.insertpile(pilestock,True)
				   card.position.copy(pilestock.position)
				   card.position.z:-solitaire.cardthickness*Float(pilestock.cardlist.count())
				   card.vx.mul(-1)
				   card.updatemesh()
				  Else
				   'error
				   Print "ERROR : _game::givecardstableau : no cards in game's card list"
				  EndIf
				 Next
				EndIf
				EndMethod			
	Method cardcount:Int()'returns the total count of cards in the game
				Local c=0
				For Local pit:_pile=EachIn pilelist
				 c:+pit.cardcount()
				Next
				'If tableau c:+tableau.cardcount()
				'If pilestock c:+pilestock.cardcount()
				'If pilediscard c:+pilediscard.cardcount()				
				'If pilewaste c:+pilewaste.cardcount()
				'For Local pfit:_pilefoundation=EachIn pilefoundationlist
				' c:+pfit.cardcount()
				'Next
				'For Local pcit:_pilefreecell=EachIn pilefreecelllist
				' pcit.draw(gra,cam)
				'Next
				Return(c)
				EndMethod
	Method checkend:Int()
				'If pilediscard If pilediscard.cardcount()=cardcount()
				' ended=True
				' Return(True)
				'EndIf
				
				If discards=gametypediscards[solitaire.cur_game] And ended=False
				 'Print "checkend"
				 'statsclosed=True
				 ended=True
				 If preview=False solitaire.takestats()
				
				 Return(True)
				EndIf
				Return(False)
				EndMethod
	Method drawpile(gra:_graphics,cam:_camera)
				For Local pit:_pile=EachIn pilelist
				 pit.draw(gra,cam)
				Next	
				EndMethod
	Method draw(gra:_graphics,cam:_camera)
				drawlist.sort()
				For Local c:_polygon=EachIn drawlist
				 c.draw(gra,cam)
				Next
				EndMethod
	Method animate(c:_clock,keypress)
	   			If inner() And MouseDown(1) And allowpick startusing()
				If statsclosed=False 
				 If solitaire.paused=False time=solitaire.clock.ms()-starttime
				 discards=0'will be add be eachin pile now later
				EndIf
				If animationlist.firstlink()'process the animations, all inputs must be blocked
				 'Print "aa"
				 'Local au:_animationundo=_animationundo(animationlist.firstlink().value())
				 Local skip=False
				 If (((MouseDown(0) Or MouseDown(1)) And inner()) Or keypress<>0) And solitaire.cam.position.equal(cameraposition[mode],nearzero) And allowpick 'And au=Null
				  skip=True
				  Local a:_animation=_animation(animationlist.firstlink().value())
				  If a.skipable=False skip=False
				 EndIf
				 If skip
				  skipanimation()
				 Else
				  Local a:_animation=_animation(animationlist.firstlink().value())
				  a.start()
				  If a.animate()=False 
				   'Print "animate ended"
				   RemoveLink animationlist.firstlink()
				   If animationlist.firstlink()
				    a=_animation(animationlist.firstlink().value())
				    a.start()
				   Else
				    'end of preparative animation
				    'pyramide initialisation
				    For Local pit:_pile=EachIn pilelist
					 Local pp:_pilepyramid=_pilepyramid(pit)
					 If pp
					  pp.initcardpyramid()
				 	 EndIf
				    Next
				   EndIf
				  EndIf
				 EndIf
				EndIf


				'-------------------------------------- tipp animation ---------------------------------------
				For Local cit:_card=EachIn tipplist
				 cit.animatecurve()
				 cit.animatenaturality()
				 cit.updatelighting()
				 cit.updatemesh()
				 cit.updateshadow()
				 cit.opacity=cit.curveopacity.calculate(cit.curvepositiont)
				 If cit.opacity>1 cit.opacity=1 
				 If cit.opacity<0 cit.opacity=0 
				 cit.cardcontrolopacity.opacity=1-cit.opacity
				 
				Next
				'-------------------------------------- tipp destruction ---------------------------------------
				 Local wit:TLink=Null
				 Local wn:TLink=Null
				 wit=tipplist.firstlink()
				 If wit
				  Repeat
				   Local cit:_card=_card(wit.value())
				   If cit.curving=False
				    wn=wit.nextlink()
				    cit.clear()
			        wit=wn
				    If tipplist.count()=0 wit=Null
				   Else
				    wit=wit.nextlink()
				   EndIf
				  Until wit=Null
				 EndIf
				
				
				'------------------------------------ PICKLISTTRANSFORMATION --------------------------------				
				Local g#=(-4-solitaire.cam.position.z)/solitaire.mousevector.z
				Local ix#=solitaire.cam.position.x + g*solitaire.mousevector.x
				Local iy#=solitaire.cam.position.y + g*solitaire.mousevector.y
				Local i#=0
				Local wirk#=0.5
				Local wiri#=1-wirk
				Local df#=0.1/Float(picklist.count())
				Local lit:TLink=picklist.firstlink()
				Local offy#=solitaire.cardheight/3'Float(picklist.count())*cardtableaushift
				Local ff#=0
				If lit
				 Repeat
				  Local c:_card=_card(lit.value())
				  ff:-df
				  If c.pickending=False 
				   If solitaire.mouseovercard c.neigungx=-(pickneigungx*0.1-c.neigungx*0.9)
				   If solitaire.pointandclick
				    c.position.z=Float(-2-solitaire.cardtableaulift-i*solitaire.cardthickness)*(wirk)+c.position.z*(wiri)
				   Else 
				    c.position.set(ix*(wirk+ff)+c.position.x*(wiri-ff),..
	                (((-i*cardtableaushift)+iy)-offy)*(wirk+ff)+c.position.y*(wiri-ff),..
  		            Float(-4-solitaire.cardtableaulift-i*solitaire.cardthickness)*(wirk)+c.position.z*(wiri))
 				   EndIf
				   c.vy.set(0,..
				   solitaire.cardheight,..
  		           (-solitaire.cardslope*wirk)+c.vy.z*(wiri))
				   'c.vy.norm()
				   'c.vy.mul(cardheight)
				   'c.normcardplane()
				  EndIf
				  i:+1
				  lit=lit.nextlink()
				 Until lit=Null
				EndIf
				'------------------------------------ PICKLISTANIMATION --------------------------------				
				If animationlist.firstlink()=Null

				 Local drop=False
				 If solitaire.pointandclick
				  If pickstate=2
				   If MouseDown(1)
				    pickstate=0
				    drop=True
				   EndIf
				  EndIf				  
				 Else
				  If MouseDown(1)=False drop=True
				 EndIf
				 
				
				 If drop
				  For Local card:_card=EachIn picklist
				   If card.pickending=False 
				    If card.pile.inner()
				     'rint "ai0" 
				     Local pp:_pilepyramid=_pilepyramid(card.pile)
				     If pp=Null
				      'rint "pile not pyramid and own"				      
				      Local pk:_pileblanket=_pileblanket(card.pile)
				      Local ps:_pilesweetmatch=_pilesweetmatch(card.pile)
				      If pk=Null And ps=Null
				       card.depick(c)
				      Else
				       If pk
				        If pk.candrop(picklist)
				         pk.drop(c)
					    Else
					     card.depick(c)
				        EndIf
				       EndIf
				       If ps
				        If ps.candrop(picklist)
				         ps.drop(c)
					    Else
					     card.depick(c)
				        EndIf
				       EndIf
				       
				      EndIf
				     Else
				      If pp.candrop(picklist)
				       pp.drop(c)
					  Else
					   card.depick(c)
				      EndIf
					 EndIf
				    Else
				     'check other piles
				     Local dr=False
				     For Local pit:_pile=EachIn pilelist
				      If pit<>card.pile
					   If pit.inner()
				        If(pit.candrop(picklist))
				         If dr=False 
	 			          pit.drop(c)
		 		          dr=True
			 	 	     EndIf
				        EndIf
				 	   EndIf
				      EndIf
				     Next
				     If dr=False card.depick(c)
				    EndIf
				   EndIf
				  Next
				 EndIf
				
				 If solitaire.pointandclick
				  If pickstate=1
				   If MouseDown(1)=False pickstate=2
				  EndIf 
				  If pickstate=0
				   If MouseDown(1)
				   Local ps1=False
				   For Local cit:_card=EachIn picklist
				    If cit.picked=True And cit.pickending=False ps1=True
				   Next
				   If ps1 pickstate=1
				   EndIf
				  EndIf
				 EndIf
				
				
				
				EndIf			
				
				For Local pit:_pile=EachIn pilelist
				 pit.animate(c)
				Next
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next				
					
				'--------------------------------------- auto moves -----------------------------------------
				If automoveundodelay=False
				 automove()
				Else
				 If solitaire.clock.ms()-automoveundostart>3500 automoveundodelay=False
				EndIf
				'-------------------------------- END CHECKING ---------------------------------
				checkend()
				EndMethod
	Method canpick:Int()
				For Local c:_card=EachIn picklist
				 If c.picked=True Return(False)
				Next
				
				If cardcurving() Return(False)
				Return(True)
				EndMethod				
	Method deinsertpick()
				While(picklist.firstlink())
				 Local l:TLink=picklist.firstlink()
				 Local c:_card=_card(l.value())
				 c.deinsertpick()
				Wend
				EndMethod				
	Method update()
				'update all
				For Local pit:_pile=EachIn pilelist
				 pit.updatecardmesh()
				 pit.updatemesh()
				Next
				'startanimation()
				EndMethod
	Method updateplane()				
				'update game geometric plane
				Local x0#=1000,x1#=-1000
				Local y0#=1000,y1#=-1000
				Local cw2#=solitaire.cardwidth/2
				Local ch2#=solitaire.cardheight/2
				For Local pit:_pile=EachIn pilelist
				 If pit.position.x+cw2>x1 x1=pit.position.x+cw2
				 If pit.position.x-cw2<x0 x0=pit.position.x-cw2
				 If pit.position.y+ch2>y1 y1=pit.position.y+ch2
				 If pit.position.y-ch2<y0 y0=pit.position.y-ch2
				 For Local cit:_card=EachIn pit.cardlist
				  If cit.position.x+cw2>x1 x1=cit.position.x+cw2
				  If cit.position.x-cw2<x0 x0=cit.position.x-cw2
				  If cit.position.y+ch2>y1 y1=cit.position.y+ch2
				  If cit.position.y-ch2<y0 y0=cit.position.y-ch2
				 Next
				Next
				Local xm#=(x0+x1)/2
				Local ym#=(y0+y1)/2
				position.set(xm,ym,0)
				vector[0].set((x1-x0)/2,0,0)
				vector[1].set(0,(y1-y0)/2,0)
				EndMethod
	Method inner:Int()	
				Local a#
				Local b#
				Local vxh:_vector3=New _vector3
				Local vyh:_vector3=New _vector3
				Local mvn:_vector3=New _vector3
				Local e:_vector3=New _vector3
				vxh.copy(vector[0])
				vyh.copy(vector[1])
				mvn.copy(solitaire.mousevector)
				mvn.mul(-1)
				e.copy(solitaire.cam.position)
				e.sub(position)
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
	Method createshadow()
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  cit.createshadow()
				 Next
				Next
				EndMethod		
	Method sigmadiffuse(sd#)						
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  cit.mesh.sigmadiffuse(sd)
				 Next
				Next
				EndMethod		
	Method updatetexture()
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  Local poly:_polygon=_polygon(cit.mesh.polygonlist.firstlink().value())
				  poly.texture[0,0]=solitaire.tcard[solitaire.cardtexturefrontindex,cit.suit+cit.number*4]
			 	  poly.texture[1,0]=solitaire.tcardback[solitaire.cardtexturebackindex]				
				 Next
				Next
				For Local cit:_card=EachIn cardlist
				 Local poly:_polygon=_polygon(cit.mesh.polygonlist.firstlink().value())
				 poly.texture[0,0]=solitaire.tcard[solitaire.cardtexturefrontindex,cit.suit+cit.number*4]
			 	 poly.texture[1,0]=solitaire.tcardback[solitaire.cardtexturebackindex]				
				Next
				EndMethod
	Method updatenaturality()
				Local sn#=solitaire.naturalpiles*0.2
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  cit.rotationmust=Rnd(-solitaire.naturalpiles*5,solitaire.naturalpiles*5)
				  cit.shiftmust.set(Rnd(-sn,+sn),Rnd(-sn,+sn))
				 Next
				Next
				For Local cit:_card=EachIn cardlist
				 cit.rotationmust=Rnd(-solitaire.naturalpiles*5,solitaire.naturalpiles*5)
				 cit.shiftmust.set(Rnd(-sn,+sn),Rnd(-sn,+sn))
				Next
				EndMethod

	Method tipp()
				EndMethod
	Method autoplay()
				EndMethod
	Method automove()
				EndMethod
	Method clickplay(card:_card)
				EndMethod
	Method createundo:_animationundo(spd#,intv#,reverseiteration=False)
				'achtung alles löschen was nach dem aktuellen iterator kommt
				If undoiterator
				 While (undolist.lastlink()<>undoiterator)
				  RemoveLink undolist.lastlink()
				 Wend
				Else
				 undolist.clear()
				EndIf
				Local u:_animationundo=New _animationundo
				u.init(Self,spd,intv,reverseiteration)
				u.deinsertgame()'animation deinsert
				undoiterator=u.link
				If statsclosed=False moves:+1
				Return(u)
				EndMethod	 
	Method undo()
				If cardcurving()=False
				 If undoiterator
				  playundo(False)
				  If statsclosed=False undos:+1
				  undoiterator=undoiterator.prevlink()'achtung wird null
				 EndIf
				EndIf
				EndMethod
	Method redo()
				If cardcurving()=False
				 If undoiterator=Null 
				  undoiterator=undolist.firstlink()
		          playundo(True)
				 Else
				  If undoiterator.nextlink()
			 	   undoiterator=undoiterator.nextlink()
			       playundo(True)
			      EndIf
			     EndIf
				EndIf
				EndMethod	
	Method playundo(forward=True)
				If undoiterator
				 Local undo:_animationundo=_animationundo(undoiterator.value())
				 undo.forward=forward
				 undo.insertgame()
				 undo.started=False
				 undo.start()
				 automoveundodelay=True
				 automoveundostart=solitaire.clock.ms()
				EndIf
				EndMethod				
	Method cardcurving:Int()
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  If cit.curving Return(True)
				 Next
				Next
				'check the complete movelist for cards that are in move
				'For Local uit:_animationundo=EachIn undolist
				' For Local eit:_animationundoentry=EachIn uit.list
				'  If eit.card.curving Return(True)
				' Next
				'Next
				Return(False)
				EndMethod		
	Method activeanimationbutundo:Int()'returns true, if an not-undo-animation is active
				Local ja=True
				If animationlist.firstlink()=Null 
				 ja=False
				Else
				 Local a:_animationundo=_animationundo(animationlist.firstlink().value())
				 If a ja=False
				EndIf
				Return(ja)
				EndMethod
	'--------------------------------------- GENERAL TIPPS -----------------------------------------------------				
	Method tipptableaucompleterowpile:Int(ps:_piletableau)
				Local c:_card=Null
				Local cp=False
				Local cit:TLink=ps.cardlist.firstlink()
				For Local i=0 To 11
				 If cit cit=cit.nextlink()
				Next
				If cit
				 c=_card(cit.value())
				
				 If c.number<>12 Return(False)
				
				 Local iit:TLink=cit
				 For Local i=12 To 0 Step -1
				  Local cc:_card=_card(iit.value())
				  If i<>cc.number Return(False)
				  iit=iit.prevlink()
				 Next
				
				 If c.canpick()
				  cp=True
				  foundlist.clear()
				  Local iit:TLink=c.pilelink
				  Repeat
				   foundlist.addlast(_card(iit.value()))
				   iit=iit.prevlink()
				  Until iit=Null
				 EndIf
				EndIf
				Return(cp)
				EndMethod
	Method tipptableaucompleterow:Int()
				If pilediscard
				 foundlist.clear()
				 Local ps:_piletableau=Null
				 ps=Null
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  If tipptableaucompleterowpile(pit) ps=pit
				 Next
				 If ps 
				  foundsour=ps
				  founddest=pilediscard
				  Return(True) 
				 Else 
			 	  Return(False)
				 EndIf
				EndIf
				Return(False)
				EndMethod		
	Method tippexecutecompleterow()								
				Local i#=0'foundlist.count()
				For Local card:_card=EachIn foundlist
				 Local cn:_card=New _card
				 cn.copy(card)
				 Local vn:_vector3=New _vector3
				 Local t0:_vector3=New _vector3
				 Local t1:_vector3=New _vector3
				 Local t:_vector3=New _vector3
				 t0.set(0,0,-20-i*2)
				 t1.set(0,0,0)
				 t.set(0,0,-solitaire.cardthickness)
				 t.mul(i)
				 t.add(pilediscard.dropposition())
				 cn.curveposition.setvector(cn.position,t,t0,t1)
				 cn.curvevx.setvector(cn.vx,pilediscard.dropvx(),vn,vn)
				 cn.curvevy.setvector(cn.vy,pilediscard.dropvy(),vn,vn)
				 cn.curvespeed=40
				 cn.startcurve(solitaire.clock)
				 cn.tipplink=tipplist.addlast(cn)
				 cn.cardcontrolopacity=card
				 cn.curveopacity.set(0,0,2,-10)
				 i:+1
				Next
				EndMethod
	Method tipptableauturn:Int()
				foundlist.clear()
				foundsour=Null
				founddest=Null
				For Local pit:_piletableau=EachIn tableau.pilelist
				 Local l:TLink=pit.cardlist.firstlink()
				 If l
				  Local c:_card=_card(l.value())
				  If c.turnedup()=False
				   foundlist.clear()
				   foundlist.addlast(c)
				   founddest=c.pile
				   foundsour=c.pile 
				  EndIf
				 EndIf
				Next
				If founddest Return(True) Else Return(False)
				EndMethod		
	Method tippexecuteturn()
				For Local card:_card=EachIn foundlist
				 Local cn:_card=New _card
				 cn.copy(card)
				 Local v:_vector3=card.pile.dropposition()
				 cn.curvespeed=solitaire.autospeed/2
				 cn.curveposition.set(cn.position.x,cn.position.y,cn.position.z, v.x,v.y,v.z-1, 0,0,-10,0,0,10)
			 	 cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,10 ,0,0,-10)  
			 	 cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z-solitaire.cardslope, 0,0,0 ,0,0,0)  
				 cn.tipplink=tipplist.addlast(cn)
				 cn.cardcontrolopacity=card
				 cn.curveopacity.set(0,0,2,-10)
				 cn.startcurve(solitaire.clock)
				Next
				EndMethod				

	Method tipptableauemptypile:Int()
				foundlist.clear()
				foundsour=Null
				founddest=Null
				For Local pit:_piletableau=EachIn tableau.pilelist
				 If pit.cardlist.firstlink()=Null And founddest=Null
				  founddest=pit
				 EndIf
				Next
				If founddest
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  If foundsour=Null And pit<>foundsour
				   Local it:TLink=pit.cardlist.lastlink()
				   If it
					Local c:_card=_card(it.value())				
				    If c.turnedup()=False
				     Local stop=False
				     Repeat
				      c=_card(it.value())
				      If c.turnedup() stop=True Else it=it.prevlink()
				     Until it=Null Or stop
				     If it
				      'es gibt eine karte, die 
				      'nach einer verdeckten Karte nun umgedreht ist
					  c=_card(it.value())
					  If c.canpick()
					   foundlist.clear()
					   Local it:TLink=c.pilelink
					   Repeat
					    foundlist.addlast(_card(it.value()))
					    it=it.prevlink()
				 	   Until it=Null
					   If founddest.candrop(foundlist)
					    foundsour=pit
					    Return(True)
					   EndIf
					  EndIf
				 	 EndIf
					EndIf
				   EndIf
				  EndIf
				 Next
				EndIf
				Return(False)					
				EndMethod						


	Method tippinitcombination(iteratorpack)
				Local ps:_piletableau
				Local pf:_piletableau
				If tableau
				 If iteratorpack=0
				  If tippsourpileiterator=Null
				   tippsourpileiterator=tableau.pilelist.firstlink()
				   ps=_piletableau(tippsourpileiterator.value())
				   tippsourcarditerator=ps.cardlist.lastlink()'achtung kann null bleiben
				   tippdestpileiterator=tableau.pilelist.firstlink()
				  EndIf
				 ElseIf iteratorpack=1
				  If autoplaysourpileiterator=Null
				   autoplaysourpileiterator=tableau.pilelist.firstlink()
				   ps=_piletableau(autoplaysourpileiterator.value())
				   autoplaysourcarditerator=ps.cardlist.lastlink()'achtung kann null bleiben
				   autoplaydestpileiterator=tableau.pilelist.firstlink()
				  EndIf
				 ElseIf iteratorpack=2
				  If automovesourpileiterator=Null
				   automovesourpileiterator=tableau.pilelist.firstlink()
				   ps=_piletableau(automovesourpileiterator.value())
				   automovesourcarditerator=ps.cardlist.lastlink()'achtung kann null bleiben
				   automovedestpileiterator=tableau.pilelist.firstlink()
				  EndIf
				 ElseIf iteratorpack=3
				  If clickplaysourpileiterator=Null
				   clickplaysourpileiterator=tableau.pilelist.firstlink()
				   ps=_piletableau(clickplaysourpileiterator.value())
				   clickplaysourcarditerator=ps.cardlist.lastlink()'achtung kann null bleiben
				   clickplaydestpileiterator=tableau.pilelist.firstlink()
				  EndIf
				 EndIf
				EndIf
				EndMethod
	Method tippresetcombination(iteratorpack)
				If iteratorpack=0 tippsourpileiterator=Null
				If iteratorpack=1 autoplaysourpileiterator=Null
				If iteratorpack=2 automovesourpileiterator=Null
				If iteratorpack=3 clickplaysourpileiterator=Null
				tippinitcombination(iteratorpack)
				'Print "reset"+iteratorpack
				EndMethod								
	Method tippiteratecombinationcardwise(iteratorpack)
				Local p:_piletableau
				If iteratorpack=0
				 If tippsourcarditerator tippsourcarditerator=tippsourcarditerator.prevlink()
				 If tippsourcarditerator=Null
				  tippsourpileiterator=tippsourpileiterator.nextlink()
				  If tippsourpileiterator=Null tippsourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(tippsourpileiterator.value())
				  tippsourcarditerator=p.cardlist.lastlink()
				 EndIf
				ElseIf iteratorpack=1
				 If autoplaysourcarditerator autoplaysourcarditerator=autoplaysourcarditerator.prevlink()
				 If autoplaysourcarditerator=Null
				  autoplaysourpileiterator=autoplaysourpileiterator.nextlink()
				  If autoplaysourpileiterator=Null autoplaysourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(autoplaysourpileiterator.value())
				  autoplaysourcarditerator=p.cardlist.lastlink()
				 EndIf
				ElseIf iteratorpack=2
				 If automovesourcarditerator automovesourcarditerator=automovesourcarditerator.prevlink()
				 If automovesourcarditerator=Null
				  automovesourpileiterator=automovesourpileiterator.nextlink()
				  If automovesourpileiterator=Null automovesourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(automovesourpileiterator.value())
				  automovesourcarditerator=p.cardlist.lastlink()
				 EndIf
				ElseIf iteratorpack=3
				 If clickplaysourcarditerator clickplaysourcarditerator=clickplaysourcarditerator.prevlink()
				 If clickplaysourcarditerator=Null
				  clickplaysourpileiterator=clickplaysourpileiterator.nextlink()
				  If clickplaysourpileiterator=Null clickplaysourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(clickplaysourpileiterator.value())
				  clickplaysourcarditerator=p.cardlist.lastlink()
				 EndIf
				EndIf
				
				EndMethod				
	Method tippiteratecombinationpilewise(iteratorpack)
				Local p:_piletableau
				If iteratorpack=0
				 If tippdestpileiterator=Null 
				  tippdestpileiterator=tableau.pilelist.firstlink()
				  tippsourpileiterator=tippsourpileiterator.nextlink()
				  If tippsourpileiterator=Null tippsourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(tippsourpileiterator.value())
				  tippsourcarditerator=p.cardlist.lastlink()
			 	 EndIf
				ElseIf iteratorpack=1
				 If autoplaydestpileiterator=Null 
				  autoplaydestpileiterator=tableau.pilelist.firstlink()
				  autoplaysourpileiterator=autoplaysourpileiterator.nextlink()
				  If autoplaysourpileiterator=Null autoplaysourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(autoplaysourpileiterator.value())
				  autoplaysourcarditerator=p.cardlist.lastlink()
			 	 EndIf
				ElseIf iteratorpack=2
				 If automovedestpileiterator=Null 
				  automovedestpileiterator=tableau.pilelist.firstlink()
				  automovesourpileiterator=automovesourpileiterator.nextlink()
				  If automovesourpileiterator=Null automovesourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(automovesourpileiterator.value())
				  automovesourcarditerator=p.cardlist.lastlink()
			 	 EndIf
				ElseIf iteratorpack=3
				 If clickplaydestpileiterator=Null 
				  clickplaydestpileiterator=tableau.pilelist.firstlink()
				  clickplaysourpileiterator=clickplaysourpileiterator.nextlink()
				  If clickplaysourpileiterator=Null clickplaysourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(clickplaysourpileiterator.value())
				  clickplaysourcarditerator=p.cardlist.lastlink()
			 	 EndIf
				EndIf
				EndMethod
	Method tippiteratecombination(iteratorpack)				
				Local p:_piletableau
				If iteratorpack=0
				 tippdestpileiterator=tippdestpileiterator.nextlink()
				 If tippdestpileiterator=Null 
				  tippdestpileiterator=tableau.pilelist.firstlink()
				  If tippsourcarditerator tippsourcarditerator=tippsourcarditerator.prevlink()
				  If tippsourcarditerator=Null
				   tippsourpileiterator=tippsourpileiterator.nextlink()
				   If tippsourpileiterator=Null tippsourpileiterator=tableau.pilelist.firstlink()
				   p=_piletableau(tippsourpileiterator.value())
				   tippsourcarditerator=p.cardlist.lastlink()
				  EndIf
				 EndIf
				ElseIf iteratorpack=1
				 autoplaydestpileiterator=autoplaydestpileiterator.nextlink()
				 If autoplaydestpileiterator=Null 
				  autoplaydestpileiterator=tableau.pilelist.firstlink()
				  If autoplaysourcarditerator autoplaysourcarditerator=autoplaysourcarditerator.prevlink()
				  If autoplaysourcarditerator=Null
				   autoplaysourpileiterator=autoplaysourpileiterator.nextlink()
				   If autoplaysourpileiterator=Null autoplaysourpileiterator=tableau.pilelist.firstlink()
				   p=_piletableau(autoplaysourpileiterator.value())
				   autoplaysourcarditerator=p.cardlist.lastlink()
				  EndIf
				 EndIf
				ElseIf iteratorpack=2
				 automovedestpileiterator=automovedestpileiterator.nextlink()
				 If automovedestpileiterator=Null 
				  automovedestpileiterator=tableau.pilelist.firstlink()
				  If automovesourcarditerator automovesourcarditerator=automovesourcarditerator.prevlink()
				  If automovesourcarditerator=Null
				   automovesourpileiterator=automovesourpileiterator.nextlink()
				   If automovesourpileiterator=Null automovesourpileiterator=tableau.pilelist.firstlink()
				   p=_piletableau(automovesourpileiterator.value())
				   automovesourcarditerator=p.cardlist.lastlink()
				  EndIf
				 EndIf
				ElseIf iteratorpack=3
				 clickplaydestpileiterator=clickplaydestpileiterator.nextlink()
				 If clickplaydestpileiterator=Null 
				  clickplaydestpileiterator=tableau.pilelist.firstlink()
				  If clickplaysourcarditerator clickplaysourcarditerator=clickplaysourcarditerator.prevlink()
				  If clickplaysourcarditerator=Null
				   clickplaysourpileiterator=clickplaysourpileiterator.nextlink()
				   If clickplaysourpileiterator=Null clickplaysourpileiterator=tableau.pilelist.firstlink()
				   p=_piletableau(clickplaysourpileiterator.value())
				   clickplaysourcarditerator=p.cardlist.lastlink()
				  EndIf
				 EndIf
				EndIf
				EndMethod 
		
	Method tippendedcombinationpilewise:Int(iteratorpack,sourstart:TLink,deststart:TLink)
				If iteratorpack=0
				 If tippsourpileiterator=sourstart And tippdestpileiterator=deststart Return(True) Else Return(False)
				ElseIf iteratorpack=1
				 If autoplaysourpileiterator=sourstart And autoplaydestpileiterator=deststart Return(True) Else Return(False)
				ElseIf iteratorpack=2
				 If automovesourpileiterator=sourstart And automovedestpileiterator=deststart Return(True) Else Return(False)
				ElseIf iteratorpack=3
				 If clickplaysourpileiterator=sourstart And clickplaydestpileiterator=deststart Return(True) Else Return(False)
				EndIf
				EndMethod		
	Method tippendedcombinationcardwise:Int(iteratorpack,sourstart:TLink,cardstart:TLink)
				If iteratorpack=0
				 If tippsourpileiterator=sourstart And tippsourcarditerator=cardstart Return(True) Else Return(False)
				ElseIf iteratorpack=1
				 If autoplaysourpileiterator=sourstart And autoplaysourcarditerator=cardstart Return(True) Else Return(False)
				ElseIf iteratorpack=2
				 If automovesourpileiterator=sourstart And automovesourcarditerator=cardstart Return(True) Else Return(False)
				ElseIf iteratorpack=3
				 If clickplaysourpileiterator=sourstart And clickplaysourcarditerator=cardstart Return(True) Else Return(False)
				EndIf
				EndMethod		
				
	Method tippendedcombination:Int(iteratorpack,sourstart:TLink,cardstart:TLink,deststart:TLink)
				If iteratorpack=0
				 If tippsourpileiterator=sourstart And tippsourcarditerator=cardstart And tippdestpileiterator=deststart Return(True) Else Return(False)
				ElseIf iteratorpack=1
				 If autoplaysourpileiterator=sourstart And autoplaysourcarditerator=cardstart And autoplaydestpileiterator=deststart Return(True) Else Return(False)
				ElseIf iteratorpack=2
				 If automovesourpileiterator=sourstart And automovesourcarditerator=cardstart And automovedestpileiterator=deststart Return(True) Else Return(False)
				ElseIf iteratorpack=3
				 If clickplaysourpileiterator=sourstart And clickplaysourcarditerator=cardstart And clickplaydestpileiterator=deststart Return(True) Else Return(False)
				EndIf
				EndMethod		
	Method tippcanmove(iteratorpack,samesuit,rowgrow)
				Local sourcard:_card=Null 
				Local sourpile:_piletableau=Null		
				Local destpile:_piletableau=Null
				If iteratorpack=0
				 If tippsourcarditerator sourcard=_card(tippsourcarditerator.value())
				 sourpile=_piletableau(tippsourpileiterator.value())
				 destpile=_piletableau(tippdestpileiterator.value())
				ElseIf iteratorpack=1
				 If autoplaysourcarditerator sourcard=_card(autoplaysourcarditerator.value())
				 sourpile=_piletableau(autoplaysourpileiterator.value())
				 destpile=_piletableau(autoplaydestpileiterator.value())
				ElseIf iteratorpack=2
				 If automovesourcarditerator sourcard=_card(automovesourcarditerator.value())
				 sourpile=_piletableau(automovesourpileiterator.value())
				 destpile=_piletableau(automovedestpileiterator.value())
				ElseIf iteratorpack=3
				 If clickplaysourcarditerator sourcard=_card(clickplaysourcarditerator.value())
				 sourpile=_piletableau(clickplaysourpileiterator.value())
				 destpile=_piletableau(clickplaydestpileiterator.value())
				EndIf
				
				Local ft:TList=CreateList()
				foundlist.clear()
				foundsour=Null
				founddest=Null
				If destpile<>sourpile And sourcard
				 If sourcard.canpick()'achtung gilt nicht für umgedrehte Karten turnedup()=false
				  ft.clear()
				  Local iit:TLink=sourcard.pilelink
				  Repeat
				   ft.addlast(_card(iit.value()))
				   iit=iit.prevlink()
				  Until iit=Null
				  If destpile.candrop(ft,samesuit)
				   'nun die längenprüfung
				   Local listen=False	
				
				
				   If rowgrow				
				    Local ls=sourpile.pickrowlengthfromfirst()
				    Local ld=destpile.pickrowlengthfromfirst()
 				    If destpile.cardlist.count()=0'leeres Feld
				     If ft.count()=ls And ft.count()<sourpile.cardlist.count() listen=True
				    Else 
				 	 If ((ft.count()+ld)>ls) listen=True
				    EndIf
				   Else
				    listen=True
				   EndIf
				
				
				   If listen' l.addlast(destpile)
				
				   'If ((ft.count()+ld)>ls) Or (ld=0 And (ft.count()>=ls))
				    founddest=destpile
				    foundsour=sourpile
				    foundlist.clear()
				    For Local cit:_card=EachIn ft
				     foundlist.addlast(cit)
				    Next
				    Return(True)
				   EndIf
  			 	  EndIf
				 EndIf
				EndIf
				Return(False)
				EndMethod				
	Method tipptableau:Int(iteratorpack,samesuit=False,rowgrow=True)
				Local found=False
				tippinitcombination(iteratorpack)
				Local deststart:TLink=Null
				Local sourstart:TLink=Null
				Local cardstart:TLink=Null
				If iteratorpack=0
				 deststart=tippdestpileiterator
				 sourstart=tippsourpileiterator
				 cardstart=tippsourcarditerator
				ElseIf iteratorpack=1
				 deststart=autoplaydestpileiterator
				 sourstart=autoplaysourpileiterator
				 cardstart=autoplaysourcarditerator
				ElseIf iteratorpack=2
				 deststart=automovedestpileiterator
				 sourstart=automovesourpileiterator
				 cardstart=automovesourcarditerator
				ElseIf iteratorpack=3
				 deststart=clickplaydestpileiterator
				 sourstart=clickplaysourpileiterator
				 cardstart=clickplaysourcarditerator
				EndIf
				Repeat
				 If tippcanmove(iteratorpack,samesuit,rowgrow) found=True 
				 tippiteratecombination(iteratorpack)
			 	Until tippendedcombination(iteratorpack,sourstart,cardstart,deststart) Or found
				Return(found)
				EndMethod	
	Method tippexecutemove()				
				Local i#=0
				For Local card:_card=EachIn foundlist
				 Local cn:_card=New _card
				 cn.copy(card)
				 Local vn:_vector3=New _vector3
				 Local t0:_vector3=New _vector3
				 Local t1:_vector3=New _vector3
				 t0.set(0,0,-20)
				 t1.set(0,0,+20)
				 cn.tipplink=tipplist.addlast(cn)
				 Local off:_vector3=New _Vector3
				 off.set(0,-cardtableaushift,-solitaire.cardthickness)
				 off.mul(i)
				 off.add(founddest.dropposition())
				 cn.curveposition.setvector(cn.position,off,t0,t1)
				 cn.curvevx.setvector(cn.vx,founddest.dropvx(),vn,vn)
				 cn.curvevy.setvector(cn.vy,founddest.dropvy(),vn,vn)
				 cn.curvespeed=40
				 cn.startcurve(solitaire.clock)
				 cn.cardcontrolopacity=card
				 cn.curveopacity.set(0,0,2,-5)'vorher -10 statt -5
				 i:+1
				Next
				EndMethod
				Rem	
	Method tippexecuteemptypile()				
				Local i#=0
				For Local card:_card=EachIn foundlist
				 Local cn:_card=New _card
				 cn.copy(card)
				 Local vn:_vector3=New _vector3
				 Local t0:_vector3=New _vector3
				 Local t1:_vector3=New _vector3
				 t0.set(0,0,-20)
				 t1.set(0,0,+20)
				 cn.tipplink=tipplist.addlast(cn)
				 Local off:_vector3=New _Vector3
				 off.set(0,-cardtableaushift,-solitaire.cardthickness)
				 off.mul(i)
				 off.add(founddest.dropposition())
				 cn.curveposition.setvector(cn.position,off,t0,t1)
				 cn.curvevx.setvector(cn.vx,founddest.dropvx(),vn,vn)
				 cn.curvevy.setvector(cn.vy,founddest.dropvy(),vn,vn)
				 cn.curvespeed=40
				 cn.startcurve(solitaire.clock)
				 cn.cardcontrolopacity=card
				 cn.curveopacity.set(0,0,2,-10)
				 i:+1
				Next
				EndMethod				
				EndRem
	Method tippstockpyramid:Int()
				foundlist.clear()
				If pilestock
				 If pilestock.candeal()
				  If pilestock.cardlist.count()>0
				   Local fit:TLink=pilestock.cardlist.firstlink()
			       foundlist.addlast(_card(fit.value()))
			       Return(True)'dealen
				  Else
				   If pilewaste Return(True)'backsort
				  EndIf
				 EndIf
				EndIf
				Return(False)
				EndMethod			
				Rem
	Method tippexecutestockpyramid()				
				If pilestock.cardlist.count()>0
				 Local pit:_pile=pilewaste
				 If pit
				  Local fit:TLink=pilestock.cardlist.firstlink()
				  For Local cw=0 To pilestock.towastecount-1
				   If fit
				    Local card:_card=_card(fit.value())
				    Local cn:_card=New _card
				    cn.copy(card)
				    cn.tipplink=tipplist.addlast(cn)
				    Local v:_vector3=pit.dropposition()
				    cn.curvespeed=solitaire.autospeed*0.5
				    cn.curveposition.o0.copy(cn.position)
				    cn.curveposition.o1.copy(v)
				    cn.curveposition.v0.set( -Float(cw)*7,0,-10)
				    cn.curveposition.v1.set(0,0,10)
				    cn.curveposition.updatelength()
				    If pilestock.open cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, cn.vx.x,cn.vx.y,cn.vx.z, 0,0,-10,0,0,10) Else cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				    cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z, 0,0,-10,0,0,0)
				    cn.startcurve(solitaire.clock)
				    cn.cardcontrolopacity=card
				    cn.curveopacity.set(0,0,2,-10)
				    fit=fit.nextlink()
				   EndIf
		 		  Next
		         EndIf
				Else 
				 If pilestock.canredeal()
				  Local fs#=0
				  For Local card:_card=EachIn pilewaste.cardlist
				   Local cn:_card=New _card
				   cn.copy(card)
				   cn.tipplink=tipplist.addlast(cn)
				   cn.cardcontrolopacity=card
				   cn.curveopacity.set(0,0,2,-10)
				   Local v:_vector3=pilestock.dropposition()
				   cn.curvespeed=solitaire.autospeed*(Float(0.5)/(1+(fs*0.1)))
				   cn.curveposition.set(cn.position.x,cn.position.y,cn.position.z, v.x,v.y,v.z, 0,0,-10-fs,0,0,10+fs)
				   If pilestock.open cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, cn.vx.x,cn.vx.y,cn.vx.z, 0,0,-10,0,0,10) Else cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				   cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z, 0,0,-10,0,0,0)
				   cn.startcurve(solitaire.clock)
				   fs:+1
				  Next
				 EndIf
				EndIf
				EndMethod
				EndRem
				
	Method tippwaste:Int()
				Local found=False
				foundlist.clear()
				If pilewaste 
				 If pilewaste.cardlist.firstlink()
				  Local cw:_card=_card(pilewaste.cardlist.firstlink().value())
				  foundlist.addlast(cw)
				  For Local pit:_piletableau=EachIn tableau.pilelist
				   If found=False And pit.candrop(foundlist)
				    found=True
				    foundsour=pilewaste
				    founddest=pit
				   EndIf
				  Next
				 EndIf
				EndIf
				Return(found)
				EndMethod											
	Method tippstock:Int()
				foundlist.clear()
				If pilestock
				 If pilestock.tolabyrinthcount 
				  If pilestock.cardlist.count()>0
				   Local fit:TLink=pilestock.cardlist.firstlink()
				   Local pl:_pilelabyrinth=pilelabyrinth(0)
				   If pl And pl.hasfreeline()
				    For Local j=0 To pl.dimx-1
				     If fit
				      foundlist.addlast(_card(fit.value()))
				      fit=fit.nextlink()
				     EndIf
				    Next
				   EndIf
				  EndIf
				 EndIf
				 If pilestock.candeal()
				  If pilestock.cardlist.count()>0
				   Local fit:TLink=pilestock.cardlist.firstlink()
				   If pilestock.topilecount>0 And tableau.pilelist.count()>0
				    For Local i=0 To tableau.pilelist.count()-1
				     For Local j=0 To pilestock.topilecount-1
				      'Print "tippstock pc"
				      If fit
				       foundlist.addlast(_card(fit.value()))
				       fit=fit.nextlink()
				      EndIf
				     Next
				    Next 
				   EndIf
				   If pilestock.towastecount>0
				    For Local i=0 To pilestock.towastecount-1
				     'Print "tippstock wc"
				     If fit
				      foundlist.addlast(_card(fit.value()))
				      fit=fit.nextlink()
				     EndIf
				    Next				   
				   EndIf
				   If pilestock.tofoundationcount>0
				    For Local pit:_pile=EachIn pilefoundationlist
				     For Local c=0 To pilestock.tofoundationcount-1
				      If fit
				       foundlist.addlast(_card(fit.value()))
				       fit=fit.nextlink()
				 	  EndIf      
				     Next
		 		    Next
				   EndIf
				   Return(True)
				  EndIf
			 	 EndIf
				 If pilestock.cardlist.firstlink()=Null And pilewaste And pilestock.towastecount>0
				  Return(True)
				 EndIf
				EndIf
				Return(False)
				EndMethod	
	Method tippexecutestock()
				Local fit:TLink=foundlist.firstlink()
				If pilestock.tolabyrinthcount
				 
				 Local pl:_pilelabyrinth=pilelabyrinth(0)
				 If pl And pl.hasfreeline()
				  Local free=pl.freeline()
				  For Local j=0 To pl.dimx-1
				   If fit
				    Local card:_card=_card(fit.value())
				    Local cn:_card=New _card
				    cn.copy(card)
				    Local v:_vector3=pl.droppositionat(j,free)
				    cn.tipplink=tipplist.addlast(cn)
				    cn.curvespeed=solitaire.autospeed
				    cn.curveposition.set(cn.position.x,cn.position.y,cn.position.z, v.x,v.y,v.z, 0,0,-20,0,0,20)
				    cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				    cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z-solitaire.cardslope, 0,0,0,0,0,0)
				    cn.startcurve(solitaire.clock)
				    cn.cardcontrolopacity=card
				    cn.curveopacity.set(0,0,2,-10)
				    fit=fit.nextlink()
				   EndIf
				  Next
				 EndIf
				 
				EndIf
								
				If(pilestock.topilecount>0)
			 	 For Local pit:_pile=EachIn tableau.pilelist
				  For Local c=0 To pilestock.topilecount-1
				   If fit
				    Local card:_card=_card(fit.value())
				    Local cn:_card=New _card
				    cn.copy(card)
				    Local v:_vector3=pit.dropposition()
				    cn.tipplink=tipplist.addlast(cn)
				    cn.curvespeed=solitaire.autospeed
				    cn.curveposition.set(cn.position.x,cn.position.y,cn.position.z, v.x,v.y,v.z, 0,0,-20,0,0,20)
				    cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				    cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z-solitaire.cardslope, 0,0,0,0,0,0)
				    cn.startcurve(solitaire.clock)
				    cn.cardcontrolopacity=card
				    cn.curveopacity.set(0,0,2,-10)
				    fit=fit.nextlink()
				   EndIf
				  Next
		 		 Next
				EndIf
				If pilestock.towastecount
				 If pilestock.cardlist.count()>0
				  Local pit:_pile=pilewaste
				  If pit
				   Local fit:TLink=pilestock.cardlist.firstlink()
				   For Local cw=0 To pilestock.towastecount-1
				    If fit
				     Local card:_card=_card(fit.value())
				     Local cn:_card=New _card
				     cn.copy(card)
				     cn.tipplink=tipplist.addlast(cn)
				     Local v:_vector3=pit.dropposition()
				     cn.curvespeed=solitaire.autospeed*0.5
				     cn.curveposition.o0.copy(cn.position)
					 cn.curveposition.o1.copy(v)
					 cn.curveposition.v0.set( -Float(cw)*7,0,-10)
					 cn.curveposition.v1.set(0,0,10)
					 cn.curveposition.updatelength()
				     If pilestock.open cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, cn.vx.x,cn.vx.y,cn.vx.z, 0,0,-10,0,0,10) Else cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				     cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z, 0,0,-10,0,0,0)
				     cn.startcurve(solitaire.clock)
				     cn.cardcontrolopacity=card
				     cn.curveopacity.set(0,0,2,-10)
				     fit=fit.nextlink()
				    EndIf
		 		   Next
		          EndIf
				 Else 
				  If pilestock.canredeal()
				   Local fs#=0
				   For Local card:_card=EachIn pilewaste.cardlist
				    Local cn:_card=New _card
				    cn.copy(card)
				    cn.tipplink=tipplist.addlast(cn)
				    cn.cardcontrolopacity=card
				    cn.curveopacity.set(0,0,2,-10)
				    Local v:_vector3=pilestock.dropposition()
				    cn.curvespeed=solitaire.autospeed*(Float(0.5)/(1+(fs*0.1)))
				    cn.curveposition.set(cn.position.x,cn.position.y,cn.position.z, v.x,v.y,v.z, 0,0,-10-fs,0,0,10+fs)
				    If pilestock.open cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, cn.vx.x,cn.vx.y,cn.vx.z, 0,0,-10,0,0,10) Else cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				    cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z, 0,0,-10,0,0,0)
				    cn.startcurve(solitaire.clock)
				    fs:+1
				   Next
				  EndIf
				 EndIf
				EndIf
				
				If pilestock.tofoundationcount>0
				 For Local pit:_pile=EachIn pilefoundationlist
				  For Local c=0 To pilestock.tofoundationcount-1
				   If fit
				    Local card:_card=_card(fit.value())
				    Local cn:_card=New _card
				    cn.copy(card)
				    cn.tipplink=tipplist.addlast(cn)
				    cn.cardcontrolopacity=card
				    cn.curveopacity.set(0,0,2,-10)
				    Local v:_vector3=pit.dropposition()
				    cn.curvespeed=solitaire.autospeed
				    cn.curveposition.set(cn.position.x,cn.position.y,cn.position.z, v.x,v.y,v.z, 0,0,-20,0,0,20)
				    cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				    cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z, 0,0,0,0,0,0)
				    cn.startcurve(solitaire.clock)
				    fit=fit.nextlink()
				   EndIf
				  Next
		 		 Next
				EndIf
				EndMethod				
	Method tippredeal:Int()
				If pileredeal Return(pileredeal.canredeal())
				Return(False)
				EndMethod	
	Method tippexecuteredeal()
	 			If pileredeal
				 Local v:_vector3=pileredeal.dropposition()
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  For Local cs:_card=EachIn pit.cardlist
				   Local cn:_card=New _card
				   cn.copy(cs)
				   cn.tipplink=tipplist.addlast(cn)
				   cn.curvespeed=solitaire.autospeed
				   cn.cardcontrolopacity=cs
				   cn.curveopacity.set(0,0,2,-10)
				   cn.curveposition.set(cn.position.x,cn.position.y,cn.position.z, v.x,v.y,v.z, 0,0,-15,0,0,15)
				   cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,0)
				   cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z, 0,0,-10,0,0,10)
				   cn.startcurve(solitaire.clock)
				  Next
			 	 Next
				EndIf
				EndMethod				
	Method tippfoundationcanmove:Int(iteratorpack)
				Local sourcard:_card=Null 
				Local sourpile:_piletableau=Null
				If iteratorpack=0 
				 sourpile=_piletableau(tippsourpileiterator.value())
				 If tippsourcarditerator sourcard=_card(tippsourcarditerator.value())
				ElseIf iteratorpack=1
				 sourpile=_piletableau(autoplaysourpileiterator.value())
				 If autoplaysourcarditerator sourcard=_card(autoplaysourcarditerator.value())
				ElseIf iteratorpack=2
				 sourpile=_piletableau(automovesourpileiterator.value())
				 If automovesourcarditerator sourcard=_card(automovesourcarditerator.value())
				ElseIf iteratorpack=3
				 sourpile=_piletableau(clickplaysourpileiterator.value())
				 If clickplaysourcarditerator sourcard=_card(clickplaysourcarditerator.value())
				EndIf
				If sourcard=Null Return(False)
				Local destpile:_pilefoundation
				foundlist.clear()
				foundsour=Null
				founddest=Null
				If sourpile.cardlist.firstlink()=Null Return(False)
				'sourcard=_card(sourpile.cardlist.firstlink().value())
				If sourcard.canpick()=False Or sourcard.turnedup()=False Return(False)
				If sourpile.cardlist.firstlink()<>sourcard.pilelink Return(False)
				foundlist.clear()
				foundlist.addlast(sourcard)
				For destpile=EachIn pilefoundationlist
				 If founddest=Null
				  If destpile.candrop(foundlist) founddest=destpile
				 EndIf
				Next
				If founddest
				 foundsour=sourpile
				 Return(True)				 
				EndIf
				Return(False)				
				EndMethod
	Method tippfoundation:Int(iteratorpack)
				Local found=False'-----------------probiere tableau---------------------------------
				tippinitcombination(iteratorpack)
				Local deststart:TLink=Null
				Local sourstart:TLink=Null
				Local cardstart:TLink=Null
				If iteratorpack=0
				 deststart=tippdestpileiterator
				 sourstart=tippsourpileiterator
				 cardstart=tippsourcarditerator
				 'Repeat
				 ' If tippfoundationcanmove(iteratorpack) found=True 
				 ' tippsourpileiterator=tippsourpileiterator.nextlink()
				 ' If tippsourpileiterator=Null tippsourpileiterator=tableau.pilelist.firstlink()
			 	 'Until sourstart=tippsourpileiterator Or found
				ElseIf iteratorpack=1
				 deststart=autoplaydestpileiterator
				 sourstart=autoplaysourpileiterator
				 cardstart=autoplaysourcarditerator
				ElseIf iteratorpack=2
				 deststart=automovedestpileiterator
				 sourstart=automovesourpileiterator
				 cardstart=automovesourcarditerator
				 'Repeat
				 ' If tippfoundationcanmove(iteratorpack) found=True 
				 ' automovesourpileiterator=automovesourpileiterator.nextlink()
				 ' If automovesourpileiterator=Null automovesourpileiterator=tableau.pilelist.firstlink()
			 	 'Until sourstart=automovesourpileiterator Or found
				ElseIf iteratorpack=3
				 deststart=clickplaydestpileiterator
				 sourstart=clickplaysourpileiterator
				 cardstart=clickplaysourcarditerator
				 'Repeat
				 ' If tippfoundationcanmove(iteratorpack) found=True 
				 ' clickplaysourpileiterator=clickplaysourpileiterator.nextlink()
				 ' If clickplaysourpileiterator=Null clickplaysourpileiterator=tableau.pilelist.firstlink()
			 	 'Until sourstart=clickplaysourpileiterator Or found
				EndIf
				
				
				Repeat
				 'Print "tf"+iteratorpack
				 If tippfoundationcanmove(iteratorpack) found=True 
				 tippiteratecombinationcardwise(iteratorpack)
				
				Rem
				 Local c:_card
				 Print "ft autoplay it"
				 If cardstart=Null 
				  Print "ft startcard=null" 
				 Else
				  c=_card(cardstart.value())
				  Print "ft startcard = "+c.suit+" "+c.number
				 EndIf
				 If sourstart=Null Print "startpile=null" 
				 If automovesourcarditerator=Null 
				  Print "ft automovesourcarditr=null" 
				 Else
				  c=_card(automovesourcarditerator.value())
				  Print "ft automovesourcarditr.card = "+c.suit+" "+c.number
				 EndIf
				 If automovesourcarditerator=cardstart Print "================"
				 If automovesourpileiterator=sourstart Print "================22222"		
				EndRem
						
			 	Until tippendedcombinationcardwise(iteratorpack,sourstart,cardstart) Or found
			    If found=False'---------------------probiere waste pile-----------------------------
			     If pilewaste 
				  foundlist.clear()
				  foundsour=Null
				  founddest=Null
				  Local it:TLink=pilewaste.cardlist.firstlink()
				  Local sourcard:_card=Null
			      If it sourcard=_card(it.value())
			      If sourcard
				   If sourcard.canpick() 
					foundlist.clear()
					foundlist.addlast(sourcard)
					For Local destpile:_pilefoundation=EachIn pilefoundationlist
					 If founddest=Null
					  If destpile.candrop(foundlist) founddest=destpile
					 EndIf
					Next
					If founddest
					 foundsour=pilewaste
					 Return(True)				 
					EndIf
				   EndIf
				  EndIf
			     EndIf
			    EndIf
				Return(found)
				EndMethod					
	

	'-------------------------------------------- AUTO PLAY -------------------------------------------------				
	Method autoplayiteratecombination(iteratorpack)
				Local p:_piletableau
				If iteratorpack=0
				 tippdestpileiterator=tableau.pilelist.firstlink()
				 If tippsourcarditerator tippsourcarditerator=tippsourcarditerator.prevlink()
				 If tippsourcarditerator=Null
				  tippsourpileiterator=tippsourpileiterator.nextlink()
				  If tippsourpileiterator=Null tippsourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(tippsourpileiterator.value())
				  tippsourcarditerator=p.cardlist.lastlink()
				 EndIf
				ElseIf iteratorpack=1
				 autoplaydestpileiterator=tableau.pilelist.firstlink()
				 If autoplaysourcarditerator autoplaysourcarditerator=autoplaysourcarditerator.prevlink()
				 If autoplaysourcarditerator=Null
				  autoplaysourpileiterator=autoplaysourpileiterator.nextlink()
				  If autoplaysourpileiterator=Null autoplaysourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(autoplaysourpileiterator.value())
				  autoplaysourcarditerator=p.cardlist.lastlink()
				 EndIf
				ElseIf iteratorpack=2
				 automovedestpileiterator=tableau.pilelist.firstlink()
				 If automovesourcarditerator automovesourcarditerator=automovesourcarditerator.prevlink()
				 If automovesourcarditerator=Null
				  automovesourpileiterator=automovesourpileiterator.nextlink()
				  If automovesourpileiterator=Null automovesourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(automovesourpileiterator.value())
				  automovesourcarditerator=p.cardlist.lastlink()
				 EndIf
				ElseIf iteratorpack=3
				 clickplaydestpileiterator=tableau.pilelist.firstlink()
				 If clickplaysourcarditerator clickplaysourcarditerator=clickplaysourcarditerator.prevlink()
				 If clickplaysourcarditerator=Null
				  clickplaysourpileiterator=clickplaysourpileiterator.nextlink()
				  If clickplaysourpileiterator=Null clickplaysourpileiterator=tableau.pilelist.firstlink()
				  p=_piletableau(clickplaysourpileiterator.value())
				  clickplaysourcarditerator=p.cardlist.lastlink()
				 EndIf
				EndIf
				EndMethod 
	Method autoplayendedcombination:Int(iteratorpack,sourstart:TLink,cardstart:TLink)
				If iteratorpack=0
				 If tippsourpileiterator=sourstart And tippsourcarditerator=cardstart Return(True) Else Return(False)
				ElseIf iteratorpack=1
				 If autoplaysourpileiterator=sourstart And autoplaysourcarditerator=cardstart Return(True) Else Return(False)
				ElseIf iteratorpack=2
				 If automovesourpileiterator=sourstart And automovesourcarditerator=cardstart Return(True) Else Return(False)
				ElseIf iteratorpack=3
				 If clickplaysourpileiterator=sourstart And clickplaysourcarditerator=cardstart Return(True) Else Return(False)
				EndIf
				EndMethod		
	Method autoplaymovelist:_piletableau(sourpile:_piletableau,ft:TList,samesuit,rowgrow)	
				'kernfunktion sucht ein ziel 
				'für die liste ft und gibt es in destpile zurück			
				Local l:TList=CreateList()
				For Local destpile:_piletableau=EachIn tableau.pilelist
				 If destpile<>sourpile
				  If destpile.candrop(ft,samesuit)
				   'nun die längenprüfung
				   Local listen=False					
				
				   If rowgrow
				    Local ls=sourpile.pickrowlengthfromfirst()
			 	    Local ld=destpile.pickrowlengthfromfirst()
 				    If destpile.cardlist.count()=0'leeres Feld
				     If ft.count()=ls And ft.count()<sourpile.cardlist.count() listen=True
				    Else 
				     If ((ft.count()+ld)>ls) listen=True
				    EndIf
				   Else
				    listen=True
				   EndIf
				
				
				   If listen l.addlast(destpile)
				  EndIf
				 EndIf
				Next
				Local dest:_piletableau=Null
				Local c=-1
			 	For Local pit:_piletableau=EachIn l
			     Local r=pit.pickrowlengthfromfirst()
				 If c<r
				  c=r
				  dest=pit
				 EndIf
				Next
				Return( dest )
				EndMethod
	Method autoplaymovecard:Int(sourpile:_piletableau,sourcard:_card,samesuit=False,rowgrow=True)				
				Local destpile:_piletableau=Null'_piletableau(tippdestpileiterator.value())
				Local iit:TLink=sourcard.pilelink
				Local ft:TList=CreateList()
				Repeat
				 ft.addlast(_card(iit.value()))
				 iit=iit.prevlink()
				Until iit=Null
				destpile=autoplaymovelist(sourpile,ft,samesuit,rowgrow)
				If destpile
				 founddest=destpile
				 foundsour=sourpile
				 foundlist.clear()
				 For Local cit:_card=EachIn ft
				  foundlist.addlast(cit)
				 Next
				 Return(True)
				Else
				 Return(False)
				EndIf
				EndMethod
	Method autoplaymove:Int(iteratorpack,samesuit=False,rowgrow=True)
				Local sourcard:_card=Null 
				Local sourpile:_piletableau=Null
				If iteratorpack=0
				 If tippsourcarditerator sourcard=_card(tippsourcarditerator.value())
				 sourpile=_piletableau(tippsourpileiterator.value())
				ElseIf iteratorpack=1
				 If autoplaysourcarditerator sourcard=_card(autoplaysourcarditerator.value())
				 sourpile=_piletableau(autoplaysourpileiterator.value())
				ElseIf iteratorpack=2
				 If automovesourcarditerator sourcard=_card(automovesourcarditerator.value())
				 sourpile=_piletableau(automovesourpileiterator.value())
				ElseIf iteratorpack=3
				 If clickplaysourcarditerator sourcard=_card(clickplaysourcarditerator.value())
				 sourpile=_piletableau(clickplaysourpileiterator.value())
				EndIf
				foundlist.clear()
				foundsour=Null
				founddest=Null
				If sourcard
				 If sourcard.canpick()
				  If autoplaymovecard(sourpile,sourcard,samesuit,rowgrow)
				   Return(True)
				  EndIf
				 EndIf 
				EndIf
				Return(False)
				EndMethod				
	Method autoplaymovetableau:Int(iteratorpack,samesuit=False,rowgrow=True)
				Local found=False
				Local sourstart:TLink=Null
				Local cardstart:TLink=Null
				tippinitcombination(iteratorpack)
				If iteratorpack=0
				 sourstart=tippsourpileiterator
				 cardstart=tippsourcarditerator'ACHTUNG KANN NULL SEIN
				ElseIf iteratorpack=1
				 sourstart=autoplaysourpileiterator
				 cardstart=autoplaysourcarditerator'ACHTUNG KANN NULL SEIN
				ElseIf iteratorpack=2
				 sourstart=automovesourpileiterator
				 cardstart=automovesourcarditerator'ACHTUNG KANN NULL SEIN
				ElseIf iteratorpack=3
				 sourstart=clickplaysourpileiterator
				 cardstart=clickplaysourcarditerator'ACHTUNG KANN NULL SEIN
				EndIf
				
				Repeat
				 If autoplaymove(iteratorpack,samesuit) found=True 
				 autoplayiteratecombination(iteratorpack)
				Rem
				 Local c:_card
				 Print "autoplay it"
				 If cardstart=Null 
				  Print "startcard=null" 
				 Else
				  c=_card(cardstart.value())
				  Print "startcard = "+c.suit+" "+c.number
				 EndIf
				 If sourstart=Null Print "startpile=null" 
				 If autoplaysourcarditerator=Null 
				  Print "autoplayitr=null" 
				 Else
				  c=_card(autoplaysourcarditerator.value())
				  Print "autoplayitrcard = "+c.suit+" "+c.number
				 EndIf
				 If autoplaysourcarditerator=cardstart Print "================"
				 If autoplaysourpileiterator=sourstart Print "================22222"
				EndRem
			 	Until autoplayendedcombination(iteratorpack,sourstart,cardstart) Or found
				Return(found)				
				EndMethod					
	Method autoplayanimationpiletopile:_animationpiletopile(udx=False,udy=False,vx#=-20,vy#=0,vz#=-10,undoconstantsort=True)
				Local a:_animationpiletopile=New _animationpiletopile
				a.init(Self,foundlist,founddest,solitaire.autospeed,0.1,True,udx,udy)
				a.undoconstantsort=undoconstantsort
				a.vector.set(vx,vy,vz)
				a.skipable=False
				Return(a)
				EndMethod
				Rem
	Method autoplayanimationmultipiletopile:_animationpiletopile(udx=False,udy=False)
				Local a:_animationmultipiletopile=New _animationmultipiletopile
				a.init(Self,foundlist,founddest,solitaire.autospeed,0.1,True,udx,udy)
				a.skipable=False
				Return(a)
				EndMethod
					EndRem		
	'-------------------------------------------- CLICK PLAY CARD ------------------------------------------------				
	Method clickplaytableaumove:Int(c:_card,samesuit=False)
				Local destpile:_piletableau=Null
				Local sourpile:_piletableau=_piletableau(c.pile)
				If sourpile=Null Return(False)
				foundlist.clear()
				foundsour=Null
				founddest=Null
				If autoplaymovecard(sourpile,c,samesuit)
				 Return(True)
				EndIf
				Return(False)
				EndMethod		
	Method clickplaywaste:Int(c:_card)
				Local found=False
				Local pw:_pilewaste=_pilewaste(c.pile)
				If pw=Null Return(False)
				foundlist.clear()
				foundsour=Null
				founddest=Null
				foundlist.addlast(c)
				For Local pit:_piletableau=EachIn tableau.pilelist
				 If found=False And pit.candrop(foundlist)
				  found=True
				  foundsour=pilewaste
				  founddest=pit
				 EndIf
				Next
				Return(found)
				EndMethod						
	Method clickplaycompleterow:Int(c:_card)
				Local it:TLink=c.pilelink
				If c.number<>12 Return(False)
				Local s=c.suit
				foundlist.clear()
				For Local n=12 To 0 Step -1
				 If it=Null Return(False)
				 Local cit:_card=_card(it.value())
				 If cit.suit<>s Return(False)
				 If cit.number<>n Return(False)
				 foundlist.addlast(cit)
				 it=it.prevlink()
				Next
				Return(True)
				EndMethod				
	Method clickplaytableauemptypile(c:_card)
				Return(False)
				EndMethod					
	Method clickplayfoundation:Int(c:_card)
				founddest=Null
				foundsour=c.pile
				foundlist.clear()
				foundlist.addlast(c)
				If c.pilelink.prevlink()<>Null Return(False)
				For Local destpile:_pilefoundation=EachIn pilefoundationlist
				 If founddest=Null
				  If destpile.candrop(foundlist) founddest=destpile
				 EndIf
				Next
				If founddest Return(True)				 
				Return(False)
				EndMethod				
	Method save(s:TStream)
				'WriteLine(s,"_game")
				WriteLine(s,savename)	
				WriteInt(s,allowpick)
				WriteInt(s,preview)
				WriteInt(s,inuse)
				WriteInt(s,pilegivesamesuit)
				WriteInt(s,pilegivealteratecolor)
				WriteInt(s,pilegivedescending)
				WriteInt(s,pilegiveascending)
				WriteInt(s,piletakesamesuit)
				WriteInt(s,piletakealteratecolor)
				WriteInt(s,piletakeascending)
				WriteInt(s,piletakedescending)
				WriteInt(s,piletakeemptysuit)
				WriteInt(s,piletakeemptynumber)
				WriteInt(s,foundationdescending)
				WriteInt(s,foundationascending)
				WriteInt(s,foundationboth)
				WriteInt(s,foundationbothwrapped)
				WriteInt(s,foundationpickrestriction)
				WriteInt(s,freecellpickrestriction)
				WriteInt(s,redealvalue)
				WriteInt(s,redealcount)
				WriteInt(s,ended)			
				WriteFloat(s,solitaire.clock.ms()-starttime)
				For Local i=0 To 9 
				 cameraposition[i].save(s)
				 camerapositionmenu[i].save(s)
				 camerapositionpreview[i].save(s)
				 cameraview[i].save(s)
				 cameraviewmenu[i].save(s)
				 cameraviewpreview[i].save(s)
				 cameraside[i].save(s)
				 camerasidemenu[i].save(s)
				 camerasidepreview[i].save(s)
				 cameraup[i].save(s)
				 cameraupmenu[i].save(s)
				 camerauppreview[i].save(s)
				Next
				position.save(s)
				vector[0].save(s)
				vector[1].save(s)

				WriteInt(s,cardlist.count())
				For Local cit:_card=EachIn cardlist
				 cit.save(s)
				Next	

				WriteInt(s,picklist.count())
				For Local cit:_card=EachIn cardlist
				 savepointer(s,cit)
				Next

				Local uc=undolist.count()
				WriteInt(s,uc)
				If uc
				 For Local uit:_animationundo=EachIn undolist
				  uit.save(s)
				 Next
				 WriteInt(s,undoiteratorindex())
				EndIf
				'Print "save undoitindex="+undoiteratorindex()
				WriteInt(s,statsclosed)
				WriteInt(s,discards)
				WriteFloat(s,time)
				WriteInt(s,moves)
				WriteInt(s,undos)
				WriteInt(s,tipps)
				EndMethod
	Method undoiteratorindex:Int()				
				Local i=0
				Local it:TLink=undolist.firstlink()
				If it And undoiterator
				 While(it<>undoiterator And it)
				  i:+1
				  it=it.nextlink()
				 Wend
				EndIf 
				Return(i)				
				EndMethod
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)
				allowpick=ReadInt(s)
				preview=ReadInt(s)
				inuse=ReadInt(s)
				pilegivesamesuit=ReadInt(s)
				pilegivealteratecolor=ReadInt(s)
				pilegivedescending=ReadInt(s)
				pilegiveascending=ReadInt(s)
				piletakesamesuit=ReadInt(s)
				piletakealteratecolor=ReadInt(s)
				piletakeascending=ReadInt(s)
				piletakedescending=ReadInt(s)
				piletakeemptysuit=ReadInt(s)
				piletakeemptynumber=ReadInt(s)
				foundationdescending=ReadInt(s)
				foundationascending=ReadInt(s)
				foundationboth=ReadInt(s)
				foundationbothwrapped=ReadInt(s)
				foundationpickrestriction=ReadInt(s)
				freecellpickrestriction=ReadInt(s)
				redealvalue=ReadInt(s)
				redealcount=ReadInt(s)
				ended=ReadInt(s)			
				starttime=solitaire.clock.ms()-ReadFloat(s)
				For Local i=0 To 9
				 cameraposition[i].Load(s)
				 camerapositionmenu[i].Load(s)
				 camerapositionpreview[i].Load(s)
				 cameraview[i].Load(s)
				 cameraviewmenu[i].Load(s)
				 cameraviewpreview[i].Load(s)
				 cameraside[i].Load(s)
				 camerasidemenu[i].Load(s)
				 camerasidepreview[i].Load(s)
				 cameraup[i].Load(s)
				 cameraupmenu[i].Load(s)
				 camerauppreview[i].Load(s)
				Next
				position.Load(s)
				vector[0].Load(s)
				vector[1].Load(s)

				cardlist.clear()
				Local cc=ReadInt(s)'cardlist.count()
				If cc>0
				 For Local i=0 To cc-1
				  Local cit:_card=New _card
				  cit.init(solitaire,Self,0,0)
				  cit.insertgame()
				  Local typ$=ReadLine(s)
				  cit.Load(s)
				 Next	
				EndIf

				picklist.clear()
				loadprocpc=ReadInt(s)'picklist.count()
				If loadprocpc>0
				 For Local i=0 To loadprocpc-1
				  loadpointer(s)
				 Next
				EndIf

				undolist.clear()
				undoiterator=Null
				loadprocuii=-1
				Local uc=ReadInt(s)'undolist.count()
				If uc>0
				 For Local i=0 To uc-1
				  Local undo:_animationundo=New _animationundo
				  undo.init(Self,0,0)
				  undo.deinsertgame()'animation deinsert
				  Local ut$=ReadLine(s)
				  undo.Load(s)
				 Next
				 loadprocuii=ReadInt(s)'undoiteratorindex
				EndIf
				'Print "load undoitindex="+loadprocuii

				statsclosed=ReadInt(s)
				discards=ReadInt(s)
				time=ReadFloat(s)
				moves=ReadInt(s)
				undos=ReadInt(s)
				tipps=ReadInt(s)
				EndMethod	
	Method assoziieren()
				'Print "asso undoitindex="+loadprocuii
				undoiterator=undolist.firstlink()
				If loadprocuii>0
				 For Local i=0 To loadprocuii-1
				  undoiterator=undoiterator.nextlink() 
				 ' Print "itr"
				 Next
				EndIf
				If undoiterator=Null Print "alarm"
				If pointerloaded()
				 If loadprocpc>0
				  For Local i=0 To loadprocpc-1
				   picklist.addlast(_card(associatepointer()))
				  Next
				 EndIf
				 releasepointer()
				EndIf
				

				
				
				EndMethod					
	EndType


'******************************************************************************************************************
'										C A R D 
'******************************************************************************************************************
Type _card Extends _storeable
	Field solitaire:_solitaire=Null
	'Field drawlink:TLink=Null
	Field picklink:TLink=Null
	Field game:_game=Null
	Field gamelink:TLink=Null			' link in cardpile cards list; used for various cards move operations
	Field tipplink:TLink=Null			' not for storages
	Field pile:_pile=Null				' cardstack of which card is part
	Field pilelink:TLink=Null			' link in cardpile cards list; used for various cards move operations
	Field visible=True					' true if card is visible on screen
	Field suit:Int=0					' card suit (color)
	Field number:Int=0					' card number, symbol (0-12, 0=ACE, 12=KING)
	Field parent:_card[2]				' pyramid pointers to parents 
	Field child:_card[2]				' pyramid pointers to childs
	Field labyrinth:_pilelabyrinth=Null ' labyrinth pointer
	Field labindex[2]					' x,y-field indices for the labyrinthpile
	Field sweetmatch:_pilesweetmatch=Null' sweetmatchpile pointer
	Field sweetindex[2]					' x,y-field indices for the sweetmatchpile
	Field sweetblocked=False			' if true, this card is an blocked field like in jewel match
	Field mesh:_mesh=Null
	Field position:_vector3=Null
	Field vx:_vector3=Null
	Field vy:_vector3=Null
	
	
	Field rotation#=0					'actual, displayed and performed rotation value
	Field rotationmust#=0				'the value that should be matched
	Field rotationvector#=0
	Field rotationvelocity#=0.1
	Field rotationfriction#=0.9
	
	Field shift:_vector2=Null    		'actual, displayed and performed shift, is along x and y , not z
	Field shiftmust:_vector2=Null
	Field shiftvector:_vector2=Null
	Field shiftvelocity#=0.1
	Field shiftfriction#=0.9
	
	Field neigungx#=0
	Field opacity#=1
	
	Field shadowlist:TList=Null						
	Field curveposition:_hermitecurve=Null
	Field curvevx:_hermitecurve=Null
	Field curvevy:_hermitecurve=Null
	Field curvepositiont#=0
	Field curvevxt#=0
	Field curvevyt#=0
	Field curving:Int=False
	Field curvespeed#=20
	Field curvetime:Int=0

	Field clicktime=0
	Field clickleft:Int=False
	
	Field picked:Int=False
	Field pickposition:_vector3=Null
	Field pickvx:_vector3=Null
	Field pickvy:_vector3=Null
	Field pickending=False
	'tipp elements, not for storages
	Field curveopacity:_hermitecurve1=Null
	Field cardcontrolopacity:_card=Null
	
	

	'old fields, not used
	Field isfloating					' true if card is being moved by the computer
	Field imgidx
	Field ordr
	Field forced
	Field mark
	Field selected
	Field hovered
	
	Method New()
				position=New _vector3
				vx=New _vector3
				vy=New _vector3
				position.set(0,0,0)
				vx.set(solitaire.cardwidth,0,0)
				vy.set(0,solitaire.cardheight,0)
				shadowlist=CreateList()
				curveposition=New _hermitecurve
				curvevx=New _hermitecurve
				curvevy=New _hermitecurve
				pickposition=New _vector3
				pickvx=New _vector3
				pickvy=New _vector3
				shift=New _vector2
				shiftmust=New _vector2
				shiftvector=New _vector2
				parent[0]=Null
				parent[1]=Null
				child[0]=Null
				child[1]=Null
				labyrinth=Null
				labindex[0]=0
				labindex[1]=0
				sweetmatch=Null
				sweetindex[0]=0
				sweetindex[1]=0
				curveopacity=New _hermitecurve1
				cardcontrolopacity=Null
				EndMethod
	Method Delete()
				clearshadow()
				EndMethod	
	Method copy(c:_card)'copies a card FOR TIPP LIST , not for general purposes
				solitaire=c.solitaire
				'drawlink=Null
				picklink=Null
				game=c.game
				gamelink=Null'game.cardlist.addlast(Self)
				tipplink=Null'game.tipplist.addlast(Self)
				'drawlink=game.drawlist.addlast(Self)
				pile=Null
				pilelink=Null	
				visible=c.visible
				suit=c.suit
				number=c.number
				parent[0]=c.parent[0]
				parent[1]=c.parent[1]
				child[0]=c.child[0]
				child[1]=c.child[1]
				labyrinth=Null'c.labyrinth
				labindex[0]=0'c.labindex[0]
				labindex[1]=0'c.labindex[1]
				sweetmatch=Null
				sweetindex[0]=Null
				sweetindex[1]=Null
				sweetblocked=False
				mesh=c.mesh.duplicate()
				If mesh.link RemoveLink mesh.link
				Local p:_polygon=_polygon(mesh.polygonlist.firstlink().value())
				p.drawlink=game.drawlist.addlast(p)
				
				position.copy(c.position)
				vx.copy(c.vx)
				vy.copy(c.vy)
				rotation=c.rotation
				rotationmust=c.rotationmust
				rotationvector=c.rotationvector
				rotationvelocity=c.rotationvelocity
				rotationfriction=c.rotationfriction
				shift.copy(c.shift)
				shiftmust.copy(c.shiftmust)
				shiftvector.copy(c.shiftvector)
				shiftvelocity=c.shiftvelocity
				shiftfriction=c.shiftfriction
				neigungx=c.neigungx
				curveposition.copy(c.curveposition)
				curvevx.copy(c.curvevx)
				curvevy.copy(c.curvevy)
				curvepositiont=c.curvepositiont
				curvevxt=c.curvevxt
				curvevyt=c.curvevyt
				curving=c.curving
				curvespeed=c.curvespeed
				curvetime=c.curvetime
				picked=False
				pickposition.copy(c.pickposition)
				pickvx.copy(c.pickvx)
				pickvy.copy(c.pickvy)
				pickending=False				

				mesh.world=solitaire.world
				updatemesh()
				createshadow()


				EndMethod				
	Method clearshadow()
				For Local sit:_shadow=EachIn shadowlist
				 RemoveLink sit.link
				Next
				shadowlist.clear()
				EndMethod	
	Method createshadow()
				clearshadow()
				For Local lit:_light=EachIn solitaire.world.lightlist
				 Local sit:_shadow=New _shadow
 				 sit.init(solitaire,lit,game.preview)
 			     shadowlist.addlast(sit)
				Next
				updateshadow()
				EndMethod
												
	Method init(s:_solitaire,g:_game,su,n,px#=0,py#=-30)				
				solitaire=s
				game=g
				'drawlink=game.drawlist.addlast(Self)
				suit=su
				number=n
				position.set(px,py,0)
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=solitaire.tcard[solitaire.cardtexturefrontindex,suit+number*4]
				gg.texture[1,0]=solitaire.tcardback[solitaire.cardtexturebackindex]
				gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
				gg.vx.copy(vx)
				gg.vy.copy(vy)
				gg.tvy[0].set(0,-1)
				gg.resolution[0]=1
				gg.resolution[1]=1
				mesh=gg.Create()
				mesh.twosided(True)
				mesh.visible(True)
				mesh.blend(True)
				mesh.blendadditive(False)
				
				mesh.world=solitaire.world
				Local p:_polygon=_polygon(mesh.polygonlist.firstlink().value())
				p.drawlink=game.drawlist.addlast(p)
				
				updatemesh()
				createshadow()


				rotationmust=Rnd(-game.solitaire.naturalpiles*5,game.solitaire.naturalpiles*5)
				Local sn#=solitaire.naturalpiles*0.2
				shiftmust.set(Rnd(-sn,+sn),Rnd(-sn,+sn))
				
				EndMethod
	Method insertpile(p:_pile,first=False,asindex=0)
				pile=p
				If asindex=0
				 If first pilelink=pile.cardlist.addfirst(Self) Else pilelink=pile.cardlist.addlast(Self)
				Else
				 Local n
				 Local it:TLink=Null
				 If first
				  it=pile.cardlist.firstlink()
				  For n=0 To asindex-1
				   it=it.nextlink()
				  Next
				  If it
				   pilelink=pile.cardlist.insertbeforelink(Self,it)
				  Else
				   pilelink=pile.cardlist.addlast(Self)'VORHER !"!!!!!!!!!!!!!!!!!!!!! : addfirst(Self)
				  EndIf
				 Else
				  it=pile.cardlist.lastlink()
				  For n=0 To asindex-1
				   it=it.prevlink()
				  Next
				  If it
				   pilelink=pile.cardlist.insertafterlink(Self,it)
				  Else
				   pilelink=pile.cardlist.addlast(Self)
				  EndIf
				 EndIf
				EndIf
				game.tippresetcombination(0)
				game.tippresetcombination(1)
				game.tippresetcombination(2)
				game.tippresetcombination(3)
				Rem
				If pilelink
				 If game.tippsourpileiterator=pilelink
				  If game.tippsourcarditerator=Null
				   game.tippsourcarditerator=pile.cardlist.lastlink()
				  EndIf
				 EndIf
				 If game.autoplaysourpileiterator=pilelink
				  If game.autoplaysourcarditerator=Null
				   game.autoplaysourcarditerator=pile.cardlist.lastlink()
				  EndIf
				 EndIf
				 If game.automovesourpileiterator=pilelink
				  If game.automovesourcarditerator=Null
				   game.automovesourcarditerator=pile.cardlist.lastlink()
				  EndIf
				 EndIf
				 If game.clickplaysourpileiterator=pilelink
				  If game.clickplaysourcarditerator=Null
				   game.clickplaysourcarditerator=pile.cardlist.lastlink()
				  EndIf
				 EndIf
				EndIf
				EndRem
				EndMethod
	Method clear()
				deinsertpile()
				deinsertgame()
				deinsertpick()
				If tipplink=Null 'wichtig weil sonst die pyramid destabilisiert wird
				 deinsertpyramid()
				 deinsertlabyrinth()
				EndIf
				If tipplink RemoveLink tipplink
				'If drawlink RemoveLink drawlink
				Local p:_polygon=_polygon(mesh.polygonlist.firstlink().value())
				If p.drawlink RemoveLink p.drawlink
				p.drawlink=Null
				clearshadow()
				EndMethod				
	Method deinsertpile()
				If pilelink 
				 Local l:TLink=pilelink
				 RemoveLink pilelink'ERST LÖSCHEN, DA ES SONST NICHTS BRINGT !!!!
				 If game.tippsourcarditerator=l game.tippresetcombination(0)
				 If game.autoplaysourcarditerator=l game.tippresetcombination(1)
				 If game.automovesourcarditerator=l game.tippresetcombination(2)
				 If game.clickplaysourcarditerator=l game.tippresetcombination(3)
				EndIf
				pilelink=Null
				pile=Null
				EndMethod			
	Method insertgame()
				gamelink=game.cardlist.addlast(Self)
				EndMethod
	Method discard(beth=False)
				If game.pilediscard	
				 Local vn:_vector3=New _vector3
				 Local dvx:_vector3=game.pilediscard.dropvx()
				 Local dvy:_vector3=game.pilediscard.dropvy()
				 Local vtp:_vector3=New _vector3
				 Local vtn:_vector3=New _vector3
				 vtp.set(0,0,10)
				 vtn.set(-40,40,-8)
				 vn.set(0,0,0)
				 curvespeed=30
				 curvevx.setvector(vx,dvx,vn,vn)
				 curvevy.setvector(vy,dvy,vn,vn)
				 curveposition.setvector(position,game.pilediscard.dropposition(),vtn,vtp)
				 startcurve(game.solitaire.clock)
				 deinsertpile()
				 insertpile(game.pilediscard,True)
				EndIf
				EndMethod
	Method index:Int()
				'return the index of the card in the pilelist
				If pile=Null Return(0)				
				Local i=0
				For Local cit:_card=EachIn pile.cardlist
				 If cit=Self Return(i)
				 i:+1
				Next
				Return(0)
				EndMethod
	Method insertpick()
				game.startusing()
				If picked=False
				 pile.pick(Self)	
					Rem
				 '--------------------------------------------spezial pyramide pile discard
				 Local pp:_pilepyramid=_pilepyramid(pile)
				 Local wp:_pilewastepyramid=_pilewastepyramid(pile)
				 Local sp:_pilestockpyramid=_pilestockpyramid(pile)
				 Local direct=False
				 If pp Or wp Or sp
				  'the pile is a pyramid pile
				  'so the card must be moved directly to the discard if it is a king
				  If number=12
				   discard()
				   Local u:_animationundo=game.createundo(20,20)
				   If pp u.use(Self,game.pilediscard,True,0,0,0,pp,True,0,0,0,curveposition,curvevx,curvevy)
				   If wp u.use(Self,game.pilediscard,True,0,0,0,wp,True,0,0,0,curveposition,curvevx,curvevy)
				   If sp u.use(Self,game.pilediscard,True,0,0,0,sp,True,0,0,0,curveposition,curvevx,curvevy)
				   deinsertpyramid()
				   direct=True
				  EndIf
				 EndIf
				 '--------------------------------------------spezial bethoral pile discard
				 Local pb:_pilebethoral=_pilebethoral(pile)
				 If pb
				  pb.discard(Self)
				  direct=True
				 EndIf
				 '------------------------------------------------------------------------------
				 Local pk:_pileblanket=_pileblanket(pile)
				 '--------------------------rekursive standardprozedur für die meisten piles-------------
				 If direct=False
				  picklink=game.picklist.addlast(Self)
				  picked=True
				  pickposition.copy(position)
				  pickvx.copy(vx)
				  pickvy.copy(vy)
				 EndIf
				 If pp=Null And wp=Null And sp=Null And pk=Null
				  Local it:TLink=pilelink.prevlink()
				  Local cit:_card=Null
				  If(it)
				   cit=_card(it.value())
				   cit.insertpick()
				  EndIf
				 EndIf
				 EndRem
				EndIf
				EndMethod
	Method pick()
				If picked=False
				 picklink=game.picklist.addlast(Self)
				 picked=True
				 pickposition.copy(position)
				 pickvx.copy(vx)
				 pickvy.copy(vy)
				EndIf
				EndMethod				
	Method insertpyramid(p0:_card,p1:_card,c0:_card,c1:_card)				
				parent[0]=p0
				parent[1]=p1
				child[0]=c0
				child[1]=c1
				If parent[0]
				 parent[0].child[1]=Self
				EndIf
				If parent[1]
				 parent[1].child[0]=Self
				EndIf
				If child[0]
				 child[0].parent[1]=Self
				EndIf
				If child[1]
				 child[1].parent[0]=Self
				EndIf
				EndMethod
	Method deinsertpyramid()
				If parent[0]
				 parent[0].child[1]=Null
				 parent[0]=Null
				EndIf
				If parent[1]
				 parent[1].child[0]=Null
				 parent[1]=Null
				EndIf
				If child[0]
				 child[0].parent[1]=Null
				 child[0]=Null
				EndIf
				If child[1]
				 child[1].parent[0]=Null
				 child[1]=Null
				EndIf
				EndMethod
	Method insertlabyrinth(l:_pilelabyrinth,fx,fy)
				'Print "insertlaby s="+suit+" n="+number+" bei "+fx+","+fy
				If l.feld[fx,fy] l.feld[fx,fy].deinsertlabyrinth()
				
				labyrinth=l
				labindex[0]=fx
				labindex[1]=fy
				labyrinth.feld[fx,fy]=Self
				EndMethod
	Method deinsertlabyrinth()
				'Print "deinsertlaby s="+suit+" n="+number+" bei "+labindex[0]+","+labindex[1]
				If labyrinth
				 labyrinth.feld[labindex[0],labindex[1]]=Null
				 labindex[0]=0
				 labindex[1]=0
				 labyrinth=Null
				EndIf
				EndMethod				
	Method insertsweetmatch(l:_pilesweetmatch,fx,fy)
				'Print "insertsweet s="+suit+" n="+number+" bei "+fx+","+fy
				If l.feld[fx,fy] l.feld[fx,fy].deinsertsweetmatch()
				sweetmatch=l
				sweetindex[0]=fx
				sweetindex[1]=fy
				sweetmatch.feld[fx,fy]=Self
				EndMethod
	Method deinsertsweetmatch()
				'Print "deinsertsweet s="+suit+" n="+number+" bei "+sweetindex[0]+","+sweetindex[1]

				If sweetmatch
				 sweetmatch.feld[sweetindex[0],sweetindex[1]]=Null
				 sweetindex[0]=0
				 sweetindex[1]=0
				 sweetmatch=Null
				EndIf
				EndMethod						
	Method deinsertgame()
				If gamelink RemoveLink gamelink
				gamelink=Null
				EndMethod			
	Method deinsertpick()
				If picklink RemoveLink picklink
				picklink=Null
				picked=False
				EndMethod			
	Method polygon:_polygon()
				Return(_polygon(mesh.polygonlist.firstlink().value()))
				EndMethod
	Method draw(gra:_graphics,cam:_camera)
				If visible
				 mesh.clearvertexlight()
	    		 For  Local lit:_light=EachIn solitaire.world.lightlist
				  mesh.determinevertexlight(lit)
				 Next
				 gra.blendmultiplicative()
				 mesh.vertexalpha(opacity)
				 If sweetblocked 
				  
				 EndIf
				 'SetAlpha(0.5)
				 'mesh.vertexalpha(0.5)
				 mesh.draw(gra,cam)
				 gra.blend(False)

				EndIf
				EndMethod
	Method startcurve(clock:_clock)
				curvetime=clock.ms()
				curvepositiont=0
				curvevxt=0
				curvevyt=0
				curveposition.updatelength()
				curvevx.updatelength()
				curvevy.updatelength()
				curving=True
				EndMethod		
	Method animatecurve()	
				Local newtime#=game.solitaire.clock.ms()
				Local deltat#=Float(newtime-curvetime)/1000.0#
				curvetime=newtime
				If curving
				 'Print "c"
				 If curvepositiont<1
				  curveposition.calculate(curvepositiont)
				  curvevx.calculate(curvevxt)
				  curvevy.calculate(curvevyt)
				  Local deltal#=curvespeed*deltat
				  Local dt#
				  If curveposition.curvelength<nearzero
				   dt=1
				  Else 				
				   dt=(deltal/curveposition.curvelength)
				  EndIf
				  curvepositiont:+dt
				  curvevxt:+dt
				  curvevyt:+dt
				  position.copy(curveposition.e)
				  vx.copy(curvevx.e)
				  vy.copy(curvevy.e)
				  'normcardplane()
				 Else
				  curvepositiont=0
				  curvevxt=0
				  curvevyt=0
				  position.copy(curveposition.o1)
				  vx.copy(curvevx.o1)
				  vy.copy(curvevy.o1)
				  'normcardplane()
				  curving=False
				  curvespeed=10
				  If pickending 
				   pickending=False
				   deinsertpick()
				  EndIf
				 EndIf				  
				EndIf
				EndMethod
				Rem
	Method animateinput()
				Local mx#=MouseX()
				Local my#=MouseY()
				Local mb[]=[MouseDown(1),MouseDown(2)]
				Local i=inner()
				If game.allowpick And game.animationlist.firstlink()=Null
				 '------------------------------- turn check --------------------------	
				 If mb[0] Or mb[1]
				  If i
				   If turnedup()=False
				    If canturn() 
				     turn(game.solitaire.clock)
				     game.startusing()
			  	    EndIf
				   EndIf 
				  EndIf
			 	 EndIf
				 '------------------------------- pick und autoplay check -------------
				 If mb[0]
				  Local doppel=False
				  If clickleft=False And i
				   If game.solitaire.clock.ms()-clicktime<300 doppel=True
				   clickleft=True
				   clicktime=game.solitaire.clock.ms()
				  EndIf
				  If i
				   If turnedup()' And canpick()
				    If doppel
				     If pile.canpick(Self) And game.animationlist.firstlink()=Null If game.solitaire.clickplaydouble game.clickplay(Self)
				    Else
				     If canpick() 
				      If picked=False
				       insertpick()
				      EndIf
				     EndIf 
				    EndIf
				   EndIf
				  EndIf
				 EndIf
			
			     If mb[1]
			      If i And game.animationlist.firstlink()=Null
			       If picked=False And pickending=False And curving=False And turnedup() And canpick()
			        If game.solitaire.clickplayright 

			         game.clickplay(Self)
			         
			        EndIf
			       EndIf
			      EndIf
			     EndIf
			
				 If mb[0]=False
				  If clickleft=True
				   clickleft=False
				   'clicktimeoff=game.solitaire.clock.ms()
				  EndIf
				 EndIf
				EndIf
				EndMethod
					EndRem
	Method animatenaturality()
				Local d#
				d=rotationmust-rotation
				d:*rotationvelocity
				rotationvector:+d
				rotation:+rotationvector
				rotationvector:*rotationfriction				
				Local h:_vector2=New _vector2
				h.copy(shiftmust)
				h.sub(shift)
				h.mul(shiftvelocity)
				shiftvector.add(h)
				shift.add(shiftvector)
				shiftvector.mul(shiftfriction)
				EndMethod
	Method animate()
				animatecurve()
				'animateinput()
				animatenaturality()
				updatemesh()
				updateshadow()
				updatelighting()

				EndMethod
	Method canturn:Int()
				If pile=Null Return(False)
				If(pilelink.prevlink()<>Null) Return(False)
				If(curving=True) Return(False)
				If(game.picklist.count()>0) Return(False)
				For Local c:_card=EachIn pile.cardlist
				 If c.curving=True Return(False)
				Next				
				Return(True)
				EndMethod
	Method canpick:Int()
				If pile=Null Return(False)
				Local pd:_pilediscard=_pilediscard(pile)
				If pd Return(False)
				Local ps:_pilestock=_pilestock(pile)
				If ps Return(False)
	 			'If pickending Return(False)
				If curving Return(False)
				For Local c:_card=EachIn game.picklist
				 If c.picked=True Return(False)
				Next
				If pile.nopickifcardcurving
				 For Local c:_card=EachIn pile.cardlist
				  If c.curving=True Return(False)
				 Next
				EndIf
				'apply the pickrule states (give)
				Return(pile.canpick(Self))
				EndMethod	
	Method depick(clock:_clock)
				Local n#=0
				Local i#=0
				For Local cit:_card=EachIn game.picklist
				 If cit=Self
				  n=i
				 EndIf
				 i:+1
				Next
			 	curvevx.set(vx.x,vx.y,vx.z, pickvx.x,pickvx.y,pickvx.z, 0,0,0 ,0,0,0)  
			 	curvevy.set(vy.x,vy.y,vy.z, pickvy.x,pickvy.y,pickvy.z, 0,0,0 ,0,0,0)  
				curveposition.set(position.x,position.y,position.z, pickposition.x,pickposition.y,pickposition.z, 0,0,-n*5,0,0,0)
				curvespeed=40
				startcurve(clock)
				pickending=True
				EndMethod
	Method compare:Int(o:Object)
				Local c:_card=_card(o)
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
				EndMethod		
	Method turnedup:Int()
				If polygon().normal.z>0 Return(True) Else Return(False)
				EndMethod
	Method turnedupatcurveend:Int()
				Local va:_vector3=New _Vector3
				Local vb:_vector3=New _Vector3
				va.copy(curvevx.o1)
				va.norm()
				vb.copy(curvevy.o1)
				vb.norm()
				va.crossproduct(vb)
				If va.z<=0 Return(True) Else Return(False)
				EndMethod

	Method turn(clock:_clock,spd#=15,useundo=True)
				Local v:_vector3=New _vector3
				Local pileold:_pile=pile
				deinsertpile()
			    v.copy(pileold.dropposition())
				insertpile(pileold,True)
				'nun auf die dropposition v den differnzvektor mit der next karte bilden
				'wenn es keiune nächste karte gibt dann pileposition nehmen
				curvespeed=spd
				curveposition.set(position.x,position.y,position.z, v.x,v.y,v.z, 0,0,-10,0,0,10)
			 	curvevx.set(vx.x,vx.y,vx.z, -vx.x,-vx.y,-vx.z, 0,0,10 ,0,0,-10)  
			 	curvevy.set(vy.x,vy.y,vy.z, vy.x,vy.y,vy.z-game.solitaire.cardslope, 0,0,0 ,0,0,0)  
			     'undo record move
			    If useundo
				 Local m:_animationundo=game.createundo(spd,1)
				 m.use(Self,pile,True,0,0,0,pile,True,0,0,0,curveposition,curvevx,curvevy)
				EndIf
				'end undo record move
				startcurve(clock)	
				EndMethod 
	Method normcardplane()
				Local h:_vector3=New _vector3
				h.copy(vx)
				h.crossproduct(vy)
				h.crossproduct(vx)
				vy.copy(h)
				vx.norm()
				vx.mul(3)'solitaire.cardwidth)
				vy.norm()
				vy.mul(6)'solitaire.cardheight)
				EndMethod
	Method normcardplanetransformed(vvx:_vector3,vvy:_vector3)
				Local h:_vector3=New _vector3
				h.copy(vvx)
				h.crossproduct(vvy)
				h.crossproduct(vvx)
				vvy.copy(h)
				vvx.norm()
				vvx.mul(3)'solitaire.cardwidth)
				vvy.norm()
				vvy.mul(6)'solitaire.cardheight)
				EndMethod			
	Method updatelighting()
				If visible
				 mesh.visible(True)
				 mesh.clearvertexlight()
	    		 For  Local lit:_light=EachIn solitaire.world.lightlist
				  mesh.determinevertexlight(lit)
				 Next
				 'gra.blendmultiplicative()
				 mesh.vertexalpha(opacity)
				 'If sweetblocked 
				  
				 'EndIf
				 'SetAlpha(0.5)
				 'mesh.vertexalpha(0.5)
				 'mesh.draw(gra,cam)
				 'gra.blend(False)
				Else
				 mesh.visible(False)
				EndIf				

				EndMethod					
	Method updatemesh()
				'function updates the vertex coordinates of the card mesh
				'along the plane vectors position, vx,vy
				Local pit:_polygon
				Local vit:_vertex
				Local i=0
				Local h:_vector3=New _vector3
				Local k:_vector3=New _vector3
				Local n:_vector3=New _vector3
				Local p:_vector3=New _vector3
				Local vvx:_vector3=New _vector3
				Local vvy:_vector3=New _vector3
				'neigung berechnen
				vvx.copy(vx)
				vvx.z=vx.z+neigungx*((position.x-solitaire.cam.position.x)/15)
				normcardplane()
				n.copy(vx)
				n.crossproduct(vy)
				n.norm()
				rotatevector(n,vvx,rotation,vvx)
				rotatevector(n,vy,rotation,vvy)
				normcardplanetransformed(vvx,vvy)
				p.copy(position)
				p.x:+shift.x
				p.y:+shift.y
				p.z:+neigungx*0.8
				For pit=EachIn mesh.polygonlist
				 For vit=EachIn pit.vertexlist
				  If i=0 
				   h.copy(vvx)
				   h.mul(-0.5)
				   k.copy(vvy)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(p)
				   vit.set(h)
				  ElseIf i=1
				   h.copy(vvx)
				   h.mul(+0.5)
				   k.copy(vvy)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(p)
				   vit.set(h)
				  ElseIf i=2
				   h.copy(vvx)
				   h.mul(+0.5)
				   k.copy(vvy)
				   k.mul(+0.5)
				   h.add(k)
				   h.add(p)
				   vit.set(h)
				  ElseIf i=3
				   h.copy(vvx)
				   h.mul(-0.5)
				   k.copy(vvy)
				   k.mul(+0.5)
				   h.add(k)
				   h.add(p)
				   vit.set(h)
				  EndIf 
				  i:+1
				 Next
				 pit.update()
				Next
				mesh.update()
				EndMethod
	Method inner:Int()
				Local a#
				Local b#
				Local vxh:_vector3=New _vector3
				Local vyh:_vector3=New _vector3
				Local mvn:_vector3=New _vector3
				Local e:_vector3=New _vector3
				vxh.copy(vx)
				vyh.copy(vy)
				vxh.mul(0.5)
				vyh.mul(0.5)
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
				Return(False)
				EndMethod 	
	Method innercard:Int(c:_card)
				Local a#
				Local b#
				Local vxh:_vector3=New _vector3
				Local vyh:_vector3=New _vector3
				Local mvn:_vector3=New _vector3
				Local e:_vector3=New _vector3
				vxh.copy(vx)
				vyh.copy(vy)
				vxh.mul(0.5)
				vyh.mul(0.5)
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
				Return(False)
				EndMethod 	
	Method updateshadow()
				Local shadow:_shadow
				If position.z>1'=-0.2
				 For shadow=EachIn shadowlist
				  shadow.valid=False
				 Next
				 Return
				EndIf
				If visible=False
				 For shadow=EachIn shadowlist
				  shadow.valid=False
				 Next
				 Return
				EndIf
				Local sit:TLink=shadowlist.firstlink()
				Local h:_vector3=New _vector3
				Local s:_vector3=New _vector3
				Local o:_vector3=New _vector3
				Local v:_vertex[4]'vom netz
				Local gamma#
				Local i,j
				'v[0]=meshfront.vertex(0)
				'v[1]=meshfront.vertex(rx)
				'v[2]=meshfront.vertex((rx+1)*ry)
				'v[3]=meshfront.vertex((rx+1)*ry+rx)
				
				If sit' And position.z<0
				 i=0
				 For Local pit:_polygon=EachIn mesh.polygonlist
				  For Local vit:_vertex=EachIn pit.vertexlist
				   j=i
				   If i=2 j=3 
				   If i=3 j=2
				   v[j]=vit
				   i:+1
			 	  Next
				 Next
				 For Local lit:_light=EachIn solitaire.world.lightlist	
				  shadow=_shadow(sit.value())
				  shadow.valid=True
				  For Local i=0 To 3				
				   v[i].get(h)
				   h.sub(lit)
				   gamma=-lit.z/h.z
				   If gamma>-1
				    s.set(lit.x+h.x*gamma,lit.y+h.y*gamma,0)
				    shadow.mesh.vertex(i).set(s) 
				   Else
				    shadow.valid=False
				   EndIf 
				  Next
				  sit=sit.nextlink()
				 Next
				 For Local s:_shadow=EachIn shadowlist
				  s.mesh.vertexalpha(opacity*0.2)
				 Next				
				EndIf
				EndMethod
	Method save(s:TStream)
				WriteLine(s,"_card")
				WriteLine(s,savename)		
				WriteInt(s,visible)
				WriteInt(s,suit)
				WriteInt(s,number)
				position.save(s)
				vx.save(s)
				vy.save(s)
				WriteFloat(s,rotation)
				WriteFloat(s,rotationmust)
				WriteFloat(s,rotationvector)
				WriteFloat(s,rotationvelocity)
				WriteFloat(s,rotationfriction)
				shift.save(s)
				shiftmust.save(s)
				shiftvector.save(s)
				WriteFloat(s,shiftvelocity)
				WriteFloat(s,shiftfriction)
				savepointer(s,parent[0])
				savepointer(s,parent[1])
				savepointer(s,child[0])
				savepointer(s,child[1])
				savepointer(s,labyrinth)
				WriteInt(s,labindex[0])
				WriteInt(s,labindex[1])
				savepointer(s,sweetmatch)
				WriteInt(s,sweetindex[0])
				WriteInt(s,sweetindex[1])
				Print "karte save sw0="+sweetindex[0]
				Print "karte save sw1="+sweetindex[1]
				
				WriteInt(s,sweetblocked)
				curveposition.save(s)
				curvevx.save(s)
				curvevy.save(s)
				WriteFloat(s,curvepositiont)
				WriteFloat(s,curvevxt)
				WriteFloat(s,curvevyt)
				WriteInt(s,curving)
				Print "karte save curveing="+curving
				WriteFloat(s,curvespeed)
				WriteInt(s,curvetime)'!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				WriteInt(s,picked)
				pickposition.save(s)
				pickvx.save(s)
				pickvy.save(s)
				WriteInt(s,pickending)
				EndMethod									
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)	
				visible=ReadInt(s)
				suit=ReadInt(s)
				number=ReadInt(s)
				position.Load(s)
				vx.Load(s)
				vy.Load(s)
				rotation=ReadFloat(s)
				rotationmust=ReadFloat(s)
				rotationvector=ReadFloat(s)
				rotationvelocity=ReadFloat(s)
				rotationfriction=ReadFloat(s)
				shift.Load(s)
				shiftmust.Load(s)
				shiftvector.Load(s)
				shiftvelocity=ReadFloat(s)
				shiftfriction=ReadFloat(s)
				loadpointer(s)
				loadpointer(s)
				loadpointer(s)
				loadpointer(s)
				loadpointer(s)
				labindex[0]=ReadInt(s)
				labindex[1]=ReadInt(s)
				loadpointer(s)
				sweetindex[0]=ReadInt(s)
				sweetindex[1]=ReadInt(s)
				Print "karte load sw0="+sweetindex[0]
				Print "karte load sw1="+sweetindex[1]
				sweetblocked=ReadInt(s)
				curveposition.Load(s)
				curvevx.Load(s)
				curvevy.Load(s)
				curvepositiont=ReadFloat(s)
				curvevxt=ReadFloat(s)
				curvevyt=ReadFloat(s)
				curving=ReadInt(s)
				Print "karte load curveing="+curving
				curvespeed=ReadFloat(s)
				curvetime=ReadInt(s)'!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				picked=ReadInt(s)
				pickposition.Load(s)
				pickvx.Load(s)
				pickvy.Load(s)
				pickending=ReadInt(s)
				
				EndMethod									
	Method assoziieren()
				If pointerloaded()
				 
				 parent[0]=_card(associatepointer())
				 parent[1]=_card(associatepointer())
				 child[0]=_card(associatepointer())
				 child[1]=_card(associatepointer())
				 labyrinth=_pilelabyrinth(associatepointer())
				 sweetmatch=_pilesweetmatch(associatepointer())
				 releasepointer()
				EndIf
				Local poly:_polygon=_polygon(mesh.polygonlist.firstlink().value())
				poly.texture[0,0]=game.solitaire.tcard[game.solitaire.cardtexturefrontindex,suit+number*4]
			 	poly.texture[1,0]=game.solitaire.tcardback[game.solitaire.cardtexturebackindex]	
			    updatemesh()
			 	clearshadow()
				createshadow()					 
				updateshadow()
				EndMethod									
	EndType
'******************************************************************************************************************
'										T A B L E A U
'******************************************************************************************************************
Type _tableau
	Field game:_game=Null
	Field pilelist:TList=Null
	'Field position:_vector3=Null
	

	Method New()
				pilelist=CreateList()
				'position=New _vector3
				EndMethod
	Method Delete()
				EndMethod		
	Method init(g:_game)
				game=g
				EndMethod
	Method pile:_pile(index)			
				Local i=0
				Local l:TLink=pilelist.firstlink()
				If l
				 Repeat 
				  If i=index Return(_pile(l.value()))
				  i:+1
				  l=l.nextlink()
				 Until l=Null
				EndIf
				Return(Null)
				EndMethod
	Method emptypile:Int()'return true if any pile is empty
				For Local pit:_pile=EachIn pilelist
				 If pit.cardlist.count()=0 Return(True)
				Next
				Return(False)
				EndMethod					
	Method cardcount:Int()
				Local c=0
				For Local pit:_pile=EachIn pilelist
				 c:+pit.cardcount()
				Next
				Return(c)
				EndMethod				
	Method draw(gra:_graphics,cam:_camera)
	            For Local pit:_pile=EachIn pilelist
				 pit.draw(gra,cam)
				Next
				EndMethod
	Method animate(c:_clock)
	            For Local pit:_pile=EachIn pilelist
				 pit.animate(c)
				Next
				EndMethod


	
	EndType	
