'Project : Solitaire
'Modul : game
'date of create : 01.11.2007
'date of change : 01.11.2007


'Global tabx#=3.2
'Global taby#=4.7
'Global cardwidth#=3
'Global cardheight#=6
'Global cardtableaushift#=1.2
'Global cardtableaushiftbacksided#=0.4
Global camfovfacx#=25
Global camfovfacy#=25


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
				'Print "Vor dem Laden gibt es "+storeablelist.count()+" Storeables"
				'Print "...davon stats storeables :"+countstatsstoreables()
				'Print "...davon anim storeables :"+countanimationstoreables()
				'Print "...davon game storeables :"+countgamestoreables()
				'Print "...davon pile storeables :"+countpilestoreables()
				'Print "...davon card storeables :"+countcardstoreables()
				
				Local s:TStream
				s=ReadFile("game"+gamenamesstore[cur_game]+".sol")
				If s 
				 Local index=ReadInt(s)
				 
				 gt=ReadLine(s)
				 game=solitaire.newgame(index)
				 Rem
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
				  game=New _gameosmosis
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
				  game=New _gamesweetmatch
				 ElseIf index=39
				  game=New _gameveryeasy
				 EndIf		
				 EndRem
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
				   ElseIf pt="_pilemaze"
				    pit=game.createpilemaze(0,0,9)
				   ElseIf pt="_pilearray"
				    pit=game.createpilearray(0,0,1,1)
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
				 'Local ps:_pilesweetmatch=game.pilesweetmatch(0)
				 'If ps
				  'Print "erster Integritätscheck nach dem Laden von pilesweetmatch"
				  'ps.checkintegrity()
				 'EndIf
				 '*************************************************************				
				 CloseStream s
				Else
				 'messagebox("Dieser Spieltyp wurde bisher noch nicht gespeichert.")
				 'speicherdatei nicht vorhanden
				EndIf
				'Print "Nach dem Laden gibt es "+storeablelist.count()+" Storeables"
				'Print "...davon stats storeables :"+countstatsstoreables()
				'Print "...davon anim storeables :"+countanimationstoreables()
				'Print "...davon game storeables :"+countgamestoreables()
				'Print "...davon pile storeables :"+countpilestoreables()
				'Print "...davon card storeables :"+countcardstoreables()
				game.update()
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
				EndMethod			
	Method clear()
				Local l:TList=CreateList()
				Local eit:_gamestatsentry=Null
				For eit=EachIn entrylist
				 l.addlast(eit)
				Next
				For eit=EachIn highscorelist
				 l.addlast(eit)
				Next
				For eit=EachIn l
				 eit.clear()
				Next
				l.clear()
				entrylist.clear()
				highscorelist.clear()
				clearstoreablelink()
				EndMethod
	Method clearhighscorelist()
				Local l:TList=CreateList()
				Local eit:_gamestatsentry=Null
				For eit=EachIn highscorelist
				 l.addlast(eit)
				Next
				For eit=EachIn l
				 eit.clear()
				Next
				l.clear()
				highscorelist.clear()
				EndMethod
	Method clearentrylist()
				Local l:TList=CreateList()
				Local eit:_gamestatsentry=Null
				For eit=EachIn entrylist
				 l.addlast(eit)
				Next
				For eit=EachIn l
				 eit.clear()
				Next
				l.clear()
				entrylist.clear()
				EndMethod		
	Method countuser:Int(u$)
				Local i=0
				For Local eit:_gamestatsentry=EachIn entrylist
				' Print eit.user+" =?= "+u
				 If eit.user=u i:+1
				Next				
				Return(i)
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
	Method timeaverageuser#(u$)
				Local t#=0
				Local c=0
				For Local eit:_gamestatsentry=EachIn entrylist
				 If(eit.user=u)
				  t:+eit.time
				  c:+1
				 EndIf
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
	Method moveaverageuser#(u$)
				Local m#=0
				Local c=0
				For Local eit:_gamestatsentry=EachIn entrylist
				 If(eit.user=u)
				  m:+eit.moves
				  c:+1
				 EndIf
				Next
				If c>0 m:/Float(c)
				Return(m)
				EndMethod
	Method discardaverage#()
				Local m#=0
				Local c=0
				For Local eit:_gamestatsentry=EachIn entrylist
				 m:+eit.discards
				 c:+1
				Next
				If c>0 m:/Float(c)
				Return(m)
				EndMethod
	Method discardaverageuser#(u$)
				Local m#=0
				Local c=0
				For Local eit:_gamestatsentry=EachIn entrylist
				 If(eit.user=u)
				  m:+eit.discards
				  c:+1
				 EndIf
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
	Method quoteuser:Float(u$)
				If entrylist.count()=0 Return(0)
				Local c#
				Local n#=0
				For Local eit:_gamestatsentry=EachIn entrylist
				 If(eit.user=u)
				  If eit.successful() n:+1
				  c:+1
				 EndIf
				Next
				Return(n/c)
				EndMethod				
	Method save(s:TStream)
				WriteLine(s,"_gamestats")
				WriteLine(s,savename)
				WriteInt(s,gametype)
				WriteInt(s,entrylist.count())
				'Print "savestatsentrieslistcount="+entrylist.count()
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
				'Print "loadstatsentrycount="+z
				If z>0
				 For Local i=0 To z-1
				  Local eit:_gamestatsentry=New _gamestatsentry
				  eit.init(Self)
				  Local t$=ReadLine(s)
				  eit.Load(s)
				 Next
				EndIf
				'entrylist.sort()
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
	Field date:Int=0
	Field discards:Int=0
	Field time#=0'seconds
	Field moves:Int=0'count of moves
	Field undos:Int=0'count of undos
	Field tipps:Int=0'count of tipps	
	Field closed=False
	Field highscored=False'is the current statsentry copied to highscorelist
	Field inhighscorelist=False'is this a highscoreentry
	Field quoteverlauf#' not for storage, will always be calculated at time
	Method init(g:_gamestats,high=False)
				gamestats=g
				If high
				 link=gamestats.highscorelist.addlast(Self)
				 inhighscorelist=True
				Else
				 link=gamestats.entrylist.addlast(Self)
				EndIf
				EndMethod
	Method clear()
				If link
				 RemoveLink link
				 link=Null
				EndIf
				clearstoreablelink()
				gamestats=Null
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
				'Print "savediscards="+discards
				WriteFloat(s,time)
				WriteInt(s,moves)
				WriteInt(s,undos)
				WriteInt(s,tipps)
				WriteLine(s,user)
				WriteInt(s,date)
				EndMethod
	Method Load(s:TStream)
				loadbegin()
				savename=ReadLine(s)	
				discards=ReadInt(s)
				'Print "loaddiscards="+discards
				time=ReadFloat(s)
				moves=ReadInt(s)
				undos=ReadInt(s)
				tipps=ReadInt(s)	
				user=ReadLine(s)
				date=ReadInt(s)							
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
	Field menu=False
	Field mode=0'0=fantasy, 1=sheepworld
	Field index=0'for external storage !
	Field inuse=False
	Field ended=False
	Field endedbygiveupburn=False
	Field pileinfo:_pile=Null
	Field pileinfoname$=""
	Field pileinfodescription0$=""
	Field pileinfodescription1$=""
	Field pileinfoopacity#=0
	Field pileinfotime#=0
	Field starttime#=0
	'Field timeblowlast#=0
	Field pickstate:Int=0
	Field pickoffsetcard:_card=Null
	Field pickoffsetx#=0
	Field pickoffsety#=0
	Field pickvector:_vector3=Null
	Field pickpositionold:_vector3=Null
	
	Field position:_vector3=Null
	Field vector:_vector3[2]
	Field rectangle:_vector2[2]
	Field rectangletransformed:_vector2[2]
	Field cardwidth#=0
	Field cardheight#=0
	Field carddistance#=0
	Field cardshiftfront#=0
	Field cardshiftback#=0
	Field scaleglobal#=1
	Field translationglobal:_vector3=Null
	
	Field gravityblow:_worldfield=Null
	Field blowing:Int=False

	'Field statsentry:_gamestatsentry=Null
	Field tableau:_tableau=Null
	Field pilelist:TList=Null
	Field pilestocklist:TList=Null
	Field pilewastelist:TList=Null
	Field pilediscardlist:TList=Null
	Field pileredeallist:TList=Null
	Field pilefoundationlist:TList=Null
	Field pilefreecelllist:TList=Null
	Field pilereservelist:TList=Null
	Field pilepyramidlist:TList=Null
	Field pilelabyrinthlist:TList=Null
	Field pilearraylist:TList=Null
	Field pilesweetmatchlist:TList=Null
	Field cardlist:TList=Null
	Field drawlist:TList=Null
	Field picklist:TList=Null
	Field tipplist:TList=Null
	Field blowlist:TList=Null
	Field undolist:TList=Null
	Field undoiterator:TLink=Null
	
Rem
	'tableau pile rule states
	Field pilegivesamesuit=False
	Field pilegiveothersuit=False
	Field pilegivealteratecolor=False
	Field pilegivedescending=False
	Field pilegiveascending=False
	
	Field piletakesamesuit=False
	Field piletakeothersuit=False
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
	Field foundationmirrored=False
	Field foundationpickrestriction=False
	'freecell rule states
	Field freecellpickrestriction=False
