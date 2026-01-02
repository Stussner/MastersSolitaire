'Project : Solitaire
'Modul : main
'date of create : 16.10.2007
'date of change : 24.10.2007

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
'Include "strings_german.bmx"
Include "strings_english_corrected20081127.bmx"
Include "game.bmx"
Include "gametype.bmx"
Include "gameanimation.bmx"
Include "gamepile.bmx"
Include "environment.bmx"
Include "utils.bmx"
'--------------------------------------------------- include resources to exe file -------------------------------------------------------------
Rem
Incbin "..\daten\fantasy\scene\table_07_2048_1024.jpg"
Incbin "..\daten\fantasy\scene\table_07_2048_1024hl.jpg"
Incbin "..\daten\fantasy\scene\table_08_2048_1024.jpg"
Incbin "..\daten\fantasy\scene\table_08_2048_1024hl.jpg"

Incbin "..\daten\fantasy\scene\scene_02_0.jpg"
Incbin "..\daten\fantasy\scene\scene_02_1.jpg"
Incbin "..\daten\fantasy\scene\scene_02_2.jpg"

'Incbin "..\daten\fantasy\scene\masters00.jpg"
'Incbin "..\daten\fantasy\scene\masters01.jpg"
'Incbin "..\daten\fantasy\scene\masters02.jpg"
Incbin "..\daten\fantasy\scene\scene_00_fireplace_woodglow.tga"

Incbin "..\daten\fantasy\logo\logo04.tga"
Incbin "..\daten\fantasy\logo\Suricate_logo_big.jpg"
Incbin "..\daten\fantasy\logo\BFG_splash_1024x768.jpg"
Incbin "..\daten\fantasy\logo\Suricate_logo_small.tga"
Incbin "..\daten\fantasy\logo\BFG_logo_150x125.png"



Incbin "..\daten\fantasy\font\FAUS____.TTF"
Incbin "..\daten\fantasy\font\dauphinn.ttf"
Incbin "..\daten\fantasy\font\arial.ttf"

Incbin "..\daten\fantasy\effect\fire00.tga"
Incbin "..\daten\fantasy\effect\fire01.tga"
Incbin "..\daten\fantasy\effect\fire03.tga"
Incbin "..\daten\fantasy\effect\fire04.tga"
Incbin "..\daten\fantasy\effect\fire05.tga"
Incbin "..\daten\fantasy\effect\fire06.tga"
Incbin "..\daten\fantasy\effect\fire07.tga"
Incbin "..\daten\fantasy\effect\firecandle.tga"
Incbin "..\daten\fantasy\effect\wolke00.tga"
Incbin "..\daten\fantasy\effect\shadow00.tga"
Incbin "..\daten\fantasy\effect\shadow01.tga"
Incbin "..\daten\fantasy\effect\shadow16.tga"
Incbin "..\daten\fantasy\effect\shadow3232.tga"
Incbin "..\daten\fantasy\effect\corona00.tga"
Incbin "..\daten\fantasy\effect\corona06red.tga"
Incbin "..\daten\fantasy\effect\corona01blue.tga"
Incbin "..\daten\fantasy\effect\coronawhite.tga"
Incbin "..\daten\fantasy\effect\funken00.tga"
Incbin "..\daten\fantasy\effect\digit00.tga"
Incbin "..\daten\fantasy\effect\digit00h.tga"
Incbin "..\daten\fantasy\effect\digit00s.tga"
Incbin "..\daten\fantasy\effect\pendulum01.tga"
Incbin "..\daten\fantasy\scene\candleholder_menu.tga"
Incbin "..\daten\fantasy\scene\candleholder_game.tga"

Incbin "..\daten\fantasy\figure\prinzessin.tga"
Incbin "..\daten\fantasy\figure\dame.tga"
Incbin "..\daten\fantasy\figure\ritter.tga"
Incbin "..\daten\fantasy\figure\zauberer.tga"

Incbin "..\daten\fantasy\figure\fee.tga"
Incbin "..\daten\fantasy\figure\drachen.tga"
Incbin "..\daten\fantasy\figure\koenig.tga"
Incbin "..\daten\fantasy\figure\lehrerin.tga"

Incbin "..\daten\fantasy\figure\userprinzessin128.tga"
Incbin "..\daten\fantasy\figure\userdame2128.tga"
Incbin "..\daten\fantasy\figure\userritter128.tga"
Incbin "..\daten\fantasy\figure\userzauberer128.tga"

Incbin "..\daten\fantasy\figure\userfee128.tga"
Incbin "..\daten\fantasy\figure\userdrachen128.tga"
Incbin "..\daten\fantasy\figure\userkoenig128.tga"
Incbin "..\daten\fantasy\figure\userlehrerin128.tga"

Incbin "..\daten\fantasy\gui\window_512_750_3.tga"
Incbin "..\daten\fantasy\gui\window_950_950_13.tga"
Incbin "..\daten\fantasy\gui\window_512_256_3.tga"
Incbin "..\daten\fantasy\gui\window_256_256_3.tga"
Incbin "..\daten\fantasy\gui\window_950_550_5.tga"

Incbin "..\daten\fantasy\gui\guihelp_300_180.tga"
Incbin "..\daten\fantasy\gui\guihelp_512_80.tga"
Incbin "..\daten\fantasy\gui\guihelp_512_111.tga"
Incbin "..\daten\fantasy\gui\guihelp_512_180.tga"
Incbin "..\daten\fantasy\gui\guihelp_839_124.tga"
Incbin "..\daten\fantasy\gui\guihelp_850_93.tga"
Incbin "..\daten\fantasy\gui\guihelp_243_89.tga"

Incbin "..\daten\fantasy\gui\window_highscore.tga"
Incbin "..\daten\fantasy\gui\trackbar_button2.tga"
Incbin "..\daten\fantasy\gui\trackbar.tga"
Incbin "..\daten\fantasy\gui\check3.tga"
Incbin "..\daten\fantasy\gui\checkbox2.tga"
Incbin "..\daten\fantasy\gui\checkbox2_on.tga"
Incbin "..\daten\fantasy\gui\listbox_large.tga"
Incbin "..\daten\fantasy\gui\scrollbar.tga"
Incbin "..\daten\fantasy\gui\scrollbarbutton.tga"
Incbin "..\daten\fantasy\gui\scrollbarhorizontal.tga"
Incbin "..\daten\fantasy\gui\button_neu_large.tga"			
Incbin "..\daten\fantasy\gui\button_neu_large_on.tga"			
Incbin "..\daten\fantasy\gui\button_neu_large_son.tga"			
Incbin "..\daten\fantasy\gui\button_neu_medium.tga"			
Incbin "..\daten\fantasy\gui\button_neu_medium_on.tga"			
Incbin "..\daten\fantasy\gui\button_neu_medium_son.tga"			
Incbin "..\daten\fantasy\gui\button_neu_micro.tga"			
Incbin "..\daten\fantasy\gui\button_neu_micro_on.tga"			
Incbin "..\daten\fantasy\gui\button_neu_micro_son.tga"			
Incbin "..\daten\fantasy\gui\button_neu_small.tga"			
Incbin "..\daten\fantasy\gui\button_neu_small_on.tga"			
Incbin "..\daten\fantasy\gui\button_neu_small_son.tga"			
Incbin "..\daten\fantasy\gui\button_neu_smallmedium.tga"			
Incbin "..\daten\fantasy\gui\button_neu_smallmedium_on.tga"	
Incbin "..\daten\fantasy\gui\button_neu_smallmedium_son.tga"	
Incbin "..\daten\fantasy\gui\button_schatten.tga"	
Incbin "..\daten\fantasy\gui\button_schatten_on.tga"	
Incbin "..\daten\fantasy\gui\button_schatten_son.tga"	
Incbin "..\daten\fantasy\gui\button_vertical.png"		
Incbin "..\daten\fantasy\gui\button_vertical_hl.png"	
Incbin "..\daten\fantasy\gui\listbox_button_up.tga"	
Incbin "..\daten\fantasy\gui\listbox_button_down.tga"	


Incbin "..\daten\fantasy\gui\donut2.tga"
Incbin "..\daten\fantasy\gui\donutred.tga"
Incbin "..\daten\fantasy\gui\donutgreen.tga"
Incbin "..\daten\fantasy\gui\donutblue.tga"
Incbin "..\daten\fantasy\gui\rose3.tga"
Incbin "..\daten\fantasy\gui\rose4.tga"
Incbin "..\daten\fantasy\gui\rose05.tga"
Incbin "..\daten\fantasy\gui\black.tga"
Incbin "..\daten\fantasy\gui\frame2.tga"
Incbin "..\daten\fantasy\gui\frame3.tga"
Incbin "..\daten\fantasy\gui\verlauf_normalbereich.tga"

Incbin "..\daten\fantasy\game\pile00.tga"				
Incbin "..\daten\fantasy\game\empty.tga"					
Incbin "..\daten\fantasy\game\emptykey.tga"					
Incbin "..\daten\fantasy\game\symbol_suit0.tga"
Incbin "..\daten\fantasy\game\symbol_suit1.tga"
Incbin "..\daten\fantasy\game\symbol_suit2.tga"
Incbin "..\daten\fantasy\game\symbol_suit3.tga"
Incbin "..\daten\fantasy\game\symbol_suit0rand.tga"
Incbin "..\daten\fantasy\game\symbol_suit1rand.tga"
Incbin "..\daten\fantasy\game\symbol_suit2rand.tga"
Incbin "..\daten\fantasy\game\symbol_suit3rand.tga"
Incbin "..\daten\fantasy\game\symbolA.tga"
Incbin "..\daten\fantasy\game\symbolB.tga"
Incbin "..\daten\fantasy\game\symbolD.tga"
Incbin "..\daten\fantasy\game\symbolK.tga"
Incbin "..\daten\fantasy\game\symbol2.tga"
Incbin "..\daten\fantasy\game\symbol3.tga"
Incbin "..\daten\fantasy\game\symbol4.tga"
Incbin "..\daten\fantasy\game\symbol5.tga"
Incbin "..\daten\fantasy\game\symbol6.tga"
Incbin "..\daten\fantasy\game\symbol7.tga"
Incbin "..\daten\fantasy\game\symbol8.tga"
Incbin "..\daten\fantasy\game\symbol9.tga"
Incbin "..\daten\fantasy\game\symbol10.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbolA.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbolB.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbolD.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbolK.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbol2.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbol3.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbol4.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbol5.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbol6.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbol7.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbol8.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbol9.tga"
Incbin "..\daten\fantasy\game\symbolnumbersmall\symbol10.tga"
Incbin "..\daten\fantasy\game\symbolfine2.tga"
Incbin "..\daten\fantasy\game\symbolddd.tga"
Incbin "..\daten\fantasy\game\0.tga"
Incbin "..\daten\fantasy\game\1.tga"
Incbin "..\daten\fantasy\game\2.tga"
Incbin "..\daten\fantasy\game\3.tga"
Incbin "..\daten\fantasy\game\4.tga"
Incbin "..\daten\fantasy\game\5.tga"
Incbin "..\daten\fantasy\game\6.tga"
Incbin "..\daten\fantasy\game\7.tga"
Incbin "..\daten\fantasy\game\8.tga"
Incbin "..\daten\fantasy\game\9.tga"
Incbin "..\daten\fantasy\game\numbersmall\0.tga"
Incbin "..\daten\fantasy\game\numbersmall\1.tga"
Incbin "..\daten\fantasy\game\numbersmall\2.tga"
Incbin "..\daten\fantasy\game\numbersmall\3.tga"
Incbin "..\daten\fantasy\game\numbersmall\4.tga"
Incbin "..\daten\fantasy\game\numbersmall\5.tga"
Incbin "..\daten\fantasy\game\numbersmall\6.tga"
Incbin "..\daten\fantasy\game\numbersmall\7.tga"
Incbin "..\daten\fantasy\game\numbersmall\8.tga"
Incbin "..\daten\fantasy\game\numbersmall\9.tga"

Incbin "..\daten\sounds\turn01.ogg" 'fansol_card_deal01a.ogg
Incbin "..\daten\sounds\fansol_card_shuffle02cut.ogg" 'flip03.ogg" 'fansol_card_shuffle02cut.ogg"
Incbin "..\daten\sounds\card_single.ogg"
Incbin "..\daten\sounds\explosion2.ogg"
Incbin "..\daten\sounds\fantasol_fireplace.ogg"
Incbin "..\daten\sounds\fantasol_pendulum.ogg"
Incbin "..\daten\sounds\fantasol_clock_singlestroke_fadeout_low.ogg"
Incbin "..\daten\sounds\fantasol_clock_westminster_nofade_low.ogg"
Incbin "..\daten\sounds\gong.ogg"
Incbin "..\daten\sounds\spark.ogg"
Incbin "..\daten\sounds\spend.ogg"

Incbin "..\daten\musik\thinking.ogg"
Incbin "..\daten\musik\hopeful.ogg"
Incbin "..\daten\musik\sunshine_naive.ogg"

EndRem
'******************************************************************************************************************
'										F I G U R E D R A W E N T R Y
'******************************************************************************************************************
Type _figuredrawentry
	Field solitaire:_solitairefantasy=Null
	Field figure:_figure=Null
	Field link:TLink=Null
	Field pfadeopacity#=0
	Field pfadeopacitytime#=0
	Field pfadein=False
	Field pfadeout=False
	Field marked=0
	Method init(s:_solitairefantasy,f:_figure)
				solitaire=s
				link=solitaire.figuredrawlist.addlast(Self)
				figure=f
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
	Method draw(gra:_graphics,cam:_camera,op#)
				Local speed#=1
				figure.opacity=op*pfadeopacity
				figure.draw(gra,cam)
				Local fadetimenew=solitaire.clock.ms()
				Local ds#=(fadetimenew-pfadeopacitytime)*0.001
				pfadeopacitytime=fadetimenew				
				If pfadein
				 pfadeopacity:+speed*ds
				 If pfadeopacity>1
				  pfadeopacity=1
				  pfadein=False
				 EndIf
				EndIf
				If pfadeout
				 pfadeopacity:-speed*ds
				 If pfadeopacity<0
				  pfadeopacity=0
				  'pfadeout=False
				 EndIf
				EndIf					
				animate()
				EndMethod				
	Method animate()
				Local gedr=False
				If marked=2
				 If MouseDown(1)=False
				  If figure.inner()
				   gedr=True	
				   marked=0
				  Else
				   marked=0
				  EndIf
				 Else
				  If figure.inner()=False
				   marked=0
				  EndIf
				 EndIf
				EndIf
				If marked=1
				 If figure.inner()
				  If MouseDown(1)
				   marked=2
				  EndIf
				 Else
				  marked=0
				 EndIf
				EndIf				
				If marked=0
				 If figure.inner()
  				  marked=1
				 EndIf 
   			    EndIf				
				If(gedr) If(solitaire.menumain.active()) solitaire.showmenuuser()
				EndMethod				
	EndType
'******************************************************************************************************************
'										S O L I T A I R E F A N T A S Y 
'******************************************************************************************************************
Type _solitairefantasy Extends _solitaire
	
	
	'--------------------------------- figures ----------------------------------	
	Field sister:_figure=Null
	Field prinzessin:_figure=Null
	Field dame:_figure=Null
	Field ritter:_figure=Null
	Field zauberer:_figure=Null
	Field fee:_figure=Null;
	Field drachen:_figure=Null;
	Field koenig:_figure=Null;
	Field lehrerin:_figure=Null;

	Field isister:timage=Null
	Field iprinzessin:timage=Null	
	Field idame:timage=Null	
	Field iritter:timage=Null
	Field izauberer:timage=Null
	Field ifee:timage=Null;
	Field idrachen:timage=Null;
	Field ikoenig:timage=Null;
	Field ilehrerin:timage=Null;
	
	
	Field figuredrawlist:TList=CreateList()
	Field figureindexold:Int=-1
	

	
	
	Field uhr:_uhr=Null
	Field fireworkcards:_fireworkcards=Null
	Field fireworkrocket:_fireworkrocket=Null
	Field fireworkimage:_fireworkimage=Null
	Field candlegame:_candle[10]
	Field candlemenu:_candle[10]
	Field smokemenu:_smoke=Null



	'----------------------------------- gui ------------------------------
	Field buttonraus=False
	Field keyraus=False
	Field currentkey:Int=0
	Field marked:Int=0
	Field iguiwindow:timage=Null
	Field igametypewindow:timage=Null
	Field imessagewindow:timage=Null
	Field ilistboxwindow:timage=Null
	Field iverlaufwindow:timage=Null
	Field ihighscorewindow:timage=Null
	

	
	Field icheck:timage=Null
	Field inormalrange:timage=Null
	Field itrackbar:timage=Null
	Field itrackbarbutton:timage=Null
	Field itrackbarleft:timage=Null
	Field itrackbarright:timage=Null
	Field ilistboxl:timage=Null
	Field iscrollbar:timage=Null
	Field iscrollbarbutton:timage=Null
	Field iscrollbarhorizontal:timage=Null
	Field ibuttonu:TImage=Null
	Field ibuttonuhl:TImage=Null
	Field ibuttonuson:TImage=Null
	Field ibuttons:TImage=Null
	Field ibuttonshl:TImage=Null
	Field ibuttonsson:TImage=Null
	Field ibuttonm:TImage=Null
	Field ibuttonmhl:TImage=Null
	Field ibuttonmson:TImage=Null
	Field ibuttonl:TImage=Null
	Field ibuttonlhl:TImage=Null
	Field ibuttonlson:TImage=Null
	Field ibuttong:TImage=Null
	Field ibuttonghl:TImage=Null
	Field ibuttongson:TImage=Null
	Field icheckbox:timage=Null
	Field icheckboxhl:timage=Null
	Field imenubackground:timage=Null
	Field imenubackgrounda:timage=Null
	Field imenubackgroundl:timage[4]
	Field imenubackgroundglow:timage=Null
	Field ibuttonarrowloff:timage=Null
	Field ibuttonarrowlon:timage=Null
	Field ibuttonarrowroff:timage=Null
	Field ibuttonarrowron:timage=Null
	Field ibuttonarrowuoff:timage=Null
	Field ibuttonarrowuon:timage=Null
	Field ibuttonarrowdoff:timage=Null
	Field ibuttonarrowdon:timage=Null
	Field ilistboxbuttonup:timage=Null
	Field ilistboxbuttondown:timage=Null
	
	Field ilogo:timage=Null
	Field irose:timage=Null
	Field irosecredits:timage=Null
	Field isplashsurricate:timage=Null;
	Field isplashportal:timage=Null;
	Field ilogosurricate:timage=Null;
	Field ilogoportal:timage=Null;
	Field brandingstufe:Int=1;'0= unbranded (nur surricate), 1= surriacte+ bigfish , 2 = 
	
	Field idonutred:timage=Null
	Field idonutgreen:timage=Null
	Field idonutblue:timage=Null
	Field ibuttonshadow:timage=Null
	Field ibuttonshadowon:timage=Null
	Field ibuttonshadowson:timage=Null
	Field iblack:timage=Null
	Field iframe:timage=Null
	Field iframe2:timage=Null
	
	
	
	'---------------------------------------mainmenu
	Field buttonwidth#=226
	Field buttonheight#=72
	Field checkboxwidth#=34
	Field checkboxheight#=30
	Field checkboxoffy#=-10
	Field buttonstart:_guibutton=Null
	
	'Field windowstats:_guiwindow=Null
	'Field windowstatstype:_guitext=Null
	Field tmmcurgame:_guitext=Null
	Field tmmtime:_guitext=Null
	'Field windowfantasygametype:_guiwindow=Null
	Field windowfantasycard:_guiwindow=Null
	Field windowfantasyscene:_guiwindow=Null
	Field windowfantasymusic:_guiwindow=Null
	
	
	Field buttonmenumainplay:_guibutton=Null
	Field buttonmenumainplayer:_guibutton=Null
	Field textmenumainplayer:_guitext=Null
	Field buttonmenumaingametype:_guibutton=Null
	Field buttonmenumainstatistics:_guibutton=Null
	Field buttonmenumainscene:_guibutton=Null
	Field buttonmenumainoptions:_guibutton=Null
	Field buttonmenumainclose:_guibutton=Null
	Field windowhighscore:_guiwindow=Null
	Field textmenumainhighscorename:_guitext[5]
	Field textmenumainhighscorepoints:_guitext[5]
	Field textmenumainhighscoretime:_guitext[5]
	Field buttonmenumainhighscoreclear:_guibutton=Null
	
	Field windowstatisticsshort:_guiwindow=Null
	Field textstatisticsshortplayer:_guitext=Null
	Field textstatisticsshortcount:_guitext=Null
	Field textstatisticsshortquote:_guitext=Null
	
	
	
	Field tfarbekerzer:_guitext=Null
	Field tfarbekerzeg:_guitext=Null
	Field tfarbekerzeb:_guitext=Null
	Field tfarbeambienzr:_guitext=Null
	Field tfarbeambienzg:_guitext=Null
	Field tfarbeambienzb:_guitext=Null

	Field sfarbekerzer:_guitrackbar=Null
	Field sfarbekerzeg:_guitrackbar=Null
	Field sfarbekerzeb:_guitrackbar=Null
	Field sfarbeambienzr:_guitrackbar=Null
	Field sfarbeambienzg:_guitrackbar=Null
	Field sfarbeambienzb:_guitrackbar=Null
	
	Field guihelpinitmagicy#=0
	Field guihelpinitmagicw:_guiwindow=Null
	
	

	Method drawloadscreen(swap=True,op#=1)
				Local o:_vector3=New _vector3
				Local c:_vector4=New _vector4
				'If iloadscreen
				' SetBlend(SOLIDBLEND)
				' SetColor(255,255,255)
				' DrawImageRect(iloadscreen,0,0,gra.screenw,gra.screenh)
				'Else
				
				
				SetBlend(SOLIDBLEND|ALPHABLEND)
				SetAlpha(1-op);
				DrawImageRect(blendscreen,0,0,gra.screenw,gra.screenh);
				'EndIf
				SetImageFont(font24)
				'SetBlend(MASKBLEND|ALPHABLEND)
				SetAlpha(op);
				SetColor(0,0,0);
				DrawRect(0,0,gra.screenw,gra.screenh);
				SetColor(255,255,255);

				DrawImage(irose,gra.screenw/2-150,gra.screenh/2-100);
				'sheeploadindex:+1
				'If sheeploadindex>2 sheeploadindex=0
				Local h$=strsolitaireloading
				o.set(gra.screenw/2-TextWidth(h)/2-110,gra.screenh/2-TextHeight(h)/2-90,1)
				c.set(1,0.85,0.65,op)
				Drawguitext(h,o,c)
				SetImageFont(font18)
				h=strevaluationcopy
				o.set(gra.screenw/2-TextWidth(h)/2,gra.screenh-25,1)
				c.set(1,0.75,0.3,op)
				Drawguitext(h,o,c)
				If swap gra.swap(videosynchronisation)				
				EndMethod
	Method drawsplashsurricate(swap=True,op#=1)
				Local o:_vector3=New _vector3
				Local c:_vector4=New _vector4
				SetBlend(SOLIDBLEND|ALPHABLEND)
				SetAlpha(1-op);
				DrawImageRect(blendscreen,0,0,gra.screenw,gra.screenh);
				SetAlpha(op);
				SetColor(255,255,255);
				DrawImageRect(isplashsurricate,0,0,gra.screenw,gra.screenh);
				Local h$
				SetImageFont(font18);
				h=strloading;
				o.set(gra.screenw/2-TextWidth(h)/2,gra.screenh-25,1);
				c.set(1,1,1,op);
				Drawguitext(h,o,c);
				If swap gra.swap(videosynchronisation)	
				EndMethod
	Method drawsplashportal(swap=True,op#=1)
				Local o:_vector3=New _vector3
				Local c:_vector4=New _vector4
				SetBlend(SOLIDBLEND|ALPHABLEND)
				SetAlpha(1-op);
				DrawImageRect(blendscreen,0,0,gra.screenw,gra.screenh);
				SetAlpha(op);
				SetColor(255,255,255);
				DrawImageRect(isplashportal,0,0,gra.screenw,gra.screenh);
				Local h$
				SetImageFont(font18);
				h=strloading;
				o.set(gra.screenw/2-TextWidth(h)/2,gra.screenh-25,1);
				c.set(1,1,1,op);
				Drawguitext(h,o,c);
				If swap gra.swap(videosynchronisation)	
				EndMethod
	Method fadeinloadscreen()
				GrabImage(blendscreen,0,0)
				Local start#=clock.ms()
				Local op#=0
				Repeat
				 op=(clock.ms()-start)*0.001
				 If op>1 op=1
				 drawloadscreen(True,op)
				Until op=1
				EndMethod	

	Method fadeinsplashsurricate()
				GrabImage(blendscreen,0,0)
				Local start#=clock.ms()
				Local op#=0
				Repeat
				 op=(clock.ms()-start)*0.001
				 If op>1 op=1
				 drawsplashsurricate(True,op)
				Until op=1
				EndMethod	
	Method fadeinsplashportal()
				GrabImage(blendscreen,0,0)
				Local start#=clock.ms()
				Local op#=0
				Repeat
				 op=(clock.ms()-start)*0.001
				 If op>1 op=1
				 drawsplashportal(True,op)
				Until op=1
				EndMethod								
	Method loadimagefantasy:timage(name$,masked:Int=False)
				drawloadscreen()
				Return(loadimageassert(name,masked))
				EndMethod
	Method loadtexturefantasy:_texture(name$)				
				drawloadscreen()
				Return(loadtextureassert(name))
				EndMethod				

	'********************************************************************************************************************************************
	'Konstruktor für eingebundene Resorces
	'********************************************************************************************************************************************
	Rem

	Method New()
				brandingstufe=0;
				isplashsurricate=loadimageassert("Incbin::..\daten\fantasy\logo\Suricate_logo_big.jpg");
				isplashportal=loadimageassert("Incbin::..\daten\fantasy\logo\BFG_splash_1024x768.jpg");
				ilogosurricate=loadimageassert("Incbin::..\daten\fantasy\logo\Suricate_logo_small.tga");
				ilogoportal=loadimageassert("Incbin::..\daten\fantasy\logo\BFG_logo_150x125.png");
				font24=LoadImageFontassert("incbin::..\daten\fantasy\font\dauphinn.ttf",24,smoothfont)
				font18=LoadImageFontassert("incbin::..\daten\fantasy\font\dauphinn.ttf",18,smoothfont)
				irose=loadimageassert("Incbin::..\daten\fantasy\gui\rose3.tga")
				HideMouse();
				
				AppTitle=strcreditsfantasysolitaire
			
				loadoptions(strfileoptions)			
				Local act:_activity=New _activity	
				activitylist.addlast(act)

				For Local i=0 To 999
				 gametypeactive[i]=True
				Next
				gametypeactive[75]=False
				gametypeactive[76]=False
				guisystem=New _guisystem
				guisystem.init(1024,768)
				guisystem.background[0].clear()
			'fullscreen=False								
				graphics_setup(0)
				gra.enabletext2d()
				blendscreen=CreateImage(gra.screenw,gra.screenh,1,DYNAMICIMAGE)
				clock=New _clock
				
				SetClsColor(0,0,0)
				Cls
				
				'fadeinsplashsurricate()
				fadeinloadscreen();
				gamestats=New _gamestats[gametypecount]
				loadstatistics(strfilestatistics)				
				volumesound=0.3
				SetMaskColor(255,100,254)

				menuopacity2=1
				cardtexturefrontcount=3
				cardtexturebackcount=6
				scenecount=1
				musiccount=3
				'For Local j=0 To scenecount-1
				' sceneambient[j]=New _vector3
				' scenediffuse[j]=New _vector3
				'Next
			
				'sparkingmouse=False
				usermanagement=New _usermanagement
				usermanagement.init(strfileusers,"Fantasy Solitaire Users")
				usermanagement.image[0]=LoadImageassert("Incbin::..\daten\fantasy\figure\userprinzessin128.tga")
				usermanagement.image[1]=LoadImageassert("Incbin::..\daten\fantasy\figure\userdame2128.tga")
				usermanagement.image[2]=LoadImageassert("Incbin::..\daten\fantasy\figure\userritter128.tga")
				usermanagement.image[3]=LoadImageassert("Incbin::..\daten\fantasy\figure\userzauberer128.tga")
				usermanagement.image[4]=LoadImageassert("Incbin::..\daten\fantasy\figure\userfee128.tga")
				usermanagement.image[5]=LoadImageassert("Incbin::..\daten\fantasy\figure\userdrachen128.tga")
				usermanagement.image[6]=LoadImageassert("Incbin::..\daten\fantasy\figure\userkoenig128.tga")
				usermanagement.image[7]=LoadImageassert("Incbin::..\daten\fantasy\figure\userlehrerin128.tga")
				usermanagement.imagecount=8
				backgroundcolor=New _Vector4
				backgroundcolor.set(255,255,255,1)
				world=New _world	
				world.lightambient.copy(farbeambienz)
				
				updatescene()
				cam=New _camerasolitaire
				mousevector=New _vector3
				
				'-----------------------------------------  font load -----------------------------------------------------------
				'font=LoadImageFontassert("Incbin::..\daten\fantasy\font\FAUS____.TTF", 100, SMOOTHFONT)
				font30=LoadImageFontassert("incbin::..\daten\fantasy\font\dauphinn.ttf",30,smoothfont)
				font14=LoadImageFontassert("incbin::..\daten\fantasy\font\dauphinn.ttf",14,smoothfont)
				font16=LoadImageFontassert("incbin::..\daten\fantasy\font\dauphinn.ttf",16,smoothfont)
				font10=LoadImageFontassert("incbin::..\daten\fantasy\font\dauphinn.ttf",10,smoothfont)
				'fontarial18=LoadImageFontassert("Incbin::..\daten\fantasy\font\arial.ttf", 18, SMOOTHFONT)
				'fontarial16=LoadImageFontassert("Incbin::..\daten\fantasy\font\arial.ttf", 16, SMOOTHFONT)
				'----------------------------------------- gui load -------------------------------------------------------------
				iguiwindow=loadimageassert("Incbin::..\daten\fantasy\gui\window_512_750_3.tga")
				igametypewindow=loadimageassert("Incbin::..\daten\fantasy\gui\window_950_950_13.tga")
				imessagewindow=loadimageassert("Incbin::..\daten\fantasy\gui\window_512_256_3.tga")
				ilistboxwindow=loadimageassert("Incbin::..\daten\fantasy\gui\window_256_256_3.tga")
				iverlaufwindow=loadimageassert("Incbin::..\daten\fantasy\gui\window_950_550_5.tga")
				ihighscorewindow=ilistboxwindow'loadimageassert("Incbin::..\daten\fantasy\gui\window_highscore.tga")

				iguihelp300180=loadimageassert("Incbin::..\daten\fantasy\gui\guihelp_300_180.tga")
				iguihelp51280=loadimageassert("Incbin::..\daten\fantasy\gui\guihelp_512_80.tga")
				iguihelp512111=loadimageassert("Incbin::..\daten\fantasy\gui\guihelp_512_111.tga")
				iguihelp512180=loadimageassert("Incbin::..\daten\fantasy\gui\guihelp_512_180.tga")
				iguihelp839124=loadimageassert("Incbin::..\daten\fantasy\gui\guihelp_839_124.tga")
				iguihelp85093=loadimageassert("Incbin::..\daten\fantasy\gui\guihelp_850_93.tga")
				iguihelp24389=loadimageassert("Incbin::..\daten\fantasy\gui\guihelp_243_89.tga")


				ibuttonshadow=loadimageassert("Incbin::..\daten\fantasy\gui\button_schatten.tga")
				ibuttonshadowon=loadimageassert("Incbin::..\daten\fantasy\gui\button_schatten_on.tga")
				ibuttonshadowson=loadimageassert("Incbin::..\daten\fantasy\gui\button_schatten_son.tga")
				icheck=loadimageassert("Incbin::..\daten\fantasy\gui\check3.tga")
				idonut=loadimageassert("Incbin::..\daten\fantasy\gui\donut2.tga")
				idonutred=loadimageassert("Incbin::..\daten\fantasy\gui\donutred.tga")
				idonutgreen=loadimageassert("Incbin::..\daten\fantasy\gui\donutgreen.tga")
				idonutblue=loadimageassert("Incbin::..\daten\fantasy\gui\donutblue.tga")
				iblack=loadimageassert("Incbin::..\daten\fantasy\gui\black.tga")
				iframe=loadimageassert("Incbin::..\daten\fantasy\gui\frame3.tga")
				iframe2=loadimageassert("Incbin::..\daten\fantasy\gui\frame2.tga")
				irosecredits=loadimageassert("Incbin::..\daten\fantasy\gui\rose05.tga")


				inormalrange=loadimageassert("Incbin::..\daten\fantasy\gui\verlauf_normalbereich.tga")
				itrackbar=loadimageassert("Incbin::..\daten\fantasy\gui\trackbar.tga")
				itrackbarbutton=loadimageassert("Incbin::..\daten\fantasy\gui\trackbar_button2.tga")
				ilistboxl=loadimageassert("Incbin::..\daten\fantasy\gui\listbox_large.tga")
				iscrollbar=loadimageassert("Incbin::..\daten\fantasy\gui\scrollbar.tga")
				iscrollbarbutton=loadimageassert("Incbin::..\daten\fantasy\gui\scrollbarbutton.tga")
				iscrollbarhorizontal=loadimageassert("Incbin::..\daten\fantasy\gui\scrollbarhorizontal.tga")
			    ibuttong=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_large.tga")
				ibuttonghl=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_large_on.tga")
				ibuttongson=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_large_son.tga")
			    ibuttonl=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_medium.tga")
				ibuttonlhl=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_medium_on.tga")
				ibuttonlson=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_medium_son.tga")
				ibuttonm=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_smallmedium.tga")
				ibuttonmhl=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_smallmedium_on.tga")
				ibuttonmson=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_smallmedium_son.tga")
				ibuttons=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_small.tga")
				ibuttonshl=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_small_on.tga")
				ibuttonsson=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_small_son.tga")
				ibuttonu=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_micro.tga")
				ibuttonuhl=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_micro_on.tga")
				ibuttonuson=LoadImageassert("incbin::..\daten\fantasy\gui\button_neu_micro_son.tga")
				icheckbox=LoadImageassert("incbin::..\daten\fantasy\gui\checkbox2.tga")
				icheckboxhl=LoadImageassert("incbin::..\daten\fantasy\gui\checkbox2_on.tga")
				ilistboxbuttonup=LoadImageassert("incbin::..\daten\fantasy\gui\listbox_button_up.tga")
				ilistboxbuttondown=LoadImageassert("incbin::..\daten\fantasy\gui\listbox_button_down.tga")
				'-------------------------------------------- sound load --------------------------------------------------------
				smove=loadsoundassert("Incbin::..\daten\sounds\fansol_card_shuffle02cut.ogg") 'flip03.ogg")' neu ueberarbeitet ...fansol_card_shuffle02cut.ogg")	
				sturn=loadsoundassert("Incbin::..\daten\sounds\turn01.ogg")' neu ueberarbeitet ...fansol_card_deal01a.ogg
				scardsingle=loadsoundassert("Incbin::..\daten\sounds\card_single.ogg")					
				sexplosion[0]=loadsoundassert("Incbin::..\daten\sounds\explosion2.ogg")					
				sfireplace=loadsoundassert("Incbin::..\daten\sounds\fantasol_fireplace.ogg",True)					
				spendulum=loadsoundassert("Incbin::..\daten\sounds\fantasol_pendulum.ogg")					
				suhrschlag0=loadsoundassert("Incbin::..\daten\sounds\fantasol_clock_singlestroke_fadeout_low.ogg")					
				suhrschlagstunde=loadsoundassert("Incbin::..\daten\sounds\fantasol_clock_westminster_nofade_low.ogg")					
				sgong=loadsoundassert("Incbin::..\daten\sounds\gong.ogg")	'neu ueberarbeitet				
				sspark=loadsoundassert("Incbin::..\daten\sounds\spark.ogg")			
				sspend=loadsoundassert("Incbin::..\daten\sounds\spend.ogg")		
				'-------------------------------------------- figure load ------------------------------------------------------
				'isister=LoadImageassert("Incbin::..\daten\fantasy\figure\sister.tga")
				iprinzessin=LoadImageassert("Incbin::..\daten\fantasy\figure\prinzessin.tga")
				idame=LoadImageassert("Incbin::..\daten\fantasy\figure\dame.tga")
				iritter=LoadImageassert("Incbin::..\daten\fantasy\figure\ritter.tga")
				izauberer=LoadImageassert("Incbin::..\daten\fantasy\figure\zauberer.tga")
				ifee=LoadImageassert("Incbin::..\daten\fantasy\figure\fee.tga")
				idrachen=LoadImageassert("Incbin::..\daten\fantasy\figure\drachen.tga")
				ikoenig=LoadImageassert("Incbin::..\daten\fantasy\figure\koenig.tga")
				ilehrerin=LoadImageassert("Incbin::..\daten\fantasy\figure\lehrerin.tga")


				'tsister=New _texture
				'tsister.init("Incbin::..\daten\images\FX\sister.tga")
				'sister=New _figure
				'sister.Init(Self,isister,0.015,0.405)
				
				prinzessin=New _figure
				prinzessin.Init(Self,iprinzessin,0.188,0.5257);
				dame=New _figure
				dame.Init(Self,idame,0.167,0.494);
				ritter=New _figure
				ritter.Init(Self,iritter,0.1760,0.4930);
				zauberer=New _figure
				zauberer.Init(Self,izauberer,0.1786,0.4451);

				fee=New _figure
				fee.Init(Self,ifee,0.1114,0.355);
				drachen=New _figure
				drachen.Init(Self,idrachen,0.02291,0.2798);
				koenig=New _figure
				koenig.Init(Self,ikoenig,0.1911,0.5562);
				lehrerin=New _figure
				lehrerin.Init(Self,ilehrerin,0.191,0.507);

				
				'---------------------------------------------- scene and logo load --------------------------------------------
				ilogo=LoadImageassert("Incbin::..\daten\fantasy\logo\logo04.tga")
				If greenboard
				 tbackgroundgamea=New _texture
				 tbackgroundgamea.init("Incbin::..\daten\fantasy\scene\table_08_2048_1024.jpg")
				 tbackgroundgamel=New _texture
				 tbackgroundgamel.init("Incbin::..\daten\fantasy\scene\table_08_2048_1024hl.jpg")
				Else
				 tbackgroundgamea=New _texture
				 tbackgroundgamea.init("Incbin::..\daten\fantasy\scene\table_07_2048_1024.jpg")
				 tbackgroundgamel=New _texture
				 tbackgroundgamel.init("Incbin::..\daten\fantasy\scene\table_07_2048_1024hl.jpg")
				EndIf
				'imenubackground=LoadImageassert("Incbin::..\daten\fantasy\scene\background_menu3_test.jpg")
				'imenubackgroundl[0]=LoadImageassert("Incbin::..\daten\fantasy\scene\background alone.png")
				'imenubackgrounda=LoadImageassert("Incbin::..\daten\fantasy\scene\Background alone AMBIENT Only.png")
				Local fn$
				Local h$
				For Local n=0 To 2
				 fn="scene\scene_02_"+n+".jpg"
				 If fileexists(fn)
				  imenubackgroundl[n]=LoadImageassert(fn)
				 Else
			 	 ' imenubackgroundl[n]=LoadImageassert("Incbin::..\daten\fantasy\scene\masters0"+n+".jpg")
				  imenubackgroundl[n]=LoadImageassert("Incbin::..\daten\fantasy\scene\scene_02_"+n+".jpg")
			     EndIf
				Next
				imenubackgroundglow=LoadImageassert("Incbin::..\daten\fantasy\scene\scene_00_fireplace_woodglow.tga")
				icandleholdermenu=LoadImageassert("Incbin::..\daten\fantasy\scene\candleholder_menu.tga")
				icandleholdergame=LoadImageassert("Incbin::..\daten\fantasy\scene\candleholder_game.tga")
				'imenubackgroundl[2]=LoadImageassert("Incbin::..\daten\play\Background_B2.png")
				'imenubackgroundl[3]=LoadImageassert("Incbin::..\daten\play\Background_B3.png")
				'--------------------------------------------- game texture load ---------------------------------------------
				tempty=New _texture
				tempty.init("Incbin::..\daten\fantasy\game\empty.tga")
				temptykey=New _texture
				temptykey.init("Incbin::..\daten\fantasy\game\emptykey.tga")
				'drawloadscreen()
				tsymbolsuit[0]=New _texture
				tsymbolsuit[0].init("Incbin::..\daten\fantasy\game\symbol_suit0.tga")
				'drawloadscreen()
				tsymbolsuit[1]=New _texture
				tsymbolsuit[1].init("Incbin::..\daten\fantasy\game\symbol_suit1.tga")
				'drawloadscreen()
				tsymbolsuit[2]=New _texture
				tsymbolsuit[2].init("Incbin::..\daten\fantasy\game\symbol_suit2.tga")
				'drawloadscreen()
				tsymbolsuit[3]=New _texture
				tsymbolsuit[3].init("Incbin::..\daten\fantasy\game\symbol_suit3.tga")
				'drawloadscreen()
				pmsymbolsuit[0]=LoadPixmap("Incbin::..\daten\fantasy\game\symbol_suit0.tga")
				pmsymbolsuit[1]=LoadPixmap("Incbin::..\daten\fantasy\game\symbol_suit1.tga")
				pmsymbolsuit[2]=LoadPixmap("Incbin::..\daten\fantasy\game\symbol_suit2.tga")
				pmsymbolsuit[3]=LoadPixmap("Incbin::..\daten\fantasy\game\symbol_suit3.tga")
				pmsymbolsuitrand[0]=LoadPixmap("Incbin::..\daten\fantasy\game\symbol_suit0rand.tga")
				pmsymbolsuitrand[1]=LoadPixmap("Incbin::..\daten\fantasy\game\symbol_suit1rand.tga")
				pmsymbolsuitrand[2]=LoadPixmap("Incbin::..\daten\fantasy\game\symbol_suit2rand.tga")
				pmsymbolsuitrand[3]=LoadPixmap("Incbin::..\daten\fantasy\game\symbol_suit3rand.tga")
				'drawloadscreen()
				
				
				
				tsymbolnumber[0]=New _texture
				tsymbolnumber[0].init("Incbin::..\daten\fantasy\game\symbolA.tga")
				'drawloadscreen()
				tsymbolnumber[1]=New _texture
				tsymbolnumber[1].init("Incbin::..\daten\fantasy\game\symbol2.tga")
				'drawloadscreen()
				tsymbolnumber[2]=New _texture
				tsymbolnumber[2].init("Incbin::..\daten\fantasy\game\symbol3.tga")
				'drawloadscreen()
				tsymbolnumber[3]=New _texture
				tsymbolnumber[3].init("Incbin::..\daten\fantasy\game\symbol4.tga")
				'drawloadscreen()
				tsymbolnumber[4]=New _texture
				tsymbolnumber[4].init("Incbin::..\daten\fantasy\game\symbol5.tga")
				'drawloadscreen()
				tsymbolnumber[5]=New _texture
				tsymbolnumber[5].init("Incbin::..\daten\fantasy\game\symbol6.tga")
				'drawloadscreen()
				tsymbolnumber[6]=New _texture
				tsymbolnumber[6].init("Incbin::..\daten\fantasy\game\symbol7.tga")
				'drawloadscreen()
				tsymbolnumber[7]=New _texture
				tsymbolnumber[7].init("Incbin::..\daten\fantasy\game\symbol8.tga")
				'drawloadscreen()
				tsymbolnumber[8]=New _texture
				tsymbolnumber[8].init("Incbin::..\daten\fantasy\game\symbol9.tga")
				'drawloadscreen()
				tsymbolnumber[9]=New _texture
				tsymbolnumber[9].init("Incbin::..\daten\fantasy\game\symbol10.tga")
				'drawloadscreen()
				tsymbolnumber[10]=New _texture
				tsymbolnumber[10].init("Incbin::..\daten\fantasy\game\symbolB.tga")
				'drawloadscreen()
				tsymbolnumber[11]=New _texture
				tsymbolnumber[11].init("Incbin::..\daten\fantasy\game\symbolD.tga")
				'drawloadscreen()
				tsymbolnumber[12]=New _texture
				tsymbolnumber[12].init("Incbin::..\daten\fantasy\game\symbolK.tga")
				'drawloadscreen()
				
				tsymbolnumbersmall[0]=New _texture
				tsymbolnumbersmall[0].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbolA.tga")
				'drawloadscreen()
				tsymbolnumbersmall[1]=New _texture
				tsymbolnumbersmall[1].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbol2.tga")
				'drawloadscreen()
				tsymbolnumbersmall[2]=New _texture
				tsymbolnumbersmall[2].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbol3.tga")
				'drawloadscreen()
				tsymbolnumbersmall[3]=New _texture
				tsymbolnumbersmall[3].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbol4.tga")
				'drawloadscreen()
				tsymbolnumbersmall[4]=New _texture
				tsymbolnumbersmall[4].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbol5.tga")
				'drawloadscreen()
				tsymbolnumbersmall[5]=New _texture
				tsymbolnumbersmall[5].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbol6.tga")
				'drawloadscreen()
				tsymbolnumbersmall[6]=New _texture
				tsymbolnumbersmall[6].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbol7.tga")
				'drawloadscreen()
				tsymbolnumbersmall[7]=New _texture
				tsymbolnumbersmall[7].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbol8.tga")
				'drawloadscreen()
				tsymbolnumbersmall[8]=New _texture
				tsymbolnumbersmall[8].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbol9.tga")
				'drawloadscreen()
				tsymbolnumbersmall[9]=New _texture
				tsymbolnumbersmall[9].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbol10.tga")
				'drawloadscreen()
				tsymbolnumbersmall[10]=New _texture
				tsymbolnumbersmall[10].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbolB.tga")
				'drawloadscreen()
				tsymbolnumbersmall[11]=New _texture
				tsymbolnumbersmall[11].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbolD.tga")
				'drawloadscreen()
				tsymbolnumbersmall[12]=New _texture
				tsymbolnumbersmall[12].init("Incbin::..\daten\fantasy\game\symbolnumbersmall\symbolK.tga")
				'drawloadscreen()				
				
				tsymbolfine=New _texture
				tsymbolfine.init("Incbin::..\daten\fantasy\game\symbolfine2.tga")
				'drawloadscreen()
				tsymbolddd=New _texture
				tsymbolddd.init("Incbin::..\daten\fantasy\game\symbolddd.tga")
				'drawloadscreen()




				For Local m=0 To 9 				
				 tnumber[m]=New _texture
				 tnumber[m].init("Incbin::..\daten\fantasy\game\"+m+".tga")
				' drawloadscreen()
				 tnumbersmall[m]=New _texture
				 tnumbersmall[m].init("Incbin::..\daten\fantasy\game\numbersmall\"+m+".tga")
				' drawloadscreen()
				Next
				
				
				'tcardspecular=New _texture
				'tcardspecular.init("Incbin::..\daten\fantasy\game\card_fs_specular.tga")
				'tblase=New _texture
				'tblase.init("Incbin::..\daten\fantasy\game\blase.tga")
				'drawloadscreen()				

				'------------------------------------------------------ load background and effects ------------------------------------------
				tfeuer=New _texture
				tfeuer.init("Incbin::..\daten\fantasy\effect\fire01.tga")
				tfeuer2=New _texture
				tfeuer2.init("Incbin::..\daten\fantasy\effect\fire03.tga")
				tfeuer3=New _texture
				tfeuer3.init("Incbin::..\daten\fantasy\effect\fire04.tga")
				tfeuer4=New _texture
				tfeuer4.init("Incbin::..\daten\fantasy\effect\fire05.tga")
				tfeuer5=New _texture
				tfeuer5.init("Incbin::..\daten\fantasy\effect\fire06.tga")
				tfeuer6=New _texture
				tfeuer6.init("Incbin::..\daten\fantasy\effect\fire07.tga")
				tfeuercandle=New _texture
				tfeuercandle.init("Incbin::..\daten\fantasy\effect\firecandle.tga")
				tsmoke[0]=New _texture
				tsmoke[0].init("Incbin::..\daten\fantasy\effect\wolke00.tga")
				tshadow=New _texture
				tshadow.init("Incbin::..\daten\fantasy\effect\shadow3232.tga")
				tshadow16=New _texture
				tshadow16.init("Incbin::..\daten\fantasy\effect\shadow16.tga")
				tcorona=New _texture
				tcorona.init("Incbin::..\daten\fantasy\effect\corona00.tga")
				tcoronared=New _texture
				tcoronared.init("Incbin::..\daten\fantasy\effect\corona06red.tga")
				tcoronablue=New _texture
				tcoronablue.init("Incbin::..\daten\fantasy\effect\corona01blue.tga")
				tcoronawhite=New _texture
				tcoronawhite.init("Incbin::..\daten\fantasy\effect\coronawhite.tga")
				tfunken[0]=New _texture
				tfunken[0].init("Incbin::..\daten\fantasy\effect\funken00.tga")
				tdigit=New _texture
				tdigit.init("Incbin::..\daten\fantasy\effect\digit00.tga")
				tdigith=New _texture
				tdigith.init("Incbin::..\daten\fantasy\effect\digit00h.tga")
				tdigits=New _texture
				tdigits.init("Incbin::..\daten\fantasy\effect\digit00s.tga")
				tpendulum=New _texture
				tpendulum.init("Incbin::..\daten\fantasy\effect\pendulum01.tga")

				background=New _background
				background.init(Self)
				
				uhr=New _uhr
				uhr.init(Self)
				kamin=New _kamin2
				kamin.init(Self,2,1,0,1.5,particlemenulist)
				
				

				
				'------------------------------------------------------- effect candles ------------------------------------------------------
				candlegame[0]=createcandle(candlegamelist,-14.6,5.85,-7,5000,4,2.3,particlegamelist)
				candlegame[1]=createcandle(candlegamelist,12.3,9.6,-8,5000,4,2.0,particlegamelist)
				candlegame[1].sparked=True		

			'	candlegame[2]=createcandle(candlegamelist,3,7,-9,5000,4,2.0,particlegamelist)
		'		candlegame[3]=createcandle(candlegamelist,-1,7,-8,5000,4,2.0,particlegamelist)

				'r[0,0]=-13
				'r[0,1]=-14
				'r[1,0]=19
				'r[1,1]=11				
				'candlegame[0]=createcandle(candlegamelist,-13.2,-12.5,0,5000,2.5,1.6,particlegamelist)
				'candlegame[1]=createcandle(candlegamelist,18.5,10,0,5000,2.5,1.6,particlegamelist)
				'candlegame[1].sparked=True		
				
				candlemenu[1]=createcandle(candlemenulist,-0.7-1.145,2-0.30+0.7,-10,5000,1,0.7,particlemenulist)
				candlemenu[1].flamme.activate()
				candlemenu[0]=createcandle(candlemenulist,0.08-1.3,2.2+0.7,-10,5000,1,0.7,particlemenulist)
				candlemenu[0].flamme.activate()
				candlemenu[2]=createcandle(candlemenulist,+0.85-1.4,2-0.24+0.7,-10,5000,1,0.7,particlemenulist)
				candlemenu[2].flamme.activate()
				candlemenu[2]=createcandle(candlemenulist,+3-0.35,3.5,-8.5,5000,1,0.7,particlemenulist)
				candlemenu[2].flamme.activate()
				'smokemenu=New _smoke
				'smokemenu.initsmoke(Self,10.7,3.2,-5,5000,1,0.5,particlemenulist,True)
				candlemenu[3]=createcandle(candlemenulist,10.5,4.55,-5,5000,1,0.7,particlemenulist)
				candlemenu[3].flamme.activate()
			
				For Local cit:_candle=EachIn candlegamelist
				 cit.lightcolor.copy(farbekerze)
				Next				
				For Local cit:_candle=EachIn candlemenulist
				 cit.flamme.gfieldforcehomogen.set(0,-1,0)
				Next
				'------------------------------------------------- cardset source load and generation --------------------------------
				cardsetmanager=New _cardsetmanager
				cardsetmanager.init(Self)
			    
				
			cardsetmanager.Load("cardsets")
			'generatestandardcardset("cardsets")
				
				cardsetmanager.createhardwaresourcesurfaces(gra)
				'cardsetmanager.cleartexturehardwaresources()
				cardsetmanager.generatetexturepreviewall(gra)
				cardsetmanager.cleartexturehardwaresources()
				cardsetmanager.generatetexture(gra)
				cardsetmanager.cleartexturehardwaresources()
				
				
				
				If(brandingstufe=0) fadeinloadscreen(); Else fadeinsplashportal();
				'--------------------------------------------------- music load ---------------------------------------------------------------
				
				'musicman=New _musicmanagement
				'musicman.init(clock,2)
				'musicman.playtime[0]=(3*60*1000+ 30*1000)*2-10000
				'musicman.playtime[1]=70582*2-10000
				'musicman.file[0]="Incbin::..\daten\musik\02 - Windfall.ogg"
				'musicman.file[1]="Incbin::..\daten\sheepworld\musik\sheepworldsolitaire03.ogg"		
				'musicman.loadsounds()
				'musicman.play(0,False,True)

				musicman=New _musicmanagement
				musicman.init(clock,3)
				musicman.playtime[0]=204177'62922*2-10000
				musicman.playtime[1]=207137'70582*2-10000
				musicman.playtime[2]=137272'69178*2-10000
				musicman.file[0]="Incbin::..\daten\musik\thinking.ogg"
				musicman.file[1]="Incbin::..\daten\musik\hopeful.ogg"
				musicman.file[2]="Incbin::..\daten\musik\sunshine_naive.ogg"		
				musicman.loadsounds()
				musicman.play(0,False,True)				
				'---------------------------------------------------- win effects ------------------------------------------------------
				fireworkcards=New _fireworkcards
				fireworkcards.initfireworkcards(Self,world,particlesourcegamelist,particlegamelist,clock)
				fireworkrocket=New _fireworkrocket
				fireworkrocket.initfireworkrocket(Self,world,particlesourcegamelist,particlegamelist,clock)
				fireworkimage=New _fireworkimage
				fireworkimage.initfireworkimage(Self,world,particlesourcegamelist,particlegamelist,clock)				
				'------------------------------------------------- create gui --------------------------------------------------------
				gra.enabletext2d()
				createmenugametypehelp()
				createmenugametype()
				createmenumain()
				createmenugame()
				createmenuscene()
				createmenuoptionsacoustics()
				createmenuoptionsgraphics()
				createmenuoptionsgame()
				createmenuoptionscard()
				createmenuoptionscardfront()
				createmenuoptionscredits()		
				createmenuuser()
				createmenuusercreate()
				createmenustatistics()
				createmenuranks()
				createmenucardgenerator()
				updatemenumain()
				menuoptionslast=menuoptionsacoustics
				'------------------------------------------------ blendscreen init ---------------------------------------------------
				ShowMouse();
				
				
				EndMethod
	EndRem

	'********************************************************************************************************************************************
	'Konstruktor für offene Resorces
	'********************************************************************************************************************************************


	Method New()
				brandingstufe=0;
				'isplashsurricate=loadimageassert("..\daten\fantasy\logo\Suricate_logo_big.jpg");
				'isplashportal=loadimageassert("..\daten\fantasy\logo\BFG_splash_1024x768.jpg");
				'ilogosurricate=loadimageassert("..\daten\fantasy\logo\Suricate_logo_small.tga");
				'ilogoportal=loadimageassert("..\daten\fantasy\logo\BFG_logo_150x125.png");
				font24=LoadImageFontassert("..\daten\fantasy\font\dauphinn.ttf",24,smoothfont)
				font18=LoadImageFontassert("..\daten\fantasy\font\dauphinn.ttf",18,smoothfont)
				irose=loadimageassert("..\daten\fantasy\gui\rose3.tga")
				HideMouse();
				
				AppTitle=strcreditsfantasysolitaire
			
				loadoptions(strfileoptions)			
				Local act:_activity=New _activity	
				activitylist.addlast(act)

				For Local i=0 To 999
				 gametypeactive[i]=True
				Next
		'		gametypeactive[75]=False
	'			gametypeactive[76]=False
				guisystem=New _guisystem
				guisystem.init(1024,768)
				guisystem.background[0].clear()
			'fullscreen=False								
				graphics_setup(0)
				gra.enabletext2d()
				blendscreen=CreateImage(gra.screenw,gra.screenh,1,DYNAMICIMAGE)
				clock=New _clock
				
				SetClsColor(0,0,0)
				Cls
				
				'fadeinsplashsurricate()
				fadeinloadscreen();
				gamestats=New _gamestats[gametypecount]
				loadstatistics(strfilestatistics)				
				volumesound=0.3
				SetMaskColor(255,100,254)

				menuopacity2=1
				cardtexturefrontcount=3
				cardtexturebackcount=6
				scenecount=1
				musiccount=3
				'For Local j=0 To scenecount-1
				' sceneambient[j]=New _vector3
				' scenediffuse[j]=New _vector3
				'Next
			
				'sparkingmouse=False
				usermanagement=New _usermanagement
				usermanagement.init(strfileusers,"Fantasy Solitaire Users")
				usermanagement.image[0]=LoadImageassert("..\daten\fantasy\figure\userprinzessin128.tga")
				usermanagement.image[1]=LoadImageassert("..\daten\fantasy\figure\userdame2128.tga")
				usermanagement.image[2]=LoadImageassert("..\daten\fantasy\figure\userritter128.tga")
				usermanagement.image[3]=LoadImageassert("..\daten\fantasy\figure\userzauberer128.tga")
				usermanagement.image[4]=LoadImageassert("..\daten\fantasy\figure\userfee128.tga")
				usermanagement.image[5]=LoadImageassert("..\daten\fantasy\figure\userdrachen128.tga")
				usermanagement.image[6]=LoadImageassert("..\daten\fantasy\figure\userkoenig128.tga")
				usermanagement.image[7]=LoadImageassert("..\daten\fantasy\figure\userlehrerin128.tga")
				usermanagement.imagecount=8
				backgroundcolor=New _Vector4
				backgroundcolor.set(255,255,255,1)
				world=New _world	
				world.lightambient.copy(farbeambienz)
				
				updatescene()
				cam=New _camerasolitaire
				mousevector=New _vector3
				
				'-----------------------------------------  font load -----------------------------------------------------------
				'font=LoadImageFontassert("..\daten\fantasy\font\FAUS____.TTF", 100, SMOOTHFONT)
				font30=LoadImageFontassert("..\daten\fantasy\font\dauphinn.ttf",30,smoothfont)
				font14=LoadImageFontassert("..\daten\fantasy\font\dauphinn.ttf",14,smoothfont)
				font16=LoadImageFontassert("..\daten\fantasy\font\dauphinn.ttf",16,smoothfont)
				font10=LoadImageFontassert("..\daten\fantasy\font\dauphinn.ttf",10,smoothfont)
				'fontarial18=LoadImageFontassert("..\daten\fantasy\font\arial.ttf", 18, SMOOTHFONT)
				'fontarial16=LoadImageFontassert("..\daten\fantasy\font\arial.ttf", 16, SMOOTHFONT)
				'----------------------------------------- gui load -------------------------------------------------------------
				iguiwindow=loadimageassert("..\daten\fantasy\gui\window_512_750_3.tga")
				igametypewindow=loadimageassert("..\daten\fantasy\gui\window_950_950_13.tga")
				imessagewindow=loadimageassert("..\daten\fantasy\gui\window_512_256_3.tga")
				ilistboxwindow=loadimageassert("..\daten\fantasy\gui\window_256_256_3.tga")
				iverlaufwindow=loadimageassert("..\daten\fantasy\gui\window_950_550_5.tga")
				ihighscorewindow=ilistboxwindow'loadimageassert("..\daten\fantasy\gui\window_highscore.tga")

				iguihelp300180=loadimageassert("..\daten\fantasy\gui\guihelp_300_180.tga")
				iguihelp51280=loadimageassert("..\daten\fantasy\gui\guihelp_512_80.tga")
				iguihelp512111=loadimageassert("..\daten\fantasy\gui\guihelp_512_111.tga")
				iguihelp512180=loadimageassert("..\daten\fantasy\gui\guihelp_512_180.tga")
				iguihelp839124=loadimageassert("..\daten\fantasy\gui\guihelp_839_124.tga")
				iguihelp85093=loadimageassert("..\daten\fantasy\gui\guihelp_850_93.tga")
				iguihelp24389=loadimageassert("..\daten\fantasy\gui\guihelp_243_89.tga")


				ibuttonshadow=loadimageassert("..\daten\fantasy\gui\button_schatten.tga")
				ibuttonshadowon=loadimageassert("..\daten\fantasy\gui\button_schatten_on.tga")
				ibuttonshadowson=loadimageassert("..\daten\fantasy\gui\button_schatten_son.tga")
				icheck=loadimageassert("..\daten\fantasy\gui\check3.tga")
				idonut=loadimageassert("..\daten\fantasy\gui\donut2.tga")
				idonutred=loadimageassert("..\daten\fantasy\gui\donutred.tga")
				idonutgreen=loadimageassert("..\daten\fantasy\gui\donutgreen.tga")
				idonutblue=loadimageassert("..\daten\fantasy\gui\donutblue.tga")
				iblack=loadimageassert("..\daten\fantasy\gui\black.tga")
				iframe=loadimageassert("..\daten\fantasy\gui\frame3.tga")
				iframe2=loadimageassert("..\daten\fantasy\gui\frame2.tga")
				irosecredits=loadimageassert("..\daten\fantasy\gui\rose05.tga")


				inormalrange=loadimageassert("..\daten\fantasy\gui\verlauf_normalbereich.tga")
				itrackbar=loadimageassert("..\daten\fantasy\gui\trackbar.tga")
				itrackbarbutton=loadimageassert("..\daten\fantasy\gui\trackbar_button2.tga")
				ilistboxl=loadimageassert("..\daten\fantasy\gui\listbox_large.tga")
				iscrollbar=loadimageassert("..\daten\fantasy\gui\scrollbar.tga")
				iscrollbarbutton=loadimageassert("..\daten\fantasy\gui\scrollbarbutton.tga")
				iscrollbarhorizontal=loadimageassert("..\daten\fantasy\gui\scrollbarhorizontal.tga")
			    ibuttong=LoadImageassert("..\daten\fantasy\gui\button_neu_large.tga")
				ibuttonghl=LoadImageassert("..\daten\fantasy\gui\button_neu_large_on.tga")
				ibuttongson=LoadImageassert("..\daten\fantasy\gui\button_neu_large_son.tga")
			    ibuttonl=LoadImageassert("..\daten\fantasy\gui\button_neu_medium.tga")
				ibuttonlhl=LoadImageassert("..\daten\fantasy\gui\button_neu_medium_on.tga")
				ibuttonlson=LoadImageassert("..\daten\fantasy\gui\button_neu_medium_son.tga")
				ibuttonm=LoadImageassert("..\daten\fantasy\gui\button_neu_smallmedium.tga")
				ibuttonmhl=LoadImageassert("..\daten\fantasy\gui\button_neu_smallmedium_on.tga")
				ibuttonmson=LoadImageassert("..\daten\fantasy\gui\button_neu_smallmedium_son.tga")
				ibuttons=LoadImageassert("..\daten\fantasy\gui\button_neu_small.tga")
				ibuttonshl=LoadImageassert("..\daten\fantasy\gui\button_neu_small_on.tga")
				ibuttonsson=LoadImageassert("..\daten\fantasy\gui\button_neu_small_son.tga")
				ibuttonu=LoadImageassert("..\daten\fantasy\gui\button_neu_micro.tga")
				ibuttonuhl=LoadImageassert("..\daten\fantasy\gui\button_neu_micro_on.tga")
				ibuttonuson=LoadImageassert("..\daten\fantasy\gui\button_neu_micro_son.tga")
				icheckbox=LoadImageassert("..\daten\fantasy\gui\checkbox2.tga")
				icheckboxhl=LoadImageassert("..\daten\fantasy\gui\checkbox2_on.tga")
				ilistboxbuttonup=LoadImageassert("..\daten\fantasy\gui\listbox_button_up.tga")
				ilistboxbuttondown=LoadImageassert("..\daten\fantasy\gui\listbox_button_down.tga")
				'-------------------------------------------- sound load --------------------------------------------------------
				smove=loadsoundassert("..\daten\sounds\fansol_card_shuffle02cut.ogg") 'flip03.ogg")' neu ueberarbeitet ...fansol_card_shuffle02cut.ogg")	
				sturn=loadsoundassert("..\daten\sounds\turn01.ogg")' neu ueberarbeitet ...fansol_card_deal01a.ogg
				scardsingle=loadsoundassert("..\daten\sounds\card_single.ogg")					
				sexplosion[0]=loadsoundassert("..\daten\sounds\explosion2.ogg")					
				sfireplace=loadsoundassert("..\daten\sounds\fantasol_fireplace.ogg",True)					
				spendulum=loadsoundassert("..\daten\sounds\fantasol_pendulum.ogg")					
				suhrschlag0=loadsoundassert("..\daten\sounds\fantasol_clock_singlestroke_fadeout_low.ogg")					
				suhrschlagstunde=loadsoundassert("..\daten\sounds\fantasol_clock_westminster_nofade_low.ogg")					
				sgong=loadsoundassert("..\daten\sounds\gong.ogg")	'neu ueberarbeitet				
				sspark=loadsoundassert("..\daten\sounds\spark.ogg")			
				sspend=loadsoundassert("..\daten\sounds\spend.ogg")		
				'-------------------------------------------- figure load ------------------------------------------------------
				'isister=LoadImageassert("..\daten\fantasy\figure\sister.tga")
				iprinzessin=LoadImageassert("..\daten\fantasy\figure\prinzessin.tga")
				idame=LoadImageassert("..\daten\fantasy\figure\dame.tga")
				iritter=LoadImageassert("..\daten\fantasy\figure\ritter.tga")
				izauberer=LoadImageassert("..\daten\fantasy\figure\zauberer.tga")
				ifee=LoadImageassert("..\daten\fantasy\figure\fee.tga")
				idrachen=LoadImageassert("..\daten\fantasy\figure\drachen.tga")
				ikoenig=LoadImageassert("..\daten\fantasy\figure\koenig.tga")
				ilehrerin=LoadImageassert("..\daten\fantasy\figure\lehrerin.tga")


				'tsister=New _texture
				'tsister.init("..\daten\images\FX\sister.tga")
				'sister=New _figure
				'sister.Init(Self,isister,0.015,0.405)
				
				prinzessin=New _figure
				prinzessin.Init(Self,iprinzessin,0.188,0.5257);
				dame=New _figure
				dame.Init(Self,idame,0.167,0.494);
				ritter=New _figure
				ritter.Init(Self,iritter,0.1760,0.4930);
				zauberer=New _figure
				zauberer.Init(Self,izauberer,0.1786,0.4451);

				fee=New _figure
				fee.Init(Self,ifee,0.1114,0.355);
				drachen=New _figure
				drachen.Init(Self,idrachen,0.02291,0.2798);
				koenig=New _figure
				koenig.Init(Self,ikoenig,0.1911,0.5562);
				lehrerin=New _figure
				lehrerin.Init(Self,ilehrerin,0.191,0.507);

				
				'---------------------------------------------- scene and logo load --------------------------------------------
				ilogo=LoadImageassert("..\daten\fantasy\logo\logo04.tga")
				If greenboard
				 tbackgroundgamea=New _texture
				 tbackgroundgamea.init("..\daten\fantasy\scene\table_08_2048_1024.jpg")
				 tbackgroundgamel=New _texture
				 tbackgroundgamel.init("..\daten\fantasy\scene\table_08_2048_1024hl.jpg")
				Else
				 tbackgroundgamea=New _texture
				 tbackgroundgamea.init("..\daten\fantasy\scene\table_07_2048_1024.jpg")
				 tbackgroundgamel=New _texture
				 tbackgroundgamel.init("..\daten\fantasy\scene\table_07_2048_1024hl.jpg")
				EndIf
				'imenubackground=LoadImageassert("..\daten\fantasy\scene\background_menu3_test.jpg")
				'imenubackgroundl[0]=LoadImageassert("..\daten\fantasy\scene\background alone.png")
				'imenubackgrounda=LoadImageassert("..\daten\fantasy\scene\Background alone AMBIENT Only.png")
				Local fn$
				Local h$
				For Local n=0 To 2
				 fn="scene\scene_02_"+n+".jpg"
				 If fileexists(fn)
				  imenubackgroundl[n]=LoadImageassert(fn)
				 Else
			 	 ' imenubackgroundl[n]=LoadImageassert("..\daten\fantasy\scene\masters0"+n+".jpg")
				  imenubackgroundl[n]=LoadImageassert("..\daten\fantasy\scene\scene_02_"+n+".jpg")
			     EndIf
				Next
				imenubackgroundglow=LoadImageassert("..\daten\fantasy\scene\scene_00_fireplace_woodglow.tga")
				icandleholdermenu=LoadImageassert("..\daten\fantasy\scene\candleholder_menu.tga")
				icandleholdergame=LoadImageassert("..\daten\fantasy\scene\candleholder_game.tga")
				'imenubackgroundl[2]=LoadImageassert("..\daten\play\Background_B2.png")
				'imenubackgroundl[3]=LoadImageassert("..\daten\play\Background_B3.png")
				'--------------------------------------------- game texture load ---------------------------------------------
				tempty=New _texture
				tempty.init("..\daten\fantasy\game\empty.tga")
				temptykey=New _texture
				temptykey.init("..\daten\fantasy\game\emptykey.tga")
				'drawloadscreen()
				tsymbolsuit[0]=New _texture
				tsymbolsuit[0].init("..\daten\fantasy\game\symbol_suit0.tga")
				'drawloadscreen()
				tsymbolsuit[1]=New _texture
				tsymbolsuit[1].init("..\daten\fantasy\game\symbol_suit1.tga")
				'drawloadscreen()
				tsymbolsuit[2]=New _texture
				tsymbolsuit[2].init("..\daten\fantasy\game\symbol_suit2.tga")
				'drawloadscreen()
				tsymbolsuit[3]=New _texture
				tsymbolsuit[3].init("..\daten\fantasy\game\symbol_suit3.tga")
				'drawloadscreen()
				pmsymbolsuit[0]=LoadPixmap("..\daten\fantasy\game\symbol_suit0.tga")
				pmsymbolsuit[1]=LoadPixmap("..\daten\fantasy\game\symbol_suit1.tga")
				pmsymbolsuit[2]=LoadPixmap("..\daten\fantasy\game\symbol_suit2.tga")
				pmsymbolsuit[3]=LoadPixmap("..\daten\fantasy\game\symbol_suit3.tga")
				pmsymbolsuitrand[0]=LoadPixmap("..\daten\fantasy\game\symbol_suit0rand.tga")
				pmsymbolsuitrand[1]=LoadPixmap("..\daten\fantasy\game\symbol_suit1rand.tga")
				pmsymbolsuitrand[2]=LoadPixmap("..\daten\fantasy\game\symbol_suit2rand.tga")
				pmsymbolsuitrand[3]=LoadPixmap("..\daten\fantasy\game\symbol_suit3rand.tga")
				'drawloadscreen()
				
				
				
				tsymbolnumber[0]=New _texture
				tsymbolnumber[0].init("..\daten\fantasy\game\symbolA.tga")
				'drawloadscreen()
				tsymbolnumber[1]=New _texture
				tsymbolnumber[1].init("..\daten\fantasy\game\symbol2.tga")
				'drawloadscreen()
				tsymbolnumber[2]=New _texture
				tsymbolnumber[2].init("..\daten\fantasy\game\symbol3.tga")
				'drawloadscreen()
				tsymbolnumber[3]=New _texture
				tsymbolnumber[3].init("..\daten\fantasy\game\symbol4.tga")
				'drawloadscreen()
				tsymbolnumber[4]=New _texture
				tsymbolnumber[4].init("..\daten\fantasy\game\symbol5.tga")
				'drawloadscreen()
				tsymbolnumber[5]=New _texture
				tsymbolnumber[5].init("..\daten\fantasy\game\symbol6.tga")
				'drawloadscreen()
				tsymbolnumber[6]=New _texture
				tsymbolnumber[6].init("..\daten\fantasy\game\symbol7.tga")
				'drawloadscreen()
				tsymbolnumber[7]=New _texture
				tsymbolnumber[7].init("..\daten\fantasy\game\symbol8.tga")
				'drawloadscreen()
				tsymbolnumber[8]=New _texture
				tsymbolnumber[8].init("..\daten\fantasy\game\symbol9.tga")
				'drawloadscreen()
				tsymbolnumber[9]=New _texture
				tsymbolnumber[9].init("..\daten\fantasy\game\symbol10.tga")
				'drawloadscreen()
				tsymbolnumber[10]=New _texture
				tsymbolnumber[10].init("..\daten\fantasy\game\symbolB.tga")
				'drawloadscreen()
				tsymbolnumber[11]=New _texture
				tsymbolnumber[11].init("..\daten\fantasy\game\symbolD.tga")
				'drawloadscreen()
				tsymbolnumber[12]=New _texture
				tsymbolnumber[12].init("..\daten\fantasy\game\symbolK.tga")
				'drawloadscreen()
				
				tsymbolnumbersmall[0]=New _texture
				tsymbolnumbersmall[0].init("..\daten\fantasy\game\symbolnumbersmall\symbolA.tga")
				'drawloadscreen()
				tsymbolnumbersmall[1]=New _texture
				tsymbolnumbersmall[1].init("..\daten\fantasy\game\symbolnumbersmall\symbol2.tga")
				'drawloadscreen()
				tsymbolnumbersmall[2]=New _texture
				tsymbolnumbersmall[2].init("..\daten\fantasy\game\symbolnumbersmall\symbol3.tga")
				'drawloadscreen()
				tsymbolnumbersmall[3]=New _texture
				tsymbolnumbersmall[3].init("..\daten\fantasy\game\symbolnumbersmall\symbol4.tga")
				'drawloadscreen()
				tsymbolnumbersmall[4]=New _texture
				tsymbolnumbersmall[4].init("..\daten\fantasy\game\symbolnumbersmall\symbol5.tga")
				'drawloadscreen()
				tsymbolnumbersmall[5]=New _texture
				tsymbolnumbersmall[5].init("..\daten\fantasy\game\symbolnumbersmall\symbol6.tga")
				'drawloadscreen()
				tsymbolnumbersmall[6]=New _texture
				tsymbolnumbersmall[6].init("..\daten\fantasy\game\symbolnumbersmall\symbol7.tga")
				'drawloadscreen()
				tsymbolnumbersmall[7]=New _texture
				tsymbolnumbersmall[7].init("..\daten\fantasy\game\symbolnumbersmall\symbol8.tga")
				'drawloadscreen()
				tsymbolnumbersmall[8]=New _texture
				tsymbolnumbersmall[8].init("..\daten\fantasy\game\symbolnumbersmall\symbol9.tga")
				'drawloadscreen()
				tsymbolnumbersmall[9]=New _texture
				tsymbolnumbersmall[9].init("..\daten\fantasy\game\symbolnumbersmall\symbol10.tga")
				'drawloadscreen()
				tsymbolnumbersmall[10]=New _texture
				tsymbolnumbersmall[10].init("..\daten\fantasy\game\symbolnumbersmall\symbolB.tga")
				'drawloadscreen()
				tsymbolnumbersmall[11]=New _texture
				tsymbolnumbersmall[11].init("..\daten\fantasy\game\symbolnumbersmall\symbolD.tga")
				'drawloadscreen()
				tsymbolnumbersmall[12]=New _texture
				tsymbolnumbersmall[12].init("..\daten\fantasy\game\symbolnumbersmall\symbolK.tga")
				'drawloadscreen()				
				
				tsymbolfine=New _texture
				tsymbolfine.init("..\daten\fantasy\game\symbolfine2.tga")
				'drawloadscreen()
				tsymbolddd=New _texture
				tsymbolddd.init("..\daten\fantasy\game\symbolddd.tga")
				'drawloadscreen()




				For Local m=0 To 9 				
				 tnumber[m]=New _texture
				 tnumber[m].init("..\daten\fantasy\game\"+m+".tga")
				' drawloadscreen()
				 tnumbersmall[m]=New _texture
				 tnumbersmall[m].init("..\daten\fantasy\game\numbersmall\"+m+".tga")
				' drawloadscreen()
				Next
				
				
				'tcardspecular=New _texture
				'tcardspecular.init("..\daten\fantasy\game\card_fs_specular.tga")
				tblase=New _texture
				tblase.init("..\daten\fantasy\game\blase.tga")
				'drawloadscreen()				

				'------------------------------------------------------ load background and effects ------------------------------------------
				tfeuer=New _texture
				tfeuer.init("..\daten\fantasy\effect\fire01.tga")
				tfeuer2=New _texture
				tfeuer2.init("..\daten\fantasy\effect\fire03.tga")
				tfeuer3=New _texture
				tfeuer3.init("..\daten\fantasy\effect\fire04.tga")
				tfeuer4=New _texture
				tfeuer4.init("..\daten\fantasy\effect\fire05.tga")
				tfeuer5=New _texture
				tfeuer5.init("..\daten\fantasy\effect\fire06.tga")
				tfeuer6=New _texture
				tfeuer6.init("..\daten\fantasy\effect\fire07.tga")
				tfeuercandle=New _texture
				tfeuercandle.init("..\daten\fantasy\effect\firecandle.tga")
				tsmoke[0]=New _texture
				tsmoke[0].init("..\daten\fantasy\effect\wolke00.tga")
				tshadow=New _texture
				tshadow.init("..\daten\fantasy\effect\shadow3232.tga")
				tshadow16=New _texture
				tshadow16.init("..\daten\fantasy\effect\shadow16.tga")
				tcorona=New _texture
				tcorona.init("..\daten\fantasy\effect\corona00.tga")
				tcoronared=New _texture
				tcoronared.init("..\daten\fantasy\effect\corona06red.tga")
				tcoronablue=New _texture
				tcoronablue.init("..\daten\fantasy\effect\corona01blue.tga")
				tcoronawhite=New _texture
				tcoronawhite.init("..\daten\fantasy\effect\coronawhite.tga")
				tfunken[0]=New _texture
				tfunken[0].init("..\daten\fantasy\effect\funken00.tga")
				tdigit=New _texture
				tdigit.init("..\daten\fantasy\effect\digit00.tga")
				tdigith=New _texture
				tdigith.init("..\daten\fantasy\effect\digit00h.tga")
				tdigits=New _texture
				tdigits.init("..\daten\fantasy\effect\digit00s.tga")
				tpendulum=New _texture
				tpendulum.init("..\daten\fantasy\effect\pendulum01.tga")

				background=New _background
				background.init(Self)
				
				uhr=New _uhr
				uhr.init(Self)
				kamin=New _kamin2
				kamin.init(Self,2,1,0,1.5,particlemenulist)
				
				

				
				'------------------------------------------------------- effect candles ------------------------------------------------------
				candlegame[0]=createcandle(candlegamelist,-14.6,5.85,-7,5000,4,2.3,particlegamelist)
				candlegame[1]=createcandle(candlegamelist,12.3,9.6,-8,5000,4,2.0,particlegamelist)
				candlegame[1].sparked=True		

			'	candlegame[2]=createcandle(candlegamelist,3,7,-9,5000,4,2.0,particlegamelist)
		'		candlegame[3]=createcandle(candlegamelist,-1,7,-8,5000,4,2.0,particlegamelist)

				'r[0,0]=-13
				'r[0,1]=-14
				'r[1,0]=19
				'r[1,1]=11				
				'candlegame[0]=createcandle(candlegamelist,-13.2,-12.5,0,5000,2.5,1.6,particlegamelist)
				'candlegame[1]=createcandle(candlegamelist,18.5,10,0,5000,2.5,1.6,particlegamelist)
				'candlegame[1].sparked=True		
				
				candlemenu[1]=createcandle(candlemenulist,-0.7-1.145,2-0.30+0.7,-10,5000,1,0.7,particlemenulist)
				candlemenu[1].flamme.activate()
				candlemenu[0]=createcandle(candlemenulist,0.08-1.3,2.2+0.7,-10,5000,1,0.7,particlemenulist)
				candlemenu[0].flamme.activate()
				candlemenu[2]=createcandle(candlemenulist,+0.85-1.4,2-0.24+0.7,-10,5000,1,0.7,particlemenulist)
				candlemenu[2].flamme.activate()
				candlemenu[2]=createcandle(candlemenulist,+3-0.35,3.5,-8.5,5000,1,0.7,particlemenulist)
				candlemenu[2].flamme.activate()
				'smokemenu=New _smoke
				'smokemenu.initsmoke(Self,10.7,3.2,-5,5000,1,0.5,particlemenulist,True)
				candlemenu[3]=createcandle(candlemenulist,10.5,4.55,-5,5000,1,0.7,particlemenulist)
				candlemenu[3].flamme.activate()
			
				For Local cit:_candle=EachIn candlegamelist
				 cit.lightcolor.copy(farbekerze)
				Next				
				For Local cit:_candle=EachIn candlemenulist
				 cit.flamme.gfieldforcehomogen.set(0,-1,0)
				Next
				'------------------------------------------------- cardset source load and generation --------------------------------
				cardsetmanager=New _cardsetmanager
				cardsetmanager.init(Self)
			    
				
			cardsetmanager.Load("cardsets")
			'generatestandardcardset("cardsets")
				
				cardsetmanager.createhardwaresourcesurfaces(gra)
				'cardsetmanager.cleartexturehardwaresources()
				cardsetmanager.generatetexturepreviewall(gra)
				cardsetmanager.cleartexturehardwaresources()
				cardsetmanager.generatetexture(gra)
				cardsetmanager.cleartexturehardwaresources()
				
				
				
				If(brandingstufe=0) fadeinloadscreen(); Else fadeinsplashportal();
				'--------------------------------------------------- music load ---------------------------------------------------------------
				Rem
				musicman=New _musicmanagement
				musicman.init(clock,2)
				musicman.playtime[0]=(3*60*1000+ 30*1000)*2-10000
				musicman.playtime[1]=70582*2-10000
				musicman.file[0]="..\daten\musik\02 - Windfall.ogg"
				musicman.file[1]="..\daten\sheepworld\musik\sheepworldsolitaire03.ogg"		
				musicman.loadsounds()
				musicman.play(0,False,True)
				EndRem


				musicman=New _musicmanagement
				musicman.init(clock,3)
				musicman.playtime[0]=204177'62922*2-10000
				musicman.playtime[1]=207137'70582*2-10000
				musicman.playtime[2]=137272'69178*2-10000
				musicman.file[0]="..\daten\musik\thinking.ogg"
				musicman.file[1]="..\daten\musik\hopeful.ogg"
				musicman.file[2]="..\daten\musik\sunshine_naive.ogg"		
				musicman.loadsounds()
				musicman.play(0,False,True)				
				'---------------------------------------------------- win effects ------------------------------------------------------
				fireworkcards=New _fireworkcards
				fireworkcards.initfireworkcards(Self,world,particlesourcegamelist,particlegamelist,clock)
				fireworkrocket=New _fireworkrocket
				fireworkrocket.initfireworkrocket(Self,world,particlesourcegamelist,particlegamelist,clock)
				fireworkimage=New _fireworkimage
				fireworkimage.initfireworkimage(Self,world,particlesourcegamelist,particlegamelist,clock)				
				'------------------------------------------------- create gui --------------------------------------------------------
				gra.enabletext2d()
				createmenugametypehelp()
				createmenugametype()
				createmenumain()
				createmenugame()
				createmenuscene()
				createmenuoptionsacoustics()
				createmenuoptionsgraphics()
				createmenuoptionsgame()
				createmenuoptionscard()
				createmenuoptionscardfront()
				createmenuoptionscredits()		
				createmenuuser()
				createmenuusercreate()
				createmenustatistics()
				createmenuranks()
				createmenucardgenerator()
				updatemenumain()
				menuoptionslast=menuoptionsacoustics
				'------------------------------------------------ blendscreen init ---------------------------------------------------
				ShowMouse();
				
				
				EndMethod
	Method initfinish()		
				'drawloadscreen()		
	 			GrabImage(blendscreen,0,0)
				irose=Null
				blendscreenopacity=1				
				fpstimeold=clock.ms()
				setworldfieldmenu()
				EndMethod
    Method messageboxblack:Int(t$,tbutton$,ox#,oy#,f:timagefont,iwindow:timage)


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
				Local guilist:TList=CreateList()
				px:-wx/2
				py:-wy/2
				wy=180+lt.count()*20
				w0=New _guiwindow
				w0.init(guisystem,px,py,wx,wy,150,150,150)
				w0.position.setz(-10)
				windowinitmagic(w0,iwindow)
				w0.setshadow(25,25)
				guilist.addlast(w0)
				Local yit#=messageboxadditiontexty
				For Local tit:String=EachIn lt
				 Local t0:_guitext
				 t0=New _guitext
				 t0.init(w0,wx/2-TextWidth(tit)/2,yit,messageboxtextz,tit,tr,tg,tb,f)
				 yit:+25
				 guilist.addlast(t0)
				Next
				Local k0:_guibutton
				k0=New _guibutton
				k0.init(w0,wx/2-messageboxbuttonwidth/2,wy-60+messageboxadditionbuttony-10,messageboxbuttonwidth,messageboxbuttonheight,tbutton,0)
				buttoninitmagic(k0)
				guilist.addlast(k0)
				w0.visibility(False)
				w0.activity(False)
				w0.fadeopacity(0)
				w0.fadein()
				w0.fadetarget(menuopacity)		


				Local q=False
				Repeat
				 Local cc=GetChar()
				 guisystem.nullstates()
				 'If animatestandard(cc) q=True
				 guisystem.key=cc				
				 guisystem.animate(cc)
				 guisystem.animatefade()
				 processparticlesourcetoclear()
				 processparticletoclear()				
				 guisystem.animatehelpfadeoutglobal()
				
				' drawstandard()
				' SetBlend(SOLIDBLEND)
				' SetColor(0,0,0)
				' SetAlpha(1)
				' DrawRect(0,0,gra.screenw,gra.screenh)
				 gra.enabletext2d()		
				 drawloadscreen(False,1)
				 For Local git:_gui=EachIn guilist
				  git.draw(gra,cam)
				 Next
				 guisystem.drawcursor(gra,cam)				
				 gra.swap(0)
				
				Until guisystem.button Or KeyHit(KEY_ESCAPE) Or KeyHit(KEY_RETURN) Or MouseHit(MOUSE_LEFT) Or MouseHit(MOUSE_RIGHT) Or q
				guisystem.button=Null
				FlushKeys()
				FlushMouse()
				w0.fadeout()
				w0.activity(False)
				Repeat
				 Local cc=GetChar()
				 guisystem.nullstates()
				 'If animatestandard(cc) q=True
				 guisystem.key=cc				
				 guisystem.animate(cc)
				 guisystem.animatefade()
				 processparticlesourcetoclear()
				 processparticletoclear()				
				 guisystem.animatehelpfadeoutglobal()
				
				' drawstandard()
				' SetBlend(SOLIDBLEND)
				' SetColor(0,0,0)
				' SetAlpha(1)
				' DrawRect(0,0,gra.screenw,gra.screenh)
				 gra.enabletext2d()		
				 drawloadscreen(False,w0.pfadeopacity)
				 For Local git:_gui=EachIn guilist
				  git.draw(gra,cam)
				 Next
				 guisystem.drawcursor(gra,cam)				
				 gra.swap(0)
				
				Until w0.pfadeopacity=0


				guisystem.restoreactivitylist()
				Return(0)
				EndMethod					
	Method messagedesktopsizetoosmall()
				messageboxblack(strdesktopsizetoosmall,strok,gra.screenw/2,gra.screenh/2,font18,imessagewindow)
				EndMethod				
	Method messagetrialexhausted()
				messageboxblack(strtrialexhausted,strok,gra.screenw/2,gra.screenh/2,font18,imessagewindow)
				EndMethod				
	Method messagetrialdeactivated()
				messageboxblack(strtrialdeactivated,strok,gra.screenw/2,gra.screenh/2,font18,imessagewindow)
				EndMethod				
	Method clear()
				If cardsetmanager 
				 cardsetmanager.savedynamicsets()
				 cardsetmanager.clear()
				 cardsetmanager=Null
				EndIf
				If game 
				 game.clear()
				 game=Null
				EndIf
				If gamepreview
				 gamepreview.clear()
				 gamepreview=Null
				EndIf
				If gamemenu
				 gamemenu.clear()
				 gamemenu=Null
				EndIf
				If gra 
				 gra.deinit()
				 gra=Null
				EndIf
				savestatistics(strfilestatistics)
				saveoptions(strfileoptions)
				usermanagement.save()
				guisystem.clear()
				EndMethod		
	Method generatestandardcardset(pf$)
		
				Local cb:_cardsetback=New _cardsetback
				Local cf:_cardsetfront=New _cardsetfront
				cb.init(cardsetmanager)
				cf.init(cardsetmanager)
				cb.static=True
				cf.static=False
				
				cb.addground("..\daten\sets\ground_00.tga","ground_00")
				'cb.addground("..\daten\sets\ground_01.tga","ground_01")
				'cb.addground("..\daten\sets\ground_02.tga","ground_02")
				'cb.addground("..\daten\sets\ground_03.tga","ground_03")
				'cb.addground("..\daten\sets\ground_04.tga","ground_04")
				cb.addground("..\daten\sets\masters\ground00.tga","ground_masters00")
				cb.addground("..\daten\sets\masters\ground01.tga","ground_masters01")
				cb.addground("..\daten\sets\masters\ground02.tga","ground_masters02")
				cb.addground("..\daten\sets\masters\ground03.tga","ground_masters03")
				
				cb.addmotive("..\daten\sets\motiveback_00.tga","motiveback_00")
				cb.addmotive("..\daten\sets\masters\rueckseite00.tga","rueckseite00")
				cb.addmotive("..\daten\sets\masters\rueckseite01.tga","rueckseite01")
				cb.addmotive("..\daten\sets\masters\rueckseite02.tga","rueckseite02")

				cb.addframe("..\daten\sets\frame_00.tga","frame_00")
				cb.addframe("..\daten\sets\frame_01.tga","frame_01")
				'cb.addframe("..\daten\sets\frame_02.tga","frame_02")
				cb.addframe("..\daten\sets\frame_06.tga","frame_06")
				cb.addframe("..\daten\sets\frame_07.tga","frame_07")
				'cb.addframe("..\daten\sets\frame_08.tga","frame_08")
				cb.addframe("..\daten\sets\frame_09.tga","frame_09")
				cb.addframe("..\daten\sets\frame_10.tga","frame_10")
				cb.addframe("..\daten\sets\frame_11.tga","frame_11")
				cb.addframe("..\daten\sets\frame_12.tga","frame_12")
				cb.addframe("..\daten\sets\frame_13.tga","frame_13")
				cb.addframe("..\daten\sets\frame_14.tga","frame_14")
				cb.addframe("..\daten\sets\frame_15.tga","frame_15")
				cb.addframe("..\daten\sets\frame_16.tga","frame_16")
				cb.addframe("..\daten\sets\frame_17.tga","frame_17")
				cb.addframe("..\daten\sets\frame_18.tga","frame_18")
				cb.addframe("..\daten\sets\frame_19.tga","frame_19")
				cb.addframe("..\daten\sets\frame_20.tga","frame_20")
				'cb.addframe("..\daten\sets\frame_21.tga","frame_21")
				cb.addframe("..\daten\sets\frame_22.tga","frame_22")
				'cb.addframe("..\daten\sets\frame_23.tga","frame_23")
				cb.addframe("..\daten\sets\frame_24.tga","frame_24")
				'cb.addframe("..\daten\sets\frame_25.tga","frame_25")
				cb.addframe("..\daten\sets\frame_27.tga","frame_27")
				'cb.addframe("..\daten\sets\frame_28.tga","frame_28")
				cb.addframe("..\daten\sets\frame_29.tga","frame_29")
				cb.addframe("..\daten\sets\frame_30.tga","frame_30")

				cb.addframe("..\daten\sets\frame_31.tga","frame_31")
				cb.addframe("..\daten\sets\frame_32.tga","frame_32")
				cb.addframe("..\daten\sets\frame_33.tga","frame_33")

				cb.addstructure("..\daten\sets\structure_02.tga","structure_02")
				'cb.addstructure("..\daten\sets\structure_03.tga","structure_03")
				cb.addstructure("..\daten\sets\structure_04.tga","structure_04")
				'cb.addstructure("..\daten\sets\structure_07.tga","structure_07")
				cb.addstructure("..\daten\sets\structure_08.tga","structure_08")
				cb.addstructure("..\daten\sets\structure_09.tga","structure_09")
				cb.addstructure("..\daten\sets\structure_10.tga","structure_10")
				cb.addstructure("..\daten\sets\structure_11.tga","structure_11")
				cb.addstructure("..\daten\sets\structure_12.tga","structure_12")
				cb.addstructure("..\daten\sets\structure_13.tga","structure_13")
				cb.addstructure("..\daten\sets\structure_14.tga","structure_14")
				cb.addstructure("..\daten\sets\structure_15.tga","structure_15")
				cb.addstructure("..\daten\sets\structure_16.tga","structure_16")
				cb.addstructure("..\daten\sets\structure_17.tga","structure_17")
				cb.addstructure("..\daten\sets\structure_18.tga","structure_18")
				cb.addstructure("..\daten\sets\structure_21.tga","structure_21")
				'cb.addstructure("..\daten\sets\structure_22.tga","structure_22")
				cb.addstructure("..\daten\sets\structure_23.tga","structure_23")
				cb.addstructure("..\daten\sets\structure_24.tga","structure_24")
				cb.addstructure("..\daten\sets\structure_27.tga","structure_27")
				cb.addstructure("..\daten\sets\structure_28.tga","structure_28")
				cb.addstructure("..\daten\sets\structure_30.tga","structure_30")
				cb.addstructure("..\daten\sets\structure_32.tga","structure_32")
				cb.addstructure("..\daten\sets\structure_33.tga","structure_33")
				cb.addstructure("..\daten\sets\structure_37.tga","structure_37")
				'cb.addstructure("..\daten\sets\structure_38.tga","structure_38")
				'cb.addstructure("..\daten\sets\structure_39.tga","structure_39")
				cb.addstructure("..\daten\sets\structure_40.tga","structure_40")
				cb.addstructure("..\daten\sets\structure_41.tga","structure_41")
				cb.addstructure("..\daten\sets\structure_42.tga","structure_42")
			'	cb.addstructure("..\daten\sets\structure_43.tga","structure_43")
				'cb.addstructure("..\daten\sets\structure_44.tga","structure_44")
				cb.addstructure("..\daten\sets\structure_45.tga","structure_45")
				cb.addstructure("..\daten\sets\structure_46.tga","structure_46")
				'b.addstructure("..\daten\sets\structure_47.tga","structure_47")
				cb.addstructure("..\daten\sets\structure_48.tga","structure_48")

				cb.addimpurity("..\daten\sets\impurity_00.tga","impurity_00")
				cb.addimpurity("..\daten\sets\impurity_01.tga","impurity_01")
				'----- blank gebraucht
				cb.setground("ground_masters01")
				cb.setmotive("rueckseite00")
				cb.setframe("frame_32",0,0,1)
				cb.setstructureground("structure_18",0.45,False)
				cb.setstructureframe("structure_17",0.4)
				cb.setimpurity("impurity_00",0,0,0)
				cb.static=False
				cb.save(pf+"\_00_back_02.sol")
				cb.clearlocallists()
				'-----std set
				cb.setmotive("rueckseite02")
				cb.setground("ground_masters02")
				cb.setframe("frame_32",0,0,0)
				cb.setstructureground("structure_18",0,False)
				cb.setstructureframe("structure_18",0)
				cb.setimpurity("impurity_00",0.0,0.0,0.0)
				cb.static=False
				cb.save(pf+"\_00_back_00.sol")

				'-----std set blau
				cb.setmotive("rueckseite01")
				cb.setground("ground_masters02")
				cb.setimpurity("impurity_00",0.0,0.0,0.0)
				cb.static=False
				cb.save(pf+"\_00_back_01.sol")



				Rem				
				 For Local n=0 To 51
				  Local h$=n
				  If h.length=1 h="0"+h
				  cf.addmotive("..\daten\sets\motivefront_"+h+".tga","motivefront_00")
				 Next
				EndRem
				
				 For Local n=1 To 13
				  Local hn$=n
				  If hn.length=1 hn="0"+hn
 				  For Local ss=0 To 3
                   Local s;
                   If ss=0 s=3
				   If ss=1 s=2
				   If ss=2 s=0
				   If ss=3 s=1	 
				   Local hs$=s
				   If hs.length=1 hs="0"+hs
				   cf.addmotive("..\daten\sets\masters\"+hs+"_"+hn+".tga","motivefront_masters")
				  Next
				 Next
				
				
				
				'------------------ gold metal dekoration set
				cf.setground("ground_masters01")
				cf.setframe("frame_32",0.23,0.95,0)
				cf.setmotive("motivefront_masters")
				cf.setstructureground("structure_17",0.6,False)
				cf.setstructureframe("structure_18",0.6)
				cf.setimpurity("impurity_00",0,0,0)
				cf.save(pf+"\_00_front_01.sol")
				cf.clearlocallists()
				'------------------ perlmut set
				cf.setground("ground_masters03")
				cf.setframe("frame_07",1,1,0)
				cf.setmotive("motivefront_masters")
				cf.setstructureground("structure_27",0.4,False)
				cf.setstructureframe("structure_09",1)
				cf.setimpurity("impurity_00",0.5,0,0)
				cf.save(pf+"\_00_front_02.sol")
				'----------------- std set  
				cf.setstructureground("structure_09",0,False)
				cf.setstructureframe("structure_09",0)
				cf.setground("ground_masters02")
				'cf.setframe("frame_06",0,0,0)
				cf.setimpurity("impurity_00",0.0,0.0,0.0)
				cf.setframe("frame_06",0,1,0)
				cf.save(pf+"\_00_front_00.sol")
			
			    '------------------------------- russen cards FRONT --------------------------------------
			Rem
				Local cr:_cardsetfront=New _cardsetfront
				cr.init(cardsetmanager)
				cr.static=False				
				'cr.addground("..\daten\sets\russen\ground_00.tga","ground_russia00")	
				cr.addground("..\daten\sets\russen\ground_01.tga","ground_russia01")	
				'cr.addframe("..\daten\sets\russen\framesoft.tga","framesoft")
				cr.addframe("..\daten\sets\russen\framemuster00.tga","framemuster00")
				'cr.addframe("..\daten\sets\russen\framemuster01.tga","framemuster01")
				cr.addframe("..\daten\sets\russen\framemuster02.tga","framemuster02")
				cr.addframe("..\daten\sets\russen\framemuster03.tga","framemuster03")
				cr.addframe("..\daten\sets\russen\framemuster04.tga","framemuster04")
							
				'cr.addground("..\daten\sets\ground_05.tga","ground_05")
								For Local n=0 To 51
				 Local k=(n Mod 4)
				 Local vsu
				 If k=0 vsu=1
				 If k=1 vsu=3
				 If k=2 vsu=4
				 If k=3 vsu=2
				 
				
				  Local i=(n/4)+1
				 Local h$=i
				 Local hvsu$=vsu
				 If h.length=1 h="0"+h
				 hvsu="0"+hvsu
				
				 cr.addmotive("..\daten\sets\russen\"+hvsu+"\"+hvsu+"_"+h+".tga","motivefront_russen")
				Next				
				cr.setground("ground_00")
				cr.setframe("frame_00",0,0,0)
				cr.setmotive("motivefront_russen")
				cr.setstructureground("structure_09",0,False)
				cr.setstructureframe("structure_09",0)
				cr.setimpurity("impurity_00",0,0,0)
				
				cr.save(pf+"\_01_front_01.sol")
				cr.clearlocallists()
				cr.setground("ground_russia01")			 
				cr.save(pf+"\_01_front_00.sol")
 				 '------------------------------- russen cards BACK --------------------------------------
	
				Local cbr:_cardsetback=New _cardsetback
				cbr.init(cardsetmanager)
				cbr.static=True				
			
				cbr.addmotive("..\daten\sets\russen\motiveback00.tga","motiveback_russen_00")
				cbr.addmotive("..\daten\sets\russen\motiveback01.tga","motiveback_russen_01")
				cbr.addmotive("..\daten\sets\russen\motiveback02.tga","motiveback_russen_02")
				cbr.addmotive("..\daten\sets\russen\motiveback03.tga","motiveback_russen_03")
				cbr.addmotive("..\daten\sets\russen\motivebackempty.tga","motiveback_russen_empty")				
				cbr.setground("ground_russia01")
				'cbr.setframe("framesoft",True,True,False)
				cbr.setimpurity("impurity_00",1.0,0.0,0.0)

				cbr.setmotive("motiveback_russen_00")
				cbr.setstructureground("structure_09",0,False)
				cbr.save(pf+"\_01_back_02.sol")
				cbr.clearlocallists()
				cbr.setmotive("motiveback_russen_01")
				cbr.save(pf+"\_01_back_03.sol")
				cbr.clearlocallists()
				cbr.setmotive("motiveback_russen_02")
				cbr.save(pf+"\_01_back_04.sol")
				cbr.clearlocallists()
				cbr.setmotive("motiveback_russen_03")
				cbr.save(pf+"\_01_back_05.sol")
				
				
				
				'cbr.static=True	
				cbr.clearlocallists()
				cbr.static=False
				cbr.setimpurity("impurity_00",0.0,0.0,0.0)
				cbr.setframe("framemuster00",1,1,1)
				cbr.setstructureframe("structure_09",0.95)
                cbr.setstructureground("structure_09",0,False)

				cbr.setmotive("motiveback_russen_empty")
				cbr.save(pf+"\_01_back_00.sol")
				
				Local cb2:_cardsetback=New _cardsetback
				cb2.init(cardsetmanager)
				
				cb2.setframe("framemuster02",0,0,1)
				cb2.setstructureframe("structure_09",0.1)
				cb2.setmotive("motiveback_russen_empty")
				cb2.setground("ground_06")
				cb2.setstructureground("structure_09",0,False)
				cb2.setimpurity("impurity_00",0.0,0.0,0.0)
				cb2.save(pf+"\_01_back_01.sol")
				EndRem
				'----------------------------------------- tassilo poker cards FRONT ---------------------
				Local ctf:_cardsetfront=New _cardsetfront
				ctf.init(cardsetmanager)
				ctf.static=False				
				ctf.addground("..\daten\sets\tassilo\ground.tga","ground_tassilo")	
				For Local n=0 To 51
				 Local k=(n Mod 4)
				 Local vsu
				 If k=0 vsu=1
				 If k=1 vsu=3
				 If k=2 vsu=4
				 If k=3 vsu=2
				 Local i=(n/4)+1
				 Local h$=i
				 Local hvsu$=vsu
				 If h.length=1 h="0"+h
				 hvsu="0"+hvsu
				 ctf.addmotive("..\daten\sets\tassilo\"+hvsu+"\"+hvsu+"_"+h+".tga","motivefront_tassilo")
				Next				
				ctf.setground("ground_tassilo")
				ctf.setframe("frame_00",0,0,0)
				ctf.setmotive("motivefront_tassilo")
				ctf.setstructureground("structure_09",0,False)
				ctf.setstructureframe("structure_09",0)
				ctf.setimpurity("impurity_00",0,0,0)
				ctf.save(pf+"\_02_front_00.sol")
				ctf.clearlocallists()
				
				EndMethod
				Rem
	Method createdynamictextures()				
				gra.enabletext2d()
				'Graphics(1024,768,16,0)
				HideMouse()
				'Local font:Timagefont=LoadImageFont("Incbin::..\daten\FAUS____.TTF", 100, SMOOTHFONT)
				SetImageFont(font)				
				Cls
				SetColor(110,70,20)
				SetBlend MASKBLEND
				DrawText "Fantasy Solitaire",10,10
			    dyn0.grab(0,0,512,512)
				Cls
				SetColor(110,70,20)
				SetBlend MASKBLEND
				DrawText "Hi Carmen",10,10
			    dyn1.grab(0,0,512,512)
				Cls
				SetColor(200,150,90)
				SetBlend MASKBLEND
				DrawText "Optionen",10,10
			    dyn2.grab(0,0,512,128)
				SetImageFont(font18)	
				Cls			
			
				ShowMouse()
				EndMethod				

	Method checkhighscore(g:_gamestats,e:_gamestatsentry)
	
				EndMethod	

			
	Method savestats()
				Local si=0
				For Local i=0 To gametypecount-1
				 gamestats[i].savename="stat"+si
				 si:+1
				Next
				Local s:TStream
				s=WriteFile(strfilestatistics)
				If Not s RuntimeError "failed to open the save file" 
				WriteInt(s,gametypecount)
				For Local i=0 To gametypecount-1
				 gamestats[i].save(s)
				Next
				CloseStream(s)				
				EndMethod
				
	Method generatestats()
				For Local i=0 To gametypecount-1
				 gamestats[i]=New _gamestats
				 gamestats[i].init(Self,i)
				 For Local j=0 To 4
				  Local eit:_gamestatsentry=New _gamestatsentry
				  eit.init(gamestats[i])
				  If Rand(0,1)=0
				   eit.discards=Rand(0,gametypediscards[i])
				  Else 
				   eit.discards=gametypediscards[i]
				  EndIf 
				  eit.time=Rnd(0,30*60)
				  eit.moves=Rand(eit.discards,eit.discards*4)
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
				Next
				EndMethod	
				EndRem							
	Method generatestatistics()
				For Local i=0 To gametypecount-1
				 gamestats[i]=New _gamestats
				 gamestats[i].init(Self,i)
				 For Local j=0 To 4
				  Local eit:_gamestatsentry=New _gamestatsentry
				  eit.init(gamestats[i])
				  If Rand(0,1)=0
				   eit.discards=Rand(1,gametypediscards[i]/2)
				  Else 
				   eit.discards=gametypediscards[i]
				  EndIf 
				  'eit.time=20*1000+(15*60*1000)*gametypetime[i]+ Rnd(0,5*1000*60)
				  eit.time=gametypetime[i]*60*1000+Rnd(60*500,60*2500)
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
				 'gamestats[i].entrylist.clear()
				Next
				EndMethod	

	Method takestatistics(showhighscore)
				If game.inuse And game.statsclosed=False And game.preview=False
				 game.statsclosed=True
				 Local e:_gamestatsentry=New _gamestatsentry
				 e.init(gamestats[currentgame])
				 e.time=game.time
				 e.discards=game.discards
				 e.undos=game.undos
				 e.moves=game.moves
				 e.tipps=game.tipps
				 If usermanagement.actual e.user=usermanagement.actual.name
				 Local h:_gamestatsentry=New _gamestatsentry
				 h.init(gamestats[currentgame],True)
				 h.copy(e)
				 gamestats[currentgame].highscorelist.sort()
				 If usermanagement.actual h.user=usermanagement.actual.name
				 updatemenumain()
				 If h.index()>=5
				  If game.ended
				   messagebox(strwonbutnotinhighscore,strok,gra.screenw/2,gra.screenh/2+20,font18,imessagewindow)
				  EndIf
				 EndIf
				 If h.index()<5 And showhighscore
				  '--------------------------------------------------------------------------
				  Local ox#=gra.screenw/2
				  Local oy#=gra.screenh/2+20-100
				  Local w0:_guiwindow
				  Local highclear:_guibutton=Null
				  Local wy#=256
				  Local wx#=256
				  Local wm=(wx/2-4)
				  Local y#=0
				  Local r#,g#,b#,a#
				  Local gt:_guitext
				  guisystem.saveactivitylist()
				  guisystem.setactivitylist(False)
				  gra.enabletext2d()

				  w0=New _guiwindow
				  w0.init(guisystem,ox-wx/2,oy,wx,wy,1,1,1)
				  windowinitmagic(w0,ihighscorewindow)
				
				  SetImageFont(font24)
				  Local gth:_guitext=New _guitext
				  Local hh$=strhighscore
				  gth.init(w0,wm-TextWidth(hh)/2,35,1,hh,1,0.8,0.5,font24)			
				
				  y=70
				  Local hhh$
				  Local it:TLink=gamestats[currentgame].highscorelist.firstlink()
				  
				  For Local i=0 To 4 
				   Local f#=1-Float(i)/Float(4)
				   r=1
				   g=0.5+0.3*f
				   b=0.2+0.2*f
				   a=1
				   If i<>h.index()
				    r=0.25+r*0.5
				    g=0.25+g*0.5
				    b=0.25+b*0.5
				    a=0.4
				   EndIf
			 	
				   If it
				    Local e:_gamestatsentry=_gamestatsentry(it.value())
				 	SetImageFont(font18)
				    gt=New _guitext
				    gt.init(w0,wm-15-TextWidth(e.user),y,1,e.user,r,g,b,font18)
				    gt.colortransformed.w=a
				    'gt.set()
				  
				    hhh=Int(e.score())
				    SetImageFont(font18)
				    gt=New _guitext
				    gt.init(w0,wm-TextWidth(hhh)/2,y,1,hhh,r,g,b,font18)
				    gt.colortransformed.w=a				
				    'gt.set()
				    'gt.position.setx(w0.width()/2-TextWidth(hhh)/2)
				
			 	    SetImageFont(font18)
				    hhh=timemstohhmmss(e.time)
				    gt=New _guitext
				    gt.init(w0,wm+15,y,1,hhh,r,g,b,font18)
				    gt.colortransformed.w=a	
				    'gt.set(hhh)
				    'gt.position.setx(w0.width()-10-TextWidth(hhh))
				    it=it.nextlink()
				   Else
			 	    hhh=(i+1)+strranknotset
				    gt=New _guitext
				    SetImageFont(font18)
				    gt.init(w0,wm-TextWidth(hhh)/2,y,1,hhh,r,g,b,font18)
				    gt.colortransformed.w=a	
				    'gt.position.setx()
				    'gt.set(hhh)
				   EndIf
				   y:+25
				  Next
				  'y:+10
				  'highclear=New _guibutton
				  'highclear.init(w0,25,152,226-50,50,"Löschen",-1)
				  'buttoninitmagic(highclear)				
				  w0.visibility(False)
				  w0.activity(False)
				  w0.fadeopacity(0)
				  w0.fadein()
				  w0.fadetarget(menuopacity)		
				  menugame.fadeout()
				  Local ap
				  If game 
				   ap=game.allowpick
				   game.allowpick=False
				  EndIf
				  Local q=False
				  FlushKeys()
				  FlushMouse()
				  Repeat
				   Local cc=GetChar()
				   guisystem.nullstates()
				   If animatestandard(cc) q=True
				   drawstandard()
				  Until guisystem.button Or KeyHit(KEY_ESCAPE) Or KeyHit(KEY_RETURN) Or MouseHit(MOUSE_LEFT) Or MouseHit(MOUSE_RIGHT) Or q
				  guisystem.button=Null
				  FlushKeys()
				  FlushMouse()
				  w0.fadeout(False,False,True)
				  showmenugame()
				  If game game.allowpick=ap
				  guisystem.restoreactivitylist()
				  '--------------------------------------------------------------------------
				 EndIf
				EndIf
				updatemenumain()
				EndMethod	
	Method setworldfieldgame()		
				If fireworkcards fireworkcards.deactivate()
				If fireworkrocket fireworkrocket.deactivate()
				If fireworkimage fireworkimage.deactivate()
				world.worldfield.clearrotation()
				world.worldfield.homogen.set(0,0,0)
	
				EndMethod
	Method setworldfieldmenu()				
				If fireworkcards fireworkcards.deactivate()
				If fireworkrocket fireworkrocket.deactivate()
				If fireworkimage fireworkimage.deactivate()
				world.worldfield.clearrotation()
				world.worldfield.homogen.set(0,0,0)

				EndMethod
	Method innergamemenu:Int()
				Local mx#=Float(MouseX())/Float(gra.screenw)
				Local my#=Float(MouseY())/Float(gra.screenh)
				If((mx>0.34)And(mx<0.59)And(my>0.68)And(my<0.81)) Return(True)
				Return(False)
				EndMethod
	Method animatestandard:Int(keypress)
				
				
				
				Local fadetimenew=clock.ms()
				Local ds#=(fadetimenew-gameopacitytime)*0.001
				gameopacitytime=fadetimenew				
				If pgamefadein
				 gameopacity:+guisystem.fadespeed*ds
				 If gameopacity>1
				  gameopacity=1
				  pgamefadein=False
				 EndIf
				EndIf
				If pgamefadeout
				 gameopacity:-guisystem.fadespeed*ds
				 If gameopacity<0
				  gameopacity=0
				  pgamefadeout=False
				  If game
				   game.clear()
				   game=Null
				  EndIf
				  setworldfieldmenu()				
				 EndIf
				EndIf				
				
				
				
				uhr.animate()
				
				If game And (pgamefadein Or pgamefadeout)
				 animatemenu()
				 animategame(keypress)
				ElseIf game=Null
				 animatemenu()
				Else
				 animategame(keypress)'3 ms (double deck, fenster)
				EndIf				

				

				
				
				'*************** 4.74 ms *******************************
				
				If gamepreview gamepreview.animate(clock,0)
				If gamemenu 
				 If gamemenu.animationlist.firstlink()
				  gamemenu.animate(clock,0)
				 EndIf
				EndIf
				animatemusic()
				
				If demoplay And gamepreview 
				 If gamepreview.animationlist.firstlink()=Null
				  Local nt#=clock.ms()
				  If (nt-demoplaylasttime)>1'500
				   demoplaylasttime=nt
				   gamepreview.autoplay()
				  EndIf
				 EndIf
				EndIf		
				
				'guisystem.animate()
				'*************** 4.74 ms ********************* nachher 0.15
				'*************** mit gametypemenu : 2.8 ms********************* 

				
				'*************** 0.16ms *********************
				
				guisystem.key=keypress				
				If game
				 If game.picklist.count()=0 guisystem.animate(keypress)
				Else
				 guisystem.animate(keypress)
				EndIf	
				'********************************************
				
											
				 guisystem.animatefade()
				'***********************************************

				'*********************************************************
				processparticlesourcetoclear()
				processparticletoclear()
				'If showfpswaitkeyoff=False
				 'If KeyDown(70) And KeyDown(80) And KeyDown(82)
				If keypress>0
				 If showfpsstatus=2 If keypress=83
				  showfpsstatus=0
				  If showfps showfps=False Else showfps=True
				 EndIf 
				 If showfpsstatus=1 If keypress=80 showfpsstatus=2 Else showfpsstatus=0
				 If showfpsstatus=0 If keypress=70 showfpsstatus=1 Else showfpsstatus=0
				EndIf
				 'EndIf
				'Else
				' If KeyDown(70)=False And KeyDown(80)=False And KeyDown(82)=False showfpswaitkeyoff=False

				'EndIf
				
				EndMethod
	Method animatemusic()
				If game
				 If musicman.channelmenu.playing() And musicman.channelmenufadedown=False And musicman.channelmenufadeup=False And musicman.channelmenufadeswitch=False
				  If (musicman.clock.ms()-musicman.starttime)>musicman.playtime[musicman.menuindex]
				   Local ni=musicman.menuindex+1
				   If ni>musicman.count-1 ni=0
				   musicman.channelmenufadeswitch=True
				   musicman.channelmenuswitchto=ni
				   If game game.music=ni
				   musicman.channelmenufadeup=False
				   musicman.channelmenufadedown=False
				  EndIf
				 EndIf	
				EndIf
				musicman.animate(paused)
				EndMethod							
	Method animatemenu()

				Local gedr=False
				If marked=2
				 If MouseDown(1)=False
				  If innergamemenu()
				   gedr=True	
				   marked=0
				  Else
				   marked=0
				  EndIf
				 Else
				  If innergamemenu()=False
				   marked=0
				  EndIf
				 EndIf
				EndIf
				If marked=1
				 If innergamemenu()
				  If MouseDown(1)
				   marked=2
				  EndIf
				 Else
				  marked=0
				 EndIf
				EndIf				
				If marked=0
				 If innergamemenu()
  				  marked=1
				 EndIf 
   			    EndIf				
				If(gedr) If(menumain.active()) 
				  If game 
				   If game.ended 
				    initgame(0,True)
				    transformgame()
				   EndIf
				  Else
				   initgame(0,True)
				   transformgame()
				  EndIf
				  gamefadein()
				  showmenugame()
				  ' game.scale(0.5)
				  activatestatusgame()
				EndIf


				
				kamin.animate()
				For Local ait:_particle=EachIn particlemenulist
				 ait.animate()
				Next	
			
				For Local cit:_candle=EachIn candlemenulist
				 If cit.flamme.active=False cit.flamme.activate()
				 cit.animate(clock)
				 cit.flamme.animate()
				Next				

				If smokemenu 
				 If smokemenu.flamme.active=False smokemenu.flamme.activate()
				 smokemenu.animate(clock)
				 smokemenu.flamme.animate()
				EndIf
				'If volumesoundfadein<1
				' volumesoundfadein:+0.005
				' If volumesoundfadein>1 volumesoundfadein=1
				'EndIf		
						
				EndMethod				
	Method animategame(keypress)
				'clock.animate()
				getmousevectorstatic()
				'uhr.animate()
				Rem
				If MouseDown(1) 
				 If pickedpage=Null
				  Local mx#=MouseX()
  			      If Mx>512
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
				EndRem
				
				For Local cit:_candle=EachIn candlegamelist
				 cit.animate(clock)
				Next
				For Local qit:_particlesource=EachIn particlesourcegamelist
				 qit.animate()
				Next
				'For Local ait:_particle=EachIn particlelistbackground
				' ait.animate()
				'Next				
				For Local ait:_particle=EachIn particlegamelist
				 ait.animate()
				Next				
				

				
				 'Local bt#=clockms()
				 'Print "test "+bt+"\n"
				 'For Local bench=0 To 999
				 transformscene()'wegen pilestretch				
 				 If game game.animate(clock,keypress)'**** 2.88 ms (double deck, fenster), bestätigt	
				 'Next
				 'Local at#=clock.ms()
				 'Local det#=at-bt
				 'Print "Zeit="+det/1000+"  at="+at+" bt="+bt					


				
				'--------------------------------------- backgroundcolor lighting ------------------------------------------

				
				Local v4:_vector4=New _vector4
				Local v3:_vector3=New _vector3
				Local cl#=0
				For Local lit:_light=EachIn world.lightlist
				 v3.add(lit.color)
				 cl:+1
				Next
				If cl>0 v3.mul(Float(1)/cl)
				v3.x=1-(0.8-v3.x)*0.5
				v3.y=1-(0.5-v3.y)*0.5
				v3.z=1-(0.2-v3.z)*0.5
				'v4.set(1,1-(Sin(clock.count*30)*0.05+0.05),1-(Sin(clock.count*40)*0.01+0.01),1)
				v4.set(v3.x,v3.y,v3.z,1)
				'background.mesh.vertexcolor(v4)
				v4.mul(255)
				v4.w=1
				backgroundcolor.copy(v4)
				
				'------------------------------------ world gravitation animate -----------------------------------------
				If game=Null
				 setworldfieldmenu()
				Else
				 'world.worldfield.homogen.set(0,0,1)
				 If game.ended
				  '------------------------------------ world gravitation animate -----------------------------------------
				  If world.worldfield.rotationlist.firstlink()=Null
				   world.worldfield.createrotationconstant(+5,0,10,0,0,-30,-0.3)
				  ' world.worldfield.createrotation(-5,0,10,0,0,-30,-5.4)
				  EndIf
				  world.worldfield.homogen.z=(0.5+Sin(clock.ms()*0.1)*0.5)*1
				  Local rit:TLink=world.worldfield.rotationlist.firstlink()
				  Local rot:_fieldrotation=_fieldrotation(rit.value())
				  rot.intensity=Sin(clock.ms()*0.005)*0.3
				 ' rit=rit.nextlink()
				  'rot=_fieldrotation(rit.value())
				 ' rot.intensity=Sin(clock.ms()*0.0035)*5
				  '------------------------------------ firework card animate -----------------------------------------
			
				  If game.effectindex=2
				   If fireworkcards.active=False fireworkcards.activate()
				   Local zz#=-1.1
				   Local gamma#=1
				   gamma=(zz-cam.position.z)/mousevector.z
				   fireworkcards.position.set(cam.position.x+mousevector.x*gamma,cam.position.y+mousevector.y*gamma,zz)
				   fireworkcards.rotation=Sin(  clock.ms()* Cos(clock.ms()*0.0001)*0.05   )*220
				   fireworkcards.vector.set(Cos(clock.ms()*0.1)*0.4,Sin(clock.ms()*0.15)*0.4,-0.5)
				  EndIf
				  '------------------------------------ firework rocket animate -----------------------------------------
				  If game.effectindex=1
				   If fireworkrocket.active=False fireworkrocket.activate()
				   fireworkrocket.position.set(Rnd(-10,10),Rnd(-10,10),Rnd(-7,-2))
				   fireworkrocket.generationrate=Rnd(2,5)
				   fireworkrocket.pqdeath.colorcurve.set(1,1,1,1  ,  0.5,0.2,0.1,0,  0,0,0,0, 0,0,0,0)
				   fireworkrocket.pqdeath.vectortolerance=Rnd(0.1,0.9)
			       fireworkrocket.pqlife.rotation=Sin(clock.ms()/10)*90'180+Sin(solitaire.clock.ms()/(50+Cos(solitaire.clock.ms()/20)*45))*360
				   fireworkrocket.pqlife.size=1+Sin(clock.ms()*0.23)*0.7
				  EndIf
				
				  '------------------------------------ firework image animate -----------------------------------------
				  If game.effectindex=0
				   If fireworkimage.active=False fireworkimage.activate()
				   fireworkimage.position.set(Rnd(-10,10),Rnd(-10,10),Rnd(-7,-2))
				   fireworkimage.rotationaxis.calculaterandom()
				  EndIf
				 Else
				  setworldfieldgame()
				 EndIf
				EndIf
				
			'	If game
			'	 If keypress=65 game.cameraposition[0].z:+0.2
			'	 If keypress=66 game.cameraposition[0].z:-0.2	
			'	EndIf
			    
				'------------------------------------ watchdog speed animate -----------------------------------------
				If watchdogspeed 
				 If watchdogspeed.hintgiven=False
				  Local wdanim=False
				  If game
				   If game.activepreparation()=False And paused=False And gameopacity=1 And fullscreen And fastvideomode=False And gra.screenw<>1024 
				   'If game.activepreparation()=False And paused=False And gameopacity=1 And fastvideomode=False
				    wdanim=True
				   EndIf
				  EndIf
				  If wdanim 
				   If watchdogspeed.animate()>0
				    Local hhh$=strwatchdogspeedhint'+"             FPS,average="+watchdogspeed.fpsresultaverage+"   FPS,maximum="+watchdogspeed.fpsresultmaximum+"   FPS,variance="+watchdogspeed.fpsresultvariance+"     recorded values : " 
				   ' For Local wit:_watchdogspeedentry=EachIn watchdogspeed.fpslist
				   '  hhh:+Int(wit.value)+"  "
				   ' Next
				    watchdogspeed.hintgiven=True
				    If abfrage(hhh,stryes,strno,gra.screenw/2,gra.screenh/2,font24,imessagewindow) 
					 'auch beschleunigen
				 	 systemaccellerate=True
				     cbsp.checked=True
					 If game game.markforupdateshadow(Null)
				     cbfv.checked=True
				     fastvideomode=True
					 updatefullscreenhelp()
					 updatemenumain();
				     graphics_setup(0)
				    EndIf
				   EndIf
				  Else
				   watchdogspeed.reset()
				  EndIf
				 EndIf
				EndIf
				
				EndMethod
	Method drawstandard()				
				Local op10#=windowstatistics.pfadeopacity
				Local op0#=windowranks.pfadeopacity
				Local op1#=windowoptionsacoustics.pfadeopacity
				Local op2#=windowoptionsgraphics.pfadeopacity
				Local op3#=windowoptionsgame.pfadeopacity
				Local op4#=windowoptionscard.pfadeopacity
				Local op40#=windowoptionscardfront.pfadeopacity
				Local op5#=windowoptionscredits.pfadeopacity
				Local op6#=windowgametype.pfadeopacity
				Local op7#=windowuser.pfadeopacity
				Local op8#=windowusercreate.pfadeopacity
				Local op9#=cardgeneratorwindow.pfadeopacity
				
				'SetColor(0,0,0)
				'SetBlend(SOLIDBLEND)
				'SetBlend(MASKBLEND|ALPHABLEND)
				blackscreenopacity=op0+op1+op2+op3+op4+op40+op5+op6+op7+op8+op9+op10
				If showedoptionscard=False Or showedmenugametype=False blackscreenopacity=1
				If blackscreenopacity>1 blackscreenopacity=1
				blackscreenopacity:*0.6
				blackscreentransparency=1-blackscreenopacity
				
				If game And (pgamefadein Or pgamefadeout)
				 'beides zeichnen
				 'Print "draw both"
				 drawgame()
				 drawmenu(1-gameopacity)
				ElseIf game=Null
				 'nur menu zeichnen
				

				 drawmenu()
				Else
				 'spiel zeichnen
				'Print "draw g"
				

				 drawgame()
				EndIf
				
				



				'If buttonstart.visible=True' And buttongamenew.visible=True'beides zeichnen
				' drawmenu()
				'ElseIf buttonstart.visible=True And buttongamenew.visible=False'nur menu zeichnen
				' drawmenu()
				'ElseIf buttongamenew.visible=True And buttonstart.visible=False'nur spiel zeichnen
				' drawgame()		
				'EndIf
				
				
				
				gra.enabletext2d()		
				'drawblackscreen()

				guisystem.draw(gra,cam)' **** schnell
				guisystem.drawcursor(gra,cam)
				drawblendscreen()
				drawpause()
				
				If showfps
				 '*********************+ FPS **************************
				 fpscount:+1
				 Local nt#=clock.ms()
				 Local dt#=nt-fpstimeold
				 If (dt>1000)
				  fpstimeold=nt
				  fpstext=Int(Float(fpscount)/(dt*0.001))
				  If videosynchronisation fpstext="FPS(s) = "+fpstext Else fpstext="FPS(a) = "+fpstext

				  fpscount=0
				 EndIf
				 SetImageFont(font30)
				 SetBlend(MASKBLEND|ALPHABLEND)
				 SetAlpha(1)
				 SetColor(0,255,0)
				 DrawText(fpstext,gra.screenw/2,10)
				EndIf
				'If blendscreenopacity>0				
				' gra.swap(True)
				'Else 
				 gra.swap(videosynchronisation)
				'EndIf
				'Delay(100)
				'WaitKey
				EndMethod		
	'Method drawblackscreen()

	'			DrawRect(0,0,gra.screenw,gra.screenh)
				
		'		EndMethod											
    Method drawmenu(op#=1)'**** 9ms ?
  				' Print "draw mm op=m"+op
				drawmenubackground(op)
				drawmenueffects(op)	
				EndMethod
	Method drawmenubackground(op#)
				gra.enabletext2d()
				Local li#=kamin.intensity()
				
				backgroundcolor.set(255,255,255,1)
				
				Local ol#=li'(li*0.5)+0.5'need opacity of lighted images between 70 and 100%
				Local o0#=1-ol'*(1-li)
				Local o1#=ol*li
				If op=1
				 SetBlend(SOLIDBLEND)
				 SetColor(backgroundcolor.x*blackscreentransparency,backgroundcolor.y*blackscreentransparency,backgroundcolor.z*blackscreentransparency)
				 DrawImageRect imenubackgroundl[0],0,0,gra.screenw,gra.screenh	
				
				 If systemaccellerate=False
				  SetColor(backgroundcolor.x*blackscreentransparency,backgroundcolor.y*blackscreentransparency,backgroundcolor.z*blackscreentransparency)
				  SetBlend(SOLIDBLEND|ALPHABLEND)
				  SetAlpha(o0)
				  DrawImageRect(imenubackgroundl[1],0,0,gra.screenw,gra.screenh)
				  If o1>0
				   SetAlpha(o1)
				 '  DrawImageRect(imenubackgroundl[2],0,0,gra.screenw,gra.screenh)
				  EndIf
				  SetBlend(SOLIDBLEND|ALPHABLEND)
				  SetColor(255*blackscreentransparency,255*blackscreentransparency,255*blackscreentransparency)
				  SetAlpha(1)
				  DrawImage(ilogo,0,0)
				 EndIf
				 

				 SetColor(255*blackscreentransparency,255*blackscreentransparency,255*blackscreentransparency)
			     SetAlpha(li*0.5+0.5)
				 SetBlend(MASKBLEND|ALPHABLEND)
				 DrawImageRect imenubackgroundglow,gra.screenw*0.42,gra.screenh*0.59,gra.screenw*0.15722,gra.screenh*0.0820
				Else
				 gra.blendmultiplicative()
				 SetAlpha(op)
				 SetColor(backgroundcolor.x*blackscreentransparency,backgroundcolor.y*blackscreentransparency,backgroundcolor.z*blackscreentransparency)
				 DrawImageRect imenubackgroundl[0],0,0,gra.screenw,gra.screenh	
				 
				 If systemaccellerate=False
				  SetColor(backgroundcolor.x*blackscreentransparency,backgroundcolor.y*blackscreentransparency,backgroundcolor.z*blackscreentransparency)
				  SetAlpha(o0*op)
				  DrawImageRect(imenubackgroundl[1],0,0,gra.screenw,gra.screenh)
				  If o1>0
				   SetAlpha(o1*op)
				  ' DrawImageRect(imenubackgroundl[2],0,0,gra.screenw,gra.screenh)
				  EndIf
				  SetColor(255*blackscreentransparency,255*blackscreentransparency,255*blackscreentransparency)
				  SetAlpha(op)
				  DrawImage(ilogo,0,0)
				 EndIf
				 

				 SetColor(255*blackscreentransparency,255*blackscreentransparency,255*blackscreentransparency)
			     SetAlpha((li*0.5+0.5)*op)
				 gra.blendadditive()
				 DrawImageRect imenubackgroundglow,gra.screenw*0.42,gra.screenh*0.59,gra.screenw*0.15722,gra.screenh*0.0820
				EndIf
				EndMethod					
	Method drawmenueffects(op#)
				Local gh#=768
				Local gw#=1024
				Local m#=(gh+gh)*0.5
				
				
				cam.position.set(0,6,-20)
				cam.view.set(0,0,2)
				cam.up.set(0,gh/m,0)
				cam.side.set(gw/m,0,0)				
				
				Local n:_vector3=New _vector3
				Local e:_vector3=New _vector3
				Local wy#=-6,wx#=-7
				n.set(0,1,0)
				rotatevector(n,cam.view,wy,e);cam.view.copy(e)
				rotatevector(n,cam.side,wy,e);cam.side.copy(e)
				
				n.set(1,0,0)
				rotatevector(n,cam.up,wx,e);cam.up.copy(e)
				rotatevector(n,cam.view,wx,e);cam.view.copy(e)
				rotatevector(n,cam.side,wx,e);cam.side.copy(e)
				
				
				gra.driver=D3D7GraphicsDriver()
				gra.device=gra.driver.Direct3DDevice7()
				
				world.transform(gra,cam)
				If uhr			
				 uhr.opacity=op
				 uhr.draw(gra,cam)
				EndIf			
				
				
				drawmenufigure(op)

				If gamemenu And buttonstart.pfadeopacity>0
				 drawgamemenu(op*op*op*op*op)
				EndIf

				Local li#=kamin.intensity()
				Local i:timage=icandleholdermenu
				gra.enabletext2d()
				gra.blendmultiplicative()
				SetBlend(SOLIDBLEND|MASKBLEND)
				SetColor(255*blackscreentransparency,255*blackscreentransparency,255*blackscreentransparency)'(0.9+li*0.1)*255*blackscreentransparency,(0.7+li*0.2)*255*blackscreentransparency,(0.4+li*0.1)*255*blackscreentransparency)
				SetAlpha(1*op)
				Local x#=(Float(520)/Float(1920))*gra.screenw
				Local y#=(Float(959)/Float(1440))*gra.screenh
				Local w#=(Float(ImageWidth(i))/Float(1920))*gra.screenw
				Local h#=(Float(ImageHeight(i))/Float(1440))*gra.screenh					
				DrawImageRect(i,x,y,w,h)
				
				world.transform(gra,cam)
				For Local ait:_particle=EachIn particlemenulist
				 ait.draw(gra,cam)
				Next	

				
				
				
				
				For Local cat:_candle=EachIn candlemenulist
				 cat.opacity(op)
				 cat.draw(gra,cam)
				Next			
				If kamin
				 kamin.opacity(op)
				EndIf
					

	
					
					
					
				EndMethod		
	Method drawmenufigure(op#)
	   			gra.enabletext2d()
				For Local fit:_figuredrawentry=EachIn figuredrawlist
				 fit.draw(gra,cam,op)
				Next
				'------- erzeugen
				If usermanagement.actual
				 If usermanagement.actual.index<>figureindexold
				  figureindexold=usermanagement.actual.index
				  For Local fit:_figuredrawentry=EachIn figuredrawlist
				   fit.fadeout()
				  Next
				  Local fde:_figuredrawentry=New _figuredrawentry
				  If usermanagement.actual.index=0 fde.init(Self,prinzessin);
				  If usermanagement.actual.index=1 fde.init(Self,dame);
				  If usermanagement.actual.index=2 fde.init(Self,ritter);
				  If usermanagement.actual.index=3 fde.init(Self,zauberer);
				  If usermanagement.actual.index=4 fde.init(Self,fee);
				  If usermanagement.actual.index=5 fde.init(Self,drachen);
				  If usermanagement.actual.index=6 fde.init(Self,koenig);
				  If usermanagement.actual.index=7 fde.init(Self,lehrerin);
				 EndIf
				Else
				 For Local fit:_figuredrawentry=EachIn figuredrawlist
				  fit.fadeout()
				 Next
				 figureindexold=-1
				EndIf
				'------- loeschen
				Local l:TList=CreateList()
				For Local fit:_figuredrawentry=EachIn figuredrawlist
				 If fit.pfadeout
				  If fit.pfadeopacity=0
				   l.addlast(fit)
				  EndIf
				 EndIf
				Next
				If l.firstlink()
				 For Local fit:_figuredrawentry=EachIn l
				  fit.clear()
				 Next
				 l.clear()
				EndIf
				
				Rem
				If usermanagement.actual
				 If usermanagement.actual.index=0 And sister
				  sister.opacity=op
				  sister.draw(gra,cam)
				 EndIf
				 If usermanagement.actual.index=1 And dame 
				  dame.opacity=op
				  dame.draw(gra,cam)
				 EndIf
				 If usermanagement.actual.index=2 And ritter
				  ritter.opacity=op
				  ritter.draw(gra,cam)
				 EndIf
				 If usermanagement.actual.index=3 And zauberer
				  zauberer.opacity=op
				  zauberer.draw(gra,cam)
				 EndIf
				EndIf
				EndRem
				EndMethod

							
	Method drawgame()
				Local o:_vector3=New _vector3
				Local c:_vector4=New _Vector4
				Local h$
				'cam.position.set(0,0,-33)
				'cam.view.set(0,0,1.8)
				'cam.up.set(0,0.95,0)
				'cam.side.set(1.15,0,0)
				'world.transform(gra,cam)

				
				'SetColor(255,255,255)
				'SetBlend(SOLIDBLEND)
				'SetAlpha(1)
				'DrawRect(0,0,256,256)
				Rem
				transformscene()
				world.transform(gra,cam)
				If game
				
				EndIf
				gra.enabletext2d()
				GrabImage(isi,0,0)
				EndRem
				
				
				transformbackground()
				background.draw(gra,cam)
				'gra.enabletext2d()
				'SetAlpha(1)
				'SetBlend(SOLIDBLEND)
				'SetColor(backgroundcolor.x,backgroundcolor.y,backgroundcolor.z)
				'DrawImageRect ibackground,0,0,gra.screenw,gra.screenh
				
			
				
				
				

				Local pit:_page
				transformscene()

				gra.wrap(True)
				
				
				If game
				
			 
			  Rem
				 Local o0:_vector3=New _vector3
				 Local o1:_vector3=New _vector3
				 Local co:_vector4=New _vector4
				 co.set(0,1,1,1)
				 o0.set(game.rectangletransformed[0].x,game.rectangletransformed[0].y,0)
				 o1.set(game.rectangletransformed[1].x,game.rectangletransformed[0].y,0)
				 gra.line(o0,o1,co)
				 o0.set(game.rectangletransformed[1].x,game.rectangletransformed[0].y,0)
				 o1.set(game.rectangletransformed[1].x,game.rectangletransformed[1].y,0)
				 gra.line(o0,o1,co)
				 o0.set(game.rectangletransformed[1].x,game.rectangletransformed[1].y,0)
				 o1.set(game.rectangletransformed[0].x,game.rectangletransformed[1].y,0)
				 gra.line(o0,o1,co)
				 o0.set(game.rectangletransformed[0].x,game.rectangletransformed[1].y,0)
				 o1.set(game.rectangletransformed[0].x,game.rectangletransformed[0].y,0)
				 gra.line(o0,o1,co)
			EndRem	 
				 'gsamtes zeichnen : 2.58 ms bei 1 deck , 4.35 ms bei 2 decks***************
				 game.drawpile(gra,cam)
				 game.drawlist.sort()
				'******************+  zusammen 12.2 ms ****************
				 If systemaccellerate=False drawgameshadowcurving(False,0.2,0.35)'DrawImageRect(isi,-15,-15,32,32)  7,6ms
				 game.drawpilecard(gra,cam)' ~ 5.3ms
				' If systemaccellerate=False game.drawpilecardshadowneigung(gra,cam)	 
				 If systemaccellerate=False drawgameshadowcurving(True,0.2,0.35)
				 '*****************************************************
				 game.drawcard(gra,cam)
				
				 background.drawfront(gra,cam)
				 transformscene()
				 gra.wrap(True)
				 game.drawcurving(gra,cam)
      			
				 '******************************************

				 Rem
				 game.drawpile(gra,cam)
				 gra.blendmultiplicative()				
				 For Local pit:_pile=EachIn game.pilelist
				  For Local cit:_card=EachIn pit.cardlist
				   'If cit.picked=False And cit.pickending=False
				    For Local sit:_shadow=EachIn cit.shadowlist
				     sit.calculateopacity()
				     sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.2)
				     sit.draw(gra,cam)
				    Next
				   'EndIf
				  Next
				 Next
				 For Local cit:_card=EachIn game.cardlist
				  For Local sit:_shadow=EachIn cit.shadowlist
				   sit.calculateopacity()
				   sit.mesh.vertexalpha(cit.opacity*sit.opacity*0.2)
				   sit.draw(gra,cam)
				  Next
				 Next	
				
				 gra.wrap(True)
				 If  game game.draw(gra,cam)							
				 EndRem
				
				
				'------------------------------------------- pile info zeichnen ----------------------------------
				 If mouseoverpile And menugame.active() And game.pileinfo
				  messagepileinfo(game.pileinfoname,game.pileinfodescription0,game.pileinfodescription1);
				 EndIf				
								

				
				 For Local pit:_pileinfoentry=EachIn pileinfolist
				  pit.draw(gra,cam);
				 Next
				 '------- loeschen
				 Local l:TList=CreateList()
				 For Local pit:_pileinfoentry=EachIn pileinfolist
				  If pit.pfadeout
				   If pit.pfadeopacity=0
				    l.addlast(pit)
				   EndIf
				  EndIf
				 Next
				 If l.firstlink()
				  For Local pit:_pileinfoentry=EachIn l
				   pit.clear()
				  Next
				  l.clear()
				 EndIf				

				
				 '------------------------------------- status bar zeichnen --------------------------------
				  For Local sit:_statusbarentry=EachIn statusbarlist
				   sit.draw(gra,cam);
				  Next
				  '------- loeschen
				  For Local sit:_statusbarentry=EachIn statusbarlist
				   If sit.pfadeout
				    If sit.pfadeopacity=0
				     l.addlast(sit)
				    EndIf
				   EndIf
				  Next
				  If l.firstlink()
				   For Local sit:_statusbarentry=EachIn l
				    sit.clear()
				   Next
				   l.clear()
				  EndIf				
				EndIf
				
				
				
				gra.blend(False)
				world.draw(gra,cam)
				Rem
				'calculate vertexlight For pages 
				For pit=EachIn pagelist
				 pit.meshfront.clearvertexlight()
				 For Local lit:_light=EachIn world.lightlist
				 pit.meshfront.determinevertexlight(lit)
				 Next
				Next
				'links pages zeichnen
				For pit=EachIn pagelist
				 If pit.parax<0 pit.meshfront.draw(gra,cam)
				Next
				'rechts pages zeichnen
				Local li:TLink=pagelist.lastlink()
				Local ci=pagelist.count()
				For Local i=0 To ci-1
				 pit=_page(li.value())
				 If pit.parax>=0 pit.meshfront.draw(gra,cam)
				 li=li.prevlink()
				Next
				EndRem



		

				transformscene()
				gra.blendadditive()
				'For Local ait:_particle=EachIn particlelistbackground
				' ait.draw(gra,cam)
				'Next
				For Local cat:_candle=EachIn candlegamelist
				 If cat.sparked=False Or sparkingmouse=False cat.draw(gra,cam)
				Next
				'transformscene()
				For Local ait:_particle=EachIn particlegamelist
				 ait.drawshadow(gra,cam)
				Next
				For Local cat:_candle=EachIn candlegamelist
				 If cat.sparked=True And sparkingmouse=True cat.draw(gra,cam)
				Next
				For Local ait:_particle=EachIn particlegamelist
				 ait.draw(gra,cam)
				Next
				
				
				
				If game.ended
				 gra.enabletext2d()
				 SetImageFont(font30)
				 Local o:_vector3=New _vector3
				 Local c:_vector4=New _Vector4
				 Local h$
				 h=strgratulation
				 o.set(gra.screenw/2-TextWidth(h)/2,gra.screenh/2-TextHeight(h)/2-100,2)
				 c.set(1,0.8,0.2,1)
				 Drawguitext(h,o,c)
				 world.transform(gra,cam)	
				EndIf
							
				
				'gra.blend(False)
				'gra.enabletext2d()
				'guisystem.draw(gra,cam)
				'guisystem.drawcursor(gra,cam)
			'	gra.swap()
				EndMethod
					
	Method transformbackground()
				'cam.position.set(0,0,-1)
				'cam.view.set(0,0,1)
				'cam.up.set(0,1,0)
				'cam.side.set(1,0,0)				
				'world.transform(gra,cam)	
				cam.position.set(0,-2,-33)
				cam.view.set(0,0,2)
				cam.up.set(0,0.9,0)
				cam.up.norm()
				cam.side.set(1.1,0,0)			
				world.transform(gra,cam)				
							
				EndMethod
	Method transformbackgroundcandle()
				
				cam.position.set(0,-4,-33)
				cam.view.set(0,0.18,1.8)
				cam.up.set(0,0.8,-0.1)
				cam.up.norm()
				cam.side.set(1.1,0,0)			
				world.transform(gra,cam)				
				EndMethod				
	Method transformscene()
				'If game
				' cam.position.copy(game.cameraposition[0])
				'Else
				 cam.position.set(0,-2,-33)
				'EndIf
				cam.view.set(0,0,1.8)
				
				'cam.up.set(0,0.5, (-cam.view.y/cam.view.z)*0.5)
				'cam.up.norm()
				'cam.up.mul(0.8)
				cam.up.set(0,0.8,0)
				cam.side.set(1.1,0,0)
				
				cam.view.rotx(-5.5)
				cam.up.rotx(-5.5)
				world.transform(gra,cam)
			
				EndMethod
	Method getmousevectorstatic()
				'transformscene()
Rem
				If game
				 cam.position.copy(game.cameraposition[0])
				Else
				 cam.position.set(0,-4,-33)
				EndIf
				cam.view.set(0,0.18,1.8)
				cam.up.set(0,0.5, (-cam.view.y/cam.view.z)*0.5)
				cam.up.norm()
				cam.up.mul(0.8)
				cam.side.set(1.1,0,0)	
EndRem

				
				transformscene()
				getmousevector(gra,cam)
				EndMethod						
	Method transformgame()
	  			If game
	  				
	 			 Local h:_vector3=New _vector3
				 h.copy(game.translationglobal)
				 h.mul(-1)
	 			 game.translate(h)
	 			 game.scale(1.0/game.scaleglobal)
				 
				 Local r#[2,2]
				 r[0,0]=-13.2
				 r[0,1]=-12.5
				 r[1,0]=18.5
				 r[1,1]=10
				 Local smx#=(r[0,0]+r[1,0])*0.5
				 Local smy#=(r[0,1]+r[1,1])*0.5
				 Local sdx#=Abs(r[1,0]-r[0,0])
				 Local sdy#=Abs(r[1,1]-r[0,1])
				
				 Local gmx#=(game.rectangle[1].x+game.rectangle[0].x)*0.5
				 Local gmy#=(game.rectangle[1].y+game.rectangle[0].y)*0.5
				 Local gdx#=Abs(game.rectangle[1].x-game.rectangle[0].x)
				 Local gdy#=Abs(game.rectangle[1].y-game.rectangle[0].y)
				 
				 Local ds:_vector3=New _vector3
				 ds.x=smx
				 ds.y=smy
				 ds.z=0
				
				 Local dn:_vector3=New _vector3
				 dn.set(-gmx,-gmy,0)				
				 game.translate(dn)
				
				 Local dx#=gdx/sdx
				 Local dy#=gdy/sdy
				 Local f# 
				
				 If dx>dy
				  f=sdx/gdx
				  'Print "dx="+dx
				  'Print "sdx="+sdx
				  'Print "gdx="+gdx
				  'Print "game.rectangle[1].x="+game.rectangle[1].x+"   game.rectangle[0].x="+game.rectangle[0].x
				 Else
				  'Print "dy"
				  f=sdy/gdy
				 EndIf
				 'Print "f="+f
				 game.scale(f)
				 game.translate(ds)
				
				EndIf
				EndMethod
	Method updatescene()
				'world.lightlist.clear()
				'Local l:TList=CreateList()
				For Local lit:_light=EachIn world.lightlist
				' If lit.noshadow=False l.addlast(lit)
				Next
				'For Local lit:_light=EachIn l
				' lit.deinsert()
				'Next		
				'l.clear()		
				'guisystem.background[0].clear()'image=imenubackground[currentscene]		
				'guisystem.background[0].addlast(imenubackground[currentscene])
				currentscene=0
				'If currentscene=0'sonne
				' sceneambient[0].set(0.53,0.4,0.2)
				' scenediffuse[0].set(1,0.9,0.28)
				 'Local ll:_light=New _light
				 'll.init(world,-30,30,-60,0,0,0,9000)						
				 'll.color.copy(scenediffuse[0])
				 If game game.sigmadiffuse(cardlighting)
				'EndIf
				Rem
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
				EndRem
				'world.lightambient.copy(sceneambient[currentscene])
				If game game.createshadow()
				EndMethod					
			
	Method usernamendialog:String(ox#,oy#)
				EndMethod

'******************************************************************************************************************
'										S U P P L Y 
'******************************************************************************************************************
	Method buttoninitmagic(g:_guibutton,f:timagefont=Null,bs:timage=Null,bsh:timage=Null,bl:timage=Null,blh:timage=Null)
				Local v:_vector4=New _vector4
				v.set(0.9,0.65,0.4,1)
				g.centrictext=True
				g.font=font18
				g.background[0].addlast(ibuttonu)				
				g.background[0].addlast(ibuttons)				
				g.background[0].addlast(ibuttonm)
				g.background[0].addlast(ibuttonl)
				g.background[0].addlast(ibuttong)
				g.background[1].addlast(ibuttonuhl)
				g.background[1].addlast(ibuttonshl)
				g.background[1].addlast(ibuttonmhl)
				g.background[1].addlast(ibuttonlhl)
				g.background[1].addlast(ibuttonghl)
				g.background[2].addlast(ibuttonuson)
				g.background[2].addlast(ibuttonsson)
				g.background[2].addlast(ibuttonmson)
				g.background[2].addlast(ibuttonlson)
				g.background[2].addlast(ibuttongson)
				g.shadowimage[0].addlast(ibuttonshadow)
				g.shadowimage[1].addlast(ibuttonshadowon)
				g.shadowimage[2].addlast(ibuttonshadowson)
				g.shadowimageboardening=(g.width()/Float(128))*7
				g.settextcolor(v)
				g.color.set(1,1,1,1)
				g.colortransformed.copy(g.color)
				g.textcolormark.set(0.05,0.2,0.3,0)
				g.textcoloractive.set(0.1,0.4,0.6,0)					
				g.setshadow(7,7,0.6)
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
				g.setshadow(7,7,0.4)
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
				g.setshadow(7,7,0.4)
				g.font=font24
				EndMethod
				
	Method checkboxinitmagic(g:_guicheckbox)
				g.background[0].addlast(icheckbox)
				g.background[1].addlast(icheckboxhl)
				g.background[2].addlast(icheckboxhl)
				g.setcheckimage(icheck)
				g.checkimagewidth=g.width()
				g.checkimageheight=g.height()
				g.checkposition.x=0
				g.checkposition.y=0
				g.setshadow(3,3,0.4)
				EndMethod
	Method trackbarinitmagic(g:_guitrackbar)				
				g.background[0].addlast(itrackbar)
				g.background[1].addlast(itrackbar)
				g.background[2].addlast(itrackbar)
				g.sliderimage=itrackbarbutton
				g.displaymultiplier=100
				g.displayaddition=" %"
				g.displayrounding=True				
				
				g.shadow=False
				EndMethod
	Method listboxinitmagic(g:_guilistbox)		
				g.clearbackground()
				g.color.set(1,1,1,0.5)
				'g.color.set(0.5,0.28,0.07,0.2)
				'g.background[0].addlast(igranit)
				'g.background[1].addlast(igranit)
				'g.background[2].addlast(igranit)
				'g.frameimage=ilistboxl
				g.frameimagehorizontal=iscrollbarhorizontal
				Local sh:_guiscrollbarvertical=g.scrollbarvertical
				sh.barimage=iscrollbar
				sh.barimagewidth=6
				sh.sliderimage=iscrollbarbutton	
				sh.buttonup.background[0].addlast(ilistboxbuttonup)
				sh.buttonup.background[1].addlast(ilistboxbuttonup)
				sh.buttonup.background[2].addlast(ilistboxbuttonup)
				sh.buttondown.background[0].addlast(ilistboxbuttondown)
				sh.buttondown.background[1].addlast(ilistboxbuttondown)
				sh.buttondown.background[2].addlast(ilistboxbuttondown)
				sh.buttonup.size.set(20,20,0)
				sh.buttondown.size.set(20,20,0)
				g.scrollstepwheel=20
				sh.scrollstepbutton=4
				sh.scrollstepbar=(g.height()-16)-20
				sh.scrollbuttonsmooth=True
				sh.barsmooth=False	
				sh.setshadow(3,3,0.4)			
				sh.buttonup.setshadow(3,3,0.4)			
				sh.buttondown.setshadow(3,3,0.4)			
				g.scrollfriction=0.0			
				g.shadow=False
			    g.drawframe=True
				EndMethod
	Method windowinitmagic(w:_guiwindow,i:timage)
				w.background[0].addlast(i)
				w.background[1].addlast(i)
				w.background[2].addlast(i)
				EndMethod				
	Method comboboxinitmagic(g:_guicombobox)
				Local v:_vector4=New _vector4
				v.set(0.0,0.0,0.0,1)
				g.background[0].addlast(ibuttonu)
				g.background[0].addlast(ibuttons)
				g.background[0].addlast(ibuttonm)
				g.background[0].addlast(ibuttonl)
				g.background[1].addlast(ibuttonuhl)
				g.background[1].addlast(ibuttonshl)
				g.background[1].addlast(ibuttonmhl)
				g.background[1].addlast(ibuttonlhl)
				g.background[2].addlast(ibuttonuhl)
				g.background[2].addlast(ibuttonshl)
				g.background[2].addlast(ibuttonmhl)
				g.background[2].addlast(ibuttonlhl)
				Rem
				g.background[0].addlast(ibutton10969off)
				g.background[1].addlast(ibutton10969on)
				g.background[2].addlast(ibutton10969on)
				EndRem
				v.set(1,1,1,1)
				g.color.copy(v)
				g.colortransformed.copy(v)
				listboxinitmagic(g.listbox)		
				
				g.listbox.frameimage=ilistboxwindow
				'g.listbox.position.setz(g.position.getz()-3)
				g.listbox.setshadow(7,7,0.4)
				buttoninitmagic(g.button)
				g.button.centrictext=True
				g.button.clearbackground()
			    g.button.background[0].addlast(ibuttonu)
				g.button.background[1].addlast(ibuttonuhl)
				g.button.background[2].addlast(ibuttonuhl)
								'If f=Null g.font=font18 Else g.font=f
				g.text.color.set(1,0.8,0.5,1)
				g.text.colortransformed.set(1,0.8,0.5,1)
				EndMethod					

	Method guihelpinitmagic(g:_gui)
				Local gh:_gui=g.help
				If gh
				 Local gw:_guiwindow=_guiwindow(gh)
				 If gw
				  guihelpinitmagicy=0
				  guihelpinitmagicw=gw
				  guihelpinitmagicwindow()				

				 EndIf
				EndIf
				EndMethod				
	Method guihelpinitmagicwindow()
				'Print "GUI HELP INIT Wndow 0 y="+y
				Local d0#=Abs((guihelpinitmagicw.width()/guihelpinitmagicw.height())-(Float(512)/Float(180-50)))
				Local d1#=Abs((guihelpinitmagicw.width()/guihelpinitmagicw.height())-(Float(512)/Float(111-40)))
				Local d2#=Abs((guihelpinitmagicw.width()/guihelpinitmagicw.height())-(Float(512)/Float(80 -30)))
				Local d3#=Abs((guihelpinitmagicw.width()/guihelpinitmagicw.height())-(Float(300)/Float(180 -50)))
				If d0<=d1 And d0<=d2 And d0<=d3
				 guihelpinitmagicw.background[0].addlast(iguihelp512180)
				  guihelpinitmagicw.background[1].addlast(iguihelp512180)
				  guihelpinitmagicw.background[2].addlast(iguihelp512180)	
				  guihelpinitmagicw.size.setx(guihelpinitmagicw.width()+30)
				  guihelpinitmagicw.size.sety(guihelpinitmagicw.height()+30)							
				ElseIf d1<=d0 And d1<=d2 And d1<=d3
				  guihelpinitmagicw.background[0].addlast(iguihelp512111)
				  guihelpinitmagicw.background[1].addlast(iguihelp512111)
				  guihelpinitmagicw.background[2].addlast(iguihelp512111)				
				  guihelpinitmagicw.size.setx(guihelpinitmagicw.width()+25)
				  guihelpinitmagicw.size.sety(guihelpinitmagicw.height()+25)							
				ElseIf d2<=d0 And d2<=d1 And d2<=d3
				  guihelpinitmagicw.background[0].addlast(iguihelp51280)
				  guihelpinitmagicw.background[1].addlast(iguihelp51280)
				  guihelpinitmagicw.background[2].addlast(iguihelp51280)				
				  guihelpinitmagicw.size.setx(guihelpinitmagicw.width()+20)
				  guihelpinitmagicw.size.sety(guihelpinitmagicw.height()+20)							
				 ElseIf d3<=d0 And d3<=d1 And d3<=d2
				  guihelpinitmagicw.background[0].addlast(iguihelp300180)
				  guihelpinitmagicw.background[1].addlast(iguihelp300180)
				  guihelpinitmagicw.background[2].addlast(iguihelp300180)				
				  guihelpinitmagicw.size.setx(guihelpinitmagicw.width()+27)
				  guihelpinitmagicw.size.sety(guihelpinitmagicw.height()+27)							
				 EndIf

				guihelpinitmagicw.position.sety(guihelpinitmagicy)
				'Print "GUI HELP INIT Wndow 1 y="+y
				guihelpinitmagicw.color.set(1,1,1,1)
				guihelpinitmagicw.colortransformed.copy(guihelpinitmagicw.color)
				guihelpinitmagicw.fadetarget(1)
				guihelpinitmagicw.setshadow(10,10)

				guihelpinitmagicw.animate(0)				
				'Print "GUI HELP INIT Wndow 2 y="+y
				'Local dy#=y
				Local gwl:_guiwindow=guihelpinitmagicw
				For Local git:_gui=EachIn gwl.childlist
				 Local gwi:_guiwindow=_guiwindow(git)
				 If gwi
				  'Print "dy="+dy+"  gw.height()="+gw.height()
				  guihelpinitmagicy:+guihelpinitmagicw.height()
				  guihelpinitmagicw=gwi
				  guihelpinitmagicwindow()
				 Else  
				  git.position.setx(git.position.getx()+10)
				  git.position.sety(git.position.gety()+10)
				 EndIf
				Next
				EndMethod
'******************************************************************************************************************
'										M A I N M E N U 
'******************************************************************************************************************
	Method createmenumain()
				menumain=menuman.createmenu()

				Local kit:_guibutton
				Local bw#=buttonwidth
				Local bh#=buttonheight-4
				Local y#=100
				Local x#=850
				Local off#=10
				Local wii:_guiwindow				
				Local tit:_guitext

				tmmcurgame=New _guitext
				tmmcurgame.init(guisystem,0,-50,2,"hu",1,0.95,0.6)
				tmmcurgame.position.add(0.5,1,0,True)
				tmmcurgame.font=font30
				menumain.add(tmmcurgame)
				
				y=10
				x=-226-5
				Local wnx#=1024;
				Local wny#=768;
				Local k:_guivectorkondition;
				buttonstart=New _guibutton
				buttonstart.init(guisystem,0,0,226,68,strplay,0)
				buttonstart.position.set(1,0,0,True)
				buttonstart.position.add(x/wnx,y/wny,0,True)
				buttonstart.position.addkondition(640,800,480,600,  0.2,0.15,-1,True)
				buttonstart.size.addkondition(640,800,480,600,   160,50,1,False)
				buttonstart.setsizedynamic(wnx,wny)
				buttoninitmagic(buttonstart)
				buttonstart.fontliste.addlast(font18)
				buttonstart.fontliste.addlast(font24)
				buttonstart.fontliste.addlast(font30)
				buttonstart.benutzenfontliste=True;
				menumain.add(buttonstart)
				y:+off+bh

				buttonmenumaingametype=New _guibutton
				buttonmenumaingametype.init(guisystem,0,0,226,68,strgametype,2)
				buttonmenumaingametype.position.set(1,0,0,True)
				buttonmenumaingametype.position.add(x/wnx,y/wny,0,True)
				buttonmenumaingametype.position.addkondition(640,800,480,600,  0.4,0.15,-1,True)
				buttonmenumaingametype.size.addkondition(640,800,480,600,   160,50,1,False)
				buttonmenumaingametype.setsizedynamic(wnx,wny)
				buttoninitmagic(buttonmenumaingametype)
				buttonmenumaingametype.fontliste.addlast(font18)
				buttonmenumaingametype.fontliste.addlast(font24)
				buttonmenumaingametype.fontliste.addlast(font30)
				buttonmenumaingametype.benutzenfontliste=True;
				menumain.add(buttonmenumaingametype)
				y:+off+bh
				
				buttonmenumainoptions=New _guibutton
				buttonmenumainoptions.init(guisystem,0,0,226,72-4,stroptions,-1)
				buttonmenumainoptions.position.set(1,0,0,True)
				buttonmenumainoptions.position.add(x/wnx,y/wny,0,True)
				buttonmenumainoptions.position.addkondition(640,800,480,600,  0.6,0.15,-1,True)
				buttonmenumainoptions.size.addkondition(640,800,480,600,   160,50,1,False)
				buttonmenumainoptions.setsizedynamic(wnx,wny)
				buttoninitmagic(buttonmenumainoptions)
				buttonmenumainoptions.fontliste.addlast(font18)
				buttonmenumainoptions.fontliste.addlast(font24)
				buttonmenumainoptions.fontliste.addlast(font30)
				buttonmenumainoptions.benutzenfontliste=True;
				menumain.add(buttonmenumainoptions)
				y:+off+bh
				
				buttonmenumainclose=New _guibutton
				buttonmenumainclose.init(guisystem,0,0,226,72-4,strclose,-1)
				buttonmenumainclose.position.set(1,0,0,True)
				buttonmenumainclose.position.add(x/wnx,y/wny,0,True)
				buttonmenumainclose.position.addkondition(640,800,480,600,  0.8,0.15,-1,True)
				buttonmenumainclose.size.addkondition(640,800,480,600,   160,50,1,False)
				buttonmenumainclose.setsizedynamic(wnx,wny)
				buttoninitmagic(buttonmenumainclose)
				buttonmenumainclose.fontliste.addlast(font18)
				buttonmenumainclose.fontliste.addlast(font24)
				buttonmenumainclose.fontliste.addlast(font30)
				buttonmenumainclose.benutzenfontliste=True;
				menumain.add(buttonmenumainclose)
				y:+off+bh

				buttonmenumainplayer=New _guibutton
				buttonmenumainplayer.init(guisystem,10,-75,219,60,strchangeplayer,-1)
				buttonmenumainplayer.position.set(10/wnx,-75/wny,0,True)
				buttonmenumainplayer.position.add(0,1,0,True)
				buttonmenumainplayer.size.set(Float(226)/wnx,Float(68)/wny,0,True)
				buttoninitmagic(buttonmenumainplayer)
				buttonmenumainplayer.fontliste.addlast(font18)
				buttonmenumainplayer.fontliste.addlast(font24)
				buttonmenumainplayer.fontliste.addlast(font30)
				buttonmenumainplayer.benutzenfontliste=True;
				menumain.add(buttonmenumainplayer)

				textmenumainplayer=New _guitext
				textmenumainplayer.init(guisystem,123,-100,1,strwelcome+" ",1,0.8,0.5,font24,-1)
				textmenumainplayer.position.set(123/wnx,-100/wny,0,True)
				textmenumainplayer.position.add(0,1,0,True)
				textmenumainplayer.position.add(0,0,0,False)
				menumain.add(textmenumainplayer)

				windowhighscore=New _guiwindow
				windowhighscore.init(guisystem,0,0,226,235+16,1,1,1)
				windowhighscore.position.set(1,1,0,True)
				windowhighscore.position.add(-224,-210-230-16,0)
				windowinitmagic(windowhighscore,ihighscorewindow)
				menumain.add(windowhighscore)	
				
				SetImageFont(font24)
				Local gth:_guitext=New _guitext
				Local hh$=strhighscore
				gth.init(windowhighscore,windowhighscore.width()/2-TextWidth(hh)/2-5,32,1,hh,1,0.85,0.6,font24)			
				
				y=50+10
				For Local i=0 To 4 
				 Local f#=1-Float(i)/Float(4)
				 textmenumainhighscorename[i]=New _guitext
				 textmenumainhighscorename[i].init(windowhighscore,10,y,1,"hu",1,0.5+0.3*f,0.2+0.2*f,font18)
				 textmenumainhighscorepoints[i]=New _guitext
				 textmenumainhighscorepoints[i].init(windowhighscore,100,y,1,"hu",1,0.5+0.3*f,0.2+0.2*f,font18)
				 textmenumainhighscoretime[i]=New _guitext
				 textmenumainhighscoretime[i].init(windowhighscore,200,y,1,"hu",1,0.5+0.3*f,0.2+0.2*f,font18)
				 y:+20
				Next
				'y:+10
				buttonmenumainhighscoreclear=New _guibutton
				buttonmenumainhighscoreclear.init(windowhighscore,50-5,162,windowhighscore.width()-100,40,strdelete,-1)
				buttoninitmagic(buttonmenumainhighscoreclear)				
				buttonmenumainhighscoreclear.setshadow(5,5,0.35)
				
				windowstatisticsshort=New _guiwindow
				windowstatisticsshort.init(guisystem,0,0,226,215,1,1,1)
				windowstatisticsshort.position.set(1,1,0,True)
				windowstatisticsshort.position.add(-224,-210,0)
				windowinitmagic(windowstatisticsshort,ihighscorewindow)
				menumain.add(windowstatisticsshort)	

				SetImageFont(font24)
				gth=New _guitext
				hh=strstatistics 
				gth.init(windowstatisticsshort,windowstatisticsshort.width()/2-TextWidth(hh)/2-5,28,1,hh,1,0.85,0.6,font24)
				
				hh=" " 
				textstatisticsshortplayer=New _guitext
				textstatisticsshortplayer.init(windowstatisticsshort,windowstatisticsshort.width()/2-TextWidth(hh)/2,29+35,1,hh,1,0.8,0.4,font18)
				textstatisticsshortcount=New _guitext
				textstatisticsshortcount.init(windowstatisticsshort,windowstatisticsshort.width()/2-TextWidth(hh)/2,29+55,1,hh,1,0.8,0.4,font18)
				textstatisticsshortquote=New _guitext
				textstatisticsshortquote.init(windowstatisticsshort,windowstatisticsshort.width()/2-TextWidth(hh)/2,29+75,1,hh,1,0.8,0.4,font18)

				buttonmenumainstatistics=New _guibutton
				buttonmenumainstatistics.init(windowstatisticsshort,50-5,windowstatisticsshort.height()-80,windowstatisticsshort.width()-100,40,strdetails,-1)
				buttoninitmagic(buttonmenumainstatistics)
				buttonmenumainstatistics.setshadow(5,5,0.35)
				
				If(brandingstufe=2)
				 Local gi:_guiimage
				 gi=New _guiimage
				 gi.init(guisystem,10,0,ImageWidth(ilogosurricate),ImageHeight(ilogosurricate),ilogosurricate,1,1,1);
				 gi.position.add(0,-140/wny,0,True)
				 gi.position.add(0,1,0,True)
				 gi.position.add(0,-(ImageHeight(ilogosurricate)+10+ImageHeight(ilogoportal)),0,False)
				 gi.selectable=False
				 menumain.add(gi)

				 gi=New _guiimage
				 gi.init(guisystem,10,0,ImageWidth(ilogoportal),ImageHeight(ilogoportal),ilogoportal,1,1,1);
				 gi.position.add(0,-140/wny,0,True)
				 gi.position.add(0,1,0,True)
				 gi.position.add(0,-(ImageHeight(ilogoportal)),0,False)
				 gi.selectable=False
				 menumain.add(gi)
				EndIf
				updatemenumain()
				menumain.visibility(False)
				menumain.activity(False)
				menumain.fadeopacity(0)
				menumain.fadein()
				menumain.fadetarget(menuopacity)
				EndMethod
	Method updatemenumain()
				'update type&time display
				'If timeduringgame
				 SetImageFont(font30)
				 tmmcurgame.position.setx(-TextWidth(gamenames[currentgame])/2)
				 tmmcurgame.set(gamenames[currentgame])
				 SetImageFont(font18)
				 Local h$
				 If game
				  If game.inuse
				   h=timemstohhmmss(game.time)
				  Else
				   h=strnotbegun
				  EndIf
			 	 EndIf
				'Else
				 'tmmcurtime.set("")
				 'tmmcurscore.set("")
				'EndIf
				
				
				'If timeduringgame
				' tmmtime.position.setx(-TextWidth(h)/2)
				' tmmtime.set(h)
				'Else
				'EndIf
				'updatemenumainstatistics()
			    If usermanagement.actual
			     If(gra.screenw>1400) textmenumainplayer.font=font30; Else textmenumainplayer.font=font24
			     SetImageFont(textmenumainplayer.font)
			     Local h$=strwelcome+" "+usermanagement.actual.name
				 textmenumainplayer.set(h)
				 'textmenumainplayer.position.setx((123)/Float(1024))
				 textmenumainplayer.position.setindex(2,-TextWidth(h)/2,0,0,False)
				
				 SetImageFont(textstatisticsshortplayer.font)
			     h=usermanagement.actual.name
				 textstatisticsshortplayer.set(h)
				 textstatisticsshortplayer.position.setx(226/2-TextWidth(h)/2)

				 SetImageFont(textstatisticsshortcount.font)
			     h=strcount+" "+gamestats[currentgame].countuser(usermanagement.actual.name)
				 textstatisticsshortcount.set(h)
				 textstatisticsshortcount.position.setx(226/2-TextWidth(h)/2)
			
				 SetImageFont(textstatisticsshortquote.font)
			     If gamestats[currentgame].countuser(usermanagement.actual.name)>0 
			      h=strquote+" "+Int(gamestats[currentgame].quoteuser(usermanagement.actual.name)*100)+"%"
			     Else
			      h=""
			     EndIf
				 textstatisticsshortquote.set(h)
				 textstatisticsshortquote.position.setx(226/2-TextWidth(h)/2)
	 
				Else
				 textmenumainplayer.set("")
				 textstatisticsshortplayer.set("")
				 textstatisticsshortcount.set("")
				 textstatisticsshortquote.set("")
				EndIf
				
				
				
				Local hhh$
				Local it:TLink=gamestats[currentgame].highscorelist.firstlink()
				For Local i=0 To 4 
				 If it
				  Local e:_gamestatsentry=_gamestatsentry(it.value())
				  
				  hhh=e.user
				  SetImageFont(textmenumainhighscorename[i].font)
				  textmenumainhighscorename[i].set(hhh)
				  textmenumainhighscorename[i].position.setx(windowhighscore.width()/2-5-15-TextWidth(hhh))

				  hhh=Int(e.score())
				  SetImageFont(textmenumainhighscorepoints[i].font)
				  textmenumainhighscorepoints[i].set(hhh)
				  textmenumainhighscorepoints[i].position.setx(windowhighscore.width()/2-5-TextWidth(hhh)/2)
				
				  SetImageFont(textmenumainhighscoretime[i].font)
				  hhh=timemstohhmmss(e.time)
				  textmenumainhighscoretime[i].set(hhh)
				  textmenumainhighscoretime[i].position.setx(windowhighscore.width()/2+10)
				  it=it.nextlink()
				 Else
				  Local h$=""
				  textmenumainhighscorename[i].set(h)
				  textmenumainhighscorename[i].position.setx(windowhighscore.width()/2-5-15)
				  h=(i+1)+strranknotset
				  SetImageFont(textmenumainhighscorepoints[i].font)
				  textmenumainhighscorepoints[i].position.setx(windowhighscore.width()/2-5-TextWidth(h)/2)
				  textmenumainhighscorepoints[i].set(h)
				  h=""
				  SetImageFont(textmenumainhighscoretime[i].font)
				  textmenumainhighscoretime[i].position.setx(windowhighscore.width()/2+10)
				  textmenumainhighscoretime[i].set(h)
				 EndIf
				Next				
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
				checkboxscenelist=CreateList()
				menuscene=menuman.createmenu()
				windowscene=New _guiwindow
				windowscene.init(guisystem,-wx/2,-wy/2,wx,wy,255,255,255)
				windowscene.position.add(0.5,0.5,0,True)
				windowscene.setshadow(10,10)
				
				windowinitmagic(windowscene,iguiwindow)
				menuscene.add(windowscene)
				
				'createmenuoptionsbutton(windowoptionscard,menuscene,3)
				
				buttonscenemainmenu=New _guibutton
				buttonscenemainmenu.init(guisystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,11)
				buttonscenemainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonscenemainmenu)
				menuscene.add(buttonscenemainmenu)				
				SetImageFont(font30)
				Local hh$=strscene
				ttitlescene=New _guitext
				ttitlescene.init(windowscene,(wx/2)-TextWidth(hh)/2,40,1,hh,1,0.8,0.5,font30)
				lbscene=New _guilistbox
				lbscene.borderwidth=8
				lbscene.init(windowscene,70,80,400,460,1,1,1,33)
				listboxinitmagic(lbscene)
				For Local i=0 To scenecount-1
				 Local x=20
				 Local y=20+i*270 
				 Local gim:_guiimage=lbscene.insertimage(imenubackgroundl[0],x,y,300,256,0.8,0.8,0.8,700+i)
				 gim.blendmasked=False
				Next
				For Local i=0 To scenecount-1
				 cbt=New _guicheckbox
				 Local yy#=20+i*270
				 Local xx#=340
				 cbt.init(lbscene,xx,yy+20,19,19,700+i)
				 cbt.position.add(0,0,-1,False)
				 checkboxinitmagic(cbt)
				 checkboxscenelist.addlast(cbt)
				Next				
				updatemenuscenecheckbox(checkboxscenelist)
				menuscene.visibility(False)
				menuscene.activity(False)
				menuscene.fadetarget(menuopacity2)
				menuscene.fadeopacity(0)
				EndMethod				
	Method updatemenuscenecheckbox(l:TList)
				For Local cit:_guicheckbox=EachIn l
				 If currentscene=(cit.index-700) cit.checked=True Else cit.checked=False
				Next
				EndMethod		
'******************************************************************************************************************
'										U S E R  M E N U 
'******************************************************************************************************************				
	Method createmenuuser()
				Local tr#=0.99,tg#=0.7,tb#=0.27
				Local lx#=250
				Local ly#=100
				Local wx#=512
				Local wy#=723
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=650
				Local off#=20				
				Local xit#=0
				Local yit#=0
				Local i
				Local cw#=128*0.7
				Local ch#=200*0.7
				Local mt:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cbt:_guicheckbox
	
				menuuser=menuman.createmenu()
				windowuser=New _guiwindow
				windowuser.init(guisystem,Int(-wx/2),Int(-wy/2),wx,wy,255,255,255)
				windowuser.position.add(0.5,0.5,0,True)
				Local pk:_guivectorkondition=windowuser.position.addkondition(640,800,480,600,280,3,-1,False);
				pk=windowuser.size.addkondition(640,800,480,600,wx,600,1,False);
				
				windowuser.setshadow(10,10)
				
				windowinitmagic(windowuser,iguiwindow)
				menuuser.add(windowuser)
				
				buttonusermainmenu=New _guibutton
				buttonusermainmenu.init(guisystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,11)
				buttonusermainmenu.position.add(0.5,0.5,0,True)
				buttonusermainmenu.position.addkondition(640,800,480,600, 20,10,-1,False)
				
				buttoninitmagic(buttonusermainmenu)
				menuuser.add(buttonusermainmenu)
								
				SetImageFont(font30)
				Local hh$=strplayer
				windowusertitle=New _guitext
				windowusertitle.init(windowuser,(wx/2)-TextWidth(hh)/2,50,1,hh,1,0.8,0.5,font30)
				
				windowuserlist=New _guilistbox
				windowuserlist.borderwidth=8
				windowuserlist.init(windowuser,65,90,370,520,1,1,1,33)
				windowuserlist.size.addkondition(640,800,480,600,  370,420,1,False)
				listboxinitmagic(windowuserlist)
				updatelistboxuser(windowuserlist,False)
				updatelistboxuserselection()
				windowuserlist.selectionrect=True
				windowuserlist.moverrect=True				
				
				y=0
				buttonusercreate=New _guibutton
				buttonusercreate.init(guisystem,+wx/2+20,-wy/2+y,bw,bh,strcreate,33)
				buttonusercreate.position.add(0.5,0.5,0,True)
				buttonusercreate.position.addkondition(640,800,480,600, 20,330+y,-1,False)
				buttoninitmagic(buttonusercreate)
				menuuser.add(buttonusercreate)
				y:+bh+off

				buttonuseredit=New _guibutton
				buttonuseredit.init(guisystem,+wx/2+20,-wy/2+y,bw,bh,stredit,33)
				buttonuseredit.position.add(0.5,0.5,0,True)
				buttonuseredit.position.addkondition(640,800,480,600, 20,330+y,-1,False)
				buttoninitmagic(buttonuseredit)
				menuuser.add(buttonuseredit)
				y:+bh+off

				buttonuserdelete=New _guibutton
				buttonuserdelete.init(guisystem,+wx/2+20,-wy/2+y,bw,bh,strdelete,33)
				buttonuserdelete.position.add(0.5,0.5,0,True)
				buttonuserdelete.position.addkondition(640,800,480,600, 20,330+y,-1,False)
				buttoninitmagic(buttonuserdelete)
				menuuser.add(buttonuserdelete)
				y:+bh+off

				Rem
				updatemenuscenecheckbox(checkboxscenelist)
				EndRem
				menuuser.visibility(False)
				menuuser.activity(False)
				menuuser.fadetarget(menuopacity2)
				menuuser.fadeopacity(0)
				EndMethod
				Rem				
	Method updatemenuscenecheckbox(l:TList)
				For Local cit:_guicheckbox=EachIn l
				 If currentscene=(cit.index-700) cit.checked=True Else cit.checked=False
				Next
				EndMethod
				EndRem		
		Method updatelistboxuser(ul:_guilistbox,small)	
				ul.clearchild()
				ul.selection=Null
				Local yit#=20
				Local i=0
				Local yo#
				Local xo#
				Local wx#
				Local wy#
				Local xx#
				If small
				 yo=90
				 wx=80
				 wy=80
				 xo=10
				 xx=80
				Else
				 wx=128
				 wy=128
				 yo=148
				 xo=-10
				 xx=155
				EndIf
				For Local uit:_user=EachIn usermanagement.list
				 Local cbt:_guicheckbox=Null
				 If small=False
				  cbt=New _guicheckbox
				  cbt.init(ul,60,yit+20,checkboxwidth,checkboxheight,7000+i)
				  cbt.position.add(0,0,-1,False)
				  checkboxinitmagic(cbt)
				 EndIf
				 'cslist.addlast(cbt)
				 SetImageFont(font24)
				 Local xs#=TextWidth(uit.name)/2
				' If small=False xs=0
				 Local gte:_guitext=ul.inserttext(uit.name,ul.width()/2-xs-xo,yit+yo,1,1,0.8,0.4,font24,7100+i)

				 'If small=False gte.selectable=False
				 Local gim:_guiimage=ul.insertimage(usermanagement.image[uit.index],ul.width()/2-wx/2-xo,yit,wx,wy,1,1,1,7100+i)
			     Local gimf:_guiimage=Null
				 If small=False
				  gimf=ul.insertimage(iframe,(ul.width()/2-wx/2-xo)-5,(yit)-5,wx+12,wy+12,1,1,1,-1)
			     Else
				  gimf=ul.insertimage(iframe,(ul.width()/2-wx/2-xo)-4,(yit)-4,wx+8,wy+8,1,1,1,-1)
  				 EndIf
				 gimf.position.setz(gimf.position.getz()-1)
				 gimf.selectable=False
				 gimf.fadeopacity(0)
				
				' EndIf
				
				 gim.crosslinktext=gte
				 gte.crosslinkimage=gim
				 If cbt
				  cbt.crosslinkimage=gim
				  gim.crosslinkcheckbox=cbt
				  cbt.fadeopacity(0)
				 EndIf
				 'gim.color.w=0
				 'gim.colortransformed.w=0
				 gim.fadeopacity(0)
				 gte.fadeopacity(0)
				 
				 If usermanagement.actual
				  If uit.name=usermanagement.actual.name ul.selection=gim
				 EndIf				
				
				
				 If small gim.index:+2000
				 yit:+65+wy
				 If small=False yit:+10
				 i:+1
				Next
				EndMethod
	Method updatelistboxuserselection()
	 			For Local cit:_guicheckbox=EachIn windowuserlist.childlist
	  			 cit.checked=False
				Next
				windowuserlist.selection=Null
				If usermanagement.actual
				 Local ui=0
				 Local userindex=-1
				 For Local tit:_guitext=EachIn windowuserlist.childlist
				  If tit.get()= usermanagement.actual.name userindex=ui
				  ui:+1
				 Next
				 ui=0
	 			 For Local cit:_guicheckbox=EachIn windowuserlist.childlist
	  			  If ui=userindex 
	  			   cit.checked=True
	  			   windowuserlist.selection=cit.crosslinkimage
		 		  EndIf
				  ui:+1
				 Next
				 'ui=0
	 			 'For Local cit:_guiimage=EachIn windowuserlist.childlist
	  			 ' If ui=userindex windowuserlist.selection=cit
	  			 ' ui:+1
				 'Next
				 
				EndIf
				EndMethod				
'******************************************************************************************************************
'										U S E R  N E W  M E N U 
'******************************************************************************************************************				
	Method createmenuusercreate()
				Local tr#=0.99,tg#=0.7,tb#=0.27
				Local lx#=250
				Local ly#=100
				Local wx#=710
				Local wy#=700
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=650
				Local off#=20				
				Local xit#=0
				Local yit#=0
				Local i
				Local cw#=128*0.7
				Local ch#=200*0.7
				Local mt:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cbt:_guicheckbox
	
				menuusercreate=menuman.createmenu()
				windowusercreate=New _guiwindow
				windowusercreate.init(guisystem,-wx/2-100,-wy/2,wx,wy,1,1,1)
				windowusercreate.position.add(0.5,0.5,0,True)
				windowusercreate.position.addkondition(640,800,480,600, 80,3,-1,False)
				windowusercreate.size.addkondition(640,800,480,600, 720,580,1,False)
				windowusercreate.setshadow(10,10)
				windowinitmagic(windowusercreate,igametypewindow)
				menuusercreate.add(windowusercreate)
				Rem
				buttonusernewmainmenu=New _guibutton
				buttonusernewmainmenu.init(guisystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strcreate,11)
				buttonusernewmainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonusernewmainmenu)
				menuusernew.add(buttonusernewmainmenu)		
				EndRem		
				SetImageFont(font30)
				Local hh$=strcreateuser
				windowusercreatetitle=New _guitext
				windowusercreatetitle.init(windowusercreate,(wx/2-6)-TextWidth(hh)/2,50,1,hh,1,0.8,0.5,font30)
				windowusercreatetitle.setvectordynamic(wx,wy)
				SetImageFont(font30)
				hh=strusercreatefirst1
				windowusercreatetitle1=New _guitext
				windowusercreatetitle1.init(windowusercreate,(wx/2-6)-TextWidth(hh)/2,80,1,hh,1,0.8,0.5,font30)
				windowusercreatetitle1.setvectordynamic(wx,wy)
				windowusercreatetitle1.superinvisible=True
				SetImageFont(font30)
				hh=strusercreatefirst2
				windowusercreatetitle2=New _guitext
				windowusercreatetitle2.init(windowusercreate,(wx/2-6)-TextWidth(hh)/2,110,1,hh,1,0.8,0.5,font30)
				windowusercreatetitle2.setvectordynamic(wx,wy)
				windowusercreatetitle2.superinvisible=True
				
				windowusercreateimagelist=New _guilistbox
				windowusercreateimagelist.borderwidth=8
				windowusercreateimagelist.init(windowusercreate,70,90,310+250,430,1,1,1,33)
				windowusercreateimagelist.setvectordynamic(wx,wy)
				listboxinitmagic(windowusercreateimagelist)
				yit#=20
				xit#=10
				Local iwx#
				Local iwy#
				iwx=120
				iwy=120
				For Local j=0 To usermanagement.imagecount-1
				 Local cbt:_guicheckbox=New _guicheckbox
				 cbt.init(windowusercreateimagelist,xit+iwx-25,yit+5,19,19,8000+j)
				 cbt.position.add(0,0,-1,False)
				 checkboxinitmagic(cbt)
				 'cslist.addlast(cbt)
				 'Local gte:_guitext=ul.inserttext(uit.name,xx,yit+yo,2,1,0.8,0.4,font24,7100+i)
				 Local gim:_guiimage=windowusercreateimagelist.insertimage(usermanagement.image[j],xit,yit,iwx,iwy,1,1,1,8100+j)
				 gim.crosslinkcheckbox=cbt
				 cbt.crosslinkimage=gim
			     Local gimf:_guiimage=windowusercreateimagelist.insertimage(iframe,xit-5,yit-5,iwx+10,iwy+10,1,1,1,-1)
				 gimf.position.setz(gimf.position.getz()-1)
				 gimf.selectable=False
				 xit:+15+iwx
				 If xit>200+(2*(15+iwx))
				  xit=10
				  yit:+15+iwy
				 EndIf
				Next
				windowusercreateimagelist.selectionrect=True
				windowusercreateimagelist.moverrect=True	
							
				hh$=strname+" : "
				SetImageFont(font24)
				windowusercreatename=New _guieditbox
				windowusercreatename.init(windowusercreate,70+TextWidth(hh),600,wx-70*2-10,40,"",font24,1,1,1)
				windowusercreatename.drawframe=False
				windowusercreatename.cursorimage=itrackbarbutton
				windowusercreatename.cursorwidth=32
				windowusercreatename.cursorheight=32
				windowusercreatename.cursoroffsety=-25
				windowusercreatename.cursorsmooth=True
				windowusercreatename.textcolor.set(1,0.8,0.5,1)
				windowusercreatename.setvectordynamic(wx,wy)
				
				Local gt:_guitext				
				gt=New _guitext
				gt.init(windowusercreate,80,605,1,hh,1,0.8,0.5,font24)				
				gt.setvectordynamic(wx,wy)
				
				y=0
				buttonusercreatecreate=New _guibutton
				buttonusercreatecreate.init(guisystem,+wx/2+10-100,-wy/2+y,bw,bh,strcreate,33)
				buttonusercreatecreate.position.add(0.5,0.5,0,True)
				buttonusercreatecreate.position.addkondition(640,800,480,600,  5,5,-1,False)
				buttonusercreatecreate.size.addkondition(640,800,480,600,  buttonwidth-80,buttonheight-10,1,False)
				buttoninitmagic(buttonusercreatecreate)
				menuusercreate.add(buttonusercreatecreate)
				y:+bh+off

				buttonusercreatecancel=New _guibutton
				buttonusercreatecancel.init(guisystem,+wx/2+10-100,-wy/2+y,bw,bh,strcancel,33)
				buttonusercreatecancel.position.add(0.5,0.5,0,True)
				buttonusercreatecancel.position.addkondition(640,800,480,600,  5,buttonheight+5+5,-1,False)
				buttonusercreatecancel.size.addkondition(640,800,480,600,  buttonwidth-80,buttonheight-10,1,False)
				buttoninitmagic(buttonusercreatecancel)
				menuusercreate.add(buttonusercreatecancel)
				y:+bh+off

				menuusercreate.visibility(False)
				menuusercreate.activity(False)
				menuusercreate.fadetarget(menuopacity2)
				menuusercreate.fadeopacity(0)
				EndMethod		
'******************************************************************************************************************
'										C A R D G E N E R A T O R   M E N U 
'******************************************************************************************************************				
	Method createmenucardgenerator()
				Local gt:_guitext
				Local tr#=1,tg#=0.8,tb#=0.4
				Local lx#=250
				Local ly#=100
				Local y#=80
				Local x#=670
				Local wx#=850
				Local wy#=760
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local yit#=0
				Local off#=28				
				Local cw#=256*0.5
				Local ch#=384*0.5
				Local mt:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1

				cardgeneratormeshfrontlist=CreateList()
				cardgeneratormeshbacklist=CreateList()
				menucardgenerator=menuman.createmenu()
				cardgeneratorwindow=New _guiwindow
				cardgeneratorwindow.init(guisystem,-wx/2+90,-wy/2+10,wx,wy,1,1,1)
				cardgeneratorwindow.position.add(0.5,0.5,0,True)
				cardgeneratorwindow.position.addkondition(640,800,480,600,  100,5,-1,False)
				cardgeneratorwindow.size.addkondition(640,800,480,600,  690,590,1,False)
				
				cardgeneratorwindow.shadow=False'setshadow(10,10)
				windowinitmagic(cardgeneratorwindow,igametypewindow)
				'cardgeneratorwindow.insertline(60,84,wx-60,84,0.4,0.25,0.05);
				menucardgenerator.add(cardgeneratorwindow)
				
				cardgeneratorbuttonback=New _guibutton
				cardgeneratorbuttonback.init(guisystem,-wx/2+90-(buttonwidth-60),-wy/2+10+10,buttonwidth-60,buttonheight,strback,-1)
				cardgeneratorbuttonback.position.add(0.5,0.5,0,True)
				cardgeneratorbuttonback.position.addkondition(640,800,480,600,  5,5,-1,False)
				buttoninitmagic(cardgeneratorbuttonback)
				cardgeneratorbuttonback.createhelp(strcardgeneratorhelpback,font18,0.2,0,0)
				guihelpinitmagic(cardgeneratorbuttonback)
				menucardgenerator.add(cardgeneratorbuttonback)				

				cardgeneratorbuttonreset=New _guibutton
				cardgeneratorbuttonreset.init(guisystem,-wx/2+90-(buttonwidth-60),-wy/2+buttonheight+10+10+10,buttonwidth-60,buttonheight,strreset,-1)
				cardgeneratorbuttonreset.position.addkondition(640,800,480,600,  5,buttonheight+5+5,-1,False)
				cardgeneratorbuttonreset.position.add(0.5,0.5,0,True)
				buttoninitmagic(cardgeneratorbuttonreset)
				cardgeneratorbuttonreset.createhelp(strcardgeneratorhelpreset,font18,0.2,0,0)
				guihelpinitmagic(cardgeneratorbuttonreset)
				
				menucardgenerator.add(cardgeneratorbuttonreset)				

				SetImageFont(font30)
				Local hh$=""'strcardgenerator
				cardgeneratortexttitle=New _guitext
				cardgeneratortexttitle.init(cardgeneratorwindow,(wx/2)-TextWidth(hh)/2,50,1,hh,1,0.8,0.5,font30)				
				Local i=0
				For Local j=0 To 3
				 Local w#=j*40+90
				 gg.position.set(wx/2-30+Cos(w)*160,180-Sin(w)*130,0)
				' gg.texture[0,0]=cardsetmanager.textureback
				' gg.texture[1,0]=cardsetmanager.textureback
				 w:-70
				 gg.vx.set(cw,0,0)
				 gg.vy.set(0,ch,0)
				 gg.vx.rotz(-w/2)
				 gg.vy.rotz(-w/2)
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 Local gim:_guimesh
				 gim=cardgeneratorwindow.insertmesh(mt,20,20+i*(ch+60),200,128,1,1,1,-1)
				 gim.position.addkondition(640,800,480,600,  20-80,20+i*(ch+60),-0,False)
				 cardgeneratormeshfrontlist.addlast(gim)
				Next	
				Local ew#=170
				Local w#=20
				gg.position.set(0,0,0)
			'	gg.texture[0,0]=cardsetmanager.textureback
			'	gg.texture[1,0]=cardsetmanager.textureback
				gg.vx.set(cw*1.4,0,0)
				gg.vy.set(0,ch*1.4,0)
				gg.vx.rotz(w)
				gg.vy.rotz(w)
				mt=gg.Create()
				mt.twosided(True)
				mt.cull(False)		
				mt.blend(True)
				mt.blendadditive(False)
				Local gim:_guimesh
				gim=cardgeneratorwindow.insertmesh(mt,wx/2-40,40,200,128,1,1,1,-1)
				gim.position.addkondition(640,800,480,600,  wx/2-40-80,40,0,False)
				cardgeneratormeshbacklist.addlast(gim)	
				For Local gm:_guimesh=EachIn cardgeneratormeshfrontlist
				 gm.selectable=False
				Next			
				For Local gm:_guimesh=EachIn cardgeneratormeshbacklist
				 gm.selectable=False
				Next			
				
							
				gg.position.set(0,0,0)
				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)				
				'-------------------------------------- background guis -----------------------------------------
				SetImageFont(font24)
				hh=strbackground
				cardgeneratortextground=New _guitext
				cardgeneratortextground.init(cardgeneratorwindow,60,55,1,hh,1,0.8,0.5,font24)
				cardgeneratortextground.createhelp(strcardgeneratorhelpbackground,font18,0.6,0,0)
				guihelpinitmagic(cardgeneratortextground)
				
				cardgeneratorlistboxground=New _guilistbox
				cardgeneratorlistboxground.borderwidth=8
				cardgeneratorlistboxground.init(cardgeneratorwindow,60,85,ew,265,1,1,1,-1)
				cardgeneratorlistboxground.size.addkondition(640,800,480,600,  ew,265-70,1,False)
				listboxinitmagic(cardgeneratorlistboxground)
				hh=strstructure
				gt=New _guitext
				gt.init(cardgeneratorwindow,60,365,1,hh,1,0.8,0.5,font18)			
				gt.position.addkondition(640,800,480,600,  60,365-70,-1,False)
				gt.createhelp(strcardgeneratorhelpstructurebackground,font18,0.6,0,0)								
				guihelpinitmagic(gt)
								
				cardgeneratortrackbargroundstructure=New _guitrackbar
				cardgeneratortrackbargroundstructure.init(cardgeneratorwindow,60,385,ew,20,1,1,1,0.5,0,1,-1)
				cardgeneratortrackbargroundstructure.position.addkondition(640,800,480,600,  60,385-70,-1,False)
				cardgeneratortrackbargroundstructure.displaymultiplier=100
				cardgeneratortrackbargroundstructure.displayaddition=" %"
				cardgeneratortrackbargroundstructure.displayrounding=True				
				trackbarinitmagic(cardgeneratortrackbargroundstructure)								
								
				hh=strbehind
				gt=New _guitext
				gt.init(cardgeneratorwindow,60,405,1,hh,1,0.8,0.5,font18)	
				gt.position.addkondition(640,800,480,600,  60,405-70,-1,False)
				gt.createhelp(strcardgeneratorhelpstructurebackgroundbehind,font18,0.6,0,0)
				guihelpinitmagic(gt)
				cardgeneratorcheckboxgroundstructurebehind=New _guicheckbox
				cardgeneratorcheckboxgroundstructurebehind.init(cardgeneratorwindow,60+ew-19,405,19,19,-1)
				cardgeneratorcheckboxgroundstructurebehind.position.addkondition(640,800,480,600,  60+ew-19,405-70,-1,False)
				checkboxinitmagic(cardgeneratorcheckboxgroundstructurebehind)
				cardgeneratorcheckboxgroundstructurebehind.checked=True	

								
								
								
				cardgeneratorlistboxgroundstructure=New _guilistbox
				cardgeneratorlistboxgroundstructure.borderwidth=8
				cardgeneratorlistboxgroundstructure.init(cardgeneratorwindow,60,390+40,ew,210+30,1,1,1,-1)
				cardgeneratorlistboxgroundstructure.position.addkondition(640,800,480,600,  60,390+40-70,-1,False)
				cardgeneratorlistboxgroundstructure.size.addkondition(640,800,480,600,  ew,240-70,1,False)
				listboxinitmagic(cardgeneratorlistboxgroundstructure)
				
				'---------------------------------------- frame guis -------------------------------------------
				Local xfr#=wx-70-ew
				Local kox#=160
				SetImageFont(font24)
				hh=strframe
				cardgeneratortextframe=New _guitext
				cardgeneratortextframe.init(cardgeneratorwindow,xfr,55,1,hh,1,0.8,0.5,font24)
				cardgeneratortextframe.position.addkondition(640,800,480,600,  xfr-kox,55,-1,False)
				cardgeneratortextframe.createhelp(strcardgeneratorhelpframe,font18,0.6,0,0)
				guihelpinitmagic(cardgeneratortextframe)

				
				'----
				cardgeneratortextframenumber=New _guitext
				cardgeneratortextframenumber.init(cardgeneratorwindow,xfr,90,1,strfornumbers,1,0.8,0.5,font18)				
				cardgeneratortextframenumber.position.addkondition(640,800,480,600,  xfr-kox,90,-1,False)
				cardgeneratortextframenumber.createhelp(strcardgeneratorhelpframefornumbers,font18,0.6,0,0)
				guihelpinitmagic(cardgeneratortextframenumber)

				cardgeneratortrackbarframenumber=New _guitrackbar
				cardgeneratortrackbarframenumber.init(cardgeneratorwindow,xfr+110,90,60,20,1,1,1,0.5,0,1,-1)
				cardgeneratortrackbarframenumber.position.addkondition(640,800,480,600,  xfr+110-kox,90,-1,False)
				cardgeneratortrackbarframenumber.displaymultiplier=100
				cardgeneratortrackbarframenumber.displayaddition=" %"
				cardgeneratortrackbarframenumber.displayrounding=True				
				trackbarinitmagic(cardgeneratortrackbarframenumber)	
				'cardgeneratorcheckboxframenumber=New _guicheckbox
				'cardgeneratorcheckboxframenumber.init(cardgeneratorwindow,xfr+170-19,85,19,19,-1)
				'checkboxinitmagic(cardgeneratorcheckboxframenumber)
				'cardgeneratorcheckboxframenumber.checked=True	
				'----
				cardgeneratortextframepicture=New _guitext
				cardgeneratortextframepicture.init(cardgeneratorwindow,xfr,115,1,strforpictures,1,0.8,0.5,font18)				
				cardgeneratortextframepicture.position.addkondition(640,800,480,600,  xfr-kox,115,-1,False)
				cardgeneratortextframepicture.createhelp(strcardgeneratorhelpframeforpictures,font18,0.6,0,0)
				guihelpinitmagic(cardgeneratortextframepicture)
				
				cardgeneratortrackbarframepicture=New _guitrackbar
				cardgeneratortrackbarframepicture.init(cardgeneratorwindow,xfr+110,115,60,20,1,1,1,0.5,0,1,-1)
				cardgeneratortrackbarframepicture.position.addkondition(640,800,480,600,  xfr+110-kox,115,-1,False)
				cardgeneratortrackbarframepicture.displaymultiplier=100
				cardgeneratortrackbarframepicture.displayaddition=" %"
				cardgeneratortrackbarframepicture.displayrounding=True				
				trackbarinitmagic(cardgeneratortrackbarframepicture)	
				'cardgeneratorcheckboxframenumber=New _guicheckbox
				'cardgeneratorcheckboxframenumber.init(cardgeneratorwindow,xfr+170-19,85,19,19,-1)
				'checkboxinitmagic(cardgeneratorcheckboxframenumber)
				'cardgeneratorcheckboxframenumber.checked=True	
				'cardgeneratorcheckboxframepicture=New _guicheckbox
				'cardgeneratorcheckboxframepicture.init(cardgeneratorwindow,xfr+170-19,115,19,19,-1)
				'checkboxinitmagic(cardgeneratorcheckboxframepicture)
				'cardgeneratorcheckboxframepicture.checked=True	
				'----
				cardgeneratortextframebackside=New _guitext
				cardgeneratortextframebackside.init(cardgeneratorwindow,xfr,100,1,strforbacksides,1,0.8,0.5,font18)				
				cardgeneratortextframebackside.position.addkondition(640,800,480,600,  xfr-kox,100,-1,False)
				cardgeneratortextframebackside.createhelp(strcardgeneratorhelpframeforbacksides,font18,0.6,0,0)
				guihelpinitmagic(cardgeneratortextframebackside)
				
				cardgeneratortrackbarframebackside=New _guitrackbar
				cardgeneratortrackbarframebackside.init(cardgeneratorwindow,xfr+110,100,60,20,1,1,1,0.5,0,1,-1)
				cardgeneratortrackbarframebackside.position.addkondition(640,800,480,600,  xfr+110-kox,100,-1,False)
				cardgeneratortrackbarframebackside.displaymultiplier=100
				cardgeneratortrackbarframebackside.displayaddition=" %"
				cardgeneratortrackbarframebackside.displayrounding=True				
				trackbarinitmagic(cardgeneratortrackbarframebackside)	

				'cardgeneratorcheckboxframebackside=New _guicheckbox
				'cardgeneratorcheckboxframebackside.init(cardgeneratorwindow,xfr+170-19-21,100,19,19,-1)
				'checkboxinitmagic(cardgeneratorcheckboxframebackside)
				'cardgeneratorcheckboxframebackside.checked=True	
				
				
				cardgeneratorlistboxframe=New _guilistbox
				cardgeneratorlistboxframe.borderwidth=8
				cardgeneratorlistboxframe.init(cardgeneratorwindow,xfr,145,ew,225,1,1,1,-1)
				cardgeneratorlistboxframe.position.addkondition(640,800,480,600,  xfr-kox,145,-1,False)
				cardgeneratorlistboxframe.size.addkondition(640,800,480,600,  ew,225-70,1,False)
				listboxinitmagic(cardgeneratorlistboxframe)
				
				hh=strstructure
				gt=New _guitext
				gt.init(cardgeneratorwindow,xfr,385,1,hh,1,0.8,0.5,font18)			
				gt.position.addkondition(640,800,480,600,  xfr-kox,385-70,-1,False)
				gt.createhelp(strcardgeneratorhelpstructureframe,font18,0.6,0,0)	
				guihelpinitmagic(gt)				
								
				cardgeneratortrackbarframestructure=New _guitrackbar
				cardgeneratortrackbarframestructure.init(cardgeneratorwindow,xfr,405,ew,20,1,1,1,0.5,0,1,-1)
				cardgeneratortrackbarframestructure.position.addkondition(640,800,480,600,  xfr-kox,405-70,-1,False)
				cardgeneratortrackbarframestructure.displaymultiplier=100
				cardgeneratortrackbarframestructure.displayaddition=" %"
				cardgeneratortrackbarframestructure.displayrounding=True				
				trackbarinitmagic(cardgeneratortrackbarframestructure)								
								
								
				cardgeneratorlistboxframestructure=New _guilistbox
				cardgeneratorlistboxframestructure.borderwidth=8
				cardgeneratorlistboxframestructure.init(cardgeneratorwindow,xfr,430,ew,170+70,1,1,1,-1)
				cardgeneratorlistboxframestructure.position.addkondition(640,800,480,600,  xfr-kox,430-70,-1,False)
				cardgeneratorlistboxframestructure.size.addkondition(640,800,480,600,  ew,170+70-70,1,False)
				listboxinitmagic(cardgeneratorlistboxframestructure)


				
				'---------------------------------------- impurity guis ----------------------------------------
				Local xim#=(wx/2)-(ew/2)-5
				Local yim#=270
				SetImageFont(font24)
				hh=strimpurity
				cardgeneratortextimpurity=New _guitext
				cardgeneratortextimpurity.init(cardgeneratorwindow,xim,yim+120,1,hh,1,0.8,0.5,font24)
				cardgeneratortextimpurity.position.addkondition(640,800,480,600,  xim-80,yim+120-60,-1,False)
				cardgeneratortextimpurity.createhelp(strcardgeneratorhelpimpurity,font18,0.6,0,0)
				guihelpinitmagic(cardgeneratortextimpurity)
			
				
				cardgeneratortrackbarimpurity=New _guitrackbar
				cardgeneratortrackbarimpurity.init(cardgeneratorwindow,xim,yim+145,ew,20,1,1,1,0.5,0,1,-1)
				cardgeneratortrackbarimpurity.position.addkondition(640,800,480,600,  xim-80,yim+145-60,-1,False)
				cardgeneratortrackbarimpurity.displaymultiplier=100
				cardgeneratortrackbarimpurity.displayaddition=" %"
				cardgeneratortrackbarimpurity.displayrounding=True				
				trackbarinitmagic(cardgeneratortrackbarimpurity)		
				
				cardgeneratorlistboximpurity=New _guilistbox
				cardgeneratorlistboximpurity.borderwidth=8
				cardgeneratorlistboximpurity.init(cardgeneratorwindow,xim,yim+170,ew,155,1,1,1,-1)
				cardgeneratorlistboximpurity.position.addkondition(640,800,480,600,  xim-80,yim+170-60,-1,False)
				cardgeneratorlistboximpurity.size.addkondition(640,800,480,600,  ew,155-55,1,False)
				listboxinitmagic(cardgeneratorlistboximpurity)
				
				hh=stryellowing
				gt=New _guitext
				gt.init(cardgeneratorwindow,xim,yim+340,1,hh,1,0.8,0.5,font18)	
				gt.position.addkondition(640,800,480,600,  xim-80,yim+340-105-10,-1,False)
				gt.createhelp(strcardgeneratorhelpimpurityyellowing,font18,0.6,0,0)		
				guihelpinitmagic(gt)			
				cardgeneratortrackbarimpurityyellowing=New _guitrackbar
				cardgeneratortrackbarimpurityyellowing.init(cardgeneratorwindow,xim,yim+360,ew,20,1,1,1,0.5,0,1,-1)
				cardgeneratortrackbarimpurityyellowing.position.addkondition(640,800,480,600,  xim-80,yim+360-105-10,-1,False)
				cardgeneratortrackbarimpurityyellowing.displaymultiplier=100
				cardgeneratortrackbarimpurityyellowing.displayaddition=" %"
				cardgeneratortrackbarimpurityyellowing.displayrounding=True				
				trackbarinitmagic(cardgeneratortrackbarimpurityyellowing)						
				Rem
				hh=strscratchs
				gt=New _guitext
				gt.init(cardgeneratorwindow,xim,yim+385,2,hh,1,0.8,0.5,font18)						
				cardgeneratortrackbarimpurityscratchs=New _guitrackbar
				cardgeneratortrackbarimpurityscratchs.init(cardgeneratorwindow,xim,yim+405,170,20,1,1,1,0.5,0,1,-1)
				cardgeneratortrackbarimpurityscratchs.displaymultiplier=100
				cardgeneratortrackbarimpurityscratchs.displayaddition=" %"
				cardgeneratortrackbarimpurityscratchs.displayrounding=True				
				trackbarinitmagic(cardgeneratortrackbarimpurityscratchs)						
				EndRem
				updatemenucardgenerator(Null)
				menucardgenerator.fadeoff()
				menucardgenerator.visibility(False)
				menucardgenerator.activity(False)
				menucardgenerator.fadetarget(menuopacity2)
				menucardgenerator.fadeopacity(0)
				EndMethod
	Method updatemenucardgenerator(c:_cardset)
				'Print "updatecardgenerator : "
				cardsetmanager.actualedit=c
				If c c.generatetexturepreview(gra)				
				Local cbt:_guicheckbox
				Local cw#=128*0.5
				Local ch#=200*0.5	
				Local mt:_mesh
				Local gm:_guimesh
				Local gg:_geometrygrid=New _geometrygrid
				Local i#=0
				Local cf:_cardsetfront=_cardsetfront(c)
				Local cb:_cardsetback=_cardsetback(c)				
				

				Local cboy#=checkboxoffy+10
				Local cbw#=checkboxwidth
				Local cbh#=checkboxheight					

				
				gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				cardgeneratorlistboxground.clearchild()
				i=0
				For Local tit:_cardsettexture=EachIn cardsetmanager.groundlist
				 gg.texture[0,0]=tit
				 gg.texture[1,0]=tit
				 'Print "tit name"+tit.name
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 Local x#=5
				 Local y#=20+i*(ch+20)
				 gm=cardgeneratorlistboxground.insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1)
				 gm.crosslinkname=tit.name
				 cbt=New _guicheckbox
				 cbt.init(cardgeneratorlistboxground,x+cw+5,y+cboy,cbw,cbh,-1)
				 'cbt.position.add(0,0,-1,False)
				 checkboxinitmagic(cbt)
				 gm.crosslinkcheckbox=cbt
				 cbt.crosslinkmesh=gm
				 If c
				  If tit.name=c.groundselection 
				   cardgeneratorlistboxground.selection=gm
				   cbt.checked=True
				  EndIf
				 EndIf
				 i:+1
				Next	
				
				cardgeneratorlistboxgroundstructure.clearchild()
				i=0
				For Local tit:_cardsettexture=EachIn cardsetmanager.structurelist

				 gg.texture[0,0]=tit
				 gg.texture[1,0]=tit
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 Local x#=5
				 Local y#=20+i*(ch+20)
				 gm=cardgeneratorlistboxgroundstructure.insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1)
				 gm.crosslinkname=tit.name
				 cbt=New _guicheckbox
				 cbt.init(cardgeneratorlistboxgroundstructure,x+cw+5,y+cboy,cbw,cbh,-1)
				' cbt.position.add(0,0,-1,False)
				 gm.crosslinkcheckbox=cbt
				 cbt.crosslinkmesh=gm
				 checkboxinitmagic(cbt)
				 If c
				  If tit.name=c.structuregroundselection 
				   cardgeneratorlistboxgroundstructure.selection=gm
				   cbt.checked=True
				  EndIf
				 EndIf
				 i:+1
				Next	
				cardgeneratorlistboxframe.clearchild()
				i=0
				For Local tit:_cardsettexture=EachIn cardsetmanager.framelist
				 gg.texture[0,0]=tit
				 gg.texture[1,0]=tit
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 Local x#=10
				 Local y#=20+i*(ch+20)
				 gm=cardgeneratorlistboxframe.insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1)
				 gm.crosslinkname=tit.name
				
				 cbt=New _guicheckbox
				 cbt.init(cardgeneratorlistboxframe,x+cw+5,y+cboy,cbw,cbh,-1)
				 'cbt.position.add(0,0,2,False)
				 checkboxinitmagic(cbt)
				 gm.crosslinkcheckbox=cbt
				 cbt.crosslinkmesh=gm
				 If c
				  If tit.name=c.frameselection 
				   cardgeneratorlistboxframe.selection=gm
				   cbt.checked=True
				  EndIf
				 EndIf				
				 i:+1
				Next	
				cardgeneratorlistboxframestructure.clearchild()
				i=0
				For Local tit:_cardsettexture=EachIn cardsetmanager.structurelist
				 gg.texture[0,0]=tit
				 gg.texture[1,0]=tit
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 Local x#=10
				 Local y#=20+i*(ch+20)
				 gm=cardgeneratorlistboxframestructure.insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1)
				 gm.crosslinkname=tit.name

				 cbt=New _guicheckbox
				 cbt.init(cardgeneratorlistboxframestructure,x+cw+5,y+cboy,cbw,cbh,-1)
				 'cbt.position.add(0,0,2,False)
				 checkboxinitmagic(cbt)
				 gm.crosslinkcheckbox=cbt
				 cbt.crosslinkmesh=gm
				 If c
				  If tit.name=c.structureframeselection 
				   cardgeneratorlistboxframestructure.selection=gm
				   cbt.checked=True
				  EndIf
				 EndIf				
				 i:+1
				Next	
				cardgeneratorlistboximpurity.clearchild()
				i=0
				For Local tit:_cardsettexture=EachIn cardsetmanager.impuritylist
				 gg.texture[0,0]=tit
				 gg.texture[1,0]=tit
				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 Local x#=5
				 Local y#=20+i*(ch+20)
				 gm=cardgeneratorlistboximpurity.insertmesh(mt,x,y,cw,ch,0.8,0.8,0.8,-1)
				 gm.crosslinkname=tit.name

				 cbt=New _guicheckbox
				 cbt.init(cardgeneratorlistboximpurity,x+cw+5,y+cboy,cbw,cbh,-1)
				' cbt.position.add(0,0,-1,False)
				 checkboxinitmagic(cbt)
				 gm.crosslinkcheckbox=cbt
				 cbt.crosslinkmesh=gm
				 If c
				  If tit.name=c.impurityselection 
				   cardgeneratorlistboximpurity.selection=gm
				   cbt.checked=True
				  EndIf
				 EndIf				
				 i:+1
				Next								
				If c=Null Return
				
				

				
				
				If cf
				 Local j=0
				 For Local mit:_guimesh=EachIn cardgeneratormeshfrontlist
				  mit.superinvisible=False
				  For Local pit:_polygon=EachIn mit.meshtransformed.polygonlist
				   pit.texture[0,0]=cf.texturepreview[j]
				   pit.texture[1,0]=cf.texturepreview[j]
				  Next
				  j:+1
				 Next
				 For Local mit:_guimesh=EachIn cardgeneratormeshbacklist
				  mit.superinvisible=True
				 Next
				 cardgeneratortextframenumber.superinvisible=False
				 cardgeneratortextframepicture.superinvisible=False
				 cardgeneratortextframebackside.superinvisible=True
				 cardgeneratortrackbarframenumber.superinvisible=False
				 cardgeneratortrackbarframepicture.superinvisible=False
				 cardgeneratortrackbarframebackside.superinvisible=True
				EndIf 
				
				If cb
				 For Local mit:_guimesh=EachIn cardgeneratormeshbacklist
				  mit.superinvisible=False
				  For Local pit:_polygon=EachIn mit.meshtransformed.polygonlist
				   pit.texture[0,0]=cb.texturepreview
				   pit.texture[1,0]=cb.texturepreview
				  Next
				 Next
				 For Local mit:_guimesh=EachIn cardgeneratormeshfrontlist
				  mit.superinvisible=True
				 Next
				 cardgeneratortextframenumber.superinvisible=True
				 cardgeneratortextframepicture.superinvisible=True
				 cardgeneratortextframebackside.superinvisible=False
				 cardgeneratortrackbarframenumber.superinvisible=True
				 cardgeneratortrackbarframepicture.superinvisible=True
				 cardgeneratortrackbarframebackside.superinvisible=False

				EndIf				
				
				cardgeneratortrackbargroundstructure.set(c.structureground)
				cardgeneratorcheckboxgroundstructurebehind.checked=c.structuregroundbehind
				
				cardgeneratortrackbarframepicture.set(c.frameforpictures)
				cardgeneratortrackbarframenumber.set(c.framefornumbers)
				cardgeneratortrackbarframebackside.set(c.frameforbacksides)
				cardgeneratortrackbarframestructure.set(c.structureframe)
				
				cardgeneratortrackbarimpurity.set(c.impurity)
				cardgeneratortrackbarimpurityyellowing.set(c.impurityyellowing)
				'cardgeneratortrackbarimpurityscratchs.set(c.impurityscratchs)
				
				cardgeneratorlistboxground.scrolltoselection()
				cardgeneratorlistboxgroundstructure.scrolltoselection()
				cardgeneratorlistboxframe.scrolltoselection()
				cardgeneratorlistboxframestructure.scrolltoselection()
				cardgeneratorlistboximpurity.scrolltoselection()
				

				
				
				EndMethod				
'******************************************************************************************************************
'										S T A T I S C S  M E N U 
'******************************************************************************************************************				
	Method createmenustatistics()
				Local tr#=1,tg#=0.8,tb#=0.4
				Local lx#=250
				Local ly#=100
				Local y#=80
				Local x#=670
				Local wx#=850
				Local wy#=760
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local yit#=0
				Local off#=28				
				Local cw#=128*0.7
				Local ch#=200*0.7
				Local mt:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cbt:_guicheckbox
	
				menustatistics=menuman.createmenu()
				windowstatistics=New _guiwindow
				windowstatistics.init(guisystem,Int(-wx/2+90),Int(-wy/2+5),wx,wy,255,255,255)
				windowstatistics.position.add(0.5,0.5,0,True)
				windowstatistics.position.addkondition(640,800,480,600,  100,5,-1,False)
				windowstatistics.size.addkondition(640,800,480,600,  690,590,1,False)
				windowstatistics.shadow=False
				windowinitmagic(windowstatistics,igametypewindow)
				menustatistics.add(windowstatistics)
				
				buttonstatisticsmainmenu=New _guibutton
				buttonstatisticsmainmenu.init(guisystem,-wx/2+90-(buttonwidth-60),-wy/2+5+10,buttonwidth-60,buttonheight,strmenu,11)
				buttonstatisticsmainmenu.position.add(0.5,0.5,0,True)
				buttonstatisticsmainmenu.position.addkondition(640,800,480,600,  5,5,-1,False)
				buttonstatisticsmainmenu.size.addkondition(640,800,480,600,  buttonwidth-80,buttonheight-10,1,False)
				buttoninitmagic(buttonstatisticsmainmenu)
				menustatistics.add(buttonstatisticsmainmenu)				

				buttonstatisticsranks=New _guibutton
				buttonstatisticsranks.init(guisystem,-wx/2+90-(buttonwidth-60),-wy/2+buttonheight+5+10+10,buttonwidth-60,buttonheight,strranklist,-1)
				buttonstatisticsranks.position.add(0.5,0.5,0,True)
				buttonstatisticsranks.position.addkondition(640,800,480,600,  5,buttonheight+5+5,-1,False)
				buttonstatisticsranks.size.addkondition(640,800,480,600,  buttonwidth-80,buttonheight-10,1,False)
				buttoninitmagic(buttonstatisticsranks)
				menustatistics.add(buttonstatisticsranks)				


				SetImageFont(font30)
				Local hh$=strstatistics
				ttitlestatistics=New _guitext
				ttitlestatistics.init(windowstatistics,-TextWidth(hh)/2,40,1,hh,1,0.95,0.8,font30)
				ttitlestatistics.position.add(0.5,0,0,True)
				windowstatisticstypelist=New _guilistbox
				windowstatisticstypelist.borderwidth=8
				windowstatisticstypelist.init(windowstatistics,60,80,200,290,1,1,1,38)
				windowstatisticstypelist.setvectordynamic(wx,wy)
				windowstatisticstypelist.selectionrect=True
				windowstatisticstypelist.moverrect=True
				listboxinitmagic(windowstatisticstypelist)
				
				
				'-------------------------------------- create sort box
				windowstatisticssortbox=New _guicombobox
				windowstatisticssortbox.init(windowstatistics,60,80+255+40,200,40,60,-1,1,1,1  ,260,80+255-120,210,160+40, 30, 0, font18)
				windowstatisticssortbox.setvectordynamic(wx,wy)
				windowstatisticssortbox.listbox.selectionrect=True
				windowstatisticssortbox.listbox.moverrect=True
				windowstatisticssortbox.listbox.setpositiondynamic(wx,wy)
				comboboxinitmagic(windowstatisticssortbox)
				
				Rem
				
				
				Local sey#=5
				gt=windowstatisticssortbox.listbox.inserttext(strgametypesortalphabetical,10,sey,1,tr,tg,tb,font18,0);sey:+20
				gt=windowstatisticssortbox.listbox.inserttext(strgametypesortpublicity,10,sey,1,tr,tg,tb,font18,1);sey:+20;gt.createhelp(strgametypesortpublicitydesc,font18,0.1,200,0);guihelpinitmagic(gt)
				gt=windowstatisticssortbox.listbox.inserttext(strgametypesortchance,10,sey,1,tr,tg,tb,font18,2);sey:+20;gt.createhelp(strgametypesortchancedesc,font18,0.1,200,0);guihelpinitmagic(gt)
				gt=windowstatisticssortbox.listbox.inserttext(strgametypesortskill,10,sey,1,tr,tg,tb,font18,3);sey:+20;gt.createhelp(strgametypesortskilldesc,font18,0.1,200,0);guihelpinitmagic(gt)
				gt=windowstatisticssortbox.listbox.inserttext(strgametypesorttime,10,sey,1,tr,tg,tb,font18,4);sey:+20;gt.createhelp(strgametypesorttimedesc,font18,0.1,200,0);guihelpinitmagic(gt)
				gt=windowstatisticssortbox.listbox.inserttext(strgametypesorttype,10,sey,1,tr,tg,tb,font18,5);sey:+20
				
				windowstatisticssortbox.listbox.superinactivity(True)
				windowstatisticssortbox.listbox.superinvisibility(True)
				windowstatisticssortbox.listbox.fadeopacity(0)
				windowstatisticssortbox.createhelp(strsortbox,font18,0.5,0,0)
				windowstatisticssortbox.button.createhelp(strsortboxbutton,font18,0.5,0,0)
				guihelpinitmagic(windowstatisticssortbox)
				guihelpinitmagic(windowstatisticssortbox.button)
				EndRem
				Local gt:_guitext
				Local sey#=0
				Local hse$
				Local txo#=210/2-35
				Local tx#
				
				
				
				
				hse=strgametypesortalphabetical;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowstatisticssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,0);sey:+22
				
				hse=strgametypesortpublicity;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowstatisticssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,1);sey:+22;gt.createhelp(strgametypesortpublicitydesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesortchance;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowstatisticssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,2);sey:+22;gt.createhelp(strgametypesortchancedesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesortskill;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowstatisticssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,3);sey:+22;gt.createhelp(strgametypesortskilldesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesorttime;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowstatisticssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,4);sey:+22;gt.createhelp(strgametypesorttimedesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesorttype;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowstatisticssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,5);sey:+22
				
				windowstatisticssortbox.listbox.superinactivity(True)
				windowstatisticssortbox.listbox.superinvisibility(True)
				windowstatisticssortbox.listbox.fadeopacity(0)
				windowstatisticssortbox.createhelp(strsortbox,font18,0.5,0,0)
				windowstatisticssortbox.button.createhelp(strsortboxbutton,font18,0.5,0,0)
				guihelpinitmagic(windowstatisticssortbox)
				guihelpinitmagic(windowstatisticssortbox.button)				
				
				
				
				windowstatisticssortbox.clearbackground()
				windowstatisticssortbox.shadow=False
				windowstatisticssortbox.superinvisible=True
				windowstatisticssortbox.text.set(strgametypesortalphabetical)			
				windowstatisticssortbox.text.textshadow=1	
				'-------------------------------------------------------
				updatelistboxgametypesorted(windowstatisticstypelist,current_preview)				
				
				windowstatisticsuserlist=New _guilistbox
				windowstatisticsuserlist.borderwidth=8
				windowstatisticsuserlist.init(windowstatistics,60,380+40,200,250,1,1,1,38)
				windowstatisticsuserlist.setvectordynamic(wx,wy)
				windowstatisticsuserlist.selectionrect=True
				windowstatisticsuserlist.moverrect=True
				listboxinitmagic(windowstatisticsuserlist)
				
				updatelistboxuser(windowstatisticsuserlist,True)
				'-------------------------------------------------------
				SetImageFont(font24)
				'Local text:_guitext
				hh=strstatisticstotal
				windowstatisticstypetitle=New _guitext
				windowstatisticstypetitle.init(windowstatistics,(wx*0.4),100,1,hh,1,0.9,0.7,font24)
				windowstatisticstypetitle.setvectordynamic(wx,wy)

				
				hh=strstatisticsuser
				windowstatisticsusertitle=New _guitext
				windowstatisticsusertitle.init(windowstatistics,(wx*0.4),410,1,hh,1,0.9,0.7,font24)
				windowstatisticsusertitle.setvectordynamic(wx,wy)
				
				yit=140
				hh="count"
				windowstatisticstypecount=New _guitext
				windowstatisticstypecount.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypecount.setvectordynamic(wx,wy)
				hh=strcount
				windowstatisticstypecounttext=New _guitext
				windowstatisticstypecounttext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypecounttext.setvectordynamic(wx,wy)
				yit:+off
				
				hh="quote"
				windowstatisticstypequote=New _guitext
				windowstatisticstypequote.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypequote.setvectordynamic(wx,wy)
				hh=strwinquote
				windowstatisticstypequotetext=New _guitext
				windowstatisticstypequotetext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypequotetext.setvectordynamic(wx,wy)
				yit:+off
				
				hh="time"
				windowstatisticstypetime=New _guitext
				windowstatisticstypetime.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypetime.setvectordynamic(wx,wy)
				hh=strplaytime
				windowstatisticstypetimetext=New _guitext
				windowstatisticstypetimetext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypetimetext.setvectordynamic(wx,wy)
				yit:+off
				
				hh="discard"
				windowstatisticstypediscard=New _guitext
				windowstatisticstypediscard.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypediscard.setvectordynamic(wx,wy)
				hh=strpoints
				windowstatisticstypediscardtext=New _guitext
				windowstatisticstypediscardtext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypediscardtext.setvectordynamic(wx,wy)
				yit:+off
				
				hh="moves"
				windowstatisticstypemoves=New _guitext
				windowstatisticstypemoves.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypemoves.setvectordynamic(wx,wy)
				hh=strplaymoves
				windowstatisticstypemovestext=New _guitext
				windowstatisticstypemovestext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticstypemovestext.setvectordynamic(wx,wy)
				yit:+off
				
								
				windowstatisticstypeclear=New _guibutton
				windowstatisticstypeclear.init(windowstatistics,wx*0.4,yit+10,200,65,strdeleteall,-1)
				windowstatisticstypeclear.setvectordynamic(wx,wy)
				buttoninitmagic(windowstatisticstypeclear)
				windowstatisticstypeclear.createhelp(strstatisticsdeleteall,font18,0.6,0,0)
				guihelpinitmagic(windowstatisticstypeclear)
				

				windowstatisticstypereset=New _guibutton
				windowstatisticstypereset.init(windowstatistics,wx*0.68,yit+10,200,65,strbackset,-1)
				windowstatisticstypereset.setvectordynamic(wx,wy)
				buttoninitmagic(windowstatisticstypereset)
				windowstatisticstypereset.createhelp(strstatisticsdeleteallandgenerate,font18,0.2,0,0)
				guihelpinitmagic(windowstatisticstypereset)

				windowstatisticstyperanks=New _guibutton
				windowstatisticstyperanks.init(windowstatistics,wx*0.78,130,100,40,strranks,-1)
				windowstatisticstyperanks.setvectordynamic(wx,wy)
				buttoninitmagic(windowstatisticstyperanks)			
				windowstatisticstyperanks.createhelp(strshowranks,font18,0.6,0,0)
				guihelpinitmagic(windowstatisticstyperanks)

							
					
				
				yit=450
				hh="count"
				windowstatisticsusercount=New _guitext
				windowstatisticsusercount.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsusercount.setvectordynamic(wx,wy)
				hh=strcount
				windowstatisticsusercounttext=New _guitext
				windowstatisticsusercounttext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsusercounttext.setvectordynamic(wx,wy)
				yit:+off
				
				hh="quote"
				windowstatisticsuserquote=New _guitext
				windowstatisticsuserquote.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsuserquote.setvectordynamic(wx,wy)
				hh=strwinquote
				windowstatisticsuserquotetext=New _guitext
				windowstatisticsuserquotetext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsuserquotetext.setvectordynamic(wx,wy)
				yit:+off
				
				hh="time"
				windowstatisticsusertime=New _guitext
				windowstatisticsusertime.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsusertime.setvectordynamic(wx,wy)
				hh=strplaytime
				windowstatisticsusertimetext=New _guitext
				windowstatisticsusertimetext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsusertimetext.setvectordynamic(wx,wy)
				yit:+off
				
				hh="discard"
				windowstatisticsuserdiscard=New _guitext
				windowstatisticsuserdiscard.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsuserdiscard.setvectordynamic(wx,wy)
				hh=strpoints
				windowstatisticsuserdiscardtext=New _guitext
				windowstatisticsuserdiscardtext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsuserdiscardtext.setvectordynamic(wx,wy)
				yit:+off
				
				hh="moves"
				windowstatisticsusermoves=New _guitext
				windowstatisticsusermoves.init(windowstatistics,(wx*0.7),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsusermoves.setvectordynamic(wx,wy)
				hh=strplaymoves
				windowstatisticsusermovestext=New _guitext
				windowstatisticsusermovestext.init(windowstatistics,(wx*0.4),yit,1,hh,1,0.8,0.4,font24)
				windowstatisticsusermovestext.setvectordynamic(wx,wy)
				yit:+off

				windowstatisticsuserverlauf=New _guibutton
				windowstatisticsuserverlauf.init(windowstatistics,wx*0.78,440,100,40,strquote,-1)
				windowstatisticsuserverlauf.setvectordynamic(wx,wy)
				buttoninitmagic(windowstatisticsuserverlauf)			
				windowstatisticsuserverlauf.createhelp(strstatisticsshowverlauf,font18,0.6,0,0)
				guihelpinitmagic(windowstatisticsuserverlauf)
				

				windowstatisticsuserverlaufdiscards=New _guibutton
				windowstatisticsuserverlaufdiscards.init(windowstatistics,wx*0.78,490,100,40,strpoints,-1)
				windowstatisticsuserverlaufdiscards.setvectordynamic(wx,wy)
				buttoninitmagic(windowstatisticsuserverlaufdiscards)			
				windowstatisticsuserverlaufdiscards.createhelp(strstatisticsshowpoints,font18,0.6,0,0)
				guihelpinitmagic(windowstatisticsuserverlaufdiscards)


				windowstatisticsuserthisclear=New _guibutton
				windowstatisticsuserthisclear.init(windowstatistics,wx*0.4,yit+10,200,65,strstatisticsdeletethis,-1)
				windowstatisticsuserthisclear.setvectordynamic(wx,wy)
				buttoninitmagic(windowstatisticsuserthisclear)			
				windowstatisticsuserthisclear.createhelp(strstatisticsdeleteplayer,font18,0.6,0,0)
				guihelpinitmagic(windowstatisticsuserthisclear)

				windowstatisticsuserotherclear=New _guibutton
				windowstatisticsuserotherclear.init(windowstatistics,wx*0.68,yit+10,200,65,strstatisticsdeleteother,-1)
				windowstatisticsuserotherclear.setvectordynamic(wx,wy)
				buttoninitmagic(windowstatisticsuserotherclear)			
				windowstatisticsuserotherclear.createhelp(strstatisticsdeleteplayerother,font18,0.6,0,0)
				guihelpinitmagic(windowstatisticsuserotherclear)
	
				updatemenustatistics()
				windowstatisticsuserlist.scrolltoselection()
				
				menustatistics.fadeoff()
				menustatistics.visibility(False)
				menustatistics.activity(False)
				menustatistics.fadetarget(menuopacity2)
				menustatistics.fadeopacity(0)
				EndMethod
	Method windowstatisticsselectedtype:Int()
				Local typ$=windowstatisticstypelist.selectiontext()
				Local cur=-1
				For Local i=0 To gametypecount-1
				 If typ=gamenames[i] 
				  cur=i
				 EndIf
				Next		
				Return(cur)
				EndMethod	
	Method windowstatisticsselecteduser:String()
				If(windowstatisticsuserlist.selection)
				 Local gi:_guiimage=_guiimage(windowstatisticsuserlist.selection)
				 If gi
				  If gi.crosslinktext
				   Return(gi.crosslinktext.get())

				  EndIf
				 EndIf
				EndIf
				Return(Null)
				EndMethod
	Method updatemenustatistics()
				Local cur=windowstatisticsselectedtype()
				If cur<>-1
				 windowstatisticstypetitle.set(strstatisticstotal+" - "+gamenames[cur])
				 
				 windowstatisticstypecount.set(gamestats[cur].entrylist.count())
				 If gamestats[cur].entrylist.count()
				  windowstatisticstypequote.set(Int(gamestats[cur].quote()*100)+" %")
				  windowstatisticstypetime.set(timemstohhmmss(gamestats[cur].timeaverage()))
				  windowstatisticstypediscard.set(Int(gamestats[cur].discardaverage()))
				  windowstatisticstypemoves.set(Int(gamestats[cur].moveaverage()))
				 Else
				  windowstatisticstypequote.set("-")
				  windowstatisticstypetime.set("-")
				  windowstatisticstypediscard.set("-")
				  windowstatisticstypemoves.set("-")
				 EndIf
				 Local usr$=windowstatisticsselecteduser()
				 If usr<>""
				  If cur<>-1 windowstatisticsusertitle.set(strstatisticsuser+" - "+usr+" in "+gamenames[cur])
				  windowstatisticsusertitle.fadein()
				  windowstatisticsuserthisclear.fadein()
				  windowstatisticsuserotherclear.fadein()
				  windowstatisticsuserverlauf.fadein()
				  windowstatisticsuserverlaufdiscards.fadein()
				  windowstatisticsusercounttext.fadein()
				  windowstatisticsuserquotetext.fadein()
				  windowstatisticsusertimetext.fadein()
				  windowstatisticsuserdiscardtext.fadein()
				  windowstatisticsusermovestext.fadein()
				  windowstatisticsusercount.fadein()
				  windowstatisticsuserquote.fadein()
				  windowstatisticsusertime.fadein()
				  windowstatisticsuserdiscard.fadein()
				  windowstatisticsusermoves.fadein()
				
				  windowstatisticsusercount.set(gamestats[cur].countuser(usr))
				  If gamestats[cur].countuser(usr)
				   windowstatisticsuserquote.set(Int(gamestats[cur].quoteuser(usr)*100)+" %")
				   windowstatisticsusertime.set(timemstohhmmss(gamestats[cur].timeaverageuser(usr)))
				   windowstatisticsuserdiscard.set(Int(gamestats[cur].discardaverageuser(usr)))
				   windowstatisticsusermoves.set(Int(gamestats[cur].moveaverageuser(usr)))
				  Else
				   windowstatisticsuserquote.set("-")
				   windowstatisticsusertime.set("-")
				   windowstatisticsuserdiscard.set("-")
				   windowstatisticsusermoves.set("-")
				  EndIf
				 Else
				
				  windowstatisticsusertitle.fadeout()
				  windowstatisticsuserthisclear.fadeout()
				  windowstatisticsuserotherclear.fadeout()
				  windowstatisticsuserverlauf.fadeout()
				  windowstatisticsuserverlaufdiscards.fadeout()
				  windowstatisticsusercounttext.fadeout()
				  windowstatisticsuserquotetext.fadeout()
				  windowstatisticsusertimetext.fadeout()
				  windowstatisticsuserdiscardtext.fadeout()
				  windowstatisticsusermovestext.fadeout()
				  windowstatisticsusercount.fadeout()
				  windowstatisticsuserquote.fadeout()
				  windowstatisticsusertime.fadeout()
				  windowstatisticsuserdiscard.fadeout()
				  windowstatisticsusermoves.fadeout()

				 EndIf
				 windowstatistics.updatefadeopacity()
				EndIf
				EndMethod					
    Method messageverlauf()
				Local usr$=windowstatisticsselecteduser()
				Local typ=windowstatisticsselectedtype()
				
				If typ<>-1 And usr<>"" 

				 guisystem.saveactivitylist()
				 guisystem.setactivitylist(False)
				 Local t$=strstatisticsverlaufuser+" "+usr+" in "+gamenames[typ]
				 Local tbutton$=strok
				 Local tr#=messageboxtextcolor.x
				 Local tg#=messageboxtextcolor.y
				 Local tb#=messageboxtextcolor.z
				 Local f:timagefont=font24
				 Local iwindow:timage=iverlaufwindow
				 Local ox#=gra.screenw/2
				 Local oy#=gra.screenh/2
				 gra.enabletext2d()
				 SetImageFont(f)
				 FlushKeys()
				 FlushMouse()
				 Local w0:_guiwindow
				 Local px#=ox
				 Local py#=oy
				 Local wy#=512
				 Local wx#=800'TextWidth(t$)+messageboxadditiontextwidth
				 Local maxwx=800

				 'If wx<100 wx=100
				 'If wx>maxwx wx=maxwx
				 Local lt:TList=textsplit(t,wx-messageboxadditiontextwidth,f)
				 px:-wx/2
				 py:-wy/2
				 'wy=180+lt.count()*20
				 w0=New _guiwindow
				 w0.init(guisystem,px,py,wx,wy,1,1,1)
				 w0.position.setz(-10)
				 w0.position.addkondition(640,800,480,600,  px,py+35,-10,False)
				 windowinitmagic(w0,iwindow)
				 w0.setshadow(25,25)
				 Local yit#=messageboxadditiontexty
				 For Local tit:String=EachIn lt
				  Local t0:_guitext
				  t0=New _guitext
		 		  t0.init(w0,wx/2-TextWidth(tit)/2,yit,messageboxtextz,tit,tr,tg,tb,font24)
			 	  yit:+25
				 Next
				 Local k0:_guibutton
				 Local buw#=100
				 k0=New _guibutton
				 k0.init(w0,wx/2-buw/2-5,wy-60+messageboxadditionbuttony-5,buw,40,tbutton,0)
				 buttoninitmagic(k0)
				
				 'verlauf generieren
				 Local diax#=100-5
				 Local diay#=140-5
				 Local diaw#=wx-200
				 Local diah#=wy-240

				 Local gt:_guitext=Null
				 Local gl:_guiline=Null
				 Local h$
				 

				 SetImageFont(font14)


				 Local gridy#
				 h="[%]"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay-(TextHeight(h)*1.5+4),1,1,0.8,0.4,font14,-1)

				 gridy=diay-1
				 h="100"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1
			
				 gridy=diay+diah*0.25-1
				 h="75"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay+diah*0.25-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				
				 gridy=diay+diah*0.5-1
				 h="50"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay+diah*0.50-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1

				 gridy=diay+diah*0.75-1
				 h="25"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay+diah*0.75-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1

				 gridy=diay+diah*1-1
				 h="0"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay+diah-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				
				 Local yc0#=(gametypechancemin(typ)-0.05)
				 Local yc1#=(gametypechancemin(typ)+0.05)
				 If yc0<0 yc0=0
				 If yc1>1 yc1=1
				' gridy=diay+diah*(1-yc0)
				' gl=w0.insertline(diax,gridy,diax+diaw,gridy,0.3,1,0.1)
				' gl.color.w=0.2
				' gridy=diay+diah*(1-yc1)
				' gl=w0.insertline(diax,gridy,diax+diaw,gridy,0.3,1,0.1)
				' gl.color.w=0.2
				 Local  gi:_guiimage=w0.insertimage(inormalrange,diax,diay+diah*(1-yc1),diaw,Abs(diah*(1-yc0)-diah*(1-yc1)),1,0.8,0.4,-1)
				 gi.color.w=0.2
				
				
				
				 Local usercount:Int=0
				 For Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist
				  If eit.user=usr
				   usercount:+1
				  EndIf
				 Next
				 If usercount>0
				 Local lasteit:_gamestatsentry=Null
				 Local lastex#=-1
				 Local lastey#=-1
				 Local gamewon=0
				 Local i
			
				 For Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist
				  If eit.user=usr
				   If eit.discards=gametypediscards[typ]
				    gamewon:+1
				   EndIf
				   eit.quoteverlauf=Float(gamewon)/Float(i+1)
				   

				   Local xsh#=0.5*diaw/Float(usercount)
				   Local ex#=diax+diaw*Float(i)/Float(usercount)+xsh
				   Local ey#=diay+diah*(1-eit.quoteverlauf)
				   Local ew#=16
				   Local eh#=16
				   Local gi:_guiimage=w0.insertimage(idonut,ex-ew/2,ey-eh/2,ew,eh,1,1,1,-1)
				 
				   gi.position.setz(gi.position.getz()-1)
				   Local tt$=" "+strtipps
				   Local tm$=" "+strplaymoves
				   Local tp$=" "+strpoints
				   If eit.tipps=1 tt=" "+strtipp
				   If eit.moves=1 tm=" "+strplaymove
				   If eit.discards=1 tp=" "+strpoint
				   SetImageFont(font18)
				
				   
				   Local entryhelp:_guiwindow=gi.createhelp("",font18,0,0,0,200,True);
				   windowinitmagic(entryhelp,ilistboxwindow)
				   Local gth:_guitext
				
				   h=Int(eit.quoteverlauf*100)+"%"
				   If eit.discards=gametypediscards[typ] h:+" ("+strwon+")" Else h:+" ("+strlost+")"

				   gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,40-5,1,1,0.8,0.3,font18)
				
				   h=eit.discards+tp
				   gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,60+20-5,1,1,0.8,0.3,font18)

				   h=strduration+" "+timemstohhmmss(eit.time)	
				   gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,60+40-5,1,1,0.8,0.3,font18)

				   h=eit.moves+tm
				   gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,60+60-5,1,1,0.8,0.3,font18)

				   h=eit.tipps+tt
				   gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,60+80-5,1,1,0.8,0.3,font18)

				   
				
				   entryhelp.color.set(1,1,1,1)
				   entryhelp.colortransformed.copy(entryhelp.color)
				   entryhelp.fadetarget(1)
				   entryhelp.setshadow(10,10)
				   entryhelp.size.setx(200)
				   entryhelp.size.sety(200)
				   entryhelp.animate(0)
				   If lasteit
				    Local gl:_guiline=w0.insertline(lastex,lastey-1,ex,ey-1,0.4,0.3,0.08)
				    gl.color.w=0.7
				    gl.position.setz(gl.position.getz()-0.5)
				   EndIf
				  
				   i:+1
				   lasteit=eit
				   lastex=ex
				   lastey=ey
				  EndIf
				 Next
				 EndIf
				 w0.visibility(False)
				 w0.activity(False)
				 w0.fadeopacity(0)
				 w0.fadein()
				 w0.fadetarget(menuopacity)		
				 menustatistics.fadeout()
				 Local ap
				 If game 
				  ap=game.allowpick
				  game.allowpick=False
				 EndIf
				 Local q=False
				 windowstatisticsuserverlauf.help.fadeout()
				 Repeat
				  Local cc=GetChar()
				  guisystem.nullstates()
				  If animatestandard(cc) q=True
				  drawstandard()
				 Until guisystem.button Or KeyHit(KEY_ESCAPE) Or KeyHit(KEY_RETURN) Or MouseHit(MOUSE_LEFT) Or MouseHit(MOUSE_RIGHT) Or q
				 guisystem.button=Null
				 FlushKeys()
				 FlushMouse()
				 w0.fadeout(False,False,True)
				 menustatistics.fadein()
				 If game game.allowpick=ap
				 guisystem.restoreactivitylist()
				EndIf
				EndMethod
    Method messagediscards()
				Local usr$=windowstatisticsselecteduser()
				Local typ=windowstatisticsselectedtype()
				
				If typ<>-1 And usr<>"" 

				 guisystem.saveactivitylist()
				 guisystem.setactivitylist(False)
				 Local t$=strstatisticspointsuser+" "+usr+" in "+gamenames[typ]
				 Local tbutton$=strok
				 Local tr#=messageboxtextcolor.x
				 Local tg#=messageboxtextcolor.y
				 Local tb#=messageboxtextcolor.z
				 Local f:timagefont=font24
				 Local iwindow:timage=iverlaufwindow
				 Local ox#=gra.screenw/2
				 Local oy#=gra.screenh/2
				 gra.enabletext2d()
				 SetImageFont(f)
				 FlushKeys()
				 FlushMouse()
				 Local w0:_guiwindow
				 Local px#=ox
				 Local py#=oy
				 Local wy#=512
				 Local wx#=800
				 Local maxwx=800
				 Local lt:TList=textsplit(t,wx-messageboxadditiontextwidth,f)
				 px:-wx/2
				 py:-wy/2
				 w0=New _guiwindow
				 w0.init(guisystem,px,py,wx,wy,1,1,1)
				 w0.position.setz(-10)
				 w0.position.addkondition(640,800,480,600,  px,py+35,-10,False)

				 windowinitmagic(w0,iwindow)
				 w0.setshadow(25,25)
				 Local yit#=messageboxadditiontexty
				 For Local tit:String=EachIn lt
				  Local t0:_guitext
				  t0=New _guitext
		 		  t0.init(w0,wx/2-TextWidth(tit)/2-5,yit,messageboxtextz,tit,tr,tg,tb,font24)
			 	  yit:+25
				 Next
				 Local k0:_guibutton
				 Local buw#=100
				 k0=New _guibutton
				 k0.init(w0,wx/2-buw/2-5,wy-60+messageboxadditionbuttony-5,buw,40,tbutton,0)
				 buttoninitmagic(k0)
				
				 'verlauf generieren
				 Local diax#=100-5
				 Local diay#=140-5
				 Local diaw#=wx-200
				 Local diah#=wy-240
				 Local gt:_guitext=Null
				 Local gl:_guiline=Null
				 Local h$
				 SetImageFont(font14)
				 Local gridy#
				 h="[%]"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay-(TextHeight(h)*1.5+4),1,1,0.8,0.4,font14,-1)

				 gridy=diay-1
				 h="100"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1
			
				 gridy=diay+diah*0.25-1
				 h="75"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay+diah*0.25-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				
				 gridy=diay+diah*0.5-1
				 h="50"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay+diah*0.50-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1

				 gridy=diay+diah*0.75-1
				 h="25"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay+diah*0.75-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1

				 gridy=diay+diah*1-1
				 h="0"
			     gt=w0.inserttext(h,diax+diaw*0.5-TextWidth(h)/2,diay+diah-TextHeight(h)/2-1,1,1,0.8,0.4,font14,-1)
				 gl=w0.insertline(diax,gridy,diax+diaw*0.47,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				 gl=w0.insertline(diax+diaw*0.53,gridy,diax+diaw,gridy,1,0.8,0.2)
				 gl.color.w=0.1
				
				 Local usercount:Int=0
				 For Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist
				  If eit.user=usr
				   usercount:+1
				  EndIf
				 Next
				 If usercount>0
				 Local lasteit:_gamestatsentry=Null
				 Local lastex#=-1
				 Local lastey#=-1
				 Local gamewon=0
				 Local i
			
				  For Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist
				   If eit.user=usr
				    If eit.discards=gametypediscards[typ]
				     gamewon:+1
				    EndIf
				    eit.quoteverlauf=Float(gamewon)/Float(i+1)
				   
					Local eitpoints#=Float(eit.discards)/Float(gametypediscards[typ])
				    Local xsh#=0.5*diaw/Float(usercount)
				    Local ex#=diax+diaw*Float(i)/Float(usercount)+xsh
				    Local ey#=diay+diah*(1-eitpoints)
				    Local ew#=16
				    Local eh#=16
				    Local gi:_guiimage=w0.insertimage(idonut,ex-ew/2,ey-eh/2,ew,eh,1,1,1,-1)
				 
				    gi.position.setz(gi.position.getz()-1)
				    Local tt$=" "+strtipps
				    Local tm$=" "+strplaymoves
				    Local tp$="% "+strquote
				    If eit.tipps=1 tt=" "+strtipp
				    If eit.moves=1 tm=" "+strplaymove
				    SetImageFont(font18)
				
				   
				    Local entryhelp:_guiwindow=gi.createhelp("",font18,0,0,0,200,True);
				    windowinitmagic(entryhelp,ilistboxwindow)
				    Local gth:_guitext
				
				    h=Int(eitpoints*100)+"% ("+eit.discards+"/"+gametypediscards[typ]+")"
				    gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,40-5,1,1,0.8,0.3,font18)
				
				    h=Int(eit.quoteverlauf*100)+tp
				    gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,60+20-5,1,1,0.8,0.3,font18)

				    h=strduration+" "+timemstohhmmss(eit.time)	
				    gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,60+40-5,1,1,0.8,0.3,font18)

				    h=eit.moves+tm
				    gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,60+60-5,1,1,0.8,0.3,font18)

				    h=eit.tipps+tt
				    gth=entryhelp.inserttext(h,100-TextWidth(h)/2-5,60+80-5,1,1,0.8,0.3,font18)

				   
				
				    entryhelp.color.set(1,1,1,1)
				    entryhelp.colortransformed.copy(entryhelp.color)
				    entryhelp.fadetarget(1)
				    entryhelp.setshadow(10,10)
				    entryhelp.size.setx(200)
				    entryhelp.size.sety(200)
				    entryhelp.animate(0)
				    If lasteit
				     Local gl:_guiline=w0.insertline(lastex,lastey-1,ex,ey-1,0.4,0.3,0.08)
				     gl.color.w=0.7
				     gl.position.setz(gl.position.getz()-0.5)
				    EndIf
				  
				    i:+1
				    lasteit=eit
				    lastex=ex
				    lastey=ey
				   EndIf
				  Next
				 EndIf
				 w0.visibility(False)
				 w0.activity(False)
				 w0.fadeopacity(0)
				 w0.fadein()
				 w0.fadetarget(menuopacity)		
				 menustatistics.fadeout()
				 Local ap
				 If game 
				  ap=game.allowpick
				  game.allowpick=False
				 EndIf
				 Local q=False
				 windowstatisticsuserverlauf.help.fadeout()
				 Repeat
				  Local cc=GetChar()
				  guisystem.nullstates()
				  If animatestandard(cc) q=True
				  drawstandard()
				 Until guisystem.button Or KeyHit(KEY_ESCAPE) Or KeyHit(KEY_RETURN) Or MouseHit(MOUSE_LEFT) Or MouseHit(MOUSE_RIGHT) Or q
				 guisystem.button=Null
				 FlushKeys()
				 FlushMouse()
				 w0.fadeout(False,False,True)
				 menustatistics.fadein()
				 If game game.allowpick=ap
				 guisystem.restoreactivitylist()
				EndIf
				EndMethod
				
'******************************************************************************************************************
'										R A N K S  M E N U 
'******************************************************************************************************************				
	Method createmenuranks()
				Local tr#=1,tg#=0.8,tb#=0.4
				Local lx#=250
				Local ly#=100
				Local y#=80
				Local x#=670
				Local wx#=800
				Local wy#=650
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local yit#=0
				Local off#=28				
				Local cw#=128*0.7
				Local ch#=200*0.7
				Local mt:_mesh
				Local gg:_geometrygrid=New _geometrygrid
				Local cbt:_guicheckbox
	

				

	
	
	
				menuranks=menuman.createmenu()
				windowranks=New _guiwindow
				windowranks.init(guisystem,Int(-wx/2+90),Int(-wy/2),wx,wy+40,255,255,255)
				windowranks.position.add(0.5,0.5,0,True)
				windowranks.position.addkondition(640,800,480,600,  100,5,-1,False)
				windowranks.size.addkondition(640,800,480,600,  690,590,1,False)
				windowranks.shadow=False'setshadow(10,10)
				windowinitmagic(windowranks,igametypewindow)
				menuranks.add(windowranks)
				
				'createmenuoptionsbutton(windowoptionscard,menuscene,3)
				
				buttonranksmainmenu=New _guibutton
				buttonranksmainmenu.init(guisystem,-wx/2-(buttonwidth-50)-10+90,-wy/2,buttonwidth-40,buttonheight,strmenu,11)
				buttonranksmainmenu.position.add(0.5,0.5,0,True)
				buttonranksmainmenu.position.addkondition(640,800,480,600,  5,5,-1,False)
				buttonranksmainmenu.size.addkondition(640,800,480,600,  buttonwidth-80,buttonheight-10,1,False)
				buttoninitmagic(buttonranksmainmenu)
				menuranks.add(buttonranksmainmenu)			
				
				buttonranksstatistics=New _guibutton
				buttonranksstatistics.init(guisystem,-wx/2-(buttonwidth-50)-10+90,-wy/2+bh+off,buttonwidth-40,buttonheight,strstatistics,-1)
				buttonranksstatistics.position.add(0.5,0.5,0,True)
				buttonranksstatistics.position.addkondition(640,800,480,600,  5,buttonheight+5+5,-1,False)
				buttonranksstatistics.size.addkondition(640,800,480,600,  buttonwidth-80,buttonheight-10,1,False)

				buttoninitmagic(buttonranksstatistics)
				menuranks.add(buttonranksstatistics)				

			    Local wxx#=windowranks.width();
			    Local wyy#=windowranks.height();
				SetImageFont(font30)
				Local hh$=strranks
				windowrankstitle=New _guitext
				windowrankstitle.init(windowranks,0.5,60/(wy+40),1,hh,1,0.95,0.8,font30)
				windowrankstitle.position.setdynamic(True)
				
				windowrankstypelist=New _guilistbox
				windowrankstypelist.borderwidth=8
				windowrankstypelist.init(windowranks,60,100,200,wy-180,1,1,1,38)
				windowrankstypelist.selectionrect=True
				windowrankstypelist.moverrect=True
				windowrankstypelist.setvectordynamic(wx,wy+40)
				listboxinitmagic(windowrankstypelist)
				
				
				'-------------------------------------- create sort box
				windowrankssortbox=New _guicombobox
				windowrankssortbox.init(windowranks,60,100+(wy-180)+5,200,40,60,-1,1,1,1  ,260,(100+(wy-180)+5)-150,210,200, 30, 0, font18)
				windowrankssortbox.setvectordynamic(wx,wy+40)
				windowrankssortbox.listbox.selectionrect=True
				windowrankssortbox.listbox.moverrect=True
				windowrankssortbox.listbox.setpositiondynamic(wx,wy+40)
				comboboxinitmagic(windowrankssortbox)
				Local gt:_guitext
				Local sey#=0
				Local hse$
				Local txo#=210/2-35
				Local tx#
				hse=strgametypesortalphabetical;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowrankssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,0);sey:+22
				
				hse=strgametypesortpublicity;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowrankssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,1);sey:+22;gt.createhelp(strgametypesortpublicitydesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesortchance;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowrankssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,2);sey:+22;gt.createhelp(strgametypesortchancedesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesortskill;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowrankssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,3);sey:+22;gt.createhelp(strgametypesortskilldesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesorttime;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowrankssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,4);sey:+22;gt.createhelp(strgametypesorttimedesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesorttype;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=windowrankssortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,5);sey:+22
				
				windowrankssortbox.listbox.superinactivity(True)
				windowrankssortbox.listbox.superinvisibility(True)
				windowrankssortbox.listbox.fadeopacity(0)
				windowrankssortbox.createhelp(strsortbox,font18,0.5,0,0)
				windowrankssortbox.button.createhelp(strsortboxbutton,font18,0.5,0,0)
				guihelpinitmagic(windowrankssortbox)
				guihelpinitmagic(windowrankssortbox.button)					
				
				windowrankssortbox.clearbackground()
				windowrankssortbox.shadow=False
				windowrankssortbox.superinvisible=True
				windowrankssortbox.text.set(strgametypesortalphabetical)	
				windowrankssortbox.text.textshadow=1
			
				updatelistboxgametypesorted(windowrankstypelist,current_preview)				
				
				windowranksranklist=New _guilistbox
				windowranksranklist.borderwidth=8
				windowranksranklist.init(windowranks,270,100,wx-270-70,wy-140,1,1,1,38)
				windowranksranklist.selectionrect=True
				windowranksranklist.moverrect=True
				windowranksranklist.setvectordynamic(wx,wy+40)
				listboxinitmagic(windowranksranklist)
				
				'updatelistboxuser(windowstatisticsuserlist,True)
				'SetImageFont(font24)
				'-------------------------------------------------------
				updatemenuranks()
				menuranks.fadeoff()
				menuranks.visibility(False)
				menuranks.activity(False)
				menuranks.fadetarget(menuopacity2)
				menuranks.fadeopacity(0)
				EndMethod
	Method windowranksselectedtype:Int()
				Local typ$=windowrankstypelist.selectiontext()
				Local cur=-1
				For Local i=0 To gametypecount-1
				 If typ=gamenames[i] 
				  cur=i
				 EndIf
				Next		
				Return(cur)
				EndMethod				
	Method updatemenuranks()
				Local typ=windowranksselectedtype()
				windowranksranklist.clearchild()
				If typ<>-1
				 ' alle user ermitteln
				 Local userlist:TList=CreateList()
				 For Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist
				  Local eu:_user=usermanagement.user(eit.user)
				  If eu'user does still exist
				   Local isschon=False
				   For Local eii:_user=EachIn userlist
				    If eu=eii isschon=True
				   Next
				   If isschon=False
				    userlist.addlast(eu)
				   EndIf
				  EndIf
				 Next
				 If userlist.count()>0
				  ' score dieser user ermitteln
				  For Local uit:_user=EachIn userlist
				   uit.score=0
				
				   Local ce#=0
				   For Local eit:_gamestatsentry=EachIn gamestats[typ].entrylist  
				    If eit.user=uit.name
				     uit.score:+eit.score()
				     ce:+1
				    EndIf
				   Next
				   
				   If ce>0 uit.score:/ce
				  Next
				  userlist.sort()
				  Local yit#=20
				  Local wx#=128
				  Local wy#=128
				  Local platz=1
				  For Local uit:_user=EachIn userlist
				   Local gim:_guiimage=windowranksranklist.insertimage(usermanagement.image[uit.index],windowranksranklist.width()/2-wx/2,yit,wx,wy,1,1,1,-1)
				   gim.selectable=False			
				   Local gimf:_guiimage=windowranksranklist.insertimage(iframe,windowranksranklist.width()/2-wx/2-5,yit-5,wx+10,wy+10,1,1,1,-1)
				   gimf.selectable=False			
				   SetImageFont(font30)
				   Local gt:_guitext=windowranksranklist.inserttext(uit.name,windowranksranklist.width()/2-TextWidth(uit.name)/2,yit+wy+20,1,1,0.8,0.5,font30,-1)
				   gt.selectable=False
				   SetImageFont(font18)
				   Local h$
				   h=strrank+" : "+platz
				   If userlist.count()=1 h:+" ("+strunrivaled+")"''(außer Konkurrenz)"
				   gt=windowranksranklist.inserttext(h,windowranksranklist.width()/2-TextWidth(h)/2,yit+wy+20+35,1,1,0.8,0.5,font18,-1)
 				   gt.selectable=False

				   h=strscore+" : "+Int(uit.score)
				   gt=windowranksranklist.inserttext(h,windowranksranklist.width()/2-TextWidth(h)/2,yit+wy+20+55,1,1,0.8,0.5,font18,-1)
 				   gt.selectable=False

				   yit:+120+wy
				   platz:+1
				  Next
				 Else
				  SetImageFont(font30)
				  Local h$="("+strnoentries+")"
				  Local gt:_guitext=windowranksranklist.inserttext(h,windowranksranklist.width()/2-TextWidth(h)/2,windowranksranklist.height()/2-TextHeight(h)/2,1,1,0.8,0.5,font30,-1)
				  gt.selectable=False
				  gt.color.w=0.45
				 EndIf
				 Local hh$=strranklist+" "+strfor+" "+gamenames[typ]
				 SetImageFont(windowrankstitle.font)
				 windowrankstitle.set(hh)
				 windowrankstitle.position.setx(0.5-(TextWidth(hh)/windowranks.width())*0.5)
				 windowranks.animate(0)
				EndIf
				EndMethod				
'******************************************************************************************************************
'										O P T I O N S  M E N U 
'******************************************************************************************************************
	Method createmenuoptionsacoustics()
				Local tr#=1,tg#=0.8,tb#=0.6
				Local lx#=250
				Local ly#=100
				Local wx#=512
				Local wy#=723
				
				
				menuoptionsacoustics=menuman.createmenu()
				windowoptionsacoustics=New _guiwindow
				windowoptionsacoustics.init(guisystem,Int(-wx/2),Int(-wy/2),wx,wy,255,255,255)
				windowoptionsacoustics.position.add(0.5,0.5,0,True)
				Local pk:_guivectorkondition=windowoptionsacoustics.position.addkondition(640,800,480,600,280,3,-1,False);
				pk=windowoptionsacoustics.size.addkondition(640,800,480,600,wx,600,1,False);
				windowoptionsacoustics.setshadow(10,10)
				windowinitmagic(windowoptionsacoustics,iguiwindow)
				menuoptionsacoustics.add(windowoptionsacoustics)
				
				buttonoptionsacousticsmainmenu=New _guibutton
				buttonoptionsacousticsmainmenu.init(guisystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,11)
				buttonoptionsacousticsmainmenu.position.add(0.5,0.5,0,True)
				buttonoptionsacousticsmainmenu.position.addkondition(640,800,480,600, 20,10,-1,False)
				buttoninitmagic(buttonoptionsacousticsmainmenu)
				menuoptionsacoustics.add(buttonoptionsacousticsmainmenu)	
				
				createmenuoptionsbutton(windowoptionsacoustics,menuoptionsacoustics,0)
				SetImageFont(font30)
				Local hh$=strgeneral
				ttitleacoustics=New _guitext
				ttitleacoustics.init(windowoptionsacoustics,(wx/2)-TextWidth(hh)/2,50,1.25,hh,0.97,0.84,0.68,font30)
				
				Local y#=150
				Local off#=35
				'tva=New _guitext
				'tva.init(windowoptionsacoustics,50,y,2,ambient,tr,tg,tb,font18)
				'tbva=New _guitrackbar
				'tbva.init(windowoptionsacoustics,250,y,150,25,1,1,1,volumeambience,0,1,12);y:+off
				'trackbarinitmagic(tbva)
				SetImageFont(font18)
				Local htx$
				Local txo#=256-5
				Local tx#
				Local ex#=256+5
				
				htx=strambience
				tx=TextWidth(htx)
				tva=New _guitext
				tva.init(windowoptionsacoustics,txo-tx-30,y,1,htx,tr,tg,tb,font18)
				tbva=New _guitrackbar
				tbva.init(windowoptionsacoustics,ex-30,y,150,25,1,1,1,volumeambience,0,1,13);y:+off
				tbva.displaymultiplier=100
				tbva.displayaddition=" %"
				tbva.displayrounding=True				
				trackbarinitmagic(tbva)

				htx=strsounds
				tx=TextWidth(htx)
				tvs=New _guitext
				tvs.init(windowoptionsacoustics,txo-tx-30,y,1,htx,tr,tg,tb,font18)
				tbvs=New _guitrackbar
				tbvs.init(windowoptionsacoustics,ex-30,y,150,25,1,1,1,volumesound,0,1,13);y:+off
				tbvs.displaymultiplier=100
				tbvs.displayaddition=" %"
				tbvs.displayrounding=True				
				trackbarinitmagic(tbvs)

				
				htx=strmusic
				tx=TextWidth(htx)
				tvm=New _guitext
				tvm.init(windowoptionsacoustics,txo-tx-30,y,1,strmusic,tr,tg,tb,font18)
				tbvm=New _guitrackbar
				tbvm.init(windowoptionsacoustics,ex-30,y,150,25,1,1,1,volumemusic,0,1,14);y:+off
				tbvm.displaymultiplier=100
				tbvm.displayaddition=" %"
				tbvm.displayrounding=True				
				trackbarinitmagic(tbvm)
				Rem
				tfs=New _guitext
				tfs.init(windowoptionsacoustics,50,y,2,strmusicsequence,tr,tg,tb,font18)
				cbms=New _guicheckbox
				cbms.init(windowoptionsacoustics,250,y,19,19,16);y:+off
				checkboxinitmagic(cbms)
				cbms.checked=musicsequence
				EndRem
				
				y:+off+20

				htx=strfullscreen
				tx=TextWidth(htx)
				tfs=New _guitext
				tfs.init(windowoptionsacoustics,txo-tx,y,1,htx,tr,tg,tb,font18)
				cbfs=New _guicheckbox
				cbfs.init(windowoptionsacoustics,ex,y+checkboxoffy,checkboxwidth,checkboxheight,16);y:+off
				checkboxinitmagic(cbfs)
				cbfs.checked=fullscreen
				updatefullscreenhelp()
				
				
				
				htx=strsystemaccellerate
				tx=TextWidth(htx)
				tsp=New _guitext
				tsp.init(windowoptionsacoustics,txo-tx,y,1,strsystemaccellerate,tr,tg,tb,font18)
				tsp.createhelp(strsystemaccelleratehelp,font18,0.1,0,0)
				guihelpinitmagic(tsp)
				cbsp=New _guicheckbox
				cbsp.init(windowoptionsacoustics,ex,y+checkboxoffy,checkboxwidth,checkboxheight,16);y:+off
				cbsp.createhelp(strsystemaccelleratehelp,font18,1,0,0)
				guihelpinitmagic(cbsp)
				checkboxinitmagic(cbsp)
				cbsp.checked=systemaccellerate


				htx=strfastvideomode
				tx=TextWidth(htx)
				tfv=New _guitext
				tfv.init(windowoptionsacoustics,txo-tx,y,1,strfastvideomode,tr,tg,tb,font18)
				tfv.createhelp(strfastvideomodehelp,font18,0.1,0,0)
				guihelpinitmagic(tfv)

				cbfv=New _guicheckbox
				cbfv.init(windowoptionsacoustics,ex,y+checkboxoffy,checkboxwidth,checkboxheight,16);y:+off
				checkboxinitmagic(cbfv)
				cbfv.checked=fastvideomode

				htx=strvideosynchronisation
				tx=TextWidth(htx)
				tsy=New _guitext
				tsy.init(windowoptionsacoustics,txo-tx,y,1,strvideosynchronisation,tr,tg,tb,font18)
				tsy.createhelp(strvideosynchronisationhelp,font18,0.1,0,0)
				guihelpinitmagic(tsy)
				cbsy=New _guicheckbox
				cbsy.init(windowoptionsacoustics,ex,y+checkboxoffy,checkboxwidth,checkboxheight,16);y:+off
				checkboxinitmagic(cbsy)
				cbsy.checked=videosynchronisation


				Rem
				tmb=New _guitext
				tmb.init(windowoptionsacoustics,50,y,2,strmybenchmark,tr,tg,tb,font18)
				cbmb=New _guicheckbox
				cbmb.init(windowoptionsacoustics,250,y,19,19,16);y:+off
				checkboxinitmagic(cbmb)
				cbmb.checked=mybenchmark
				EndRem
				
				menuoptionsacoustics.visibility(False)
				menuoptionsacoustics.activity(False)
				menuoptionsacoustics.fadetarget(menuopacity2)
				menuoptionsacoustics.fadeopacity(0)
				EndMethod			
	Method updatefullscreenhelp()				
				If fastvideomode=False
				 Local hx$=desktopwidth
				 Local hy$=desktopheight				
				 tfs.createhelp(strfullscreenhelp+hx+" x "+hy+".",font18,0.1,0,0)
				 cbfs.createhelp(strfullscreenhelp+hx+" x "+hy+".",font18,1,0,0)
				Else
				 tfs.createhelp(strfullscreenfasthelp,font18,0.1,0,0)
				 cbfs.createhelp(strfullscreenfasthelp,font18,1,0,0)
				EndIf
				guihelpinitmagic(tfs)
				guihelpinitmagic(cbfs)
				updatemenumain()
				EndMethod
	Method createmenuoptionsgraphics()
				Local tr#=1,tg#=0.8,tb#=0.6

				Local lx#=250
				Local ly#=100
				Local wx#=512
				Local wy#=723
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=650
				Local off#=15			
				Local cboy#=-6
				Local cbw#=checkboxwidth-4
				Local cbh#=checkboxheight-4	
				Local tbw#=150
				gra.enabletext2d()
				menuoptionsgraphics=menuman.createmenu()
				windowoptionsgraphics=New _guiwindow
				windowoptionsgraphics.init(guisystem,Int(-wx/2),Int(-wy/2),wx,wy,255,255,255)
				windowoptionsgraphics.position.add(0.5,0.5,0,True)
				Local pk:_guivectorkondition=windowoptionsgraphics.position.addkondition(640,800,480,600,280,3,-1,False);
				pk=windowoptionsgraphics.size.addkondition(640,800,480,600,wx,600,1,False);
				windowoptionsgraphics.setshadow(10,10)
				windowinitmagic(windowoptionsgraphics,iguiwindow)
				menuoptionsgraphics.add(windowoptionsgraphics)
				
				buttonoptionsgraphicsmainmenu=New _guibutton
				buttonoptionsgraphicsmainmenu.init(guisystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,11)
				buttonoptionsgraphicsmainmenu.position.add(0.5,0.5,0,True)
				buttonoptionsgraphicsmainmenu.position.addkondition(640,800,480,600, 20,10,-1,False)
				buttoninitmagic(buttonoptionsgraphicsmainmenu)
				menuoptionsgraphics.add(buttonoptionsgraphicsmainmenu)	

				createmenuoptionsbutton(windowoptionsgraphics,menuoptionsgraphics,1)
						
				SetImageFont(font30)
				Local hh$=strgraphics
				ttitlegraphics=New _guitext
				ttitlegraphics.init(windowoptionsgraphics,(wx/2)-TextWidth(hh)/2,50,1.25,hh,0.97,0.84,0.68,font30)
				off=27
				y=100
				SetImageFont(font18)
				Local htx$
				Local tx#			
				Local txo#=wx/2-5
				Local ex#=wx/2+5	
				htx=strtimeduringgame
				tx=TextWidth(htx)				
				tgrtd=New _guitext
				tgrtd.init(windowoptionsgraphics,txo-tx,y,1,htx,tr,tg,tb,font18)
				cbgrtd=New _guicheckbox
				cbgrtd.init(windowoptionsgraphics,ex,y+cboy,cbw,cbh,23);y:+off
				checkboxinitmagic(cbgrtd)
				cbgrtd.checked=timeduringgame
				
				Rem
				tgrlp=New _guitext
				tgrlp.init(windowoptionsgraphics,50,y,2,"Panel links",tr,tg,tb,font18)
				Local hhs$="Schaltet die Sichtbarkeit des linken Panels im Spiel. Die Knöpfe bleiben sichtbar."
				tgrlp.createhelp(hhs,font14,0.2,0,0)
				cbgrlp=New _guicheckbox
				cbgrlp.init(windowoptionsgraphics,250,y,19,19,24);y:+off
				cbgrlp.createhelp(hhs,font14,1,0,0)
				checkboxinitmagic(cbgrlp)
				cbgrlp.checked=buttonpanel
				EndRem
				
				SetImageFont(font18)

				
				htx=strgamebuttons
				tx=TextWidth(htx)
				tgrgp=New _guitext
				tgrgp.init(windowoptionsgraphics,txo-tx,y,1,strgamebuttons,tr,tg,tb,font18)
				tgrgp.createhelp(strgamebuttonshelp,font18,0.2,0,0)
				guihelpinitmagic(tgrgp)
				cbgrgp=New _guicheckbox
				cbgrgp.init(windowoptionsgraphics,ex,y+cboy,cbw,cbh,24);y:+off
				cbgrgp.createhelp(strgamebuttonshelp,font18,1,0,0)
				guihelpinitmagic(cbgrgp)
				checkboxinitmagic(cbgrgp)
				cbgrgp.checked=gameplaybuttons
				SetImageFont(font18)

				htx=strmenubuttons
				tx=TextWidth(htx)
				tgrmb=New _guitext
				tgrmb.init(windowoptionsgraphics,txo-tx,y,1,strmenubuttons,tr,tg,tb,font18)
				tgrmb.createhelp(strmenubuttonshelp,font18,0.2,0,0)
				guihelpinitmagic(tgrmb)
				cbgrmb=New _guicheckbox
				cbgrmb.init(windowoptionsgraphics,ex,y+cboy,cbw,cbh,25);y:+off
				cbgrmb.createhelp(strmenubuttonshelp,font18,1,0,0)
				guihelpinitmagic(cbgrmb)
				checkboxinitmagic(cbgrmb)
				cbgrmb.checked=menubuttons
				Rem
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
				EndRem
				SetImageFont(font18)
				htx=strsparkingmouse
				tx=TextWidth(htx)
				tgrsm=New _guitext
				tgrsm.init(windowoptionsgraphics,txo-tx,y,1,strsparkingmouse,tr,tg,tb,font18)
				cbgrsm=New _guicheckbox
				cbgrsm.init(windowoptionsgraphics,ex,y+cboy,cbw,cbh,27);y:+off
				checkboxinitmagic(cbgrsm)
				cbgrsm.checked=sparkingmouse

				SetImageFont(font18)
				htx=strmouseovercard
				tx=TextWidth(htx)
				tgrmo=New _guitext
				tgrmo.init(windowoptionsgraphics,txo-tx,y,1,strmouseovercard,tr,tg,tb,font18)
				tgrmo.createhelp(strmouseovercardhelp,font18,0.2,0,0)
				guihelpinitmagic(tgrmo)
				cbgrmo=New _guicheckbox
				cbgrmo.init(windowoptionsgraphics,ex,y+cboy,cbw,cbh,28);y:+off
				cbgrmo.createhelp(strmouseovercardhelp,font18,1,0,0)
				guihelpinitmagic(cbgrmo)
				checkboxinitmagic(cbgrmo)
				cbgrmo.checked=mouseovercard

				SetImageFont(font18)
				htx=strmouseoverpile
				tx=TextWidth(htx)
				tgrmp=New _guitext
				tgrmp.init(windowoptionsgraphics,txo-tx,y,1,strmouseoverpile,tr,tg,tb,font18)
				cbgrmp=New _guicheckbox
				cbgrmp.init(windowoptionsgraphics,ex,y+cboy,cbw,cbh,28);y:+off
				checkboxinitmagic(cbgrmp)
				cbgrmp.checked=mouseoverpile

				SetImageFont(font18)
				htx=strgreenboard
				tx=TextWidth(htx)
				tgrgr=New _guitext
				tgrgr.init(windowoptionsgraphics,txo-tx,y,1,htx,tr,tg,tb,font18)
				cbgrgr=New _guicheckbox
				cbgrgr.init(windowoptionsgraphics,ex,y+cboy,cbw,cbh,28);y:+off
				checkboxinitmagic(cbgrgr)
				cbgrgr.checked=greenboard
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
				SetImageFont(font18)
				htx=strnaturalpiles
				tx=TextWidth(htx)
				tgrnp=New _guitext
				tgrnp.init(windowoptionsgraphics,txo-tx,y,1,htx,tr,tg,tb,font18)
				tgrnp.createhelp(strnaturalpileshelp,font18,0.2,0,0)
				guihelpinitmagic(tgrnp)
				tbgrnp=New _guitrackbar
				tbgrnp.init(windowoptionsgraphics,ex,y,tbw,25,1,1,1,0,0,1,29);y:+off
				tbgrnp.createhelp(strnaturalpileshelp,font18,1,0,0)
				guihelpinitmagic(tbgrnp)
				trackbarinitmagic(tbgrnp)
				tbgrnp.set(naturalpiles)
				y:+10+20
				'Local gl:_guiline=windowoptionsgraphics.insertline(60,y,wx-60,y,0.4,0.25,0.05)
				'gl.color.w=0.3
				y:+15+20+50+12+5

				Rem
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
				EndRem
				SetImageFont(font18)
				'lx=160
				'txo=lx-10
				txo:-30
				ex:-30
				tbw:-20
				htx=strcardlighting
				tx=TextWidth(htx)
				tgrci=New _guitext
				tgrci.init(windowoptionsgraphics,txo-tx,y,1,htx,tr,tg,tb,font18)
				tgrci.position.addkondition(640,800,480,600, txo-tx,y-30,-1,False)
				tbgrci=New _guitrackbar		
				Local lighty#=y		
				tbgrci.init(windowoptionsgraphics,ex,y,tbw,25,1,1,1,0,0,1,12)
				tbgrci.position.addkondition(640,800,480,600,ex,y-30,-1,False);y:+off
				trackbarinitmagic(tbgrci)
				tbgrci.set(cardlighting)

				Local oy#=y


				SetImageFont(font18)
				htx=strcandle
				tx=TextWidth(htx)
				tfarbekerzer=New _guitext
				tfarbekerzer.init(windowoptionsgraphics,txo-tx,y,1,strcandle,tr,tg,tb,font18)
				tfarbekerzer.position.addkondition(640,800,480,600, txo-tx,y-30,-1,False)
				Local gii:_guiimage=windowoptionsgraphics.insertimage(idonutred,ex,y+2.5,20,20,1,1,1,-1)
				gii.position.addkondition(640,800,480,600,   ex-tbw-10,y-5,-1,False)
				sfarbekerzer=New _guitrackbar				
				sfarbekerzer.init(windowoptionsgraphics,ex+20,y,tbw-20,25,1,1,1,0,0.0,1,12);y:+off
				sfarbekerzer.position.addkondition(640,800,480,600,   ex+20 - (tbw+10),y-35,-1,False)
				trackbarinitmagic(sfarbekerzer)
				sfarbekerzer.set(farbekerze.x)

				tfarbekerzeg=New _guitext
				tfarbekerzeg.init(windowoptionsgraphics,50,y,1,"",tr,tg,tb,font18)
				gii=windowoptionsgraphics.insertimage(idonutgreen,ex,y+2.5,20,20,1,1,1,-1)
				gii.position.addkondition(640,800,480,600,   ex-tbw-10,y-5,-1,False)
				sfarbekerzeg=New _guitrackbar				
				sfarbekerzeg.init(windowoptionsgraphics,ex+20,y,tbw-20,25,1,1,1,0,0.0,1,12);y:+off
				sfarbekerzeg.position.addkondition(640,800,480,600,   ex+20 - (tbw+10),y-35,-1,False)
				trackbarinitmagic(sfarbekerzeg)
				sfarbekerzeg.set(farbekerze.y)

				tfarbekerzeb=New _guitext
				tfarbekerzeb.init(windowoptionsgraphics,50,y,1,"",tr,tg,tb,font18)
				gii=windowoptionsgraphics.insertimage(idonutblue,ex,y+2.5,20,20,1,1,1,-1)
				gii.position.addkondition(640,800,480,600,   ex-tbw-10,y-5,-1,False)
				sfarbekerzeb=New _guitrackbar				
				sfarbekerzeb.init(windowoptionsgraphics,ex+20,y,tbw-20,25,1,1,1,0,0.0,1,12);y:+off
				sfarbekerzeb.position.addkondition(640,800,480,600,   ex+20 - (tbw+10),y-35,-1,False)
				trackbarinitmagic(sfarbekerzeb)
				sfarbekerzeb.set(farbekerze.z)

				Local ky#=oy

				SetImageFont(font18)
				htx=strambiencelight
				tx=TextWidth(htx)
				tfarbeambienzr=New _guitext
				tfarbeambienzr.init(windowoptionsgraphics,txo-tx,y,1,strambiencelight,tr,tg,tb,font18)
				tfarbeambienzr.position.addkondition(640,800,480,600, 40+ex+20,ky-30,-1,False)
				gii=windowoptionsgraphics.insertimage(idonutred,ex,y+2.5,20,20,1,1,1,-1)
				gii.position.addkondition(640,800,480,600,   ex+40,ky-5,-1,False)
				sfarbeambienzr=New _guitrackbar				
				sfarbeambienzr.init(windowoptionsgraphics,ex+20,y,tbw-20,25,1,1,1,0,0.0,1,12);y:+off
				sfarbeambienzr.position.addkondition(640,800,480,600,   ex+60,ky-5,-1,False);ky:+off
				trackbarinitmagic(sfarbeambienzr)
				sfarbeambienzr.set(world.lightambient.x)

				tfarbeambienzg=New _guitext
				tfarbeambienzg.init(windowoptionsgraphics,50,y,1,"",tr,tg,tb,font18)
				gii=windowoptionsgraphics.insertimage(idonutgreen,ex,y+2.5,20,20,1,1,1,-1)
				gii.position.addkondition(640,800,480,600,   ex+40,ky-5,-1,False)
				sfarbeambienzg=New _guitrackbar				
				sfarbeambienzg.init(windowoptionsgraphics,ex+20,y,tbw-20,25,1,1,1,0,0.0,1,12);y:+off
				sfarbeambienzg.position.addkondition(640,800,480,600,   ex+60,ky-5,-1,False);ky:+off
				trackbarinitmagic(sfarbeambienzg)
				sfarbeambienzg.set(world.lightambient.y)

				tfarbeambienzb=New _guitext
				tfarbeambienzb.init(windowoptionsgraphics,50,y,1,"",tr,tg,tb,font18)
				gii=windowoptionsgraphics.insertimage(idonutblue,ex,y+2.5,20,20,1,1,1,-1)
				gii.position.addkondition(640,800,480,600,   ex+40,ky-5,-1,False)
				sfarbeambienzb=New _guitrackbar				
				sfarbeambienzb.init(windowoptionsgraphics,ex+20,y,tbw-20,25,1,1,1,0,0.0,1,12);y:+off
				sfarbeambienzb.position.addkondition(640,800,480,600,   ex+60,ky-5,-1,False);ky:+off;
				trackbarinitmagic(sfarbeambienzb)
				sfarbeambienzb.set(world.lightambient.z)

				y=320
				lx=265
				Local bhl#=50
				Local bwl#=140
				buttonoptionsgraphicslightbright=New _guibutton
				buttonoptionsgraphicslightbright.init(windowoptionsgraphics,lx-5-bwl,y,bwl,bhl,strlightbright,-1)
				buttonoptionsgraphicslightbright.position.addkondition(640,800,480,600,  lx-5-bwl,y, -1,False)
				buttonoptionsgraphicslightbright.size.addkondition(640,800,480,600,  bwl,bhl-10,1,False)
				buttoninitmagic(buttonoptionsgraphicslightbright)

				buttonoptionsgraphicslightmedium=New _guibutton
				buttonoptionsgraphicslightmedium.init(windowoptionsgraphics,lx-5-bwl,y+bhl+5,bwl,bhl,strlightmedium,-1)
				buttonoptionsgraphicslightmedium.position.addkondition(640,800,480,600,  lx-5-bwl,y+bhl-5,-1,False)
				buttonoptionsgraphicslightmedium.size.addkondition(640,800,480,600,  bwl,bhl-10,1,False)
				buttoninitmagic(buttonoptionsgraphicslightmedium)

				buttonoptionsgraphicslightnatural=New _guibutton
				buttonoptionsgraphicslightnatural.init(windowoptionsgraphics,lx,y,bwl,bhl,strlightnatural,-1)
				buttonoptionsgraphicslightnatural.position.addkondition(640,800,480,600,  lx,y,-1,False)
				buttonoptionsgraphicslightnatural.size.addkondition(640,800,480,600,  bwl,bhl-10,1,False)
				buttoninitmagic(buttonoptionsgraphicslightnatural)

				buttonoptionsgraphicslightnight=New _guibutton
				buttonoptionsgraphicslightnight.init(windowoptionsgraphics,lx,y+bhl+5,bwl,bhl,strlightnight,-1)
				buttonoptionsgraphicslightnight.position.addkondition(640,800,480,600,  lx,y+bhl-5, -1,False)
				buttonoptionsgraphicslightnight.size.addkondition(640,800,480,600,  bwl,bhl-10,1,False)
				buttoninitmagic(buttonoptionsgraphicslightnight)
				
				menuoptionsgraphics.visibility(False)
				menuoptionsgraphics.activity(False)
				menuoptionsgraphics.fadetarget(menuopacity2)
				menuoptionsgraphics.fadeopacity(0)
				EndMethod
	Method createmenuoptionsgame()
				Local tr#=1,tg#=0.8,tb#=0.6

				Local lx#=250
				Local ly#=100
				Local wx#=512
				Local wy#=723
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=650
				Local xg#
				Local off#=20				
	
				menuoptionsgame=menuman.createmenu()
				windowoptionsgame=New _guiwindow
				windowoptionsgame.init(guisystem,Int(-wx/2),Int(-wy/2),wx,wy,255,255,255)
				windowoptionsgame.position.add(0.5,0.5,0,True)
				Local pk:_guivectorkondition=windowoptionsgame.position.addkondition(640,800,480,600,280,3,-1,False);
				pk=windowoptionsgame.size.addkondition(640,800,480,600,wx,600,1,False);
				windowoptionsgame.setshadow(10,10)
				windowinitmagic(windowoptionsgame,iguiwindow)
				menuoptionsgame.add(windowoptionsgame)
				
				buttonoptionsgamemainmenu=New _guibutton
				buttonoptionsgamemainmenu.init(guisystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,11)
				buttonoptionsgamemainmenu.position.add(0.5,0.5,0,True)
				buttonoptionsgamemainmenu.position.addkondition(640,800,480,600, 20,10,-1,False)
				buttoninitmagic(buttonoptionsgamemainmenu)
				'buttonoptionsgamemainmenu.clearbackground()
				'buttonoptionsgamemainmenu.background[0].addlast(ibuttonhauptoff)
				'buttonoptionsgamemainmenu.background[1].addlast(ibuttonhaupton)
				'buttonoptionsgamemainmenu.background[2].addlast(ibuttonhaupton)
				menuoptionsgame.add(buttonoptionsgamemainmenu)	
				
				createmenuoptionsbutton(windowoptionsgame,menuoptionsgame,2)
				SetImageFont(font30)
				Local hh$=strgame
				ttitlegame=New _guitext
				ttitlegame.init(windowoptionsgame,(wx/2)-TextWidth(hh)/2,50,1.25,hh,0.97,0.84,0.68,font30)
				y=150
				off=35
				x=50
				
				
				
				SetImageFont(font18)
				Local htx$
				Local tx#
				'Local ex#=250-15
				
				Local txo#=wx/2-5+35
				Local ex#=wx/2+5	+35
				
				htx=strtouchpad
				SetImageFont(font18)
				tx=TextWidth(htx)
				tgpc=New _guitext				
				tgpc.init(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18)
				tgpc.createhelp(strtouchpadhelp,font18,0.2,0,0)
				guihelpinitmagic(tgpc)
				cbgpc=New _guicheckbox
				cbgpc.init(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight,19);y:+off
				cbgpc.createhelp(strtouchpadhelp,font18,1,0,0)
				guihelpinitmagic(cbgpc)
				cbgpc.checked=pointandclick
				checkboxinitmagic(cbgpc)
				
				htx=strtouchpadalternative
				SetImageFont(font18)
				tx=TextWidth(htx)
				tgpa=New _guitext				
				tgpa.init(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18)
				tgpa.createhelp(strtouchpadalternativehelp,font18,0.2,0,0)
				guihelpinitmagic(tgpa)
				cbgpa=New _guicheckbox
				cbgpa.init(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight,19);y:+off
				cbgpa.createhelp(strtouchpadalternativehelp,font18,1,0,0)
				guihelpinitmagic(cbgpa)
				cbgpa.checked=pointandclickalternative
				checkboxinitmagic(cbgpa)
				
				htx=strexitconf
				SetImageFont(font18)
				tx=TextWidth(htx)
				tgcq=New _guitext				
				tgcq.init(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18)
				tgcq.createhelp(strexitconfhelp,font18,1,0,0)
				guihelpinitmagic(tgcq)
				cbgcq=New _guicheckbox
				cbgcq.init(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight,21);y:+off
				cbgcq.createhelp(strexitconfhelp,font18,1,0,0)
				guihelpinitmagic(cbgcq)
				checkboxinitmagic(cbgcq)
				cbgcq.checked=confirmonquit
				
				'tgdi=New _guitext				
				'tgdi.init(windowoptionsgame,x,y,2,"Schwierigkeit",tr,tg,tb,font18);
				'tbgdi=New _guitrackbar
				'tbgdi.init(windowoptionsgame,x-75,y,150,25,1,1,1,difficulty,0,1,22);
				'trackbarinitmagic(tbgdi)

				
				y:+off+off
				hh=strgameautomatics
				SetImageFont(font24)
				tgaa=New _guitext				
				tgaa.init(windowoptionsgame,(wx/2)-TextWidth(hh)/2,y+5,1,hh,0.97,0.84,0.68,font24)
				tgaa.position.addkondition(640,800,480,600,  (wx/2)-TextWidth(hh)/2,y+5-40,-1,False);y:+off+10
				'y=110
				'x=320
				y:+off
				'y:+off+10
				
				'tgas=New _guitext				
				'tgas.init(windowoptionsgame,x,y,2,"Spielstart",tr,tg,tb,font18);y:+off
				'cbgas=New _guicheckbox
				'cbgas.init(windowoptionsgame,x,y,19,19,20);y:+off
				'checkboxinitmagic(cbgas)
				'cbgas.checked=autostart
				
				htx=strautomaticturn
				SetImageFont(font18)
				tx=TextWidth(htx)
				tgat=New _guitext				
				tgat.init(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18);
				tgat.position.addkondition(640,800,480,600,  txo-tx,y-60,-1,False)
				tgat.createhelp(strautomaticturnhelp,font18,0.2,0,0)
				guihelpinitmagic(tgat)
				cbgat=New _guicheckbox
				cbgat.init(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight,18)
				cbgat.position.addkondition(640,800,480,600, ex,y+checkboxoffy-60,-1,False) ;y:+off
				cbgat.createhelp(strautomaticturnhelp,font18,1,0,0)
				guihelpinitmagic(cbgat)
				checkboxinitmagic(cbgat)
				cbgat.checked=autoturncard
				
				htx=strautomaticdiscard
				SetImageFont(font18)
				tx=TextWidth(htx)
				tgad=New _guitext				
				tgad.init(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18)
				tgad.position.addkondition(640,800,480,600,  txo-tx,y-60,-1,False)
				tgad.createhelp(strautomaticdiscardhelp,font18,0.2,0,0)
				guihelpinitmagic(tgad)
				cbgad=New _guicheckbox
				cbgad.init(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight,17)
				cbgad.position.addkondition(640,800,480,600,  ex,y+checkboxoffy-60,-1,False);y:+off
				cbgad.createhelp(strautomaticdiscardhelp,font18,1,0,0)
				guihelpinitmagic(cbgad)
				checkboxinitmagic(cbgad)
				cbgad.checked=autodiscard
				
				'tgaf=New _guitext				
				'tgaf.init(windowoptionsgame,x,y,2,"Foundation belegen",tr,tg,tb,font18);y:+off
				'cbgaf=New _guicheckbox
				'cbgaf.init(windowoptionsgame,x,y,19,19,17);y:+off
				'checkboxinitmagic(cbgaf)
				'cbgaf.checked=autofoundation
				
				
				htx=strautomaticempty
				SetImageFont(font18)
				tx=TextWidth(htx)
				tgae=New _guitext				
				tgae.init(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18)
				tgae.position.addkondition(640,800,480,600,  txo-tx,y-60,-1,False)
				tgae.createhelp(strautomaticemptyhelp,font18,0.2,0,0)
				guihelpinitmagic(tgae)
				cbgae=New _guicheckbox
				cbgae.init(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight,17)
				cbgae.position.addkondition(640,800,480,600,  ex,y+checkboxoffy-60,-1,False);y:+off
				cbgae.createhelp(strautomaticemptyhelp,font18,1,0,0)
				guihelpinitmagic(cbgae)
				checkboxinitmagic(cbgae)
				cbgae.checked=autoempty
				
				htx=strautomaticrightclick
				SetImageFont(font18)
				tx=TextWidth(htx)
				tgcr=New _guitext				
				tgcr.init(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18)
				tgcr.position.addkondition(640,800,480,600,  txo-tx,y-60,-1,False)
				tgcr.createhelp(strautomaticrightclickhelp,font18,0.2,0,0)
				guihelpinitmagic(tgcr)
				cbgcr=New _guicheckbox
				cbgcr.init(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight,17)
				cbgcr.position.addkondition(640,800,480,600,  ex,y+checkboxoffy-60,-1,False);y:+off
				cbgcr.createhelp(strautomaticrightclickhelp,font18,1,0,0)
				guihelpinitmagic(cbgcr)
				checkboxinitmagic(cbgcr)
				cbgcr.checked=clickplayright
				
				htx=strautomaticdoubleclick
				SetImageFont(font18)
				tx=TextWidth(htx)
				tgcd=New _guitext				
				tgcd.init(windowoptionsgame,txo-tx,y,1,htx,tr,tg,tb,font18)
				tgcd.position.addkondition(640,800,480,600,  txo-tx,y-60,-1,False)
				tgcd.createhelp(strautomaticdoubleclickhelp,font18,0.2,0,0)
				guihelpinitmagic(tgcd)
				cbgcd=New _guicheckbox
				cbgcd.init(windowoptionsgame,ex,y+checkboxoffy,checkboxwidth,checkboxheight,17)
				cbgcd.position.addkondition(640,800,480,600,  ex,y+checkboxoffy-60,-1,False);y:+off
				cbgcd.createhelp(strautomaticdoubleclickhelp,font18,1,0,0)
				guihelpinitmagic(cbgcd)
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
				menuoptionsgame.fadeopacity(0)
				EndMethod
	Method createmenuoptionscard()
				Local tr#=1,tg#=0.8,tb#=0.6

				Local lx#=250
				Local ly#=100
				Local wx#=512
				Local wy#=723
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
				Local cboy#=checkboxoffy+10
				Local cbw#=checkboxwidth
				Local cbh#=checkboxheight				
				checkboxoptionscardbacklist=CreateList()
				checkboxoptionscardfrontlist=CreateList()
				buttonoptionscardchangefrontlist=CreateList()
				buttonoptionscardchangebacklist=CreateList()
				menuoptionscard=menuman.createmenu()
				windowoptionscard=New _guiwindow
				windowoptionscard.init(guisystem,Int(-wx/2),Int(-wy/2),wx,wy,255,255,255)
				windowoptionscard.position.add(0.5,0.5,0,True)
				Local pk:_guivectorkondition=windowoptionscard.position.addkondition(640,800,480,600,280,3,-1,False);
				pk=windowoptionscard.size.addkondition(640,800,480,600,wx,600,1,False);
				windowoptionscard.setshadow(10,10)
				windowinitmagic(windowoptionscard,iguiwindow)
				menuoptionscard.add(windowoptionscard)
				createmenuoptionsbutton(windowoptionscard,menuoptionscard,3)
				buttonoptionscardmainmenu=New _guibutton
				buttonoptionscardmainmenu.init(guisystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,11)
				buttonoptionscardmainmenu.position.add(0.5,0.5,0,True)
				buttonoptionscardmainmenu.position.addkondition(640,800,480,600, 20,10,-1,False)
				buttoninitmagic(buttonoptionscardmainmenu)
				menuoptionscard.add(buttonoptionscardmainmenu)				
				
				SetImageFont(font30)
				Local hh$=strcards
				ttitlecard=New _guitext
				ttitlecard.init(windowoptionscard,(wx/2)-TextWidth(hh)/2,40,1.25,hh,0.97,0.84,0.68,font30)
				SetImageFont(font24)
				hh=strcardsback
				ttitleback=New _guitext
				ttitleback.init(windowoptionscard,(wx/2)-TextWidth(hh)/2,70,1.25,hh,0.97,0.84,0.68,font24)
				SetImageFont(font24)
				hh=strcardsfront
				ttitledeck=New _guitext
				ttitledeck.init(windowoptionscard,(wx/2)-TextWidth(hh)/2,350,1.25,hh,0.97,0.84,0.68,font24)
				ttitledeck.position.addkondition(640,800,480,600,  (wx/2)-TextWidth(hh)/2,310,-1,False)
				
				gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1
				lbcardtexture=New _guilistbox
				lbcardtexture.borderwidth=8
				lbcardtexture.init(windowoptionscard,55,100,385,230,1,1,1,33)
				lbcardtexture.size.addkondition(640,800,480,600,  385,190,1,False)
				'lbcardtexture.moverrect=True
				'lbcardtexture.selectionrect=True
				listboxinitmagic(lbcardtexture)
				Local i=0

				For Local cit:_cardsetback=EachIn cardsetmanager.cardsetbacklist

				'For Local i=0 To cardtexturebackcount-1
				 gg.texture[0,0]=cit.texturepreview
				 gg.texture[1,0]=cit.texturepreview

				 mt=gg.Create()
				 mt.twosided(True)
				 mt.cull(False)		
				 mt.blend(True)
				 mt.blendadditive(False)
				 Local x=80
				 Local y=20+i*(ch+20)
				 Local gm:_guimesh=lbcardtexture.insertmesh(mt,x,y,cw,ch+20,0.8,0.8,0.8,100+i)
				 'Local yy#=i*(ch+20)+ch/2-50
				 'Local xx#
				 'If (i Mod 2)=0 xx=120 Else xx=205+((i Mod 2)*100)
				 cbt=New _guicheckbox
				 cbt.init(lbcardtexture,x+cw+20,y+cboy,cbw,cbh,100+i)
				 checkboxinitmagic(cbt)
				 checkboxoptionscardbacklist.addlast(cbt)
				 cbt.crosslinkmesh=gm
				 gm.crosslinkcheckbox=cbt
				 If cit.static=False
				  Local gb:_guibutton=New _guibutton
				  gb.init(lbcardtexture,x+cw+20,y+40,100,40,strchange,200+i)
				  buttoninitmagic(gb)
				  buttonoptionscardchangebacklist.addlast(gb)
				 EndIf				
				 i:+1
				Next				
				updatemenuoptionscardcheckboxback(checkboxoptionscardbacklist)
				lbdecktexture=New _guilistbox
				lbdecktexture.borderwidth=8
				lbdecktexture.init(windowoptionscard,55,380,385,230,1,1,1,34)
				lbdecktexture.position.addkondition(640,800,480,600,  55,340,-1,False)
				lbdecktexture.size.addkondition(640,800,480,600,  385,190,1,False)
				'lbdecktexture.updatescrollbar()
				'lbdecktexture.moverrect=True
				'lbdecktexture.selectionrect=True
				listboxinitmagic(lbdecktexture)
				cw=64
				ch=96				
				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				i=0
				For Local cit:_cardsetfront=EachIn cardsetmanager.cardsetfrontlist
				 Local gm:_guimesh=Null
				'For Local i=0 To cardtexturefrontcount-1
				 For Local j=0 To 3
				  Local w#=j*40+60
				  gg.position.set(80+Cos(w)*90,110-Sin(w)*90,0)
				  gg.texture[0,0]=cit.texturepreview[j]
				  gg.texture[1,0]=cit.texturepreview[j]

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
				  gm=lbdecktexture.insertmesh(mt,20,20+i*(ch+60),200,128,0.8,0.8,0.8,200+i)
				 Next
				 Local yy#=40+i*(ch+60)+ch/2-50
				 cbt=New _guicheckbox
				 
				 cbt.init(lbdecktexture,220,yy+cboy,cbw,cbh,200+i)
				 checkboxinitmagic(cbt)
				 checkboxoptionscardfrontlist.addlast(cbt)
				 cbt.crosslinkmesh=gm
				 gm.crosslinkcheckbox=cbt
				  
				 If cit.static=False
				  Local gb:_guibutton=New _guibutton
				  gb.init(lbdecktexture,220,yy+40,100,40,strchange,200+i)
				  buttoninitmagic(gb)
				  buttonoptionscardchangefrontlist.addlast(gb)
				 EndIf
				 i:+1
				Next
				updatemenuoptionscardcheckboxfront(checkboxoptionscardfrontlist)
				lbcardtexture.scrolltoselection()
				lbdecktexture.scrolltoselection()
				menuoptionscard.visibility(False)
				menuoptionscard.activity(False)
				menuoptionscard.fadetarget(menuopacity2)
				menuoptionscard.fadeopacity(0)
				EndMethod
	Method createmenuoptionscardfront()
				Local tr#=1,tg#=0.8,tb#=0.6

				Local lx#=250
				Local ly#=100
				Local wx#=512
				Local wy#=723
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
				Local cboy#=checkboxoffy+10
				Local cbw#=checkboxwidth
				Local cbh#=checkboxheight				
				'checkboxoptionscardbacklist=CreateList()
				'checkboxoptionscardfrontlist=CreateList()
				'buttonoptionscardchangefrontlist=CreateList()
				'buttonoptionscardchangebacklist=CreateList()
				menuoptionscardfront=menuman.createmenu()
				windowoptionscardfront=New _guiwindow
				windowoptionscardfront.init(guisystem,Int(-wx/2+80),Int(-wy/2),wx,wy,255,255,255)
				windowoptionscardfront.position.add(0.5,0.5,0,True)
				Local pk:_guivectorkondition=windowoptionscardfront.position.addkondition(640,800,480,600,280,3,-1,False);
				pk=windowoptionscardfront.size.addkondition(640,800,480,600,wx,600,1,False);
				windowoptionscardfront.setshadow(10,10)
				windowinitmagic(windowoptionscardfront,iguiwindow)
				menuoptionscardfront.add(windowoptionscardfront)
				'createmenuoptionsbutton(windowoptionscard,menuoptionscard,3)
				buttonoptionscardfrontnext=New _guibutton
				buttonoptionscardfrontnext.init(guisystem,-wx/2-buttonwidth-20+80,-wy/2,buttonwidth,buttonheight,strnext,11)
				buttonoptionscardfrontnext.position.add(0.5,0.5,0,True)
				buttonoptionscardfrontnext.position.addkondition(640,800,480,600, 20,10,-1,False)
				buttoninitmagic(buttonoptionscardfrontnext)
				menuoptionscardfront.add(buttonoptionscardfrontnext)				
				
				SetImageFont(font30)
				Local hh$=strcardsfirstchoice
				titleoptionscardfront=New _guitext
				titleoptionscardfront.init(windowoptionscardfront,(wx/2)-TextWidth(hh)/2,50,1,hh,0.97,0.84,0.68,font30)
				titleoptionscardfront.setvectordynamic(wx,wy)
			
				
				gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				gg.resolution[0]=1
				gg.resolution[1]=1

				
				
				listboxoptionscardfront=New _guilistbox
				listboxoptionscardfront.borderwidth=8
				listboxoptionscardfront.init(windowoptionscardfront,55,90,385,200+(350-80)+65,1,1,1,34)
				'lbdecktexture.moverrect=True
				'lbdecktexture.selectionrect=True
				listboxoptionscardfront.setvectordynamic(wx,wy)
				listboxinitmagic(listboxoptionscardfront)
				cw=64
				ch=96				
				gg.vx.set(cw,0,0)
				gg.vy.set(0,ch,0)
				Local i=0
				
				For Local cit:_cardsetfront=EachIn cardsetmanager.cardsetfrontlist
				 Local gm:_guimesh=Null
				'For Local i=0 To cardtexturefrontcount-1
				 For Local j=0 To 3
				  Local w#=j*40+60
				  gg.position.set(80+Cos(w)*90,110-Sin(w)*90,0)
				  gg.texture[0,0]=cit.texturepreview[j]
				  gg.texture[1,0]=cit.texturepreview[j]

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
				  gm=listboxoptionscardfront.insertmesh(mt,40,20+i*(ch+60),200,128,0.8,0.8,0.8,200+i)
				 Next
				 Local yy#=40+i*(ch+60)+ch/2-50
				 cbt=New _guicheckbox
				 
				 cbt.init(listboxoptionscardfront,240,yy+cboy,cbw,cbh,200+i)
				 checkboxinitmagic(cbt)
				 checkboxoptionscardfrontlist.addlast(cbt)
				 cbt.crosslinkmesh=gm
				 gm.crosslinkcheckbox=cbt
				  Rem
				 If cit.static=False
				  Local gb:_guibutton=New _guibutton
				  gb.init(listboxoptionscardfront,220,yy+40,100,40,strchange,200+i)
				  buttoninitmagic(gb)
				  buttonoptionscardchangefrontlist.addlast(gb)
				 EndIf
				  EndRem
				 i:+1
				Next
				updatemenuoptionscardcheckboxfront(checkboxoptionscardfrontlist)
				
				listboxoptionscardfront.scrolltoselection()
				
				
				menuoptionscardfront.visibility(False)
				menuoptionscardfront.activity(False)
				menuoptionscardfront.fadetarget(menuopacity2)
				menuoptionscardfront.fadeopacity(0)
				EndMethod				
	Method updatemenuoptionscardcheckboxback:_guicheckbox(l:TList)
				Local gr:_guicheckbox=Null
				For Local cit:_guicheckbox=EachIn l
				 If cardtexturebackindex=(cit.index-100) 
				  cit.checked=True
				  If cit.crosslinkmesh lbcardtexture.selection=cit.crosslinkmesh 
				  gr=cit
				 Else
				  cit.checked=False
				 EndIf
				Next
				'If game game.updatetexture()
				Return(gr)
				EndMethod		
	Method updatemenuoptionscardcheckboxfront:_guicheckbox(l:TList)
				Local gr:_guicheckbox=Null
				'Print cardtexturefrontindex
				For Local cit:_guicheckbox=EachIn l
				 If cardtexturefrontindex=(cit.index-200) 
				  cit.checked=True 
				  If cit.crosslinkmesh 
				   Local parentlist:_guilistbox=_guilistbox(cit.parent)
				   If parentlist
				    parentlist.selection=cit.crosslinkmesh 
				   EndIf
				  EndIf
				  gr=cit
				 Else 
				  cit.checked=False
				 EndIf
				Next
				'If game game.updatetexture()
				Return(gr)
				EndMethod		
	Method createmenuoptionscredits()
				Local wx#=512
				Local wy#=723
				menuoptionscredits=menuman.createmenu()
				windowoptionscredits=New _guiwindow
				windowoptionscredits.init(guisystem,Int(-wx/2),Int(-wy/2),wx,wy,255,255,255)
				windowoptionscredits.position.add(0.5,0.5,0,True)
				Local pk:_guivectorkondition=windowoptionscredits.position.addkondition(640,800,480,600,280,3,-1,False);
				pk=windowoptionscredits.size.addkondition(640,800,480,600,wx,600,1,False);
				windowoptionscredits.setshadow(10,10)
				windowinitmagic(windowoptionscredits,iguiwindow)
				menuoptionscredits.add(windowoptionscredits)
				createmenuoptionsbutton(windowoptionscredits,menuoptionscredits,4)
				buttonoptionscreditsmainmenu=New _guibutton
				buttonoptionscreditsmainmenu.init(guisystem,-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strmenu,11)
				buttonoptionscreditsmainmenu.position.add(0.5,0.5,0,True)
				buttonoptionscreditsmainmenu.position.addkondition(640,800,480,600, 20,10,-1,False)
				buttoninitmagic(buttonoptionscreditsmainmenu)

				Local gi:_guiimage=windowoptionscredits.insertimage(irosecredits,195+40,340+100,256,256,1,1,1,-1)
				gi.color.w=1

				Local yit#=90
				Local gt:_guitext
				Local hh$=strcreditsfantasysolitaire
				SetImageFont(font30)
				gt=New _guitext
				gt.init(windowoptionscredits,(wx/2)-TextWidth(hh)/2,yit,1.25,hh,0.97,0.84,0.68,font30)

				Local fwx#=0.5
				yit:+140
				
				SetImageFont(font18)
				hh=strcreditscreatedby
				gt=New _guitext
				gt.init(windowoptionscredits,wx*fwx-TextWidth(hh)/2,yit,1,hh,0.9,0.7,0.3,font18)
				yit:+25

			'	hh=strcreditsjoerghenseler
			'	gt=New _guitext
			'	gt.init(windowoptionscredits,wx*fwx-TextWidth(hh)/2,yit,1,hh,93,0.83,0.66,font24)
			'	yit:+30

				SetImageFont(font24)
				hh=strcreditsrobinhuehn
				gt=New _guitext
				gt.init(windowoptionscredits,wx*fwx-TextWidth(hh)/2,yit,1,hh,93,0.83,0.66,font24)
				yit:+30
				yit:+30

			'	SetImageFont(font18)
			'	hh=strcreditsmusicby
			'	gt=New _guitext
			'	gt.init(windowoptionscredits,wx*fwx-TextWidth(hh)/2,yit,1,hh,0.9,0.7,0.3,font18)
			'	yit:+25

			'	SetImageFont(font24)
			'	hh=strcreditsbeatenina
			'	gt=New _guitext
			'	gt.init(windowoptionscredits,wx*fwx-TextWidth(hh)/2,yit,1,hh,93,0.83,0.66,font24)
			'	yit:+30
			'	yit:+30

			'	hh=strcreditsremivalantin
			'	gt=New _guitext
			'	gt.init(windowoptionscredits,wx*fwx-TextWidth(hh)/2,yit,1,hh,93,0.83,0.66,font24)
			'	yit:+65

				SetImageFont(font18)
				hh=strcreditsspecialthanksto
				gt=New _guitext
				gt.init(windowoptionscredits,wx*fwx-TextWidth(hh)/2,yit,1,hh,0.9,0.7,0.3,font18)
				yit:+25

				SetImageFont(font24)
				hh=strcreditscarmendrescher
				gt=New _guitext
				gt.init(windowoptionscredits,wx*fwx-TextWidth(hh)/2,yit,1,hh,93,0.83,0.66,font24)
				yit:+30
Rem
				hh=strcreditstassilorau
				gt=New _guitext
				gt.init(windowoptionscredits,wx*fwx-TextWidth(hh)/2,yit,1,hh,93,0.83,0.66,font24)

EndRem

				SetImageFont(font14)

				hh=strcreditsversion
				gt=New _guitext
				gt.init(windowoptionscredits,(wx/2)-TextWidth(hh)/2,wy-80,1,hh,0.9,0.7,0.3,font14)
				gt.position.addkondition(640,800,480,600,  (wx/2)-TextWidth(hh)/2,600-80,-1,False)




				menuoptionscredits.add(buttonoptionscreditsmainmenu)				
				menuoptionscredits.visibility(False)
				menuoptionscredits.activity(False)
				menuoptionscredits.fadetarget(menuopacity2)
				menuoptionscredits.fadeopacity(0)
				
				
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
				bac.position.addkondition(640,800,480,600, 20,185+y,-1,False)
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
				bgr.position.addkondition(640,800,480,600, 20,185+y,-1,False)
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
				bga.position.addkondition(640,800,480,600, 20,185+y,-1,False)
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
				bcd.position.addkondition(640,800,480,600, 20,185+y,-1,False)
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
				bcr.position.addkondition(640,800,480,600, 20,185+y,-1,False)
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
				Local wx#=850
				Local wy#=760
				Local off#=20		
				Local kit:_guibutton=Null
				Local keyraus=False
				
				menugametype=menuman.createmenu()
				windowgametype=New _guiwindow
				windowgametype.init(guisystem,Int(-wx/2+90),Int(-wy/2+10),wx,wy,1,1,1)
				windowgametype.position.add(0.5,0.5,0,True)
				windowgametype.position.addkondition(640,800,480,600,  100,5,-1,False)
				windowgametype.size.addkondition(640,800,480,600,  690,590,1,False)
				windowgametype.shadow=False'setshadow(10,10)
				windowgametype.clearbackground()
				'windowgametype.colortransformed.set(0.7,0.5,0.35,0.8)
				windowgametype.color.copy(windowgametype.colortransformed)
				windowgametype.background[0].addlast(igametypewindow)
				windowgametype.background[1].addlast(igametypewindow)
				windowgametype.background[2].addlast(igametypewindow)
				menugametype.add(windowgametype)
				
				buttongametypemainmenu=New _guibutton
				buttongametypemainmenu.init(guisystem,-wx/2+90-(buttonwidth-60),-wy/2+10+10,buttonwidth-60,buttonheight,strmenu,37)
				buttongametypemainmenu.position.add(0.5,0.5,0,True)
				buttongametypemainmenu.position.addkondition(640,800,480,600,  5,5,-1,False)
				buttongametypemainmenu.size.addkondition(640,800,480,600,  buttonwidth-80,buttonheight-10,1,False)
				buttoninitmagic(buttongametypemainmenu)
				menugametype.add(buttongametypemainmenu)
				
				buttongametypestart=New _guibutton
				buttongametypestart.init(guisystem,-wx/2+90-(buttonwidth-60),-wy/2+buttonheight+10+10+10,buttonwidth-60,buttonheight,strstart,37)
				buttongametypestart.position.add(0.5,0.5,0,True)
				buttongametypestart.position.addkondition(640,800,480,600,  5,buttonheight+5+5,-1,False)
				buttongametypestart.size.addkondition(640,800,480,600,  buttonwidth-80,buttonheight-10,1,False)
				buttoninitmagic(buttongametypestart)
				menugametype.add(buttongametypestart)



				previewwindow=New _previewwindow
				previewwindow.init(Self,windowgametype,0,0,20,20,1,1,1)
				previewwindow.position.addkondition(640,800,480,600,  -30,-10,-1,False)
				
				current=New _guitext
				current.init(windowgametype,70,50,1,gamenames[currentgame],97,0.84,0.68,font24)
				current.setvectordynamic(wx,wy)
				'-------------------------------------- create game type list
				typelist=New _guilistbox
				typelist.borderwidth=8
				typelist.init(windowgametype,60,80,200,570,1,1,1,38)
				typelist.selectionrect=True
				typelist.moverrect=True
				typelist.setvectordynamic(wx,wy)
				listboxinitmagic(typelist)
				current_preview=currentgame
				updatelistboxgametypesorted(typelist,current_preview)				
				
				'-------------------------------------- create sort box
				sortbox=New _guicombobox
				sortbox.init(windowgametype,60,655,200,40,60,-1,1,1,1  ,260,650-160,210,160+40, 30, 0, font18)
				sortbox.setvectordynamic(wx,wy)
				sortbox.listbox.selectionrect=True
				sortbox.listbox.moverrect=True
				sortbox.listbox.setpositiondynamic(wx,wy)
				comboboxinitmagic(sortbox)
				Local gt:_guitext
				Local tr#=1
				Local tg#=0.8
				Local tb#=0.4
				Local sey#=0
				Local hse$
				Local txo#=210/2-35
				Local tx#
				
				
				
				
				hse=strgametypesortalphabetical;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=sortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,0);sey:+22
				
				hse=strgametypesortpublicity;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=sortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,1);sey:+22;gt.createhelp(strgametypesortpublicitydesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesortchance;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=sortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,2);sey:+22;gt.createhelp(strgametypesortchancedesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesortskill;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=sortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,3);sey:+22;gt.createhelp(strgametypesortskilldesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesorttime;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=sortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,4);sey:+22;gt.createhelp(strgametypesorttimedesc,font18,0.1,200,0);guihelpinitmagic(gt)
				
				hse=strgametypesorttype;SetImageFont(font18);tx=txo-TextWidth(hse)/2
				gt=sortbox.listbox.inserttext(hse,tx,sey,1,tr,tg,tb,font18,5);sey:+22
				
				sortbox.listbox.superinactivity(True)
				sortbox.listbox.superinvisibility(True)
				sortbox.listbox.fadeopacity(0)
				sortbox.createhelp(strsortbox,font18,0.5,0,0)
				sortbox.button.createhelp(strsortboxbutton,font18,0.5,0,0)
				guihelpinitmagic(sortbox)
				guihelpinitmagic(sortbox.button)

				sortbox.clearbackground()
				sortbox.shadow=False
				sortbox.superinvisible=True
				sortbox.text.set(strgametypesortalphabetical)
				sortbox.text.textshadow=1
				'-------------------------------------- create game manual help list
				desclist=New _guilistbox
				desclist.borderwidth=8
				desclist.init(windowgametype,270,80,500,260,1,1,1,39)
				desclist.setvectordynamic(wx,wy)
				listboxinitmagic(desclist)
				updatemenugametype()
				menugametype.fadeopacity(0)
				menugametype.visibility(False)
				menugametype.activity(False)
				menugametype.fadetarget(menuopacity2)
				
				EndMethod				
				
	Method createmenugametypehelp()
	
				Local bw#=buttonwidth
				Local bh#=buttonheight
				Local y#=100
				Local x#=650
				Local wx#=612
				Local wy#=723
				Local off#=20		
				Local kit:_guibutton=Null
				Local keyraus=False
				
				menugametypehelp=menuman.createmenu()
				windowgametypehelp=New _guiwindow
				windowgametypehelp.init(guisystem,100+Int(-wx/2),Int(-wy/2),wx,wy,1,1,1)
				windowgametypehelp.position.add(0.5,0.5,0,True)
				windowgametypehelp.shadow=False'setshadow(10,10)
				windowgametypehelp.clearbackground()
				'windowgametype.colortransformed.set(0.7,0.5,0.35,0.8)
				windowgametypehelp.color.copy(windowgametypehelp.colortransformed)
				windowgametypehelp.background[0].addlast(igametypewindow)
				windowgametypehelp.background[1].addlast(igametypewindow)
				windowgametypehelp.background[2].addlast(igametypewindow)
				Local pk:_guivectorkondition=windowgametypehelp.position.addkondition(640,800,480,600,180,3,-1,False);
				pk=windowgametypehelp.size.addkondition(640,800,480,600,wx,600,1,False);
				menugametypehelp.add(windowgametypehelp)
				
				buttongametypehelpback=New _guibutton
				buttongametypehelpback.init(guisystem,100+-wx/2-buttonwidth-20,-wy/2,buttonwidth,buttonheight,strback,-1)
				buttongametypehelpback.position.add(0.5,0.5,0,True)
				buttongametypehelpback.position.addkondition(640,800,480,600, 20,10,-1,False)
				buttoninitmagic(buttongametypehelpback)
				menugametypehelp.add(buttongametypehelpback)
				
				windowgametypehelppreviewwindow=New _previewwindow
				windowgametypehelppreviewwindow.init(Self,windowgametypehelp,-50,3,20,20,1,1,1)
				windowgametypehelppreviewwindow.position.addkondition(640,800,480,600,  -50,-8,-1,False)
				
				windowgametypehelptitle=New _guitext
				windowgametypehelptitle.init(windowgametypehelp,40,50,1,gamenames[currentgame],97,0.84,0.68,font24)

				'-------------------------------------- create game manual help list
				windowgametypehelplist=New _guilistbox
				windowgametypehelplist.borderwidth=8
				windowgametypehelplist.init(windowgametypehelp,50,80,500,260,1,1,1,39)
				windowgametypehelplist.size.addkondition(640,800,480,600,  500,200,1,False)
				listboxinitmagic(windowgametypehelplist)
				updatemenugametypehelp(windowgametypehelplist,currentgame)
				menugametypehelp.fadeopacity(0)
				menugametypehelp.visibility(False)
				menugametypehelp.activity(False)
				menugametypehelp.fadetarget(menuopacity2)
				
				EndMethod				
				
				
				
'******************************************************************************************************************
'										G A M E  M E N U 
'******************************************************************************************************************
				
				
	Method createmenugame()
				menugame=menuman.createmenu()
				'ottombuttons=CreateList()
				Local kit:_guibutton
				Local bw#=buttonwidth-100
				Local bh#=buttonheight-20
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
				buttongamemainmenu.init(guisystem,x,y,bw,bh,strmenu,42)
				buttongamemainmenu.position.set(x,y,-1,False)
				buttoninitmagic(buttongamemainmenu,font18)
				menugame.add(buttongamemainmenu)
				y:+(bh+off)
				buttongameoptions=New _guibutton
				buttongameoptions.init(guisystem,x,y,bw,bh,stroptions,3442)
				buttongameoptions.position.set(x,y,-1,False)
				buttoninitmagic(buttongameoptions,font18)
				menugame.add(buttongameoptions)
				y:+(bh+off)
				
				
				y=-7*(off+bh)
				buttongamerules=New _guibutton
				buttongamerules.init(guisystem,x,y,bw,bh,strrules,-1)
				buttongamerules.position.add(0,1,-1,True)
				buttoninitmagic(buttongamerules,font18)
				menugame.add(buttongamerules)
				y:+off+bh
				buttongamenew=New _guibutton
				buttongamenew.init(guisystem,x,y,bw,bh,strnew,45)
				buttongamenew.position.add(0,1,-1,True)
				buttoninitmagic(buttongamenew,font18)
				menugame.add(buttongamenew)
				y:+off+bh
				buttontipp=New _guibutton
				buttontipp.init(guisystem,x,y,bw,bh,strhint,63)
				buttontipp.position.add(0,1,-1,True)
				buttoninitmagic(buttontipp,font18)
				menugame.add(buttontipp)
				y:+bh+off
				'buttonauto=New _guibutton
				'buttonauto.init(guisystem,x,y,bw,bh,"Automatik",64)
				'buttoninitmagic(buttonauto)
				'menugame.add(buttonauto)
				'y:+bh+off
				buttonundo=New _guibutton
				buttonundo.init(guisystem,x,y,bw,bh,strundo,40)
				buttonundo.position.add(0,1,-1,True)
				buttoninitmagic(buttonundo,font18)
				menugame.add(buttonundo)
				y:+bh+off
				buttonredo=New _guibutton
				buttonredo.init(guisystem,x,y,bw,bh,strredo,41)
				buttonredo.position.add(0,1,-1,True)
				buttoninitmagic(buttonredo,font18)
				menugame.add(buttonredo)
				y:+bh+off
				buttongamesave=New _guibutton
				buttongamesave.init(guisystem,x,y,bw,bh,strsave,62)
				buttongamesave.position.add(0,1,-1,True)
				buttoninitmagic(buttongamesave,font18)
				menugame.add(buttongamesave)
				y:+(bh+off)
				buttongameload=New _guibutton
				buttongameload.init(guisystem,x,y,bw,bh,strload,61)
				buttongameload.position.add(0,1,-1,True)
				buttoninitmagic(buttongameload,font18)
				menugame.add(buttongameload)
				y:+(bh+off)
				'Print "--------------------------------------offset+BH="+(off+bh)

				tgmcurgame=New _guitext
				tgmcurgame.init(guisystem,0,10,1,"hu",1,0.95,0.6)
				tgmcurgame.font=font30
				menugame.add(tgmcurgame)
				tgmtime=New _guitext
				tgmtime.init(guisystem,0,50,1,"hu",1,0.95,0.6)
				tgmtime.font=font18
				menugame.add(tgmtime)
				tgmscore=New _guitext
				tgmscore.init(guisystem,0,75,1,"hu",1,0.95,0.6)
				tgmscore.font=font18
				menugame.add(tgmscore)
				menugame.visibility(False)
				menugame.activity(False)
				menugame.fadeopacity(0)
				menugame.fadetarget(menuopacity)

				bottombuttons.addlast(buttongameload)
				bottombuttons.addlast(buttongamesave)
				bottombuttons.addlast(buttonredo)
				bottombuttons.addlast(buttonundo)
				bottombuttons.addlast(buttontipp)
				bottombuttons.addlast(buttongamenew)
				bottombuttons.addlast(buttongamerules)



				EndMethod
				Rem
	Method updatemenugame()
				'update type&time display
				Local x#
				SetImageFont(font30)
				x=gra.screenw-TextWidth(gamenames[currentgame])-10
				tgmcurgame.position.setx(x)
				tgmcurgame.set(gamenames[currentgame])
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
				' Print "tttttt=!"+timeduringgame
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
				
				Local bh#=buttonheight-20
				Local off#=10
				Print "offset+BH="+(off+bh)
				Local yit#=-1*(off+bh)
				For Local bit:_guibutton=EachIn bottombuttons
				 If bit.visible 
				  Local y#=bit.position.gety(0)
				  bit.position.sety(y*0.9+yit*0.1)
				  yit:-(off+bh)
				 EndIf
				Next
				EndMethod				
				EndRem
	Method updatemenugame()
				EndMethod
				
	Method updategamemenu()'--------------------- diese wird aufgerufen ------------------
				'update type&time display
				Local x#
				SetImageFont(tgmcurgame.font)
				x=gra.screenw-TextWidth(gamenames[currentgame])-10
				tgmcurgame.position.setx(x)
				tgmcurgame.set(gamenames[currentgame])
				
				
				If timeduringgame

				 SetImageFont(tgmtime.font)
				 Local h$
				
				 Local hs$
				 If game
				  'Print game.inuse +"   "+game.statsclosed+"   "+game.ended

				  If game.inuse
				   h=timemstohhmmss(game.time)
				   hs=Int(game.score())+" "+strpoints
				  Else
				   h="("+strnotbegun+")"
				   hs=""
				  EndIf
				 EndIf
				 x=gra.screenw-TextWidth(h)-10
				 tgmtime.position.setx(x)
				 tgmtime.positiontransformed.x=x
				 tgmtime.set(h)
	
				 x=gra.screenw-TextWidth(hs)-10
				 tgmscore.position.setx(x)
				 tgmscore.positiontransformed.x=x
				 tgmscore.set(hs)	
				Else
				 Local h$
				 SetImageFont(tgmtime.font)
				 tgmscore.set("")	
				 h=strgameruns
				 x=gra.screenw-TextWidth(h)-10
				 tgmtime.position.setx(x)
				 tgmtime.positiontransformed.x=x
				 tgmtime.set(h)				
				EndIf
				
				Local bh#=buttonheight-20
				Local off#=10	
				Local yit#=-1*(off+bh)
				'Print "offset+BH="+(off+bh)

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
	Method showmenumain()
				menuman.show(menumain)
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
				Local bl
				If game If fileexists("game"+gamenamesstore[game.index]+".sol")=False 
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
				gamedelaytime=clock.ms()

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
				Else
				 b.text=strmenu
				EndIf
				EndMethod											
	Method activatestatusgame()
				  musicman.channelmenufadeswitch=True
				  musicman.channelmenuswitchto=1
				  If game musicman.channelmenuswitchto=game.index Mod musicman.count
				  musicman.channelmenufadeup=False
				  musicman.channelmenufadedown=False


				setworldfieldgame()	
	
				For Local cit:_candle=EachIn candlegamelist
				 cit.flamme.activate()
				Next
				For Local cit:_candle=EachIn candlemenulist
				 cit.flamme.active=False
				Next
				kamin.deactivate()
				EndMethod 
	Method activatestatusmenu()
	
				  musicman.channelmenufadeswitch=True
				  musicman.channelmenuswitchto=0
				  musicman.channelmenufadeup=False
				  musicman.channelmenufadedown=False
	
				setworldfieldmenu()	
	
				For Local cit:_candle=EachIn candlegamelist
				 cit.flamme.active=False
				Next
				For Local cit:_candle=EachIn candlemenulist
				 cit.flamme.activate()
				Next	
	 			kamin.activate()
				EndMethod
	Method gamefadein()
				pgamefadein=True
				pgamefadeout=False
				gameopacitytime=clock.ms()	
				If game game.allowpick=True
				
				EndMethod
	Method gamefadeout()
				pgamefadein=False
				pgamefadeout=True
				gameopacitytime=clock.ms()		
				If game game.allowpick=False
			
				EndMethod
	Method mainloopmenugame()
				 '----------------------------------------game menue--------------------------------------------------------------
				 If game
				  If game.picklist.count()=0 And game.animationlist.firstlink()=Null
				   If game.keyboardinputblocked=False
				    If (guisystem.button=buttontipp Or currentkey=KEY_ENTER Or currentkey=KEY_SPACE Or currentkey=KEY_F1) And game.allowpick 
				     If game.tipp() 
				      game.starttime:-10000;
				      Local hh$=strminustime+" 10 "+strseconds+"."
				      messagestatusbar(hh,1,500)
			 		 Else
				 	  If game.ended=False messagestatusbar(strnotipp,1,500) Else messagestatusbar(strgamealreadywon,1,500)
				     EndIf
				     game.tipps:+1
				    EndIf
				    If (guisystem.button=buttonundo Or currentkey=KEY_BACKSPACE Or currentkey=117) And game.allowpick game.undo()
				    If (guisystem.button=buttonredo Or currentkey=114) And game.allowpick game.redo()
				   EndIf
				  EndIf
				 EndIf
			 	 If guisystem.button	 
				  If game
				   If game.picklist.count()=0 
				    If guisystem.button.index=45 Or guisystem.button.index=53 
				     Local neu=True
					 If game 
					  If game.inuse And game.ended=False And confirmonquit 
					   If abfrage2z(strnewgame0,strnewgame1,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)=False neu=False
				      EndIf
				     EndIf
				     If neu 
				
				      Local bl:TList=game.deinsertforblow()
				      game.clear()
				      game=Null
				      initgame(0,True)
				      transformgame()
					  updatescene()
				      game.insertblowlist(bl)
				 	  'game.updateshadowarray()
				      bl.clear()
				
				     EndIf
				    EndIf
				    If guisystem.button=buttongamerules
				     showmenugametypehelp();
				    EndIf
				    If guisystem.button=buttongameload 
				     If fileexists("game"+gamenamesstore[currentgame]+".sol")
				      Local laden=True
				      If game If game.inuse
				       If abfrage2z(strloadgame0,strloadgame1,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)=False laden=False
				 	  EndIf
					  If laden
				       messagestatusbar(strloading,1,1500)
				       drawstandard()
				       Local bl:TList=Null
				       If game'vor dem laden zwingend!
				        bl=game.deinsertforblow()
				        game.clear()
				        game=Null
				       Else
				        bl=CreateList()
				       EndIf
				       game=loadgame(Self,currentgame)
				       game.insertblowlist(bl)
				       bl.clear()
				       messagestatusbar(strloaded,1,1500)
				       updatescene()
				    
				      EndIf
				     Else
					  messagestatusbar(strnosavegamefile,1,1500)
				     EndIf
				    EndIf
				    If guisystem.button=buttongamesave 
				     savegame(game)
				     buttongameload.fadein()
				     messagestatusbar(strsaved,1,1500)
				    EndIf
				    If guisystem.button If guisystem.button=buttongamemainmenu
				     keyraus=True
				     If game If game.inuse And game.ended=False And confirmonquit
				      If abfrage(strquit,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)=False keyraus=False
				     EndIf
				     If keyraus
				      showmenumain()
					  gamefadeout()
				      activatestatusmenu()
				     EndIf
				     
				     keyraus=False
				    EndIf
					If guisystem.button=buttongameoptions showmenuoptions(menuoptionslast,True,False)
			       EndIf
			      EndIf			
				 EndIf

				EndMethod								
	Method mainloopmenugametype()
			'	Print "demopl="+demoplay;
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
					initgamepreview(0,current_preview)
					transformgamepreview()
					updatemenugametype()
					If game game.allowpick=False
				   EndIf
				   If guisystem.doubleclickleft 
				    Local wechseln=True
				    If game If game.inuse And game.ended=False And confirmonquit If abfragegametype(font18,imessagewindow)=False wechseln=False
				    'updatefantasywindowtype()				
				    demoplay=False		
				    If wechseln 
					 currentgame=current_preview
				 	 'initgame(False)
				    EndIf
				    updatemenumain()
				    initgame(0,False)
				    transformgame()
				    demoplay=False		
				    showmenugame()
				    gamefadein()
				    activatestatusgame()
				    If game game.allowpick=True
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
				    If gamepreview.ended Or (gamepreview.autoplay()=False)
				     initgamepreview(0,current_preview)
				     transformgamepreview()
				    EndIf
				    If demoplay=False playsoundstretched(sgong,0.5,1.05,1.1)
				    demoplay=True
				    demoplaylasttime=clock.ms()-2000
				   ' Print "DEMOPLAY"
				   EndIf
				   If guisystem.button=buttondemoplaystop 
				    If demoplay=True playsoundstretched(sgong,0.5,0.95,1.05)
				    demoplay=False
				   EndIf
				  EndIf
		   		  If guisystem.button=buttongametypehelpback
		           demoplay=False;	
		  		   showmenugame();
				   If game game.allowpick=True
		          EndIf
				  If guisystem.button=buttongametypemainmenu 
				   'Local wechseln=True
				   'If game If game.inuse And game.ended=False And confirmonquit If abfragegametype(font18,imessagewindow)=False wechseln=False
				   demoplay=False		
				   'If wechseln 
					currentgame=current_preview
				   'EndIf
				   updatemenumain()
				   showmenumain()
				  EndIf
				  If guisystem.button=buttongametypestart
				   'Local wechseln=True
				   'If game If game.inuse And game.ended=False And confirmonquit If abfragegametype(font18,imessagewindow)=False wechseln=False
				   'If wechseln 
					currentgame=current_preview
				   'EndIf
				   initgame(0,False)
				   transformgame()
				   updatemenumain()
				   demoplay=False		
				   showmenugame()
				   gamefadein()
				   activatestatusgame()
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
				  updatelistboxgametypesorted(typelist,current_preview)
				 EndIf				 

				EndMethod								
	Method showmenugametype()
	 			current_preview=currentgame
	   			initgamepreview(0,current_preview)
				transformgamepreview()
				updatelistboxgametypesorted(typelist,current_preview);
				updatemenugametype()
				menuman.show(menugametype)
				guisystem.focus=typelist
				If game
				 game.clear()
				 game=Null
				 setworldfieldmenu()
				EndIf								
		   		gamepreview.opacity(0)
		        guisystem.animatefadechild()
				EndMethod				
	Method showmenugametypehelp()
	 			current_preview=currentgame
	   			initgamepreview(0,current_preview)
				transformgamepreview()
				updatemenugametypehelp(windowgametypehelplist,currentgame)
				If game game.allowpick=False
				SetImageFont(windowgametypehelptitle.font)
				Local hh$=gamenames[currentgame]
				windowgametypehelptitle.position.setx(windowgametypehelp.width()/2-TextWidth(hh)/2)
				windowgametypehelptitle.set(hh)
				menuman.show(menugametypehelp)
				gamedelaytime=clock.ms()
				guisystem.focus=Null
		   		gamepreview.opacity(0)
		        guisystem.animatefadechild()
				EndMethod					
	Method showmenuuser()
				optionscalledfromgame=False
				menuman.show(menuuser)
				guisystem.focus=windowuserlist
				If game game.allowpick=False
				EndMethod
				
	Method mainloopmenumain()
				If guisystem.button
				 '-----------------------------------------mainmenu-------------------------------------------------------------------------
				 ' -------------- Hauptmenu : start ---------------------
				 If guisystem.button=buttonstart 
				  
				  If game 
				   If game.ended 
				    initgame(0,True)
				    transformgame()
				   EndIf
				  Else
				   initgame(0,True)
				   transformgame()
				  EndIf
				  gamefadein()
				  showmenugame()
				  ' game.scale(0.5)
				  activatestatusgame()
				  'If game movecamera(game.cameraposition[2])
				 EndIf
				 ' -------------- Hauptmenu : Optionen & exit ---------------------
				 If guisystem.button=buttonmenumainoptions showmenuoptions(menuoptionslast,False,False)
				 If guisystem.button=buttonmenumainclose 
				  buttonraus=True
				  'If game If game.inuse And game.ended=False And confirmonquit
				  ' If abfrage(strquit,strnevermind,strisee,gra.screenw/2,gra.screenh/2,font18,imessagewindow)=False buttonraus=False
				  'EndIf
				 EndIf
				 ' -------------- Hauptmenu : gametype ---------------------
				 If guisystem.button=buttonmenumaingametype 
				  showmenugametype()
				 EndIf
				 ' -------------- Hauptmenu : scenetype --------------------
				 If guisystem.button=buttonmenumainscene
				  menuman.show(menuscene)
  				  optionscalledfromgame=False
				  guisystem.focus=lbscene
				  If game game.allowpick=False
				 EndIf
				 ' -------------- Hauptmenu : user --------------------
				 If guisystem.button=buttonmenumainplayer
				  showmenuuser()
				 EndIf
				 ' -------------- Hauptmenu : statistics --------------------
				 If guisystem.button=buttonmenumainstatistics
				  updatelistboxuser(windowstatisticsuserlist,True)
				  optionscalledfromgame=False
				  menuman.show(menustatistics)
				  windowstatisticstypelist.selectbytext(gamenames[currentgame])
				  windowstatisticstypelist.scrolltoselection()
				  updatemenustatistics()
				  windowstatisticsuserlist.scrolltoselection()
				  'guisystem.focus=lbscene
				  If game game.allowpick=False
				 EndIf
				 If guisystem.button=buttonmenumainhighscoreclear 
				  If abfrage(strfaclearhighscore,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)
				   gamestats[currentgame].clearhighscorelist()
				   updatemenumain()
				   windowstatisticsshort.animate(0)
				  EndIf
				 EndIf
				 '--------------- scenen änderung -------------------------
				 Rem
				 If guisystem.button If guisystem.button.index=49
				  currentscene:+1
				  If currentscene>scenecount-1 currentscene=0
				  updatescene()
				  'updatefantasywindowscene()
				  'windowfantasyscene.animate()
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
				  'updatefantasywindowmusic()
				 EndIf
				 
			  	 If guisystem.button If guisystem.button.index=48
				  currentscene:-1
				  If currentscene<0 currentscene=scenecount-1
				  updatescene()
				  'updatefantasywindowscene()
				  'windowfantasyscene.animate()
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
				   'updatefantasywindowmusic()
				  EndIf
				  EndRem
				  '-------------------- karten options aufruf -------------------------
				  ' If guisystem.button If guisystem.button=buttonmenumain showmenuoptions(menuoptionscard,False,True)
				  '--------------- musik änderung -------------------------
				  Rem
				  If guisystem.button If guisystem.button.index=52 Or guisystem.button.index=50
				   currentmusic:+1
				   If currentmusic>musiccount-2 currentmusic=0
				   'updatefantasywindowmusic()
				   musicman.play(currentmusic,False,True)
				   windowfantasymusic.animate()
				   musicsequence=False
				   cbms.checked=musicsequence
				   currentmusicuser=True
				  EndIf
				  If guisystem.button If guisystem.button.index=51
				   currentmusic:-1
				   If currentmusic<0 currentmusic=musiccount-2
				   'updatefantasywindowmusic()
				   windowfantasymusic.animate()
				   musicman.play(currentmusic,False,True)
				   musicsequence=False
				   cbms.checked=musicsequence
				   currentmusicuser=True
				  EndIf
				  EndRem
				  '------------------ statistik ----------------------------
				  If guisystem.button If guisystem.button.index=54'highscore löschen
				   If abfrage(strclearhighscore,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)
				    gamestats[currentgame].highscorelist.clear()
				    updatemenumain()
				   EndIf
				  EndIf
				  If guisystem.button If guisystem.button.index=55'statisitk löschen
				   If abfrage(strclearstatistics,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)
				    gamestats[currentgame].entrylist.clear()
				    updatemenumain()
				   EndIf
				  EndIf
				 EndIf	
				EndMethod								
	Method mainloopmenuuser()
				'--------------------------------------------------------------------- usermenu ------------------------------------------------------
				If menuusercreate.active()
				 If KeyHit(KEY_ENTER)
				  onusercreatecreate()
				 EndIf					 
				EndIf
				
				
				If usermanagement.actual=Null And menuusercreate.active()=False
				 menuusercreatefrom=2
				 windowusercreatename.text=""
				 windowusercreateimagelist.selection=Null
				
				
				 windowusercreateimagelist.setpositiony(Float(150)/Float(710))
				 windowusercreateimagelist.setsizey(Float(440)/Float(700))
				 For Local cit:_guicheckbox=EachIn windowusercreateimagelist.childlist
				  cit.checked=False
				 Next
				 buttonusercreatecreate.text=strcreate
				 buttonusercreatecancel.superinvisible=True
				 windowusercreatetitle.set(strusercreatefirst0)
				 
				 windowusercreatetitle1.superinvisible=False
				 windowusercreatetitle2.superinvisible=False
				 windowusercreatetitle.font=font24
				 windowusercreatetitle1.font=font24
				 windowusercreatetitle2.font=font24
				 
				
				 windowusercreatetitle.centerx(0.5)'windowusercreate.width()/2-5)
				 windowusercreatetitle1.centerx(0.5)'windowusercreate.width()/2-5)
				 windowusercreatetitle2.centerx(0.5)'windowusercreate.width()/2-5)
				 menuman.show(menuusercreate)	
				EndIf


				If guisystem.button
				 If guisystem.button=buttonusercreate
				  menuusercreatefrom=0
				  windowusercreatename.text=""
				  buttonusercreatecancel.superinvisible=False
				  windowusercreateimagelist.setpositiony(Float(90)/Float(710))
				  windowusercreateimagelist.setsizey(Float(500)/Float(700))

				  windowusercreatetitle1.superinvisible=True
				  windowusercreatetitle2.superinvisible=True
				  windowusercreatetitle.font=font30
				  windowusercreatetitle1.font=font30
				  windowusercreatetitle2.font=font30
				  windowusercreateimagelist.selection=Null
				  For Local cit:_guicheckbox=EachIn windowusercreateimagelist.childlist
				   cit.checked=False
				  Next
				  buttonusercreatecreate.text=strcreate
				  windowusercreatetitle.set(strcreateuser)
				  windowusercreatetitle.centerx(0.5)'windowusercreate.width()/2-5)
				  windowusercreatetitle1.centerx(0.5)'windowusercreate.width()/2-5)
				  windowusercreatetitle2.centerx(0.5)'windowusercreate.width()/2-5)
				
				  menuman.show(menuusercreate)
				 EndIf
				 If guisystem.button=buttonuseredit And usermanagement.actual
				  menuusercreatefrom=1
				  windowusercreatename.text=usermanagement.actual.name
				  buttonusercreatecancel.superinvisible=False
				  windowusercreateimagelist.setpositiony(Float(90)/Float(710))
				  windowusercreateimagelist.setsizey(Float(500)/Float(700))
				  windowusercreatetitle1.superinvisible=True
				  windowusercreatetitle2.superinvisible=True
				  windowusercreatetitle.font=font30
				  windowusercreatetitle1.font=font30
				  windowusercreatetitle2.font=font30
				  Local imageindex=-1
				  Local ii=0
				 ' For Local iit:_guiimage=EachIn windowusercreateimagelist.childlist
				 '  If ii=usermanagement.actual.index windowusercreateimagelist.selection=iit
				 '  ii:+1
				 ' Next
				  ii=0
				  For Local cit:_guicheckbox=EachIn windowusercreateimagelist.childlist
				   If ii=usermanagement.actual.index 
				    cit.checked=True 
				    windowusercreateimagelist.selection=cit.crosslinkimage
				   Else 
				    cit.checked=False
				   EndIf
				   ii:+1
				  Next
				  buttonusercreatecreate.text=strset
				  windowusercreatetitle.set(stredituser)
				  windowusercreatetitle.centerx(0.5)'windowusercreate.width()/2-5)
				  windowusercreatetitle1.centerx(0.5)'windowusercreate.width()/2-5)
				  windowusercreatetitle2.centerx(0.5)'windowusercreate.width()/2-5)
				
				  menuman.show(menuusercreate)
				 EndIf
				 If guisystem.button=buttonuserdelete And usermanagement.actual
				  If abfrage(struserdelete,stryes,strno,gra.screenw/2,gra.screenh/2,font24,imessagewindow)
				   
				   Local statslist:TList=CreateList()
				   For Local i=0 To gametypecount-1
				    If gamestats[i]
				     For Local eit:_gamestatsentry=EachIn gamestats[i].entrylist
				      If usermanagement.actual.name=eit.user statslist.addlast(eit)
				     Next
				     For Local eit:_gamestatsentry=EachIn gamestats[i].highscorelist
				      If usermanagement.actual.name=eit.user statslist.addlast(eit)
				     Next
				    EndIf
				   Next
				   For Local eit:_gamestatsentry=EachIn statslist
				    eit.clear()
				   Next
				   statslist.clear()
				   usermanagement.clearuser(usermanagement.actual.name) 
				   updatelistboxuser(windowuserlist,False)
				   updatelistboxuserselection()
				   windowuser.updatefadeopacity()
				   updatemenumain()
				  EndIf
				 EndIf
				 If guisystem.button=buttonusercreatecancel
				  If menuusercreatefrom=0 Or menuusercreatefrom=1
				   menuman.show(menuuser)
				  EndIf
				 EndIf
				 
				 If guisystem.button=buttonusercreatecreate
				  onusercreatecreate()				
				 EndIf
				EndIf
				If guisystem.checkbox
				 If guisystem.checkbox.index>=8000 And guisystem.checkbox.index<8100
				  For Local cit:_guicheckbox=EachIn windowusercreateimagelist.childlist
				   cit.checked=False
				  Next
				  guisystem.checkbox.checked=True
				  If guisystem.checkbox.crosslinkimage windowusercreateimagelist.selection=guisystem.checkbox.crosslinkimage
			   
			   
				 EndIf
				 If guisystem.checkbox.index>=7000 And guisystem.checkbox.index<7100
				  For Local cit:_guicheckbox=EachIn windowuserlist.childlist
				   If cit<>guisystem.checkbox cit.checked=False Else cit.checked=True
				  Next
				'Print "BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
				  Local ii=0
				  For Local iit:_guiimage=EachIn windowuserlist.childlist
				   If ii=(guisystem.checkbox.index-7000)*2 windowuserlist.selection=iit
				   ii:+1
				  Next		
				  ii=0
				  For Local tit:_guitext=EachIn windowuserlist.childlist
				   If ii=(guisystem.checkbox.index-7000) usermanagement.setuser(tit.get())
				   ii:+1
				  Next				   
				 EndIf
				 updatemenumain()
				EndIf
				Rem
				If guisystem.text
				 Print "tttt"
				 If guisystem.text.index>=7100 And guisystem.text.index<7200
				  usermanagement.setuser(guisystem.text.get())
				  updatelistboxuserselection()
				 EndIf
				EndIf
				EndRem
				If guisystem.listbox
				 If guisystem.listbox=windowuserlist
				  If windowuserlist.selection
				   Local gt:_guitext=_guitext(windowuserlist.selection)
				   If gt
				    If gt.index>=7100 And gt.index<=7200
				     usermanagement.setuser(gt.get())
				     updatelistboxuserselection()
				     updatemenumain()
				    EndIf
				   EndIf
				  EndIf 
				 EndIf
				EndIf
				If guisystem.image And guisystem.listbox=windowusercreateimagelist Or guisystem.listbox=windowuserlist 
				 If guisystem.image.index>=8100 And guisystem.image.index<8200
				  Local ii=0
				  For Local cit:_guicheckbox=EachIn windowusercreateimagelist.childlist
				   cit.checked=False
				  Next	
				 ' Print "VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV"

				  windowusercreateimagelist.selection=guisystem.image
				  If guisystem.image.crosslinkcheckbox 
				  ' Print "JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ"
				   guisystem.image.crosslinkcheckbox.checked=True		 	   
				  EndIf
				  updatemenumain()		   
				 EndIf
				 If guisystem.image.index>=7100 And guisystem.image.index<7200
				  Local ii=0
				  For Local cit:_guicheckbox=EachIn windowuserlist.childlist
				   If ii=(guisystem.image.index-7100) cit.checked=True Else cit.checked=False
				   ii:+1
				  Next				   
				  ii=0
				  For Local tit:_guitext=EachIn windowuserlist.childlist
				   If ii=(guisystem.image.index-7100) 
				    usermanagement.setuser(tit.get())
				    updatemenumain()
				   EndIf
				   ii:+1
				  Next				   
				 EndIf
				EndIf
				EndMethod
	Method onusercreatecreate()
				  Local mist=False
				  If windowusercreatename.text="" 
				   messagebox(strusercreateerrorname,strok,gra.screenw/2,gra.screenh/2,font24,imessagewindow)
				   mist=True
				  EndIf
				  If menuusercreatefrom=0
				   If mist=False And usermanagement.exists(windowusercreatename.text)
				    messagebox(strusercreateerrorexist,strok,gra.screenw/2,gra.screenh/2,font24,imessagewindow)
				    mist=True
				   EndIf
				  ElseIf menuusercreatefrom=1
				   If mist=False 
				    If windowusercreatename.text<>usermanagement.actual.name
				     Local exists=False
				     For Local uit:_user=EachIn usermanagement.list
				      If uit<>usermanagement.actual
				       If uit.name=windowusercreatename.text exists=True
				      EndIf
				     Next
				     If exists
				      messagebox(strusercreateerrorexist,strok,gra.screenw/2,gra.screenh/2,font24,imessagewindow)
				      mist=True
				     EndIf
				    EndIf
				   EndIf
				  EndIf
				  If mist=False And windowusercreateimagelist.selection=Null
				   messagebox(strusercreateerrorfigure,strok,gra.screenw/2,gra.screenh/2,font24,imessagewindow)
				   mist=True
				  EndIf
				  If mist=False
				   
				   If menuusercreatefrom=0				
				    usermanagement.createuser(windowusercreatename.text,windowusercreateimagelist.selection.index-8100,0)
				    menuman.show(menuuser)
				    updatelistboxuser(windowuserlist,False)
				    updatelistboxuserselection()
				    windowuserlist.animate(0)
				    'windowuser.animatefade()

				    updatemenumain()
				   ElseIf menuusercreatefrom=1'------------------------------ names änderung ---------------------------
				    
				    For Local i=0 To gametypecount-1
				     If gamestats[i]
				      For Local eit:_gamestatsentry=EachIn gamestats[i].entrylist
				       If eit.user=usermanagement.actual.name eit.user=windowusercreatename.text
				      Next
				      For Local eit:_gamestatsentry=EachIn gamestats[i].highscorelist
				       If eit.user=usermanagement.actual.name eit.user=windowusercreatename.text
				      Next
				     EndIf
				    Next
				    usermanagement.actual.name=windowusercreatename.text
				    usermanagement.actual.index=windowusercreateimagelist.selection.index-8100
				    menuman.show(menuuser)
				    updatelistboxuser(windowuserlist,False)
				    updatelistboxuserselection()
				    windowuser.animatefade()
					windowuserlist.animate(0)
				    updatemenumain()
				
				   ElseIf menuusercreatefrom=2
				   ' Print "mmmmmmmmmmmmmmmmmmmmmmmm22222222222222222"
				    usermanagement.createuser(windowusercreatename.text,windowusercreateimagelist.selection.index-8100,0)
				    updatelistboxuser(windowuserlist,False)
				    updatelistboxuserselection()
				    windowuserlist.animate(0)
				    'window
				    'menuman.show(menumain)
				    updatemenumain()
					If usermanagement.actual And showedoptionscard=False
					 optionscalledfromgame=False
					 showedoptionscard=True
					 menuman.show(menuoptionscardfront)
	 				 If game game.allowpick=False
					ElseIf usermanagement.actual And showedoptionscard
				     windowuser.animatefade()
				 	 windowuserlist.animate(0)
				     updatemenumain()					 
					 showmenumain()
					' Print "mmmmmmmmmmmmmmmmmmmmmmmm22222222222222222KKKKKKKKKKKKKKKKKKKKKKK"

					EndIf					
				   EndIf
				  EndIf
				EndMethod				
	Method mainloopmenucardgenerator()
				If menucardgenerator.active()
				 If guisystem.button
				  If guisystem.button=cardgeneratorbuttonback
				   cardsetmanager.actualedit.generatetexture(gra)
				   menuman.show(menuoptionscard)
				   cardsetmanager.cleartexturehardwaresources()
				  EndIf 
				  If guisystem.button=cardgeneratorbuttonreset
				   cardsetmanager.actualedit.reset()
				
				   updatemenucardgenerator(cardsetmanager.actualedit)
				   cardgeneratorwindow.animate(0)
				   'cardsetmanager.actualedit.generatetexturepreview()
				  EndIf 
				 EndIf
				
				 If guisystem.listbox'all selections
				  Local m:_guimesh=Null
				  If guisystem.mesh
				   m=guisystem.mesh
				   guisystem.listbox.checkboxes(False)
				   guisystem.mesh.crosslinkcheckbox.checked=True
				 '  Print "LISTBOX MESH"
				 '  If m.parent=guisystem.listbox Print "ist parent"
				   For Local pit:_polygon=EachIn m.mesh.polygonlist
					
				  '  Print "PP"

				    If pit.texture[0,0] Print pit.texture[0,0].file
				   Next
				  EndIf
				  If guisystem.checkbox
				   guisystem.listbox.checkboxes(False)
				   guisystem.checkbox.checked=True
				   m=guisystem.checkbox.crosslinkmesh
				   guisystem.listbox.selection=m
				
				   'Print "LISTBOX CHECK"
				  EndIf
				  If m
				   If guisystem.listbox=cardgeneratorlistboxground cardsetmanager.actualedit.groundselection=m.crosslinkname
				   If guisystem.listbox=cardgeneratorlistboxframe  cardsetmanager.actualedit.frameselection=m.crosslinkname
				   If guisystem.listbox=cardgeneratorlistboxgroundstructure cardsetmanager.actualedit.structuregroundselection=m.crosslinkname
				   If guisystem.listbox=cardgeneratorlistboxframestructure  cardsetmanager.actualedit.structureframeselection=m.crosslinkname
				   If guisystem.listbox=cardgeneratorlistboximpurity cardsetmanager.actualedit.impurityselection=m.crosslinkname
				   cardsetmanager.actualedit.generatetexturepreview(gra)
				  EndIf
				 EndIf
				
				 If guisystem.checkbox
				 ' If guisystem.checkbox=cardgeneratorcheckboxframebackside cardsetmanager.actualedit.frameforbacksides=cardgeneratorcheckboxframebackside.checked 				
				 ' If guisystem.checkbox=cardgeneratorcheckboxframepicture cardsetmanager.actualedit.frameforpictures=cardgeneratorcheckboxframepicture.checked 				
				 ' If guisystem.checkbox=cardgeneratorcheckboxframenumber cardsetmanager.actualedit.framefornumbers=cardgeneratorcheckboxframenumber.checked 				 
				  If guisystem.checkbox=cardgeneratorcheckboxgroundstructurebehind cardsetmanager.actualedit.structuregroundbehind=cardgeneratorcheckboxgroundstructurebehind.checked 				 
				  cardsetmanager.actualedit.generatetexturepreview(gra)
				 EndIf
				 If guisystem.trackbar
				 ' Print "mainloop trackbar cardgenerator"
				  If guisystem.trackbar=cardgeneratortrackbargroundstructure cardsetmanager.actualedit.structureground=cardgeneratortrackbargroundstructure.get()
				  If guisystem.trackbar=cardgeneratortrackbarframestructure cardsetmanager.actualedit.structureframe=cardgeneratortrackbarframestructure.get()

				  If guisystem.trackbar=cardgeneratortrackbarframebackside cardsetmanager.actualedit.frameforbacksides=cardgeneratortrackbarframebackside.get() 				
				  If guisystem.trackbar=cardgeneratortrackbarframepicture cardsetmanager.actualedit.frameforpictures=cardgeneratortrackbarframepicture.get()			
				  If guisystem.trackbar=cardgeneratortrackbarframenumber cardsetmanager.actualedit.framefornumbers=cardgeneratortrackbarframenumber.get()			 

				  If guisystem.trackbar=cardgeneratortrackbarimpurity cardsetmanager.actualedit.impurity=cardgeneratortrackbarimpurity.get()
				  If guisystem.trackbar=cardgeneratortrackbarimpurityyellowing cardsetmanager.actualedit.impurityyellowing=cardgeneratortrackbarimpurityyellowing.get()
				  If guisystem.trackbar=cardgeneratortrackbarimpurityscratchs cardsetmanager.actualedit.impurityscratchs=cardgeneratortrackbarimpurityscratchs.get()
			      cardsetmanager.actualedit.generatetexturepreview(gra)
				 EndIf
				EndIf
				EndMethod		
												
	Method mainloopmenuoptions()

	
				If menuoptionscardfront.active()
				 If KeyHit(KEY_ENTER)
				  optionscalledfromgame=False
				  showedmenugametype=True
				  showmenugametype()	
				 EndIf					 
				EndIf							
				'-----------------------------------------options menu-----------------------------------------------------------------------
				If guisystem.button
				 If guisystem.button.index=7 showmenuoptions(menuoptionsacoustics,optionscalledfromgame,False)
				 If guisystem.button.index=8 showmenuoptions(menuoptionsgraphics,optionscalledfromgame,False)
				 If guisystem.button.index=9 showmenuoptions(menuoptionsgame,optionscalledfromgame,False)
				 If guisystem.button.index=10 showmenuoptions(menuoptionscard,optionscalledfromgame,False)
				 If guisystem.button.index=12 showmenuoptions(menuoptionscredits,optionscalledfromgame,False)
				 If guisystem.button.index=11'options - zurück button 
				  If optionscalledfromgame 
				   showmenugame() 
				  Else 
				   If showedmenugametype=False 
				    optionscalledfromgame=False
				    showedmenugametype=True
				    showmenugametype()				 
				   Else
					showmenumain()
				   EndIf
				  EndIf
				  If game game.allowpick=True
				 EndIf
				 Local texgenbuttonfront=-1
				 For Local bit:_guibutton=EachIn buttonoptionscardchangefrontlist
				  If guisystem.button=bit
				   texgenbuttonfront=bit.index
				  EndIf
				 Next
				 If texgenbuttonfront<>-1
				  cardtexturefrontindex=texgenbuttonfront-200
				  updatemenuoptionscardcheckboxfront(checkboxoptionscardfrontlist)
				  lbdecktexture.selection=updatemenuoptionscardcheckboxfront(checkboxoptionscardfrontlist).crosslinkmesh
				  updatemenucardgenerator(cardsetmanager.cardsetfront(cardtexturefrontindex))
				  menucardgenerator.fadetarget(menuopacity2)
				  menucardgenerator.fadeopacity(0)				
				  menuman.show(menucardgenerator)
				 EndIf
				 Local texgenbuttonback=-1
				 For Local bit:_guibutton=EachIn buttonoptionscardchangebacklist
				  If guisystem.button=bit
				   texgenbuttonback=bit.index
				  EndIf
				 Next
				 If texgenbuttonback<>-1
				  cardtexturebackindex=texgenbuttonback-200
				  lbcardtexture.selection=updatemenuoptionscardcheckboxback(checkboxoptionscardbacklist).crosslinkmesh
				  updatemenucardgenerator(cardsetmanager.cardsetback(cardtexturebackindex))
				  menucardgenerator.fadetarget(menuopacity2)
				  menucardgenerator.fadeopacity(0)				
				  menuman.show(menucardgenerator)
				 EndIf				
				
				
				
				 If guisystem.button=buttonoptionsgraphicslightbright
				  farbekerze.set(1,1,1)
				  For Local cit:_candle=EachIn candlegamelist
				   cit.lightcolor.copy(farbekerze)
				  Next		
				  world.lightambient.set(1,1,1)
				  cardlighting=0.123
				  tbgrci.set(cardlighting)
				  If game game.sigmadiffuse(cardlighting)				
				  sfarbekerzer.set(farbekerze.x)
				  sfarbekerzeg.set(farbekerze.y)
				  sfarbekerzeb.set(farbekerze.z)
				  sfarbeambienzr.set(world.lightambient.x)
				  sfarbeambienzg.set(world.lightambient.y)
				  sfarbeambienzb.set(world.lightambient.z)
				  farbeambienz.copy(world.lightambient)
				 EndIf		
				
				 If guisystem.button=buttonoptionsgraphicslightmedium
				  farbekerze.set(1,0.96,0.77)
				  For Local cit:_candle=EachIn candlegamelist
				   cit.lightcolor.copy(farbekerze)
				  Next		
				  world.lightambient.set(0.32,0.42,0.58)
				  cardlighting=0.32
				  tbgrci.set(cardlighting)
				  If game game.sigmadiffuse(cardlighting)				
				  sfarbekerzer.set(farbekerze.x)
				  sfarbekerzeg.set(farbekerze.y)
				  sfarbekerzeb.set(farbekerze.z)
				  sfarbeambienzr.set(world.lightambient.x)
				  sfarbeambienzg.set(world.lightambient.y)
				  sfarbeambienzb.set(world.lightambient.z)
				  farbeambienz.copy(world.lightambient)
				 EndIf		
				
				
				 If guisystem.button=buttonoptionsgraphicslightnatural
				  farbekerze.set(1,0.65,0.29)
				  For Local cit:_candle=EachIn candlegamelist
				   cit.lightcolor.copy(farbekerze)
				  Next		
				  world.lightambient.set(0.61,0.46,0.21)
				  cardlighting=0.26
				  tbgrci.set(cardlighting)
				  If game game.sigmadiffuse(cardlighting)				
				  sfarbekerzer.set(farbekerze.x)
				  sfarbekerzeg.set(farbekerze.y)
				  sfarbekerzeb.set(farbekerze.z)
				  sfarbeambienzr.set(world.lightambient.x)
				  sfarbeambienzg.set(world.lightambient.y)
				  sfarbeambienzb.set(world.lightambient.z)
				  farbeambienz.copy(world.lightambient)
				 EndIf		
				
				 If guisystem.button=buttonoptionsgraphicslightnight
				  farbekerze.set(0.27,0.49,0.09)
				  For Local cit:_candle=EachIn candlegamelist
				   cit.lightcolor.copy(farbekerze)
				  Next		
				  world.lightambient.set(0.16,0.18,0.99)
				  cardlighting=0.3
				  tbgrci.set(cardlighting)
				  If game game.sigmadiffuse(cardlighting)				
				  sfarbekerzer.set(farbekerze.x)
				  sfarbekerzeg.set(farbekerze.y)
				  sfarbekerzeb.set(farbekerze.z)
				  sfarbeambienzr.set(world.lightambient.x)
				  sfarbeambienzg.set(world.lightambient.y)
				  sfarbeambienzb.set(world.lightambient.z)
				  farbeambienz.copy(world.lightambient)
				 EndIf		
				
				
				
				
				EndIf
				If guisystem.checkbox
				 If guisystem.checkbox.index>=100 And guisystem.checkbox.index<200
				  cardtexturebackindex=guisystem.checkbox.index-100
				  cardsetmanager.generatetextureback(gra,cardtexturebackindex)
				  cardsetmanager.cleartexturehardwaresources()
				  updatemenuoptionscardcheckboxback(checkboxoptionscardbacklist)
				  cardtexturebackuser=True
				  'Local iii=0
				  'For Local gii:_guimesh=EachIn lbcardtexture.childlist
				  ' If cardtexturebackindex=iii lbcardtexture.selection=gii
				  ' iii:+1
				  'Next
				  lbcardtexture.selection=guisystem.checkbox.crosslinkmesh	
				 ElseIf guisystem.checkbox.index>=200 And guisystem.checkbox.index<300
				  Local ni=guisystem.checkbox.index-200
				  If ni<>cardtexturefrontindex
				   cardtexturefrontindex=ni

				   'updatetextureload("fs","..\daten\images\cards",False)
				   'cardsetmanager.generatetexturefront(cardtexturefrontindex)
				   cardsetmanager.generatetexture(gra)
				   cardsetmanager.cleartexturehardwaresources()
				   updatemenuoptionscardcheckboxfront(checkboxoptionscardfrontlist)
				   lbdecktexture.selection=guisystem.checkbox.crosslinkmesh
				   'Local iii=0
				   'For Local gii:_guimesh=EachIn lbdecktexture.childlist
				   ' If cardtexturefrontindex=iii lbdecktexture.selection=gii
				   ' iii:+1
				   'Next
				  EndIf
				 ElseIf guisystem.checkbox.index>=700 And guisystem.checkbox.index<800
				  Local ni=guisystem.checkbox.index-700
				  If ni<>currentscene
				   currentscene=ni
				   updatemenuscenecheckbox(checkboxscenelist)
				   'updatefantasywindowscene()
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
				  cardsetmanager.generatetextureback(gra,cardtexturebackindex)
				  cardsetmanager.cleartexturehardwaresources()
				  updatemenuoptionscardcheckboxback(checkboxoptionscardbacklist)
				  cardtexturebackuser=True
				 ElseIf guisystem.mesh.index>=200 And guisystem.mesh.index<300
				  Local ni=guisystem.mesh.index-200
				  If ni<>cardtexturefrontindex
				   cardtexturefrontindex=ni
				   'updatetextureload("fs","..\daten\images\cards",False)
				   cardsetmanager.generatetexturefront(gra,cardtexturefrontindex)
				   cardsetmanager.cleartexturehardwaresources()
				   updatemenuoptionscardcheckboxfront(checkboxoptionscardfrontlist)
				   'updatefantasywindowcardfront()
				  EndIf
				 EndIf
				EndIf	
				If guisystem.image
				 If guisystem.image.index>=700 And guisystem.image.index<800
				  Local ni=guisystem.image.index-700
				  If ni<>currentscene
				   currentscene=ni
				   updatemenuscenecheckbox(checkboxscenelist)
				   'updatefantasywindowscene()
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
				 If t=tbgrci
				  cardlighting=tbgrci.get()
				  If game game.sigmadiffuse(cardlighting)
				 EndIf
				 If t=sfarbekerzer
				  farbekerze.x=sfarbekerzer.get()
				  For Local cit:_candle=EachIn candlegamelist
				   cit.lightcolor.x=farbekerze.x
				  Next
				 EndIf
				 If t=sfarbekerzeg
				  farbekerze.y=sfarbekerzeg.get()
				  For Local cit:_candle=EachIn candlegamelist
				   cit.lightcolor.y=farbekerze.y
				  Next
				 EndIf
				 If t=sfarbekerzeb
				  farbekerze.z=sfarbekerzeb.get()
				  For Local cit:_candle=EachIn candlegamelist
				   cit.lightcolor.z=farbekerze.z
				  Next
				 EndIf
				 If t=sfarbeambienzr 
				  world.lightambient.x=sfarbeambienzr.get()
				  farbeambienz.copy(world.lightambient)
				 EndIf
				 If t=sfarbeambienzg
				  world.lightambient.y=sfarbeambienzg.get()
				  farbeambienz.copy(world.lightambient)
				 EndIf
				 If t=sfarbeambienzb
				  world.lightambient.z=sfarbeambienzb.get()
				  farbeambienz.copy(world.lightambient)
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
				 If c=cbgrsm 
				  sparkingmouse=cbgrsm.checked
				  If sparkingmouse 
				   For Local cit:_candle=EachIn candlegamelist
				    cit.intensity=50
				   Next
				  EndIf
				 EndIf
				 If c=cbgrtd timeduringgame=cbgrtd.checked
				 If c=cbgrlp buttonpanel=cbgrlp.checked
				 If c=cbgrgp gameplaybuttons=cbgrgp.checked
				 If c=cbgrmb menubuttons=cbgrmb.checked
				 If c=cbgrca 
				  cardanimation=cbgrca.checked
				  updatescene()
				 EndIf
				 If c=cbms musicsequence=cbms.checked
				 If c=cbsp 
				  systemaccellerate=cbsp.checked
				  If game game.markforupdateshadow(Null)
				 EndIf
				 If c=cbfv
				  fastvideomode=cbfv.checked
				  graphics_setup(0)
				  saveoptions(strfileoptions)
				  updatefullscreenhelp()
					updatemenumain();			
				 EndIf
				 If c=cbsy videosynchronisation=cbsy.checked
				 If c=cbmb mybenchmark=cbmb.checked
				 If guisystem.checkbox=cbfs 
				  fullscreen=cbfs.checked
				  graphics_setup(0)
				  saveoptions(strfileoptions)		
				  updatemenumain();		
				 EndIf
				 If c=cbgrmo mouseovercard=cbgrmo.checked
				 If c=cbgrmp mouseoverpile=cbgrmp.checked
				 If c=cbgrgr 
				  greenboard=cbgrgr.checked
				  If tbackgroundgamea tbackgroundgamea.clear()
				  tbackgroundgamea=Null
				  If tbackgroundgamel tbackgroundgamel.clear()
				  tbackgroundgamel=Null
					' **************************************** bei eingebunden Resourcen ******************************************
					Rem
				  If greenboard
				   tbackgroundgamea=New _texture
				   tbackgroundgamea.init("Incbin::..\daten\fantasy\scene\table_08_2048_1024.jpg")
				   tbackgroundgamel=New _texture
				   tbackgroundgamel.init("Incbin::..\daten\fantasy\scene\table_08_2048_1024hl.jpg")
				  Else
				   tbackgroundgamea=New _texture
				   tbackgroundgamea.init("Incbin::..\daten\fantasy\scene\table_07_2048_1024.jpg")
				   tbackgroundgamel=New _texture
				   tbackgroundgamel.init("Incbin::..\daten\fantasy\scene\table_07_2048_1024hl.jpg")
				  EndIf		
				   EndRem
				  ' ******************************************** bei offenen Resourcen **********************************************

				  If greenboard
				   tbackgroundgamea=New _texture
				   tbackgroundgamea.init("..\daten\fantasy\scene\table_08_2048_1024.jpg")
				   tbackgroundgamel=New _texture
				   tbackgroundgamel.init("..\daten\fantasy\scene\table_08_2048_1024hl.jpg")
				  Else
				   tbackgroundgamea=New _texture
				   tbackgroundgamea.init("..\daten\fantasy\scene\table_07_2048_1024.jpg")
				   tbackgroundgamel=New _texture
				   tbackgroundgamel.init("..\daten\fantasy\scene\table_07_2048_1024hl.jpg")
				  EndIf		
				  If background background.updatetexture()		
				 EndIf
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
				EndMethod		
	Method mainloopmenustatistics()
				'--------------------------------------------------------------------- statistics --------------------------
				If guisystem.combobox=windowstatisticssortbox
				 Local t$=guisystem.combobox.text.get()
				 If t=strgametypesortalphabetical gametypesortmethod=0
				 If t=strgametypesortpublicity gametypesortmethod=1
				 If t=strgametypesortchance gametypesortmethod=2
				 If t=strgametypesortskill gametypesortmethod=3
				 If t=strgametypesorttime gametypesortmethod=4
				 If t=strgametypesorttype gametypesortmethod=5
				 updatelistboxgametypesorted(windowstatisticstypelist,current_preview)
				EndIf
				
				If guisystem.listbox
				 If guisystem.listbox=windowstatisticstypelist
				  updatemenustatistics()
				 EndIf
				 If guisystem.listbox=windowstatisticsuserlist
				 
				  If guisystem.image
				   windowstatisticsuserlist.selection=guisystem.image
				  Else
				   If windowstatisticsuserlist.selection
				    Local gt:_guitext=_guitext(windowstatisticsuserlist.selection)
				    If gt
				     If gt.crosslinkimage
				      windowstatisticsuserlist.selection=gt.crosslinkimage
				     EndIf
				    EndIf
				   EndIf
				  EndIf
				   
				 Rem 
				  ' wird nie benutzt, da texte die gui ereigniszeiger nicht setzen
				  If guisystem.text
				   If guisystem.text.crosslinkimage
				    windowstatisticsuserlist.selection=guisystem.text.crosslinkimage
				   EndIf
				  EndIf
				EndRem
				
				  updatemenustatistics()
				 EndIf
				EndIf
				If guisystem.button
				 If guisystem.button=windowstatisticstypeclear
				  If abfrage(strfaclearstatistics,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)
				   Local cur=windowstatisticsselectedtype()
				   If cur<>-1
				    gamestats[cur].clearentrylist()
				    updatemenustatistics()
				    updatemenumain()
				   EndIf
				  EndIf
				 EndIf
				 If guisystem.button=windowstatisticstypereset
				  If abfrage(strfaclearstatistics,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)
				   Local cur=windowstatisticsselectedtype()
				   If cur<>-1
				    gamestats[cur].clearentrylist()
				    For Local j=0 To 4
				     Local eit:_gamestatsentry=New _gamestatsentry
				     eit.init(gamestats[cur])
				     If Rand(0,1)=0
				      eit.discards=Rand(1,gametypediscards[cur]/2)
				     Else 
				      eit.discards=gametypediscards[cur]
				     EndIf 
				     eit.time=gametypetime[j]*60*1000+Rnd(60*500,60*2500)'20*1000+(15*60*1000)*gametypetime[cur]+ Rnd(0,5*1000*60)
				     eit.moves=Rand(eit.discards*2,eit.discards*5)
				     eit.user=strdummynames[Rand(0,9)]
				     eit.undos=0
				     eit.tipps=0				
				    Next
				   
				    updatemenustatistics()
				    updatemenumain()
				   EndIf
				  EndIf				
				 EndIf
				 If guisystem.button=windowstatisticsuserthisclear
				  If abfrage(strfaclearstatisticsentry,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)

				   Local usr$=windowstatisticsselecteduser()				
				   Local cur=windowstatisticsselectedtype()
				   If cur<>-1 And usr<>""
				    Local l:TList=CreateList()
				    Local eit:_gamestatsentry=Null
				    For eit=EachIn gamestats[cur].entrylist
				     If eit.user=usr l.addlast(eit)
				    Next
				    For eit=EachIn l
				     eit.clear()
				    Next
				    l.clear()
				    updatemenustatistics()
				    updatemenumain()
				   EndIf
				  EndIf
				 EndIf
				 If guisystem.button=windowstatisticsuserotherclear
				  If abfrage(strfaclearstatisticsentry,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)
				   Local usr$=windowstatisticsselecteduser()				
				   Local cur=windowstatisticsselectedtype()
				   If cur<>-1 And usr<>""
				    Local l:TList=CreateList()
				    Local eit:_gamestatsentry=Null
				    For eit=EachIn gamestats[cur].entrylist
				     If eit.user<>usr l.addlast(eit)
				    Next
				    For eit=EachIn l
				     eit.clear()
				    Next
				    l.clear()
				    updatemenustatistics()
				   EndIf
				  EndIf
				 EndIf
				 If guisystem.button=windowstatisticsuserverlauf
				  messageverlauf()
				 EndIf
				 If guisystem.button=windowstatisticsuserverlaufdiscards
				  messagediscards()
				 EndIf
				 If guisystem.button=windowstatisticstyperanks
				  optionscalledfromgame=False
				  menuman.show(menuranks)
				  updatemenuranks()
				  windowranks.animatefade()
				 EndIf
				 If guisystem.button=buttonstatisticsranks
				  optionscalledfromgame=False
				  menuman.show(menuranks)
				  updatemenuranks()
				  windowranks.animatefade()
				 EndIf


				EndIf
				EndMethod	
	Method mainloopmenuranks()
				'--------------------------------------------------------------------- ranks --------------------------
				If guisystem.combobox=windowrankssortbox
				 Local t$=guisystem.combobox.text.get()
				 If t=strgametypesortalphabetical gametypesortmethod=0
				 If t=strgametypesortpublicity gametypesortmethod=1
				 If t=strgametypesortchance gametypesortmethod=2
				 If t=strgametypesortskill gametypesortmethod=3
				 If t=strgametypesorttime gametypesortmethod=4
				 If t=strgametypesorttype gametypesortmethod=5
				 updatelistboxgametypesorted(windowrankstypelist,current_preview)
				EndIf
				
				If guisystem.listbox
				 If guisystem.listbox=windowrankstypelist
				  updatemenuranks()
				 EndIf
				EndIf
				If guisystem.button
				 If guisystem.button=buttonranksstatistics	
				  optionscalledfromgame=False
				  menuman.show(menustatistics)
				 EndIf
				EndIf
				EndMethod														
	Method mainloop:Int()
				keyraus=False
				buttonraus=False
				Repeat
				 If volumesoundfadein<1
				  volumesoundfadein:+0.005
				  If volumesoundfadein>1 volumesoundfadein=1
				 EndIf
				 'If kamin kamin.channel.setvolume(volumeambience*volumesoundfadein);
				 'If uhr uhr.schlagvolumen=volumeambience*volumesoundfadein;

			   
				 '--------------------------------------------------------------------- animate--------------------------------------------------------
				 
				 currentkey=GetChar()

				 animatestandard(currentkey)


				 buttonraus=False
				 mainloopmenumain();
				 mainloopmenuoptions();
				 mainloopmenucardgenerator();
				 mainloopmenugametype();
				 mainloopmenugame();
				 mainloopmenuuser();
				 mainloopmenustatistics();			
				 mainloopmenuranks();

				 updategamemenu()

				 If gamemenu=Null And gameopacity<1
				  If usermanagement.actual And showedoptionscard And showedmenugametype
				   initgamemenu(0,currentgame)
				   transformgamemenu()				
				  EndIf
				 ElseIf gamemenu And gameopacity=1
				  gamemenu.clear()
				  gamemenu=Null
				 ElseIf gamemenu And gameopacity=0
				  If gamemenu.index<>currentgame
				   initgamemenu(0,currentgame)
				   transformgamemenu()				
				  EndIf
				 EndIf

				 If menugametype.visible()=False And menugametypehelp.visible()=False	 
				  If gamepreview
				   gamepreview.clear()
				   gamepreview=Null
				  EndIf		
				 EndIf		
				 'If buttonstart.visible And buttongamenew.visible=False And game
				 ' game.clear()
				 ' game=Null
				 ' setworldfieldmenu()
				 'EndIf					
				 If game
				  If game.endedbygiveupburn
				   Local bl:TList=game.deinsertforblow()
				   game.clear()
				   game=Null
				   initgame(0,True)
				   
				   transformgame()
				   game.insertblowlist(bl)
				   'game.updateshadowarray()
				   bl.clear()
				  EndIf
			     EndIf	
				 'Print "shadowpreviewlist count : "+shadowpreviewlist.count()
				 'Print "shadowlist count : "+shadowlist.count()
				 'Print "particlesourcegamelist count="+particlesourcegamelist.count()
				 'Print "particlegamelist count="+particlegamelist.count()
				 'Print "world meshlist count : "+world.meshlist.count()
				 'Print "world lightlist count : "+world.lightlist.count()
				 'Print "storeable list count : "+storeablelist.count()
				 'If game
				  'Print "game blowlist : "+game.blowlist.count()
				  'Print "game drawlist : "+game.drawlist.count()
				  'Print "game cardlist : "+game.cardlist.count()
				 'EndIf
	
				 '--------------------------------------------------------------- keyboard and application animation
			
				 If KeyHit(KEY_ESCAPE) 
				  If menugame.active()
				   keyraus=True
				   If game If game.inuse And game.ended=False And confirmonquit
				    If abfrage(strquit,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)=False keyraus=False
				   EndIf
				   If keyraus
				    'If game 
				    ' game.clear()
				    ' game=Null
				    'EndIf
				    activatestatusmenu()
				    showmenumain()
				    gamefadeout()
				   EndIf
				   keyraus=False
				  ElseIf menumain.active()
				   keyraus=True
				   'If game If game.inuse And confirmonquit
				   ' If abfrage(strquit,strnevermind,strisee,gra.screenw/2,gra.screenh/2,font14,imessagewindow)=False keyraus=False
				   'EndIf
				  ElseIf menugametypehelp.active()
				   demoplay=False;	
				   showmenugame();
				   If game game.allowpick=True;
				  ElseIf (menuoptionsacoustics.active() Or menuoptionsgraphics.active() Or menuoptionsgame.active() Or menuoptionscard.active() Or menuoptionscredits.active()) And optionscalledfromgame
					showmenugame()
				    If game game.allowpick=True
				  ElseIf (menuoptionsacoustics.active() Or menuoptionsgraphics.active() Or menuoptionsgame.active() Or menuoptionscard.active() Or menuoptionscredits.active()) And optionscalledfromgame=False
				    showmenumain()
				  ElseIf menucardgenerator.active()
				   cardsetmanager.actualedit.generatetexture(gra)
				   cardsetmanager.cleartexturehardwaresources()
				   menuman.show(menuoptionscard)
				  ElseIf menuusercreate.active()
				   If usermanagement.actual=Null Or showedmenugametype=False Or showedoptionscard=False
				   'nichts machen
				   Else
				    showmenumain()
				   EndIf
				  ElseIf menuoptionscardfront.active()
				   If showedmenugametype=False 
				    optionscalledfromgame=False
				    showedmenugametype=True
				    showmenugametype()				 
				   Else
					showmenumain()
				   EndIf
				  ElseIf menugametype.active()
				   showmenumain()
				  ElseIf menuuser.active()
				   showmenumain()
				  ElseIf menustatistics.active()
				   showmenumain()
				  ElseIf menuranks.active()
				   showmenumain()
				  EndIf
				 EndIf
				
				 If animateapplication(True,0) 
				  keyraus=True
				  If game If game.inuse And confirmonquit
				   If abfrage(strquit,stryes,strno,gra.screenw/2,gra.screenh/2,font18,imessagewindow)=False keyraus=False
				  EndIf
				 EndIf
				 '--------------------------------------------------------------------- draw
				 				
				
	
				'*********************************** BENCHMARK *******************************
				Rem
				If game And gameopacity>=1
				  'disablepolledinput()
								
				Local bt#=clock.ms()
				For Local bench=0 To 999
				 animatestandard(currentkey)
				 'game.animate(clock,currentkey)
				 'mouse.set(MouseX(),MouseY())
				  'mousebutton[0]=MouseDown(1)
				  'mousebutton[1]=MouseDown(2)
				' If bench Mod 8=0  getmousevectorstatic()
				

				' game.pileinfo=Null
				' For Local pit:_pile=EachIn game.pilelist
				'  pit.animate(clock)
				' Next		
				
						
				 'drawgame()
				drawstandard()
			
 				'gra.enabletext2d()
				''*********************+ FPS **************************
				'fpscount:+1
				'Local nt#=clock.ms()
				'Local dt#=nt-fpstimeold
				'If (dt>1000)
				' fpstimeold=nt
				' fpstext=Int(Float(fpscount)/(dt*0.001))
				' fpscount=0
				'EndIf
				'SetImageFont(font30)
				'SetBlend(MASKBLEND|ALPHABLEND)
				'SetAlpha(1)
				'SetColor(0,255,0)
				'DrawText(fpstext,gra.screenw/2,10)
				 
							
				'gra.swap()
				
				Next
				
				'PollSystem()
				Print "time="+(clock.ms()-bt)/1000+"   bt="+bt	
				 drawstandard()
				Else
				 drawstandard()
				EndIf
				EndRem
				'****************************************************************************
				
				 drawstandard()
				 'Print "gol="+gameopacity
				 guisystem.nullstates()
				Until buttonraus Or keyraus 
				FlushKeys()
				Return(0)
				EndMethod
	Method fadeout()
				guisystem.saveactivitylist()
				guisystem.setactivitylist(False)
				Local start#=clock.ms()
				Local op#=0
				musicman.fadedown();
				Repeat
				 op=(clock.ms()-start)*0.001
				 If op>1 op=1
				 animatestandard(0)
				 If game And (pgamefadein Or pgamefadeout)
				  drawgame()
				  drawmenu(1-gameopacity)
				 ElseIf game=Null
				  drawmenu()
				 Else
				  drawgame()
				 EndIf
			 	 gra.enabletext2d()	
			     gra.wrap(True)	
				 guisystem.draw(gra,cam)
				 guisystem.drawcursor(gra,cam)
				 drawblendscreen()
				 drawpause()
				 SetBlend(SOLIDBLEND|MASKBLEND)
				 SetAlpha(op)
				 SetColor(0,0,0)
				 DrawImageRect(iblack,0,0,gra.screenw,gra.screenh)
				 gra.swap(videosynchronisation)				 
				 guisystem.nullstates()
				Until op=1
				EndMethod
	Method checkdate()
				Local ao:_activity=Null
				For Local ait:_activity=EachIn activitylist
				 If ao<>Null
				  Local d:Int=ait.dayindex-ao.dayindex
				 ' Print "d="+d
				  If ait.dayindex<0 Return(True)
				  If d<0 Return(True)
				 EndIf
				 ao=ait
				Next
				Return(False)
				EndMethod
						
	Method checklimitation()
				For Local ait:_activity=EachIn activitylist
				 If ait.dayindex>=(4393+60) Return(True)
				Next
				Return(False)
				EndMethod
	EndType
'******************************************************************************************************************
'										M A I N L O O P
'******************************************************************************************************************
Function mainfunction()
				Get_Screen_Resolution()
				Local solitaire:_solitairefantasy=New _solitairefantasy
				If((desktopwidth<800)Or(desktopheight<600))
				 solitaire.messagedesktopsizetoosmall()
				 solitaire.clear()
				
				ElseIf solitaire.checkdate()
				 solitaire.messagetrialdeactivated()
				 solitaire.clear()				
				ElseIf solitaire.checklimitation()
				 solitaire.messagetrialexhausted()
				 solitaire.clear()	
				
				Else
				 solitaire.initfinish()
				 solitaire.mainloop()
				 solitaire.fadeout()
				 solitaire.clear()
				EndIf
				EndFunction




'------------------------------------------------------------------------------------------------------------------
mainfunction()
			
				













