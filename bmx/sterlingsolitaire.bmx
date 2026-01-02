'Project : Sterling Solitaire
'Modul : main
'date of create : 28.02.2008
'date of change : 28.02.2008

Import "..\daten\icon.o"
Strict
Include "..\..\library.bmx\global.bmx"
Include "..\..\library.bmx\vector.bmx"
Include "..\..\library.bmx\geometry.bmx"
Include "..\..\library.bmx\world.bmx"
Include "..\..\library.bmx\graphics.bmx"
Include "..\..\library.bmx\particle.bmx"
Include "..\..\library.bmx\sound.bmx"
Include "..\..\library.bmx\user.bmx"
Include "..\..\library.bmx\gui.bmx"
Include "..\..\library.bmx\storeable.bmx"

 

Include "solitaire.bmx"
Include "guimagic.bmx"
Include "strings_german.bmx"
Include "game.bmx"
Include "gametype.bmx"
Include "gameanimation.bmx"
Include "gamepile.bmx"
Include "environment.bmx"
Include "utils.bmx"

Incbin "..\daten\sterling\szene\himmel.png"
Incbin "..\daten\sterling\szene\holz.png"
Incbin "..\daten\sterling\szene\mohn.png"
Incbin "..\daten\sterling\szene\kate.png"
Incbin "..\daten\sterling\szene\muehlen.png"
Incbin "..\daten\sterling\szene\alpen.png"
Incbin "..\daten\sterling\szene\mond.png"
Incbin "..\daten\sterling\gui\garabd.ttf"
Incbin "..\daten\sterling\gui\arial.ttf"

Incbin "..\daten\images\FX\fire00.tga"
Incbin "..\daten\images\FX\fire01.tga"
Incbin "..\daten\images\FX\fire02.tga"
Incbin "..\daten\images\FX\shadow00.tga"
Incbin "..\daten\images\FX\shadowblock.tga"
Incbin "..\daten\images\FX\shadow01.tga"
Incbin "..\daten\images\FX\shadow16.tga"
Incbin "..\daten\images\FX\corona00.tga"
Incbin "..\daten\images\FX\corona06red.tga"
Incbin "..\daten\images\FX\corona01blue.tga"
Incbin "..\daten\sheepworld\stern.tga"
Incbin "..\daten\sheepworld\schnecke.tga"
Incbin "..\daten\sheepworld\listbox.tga"
Incbin "..\daten\sheepworld\scrollbar.png"
Incbin "..\daten\sheepworld\button_option1_off.tga"			' Button image
Incbin "..\daten\sheepworld\button_option1_on.tga"			' button hover image
Incbin "..\daten\sheepworld\button_option2_off.tga"			' game top button image
Incbin "..\daten\sheepworld\button_option2_on.tga"			' game top button image hover

Incbin "..\daten\sterling\gui\lederstreifen.tga"

Incbin "..\daten\sterling\gui\window_large01.tga"

Incbin "..\daten\sterling\gui\button_off.tga"
Incbin "..\daten\sterling\gui\button_on.tga"
Incbin "..\daten\sterling\gui\button_menu_off.tga"
Incbin "..\daten\sterling\gui\button_menu_on.tga"
Incbin "..\daten\sterling\gui\button_optionen_off.tga"
Incbin "..\daten\sterling\gui\button_optionen_on.tga"

Incbin "..\daten\sterling\gui\button_neu_off.tga"
Incbin "..\daten\sterling\gui\button_neu_on.tga"
Incbin "..\daten\sterling\gui\button_speichern_off.tga"
Incbin "..\daten\sterling\gui\button_speichern_on.tga"
Incbin "..\daten\sterling\gui\button_oeffnen_off.tga"
Incbin "..\daten\sterling\gui\button_oeffnen_on.tga"

Incbin "..\daten\sterling\gui\button_tipp_off.tga"
Incbin "..\daten\sterling\gui\button_tipp_on.tga"
Incbin "..\daten\sterling\gui\button_undo_off.tga"
Incbin "..\daten\sterling\gui\button_undo_on.tga"
Incbin "..\daten\sterling\gui\button_redo_off.tga"
Incbin "..\daten\sterling\gui\button_redo_on.tga"


Incbin "..\daten\sterling\gui\button_shadow.tga"

Incbin "..\daten\sheepworld\window_sheep.tga"			 
Incbin "..\daten\sheepworld\window_statistics.tga"			
Incbin "..\daten\sheepworld\window_240_204.tga"			
Incbin "..\daten\sheepworld\button_start_off.tga"
Incbin "..\daten\sheepworld\button_start_on.tga"
Incbin "..\daten\sheepworld\window_large.tga"
Incbin "..\daten\sheepworld\window_credits.tga"

Incbin "..\daten\sheepworld\button_quad_off.tga"
Incbin "..\daten\sheepworld\button_quad_on.tga"
Incbin "..\daten\sheepworld\button_109_69_off.tga"
Incbin "..\daten\sheepworld\button_109_69_on.tga"
Incbin "..\daten\sheepworld\button_151_44_off.tga"
Incbin "..\daten\sheepworld\button_151_44_on.tga"
Incbin "..\daten\sheepworld\button_hauptmenu_off.tga"
Incbin "..\daten\sheepworld\button_hauptmenu_on.tga"
Incbin "..\daten\sheepworld\button_unvis.tga"
Incbin "..\daten\sheepworld\check.tga"
Incbin "..\daten\sheepworld\checkbox.tga"
Incbin "..\daten\sheepworld\trackbar.png"
Incbin "..\daten\sheepworld\trackbar_slider.tga"
Incbin "..\daten\sheepworld\arrow_left.tga"			 
Incbin "..\daten\sheepworld\arrow_left_red.tga"			 
Incbin "..\daten\sheepworld\arrow_right.tga"		 
Incbin "..\daten\sheepworld\arrow_right_red.tga"	
Incbin "..\daten\sheepworld\button_option2 quit_off.tga"
Incbin "..\daten\sheepworld\button_option2 quit_on.tga"
Incbin "..\daten\sheepworld\button_redup_off.tga"			' 
Incbin "..\daten\sheepworld\button_redup_on.tga"			' 
Incbin "..\daten\sheepworld\button_reddown_off.tga"		    ' 
Incbin "..\daten\sheepworld\button_reddown_on.tga"			' 

Incbin "..\daten\images\cards\card_fs_0010_4_01.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_01.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_01.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_01.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_02.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_02.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_02.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_02.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_03.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_03.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_03.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_03.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_04.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_04.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_04.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_04.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_05.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_05.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_05.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_05.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_06.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_06.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_06.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_06.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_07.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_07.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_07.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_07.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_08.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_08.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_08.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_08.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_09.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_09.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_09.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_09.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_10.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_10.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_10.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_10.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_11.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_11.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_11.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_11.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_12.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_12.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_12.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_12.tga"		' card

Incbin "..\daten\images\cards\card_fs_0010_4_13.tga"		' card
Incbin "..\daten\images\cards\card_fs_0010_1_13.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_2_13.tga"	    ' card
Incbin "..\daten\images\cards\card_fs_0010_3_13.tga"		' card					
				
Incbin "..\daten\sheepworld\pile_leer.tga"					' empty pile
Incbin "..\daten\images\cards\emptykey.tga"					' empty key pile
Incbin "..\daten\sheepworld\symbol_kreuz.tga"
Incbin "..\daten\sheepworld\symbol_karo.tga"
Incbin "..\daten\sheepworld\symbol_herz.tga"
Incbin "..\daten\sheepworld\symbol_pik.tga"
Incbin "..\daten\images\cards\symbol_suit0.tga"
Incbin "..\daten\images\cards\symbol_suit1.tga"
Incbin "..\daten\images\cards\symbol_suit2.tga"
Incbin "..\daten\images\cards\symbol_suit3.tga"
Incbin "..\daten\images\cards\symbol_suit0rand.tga"
Incbin "..\daten\images\cards\symbol_suit1rand.tga"
Incbin "..\daten\images\cards\symbol_suit2rand.tga"
Incbin "..\daten\images\cards\symbol_suit3rand.tga"
Incbin "..\daten\sheepworld\A.tga"
Incbin "..\daten\sheepworld\B.tga"
Incbin "..\daten\sheepworld\D.tga"
Incbin "..\daten\sheepworld\K.tga"
Incbin "..\daten\sheepworld\2.tga"
Incbin "..\daten\sheepworld\3.tga"
Incbin "..\daten\sheepworld\4.tga"
Incbin "..\daten\sheepworld\5.tga"
Incbin "..\daten\sheepworld\6.tga"
Incbin "..\daten\sheepworld\7.tga"
Incbin "..\daten\sheepworld\8.tga"
Incbin "..\daten\sheepworld\9.tga"
Incbin "..\daten\sheepworld\10.tga"
Incbin "..\daten\sheepworld\X.tga"

Incbin "..\daten\images\cards\card_fs_0010_back.tga"
Incbin "..\daten\sterling\karte\back_blau.tga"
Incbin "..\daten\sterling\karte\back_blau_2.tga"
Incbin "..\daten\sterling\karte\back_blau_3a.tga"
Incbin "..\daten\sterling\karte\back_blau_relief.tga"
Incbin "..\daten\sterling\karte\back_blau_schmutz.tga"

Incbin "..\daten\sheepworld\effect_blume00.tga"
Incbin "..\daten\sheepworld\effect_blume01.tga"
Incbin "..\daten\sheepworld\effect_blume02.tga"
Incbin "..\daten\sheepworld\effect_blume03.tga"
Incbin "..\daten\sheepworld\blume00.tga"
Incbin "..\daten\sheepworld\blume01.tga"
Incbin "..\daten\sheepworld\blume02.tga"
Incbin "..\daten\sheepworld\blume03.tga"
Incbin "..\daten\images\cards\blase.tga"					' blase pile
'Incbin "..\daten\images\cards\back1.tga"					' card backside 
'Incbin "..\daten\images\cards\back2.tga"					' card backside 
Incbin "..\daten\images\cards\tableau.tga"
Incbin "..\daten\sheepworld\listboxbackground.tga"

'------------------- load screen -------------------
Incbin "..\daten\sheepworld\sheepload00.tga"
Incbin "..\daten\sheepworld\sheepload01.tga"
Incbin "..\daten\sheepworld\sheepload02.tga"
Incbin "..\daten\sterling\gui\loadscreen00.png"
Incbin "..\daten\sheepworld\grasend_seite_0000.tga"
Incbin "..\daten\sheepworld\grasend_seite_0001.tga"
Incbin "..\daten\sheepworld\grasend_seite_0002.tga"
Incbin "..\daten\sheepworld\grasend_seite_0007.tga"
Incbin "..\daten\sheepworld\grasend_seite_0009.tga"
Incbin "..\daten\sheepworld\grasend_seite_0011.tga"
Incbin "..\daten\sheepworld\logo.tga"


'------------------ card sounds -------------------
Incbin "..\daten\sounds\turn.ogg"
Incbin "..\daten\sounds\turnsmooth.ogg"
Incbin "..\daten\sounds\move.ogg"
Incbin "..\daten\sounds\single.ogg"
Incbin "..\daten\sounds\spend.ogg"
'------------------ other sounds ------------------

Incbin "..\daten\sounds\explosion2.ogg"
Incbin "..\daten\sounds\spark.ogg"
Incbin "..\daten\sounds\gong.ogg"
Incbin "..\daten\sounds\guidip.ogg"
'----------------- musik --------------------------

Incbin "..\daten\sheepworld\musik\damit_die_sonne.ogg"
Incbin "..\daten\sheepworld\musik\the_bee.ogg"
Incbin "..\daten\sheepworld\musik\damit_der_fruehling.ogg"
Incbin "..\daten\sheepworld\musik\damit_der_hunger.ogg"
Incbin "..\daten\sheepworld\musik\damit_die_nacht.ogg"
'Incbin "..\daten\sterling\musik\frenchkiss.ogg"
Rem

Incbin "..\daten\sheepworld\musik\guidip.ogg"'damit_die_sonne.ogg"
Incbin "..\daten\sheepworld\musik\guidip.ogg"'the_bee.ogg"
Incbin "..\daten\sheepworld\musik\guidip.ogg"'damit_der_fruehling.ogg"
Incbin "..\daten\sheepworld\musik\guidip.ogg"'damit_der_hunger.ogg"
Incbin "..\daten\sheepworld\musik\guidip.ogg"'damit_die_nacht.ogg"
EndRem

