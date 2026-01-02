'Project : Sheepworld Solitaire
'Modul : main
'date of create : 21.11.2007
'date of change : 21.11.2007
'hubbland uni,haugerring 9 97070 würzburg
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

Incbin "..\daten\sheepworld\sonnetestalpha2.tga"
Incbin "..\daten\sheepworld\sonne scheint.jpg"
Incbin "..\daten\sheepworld\Hintergrund_Biene.jpg"
Incbin "..\daten\sheepworld\Fruehling1024x768.jpg"
Incbin "..\daten\sheepworld\Grasend_1024x768.jpg"
Incbin "..\daten\sheepworld\Nacht_1024x768.jpg"
Incbin "..\daten\fonts\sheepworld.TTF"
Incbin "..\daten\images\FX\fire00.tga"
Incbin "..\daten\images\FX\fire01.tga"
Incbin "..\daten\images\FX\shadow00.tga"
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

Incbin "..\daten\sheepworld\window_sheep.tga"			 
Incbin "..\daten\sheepworld\window_statistics.tga"			
Incbin "..\daten\sheepworld\window_240_204.tga"			
Incbin "..\daten\sheepworld\button_start_off.tga"
Incbin "..\daten\sheepworld\button_start_on.tga"
Incbin "..\daten\sheepworld\window_large.tga"
Incbin "..\daten\sheepworld\window_credits.tga"
Incbin "..\daten\sheepworld\button_off.tga"
Incbin "..\daten\sheepworld\button_on.tga"
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

'---------------------------------------------------------  CARDS DECK 1 -------------------------------------------------
Incbin "..\daten\images\cards\card_ss_0010_4_01.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_01.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_01.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_01.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_02.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_02.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_02.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_02.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_03.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_03.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_03.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_03.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_04.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_04.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_04.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_04.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_05.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_05.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_05.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_05.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_06.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_06.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_06.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_06.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_07.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_07.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_07.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_07.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_08.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_08.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_08.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_08.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_09.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_09.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_09.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_09.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_10.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_10.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_10.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_10.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_11.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_11.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_11.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_11.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_12.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_12.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_12.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_12.tga"					

Incbin "..\daten\images\cards\card_ss_0010_4_13.tga"					
Incbin "..\daten\images\cards\card_ss_0010_1_13.tga"					
Incbin "..\daten\images\cards\card_ss_0010_2_13.tga"
Incbin "..\daten\images\cards\card_ss_0010_3_13.tga"					

'---------------------------------------------------------  CARDS DECK 2 -------------------------------------------------
Incbin "..\daten\images\cards\card_ss_0020_4_01.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_01.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_01.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_01.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_02.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_02.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_02.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_02.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_03.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_03.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_03.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_03.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_04.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_04.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_04.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_04.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_05.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_05.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_05.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_05.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_06.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_06.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_06.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_06.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_07.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_07.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_07.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_07.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_08.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_08.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_08.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_08.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_09.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_09.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_09.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_09.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_10.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_10.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_10.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_10.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_11.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_11.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_11.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_11.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_12.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_12.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_12.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_12.tga"					

Incbin "..\daten\images\cards\card_ss_0020_4_13.tga"					
Incbin "..\daten\images\cards\card_ss_0020_1_13.tga"					
Incbin "..\daten\images\cards\card_ss_0020_2_13.tga"
Incbin "..\daten\images\cards\card_ss_0020_3_13.tga"					
'---------------------------------------------------------  CARDS DECK 3-------------------------------------------------
Incbin "..\daten\images\cards\card_ss_0030_4_01.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_01.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_01.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_01.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_02.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_02.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_02.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_02.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_03.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_03.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_03.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_03.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_04.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_04.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_04.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_04.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_05.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_05.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_05.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_05.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_06.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_06.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_06.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_06.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_07.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_07.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_07.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_07.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_08.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_08.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_08.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_08.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_09.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_09.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_09.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_09.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_10.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_10.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_10.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_10.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_11.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_11.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_11.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_11.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_12.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_12.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_12.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_12.tga"					

Incbin "..\daten\images\cards\card_ss_0030_4_13.tga"					
Incbin "..\daten\images\cards\card_ss_0030_1_13.tga"					
Incbin "..\daten\images\cards\card_ss_0030_2_13.tga"
Incbin "..\daten\images\cards\card_ss_0030_3_13.tga"					
				
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

Incbin "..\daten\images\cards\back_biene.tga"					
Incbin "..\daten\images\cards\back_blumen.tga"					
Incbin "..\daten\images\cards\back_herzen.tga"					
Incbin "..\daten\images\cards\back_schafe_2.tga"					
Incbin "..\daten\images\cards\back_schafe_b.tga"					
Incbin "..\daten\images\cards\back_schafe_k.tga"					
Incbin "..\daten\images\cards\back_schafe_r.tga"					
Incbin "..\daten\images\cards\back_sonne.tga"					
Incbin "..\daten\images\cards\back_wiese.tga"					

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
'Incbin "..\daten\images\springspinne00_roh.tga"

Incbin "..\daten\sheepworld\bee_summer00.tga"
Incbin "..\daten\sheepworld\bee_summer01.tga"
Incbin "..\daten\sheepworld\bee_summer02.tga"
Incbin "..\daten\sheepworld\bee_summer03.tga"
'Incbin "..\daten\sheepworld\bee_winter00.tga"
'Incbin "..\daten\sheepworld\bee_winter01.tga"
'Incbin "..\daten\sheepworld\bee_winter02.tga"
'Incbin "..\daten\sheepworld\bee_winter03.tga"
Incbin "..\daten\sheepworld\bee_summer00s.tga"
Incbin "..\daten\sheepworld\bee_summer01s.tga"
Incbin "..\daten\sheepworld\bee_summer02s.tga"
Incbin "..\daten\sheepworld\bee_summer03s.tga"
'Incbin "..\daten\sheepworld\bee_winter00s.tga"
'Incbin "..\daten\sheepworld\bee_winter01s.tga"
'Incbin "..\daten\sheepworld\bee_winter02s.tga"
'Incbin "..\daten\sheepworld\bee_winter03s.tga"
Incbin "..\daten\sheepworld\snake_summer00.tga"
Incbin "..\daten\sheepworld\snake_summer01.tga"
Incbin "..\daten\sheepworld\snake_summer02.tga"
Incbin "..\daten\sheepworld\snake_summer03.tga"
'Incbin "..\daten\sheepworld\snake_winter00.tga"
'Incbin "..\daten\sheepworld\snake_winter01.tga"
'Incbin "..\daten\sheepworld\snake_winter02.tga"
'Incbin "..\daten\sheepworld\snake_winter03.tga"
'Incbin "..\daten\sheepworld\moon00.tga"
'Incbin "..\daten\sheepworld\moon01.tga"
'Incbin "..\daten\sheepworld\moon02.tga"
'Incbin "..\daten\sheepworld\moon03.tga"
'Incbin "..\daten\sheepworld\sun00.tga"
'Incbin "..\daten\sheepworld\sun01.tga"
'Incbin "..\daten\sheepworld\sun02.tga"
'Incbin "..\daten\sheepworld\sun03.tga"
Incbin "..\daten\sheepworld\nuage2_00.tga"
Incbin "..\daten\sheepworld\nuage2_01.tga"
Incbin "..\daten\sheepworld\nuage2_02.tga"
Incbin "..\daten\sheepworld\nuage2_03.tga"
Incbin "..\daten\sheepworld\nuage2_04.tga"
Incbin "..\daten\sheepworld\nuage2_05.tga"
'Incbin "..\daten\sheepworld\smallstar00.tga"
'Incbin "..\daten\sheepworld\smallstar01.tga"
'Incbin "..\daten\sheepworld\smallstar02.tga"
'Incbin "..\daten\sheepworld\butterfly_winter00.tga"
'Incbin "..\daten\sheepworld\butterfly_winter01.tga"
'Incbin "..\daten\sheepworld\butterfly_winter02.tga"
'Incbin "..\daten\sheepworld\butterfly_winter03.tga"
Incbin "..\daten\sheepworld\butterfly_summer00.tga"
Incbin "..\daten\sheepworld\butterfly_summer01.tga"
Incbin "..\daten\sheepworld\butterfly_summer02.tga"
Incbin "..\daten\sheepworld\butterfly_summer03.tga"
'Incbin "..\daten\sheepworld\butterflyNB00.tga"
'Incbin "..\daten\sheepworld\butterflyNB01.tga"
'Incbin "..\daten\sheepworld\butterflyNB02.tga"
'Incbin "..\daten\sheepworld\butterflyNB03.tga"
'Incbin "..\daten\sheepworld\butterflyNB00s.tga"
'Incbin "..\daten\sheepworld\butterflyNB01s.tga"
'Incbin "..\daten\sheepworld\butterflyNB02s.tga"
'Incbin "..\daten\sheepworld\butterflyNB03s.tga"
'Incbin "..\daten\sheepworld\cocci00.tga"
'Incbin "..\daten\sheepworld\cocci01.tga"
'Incbin "..\daten\sheepworld\cocci02.tga"
'Incbin "..\daten\sheepworld\cocci03.tga"

'Incbin "..\daten\sheepworld\cocci00s.tga"
'Incbin "..\daten\sheepworld\cocci01s.tga"
'Incbin "..\daten\sheepworld\cocci02s.tga"
'Incbin "..\daten\sheepworld\cocci03s.tga"

Incbin "..\daten\sheepworld\sonne_0000.tga"
Incbin "..\daten\sheepworld\sonne_0001.tga"
Incbin "..\daten\sheepworld\sonne_0002.tga"
Incbin "..\daten\sheepworld\sonne_0003.tga"
Incbin "..\daten\sheepworld\sonne_0005.tga"
Incbin "..\daten\sheepworld\sonne_0006.tga"
Incbin "..\daten\sheepworld\sonne_0007.tga"


Incbin "..\daten\sheepworld\zZZ_0008_Frame 1.tga"
Incbin "..\daten\sheepworld\zZZ_0007_Frame 2.tga"
Incbin "..\daten\sheepworld\zZZ_0006_Frame 3.tga"
Incbin "..\daten\sheepworld\zZZ_0005_Frame 4.tga"
Incbin "..\daten\sheepworld\zZZ_0004_Frame 5.tga"
Incbin "..\daten\sheepworld\zZZ_0003_Frame 6.tga"
Incbin "..\daten\sheepworld\zZZ_0002_Frame 7.tga"
Incbin "..\daten\sheepworld\zZZ_0001_Frame 8.tga"
Incbin "..\daten\sheepworld\zZZ_0000_Frame 9.tga"


Incbin "..\daten\sheepworld\grasend_seite_0000.tga"
Incbin "..\daten\sheepworld\grasend_seite_0001.tga"
Incbin "..\daten\sheepworld\grasend_seite_0002.tga"
Incbin "..\daten\sheepworld\grasend_seite_0007.tga"
Incbin "..\daten\sheepworld\grasend_seite_0009.tga"
Incbin "..\daten\sheepworld\grasend_seite_0011.tga"

Incbin "..\daten\sheepworld\grasend_hinten_00.tga"
Incbin "..\daten\sheepworld\grasend_hinten_01.tga"
Incbin "..\daten\sheepworld\grasend_hinten_02.tga"
Incbin "..\daten\sheepworld\grasend_hinten_03.tga"
Incbin "..\daten\sheepworld\grasend_hinten_04.tga"
Incbin "..\daten\sheepworld\grasend_hinten_05.tga"
Incbin "..\daten\sheepworld\grasend_hinten_06.tga"
Incbin "..\daten\sheepworld\grasend_hinten_08.tga"

Incbin "..\daten\sheepworld\logo.tga"

'------------------- load screen -------------------
Incbin "..\daten\sheepworld\sheepload00.tga"
Incbin "..\daten\sheepworld\sheepload01.tga"
Incbin "..\daten\sheepworld\sheepload02.tga"
Incbin "..\daten\sheepworld\loadscreen2.png"


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