EndRem
	'statistics
	Field statsclosed=False
	Field discards:Int=0
	Field time#=0'seconds
	Field moves:Int=0'count of moves
	Field undos:Int=0'count of undos
	Field tipps:Int=0'count of tipps	


	'------------------- tableau tipp iteratoren ---------------------------
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
	'------------------ spezialpile tipp iteratoren -----------------------------
	Field tippreservepile:Int=0
	Field tippreservecard:Int=0
	Field tippstockpile:Int=0
	Field tippwastepile:Int=0
	Field tippredealpile:Int=0
	
	
	'------------------ tipp results ----------------------------------------
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
	Field keyboardinputblocked=False
	
	Field effectindex:Int=0
	Method New()
				animationlist=CreateList()
				cardlist=CreateList()
				pilelist=CreateList()
				drawlist=CreateList()
				picklist=CreateList()
				tipplist=CreateList()
				blowlist=CreateList()
				undolist=CreateList()
				undoiterator=Null
				pilestocklist=CreateList()
				pilewastelist=CreateList()
				pilefoundationlist=CreateList()
				pilediscardlist=CreateList()
				pileredeallist=CreateList()
				pilefreecelllist=CreateList()
				pilereservelist=CreateList()
				pilepyramidlist=CreateList()
				pilelabyrinthlist=CreateList()
				pilearraylist=CreateList()
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

				 cameraup[i]=New _vector3;cameraup[i].set(0,0.8,0)
				 cameraupmenu[i]=New _vector3;cameraupmenu[i].set(0,0.75,0)
				 camerauppreview[i]=New _vector3;camerauppreview[i].set(0,0.8,0)
				Next
				
				position=New _vector3
				vector[0]=New _vector3
				vector[1]=New _vector3
				rectangle[0]=New _vector2
				rectangle[1]=New _vector2
				rectangletransformed[0]=New _vector2
				rectangletransformed[1]=New _vector2
				rectangle[1]=New _vector2
		
				
				position.set((-13.2+18.5)*0.5,(-12.5+10)*0.5,0)
				vector[0].set((18.5--13.2)*0.5,0,0)
				vector[1].set(0,(10--12.5)*0.5,0)
				music=Rand(0,2)
				SeedRnd(MilliSecs())
				foundlist=CreateList()
				founddestposition=CreateList()
				founddestcard=CreateList()
				
				effectindex=Rand(0,1)
				translationglobal=New _vector3
				gravityblow=New _worldfield
				gravityblow.homogen.set(0,0,0)
				gravityblow.creategravitation(0,0,0,-20)
				pickpositionold=New _vector3
				pickvector=New _vector3
				
				autoplaysourpileiterator=Null
				autoplaysourcarditerator=Null
				autoplaydestpileiterator=Null				
				EndMethod
	Method Delete()
				EndMethod	
					
	Method init(s:_solitaire,mode=0)Abstract	
	Method clear(showhighscore=False)
				'ganz sauber entfernen die listenknoten 
				'der _storeable - basen 
				'Print "game::deinit() call"
				If preview=False And menu=False solitaire.takestatistics(showhighscore)
				clearstoreablelink()
				Rem
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
				EndRem
				'Print "game::deinit() : Es wurden "+cc+" Storablelinks gelöscht."
				'--------------------------------------
				'For Local c:_card=EachIn drawlist
				' c.clearshadow()
				'Next
				Local c:_card
				Local cl:TList=CreateList()
				For c=EachIn cardlist
				 cl.addlast(c)
				Next
				For Local pit:_pile=EachIn pilelist
				 For c=EachIn pit.cardlist
				  cl.addlast(c)
				 Next
				Next
				For c=EachIn tipplist
				 cl.addlast(c)
				Next
				For c=EachIn blowlist
				 cl.addlast(c)
				Next
				For c=EachIn cl
				 c.clear()
				Next
				cl.clear()

				For Local pit:_pile=EachIn pilelist
				 cl.addlast(pit)'.clear()
				Next
				For Local pit:_pile=EachIn cl
				 pit.clear()
				Next
				cl.clear()
				
				For Local ait:_animation=EachIn animationlist
				 cl.addlast(ait)
				Next
				For Local ait:_animation=EachIn undolist
				 cl.addlast(ait)
				Next
				For Local ait:_animation=EachIn cl
				 ait.clear()
				Next
				cl.clear()
				animationlist.clear()
				undolist.clear()
				pilelist.clear()
				cardlist.clear()
				blowlist.clear()
				tipplist.clear()
				EndMethod			
	Method initgame(s:_solitaire,m,i)
				solitaire=s
				mode=m
				index=i
				animationlist.clear()
				'disableallrules()
				clearcards()
				cardwidth=solitaire.cardwidth
				cardheight=solitaire.cardheight
				carddistance=solitaire.carddistance
				cardshiftfront=solitaire.cardshiftfront
				cardshiftback=solitaire.cardshiftback
				EndMethod
				
	'tableau pile rule states
	Method tableaugiverestrictionfreecell(b)			
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.giverestrictionfreecell=b
				 Next
				EndIf
				EndMethod
	Method tableaugivesamesuit(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.givesamesuit=b
				 Next
				EndIf
				EndMethod
	Method tableaugiveothersuit(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.giveothersuit=b
				 Next
				EndIf
				EndMethod
	Method tableaugivealteratecolor(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.givealteratecolor=b
				 Next
				EndIf
				EndMethod
	Method tableaugivedescending(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.givedescending=b
				 Next
				EndIf
				EndMethod
	Method tableaugiveascending(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.giveascending=b
				 Next
				EndIf
				EndMethod
	Method tableautakesamesuit(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.takesamesuit=b
				 Next
				EndIf
				EndMethod
	Method tableautakeothersuit(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.takeothersuit=b
				 Next
				EndIf
				EndMethod
	Method tableautakealteratecolor(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.takealteratecolor=b
				 Next
				EndIf
				EndMethod
	Method tableautakeascending(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.takeascending=b
				 Next
				EndIf
				EndMethod
	Method tableautakedescending(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.takedescending=b
				 Next
				EndIf
				EndMethod
	Method tableautakeboth(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.takeboth=b
				 Next
				EndIf
				EndMethod
	Method tableautakewrapped(b)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.takewrapped=b
				 Next
				EndIf
				EndMethod
	Method tableautakeemptynumber(i)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.takeemptynumber=i
				 Next
				EndIf
				EndMethod
	Method tableautakeemptysuit(i)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.takeemptysuit=i
				 Next
				EndIf
				EndMethod
	Method tableaumaximumlength(i#)
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  pit.camerastretch=False
				  pit.maximumlength=i
				 Next
				EndIf
				EndMethod
	'foundation rule states
	Method foundationdescending(b)
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 fit.takedescending=b
				Next
				EndMethod
	Method foundationascending(b)
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 fit.takeascending=b
				Next
				EndMethod
	Method foundationsamesuit(b)
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 fit.takesamesuit=b
				Next
				EndMethod
	Method foundationboth(b)
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 fit.takeboth=b
				Next
				EndMethod
	Method foundationwrapped(b)
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 fit.takewrapped=b
				Next
				EndMethod
	Method foundationmirrored(b)
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 fit.takemirrored=b
				Next
				EndMethod
	Method foundationgiverestriction(b)
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 fit.giverestriction=b
				Next
				EndMethod
				
				
				
	Method startusing()
				If preview=False
				 solitaire.adjustcamera()
				 If inuse=False And ended=False
				  inuse=True
				  If preview=False playsoundstretched(solitaire.sgong,1,0.999,1.00)
				  'statsentry=solitaire.createstatsentry()
				  starttime=solitaire.clock.ms()
				  statsclosed=False
				  discards=0
				  time=0
				  moves=0
				  undos=0
				  tipps=0
				 EndIf
				EndIf
				EndMethod
	Method endusing()
				EndMethod				
	Method score:Float()
				Return(discards+Float(1)/Float(1+time))				
				EndMethod	
				Rem					
	Method disableallrules()
				'tableau pile rule states
				pilegivesamesuit=False
				pilegiveothersuit=False
				pilegivealteratecolor=False
				pilegivedescending=False
				pilegiveascending=False
				piletakesamesuit=False
				piletakeothersuit=False
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
				foundationmirrored=False
				foundationpickrestriction=False
				'freecell rule states
				freecellpickrestriction=False
				EndMethod
				EndRem
	Method startanimation()
				For Local ait:_animation=EachIn animationlist
				 ait.start(False)
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
				   a.clear()
				   RemoveLink(animationlist.firstlink())
				  EndIf
				 EndIf
				EndIf
				While animationlist.firstlink()
				 a=_animation(animationlist.firstlink().value())
				 a.start(True)
				 a.skip()
				 a.checkend()
				 a.clear()
				 RemoveLink(animationlist.firstlink())
				Wend
				'end of preparative animation
				'pyramide initialisation
				endpreparation()
				
				EndMethod		
	Method endpreparation()
				For Local pit:_pile=EachIn pilelist
				 Local pp:_pilepyramid=_pilepyramid(pit)
				 If pp
				  pp.initcardpyramid()
				 EndIf
				 For Local cit:_card=EachIn pit.cardlist
				  cit.inpreparation=False
				 Next
			    Next
				For Local cit:_card=EachIn cardlist
				 cit.inpreparation=False
				Next
				tippresetcombination(0)
				tippresetcombination(1)
				tippresetcombination(2)
				tippresetcombination(3)
				EndMethod						
	Method setanimationpreparative()
				For Local ait:_animation=EachIn animationlist
				 ait.preparative=True
				Next
				'weiterhin alle karten in den animationszustand bringen
				For Local cit:_card=EachIn cardlist
				 cit.inpreparation=True
				Next
				EndMethod				
	Method createpiletableau:_piletableau(count:Int,px#,py#,dx#=-1,dy#=0)
				If tableau=Null
				 tableau=New _tableau
				 tableau.init(Self)
				EndIf
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()				
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
	Method createpilemaze:_pilemaze(px#,py#,dim)
				If tableau=Null
				 tableau=New _tableau
				 tableau.init(Self)
				EndIf
				Local pit:_pilemaze=New _pilemaze
				pit.initmaze(tableau,px,py,dim)
				Return(pit)
				EndMethod
	Method createpilestock:_pilestock(px#,py#,tpc,twc,tfc=0,tlc=False)
				Local p:_pilestock=New _pilestock
				p.init(Self,px,py,tpc,twc,tfc,tlc)
				Return(p)
				EndMethod	
	Method createpilestockpyramid:_pilestockpyramid(px#,py#)
				Local p:_pilestockpyramid=New _pilestockpyramid
				p.init(Self,px,py,0,1,0,False)
				Return(p)
				EndMethod	
	Method createpileredeal:_pileredeal(px#,py#,counts=4)
				Local p:_pileredeal=New _pileredeal
				p.init(Self,px,py,counts)
				Return(p)
				EndMethod
	Method createpilereserve:_pilereserve(px#,py#)
				Local p:_pilereserve=New _pilereserve
				p.init(Self,px,py)
				Return(p)
				EndMethod				
	Method createpilewaste:_pilewaste(px#,py#)
				Local p:_pilewaste=New _pilewaste
				p.init(Self,px,py)
				Return(p)
				EndMethod
	Method createpilewastepyramid:_pilewastepyramid(px#,py#)
				Local p:_pilewastepyramid=New _pilewastepyramid
				p.init(Self,px,py)
				Return(p)
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
				Local p:_pilediscard=New _pilediscard
				p.init(Self,px,py)
				Return(p)
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
	Method createpilearray:_pilearray(px#,py#,dimx,dimy)
				Local p:_pilearray=New _pilearray
				p.init(Self,px,py,dimx,dimy)
				Return(p)
				EndMethod			
	Method createpilesweetmatch:_pilesweetmatch(px#,py#,dimx,dimy)
				Local p:_pilesweetmatch=New _pilesweetmatch
				p.init(Self,px,py,dimx,dimy)
				Return(p)
				EndMethod						
	Method clearcards()
				For Local cit:_card=EachIn cardlist
				 cit.clear()
				Next
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
	Method createcard:_card(suit,number)				
				Local cit:_card
				cit=New _card
				cit.init(solitaire,Self,suit,number)
				cit.insertgame()
				Return(cit)
				EndMethod
	Method clearcard(index)
				Local c:_card=card(index)
				c.clear()
				'c.deinsertgame()
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
	Method pilearray:_pilearray(index)
				Local i=0
				For Local pl:_pilearray=EachIn pilearraylist
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
	Method pilestock:_pilestock(index)
				Local i=0
				For Local p:_pilestock=EachIn pilestocklist
				 If i=index Return(p)
				 i:+1
				Next
				Return(Null)
				EndMethod		
	Method pilewaste:_pilewaste(index)
				Local i=0
				For Local p:_pilewaste=EachIn pilewastelist
				 If i=index Return(p)
				 i:+1
				Next
				Return(Null)
				EndMethod		
	Method pileredeal:_pileredeal(index)
				Local i=0
				For Local p:_pileredeal=EachIn pileredeallist
				 If i=index Return(p)
				 i:+1
				Next
				Return(Null)
				EndMethod		
	Method pilesort()
				pilelist.sort()
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
				Local i=0
				Local q
				For Local cit:_card=EachIn cardlist
				 q=i Mod 8
				 cit.opacityquant=q
				 i:+1
				Next
				EndMethod
	Method card:_card(index)
				Local i=0
				Local cit:_card=Null
				For cit=EachIn cardlist
				 If i=index Return(cit)
				 i:+1
				Next
				Return(Null)
				EndMethod		
	Method cardfromlast:_card(index)
				Local i=0
				Local it:TLink=cardlist.lastlink()
				If it
				 Repeat
				  If i=index Return(_card(it.value()))
				  i:+1
				  it=it.prevlink()
				 Until(it=Null)
				EndIf
				Return(Null)
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
	Method cardcount:Int()'returns the total count of cards in the game
				Local c=0
				For Local pit:_pile=EachIn pilelist
				 c:+pit.cardcount()
				Next
				Return(c)
				EndMethod
	Method checkend:Int()
				If discards=gametypediscards[solitaire.currentgame] And ended=False
				 'statsclosed=True
				 ended=True
				 If preview=False playsoundstretched(solitaire.sgong,1,1.5,1.6)
				 If preview=False And menu=False solitaire.takestatistics(True)
				 Return(True)
				EndIf
				Return(False)
				EndMethod
	Method drawpile(gra:_graphics,cam:_camera)
				For Local pit:_pile=EachIn pilelist
				 pit.draw(gra,cam)
				Next	
				EndMethod
	Method drawpilecard(gra:_graphics,cam:_camera)				
				For Local pit:_pile=EachIn pilelist
				 Local it:TLink=pit.cardlist.lastlink()
				 If it
				  Repeat
				   Local cit:_card=_card(it.value())
				   If cit.poly.flag=0 And cit.inpreparation=False cit.draw(gra,cam)
				   'If cit.picked=False And cit.curving=False And cit.inpreparation=False cit.draw(gra,cam)
				   it=it.prevlink()
				  Until it=Null
				 EndIf
				Next	
				EndMethod
	Method drawpilecardshadowneigung(gra:_graphics,cam:_camera)				
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  If cit.neigungx<-0.01
				   Local op#=Abs(cit.neigungx/solitaire.cardslopepick)
				   Local sit:_shadowsingle=Null
				   If cit.shadowarraycount>0
				    For Local i=0 To cit.shadowarraycount-1'sit:_shadow=EachIn cit.shadowlist
				     sit=cit.shadowarray[i]
				     sit.mesh.vertexalpha(op*cit.opacity*sit.opacity*0.35)
				     sit.draw(gra,cam)
				    Next
				   EndIf
				  EndIf
				 Next
				Next	
				EndMethod				
	Method drawcard(gra:_graphics,cam:_camera)'alle die in cardlist sind, aber sortiert
				For Local c:_polygon=EachIn drawlist
				 If c.flag=2 c.draw(gra,cam)
				Next
				EndMethod				
	Rem
	Method drawblow(gra:_graphics,cam:_camera)'alle die in blowlist sind, aber sortiert
				If blowlist.firstlink()
				 For Local c:_polygon=EachIn drawlist
				  If c.flag=3 c.draw(gra,cam)
				 Next
				EndIf
				EndMethod				
				EndRem
	Method drawnocurving(gra:_graphics,cam:_camera)
				For Local c:_polygon=EachIn drawlist
				 If c.flag=0 c.draw(gra,cam)
				Next
				EndMethod
	Method drawcurving(gra:_graphics,cam:_camera)
				For Local c:_polygon=EachIn drawlist
				 If c.flag=1 c.draw(gra,cam)
				Next
				EndMethod

	Method draw(gra:_graphics,cam:_camera)
				drawlist.sort()
				For Local c:_polygon=EachIn drawlist
				 c.draw(gra,cam)
				Next
				EndMethod
	Method drawshow(gra:_graphics,cam:_camera)
				For Local pit:_pile=EachIn pilelist
				 pit.drawshow(gra,cam)
				Next	
				EndMethod
	Method animate(c:_clock,keypress)
	
				'Print "ga0"
				'--------------------------------------------------- general animation ----------------------------------------------------
	   			If solitaire.mousebutton[1] And allowpick
	             If inner() And solitaire.guisystem.mouseovergui()=False startusing()
				EndIf
				If statsclosed=False 
				 If solitaire.paused=False  time=solitaire.clock.ms()-starttime
				 discards=0'will be add be eachin pile now later
				EndIf
				If animationlist.firstlink()'process the animations, all inputs must be blocked
				 Local skip=False
				 If (((solitaire.mousebutton[0] Or solitaire.mousebutton[1]) And inner()) Or keypress<>0) And allowpick 'And au=Null
				 'If (((solitaire.mousebutton[0] Or solitaire.mousebutton[1])) Or keypress<>0) And allowpick 'And au=Null
				  skip=True
				  Local a:_animation=_animation(animationlist.firstlink().value())
				  If a.skipable=False skip=False
				 EndIf
				 If skip
				  If(solitaire.usedskipanimation>0) solitaire.usedskipanimation:-1;
				  'solitaire.usedskipanimation=True
				  skipanimation()
				  keyboardinputblocked=True
				 Else
				  Local a:_animation=_animation(animationlist.firstlink().value())
				  a.start(False)
				  If a.animate()=False 
				   'Print "animate ended"
				   a.clear()
				   RemoveLink animationlist.firstlink()
				   If animationlist.firstlink()
				    a=_animation(animationlist.firstlink().value())
				    a.start(False)
				   Else
				    'end of preparative animation
				    'pyramide initialisation
					endpreparation()
				   EndIf
				  Else
				   If solitaire.usedskipanimation>0 And a.skipable
				    solitaire.messagestatusbar(strskipanimationhint,1,100)
				   EndIf
				  EndIf
				 EndIf
				EndIf


				'--------------------------------------------------- tipp animation --------------------------------------------------
				For Local cit:_card=EachIn tipplist
				 cit.animatecurve()
				 cit.animatenaturality()
				 'cit.updatelighting()
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
				
				
				'------------------------------------------------ PICKLISTTRANSFORMATION ----------------------------------------------				
				Local g#=(-2.6-solitaire.cam.position.z)/solitaire.mousevector.z
				Local ix#=solitaire.cam.position.x + g*solitaire.mousevector.x
				Local iy#=solitaire.cam.position.y + g*solitaire.mousevector.y
				Local i#=0
				Local wirk#=0.5
				Local wiri#=1-wirk
				Local df#=0.1/Float(picklist.count())
				Local lit:TLink=picklist.firstlink()
				Local offy#=pickoffsety'solitaire.cardheight/3'Float(picklist.count())*cardtableaushift
				Local offx#=pickoffsetx
				'If pickoffsetcard
				 'Print "pickoffsetcard suit="+pickoffsetcard.suit+" number="+pickoffsetcard.number
				'EndIf
				Local ff#=0
				If lit
				 Repeat
				  Local c:_card=_card(lit.value())
				  'For Local sit:_shadow=EachIn c.shadowlist
				  ' Print sit.opacity 
			  	  'Next
				  
				  ff:-df
				  If c.pickending=False 
				   If solitaire.mouseovercard c.neigungx=-(solitaire.cardslopepick*0.1-c.neigungx*0.9)
				   If solitaire.pointandclickalternative
				    c.position.z=Float(-3.5-solitaire.cardtableaulift-i*solitaire.cardthickness)*(wirk)+c.position.z*(wiri)
				   Else 
				    c.position.set((ix-offx)*(wirk+ff)+c.position.x*(wiri-ff),..
	                (((-i*cardshiftfront)+iy)-offy)*(wirk+ff)+c.position.y*(wiri-ff),..
  		            Float(-2.6-solitaire.cardtableaulift-i*solitaire.cardthickness)*(wirk)+c.position.z*(wiri))
 				   EndIf


					'Print "cxa="+c.position.x
				   c.vy.set(0,cardheight,(-solitaire.cardslope*wirk)+c.vy.z*(wiri))
				   Local hvx:_vector3=New _vector3'c.pile.dropvx()
				   hvx.set(cardwidth,0,0)
				   If c.backsided=False
				    c.vx.add(hvx)
				    c.vx.mul(0.5)
				   Else
				    hvx.mul(-1)
				    c.vx.add(hvx)
				    c.vx.mul(0.5)
				   EndIf
				
				
				
				   'c.vy.norm()
				   'c.vy.mul(cardheight)
				   'c.normcardplane()
				  EndIf
				  i:+1
				  lit=lit.nextlink()
				 Until lit=Null
				EndIf
				'--------------------------------------------- PICKLISTANIMATION ---------------------------------------------				
				If animationlist.firstlink()=Null

				 Local drop=False
				 If solitaire.pointandclick Or solitaire.pointandclickalternative
				  If pickstate=3
				   If solitaire.mousebutton[0]=False
				    pickstate=0
				    drop=True
				   EndIf
				  EndIf
				  If pickstate=2
				   If solitaire.mousebutton[0]
				    pickstate=3
				   EndIf
				  EndIf				  
				 Else
				  If solitaire.mousebutton[0]=False drop=True
				 EndIf
				 
				
				 If drop And picklist.firstlink()
				  Local card:_card=_card(picklist.firstlink().value())
				
					If solitaire.pointandclickalternative=False'----------------------
					 Local firstpile:_pile=card.pile
				     If firstpile.inner()
					  If firstpile.candrop(picklist)
					   firstpile.drop(c)
					  Else
					   card.depick(c)
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
					Else'----------------------------------------------------------
				     'check other piles
				     Local dr=False
				     For Local pit:_pile=EachIn pilelist
				      'If pit<>card.pile
					  If pit.inner()
				       If(pit.candrop(picklist))
				        If dr=False 
	 			         pit.drop(c)
		 		         dr=True
			 	 	    EndIf
				       EndIf
				 	  EndIf
				     Next
				     If dr=False card.depick(c)
					EndIf
				   'EndIf
				  'Next
				
				
				
				
				 EndIf
				
				 If solitaire.pointandclick Or solitaire.pointandclickalternative
				  If pickstate=1
				   If solitaire.mousebutton[0]=False pickstate=2
				  EndIf 
				  If pickstate=0
				   If solitaire.mousebutton[0]
				   Local ps1=False
				   For Local cit:_card=EachIn picklist
				    If cit.picked=True And cit.pickending=False ps1=True
				   Next
				   If ps1 pickstate=1
				   EndIf
				  EndIf
				 EndIf
				
				
				
				EndIf			
				'Print "picklistcount "+picklist.count()
				'Print "pickstate "+pickstate
				'--------------------------------------- pile & card animation-----------------------------------------
				'Print "ga1"
				pileinfo=Null
				For Local pit:_pile=EachIn pilelist
				 pit.animate(c)
				Next
				For Local cit:_card=EachIn cardlist
				 cit.animate()
				Next				
				Local ntpit#=c.ms()
				Local dtpit#=ntpit-pileinfotime
				pileinfotime=ntpit
				dtpit:/1000
				If pileinfoopacity>0
				 pileinfoopacity:-dtpit
				 If pileinfoopacity<0 pileinfoopacity=0
				EndIf
				'--------------------------------------- animate effects --------------------------------------------
				animateeffects()
				'--------------------------------------- auto moves -------------------------------------------------
				If automoveundodelay=False
				 automove()
				Else
				 If solitaire.clock.ms()-automoveundostart>3500 automoveundodelay=False
				EndIf
				'-------------------------------------- keyboard ------------------------------------------------
				If keyboardinputblocked
				 If keypress=0
				  keyboardinputblocked=False
				 EndIf
				EndIf
				'-------------------------------------- end checking ------------------------------------------------
				checkend()
				EndMethod
	Method animateeffects()
				'-------------------------------------------- card fire animation ------------------------------------------------------
				If Picklist.firstlink()
				 Local o:_vector3=New _vector3
				 Local v:_vector3=New _vector3
				 Local para:_vector2=New _vector2
				 Local time#=solitaire.clock.ms()
				 o.copy(solitaire.cam.position)
				 For Local cit:_card=EachIn picklist
				  Local inner=False
				  For Local lit:_candle=EachIn solitaire.candlegamelist
				   If lit.sparked And solitaire.sparkingmouse 
				    'nicht mit dieser
				   Else
				    v.copy(lit)
				    v.sub(solitaire.cam.position)
				    If cit.innerline(o,v,para)
				     inner=True
				    EndIf
				   EndIf
				  Next
				  If inner
				   If cit.fire   
				    If cit.fire.active=False solitaire.messagestatusbar(strcardburn,1,500)
				    If cit.fireinner=False
				     cit.fireinner=True
				     cit.fireakkustart=time
				    Else
				     cit.fireakku=time-cit.fireakkustart
				    EndIf
				    If cit.fireakku>1000 
				     If cit.fire.active=False And cit.fire.burnopacity>0.99
				      cit.fire.activate()
				      cit.fire.generateburnpoints(para)
				     EndIf
				    EndIf
			       EndIf	
				  Else 
				   cit.fireakku=0	
				   cit.fireinner=False
				  EndIf
				  'cit.fire.animateburnpoints()
				 Next
				EndIf
				'------------------------------------------------- blow effect animation -----------------------------------------
				If blowlist.firstlink()
				 If blowing=False blowing=True
				 Local s:_vector3=New _vector3
				 Local gamma#
				 'g : s=cam.position+cam.vector*a
				 s.copy(solitaire.mousevector)
				 gamma=-solitaire.cam.position.z/s.z 
				 s.mul(gamma)
				 s.add(solitaire.cam.position)
				 For Local dit:_fielddivergence=EachIn gravityblow.divergencelist
				  dit.position.copy(s)
				 Next				
				
			 	 Local cl:TList=CreateList()
				 For Local c:_card=EachIn blowlist
				  c.position.z:-0.0001
				  c.position.z:*1.0001
				  c.animatephysics()
				  c.updatemesh()
				  c.updateshadow()
				  If c.opacity<0.01
				   cl.addlast(c)
				  EndIf
				 Next
				 For Local c:_card=EachIn cl
				  c.clear()
				 Next

				Else
				 If blowing=True
				  blowing=False
				  updateshadowarray()
				 EndIf
				EndIf
				'----------------------------------------------- pickvector effect -------------------------------------------------
				If picklist.firstlink()
				 Local fcl:TLink=picklist.firstlink()
				 If fcl
				  Local fc:_card=_card(fcl.value())
				  pickvector.copy(fc.position)
				  pickvector.sub(pickpositionold)
				  pickpositionold.copy(fc.position)
				  'Print "pvl="+ pickvector.length()
				 EndIf
				EndIf
				EndMethod				
	Method deinsertpick()
				While(picklist.firstlink())
				 Local l:TLink=picklist.firstlink()
				 Local c:_card=_card(l.value())
				 c.depick(solitaire.clock)
				Wend
				EndMethod				
	Method deinsertforblow:TList()
				Local cl:TList=CreateList()
				For Local cit:_card=EachIn cardlist
				 cl.addlast(cit)
				Next
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  cl.addlast(cit)
				 Next
				Next
				For Local cit:_card=EachIn cl
				 cit.deinsertforblow()
				Next
				Return(cl)
				EndMethod				
				
	Method insertblowlist(cl:TList)
				For Local cit:_card=EachIn cl
				 cit.insertblow(Self)
				Next
				updateshadowarray()
				
				'timeblowlast=solitaire.clock.ms()
				EndMethod
	Method update()
				'update all
				For Local pit:_pile=EachIn pilelist
				 pit.updatecardmesh()
				 pit.updatemesh()
				Next
				'startanimation()
				'updateplane()
				sigmadiffuse(solitaire.cardlighting)
				'update piledescription
				updatepiledescription()
				EndMethod
	Method updatepiledescription()				
				For Local pit:_pile=EachIn pilelist
				 pit.updatedescription()
				Next	
				EndMethod	
		
	Method opacity(o#)
				For Local cit:_card=EachIn cardlist
				 cit.opacity=o
				 cit.updatemesh()
				Next
				For Local pit:_pile=EachIn pilelist
				 pit.opacity(o)
				 For Local cit:_card=EachIn pit.cardlist
				  cit.opacity=o
				  cit.updatemesh()
				 Next
				Next
				EndMethod				
	Method markforupdateshadow(l:_light)
				Local ms#=solitaire.clock.ms()
				'Print "hi"
				For Local cit:_card=EachIn cardlist
				 cit.meshchangedlasttime=ms
				 cit.updateshadow()

				Next
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  cit.meshchangedlasttime=ms
				  cit.updateshadow()

				 Next
				Next
				EndMethod				
				
	Method updateplane()				
				'update game geometric plane
				
				Rem
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()
				Local x0#=1000,x1#=-1000
				Local y0#=1000,y1#=-1000
				Local cw2#=cardwidth/2
				Local ch2#=cardheight/2
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
				Local dx#=(x1-x0)/2
				Local dy#=(y1-y0)/2
				If dx<3*tabx dx=3*tabx
				If dy<1.5*taby dx=1.5*taby
				vector[0].set(dx,0,0)
				vector[1].set(0,dy,0)
				EndRem
				EndMethod
	Method enlargerectangle()
				rectangle[0].x:-cardwidth/2
				rectangle[0].y:-cardheight/2
				rectangle[1].x:+cardwidth/2
				rectangle[1].y:+cardheight/2
				rectangletransformed[0].copy(rectangle[0])
				rectangletransformed[1].copy(rectangle[1])
				EndMethod
	Method scale(f#)
				scaleglobal:*f
				cardwidth:*f
				cardheight:*f
				carddistance:*f
				cardshiftfront:*f
				cardshiftback:*f
				rectangletransformed[0].mul(f)
				rectangletransformed[1].mul(f)
				
				For Local pit:_pile=EachIn pilelist
				 pit.position.mul(f)
				 pit.radiusx:*f
				 pit.radiusy:*f
				' pit.vector.mul(f)
				 For Local cit:_card=EachIn pit.cardlist
				  cit.position.mul(f)
				  cit.vx.mul(f)
				  cit.vy.mul(f)
				  cit.curveposition.o0.mul(f)
				  cit.curveposition.o1.mul(f)
				  cit.curveposition.updatelength()
				 Next
				Next
				For Local cit:_card=EachIn cardlist
				 cit.position.mul(f)
				 cit.vx.mul(f)
				 cit.vy.mul(f)
				 cit.curveposition.o0.mul(f)
				 cit.curveposition.o1.mul(f)
			     cit.curveposition.updatelength()
				Next
				For Local uit:_animationundo=EachIn undolist
				 uit.scale(f)
				Next
				For Local ait:_animation=EachIn animationlist
				 ait.scale(f)
				Next
				update()
				EndMethod
	Method translate(d:_vector3)
				translationglobal.add(d)
				rectangletransformed[0].x:+d.x
				rectangletransformed[0].y:+d.y
				rectangletransformed[1].x:+d.x
				rectangletransformed[1].y:+d.y
				For Local pit:_pile=EachIn pilelist
				 pit.position.add(d)
				 For Local cit:_card=EachIn pit.cardlist
				  cit.position.add(d)
				  cit.curveposition.o0.add(d)
				  cit.curveposition.o1.add(d)
				 Next
				Next
				For Local cit:_card=EachIn cardlist
				 cit.position.add(d)
				 cit.curveposition.o0.add(d)
				 cit.curveposition.o1.add(d)
				Next
				For Local uit:_animationundo=EachIn undolist
				 uit.translate(d)
				Next
				For Local ait:_animation=EachIn animationlist
				 ait.translate(d)
				Next
				update()
				EndMethod				
	Method tabulatorx#()
				Return(cardwidth+carddistance)
				EndMethod				
	Method tabulatory#()
				Return(cardheight+carddistance)
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
				 'pit.createshadow()
				 For Local cit:_card=EachIn pit.cardlist
				  cit.createshadow()
				 Next
				Next
				For Local cit:_card=EachIn cardlist
				 cit.createshadow()
				Next
				updateshadowarray()
				EndMethod		
	Method updateshadowarray()
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  Local sit:_shadowsingle
				  For Local i=0 To cit.shadowarraycount-1'sit:_shadowsingle=EachIn cit.shadowlist
				   
				   cit.shadowarray[i].updatearray()
				  Next
				 Next
				Next
				For Local cit:_card=EachIn cardlist
				 For Local i=0 To cit.shadowarraycount-1'sit:_shadowsingle=EachIn cit.shadowlist
				  cit.shadowarray[i].updatearray()
				 Next
				Next				  
				EndMethod				
	Method sigmadiffuse(sd#)						
				For Local cit:_card=EachIn cardlist
				 For Local pit:_polygon=EachIn cit.mesh.polygonlist
				  pit.sigmadiffuse=sd
				 Next
				Next
				For Local sit:_pile=EachIn pilelist
				 If sit.mesh     sit.mesh.sigmadiffuse(sd)
				 If sit.meshsuit sit.meshsuit.sigmadiffuse(sd)
				 If sit.meshnumber sit.meshnumber.sigmadiffuse(sd)
				 For Local cit:_card=EachIn sit.cardlist
				  For Local pit:_polygon=EachIn cit.mesh.polygonlist
				   pit.sigmadiffuse=sd
				  Next
				 Next
				Next
				EndMethod		
	Method updatetexture()
				For Local pit:_pile=EachIn pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  Local poly:_polygon=_polygon(cit.mesh.polygonlist.firstlink().value())
				  poly.texture[0,0]=solitaire.tcard[cit.suit+cit.number*4]
			 	  poly.texture[1,0]=solitaire.tcardback[solitaire.cardtexturebackindex]				
				 Next
				Next
				For Local cit:_card=EachIn cardlist
				 Local poly:_polygon=_polygon(cit.mesh.polygonlist.firstlink().value())
				 poly.texture[0,0]=solitaire.tcard[cit.suit+cit.number*4]
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
	Method tipp:Int()
				Return(False)
				EndMethod
	Method autoplay:Int()
				Return(False)
				EndMethod
	Method automove:Int()
				Return(False)
				EndMethod
	Method clickplay:Int(card:_card)
				Return(False)
				EndMethod
	Method createundo:_animationundo(spd#,intv#,reverseiteration=False)
				'achtung alles löschen was nach dem aktuellen iterator kommt
				If undoiterator
				 While (undolist.lastlink()<>undoiterator)
				  Local a:_animationundo=_animationundo(undolist.lastlink().value())
				  If a a.clear()
				  RemoveLink undolist.lastlink()
				 Wend
				Else
				 For Local a:_animationundo=EachIn undolist
				  a.clear()
				 Next
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
	Method activepreparation:Int()'returns true, if an not-undo-animation is active
				If animationlist.firstlink()=Null 
				 Return(False)
				Else
				 Local a:_animation=_animation(animationlist.firstlink().value())
				 If a.preparative Return(True)
				EndIf
				Return(False)
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
	Method getpilediscardminimum:_pilediscard()
				Local r:_pilediscard=Null
				Local c=0
				For Local p:_pilediscard=EachIn pilediscardlist
				 If r=Null
				  If p.cardlist.count()=c r=p
				 EndIf
				Next
				If r=Null
				 For Local p:_pilediscard=EachIn pilediscardlist
				  If r=Null
				   r=p
				  EndIf
				 Next
				EndIf
				Return(r)
				EndMethod				
	Method tipptableaucompleterow:Int()
				If pilediscardlist.firstlink()
				 foundlist.clear()
				 Local ps:_piletableau=Null
				 ps=Null
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  If tipptableaucompleterowpile(pit) ps=pit
				 Next
				 If ps 
				  foundsour=ps
				  founddest=getpilediscardminimum()
				  Return(True) 
				 Else 
			 	  Return(False)
				 EndIf
				EndIf
				Return(False)
				EndMethod		
	Method tippexecutecompleterow()								
				Local i#=0'foundlist.count()
				If pilediscardlist.firstlink()
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
				  Local pd:_pilediscard=getpilediscardminimum()
				  t.add(pd.dropposition())
				  cn.curveposition.setvector(cn.position,t,t0,t1)
				  cn.curvevx.setvector(cn.vx,pd.dropvx(),vn,vn)
				  cn.curvevy.setvector(cn.vy,pd.dropvy(),vn,vn)
				  cn.curvespeed=40
				  cn.startcurve(solitaire.clock)
				  cn.tipplink=tipplist.addlast(cn)
				  cn.cardcontrolopacity=card
				  cn.curveopacity.set(0,0,2,-10)
				  i:+1
				 Next
				EndIf
				EndMethod
	Method tipptableauturn:Int()
	'Print "tippturn:"

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
				   'Print tableau.pilelist.count()
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
				'tippreservepile=0
				'tippreservecard=0
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
			 	 EndIf
				 tippsourpileiterator=tippsourpileiterator.nextlink()
				 If tippsourpileiterator=Null tippsourpileiterator=tableau.pilelist.firstlink()
				 p=_piletableau(tippsourpileiterator.value())
				 tippsourcarditerator=p.cardlist.lastlink()
				ElseIf iteratorpack=1
				 If autoplaydestpileiterator=Null 
				  autoplaydestpileiterator=tableau.pilelist.firstlink()
			 	 EndIf
			     autoplaysourpileiterator=autoplaysourpileiterator.nextlink()
				 If autoplaysourpileiterator=Null autoplaysourpileiterator=tableau.pilelist.firstlink()
				 p=_piletableau(autoplaysourpileiterator.value())
				 autoplaysourcarditerator=p.cardlist.lastlink()
				ElseIf iteratorpack=2
				 If automovedestpileiterator=Null 
				  automovedestpileiterator=tableau.pilelist.firstlink()
			 	 EndIf
				 automovesourpileiterator=automovesourpileiterator.nextlink()
				 If automovesourpileiterator=Null automovesourpileiterator=tableau.pilelist.firstlink()
				 p=_piletableau(automovesourpileiterator.value())
				 automovesourcarditerator=p.cardlist.lastlink()
				ElseIf iteratorpack=3
				 If clickplaydestpileiterator=Null 
				  clickplaydestpileiterator=tableau.pilelist.firstlink()
			 	 EndIf
				 clickplaysourpileiterator=clickplaysourpileiterator.nextlink()
				 If clickplaysourpileiterator=Null clickplaysourpileiterator=tableau.pilelist.firstlink()
				 p=_piletableau(clickplaysourpileiterator.value())
				 clickplaysourcarditerator=p.cardlist.lastlink()
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
		
	Method tippendedcombinationpilewise:Int(iteratorpack,sourstart:TLink)
				If iteratorpack=0
				 If tippsourpileiterator=sourstart Return(True) Else Return(False)
				ElseIf iteratorpack=1
				 If autoplaysourpileiterator=sourstart Return(True) Else Return(False)
				ElseIf iteratorpack=2
				 If automovesourpileiterator=sourstart Return(True) Else Return(False)
				ElseIf iteratorpack=3
				 If clickplaysourpileiterator=sourstart Return(True) Else Return(False)
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
	Method tippcanmove(iteratorpack,samesuit,rowgrow,noempty)
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
				
				
				   Local ls=sourpile.pickrowlengthfromfirst()
				   Local ld=destpile.pickrowlengthfromfirst()
				   If rowgrow				
 				    If destpile.cardlist.count()=0'leeres Feld
				     If ft.count()=ls And ft.count()<sourpile.cardlist.count() listen=True
				    Else 
				     'Print "ld="+ld+"  ls="+ls
				 	 If ((ft.count()+ld)>ls) listen=True
				     'spezielle cruel pile move restriction -----------
				     Local pc:_pilecruel=_pilecruel(sourpile)
				     If pc
				      If pc.nextcardinsequence(_card(ft.firstlink().value())) listen=False
					 EndIf
					 '--------------------------------------------------
				    EndIf
				   Else
				    listen=True
				    If ((ft.count()+ld)<=ls) listen=False
				   EndIf
				
				   If noempty
				    If destpile.cardlist.count()=0 listen=False
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
	Method tipptableau:Int(iteratorpack,samesuit=False,rowgrow=True,noempty=False)
	

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
				 If tippcanmove(iteratorpack,samesuit,rowgrow,noempty) found=True 
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
				 off.set(0,-cardshiftfront,-solitaire.cardthickness)
				 off.mul(i)
				 off.add(founddest.dropposition())
				 cn.curveposition.setvector(cn.position,off,t0,t1)
				 cn.curvevx.setvector(cn.vx,founddest.dropvx(),vn,vn)
				 cn.curvevy.setvector(cn.vy,founddest.dropvy(),vn,vn)
				 cn.curvespeed=solitaire.tippspeed
				 cn.startcurve(solitaire.clock)
				 cn.cardcontrolopacity=card
				 cn.curveopacity.set(0,0,2,-5)'vorher -10 statt -5
				 i:+1
				Next
				EndMethod
	Method tippwaste:Int()
				foundlist.clear()
				foundsour=Null
				If pilewastelist.firstlink()=Null Return(False)
				Local pwit:_pilewaste=Null
				Local found=False
				If tippwastepile>pilewastelist.count()-1 tippwastepile=0 
				Local startpile=tippwastepile
				Repeat  
				 pwit=pilewaste(tippwastepile)
				 If pwit.cardlist.firstlink()
				  foundlist.clear()
				  Local cw:_card=_card(pwit.cardlist.firstlink().value())
				  foundlist.addlast(cw)
				  For Local ptit:_piletableau=EachIn tableau.pilelist
				   If found=False And ptit.candrop(foundlist)
				    found=True
				    foundsour=pwit
				    founddest=ptit
				   EndIf
				  Next
				 EndIf
				 tippwastepile:+1
				 If(tippwastepile>pilewastelist.count()-1) tippwastepile=0
				Until(found Or (tippwastepile=startpile))
				Return(found)
				EndMethod	
	Method tippstock:Int()
				foundlist.clear()
				foundsour=Null
				founddest=Null
				If pilestocklist.firstlink()=Null Return(False)
				Local psit:_pilestock=Null
				Local found=False
				If tippstockpile>pilestocklist.count()-1 tippstockpile=0 
				Local startpile=tippstockpile

				Repeat 
				 'For Local psit:_pilestock=EachIn pilestocklist
				 psit=pilestock(tippstockpile)
				
				
				 If psit.tolabyrinthcount 
				  If psit.cardlist.count()>0
				   Local fit:TLink=psit.cardlist.firstlink()
				   Local pl:_pilelabyrinth=pilelabyrinth(0)
				   If pl And pl.hasfreeline()
				    foundsour=psit
				    founddest=pl
				    For Local j=0 To pl.dimx-1
				     If fit
				      foundlist.addlast(_card(fit.value()))
				      fit=fit.nextlink()
				     EndIf
				    Next
				   EndIf
				  EndIf
				 EndIf
				
				 If psit.candeal()
				  If psit.cardlist.count()>0
				   Local fit:TLink=psit.cardlist.firstlink()
				   If psit.topilecount>0 And tableau.pilelist.count()>0
				    For Local i=0 To tableau.pilelist.count()-1
				     For Local j=0 To psit.topilecount-1
				      If fit
				       foundlist.addlast(_card(fit.value()))
				       fit=fit.nextlink()
				      EndIf
				     Next
				    Next 
				   EndIf
				   If psit.towastecount>0
				    For Local i=0 To psit.towastecount-1
				     If fit
				      foundlist.addlast(_card(fit.value()))
				      fit=fit.nextlink()
				     EndIf
				    Next				   
				   EndIf
				   If psit.tofoundationcount>0
				    For Local pit:_pile=EachIn pilefoundationlist
				     For Local c=0 To psit.tofoundationcount-1
				      If fit
				       foundlist.addlast(_card(fit.value()))
				       fit=fit.nextlink()
				      EndIf      
				     Next
		 		    Next
				   EndIf
				   If foundlist.firstlink()
				    foundsour=psit
				    found=True
				   EndIf
				  EndIf
			 	 EndIf
				 If psit.cardlist.firstlink()=Null And psit.waste() And psit.towastecount>0' redeal
				  If psit.canredeal() And psit.cardcountinwaste()>0
				   foundlist.clear()
				   If psit.wasteiteration=False
				    Local it:TLink=psit.waste().cardlist.firstlink()
				    If it
				     Repeat
				      If it foundlist.addlast(_card(it.value()))
				      it=it.nextlink()
				     Until it=Null
				    EndIf
				   Else
				    For Local pwit:_pilewaste=EachIn pilewastelist
				     Local it:TLink=pwit.cardlist.firstlink()
				     If it
				      Repeat
				       foundlist.addlast(_card(it.value()))
				       it=it.nextlink()
				      
				      Until it=Null
				     EndIf
				    Next
				   EndIf
				   foundsour=psit
				   found=True
				   'Print "foundstock"
				  EndIf
				 EndIf
				
				
				'Next
				 tippstockpile:+1
				 If(tippstockpile>pilestocklist.count()-1) tippstockpile=0
				Until(found Or (tippstockpile=startpile))
				
				
				Return(found)
				EndMethod	
	Method tippstockpyramid:Int()
				foundlist.clear()
				If pilestocklist.firstlink()=Null Return(False)
				Local psit:_pilestock=Null
				Local found=False
				If tippstockpile>pilestocklist.count()-1 tippstockpile=0 
				Local startpile=tippstockpile
				Repeat 
				 psit=pilestock(tippstockpile)
				 If psit.candeal() And psit.cardcountinwaste()>0

				  If psit.cardlist.count()>0
				   Local fit:TLink=psit.cardlist.firstlink()
			       foundlist.addlast(_card(fit.value()))
				   foundsour=psit
			       found=True'dealen
				  Else
				   If psit.waste() 
				    If psit.canredeal()
				     foundsour=psit
				     found=True'backsort
				    EndIf
				   EndIf
				  EndIf
				 EndIf
				 tippstockpile:+1
				 If(tippstockpile>pilestocklist.count()-1) tippstockpile=0
				Until(found Or (tippstockpile=startpile))
				Return(found)
				EndMethod			
	Method tippexecutestock()
				Local fit:TLink=foundlist.firstlink()
				If _pilestock(foundsour).tolabyrinthcount
				 
				 Local pl:_pilelabyrinth=_pilelabyrinth(founddest)'pilelabyrinth(0)
				 If pl And pl.hasfreeline()
				  Local free=pl.freeline()
				  For Local j=0 To pl.dimx-1
				   If fit
				    Local card:_card=_card(fit.value())
				    Local cn:_card=New _card
				    cn.copy(card)
				    Local v:_vector3=pl.droppositionat(j,free)
				    cn.tipplink=tipplist.addlast(cn)
				    cn.curvespeed=solitaire.tippspeed
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
								
				If(_pilestock(foundsour).topilecount>0)
			 	 For Local pit:_pile=EachIn tableau.pilelist
				  For Local c=0 To _pilestock(foundsour).topilecount-1
				   If fit
				    Local card:_card=_card(fit.value())
				    Local cn:_card=New _card
				    cn.copy(card)
				    Local v:_vector3=pit.dropposition()
				    cn.tipplink=tipplist.addlast(cn)
				    cn.curvespeed=solitaire.tippspeed
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
				If _pilestock(foundsour).towastecount
				 If foundsour.cardlist.count()>0
				
				
				  Local pit:_pile=_pilestock(foundsour).waste()
				  If pit
				   Local wpit=_pilestock(foundsour).wastepartner
				   Local fit:TLink=foundsour.cardlist.firstlink()
				   For Local cw=0 To _pilestock(foundsour).towastecount-1
				    If fit
				     Local card:_card=_card(fit.value())
				     Local cn:_card=New _card
				     cn.copy(card)
				     cn.tipplink=tipplist.addlast(cn)
				     Local v:_vector3=pit.dropposition()
				     cn.curvespeed=solitaire.tippspeed*0.5
				     cn.curveposition.o0.copy(cn.position)
					 cn.curveposition.o1.copy(v)
					 cn.curveposition.v0.set( -Float(cw)*7,0,-10)
					 cn.curveposition.v1.set(0,0,10)
					 cn.curveposition.updatelength()
				     If _pilestock(foundsour).open cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, cn.vx.x,cn.vx.y,cn.vx.z, 0,0,-10,0,0,10) Else cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				     cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z, 0,0,-10,0,0,0)
				     cn.startcurve(solitaire.clock)
				     cn.cardcontrolopacity=card
				     cn.curveopacity.set(0,0,2,-10)
					 If _pilestock(foundsour).wasteiteration
					  wpit:+1
					  If wpit>pilewastelist.count()-1 wpit=0
					  pit=_pilewaste(pilewaste(wpit))
					 EndIf
				
				     fit=fit.nextlink()
				    EndIf
		 		   Next
		          EndIf
		
		
		
				 Else 
				  
				  If _pilestock(foundsour).canredeal()
				
				   Local fs#=0
				Rem
				
				   If _pilestock(foundsour).wasteiteration
				    Print "stock canredeal2"
				
				    Local loop=True
				    Local source:_pilewaste=Null
				    Local clink:TLink=Null
				    Local wlink:TLink=pilewastelist.firstlink()
				    Repeat
					 wlink=pilewastelist.firstlink()
					 If wlink
					  Repeat
					   clink=_pilewaste(wlink.value()).cardlist.firstlink()
					   If clink source=_pilewaste(wlink.value())
					   wlink=wlink.nextlink()
					  Until clink Or wlink=Null
					 EndIf
					 If clink And source
					  Local card:_card=_card(clink.value())
				      Local cn:_card=New _card
				      cn.copy(card)
				      cn.tipplink=tipplist.addlast(cn)
				      cn.cardcontrolopacity=card
				      cn.curveopacity.set(0,0,2,-10)
				      Local v:_vector3=source.dropposition()
				      cn.curvespeed=solitaire.autospeed*(Float(0.5)/(1+(fs*0.1)))
				      cn.curveposition.set(cn.position.x,cn.position.y,cn.position.z, v.x,v.y,v.z, 0,0,-10-fs,0,0,10+fs)
				      If _pilestock(foundsour).open cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, cn.vx.x,cn.vx.y,cn.vx.z, 0,0,-10,0,0,10) Else cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				      cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z, 0,0,-10,0,0,0)
				      cn.startcurve(solitaire.clock)
				      fs:+1
					 Else
					  loop=False
					 EndIf
				    Until loop=False

 				   Else
					EndRem
				    For Local card:_card=EachIn foundlist
				     Local cn:_card=New _card
				     cn.copy(card)
				     cn.tipplink=tipplist.addlast(cn)
				     cn.cardcontrolopacity=card
				     cn.curveopacity.set(0,0,2,-10)
				     Local v:_vector3=foundsour.dropposition()
				     cn.curvespeed=solitaire.tippspeed*3*(Float(0.5)/(1+(fs*0.1)))
				     cn.curveposition.set(cn.position.x,cn.position.y,cn.position.z, v.x,v.y,v.z, 0,0,-10-fs,0,0,10+fs)
				     If _pilestock(foundsour).open cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, cn.vx.x,cn.vx.y,cn.vx.z, 0,0,-10,0,0,10) Else cn.curvevx.set(cn.vx.x,cn.vx.y,cn.vx.z, -cn.vx.x,-cn.vx.y,-cn.vx.z, 0,0,-10,0,0,10)
				     cn.curvevy.set(cn.vy.x,cn.vy.y,cn.vy.z, cn.vy.x,cn.vy.y,cn.vy.z, 0,0,-10,0,0,0)
				     cn.startcurve(solitaire.clock)
				     fs:+1
				    Next
				   'EndIf
				  EndIf
				 EndIf
				EndIf
				
				If _pilestock(foundsour).tofoundationcount>0
				 For Local pit:_pile=EachIn pilefoundationlist
				  For Local c=0 To _pilestock(foundsour).tofoundationcount-1
				   If fit
				    Local card:_card=_card(fit.value())
				    Local cn:_card=New _card
				    cn.copy(card)
				    cn.tipplink=tipplist.addlast(cn)
				    cn.cardcontrolopacity=card
				    cn.curveopacity.set(0,0,2,-10)
				    Local v:_vector3=pit.dropposition()
				    cn.curvespeed=solitaire.tippspeed
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
				foundlist.clear()
				foundsour=Null
				If pileredeallist.firstlink()=Null Return(False)
				Local psit:_pileredeal=Null
				Local found=False
				If tippredealpile>pileredeallist.count()-1 tippredealpile=0 
				Local startpile=tippredealpile
				Repeat 
				 psit=pileredeal(tippredealpile)
				 If psit.canredeal()
				  foundsour=psit
			      found=True
				 EndIf
				 tippredealpile:+1
				 If(tippredealpile>pileredeallist.count()-1) tippredealpile=0
				Until(found Or (tippredealpile=startpile))
				Return(found)
				EndMethod	
	Method tippexecuteredeal()
	 			If foundsour
				 Local v:_vector3=foundsour.dropposition()
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  For Local cs:_card=EachIn pit.cardlist
				   Local cn:_card=New _card
				   cn.copy(cs)
				   cn.tipplink=tipplist.addlast(cn)
				   cn.curvespeed=solitaire.tippspeed
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
				' Local c:_card=_card(autoplaysourcarditerator.value())
				' If c Print "tippfoundation: sourcard="+c.suit+ "  "+c.number Else Print "tippfoundation: sourcard=null"
				 'c=_card(cardstart.value())
				 'If c Print "              : startcard="+c.suit+ "  "+c.number Else Print "              : startcard=null"
			
				 If tippfoundationcanmove(iteratorpack) found=True 
				 tippiteratecombinationcardwise(iteratorpack)
			 	Until tippendedcombinationcardwise(iteratorpack,sourstart,cardstart) Or found
			    If found=False'---------------------probiere waste pile-----------------------------
			     If pilewastelist.firstlink()
				  foundlist.clear()
				  foundsour=Null
				  founddest=Null
				  If tippwastepile>pilewastelist.count()-1 tippwastepile=0 
				  Local startpile=tippwastepile
				  Local pwit:_pilewaste=Null
				  Repeat
				   pwit=pilewaste(tippwastepile)
				   
				
				   Local it:TLink=pwit.cardlist.firstlink()
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
					  foundsour=pwit
					  found=True
				 	 EndIf
				    EndIf
				   EndIf
				  
				   tippwastepile:+1
				   If tippwastepile>pilewastelist.count()-1 tippwastepile=0 
				  Until (found Or (tippwastepile=startpile))
				
			     EndIf
			    EndIf
			    If found=False'---------------------probiere reserve piles-----------------------------
				 If pilereservelist.firstlink()
				  If tippreservepile>pilereservelist.count()-1 tippreservepile=0 
				  If tippreservecard>pilereserve(tippreservepile).cardlist.count()-1 tippreservecard=0
				  Local startpile=tippreservepile
				  Local startcard=tippreservecard
				  Repeat
				   If pilereserve(tippreservepile).cardlist.count()>0
				    For Local fit:_pilefoundation=EachIn pilefoundationlist
				     If found=False
				      Local cr:_card=pilereserve(tippreservepile).card(tippreservecard);
				      If cr.canpick() 
				       foundlist.clear();
				       cr.pile.pickextern(cr,foundlist);
				       If fit.candrop(foundlist)
				        founddest=fit
				        foundsour=pilereserve(tippreservepile)
				        found=True
				       EndIf			
	  			      EndIf
				     EndIf
				    Next
				   EndIf
				
				   tippreservecard:+1
				   If tippreservecard>pilereserve(tippreservepile).cardlist.count()-1 
				    tippreservecard=0
  				    tippreservepile:+1
				    If tippreservepile>pilereservelist.count()-1 tippreservepile=0 
				   EndIf
				  Until found Or (startpile=tippreservepile And startcard=tippreservecard)
			     EndIf
				EndIf			
				Return(found)
				EndMethod	
	Method tippreservetableau:Int(iteratorpack)
				'Local destcard:_card=Null ' source iteratoren werden als dest iteratoren missbraucht
				Local destpile:_piletableau=Null
				If iteratorpack=0 
				 destpile=_piletableau(tippsourpileiterator.value())
				ElseIf iteratorpack=1
				 destpile=_piletableau(autoplaysourpileiterator.value())
				ElseIf iteratorpack=2
				 destpile=_piletableau(automovesourpileiterator.value())
				ElseIf iteratorpack=3
				 destpile=_piletableau(clickplaysourpileiterator.value())
				EndIf
				foundlist.clear()
				foundsour=Null
				founddest=Null
				Local found=False
				If destpile=Null Return(False);
				Local startpile=tippreservepile
				Local startcard=tippreservecard
				If pilereservelist.count()=0 Return(False);
				If tippreservepile>pilereservelist.count()-1 tippreservepile=0 
				If tippreservecard>pilereserve(tippreservepile).cardlist.count()-1 tippreservecard=0
				Repeat
				 If pilereserve(tippreservepile).cardlist.count()>0
				  Local cr:_card=pilereserve(tippreservepile).card(tippreservecard);
				  If cr.canpick() 
				   foundlist.clear()
				   cr.pile.pickextern(cr,foundlist);
				   If destpile.candrop(foundlist)
				    founddest=destpile
				    foundsour=pilereserve(tippreservepile)
				    found=True
				   EndIf			
				  EndIf
				 EndIf
				 tippreservecard:+1
				 'Print tippreservecard
				 If tippreservecard>pilereserve(tippreservepile).cardlist.count()-1 
				  tippreservecard=0
  				  tippreservepile:+1
				  If tippreservepile>pilereservelist.count()-1 tippreservepile=0 
				 EndIf
				Until found Or (startpile=tippreservepile And startcard=tippreservecard)
				Return(found)				
				EndMethod								
	Method tippreserve:Int(iteratorpack)
				Local found=False
				Local sourstart:TLink=Null
				'------------------------------ kann etwas auf die foundation bewegt werden ? -------------------
				Rem
				Local startpile=tippreservepile
				Local startcard=tippreservecard
				If pilereservelist.count()=0 Return(False);
				If tippreservepile>pilereservelist.count()-1 tippreservepile=0 
				If tippreservecard>pilereserve(tippreservepile).cardlist.count()-1 tippreservecard=0
				Repeat
				
				 For Local fit:_pilefoundation=EachIn pilefoundationlist
				  If found=False
				   Local cr:_card=pilereserve(tippreservepile).card(tippreservecard);
				   If cr.canpick() 
				    foundlist.clear();
				    cr.pile.pickextern(cr,foundlist);
				    If fit.candrop(foundlist)
				     founddest=fit
				     foundsour=pilereserve(tippreservepile)
				     found=True
				    EndIf			
				   EndIf
				  EndIf
				 Next
				
				
				 tippreservecard:+1
				 If tippreservecard>pilereserve(tippreservepile).cardlist.count()-1 
				  tippreservecard=0
  				  tippreservepile:+1
				  If tippreservepile>pilereservelist.count()-1 tippreservepile=0 
				 EndIf
				Until found Or (startpile=tippreservepile And startcard=tippreservecard)
				EndRem
				
				'------------------------------ kann etwas auf das tableau bewegt werden ? -------------------
				If found=False And tableau
				 tippinitcombination(iteratorpack)
				 If iteratorpack=0
				  sourstart=tippsourpileiterator
				 ElseIf iteratorpack=1
				  sourstart=autoplaysourpileiterator
				 ElseIf iteratorpack=2
				  sourstart=automovesourpileiterator
				 ElseIf iteratorpack=3
				  sourstart=clickplaysourpileiterator
				 EndIf
				 Repeat
				  If tippreservetableau(iteratorpack) found=True 
				  tippiteratecombinationpilewise(iteratorpack)
			 	 Until tippendedcombinationpilewise(iteratorpack,sourstart) Or found
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
	Method autoplaymovelist:_piletableau(sourpile:_pile,ft:TList,samesuit,rowgrow,clickplay,noempty)	
				'kernfunktion sucht ein ziel 
				'für die liste ft und gibt es in destpile zurück			
				Local l:TList=CreateList()
				For Local destpile:_piletableau=EachIn tableau.pilelist
				 'Print "autoplaymovelist0"
				 If destpile<>sourpile
				  If destpile.candrop(ft,samesuit)
				   'nun die längenprüfung
				   Local listen=False					
				
				   Local ls=sourpile.pickrowlengthfromfirst()
			 	   Local ld=destpile.pickrowlengthfromfirst()
				   If rowgrow
 				    If destpile.cardlist.count()=0'leeres Feld
				     If ft.count()=ls And ft.count()<sourpile.cardlist.count() listen=True
				    Else 
				     'Print "ld="+ld+"  ls="+ls
				     If ((ft.count()+ld)>ls) listen=True
				     'spezielle cruel pile move restriction -----------
				     'Local pc:_pilecruel=_pilecruel(sourpile)
				     If sourpile.givemaximal=1 And clickplay=False 
				      If sourpile.nextcardinsequence(_card(ft.firstlink().value())) listen=False
					 EndIf
					 '--------------------------------------------------
				    EndIf
				   Else
		 	        listen=True
				    If clickplay=False
				     If ((ft.count()+ld)<=ls) listen=False
				    EndIf
				   EndIf
				   If noempty 
				    'noempty schalter hier nur anwenden, wenn es um eine Karte innerhalb des Tableaus geht
				    Local cf:_card=_card(ft.firstlink().value())
				    Local pt:_piletableau=_piletableau(cf.pile)
				    If pt
				     If destpile.cardlist.count()=0 listen=False
				    EndIf
				   EndIf
				
				   If listen l.addlast(destpile)
				  EndIf
				 EndIf
				Next
			    Local dest:_piletableau=Null
				If rowgrow Or clickplay=False
				 Local c=-1
			 	 For Local pit:_piletableau=EachIn l
			      'Print "autoplaymovelist1"
			      Local r=pit.pickrowlengthfromfirst()
				  If c<r
				   c=r
				   dest=pit
				  EndIf
				 Next
				Else
				 If l.count()>0 
				  Local it:TLink=l.firstlink()
				  Local r=Rand(0,l.count()-1)
				  If r
				   For Local ii=0 To r-1 
				    it=it.nextlink()
				   Next
				  EndIf
				  dest=_piletableau(l.firstlink().value())
				 EndIf
				EndIf
				Return(dest)
				EndMethod
	Method autoplaymovecard:Int(sourpile:_pile,sourcard:_card,samesuit=False,rowgrow=True,clickplay=False,noempty=False)				
				Local destpile:_piletableau=Null'_piletableau(tippdestpileiterator.value())
				Local iit:TLink=sourcard.pilelink
				Local ft:TList=CreateList()
				
				sourpile.pickextern(sourcard,ft)
				'vorher :
				'wurde verallgemeinert !!!!!
				'Repeat
				' ft.addlast(_card(iit.value()))
				' iit=iit.prevlink()
				'Until iit=Null
				
				
				destpile=autoplaymovelist(sourpile,ft,samesuit,rowgrow,clickplay,noempty)
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
	Method autoplaymove:Int(iteratorpack,samesuit=False,rowgrow=True,noempty=False)
				Local sourcard:_card=Null 
				Local sourpile:_pile=Null
				If iteratorpack=0
				 If tippsourcarditerator sourcard=_card(tippsourcarditerator.value())
				 sourpile=_pile(tippsourpileiterator.value())
				ElseIf iteratorpack=1
				 If autoplaysourcarditerator sourcard=_card(autoplaysourcarditerator.value())
				 sourpile=_pile(autoplaysourpileiterator.value())
				ElseIf iteratorpack=2
				 If automovesourcarditerator sourcard=_card(automovesourcarditerator.value())
				 sourpile=_pile(automovesourpileiterator.value())
				ElseIf iteratorpack=3
				 If clickplaysourcarditerator sourcard=_card(clickplaysourcarditerator.value())
				 sourpile=_pile(clickplaysourpileiterator.value())
				EndIf
				foundlist.clear()
				foundsour=Null
				founddest=Null
				If sourcard
				 If sourcard.canpick()
				  If autoplaymovecard(sourpile,sourcard,samesuit,rowgrow,False,noempty)
				   Return(True)
				  EndIf
				 EndIf 
				EndIf
				Return(False)
				EndMethod				
	Method autoplaymovetableau:Int(iteratorpack,samesuit=False,rowgrow=True,noempty=False)
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
				 If autoplaymove(iteratorpack,samesuit,rowgrow,noempty) found=True 
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
				'a.init(Self,foundlist,founddest,1000,0.1,True,udx,udy)
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
	Method clickplaytableaumove:Int(c:_card,samesuit=False,rowgrow=True,noempty=False)
				Local sourpile:_pile=c.pile
				'If sourpile=Null Return(False)
				foundlist.clear()
				foundsour=Null
				founddest=Null
				If autoplaymovecard(sourpile,c,samesuit,rowgrow,True,noempty)
				 Return(True)
				EndIf
				Return(False)
				EndMethod		
	Method clickplaywaste:Int(c:_card,noempty=False)
				Local found=False
				Local pw:_pilewaste=_pilewaste(c.pile)
				If pw=Null Return(False)
				foundlist.clear()
				foundsour=Null
				founddest=Null
				foundlist.addlast(c)
				For Local pit:_piletableau=EachIn tableau.pilelist
				 If found=False And pit.candrop(foundlist)
				  If noempty
				   If pit.cardlist.firstlink() found=True
				  Else
				   found=True
				  EndIf
				  foundsour=pw
				  founddest=pit
				 EndIf
				Next
				Return(found)
				EndMethod						
	Method clickplaycompleterow:Int(c:_card)
				Local it:TLink=c.pilelink
				If c.number<>12 Return(False)
				If pilediscardlist.firstlink()=Null Return(False)
				founddest=getpilediscardminimum()
				Local s=c.suit
				foundsour=c.pile
				foundlist.clear()
				For Local n=12 To 0 Step -1
				 If it=Null Return(False)
				 Local cit:_card=_card(it.value())
				 'If cit.suit<>s Return(False)
				 If cit.number<>n Return(False)
				 foundlist.addlast(cit)
				 it=it.prevlink()
				Next
				Return(True)
				EndMethod				
	Method clickplaytableauemptypile(c:_card)
				foundlist.clear()
				foundsour=Null
				founddest=Null
				For Local pit:_piletableau=EachIn tableau.pilelist
				 If pit.cardlist.firstlink()=Null And founddest=Null
				  founddest=pit
				 EndIf
				Next
				If founddest
				 If c.canpick()
				  foundlist.clear()
				  c.pile.pickextern(c,foundlist)
				  If founddest.candrop(foundlist)
				   foundsour=c.pile
   			       Return(True)
				  EndIf
				 EndIf
				EndIf
				Return(False)
				EndMethod					
	Method clickplayfoundation:Int(c:_card)
				founddest=Null
				foundsour=c.pile
				foundlist.clear()
				'achtung vorher : If c.pilelink.prevlink()<>Null Return(False)
				If c.canpick()=False Return(False)
				c.pile.pickextern(c,foundlist)
				For Local destpile:_pilefoundation=EachIn pilefoundationlist
				 If founddest=Null
				  If destpile.candrop(foundlist) founddest=destpile
				 EndIf
				Next
				If founddest Return(True)				 
				Return(False)
				EndMethod				
	Method clickplayfreecell(card:_card)
				foundlist.clear()
				founddest=Null
				foundsour=Null
				Local pf:_pilefreecell=Null
				card.pile.pickextern(card,foundlist)
				For Local fit:_pilefreecell=EachIn pilefreecelllist
				 If pf=Null
				  If fit.candrop(foundlist) 
				   pf=fit
				  EndIf
				 EndIf
				Next
				If pf 
				 founddest=pf
				 foundsour=card.pile
				 Return(True)
				EndIf
				Return(False)
				EndMethod				
	Method save(s:TStream)
				'WriteLine(s,"_game")
				WriteLine(s,savename)	
				WriteInt(s,allowpick)
				WriteInt(s,preview)
				WriteInt(s,inuse)
				Rem
				WriteInt(s,pilegivesamesuit)
				WriteInt(s,pilegiveothersuit)
				WriteInt(s,pilegivealteratecolor)
				WriteInt(s,pilegivedescending)
				WriteInt(s,pilegiveascending)
				WriteInt(s,piletakesamesuit)
				WriteInt(s,piletakeothersuit)
				WriteInt(s,piletakealteratecolor)
				WriteInt(s,piletakeascending)
				WriteInt(s,piletakedescending)
				WriteInt(s,piletakeemptysuit)
				WriteInt(s,piletakeemptynumber)
				WriteInt(s,foundationdescending)
				WriteInt(s,foundationascending)
				WriteInt(s,foundationboth)
				WriteInt(s,foundationbothwrapped)
				WriteInt(s,foundationmirrored)
				WriteInt(s,foundationpickrestriction)
				WriteInt(s,freecellpickrestriction)
				EndRem
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

				rectangle[0].save(s)
				rectangle[1].save(s)
				rectangletransformed[0].save(s)
				rectangletransformed[1].save(s)
				WriteFloat(s,cardwidth)
				WriteFloat(s,cardheight)
				WriteFloat(s,carddistance)
				WriteFloat(s,cardshiftfront)
				WriteFloat(s,cardshiftback)
				WriteFloat(s,scaleglobal)
				translationglobal.save(s)


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
				Rem
				pilegivesamesuit=ReadInt(s)
				pilegiveothersuit=ReadInt(s)
				pilegivealteratecolor=ReadInt(s)
				pilegivedescending=ReadInt(s)
				pilegiveascending=ReadInt(s)
				piletakesamesuit=ReadInt(s)
				piletakeothersuit=ReadInt(s)
				piletakealteratecolor=ReadInt(s)
				piletakeascending=ReadInt(s)
				piletakedescending=ReadInt(s)
				piletakeemptysuit=ReadInt(s)
				piletakeemptynumber=ReadInt(s)
				foundationdescending=ReadInt(s)
				foundationascending=ReadInt(s)
				foundationboth=ReadInt(s)
				foundationbothwrapped=ReadInt(s)
				foundationmirrored=ReadInt(s)
				foundationpickrestriction=ReadInt(s)
				freecellpickrestriction=ReadInt(s)
				EndRem
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

				rectangle[0].Load(s)
				rectangle[1].Load(s)
				rectangletransformed[0].Load(s)
				rectangletransformed[1].Load(s)
				cardwidth=ReadFloat(s)
				cardheight=ReadFloat(s)
				carddistance=ReadFloat(s)
				cardshiftfront=ReadFloat(s)
				cardshiftback=ReadFloat(s)
				scaleglobal=ReadFloat(s)
				translationglobal.Load(s)



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
'										C A R D S M O K E
'******************************************************************************************************************
Type _cardsmoke Extends _particlesource
	Field card:_card=Null		
	Field cardfire:_cardfire=Null
	Field solitaire:_solitaire=Null	
	Field pumptime#
	Field pumpup
	Field pumpgenrate
	Field pumplifetime
	Field pumpdeathfactor#=1	
	Field rotfac#
	Field offsetrnd#	
	
	Field m:_mesh=Null;
	Field m2:_mesh=Null;
	Method New()
							
				particlelist=Null'!
				active=False
				size=0.6
				sizetolerance=0.2
				vector.set(0,0,-0.2)
				vectortolerance=0.2
				lifetimeparticle=0.5
				lifetimeparticletolerance=0.5
				rotation=220
				rotationtolerance=20.5
				opacity=1
				gfieldforce=+0.65
				room[0].set(1.5,0,0)
				room[1].set(0,2.25,0)
				room[2].set(0,0,0.2)
				drawadd=True
				drawmul=False
				drawalpha=False
  				gfieldforcehomogen.set(0,0,-1)				
				particlegenerationdensity=0.5
				EndMethod
	Method initcardsmoke(cf:_cardfire)
				Local scale#=8'vorher 4
				card=cf.card
				cardfire=cf
				solitaire=card.game.solitaire


				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=solitaire.tsmoke[0]
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

				gg.texture[0,0]=solitaire.tsmoke[0]
				m2=gg.Create()
				m2.dynamicvertexlight=False
				m2.blend(True)
				m2.blendadditive(False)				

			

				
				init(solitaire.world, solitaire.gra,solitaire.particlesourcegamelist,solitaire.particlegamelist,solitaire.clock)
				insertmesh(m)
				insertmesh(m2)

				axialdivergence=True
				axialposition.copy(card.position)
				 'flamme[i].axialposition.set(x-0.5+Float(i),y,z)
				axialvector.set(0,0,-0.02)
				colorcurved=True
				' flamme[i].colorcurve.set(0.0,0.0,0.0,0.05  ,  0.8,0.2,0.0,0.0,  2,0,-0.1,5, -3,-2,-1,-2)
				colorcurve.set(0.0,0.0,0.0,0.07  ,  0.0,0.0,0.0,0.0,  0,0,0,2, -1,-1,-1,-0.5)
				
				offsetrnd=Rnd(0,3000)
				
				particlegenerationpositionold.copy(card.position)


				
				'If card.game.preview=False activate() Else deactivate()
				
				
				
				EndMethod					
	Method clear()
				If(m)
				 m.clear();
				 m=Null;
				EndIf
				If(m2)
				 m2.clear();
				 m2=Null;
				EndIf
				
				Super.clear();
				EndMethod						
	Method animate()
				If active
				 Local ttt#=solitaire.clock.ms()

				 position.copy(cardfire.position)
				 room[0].copy(cardfire.room[0])
				 room[1].copy(cardfire.room[1])
				 room[2].copy(cardfire.room[2])
				 'axialvector.y=Cos(ttt*0.2231+offsetrnd)*0.1+0.15
				 axialposition.set(card.position.x+Sin(offsetrnd+ttt*0.0031)*0.4,card.position.y+Cos(offsetrnd+ttt*0.0021)*0.4,card.position.z)
				 Local tt=500-(ttt-pumptime)
				 If tt<0 tt=0
				 If pumpup tt:/2
				 If Rand(0,tt)=0 Or tt=0
				  pumptime=ttt
				  If pumpup=False 
				   pumpup=True
  				   pumpgenrate=Rand(50,80)
				   pumplifetime=Rand(475,550)
				  Else
				   pumpup=False
  				   pumpgenrate=Rand(70,100)
				   pumplifetime=Rand(500,600)
				  EndIf
				 EndIf				
  			     generationrate=pumpgenrate*0.3
				 lifetimeparticle=pumplifetime*3*(Float(1)/(1+cardfire.firevector.length()))*cardfire.pumpdeathfactor'vorher 1.5
				 Super.animate()
				 
				EndIf
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
				 Local w#=((ps.position.x-position.x)/1.2)'-1..+1
				 w=w*0.5
				 w=w+0.5
				 w=w*90
				 ps.mesh.rotate(ps.rotationaxis,w)
				 ps.mesh.update()
				
				 ps.rotationvector=(w-45)*4*(1+cardfire.firevector.length())
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
	Method generate()
                Local ps:_particle=Null
                Local n#=generationrate
				Local u#=clock.ms()
				Local dt#=(u-letztegenerierung)'/Float(1000)
				Local anz#=dt*n*0.001
				sollparticle=sollparticle+anz
				Local particlegenerated=False
				Local particlegeneratedposition:_vector3=New _vector3
				If particlegenerationdensity=0
				 Local i:Int=Floor(sollparticle)
				 'Print "partikel soll anzahl i="+i
				 If i>2000 i=2000
				 If i>0
                  For Local j:Int=0 To i-1 
   				   ps=createparticle(calculateposition())
                  Next
				  sollparticle=sollparticle-Float(i)
				 EndIf
				Else
				 Local i:Int=Floor(sollparticle)
				 'Print "partikel soll anzahl i="+i
				 If i>2000 i=2000
				 If i>0
                  For Local j:Int=0 To i-1 
   				   ps=createparticle(calculateposition())
                  Next
				  sollparticle=sollparticle-Float(i)
				 EndIf
				 particlegeneratedposition.copy(position)
				 Local d#=particlegenerationpositionold.distance(particlegeneratedposition)
				 If d>=particlegenerationdensity
				  Local ic=Int(d/particlegenerationdensity)
				  Local h:_vector3=New _vector3
				  Local pit:_vector3=New _vector3
				  pit.copy(particlegenerationpositionold)
				  h.copy(particlegeneratedposition)
				  h.sub(pit)
				  Local dh#=Float(1)/Float(ic+1)
				  h.mul(dh)
				  pit.add(h)
				  Local r:_vector3=New _vector3
				  Local a:_vector3=New _vector3
				  Local b:_vector3=New _vector3
				  Local c:_vector3=New _vector3				
				  For Local i=0 To ic-1
				   a.copy(room[0])
				   b.copy(room[1])
				   c.copy(room[2])
				   r.calculaterandom()
                   r.mul(Rnd(0,positiontolerance))
				   a.mul(Rnd(-1,1))
				   b.mul(Rnd(-1,1))
				   c.mul(Rnd(-1,1))
				   r.add(pit)
				   r.add(a)
				   r.add(b)
				   r.add(c)				
				   createparticle(r)
				   pit.add(h)
				  Next
				 EndIf
				 particlegenerationpositionold.copy(particlegeneratedposition)
				EndIf
			    letztegenerierung=u
				End Method		
				
	EndType	
'******************************************************************************************************************
'										C A R D F I R E
'******************************************************************************************************************
Type _cardfire Extends _particlesource
	Field card:_card=Null		
	Field solitaire:_solitaire=Null
	Field pumptime#
	Field pumpup
	Field pumpgenrate
	Field pumplifetime
	Field pumpdeathfactor#=1
	Field rotfac#
	Field offsetrnd#	
	Field burnpoint#[20,4]	
	Field burnpointcount:Int=0
	Field burncounter:Int=0
	Field burnstatus:Int=0
	Field burnfactor#=1
	Field burnopacity#=1
	
	Field deltamap#[,,]
	Field texturemap#[,,]=Null
	
	Field positionshift:_vector2=Null
	Field positionold:_vector3=Null
	Field firevector:_vector3=Null
	
	Field smoke:_cardsmoke=Null


	Field m:_mesh=Null
	Field m2:_mesh=Null
	Field m3:_mesh=Null
	Field m4:_mesh=Null
	
	Method New()
				card=Null
				solitaire=Null
				
				particlelist=Null'!
				active=False
				size=0.6
				sizetolerance=0.5
				vector.set(0,0,0)
				vectortolerance=0.7
				lifetimeparticle=0.5
				lifetimeparticletolerance=0.5
				rotation=220
				rotationtolerance=20.5
				opacity=1
				gfieldforce=+0.55
				room[0].set(1.5,0,0)
				room[1].set(0,2.25,0)
				room[2].set(0,0,0.2)
				drawadd=True
				drawmul=False
				drawalpha=False
  				gfieldforcehomogen.set(0,0,-1)				
				particlegenerationdensity=0.5
				pumptime=0
				pumpup=0
				pumpgenrate=50
				pumplifetime=1000
				rotfac=Rnd(0.02,0.04)				
				For Local i=0 To 19
				 For Local j=0 To 3
				  burnpoint[i,j]=0
				 Next
				Next
				burnpointcount=0
				positionshift=New _vector2
				positionold=New _vector3
				firevector=New _vector3
				

				smoke=New _cardsmoke
				
				EndMethod
	Method initcardfire(c:_card)
				Local scale#=4'vorher 4
				card=c
				solitaire=c.game.solitaire
				Local ms0:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=solitaire.tfeuer2
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

				gg.texture[0,0]=solitaire.tfeuer3
				m2=gg.Create()
				m2.dynamicvertexlight=False
				m2.blend(True)
				m2.blendadditive(True)				
			Rem
				gg.texture[0,0]=solitaire.tfeuer4
				m3=gg.Create()
				m3.dynamicvertexlight=False
				m3.blend(True)
				m3.blendadditive(True)				
	EndRem
				gg.texture[0,0]=solitaire.tfeuer5
				m4=gg.Create()
				m4.dynamicvertexlight=False
				m4.blend(True)
				m4.blendadditive(True)				
		
				init(solitaire.world, solitaire.gra,solitaire.particlesourcegamelist,solitaire.particlegamelist,solitaire.clock)
				insertmesh(m)
				insertmesh(m2)
				'insertmesh(m3)
				insertmesh(m4)
				axialdivergence=True
				axialposition.copy(card.position)
				 'flamme[i].axialposition.set(x-0.5+Float(i),y,z)
				axialvector.set(0,0,-0.02)
				colorcurved=True
				' flamme[i].colorcurve.set(0.0,0.0,0.0,0.05  ,  0.8,0.2,0.0,0.0,  2,0,-0.1,5, -3,-2,-1,-2)
				colorcurve.set(0.0,0.0,0.0,0.05  ,  0.8,0.2,0.0,0.0,  2,1,0.5,5, -3,-2,-2.5,-1)
				
				offsetrnd=Rnd(0,3000)
				
				particlegenerationpositionold.copy(card.position)
				positionold.copy(card.position)
				firevector.set(0,0,0)
				
				'If card.game.preview=False activate() Else deactivate()
				
				
				smoke.initcardsmoke(Self)
				EndMethod				
	Method clear()
				smoke.clear();
				smoke=Null;
				positionshift=Null;
				positionold=Null;
				deltamap=Null
				texturemap=Null;
				firevector=Null;
				If(m)
				 m.clear();
				 m=Null;
				EndIf
				If(m2)
				 m2.clear();
				 m2=Null;
				EndIf
				If(m3)
				 m3.clear();
				 m3=Null;
				EndIf
				If(m4)
				 m4.clear();
				 m4=Null;
				EndIf
				
				Super.clear();
				EndMethod				
	Method activate()
				particlegenerationpositionold.copy(card.position)
				positionold.copy(card.position)
				firevector.set(0,0,0)				
				Super.activate()
				End Method				
	Method animate()
				If active
				 Local ttt#=solitaire.clock.ms()
				 positionold.copy(position)
				 position.copy(card.position)
				 firevector.copy(position)
				 firevector.sub(positionold)
				 room[0].copy(card.vx)
				 room[1].copy(card.vy)
				 room[0].mul(positionshift.x*0.5)
				 room[1].mul(positionshift.y*0.5)
				 position.add(room[0])
				 position.add(room[1])
				 room[0].copy(card.vx)
				 room[1].copy(card.vy)
				 room[2].copy(room[0])
				 room[2].crossproduct(room[1])
				 room[2].norm()
				 room[2].mul(0.5)

				 room[0].mul(0.5*(1-Abs(positionshift.x)))
				 room[1].mul(0.5*(1-Abs(positionshift.y)))
				
				 positionshift.mul(0.99)
				 'flamme[i].rotation=0'(tt*0.001)*20'Sin(tt*rotfac[i])*80
				 'flamme[i].rotationvector=(tt*0.001)*20'Sin(tt*rotfac[i])*80
				 'axialvector.y=Cos(ttt*0.2231+offsetrnd)*0.1+0.15
				 axialposition.set(card.position.x+Sin(offsetrnd+ttt*0.0031)*0.4,card.position.y+Cos(offsetrnd+ttt*0.0021)*0.4,card.position.z)
				 Local tt=500-(ttt-pumptime)
				 If tt<0 tt=0
				 If pumpup tt:/2
				 If Rand(0,tt)=0 Or tt=0
				  pumptime=ttt
				  If pumpup=False 
				   pumpup=True
  				   pumpgenrate=Rand(50,80)
				   pumplifetime=Rand(475,550)
				  Else
				   pumpup=False
  				   pumpgenrate=Rand(70,100)
				   pumplifetime=Rand(500,600)
				  EndIf
				 EndIf				
  			     generationrate=pumpgenrate
				 lifetimeparticle=pumplifetime*2*(Float(1)/(1+firevector.length()))*pumpdeathfactor'vorher 1.5
				 If burnopacity<0.9
				  If smoke.active=False And solitaire.systemaccellerate=False
				   smoke.particlegenerationpositionold.copy(position)
				   smoke.position.copy(position)
				   smoke.activate()
				  EndIf
				 EndIf
				 Super.animate()
				 
				EndIf
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
				 Local w#=((ps.position.x-position.x)/1.2)'-1..+1
				 w=w*0.5
				 w=w+0.5
				 w=w*90
				 ps.mesh.rotate(ps.rotationaxis,w)
				 ps.mesh.update()
				
				 ps.rotationvector=(w-45)*3*(1+firevector.length())
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
	Method generate()
                Local ps:_particle=Null
                Local n#=generationrate
				Local u#=clock.ms()
				Local dt#=(u-letztegenerierung)'/Float(1000)
				Local anz#=dt*n*0.001
				sollparticle=sollparticle+anz
				Local particlegenerated=False
				Local particlegeneratedposition:_vector3=New _vector3
				If particlegenerationdensity=0
				 Local i:Int=Floor(sollparticle)
				 'Print "partikel soll anzahl i="+i
				 If i>2000 i=2000
				 If i>0
                  For Local j:Int=0 To i-1 
   				   ps=createparticle(calculateposition())
                  Next
				  sollparticle=sollparticle-Float(i)
				 EndIf
				Else
				 Local i:Int=Floor(sollparticle)
				 'Print "partikel soll anzahl i="+i
				 If i>2000 i=2000
				 If i>0
                  For Local j:Int=0 To i-1 
   				   ps=createparticle(calculateposition())
                  Next
				  sollparticle=sollparticle-Float(i)
				 EndIf
				 particlegeneratedposition.copy(position)
				 Local d#=particlegenerationpositionold.distance(particlegeneratedposition)
				 If d>=particlegenerationdensity
				  Local ic=Int(d/particlegenerationdensity)
				  Local h:_vector3=New _vector3
				  Local pit:_vector3=New _vector3
				  pit.copy(particlegenerationpositionold)
				  h.copy(particlegeneratedposition)
				  h.sub(pit)
				  Local dh#=Float(1)/Float(ic+1)
				  h.mul(dh)
				  pit.add(h)
				  Local r:_vector3=New _vector3
				  Local a:_vector3=New _vector3
				  Local b:_vector3=New _vector3
				  Local c:_vector3=New _vector3				
				  For Local i=0 To ic-1
				   a.copy(room[0])
				   b.copy(room[1])
				   c.copy(room[2])
				   r.calculaterandom()
                   r.mul(Rnd(0,positiontolerance))
				   a.mul(Rnd(-1,1))
				   b.mul(Rnd(-1,1))
				   c.mul(Rnd(-1,1))
				   r.add(pit)
				   r.add(a)
				   r.add(b)
				   r.add(c)				
				   createparticle(r)
				   pit.add(h)
				  Next
				 EndIf
				 particlegenerationpositionold.copy(particlegeneratedposition)
				EndIf
			    letztegenerierung=u
				End Method		
	Method generateburnpoints(para:_vector2)	
				positionshift.copy(para)
				burnpointcount=Rand(8,10)
				'Local h#=0.001
				'Local t#=Float(0.001)/Float(burnpointcount)
				For Local i=0 To burnpointcount-1
				 burnpoint[i,0]=Rnd(-1,+1)
				 burnpoint[i,1]=Rnd(-1,+1)
				 burnpoint[i,2]=Float(1)/Rnd(0.01,0.2)
				 burnpoint[i,3]=Rnd(0.5,0.7)
				Next					
				Print "burnpoint="+burnpointcount
				Local cw=solitaire.cardsetmanager.width
				Local ch=solitaire.cardsetmanager.height
				deltamap=Null
				deltamap=New Float[cw,ch,4]
				Local fx#=-1
				Local fy#=-1
				Local cwh=cw/2
				Local chh=ch/2
				Local fsx#=Float(1)/Float(cwh)'optimation step
				Local fsy#=Float(1)/Float(chh)'optimation step
				Local dx#,dy#
				Local e0#
				Local e1#
				Local bi:Int
				Local gi:Int
				Local ri:Int
				Local ss#=Float(1)/(2*0.3*0.3)'optimation gauss
				Local dm:Float Ptr=deltamap
				fy=-1
			    For Local y=0 To ch-1
			  	 fx=-1
				 For Local x=0 To cw-1
				  fx=Float(x-cwh)/Float(cwh)
				  fy=Float(y-chh)/Float(chh)
				  e0=0
				  e1=0
				  dx=para.x-fx'position at gauss is 0,0
				  dy=(-para.y)-fy
				  e0=Exp(-(dx*dx+dy*dy)*ss)'gauss
				  For Local i=0 To burnpointcount-1
				   dx=burnpoint[i,0]-fx
				   dy=-burnpoint[i,1]-fy
				   e0:+Exp(-(dx*dx+dy*dy)*burnpoint[i,2])*burnpoint[i,3]'e0+(burnpoint[i,2]*(dx*dx+dy*dy))
   				  Next
				  dm[0]=0.3+e0*2
				  dm:+1
				  dm[0]=0.2+e0*1.5
				  dm:+1
				  dm[0]=0.18+e0*1.3
				  dm:+1
				  dm[0]=0.3+e0
				  dm:+1
				  fx:+fsx
				 Next
				 fy:+fsy
			 	Next					
			    texturemap=Null;
				texturemap=New Float[cw,ch,4]
				If card.poly.texture[0,0].image.frames[0]'is the _textured3d7-object of a _texture-object loaded ?
				 Local tex:_textured3d7=_textured3d7(card.poly.texture[0,0].image.frames[0])'types defined in graphics bmx
				 Local lflags=DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR'|DDLOCK_WRITEONLY'|DDLOCK_READONLY
				 Local res=tex.surface.Lock(Null,tex.sinfo,lflags,Null)'open surface for modification
				 Local memit:Byte Ptr=tex.sinfo.lpSurface'get memory pointer to surface data array
				 Local tm:Float Ptr=texturemap
				 For Local y=0 To ch-1
				  For Local x=0 To cw-1
				   For Local i=0 To 3
				    tm[0]=memit[0]'0..255
				    tm:+1
				    memit:+1
				   Next
				  Next
				 Next			
				 tex.surface.unlock(tex.sinfo)
				EndIf		
				card.copytexture()
				EndMethod
	Method animateburnpoints()
				For Local i=0 To burnpointcount-1
				 burnpoint[i,2]:+0.01'burnpoint[i,3]
				Next
				EndMethod
	Method drawburnpoints()
				'testen direct texture access
				If active
				If texturemap And card.poly.texture[0,0].image.frames[0] 'is the _textured3d7-Object of a _texture-Object loaded ?
				
				 Local tex:_textured3d7=_textured3d7(card.poly.texture[0,0].image.frames[0])'types defined in graphics bmx
				 Local lflags=DDLOCK_WAIT|DDLOCK_SURFACEMEMORYPTR'|DDLOCK_WRITEONLY'|DDLOCK_READONLY
				 Local res=tex.surface.Lock(Null,tex.sinfo,lflags,Null)'open surface for modification
				 Local memit:Byte Ptr=tex.sinfo.lpSurface'get memory pointer to surface data array
					  
				 Local cw=solitaire.cardsetmanager.width
				 Local ch=solitaire.cardsetmanager.height
				 'Local fx#=-1
				' Local fy#=-1
				 'Local fs#=Float(1)/Float(128)'optimation step
				 'Local dx#,dy#
				 'Local e0#
				 'Local e1#
				 'Local bi:Int
				 'Local gi:Int
				 'Local ri:Int
				 'Local ss#=Float(1)/(2*0.9*0.9)'optimation gauss
				 
				' card.opacity=opa/Float(256*256)
				 burncounter:+1
				 If burnstatus=1
				  Local tm:Float Ptr=texturemap
				  Local dm:Float Ptr=deltamap
				  Local opa=cw*ch
			      For Local y=0 To ch-1
				   For Local x=0 To cw-1
				    For Local i=0 To 2
				     tm[0]:-(dm[0]*burnfactor)
				     If tm[0]<0 tm[0]=0
				     memit[0]=tm[0]
				     memit:+1
				     tm:+1
				     dm:+1
				    Next
				    tm[0]:-(dm[0]*burnfactor)
				    If tm[0]<0.5
				     memit[0]=0
				     opa:-1
				    Else
				     memit[0]=255
				    EndIf
				    memit:+1
				    tm:+1
				    dm:+1
				   Next
			 	  Next
		          burnfactor:+0.04		
				  burnopacity=Float(opa)/Float(cw*ch)
		 		  If opa<10000		
		  		   pumpdeathfactor=0.5+(Float(opa)/Float(10000))*0.5
				   If opa<8000
				    card.opacity=Float(opa)/Float(8000)
			 	    If opa=0
			         deactivate()
			  		 smoke.deactivate()
			         card.opacity=0
			 		 If solitaire.game solitaire.game.endedbygiveupburn=True
			        EndIf
			       EndIf
			  	  EndIf
				 EndIf
				 If burnstatus=0 
				  Local tm:Float Ptr=texturemap
				  Local dm:Float Ptr=deltamap
				  Local opa=cw*ch
			      For Local y=0 To ch-1
				   For Local x=0 To cw-1
				    For Local i=0 To 2
				     tm[0]:-dm[0]
				     If tm[0]<0 tm[0]=0
				     memit[0]=tm[0]
				     memit:+1
				     tm:+1
				     dm:+1
				    Next
				    tm[0]:-dm[0]
				    If tm[0]<0.5
				     memit[0]=0
				     opa:-1
				    Else
				     memit[0]=255
				    EndIf
				    memit:+1
				    tm:+1
				    dm:+1
				   Next
			 	  Next					
			      burnopacity=Float(opa)/Float(cw*ch)
				  If burncounter>=50
				   burncounter=0
				   burnstatus=1 
				  EndIf
				 EndIf
				
				
				 tex.surface.unlock(tex.sinfo)
		      	EndIf				
				EndIf
				EndMethod				
	Method setopacity(op#)
				For Local pit:_particle=EachIn particleinternallist
				 pit.opacityexternalcontrol=op
				Next
				For Local pit:_particle=EachIn smoke.particleinternallist
				 pit.opacityexternalcontrol=op
				Next
				
				EndMethod						
	EndType	
'******************************************************************************************************************
'										C A R D 
'******************************************************************************************************************
Type _card Extends _storeable
	Field solitaire:_solitaire=Null
	'Field drawlink:TLink=Null
	Field picklink:TLink=Null
	Field blowlink:TLink=Null
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
	Field array:_pilearray=Null' sweetmatchpile pointer
	Field arrayindex[2]					' x,y-field indices for the sweetmatchpile
	Field mesh:_mesh=Null
	Field position:_vector3=Null
	Field vx:_vector3=Null
	Field vy:_vector3=Null
	Field vector:_vector3=Null
	Field rollvector:_vector3=Null
	Field colorcurve:_hermitecurve4=Null	
	Field timephysicslast#=0
	Field timephysicsstart#=0
	Field dynamictexture=False
	'Field width#=0
	'Field height#=0
	Field backsided:Int=False
	
	Field rotation#=0					'actual, displayed and performed rotation value
	Field rotationmust#=0				'the value that should be matched
	'Field rotationabsolute#=0
	Field rotationvector#=0
	Field rotationvelocity#=0.1
	Field rotationfriction#=0.9
	Field rotmatrix#[3,3]
	Field rotationold#=1000


	Field angle#=90					'actual, displayed and performed angle value
	Field anglemust#=90				'the value that should be matched
	Field anglevector#=0
	Field anglevelocity#=0.05
	Field anglefriction#=0.85

	
	Field shift:_vector2=Null    		'actual, displayed and performed shift, is along x and y , not z
	Field shiftmust:_vector2=Null
	Field shiftvector:_vector2=Null
	Field shiftvelocity#=0.1
	Field shiftfriction#=0.9
	
	Field neigungx#=0
	Field neigungactive=False
	Field opacity#=1
	Field opacityquant=0
	
	'Field shadowlist:TList=Null	
	Field shadowarray:_shadowsingle[10]
	Field shadowarraycount=0
						
	Field curveposition:_hermitecurve=Null
	Field curvevx:_hermitecurve=Null
	Field curvevy:_hermitecurve=Null
	Field curvepositiont#=0
	Field curvevxt#=0
	Field curvevyt#=0
	Field curving:Int=False
	Field curvespeed#=20
	Field curvetime:Int=0
	
	Field inpreparation:Int=False

	Field clicktime=0
	Field clickleft:Int=False
	Field doubleclicked:Int=False
	
	Field picked:Int=False
	Field pickposition:_vector3=Null
	Field pickvx:_vector3=Null
	Field pickvy:_vector3=Null
	Field pickending=False
	
	
	'tipp elements, not for storages
	Field curveopacity:_hermitecurve1=Null
	Field cardcontrolopacity:_card=Null
	
	'effekt
	Field fire:_cardfire=Null
	Field fireinner:Int=False
	Field fireakku#=0
	Field fireakkustart#=0
	
	
	
	
	'optimierung
	Field vertex:_vertex[4]
	Field poly:_polygon=Null
	Field hvh:_vector3=New _vector3
	Field hvk:_vector3=New _vector3
	Field hvn:_vector3=New _vector3
	Field hvnold:_vector3=New _vector3
	Field hvp:_vector3=New _vector3
	Field hvvvx:_vector3=New _vector3
	Field hvvvy:_vector3=New _vector3
	Field hvpold:_vector3=New _vector3
	Field hvvvxold:_vector3=New _vector3
	Field hvvvyold:_vector3=New _vector3
	Field hvrvx:_vector3=New _vector3
	Field hvrvy:_vector3=New _vector3
	Field meshchanged=True	
	Field meshchangedlasttime#=0

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
				'vx.set(cardwidth,0,0)
				'vy.set(0,cardheight,0)
				vx.set(3,0,0)
				vy.set(0,6,0)
				vector=New _vector3
				rollvector=New _vector3
				'shadowlist=CreateList()
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
				array=Null
				arrayindex[0]=0
				arrayindex[1]=0
				curveopacity=New _hermitecurve1
				cardcontrolopacity=Null
				
				colorcurve=New _hermitecurve4
				colorcurve.set(1,1,1,1, 0,0,0,0 ,0,0,0,0, 0,0,0,0)
				
				hvnold.set(1000,1000,1000)
				hvpold.set(1000,1000,1000)
				hvvvxold.set(1000,1000,1000)
				hvvvyold.set(1000,1000,1000)
				
				
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
				array=Null
				arrayindex[0]=Null
				arrayindex[1]=Null
				mesh=c.mesh.duplicate()
				If mesh.link RemoveLink mesh.link
				poly=_polygon(mesh.polygonlist.firstlink().value())
				poly.drawlink=game.drawlist.addlast(poly)
				
				position.copy(c.position)
				vx.copy(c.vx)
				vy.copy(c.vy)
				'width=c.width
				'height=c.height
				rotation=c.rotation
				rotationmust=c.rotationmust
				rotationvector=c.rotationvector
				rotationvelocity=c.rotationvelocity
				rotationfriction=c.rotationfriction

				angle=c.angle
				anglemust=c.anglemust
				anglevector=c.anglevector
				anglevelocity=c.anglevelocity
				anglefriction=c.anglefriction

				shift.copy(c.shift)
				shiftmust.copy(c.shiftmust)
				shiftvector.copy(c.shiftvector)
				shiftvelocity=c.shiftvelocity
				shiftfriction=c.shiftfriction
				neigungx=c.neigungx
				opacity=c.opacity
				opacityquant=c.opacityquant				
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
				updatevertexarray()
				updatemesh()
				createshadow()
				'effekt
				fire=New _cardfire
				fire.initcardfire(Self)
				'cardfire.deactivate()	
				colorcurve.copy(c.colorcurve)		
				EndMethod				
	Method copytexture()
				Local lt:_texture=New _texture
				lt.copy(poly.texture[0,0])
				poly.texture[0,0]=lt
				dynamictexture=True
				EndMethod
	Method cleareffects()
				If fire
				 'fire.smoke.clear()
				 fire.clear()
				 fire=Null
				EndIf
				EndMethod				
	Method clearshadow()
				
				Print "clearshadow"
				If shadowarraycount>0 
				 For Local i=0 To shadowarraycount-1'sit:_shadow=EachIn shadowlist
				  shadowarray[i].clear()
				  shadowarray[i]=Null
				  'RemoveLink sit.link
				 Next
				EndIf
				shadowarraycount=0
				'shadowlist.clear()
				
				EndMethod	
	Method createshadow()
				
				clearshadow()
				If game.preview=False And game.menu=False
				For Local lit:_light=EachIn solitaire.world.lightlist
				 If lit.noshadow=False
				  Local sit:_shadowsingle=New _shadowsingle
				  Local tex:_texture=solitaire.tshadow
				  Local l:TList=solitaire.shadowpreviewlist
				  If game.preview=False l=solitaire.shadowlist
 				  sit.init(solitaire.gra,mesh,tex,l,lit)
 				  shadowarray[shadowarraycount]=sit
   				  shadowarraycount:+1
 			      'shadowlist.addlast(sit)
  				 EndIf
				Next
				updateshadow()
				EndIf
				
				EndMethod
	Method updateshadow()
				If solitaire.systemaccellerate=False And game.preview=False And game.menu=False
				 Local machen=True
				 'If picked machen=False
				 If visible=False Or position.z>=+0.3 machen=False  
				 If pile If pile.drawownshadow And curving=False And picked=False machen=False
				 If machen=False
				  For Local i=0 To shadowarraycount-1 'shadow:_shadow=EachIn shadowlist
				   shadowarray[i].valid=False
				  Next
				  Return
				 EndIf
				 For Local i=0 To shadowarraycount-1'shadow:_shadow=EachIn shadowlist
				  shadowarray[i].update()
				 'Local sit:TLink=shadowlist.firstlink()
				' If sit
				 ' Repeat
				 '  _shadow(sit.value()).update()
				  
				  ' sit=sit.nextlink()
				  'Until sit=Null
				 'EndIf
				 Next

				EndIf
				'Local h:_vector3=New _vector3
				'Local s:_vector3=New _vector3
				'Local o:_vector3=New _vector3
				'Local v:_vertex[4]'vom netz
				'Local gamma#
				'Local i,j
				
				 Rem
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
				 Repeat
				  shadow=_shadow(sit.value())
				  shadow.valid=True
				  For Local i=0 To 3				
				   v[i].get(h)
				   h.sub(shadow.light)
				   gamma=-shadow.light.z/h.z
				   If gamma>-1
				    s.set(shadow.light.x+h.x*gamma,shadow.light.y+h.y*gamma,0)
				    shadow.mesh.vertex(i).set(s) 
				   Else
				    shadow.valid=False
				   EndIf 
				  Next
				  Local pf:_polygon=_polygon(shadow.mesh.polygonlist.firstlink().value())
				  pf.updatemiddle()
				  EndRem
				
				
				EndMethod				
	Method init(s:_solitaire,g:_game,su,n,px#=0,py#=-30)				
				solitaire=s
				game=g
				'width=solitaire.cardwidth
				'height=solitaire.cardheight
				vx.set(game.cardwidth,0,0)
				vy.set(0,game.cardheight,0)
				'drawlink=game.drawlist.addlast(Self)
				suit=su
				number=n
				position.set(px,py,0)
				Local gg:_geometrygrid=New _geometrygrid
				If game.preview=False And game.menu=False
				 gg.texture[0,0]=solitaire.cardsetmanager.texturefront[suit+number*4]'vorher : solitaire.tcard[suit+number*4]
				 gg.texture[1,0]=solitaire.cardsetmanager.textureback'vorher : solitaire.tcardback[solitaire.cardtexturebackindex]
				ElseIf game.preview
				 gg.texture[0,0]=solitaire.cardsetmanager.texturefrontsmall[suit+number*4]'vorher : solitaire.tcard[suit+number*4]
				 gg.texture[1,0]=solitaire.cardsetmanager.texturebacksmall'vorher : solitaire.tcardback[solitaire.cardtexturebackindex]
				ElseIf game.menu
				 gg.texture[0,0]=solitaire.cardsetmanager.texturefrontmicro[suit+number*4]
				 gg.texture[1,0]=solitaire.cardsetmanager.texturebackmicro
				EndIf
				
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
				mesh.sigmadiffuse(0.3)
				mesh.world=solitaire.world
				poly=_polygon(mesh.polygonlist.firstlink().value())
				poly.drawlink=game.drawlist.addlast(poly)
				'poly.copyvertexblock()
				updatevertexarray()
				updatemesh()
				createshadow()
				'effekt
				
				
				fire=New _cardfire
				fire.initcardfire(Self)
				fire.deactivate()

				rotationmust=Rnd(-game.solitaire.naturalpiles*5,game.solitaire.naturalpiles*5)
				Local sn#=solitaire.naturalpiles*0.2
				shiftmust.set(Rnd(-sn,+sn),Rnd(-sn,+sn))
				
				EndMethod

	Method clear()
				deinsertpile()
				deinsertgame()
				deinsertpick()
				deinsertblow()
				If tipplink=Null 'wichtig weil sonst die pyramide destabilisiert wird
				 deinsertpyramid()
				 deinsertlabyrinth()
				 deinsertarray()
				 deinsertsweetmatch()
				EndIf
				If tipplink RemoveLink tipplink
				'If drawlink RemoveLink drawlink
				'If mesh
				' poly=_polygon(mesh.polygonlist.firstlink().value())
				'EndIf
				If poly
				 If poly.drawlink RemoveLink poly.drawlink
				 poly.drawlink=Null
				EndIf
				'Print "card::clear() : clearshadow - call"
				clearstoreablelink()
				clearshadow()
				cleareffects()
				If dynamictexture And poly
				 poly.texture[0,0].clear()
				EndIf
				If mesh mesh.clear()
				mesh=Null
				poly=Null
				EndMethod		
	Method discard(beth=False)
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
				 curvespeed=30
				 curvevx.setvector(vx,dvx,vn,vn)
				 curvevy.setvector(vy,dvy,vn,vn)
				 curveposition.setvector(position,pd.dropposition(),vtn,vtp)
				 startcurve(game.solitaire.clock)
				 deinsertpile()
				 insertpile(pd,True)
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
	Method canturn:Int()
				If pile=Null Return(False)
				
				If(curving=True) Return(False)
				If(game.picklist.count()>0) Return(False)
				'For Local c:_card=EachIn pile.cardlist
				' If c.curving=True Return(False)
				'Next				
				Return(pile.canturn(Self))
				EndMethod
				
	Method canpick:Int()
	
				If pile=Null Return(False)
				For Local c:_card=EachIn game.picklist
				 If c.picked=True Return(False)
				Next
				'Print "canpick double:"+doubleclicked
				If doubleclicked Return(False)				
				Rem
				Local pd:_pilediscard=_pilediscard(pile)
				If pd Return(False)
				Local ps:_pilestock=_pilestock(pile)
				If ps Return(False)
	 			'If pickending Return(False)
	
				If curving Return(False)

				If pile.nopickifcardcurving
				 For Local c:_card=EachIn pile.cardlist
				  If c.curving=True Return(False)
				 Next
				EndIf
				EndRem
				'apply the pickrule states (give)
				Return(pile.canpick(Self))
				EndMethod		
	Method pick()
				If picked=False
				 If game.picklist.firstlink()=Null game.pickpositionold.copy(position)
				 picklink=game.picklist.addlast(Self)
				 picked=True
				 poly.flag=1
				 pickending=False
				 If curving=False
				  pickposition.copy(position)
				  pickvx.copy(vx)
				  pickvy.copy(vy)
				 Else
				  pickposition.copy(curveposition.o1)
				  pickvx.copy(curvevx.o1)
				  pickvy.copy(curvevy.o1)
				  curving=False
				  poly.flag=0
				 EndIf
				 'pickoffset bestimmen, wenn nicht bereits gesetzt
				 Print "Card pick"
				 If game.pickoffsetcard=Null
				  game.pickoffsetcard=Self
				  Print "gamepickself"
				
				  Local g#=(position.z-game.solitaire.cam.position.z)/game.solitaire.mousevector.z
				  Local ix#=game.solitaire.cam.position.x + g*game.solitaire.mousevector.x
				  Local iy#=game.solitaire.cam.position.y + g*game.solitaire.mousevector.y
				  game.pickoffsetx=ix-position.x
				  game.pickoffsety=iy-position.y

	
				 EndIf
				EndIf
				EndMethod		
	Method depick(clock:_clock,tz#=0)
				'Local n#=0
				'Local i#=0
				'For Local cit:_card=EachIn game.picklist
				' If cit=Self
				'  n=i
				' EndIf
				' i:+1
				'Next
			 	curvevx.set(vx.x,vx.y,vx.z, pickvx.x,pickvx.y,pickvx.z, 0,0,0 ,0,0,0)  
			 	curvevy.set(vy.x,vy.y,vy.z, pickvy.x,pickvy.y,pickvy.z, 0,0,0 ,0,0,0)  
				curveposition.set(position.x,position.y,position.z, pickposition.x,pickposition.y,pickposition.z, 0,0,-tz*5,0,0,0)
				curvespeed=25
				startcurve(clock)
				'pickending=True
				If picklink
				 If picklink.nextlink()
			  	  Local cn:_card=_card(picklink.nextlink().value())
			      cn.depick(clock,tz+1)
				 EndIf
				EndIf
				deinsertpick()
				
				EndMethod						
	Method deinsertforblow()
				deinsertpile()
				deinsertgame()
				deinsertpick()
				deinsertpyramid()
				deinsertlabyrinth()
				deinsertarray()
				deinsertsweetmatch()
				clearstoreablelink()
				If poly.drawlink RemoveLink poly.drawlink
				poly.drawlink=Null				
				'clearshadow()
				curving=False
				inpreparation=False
				game=Null
				'Print "deinsertforpick position="+position.z
				EndMethod	
	Method insertblow(g:_game)
				game=g
				deinsertblow()
				blowlink=game.blowlist.addlast(Self)
				poly.drawlink =game.drawlist.addlast(poly)
				poly.flag=1
				timephysicslast=solitaire.clock.ms()
				timephysicsstart=timephysicslast
				updatemesh()
				'Print "insertblow position="+position.z
				'createshadow()
				EndMethod
	Method deinsertblow()
				If blowlink
				 RemoveLink blowlink
				 blowlink=Null
				EndIf
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
				pile.updatedescription()
				EndMethod																
	Method deinsertpile()
				Local oldpile:_pile=pile
				If pilelink 
				 Local l:TLink=pilelink
				 RemoveLink pilelink'ERST LÖSCHEN, DA ES SONST NICHTS BRINGT !!!!
				 If game 
				  game.tippreservepile=0
				  game.tippreservecard=0
				  game.tippstockpile=0
				  game.tippwastepile=0
				  game.tippredealpile=0
				  If game.tippsourcarditerator=l game.tippresetcombination(0)
				  If game.autoplaysourcarditerator=l game.tippresetcombination(1)
				  If game.automovesourcarditerator=l game.tippresetcombination(2)
				  If game.clickplaysourcarditerator=l game.tippresetcombination(3)
				 EndIf
				EndIf
				pilelink=Null
				pile=Null
				If oldpile oldpile.updatedescription()
				EndMethod			
	Method insertgame()
				gamelink=game.cardlist.addlast(Self)
				EndMethod
	Method deinsertgame()
				If gamelink RemoveLink gamelink
				gamelink=Null
				EndMethod					
					
	Method insertpick()
				game.startusing()
				If picked=False
				 pile.pick(Self)	
				EndIf
				EndMethod
				
	Method deinsertpick()
				If picklink RemoveLink picklink
				picklink=Null
				picked=False
				If game.pickoffsetcard=Self 
				 game.pickoffsetcard=Null
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
	Method insertarray(l:_pilearray,fx,fy)
				'Print "insertsweet s="+suit+" n="+number+" bei "+fx+","+fy
				If l.feld[fx,fy] l.feld[fx,fy].deinsertarray()
				array=l
				arrayindex[0]=fx
				arrayindex[1]=fy
				array.feld[fx,fy]=Self
				EndMethod
	Method deinsertarray()
				'Print "deinsertsweet s="+suit+" n="+number+" bei "+sweetindex[0]+","+sweetindex[1]
				If array
				 array.feld[arrayindex[0],arrayindex[1]]=Null
				 arrayindex[0]=0
				 arrayindex[1]=0
				 array=Null
				EndIf
				EndMethod									
		
		
	Method polygon:_polygon()
				Return(_polygon(mesh.polygonlist.firstlink().value()))
				EndMethod
	Method draw(gra:_graphics,cam:_camera)
				If visible
				 'mesh.clearvertexlight()
	    		 'For  Local lit:_light=EachIn solitaire.world.lightlist
				 ' mesh.determinevertexlight(lit)
				 'Next
				 'gra.blendmultiplicative()
				 'mesh.vertexalpha(opacity)
				 'If sweetblocked 
				  
				 'EndIf
				 'SetAlpha(0.5)
				 'mesh.vertexalpha(0.5)
				 poly.draw(gra,cam)
				 'gra.blend(False)

				EndIf
				EndMethod
	Method startcurve(clock:_clock)
				curvetime=clock.ms()
				curvepositiont=0
				curvevxt=0
				curvevyt=0
				curvevx.v0.mul(game.scaleglobal);
				curvevx.v1.mul(game.scaleglobal);
				curvevy.v0.mul(game.scaleglobal);
				curvevy.v1.mul(game.scaleglobal);
				curveposition.v0.mul(game.scaleglobal);
				curveposition.v1.mul(game.scaleglobal);
				curvespeed:*game.scaleglobal;
				curveposition.updatelength()
				curvevx.updatelength()
				curvevy.updatelength()
				curving=True
				poly.flag=1
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
				  poly.flag=0
				  curvespeed=10
				  
				  doubleclicked=False
				  
				 ' If pickending 
				  ' pickending=False
				 '  deinsertpick()
				 ' EndIf
				 EndIf				  
				Else
				 If doubleclicked
				  If (game.solitaire.clock.ms()-clicktime)>300 doubleclicked=False
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
				d=(rotationmust)-rotation
				'If Abs(d)>nearzero*0.1
				 d:*rotationvelocity
				 rotationvector:+d
				'EndIf
				'If Abs(rotationvector)>nearzero
				 rotation:+rotationvector
				 rotationvector:*rotationfriction				
				'EndIf
				Local h:_vector2=New _vector2
				h.copy(shiftmust)
				h.sub(shift)
				h.mul(shiftvelocity)
				shiftvector.add(h)
				shift.add(shiftvector)
				shiftvector.mul(shiftfriction)
				EndMethod	
	Method animateangle()
				Local d#
				d=(anglemust)-angle
				If Abs(d)>nearzero
				 d:*anglevelocity
				 anglevector:+d
				EndIf
				If Abs(anglevector)>nearzero
				 angle:+anglevector
				 anglevector:*anglefriction	
				EndIf			
				EndMethod
	Method animatephysics()
				Local timenew#=game.solitaire.clock.ms()
				Local timed#=timenew-timephysicslast
				Local fanim#=timed/1000
				Local fanimnorm#=fanim/Float(0.0166666666)
				fanimnorm:*fanimnorm
				If fanimnorm<0.05 fanimnorm=0.05
				If fanimnorm>4 fanimnorm=4	
							
				timephysicslast=timenew
				Local grav:_vector3=New _vector3
				Local friction#=(1-0.0001)*60'1%/ 16.66msec
				Local age#=Float(timenew-timephysicsstart)/Float(5000)
				If age>1 age=1
				
				colorcurve.calculate(age)
				opacity=colorcurve.e.w
				
				vector.mul(0.970001)'friction*fanim)
   				game.gravityblow.calculate(position,grav)
				rollvector.x:+grav.x*0.5
				rollvector.y:+grav.y*0.5
				grav.mul(Float(0.0166666666)*fanimnorm)
				vector.add(grav)
				
				position.add(vector)
				vx.rotate(vy,rollvector.x*fanimnorm)
				vy.rotate(vx,rollvector.y*fanimnorm)
				rollvector.mul(0.97)
				EndMethod						
	Method animate()
				animatecurve()
				animatenaturality()
				updatemesh()
				If (solitaire.clock.ms()-meshchangedlasttime)<1500
				 updateshadow()
				EndIf
				If fire fire.drawburnpoints() 
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
				pile.turn(Self,clock,spd,useundo)
				EndMethod 
	Method normcardplane()
				
				hvh.copy(vx)
				hvh.crossproduct(vy)
				hvh.crossproduct(vx)
				vy.copy(hvh)
				vx.norm()
				vx.mul(game.cardwidth)
				vy.norm()
				vy.mul(game.cardheight)
				EndMethod
	Method normcardplanetransformed(vvx:_vector3,vvy:_vector3,n:_vector3)
				'Local h:_vector3=New _vector3
				hvh.copy(vvx)
				hvh.crossproduct(vvy)
				hvh.crossproduct(vvx)
				vvy.copy(hvh)
				vvx.norm()
				vvx.mul(game.cardwidth)
				vvy.norm()
				vvy.mul(game.cardheight)
				EndMethod			
				Rem
	Method updatelighting()
				If visible
				 mesh.visible(True)
				 'If solitaire.systemaccellerate=False
				  mesh.clearvertexlight()
	    		  For  Local lit:_light=EachIn solitaire.world.lightlist
				   mesh.determinevertexlight(lit)
				  Next
				  'gra.blendmultiplicative()
				  mesh.vertexalpha(opacity)
				 'Else
				 ' Local v:_vector4=New _vector4
				 ' v.set(1,1,1,opacity)
				 ' mesh.vertexcolor(v)
				 'EndIf
				 
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
				EndRem			
	Method updatevertexarray()
				Local pit:_polygon
				Local vit:_vertex
				Local i=0
				For pit=EachIn mesh.polygonlist
				 For vit=EachIn pit.vertexlist
				  If i<4 vertex[i]=vit
				  i:+1
				 Next
				Next
				EndMethod		
				Rem	
	Method polygonflag(f)
				Local pit:_polygon=_polygon(mesh.polygonlist.firstlink().value())
				 If pit
				  pit.flag=f
				 EndIf	
				EndMethod		
				EndRem			
	Method updatemesh()
				'function updates the vertex coordinates of the card mesh
				'along the plane vectors position, vx,vy
				'Local i=0

				'neigung berechnen
				'normcardplane()
				meshchanged=False
				hvvvx.copy(vx)
				hvvvy.copy(vy)
				If pile pile.pickslopeplane(Self,hvvvx,hvvvy)
				hvn.copy(hvvvx)
				hvn.crossproduct(hvvvy)
				hvn.norm()
				
				Local d#=hvnold.distancedistance(hvn)
				Local dvx#=hvvvxold.distancedistance(hvvvx)
				Local dvy#=hvvvyold.distancedistance(hvvvy)
				If Abs(rotationold-rotation)>0.00001 Or d>0.00001 Or dvx>0.00001 Or dvy>0.00001'nearzero
				 meshchanged=True
                 Local a#,b#
				
                 Local sinw#,cosw#

                 sinw=Sin(rotation);
                 cosw=Cos(rotation);
                 a=sinw;
                 b=1-cosw;
                 rotmatrix[0,0]=cosw+b*hvn.x*hvn.x;
                 rotmatrix[1,0]=     b*hvn.x*hvn.y+a*+hvn.z;
                 rotmatrix[2,0]=     b*hvn.x*hvn.z+a*-hvn.y;
                 rotmatrix[0,1]=     b*hvn.y*hvn.x+a*-hvn.z;
                 rotmatrix[1,1]=cosw+b*hvn.y*hvn.y;
                 rotmatrix[2,1]=     b*hvn.y*hvn.z+a*+hvn.x;
                 rotmatrix[0,2]=     b*hvn.z*hvn.x+a*+hvn.y;
                 rotmatrix[1,2]=     b*hvn.z*hvn.y+a*-hvn.x;
                 rotmatrix[2,2]=cosw+b*hvn.z*hvn.z;
			     hvrvx.x=rotmatrix[0,0]*hvvvx.x+rotmatrix[1,0]*hvvvx.y+rotmatrix[2,0]*hvvvx.z
			     hvrvx.y=rotmatrix[0,1]*hvvvx.x+rotmatrix[1,1]*hvvvx.y+rotmatrix[2,1]*hvvvx.z
			     hvrvx.z=rotmatrix[0,2]*hvvvx.x+rotmatrix[1,2]*hvvvx.y+rotmatrix[2,2]*hvvvx.z				
			     hvrvy.x=rotmatrix[0,0]*hvvvy.x+rotmatrix[1,0]*hvvvy.y+rotmatrix[2,0]*hvvvy.z
			     hvrvy.y=rotmatrix[0,1]*hvvvy.x+rotmatrix[1,1]*hvvvy.y+rotmatrix[2,1]*hvvvy.z
			     hvrvy.z=rotmatrix[0,2]*hvvvy.x+rotmatrix[1,2]*hvvvy.y+rotmatrix[2,2]*hvvvy.z		
			   '  Print "r abs="+Abs(rotationold-rotation)
			   '  Print "r dn="		+d
			   '  Print "r dvx="		+dvx
			    ' Print "r dvy="		+dvy
				EndIf

				rotationold=rotation
				hvnold.copy(hvn)
				hvvvxold.copy(hvvvx)
				hvvvyold.copy(hvvvy)



				hvvvx.copy(hvrvx);
				hvvvy.copy(hvrvy);
				
				'otatevector(hvn,hvvvx,rotation,hvh);hvvvx.copy(hvh);
				'otatevector(hvn,hvvvy,rotation,hvh);hvvvy.copy(hvh);
				'normcardplanetransformed(hvvvx,hvvvy,hvn)
				
				hvh.copy(hvn)
				hvh.crossproduct(hvvvx)
				hvvvy.copy(hvh)
				hvvvx.norm()
				hvvvx.mul(game.cardwidth)
				hvvvy.norm()
				hvvvy.mul(game.cardheight)				
				
				hvp.copy(position)
				hvp.x:+shift.x
				hvp.y:+shift.y
				
				If pile pile.pickslopeposition(Self,hvp)
				If pile=Null
				 If blowlink
				  poly.flag=1
				 Else
				  poly.flag=2
				 EndIf
				Else
				 Local neigungcheck=True
				 Local pr:_pilereserve=_pilereserve(pile)
				 If pr
				  If pr.arcmode=True neigungcheck=False
				 Else
				  Local pb:_pilebethoral=_pilebethoral(pile)
				  If pb
				   neigungcheck=False

				  EndIf
				 EndIf
				 If neigungcheck
				  If picked Or curving Or neigungx<-0.01 Or inpreparation poly.flag=1 Else poly.flag=0
				 Else
				  If picked Or curving Or inpreparation poly.flag=1 Else poly.flag=0
				 EndIf 
				EndIf
				
				
				d=hvpold.distancedistance(hvp)'+hvvvxold.distancedistance(hvvvx)+hvvvyold.distancedistance(hvvvy)
				If d>0.000001
				 meshchanged=True
				' Print "p"
				EndIf
				hvpold.copy(hvp)
				
				If meshchanged
				
				
				 hvn.mul(-1)
				 hvh.copy(hvvvx)
				 hvh.add(hvvvy)
				 hvh.mul(-0.5)
				 hvh.add(hvp)
				 vertex[0].set(hvh)
				 hvh.add(hvvvx)
				 vertex[1].set(hvh)
				 hvh.add(hvvvy)
				 vertex[2].set(hvh)
				 hvh.sub(hvvvx)
				 vertex[3].set(hvh)
				 poly.middle.copy(hvp)
				 poly.normal.copy(hvn)
				
				 meshchangedlasttime=solitaire.clock.ms()
				EndIf
				
				If visible
				 'hvn.mul(-1)
				 poly.visible=True
				 For Local vi=0 To 3 
				  vertex[vi].hr.copy(game.solitaire.world.lightambient)
				  vertex[vi].normal.copy(hvn)
			     Next
				 For Local lit:_light=EachIn game.solitaire.world.lightlist
				  For Local vi=0 To 3 
				   vertex[vi].determinelightseparatly(lit,poly)
				  Next
				 Next
				 For Local vi=0 To 3 
				  
				  vertex[vi].setlightresult()
				  vertex[vi].seta(opacity)
				 Next
				Else
				 poly.visible=False
				EndIf
				
				'mesh.updatevertexnormal()
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
				'Print "cardvx="+vx.x+" "+vx.y+" "+vx.z
				'Print "cardvy="+vy.x+" "+vy.y+" "+vy.z
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
	Method innerline:Int(o:_vector3,v:_vector3,para:_vector2)
				Local a#
				Local b#
				Local vxh:_vector3=New _vector3
				Local vyh:_vector3=New _vector3
				Local mvn:_vector3=New _vector3
				Local e:_vector3=New _vector3
				vxh.copy(vx)
				vyh.copy(vy)
				'Print "cardvx="+vx.x+" "+vx.y+" "+vx.z
				'
				'Print "cardvy="+vy.x+" "+vy.y+" "+vy.z
				vxh.mul(0.5)
				vyh.mul(0.5)
				mvn.copy(v)
				mvn.mul(-1)
				e.copy(o)
				e.sub(position)
				Local D#=determine3(vxh,vyh,mvn)
				If Abs(D)>nearzero
				 a=determine3(e,vyh,mvn)/D
				 If (a>=-1) And (a<=1)
				  b=determine3(vxh,e,mvn)/D
				  If (b>=-1) And (b<=1) 
				   para.set(a,b)
				   Return(True)
				  EndIf
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
				WriteFloat(s,angle)
				WriteFloat(s,anglemust)
				WriteFloat(s,anglevector)
				WriteFloat(s,anglevelocity)
				WriteFloat(s,anglefriction)
				shift.save(s)
				shiftmust.save(s)
				shiftvector.save(s)
				WriteFloat(s,shiftvelocity)
				WriteFloat(s,shiftfriction)
				
				WriteFloat(s,neigungx)
				WriteFloat(s,opacity)
				WriteFloat(s,opacityquant)
				
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
				'Print "karte save sw0="+sweetindex[0]
				'Print "karte save sw1="+sweetindex[1]
				WriteInt(s,sweetblocked)
				savepointer(s,array)
				WriteInt(s,arrayindex[0])
				WriteInt(s,arrayindex[1])
				curveposition.save(s)
				curvevx.save(s)
				curvevy.save(s)
				WriteFloat(s,curvepositiont)
				WriteFloat(s,curvevxt)
				WriteFloat(s,curvevyt)
				WriteInt(s,curving)
				'Print "karte save curveing="+curving
				WriteFloat(s,curvespeed)
				WriteInt(s,curvetime)'!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				
				WriteInt(s,inpreparation)
				WriteInt(s,picked)
				pickposition.save(s)
				pickvx.save(s)
				pickvy.save(s)
				WriteInt(s,pickending)
				WriteInt(s,backsided)
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
				angle=ReadFloat(s)
				anglemust=ReadFloat(s)
				anglevector=ReadFloat(s)
				anglevelocity=ReadFloat(s)
				anglefriction=ReadFloat(s)
				shift.Load(s)
				shiftmust.Load(s)
				shiftvector.Load(s)
				shiftvelocity=ReadFloat(s)
				shiftfriction=ReadFloat(s)

				neigungx=ReadFloat(s)
				opacity=ReadFloat(s)
				opacityquant=ReadFloat(s)

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
				'Print "karte load sw0="+sweetindex[0]
				'Print "karte load sw1="+sweetindex[1]
				sweetblocked=ReadInt(s)
				loadpointer(s)
				arrayindex[0]=ReadInt(s)
				arrayindex[1]=ReadInt(s)
				curveposition.Load(s)
				curvevx.Load(s)
				curvevy.Load(s)
				curvepositiont=ReadFloat(s)
				curvevxt=ReadFloat(s)
				curvevyt=ReadFloat(s)
				curving=ReadInt(s)
				'Print "karte load curveing="+curving
				curvespeed=ReadFloat(s)
				curvetime=ReadInt(s)'!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				inpreparation=ReadInt(s)
				picked=ReadInt(s)
				pickposition.Load(s)
				pickvx.Load(s)
				pickvy.Load(s)
				pickending=ReadInt(s)
				backsided=ReadInt(s)
				
				EndMethod									
	Method assoziieren()
				If pointerloaded()
				 
				 parent[0]=_card(associatepointer())
				 parent[1]=_card(associatepointer())
				 child[0]=_card(associatepointer())
				 child[1]=_card(associatepointer())
				 labyrinth=_pilelabyrinth(associatepointer())
				 sweetmatch=_pilesweetmatch(associatepointer())
				 array=_pilearray(associatepointer())
				 releasepointer()
				EndIf
				Local poly:_polygon=_polygon(mesh.polygonlist.firstlink().value())
				
				poly.texture[0,0]=game.solitaire.cardsetmanager.texturefront[suit+number*4]'vorher : solitaire.tcard[suit+number*4]
				poly.texture[1,0]=game.solitaire.cardsetmanager.textureback'vorher : solitaire.tcardback[solitaire.cardtexturebackindex]
				
				
				'poly.texture[0,0]=game.solitaire.tcard[suit+number*4]
			 	'poly.texture[1,0]=game.solitaire.tcardback[game.solitaire.cardtexturebackindex]	
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