'******************************************************************************************************************
'										S O L I T A I R E S T E R L I N G
'******************************************************************************************************************
Type _solitairesterling Extends _solitaire
	'------------------------------------effects
	Field background:_background=Null
	
	
	Field fireworkcards:_fireworkcards=Null
	Field fireworkrocket:_fireworkrocket=Null
	Field fireworkimage:_fireworkimage=Null
	Field winmusic=False
	Field winmusicbefore:Int=0
	
	
	Field t0:_texture=Null
	Field t1:_texture=Null
	'ield tblume:_texture[4]
	'------------------------------------------ animation images and textures	
	Field ischnecke:timage=Null
	Field istern:timage=Null
	Field ilogo:timage=Null
	'------------------------------------------ gui data
	Field ilederstreifen:timage=Null
	Field ilistboxl:timage=Null
	Field iscrollbar:timage=Null
	Field imenubackground:timage[10]
	Field iguiwindow:timage=Null
	Field icredits:timage=Null
	Field iwindow240204:timage=Null
	Field ibuttons:TImage=Null
	Field ibuttonshl:TImage=Null
	Field ibuttonl:TImage=Null
	Field ibuttonlhl:TImage=Null
	Field ibuttonmenu:timage[2]
	Field ibuttonoptions:timage[2]
	Field ibuttonnew:timage[2]
	Field ibuttonsave:timage[2]
	Field ibuttonload:timage[2]
	Field ibuttontipp:timage[2]
	Field ibuttonundo:timage[2]
	Field ibuttonredo:timage[2]
	
	Field ibuttonshadow:TImage=Null
	
	Field ibuttonarrowloff:timage=Null
	Field ibuttonarrowlon:timage=Null
	Field ibuttonarrowroff:timage=Null
	Field ibuttonarrowron:timage=Null
	Field ibuttonarrowuoff:timage=Null
	Field ibuttonarrowuon:timage=Null
	Field ibuttonarrowdoff:timage=Null
	Field ibuttonarrowdon:timage=Null
	Field ibuttonstartoff:timage=Null
	Field ibuttonstarton:timage=Null
	Field ibuttonquadoff:timage=Null
	Field ibuttonquadon:timage=Null
	Field ibutton10969off:timage=Null
	Field ibutton10969on:timage=Null
	Field ibutton15144off:timage=Null
	Field ibutton15144on:timage=Null
	Field ibuttonhaupton:timage=Null
	Field ibuttonhauptoff:timage=Null
	Field ibuttonquiton:timage=Null
	Field ibuttonquitoff:timage=Null
	Field ibuttonunvis:timage=Null
	Field icheckbox:timage=Null
	Field icheckboxhl:timage=Null
	Field icheck:timage=Null
	Field itrackbar:timage=Null
	Field itrackbarleft:timage=Null
	Field itrackbarright:timage=Null
	Field itrackbarslider:timage=Null
	Field ifondred:timage=Null
	Field ifondstats:timage=Null
	Field itableau:timage=Null
	'---------------------------------------load screen	
	Field isheepload:timage[16]		
	Field timesheepload#=0	
	Field timesheepakku#=0	
	Field sheeploadindex=0
	Field timesheeptimer:ttimer=Null
	'--------------------------------------music control
	Field titelmusik:TSound=Null	
	'Field musicman:_musicmanagement=Null
	Field musicfade#=0
	Field musicfadedest#=1
	Field musicstatus=2
	Field musicstarttime=0
	Field musiclength[3]
	Field musicswitch=0
	'----------------------------------------menues
	

	
	
	
	'---------------------------------------mainmenu
	Field buttonwidth#=102
	Field buttonheight#=33	
	Field buttonstart:_guibutton=Null
	Field windowstats:_guiwindow=Null
	Field windowstatstype:_guitext=Null
	Field windowstatshigh:_guitext[5]
	Field windowstatscount:_guitext=Null
	Field windowstatsquote:_guitext=Null
	Field windowstatstime:_guitext=Null
	Field windowstatsmoves:_guitext=Null
	Field tmmcurgame:_guitext=Null
	Field tmmtime:_guitext=Null
	Field windowsheepgametype:_guiwindow=Null
	Field windowsheepcard:_guiwindow=Null
	Field windowsheepscene:_guiwindow=Null
	Field windowsheepmusic:_guiwindow=Null
	'Field tswtype:_guitext=Null
	'Field tswcardfront:_guitext=Null
	'Field tswcardback:_guitext=Null
	'Field tswscene:_guitext=Null
	'Field tswmusic:_guitext=Null
		

	Method drawloadscreen()
				Local o:_vector3=New _vector3
				Local c:_vector4=New _vector4
				Local h$="Sterling Solitaire wird geladen."
				Local nt#=TimerTicks(timesheeptimer)
				clock.animate()
				'Print "nt="+nt
				Local dt#=nt-timesheepload
				'Print "dt="+dt
				timesheepload=nt
				
				timesheepakku:+1
				
				
				
				If iloadscreen
				 SetBlend(SOLIDBLEND)
				 SetColor(255,255,255)
				 DrawImageRect(iloadscreen,0,0,gra.screenw,gra.screenh)
				Else
				 SetClsColor(20,100,10)
				 Cls
				EndIf
				SetImageFont(font32)
				SetBlend(SOLIDBLEND)
				SetBlend(MASKBLEND|ALPHABLEND)
				DrawImageRect(isheepload[sheeploadindex],gra.screenw/2+50,gra.screenh/2+30,180,150)
				'Print "ta="+timesheepakku
				If timesheepakku>5
				 'While(timesheepakku>200) timesheepakku:-200
				 timesheepakku=0
				 sheeploadindex:+1
				 If sheeploadindex>15 sheeploadindex=0
				EndIf
				
				
				
				o.set(gra.screenw/2-TextWidth(h)/2-70,gra.screenh/2-TextHeight(h)/2-30,4)
				c.set(1,1,0.8,0.8)
				Drawguitext(h,o,c)
				gra.swap()
				EndMethod
	Method loadimagesheep:timage(name$,masked:Int=False)
				drawloadscreen()
				Return(loadimageassert(name,masked))
				EndMethod
	Method loadtexturesheep:_texture(name$)				
				drawloadscreen()
				Return(loadtextureassert(name))
				EndMethod
	Method New()
				AppTitle="Sterling Solitaire"
				loadoptions("sterlingoptions.sol")
				cardtexturefrontcount=1
				cardtexturebackcount=6
				cardtexturebackindex=0
				scenecount=7
				musiccount=6
				For Local i=0 To 999
				 gametypeactive[i]=False
				Next
				For Local i=0 To 37
				 gametypeactive[i]=True
				Next
				gametypeactive[11]=False
				gametypeactive[12]=False
				gametypeactive[28]=False
				gametypeactive[39]=True
				gametypeactive[45]=True
				gametypeactive[56]=True
				gametypeactive[59]=True
				gametypeactive[62]=True
				gametypeactive[70]=True
			gametypeactive[54]=True
			gametypeactive[76]=True
				SeedRnd MilliSecs()
				sheeploadindex=Rand(0,15)
				'fullscreen=False
				guisystem=New _guisystem
				guisystem.init(1024,768)
				graphics_setup(5)
				gra.enabletext2d()
				SetMaskColor(255,100,254)
				iloadscreen=LoadImageassert("incbin::..\daten\sterling\gui\loadscreen00.png")
				isheepload[0]=LoadImageassert("Incbin::..\daten\sheepworld\grasend_seite_0000.tga")
				isheepload[1]=LoadImageassert("Incbin::..\daten\sheepworld\grasend_seite_0001.tga")
				isheepload[2]=LoadImageassert("Incbin::..\daten\sheepworld\grasend_seite_0002.tga")
				isheepload[3]=isheepload[1]
				isheepload[4]=isheepload[2]
				isheepload[5]=isheepload[1]
				isheepload[6]=isheepload[0]
				isheepload[7]=LoadImageassert("Incbin::..\daten\sheepworld\grasend_seite_0007.tga")
				isheepload[8]=isheepload[7]
				isheepload[9]=LoadImageassert("Incbin::..\daten\sheepworld\grasend_seite_0009.tga")
				isheepload[10]=isheepload[7]
				isheepload[11]=LoadImageassert("Incbin::..\daten\sheepworld\grasend_seite_0011.tga")
				isheepload[12]=isheepload[7]
				isheepload[13]=isheepload[9]
				isheepload[14]=isheepload[7]
				isheepload[15]=isheepload[11]
				
				font32=LoadImageFontassert("Incbin::..\daten\sterling\gui\garabd.ttf",30,smoothfont)	
				clock=New _clock
				timesheeptimer=CreateTimer(1000)
				timesheepload=TimerTicks(timesheeptimer)
				timesheepakku=0
				drawloadscreen()
				drawloadscreen()
				'menuman=New _menumanagement
				menucameraposition.set(3,1,-50)


				
				world=New _world	
				world.worldfield.homogen.set(0,0,1)				
				
				cam=New _camerasolitaire
				cam.position.copy(menucameraposition)
				cam.up.set(0,0.75 ,0)
				cam.side.set(1,0,0)	

				mousevector=New _vector3
				
				tfeuer=New _texture
				tfeuer.init("Incbin::..\daten\images\FX\fire01.tga")
				tfeuer2=New _texture
				tfeuer2.init("Incbin::..\daten\images\FX\fire02.tga")
				
				tshadow=New _texture
				tshadow.init("Incbin::..\daten\images\FX\shadow00.tga")
				tshadowblock=New _texture
				tshadowblock.init("Incbin::..\daten\images\FX\shadowblock.tga")
				tshadow16=New _texture
				tshadow16.init("Incbin::..\daten\images\FX\shadow16.tga")
				tcorona=New _texture
				tcorona.init("Incbin::..\daten\images\FX\corona00.tga")
				tcoronared=New _texture
				tcoronared.init("Incbin::..\daten\images\FX\corona06red.tga")
				tcoronablue=New _texture
				tcoronablue.init("Incbin::..\daten\images\FX\corona01blue.tga")				
				
				'------------------------------------------------- resources load --------------------------------------
				fontarial12=LoadImageFontassert("Incbin::..\daten\sterling\gui\arial.ttf", 12, SMOOTHFONT)
				fontarial16=LoadImageFontassert("Incbin::..\daten\sterling\gui\arial.ttf", 16, SMOOTHFONT|BOLDFONT)
				font=LoadImageFontassert("Incbin::..\daten\sterling\gui\garabd.ttf", 5, SMOOTHFONT)
				font24=LoadImageFontassert("incbin::..\daten\sterling\gui\garabd.ttf",24,smoothfont)
				font22=LoadImageFontassert("incbin::..\daten\sterling\gui\garabd.ttf",22,smoothfont)
				font20=LoadImageFontassert("incbin::..\daten\sterling\gui\garabd.ttf",20,smoothfont)
				font18=LoadImageFontassert("incbin::..\daten\sterling\gui\garabd.ttf",18,smoothfont)
				font14=LoadImageFontassert("incbin::..\daten\sterling\gui\garabd.ttf",14,smoothfont)
				font10=LoadImageFontassert("incbin::..\daten\sterling\gui\garabd.ttf",10,smoothfont)
				SetImageFont(font24)

				ibuttonl=loadimagesheep("incbin::..\daten\sterling\gui\button_off.tga")
				ibuttonlhl=loadimagesheep("incbin::..\daten\sterling\gui\button_on.tga")
				ibuttons=loadimagesheep("incbin::..\daten\sterling\gui\button_off.tga")
				ibuttonshl=loadimagesheep("incbin::..\daten\sterling\gui\button_on.tga")
				ibuttonshadow=loadimagesheep("incbin::..\daten\sterling\gui\button_shadow.tga")
				ibuttonmenu[0]=loadimagesheep("incbin::..\daten\sterling\gui\button_menu_off.tga")
				ibuttonmenu[1]=loadimagesheep("incbin::..\daten\sterling\gui\button_menu_on.tga")
				ibuttonoptions[0]=loadimagesheep("incbin::..\daten\sterling\gui\button_optionen_off.tga")
				ibuttonoptions[1]=loadimagesheep("incbin::..\daten\sterling\gui\button_optionen_on.tga")
				ibuttonnew[0]=loadimagesheep("incbin::..\daten\sterling\gui\button_neu_off.tga")
				ibuttonnew[1]=loadimagesheep("incbin::..\daten\sterling\gui\button_neu_on.tga")
				ibuttonload[0]=loadimagesheep("incbin::..\daten\sterling\gui\button_oeffnen_off.tga")
				ibuttonload[1]=loadimagesheep("incbin::..\daten\sterling\gui\button_oeffnen_on.tga")
				ibuttonsave[0]=loadimagesheep("incbin::..\daten\sterling\gui\button_speichern_off.tga")
				ibuttonsave[1]=loadimagesheep("incbin::..\daten\sterling\gui\button_speichern_on.tga")
				ibuttontipp[0]=loadimagesheep("incbin::..\daten\sterling\gui\button_tipp_off.tga")
				ibuttontipp[1]=loadimagesheep("incbin::..\daten\sterling\gui\button_tipp_on.tga")
				ibuttonundo[0]=loadimagesheep("incbin::..\daten\sterling\gui\button_undo_off.tga")
				ibuttonundo[1]=loadimagesheep("incbin::..\daten\sterling\gui\button_undo_on.tga")
				ibuttonredo[0]=loadimagesheep("incbin::..\daten\sterling\gui\button_redo_off.tga")
				ibuttonredo[1]=loadimagesheep("incbin::..\daten\sterling\gui\button_redo_on.tga")
				ilederstreifen=loadimagesheep("incbin::..\daten\sterling\gui\lederstreifen.tga")
				
				ischnecke=loadimagesheep("Incbin::..\daten\sheepworld\schnecke.tga")
				istern=loadimagesheep("Incbin::..\daten\sheepworld\stern.tga")
				ilistboxl=loadimagesheep("Incbin::..\daten\sheepworld\listbox.tga")
				iscrollbar=loadimagesheep("Incbin::..\daten\sheepworld\scrollbar.png")

				ifondred=loadimagesheep("incbin::..\daten\sheepworld\window_sheep.tga")
				ifondstats=loadimagesheep("incbin::..\daten\sheepworld\window_statistics.tga")' game top button image hover
				iwindow240204=loadimagesheep("incbin::..\daten\sheepworld\window_240_204.tga")
				iguiwindow=loadimagesheep("Incbin::..\daten\sterling\gui\window_large01.tga")
				icredits=loadimagesheep("Incbin::..\daten\sheepworld\window_credits.tga")
				
				ibuttonquadoff=loadimagesheep("incbin::..\daten\sheepworld\button_quad_off.tga")
				ibuttonquadon=loadimagesheep("incbin::..\daten\sheepworld\button_quad_on.tga")
				ibutton10969off=loadimagesheep("incbin::..\daten\sheepworld\button_109_69_off.tga")
				ibutton10969on=loadimagesheep("incbin::..\daten\sheepworld\button_109_69_on.tga")
				ibutton15144off=loadimagesheep("incbin::..\daten\sheepworld\button_151_44_off.tga")
				ibutton15144on=loadimagesheep("incbin::..\daten\sheepworld\button_151_44_on.tga")
				ibuttonhaupton=loadimagesheep("incbin::..\daten\sheepworld\button_hauptmenu_on.tga")
				ibuttonhauptoff=loadimagesheep("incbin::..\daten\sheepworld\button_hauptmenu_off.tga")
				ibuttonstartoff=loadimagesheep("incbin::..\daten\sheepworld\button_start_off.tga")
				ibuttonstarton=loadimagesheep("incbin::..\daten\sheepworld\button_start_on.tga")
				ibuttonunvis=loadimagesheep("incbin::..\daten\sheepworld\button_unvis.tga")
				icheck=loadimagesheep("Incbin::..\daten\sheepworld\check.tga")
				icheckbox=loadimagesheep("incbin::..\daten\sheepworld\checkbox.tga")
				icheckboxhl=loadimagesheep("incbin::..\daten\sheepworld\checkbox.tga")
				itrackbar=loadimagesheep("Incbin::..\daten\sheepworld\trackbar.png")
				itrackbarslider=loadimagesheep("Incbin::..\daten\sheepworld\trackbar_slider.tga")
				ibuttonarrowloff=loadimagesheep("incbin::..\daten\sheepworld\arrow_left.tga")
				ibuttonarrowlon =loadimagesheep("incbin::..\daten\sheepworld\arrow_left_red.tga")
				ibuttonarrowroff=loadimagesheep("incbin::..\daten\sheepworld\arrow_right.tga")
				ibuttonarrowron =loadimagesheep("incbin::..\daten\sheepworld\arrow_right_red.tga")
				
				ibuttonquiton=loadimagesheep("incbin::..\daten\sheepworld\button_option2 quit_on.tga")
				ibuttonquitoff=loadimagesheep("incbin::..\daten\sheepworld\button_option2 quit_off.tga")
				ibuttonarrowuoff=loadimagesheep("incbin::..\daten\sheepworld\button_redup_off.tga")
				ibuttonarrowuon =loadimagesheep("incbin::..\daten\sheepworld\button_redup_on.tga")
				ibuttonarrowdoff=loadimagesheep("incbin::..\daten\sheepworld\button_reddown_off.tga")
				ibuttonarrowdon =loadimagesheep("incbin::..\daten\sheepworld\button_reddown_on.tga")
				
				imenubackground[0]=loadimagesheep("Incbin::..\daten\sterling\szene\himmel.png")
				imenubackground[1]=loadimagesheep("Incbin::..\daten\sterling\szene\holz.png")
				imenubackground[2]=loadimagesheep("Incbin::..\daten\sterling\szene\mohn.png")
				imenubackground[3]=loadimagesheep("Incbin::..\daten\sterling\szene\kate.png")
				imenubackground[4]=loadimagesheep("Incbin::..\daten\sterling\szene\muehlen.png")
				imenubackground[5]=loadimagesheep("Incbin::..\daten\sterling\szene\alpen.png")
				imenubackground[6]=loadimagesheep("Incbin::..\daten\sterling\szene\mond.png")

				ilogo=LoadImagesheep("Incbin::..\daten\sheepworld\logo.tga")
				gra.enabletext2d()
				'------------------------------------------- preview cards load -----------------------------------
				For Local d=0 To cardtexturefrontcount-1
				 For Local j=0 To 3
				  Local n
				  If j=0 n=0+ 0
				  If j=1 n=51-5-5
				  If j=2 n=51-5
				  If j=3 n=51
				  tcardpreview[d,j]=New _texture
				  Local s=(n Mod 4)+1
				  Local suit
				  If s=1 suit=4
				  If s=2 suit=1
				  If s=3 suit=2
				  If s=4 suit=3
				  Local number=(n/4)+1
				  Local h$=number;If h.length=1 h="0"+h
				
				  Local fn$="cards\card_fs_00"+(d+1)+"0_"+suit+"_"+h+".tga"
				  If fileexists(fn) 
				   tcardpreview[d,j].init(fn)
				  Else
  				   tcardpreview[d,j].init("Incbin::..\daten\images\cards\card_fs_00"+(d+1)+"0_"+suit+"_"+h+".tga")
  				  EndIf
  				  drawloadscreen()
				 Next
				Next
				'---------------------------------------- actual cards deck load -----------------------------------
				updatetextureload("fs","..\daten\images\cards",True)				
				pmsymbolsuit[0]=LoadPixmap("Incbin::..\daten\images\cards\symbol_suit0.tga")
				pmsymbolsuit[1]=LoadPixmap("Incbin::..\daten\images\cards\symbol_suit1.tga")
				pmsymbolsuit[2]=LoadPixmap("Incbin::..\daten\images\cards\symbol_suit2.tga")
				pmsymbolsuit[3]=LoadPixmap("Incbin::..\daten\images\cards\symbol_suit3.tga")
				pmsymbolsuitrand[0]=LoadPixmap("Incbin::..\daten\images\cards\symbol_suit0rand.tga")
				pmsymbolsuitrand[1]=LoadPixmap("Incbin::..\daten\images\cards\symbol_suit1rand.tga")
				pmsymbolsuitrand[2]=LoadPixmap("Incbin::..\daten\images\cards\symbol_suit2rand.tga")
				pmsymbolsuitrand[3]=LoadPixmap("Incbin::..\daten\images\cards\symbol_suit3rand.tga")				

				pmblumerand[0]=LoadPixmap("Incbin::..\daten\sheepworld\effect_blume00.tga")
				pmblumerand[1]=LoadPixmap("Incbin::..\daten\sheepworld\effect_blume01.tga")
				pmblumerand[2]=LoadPixmap("Incbin::..\daten\sheepworld\effect_blume02.tga")
				pmblumerand[3]=LoadPixmap("Incbin::..\daten\sheepworld\effect_blume03.tga")
				
				tblume[0]=loadtexturesheep("Incbin::..\daten\sheepworld\blume00.tga")
				tblume[1]=loadtexturesheep("Incbin::..\daten\sheepworld\blume01.tga")
				tblume[2]=loadtexturesheep("Incbin::..\daten\sheepworld\blume02.tga")
				tblume[3]=loadtexturesheep("Incbin::..\daten\sheepworld\blume03.tga")



				itableau=loadimagesheep("Incbin::..\daten\images\cards\tableau.tga")

				tempty=New _texture
				tempty.init("Incbin::..\daten\sheepworld\pile_leer.tga")
				drawloadscreen()
				temptykey=New _texture
				temptykey.init("Incbin::..\daten\images\cards\emptykey.tga")
				drawloadscreen()
				tsymbolsuit[0]=New _texture
				tsymbolsuit[0].init("Incbin::..\daten\sheepworld\symbol_kreuz.tga")
				drawloadscreen()
				tsymbolsuit[1]=New _texture
				tsymbolsuit[1].init("Incbin::..\daten\sheepworld\symbol_karo.tga")
				drawloadscreen()
				tsymbolsuit[2]=New _texture
				tsymbolsuit[2].init("Incbin::..\daten\sheepworld\symbol_herz.tga")
				drawloadscreen()
				tsymbolsuit[3]=New _texture
				tsymbolsuit[3].init("Incbin::..\daten\sheepworld\symbol_pik.tga")


				drawloadscreen()
				tsymbolnumber[0]=New _texture
				tsymbolnumber[0].init("Incbin::..\daten\sheepworld\A.tga")
				drawloadscreen()
				tsymbolnumber[1]=New _texture
				tsymbolnumber[1].init("Incbin::..\daten\sheepworld\2.tga")
				drawloadscreen()
				tsymbolnumber[2]=New _texture
				tsymbolnumber[2].init("Incbin::..\daten\sheepworld\3.tga")
				drawloadscreen()
				tsymbolnumber[3]=New _texture
				tsymbolnumber[3].init("Incbin::..\daten\sheepworld\4.tga")
				drawloadscreen()
				tsymbolnumber[4]=New _texture
				tsymbolnumber[4].init("Incbin::..\daten\sheepworld\5.tga")
				drawloadscreen()
				tsymbolnumber[5]=New _texture
				tsymbolnumber[5].init("Incbin::..\daten\sheepworld\6.tga")
				drawloadscreen()
				tsymbolnumber[6]=New _texture
				tsymbolnumber[6].init("Incbin::..\daten\sheepworld\7.tga")
				drawloadscreen()
				tsymbolnumber[7]=New _texture
				tsymbolnumber[7].init("Incbin::..\daten\sheepworld\8.tga")
				drawloadscreen()
				tsymbolnumber[8]=New _texture
				tsymbolnumber[8].init("Incbin::..\daten\sheepworld\9.tga")
				drawloadscreen()
				tsymbolnumber[9]=New _texture
				tsymbolnumber[9].init("Incbin::..\daten\sheepworld\10.tga")
				drawloadscreen()
				tsymbolnumber[10]=New _texture
				tsymbolnumber[10].init("Incbin::..\daten\sheepworld\B.tga")
				drawloadscreen()
				tsymbolnumber[11]=New _texture
				tsymbolnumber[11].init("Incbin::..\daten\sheepworld\D.tga")
				drawloadscreen()
				tsymbolnumber[12]=New _texture
				tsymbolnumber[12].init("Incbin::..\daten\sheepworld\K.tga")
				drawloadscreen()
				tsymbolfine=New _texture
				tsymbolfine.init("Incbin::..\daten\sheepworld\X.tga")
				drawloadscreen()
				
				tblase=New _texture
				tblase.init("Incbin::..\daten\images\cards\blase.tga")
				drawloadscreen()
				
				
				tcardback[0]=New _texture
				tcardback[0].init("Incbin::..\daten\images\cards\card_fs_0010_back.tga")
				drawloadscreen()
				tcardback[1]=New _texture
				tcardback[1].init("Incbin::..\daten\sterling\karte\back_blau.tga")
				drawloadscreen()
				tcardback[2]=New _texture
				tcardback[2].init("Incbin::..\daten\sterling\karte\back_blau_2.tga")
				drawloadscreen()
				tcardback[3]=New _texture
				tcardback[3].init("Incbin::..\daten\sterling\karte\back_blau_3a.tga")
				drawloadscreen()
				tcardback[4]=New _texture
				tcardback[4].init("Incbin::..\daten\sterling\karte\back_blau_relief.tga")
				drawloadscreen()
				tcardback[5]=New _texture
				tcardback[5].init("Incbin::..\daten\sterling\karte\back_blau_schmutz.tga")
				drawloadscreen()
				
				
				
				
				'----------------------------------------------------- load sounds -------------------------------------------------------------
				smove=loadsoundassert("Incbin::..\daten\sounds\move.ogg")	
				sturn=loadsoundassert("Incbin::..\daten\sounds\turn.ogg")	
				sturnsmooth=loadsoundassert("Incbin::..\daten\sounds\turnsmooth.ogg")	
				sspend=loadsoundassert("Incbin::..\daten\sounds\spend.ogg")	
				ssingle=loadsoundassert("Incbin::..\daten\sounds\single.ogg")	
				sexplosion[0]=loadsoundassert("Incbin::..\daten\sounds\explosion2.ogg")	
				sspark=loadsoundassert("Incbin::..\daten\sounds\spark.ogg")					
				sgong=loadsoundassert("Incbin::..\daten\sounds\gong.ogg")					
				guisystem.dip[1]=loadsoundassert("Incbin::..\daten\sounds\guidip.ogg")
				'----------------------------------------------------- load music -------------------------------------------------------------
				musicman=New _musicmanagement
				musicman.init(clock,musiccount)
				musicman.playtime[0]=2*113139-1000
				musicman.playtime[1]=2*96000-1000
				musicman.playtime[2]=2*121486-1000
				musicman.playtime[3]=2*123690-1000
				musicman.playtime[4]=2*80000-1000
				musicman.playtime[5]=2*85000-1000
				
				musicman.file[0]="Incbin::..\daten\sheepworld\musik\damit_die_sonne.ogg"
				musicman.file[1]="Incbin::..\daten\sheepworld\musik\the_bee.ogg"
				musicman.file[2]="Incbin::..\daten\sheepworld\musik\damit_der_fruehling.ogg"
				musicman.file[3]="Incbin::..\daten\sheepworld\musik\damit_der_hunger.ogg"
				musicman.file[4]="Incbin::..\daten\sheepworld\musik\damit_die_nacht.ogg"
				musicman.file[5]="Incbin::..\daten\sounds\gong.ogg"
				Rem
				musicman.file[0]="Incbin::..\daten\sheepworld\musik\guidip.ogg"'damit_die_sonne.ogg"
				musicman.file[1]="Incbin::..\daten\sheepworld\musik\guidip.ogg"'the_bee.ogg"
				musicman.file[2]="Incbin::..\daten\sheepworld\musik\guidip.ogg"'damit_der_fruehling.ogg"
				musicman.file[3]="Incbin::..\daten\sheepworld\musik\guidip.ogg"'damit_der_hunger.ogg"
				musicman.file[4]="Incbin::..\daten\sheepworld\musik\guidip.ogg"'damit_die_nacht.ogg"
				EndRem
				drawloadscreen()
				While musicman.loadsoundstep() 
				 drawloadscreen()
				 drawloadscreen()
				 drawloadscreen()
				 drawloadscreen()
				 drawloadscreen()
				Wend
				drawloadscreen()
				'------------------------------------------------------ prepare ----------------------------------------------------
				guisystem.clearchild()
				createmenugametype()					
				createmenumain()
				createmenugame()
				createmenuscene()
				createmenuoptionsacoustics()
				createmenuoptionsgraphics()
				createmenuoptionsgame()
				createmenuoptionscard()
				createmenuoptionscredits()				
				'guisystem.colors.std.set(0.588,0.588,0.588,0)
				guisystem.colors.mark.set(0,0,0.25,0)
				guisystem.colors.active.set(0,0,0.5,0)
				
				gamestats=New _gamestats[gametypecount]
				loadstatistics("sterlingstatistics.sol")
				gra.enabletext2d()
		
				menuoptionslast=menuoptionsacoustics
				updatemenumain()					
				updatescene()
				musicman.play(currentmusic,False,True)'updatemusic()
				blendscreen=CreateImage(gra.screenw,gra.screenh,1,DYNAMICIMAGE)
				GrabImage(blendscreen,0,0)
				blendscreenopacity=1
				iloadscreen=Null
				For Local nn=0 To 15
				 isheepload[nn]=Null
				Next
				fireworkcards=New _fireworkcards
				fireworkcards.initfireworkcards(Self,world,particlesourcegamelist,particlelistscene,clock)
				fireworkrocket=New _fireworkrocket
				fireworkrocket.initfireworkrocket(Self,world,particlesourcegamelist,particlelistscene,clock)
				fireworkimage=New _fireworkimage
				fireworkimage.initfireworkimage(Self,world,particlesourcegamelist,particlelistscene,clock)				
				EndMethod
	
	'------------------------------------------------------ statistics functions ----------------------------------------------
	Rem
	Method loadstats()
				Local s:TStream
				s=ReadFile("sterlingstatistics.sol")
				If Not s 
				 generatestats()
				 savestats()
				Else
				 Local typecount=ReadInt(s)
				 For Local i=0 To typecount-1
				  Local typ$=ReadLine(s)
				  If typ="_gamestats"
				   gamestats[i]=New _gamestats
				   gamestats[i].init(Self,i)
				   gamestats[i].Load(s)
				  EndIf
				 Next
				 CloseStream(s)
				EndIf
				EndMethod
				EndRem

			
		
	Method takestatistics(showhighscore)
				If game.inuse And game.statsclosed=False And game.preview=False
				 game.statsclosed=True
				' Print "takestats"
				 Local e:_gamestatsentry=New _gamestatsentry
				 e.init(gamestats[cur_game])
				 e.time=game.time
				 e.discards=game.discards
				 e.undos=game.undos
				 e.moves=game.moves
				 e.tipps=game.tipps
				 Local h:_gamestatsentry=New _gamestatsentry
				 h.init(gamestats[cur_game],True)
				 h.copy(e)
				 gamestats[cur_game].highscorelist.sort()
				 If h.index()<5
				  'Print "takestats2"
				  usernamendialog(h,gra.screenw/2,gra.screenh/2,showhighscore)
				 Else
				  If game.ended
				   messagebox(strnohighscore,strdamn,gra.screenw/2,gra.screenh/2,font18,iwindow240204)
				  EndIf
				 EndIf
				EndIf
				EndMethod				
	
	'------------------------------------------------------------------------------------------------------------------------				
	Method updatescene()
				'world.lightlist.clear()
				Local l:TList=CreateList()
				For Local lit:_light=EachIn world.lightlist
				 If lit.noshadow=False l.addlast(lit)
				Next
				For Local lit:_light=EachIn l
				 lit.deinsert()
				Next		
				l.clear()		
				guisystem.background[0].clear()'image=imenubackground[currentscene]		
				guisystem.background[0].addlast(imenubackground[currentscene])
				
				If currentscene=0'sonne
				 sceneambient[0].set(0.082,0.18,0.5)
				 scenediffuse[0].set(1,0.9,0.28)
				 Local l:_light=New _light
				 l.init(world,-30,30,-60,0,0,0,9000)						
				 l.color.copy(scenediffuse[currentscene])
				 If game game.sigmadiffuse(0.4)
				EndIf
				If currentscene=1'biene
				 sceneambient[1].set(0.5,0.45,0.3)
				 scenediffuse[1].set(1,0.89,0.7)
				 Local l:_light=New _light
				 l.init(world,-50,50,-40,0,0,0,85000)						
				 l.color.copy(scenediffuse[currentscene])
				 If game game.sigmadiffuse(0.27)
				EndIf
				If currentscene=2'frühling
				 sceneambient[2].set(0.7,0.7,0.7)
				 scenediffuse[2].set(1,0.9,0.5)
				 Local l:_light=New _light
				 l.init(world,30,30,-40,0,0,0,10000)						
				 l.color.copy(scenediffuse[2])
				 If game game.sigmadiffuse(0.3)
				EndIf
				If currentscene=3'grasend
				 sceneambient[3].set(0.4,0.4,0.4)
				 scenediffuse[3].set(1,1,0.8)
				 Local l:_light=New _light
				 l.init(world,20,20,-50,0,0,0,10000)						
				 l.color.copy(scenediffuse[currentscene])
				 If game game.sigmadiffuse(0.2)
				EndIf
				If currentscene=4'muehle
				 sceneambient[4].set(0.3,0.4,0.6)
				 scenediffuse[4].set(0.77,1,0.97)
				 Local l:_light=New _light
				 l.init(world,-50,-50,-100,0,0,0,50000)						
				 l.color.copy(scenediffuse[4])
				 If game game.sigmadiffuse(0.3)
				EndIf
				If currentscene=5'berge
				 sceneambient[5].set(0.3,0.3,0.3)
				 scenediffuse[5].set(0.85,1,0.97)
				 Local l:_light=New _light
				 l.init(world,-50,30,-100,0,0,0,50000)						
				 l.color.copy(scenediffuse[5])
				 If game game.sigmadiffuse(0.3)
				EndIf
				If currentscene=6'mond
				 sceneambient[6].set(0.1,0.1,0.1)
				 scenediffuse[6].set(1,1,1)
				 Local l:_light=New _light
				 l.init(world,-40,40,-120,0,0,0,60000)						
				 l.color.copy(scenediffuse[6])
				 If game game.sigmadiffuse(0.3)
				EndIf

				world.lightambient.copy(sceneambient[currentscene])
				If game game.createshadow()
				EndMethod	
			
	Method adjustcamera()				
				If menugame.active()=False 
				 showmenugame()
				EndIf
				If cam.curving=False
 				 If game If cam.position.equal(game.cameraposition[2],nearzero)=False movecamera(game.cameraposition[2])
				Else
				 Local z:_vector3=New _vector3
				 If game
				  z.copy(game.camerapositionmenu[2])
				 Else
				  z.copy(menucameraposition)
				 EndIf
				 If cam.curveposition.o1.equal(z,nearzero) If game movecamera(game.cameraposition[2])
				EndIf
				EndMethod			