'******************************************************************************************************************
'										A N I M A T I O N S H E E P 
'******************************************************************************************************************
Type _animationsheep
	Field link:TLink=Null
	Field solitaire:_solitairesheepworld=Null
	Field mesh:_mesh=Null
	Field position:_vector3=Null
	Field scale#=1
	Field vx#=0
	Field vy#=0
	Field invers=False
	Field curvelist:TList=Null
	Field iterator:TLink=Null
	Field index=0
	Field speed#=4
	Field speedtolerance#=1
	Field curving:Int=True
	Field curvespeed#=3
	Field curvetime:Int=0	
	Field curvet#=0
	Field vector:_vector3=Null
	Field rotation#=Null

	Field akku=0
	Field ot#=0
	Field lauf=0

	Method New()
				curvelist=CreateList()
				position=New _Vector3
				vector=New _vector3
				EndMethod
	Method initsheep(s:_solitairesheepworld)
				'position.copy(o)
				solitaire=s
				link=solitaire.animationlist.addlast(Self)
				EndMethod
	Method initcurvefly()
				'planloses rumfliegen
				Local c=Rand(2,5)
				Local cit:_hermitecurve
				Local prev:_hermitecurve=Null
				Local o:_vector3=New _vector3
				'o.copy(outerposition())
				'Print "outerx="+o.x
				'Print "outery="+o.y
				'Print "outerz="+o.z
				'Print solitaire.gra.screenw
				'Print solitaire.gra.screenh
				'o.y=500
				'o.x=200
				'o.z=-1
				'--------------------------
				Local v:_vector3=New _vector3
				Local valid=True
				Repeat
				 v.set(Rnd(-300,300+solitaire.gra.screenw),Rnd(-100,100+solitaire.gra.screenh),-1)
				 valid=True
				 If v.x>-100 And v.x<solitaire.gra.screenw+100 And v.y>-50 And v.y<solitaire.gra.screenh+50 valid=False
				Until valid				
				o.copy(v)
				'------------------
				For Local i=0 To c-1 
				 cit=New _hermitecurve
				 If prev
				  cit.o0.copy(prev.o1)
				  cit.v0.copy(prev.v1)
				 Else
				  cit.o0.copy(o)
				  cit.v0.set(0,0,0)
				  position.copy(o)
				 EndIf
				 cit.o1.set(Rnd(-300,solitaire.gra.screenw+300),Rnd(-100,solitaire.gra.screenh+100),-1)
				 cit.v1.set(Rnd(-100,100),Rnd(-100,100),0)
				 If i=c-1
				  'cit.o1.copy(outerposition())
				  'o.y=100
				  'o.x=500
				  'o.z=-1			
				  '--------------------------
				  Local v:_vector3=New _vector3
				  Local valid=True
				  Repeat
				   v.set(Rnd(-300,300+solitaire.gra.screenw),Rnd(-100,100+solitaire.gra.screenh),-1)
				   valid=True
				   If v.x>-100 And v.x<solitaire.gra.screenw+100 And v.y>-50 And v.y<solitaire.gra.screenh+50 valid=False
				  Until valid				
				  o.copy(v)
				  '------------------
				  cit.o1.copy(o)
	
				 EndIf
				 cit.updatelength()
				 curvelist.addlast(cit)
				 prev=cit
			 	Next
				scale=7
			    speed=100
			    speedtolerance=1
				EndMethod			
	Method initcurvehorizontal(ymin#,ymax#,zmin#,zmax#,onedir=False,xmin#=130,xmax#=130)
				Local cit:_hermitecurve
				Local prev:_hermitecurve=Null
				cit=New _hermitecurve
				Local r
				If onedir 
				 r=1 
				Else 
				 r=Rand(0,1)
				 If r=0 r=-1
				EndIf
				If r=1 
				 cit.o0.set(solitaire.gra.screenw+xmin+Rnd(0,xmax-xmin),Rnd(ymin,ymax),0)'Rnd(-5,-1))
				 cit.o1.set(-200,cit.o0.y+Rnd(-2,2),0)
				EndIf
				If r=-1 
				 cit.o0.set(-200,Rnd(ymin,ymax),0)'Rnd(-5,-1))
			 	 cit.o1.set(solitaire.gra.screenw+xmin+Rnd(0,xmax-xmin),cit.o0.y+Rnd(-2,2),0)'Rnd(-5,-1))
			    EndIf

				 
				'cit.o1.copy(cit.o0)
				'cit.o1.x:*-1
				'cit.o1.y:+Rnd(-2,2)
				cit.v0.set(0,0,0)
				cit.v1.set(50*-r,0,0)
				cit.updatelength()
				curvelist.addlast(cit)
				position.copy(cit.o0)
				speed=30
				speedtolerance=0.6
				scale=4
				EndMethod					
	Method initcurvekriechen()
				'planloses KRIECHEN
				Local c=Rand(2,7)
				Local cit:_hermitecurve
				Local prev:_hermitecurve=Null
				Local o:_vector3=New _vector3
				o.copy(outerposition())
				For Local i=0 To c-1 
				 cit=New _hermitecurve
				 If prev
				  cit.o0.copy(prev.o1)
				  cit.v0.copy(prev.v1)
				 Else
				  cit.o0.copy(o)
				  cit.v0.set(0,0,0)
				  position.copy(o)
				 EndIf
				 cit.o1.set(Rnd(-26,26),Rnd(-10,10),2)
				 cit.v1.set(Rnd(-100,100),Rnd(-100,100),0)
				 cit.updatelength()
				 curvelist.addlast(cit)
				 prev=cit
				 If i=c-1
				  cit.o1.copy(outerposition())
				 EndIf
			 	Next
			    speed=1
			    speedtolerance=.5
				scale=4'Rnd(1,2)
				EndMethod				
	Method initmesh(tex:_texture,vvx#=1,vvy#=1)				
				Local gg:_geometrygrid=New _geometrygrid
				gg.texture[0,0]=tex
				gg.texture[1,0]=tex
				gg.position.copy(position)
				gg.color.set(1,1,1,1)
				Local ratio#=ImageWidth(tex.image)/ImageHeight(tex.image)
				vx=vvx'1
				vy=vvy'/ratio
				vx:*scale
				vy:*scale
				gg.vx.set(vx,0,0)
				gg.vy.set(0,vy,0)
				'gg.tvy[0].y:*-1
				gg.resolution[0]=1
				gg.resolution[1]=1
				mesh=gg.Create()
				mesh.twosided(True)
				iterator=curvelist.firstlink()
				curvetime=solitaire.clock.ms()
				curvespeed=speed+Rnd(-speedtolerance,speedtolerance)
				mesh.visible(True)
				mesh.blend(True)
				mesh.blendadditive(False)
				updatemesh()
				EndMethod
	Method outerposition:_vector3()
				Local v:_vector3=New _vector3
				Local valid
				Repeat
				 v.set(Rnd(-300,300+solitaire.gra.screenw),Rnd(-100,100+solitaire.gra.screenh),Rnd(0,-15))
				 valid=True
				 If v.x>-100 And v.x<solitaire.gra.screenw+100 And v.y>-50 And v.y<solitaire.gra.screenh+50 valid=False
				Until valid
				Return(v)
				EndMethod
	Method upperposition:_vector3()
				Local v:_vector3=New _vector3
				Local valid
				Repeat
				 v.set(Rnd(-35,35),Rnd(8,26),Rnd(0,-15))
				 valid=True
				 If v.x>-26 And v.x<26 valid=False
				Until valid
				Return(v)
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
				Local vvx:_vector3=New _vector3
				Local vvy:_vector3=New _vector3
				Local hvx:_vector3=New _vector3
				Local hvy:_vector3=New _vector3
				hvx.set(vx,0,0)
				hvy.set(0,vy,0)
				If invers hvx.mul(-1)
				n.copy(hvx)
				n.crossproduct(hvy)
				n.norm()
				rotatevector(n,hvx,rotation,vvx)
				rotatevector(n,hvy,rotation,vvy)
				For pit=EachIn mesh.polygonlist
				 For vit=EachIn pit.vertexlist
				  If i=0 
				   h.copy(vvx)
				   h.mul(-0.5)
				   k.copy(vvy)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(position)
				   vit.set(h)
				  ElseIf i=1
				   h.copy(vvx)
				   h.mul(+0.5)
				   k.copy(vvy)
				   k.mul(-0.5)
				   h.add(k)
				   h.add(position)
				   vit.set(h)
				  ElseIf i=2
				   h.copy(vvx)
				   h.mul(+0.5)
				   k.copy(vvy)
				   k.mul(+0.5)
				   h.add(k)
				   h.add(position)
				   vit.set(h)
				  ElseIf i=3
				   h.copy(vvx)
				   h.mul(-0.5)
				   k.copy(vvy)
				   k.mul(+0.5)
				   h.add(k)
				   h.add(position)
				   vit.set(h)
				  EndIf 
				  i:+1
				 Next
				 pit.update()
				Next
				mesh.update()	
				EndMethod				
	Method animatecurve(clock:_clock)
				Local newtime#=clock.ms()
				Local deltat#=Float(newtime-curvetime)/1000.0#
				curvetime=newtime
				If iterator
				 

				 Local oldx#=position.x
				 Local h:_vector3=New _vector3
				 Local mach=True
				
				
			 	 Local curveposition:_hermitecurve=_hermitecurve(iterator.value())
				 If curving
				  If curvet<1
				   curveposition.calculate(curvet)
				   Local deltal#=curvespeed*deltat
				   Local dt#
				   If curveposition.curvelength<nearzero
				    dt=1
				   Else 				
				    dt=(deltal/curveposition.curvelength)
				   EndIf
				   curvet:+dt
				   h.copy(curveposition.e)
				   h.sub(position)
				   h.mul(0.2)
				   vector.add(h)
				   position.copy(curveposition.e)
				  Else
				   iterator=iterator.nextlink()
				   While curvet>1 
				    curvet:-1
				   Wend
				   curvespeed=speed+Rnd(-speedtolerance,speedtolerance)
				   'h.copy(curveposition.e)
				   'h.sub(position)
				   'vector.add(h)
				   'position.copy(curveposition.o1)
				   If iterator=Null
				    curving=False
				    linklist.addlast(link)
				   Else
				    curveposition=_hermitecurve(iterator.value())
				    curveposition.calculate(curvet)
				    h.copy(curveposition.e)
				    h.sub(position)
				    h.mul(0.2)
				    vector.add(h)
					position.copy(curveposition.e)
					mach=False
				   EndIf
				  EndIf				  
				 EndIf
				 If mach
				  Local dx#=position.x-oldx
				  If dx>+nearzero*10 invers=True 
				  If dx<-nearzero*10 invers=False
				 EndIf
				 vector.mul(0.8)
				EndIf
				EndMethod
	Method updatetexture()Abstract
	Method animate(clock:_clock)Abstract
	Method draw(gra:_graphics,cam:_camera,mode)Abstract
	EndType
'******************************************************************************************************************
'										A N I M A T I O N B E E
'******************************************************************************************************************
Type _animationbee Extends _animationsheep
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				initcurvefly()
				scale=90
				speed=120
				speedtolerance=60
				initmesh(s.tbee[0,0])
				
				mesh.cull(False)
				akku=0
				index=0
				ot=s.clock.ms()				
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=1
				 If mesh 
				  gra.enabletext2d()
				  gra.wrap(True)
		 		  mesh.draw(gra,cam)
		 		  solitaire.world.transform(gra,cam)
				 EndIf
				EndIf
				EndMethod	
	Method updatetexture()
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tbee[0,index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.cardanimation=False Or solitaire.currentscene=0 Or solitaire.currentscene=3 Or solitaire.currentscene=2 Or solitaire.currentscene=4 linklist.addlast(link)
				animatecurve(clock)
				index:+1
				If index>5 index=0
				updatetexture()
				updatemesh()
				EndMethod
	EndType
'******************************************************************************************************************
'										A N I M A T I O N Z Z Z
'******************************************************************************************************************
Type _animationzzz Extends _animationsheep
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				Local r=0
				Local t=Rand(0,3)
				Local gibt=False
				Repeat
				 If t=0 position.set(s.gra.screenw*0.52,s.gra.screenh*0.52,0)
				 If t=1 position.set(s.gra.screenw*0.2,s.gra.screenh*0.25,0)
				 If t=2 position.set(s.gra.screenw*0.85,s.gra.screenh*0.05,0)
				 If t=3 position.set(s.gra.screenw*0.9,s.gra.screenh*0.7,0)
				 gibt=False
				 For Local ait:_animationsheep=EachIn s.animationlist
			      Local zzz:_animationzzz=_animationzzz(ait)
			      If zzz And zzz<>Self
			   	   If zzz.position.equal(position,nearzero) gibt=True
			      EndIf
			     Next				
			     r:+1
			     t:+1
			     If t>3 t=0
				Until gibt=False Or r>3
				scale=155'Rnd(1,2)
				lauf=Rand(2,5)
				Local ratio#=ImageWidth(s.tzzz[0].image)/ImageHeight(s.tzzz[0].image)
				Local o#=1
				initmesh(s.tzzz[0],o,o/ratio)
				mesh.cull(False)
				akku=0
				index=0
				ot=s.clock.ms()
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
				  gra.enabletext2d()
				  gra.wrap(True)
		 		  If lauf mesh.draw(gra,cam)
		 		  solitaire.world.transform(gra,cam)
			 	 EndIf
				EndIf
				EndMethod	
	Method updatetexture()				
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tzzz[index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.cardanimation=False Or solitaire.night()=False Or lauf=0 linklist.addlast(link)
				Local nt#=clock.ms()
				Local dt#=nt-ot
				ot=nt
				akku:+dt 
				If lauf>0
				 If akku>200
				  While akku>200
				   akku:-200
				  Wend
				  index:+1
				  If index>8
				   index=0
				   lauf:-1 
				  EndIf
				  updatetexture()
				 EndIf
				EndIf
				'updatemesh()
				EndMethod
	EndType		
'******************************************************************************************************************
'										A N I M A T I O N B U T T E R F L Y
'******************************************************************************************************************
Type _animationbutterfly Extends _animationsheep
	Field odiad=False
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld,m=False)
				initsheep(s)
				initcurvefly()
	  			odiad=m
				scale=140
				Local r#=ImageWidth(s.tbutterfly[0,0].image)/ImageHeight(s.tbutterfly[0,0].image)
				Local o#=1
			    initmesh(s.tbutterfly[0,0],o,o/r)
				mesh.cull(False)
				akku=0
				index=0
				ot=s.clock.ms()				
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=1
				 If mesh 
				  gra.enabletext2d()
				  gra.wrap(True)
		 		  mesh.draw(gra,cam)
		 		  solitaire.world.transform(gra,cam)
				 EndIf
				EndIf
				EndMethod	
	Method updatetexture()
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tbutterfly[0,index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.cardanimation=False Or solitaire.currentscene<>2 linklist.addlast(link)
				animatecurve(clock)
				index:+1
				If index>5 index=0
				updatetexture()
				updatemesh()
				EndMethod
	EndType
'******************************************************************************************************************
'										A N I M A T I O N S N A K E
'******************************************************************************************************************
Type _animationsnake Extends _animationsheep
	Field akku=0
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				initcurvehorizontal(-150,solitaire.gra.screenh+150,-2,-1)
				scale=110
				speedtolerance=5
				Local r#=ImageWidth(s.tsnake[0,0].image)/ImageHeight(s.tsnake[0,0].image)
				Local o#=1
				initmesh(s.tsnake[0,0],o,o/r)
				mesh.cull(False)
				akku=0
				index=0
				ot=s.clock.ms()				
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
				  gra.enabletext2d()
				  gra.wrap(True)
		 		  mesh.draw(gra,cam)
		 		  solitaire.world.transform(gra,cam)
			 	 EndIf
				EndIf
				EndMethod	
	Method updatetexture()
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tsnake[0,index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.cardanimation=False Or solitaire.currentscene<>2 linklist.addlast(link)
				animatecurve(clock)
				If akku<4
				 akku:+1
				Else
				 index:+1
				 If index>3 index=0
				 akku=0
				 updatetexture()
				EndIf
				updatemesh()
				EndMethod
	EndType
'******************************************************************************************************************
'										A N I M A T I O N N U A G E
'******************************************************************************************************************
Type _animationnuage Extends _animationsheep
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				initcurvehorizontal(50,300,-2,-1,True,-50,700)
				scale=Rnd(80,150)
				speedtolerance=20
				initmesh(s.tnuage[Rand(0,5)],1,0.5)
				mesh.cull(False)
				akku=0
				index=0
				ot=s.clock.ms()				
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
				  gra.enabletext2d()
				  gra.wrap(True)
		 		  mesh.draw(gra,cam)
		 		  solitaire.world.transform(gra,cam)
			 	 EndIf
				EndIf
				EndMethod	
	Method updatetexture()				
				EndMethod
	Method animate(clock:_clock)
				If solitaire.cardanimation=False Or solitaire.currentscene<>0 linklist.addlast(link)
				animatecurve(clock)
				updatemesh()
				EndMethod
	EndType	
'******************************************************************************************************************
'										A N I M A T I O N C O C C I 
'******************************************************************************************************************
Type _animationcocci Extends _animationsheep
	Field akku=0
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				initcurvekriechen()
				initmesh(s.tcocci[0])
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
				  mesh.draw(gra,cam)
				 EndIf
				EndIf
				EndMethod	
	Method updatetexture()
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tcocci[index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.cardanimation=False Or solitaire.odiad()=False linklist.addlast(link)
				animatecurve(clock)
				If akku<4
				 akku:+1
				Else
				 akku=0
				 index:+1
				 If index>5 index=0
				 updatetexture()
				EndIf
				updatemesh()
				EndMethod
	EndType
'******************************************************************************************************************
'										A N I M A T I O N S U N
'******************************************************************************************************************
Type _animationsun Extends _animationsheep
	Field akku=0
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				position.set(Rnd(-70,70),Rnd(50,70),Rnd(60,70))
				scale=Rnd(20,25)
				initmesh(s.tsun[0])
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
		 		  mesh.draw(gra,cam)
			 	 EndIf
				EndIf
				EndMethod	
	Method updatetexture()				
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tsun[index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.odiad() Or solitaire.night() Or solitaire.currentscene=3 Or solitaire.currentscene=0 linklist.addlast(link)
				 If akku<8
				  akku:+1
				 Else
				  akku=0
				  index:+1
				  If index>5 
				   index=0
				  EndIf
				  updatetexture()
				 EndIf
				updatemesh()
				EndMethod
	EndType		
'******************************************************************************************************************
'										A N I M A T I O N M O O N
'******************************************************************************************************************
Type _animationmoon Extends _animationsheep
	Field akku=0
	Field blink=False
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				position.set(Rnd(-30,30),Rnd(30,40),Rnd(60,70))
				scale=Rnd(20,25)
				initmesh(s.tmoon[0])
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
		 		  mesh.draw(gra,cam)
			 	 EndIf
				EndIf
				EndMethod	
	Method updatetexture()				
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tmoon[index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.night()=False linklist.addlast(link)
				If Rand(0,500)=10 And blink=False
				 blink=True
				 akku=0
				EndIf
				If blink
				 If akku<10
				  akku:+1
				 Else
				  akku=0
				  index:+1
				  If index>5 
				   index=0
				   blink=False
				  EndIf
				  updatetexture()
				 EndIf
				EndIf
				updatemesh()
				EndMethod
	EndType		
'******************************************************************************************************************
'										A N I M A T I O N G R A S E N D S E I T E 
'******************************************************************************************************************
Type _animationgrasendseite Extends _animationsheep
	Field blink=False
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				position.set(s.gra.screenw*0.6,s.gra.screenh*0.7,0)
				scale=216
				initmesh(s.tgrasendseite[0],1,0.8)
				mesh.twosided(True)
				mesh.cull(False)
				akku=0
				index=0
				ot=s.clock.ms()				
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
				  gra.enabletext2d()
				  gra.wrap(True)
		 		  mesh.draw(gra,cam)
		 		  solitaire.world.transform(gra,cam)
			 	 EndIf
				EndIf
				EndMethod	
	Method updatetexture()				
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tgrasendseite[index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.grasend()=False linklist.addlast(link)
				If Rand(0,200)=10 And blink=False And solitaire.cardanimation
				 blink=True
				 akku=0
				 ot=clock.ms()
				 lauf=Rand(1,6)
				EndIf
				position.set(solitaire.gra.screenw*0.6,solitaire.gra.screenh*0.7,0)
				Local nt#=clock.ms()
				Local dt#=nt-ot
				akku:+dt
				ot=nt
				If blink
				 If akku>150
				  While akku>150
				   akku:-150
				  Wend
				  index:+1
				  If index>15 
				   index=0
				   lauf:-1
				   If lauf=0 blink=False
				  EndIf
				  updatetexture()
				 EndIf
				EndIf
				updatemesh()
				EndMethod
	EndType			
'******************************************************************************************************************
'										A N I M A T I O N G R A S E N D H I N T E N
'******************************************************************************************************************

Type _animationgrasendhinten Extends _animationsheep
	Field blink=False
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				position.set(s.gra.screenw*0.4,s.gra.screenh*0.4,0)
				scale=150
				initmesh(s.tgrasendhinten[0],1,0.9)
				mesh.cull(False)
				ot=s.clock.ms()
				index=0
				akku=0
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
				  gra.enabletext2d()
				  gra.wrap(True)
		 		  mesh.draw(gra,cam)
		 		  solitaire.world.transform(gra,cam)
			 	 EndIf
				EndIf
				EndMethod	
	Method updatetexture()				
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tgrasendhinten[index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.grasend()=False linklist.addlast(link)
				If Rand(0,200)=10 And blink=False And solitaire.cardanimation
				 blink=True
				 akku=0
				 ot=clock.ms()
				 lauf=Rand(1,6)
				EndIf
				position.set(solitaire.gra.screenw*0.4,solitaire.gra.screenh*0.4,0)
				Local nt#=clock.ms()
				Local dt#=nt-ot
				akku:+dt
				ot=nt
				If blink
				 If akku>150
				  While akku>150
				   akku:-150
				  Wend
				 'Else
				 ' akku=0
				  index:+1
				  If index>22 
				   index=0
				   lauf:-1
				   If lauf=0 blink=False
				  EndIf
				  updatetexture()
				 EndIf
				EndIf
				updatemesh()
				EndMethod
	EndType			
'******************************************************************************************************************
'										A N I M A T I O N S O N N E 
'******************************************************************************************************************

Type _animationsonne Extends _animationsheep
	Field blink=False
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				position.set(s.gra.screenw*0.68,s.gra.screenh*0.339,0)
				scale=215
				initmesh(s.tsonne[0],1,1)
				mesh.cull(False)
				ot=s.clock.ms()
				akku=0
				index=0
				blink=True
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
				  gra.enabletext2d()
				  gra.wrap(True)
		 		  mesh.draw(gra,cam)
		 		  solitaire.world.transform(gra,cam)
			 	 EndIf
				EndIf
				EndMethod	
	Method updatetexture()				
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tsonne[index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.currentscene<>0 Or solitaire.cardanimation=False linklist.addlast(link)
				'If Rand(0,200)=10 And blink=False And solitaire.cardanimation
				' blink=True
				' akku=0
				' ot=clock.ms()
				' lauf=Rand(1,6)
				'EndIf
				Local vv#=Float(215)/Float(800)
				vx=vv*solitaire.gra.screenw
				vy=vv*solitaire.gra.screenw
				position.set(solitaire.gra.screenw*0.68,solitaire.gra.screenh*0.339,0)
				Local nt#=clock.ms()
				Local dt#=nt-ot
				akku:+dt
				ot=nt
				
				If blink
				 If akku>150
				  While akku>150
				   akku:-150
				  Wend
				 'Else
				 ' akku=0
				  index:+1
				  If index>15 
				   index=0
				   'lauf:-1
				   'If lauf=0 blink=True
				  EndIf
				  updatetexture()
				 EndIf
				EndIf
				updatemesh()
				EndMethod
	EndType	
'******************************************************************************************************************
'										A N I M A T I O N S T A R 
'******************************************************************************************************************
Type _animationstar Extends _animationsheep
	Field akku=0
	Field akkumax=Rand(10,20)
	Method New()
				EndMethod
	Method init(s:_solitairesheepworld)
				initsheep(s)
				position.set(Rnd(-26,26),Rnd(-25,25),20)
				scale=Rnd(2,3)
				initmesh(s.tsmallstar[0])
				EndMethod				
	Method draw(gra:_graphics,cam:_camera,mode)
				If mode=0
				 If mesh 
		 		  mesh.draw(gra,cam)
			 	 EndIf
				EndIf
				EndMethod	
	Method updatetexture()				
				For Local pit:_polygon=EachIn mesh.polygonlist
				 pit.texture[0,0]=solitaire.tsmallstar[index]
				 pit.texture[1,0]=pit.texture[0,0]
				Next
				EndMethod
	Method animate(clock:_clock)
				If solitaire.night()=False linklist.addlast(link)
				If akku<akkumax
				 akku:+1
				Else
				 akku=0
				 index:+1
				 If index>3 
				  index=0
				  linklist.addlast(link)
				 EndIf
				 updatetexture()
				EndIf
				updatemesh()
				EndMethod
	EndType		

'******************************************************************************************************************
'										S O L I T A I R E
'******************************************************************************************************************
Type _solitairesheepworld Extends _solitaire
	'------------------------------------- standard data 


	

	

	'Field demoplay:Int=False
	'Field demoplaylasttime#=0
	'Field lastuser$=""
	'Field gamedelaytime#=0
	'---------------------------------- game textures 
	'Field tcardpreview:_texture[3,4]


	'------------------------------------ pause data
	'Field blendscreenopacity#=0
	'Field blendscreen:timage=Null
	'Field starttimepause#=0
	'------------------------------------effects
	Field background:_background=Null
	Field candlelist:TList=Null'menue
	Field pagelist:TList=Null'menue
	Field dyn:_texture=Null




	Field candlegamelist:TList=Null'menue
	Field candlemenulist:TList=Null'menue	
	Field fireworksheepcards:_fireworksheepcards=Null
	Field fireworkcards:_fireworkcards=Null
	Field fireworkrocket:_fireworkrocket=Null
	Field fireworksheepimage:_fireworksheepimage=Null
	Field t0:_texture=Null
	Field t1:_texture=Null
	Field sceneambient:_vector3[5]
	Field scenediffuse:_vector3[5]
	'Field tblume:_texture[4]
	'------------------------------------------ animation images and textures	
	Field ischnecke:timage=Null
	Field istern:timage=Null
	Field tbee:_texture[2,6]
	Field ibee:timage[2,6]
	Field tsnake:_texture[2,6]
	Field tbutterfly:_texture[3,6]
	Field ibutterfly:timage[6]
	Field tnuage:_texture[6]
	Field tcocci:_texture[6]
	Field icocci:timage[6]
	Field tmoon:_texture[6]
	Field tsun:_texture[6]
	Field tsmallstar:_texture[4]
	Field tsonne:_texture[16]
	Field tzzz:_texture[9]
	Field tgrasendseite:_texture[16]
	Field tgrasendhinten:_texture[23]
	Field ilogo:timage=Null
	'------------------------------------------ gui data
	Field ilistboxl:timage=Null
	Field iscrollbar:timage=Null
	Field imenubackground:timage[6]
	Field iguiwindow:timage=Null
	Field icredits:timage=Null
	Field iwindow240204:timage=Null
	Field ibuttons:TImage=Null
	Field ibuttonshl:TImage=Null
	Field ibuttonl:TImage=Null
	Field ibuttonlhl:TImage=Null
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
	'--------------------------------------- sounds

	



	'---------------------------------------load screen	
	'Field iloadscreen:timage=Null
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
	'Field hWnd% ' Save current Window handle
	'Field menumain:_menu=Null
	Rem
	Field menugame:_menu=Null
	Field menuoptionslast:_menu=Null
	Field menuoptionsacoustics:_menu=Null
	Field menuoptionsgraphics:_menu=Null
	Field menuoptionsgame:_menu=Null
	Field menuoptionscard:_menu=Null
	Field menuoptionscredits:_menu=Null
	Field menugametype:_menu=Null
	Field menuman:_menumanagement=Null
	Field menuopacity#=0.9
	Field menucameraposition:_vector3=Null
	Field trackbarlist:TList=Null
	Field checkboxlist:TList=Null
	Field listboxlist:TList=Null
	Field editboxlist:TList=Null
	Field optionscalledfromgame:Int=False	
	EndRem

	'---------------------------------------mainmenu
	Field buttonwidth#=150
	Field buttonheight#=50	
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

	Method drawloadscreen()
				Local o:_vector3=New _vector3
				Local c:_vector4=New _vector4
				Local h$="sheepworld Solitaire wird geladen."
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
				
				
				
				o.set(gra.screenw/2-TextWidth(h)/2-70,gra.screenh/2-TextHeight(h)/2-30,1)
				c.set(0.8,0.8,0.8,1)
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
				AppTitle="sheepworld Solitaire"
				gametypecount=38
				SeedRnd MilliSecs()
				sheeploadindex=Rand(0,15)
				loadoptions("sheepworldoptions.sol")
				mouseoverpile=False
				
				guisystem=New _guisystem
				guisystem.init(1024,768)
				graphics_setup()
				gra.enabletext2d()
				iloadscreen=LoadImageassert("incbin::..\daten\sheepworld\loadscreen2.png")
				
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
				
				
				'sheepload[0]=LoadImageassert("incbin::..\daten\sheepworld\sheepload00.tga")
				'isheepload[1]=LoadImageassert("incbin::..\daten\sheepworld\sheepload01.tga")
				'isheepload[2]=LoadImageassert("incbin::..\daten\sheepworld\sheepload02.tga")
				'sheeploadindex=0
				font32=LoadImageFontassert("incbin::..\daten\fonts\sheepworld.TTF",30,smoothfont)	
				clock=New _clock
				timesheeptimer=CreateTimer(1000)
				timesheepload=TimerTicks(timesheeptimer)
				timesheepakku=0
				drawloadscreen()
				
				drawloadscreen()
				
				'menuman=New _menumanagement
				menucameraposition=New _vector3
				menucameraposition.set(3,1,-50)
				trackbarlist=CreateList()
				checkboxlist=CreateList()
				listboxlist=CreateList()
				editboxlist=CreateList()
				cblist=CreateList()
				cflist=CreateList()
				'currentscene=0
				pagelist=CreateList()
				candlelist=CreateList()
				particlelistscene=CreateList()
				particlelistbackground=CreateList()
				particlesourcemenulist=CreateList()
				particlesourcegamelist=CreateList()
				shadowlist=CreateList()
				shadowpreviewlist=CreateList()
				For Local j=0 To 4
				 sceneambient[j]=New _vector3
				 scenediffuse[j]=New _vector3
				Next
				
				world=New _world	
				world.worldfield.homogen.set(0,0,1)				
				
				cam=New _camerasolitaire
				cam.position.copy(menucameraposition)
				campreview=New _camerasolitaire
				campreview.position.set(0,4,-120)
				campreview.view.set(0,0,2)
				campreview.up.set(0,1,0)
				campreview.side.set(1,0,0)	
				mousevector=New _vector3
				
				tfeuer=New _texture
				tfeuer.init("Incbin::..\daten\images\FX\fire01.tga")
				tshadow=New _texture
				tshadow.init("Incbin::..\daten\images\FX\shadow00.tga")
				tshadow16=New _texture
				tshadow16.init("Incbin::..\daten\images\FX\shadow16.tga")
				tcorona=New _texture
				tcorona.init("Incbin::..\daten\images\FX\corona00.tga")
				tcoronared=New _texture
				tcoronared.init("Incbin::..\daten\images\FX\corona06red.tga")
				tcoronablue=New _texture
				tcoronablue.init("Incbin::..\daten\images\FX\corona01blue.tga")				
				
				'------------------------------------------------- resources load --------------------------------------
				font=LoadImageFontassert("Incbin::..\daten\fonts\sheepworld.TTF", 5, SMOOTHFONT)
				font24=LoadImageFontassert("incbin::..\daten\fonts\sheepworld.TTF",24,smoothfont)
				font22=LoadImageFontassert("incbin::..\daten\fonts\sheepworld.TTF",22,smoothfont)
				font20=LoadImageFontassert("incbin::..\daten\fonts\sheepworld.TTF",20,smoothfont)
				font18=LoadImageFontassert("incbin::..\daten\fonts\sheepworld.TTF",18,smoothfont)
				font14=LoadImageFontassert("incbin::..\daten\fonts\sheepworld.TTF",14,smoothfont)
				font10=LoadImageFontassert("incbin::..\daten\fonts\sheepworld.TTF",10,smoothfont)
				'fontj=LoadImageFontassert("incbin::..\daten\fonts\sheepworld.TTF",24,smoothfont)				
				SetImageFont(font24)
				
				ischnecke=loadimagesheep("Incbin::..\daten\sheepworld\schnecke.tga")
				istern=loadimagesheep("Incbin::..\daten\sheepworld\stern.tga")
				ilistboxl=loadimagesheep("Incbin::..\daten\sheepworld\listbox.tga")
				iscrollbar=loadimagesheep("Incbin::..\daten\sheepworld\scrollbar.png")

				ifondred=loadimagesheep("incbin::..\daten\sheepworld\window_sheep.tga")
				ifondstats=loadimagesheep("incbin::..\daten\sheepworld\window_statistics.tga")' game top button image hover
				iwindow240204=loadimagesheep("incbin::..\daten\sheepworld\window_240_204.tga")
				iguiwindow=loadimagesheep("Incbin::..\daten\sheepworld\window_large.tga")
				icredits=loadimagesheep("Incbin::..\daten\sheepworld\window_credits.tga")
			    ibuttonl=loadimagesheep("incbin::..\daten\sheepworld\button_off.tga")
				ibuttonlhl=loadimagesheep("incbin::..\daten\sheepworld\button_on.tga")
				ibuttons=loadimagesheep("incbin::..\daten\sheepworld\button_off.tga")
				ibuttonshl=loadimagesheep("incbin::..\daten\sheepworld\button_on.tga")
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
				
				imenubackground[5]=loadimagesheep("Incbin::..\daten\sheepworld\sonnetestalpha2.tga")
				imenubackground[0]=loadimagesheep("Incbin::..\daten\sheepworld\sonne scheint.jpg")
				imenubackground[1]=loadimagesheep("Incbin::..\daten\sheepworld\Hintergrund_Biene.jpg")
				imenubackground[2]=loadimagesheep("Incbin::..\daten\sheepworld\Fruehling1024x768.jpg")
				imenubackground[3]=loadimagesheep("Incbin::..\daten\sheepworld\Grasend_1024x768.jpg")
				imenubackground[4]=loadimagesheep("Incbin::..\daten\sheepworld\Nacht_1024x768.jpg")
				
				tbee[0,0]=loadtexturesheep("Incbin::..\daten\sheepworld\bee_summer00.tga")
				tbee[0,1]=loadtexturesheep("Incbin::..\daten\sheepworld\bee_summer01.tga")
				tbee[0,2]=loadtexturesheep("Incbin::..\daten\sheepworld\bee_summer02.tga")
				tbee[0,3]=loadtexturesheep("Incbin::..\daten\sheepworld\bee_summer03.tga")
				tbee[0,4]=tbee[0,2]
				tbee[0,5]=tbee[0,1]
				
				'tbee[1,0]=loadtexturesheep("Incbin::..\daten\sheepworld\bee_winter00.tga")
				'tbee[1,1]=loadtexturesheep("Incbin::..\daten\sheepworld\bee_winter01.tga")
				'tbee[1,2]=loadtexturesheep("Incbin::..\daten\sheepworld\bee_winter02.tga")
				'tbee[1,3]=loadtexturesheep("Incbin::..\daten\sheepworld\bee_winter03.tga")
				'tbee[1,4]=tbee[1,2]
				'tbee[1,5]=tbee[1,1]
				
				ibee[0,0]=loadimagesheep("Incbin::..\daten\sheepworld\bee_summer00s.tga")
				ibee[0,1]=loadimagesheep("Incbin::..\daten\sheepworld\bee_summer01s.tga")
				ibee[0,2]=loadimagesheep("Incbin::..\daten\sheepworld\bee_summer02s.tga")
				ibee[0,3]=loadimagesheep("Incbin::..\daten\sheepworld\bee_summer03s.tga")
				ibee[0,4]=ibee[0,2]
				ibee[0,5]=ibee[0,1]
				
				'ibee[1,0]=loadimagesheep("Incbin::..\daten\sheepworld\bee_winter00s.tga")
				'ibee[1,1]=loadimagesheep("Incbin::..\daten\sheepworld\bee_winter01s.tga")
				'ibee[1,2]=loadimagesheep("Incbin::..\daten\sheepworld\bee_winter02s.tga")
				'ibee[1,3]=loadimagesheep("Incbin::..\daten\sheepworld\bee_winter03s.tga")
				'ibee[1,4]=ibee[1,2]
				'ibee[1,5]=ibee[1,1]
				
				tsnake[0,0]=loadtexturesheep("Incbin::..\daten\sheepworld\snake_summer00.tga")
				tsnake[0,1]=loadtexturesheep("Incbin::..\daten\sheepworld\snake_summer01.tga")
				tsnake[0,2]=loadtexturesheep("Incbin::..\daten\sheepworld\snake_summer02.tga")
				tsnake[0,3]=loadtexturesheep("Incbin::..\daten\sheepworld\snake_summer03.tga")
				tsnake[0,4]=tsnake[0,2]
				tsnake[0,5]=tsnake[0,1]
				
				'tsnake[1,0]=loadtexturesheep("Incbin::..\daten\sheepworld\snake_winter00.tga")
				'tsnake[1,1]=loadtexturesheep("Incbin::..\daten\sheepworld\snake_winter01.tga")
				'tsnake[1,2]=loadtexturesheep("Incbin::..\daten\sheepworld\snake_winter02.tga")
				'tsnake[1,3]=loadtexturesheep("Incbin::..\daten\sheepworld\snake_winter03.tga")
				'tsnake[1,4]=tsnake[1,2]
				'tsnake[1,5]=tsnake[1,1]
				
				'tbutterfly[2,0]=loadtexturesheep("Incbin::..\daten\sheepworld\butterflyNB00.tga")
				'tbutterfly[2,1]=loadtexturesheep("Incbin::..\daten\sheepworld\butterflyNB01.tga")
				'tbutterfly[2,2]=loadtexturesheep("Incbin::..\daten\sheepworld\butterflyNB02.tga")
				'tbutterfly[2,3]=loadtexturesheep("Incbin::..\daten\sheepworld\butterflyNB03.tga")
				'tbutterfly[2,4]=tbutterfly[2,2]
				'tbutterfly[2,5]=tbutterfly[2,1]

				'ibutterfly[0]=loadimagesheep("Incbin::..\daten\sheepworld\butterflyNB00s.tga")
				'ibutterfly[1]=loadimagesheep("Incbin::..\daten\sheepworld\butterflyNB01s.tga")
				'ibutterfly[2]=loadimagesheep("Incbin::..\daten\sheepworld\butterflyNB02s.tga")
				'ibutterfly[3]=loadimagesheep("Incbin::..\daten\sheepworld\butterflyNB03s.tga")
				'ibutterfly[4]=ibutterfly[2]
				'ibutterfly[5]=ibutterfly[1]

				tbutterfly[0,0]=loadtexturesheep("Incbin::..\daten\sheepworld\butterfly_summer00.tga")
				tbutterfly[0,1]=loadtexturesheep("Incbin::..\daten\sheepworld\butterfly_summer01.tga")
				tbutterfly[0,2]=loadtexturesheep("Incbin::..\daten\sheepworld\butterfly_summer02.tga")
				tbutterfly[0,3]=loadtexturesheep("Incbin::..\daten\sheepworld\butterfly_summer03.tga")
				tbutterfly[0,4]=tbutterfly[0,2]
				tbutterfly[0,5]=tbutterfly[0,1]
				
				'tbutterfly[1,0]=loadtexturesheep("Incbin::..\daten\sheepworld\butterfly_winter00.tga")
				'tbutterfly[1,1]=loadtexturesheep("Incbin::..\daten\sheepworld\butterfly_winter01.tga")
				'tbutterfly[1,2]=loadtexturesheep("Incbin::..\daten\sheepworld\butterfly_winter02.tga")
				'tbutterfly[1,3]=loadtexturesheep("Incbin::..\daten\sheepworld\butterfly_winter03.tga")
				'tbutterfly[1,4]=tbutterfly[1,2]
				'tbutterfly[1,5]=tbutterfly[1,1]
				
				
				tnuage[0]=loadtexturesheep("Incbin::..\daten\sheepworld\nuage2_00.tga")
				tnuage[1]=loadtexturesheep("Incbin::..\daten\sheepworld\nuage2_01.tga")
				tnuage[2]=loadtexturesheep("Incbin::..\daten\sheepworld\nuage2_02.tga")
				tnuage[3]=loadtexturesheep("Incbin::..\daten\sheepworld\nuage2_03.tga")
				tnuage[4]=loadtexturesheep("Incbin::..\daten\sheepworld\nuage2_04.tga")
				tnuage[5]=loadtexturesheep("Incbin::..\daten\sheepworld\nuage2_05.tga")
				Rem
				tcocci[0]=loadtexturesheep("Incbin::..\daten\sheepworld\cocci00.tga")
				tcocci[1]=loadtexturesheep("Incbin::..\daten\sheepworld\cocci01.tga")
				tcocci[2]=loadtexturesheep("Incbin::..\daten\sheepworld\cocci02.tga")
				tcocci[3]=loadtexturesheep("Incbin::..\daten\sheepworld\cocci03.tga")
				tcocci[4]=tcocci[2]
				tcocci[5]=tcocci[1]

				icocci[0]=loadimagesheep("Incbin::..\daten\sheepworld\cocci00s.tga")
				icocci[1]=loadimagesheep("Incbin::..\daten\sheepworld\cocci01s.tga")
				icocci[2]=loadimagesheep("Incbin::..\daten\sheepworld\cocci02s.tga")
				icocci[3]=loadimagesheep("Incbin::..\daten\sheepworld\cocci03s.tga")
				icocci[4]=icocci[2]
				icocci[5]=icocci[1]

				tmoon[0]=loadtexturesheep("Incbin::..\daten\sheepworld\moon00.tga")
				tmoon[1]=loadtexturesheep("Incbin::..\daten\sheepworld\moon01.tga")
				tmoon[2]=loadtexturesheep("Incbin::..\daten\sheepworld\moon02.tga")
				tmoon[3]=loadtexturesheep("Incbin::..\daten\sheepworld\moon03.tga")
				tmoon[4]=tmoon[2]
				tmoon[5]=tmoon[1]

				tsun[0]=loadtexturesheep("Incbin::..\daten\sheepworld\sun00.tga")
				tsun[1]=loadtexturesheep("Incbin::..\daten\sheepworld\sun01.tga")
				tsun[2]=loadtexturesheep("Incbin::..\daten\sheepworld\sun02.tga")
				tsun[3]=loadtexturesheep("Incbin::..\daten\sheepworld\sun03.tga")
				tsun[4]=tsun[2]
				tsun[5]=tsun[1]

				tsmallstar[0]=loadtexturesheep("Incbin::..\daten\sheepworld\smallstar01.tga")
				tsmallstar[1]=loadtexturesheep("Incbin::..\daten\sheepworld\smallstar00.tga")
				tsmallstar[2]=tsmallstar[1]
				tsmallstar[3]=tsmallstar[0]
				EndRem
				tsonne[0]=loadtexturesheep("Incbin::..\daten\sheepworld\sonne_0000.tga")
				tsonne[1]=loadtexturesheep("Incbin::..\daten\sheepworld\sonne_0001.tga")
				tsonne[2]=loadtexturesheep("Incbin::..\daten\sheepworld\sonne_0002.tga")
				tsonne[3]=loadtexturesheep("Incbin::..\daten\sheepworld\sonne_0003.tga")
				tsonne[4]=tsonne[0]
				tsonne[5]=loadtexturesheep("Incbin::..\daten\sheepworld\sonne_0005.tga")
				tsonne[6]=loadtexturesheep("Incbin::..\daten\sheepworld\sonne_0006.tga")
				tsonne[7]=loadtexturesheep("Incbin::..\daten\sheepworld\sonne_0007.tga")
				tsonne[8]=tsonne[0]
				tsonne[9]=tsonne[5]
				tsonne[10]=tsonne[6]
				tsonne[11]=tsonne[7]
				tsonne[12]=tsonne[0]
				tsonne[13]=tsonne[5]
				tsonne[14]=tsonne[6]
				tsonne[15]=tsonne[7]


				tzzz[0]=loadtexturesheep("Incbin::..\daten\sheepworld\zZZ_0008_Frame 1.tga")
				tzzz[1]=loadtexturesheep("Incbin::..\daten\sheepworld\zZZ_0007_Frame 2.tga")
				tzzz[2]=loadtexturesheep("Incbin::..\daten\sheepworld\zZZ_0006_Frame 3.tga")
				tzzz[3]=loadtexturesheep("Incbin::..\daten\sheepworld\zZZ_0005_Frame 4.tga")
				tzzz[4]=loadtexturesheep("Incbin::..\daten\sheepworld\zZZ_0004_Frame 5.tga")
				tzzz[5]=loadtexturesheep("Incbin::..\daten\sheepworld\zZZ_0003_Frame 6.tga")
				tzzz[6]=loadtexturesheep("Incbin::..\daten\sheepworld\zZZ_0002_Frame 7.tga")
				tzzz[7]=loadtexturesheep("Incbin::..\daten\sheepworld\zZZ_0001_Frame 8.tga")
				tzzz[8]=loadtexturesheep("Incbin::..\daten\sheepworld\zZZ_0000_Frame 9.tga")

				tgrasendseite[0]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_seite_0000.tga")
				tgrasendseite[1]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_seite_0001.tga")
				tgrasendseite[2]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_seite_0002.tga")
				tgrasendseite[3]=tgrasendseite[1]
				tgrasendseite[4]=tgrasendseite[2]
				tgrasendseite[5]=tgrasendseite[1]
				tgrasendseite[6]=tgrasendseite[0]
				tgrasendseite[7]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_seite_0007.tga")
				tgrasendseite[8]=tgrasendseite[7]
				tgrasendseite[9]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_seite_0009.tga")
				tgrasendseite[10]=tgrasendseite[7]
				tgrasendseite[11]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_seite_0011.tga")
				tgrasendseite[12]=tgrasendseite[7]
				tgrasendseite[13]=tgrasendseite[9]
				tgrasendseite[14]=tgrasendseite[7]
				tgrasendseite[15]=tgrasendseite[11]
				
				tgrasendhinten[ 0]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_hinten_00.tga")
				tgrasendhinten[ 1]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_hinten_01.tga")
				tgrasendhinten[ 2]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_hinten_02.tga")
				tgrasendhinten[ 3]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_hinten_03.tga")
				tgrasendhinten[ 4]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_hinten_04.tga")
				tgrasendhinten[ 5]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_hinten_05.tga")
				tgrasendhinten[ 6]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_hinten_06.tga")
				tgrasendhinten[ 7]=tgrasendhinten[ 5]
				tgrasendhinten[ 8]=loadtexturesheep("Incbin::..\daten\sheepworld\grasend_hinten_08.tga")
				tgrasendhinten[ 9]=tgrasendhinten[5]
				tgrasendhinten[10]=tgrasendhinten[6]
				tgrasendhinten[11]=tgrasendhinten[5]
				tgrasendhinten[12]=tgrasendhinten[8]
				tgrasendhinten[13]=tgrasendhinten[5]
				tgrasendhinten[14]=tgrasendhinten[6]
				tgrasendhinten[15]=tgrasendhinten[5]
				tgrasendhinten[16]=tgrasendhinten[8]
				tgrasendhinten[17]=tgrasendhinten[5]
				tgrasendhinten[18]=tgrasendhinten[3]
				tgrasendhinten[19]=tgrasendhinten[2]
				tgrasendhinten[20]=tgrasendhinten[1]
				tgrasendhinten[21]=tgrasendhinten[1]
				tgrasendhinten[22]=tgrasendhinten[0]

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
				
				  Local fn$="cards\card_ss_00"+(d+1)+"0_"+suit+"_"+h+".tga"
				  If fileexists(fn) 
				   tcardpreview[d,j].init(fn)
				  Else
  				   tcardpreview[d,j].init("Incbin::..\daten\images\cards\card_ss_00"+(d+1)+"0_"+suit+"_"+h+".tga")
  				  EndIf
  				  drawloadscreen()
				 Next
				Next
				'---------------------------------------- actual cards deck load -----------------------------------
				updatetextureload("ss","..\daten\images\cards",True)				
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
				Rem
				tsymbolsuit[0]=New _texture
				tsymbolsuit[0].init("Incbin::..\daten\images\cards\symbol_suit1.tga")
				drawloadscreen()
				tsymbolsuit[1]=New _texture
				tsymbolsuit[1].init("Incbin::..\daten\images\cards\symbol_suit1.tga")
				drawloadscreen()
				tsymbolsuit[2]=New _texture
				tsymbolsuit[2].init("Incbin::..\daten\images\cards\symbol_suit2.tga")
				drawloadscreen()
				tsymbolsuit[3]=New _texture
				tsymbolsuit[3].init("Incbin::..\daten\images\cards\symbol_suit3.tga")
				EndRem
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
				
				
				tcardback[0]=New _Texture
				tcardback[1]=New _Texture
				tcardback[2]=New _Texture
				tcardback[3]=New _Texture
				tcardback[4]=New _Texture
				tcardback[5]=New _Texture
				tcardback[6]=New _Texture
				tcardback[7]=New _Texture
				tcardback[8]=New _Texture
				tcardback[0].init("Incbin::..\daten\images\cards\back_sonne.tga"	)				
				drawloadscreen()
				tcardback[1].init("Incbin::..\daten\images\cards\back_biene.tga"	)				
				drawloadscreen()
				tcardback[2].init("Incbin::..\daten\images\cards\back_blumen.tga"	)				
				drawloadscreen()
				tcardback[3].init("Incbin::..\daten\images\cards\back_wiese.tga"	)				
				drawloadscreen()
				tcardback[4].init("Incbin::..\daten\images\cards\back_schafe_2.tga"	)				
				drawloadscreen()
				tcardback[5].init("Incbin::..\daten\images\cards\back_schafe_k.tga"	)				
				drawloadscreen()
				tcardback[6].init("Incbin::..\daten\images\cards\back_schafe_r.tga"	)				
				drawloadscreen()
				tcardback[7].init("Incbin::..\daten\images\cards\back_herzen.tga"	)				
				drawloadscreen()
				tcardback[8].init("Incbin::..\daten\images\cards\back_schafe_b.tga"	)				
				drawloadscreen()
				
				'tcardback[0]=New _Texture
				'tcardback[1]=New _Texture
				'tcardback[2]=New _Texture
				'tcardback[3]=New _Texture
				'tcardback[0].init("incbin::..\daten\images\cards\back1.tga")
				'drawloadscreen()
				'tcardback[1].init("incbin::..\daten\images\cards\back2.tga")
				'drawloadscreen()
				'tcardback[2].init("incbin::..\daten\dame00small.tga")
				'drawloadscreen()
				'tcardback[3].init("incbin::..\daten\drachensmall.tga")
				'drawloadscreen()
				
				
				
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
				musicman.file[0]="Incbin::..\daten\sheepworld\musik\damit_die_sonne.ogg"
				musicman.file[1]="Incbin::..\daten\sheepworld\musik\the_bee.ogg"
				musicman.file[2]="Incbin::..\daten\sheepworld\musik\damit_der_fruehling.ogg"
				musicman.file[3]="Incbin::..\daten\sheepworld\musik\damit_der_hunger.ogg"
				musicman.file[4]="Incbin::..\daten\sheepworld\musik\damit_die_nacht.ogg"
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
				animationlist=CreateList()
				guisystem.clearchild()
				gamestats=New _gamestats[gametypecount]
				loadstatistics("sheepworldstatistics.sol")
				gra.enabletext2d()
				createmenumain()
				createmenugame()
				createmenuoptionsacoustics()
				createmenuoptionsgraphics()
				createmenuoptionsgame()
				createmenuoptionscard()
				createmenuoptionscredits()
				createmenugametype()			
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
				fireworksheepcards=New _fireworksheepcards
				fireworksheepcards.initfireworksheepcards(Self,world,particlesourcegamelist,particlelistscene,clock)
				
				fireworkcards=New _fireworkcards
				fireworkcards.initfireworkcards(Self,world,particlesourcegamelist,particlelistscene,clock)
				fireworkrocket=New _fireworkrocket
				fireworkrocket.initfireworkrocket(Self,world,particlesourcegamelist,particlelistscene,clock)
				fireworksheepimage=New _fireworksheepimage
				fireworksheepimage.initfireworksheepimage(Self,world,particlesourcegamelist,particlelistscene,clock)				
				fireworksheepimage.sheepmode=True
				EndMethod
				Rem
	Method updatetextureload("ss","..\daten\images\cards",loadscreen)				
				For Local n=0 To 51 
				 If tcard[0,n] 
				  tcard[0,n].clear()
				  tcard[0,n]=Null
				 EndIf
				 tcard[0,n]=New _texture
				 Local s=(n Mod 4)+1
				 Local suit
				 If s=1 suit=4
				 If s=2 suit=1
				 If s=3 suit=2
				 If s=4 suit=3
				 Local number=(n/4)+1
				 Local h$=number;If h.length=1 h="0"+h
				
				 Local fn$="cards\card_ss_00"+(cardtexturefrontindex+1)+"0_"+suit+"_"+h+".tga"
				 If fileexists(fn) 
				  tcard[0,n].init(fn)
				 Else
  				  tcard[0,n].init("Incbin::..\daten\images\cards\card_ss_00"+(cardtexturefrontindex+1)+"0_"+suit+"_"+h+".tga")
  				 EndIf
  				 If loadscreen drawloadscreen()
				Next		
				EndMethod	
				EndRem
				Rem	
	Method Graphics_Setup()
				'If gra gra.deinit()
				'gra=Null
				Local frq=60'Hz
				Local tx[]=[1280,1920,1600,1680,1280,1024,1024]
				Local ty[]=[ 800,1200,1200,1050,1024,768 ,768 ]
				Local tc[]=[32  ,24  ,24  ,24  ,24  ,16  ,24  ]

				If fullscreen
				 Local i=5
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
				 'Print "Grafikmodus ist : "+gra.screenw+"*"+gra.screenh+", "+gra.screen_bpp+"bit, "+gra.screen_freq+"Hz"

				Else
				 If gra=Null 
				  gra=New _graphicsd3d7
				  gra.init(800,600,0,0)
				 Else
				  gra.set(800,600,0,0)
				 EndIf
				EndIf

				
				'guisystem.pwidth=gra.screenw
				'guisystem.pheight=gra.screenh
				guisystem.size.set(gra.screenw,gra.screenh,0)
				hWnd = GetActiveWindow() ' Save current Window handle
				' Init Buttons
				enableMinimize(hwnd%)
				enableMaximize(hwnd%)
				'SetClsColor (0,0,0)
				EndMethod

	Method loadstats()
				Local s:TStream
				s=ReadFile("sheepworldstatistics.sol")
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
				
	Method savestats()
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
				s=WriteFile("sheepworldstatistics.sol")
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
				   eit.discards=Rand(gametypediscards[i]/3,gametypediscards[i])
				  Else 
				   eit.discards=gametypediscards[i]
				  EndIf 
				  eit.time=Rnd(5000*60,30000*60)
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
				 gamestats[i].entrylist.clear()
				Next
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
				If currentscene<>0 
				 guisystem.background[0].addlast(imenubackground[currentscene])
				Else
				 If cardanimation=False
				  guisystem.background[0].addlast(imenubackground[currentscene])
				 Else
				  guisystem.background[0].addlast(imenubackground[5])
				 EndIf
				EndIf
				If currentscene=0'sonne
				 sceneambient[0].set(0.76,0.8,0.78)
				 scenediffuse[0].set(1,0.9,0.5)
				 Local l:_light=New _light
				 l.init(world,-30,30,-60,0,0,0,10000)						
				 l.color.copy(scenediffuse[currentscene])
				 If game game.sigmadiffuse(0.5)
				EndIf
				If currentscene=1'biene
				 sceneambient[1].set(0.7,0.7,0.7)
				 scenediffuse[1].set(1,1,1)
				 Local l:_light=New _light
				 l.init(world,-20,20,-60,0,0,0,7000)						
				 l.color.copy(scenediffuse[currentscene])
				 If game game.sigmadiffuse(0.5)
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
				 'l=New _light
				 'l.init(world,-10,10,-20,0.2,0.5,1,400)
				 'l=New _light
				 'l.init(world,-13,-15,-12,1,0.5,0.2,400)
				 If game game.sigmadiffuse(0.2)
				EndIf
				If currentscene=4'schlafend
				 sceneambient[4].set(0.1,0.12,0.15)
				 scenediffuse[4].set(0.87,0.95,0.97)
				 Local l:_light=New _light
				 l.init(world,-3,-3,-1000,0,0,0,1000000)						
				 l.color.copy(scenediffuse[4])
				 If game game.sigmadiffuse(0.3)
				EndIf
				world.lightambient.copy(sceneambient[currentscene])
				If game game.createshadow()
				EndMethod	
	Method summer:Int()
				If currentscene=4 Or currentscene=0 Return(True) Else Return(False)
				EndMethod						
	Method grasend:Int()
				If currentscene=3 Return(True) Else Return(False)
				EndMethod				
	Method odiad:Int()
				Return(False)
				EndMethod				
	Method night:Int()
				If currentscene=4 Return(True) Else Return(False)
				EndMethod				
	Method adjustcamera()				
				If menugame.active()=False 
				 showmenugame()
				EndIf
				If cam.curving=False
 				 If game If cam.position.equal(game.cameraposition[1],nearzero)=False movecamera(game.cameraposition[1])
				Else
				 Local z:_vector3=New _vector3
				 If game
				  z.copy(game.camerapositionmenu[1])
				 Else
				  z.copy(menucameraposition)
				 EndIf
				 If cam.curveposition.o1.equal(z,nearzero) If game movecamera(game.cameraposition[1])
				EndIf
				EndMethod	
				Rem		
	Method getmousevector()
				Local xax:_vector3=New _vector3
				Local yax:_vector3=New _vector3
				xax.copy(cam.side)
				yax.copy(cam.up)
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
				EndMethod	
				EndRem						
'---------------------------------------------------- animation functions -------------------------------------------------------------------------------------------------				
	Method countsun:Int()
				Local i=0
				For Local ait:_animationsheep=EachIn animationlist
				 Local as:_animationsun=_animationsun(ait)
				 If as i:+1
				Next
				Return(i)
				EndMethod						
	Method countmoon:Int()
				Local i=0
				For Local ait:_animationsheep=EachIn animationlist
				 Local as:_animationmoon=_animationmoon(ait)
				 If as i:+1
				Next
				Return(i)
				EndMethod						
	Method countzzz:Int()
				Local i=0
				For Local ait:_animationsheep=EachIn animationlist
				 Local as:_animationzzz=_animationzzz(ait)
				 If as i:+1
				Next
				Return(i)
				EndMethod						
	Method countgrasendseite:Int()
				Local i=0
				For Local ait:_animationsheep=EachIn animationlist
				 Local as:_animationgrasendseite=_animationgrasendseite(ait)
				 If as i:+1
				Next
				Return(i)
				EndMethod						
	Method countgrasendhinten:Int()
				Local i=0
				For Local ait:_animationsheep=EachIn animationlist
				 Local as:_animationgrasendhinten=_animationgrasendhinten(ait)
				 If as i:+1
				Next
				Return(i)
				EndMethod						
	Method countsonne:Int()
				Local i=0
				For Local ait:_animationsheep=EachIn animationlist
				 Local as:_animationsonne=_animationsonne(ait)
				 If as i:+1
				Next
				Return(i)
				EndMethod						
	Method countstar:Int()
				Local i=0
				For Local ait:_animationsheep=EachIn animationlist
				 Local as:_animationstar=_animationstar(ait)
				 If as i:+1
				Next
				Return(i)
				EndMethod	
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
				 If game.ended And (menugame.active() Or game.cameraposition[1].equal(cam.position,nearzero)) And paused=False
				  If fireworksheepimage.active=False fireworksheepimage.activate()
				  fireworksheepimage.position.set(Rnd(-10,10),Rnd(-10,10),Rnd(-7,-2))
				  fireworksheepimage.rotationaxis.calculaterandom()
				  'If fireworksheepcards.active=False fireworksheepcards.activate()
				 Else
				  If fireworksheepimage.active fireworksheepimage.deactivate() 
				  If fireworksheepcards.active fireworksheepcards.deactivate() 
				 EndIf
				Else
				 If fireworksheepimage.active fireworksheepimage.deactivate()
				 If fireworksheepcards.active fireworksheepcards.deactivate() 
				EndIf
				EndMethod
	Method animategamepreview()
				campreview.animate(clock)
				If gamepreview gamepreview.animate(clock,0)
				EndMethod
	Method animatemusic()
				'If musicman.channelgame.playing() And musicman.channelgamefadedown=False And musicman.channelgamefadeup=False And musicman.channelgamefadeswitch=False
				If musicman.channelmenu.playing() And musicsequence
				 If (musicman.clock.ms()-musicman.starttime)>musicman.playtime[currentmusic]
				  Local ni=currentmusic+1
				  If ni>4 ni=0
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
	Method animateanimation()
				Local v:_vector3=New _vector3
				For Local ait:_animationsheep=EachIn animationlist
			     ait.animate(clock)
			    Next				
				If night()
				 'Print countzzz()
				 If countzzz()<4 And cardanimation
				  If Rand(0,200)=10 
				   Local zzz:_animationzzz=New _animationzzz
				   zzz.init(Self)
				  EndIf
				 EndIf
				 'If countmoon()=0 
				 ' Local moon:_animationmoon=New _animationmoon
				 ' moon.init(Self)
				 'EndIf
				 'If countstar()<10
				 ' Local star:_animationstar=New _animationstar
				 ' star.init(Self)
				 'EndIf
				Else
				 ' If countsun()=0 
				 '  If currentscene=4
				 '   Local sun:_animationsun=New _animationsun;
				 '   sun.init(Self)
				 '  EndIf
				 ' EndIf
				EndIf
				If grasend()
				 If countgrasendseite()=0
				  Local grs:_animationgrasendseite=New _animationgrasendseite
				  grs.init(Self)
				 EndIf
				 If countgrasendhinten()=0
				  Local grh:_animationgrasendhinten=New _animationgrasendhinten
				  grh.init(Self)
				 EndIf
				EndIf
				If currentscene=0 And cardanimation
				 If countsonne()=0
				  Local s:_animationsonne=New _animationsonne
				  s.init(Self)
				 EndIf
				 If animationlist.count()<16
				  Local nuage:_animationnuage=New _animationnuage;nuage.init(Self)
				 EndIf
				EndIf
				If currentscene=1 And cardanimation And animationlist.count()<2
				 Local bee:_animationbee=New _animationbee;bee.init(Self)
				EndIf
				If currentscene=2 And cardanimation And animationlist.count()<4
				 Local t=Rand(0,3)
				 If t=0
				  Local snake:_animationsnake=New _animationsnake;snake.init(Self)
				 ElseIf t=1
				 ' Local bee:_animationbee=New _animationbee;bee.init(Self)
				 ElseIf t=2
				  Local butt:_animationbutterfly=New _animationbutterfly;butt.init(Self)
				 EndIf
				EndIf
				 If cardanimation And animationlist.count()>=0 And animationlist.count()<5
				 Local t
				 If odiad()
				  't=Rand(0,2)
				  'If t=0
				  ' Local c:_animationcocci=New _animationcocci;c.init(Self)
				  'ElseIf t=1
				  ' Local butt:_animationbutterfly=New _animationbutterfly;butt.init(Self,True)
				  'ElseIf t=2
				  ' Local nuage:_animationnuage=New _animationnuage;nuage.init(Self)
				  'EndIf
				 Else
				  If night()
				  Else
				   'If currentscene<>4
				   ' t=Rand(0,3)
				   ' If t=0
				   '  Local snake:_animationsnake=New _animationsnake;snake.init(Self)
				   ' ElseIf t=1
				   '  Local bee:_animationbee=New _animationbee;bee.init(Self)
				   ' ElseIf t=2
				   '  Local butt:_animationbutterfly=New _animationbutterfly;butt.init(Self)
				   ' EndIf
				   'EndIf
				  EndIf
				 EndIf 
				EndIf
				EndMethod				
	Method animateapplication:Int(quit=False)
				If menumain.active()
				 Local nt#=clock.ms()
				 Local dt#=nt-gamedelaytime
				 If game 
				  If game.inuse game.starttime:+dt
				 EndIf
				 gamedelaytime=nt
				EndIf
				
				If AppTerminate()
				 If quit
				 EndIf
				 Return(True)
				EndIf
				If AppSuspended()
				 If paused=False
				  paused=True
				  starttimepause=clock.ms()
				  musicman.fadedown()
				 EndIf
				 If musicman.channelmenu.playing()=False
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
'---------------------------------------------------- transformation functions -------------------------------------------------------------------------------------------------				
	Method transformgamepreview()	
				If gamepreview 
				 Local m#=gamepreview.vector[0].length()
				 If m<gamepreview.vector[1].length() m=gamepreview.vector[1].length()
				 'Print m
				 campreview.position.copy(gamepreview.position)'camerapositionpreview[1])
				 campreview.position.z=gamepreview.camerapositionpreview[1].z'-(m*2)
				 If gra.screenw=1024 campreview.position.z:*(Float(1024)/Float(800))
				 campreview.position.y:+3
				' campreview.position.x:*0.2
				 'campreview.position.y:*0.2
				EndIf
				world.transform(gra,campreview)
				EndMethod
'---------------------------------------------------- draw functions -------------------------------------------------------------------------------------------------				
	Method drawstandard()				
				world.determinevertexlight()
			    gra.enabletext2d()	
				If currentscene=0 And cardanimation
				 SetClsColor(255,255,255)
				 SetAlpha(1)
				 SetBlend(SolidBLEND)
				 Cls()					 
				 SetClsColor(0,0,0)
				Else
				 guisystem.drawbackground(gra,cam)
				EndIf
				SetColor(255,255,255)
				SetBlend(SOLIDBLEND|MASKBLEND)
				SetAlpha(1)
				DrawImage(ilogo,0,0)
				SetBlend(SolidBLEND)
				gra.wrap(True)
				drawanimation(0)
				 If currentscene=0 And cardanimation
 				  gra.enabletext2d()
				  gra.blendmultiplicative()
				  SetBlend(SOLIDBLEND|MASKBLEND)
				  gra.blendmultiplicative()
				  SetAlpha(1)
				  SetColor(255,255,255)
				  DrawImageRect(imenubackground[5],0,0,gra.screenw,gra.screenh)
 				  gra.enabletext2d()
				  gra.texture(0,Null)
 				  world.transform(gra,cam)
				  gra.wrap(True)		
				 EndIf
				drawgamepile()
				drawgameshadow()
				drawgame()		
				drawanimation(1)
				gra.enabletext2d()		
			    guisystem.draw(gra,cam)
				guisystem.drawcursor(gra,cam)
				drawblendscreen()
				drawpause()
				gra.swap()
				EndMethod
	Method drawanimation(mode)
				world.transform(gra,cam)
				gra.wrap(True)
				For Local ait:_animationsheep=EachIn animationlist
				 ait.draw(gra,cam,mode)
				Next
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
	Method drawgameshadow()				
				world.transform(gra,cam)
				gra.wrap(True)
				gra.blendmultiplicative()
				If game
				 For Local pit:_pile=EachIn game.pilelist
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
				 For Local cit:_card=EachIn game.cardlist
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
				EndMethod	
	Method drawgameshadowpreview()		
				transformgamepreview()
				gra.wrap(True)
				gra.blendmultiplicative()
				For Local sit:_shadow=EachIn shadowpreviewlist
				 sit.draw(gra,cam)
				Next
				EndMethod
				Rem
	Method drawpause()
				If pauseopacity>0
				 gra.enabletext2d()
				 SetColor(0,0,0)
				 SetAlpha(pauseopacity)
				 SetBlend(ALPHABLEND)
				 DrawRect(0,0,gra.screenw,gra.screenh)
				 SetImageFont(font32)
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
				 SetColor(255,255,255)
				 SetAlpha(blendscreenopacity)
				 SetBlend(ALPHABLEND)
				 DrawImageRect(blendscreen,0,0,gra.screenw,gra.screenh)
				 If blendscreenopacity>0 blendscreenopacity:-0.01
				 If blendscreenopacity<0 
				  blendscreenopacity=0
				  blendscreen=Null
				 EndIf
				EndIf
				EndMethod	
				EndRem
	Method drawgamepile()
				If game game.drawpile(gra,cam)
				EndMethod							
	Method drawgame()
				 Local o:_vector3=New _vector3
				 Local c:_vector4=New _Vector4
				 Local h$
				gra.wrap(True)
				world.transform(gra,cam)
				gra.blend(False)
				'world.draw(gra,cam)
				'------------------------------------------calculate vertexlight For pages 
				Local pit:_page
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
				'-------------------------------------------------------------------------
				If game 
				 game.draw(gra,cam)
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
				 If mouseoverpile And game.pileinfoopacity>0 And menugame.active()
				  gra.enabletext2d()
				  SetImageFont(font18)
				  h=game.pileinfoname
				  o.set(gra.screenw/2-TextWidth(h)/2,20,2)
				  c.set(1,1,0.2,game.pileinfoopacity)
				  Drawguitext(h,o,c)				
				  SetImageFont(font14)
				  h=game.pileinfodescription0
				  o.set(gra.screenw/2-TextWidth(h)/2,40,0.5)
				  c.set(1,0.2,1,game.pileinfoopacity)
				  Drawguitext(h,o,c)				
				  h=game.pileinfodescription1
				  o.set(gra.screenw/2-TextWidth(h)/2,57,0.5)
				  c.set(1,0.2,1,game.pileinfoopacity)
				  Drawguitext(h,o,c)				
				 EndIf				
				 If game.ended
				  gra.enabletext2d()
				  SetImageFont(font32)
				  h=strgamewon
				  o.set(gra.screenw/2-TextWidth(h)/2,gra.screenh/2-TextHeight(h)/2,2)
				  c.set(1,0.3,0.2,1)
				  Drawguitext(h,o,c)
				 EndIf
				EndIf
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
	Method drawgamepreview()
				If gamepreview 
				 transformgamepreview()
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
				EndIf
				gra.blend(False)
				EndMethod				
	Method initgamesheep(preview=False,showhighscore=True)
				Local g:_game=Null
				If preview=False
				 If game game.deinit(showhighscore)
				 game=Null
				Else
				 If gamepreview gamepreview.deinit(False)
				 gamepreview=Null
				EndIf
				g=newgame(cur_game)				
				If preview=False
				 game=g
				 game.init(Self,1)
				 If game 
				  game.createshadow()
				  If menugame.active()=False
				   movecamera(game.camerapositionmenu[1])
				  EndIf
				 EndIf
				Else
				 gamepreview=g
				 gamepreview.preview=True
				 gamepreview.init(Self,1)
				 gamepreview.allowpick=False
				 gamepreview.skipanimation()
				 If gamepreview gamepreview.createshadow()
				 gamepreview.updateplane()
				EndIf
				updatemenumain()
				updatescene()
				FlushKeys()
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
				v.set(0.0,0.0,0.0,1)
				g.centrictext=True
				g.background[0].addlast(ibuttons)
				g.background[0].addlast(ibuttonl)
				g.background[1].addlast(ibuttonshl)
				g.background[1].addlast(ibuttonlhl)
				g.background[2].addlast(ibuttonshl)
				g.background[2].addlast(ibuttonlhl)
				g.textshadow=0
				g.settextcolor(v)
				g.textcolormark.set(0.784,-0.686,0.588,0)
				g.textcoloractive.set(1,1,-1,1)					
				v.set(1,1,1,1)
				g.color.copy(v)
				g.colortransformed.copy(v)
				If f=Null g.font=font18 Else g.font=f
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
				g.scrollfriction=0.0				
				listboxlist.addlast(g)
				EndMethod
	Method windowinitmagic(w:_guiwindow,i:timage)
				w.background[0].addlast(i)
				w.background[1].addlast(i)
				w.background[2].addlast(i)
				EndMethod
				Rem
'*****************************************************************************************************************
'									    M E S S A G E B O X
'*****************************************************************************************************************
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
				 l.addlast(h)
				Wend
				Return(l)
				EndMethod
		
    Method messagebox:Int(t$,tbutton$,ox#,oy#,f:timagefont)
				gra.enabletext2d()
				SetImageFont(f)
				FlushKeys()
				FlushMouse()
				Local w0:_guiwindow
				Local px#=ox
				Local py#=oy
				Local wy#=200
				Local wx#=TextWidth(t$)+50
				Local maxwx=400

				If wx<100 wx=100
				If wx>maxwx wx=maxwx
				Local lt:TList=textsplit(t,wx-40,f)
				px:-wx/2
				py:-wy/2
				wy=180+lt.count()*20
				w0=New _guiwindow
				w0.init(guisystem,px,py,wx,wy,150,150,150)
				windowinitmagic(w0,iwindow240204)
				w0.setshadow(25,25)
				Local yit#=20
				For Local tit:String=EachIn lt
				 Local t0:_guitext
				 t0=New _guitext
				 t0.init(w0,20,yit,0,tit,0,0,0)
				 yit:+20
				Next

				Local k0:_guibutton
				k0=New _guibutton
				k0.init(w0,wx/2-40,wy-60,80,40,tbutton,0)
				buttoninitmagic(k0)

				w0.visibility(False)
				w0.activity(False)
				w0.opacity(0)
				w0.fadein()
				w0.fadetarget(menuopacity)		
				Local ap=game.allowpick
				game.allowpick=False
				Local q=False
				Repeat
				 Local cc=GetChar()
				 guisystem.nullstates()
				 animategame(cc)
				 animateanimation()
				 If animateapplication() q=True
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
				 k0.animate()	
				 w0.animatefade()
				 clearlinklist()
				 drawstandard()
				Until guisystem.button Or KeyHit(KEY_ESCAPE) Or KeyHit(KEY_RETURN) Or MouseHit(MOUSE_LEFT) Or MouseHit(MOUSE_RIGHT) Or q
				guisystem.button=Null
				FlushKeys()
				FlushMouse()
				w0.fadeout()
				Repeat
				 guisystem.nullstates()
				 Local cc=GetChar()
				 animategame(cc)
				 animateanimation()
				 animateapplication()				
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
				 guisystem.animatefade()
				 clearlinklist()
				 drawstandard()
				Until w0.visible=False
				w0.clear()
				clearlinklist()
				game.allowpick=ap
				Return(0)
				EndMethod			
'*****************************************************************************************************************
'									    A B F R A G E
'*****************************************************************************************************************
	Method abfrage:Int(t$,tbutton$,tbutton2$,ox#,oy#,f:timagefont)
				gra.enabletext2d()
				SetImageFont(f)
				FlushKeys()
				Local w0:_guiwindow
				Local px#=ox
				Local py#=oy
				Local wy#=200
				Local wx#=TextWidth(t$)+50'+TextWidth(tbutton2)
				Local bw0#=60
				Local bw1#=60				
				If wx<180 wx=180
				px:-wx/2
				py:-wy/2
				'Print wx
				w0=New _guiwindow
				w0.init(guisystem,px,py,wx,wy,150,150,150)
				windowinitmagic(w0,iwindow240204)
				w0.setshadow(25,25)

				Local t0:_guitext
				t0=New _guitext
				t0.init(w0,20,20,0,t,0,0,0,f)

				Local k0:_guibutton
				k0=New _guibutton
				k0.init(w0,wx/2-10-bw0,wy-60,bw0,40,tbutton,0)
				buttoninitmagic(k0)
				k0.font=f
				
				Local k1:_guibutton
				k1=New _guibutton
				k1.init(w0,wx/2+10,wy-60,bw1,40,tbutton2,0)
				buttoninitmagic(k1)
				k1.font=f

				w0.visibility(False)
				w0.activity(False)
				w0.opacity(0)
				w0.fadein()
				w0.fadetarget(menuopacity)	
				Local ap=game.allowpick
				game.allowpick=False
				Local q=False
				Repeat
				 guisystem.nullstates()
				 Local cc=GetChar()
				 animategame(cc)
				 animateanimation()
				 If animateapplication() q=True
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
				 k0.animate()	
				 k1.animate()
				 w0.animatefade()
				 clearlinklist()
				 drawstandard()
				Until guisystem.button Or KeyHit(KEY_ESCAPE) Or q
				FlushKeys()
				w0.fadeout()
				Local r
				If guisystem.button=k0 r=True Else r=False
				Repeat
				 guisystem.nullstates()
				 Local cc=GetChar()
				 animategame(cc)
				 animateanimation()
				 animateapplication()				
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
				 w0.animatefade()
				 clearlinklist()
				 drawstandard()
				Until w0.visible=False				
				w0.clear()
				clearlinklist()
				game.allowpick=ap

				guisystem.button=Null
				Return(r)
				EndMethod
'*****************************************************************************************************************
'									    A B F R A G E 2 Z
'*****************************************************************************************************************
	Method abfrage2z:Int(t$,t2$,tbutton$,tbutton2$,ox#,oy#,f:timagefont)
				FlushKeys()
				SetImageFont(f)
				Local w0:_guiwindow
				Local px#=ox
				Local py#=oy
				Local wy#=200
				
				Local wx#=TextWidth(t$)+40'+TextWidth(tbutton2)
				Local wt#=TextWidth(t2$)+40'+TextWidth(tbutton2)

				Local bw0#=60
				Local bw1#=60
				
				If wt>wx wx=wt
				
				If wx<180 wx=180
				px:-wx/2
				py:-wy/2
				

				w0=New _guiwindow
				w0.init(guisystem,px,py,wx,wy,150,150,150)
				windowinitmagic(w0,iwindow240204)
				w0.setshadow(25,25)

				Local t0:_guitext
				t0=New _guitext
				t0.init(w0,20,20,0,t,0,0,0,f)

				Local t1:_guitext
				t1=New _guitext
				t1.init(w0,20,20+TextHeight(t)+10,0,t2,0,0,0,f)

				
				Local k0:_guibutton
				k0=New _guibutton
				k0.init(w0,wx/2-10-bw0,wy-60,bw0,40,tbutton,0)
				buttoninitmagic(k0)
				k0.font=f
				
				Local k1:_guibutton
				k1=New _guibutton
				k1.init(w0,wx/2+10,wy-60,bw1,40,tbutton2,0)
				buttoninitmagic(k1)
				k1.font=f

				w0.visibility(False)
				w0.activity(False)
				w0.opacity(0)
				w0.fadein()
				w0.fadetarget(menuopacity)	
				Local ap=game.allowpick
				game.allowpick=False
				Local q=False
				Repeat
				 guisystem.nullstates()
				 animategame(GetChar())
				 animateanimation()
				 If animateapplication() q=True
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
				 k0.animate()	
				 k1.animate()
				 w0.animatefade()
				 clearlinklist()
				 drawstandard()
				Until guisystem.button Or KeyHit(KEY_ESCAPE) Or q
				FlushKeys()
				w0.fadeout()
				Local r
				If guisystem.button=k0 r=True Else r=False
				Repeat
				 guisystem.nullstates()
				 animategame(GetChar())
				 animateanimation()
				 animateapplication()				
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
				 w0.animatefade()
				 clearlinklist()
				 drawstandard()
				Until w0.visible=False
				w0.clear()
				clearlinklist()
				game.allowpick=ap

				guisystem.button=Null
				Return(r)
				EndMethod				
				EndRem
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
				 animateanimation()
				 If animateapplication()
				  pruefennamen(e0)
				  ret=e0.text
				 EndIf
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
				 k0.animate()	
				 e0.animate()
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
				  animateanimation()
				  animateapplication()				
				  animatemusic()
				  updatemenumain()
				  updatemenugame()
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
				bm.init(windowstats,188/2-107-5,354,107,108,"",37)
				buttoninitmagic(bm)
				bm.clearbackground()
				bm.background[0].addlast(ibuttonhauptoff)
				bm.background[1].addlast(ibuttonhaupton)
				bm.background[2].addlast(ibuttonhaupton)
				bn=New _guibutton
				bn.init(windowstats,188/2+5,354,107,108,stragain,37)
				buttoninitmagic(bn)
				bn.font=font22
				bn.clearbackground()
				bn.background[0].addlast(ibuttonquadoff)
				bn.background[1].addlast(ibuttonquadon)
				bn.background[2].addlast(ibuttonquadon)
				'-------------------- dialog crossfading --------------------------------
				w0.fadeout()
				windowstats.animate()
				updatestats()
				windowstats.position.clear()
				windowstats.position.setx(gra.screenw/2-188/2)
				windowstats.position.sety(gra.screenh/2-344/2)
				guisystem.animate()
				windowstats.fadein()
				Repeat
				 guisystem.nullstates()
				 animategame(0)
				 animateanimation()
				 animateapplication()				
				 animatemusic()
				 updatemenugame()
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
				 animateanimation()
				 If animateapplication()
				  ec=1
				 EndIf
				 animatemusic()
				 updatemenugame()
				 windowstats.animate()
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
				 animateanimation()
				 animateapplication()				
				 animatemusic()
				 updatemenumain()
				 updatemenugame()
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
				 initgamesheep(False,False)
				ElseIf ec=2'new game maken
				 showmenugame()
				 initgamesheep()
				EndIf
				EndIf
				FlushKeys()
				Return(ret)
				EndMethod
	Method showmenumain()
				menuman.show(menumain)
				If gamepreview
				 gamepreview.deinit()
				 gamepreview=Null
				EndIf
				movecameratomenu()
				If game 
				 game.allowpick=True
				 gamedelaytime=clock.ms()
				EndIf
				demoplay=False
				EndMethod				
	Method showmenugame()
				Local bh#=buttonheight-20
				Local off#=10	
				menuman.show(menugame)
				If fileexists("game"+gamenamesstore[game.index]+".sol")=False buttongameload.fadeout() Else buttongameload.fadein() 
				If gameplaybuttons
				 buttontipp.fadein()
				 buttonundo.fadein()
				 buttonredo.fadein()
				 buttongamenew.position.sety(-6*(off+bh))
				Else
				 buttontipp.fadeout()
				 buttonundo.fadeout()
				 buttonredo.fadeout()
				 buttongamenew.position.sety(-3*(off+bh))
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
				 b.clearbackground()
				 b.background[0].addlast(ibuttonquadoff)
				 b.background[1].addlast(ibuttonquadon)
				 b.background[2].addlast(ibuttonquadon)
				Else
				 b.text=""
				 b.clearbackground()
				 b.background[0].addlast(ibuttonhauptoff)
				 b.background[1].addlast(ibuttonhaupton)
				 b.background[2].addlast(ibuttonhaupton)
				EndIf
				EndMethod						
	Method movecameratomenu()
				Local z:_vector3=New _vector3
				If game
				 z.copy(game.camerapositionmenu[1])
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
'										M A I N L O O P 
'******************************************************************************************************************
	Method mainloop:Int()
				Local keyraus=False
				Local buttonraus
				Repeat
				 'Print idlemode
				 'ShowWindow (hWnd,SW_HIDE)
				 'If IsWindowVisible(hWnd)=0 Print "invis"
				 'Local e:TEvent=CurrentEvent
				 'If e
				 ' If e.id=EVENT_WINDOWMOVE  Print "eventsize"
				 'If PollEvent()
				 ' If EventID()=EVENT_WINDOWSIZE Print "sssssssssssssssss"
				 'EndIf
				 If iszoomed(hwnd)
				  cbfs.checked=True
				  fullscreen=cbfs.checked
				  graphics_setup()
				  For Local tit:_texture=EachIn texturelist
				   tit.reinit()
				  Next
				  updatesheepwindowtype()
				  updatesheepwindowcardfront()
				  updatesheepwindowscene()
				  updatesheepwindowmusic()				
				 EndIf

				 Rem
				 '-----------------------------------------
				 ' This is placed in the main loop
				 '-----------------------------------------
				 If (IdleMode = 1) ' sleeping app
					IdleMode=0
					If (windowed_mode=1) ' reinit graphics
						Delay (50)
						Graphics_Setup()
					EndIf
					Game_Mode=Old_Game_mode ' restore previous game mode
				 EndIf
				 If (IdleMode = 2) ' reprise d'activité
					IdleMode=0
					If (windowed_mode=1)
					Delay (50)
					Graphics_Setup()
					EndIf
				 EndIf
				 If (idlemode=0)
	 				'Sounds_Delayed_Update()
		 			'Sounds_Dynamic_Update()
			 		'Musics_Update()
				 EndIf
				 '	Else
				 ' end game if user quit
				 If AppTerminate() Then ' ??
				 keyraus=True
				 EndIf
				 Delay (80)
				 If (IdleMode=0)
				 If IsIconic(hWnd) Or windowed_mode=0 Or IsWindowVisible(hWnd)=0 Then 
				 Old_Game_mode=Game_Mode
				 game_mode = GAME_MODE_IDLEPAUSE		
				 IdleMode=1
				 ElseIf IsWindowVisible(hWnd)<>0
					IdleMode=2
				 EndIf
				 EndIf
				 EndRem

				 If menugametype.active()
				  volumesound=tbvs.get()*0.2
				 Else
				  volumesound=tbvs.get()
				 EndIf

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
				   If game 
					If game.ended
					 initgamesheep()
					EndIf
				   EndIf
				   If game movecamera(game.cameraposition[1])
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
	   			   initgamesheep(True)
				   updategametypemenu()
				   menuman.show(menugametype)
				   
				   guisystem.focus=typelist
				   If game game.allowpick=False
				  EndIf
				  '--------------- scenen änderung -------------------------
				  If guisystem.button If guisystem.button.index=6 Or guisystem.button.index=49
				   currentscene:+1
				   If currentscene>4 currentscene=0
				   updatescene()
				   updatesheepwindowscene()
				   windowsheepscene.animate()
				   If cardtexturebackuser=False
				    cardtexturebackindex=currentscene
				    If game game.updatetexture()
				   EndIf
				   If musicsequence And currentmusic<>currentscene
				    currentmusic=currentscene
				    musicman.channelmenufadeswitch=True
				    musicman.channelmenuswitchto=currentmusic
				    musicman.channelmenufadeup=False
				    musicman.channelmenufadedown=False
				   EndIf
				   updatesheepwindowmusic()
				  EndIf

				  If guisystem.button If guisystem.button.index=48
				   currentscene:-1
				   If currentscene<0 currentscene=4
				   updatescene()
				   updatesheepwindowscene()
				   windowsheepscene.animate()
				   If cardtexturebackuser=False
				    cardtexturebackindex=currentscene
				    If game game.updatetexture()
				   EndIf
				   If musicsequence And currentmusic<>currentscene
				    currentmusic=currentscene
				    musicman.channelmenufadeswitch=True
				    musicman.channelmenuswitchto=currentmusic
				    musicman.channelmenufadeup=False
				    musicman.channelmenufadedown=False
				   EndIf
				   updatesheepwindowmusic()
				  EndIf
				  '-------------------- karten options aufruf -------------------------------
				  If guisystem.button If guisystem.button.index=56 showmenuoptions(menuoptionscard,False,True)
				  Rem
				  If guisystem.button If guisystem.button.index=58
				   cardtexturefrontindex:+1
				   If cardtexturefrontindex>(cardtexturefrontcount-1) cardtexturefrontindex=0
				   If game game.updatetexture()
				   updatesheepwindowcardfront()
				   windowsheepcard.animate()
				  EndIf
				  If guisystem.button If guisystem.button.index=57
				   cardtexturefrontindex:-1
				   If cardtexturefrontindex<0 cardtexturefrontindex=cardtexturefrontcount-1
				   If game game.updatetexture()
				   updatesheepwindowcardfront()
				   windowsheepcard.animate()
				  EndIf
				  EndRem
				  Rem
				  'If guisystem.button If guisystem.button.index=35 
				  ' menuman.show(menuoptionscard)
				  ' If game game.allowpick=False
				  'EndIf
				  If guisystem.button If guisystem.button.index=47
				   cardtexturebackindex:+1
				   If cardtexturebackindex>(cardtexturebackcount-1) cardtexturebackindex=0
				   If game game.updatetexture()
				   updatesheepwindowcardback()
				  EndIf
				  If guisystem.button If guisystem.button.index=46
				   cardtexturebackindex:-1
				   If cardtexturebackindex<0 cardtexturebackindex=cardtexturebackcount-1
				   If game game.updatetexture()
				   updatesheepwindowcardback()
				  EndIf
				  'If guisystem.button If guisystem.button.index=50 '--------test
				   'messagebox("Du hast gewonnen. Für einer der ersten fünf Plätze hat es leider nicht gerreicht, da Du langsamer warst.","Ok",gra.screenw/2,gra.screenh/2,font18)
 				   'usernamendialog(gra.screenw/2,gra.screenh/2)
				  'EndIf
				  EndRem
				  '--------------- musik änderung -------------------------
				  If guisystem.button If guisystem.button.index=52 Or guisystem.button.index=50
				   currentmusic:+1
				   If currentmusic>musiccount-1 currentmusic=0
				   updatesheepwindowmusic()
				   musicman.play(currentmusic,False,True)
				   windowsheepmusic.animate()
				   musicsequence=False
				   cbms.checked=musicsequence
				   currentmusicuser=True
				  EndIf
				  If guisystem.button If guisystem.button.index=51
				   currentmusic:-1
				   If currentmusic<0 currentmusic=musiccount-1
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
				   updatecheckboxcardtextureback(cblist)
				   cardtexturebackuser=True
				  ElseIf guisystem.checkbox.index>=200
				   Local ni=guisystem.checkbox.index-200
				   If ni<>cardtexturefrontindex
				    cardtexturefrontindex=ni
				    updatetextureload("ss","..\daten\images\cards",False)
				    updatecheckboxcardtexturefront(cflist)
				    updatesheepwindowcardfront()
				   EndIf
				  EndIf
				 EndIf
				 If guisystem.mesh
				  If guisystem.mesh.index>=100 And guisystem.mesh.index<200
				   cardtexturebackindex=guisystem.mesh.index-100
				   updatecheckboxcardtextureback(cblist)
				   cardtexturebackuser=True
				  ElseIf guisystem.mesh.index>=200
				   Local ni=guisystem.mesh.index-200
				   If ni<>cardtexturefrontindex
				    cardtexturefrontindex=ni
				    updatetextureload("ss","..\daten\images\cards",False)
				    updatecheckboxcardtexturefront(cflist)
				    updatesheepwindowcardfront()
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
			  	  If c=cbgpc pointandclick=cbgpc.checked
			  	  If c=cbgcq confirmonquit=cbgcq.checked
				 EndIf
				 '----------------------------------------gametype menu----------------------------------------------------------------------
				 If guisystem.listbox
				  If guisystem.listbox=typelist
				   Local old=cur_game
				   Local neu=0
				   Local typ$=typelist.selectiontext()
				   For Local i=0 To gametypecount-1
				    If typ=gamenames[i] 
				     neu=i
				    EndIf
				   Next				
				   If old<>neu
				   	Local wechseln=True
				    If game If game.inuse And game.ended=False And confirmonquit
				     If abfrage2z(strchangegametype,strgametypeset+" "+gamenames[old]+" "+strto+" "+gamenames[neu],stryes,strno,gra.screenw/2,gra.screenh/2,font14,iwindow240204)=False
				      wechseln=False
				     EndIf
					EndIf
					If wechseln
 					 volumesoundfadein=0.2
					 demoplay=False
					 cur_game=neu
				     initgamesheep(False,False)
					 initgamesheep(True,False)
				     updategametypemenu()
				     updatesheepwindowtype()
					 If game game.allowpick=False
					Else
					 typelist.selectbytext(gamenames[cur_game])
					EndIf
				   EndIf
				   If guisystem.doubleclickleft showmenumain()
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
				    demoplay=True
				    demoplaylasttime=clock.ms()
				   EndIf
				   If guisystem.button=buttondemoplaystop demoplay=False
				  EndIf
				  If guisystem.button=buttongametypemainmenu showmenumain()
				  If guisystem.button=buttongametypestart'------------------ game aufrufen ----------------------
				   If gamepreview
				    gamepreview.deinit()
				    gamepreview=Null
				   EndIf		
				   demoplay=False		
				   showmenugame()
				   'If game musicman.play(game.music,True,False)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				   If game movecamera(game.cameraposition[1])
				   If game game.allowpick=True				   
				  EndIf
				 EndIf
				 '----------------------------------------game menue--------------------------------------------------------------
				 If game
				  If game.picklist.count()=0 And game.animationlist.firstlink()=Null
				   If (guisystem.button=buttontipp Or cc=KEY_ENTER Or cc=KEY_SPACE Or cc=KEY_F1) And game.allowpick game.tipp()
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
				     If neu initgamesheep()
				    EndIf
				    If guisystem.button=buttongameload 
				     Local laden=True
				     If game If game.inuse
				      If abfrage2z(strloadgame0,strloadgame1,stryes,strno,gra.screenw/2,gra.screenh/2,font14,iwindow240204)=False laden=False
				 	 EndIf
					 If laden
				      If game'vor dem laden zwingend!
				       game.deinit()
				       game=Null
				      EndIf
				      game=loadgame(Self,cur_game)
				      updatescene()
				     EndIf
				    EndIf
				    If guisystem.button=buttongamesave 
				     savegame(game)
				     buttongameload.fadein()
				    EndIf
				    If guisystem.button If guisystem.button.index=42
				     showmenumain()
				     If game 
				      If game.ended
				       initgamesheep(False,False)
				      EndIf
				     EndIf
				    EndIf
					If guisystem.button=buttongameoptions showmenuoptions(menuoptionslast,True,False)
			       EndIf
			      EndIf			
				 EndIf
				 '--------------------------------------------------------------------- animate
				 clearlinklist()
				 animategame(cc)
				 animategamepreview()
				 animateanimation()
				 animatemusic()
				 updatemenumain()
				 updatemenugame()		
				 If demoplay And gamepreview
				  Local nt#=clock.ms()
				  If (nt-demoplaylasttime)>2000
				   demoplaylasttime=nt
				   gamepreview.autoplay()
				  EndIf
				 EndIf		
				 '-------------------------------------------------- keyboard and application animation
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
				      initgamesheep(False,False)
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
 			  	 world.determinevertexlight()
  				 gra.enabletext2d()	
				 If currentscene=0 And cardanimation
				  SetClsColor(255,255,255)
				  SetAlpha(1)
				  SetBlend(SolidBLEND)
				  Cls()					 
				  SetClsColor(0,0,0)
				 Else
				  guisystem.drawbackground(gra,cam)
				 EndIf
				 SetColor(255,255,255)
				 SetBlend(SOLIDBLEND|MASKBLEND)
				 SetAlpha(1)
				 DrawImage(ilogo,0,0)	
				 SetBlend(SolidBLEND)			
				 drawanimation(0)
				 If currentscene=0 And cardanimation
 				  gra.enabletext2d()
				  gra.blendmultiplicative()
				  SetBlend(SOLIDBLEND|MASKBLEND)
				  gra.blendmultiplicative()
				  SetAlpha(1)
				  SetColor(255,255,255)
				  DrawImageRect(imenubackground[5],0,0,gra.screenw,gra.screenh)
 				  gra.enabletext2d()
				  gra.texture(0,Null)
 				  world.transform(gra,cam)
				  gra.wrap(True)		
				 EndIf
				 drawgamepile()
				 drawgameshadow()
 				 drawgame()		
				 drawanimation(1)
			     guisystem.draw(gra,cam)
				 If gamepreview
				  drawgameshadowpreview()
				  drawgamepreview()
				 EndIf
				 guisystem.drawcursor(gra,cam)
				 drawblendscreen()
				 drawpause()
				 gra.swap()
				 guisystem.nullstates()
				 If keyraus
				  If game game.deinit()
				  gra.deinit()
				  gra=Null
				  game=Null
				  savestatistics("sheepworldstatistics.sol")
				  saveoptions("sheepworldoptions.sol")				
				 EndIf				
				Until buttonraus Or keyraus 
				'-----------------------------------------------------------------------------------------------
				FlushKeys()
				Return(0)
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
				tmmcurgame.init(guisystem,0,0,2,"hu",1,0.8,0.1)
				tmmcurgame.position.set(0,180,2)
				tmmcurgame.position.add(0.5,0,0,True)
				tmmcurgame.font=font32
				menumain.add(tmmcurgame)
				
				tmmtime=New _guitext
				tmmtime.init(guisystem,0,0,2,"hu",1,0.8,0.1)
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
				kit.clearbackground()
				kit.background[0].addlast(ibutton15144off)
				kit.background[1].addlast(ibutton15144on)
				kit.background[2].addlast(ibutton15144on)				
				
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
				kit.clearbackground()
				kit.background[0].addlast(ibutton15144off)
				kit.background[1].addlast(ibutton15144on)
				kit.background[2].addlast(ibutton15144on)				
			
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
				buttonstart.init(guisystem,0,0,116,88,"",0)
				buttonstart.position.set(0.5,0,0,True)
				buttonstart.position.add(-116/2,30,0)
				buttoninitmagic(buttonstart)
				buttonstart.background[0].addlast(ibuttonstartoff)
				buttonstart.background[1].addlast(ibuttonstarton)
				buttonstart.background[2].addlast(ibuttonstarton)
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
				kit.init(guisystem,x,y,106,72,stroptions,4)
				buttoninitmagic(kit)
				kit.clearbackground()
				kit.background[0].addlast(ibutton10969off)
				kit.background[1].addlast(ibutton10969on)
				kit.background[2].addlast(ibutton10969on)				
				kit.font=font22
				y:+72+20
				menumain.add(kit)
				
				kit=New _guibutton
				kit.init(guisystem,x,y,106,72,strclose,5)
				buttoninitmagic(kit)
				kit.clearbackground()
				kit.background[0].addlast(ibutton10969off)
				kit.background[1].addlast(ibutton10969on)
				kit.background[2].addlast(ibutton10969on)	
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
				updatestats()
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
	Method updatestats()				
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
				kit.clearbackground()
				kit.background[0].addlast(ibuttonunvis)
				kit.background[1].addlast(ibuttonunvis)
				kit.background[2].addlast(ibuttonunvis)
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
				buttonoptionsacousticsmainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,"",11)
				buttonoptionsacousticsmainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonoptionsacousticsmainmenu)
				buttonoptionsacousticsmainmenu.clearbackground()
				buttonoptionsacousticsmainmenu.background[0].addlast(ibuttonhauptoff)
				buttonoptionsacousticsmainmenu.background[1].addlast(ibuttonhaupton)
				buttonoptionsacousticsmainmenu.background[2].addlast(ibuttonhaupton)
				menuoptionsacoustics.add(buttonoptionsacousticsmainmenu)	
				
				createoptionsbutton(windowoptionsacoustics,menuoptionsacoustics,0)
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
				menuoptionsacoustics.fadetarget(menuopacity)
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
				buttonoptionsgraphicsmainmenu.clearbackground()
				buttonoptionsgraphicsmainmenu.background[0].addlast(ibuttonhauptoff)
				buttonoptionsgraphicsmainmenu.background[1].addlast(ibuttonhaupton)
				buttonoptionsgraphicsmainmenu.background[2].addlast(ibuttonhaupton)
				menuoptionsgraphics.add(buttonoptionsgraphicsmainmenu)	
				
				createoptionsbutton(windowoptionsgraphics,menuoptionsgraphics,1)
						
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
				
				tgrgp=New _guitext
				tgrgp.init(windowoptionsgraphics,50,y,2,strgamebuttons,tr,tg,tb,font18)
				cbgrgp=New _guicheckbox
				cbgrgp.init(windowoptionsgraphics,250,y,19,19,24);y:+off
				checkboxinitmagic(cbgrgp)
				cbgrgp.checked=gameplaybuttons
				
				tgrmb=New _guitext
				tgrmb.init(windowoptionsgraphics,50,y,2,strmenubuttons,tr,tg,tb,font18)
				cbgrmb=New _guicheckbox
				cbgrmb.init(windowoptionsgraphics,250,y,19,19,25);y:+off
				checkboxinitmagic(cbgrmb)
				cbgrmb.checked=menubuttons

				tgrca=New _guitext
				tgrca.init(windowoptionsgraphics,50,y,2,strfigureanimation,tr,tg,tb,font18)
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
				
				'tgrnp=New _guitext
				'tgrnp.init(windowoptionsgraphics,50,y,2,"Unordentliche ",tr,tg,tb,font18)
				'tbgrnp=New _guitrackbar
				'tbgrnp.init(windowoptionsgraphics,250,y,150,25,1,1,1,0,0,1,29);y:+off
				'trackbarinitmagic(tbgrnp)
				'tbgrnp.set(naturalpiles)

				tgrmo=New _guitext
				tgrmo.init(windowoptionsgraphics,50,y,2,strmouseovercard,tr,tg,tb,font18)
				cbgrmo=New _guicheckbox
				cbgrmo.init(windowoptionsgraphics,250,y,19,19,28);y:+off
				checkboxinitmagic(cbgrmo)
				cbgrmo.checked=mouseovercard

				'tgrmp=New _guitext
				'tgrmp.init(windowoptionsgraphics,50,y,2,strmouseoverpile,tr,tg,tb,font18)
				'cbgrmp=New _guicheckbox
				'cbgrmp.init(windowoptionsgraphics,250,y,19,19,28);y:+off
				'checkboxinitmagic(cbgrmp)
				'cbgrmp.checked=mouseoverpile

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
				menuoptionsgraphics.visibility(False)
				menuoptionsgraphics.activity(False)
				menuoptionsgraphics.fadetarget(menuopacity)
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
				buttonoptionsgamemainmenu.clearbackground()
				buttonoptionsgamemainmenu.background[0].addlast(ibuttonhauptoff)
				buttonoptionsgamemainmenu.background[1].addlast(ibuttonhaupton)
				buttonoptionsgamemainmenu.background[2].addlast(ibuttonhaupton)
				menuoptionsgame.add(buttonoptionsgamemainmenu)	
				
				createoptionsbutton(windowoptionsgame,menuoptionsgame,2)
				SetImageFont(font32)
				Local hh$="Spiel"
				ttitlegame=New _guitext
				ttitlegame.init(windowoptionsgame,(wx/2)-TextWidth(hh)/2,40,2,hh,1,0.9,0.5,font32)
				y=110
				off=35
				x=40
				tgpc=New _guitext				
				tgpc.init(windowoptionsgame,x,y,2,strtouchpad,tr,tg,tb,font18);y:+off
				tgcq=New _guitext				
				tgcq.init(windowoptionsgame,x,y,2,strexitconf,tr,tg,tb,font18);y:+off
				'tgdi=New _guitext				
				'tgdi.init(windowoptionsgame,x,y,2,"Schwierigkeit",tr,tg,tb,font18);
				y:+off
				hh="Spielautomatik"
				SetImageFont(font18)
				tgaa=New _guitext				
				tgaa.init(windowoptionsgame,(wx/2)-TextWidth(hh)/2,y+5,2,hh,1,0.9,0.5,font18);y:+off+10
				'tgas=New _guitext				
				'tgas.init(windowoptionsgame,x,y,2,"Spielstart",tr,tg,tb,font18);y:+off
				tgat=New _guitext				
				tgat.init(windowoptionsgame,x,y,2,"Karte aufdecken",tr,tg,tb,font18);y:+off
				tgad=New _guitext				
				tgad.init(windowoptionsgame,x,y,2,"Ablagefeld belegen",tr,tg,tb,font18);y:+off
				'tgaf=New _guitext				
				'tgaf.init(windowoptionsgame,x,y,2,"Foundation belegen",tr,tg,tb,font18);y:+off
				tgae=New _guitext				
				tgae.init(windowoptionsgame,x,y,2,"Leeres Feld nutzen",tr,tg,tb,font18);y:+off
				tgcr=New _guitext				
				tgcr.init(windowoptionsgame,x,y,2,"Spielzug bei Rechtsklick",tr,tg,tb,font18);y:+off
				tgcd=New _guitext				
				tgcd.init(windowoptionsgame,x,y,2,"Spielzug bei Doppelklick",tr,tg,tb,font18);y:+off
				y=110
				x=320
				cbgpc=New _guicheckbox
				cbgpc.init(windowoptionsgame,x,y,19,19,19);y:+off
				checkboxinitmagic(cbgpc)
				cbgcq=New _guicheckbox
				cbgpc.checked=pointandclick
				cbgcq.init(windowoptionsgame,x,y,19,19,21);y:+off
				checkboxinitmagic(cbgcq)
				cbgcq.checked=confirmonquit
				'tbgdi=New _guitrackbar
				'tbgdi.init(windowoptionsgame,x-75,y,150,25,1,1,1,difficulty,0,1,22);
				'trackbarinitmagic(tbgdi)
				y:+off
				y:+off+10
				'cbgas=New _guicheckbox
				'cbgas.init(windowoptionsgame,x,y,19,19,20);y:+off
				'checkboxinitmagic(cbgas)
				'cbgas.checked=autostart
				cbgat=New _guicheckbox
				cbgat.init(windowoptionsgame,x,y,19,19,18);y:+off
				checkboxinitmagic(cbgat)
				cbgat.checked=autoturncard
				cbgad=New _guicheckbox
				cbgad.init(windowoptionsgame,x,y,19,19,17);y:+off
				checkboxinitmagic(cbgad)
				cbgad.checked=autodiscard
				'cbgaf=New _guicheckbox
				'cbgaf.init(windowoptionsgame,x,y,19,19,17);y:+off
				'checkboxinitmagic(cbgaf)
				'cbgaf.checked=autofoundation
				cbgae=New _guicheckbox
				cbgae.init(windowoptionsgame,x,y,19,19,17);y:+off
				checkboxinitmagic(cbgae)
				cbgae.checked=autoempty
				cbgcr=New _guicheckbox
				cbgcr.init(windowoptionsgame,x,y,19,19,17);y:+off
				checkboxinitmagic(cbgcr)
				cbgcr.checked=clickplayright
				cbgcd=New _guicheckbox
				cbgcd.init(windowoptionsgame,x,y,19,19,17);y:+off
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
				menuoptionsgame.fadetarget(menuopacity)
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
				
				createoptionsbutton(windowoptionscard,menuoptionscard,3)
				
				buttonoptionscardmainmenu=New _guibutton
				buttonoptionscardmainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,"",11)
				buttonoptionscardmainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonoptionscardmainmenu)
				buttonoptionscardmainmenu.clearbackground()
				buttonoptionscardmainmenu.background[0].addlast(ibuttonhauptoff)
				buttonoptionscardmainmenu.background[1].addlast(ibuttonhaupton)
				buttonoptionscardmainmenu.background[2].addlast(ibuttonhaupton)
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
				updatecheckboxcardtextureback(cblist)

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
				updatecheckboxcardtexturefront(cflist)
				menuoptionscard.visibility(False)
				menuoptionscard.activity(False)
				menuoptionscard.fadetarget(menuopacity)
				menuoptionscard.opacity(0)
				EndMethod
	Method updatecheckboxcardtextureback(l:TList)
				For Local cit:_guicheckbox=EachIn l
				 If cardtexturebackindex=(cit.index-100) cit.checked=True Else cit.checked=False
				Next
				If game game.updatetexture()
				EndMethod		
	Method updatecheckboxcardtexturefront(l:TList)
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
				
				createoptionsbutton(windowoptionscredits,menuoptionscredits,4)
				
				buttonoptionscreditsmainmenu=New _guibutton
				buttonoptionscreditsmainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,"",11)
				buttonoptionscreditsmainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttonoptionscreditsmainmenu)
				buttonoptionscreditsmainmenu.clearbackground()
				buttonoptionscreditsmainmenu.background[0].addlast(ibuttonhauptoff)
				buttonoptionscreditsmainmenu.background[1].addlast(ibuttonhaupton)
				buttonoptionscreditsmainmenu.background[2].addlast(ibuttonhaupton)
				menuoptionscredits.add(buttonoptionscreditsmainmenu)				
				
				menuoptionscredits.visibility(False)
				menuoptionscredits.activity(False)
				menuoptionscredits.fadetarget(menuopacity)
				menuoptionscredits.opacity(0)
				EndMethod

	Method createoptionsbutton(w:_guiwindow,menu:_menu,excl)							
				Local bw#=buttonwidth-40
				Local bh#=buttonheight
				Local y#=0
				Local x#=0+w.width()+20
				Local wi#=w.width()
				Local he#=w.height()
				Local off#=20				
				Local kit:_guibutton
				Local wx#=450
				Local wy#=600
	
				Rem
				bm=New _guibutton
				bm.init(guisystem,x,y,bw,bh,"Schließen",11)
				buttoninitmagic(bm)
				menu.add(bm)
				y:+bh+off
				EndRem
				Local bac:_guibutton
				Local bgr:_guibutton
				Local bga:_guibutton
				Local bcd:_guibutton
				Local bcr:_guibutton

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
				Local wx#=450
				Local wy#=600
				Local off#=20		
				Local kit:_guibutton=Null
				Local keyraus=False
				
				menugametype=menuman.createmenu()
				windowgametype=New _guiwindow
				windowgametype.init(guisystem,-wx/2,-wy/2,wx,wy,255,255,255)
				windowgametype.position.add(0.5,0.5,0,True)
				windowgametype.setshadow(10,10)
				windowgametype.background[0].addlast(iguiwindow)
				windowgametype.background[1].addlast(iguiwindow)
				windowgametype.background[2].addlast(iguiwindow)
				menugametype.add(windowgametype)
				
				buttongametypemainmenu=New _guibutton
				buttongametypemainmenu.init(guisystem,-wx/2-106-20,-wy/2,107,108,"",37)
				buttongametypemainmenu.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttongametypemainmenu)
				buttongametypemainmenu.clearbackground()
				buttongametypemainmenu.background[0].addlast(ibuttonhauptoff)
				buttongametypemainmenu.background[1].addlast(ibuttonhaupton)
				buttongametypemainmenu.background[2].addlast(ibuttonhaupton)
				menugametype.add(buttongametypemainmenu)
				
				buttongametypestart=New _guibutton
				buttongametypestart.init(guisystem,-wx/2-106-20,-wy/2+106+20,107,85,"",37)
				buttongametypestart.position.add(0.5,0.5,0,True)
				buttoninitmagic(buttongametypestart)
				buttongametypestart.clearbackground()
				buttongametypestart.background[0].addlast(ibuttonstartoff)
				buttongametypestart.background[1].addlast(ibuttonstarton)
				buttongametypestart.background[2].addlast(ibuttonstarton)
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
				current=New _guitext
				current.init(windowgametype,20,30,0,strcurrentgame+" "+gamenames[cur_game],0,0,0,font22)
				'-------------------------------------- create game type list
				Local sll:TList=CreateList()
				For Local i=0 To gametypecount-1
				 sll.addlast(gamenames[i])
				Next
				sll.sort()
				typelist=New _guilistbox
				typelist.borderwidth=8
				typelist.init(windowgametype,20,60,410,160,1,1,1,38)
				listboxinitmagic(typelist)
				Local slli:TLink=sll.firstlink()
				For Local i=0 To gametypecount-1
				 Local slls:String=String(slli.value())
				 typelist.inserttext(slls,5,5+(i)*30,0,0,0,0,font18)
				 slli=slli.nextlink()
				Next
				typelist.selectbytext(gamenames[cur_game])
				typelist.scrolltoselection()
				'-------------------------------------- create game manual help list
				desclist=New _guilistbox
				descList.borderwidth=8
				desclist.init(windowgametype,20,440,410,130,1,1,1,39)
				listboxinitmagic(desclist)
				updategametypemenu()
				menugametype.visibility(False)
				menugametype.activity(False)
				menugametype.fadetarget(menuopacity)
				menugametype.opacity(0)
				EndMethod
	Method updategametypemenu()
				Local typ$=typelist.selectiontext()
				For Local i=0 To gametypecount-1
				 If typ=gamenames[i] 
				  cur_game=i
				  current.set(strcurrentgame+" "+gamenames[cur_game])
				 EndIf
				Next
				desclist.clearchild()
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
				desclist.selection=Null
				If(cur_game>=0) And (cur_game<gametypecount)
				 Local h$
				 Local t#
				 Local yit#=10
				 Local xit#=20
				 Local off#=20
				
				 t=gametypechancemin[cur_game]
				 If t>0.0 And t<=0.2 h="sehr niedrig"
				 If t>0.2 And t<=0.4 h="niedrig"
				 If t>0.4 And t<=0.6 h="mittel"
				 If t>0.6 And t<=0.8 h="hoch"
				 If t>0.8 And t<=1.0 h="sehr hoch"
				 desclist.inserttext("Gewinnchance : "+h,5,yit,1,0.8,0.5,0.1,font18);yit:+off
				
				 t=gametypeskill[cur_game]
				 If t>0.0 And t<=0.2 h="sehr leicht"
				 If t>0.2 And t<=0.4 h="leicht"
				 If t>0.4 And t<=0.6 h="mäßig"
				 If t>0.6 And t<=0.8 h="schwer"
				 If t>0.8 And t<=1.0 h="sehr schwer"
				 desclist.inserttext("Schwierigkeit : "+h,5,yit,1,0.8,0.5,0.1,font18);yit:+off
				
				 t=gametypetime[cur_game]
				 If t<0.4 h="kurz"
				 If t>0.4 And t<0.6 h="mittel"
				 If t>=0.6 h="lange"
				 desclist.inserttext("Zeitaufwand : "+h,5,yit,1,0.8,0.5,0.3,font18);yit:+off
				
				 desclist.inserttext("Kartensätze : "+gametypedeckscount[cur_game],5,yit,1,0.8,0.5,0.1,font18);yit:+off
				 desclist.inserttext("------------------------- Anzeigen -------------------------",5,yit,0,0,0,0,font18);yit:+off+10
				
				  Local lbyit#=yit
				 If gamepreview
				  For Local p=0 To 9
				   Local but:_guibutton=Null
				   Local tb$=""
				   Local pl:TList=Null
				   Local pe:_pile=Null
				   If p=0 
				    pl=gamepreview.pilefoundationlist
				    tb="Ablage"
				   EndIf
				   If p=1 
				    pl=gamepreview.pilediscardlist
				    tb="Discard"
				   EndIf
				   If p=2
				    If gamepreview.tableau
				     pl=gamepreview.tableau.pilelist
				     tb="Tableau"
				    EndIf
				   EndIf
				   If p=3
				    pl=gamepreview.pilestocklist
				    tb="Talon"
				   EndIf
				   If p=4
				    pl=gamepreview.pilewastelist
				    tb="Waste"
				   EndIf
				   If p=5
				    pl=gamepreview.pileredeallist
				    tb="Redeal"
				   EndIf
				   If p=6
				    pl=gamepreview.pilereservelist
				    tb="Reserve"
				   EndIf
				   If p=7
				    pl=gamepreview.pilefreecelllist
				    tb="Freecell"
				   EndIf
				   If p=8
				    pl=gamepreview.pilepyramidlist
				    tb="Pyramid"
				   EndIf
				   If p=9
				    pl=gamepreview.pilelabyrinthlist
				    tb="Labyrinth"
				   EndIf
				   If pl
				    If pl.count()>0 
				     but=New _guibutton;
				     but.init(desclist,xit,yit,100,30,tb,4000+p);
				     buttoninitmagic(but);
				     'desclist.childlist.addlast(but)
				     lbyit=yit
				    EndIf
				   EndIf
				   If pe
				    but=New _guibutton;
				    but.init(desclist,xit,yit,100,30,tb,4000+p);
				    buttoninitmagic(but);
				    'desclist.childlist.addlast(but)
			        lbyit=yit
				   EndIf
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
				    xit:+120
				    If xit>300 
				     xit=20
				     yit:+off+20
				    EndIf
				   EndIf				 
				  Next
				 EndIf
				 yit=lbyit+off+20
				 desclist.inserttext("------------------------ Beschreibung ----------------------",5,yit,0,0,0,0,font18);yit:+off
				 'desclist.inserttext("Beschreibung : ", 5,yit,2,1,0.8,0.4,font18);yit:+off
				 yit:+off
				 Local absatzlist:TList=CreateList()
				 gra.enabletext2d()
				 SetImageFont(font18)
				 Local sep$[]=New String[1]
				 sep[0]="|"
				 Local ar$[]=gameobjective[cur_game].split(sep[0])
				 Local i
				 i=0
				 While i<ar.length
				  absatzlist.addlast(ar[i])
				  i:+1
				 Wend
				 For Local tab:String=EachIn absatzlist
				  Local lt:TList=textsplit(tab,410-70,font18)
				  For Local tit:String=EachIn lt
				   desclist.inserttext(tit,20,yit,0,0,0,0,font18)
				   yit:+off
				  Next
				  yit:+10
				 Next
				 yit:+10
				 buttondemoplayplay=New _guibutton
				 buttondemoplayplay.init(desclist,40,yit,120,50,"Demo spielen",1000)
				 buttoninitmagic(buttondemoplayplay)
				 'desclist.childlist.addlast(buttondemoplayplay)
				 buttondemoplaystop=New _guibutton
				 buttondemoplaystop.init(desclist,200,yit,120,50,"Demo stoppen",1000)
				 buttoninitmagic(buttondemoplaystop)
				 'desclist.childlist.addlast(buttondemoplaystop)
				 desclist.updateopacity()
				 desclist.animate()
				EndIf
				EndMethod
	Method updategametypemenuposition()
				EndMethod				
'******************************************************************************************************************
'										G A M E  M E N U 
'******************************************************************************************************************
	Method createmenugame()
				menugame=menuman.createmenu()
				Local kit:_guibutton
				Local bw#=buttonwidth-50
				Local bh#=buttonheight-20
				Local off#=10
				Local y#=10
				Local x#=10
				y=10
				buttongamemainmenu=New _guibutton
				buttongamemainmenu.init(guisystem,x,y,bw,bh,strmainmenu,42)
				buttoninitmagic(buttongamemainmenu,font14)
				menugame.add(buttongamemainmenu)
				y:+(bh+off)
				buttongameoptions=New _guibutton
				buttongameoptions.init(guisystem,x,y,bw,bh,stroptions,3442)
				buttoninitmagic(buttongameoptions,font14)
				menugame.add(buttongameoptions)
				y:+(bh+off)
				y=-6*(off+bh)
				buttongamenew=New _guibutton
				buttongamenew.init(guisystem,x,y,bw,bh,strnew,45)
				buttongamenew.position.add(0,1,0,True)
				buttoninitmagic(buttongamenew,font14)
				menugame.add(buttongamenew)
				y:+off+bh
				buttontipp=New _guibutton
				buttontipp.init(guisystem,x,y,bw,bh,strhint,63)
				buttontipp.position.add(0,1,0,True)
				buttoninitmagic(buttontipp,font14)
				menugame.add(buttontipp)
				y:+bh+off
				'buttonauto=New _guibutton
				'buttonauto.init(guisystem,x,y,bw,bh,"Automatik",64)
				'buttoninitmagic(buttonauto)
				'menugame.add(buttonauto)
				'y:+bh+off
				buttonundo=New _guibutton
				buttonundo.init(guisystem,x,y,bw,bh,strundo,40)
				buttonundo.position.add(0,1,0,True)
				buttoninitmagic(buttonundo,font14)
				menugame.add(buttonundo)
				y:+bh+off
				buttonredo=New _guibutton
				buttonredo.init(guisystem,x,y,bw,bh,strredo,41)
				buttonredo.position.add(0,1,0,True)
				buttoninitmagic(buttonredo,font14)
				menugame.add(buttonredo)
				y:+bh+off
				buttongamesave=New _guibutton
				buttongamesave.init(guisystem,x,y,bw,bh,strsave,62)
				buttongamesave.position.add(0,1,0,True)
				buttoninitmagic(buttongamesave,font14)
				menugame.add(buttongamesave)
				y:+(bh+off)
				buttongameload=New _guibutton
				buttongameload.init(guisystem,x,y,bw,bh,strload,61)
				buttongameload.position.add(0,1,0,True)
				buttoninitmagic(buttongameload,font14)
				menugame.add(buttongameload)
				y:+(bh+off)
				tgmcurgame=New _guitext
				tgmcurgame.init(guisystem,0,10,2,"hu",1,0.8,0.1)
				tgmcurgame.font=font32
				menugame.add(tgmcurgame)
				tgmtime=New _guitext
				tgmtime.init(guisystem,0,50,2,"hu",1,0.8,0.1)
				tgmtime.font=font18
				menugame.add(tgmtime)
				tgmscore=New _guitext
				tgmscore.init(guisystem,0,75,2,"hu",1,0.8,0.1)
				tgmscore.font=font18
				menugame.add(tgmscore)
				menugame.visibility(False)
				menugame.activity(False)
				menugame.opacity(0)
				menugame.fadetarget(menuopacity)
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
				
	'Field tswtype:_guitext=Null
	'Field tswcardfront:_guitext=Null
	'Field tswcardback:_guitext=Null
	'Field tswscene:_guitext=Null
	'Field tswmusic:_guitext=Null
	'------------------------------------------general
	Rem
	Field bac:_guibutton=Null
	Field bgr:_guibutton=Null
	Field bga:_guibutton=Null
	Field bcd:_guibutton=Null
	Field bcr:_guibutton=Null
	Field bge:_guibutton=Null
	Field bm:_guibutton=Null
	
	'-------------------------------------------audio/video options
	Field buttonoptionsacousticsmainmenu:_guibutton=Null
	Field windowoptionsacoustics:_guiwindow=Null
	Field ttitleacoustics:_guitext=Null
	Field tva:_guitext=Null
	Field tvs:_guitext=Null
	Field tvm:_guitext=Null
	Field tms:_guitext=Null	
	Field tsp:_guitext=Null
	Field tfs:_guitext=Null
	Field tbva:_guitrackbar=Null
	Field tbvs:_guitrackbar=Null
	Field tbvm:_guitrackbar=Null
	Field cbms:_guicheckbox=Null
	Field tbsp:_guitrackbar=Null
	Field cbfs:_guicheckbox=Null
	'----------------------------------------------game options
	Field buttonoptionsgamemainmenu:_guibutton=Null
	Field windowoptionsgame:_guiwindow=Null
	Field ttitlegame:_guitext=Null
	Field tgpc:_guitext=Null
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
	Field buttonoptionsgraphicsmainmenu:_guibutton=Null
	Field windowoptionsgraphics:_guiwindow=Null
	Field ttitlegraphics:_guitext=Null
	Field tgrtd:_guitext=Null
	Field tgrgp:_guitext=Null
	Field tgrmb:_guitext=Null
	Field tgrca:_guitext=Null
	Field tgrnp:_guitext=Null
	Field tgrmo:_guitext=Null
	Field tgrmp:_guitext=Null
	Field tgrsm:_guitext=Null
	Field tgrcs:_guitext=Null
	Field tgrct:_guitext=Null
	Field tgrcl:_guitext=Null
	Field tgrcw:_guitext=Null
	Field tgrch:_guitext=Null
	Field cbgrtd:_guicheckbox=Null
	Field cbgrgp:_guicheckbox=Null
	Field cbgrmb:_guicheckbox=Null
	Field cbgrca:_guicheckbox=Null
	Field tbgrnp:_guitrackbar=Null
	Field cbgrmo:_guicheckbox=Null
	Field cbgrmp:_guicheckbox=Null
	Field cbgrsm:_guicheckbox=Null
	Field tbgrcs:_guitrackbar=Null
	Field tbgrct:_guitrackbar=Null
	Field tbgrcl:_guitrackbar=Null
	Field tbgrcw:_guitrackbar=Null
	Field tbgrch:_guitrackbar=Null
	'----------------------------------------cards and decks options
	Field buttonoptionscardmainmenu:_guibutton=Null
	Field windowoptionscard:_guiwindow=Null
	Field ttitlecard:_guitext=Null
	Field ttitleback:_guitext=Null
	Field ttitledeck:_guitext=Null
	Field lbcardtexture:_guilistbox=Null
	Field lbdecktexture:_guilistbox=Null
	Field cblist:TList=Null
	Field cflist:TList=Null
	'----------------------------------------cards and decks options
	Field buttonoptionscreditsmainmenu:_guibutton=Null
	Field windowoptionscredits:_guiwindow=Null
	'---------------------------------------------------game type menu
	Field buttongametypemainmenu:_guibutton=Null
	Field buttongametypestart:_guibutton=Null
	Field windowgametype:_guiwindow=Null	
	Field current:_guitext=Null
	Field spinne:_guiimage=Null
	Field typelist:_guilistbox=Null
	Field desclist:_guilistbox=Null
	
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
	'------------------------------------------------game menu
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
	EndRem
	
	EndType
'******************************************************************************************************************
'										M A I N F U N C T I O N
'******************************************************************************************************************
				Local solitaire:_solitairesheepworld=New _solitairesheepworld
				SetImageFont(solitaire.font24)				
				ShowMouse()
				solitaire.initgamesheep()
				solitaire.mainloop()
				If solitaire.game solitaire.game.deinit
				If solitaire.gra solitaire.gra.deinit()
				solitaire.savestatistics("sheepworldstatistics.sol")
				solitaire.saveoptions("sheepworldoptions.sol")
				clearlinklist()
				EndGraphics

'------------------------------------------------------------------------------------------------------------------
			
				