'---------------------------------------------------- animation functions -------------------------------------------------------------------------------------------------				
	Method animatestandard:Int(keypress)
				Local q=False
				animategame(keypress)
				If animateapplication() q=True
				animatemusic()
				updatemenumain()
				updatemenugame()
				guisystem.animate()
				guisystem.animatefade()
				Return(q)
				EndMethod
	Method animategame(keypress)
				clock.animate()
				'If menugame.active()=False And menugame.fading()=False
				' If cam.position.equal(menucameraposition,nearzero)=False
				'  movecamera(menucameraposition)
				' EndIf
				'EndIf
				
				cam.animate(clock)
				getmousevector(gra,cam)
				If MouseDown(1) 
				 If pickedpage=Null
				  Local mx#=MouseX()
  			      If mx>512
				   For Local pit:_page=EachIn pagelist
				    If pit.parax>0 
				     pickedpage=pit
				     Exit
				    EndIf
				   Next	
				  Else			
				   For Local pit:_page=EachIn pagelist
				    If pit.parax<0 
				     pickedpage=pit
				    EndIf
				   Next	
				  EndIf
				 EndIf
				Else 
				 pickedpage=Null
				EndIf
				For Local pit:_page=EachIn pagelist
				 pit.animate(clock)
				Next
				For Local cit:_candle=EachIn candlelist
				 cit.animate(clock)
				Next
				For Local qit:_particlesource=EachIn particlesourcegamelist
				 qit.animate()
				Next
				For Local ait:_particle=EachIn particlelistscene
				 ait.animate()
				Next				
				For Local ait:_particle=EachIn particlelistbackground
				 ait.animate()
				Next				
				If game
				 game.animate(clock,keypress)
				 If game.ended And (menugame.active() Or game.cameraposition[2].equal(cam.position,nearzero)) And paused=False
				  If fireworkimage.active=False fireworkimage.activate()
				  fireworkimage.position.set(Rnd(-10,10),Rnd(-10,10),Rnd(-7,-2))
				  fireworkimage.rotationaxis.calculaterandom()
				  'If fireworksheepcards.active=False fireworksheepcards.activate()
				
				   If fireworkrocket.active=False fireworkrocket.activate()
				   fireworkrocket.position.set(Rnd(-10,10),Rnd(-10,10),Rnd(-7,-2))
				   fireworkrocket.generationrate=Rnd(2,5)
				   fireworkrocket.pqdeath.colorcurve.set(1,1,1,1  ,  0.5,0.2,0.1,0,  0,0,0,0, 0,0,0,0)
				   fireworkrocket.pqdeath.vectortolerance=Rnd(0.1,0.9)
			       fireworkrocket.pqlife.rotation=Sin(clock.ms()/10)*90'180+Sin(solitaire.clock.ms()/(50+Cos(solitaire.clock.ms()/20)*45))*360
				   fireworkrocket.pqlife.size=1+Sin(clock.ms()*0.23)*0.7				
				Rem
				   If winmusic=False
				    winmusic=True
				    winmusicbefore=currentmusic
				    Local ni=musiccount-1
				    musicman.channelmenufadeswitch=True
				    musicman.channelmenuswitchto=ni
				    currentmusic=ni
				    musicman.channelmenufadeup=False
				    musicman.channelmenufadedown=False
				   EndIf
				EndRem
				
				 Else
				  If fireworkimage.active fireworkimage.deactivate() 
				  If fireworkcards.active fireworkcards.deactivate() 
				  If fireworkrocket.active fireworkrocket.deactivate() 
				Rem
				  If AppSuspended()=False
				   If winmusic
				    winmusic=False
				    Local ni=winmusicbefore
				    musicman.channelmenufadeswitch=True
				    musicman.channelmenuswitchto=ni
				    currentmusic=ni
				    musicman.channelmenufadeup=False
				    musicman.channelmenufadedown=False
				   EndIf
				  EndIf
				EndRem
				 EndIf
				Else
				 If fireworkimage.active fireworkimage.deactivate()
				 If fireworkcards.active fireworkcards.deactivate() 
				 If fireworkrocket.active fireworkrocket.deactivate() 
				Rem
				 If winmusic And AppSuspended()=False
				  winmusic=False
				  Local ni=winmusicbefore
				  musicman.channelmenufadeswitch=True
				  musicman.channelmenuswitchto=ni
				  currentmusic=ni
				  musicman.channelmenufadeup=False
				  musicman.channelmenufadedown=False
				 EndIf
				EndRem
				EndIf
				EndMethod

	Method animatemusic()
				'If musicman.channelgame.playing() And musicman.channelgamefadedown=False And musicman.channelgamefadeup=False And musicman.channelgamefadeswitch=False
				If musicman.channelmenu.playing() And musicsequence And paused=False
				 If (musicman.clock.ms()-musicman.starttime)>musicman.playtime[currentmusic]
				  Local ni=currentmusic+1
				  If ni>musiccount-2 ni=0
				  musicman.channelmenufadeswitch=True
				  musicman.channelmenuswitchto=ni
				  currentmusic=ni
				  'If game game.music=ni
				  musicman.channelmenufadeup=False
				  musicman.channelmenufadedown=False
				 EndIf
				EndIf	
				musicman.animate(paused)
				EndMethod
			

'---------------------------------------------------- draw functions -------------------------------------------------------------------------------------------------				
	Method drawstandard()				
				world.determinevertexlight()
			    gra.enabletext2d()	
				guisystem.drawbackground(gra,cam)
 				If buttonpanel And buttongamenew.visible
  				 SetBlend(SOLIDBLEND|MASKBLEND)
				 SetColor(255,255,255)
				 SetAlpha(buttongamenew.color.w)
				 DrawImageRect(ilederstreifen,0,0,141,768)
				EndIf	
				SetBlend(SolidBLEND)
				gra.wrap(True)
				drawgame()		
				gra.enabletext2d()		
			    guisystem.draw(gra,cam)
				guisystem.drawcursor(gra,cam)
				drawblendscreen()
				drawpause()
				gra.swap()
				EndMethod
	Method drawgamebackground()
				cam.position.set(0,0,-33)
				cam.view.set(0,0,1.8)
				cam.up.set(0,0.95,0)
				cam.side.set(1.15,0,0)
				world.transform(gra,cam)
				gra.blend(False)
				gra.wrap(True)
				If background background.mesh.draw(gra,cam)
				gra.enabletext2d()
				world.transform(gra,cam)
				EndMethod

		

	Method drawgame()
				 Local o:_vector3=New _vector3
				 Local c:_vector4=New _Vector4
				 Local h$
				gra.wrap(True)
				world.transform(gra,cam)
				gra.blend(False)

				'-------------------------------------------- spiel zeichnen --------------------------------------
				If game 
				 game.drawpile(gra,cam)
				 game.drawlist.sort()
				 drawgameshadowcurving(False)
				 'game.drawnocurving(gra,cam)
				 
				 game.drawpilecard(gra,cam)
				 drawgameshadowcurving(True)
				 game.drawcard(gra,cam)
				 game.drawcurving(gra,cam)
				 ' game.draw(gra,cam)
				Rem 
				 ' ******************** DEBUG *****************	
				 gra.enabletext2d()
				 SetImageFont(font32)
				 Local o:_vector3=New _vector3
				 Local c:_vector4=New _Vector4
				 Local h$
				 h="Picksteta="+game.pickstate
				 o.set(gra.screenw/2-TextWidth(h)/2,gra.screenh/2-TextHeight(h)/2,2)
				 c.set(1,0.3,0.2,1)
				 Drawguitext(h,o,c)
				EndRem
				'------------------------------------------- pile info zeichnen ----------------------------------
				 If mouseoverpile And game.pileinfoopacity>0 And menugame.active()
				  gra.enabletext2d()
				  SetImageFont(fontarial12)
				  Local wd0#=TextWidth(game.pileinfodescription0)
				  Local wd1#=TextWidth(game.pileinfodescription1)
				  Local wm#=wd0
				  Local hm#=25
				  If game.pileinfodescription1<>"" hm=37
				  If wd1>wd0 wm=wd1
				  SetImageFont(fontarial16)
				  Local wpi#=TextWidth(game.pileinfoname)
				  Local bw#=wm+10+10+wpi
				  o.set(gra.screenw-200-10-wm,gra.screenh-hm,0)
				  If game.pileinfodescription0="" And game.pileinfodescription1=""
				   o.x:+10
				   bw:-10
				  EndIf
				  c.set(1,1,1,0.15*game.pileinfoopacity)
				  drawguiboxinvers(o,bw,hm-5,c)
				
				  h=game.pileinfoname
				  o.set(gra.screenw-195,gra.screenh-25,1)
				  c.set(1,0.95,0.8,game.pileinfoopacity)
				  Drawguitext(h,o,c)				
				  SetImageFont(fontarial12)
				  h=game.pileinfodescription0
				  If game.pileinfodescription1="" o.set(gra.screenw-205-wd0,gra.screenh-20,0.5) Else o.set(gra.screenw-205-wd0,gra.screenh-35,0.5)
				  c.set(1,1,0.4,game.pileinfoopacity)
				  Drawguitext(h,o,c)				
				  If game.pileinfodescription1<>""
				   h=game.pileinfodescription1
				   o.set(gra.screenw-205-wd1,gra.screenh-20,0.5)
				   c.set(1,1,0.4,game.pileinfoopacity)
				   Drawguitext(h,o,c)		
				  EndIf		
				 EndIf				
				 '------------------------------------- status bar zeichnen --------------------------------
				 If statusbaropacity>0 And statusbartext<>"" 
				  Local statusbarnewtime#=clock.ms()
				  Local dt#=statusbarnewtime-statusbartime
				  If statusbardelay
				   If dt>statusbardelaytime
				    statusbardelay=False
				    statusbartime=statusbarnewtime
				   EndIf
				  Else
				   statusbartime=statusbarnewtime
				   statusbaropacity:-0.3*(dt*0.001)
				   If statusbaropacity<0 statusbaropacity=0
				  EndIf
				  gra.enabletext2d()
				  SetImageFont(fontarial16)
				  Local wm#=TextWidth(statusbartext)
				  Local bw#=wm+10+10
				  o.set(70+gra.screenw/2-wm/2-10,10,0)
				  If buttonpanel=False And menubuttons=False o.x:-340
				  If o.x<10 o.x=10
				  c.set(1,1,1,0.3*statusbaropacity)
				  drawguiboxinvers(o,bw,25,c)
				  h=statusbartext
				  o.set(70+gra.screenw/2-wm/2,15,1)
				  If buttonpanel=False And menubuttons=False o.x:-340
				  If o.x<10 o.x=10
				  c.set(1,0.95,0.8,statusbaropacity)
				  Drawguitext(h,o,c)				
				 EndIf				
				 '------------------------------------- spiel gewonnen -------------------------------------
				 If game.ended
				  gra.enabletext2d()
				  SetImageFont(font32)
				  h=strgamewon
				  o.set(gra.screenw/2-TextWidth(h)/2,gra.screenh/2-TextHeight(h)/2,2)
				  c.set(1,0.3,0.2,1)
				  Drawguitext(h,o,c)
				 EndIf
				EndIf
				'------------------------------------- effekte zeichnen ------------------------------------
				world.transform(gra,cam)				
				gra.blendadditive()
				For Local ait:_particle=EachIn particlelistscene
				 ait.draw(gra,cam)
				Next
				For Local ait:_particle=EachIn particlelistbackground
				 ait.draw(gra,cam)
				Next
				For Local cat:_candle=EachIn candlelist
				 cat.draw(gra,cam)
				Next
				gra.blend(False)
				EndMethod	
		
			

			

				
	Method startgame()
				For Local cit:_candle=EachIn candlelist
				 If cit.flamme.active cit.flamme.activate()
				Next
				EndMethod	
'******************************************************************************************************************
'										S U P P L Y 
'******************************************************************************************************************
	Method buttoninitmagic(g:_guibutton,f:timagefont=Null,bs:timage=Null,bsh:timage=Null,bl:timage=Null,blh:timage=Null)
				Local v:_vector4=New _vector4
				v.set(1,1,0.5,1)
				g.centrictext=True
				If bs=Null bs=ibuttons
				If bsh=Null bsh=ibuttonshl
				
				If bl=Null  If bs  bl=bs   Else bl=ibuttonl
				If blh=Null If bsh blh=bsh Else blh=ibuttonlhl
				
				
				g.background[0].addlast(bs)
				g.background[0].addlast(bl)
				g.background[1].addlast(bsh)
				g.background[1].addlast(blh)
				g.background[2].addlast(bsh)
				g.background[2].addlast(blh)
				g.shadowimage[0].addlast(ibuttonshadow)
				g.shadowimage[1].addlast(ibuttonshadow)
				g.shadowimage[2].addlast(ibuttonshadow)
				g.textshadow=0
				g.settextcolor(v)
				g.textcolormark.set(0.784,-0.686,0.588,0)
				g.textcoloractive.set(1,1,-1,1)					
				g.shadowimageboardening=5
				v.set(1,1,1,1)
				g.color.copy(v)
				g.colortransformed.copy(v)
				g.shadowopacity=0.7
				If f=Null g.font=font18 Else g.font=f
				'g.dynamicactivityscale=True
				EndMethod
	Method buttoninitmagicleft(g:_guibutton)
				Local v:_vector4=New _vector4
				v.set(0.1,0.2,0.3,1)
				g.centrictext=True
				g.background[0].addlast(ibuttonarrowloff)
				g.background[1].addlast(ibuttonarrowlon)
				g.background[2].addlast(ibuttonarrowlon)
				g.settextcolor(v)
				v.set(1,1,1,1)
				g.color.copy(v)
				g.colortransformed.copy(v)
				g.font=font24
				EndMethod
	Method buttoninitmagicright(g:_guibutton)
				Local v:_vector4=New _vector4
				v.set(0.1,0.2,0.3,1)
				g.centrictext=True
				g.background[0].addlast(ibuttonarrowroff)
				g.background[1].addlast(ibuttonarrowron)
				g.background[2].addlast(ibuttonarrowron)
				g.settextcolor(v)
				v.set(1,1,1,1)
				g.color.copy(v)
				g.colortransformed.copy(v)
				g.font=font24
				EndMethod
	Method comboboxinitmagic(g:_guicombobox)
				Local v:_vector4=New _vector4
				v.set(0.0,0.0,0.0,1)

				g.background[0].addlast(ibutton10969off)
				g.background[1].addlast(ibutton10969on)
				g.background[2].addlast(ibutton10969on)
				
				v.set(1,1,1,1)
				g.color.copy(v)
				g.colortransformed.copy(v)
				listboxinitmagic(g.listbox)		
				g.listbox.frameimage=iguiwindow
				g.listbox.position.setz(g.position.getz()-3)
				g.listbox.setshadow(10,10,0.3)
				buttoninitmagic(g.button)
				g.button.clearbackground()
				g.button.background[0].addlast(ibuttonquadoff)
				g.button.background[1].addlast(ibuttonquadon)
				g.button.background[2].addlast(ibuttonquadon)
								'If f=Null g.font=font18 Else g.font=f
				EndMethod				
	Method checkboxinitmagic(g:_guicheckbox)
				g.background[0].addlast(icheckbox)
				g.background[1].addlast(icheckboxhl)
				g.background[2].addlast(icheckboxhl)
				g.setcheckimage(icheck)
				g.setshadow(5,5,0.3)
				g.checkimagewidth=29
				g.checkimageheight=33
				g.checkposition.set(4,-6,0)
				checkboxlist.addlast(g)
				EndMethod
	Method editboxinitmagic(g:_guieditbox)
				g.background[0].addlast(ibutton15144off)
				g.background[1].addlast(ibutton15144off)
				g.background[2].addlast(ibutton15144off)
				g.background[0].addlast(ibutton15144off)
				g.background[1].addlast(ibutton15144off)
				g.background[2].addlast(ibutton15144off)
				g.setcursorimage(itrackbarslider,25,25)
				g.cursoroffy=-15
				g.font=font18
				g.textcolor.set(0,0,0,1)
				editboxlist.addlast(g)
				EndMethod
	Method trackbarinitmagic(g:_guitrackbar)				
				g.background[0].addlast(itrackbar)
				g.background[1].addlast(itrackbar)
				g.background[2].addlast(itrackbar)
				g.sliderimage=itrackbarslider
				g.sliderimagewidth=22
				g.sliderimageheight=18				
				g.shadow=False
				trackbarlist.addlast(g)
				EndMethod
	Method listboxinitmagic(g:_guilistbox)		
				g.frameimage=ilistboxl
				Local sh:_guiscrollbarvertical=g.scrollbarvertical
				sh.barimage=iscrollbar
				sh.barimagewidth=4
				sh.sliderimage=itrackbarslider
				sh.sliderimagewidth=22
				sh.sliderimageheight=18
				sh.buttonup.background[0].addlast(ibuttonarrowuon)
				sh.buttonup.background[1].addlast(ibuttonarrowuoff)
				sh.buttonup.background[2].addlast(ibuttonarrowuoff)
				sh.buttondown.background[0].addlast(ibuttonarrowdon)
				sh.buttondown.background[1].addlast(ibuttonarrowdoff)
				sh.buttondown.background[2].addlast(ibuttonarrowdoff)
				g.scrollstepwheel=20
				sh.scrollstepbutton=4
				sh.scrollstepbar=(g.height()-16)-20
				Print "listbox init : gh="+g.height()
				sh.scrollbuttonsmooth=True
				sh.barsmooth=False
				g.scrollfriction=0.0				
				g.shadow=False
				listboxlist.addlast(g)
				EndMethod
	Method windowinitmagic(w:_guiwindow,i:timage)
				w.background[0].addlast(i)
				w.background[1].addlast(i)
				w.background[2].addlast(i)
				EndMethod
			
'*****************************************************************************************************************
'										B E N U T Z E R N A M E N D I A L O G
'*****************************************************************************************************************
	Method pruefennamen(e0:_guieditbox)
				Local gx#=gra.screenw/2
				Local gy#=gra.screenh/2
				Local r=False
				If e0.text="<keiner>" 
				 messagebox("Das ist doch kein Name...","stimmt",gx+200,gy+150,font18,iwindow240204)
				 guisystem.button=Null
				Else
				 If e0.text=""
				  messagebox(strinvalidname,strok,gx+200,gy+150,font18,iwindow240204)
				  guisystem.button=Null
				 Else
				  r=True
				 EndIf
				EndIf
				FlushKeys()
				Return(r)
				EndMethod
	Method usernamendialog:String(h:_gamestatsentry,ox#,oy#,showhighscore)
				FlushKeys()
				Local keystop=False
				Local w0:_guiwindow
				Local wx=400,wy=200
				Local ret$=""
				Local px#=ox
				Local py#=oy
				
				px:-wx/2
				py:-wy/2
				
				w0=New _guiwindow
				w0.init(guisystem,px,py,wx,wy,150,150,150)
				windowinitmagic(w0,iwindow240204)
				w0.setshadow(25,25)
				w0.position.setz(-10)
				

				Local t0:_guitext
				t0=New _guitext
				t0.init(w0,20,20,0,strentername,0,0,0,font20)

				Local k0:_guibutton
				k0=New _guibutton
				k0.init(w0,200-50,140,100,40,strok,0)
				buttoninitmagic(k0)
			
				Local e0:_guieditbox
				e0=New _guieditbox
				e0.init(w0,20,20+50,wx-40,40,"",250,200,150)
				editboxinitmagic(e0)
				e0.text=lastuser


				menugame.fadeout()
				w0.visibility(False)
				w0.activity(False)
				w0.opacity(0)
				w0.fadein()
				w0.fadetarget(menuopacity)	
				
				Local ap=game.allowpick
				game.allowpick=False
				'------------------ process name dialog ------------------------------------			
				Repeat
				 guisystem.nullstates()
				 animategame(0)
				 
				 If animateapplication()
				  pruefennamen(e0)
				  ret=e0.text
				 EndIf
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
				 'k0.animate()	
				 'e0.animate()			
				 guisystem.animate()
				 guisystem.animatefade()
				 clearlinklist()
				 drawstandard()
				 If guisystem.button=k0 
				  pruefennamen(e0)
				  ret=e0.text
				 EndIf
				 'If KeyHit(KEY_ESCAPE) keystop=True
				 If KeyHit(KEY_RETURN) 
				  If pruefennamen(e0)
				   keystop=True
				   ret=e0.text
				  EndIf
				 EndIf
				Until guisystem.button Or keystop
				lastuser=ret
				h.user=ret
				guisystem.button=Null
				
				If showhighscore=False
				 w0.fadeout()
				 guisystem.animate()
				 Repeat
				  guisystem.nullstates()
				  animategame(0)
				  
				  animateapplication()				
				  animatemusic()
				  updatemenumain()
				  updatemenugame()
				  'guisystem.animatefade()
				  guisystem.animate()
				  guisystem.animatefade()
				  clearlinklist()
				  drawstandard()
				 Until w0.visible=False
				 w0.clear()
				 clearlinklist()
				Else
				'------------------ temporary statistics windows construction ---------------
				Local bm:_guibutton
				Local bn:_guibutton
				wx=360
				wy=500
				px#=ox
				py#=oy
				px:-wx/2
				py:-wy/2	
				bm=New _guibutton
				bm.init(windowstats,188/2-107-5,354,107,108,strmenu,37)
				buttoninitmagic(bm)
				'bm.clearbackground()
				'bm.background[0].addlast(ibuttonhauptoff)
				'bm.background[1].addlast(ibuttonhaupton)
				'bm.background[2].addlast(ibuttonhaupton)
				bn=New _guibutton
				bn.init(windowstats,188/2+5,354,107,108,stragain,37)
				buttoninitmagic(bn)
				bn.font=font22
				'bn.clearbackground()
				'bn.background[0].addlast(ibuttonquadoff)
				'bn.background[1].addlast(ibuttonquadon)
				'bn.background[2].addlast(ibuttonquadon)
				'-------------------- dialog crossfading --------------------------------
				w0.fadeout()
				windowstats.animate()
				updatemenumainstatistics()
				windowstats.position.clear()
				windowstats.position.setx(gra.screenw/2-188/2)
				windowstats.position.sety(gra.screenh/2-344/2)
				guisystem.animate()
				windowstats.fadein()
				Repeat
				 guisystem.nullstates()
				 animategame(0)
				 
				 animateapplication()				
				 animatemusic()
				 updatemenugame()
				 'guisystem.animatefade()
				 guisystem.animate()
				 guisystem.animatefade()

				 clearlinklist()
				 drawstandard()
				Until w0.visible=False
				w0.clear()
				clearlinklist()
				'------------------ temporary statistics windows process ---------------
				Local ec=0
				Repeat
				 guisystem.nullstates()
				 animategame(0)
				 If animateapplication()
				  ec=1
				 EndIf
				 animatemusic()
				 updatemenugame()
				 'windowstats.animate()
				 'guisystem.animatefade()
				 guisystem.animate()
				 guisystem.animatefade()
				 If guisystem.button If guisystem.button.index=54
				  If abfrage(strclearhighscore,stryes,strno,gra.screenw/2,gra.screenh/2,font14,iwindow240204)
				   gamestats[cur_game].highscorelist.clear()
				   updatemenumain()
				  EndIf
				 EndIf
				 If guisystem.button If guisystem.button.index=55
				  If abfrage(strclearstatistics,stryes,strno,gra.screenw/2,gra.screenh/2,font14,iwindow240204)
				   gamestats[cur_game].entrylist.clear()
				   updatemenumain()
				  EndIf
				 EndIf
				 clearlinklist()
				 drawstandard()
				 If guisystem.button=bm ec=1
				 If guisystem.button=bn ec=2
				 If KeyHit(KEY_ESCAPE) ec=1
				 If KeyHit(KEY_RETURN) ec=2
				Until ec>0
				'------------------ temporary statistics windows fadeout ---------------
				windowstats.fadeout()
				Repeat
				 guisystem.nullstates()
				 animategame(0)
				 animateapplication()				
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
				 guisystem.animate()
				 guisystem.animatefade()
				 clearlinklist()
				 drawstandard()
				Until windowstats.visible=False
				bm.clear()
				bn.clear()
				clearlinklist()
				game.allowpick=ap
				windowstats.position.clear()
				windowstats.position.setx(5)
				windowstats.position.sety(-5-344)
				windowstats.position.add(0,1,0,True)
				If ec=1'go to the main menu
				 showmenumain()
				 initgame(2,False)
				ElseIf ec=2'new game maken
				 showmenugame()
				 initgame(2,False)
				EndIf
				EndIf
				FlushKeys()
				Return(ret)
				EndMethod

	Method showmenumain()
				menuman.show(menumain)
				movecameratomenu()
				If game 
				 game.allowpick=True
				 gamedelaytime=clock.ms()
				EndIf
				demoplay=False
				EndMethod				
	Method showmenugame()
				Local bh#=buttonheight
				Local off#=10	
				menuman.show(menugame)
				'Print "showgmae"
				Local bl
				If fileexists("game"+gamenamesstore[game.index]+".sol")=False 
				 buttongameload.fadeout() 
				 bl=False
				Else 
				 buttongameload.fadein() 
				 bl=True
				EndIf
				If gameplaybuttons
				 buttontipp.fadein()
				 buttonundo.fadein()
				 buttonredo.fadein()
				' buttongamenew.position.sety(-6*(off+bh))
				Else
				 buttontipp.fadeout()
				 buttonundo.fadeout()
				 buttonredo.fadeout()
				' buttongamenew.position.sety(-3*(off+bh))
				EndIf
				If menubuttons
				 buttongamemainmenu.fadein()
				 buttongameoptions.fadein()
				Else
				 buttongamemainmenu.fadeout()
				 buttongameoptions.fadeout()
				EndIf
				EndMethod
	Method showmenuoptions(menu:_menu,fromgame,subfadeout)
				menuman.show(menu)
				optionscalledfromgame=fromgame
				If game game.allowpick=False
				If subfadeout
				 For Local git:_gui=EachIn menu.guilist
				  If git.index=7 Or git.index=8 Or git.index=9 Or git.index=10 Or git.index=12 git.fadeout()
				 Next
				EndIf
				menuoptionslast=menu
				Local b:_guibutton=Null
				If menu=menuoptionsacoustics b=buttonoptionsacousticsmainmenu
				If menu=menuoptionsgraphics b=buttonoptionsgraphicsmainmenu
				If menu=menuoptionsgame b=buttonoptionsgamemainmenu
				If menu=menuoptionscard b=buttonoptionscardmainmenu
				If menu=menuoptionscredits b=buttonoptionscreditsmainmenu
				
				If fromgame And b
				 b.text=strback
				 'b.clearbackground()
				 'b.background[0].addlast(ibuttonquadoff)
				 'b.background[1].addlast(ibuttonquadon)
				 'b.background[2].addlast(ibuttonquadon)
				Else
				 b.text=strmenu
				 'b.clearbackground()
				 'b.background[0].addlast(ibuttonhauptoff)
				 'b.background[1].addlast(ibuttonhaupton)
				 'b.background[2].addlast(ibuttonhaupton)
				EndIf
				EndMethod						
	Method movecameratomenu()
				Local z:_vector3=New _vector3
				If game
				 z.copy(game.camerapositionmenu[2])
				Else
				 z.copy(menucameraposition)
				EndIf
				movecamera(z)
				EndMethod
	Method movecamera(o:_vector3)
				Local n:_vector3=New _vector3
				cam.curveview.setvector(cam.view,cam.view,n,n)
				cam.curveside.setvector(cam.side,cam.side,n,n)
				cam.curveup.setvector(cam.up,cam.up,n,n)
				cam.curveposition.setvector(cam.position,o,n,n)
				cam.startcurve(clock,10)
				EndMethod						
				
				
				


							
'******************************************************************************************************************
'										M A I N  M E N U 
'******************************************************************************************************************
	Method createmenumain()
				menumain=menuman.createmenu()

				Local kit:_guibutton
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=850
				Local off#=100
				Local wii:_guiwindow				
				Local tit:_guitext

				tmmcurgame=New _guitext
				tmmcurgame.init(guisystem,0,0,2,"hu",1,0.95,0.6)
				tmmcurgame.position.set(0,180,2)
				tmmcurgame.position.add(0.5,0,0,True)
				tmmcurgame.font=font32
				menumain.add(tmmcurgame)
				
				tmmtime=New _guitext
				tmmtime.init(guisystem,0,0,2,"hu",1,0.95,0.6)
				tmmtime.position.set(0,220,2)
				tmmtime.position.add(0.5,0,0,True)
				tmmtime.font=font18
				menumain.add(tmmtime)
				
				windowstats=New _guiwindow
				windowstats.init(guisystem,5,gra.screenh-5-344,188,344,1,1,1)
				windowstats.position.set(5,-5-344,0)
				windowstats.position.add(0,1,0,True)
				windowinitmagic(windowstats,ifondstats)
				menumain.add(windowstats)
				
				y=10 
				windowstatstype=New _guitext
				windowstatstype.init(windowstats,25,y,0,gamenames[cur_game],0,0,0)
				windowstatstype.font=font18
				y:+28
				For Local i=0 To 4 
				 windowstatshigh[i]=New _guitext
				 windowstatshigh[i].init(windowstats,25,y,0,"hu",0,0,0)
				 windowstatshigh[i].font=font14
				 y:+20
				Next
				y:+10
				kit=New _guibutton
				kit.init(windowstats,20,y,151,44,"Highscore löschen",54)
				buttoninitmagic(kit)
				kit.font=font18
				'kit.clearbackground()
				'kit.background[0].addlast(ibutton15144off)
				'kit.background[1].addlast(ibutton15144on)
				'kit.background[2].addlast(ibutton15144on)				
				
				y:+60
				Local yy#=y
				tit=New _guitext
				tit.init(windowstats,25,y,0,"Anzahl",0,0,0)
				tit.font=font14
				y:+20
				
				tit=New _guitext
				tit.init(windowstats,25,y,0,"Gewinnquote",0,0,0)
				tit.font=font14
				y:+20
				
				tit=New _guitext
				tit.init(windowstats,25,y,0,"Zeit",0,0,0)
				tit.font=font14
				y:+20
				
			    tit=New _guitext
				tit.init(windowstats,25,y,0,"Spielzüge",0,0,0)
				tit.font=font14
				y:+20
			
				kit=New _guibutton
				kit.init(windowstats,20,y,151,44,"Statistik löschen",55)
				buttoninitmagic(kit)
				kit.font=font18
				'kit.clearbackground()
				'kit.background[0].addlast(ibutton15144off)
				'kit.background[1].addlast(ibutton15144on)
				'kit.background[2].addlast(ibutton15144on)				
			
				x=0
				y=yy
				windowstatscount=New _guitext
				windowstatscount.init(windowstats,x,y,0,"0",0,0,0)
				windowstatscount.font=font14
				y:+20
				windowstatsquote=New _guitext
				windowstatsquote.init(windowstats,x,y,0,"0%",0,0,0)
				windowstatsquote.font=font14
				y:+20
				windowstatstime=New _guitext
				windowstatstime.init(windowstats,x,y,0,"00:00",0,0,0)
				windowstatstime.font=font14
				y:+20
			    windowstatsmoves=New _guitext
				windowstatsmoves.init(windowstats,x,y,0,"0",0,0,0)
				windowstatsmoves.font=font14

				y=100
				buttonstart=New _guibutton
				buttonstart.init(guisystem,0,0,116,88,"Start",0)
				buttonstart.position.set(0.5,0,0,True)
				buttonstart.position.add(-116/2,30,0)
				buttoninitmagic(buttonstart)
				'buttonstart.background[0].addlast(ibuttonstartoff)
				'buttonstart.background[1].addlast(ibuttonstarton)
				'buttonstart.background[2].addlast(ibuttonstarton)
				menumain.add(buttonstart)
				
				y=100
				x=gra.screenw-192-20
  				windowsheepgametype=createsheepwindow(menumain,0,0,strgametype,2,0,0,False)
				windowsheepgametype.position.set(1,0,0,True)
				windowsheepgametype.position.add(-192-20,y,0)
				y:+bh+80
  				windowsheepcard=createsheepwindow(menumain,x,y,strcards,56,57,58,False)
				windowsheepcard.position.set(1,0,0,True)
				windowsheepcard.position.add(-192-20,y,0)
				y:+bh+80
  				windowsheepscene=createsheepwindow(menumain,x,y,strscene,6,48,49)
				windowsheepscene.position.set(1,0,0,True)
				windowsheepscene.position.add(-192-20,y,0)
				y:+bh+80
  				windowsheepmusic=createsheepwindow(menumain,x,y,strmusic,50,51,52)
				windowsheepmusic.position.set(1,0,0,True)
				windowsheepmusic.position.add(-192-20,y,0)
				
				updatesheepwindowtype()
				updatesheepwindowcardfront()
				updatesheepwindowscene()
				updatesheepwindowmusic()
				
				y=80
				x=20
				kit=New _guibutton
				kit.init(guisystem,x,y,106,72,strclose,5)
				buttoninitmagic(kit)
				'kit.clearbackground()
				'kit.background[0].addlast(ibutton10969off)
				'kit.background[1].addlast(ibutton10969on)
				'kit.background[2].addlast(ibutton10969on)				
				kit.font=font22
				y:+72+20
				menumain.add(kit)
				
				kit=New _guibutton
				kit.init(guisystem,x,y,106,72,stroptions,4)
				buttoninitmagic(kit)
				'kit.clearbackground()
				'kit.background[0].addlast(ibutton10969off)
				'kit.background[1].addlast(ibutton10969on)
				'kit.background[2].addlast(ibutton10969on)	
				kit.font=font22
				menumain.add(kit)
				
				menumain.visibility(False)
				menumain.activity(False)
				menumain.opacity(0)
				menumain.fadein()
				menumain.fadetarget(menuopacity)
				EndMethod
	Method updatemenumain()
				'update type&time display
				SetImageFont(font32)
				tmmcurgame.position.setx(-TextWidth(gamenames[cur_game])/2)
				tmmcurgame.set(gamenames[cur_game])
				SetImageFont(font18)
				Local h$
				If game
				 If game.inuse
				  h=timemstohhmmss(game.time)
				 Else
				  h=strnotbegun
				 EndIf
				EndIf
				'If timeduringgame
				 tmmtime.position.setx(-TextWidth(h)/2)
				 tmmtime.set(h)
				'Else
				'EndIf
				updatemenumainstatistics()
				'For Local tit:_guitrackbar=EachIn trackbarlist
				' If odiad()
				'  tit.sliderimage=ibutterfly[tit.sliderimageindex]
				' Else
				'  If night()
				'   tit.sliderimage=istern
				'  Else
				'   tit.sliderimage=ibee[1-summer(),tit.sliderimageindex]
				'  EndIf
				' EndIf
				'Next
				For Local tit:_guitrackbar=EachIn trackbarlist
				 tit.sliderimage=itrackbarslider
				Next
				'For Local cit:_guicheckbox=EachIn checkboxlist
				' If odiad()
				'  cit.checkimage=icocci[0]
				' Else
				'  If night()
				'   cit.checkimage=istern
				'  Else
				'   cit.checkimage=ischnecke
				'  EndIf
				' EndIf
				'Next
				For Local cit:_guicheckbox=EachIn checkboxlist
				 cit.checkimage=icheck
				Next
				'For Local lit:_guilistbox=EachIn listboxlist
				' If odiad()
				'  lit.scrollbarvertical.sliderimage=ibutterfly[0]
				' Else
				'  If night()
				'   lit.scrollbarvertical.sliderimage=istern
				'  Else
				'   lit.scrollbarvertical.sliderimage=ibee[1-summer(),0]
				'  EndIf
				' EndIf
				'Next
				For Local lit:_guilistbox=EachIn listboxlist
				 lit.scrollbarvertical.sliderimage=itrackbarslider
				Next				
				'For Local eit:_guieditbox=EachIn editboxlist
				' If odiad()
				'  eit.setcursorimage(ibutterfly[0],25,25)
				' Else
				'  If night()
				'   eit.setcursorimage(istern,25,25)
				'  Else
				'   eit.setcursorimage(ibee[1-summer(),0],25,25)
				'  EndIf
				' EndIf
				'Next
				For Local eit:_guieditbox=EachIn editboxlist
				 eit.setcursorimage(itrackbarslider,25,25)
				Next
				
				EndMethod
	Method updatemenumainstatistics()				
				'update statistics
				Local it:TLink=gamestats[cur_game].highscorelist.firstlink()
				For Local i=0 To 4 
				 If it
				  Local e:_gamestatsentry=_gamestatsentry(it.value())
				  windowstatshigh[i].set(e.user+" : "+Int(e.score())+" "+strpoints+","+timemstohhmmss(e.time))
				  it=it.nextlink()
				 Else
				  Local h$=(i+1)+strranknotset
				  windowstatshigh[i].set(h)
				 EndIf
				Next
				
				SetImageFont(windowstatstype.font)
				Local x#
				Local h$
				Local c=gamestats[cur_game].entrylist.count()
				
				h=gamenames[cur_game]
				windowstatstype.position.setx(windowstats.width()/2-TextWidth(h)/2)
				windowstatstype.set(h)
				SetImageFont(font10)

				h=c
				windowstatscount.position.setx(168-TextWidth(h))
				windowstatscount.set(h)
				
				If c>0 h=Int(gamestats[cur_game].quote()*100)+"%" Else h="-"
				windowstatsquote.position.setx(168-TextWidth(h))'.x=(windowstats.position.x+168)-TextWidth(h)
				windowstatsquote.set(h)
				
				If c>0 h=timemstohhmmss(gamestats[cur_game].timeaverage()) Else h="-"
				windowstatstime.position.setx(168-TextWidth(h))'.x=(windowstats.position.x+168)-TextWidth(h)
				windowstatstime.set(h)

				If c>0 h=Int(gamestats[cur_game].moveaverage()) Else h="-"
				windowstatsmoves.position.setx(168-TextWidth(h))'.x=(windowstats.position.x+168)-TextWidth(h)
				windowstatsmoves.set(h)
				
				
				EndMethod	
	Method createsheepwindow:_guiwindow(m:_menu,x#,y#,name$,im,il,ir,arrows=True)
				Local kit:_guibutton
				Local wii:_guiwindow
				wii=New _guiwindow
				wii.init(guisystem,x,y,192,64,1,1,1)
				windowinitmagic(wii,ifondred)
				wii.setshadow(10,10)
				m.add(wii)
				kit=New _guibutton
				kit.init(wii,40,3,192-80,30,name,im)
				buttoninitmagic(kit)
				'kit.clearbackground()
				'kit.background[0].addlast(ibuttonunvis)
				'kit.background[1].addlast(ibuttonunvis)
				'kit.background[2].addlast(ibuttonunvis)
				kit.font=font20					
				'menumain.add(kit)
				If arrows
			     Local bw#=32
			     Local bh#=24
				 kit=New _guibutton
				 kit.init(wii,15+15-bw/2,15-bh/2,bw,bh,"",il)
				 buttoninitmagicleft(kit)
				 kit=New _guibutton
				 kit.init(wii,177-30+15-bw/2,15-bh/2,bw,bh,"",ir)
				 buttoninitmagicright(kit)
				EndIf
				
				Local gt:_guitext=New _guitext
				gt.init(wii,0,40,0,"hu",0,0,0,font20)
				Return(wii)
				EndMethod
	Method updatesheepwindowtype()
				Local h$=gamenames[cur_game]
				Local t:_guitext
				For Local git:_guitext=EachIn windowsheepgametype.childlist
				 t=git
				Next
				SetImageFont(t.font)
				t.position.setx(windowsheepgametype.width()/2-TextWidth(h)/2)
				t.set(h)
				guisystem.animate()
				EndMethod
	Method updatesheepwindowcardfront()
				Local h$=strcardfrontnames[cardtexturefrontindex]
				Local t:_guitext
				For Local git:_guitext=EachIn windowsheepcard.childlist
				 t=git
				Next
				SetImageFont(t.font)
				t.position.setx(windowsheepcard.width()/2-TextWidth(h)/2)
				t.set(h)
				guisystem.animate()
				EndMethod				
	Method updatesheepwindowscene()
				Local h$=strscenenames[currentscene]
				Local t:_guitext
				For Local git:_guitext=EachIn windowsheepscene.childlist
				 t=git
				Next
				SetImageFont(t.font)
				t.position.setx(windowsheepscene.width()/2-TextWidth(h)/2)
				t.set(h)
				guisystem.animate()
				EndMethod				
	Method updatesheepwindowmusic()
				Local h$=strmusicnames[currentmusic]
				Local t:_guitext
				For Local git:_guitext=EachIn windowsheepmusic.childlist
				 t=git
				Next
				SetImageFont(t.font)
				t.position.setx(windowsheepmusic.width()/2-TextWidth(h)/2)
				t.set(h)
				guisystem.animate()
				EndMethod				
'******************************************************************************************************************
'										S C E N E  M E N U 
'******************************************************************************************************************				
	Method createmenuscene()
				Local tr#=0.99,tg#=0.7,tb#=0.27
				Local lx#=250
				Local ly#=100
				Local wx#=550
				Local wy#=600
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=650
				Local off#=20				
				
				Local cw#=128*0.7
				Local ch#=200*0.7
				Local mt:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cbt:_guicheckbox
	
				menuscene=menuman.createmenu()
				windowscene=New _guiwindow
				windowscene.init(guisystem,-wx/2,-wy/2,wx,wy,255,255,255)
				windowscene.position.add(0.5,0.5,0,True)
				windowscene.setshadow(10,10)
				
				windowinitmagic(windowscene,iguiwindow)
				menuscene.add(windowscene)
				
				'createmenuoptionsbutton(windowoptionscard,menuscene,3)
				
				buttonscenemainmenu=New _guibutton
				buttonscenemainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,strmenu,11)
				buttonscenemainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonscenemainmenu)
				'buttonscenemainmenu.clearbackground()
				'buttonscenemainmenu.background[0].addlast(ibuttonhauptoff)
				'buttonscenemainmenu.background[1].addlast(ibuttonhaupton)
				'buttonscenemainmenu.background[2].addlast(ibuttonhaupton)
				menuscene.add(buttonscenemainmenu)				
				SetImageFont(font32)
				Local hh$="Szene"
				ttitlescene=New _guitext
				ttitlescene.init(windowscene,(wx/2)-TextWidth(hh)/2,20,0,hh,0,0,0,font32)
				lbscene=New _guilistbox
				lbscene.borderwidth=8
				lbscene.init(windowscene,20,60,510,500,1,1,1,33)
				listboxinitmagic(lbscene)
				For Local i=0 To scenecount-1
				 Local x=20
				 Local y=20+i*270 
				 Local gim:_guiimage=lbscene.insertimage(imenubackground[i],x,y,300,256,0.8,0.8,0.8,700+i)
				 gim.blendmasked=False
				Next
				For Local i=0 To scenecount-1
				 cbt=New _guicheckbox
				 Local yy#=20+i*270
				 Local xx#=40
				 cbt.init(lbscene,xx,yy+20,19,19,700+i)
				 cbt.position.add(0,0,-1,False)
				 checkboxinitmagic(cbt)
				 cslist.addlast(cbt)
				Next				
				updatemenuscenecheckbox(cslist)
				menuscene.visibility(False)
				menuscene.activity(False)
				menuscene.fadetarget(0.9)
				menuscene.opacity(0)
				EndMethod				
	Method updatemenuscenecheckbox(l:TList)
				For Local cit:_guicheckbox=EachIn l
				 If currentscene=(cit.index-700) cit.checked=True Else cit.checked=False
				Next
				'If game game.updatetexture()
				EndMethod						
'******************************************************************************************************************
'										O P T I O N S  M E N U 
'******************************************************************************************************************
	Method createmenuoptionsacoustics()
				Local tr#=0.99,tg#=0.7,tb#=0.27
				Local lx#=250
				Local ly#=100
				Local wx#=450
				Local wy#=600
				
				menuoptionsacoustics=menuman.createmenu()
				windowoptionsacoustics=New _guiwindow
				windowoptionsacoustics.init(guisystem,-wx/2,-wy/2,wx,wy,255,255,255)
				windowoptionsacoustics.position.add(0.5,0.5,0,True)
				windowoptionsacoustics.setshadow(10,10)
				windowinitmagic(windowoptionsacoustics,iguiwindow)
				menuoptionsacoustics.add(windowoptionsacoustics)
				
				buttonoptionsacousticsmainmenu=New _guibutton
				buttonoptionsacousticsmainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,strmenu,11)
				buttonoptionsacousticsmainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonoptionsacousticsmainmenu)
				'buttonoptionsacousticsmainmenu.clearbackground()
				'buttonoptionsacousticsmainmenu.background[0].addlast(ibuttonhauptoff)
				'buttonoptionsacousticsmainmenu.background[1].addlast(ibuttonhaupton)
				'buttonoptionsacousticsmainmenu.background[2].addlast(ibuttonhaupton)
				menuoptionsacoustics.add(buttonoptionsacousticsmainmenu)	
				
				createmenuoptionsbutton(windowoptionsacoustics,menuoptionsacoustics,0)
				SetImageFont(font32)
				Local hh$=strgeneral
				ttitleacoustics=New _guitext
				ttitleacoustics.init(windowoptionsacoustics,(wx/2)-TextWidth(hh)/2,40,2,hh,1,0.9,0.5,font32)
				
				Local y#=150
				Local off#=40
				'tva=New _guitext
				'tva.init(windowoptionsacoustics,50,y,2,ambient,tr,tg,tb,font18)
				'tbva=New _guitrackbar
				'tbva.init(windowoptionsacoustics,250,y,150,25,1,1,1,volumeambience,0,1,12);y:+off
				'trackbarinitmagic(tbva)
				
				tvs=New _guitext
				tvs.init(windowoptionsacoustics,50,y,2,strsounds,tr,tg,tb,font18)
				tbvs=New _guitrackbar
				tbvs.init(windowoptionsacoustics,250,y,150,25,1,1,1,volumesound,0,1,13);y:+off
				tbvs.displaymultiplier=100
				tbvs.displayaddition=" %"
				tbvs.displayrounding=True				
				trackbarinitmagic(tbvs)
				
				tvm=New _guitext
				tvm.init(windowoptionsacoustics,50,y,2,strmusic,tr,tg,tb,font18)
				tbvm=New _guitrackbar
				tbvm.init(windowoptionsacoustics,250,y,150,25,1,1,1,volumemusic,0,1,14);y:+off
				tbvm.displaymultiplier=100
				tbvm.displayaddition=" %"
				tbvm.displayrounding=True				
				trackbarinitmagic(tbvm)
				
				tfs=New _guitext
				tfs.init(windowoptionsacoustics,50,y,2,strmusicsequence,tr,tg,tb,font18)
				cbms=New _guicheckbox
				cbms.init(windowoptionsacoustics,250,y,19,19,16);y:+off
				checkboxinitmagic(cbms)
				cbms.checked=musicsequence
				
				'tsp=New _guitext
				'tsp.init(windowoptionsacoustics,50,y,2,systemperformance_str,tr,tg,tb,font18)
				'tbsp=New _guitrackbar
				'tbsp.init(windowoptionsacoustics,250,y,150,25,1,1,1,systemperformance,0,1,15);y:+off
				'trackbarinitmagic(tbsp)
				
				tfs=New _guitext
				tfs.init(windowoptionsacoustics,50,y,2,strfullscreen,tr,tg,tb,font18)
				cbfs=New _guicheckbox
				cbfs.init(windowoptionsacoustics,250,y,19,19,16);y:+off
				checkboxinitmagic(cbfs)
				cbfs.checked=fullscreen
				
				menuoptionsacoustics.visibility(False)
				menuoptionsacoustics.activity(False)
				menuoptionsacoustics.fadetarget(menuopacity2)
				menuoptionsacoustics.opacity(0)
				EndMethod			
	Method createmenuoptionsgraphics()
				Local tr#=0.99,tg#=0.7,tb#=0.27
				Local lx#=250
				Local ly#=100
				Local wx#=450
				Local wy#=600
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=650
				Local off#=20				
				
				menuoptionsgraphics=menuman.createmenu()
				windowoptionsgraphics=New _guiwindow
				windowoptionsgraphics.init(guisystem,-wx/2,-wy/2,wx,wy,255,255,255)
				windowoptionsgraphics.position.add(0.5,0.5,0,True)
				windowoptionsgraphics.setshadow(10,10)
				windowinitmagic(windowoptionsgraphics,iguiwindow)
				menuoptionsgraphics.add(windowoptionsgraphics)
				
				buttonoptionsgraphicsmainmenu=New _guibutton
				buttonoptionsgraphicsmainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,"",11)
				buttonoptionsgraphicsmainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonoptionsgraphicsmainmenu)
				'buttonoptionsgraphicsmainmenu.clearbackground()
				'buttonoptionsgraphicsmainmenu.background[0].addlast(ibuttonhauptoff)
				'buttonoptionsgraphicsmainmenu.background[1].addlast(ibuttonhaupton)
				'buttonoptionsgraphicsmainmenu.background[2].addlast(ibuttonhaupton)
				menuoptionsgraphics.add(buttonoptionsgraphicsmainmenu)	
				
				createmenuoptionsbutton(windowoptionsgraphics,menuoptionsgraphics,1)
						
				SetImageFont(font32)
				Local hh$=strgraphics
				ttitlegraphics=New _guitext
				ttitlegraphics.init(windowoptionsgraphics,(wx/2)-TextWidth(hh)/2,40,2,hh,1,0.9,0.5,font32)
				off=38
				y=100
				
				tgrtd=New _guitext
				tgrtd.init(windowoptionsgraphics,50,y,2,strtimeduringgame,tr,tg,tb,font18)
				cbgrtd=New _guicheckbox
				cbgrtd.init(windowoptionsgraphics,250,y,19,19,23);y:+off
				checkboxinitmagic(cbgrtd)
				cbgrtd.checked=timeduringgame
				
				tgrlp=New _guitext
				tgrlp.init(windowoptionsgraphics,50,y,2,"Panel links",tr,tg,tb,font18)
				Local hhs$="Schaltet die Sichtbarkeit des linken Panels im Spiel. Die Knöpfe bleiben sichtbar."
				tgrlp.createhelp(hhs,font14,0.2,0,0)
				cbgrlp=New _guicheckbox
				cbgrlp.init(windowoptionsgraphics,250,y,19,19,24);y:+off
				cbgrlp.createhelp(hhs,font14,1,0,0)
				checkboxinitmagic(cbgrlp)
				cbgrlp.checked=buttonpanel
				
				tgrgp=New _guitext
				tgrgp.init(windowoptionsgraphics,50,y,2,strgamebuttons,tr,tg,tb,font18)
				tgrgp.createhelp(strgamebuttonshelp,font14,0.2,0,0)
				cbgrgp=New _guicheckbox
				cbgrgp.init(windowoptionsgraphics,250,y,19,19,24);y:+off
				cbgrgp.createhelp(strgamebuttonshelp,font14,1,0,0)
				checkboxinitmagic(cbgrgp)
				cbgrgp.checked=gameplaybuttons
				
				tgrmb=New _guitext
				tgrmb.init(windowoptionsgraphics,50,y,2,strmenubuttons,tr,tg,tb,font18)
				tgrmb.createhelp(strmenubuttonshelp,font14,0.2,0,0)
				cbgrmb=New _guicheckbox
				cbgrmb.init(windowoptionsgraphics,250,y,19,19,25);y:+off
				cbgrmb.createhelp(strmenubuttonshelp,font14,1,0,0)
				checkboxinitmagic(cbgrmb)
				cbgrmb.checked=menubuttons

				tgrgo=New _guitext
				tgrgo.init(windowoptionsgraphics,50,y,2,"Spielmenü Opazität",tr,tg,tb,font18)
				Local hhhs$="Stellt die Opazität für das Spielmenü für freiere Sicht auf den Hintergrund."
				tgrgo.createhelp(hhhs,font14,0.2,0,0)
				tbgrgo=New _guitrackbar				
				tbgrgo.init(windowoptionsgraphics,250,y,150,25,1,1,1,1,0.4,1,12);y:+off
				tbgrgo.createhelp(hhhs,font14,1,0,0)
				trackbarinitmagic(tbgrgo)
				tbgrgo.set(menugameopacity)

				tgrca=New _guitext
				tgrca.init(windowoptionsgraphics,50,y,2,strcardanimation,tr,tg,tb,font18)
				cbgrca=New _guicheckbox
				cbgrca.init(windowoptionsgraphics,250,y,19,19,26);y:+off
				checkboxinitmagic(cbgrca)
				cbgrca.checked=cardanimation
				
				'tgrsm=New _guitext
				'tgrsm.init(windowoptionsgraphics,50,y,2,spark_str,tr,tg,tb,font18)
				'cbgrsm=New _guicheckbox
				'cbgrsm.init(windowoptionsgraphics,250,y,50,30,27);y:+off
				'checkboxinitmagic(cbgrsm)
				'cbgrsm.checked=sparkingmouse
				
				tgrmo=New _guitext
				tgrmo.init(windowoptionsgraphics,50,y,2,strmouseovercard,tr,tg,tb,font18)
				tgrmo.createhelp(strmouseovercardhelp,font14,0.2,0,0)
				cbgrmo=New _guicheckbox
				cbgrmo.init(windowoptionsgraphics,250,y,19,19,28);y:+off
				cbgrmo.createhelp(strmouseovercardhelp,font14,1,0,0)
				checkboxinitmagic(cbgrmo)
				cbgrmo.checked=mouseovercard

				tgrmp=New _guitext
				tgrmp.init(windowoptionsgraphics,50,y,2,strmouseoverpile,tr,tg,tb,font18)
				cbgrmp=New _guicheckbox
				cbgrmp.init(windowoptionsgraphics,250,y,19,19,28);y:+off
				checkboxinitmagic(cbgrmp)
				cbgrmp.checked=mouseoverpile

				Rem
				tgrcs=New _guitext
				tgrcs.init(windowoptionsgraphics,50,y,2,cardslope_str,tr,tg,tb,font18)
				tbgrcs=New _guitrackbar
				tbgrcs.init(windowoptionsgraphics,250,y,150,25,1,1,1,1,0,4,30);y:+off
				trackbarinitmagic(tbgrcs)
				tbgrcs.set(cardslope)
				
				tgrct=New _guitext
				tgrct.init(windowoptionsgraphics,50,y,2,cardthickness_str,tr,tg,tb,font18)
				tbgrct=New _guitrackbar
				tbgrct.init(windowoptionsgraphics,250,y,150,25,1,1,1,0.0269,0.005,0.3,31);y:+off
				trackbarinitmagic(tbgrct)
				tbgrct.set(cardthickness)
				tbgrct.displaymultiplier=10000
				
				tgrcl=New _guitext
				tgrcl.init(windowoptionsgraphics,50,y,2,cardlift_str,tr,tg,tb,font18)
				tbgrcl=New _guitrackbar		
				tbgrcl.init(windowoptionsgraphics,250,y,150,25,1,1,1,0.5,0.05,3,32);y:+off
				trackbarinitmagic(tbgrcl)
				tbgrcl.set(cardtableaulift)
				EndRem

				tgrnp=New _guitext
				tgrnp.init(windowoptionsgraphics,50,y,2,strnaturalpiles,tr,tg,tb,font18)
				tgrnp.createhelp(strnaturalpileshelp,font14,0.2,0,0)
				tbgrnp=New _guitrackbar
				tbgrnp.init(windowoptionsgraphics,250,y,150,25,1,1,1,0,0,1,29);y:+off
				tbgrnp.createhelp(strnaturalpileshelp,font14,1,0,0)
				trackbarinitmagic(tbgrnp)
				tbgrnp.set(naturalpiles)

				tgrcw=New _guitext
				tgrcw.init(windowoptionsgraphics,50,y,2,"Kartenbreite",tr,tg,tb,font18)
				tbgrcw=New _guitrackbar				
				tbgrcw.init(windowoptionsgraphics,250,y,150,25,1,1,1,3,2,3.15,12);y:+off
				trackbarinitmagic(tbgrcw)
				tbgrcw.set(cardwidth)
				tbgrcw.displaymultiplier=2
				
				tgrch=New _guitext
				tgrch.init(windowoptionsgraphics,50,y,2,"Kartenhöhe",tr,tg,tb,font18)
				tbgrch=New _guitrackbar				
				tbgrch.init(windowoptionsgraphics,250,y,150,25,1,1,1,6,3,6.1,12);y:+off
				trackbarinitmagic(tbgrch)
				tbgrch.set(cardheight)
				tbgrch.displaymultiplier=2
				
				menuoptionsgraphics.visibility(False)
				menuoptionsgraphics.activity(False)
				menuoptionsgraphics.fadetarget(menuopacity2)
				menuoptionsgraphics.opacity(0)
				EndMethod
	Method createmenuoptionsgame()
				Local tr#=0.99,tg#=0.7,tb#=0.27
				Local lx#=250
				Local ly#=100
				Local wx#=450
				Local wy#=600
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=650
				Local xg#
				Local off#=20				
	
				menuoptionsgame=menuman.createmenu()
				windowoptionsgame=New _guiwindow
				windowoptionsgame.init(guisystem,-wx/2,-wy/2,wx,wy,255,255,255)
				windowoptionsgame.position.add(0.5,0.5,0,True)
				windowoptionsgame.setshadow(10,10)
				windowinitmagic(windowoptionsgame,iguiwindow)
				menuoptionsgame.add(windowoptionsgame)
				
				buttonoptionsgamemainmenu=New _guibutton
				buttonoptionsgamemainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,"",11)
				buttonoptionsgamemainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonoptionsgamemainmenu)
				'buttonoptionsgamemainmenu.clearbackground()
				'buttonoptionsgamemainmenu.background[0].addlast(ibuttonhauptoff)
				'buttonoptionsgamemainmenu.background[1].addlast(ibuttonhaupton)
				'buttonoptionsgamemainmenu.background[2].addlast(ibuttonhaupton)
				menuoptionsgame.add(buttonoptionsgamemainmenu)	
				
				createmenuoptionsbutton(windowoptionsgame,menuoptionsgame,2)
				SetImageFont(font32)
				Local hh$=strgame
				ttitlegame=New _guitext
				ttitlegame.init(windowoptionsgame,(wx/2)-TextWidth(hh)/2,40,2,hh,1,0.9,0.5,font32)
				y=110
				off=35
				x=40
				xg=320
				
				tgpc=New _guitext				
				tgpc.init(windowoptionsgame,x,y,2,strtouchpad,tr,tg,tb,font18)
				tgpc.createhelp(strtouchpadhelp,font14,0.2,0,0)
				cbgpc=New _guicheckbox
				cbgpc.init(windowoptionsgame,xg,y,19,19,19);y:+off
				cbgpc.createhelp(strtouchpadhelp,font14,1,0,0)
				cbgpc.checked=pointandclick
				checkboxinitmagic(cbgpc)
				
				tgpa=New _guitext				
				tgpa.init(windowoptionsgame,x,y,2,strtouchpadalternative,tr,tg,tb,font18)
				tgpa.createhelp(strtouchpadalternativehelp,font14,0.2,0,0)
				cbgpa=New _guicheckbox
				cbgpa.init(windowoptionsgame,xg,y,19,19,19);y:+off
				cbgpa.createhelp(strtouchpadalternativehelp,font14,1,0,0)
				cbgpa.checked=pointandclickalternative
				checkboxinitmagic(cbgpa)
				
				tgcq=New _guitext				
				tgcq.init(windowoptionsgame,x,y,2,strexitconf,tr,tg,tb,font18)
				tgcq.createhelp(strexitconfhelp,font14,1,0,0)
				cbgcq=New _guicheckbox
				cbgcq.init(windowoptionsgame,xg,y,19,19,21);y:+off
				cbgcq.createhelp(strexitconfhelp,font14,1,0,0)
				checkboxinitmagic(cbgcq)
				cbgcq.checked=confirmonquit
				
				'tgdi=New _guitext				
				'tgdi.init(windowoptionsgame,x,y,2,"Schwierigkeit",tr,tg,tb,font18);
				'tbgdi=New _guitrackbar
				'tbgdi.init(windowoptionsgame,x-75,y,150,25,1,1,1,difficulty,0,1,22);
				'trackbarinitmagic(tbgdi)

				
				y:+off
				hh=strgameautomatics
				SetImageFont(font18)
				tgaa=New _guitext				
				tgaa.init(windowoptionsgame,(wx/2)-TextWidth(hh)/2,y+5,2,hh,1,0.9,0.5,font18);y:+off+10
				
				'y=110
				'x=320
				'y:+off
				'y:+off+10
				
				'tgas=New _guitext				
				'tgas.init(windowoptionsgame,x,y,2,"Spielstart",tr,tg,tb,font18);y:+off
				'cbgas=New _guicheckbox
				'cbgas.init(windowoptionsgame,x,y,19,19,20);y:+off
				'checkboxinitmagic(cbgas)
				'cbgas.checked=autostart
				tgat=New _guitext				
				tgat.init(windowoptionsgame,x,y,2,strautomaticturn,tr,tg,tb,font18);
				tgat.createhelp(strautomaticturnhelp,font14,0.2,0,0)
				cbgat=New _guicheckbox
				cbgat.init(windowoptionsgame,xg,y,19,19,18);y:+off
				cbgat.createhelp(strautomaticturnhelp,font14,1,0,0)
				checkboxinitmagic(cbgat)
				cbgat.checked=autoturncard
				
				tgad=New _guitext				
				tgad.init(windowoptionsgame,x,y,2,strautomaticdiscard,tr,tg,tb,font18);
				tgad.createhelp(strautomaticdiscardhelp,font14,0.2,0,0)
				cbgad=New _guicheckbox
				cbgad.init(windowoptionsgame,xg,y,19,19,17);y:+off
				cbgad.createhelp(strautomaticdiscardhelp,font14,1,0,0)
				checkboxinitmagic(cbgad)
				cbgad.checked=autodiscard
				
				'tgaf=New _guitext				
				'tgaf.init(windowoptionsgame,x,y,2,"Foundation belegen",tr,tg,tb,font18);y:+off
				'cbgaf=New _guicheckbox
				'cbgaf.init(windowoptionsgame,x,y,19,19,17);y:+off
				'checkboxinitmagic(cbgaf)
				'cbgaf.checked=autofoundation
				
				
				tgae=New _guitext				
				tgae.init(windowoptionsgame,x,y,2,strautomaticempty,tr,tg,tb,font18);
				tgae.createhelp(strautomaticemptyhelp,font14,0.2,0,0)
				cbgae=New _guicheckbox
				cbgae.init(windowoptionsgame,xg,y,19,19,17);y:+off
				cbgae.createhelp(strautomaticemptyhelp,font14,1,0,0)
				checkboxinitmagic(cbgae)
				cbgae.checked=autoempty
				
				tgcr=New _guitext				
				tgcr.init(windowoptionsgame,x,y,2,strautomaticrightclick,tr,tg,tb,font18);
				tgcr.createhelp(strautomaticrightclickhelp,font14,0.2,0,0)
				cbgcr=New _guicheckbox
				cbgcr.init(windowoptionsgame,xg,y,19,19,17);y:+off
				cbgcr.createhelp(strautomaticrightclickhelp,font14,1,0,0)
				checkboxinitmagic(cbgcr)
				cbgcr.checked=clickplayright
				
				tgcd=New _guitext				
				tgcd.init(windowoptionsgame,x,y,2,strautomaticdoubleclick,tr,tg,tb,font18);
				tgcd.createhelp(strautomaticdoubleclickhelp,font14,0.2,0,0)
				cbgcd=New _guicheckbox
				cbgcd.init(windowoptionsgame,xg,y,19,19,17);y:+off
				cbgcd.createhelp(strautomaticdoubleclickhelp,font14,1,0,0)
				checkboxinitmagic(cbgcd)
				cbgcd.checked=clickplaydouble
				
				'tbgav=New _guitrackbar
				'tgav=New _guitext				
				'tgav.init(windowoptionsgame,x,y,2,"Geschwindigkeit [cm/s]",tr,tg,tb,font18);y:+off
				'tbgav.init(windowoptionsgame,x-75,y,150,25,1,1,1,autospeed,5,500,22);
				'y:+off
				'trackbarinitmagic(tbgav)
				
				menuoptionsgame.visibility(False)
				menuoptionsgame.activity(False)
				menuoptionsgame.fadetarget(menuopacity2)
				menuoptionsgame.opacity(0)
				EndMethod
	Method createmenuoptionscard()
				Local tr#=0.99,tg#=0.7,tb#=0.27
				Local lx#=250
				Local ly#=100
				Local wx#=450
				Local wy#=600
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=650
				Local off#=20				
				
				Local cw#=128*0.7
				Local ch#=200*0.7
				Local mt:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cbt:_guicheckbox
	
				menuoptionscard=menuman.createmenu()
				windowoptionscard=New _guiwindow
				windowoptionscard.init(guisystem,-wx/2,-wy/2,wx,wy,255,255,255)
				windowoptionscard.position.add(0.5,0.5,0,True)
				windowoptionscard.setshadow(10,10)
				
				windowinitmagic(windowoptionscard,iguiwindow)
				menuoptionscard.add(windowoptionscard)
				
				createmenuoptionsbutton(windowoptionscard,menuoptionscard,3)
				
				buttonoptionscardmainmenu=New _guibutton
				buttonoptionscardmainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,strmenu,11)
				buttonoptionscardmainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonoptionscardmainmenu)
				'buttonoptionscardmainmenu.clearbackground()
				'buttonoptionscardmainmenu.background[0].addlast(ibuttonhauptoff)
				'buttonoptionscardmainmenu.background[1].addlast(ibuttonhaupton)
				'buttonoptionscardmainmenu.background[2].addlast(ibuttonhaupton)
				',ibuttonhaupton,ibuttonhaupton,ibuttonhauptoff,ibuttonhaupton,ibuttonhaupton)
				menuoptionscard.add(buttonoptionscardmainmenu)				
				
				
				SetImageFont(font32)
				Local hh$=strcards
				ttitlecard=New _guitext
				ttitlecard.init(windowoptionscard,(wx/2)-TextWidth(hh)/2,20,0,hh,0,0,0,font32)
				
				SetImageFont(font32)
				hh="Rückseite"
				ttitleback=New _guitext
				ttitleback.init(windowoptionscard,(wx/2)-TextWidth(hh)/2,50,0,hh,0,0,0,font32)

				SetImageFont(font32)
				hh="Vorderseite"
				ttitledeck=New _guitext
				ttitledeck.init(windowoptionscard,(wx/2)-TextWidth(hh)/2,320,0,hh,0,0,0,font32)
				
				gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				lbcardtexture=New _guilistbox
				lbcardtexture.borderwidth=8
				lbcardtexture.init(windowoptionscard,20,90,410,220,1,1,1,33)
				listboxinitmagic(lbcardtexture)
				For Local i=0 To cardtexturebackcount-1
				 gg.texture[0,0]=tcardback[i]
				 gg.texture[1,0]=tcardback[i]
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 Local x=20+(i Mod 2)*185
				 Local y=20+Int(i/2)*(ch+20)
				 lbcardtexture.insertmesh(mt,x,y,cw,ch+20,0.8,0.8,0.8,100+i)
				Next
				For Local i=0 To cardtexturebackcount-1
				 cbt=New _guicheckbox
				 Local yy#=0+(i/2)*(ch+20)+ch/2-50
				 Local xx#
				 If (i Mod 2)=0 xx=120 Else xx=205+((i Mod 2)*100)
				 cbt.init(lbcardtexture,xx,yy,19,19,100+i)
				 checkboxinitmagic(cbt)
				 'lbcardtexture.childlist.addlast(cbt)
				 cblist.addlast(cbt)
				Next				
				updatemenuoptionscardcheckboxback(cblist)

				lbdecktexture=New _guilistbox
				lbdecktexture.borderwidth=8
				lbdecktexture.init(windowoptionscard,20,350,410,220,1,1,1,34)
				listboxinitmagic(lbdecktexture)
				cw=64
				ch=96				
				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				For Local i=0 To cardtexturefrontcount-1
				 For Local j=0 To 3
				  Local w#=j*40+60
				  gg.position.set(80+Cos(w)*90,110-Sin(w)*90,0)
				  'Local k
				  'If j=0 k=0+ 0
				  'If j=1 k=51-5-5
				  'If j=2 k=51-5
				  'If j=3 k=51
				  gg.texture[0,0]=tcardpreview[i,j]
				  gg.texture[1,0]=tcardpreview[i,j]
				  w:-60
				  gg.vx.set(cw,0,0)
				  gg.vy.set(0,ch,0)
				  gg.vx.rotz(-w/2)
				  gg.vy.rotz(-w/2)
				  
				  mt=gg.Create()
				  mt.twosided(True)
				  mt.cull(False)		
				  mt.blend(True)
				  mt.blendadditive(False)
				
				  lbdecktexture.insertmesh(mt,20,20+i*(ch+60),200,128,0.8,0.8,0.8,200+i)
				 Next
				Next
				For Local i=0 To cardtexturefrontcount-1
				 cbt=New _guicheckbox
				 Local yy#=40+i*(ch+60)+ch/2-50
				 cbt.init(lbdecktexture,220,yy,19,19,200+i)
				 checkboxinitmagic(cbt)
				 'lbdecktexture.childlist.addlast(cbt)
				 cflist.addlast(cbt)
				Next
				updatemenuoptionscardcheckboxfront(cflist)
				menuoptionscard.visibility(False)
				menuoptionscard.activity(False)
				menuoptionscard.fadetarget(menuopacity2)
				menuoptionscard.opacity(0)
				EndMethod
	Method updatemenuoptionscardcheckboxback(l:TList)
				For Local cit:_guicheckbox=EachIn l
				 If cardtexturebackindex=(cit.index-100) cit.checked=True Else cit.checked=False
				Next
				If game game.updatetexture()
				EndMethod		
	Method updatemenuoptionscardcheckboxfront(l:TList)
				'Print cardtexturefrontindex
				For Local cit:_guicheckbox=EachIn l
				 If cardtexturefrontindex=(cit.index-200) cit.checked=True Else cit.checked=False
				Next
				If game game.updatetexture()
				EndMethod		
	Method createmenuoptionscredits()
				Local wx#=450
				Local wy#=600
				menuoptionscredits=menuman.createmenu()
				windowoptionscredits=New _guiwindow
				windowoptionscredits.init(guisystem,-wx/2,-wy/2,wx,wy,255,255,255)
				windowoptionscredits.position.add(0.5,0.5,0,True)
				windowoptionscredits.setshadow(10,10)
				windowinitmagic(windowoptionscredits,icredits)
				menuoptionscredits.add(windowoptionscredits)
				
				createmenuoptionsbutton(windowoptionscredits,menuoptionscredits,4)
				
				buttonoptionscreditsmainmenu=New _guibutton
				buttonoptionscreditsmainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,strmenu,11)
				buttonoptionscreditsmainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonoptionscreditsmainmenu)
				'buttonoptionscreditsmainmenu.clearbackground()
				'buttonoptionscreditsmainmenu.background[0].addlast(ibuttonhauptoff)
				'buttonoptionscreditsmainmenu.background[1].addlast(ibuttonhaupton)
				'buttonoptionscreditsmainmenu.background[2].addlast(ibuttonhaupton)
				menuoptionscredits.add(buttonoptionscreditsmainmenu)				
				
				menuoptionscredits.visibility(False)
				menuoptionscredits.activity(False)
				menuoptionscredits.fadetarget(menuopacity2)
				menuoptionscredits.opacity(0)
				EndMethod

	Method createmenuoptionsbutton(w:_guiwindow,menu:_menu,excl)							
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=0
				Local x#=0+w.width()+20
				Local wi#=w.width()
				Local he#=w.height()
				Local off#=10				
				Local kit:_guibutton
				Local wx#=450
				Local wy#=600
				Local bac:_guibutton=Null
				Local bgr:_guibutton=Null
				Local bga:_guibutton=Null
				Local bcd:_guibutton=Null
				Local bcr:_guibutton=Null
				Local bge:_guibutton=Null
				Local bm:_guibutton=Null
	
				Rem
				bm=New _guibutton
				bm.init(guisystem,x,y,bw,bh,"Schließen",11)
				buttoninitmagic(bm)
				menu.add(bm)
				y:+bh+off
				EndRem
				

				bac=New _guibutton
				bac.init(guisystem,+wi/2+20,-he/2+y,bw,bh,strgeneral,7)
				bac.position.add(0.5,0.5,0,True)
				buttoninitmagic(bac)
				menu.add(bac)
				If excl=0
				 bac.marking(2)
				 bac.superinactive=True
				EndIf
				y:+bh+off
				

				bgr=New _guibutton
				bgr.init(guisystem,+wi/2+20,-he/2+y,bw,bh,strgraphics,8)
				bgr.position.add(0.5,0.5,0,True)
				buttoninitmagic(bgr)
				menu.add(bgr)
				If excl=1
				 bgr.marking(2)
				 bgr.superinactive=True
				EndIf
				y:+bh+off
				

				bga=New _guibutton
				bga.init(guisystem,+wi/2+20,-he/2+y,bw,bh,strgame,9)
				bga.position.add(0.5,0.5,0,True)
				buttoninitmagic(bga)
				menu.add(bga)
				If excl=2
				 bga.marking(2)
				 bga.superinactive=True
				EndIf
				y:+bh+off
				

				bcd=New _guibutton
				bcd.init(guisystem,+wi/2+20,-he/2+y,bw,bh,strcards,10)
				bcd.position.add(0.5,0.5,0,True)
				buttoninitmagic(bcd)
				menu.add(bcd)
				If excl=3
				 bcd.marking(2)
				 bcd.superinactive=True
				EndIf
				y:+bh+off

				bcr=New _guibutton
				bcr.init(guisystem,+wi/2+20,-he/2+y,bw,bh,strcredits,12)
				bcr.position.add(0.5,0.5,0,True)
				buttoninitmagic(bcr)
				menu.add(bcr)
				If excl=4
				 bcr.marking(2)
				 bcr.superinactive=True
				EndIf
				y:+bh+off
				EndMethod				
'******************************************************************************************************************
'										G A M E T Y P E M E N U 
'******************************************************************************************************************
	Method createmenugametype()
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=80
				Local x#=670
				Local wx#=700
				Local wy#=650
				Local off#=20		
				Local kit:_guibutton=Null
				Local keyraus=False
				
				menugametype=menuman.createmenu()
				windowgametype=New _guiwindow
				windowgametype.init(guisystem,-wx/2,-wy/2,wx,wy,255,255,255)
				'windowgametype.position.setz(1)
				windowgametype.position.add(0.5,0.5,0,True)
				windowgametype.setshadow(10,10)
				windowgametype.background[0].addlast(iguiwindow)
				windowgametype.background[1].addlast(iguiwindow)
				windowgametype.background[2].addlast(iguiwindow)
				menugametype.add(windowgametype)
				
				buttongametypemainmenu=New _guibutton
				buttongametypemainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,strmenu,37)
				buttongametypemainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttongametypemainmenu)
				'buttongametypemainmenu.clearbackground()
				'buttongametypemainmenu.background[0].addlast(ibuttonhauptoff)
				'buttongametypemainmenu.background[1].addlast(ibuttonhaupton)
				'buttongametypemainmenu.background[2].addlast(ibuttonhaupton)
				menugametype.add(buttongametypemainmenu)
				
				buttongametypestart=New _guibutton
				buttongametypestart.init(guisystem,-wx/2-106-20,-wy/2+106+20,107,85,strstart,37)
				buttongametypestart.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttongametypestart)
				'buttongametypestart.clearbackground()
				'buttongametypestart.background[0].addlast(ibuttonstartoff)
				'buttongametypestart.background[1].addlast(ibuttonstarton)
				'buttongametypestart.background[2].addlast(ibuttonstarton)
				menugametype.add(buttongametypestart)
				Rem
				buttonstart=New _guibutton
				buttonstart.init(guisystem,0,0,116,88,"",0)
				buttonstart.position.set(0.5,0,0,True)
				buttonstart.position.add(-116/2,30,0)
				buttoninitmagic(buttonstart)
				
				buttonstart.background[0].addlast(ibuttonstartoff)
				buttonstart.background[1].addlast(ibuttonstarton)
				buttonstart.background[2].addlast(ibuttonstarton)
				',ibuttonstarton,ibuttonstarton,ibuttonstartoff,ibuttonstarton,ibuttonstarton)
				menumain.add(buttonstart)				
				EndRem
				',ibuttonhaupton,ibuttonhaupton,ibuttonhauptoff,ibuttonhaupton,ibuttonhaupton)
				previewwindow=New _previewwindow
				previewwindow.init(Self,windowgametype,20,20,20,20,1,1,1)
				
				
				
				current=New _guitext
				current.init(windowgametype,20,30,0,strcurrentgame+" "+gamenames[cur_game],0,0,0,font22)
				'-------------------------------------- create game type list
				typelist=New _guilistbox
				typelist.borderwidth=8
				typelist.init(windowgametype,20,60,200,530,1,1,1,38)
				typelist.selectionrect=True
				typelist.moverrect=True
				listboxinitmagic(typelist)
				current_preview=cur_game
				
				updatemenugametypesorted()				
				'-------------------------------------- create sort box
				sortbox=New _guicombobox
				sortbox.init(windowgametype,20,650-60,200,40,40,-1,1,1,1  ,220,650-60-120,170,120+40, 8, 0, font18)
				sortbox.listbox.selectionrect=True
				sortbox.listbox.moverrect=True
				comboboxinitmagic(sortbox)
				Local gt:_guitext
				gt=sortbox.listbox.inserttext(strgametypesortalphabetical,10,10,0,0,0,0,font18,0)
				gt=sortbox.listbox.inserttext(strgametypesortpublicity,10,30,0,0,0,0,font18,1);gt.createhelp(strgametypesortpublicitydesc,font14,0.1,200,0)
				gt=sortbox.listbox.inserttext(strgametypesortchance,10,50,0,0,0,0,font18,2);gt.createhelp(strgametypesortchancedesc,font14,0.1,200,0)
				gt=sortbox.listbox.inserttext(strgametypesortskill,10,70,0,0,0,0,font18,3);gt.createhelp(strgametypesortskilldesc,font14,0.1,200,0)
				gt=sortbox.listbox.inserttext(strgametypesorttime,10,90,0,0,0,0,font18,4);gt.createhelp(strgametypesorttimedesc,font14,0.1,200,0)
				gt=sortbox.listbox.inserttext(strgametypesorttype,10,110,0,0,0,0,font18,5)
				
				sortbox.listbox.superinactivity(True)
				sortbox.listbox.superinvisibility(True)
				sortbox.listbox.opacity(0)
				sortbox.createhelp(strsortbox,font14,0.5,0,0)
				sortbox.button.createhelp(strsortboxbutton,font14,0.5,0,0)
				sortbox.text.set(strgametypesortalphabetical)
				'-------------------------------------- create game manual help list
				desclist=New _guilistbox
				desclist.borderwidth=8
				desclist.init(windowgametype,230,60,450,260,1,1,1,39)
				listboxinitmagic(desclist)
				updatemenugametype()
				menugametype.opacity(0)
				menugametype.visibility(False)
				menugametype.activity(False)
				menugametype.fadetarget(0.85)
				
				EndMethod
				
			
'******************************************************************************************************************
'										G A M E  M E N U 
'******************************************************************************************************************
	Method createmenugame()
				menugame=menuman.createmenu()
				bottombuttons=CreateList()
				Local kit:_guibutton
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local off#=10
				Local y#=10
				Local x#=10
				Rem
				windowgamemenu=New _guiwindow
				windowgamemenu.init(guisystem,0,0,141,768,255,255,255)
				windowgamemenu.shadow=False
				windowgamemenu.background[0].addlast(ilederstreifen)
				windowgamemenu.background[1].addlast(ilederstreifen)
				windowgamemenu.background[2].addlast(ilederstreifen)
				menugame.add(windowgamemenu)		
				EndRem		
				y=10
				buttongamemainmenu=New _guibutton
				buttongamemainmenu.init(guisystem,x,y,bw,bh,"",42)
				buttongamemainmenu.position.set(x,y,-1,False)
				buttoninitmagic(buttongamemainmenu,font18,ibuttonmenu[0],ibuttonmenu[1])
				menugame.add(buttongamemainmenu)
				y:+(bh+off)
				buttongameoptions=New _guibutton
				buttongameoptions.init(guisystem,x,y,bw,bh,"",3442)
				buttongameoptions.position.set(x,y,-1,False)
				buttoninitmagic(buttongameoptions,font18,ibuttonoptions[0],ibuttonoptions[1])
				menugame.add(buttongameoptions)
				y:+(bh+off)
				y=-6*(off+bh)
				buttongamenew=New _guibutton
				buttongamenew.init(guisystem,x,y,bw,bh,"",45)
				buttongamenew.position.add(0,1,-1,True)
				buttoninitmagic(buttongamenew,font18,ibuttonnew[0],ibuttonnew[1])
				menugame.add(buttongamenew)
				y:+off+bh
				buttontipp=New _guibutton
				buttontipp.init(guisystem,x,y,bw,bh,"",63)
				buttontipp.position.add(0,1,-1,True)
				buttoninitmagic(buttontipp,font18,ibuttontipp[0],ibuttontipp[1])
				menugame.add(buttontipp)
				y:+bh+off
				'buttonauto=New _guibutton
				'buttonauto.init(guisystem,x,y,bw,bh,"Automatik",64)
				'buttoninitmagic(buttonauto)
				'menugame.add(buttonauto)
				'y:+bh+off
				buttonundo=New _guibutton
				buttonundo.init(guisystem,x,y,bw,bh,"",40)
				buttonundo.position.add(0,1,-1,True)
				buttoninitmagic(buttonundo,font18,ibuttonundo[0],ibuttonundo[1])
				menugame.add(buttonundo)
				y:+bh+off
				buttonredo=New _guibutton
				buttonredo.init(guisystem,x,y,bw,bh,"",41)
				buttonredo.position.add(0,1,-1,True)
				buttoninitmagic(buttonredo,font18,ibuttonredo[0],ibuttonredo[1])
				menugame.add(buttonredo)
				y:+bh+off
				buttongamesave=New _guibutton
				buttongamesave.init(guisystem,x,y,bw,bh,"",62)
				buttongamesave.position.add(0,1,-1,True)
				buttoninitmagic(buttongamesave,font18,ibuttonsave[0],ibuttonsave[1])
				menugame.add(buttongamesave)
				y:+(bh+off)
				buttongameload=New _guibutton
				buttongameload.init(guisystem,x,y,bw,bh,"",61)
				buttongameload.position.add(0,1,-1,True)
				buttoninitmagic(buttongameload,font18,ibuttonload[0],ibuttonload[1])
				menugame.add(buttongameload)
				y:+(bh+off)
				tgmcurgame=New _guitext
				tgmcurgame.init(guisystem,0,10,2,"hu",1,0.95,0.6)
				tgmcurgame.font=font32
				menugame.add(tgmcurgame)
				tgmtime=New _guitext
				tgmtime.init(guisystem,0,50,2,"hu",1,0.95,0.6)
				tgmtime.font=font18
				menugame.add(tgmtime)
				tgmscore=New _guitext
				tgmscore.init(guisystem,0,75,2,"hu",1,0.95,0.6)
				tgmscore.font=font18
				menugame.add(tgmscore)
				menugame.visibility(False)
				menugame.activity(False)
				menugame.opacity(0)
				menugame.fadetarget(menuopacity)

				bottombuttons.addlast(buttongameload)
				bottombuttons.addlast(buttongamesave)
				bottombuttons.addlast(buttonredo)
				bottombuttons.addlast(buttonundo)
				bottombuttons.addlast(buttontipp)
				bottombuttons.addlast(buttongamenew)



				EndMethod
	Method updatemenugame()
				'update type&time display
				Local x#
				SetImageFont(font32)
				x=gra.screenw-TextWidth(gamenames[cur_game])-10
				tgmcurgame.position.setx(x)
				tgmcurgame.set(gamenames[cur_game])
				SetImageFont(font18)
				Local h$
				Local hs$
				If game
				 If game.inuse
				  h=timemstohhmmss(game.time)
				  hs=Int(game.score())+" "+strpoints
				 Else
				  h=strnotbegun
				  hs=""
				 EndIf
				EndIf
				If timeduringgame
				 x=gra.screenw-TextWidth(h)-10
				 tgmtime.position.setx(x)
		 		 tgmtime.positiontransformed.x=x
			 	 tgmtime.set(h)
			     tgmscore.position.sety(75)
				Else
				 tgmtime.visible=False
				 tgmtime.active=False
				 tgmscore.position.sety(50)
				EndIf
				x=gra.screenw-TextWidth(hs)-10
				tgmscore.position.setx(x)
				tgmscore.positiontransformed.x=x
				tgmscore.set(hs)	
				
				
				
				Local bh#=buttonheight
				Local off#=10	
				Local yit#=-1*(off+bh)
				For Local bit:_guibutton=EachIn bottombuttons
				 If bit.visible 
				  Local y#=bit.position.gety(0)
				  bit.position.sety(y*0.9+yit*0.1)
				  yit:-(off+bh)
				 EndIf
				Next
				
				
				
				
				EndMethod


'******************************************************************************************************************
'										M A I N L O O P 
'******************************************************************************************************************
	Method mainloop:Int()
				Local keyraus=False
				Local buttonraus
				Repeat
				 'If menugametype.active()
				  'volumesound=tbvs.get()*0.2
				 'Else
				 ' volumesound=tbvs.get()
				 'EndIf

				 If volumesoundfadein<1
				  volumesoundfadein:+0.005
				  If volumesoundfadein>1 volumesoundfadein=1
				 EndIf
				 If game
				  If game.picklist.count()=0 guisystem.animate()
				 Else
				  guisystem.animate()
				 EndIf
				 Local cc=GetChar()
				 guisystem.key=cc
				 guisystem.animatefade()
				 buttonraus=False
				 If guisystem.button
				  '-----------------------------------------mainmenu-------------------------------------------------------------------------
				  ' -------------- Hauptmenu : start ---------------------
				  If guisystem.button If guisystem.button.index=0 
				   showmenugame()
				   If game If game.ended initgame(2,True)
				   If game movecamera(game.cameraposition[2])
				  EndIf
				  ' -------------- Hauptmenu : Optionen ---------------------
				  If guisystem.button If guisystem.button.index=4 showmenuoptions(menuoptionslast,False,False)
				  If guisystem.button If guisystem.button.index=5 
				   buttonraus=True
				   If game If game.inuse And game.ended=False And confirmonquit
				    If abfrage(strquit,strnevermind,strisee,gra.screenw/2,gra.screenh/2,font18,iwindow240204)=False buttonraus=False
				   EndIf
				  EndIf
				  ' -------------- Hauptmenu : gametype ---------------------
				  If guisystem.button If guisystem.button.index=2 
	 			   current_preview=cur_game
	   			   initgamepreview(2,current_preview)
				   gamepreview.opacity(0)
				   updatemenugametypesorted();
				   updatemenugametype()
				   menuman.show(menugametype)
				   guisystem.focus=typelist
				   If game game.allowpick=False
				  EndIf
				  ' -------------- Hauptmenu : scenetype --------------------
				  If guisystem.button If guisystem.button.index=6
				   menuman.show(menuscene)
  				   optionscalledfromgame=False
				   guisystem.focus=lbscene
				   If game game.allowpick=False
				  EndIf
				  '--------------- scenen änderung -------------------------
				  If guisystem.button If guisystem.button.index=49
				   currentscene:+1
				   If currentscene>scenecount-1 currentscene=0
				   updatescene()
				   updatesheepwindowscene()
				   windowsheepscene.animate()
				   If cardtexturebackuser=False
				    'cardtexturebackindex=currentscene
				    If game game.updatetexture()
				   EndIf
				   If musicsequence And currentmusic<>currentscene
				    currentmusic=currentscene
				    If currentmusic>musiccount-2 currentmusic=musiccount-2
				    musicman.channelmenufadeswitch=True
				    musicman.channelmenuswitchto=currentmusic
				    musicman.channelmenufadeup=False
				    musicman.channelmenufadedown=False
				   EndIf
				   updatesheepwindowmusic()
				  EndIf

				  If guisystem.button If guisystem.button.index=48
				   currentscene:-1
				   If currentscene<0 currentscene=scenecount-1
				   updatescene()
				   updatesheepwindowscene()
				   windowsheepscene.animate()
				   If cardtexturebackuser=False
				    'cardtexturebackindex=currentscene
				    If game game.updatetexture()
				   EndIf
				   If musicsequence And currentmusic<>currentscene
				    currentmusic=currentscene
				    If currentmusic>musiccount-2 currentmusic=musiccount-2
				
				    musicman.channelmenufadeswitch=True
				    musicman.channelmenuswitchto=currentmusic
				    musicman.channelmenufadeup=False
				    musicman.channelmenufadedown=False
				   EndIf
				   updatesheepwindowmusic()
				  EndIf
				  '-------------------- karten options aufruf -------------------------
				  If guisystem.button If guisystem.button.index=56 showmenuoptions(menuoptionscard,False,True)
				  '--------------- musik änderung -------------------------
				  If guisystem.button If guisystem.button.index=52 Or guisystem.button.index=50
				   currentmusic:+1
				   If currentmusic>musiccount-2 currentmusic=0
				   updatesheepwindowmusic()
				   musicman.play(currentmusic,False,True)
				   windowsheepmusic.animate()
				   musicsequence=False
				   cbms.checked=musicsequence
				   currentmusicuser=True
				  EndIf
				  If guisystem.button If guisystem.button.index=51
				   currentmusic:-1
				   If currentmusic<0 currentmusic=musiccount-2
				   updatesheepwindowmusic()
				   windowsheepmusic.animate()
				   musicman.play(currentmusic,False,True)
				   musicsequence=False
				   cbms.checked=musicsequence
				   currentmusicuser=True
				  EndIf
				  '------------------ statistik ----------------------------
				  If guisystem.button If guisystem.button.index=54'highscore löschen
				   If abfrage(strclearhighscore,stryes,strno,gra.screenw/2,gra.screenh/2,font14,iwindow240204)
				    gamestats[cur_game].highscorelist.clear()
				    updatemenumain()
				   EndIf
				  EndIf
				  If guisystem.button If guisystem.button.index=55'statisitk löschen
				   If abfrage(strclearstatistics,stryes,strno,gra.screenw/2,gra.screenh/2,font14,iwindow240204)
				    gamestats[cur_game].entrylist.clear()
				    updatemenumain()
				   EndIf
				  EndIf
				 EndIf
				 '-----------------------------------------options menu-----------------------------------------------------------------------
				 If guisystem.button
				  If guisystem.button If guisystem.button.index=7 showmenuoptions(menuoptionsacoustics,optionscalledfromgame,False)
				  If guisystem.button If guisystem.button.index=8 showmenuoptions(menuoptionsgraphics,optionscalledfromgame,False)
				  If guisystem.button If guisystem.button.index=9 showmenuoptions(menuoptionsgame,optionscalledfromgame,False)
				  If guisystem.button If guisystem.button.index=10 showmenuoptions(menuoptionscard,optionscalledfromgame,False)
				  If guisystem.button If guisystem.button.index=12 showmenuoptions(menuoptionscredits,optionscalledfromgame,False)
				  If guisystem.button If guisystem.button.index=11'options - zurück button 
				   If optionscalledfromgame showmenugame() Else showmenumain()
				   If game game.allowpick=True
				  EndIf
				 EndIf
				 If guisystem.checkbox
				  If guisystem.checkbox.index>=100 And guisystem.checkbox.index<200
				   cardtexturebackindex=guisystem.checkbox.index-100
				   updatemenuoptionscardcheckboxback(cblist)
				   cardtexturebackuser=True
				   Local iii=0
				   For Local gii:_guimesh=EachIn lbcardtexture.childlist
				    If cardtexturebackindex=iii lbcardtexture.selection=gii
				    iii:+1
				   Next
				  ElseIf guisystem.checkbox.index>=200 And guisystem.checkbox.index<300
				   Local ni=guisystem.checkbox.index-200
				   If ni<>cardtexturefrontindex
				    cardtexturefrontindex=ni
				    updatetextureload("fs","..\daten\images\cards",False)
				    updatemenuoptionscardcheckboxfront(cflist)
				    updatesheepwindowcardfront()
				    Local iii=0
				    For Local gii:_guimesh=EachIn lbdecktexture.childlist
				     If cardtexturefrontindex=iii lbdecktexture.selection=gii
				     iii:+1
				    Next
				
				   EndIf
				  ElseIf guisystem.checkbox.index>=700 And guisystem.checkbox.index<800
				   Local ni=guisystem.checkbox.index-700
				   If ni<>currentscene
				    currentscene=ni
				    updatemenuscenecheckbox(cslist)
				    updatesheepwindowscene()
				    updatescene()
				    Local iii=0
				    For Local gii:_guiimage=EachIn lbscene.childlist
				     If currentscene=iii lbscene.selection=gii
				     iii:+1
				    Next
				
				   EndIf
				  EndIf
				 EndIf
				 If guisystem.mesh
				  If guisystem.mesh.index>=100 And guisystem.mesh.index<200
				   cardtexturebackindex=guisystem.mesh.index-100
				   updatemenuoptionscardcheckboxback(cblist)
				   cardtexturebackuser=True
				  ElseIf guisystem.mesh.index>=200 And guisystem.mesh.index<300
				   Local ni=guisystem.mesh.index-200
				   If ni<>cardtexturefrontindex
				    cardtexturefrontindex=ni
				    updatetextureload("fs","..\daten\images\cards",False)
				    updatemenuoptionscardcheckboxfront(cflist)
				    updatesheepwindowcardfront()
				   EndIf
				  EndIf
				 EndIf	
				 If guisystem.image
				  If guisystem.image.index>=700 And guisystem.image.index<800
				   Local ni=guisystem.image.index-700
				   If ni<>currentscene
				    currentscene=ni
				    updatemenuscenecheckbox(cslist)
				    updatesheepwindowscene()
				    updatescene()
				   EndIf
				  EndIf
				 EndIf
				 If guisystem.trackbar
				  Local t:_guitrackbar=guisystem.trackbar
				  If t=tbgrcs cardslope=tbgrcs.get()
				  If t=tbgrct cardthickness=tbgrct.get()
				  If t=tbgrcl cardtableaulift=tbgrcl.get()
				  If t=tbgrcw
				   cardwidth=tbgrcw.get()
				   If game game.update()
				  EndIf	
				  If t=tbgrch
				   cardheight=tbgrch.get()
				   If game game.update()
				  EndIf	
				  If t=tbgrnp
				   naturalpiles=tbgrnp.get()
				   If game game.updatenaturality()
				  EndIf 
				  If t=tbgrgo
				   menugameopacity=tbgrgo.get()
				   menugame.fadetarget(menugameopacity)
				  EndIf 
				  If t=tbva
				   volumeambience=tbva.get()
				   channelambience.setvolume(volumeambience)
				  EndIf
				  If t=tbvs volumesound=tbvs.get()
				  If t=tbvm
				   volumemusic=tbvm.get()
				   channelmusic.setvolume(volumemusic)
				  EndIf
				  If t=tbgdi difficulty=tbgdi.get()
				  If t=tbgav autospeed=tbgav.get()
				  If t=tbsp systemperformance=tbsp.get()
				  t.sliderimageindex:+1
				  If t.sliderimageindex>5 t.sliderimageindex=0
				 EndIf
				 If guisystem.checkbox
				  Local c:_guicheckbox=guisystem.checkbox
				  If c=cbgrsm sparkingmouse=cbgrsm.checked
				  If c=cbgrtd timeduringgame=cbgrtd.checked
				  If c=cbgrlp buttonpanel=cbgrlp.checked
				  If c=cbgrgp gameplaybuttons=cbgrgp.checked
				  If c=cbgrmb menubuttons=cbgrmb.checked
				  If c=cbgrca 
				   cardanimation=cbgrca.checked
				   updatescene()
				  EndIf
				  If c=cbms musicsequence=cbms.checked
				  If guisystem.checkbox=cbfs 
				   fullscreen=cbfs.checked
				   graphics_setup()
				   For Local tit:_texture=EachIn texturelist
				    tit.reinit()
				   Next
				   updatesheepwindowtype()
				   updatesheepwindowcardfront()
				   updatesheepwindowscene()
				   updatesheepwindowmusic()
				   saveoptions("sterlingoptions.sol")				
				  EndIf
				  If c=cbgrmo mouseovercard=cbgrmo.checked
				  If c=cbgrmp mouseoverpile=cbgrmp.checked
			  	  If c=cbgas autostart=cbgas.checked
			  	  If c=cbgat autoturncard=cbgat.checked
			  	  If c=cbgad 
			       autodiscard=cbgad.checked
			       autofoundation=cbgad.checked
			      EndIf
			  	  If c=cbgaf autofoundation=cbgaf.checked
			  	  If c=cbgae autoempty=cbgae.checked
			  	  If c=cbgcr clickplayright=cbgcr.checked
			  	  If c=cbgcd clickplaydouble=cbgcd.checked
			  	  If c=cbgpc Or c=cbgpa 
			 	   If c=cbgpc 
			        pointandclick=cbgpc.checked
			 		If pointandclickalternative
			  		 cbgpa.checked=False
			         pointandclickalternative=False
					EndIf
				   EndIf
			 	   If c=cbgpa 
			        pointandclickalternative=cbgpa.checked
			 		If pointandclick
			  		 cbgpc.checked=False
			         pointandclick=False
					EndIf
				   EndIf
			 	  EndIf
			  	  If c=cbgcq confirmonquit=cbgcq.checked
				 EndIf
				 '----------------------------------------gametype menu----------------------------------------------------------------------
				 If guisystem.listbox
				  If guisystem.listbox=typelist
				   Local old=current_preview
				   Local neu=-1
				   Local typ$=typelist.selectiontext()
				   For Local i=0 To gametypecount-1
				    If typ=gamenames[i] 
				     neu=i
				    EndIf
				   Next				
				   If old<>neu And neu<>-1
				    volumesoundfadein=0.2
					demoplay=False
					current_preview=neu
					initgamepreview(2,current_preview)
					updatemenugametype()
					If game game.allowpick=False
				   EndIf
				   If guisystem.doubleclickleft 
				    Local wechseln=True
				    If game If game.inuse And game.ended=False And confirmonquit If abfragegametype(font14,iwindow240204)=False wechseln=False
				    updatesheepwindowtype()				
				    demoplay=False		
				    If wechseln 
					 cur_game=current_preview
				 	 initgame(2,False)
				    EndIf
				    showmenugame()
				    If game movecamera(game.cameraposition[2])
				   EndIf
				  EndIf
				 EndIf
				 If guisystem.button
				  If gamepreview
				   If guisystem.button=buttonfoundation
				    For Local pit:_pile=EachIn gamepreview.pilefoundationlist
				     pit.show()
				    Next
				   EndIf
				   If guisystem.button=buttondiscard
				    For Local pit:_pile=EachIn gamepreview.pilediscardlist
				     If pit pit.show()
				    Next
				   EndIf
				   If guisystem.button=buttontableau
				    If gamepreview.tableau
				     For Local pit:_pile=EachIn gamepreview.tableau.pilelist
				      pit.show()
				     Next
				    EndIf
				   EndIf
				   If guisystem.button=buttonstock
				    For Local pit:_pile=EachIn gamepreview.pilestocklist
				     pit.show()
				    Next
				   EndIf
				   If guisystem.button=buttonwaste
				    For Local pit:_pile=EachIn gamepreview.pilewastelist
				     pit.show()
				    Next
				   EndIf
				   If guisystem.button=buttonredeal
				    For Local pit:_pile=EachIn gamepreview.pileredeallist
				     pit.show()
				    Next
				   EndIf
				   If guisystem.button=buttonreserve
				    For Local pit:_pile=EachIn gamepreview.pilereservelist
				     pit.show()
				    Next
				   EndIf
				   If guisystem.button=buttonfreecell
				    For Local pit:_pile=EachIn gamepreview.pilefreecelllist
				     pit.show()
				    Next
				   EndIf
				   If guisystem.button=buttonpyramid
				    For Local pit:_pile=EachIn gamepreview.pilepyramidlist
				     pit.show()
				    Next
				   EndIf
				   If guisystem.button=buttonlabyrinth
				    For Local pit:_pile=EachIn gamepreview.pilelabyrinthlist
				     pit.show()
				    Next
				   EndIf
				   If guisystem.button=buttondemoplayplay
				    If gamepreview.ended
				     initgamepreview(2,current_preview)
				    EndIf
				    If demoplay=False playsoundstretched(sgong,0.5,1.05,1.1)
				    demoplay=True
				    demoplaylasttime=clock.ms()-2000
				    
				   EndIf
				   If guisystem.button=buttondemoplaystop 
				    If demoplay=True playsoundstretched(sgong,0.5,0.95,1.05)
				    demoplay=False
				   EndIf
				  EndIf
				
				  If guisystem.button=buttongametypemainmenu 
				   Local wechseln=True
				   If game If game.inuse And game.ended=False And confirmonquit If abfragegametype(font14,iwindow240204)=False wechseln=False
				   updatesheepwindowtype()				
				   demoplay=False		
				   If wechseln 
					cur_game=current_preview
					initgame(2,False)
				   EndIf
				   showmenumain()
				  EndIf
				  If guisystem.button=buttongametypestart
				   Local wechseln=True
				   If game If game.inuse And game.ended=False And confirmonquit If abfragegametype(font14,iwindow240204)=False wechseln=False
				   If wechseln 
					cur_game=current_preview
					initgame(2,False)
				   EndIf
				   updatesheepwindowtype()				
				   demoplay=False		
				   showmenugame()
				   If game movecamera(game.cameraposition[2])
				   If game game.allowpick=True				   
				  EndIf
				 EndIf
				
				
				 If guisystem.combobox=sortbox
				  Local t$=guisystem.combobox.text.get()
				  If t=strgametypesortalphabetical gametypesortmethod=0
				  If t=strgametypesortpublicity gametypesortmethod=1
				  If t=strgametypesortchance gametypesortmethod=2
				  If t=strgametypesortskill gametypesortmethod=3
				  If t=strgametypesorttime gametypesortmethod=4
				  If t=strgametypesorttype gametypesortmethod=5
				  updatemenugametypesorted()
				 EndIf
				 '----------------------------------------game menue--------------------------------------------------------------
				 If game
				  If game.picklist.count()=0 And game.animationlist.firstlink()=Null
				   If (guisystem.button=buttontipp Or cc=KEY_ENTER Or cc=KEY_SPACE Or cc=KEY_F1) And game.allowpick 
				    If game.tipp() 
				     game.starttime:-10000;
				     Local hh$=strminustime+" 10 "+strseconds+"."
				     messagestatusbar(hh,0.7,500)
					Else
					 If game.ended=False messagestatusbar(strnotipp,0.7,500) Else messagestatusbar(strgamealreadywon,0.7,500)
				    EndIf
				   EndIf
				   If (guisystem.button=buttonundo Or cc=KEY_BACKSPACE Or cc=117) And game.allowpick game.undo()
				   If (guisystem.button=buttonredo Or cc=114) And game.allowpick game.redo()
				  EndIf
				 EndIf
			 	 If guisystem.button	 
				  If game
				   If game.picklist.count()=0 
				    If guisystem.button.index=45 Or guisystem.button.index=53 
				     Local neu=True
					 If game 
					  If game.inuse And game.ended=False And confirmonquit 
					   If abfrage2z(strnewgame0,strnewgame1,stryes,strno,gra.screenw/2,gra.screenh/2,font14,iwindow240204)=False neu=False
				      EndIf
				     EndIf
				     If neu initgame(2,True)
				    EndIf
				    If guisystem.button=buttongameload 
				     Local laden=True
				     If game If game.inuse
				      If abfrage2z(strloadgame0,strloadgame1,stryes,strno,gra.screenw/2,gra.screenh/2,font14,iwindow240204)=False laden=False
				 	 EndIf
					 If laden
				      messagestatusbar(strloading,0.7,1500)
 			  	      world.determinevertexlight()
  				 	  gra.enabletext2d()	
	 				  guisystem.drawbackground(gra,cam)
				 
 					  If buttonpanel And buttongamenew.visible
  					   SetBlend(SOLIDBLEND|MASKBLEND)
					   SetColor(255,255,255)
					   SetAlpha(buttongamenew.color.w)
					   DrawImageRect(ilederstreifen,0,0,141,768)
					  EndIf	
					  drawgame()	
					  guisystem.draw(gra,cam)
				
					  guisystem.drawcursor(gra,cam)
					  drawblendscreen()
					  drawpause()
					  gra.swap()				
				      If game'vor dem laden zwingend!
				       game.deinit()
				       game=Null
				      EndIf
				      
				      game=loadgame(Self,cur_game)
				      messagestatusbar(strloaded,0.7,1500)
				      updatescene()
				     EndIf
				    EndIf
				    If guisystem.button=buttongamesave 
				     savegame(game)
				     buttongameload.fadein()
				     messagestatusbar(strsaved,0.7,1500)
				    EndIf
				    If guisystem.button If guisystem.button.index=42
				     showmenumain()
				     If game 
				      If game.ended
				       initgame(2,True)
				      EndIf
				     EndIf
				    EndIf
					If guisystem.button=buttongameoptions showmenuoptions(menuoptionslast,True,False)
			       EndIf
			      EndIf			
				 EndIf
				 '--------------------------------------------------------------------- animate
				 If menugametype.visible()=False	 
				  If gamepreview
				   gamepreview.deinit()
				   gamepreview=Null
				  EndIf		
				 EndIf			
				 clearlinklist()
				 animategame(cc)
				 animategamepreview()
				 animatemusic()
				 updatemenumain()
				 updatemenugame()		
				 If demoplay And gamepreview 
				  If gamepreview.animationlist.firstlink()=Null
				  Local nt#=clock.ms()
				  If (nt-demoplaylasttime)>1'500
				   demoplaylasttime=nt
				   gamepreview.autoplay()
				  EndIf
				  EndIf
				 EndIf		
				 '--------------------------------------------------------------- keyboard and application animation
				 If KeyHit(KEY_ESCAPE) 
				  If menumain.active()
				   keyraus=True
				   If game If game.inuse And confirmonquit
				    If abfrage(strquit,strnevermind,strisee,gra.screenw/2,gra.screenh/2,font14,iwindow240204)=False keyraus=False
				   EndIf
				  Else
				   If (menuoptionsacoustics.active() Or menuoptionsgraphics.active() Or menuoptionsgame.active() Or menuoptionscard.active() Or menuoptionscredits.active()) And optionscalledfromgame
					showmenugame()
				    If game game.allowpick=True
				   Else
				    showmenumain()
				    If game 
				     If game.ended
				      initgame(2,False)
				     EndIf
				    EndIf
				   EndIf
				  EndIf
				 EndIf
				 If animateapplication(True) 
				  keyraus=True
				  If game If game.inuse And confirmonquit
				   If abfrage(strquit,strnevermind,strisee,gra.screenw/2,gra.screenh/2,font14,iwindow240204)=False keyraus=False
				  EndIf
				 EndIf
				 '--------------------------------------------------------------------- draw
				
		
				 
				 drawstandard()
				Rem
 			  	 world.determinevertexlight()
  				 gra.enabletext2d()	
				 guisystem.drawbackground(gra,cam)
				 
 				 If buttonpanel And buttongamenew.visible
  				  SetBlend(SOLIDBLEND|MASKBLEND)
				  SetColor(255,255,255)
				  SetAlpha(buttongamenew.color.w)
				  DrawImageRect(ilederstreifen,0,0,141,768)
				 EndIf	
				 drawgame()	
				 guisystem.draw(gra,cam)
				
				 guisystem.drawcursor(gra,cam)
				 drawblendscreen()
				 drawpause()
				 gra.swap()
				EndRem
				
				
				
				
				 guisystem.nullstates()
				 If keyraus
				  If game game.deinit()
				  gra.deinit()
				  gra=Null
				  game=Null
				  savestatistics("sterlingstatistics.sol")
				  saveoptions("sterlingoptions.sol")				
				 EndIf				
				Until buttonraus Or keyraus 
				FlushKeys()
				Return(0)
				EndMethod


	
	EndType
'******************************************************************************************************************
'										M A I N F U N C T I O N
'******************************************************************************************************************
				Global solitaire:_solitairesterling=New _solitairesterling
				SetImageFont(solitaire.font24)				
				ShowMouse()
				solitaire.initgame(2)
				solitaire.mainloop()
				If solitaire.game solitaire.game.deinit
				If solitaire.gra solitaire.gra.deinit()
				solitaire.savestatistics("sterlingstatistics.sol")
				solitaire.saveoptions("sterlingoptions.sol")
				clearlinklist()
				EndGraphics

'------------------------------------------------------------------------------------------------------------------
			
				













