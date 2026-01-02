'Project : Solitaire
'Modul : gametype
'date of create : 01.11.2007
'date of change : 01.11.2007




' Constants for game types
Const KLONDIKE_1=0			' klondike game, one card
Const KLONDIKE_3=1			' klondike game, three cards
Const SPIDER_1=2			' spider game, one suit
Const SPIDER_2=3			' spider game, two suits
Const SPIDER_4=4			' spider game, four suits
Const EIGHTOFF=5			' Eight off game
Const FREECELL=6			' Freecell
Const FORECELL=7			' Forecell
Const AUSTRALIAN=8			' Australian
Const BETROTHAL=9			' Betrothal
Const BLINDA=10				' Blind Alleys
Const BLANKET=11			' Blanket
Const CANCAN=12				' Can-Can
Const CRUEL=13				' Cruel solitaire
Const PYRAMID=14			' Pyramid solitaire
Const GOLF=15				' Golf
Const YUKON=16				' Yukon 1
Const FOURCOL=17			' Four colors
Const SCORPION=18			' Scorpion
Const DKLONDIKE_1=19		' 2 pack klondike 1 card
Const DKLONDIKE_3=20		' 2 pack klondike 3 cards
Const RUSSIAN=21    		' Russian Solitaire
Const SEATOWERS=22  		' Sea Towers
Const LIMITEDCOVERED=23 	' limited covered
Const LADYPALK=24   		' ladypalk
Const LABYRINTH=25         	' labyrinth
Const LABYRINTHEASIER=26   	' labyrintheasire
Const LABYRINTHRODENBACH=27	' labyrinthrodenbach
Const LABYRINTHDOUBLE=28   	' labyrinthdouble
Const OSMOSIS=29			' Osmosis
Const GOLFEASY=30   		' golfeasy
Const KINGSPEAK=31  		' kingspeak
Const FORTYTHIEVES=32  		' fortythieves
Const LABELLELUCIE=33  		' la belle lucie
Const LAFACILELUCIE=34 		' la facile lucie
Const RUSSIANEASY=35   		' russian easy
Const RUSSIANFREE=36   		' russian free
Const ACESUP=37 	   		' Aces Up
Const ACME=38 	 	  		' Acme
Const ACESUPEASY=39 	 	' Aces up easy
Const ANT=40 			 	' ant
Const AUNTMARY=41			' aunt mary
Const AUNTFREEMARY=42		' aunt free mary
Const BAKERSDOZEN=43		' bakers dozen
Const BAKERSGAME=44			' bakers game
Const FLOWERGARDEN=45		' flower garden
Const GARGANTUA=46			' gargantua
Const GIANT=47				' giant
Const INDIAN=48				' indian
Const MISSMILLIGAN=49		' miss milligan
Const KLONDIKECONTRA=50		' klondike contra
Const CONTRAFLOW=51			' contra flow
Const FREECELLDOUBLE=52		' freecell double
Const SINGLERAIL=53			' single rail
Const SOLIDSQUARE=54		' solid square
Const SPIDERETTE=55			' spiderette
Const STONEWALL=56			' stonewall
Const SPIDERLINGE=57		' spiderlinge
Const MAZE=58				' maze
Const MARTHA=59				' martha
Const LIMITED=60			' limited
Const NAPOLEONSSQUARE=61	' napoleons square
Const PYRAMIDDOUBLE=62		' pyrmaid double
Const FREEWALL=63 			' free wall
Const CARRENAPOLEON=64 		' carre napoleon
Const MAZEEASY=65 			' maze easy
Const MAZETWOSUIT=66 		' maze two suit
Const MAZEEASYTWOSUIT=67	' maze easy two suit
Const BLANKETTWOSUIT=68		' blanket two suit
Const PAIRSCROSS=69			' pairscross
Const STONEWALLEASY=70		' stone wall easy
Const FORTYTHIEVESDOUBLESTOCK=71' forty thieves doubls stock
Const FORTYTHIEVESREDEAL=72 ' forty thieves redeal
Const PYRAMIDRESERVE=73 	' pyramid reserve
Const SPIDERSUPERSTOCK=74 	' spider super stock
Const SWEETMATCH=75			' sweetmatch
Const VERYEASY=76			' veryeasy


Global gametypecount=77

'typgruppen werden definiert :
' 0 : klondikegruppe
' 1 : spidergruppe
' 2 : freecellgruppe
' 3 : Feldgruppe
' 4 : Yukongruppe
' 5 : cruel
' 6 : sonstige

Global gametypegroupnames$[]=[..
				"Klondike",..
				"Spider",..
				"Freecell",..
				"Feld",..
				"Yukon",..
				"Cruel",..
				"Sonstige"]

Global gametypegroup[]=[..
				0,.. ' klondike game, one card
				0,.. ' klondike game, three cards
				1,.. ' spider game, one suit
				1,.. ' spider game, two suit
				1,.. ' spider game, four suit
				2,.. ' Eight off game
				2,..
				2,..
				0,.. ' Australia
				6,..
				0,..
				3,.. ' Blanket
				6,.. ' cancan
				5,.. ' cruel
				3,.. ' Pyramid
				6,.. ' golf
				4,.. ' yukon
				2,.. ' Four color
				1,.. ' scorpion
				0,.. ' 2 pack klondike 1 card
				0,.. ' 2 pack klondike 3 card
				4,.. ' russian
				2,.. ' sea towers
				0,.. ' limited covered
				0,.. ' lady palk
				3,.. ' labyrinth
				3,.. ' labyrinth easy
				3,.. ' lab rod
				3,.. ' lab double
				6,.. ' osmosis
				6,.. ' golf easy
				6,.. ' kings peak
				0,.. ' forty thieves
				5,.. ' la belle lucie
				5,.. ' la facile lucie
				4,.. ' russian easy
				4,.. ' russian free
				6,.. ' aces up
				0,.. ' acme
				6,.. ' aces up easy
				0,.. ' ant
				4,.. ' aunt mary
				4,.. ' aunt free mary
				6,.. ' bakers dozen
				2,.. ' bakers game
				6,.. ' flower garden
				0,.. ' gargantua
				0,.. ' giant
				0,.. ' indian
				0,.. ' miss milligan
				0,.. ' klondike contra
				0,.. ' contra flow
				2,.. ' freecell double
				0,.. ' single rail
				5,.. ' solid square
				1,.. ' spiderette
				6,.. ' stonewall
				1,.. ' spiderlinge
				3,.. ' maze
				6,.. ' martha
				0,.. ' limitied
				5,.. ' napoleons square
				3,.. ' pyramid double
				2,.. ' free wall
				0,.. ' carre napoleon
				3,.. ' maze easy
				3,.. ' maze two suit
				3,.. ' maze easy two suit
				3,.. ' blanket two suit
				3,.. ' pairs cross
				6,.. ' stone wall easy
				0,.. ' forty thieves double stock
				0,.. ' forty thieves redeal
				3,.. ' pyramid reserve
				1,.. ' spider super stock
				0,.. 
				0..
				] 

Global gametypepublicity#[]=[..
				1.0,.. ' klondike game, one card
				0.8,.. ' klondike game, three cards
				1.0,.. ' spider game, one suit
				0.8,.. ' spider game, two suit
				0.7,.. ' spider game, four suit
				0.5,.. ' Eight off game
				1.0,.. ' freecell 
				0.8,.. ' forecell
				0.3,.. ' Australia
				0.5,.. ' betrothal
				0.6,.. ' blindalleys
				0.7,.. ' Blanket
				0.6,.. ' cancan
				0.1,.. ' cruel
				1.0,.. ' Pyramid
				0.8,.. ' golf
				0.6,.. ' yukon
				0.6,.. ' Four color
				0.3,.. ' scorpion
				0.0,.. ' 2 pack klondike 1 card
				0.0,.. ' 2 pack klondike 3 card
				0.5,.. ' russian
				0.6,.. ' sea towers
				0.3,.. ' limited covered
				0.5,.. ' lady palk
				0.6,.. ' labyrinth
				0.0,.. ' labyrinth easy
				0.0,.. ' lab rod
				0.0,.. ' lab double
				0.7,.. ' osmosis
				0.0,.. ' golf easy
				0.5,.. ' kings peak
				0.5,.. ' forty thieves
				0.5,.. ' la belle lucie
				0.0,.. ' la facile lucie
				0.0,.. ' russian easy
				0.0,.. ' russian free
				0.8,.. ' aces up
				0.3,.. ' acme
				0.0,.. ' aces up easy
				0.0,.. ' assortment
				0.3,.. ' aunt mary
				0.0,.. ' aunt free mary
				0.5,.. ' bakers dozen
				0.5,.. ' bakers game
				0.5,.. ' flower garden
				0.3,.. ' gargantua
				0.4,.. ' giant
				0.3,.. ' indian
				0.4,.. ' miss milligan
				0.2,.. ' klondike contra
				0.0,.. ' contra flow
				0.2,.. ' freecell double
				0.1,.. ' single rail
				0.5,.. ' solid square
				0.4,.. ' spiderette
				0.4,.. ' stonewall
				0.0,.. ' spiderlinge
				0.2,.. ' maze
				0.5,.. ' martha
				0.5,.. ' limitied
				0.5,.. ' napoleons square
				0.1,.. ' pyramid double
				0.0,.. ' free wall
				0.5,.. ' carre napoleon
				0.0,.. ' maze easy
				0.0,.. ' maze two suit
				0.0,.. ' maze easy two suit
				0.0,.. ' blanket two suit
				0.0,.. ' pairs cross
				0.0,.. ' stone wall easy
				0.0,.. ' forty thieves double stock
				0.0,.. ' forty thieves redeal
				0.0,.. ' pyramid reserve
				0.0,.. ' spider super stock
				0.0,.. 
				0.0..
				] 



Global gametypetime#[]=[.. 'float in minutes
				7.0,..' klondike game, one card
				7.0,..' klondike game, three cards
				6.0,..' spider game, one suit
				7.0,..
				8.0,..
				15.0,..' Eight off game
				15.0,..
				15.0,..
				7.0,..' Australia
				5.0,..
				5.0,..
				7.0,..' Blanket
				5.0,..
				5.0,..
				5.0,..' Pyramid
				5.0,..
				7.0,..
				15.0,..' Four color
				7.0,..
				7.0,..
				10.0,..' 2 pack klondike 3 card
				15.0,..
				15.0,..
				7.0,..' limited covered
				7.0,..
				5.0,..
				5.0,..' labyrinth easy
				5.0,..
				13.0,..
				7.0,.. ' osmosis
				5.0,..
				5.0,.. ' kings peak
				18.0,.. ' forty thieves
				7.0,.. ' la belle lucie
				7.0,..
				7.0,.. ' russian easy
				7.0,..
				6.0,.. ' aces up
				5.0,.. ' acme
				5.0,.. 'aces up easy
				10.0,.. ' ant
				5.0,.. ' aunt mary
				5.0,.. ' annt free mary
				7.0,.. ' bakers dozen
				10.0,.. ' bakers game
				6.0,.. ' flower garden
				16.0,.. ' gargantua
				14.0,.. ' giant
				15.0,.. ' indian
				15.0,.. ' miss milligan
				8.0,.. ' klondike contra
				9.0,.. ' contra flow
				20.0,.. ' freecell double
				5.0,.. ' single rail
				14.0,.. ' solid square
				5.0,.. ' spiderette
				6.0,.. ' stonewall
				7.0,.. ' spiderlinge
				7.0,.. ' maze
				6.0,.. ' martha
				8.0,.. ' limitied
				7.0,.. ' napoleons square
				6.5,.. ' pyramid double
				6.0,.. ' free wall
				15.0,.. ' carre napoleon
				7.0,.. ' maze easy
				7.0,.. ' maze two suit
				7.0,.. ' maze easy two suit
				7.0,.. ' blanket two suit
				8.0,.. ' pairs cross
				6.0,.. ' stone wall easy
				18.0,.. ' forty thieves double stock
				18.0,.. ' forty thieves redeal
				10.0,.. ' pyramid reserve
				7.0,.. ' spider super stock
				5.0,.. 
				5.0..
				] 
Global gametypechance[]= [..'won,lost
				9,8,..' klondike one card
				3,6,..' klondike three card
				23,8,..' spider one suit 11 (2/2=100%)
				1,5,..'0.5,.. ' spider two suit (0/0=0%)
				0,3,..'0.5,.. ' spider four suit (0/0=0%)
				7,3,..'0.7,.. ' Eight off game
				6,3,..'0.7,.. ' free
				4,4,..'0.5,.. ' fore
				3,7,..'0.3,.. ' Australia
				10,3,..'0.7,.. ' beth
				5,3,..'0.7,.. ' blindalley
				9,7,..' Blanket (7min, leicht)
				7,3,..'0.7,.. ' cancan
				16,21,..'0.1,.. ' cruel
				8,52,..'0.13,..' Pyramid, autoplay
				3,32,..'0.3,.. ' golf
				2,5,..'0.3,.. ' yukon
				5,10,..' Four color  (7:22 min (cd),)
				0,4,..'0.1,.. ' scorpion
				17,8,..'0.7,.. ' dklondouble1
				6,6,.. '2 pack klondike 3 card
				0,4,.. '0.7 russian
				6,2,.. '0.7,.. ' seatowers
				8,3,.. '0.7,.. ' limited covered 01111011011 (8/11=70%)
				4,2,..'0.5,.. ' ladypalk 01
				7,53,..'0.10,..' labyrinth           01001 00000 10000 00010 01000 00000 00000 00000 00010 00000 00000 00001 (7/60 = 12%), autoplay
				8,52,..'0.15,..' labyrinth easy      00000 00001 00100 00000 00010 00000 01000 01000 00010 01000 00000 00001 (8/60 = 13%), autoplay
				50,10,..'0.85,..' labyrinth rodenbach 11111 01110 11111 01011 11111 11110 11111 01111 01111 11111 01001 11111 (50/60 = 83%), autoplay
				25,35,..'0.40,..' labyrinth double    11001 11000 10000 11010 00101 01101 00100 10001 11101 00011 10000 00100 (25/60 = 42%), autoplay
				4,54,..'osmosis , autoplay, leicht-mittel
				4,30,..'0.35,..' golf easy
				24,18,..'kings peak , autoplay, leicht , 4min
				1,20,..'forty thieves (5-6 min)
				2,24,..'la belle lucie 
				18,8,..'la facile lucie 
				2,7,..'0.5,.. ' russian easy 
				2,4,..'0.2,.. ' russian free 100010
				0,15,..'0.0,.. ' aces up 00000 00000 00000
				0,7,..'0.12,..' acme 0000000
			    2,1,..'0.7,.. ' aces up easy
				1,2,..'0.0,.. ' ant/assortment
				0,10,..'0.0,.. ' aunt mary
				2,8,..'0.0,.. ' annt free mary
				0,3,..'0.0,.. ' bakers dozen
				0,3,..'0.0,.. ' bakers game
				8,26,..'0.18,.. ' flower garden 0001100011000000000000
				5,5,..'gargantua (~ 18min)
				1,12,..'giant (14min)
				10,0,..'indian (13-16min, leicht-mäßig 4, )
				1,11,..'miss milligan (13min, mittelschwer)
				5,5,..'klondike contra (5-7min, mäßig schwer)
				6,6,..'contra flow (9:12,mittel-schwer)
				3,7,..'freecell double (15-20min , sehr schwer)
				1,11,..'single rail(3:20min, leicht)
				7,2,..'solid square (7-8min, mäßig schwer)
				2,8,..'spiderette (5:12min)
				1,19,..'stonewall 
				3,6,..'spiderlinge (6-7min)
				0,3,..'0.0,.. ' maze
				9,3,..'0.75,..' martha 011111110011 (9/12=75%) (relativ schnell, nicht so schwer)
				0,3,..'0.0,.. ' limitied
				21,49,..'0.3,.. ' napoleons square 00001 11011 10000 01001 10010 00100 10000 00001 01010 01010 10000 00000 00010 10001 (21/70 = 30%)
				0,9,..'0.0,.. ' pyramid double
				5,10,..'0.3,.. ' free wall 100000111000100 (5:12)
				3,0,..'0.0,.. ' carre napoleon (~15min)
				0,3,..'0.0,.. ' maze easy
				0,3,..'0.0,.. ' maze two suit
				2,4,..'0.35,..' maze easy two suit 110000 (relativ leicht-mäßig, zeit 0.5)
				1,1,..'0.0,.. ' blanket two suit
				1,1,..'0.5,.. ' pairs cross 
				13,12,..'0.5,.. ' stone wall easy 1000111010010110001100111 (13/25 = 52%)
				4,1,..'0.8,.. ' forty thieves double stock 01111 (4/5=80%)
				1,5,..'0.2,.. ' forty thieves redeal 00010 (1/5=20%)
				0,3,..'0.5,.. ' pyramid reserve
				4,2,..'0.3,.. ' spider super stock 100111 (14:26min)
				0,0,..'0.5,.. 
				0,0..'0.9..
				]
				
Global gametypechancemax#[]= [..
				0.45,..' klondike game, one card
				0.10,..' klondike game, three card
				1.00,..' spider game, one suit
				0.75,..
				0.45,..
				1.00,..' Eight off game
				1.00,..
				0.75,..
				0.45,..' Australia
				1.00,..
				1.00,..
				0.1 ,..' Blanket
				0.75,..
				0.45,..
				0.10,..' Pyramid
				0.10,..
				0.45,..
				0.50,..' Four color
				0.45,..
				0.45,..
				0.45,..' 2 pack klondike 3 card
				0.10,..
				0.95,..
				0.9,.. ' limited covered
				0.9,..
				0.2,..
				0.6,.. ' labyrinth easy
				0.6,..
				0.4,..
				0.55,..' osmosis
				0.1,..
				0.2,.. ' kings peak
				0.15,..' forty thieves
				0.15,..' la belle lucie
				0.6,..
				0.4,.. ' russian easy
				0.4,..
				0.5,.. ' aces up
				0.0,.. ' acme
				0.5,.. ' aces up easy
				0.0,.. ' ant
				0.0,.. ' aunt mary
				0.0,.. ' annt free mary
				0.0,.. ' bakers dozen
				0.0,.. ' bakers game
				0.0,.. ' flower garden
				0.0,.. ' gargantua
				0.0,.. ' giant
				0.0,.. ' indian
				0.0,.. ' miss milligan
				0.0,.. ' klondike contra
				0.0,.. ' contra flow
				0.0,.. ' freecell double
				0.0,.. ' single rail
				0.0,.. ' solid square
				0.0,.. ' spiderette
				0.0,.. ' stonewall
				0.0,.. ' spiderlinge
				0.0,.. ' maze
				0.0,.. ' martha
				0.0,.. ' limitied
				0.0,.. ' napoleons square
				0.0,.. ' pyramid double
				0.0,.. ' free wall
				0.0,.. ' carre napoleon
				0.0,.. ' maze easy
				0.0,.. ' maze two suit
				0.0,.. ' maze easy two suit
				0.0,.. ' blanket two suit
				0.0,.. ' pairs cross
				0.0,.. ' stone wall easy
				0.0,.. 'forty thieves double stock
				0.0,.. 'forty thieves redeal
				0.0,.. ' pyramid reserve
				0.0,.. ' spider super stock
				0.0,..
				1.0..
				]
				
				'schwierigkeit : 
				' 0.0-0.2 : sehr leicht (0.1)
				' 0.2-0.4 : leicht (0.3)
				' 0.4-0.6 : mäßig (0.5)
				' 0.4-0.6 : schwer (0.7)
				' 0.4-0.6 : sehr schwer (0.9)
				
Global gametypeskill#[]=     [..
				0.5,.. ' klondike game, one card
				0.5,.. ' klondike game, three card
				0.3,.. ' spider game, one suit
				0.5,..
				0.7,..
				0.7,.. ' Eight off game
				0.7,.. ' freecell
				0.7,..
				0.5,.. ' Australia
				0.3,..
				0.5,..
				0.5,.. ' Blanket
				0.5,..
				0.5,.. ' cruel
				0.3,.. ' Pyramid
				0.6,.. 'golf
				0.7,..
				0.8,.. ' Four color
				0.9,..
				0.5,..
				0.5,.. ' 2 pack klondike 3 card
				0.7,..
				0.7,..
				0.5,.. ' limited covered
				0.5,.. ' lady
				0.3,..  'lab
				0.3,.. ' labyrinth easy
				0.3,..  'lab rod
				0.5,..  'lab double
				0.3,.. ' osmosis
				0.6,..  'golf easy
				0.3,.. ' kings peak
				0.45,.. ' forty thieves
				0.6,.. ' la belle lucie
				0.65,..
				0.7,.. ' russian easy
				0.7,.. ' russian free
				0.6,.. ' aces up
				0.15,..' acme
				0.3,.. ' aces up easy
				0.0,.. ' ant
				0.0,.. ' aunt mary
				0.0,.. ' annt free mary
				0.0,.. ' bakers dozen
				0.0,.. ' bakers game
				0.8,.. ' flower garden
				0.4,.. ' gargantua
				0.4,.. ' giant
				0.6,.. ' indian
				0.5,.. ' miss milligan
				0.6,.. ' klondike contra
				0.8,.. ' contra flow
				0.9,.. ' freecell double
				0.2,.. ' single rail
				0.6,.. ' solid square
				0.0,.. ' spiderette
			    0.7,.. ' stonewall
				0.3,.. ' spiderlinge
				0.0,.. ' maze
				0.5,.. ' martha
				0.0,.. ' limitied
				0.25,.. ' napoleons square
				0.0,.. ' pyramid double
				0.5,.. ' free wall
				0.5,.. ' carre napoleon
				0.0,.. ' maze easy
				0.0,.. ' maze two suit
				0.0,.. ' maze easy two suit
				0.0,.. ' blanket two suit
				0.6,.. ' pairs cross
				0.67,..' stone wall easy				
				0.5,.. ' forty thieves double stock
				0.4,.. ' forty thieves redeal
				0.35,..' pyramid reserve
				0.4,.. ' spider super stock
				0.4,.. 
				0.1..
				]
Global gametypedeckscount[] =[..
				1  ,..' klondike game, one card
				1  ,..' klondike game, three card
				2  ,..' spider game, one suit
				2  ,..
				2  ,..
				1  ,..' Eight off game
				1  ,..
				1  ,..
				1  ,..' Australia
				1  ,..
				1  ,..
				1  ,..' Blanket
				1  ,..
				1  ,..
				1  ,..' Pyramid
				1  ,..
				1  ,..
				1  ,..' Four color
				1  ,..
				2  ,..
				2  ,..' 2 pack klondike 3 card
				1  ,..
				1  ,..
				2  ,..' limited covered
				2  ,..
				1  ,..
				1  ,..' labyrinth easy
				1  ,..
				2  ,..
				1  ,..' osmosis
				1  ,..
				1  ,..' kings peak 
				2  ,..' forty thieves
				1  ,..' la belle lucie
				1  ,..
				1  ,..' russian easy
				1  ,..
				1  ,.. ' aces up
				1  ,.. ' acme
				1  ,.. ' aces up easy
				2  ,.. ' ant
				1  ,.. ' aunt mary
				1  ,.. ' annt free mary
				1  ,.. ' bakers dozen
				1  ,.. ' bakers game
				1  ,.. ' flower garden
				2  ,.. ' gargantua
				2  ,.. ' giant
				2  ,.. ' indian
				2  ,.. ' miss milligan
				1  ,.. ' klondike contra
				1  ,.. ' contra flow
				2  ,.. ' freecell double
				1  ,.. ' single rail
				2  ,.. ' solid square
				1  ,.. ' spiderette
				1  ,.. ' stonewall
				1  ,.. ' spiderlinge
				1  ,.. ' maze
				1  ,.. ' martha
				2  ,.. ' limitied
				2  ,.. ' napoleons square
				2  ,.. ' pyramid double
				1  ,.. ' free wall
				2  ,.. ' carre napoleon
				1  ,.. ' maze easy
				2  ,.. ' maze two suit
				1  ,.. ' maze easy two suit
				2  ,.. ' blanket two suit
				1  ,.. ' pairs cross
				1  ,.. ' stone wall easy
				2  ,.. ' forty thieves double stock
				2  ,.. ' forty thieves redeal
				2 ,..  ' pyramid reserve
				2 ,.. ' spider super stock
				1  ,..
				1  ..
				]
Global gametypediscards[]   =[..
				52 ,..' klondike game, one card
				52 ,..' klondike game, three card
				104,..' spider game, one suit
				104,..
				104,..
				52 ,..' Eight off game
				52 ,..
				52 ,..
				52 ,..' Australia
				50 ,..
				52 ,..
				48 ,..' Blanket
				52 ,..
				52 ,..
				52 ,..' Pyramid
				52 ,..
				52 ,..
				52 ,..' Four color
				52 ,..
				104,..
				104,..' 2 pack klondike 3 card
				52 ,..
				52 ,..
				104,..' limited covered
				104,..
				52 ,..
				52 ,..' labyrinth easy
				52 ,..
				104,..
				52  ,..' osmosis
				52 ,..
				52 ,.. ' kings peak
				104,.. ' forty thieves
				52,..  ' la belle lucie
				52,..
				52,..  ' russian easy
				52,..
				52,..  ' aces up
				52,..  ' acme
				52,..  ' aces up easy
				104,.. ' ant
				52,..  ' aunt mary
				52,..  ' aunt free mary
				52,..  ' bakers dozen
				52,..  ' bakers game
				52,..  ' flower garden
				104,.. ' gargantua
				104,.. ' giant
				104,.. ' indian
				104,.. ' miss milligan
				52 ,.. ' klondike contra
				52 ,.. ' contra flow
				104,.. ' freecell double
				52 ,.. ' single rail
				104,.. ' solid square
				52 ,.. ' spiderette
				52 ,.. ' stonewall
				78 ,.. ' spiderlinge
				44 ,.. ' maze
				52 ,.. ' martha
				104,.. ' limitied
				104,.. ' napoleons square
				104,.. ' pyramid double
				52,..  ' free wall
				104,.. ' carre napoleon
				44 ,.. ' maze easy
				44 ,.. ' maze two suit
				44 ,.. ' maze easy two suit
				48 ,.. ' blanket two suit
				8  ,.. ' pairs cross
				52 ,.. ' stone wall easy
				104,.. ' forty thieves double stock
				104,.. ' forty thieves redeal
				104,.. ' pyramid reserve
				104,.. ' spider super stock
				8,..   
				1..
				]
Global gamenames$[]=[..
				"Klondike 1 card",..
				"Klondike 3 cards",..
				"Spider Easy (1 suit)",..
				"Spider Medium (2 suits)",..
				"Spider Hard (4 suits)",..
				"Eight Off",..
				"Free Cell",..
				"Fore Cell",..
				"Australian",..
				"Betrothal",..
				"Blind Alleys",..
				"Blanket",..
				"Can-Can",..
				"Cruel",..
				"Pyramid",..
				"Golf",..
				"Yukon",..
				"Four colors",..
				"Scorpion",..
				"Klondike Double 1 card",..
				"Klondike Double 3 cards",..
				"Russian",..
				"Sea Towers",..
				"Limited Covered",..
				"Lady Palk",..
				"Labyrinth",..
				"Labyrinth easy",..
				"Labyrinth Rodenbach",..
				"Labyrinth Double",..
				"Osmosis Ascending",..
				"Golf Easy",..
				"King's Peak",..
				"Forty Thieves",..
				"La Belle Lucie",..
				"La Facile Lucie",..
				"Russian easy",..
				"Russian free",..
				"Aces Up",..
				"Acme",..
				"Aces Up Easy",..
				"Assortment",..
				"Aunt Mary",..
				"Aunt Free Mary",..
				"Baker's Dozen",..
				"Baker's Game",..
				"Flower Garden",..
				"Gargantua",..
				"Giant",..
				"Indian",..
				"Miss Milligan",..
				"Klondike Contra",..
				"Contraflow",..
				"Free Cell Double",..
				"Single Rail",..
				"Solid Square",..
				"Spiderette Easy",..
				"Stonewall",..
				"Little Spiderling",..
				"Maze",..
				"Martha",..
				"Limited",..
				"Napoleon's Square",..
				"Pyramid Large",..
				"Free Wall",..
				"Carre Napoleon",..
				"Maze Easy",..
				"Maze Two Suit",..
				"Maze Easy Two Suit",..
				"Blanket Two Suit",..
				"Pair's Cross",..
				"Stonewall Easy",..
				"Forty Thieves Double Stock",..
				"Forty Thieves Redeal",..
				"Pyramid Reserve",..
				"Spider Super Stock",..
				"<experimentell>",..
				"Very easy"..
				]
Global gamenamesstore$[]=[..
				"_klondike1",..
				"_klondike3",..
				"_spider1",..
				"_spider2",..
				"_spider4",..
				"_eightoff",..
				"_freecell",..
				"_forecell",..
				"_australian",..
				"_betrothal",..
				"_blindalleys",..
				"_blanket",..
				"_cancan",..
				"_cruel",..
				"_pyramid",..
				"_golf",..
				"_yukon",..
				"_fourcolors",..
				"_scorpion",..
				"_klondike21",..
				"_klondike23",..
				"_russian",..
				"_seatowers",..
				"_limitedcovered",..
				"_ladypalk",..
				"_labyrinth",..
				"_labyrintheasier",..
				"_labyrinthrodenbach",..
				"_labyrintdouble",..
				"_osmosis",..
				"_golfeasy",..
				"_kingspeak",..
				"_fortythieves",..
				"_labellelucie",..
				"_lafacilelucie",..
				"_russianeasy",..
				"_russianfree",..
				"_acesup",..
				"_acme",..
				"_acesupeasy",..
				"_ant",..
				"_auntmary",..
				"_auntfreemary",..
				"_bakersdozen",..
				"_bakersgame",..
				"_flowergarden",..
				"_gargantua",..
				"_giant",..
				"_indian",..
				"_missmilligan",..
				"_klondikecontra",..
				"_contraflow",..
				"_freecelldouble",..
				"_singlerail",..
				"_solidsquare",..
				"_spiderette",..
				"_stonewall",..
				"_spiderlinge",..
				"_maze",..
				"_martha",..
				"_limited",..
				"_napoleonssquare",..
				"_pyramiddouble",..
				"_freewall",..
				"_carrenapoleon",..
				"_mazeeasy",..
				"_mazetwosuit",..
				"_mazeeasytwosuit",..
				"_blankettwosuit",..
				"_pairscross",..
				"_stonewalleasy",..
				"_fortythievesdoublestock",..
				"_fortythievesredeal",..
				"_pyramidreserve",..
				"_spidersuperstock",..
				"_sweetmatch",..
				"_veryeasy"..
				]
Global gameobjective$[1000]
Rem
Global gameobjective$[]=[..
				"Klondike wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 7 Kartenreihen, die von links nach rechts mit 1 bis 7 Karten ausgelegt werden. Die oberste Karte einer jeden Reihe ist aufgedeckt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Wird eine offene Karte von einer Reihe auf eine andere gespielt, so wird die darunterliegende verdeckte Karte umgedreht. Leere Reihen können mit einem König oder einer Sequenz, die mit einem König startet, belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Der Talon kann beliebig oft durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Klondike 3 card wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 7 Kartenreihen, die von links nach rechts mit 1 bis 7 Karten ausgelegt werden. Die oberste Karte einer jeden Reihe ist aufgedeckt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Wird eine offene Karte von einer Reihe auf eine andere gespielt, so wird die darunterliegende verdeckte Karte umgedreht. Leere Reihen können mit einem König oder einer Sequenz, die mit einem König startet, belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Hierbei werden immer 3 Karten umgedreht aber nur die oberste Karte ist spielbar. Der Talon kann beliebig oft durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Spider easy wird mit zwei Kartenspielen (104 Karten) derselben Farbe gespielt (also alle Karten sind beispielsweise Herz). Es gibt 8 Ablagestapel und 10 Kartenreihen, die von links nach rechts ausgelegt werden. Die erste bis vierte Kartenreihe hat jeweils 6 Karten und die fünfte bis zehnte Reihe hat 5 Karten. Die oberste Karte ist jeweils aufgedeckt.|Ziel des Spiels ist es, alle Karten in absteigender Reihenfolge (König bis As) auf dem Tableau zu bilden. Erst wenn eine ununterbrochene Sequenz vollständig auf dem Tableau erstellt ist, wird sie automatisch auf den Ablagestapel gespielt. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss (also z.B. 4 kann an 5 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Wird eine offene Karte von einer Reihe auf eine andere gespielt, und eine verdeckt Karte liegt frei, so wird die Karte umgedreht. Leere Reihen können mit jeder Karte oder Sequenz belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Hierbei werden 10 Karten gezogen, jeweils eine wird an jede Kartenreihe angelegt. Der Talon wird nur einmal durchgespielt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Spider medium wird mit zwei Kartenspielen (104 Karten), die nur aus zwei Farben bestehen gespielt (also alle Karten sind beispielsweise entweder Herz oder Pik). Es gibt 8 Ablagestapel und 10 Kartenreihen, die von links nach rechts ausgelegt werden. Die erste bis vierte Kartenreihe hat jeweils 6 Karten und die fünfte bis zehnte Reihe hat 5 Karten. Die oberste Karte ist jeweils aufgedeckt.|Ziel des Spiels ist es, alle Karten in absteigender Reihenfolge (König bis As) auf dem Tableau zu bilden. Erst wenn eine ununterbrochene Sequenz derselben Farbe vollständig auf dem Tableau erstellt ist, wird sie automatisch auf den Ablagestapel gespielt. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss (also z.B. 4 kann an 5 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen und die gleiche Farbe haben. Beispielsweise kann Pik 5 und Pik 4 gemeinsam verschoben werden, während Pik 5 und Herz 4 nicht gemeinsam verschoben werden können (Herz 4 kann aber sehr wohl an Pik 5 angelegt werden). Wird eine offene Karte von einer Reihe auf eine andere gespielt, und eine verdeckt Karte liegt frei, so wird die Karte umgedreht. Leere Reihen können mit jeder Karte oder Sequenz belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Hierbei werden 10 Karten gezogen, jeweils eine wird an jede Kartenreihe angelegt. Der Talon wird nur einmal durchgespielt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Spider hard wird mit zwei Kartenspielen (104 Karten). Es gibt 8 Ablagestapel und 10 Kartenreihen, die von links nach rechts ausgelegt werden. Die erste bis vierte Kartenreihe hat jeweils 6 Karten und die fünfte bis zehnte Reihe hat 5 Karten. Die oberste Karte ist jeweils aufgedeckt.|Ziel des Spiels ist es, alle Karten in absteigender Reihenfolge (König bis As) auf dem Tableau zu bilden. Erst wenn eine ununterbrochene Sequenz derselben Farbe vollständig auf dem Tableau erstellt ist, wird sie automatisch auf den Ablagestapel gespielt. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss (also z.B. 4 kann an 5 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen und die gleiche Farbe haben. Beispielsweise kann Pik 5 und Pik 4 gemeinsam verschoben werden, während Pik 5 und Herz 4 nicht gemeinsam verschoben werden können (Herz 4 kann aber sehr wohl an Pik 5 angelegt werden). Wird eine offene Karte von einer Reihe auf eine andere gespielt, und eine verdeckt Karte liegt frei, so wird die Karte umgedreht. Leere Reihen können mit jeder Karte oder Sequenz belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Hierbei werden 10 Karten gezogen, jeweils eine wird an jede Kartenreihe angelegt. Der Talon wird nur einmal durchgespielt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Eight Off wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel, 8 Zwischenablagefelder und 8 Kartenreihen, die mit jeweils 6 Karten belegt sind. 4 der 8 Zwischenablagefelder sind belegt. Alle Karten sind aufgedeckt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz der gleichen Farbe handeln muss (also z.B. Pik 9 kann an Pik 10 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen und wenn entsprechend viele Zwischenablagefelder frei sind. Die obersten Karten der Kartenreihen können auf leere Zwischenablagefelder gespielt werden, die jeweils nur eine Karte aufnehmen können. Passende Karten können von den Zwischenablagefeldern wieder auf die Kartenreihen gespielt werden. Leere Kartenreihen können mit Königen oder Königssequenzen aufgefüllt werden. Es gibt keinen Talon und die Karten werden nicht gemischt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Freecell wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel, 4 Zwischenablagefelder (die free cells) und 8 Kartenreihen. Die erste bis vierte Kartenreihe hat jeweils 7 Karten und die fünfte bis achte Reihe hat 6 Karten. Alle Karten sind aufgedeckt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen und wenn entsprechend viele Zwischenablagefelder frei sind. Die obersten Karten der Kartenreihen können auf leere Zwischenablagefelder gespielt werden, die jeweils nur eine Karte aufnehmen können. Passende Karten können von den Zwischenablagefeldern wieder auf die Kartenreihen gespielt werden. Leere Kartenreihen können mit beliebigen Karten oder Sequenzen aufgefüllt werden. Es gibt keinen Talon und die Karten werden auch nicht gemischt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Forecell wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel, 4 Zwischenablagefelder und 8 Kartenreihen, die mit jeweils 6 Karten belegt sind. Die Zwischenablagefelder sind belegt. Alle Karten sind aufgedeckt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen und wenn entsprechend viele Zwischenablagefelder frei sind. Die obersten Karten der Kartenreihen können auf leere Zwischenablagefelder gespielt werden, die jeweils nur eine Karte aufnehmen können. Passende Karten können von den Zwischenablagefeldern wieder auf die Kartenreihen gespielt werden. Leere Kartenreihen können mit Königen oder Königssequenzen aufgefüllt werden. Es gibt keinen Talon und die Karten werden auch nicht gemischt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Australian wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 7 Kartenreihen, die mit jeweils 6 Karten belegt sind. Alle Karten auf dem Tableau sind aufgedeckt, ausgenommen der Talon.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Leere Kartenreihen können mit Königen oder Königssequenzen aufgefüllt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Der Talon kann beliebig oft durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Betrothal wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 1 Ablagestapel und 1 Kartenreihe. Alle Karten auf dem Tableau sind aufgedeckt, ausgenommen der Talon.|Die Karten werden nacheinander vom Talon gezogen und an die erste Karte, die Herz Dame angelegt. Es können Karten auf den Ablagestapel gespielt werden, die sich zwischen zwei gleichartigen Karten befinden. Diese Karten müssen entweder den gleichen Rang oder die gleiche Farbe haben. Der Talon wird nur einmal durchgespielt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen, mit Ausnahme von Herz Dame und Herz König.",..
				"Blind Alleys wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 6 Kartenreihen, die mit je 3 Karten ausgelegt werden. Die oberste Karte einer jeden Reihe ist aufgedeckt. Die 4 Asse sind bereits auf den Ablagestapeln ausgelegt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Wird eine offene Karte von einer Reihe auf eine andere gespielt, so wird die darunterliegende verdeckte Karte umgedreht. Leere Reihen können beliebig belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Der Talon kann zweimal durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Blanket wird mit 52 Karten (1 Kartenset) gespielt. Auf dem Tableau sind alle Karten aufgedeckt und greifbar. Die 4 Asse werden entfernt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (2 bis König) geordnet nach Farben in eine Reihe zu legen. |An die leeren Stellen, wo die Asse entfernt worden sind, können andere Karten abgelegt werden. Die Karten müssen einen Wert höher sein, als die links daneben liegende Karte und die gleiche Farbe haben. Eine Kreuz 7 kann also rechts neben eine Kreuz 6 gelegt werden. Rechts vom König kann somit nichts abgelegt werden, weil diese Karte den höchsten Wert hat. Wenn eines der ersten Felder einer Reihe frei wird, dann kann dort eine 2 hingezogen werden. Gibt es keine weiteren Züge mehr, können die Karten gemischt und neu ausgelegt werden. Dies ist zweimal erlaubt.|Das Spiel ist gewonnen, wenn alle Karten farblich sortiert in ihren Reihen in der richtigen Reihenfolge liegen.",..
				"Can Can wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel, 3 Zwischenablagefelder und 13 Kartenreihen. Die 3 Zwischenablagefelder sind belegt. Die ersten 7 Kartenreihen werden von links nach rechts mit 1 bis 7 Karten ausgelegt, die Reihen 8 bis 13 werden mit 6 bis 1 Karten ausgelegt. Die oberste Karte einer jeden Reihe ist aufgedeckt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Wird eine offene Karte von einer Reihe auf eine andere gespielt, so wird die darunterliegende verdeckte Karte umgedreht. Leere Reihen können mit einem König oder einer Sequenz, die mit einem König startet, belegt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Cruel wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel, und 12 Kartenstapel. Die 4 Asse sind bereits auf den Ablagestapeln abgelegt. Alle Karten sind offen, liegen aber übereinander und nur die oberste Karte ist spielbar.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die jeweils oberste Karte eines jeden der 12 Spielstapel ist auf einen anderen Kartenstapel spielbar. Hierfür gilt es zu beachten, dass es sich um die gleiche Farbe handeln muss und dass es sich um eine absteigende Reihenfolge handeln muss (z.B. kann Karo 7 auf Karo 8 gelegt werden). Leere Reihen können nicht belegt werden. Wenn man das leere Talonfeld anklickt, dann werden die Karten neu auf dem Tableau verteilt. Sie werden eingesammelt und wieder auf dem Tableau verteilt, ohne gemischt zu werden. Wird keine Karte zwischen zwei Verteilvorgängen verlegt, so bleibt die Kartenverteilung identisch. Ist also kein Spielzug auf dem Tableau mehr möglich, ist das Spiel verloren.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Pyramid wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 1 Ablagestapel. 28 Karten werden pyramidenförmig auf dem Tableau ausgeteilt, mit dem Bild nach oben. Hierbei überlappen sich die Karten. Die erste Reihe hat eine Karte, die zweite Reihe hat zwei Karten usw., bis zur achten Reihe, in der 8 Karten ausgelegt sind. Die Karten der größeren Reihen sind leicht versetzt zu den kleineren angeordnet und überlappen diese. Nur freiliegende Karten sind spielbar. Die anderen 28 Karten bilden den Talon.|Ziel des Spiels ist es, alle Karten auf den Ablagestapel zu spielen. |Es müssen immer zwei Karten gesucht werden, die zusammen den Wert 13 ergeben, wobei das As 1, der Bube 11, die Dame 12 und der König 13 zählt. Es passen also 7 + 6, 8 + 5, 9 + 4, 10 + 3, Bube + 2, Dame + As. Der König hat alleine den Wert 13 und kann so einzeln auf den Ablagestapel gespielt werden. Es können Kartenpaare auf dem Tableau, aber auch mit dem Talon oder nur vom Talon gebildet werden. Der Talon kann insgesamt dreimal durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Golf wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 1 Ablagestapel, und 7 Kartenreihen. Alle Karten sind offen, nur die oberste Karte ist spielbar.|Ziel des Spiels ist es, das Tableau zu leeren und alle Karten auf den Ablagestapel zu spielen. |Eine Karte kann dann auf den Ablagestapel gespielt werden, wenn sie einen Wert höher oder niedriger ist, als die oberste Karte auf dem Ablagestapel, Farbe ist dabei egal (z.B. kann Karo 7 auf Herz 8 gelegt werden). Die Karten können auf dem Tableau nicht bewegt werden, also nicht an andere Reihen angelegt werden. Leere Reihen können ebenfalls nicht wieder belegt werden. Wenn keine Karte vom Tableau mehr auf den Ablagestapel gespielt werden kann, werden Karten vom Talon gezogen, bis es wieder möglich ist, Karten vom Tableau auf den Ablagestapel zu spielen. Der Talon wird nur einmal durchgespielt und nicht gemischt.|Das Spiel ist gewonnen, wenn alle Karten auf dem Ablagestapel liegen.",..
				"Yukon wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 7 Kartenreihen. |Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die 7 Kartenreihen werden auf dem Tableau von links nach rechts ausgelegt, beginnend mit einer Karte in der ersten Reihe und 6 bis 11 Karten auf den Reihen 2 bis 7. Die jeweils oberste Karte und 4 weitere Karten werden auf den Kartenreihen 2 bis 7 aufgedeckt. Freiliegende Asse werden auf die Ablagestapel gelegt und darauf die weiteren Karten in aufsteigender Reihenfolge geordnet nach Farben. Jede offene Karte einer Kartenreihen darf auf die oberste Karte einer anderen Kartenreihe gelegt werden, sie muss aber eine andere Farbe und absteigende Reihenfolge einhalten (also z.B. Pik Bube auf Herz Dame). Es kann also auch eine Karte einfach aus der Mitte gespielt werden, die unten anliegenden Karten werden mitgezogen. Auf leeren Kartenreihen darf nur ein König bzw. eine Sequenz beginnend mit einem König platziert werden. |Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Four Colors wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 7 Kartenreihen und 4 Ablagestapel, dazu 4 Zwischenablagefelder, eines für jede Farbe.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die ersten 4 Kartenreihen werden auf dem Tableau nach Farben ausgelegt, d.h. eine Reihe besteht nur aus Karo Karten, eine Reihe nur aus Herz, eine Reihe nur aus Pik und eine Reihe nur aus Kreuz Karten.  Drei weitere Reihen sind noch leer und können beliebig belegt werden. Alle Karten liegen offen und können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Die obersten Karten der Kartenreihen können auf leere Zwischenablagefelder gespielt werden, die jeweils nur eine Karte aufnehmen können und von denen es nur eines pro Farbe gibt. Passende Karten können von den Zwischenablagefeldern wieder auf die Kartenreihen gespielt werden. Leere Kartenreihen können mit beliebigen Karten oder Sequenzen aufgefüllt werden. Es gibt keinen Talon und die Karten werden auch nicht gemischt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Scorpion wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 7 Kartenreihen und 1 Ablagestapel.|Ziel des Spiels ist es, alle Karten in absteigender Reihenfolge (König bis As) nach Farben geordnet auf dem Tableau zu bilden. Erst wenn eine ununterbrochene Sequenz vollständig auf dem Tableau erstellt ist, wird sie automatisch auf den Ablagestapel gespielt.|Die 7 Kartenreihen werden auf dem Tableau mit jeweils 7 Karten ausgelegt. Alle Karten sind offen, bis auf die untersten 3 der ersten 4 Kartenreihen. Jede offene Karte einer Kartenreihen darf auf die oberste Karte einer anderen Kartenreihe gelegt werden, sie muss aber die gleiche Farbe und absteigende Reihenfolge einhalten (beispielsweise Karo 9 auf Karo 10). Es kann also auch eine Karte einfach aus der Mitte gespielt werden, die unten anliegenden Karten werden mitgezogen. Auf leeren Kartenreihen darf nur ein König oder eine Reihe, die mit einem König beginnt, platziert werden. Der Talon ist verdeckt und besteht aus 3 Karten. Ist kein Verschieben der Karten auf dem Tableau mehr möglich, werden diese 3 Karten gezogen und an die erste bis dritte Reihe angelegt.|Das Spiel ist gewonnen, wenn keine Karten mehr auf dem Tableau liegen.",..
				"Klondike double 1 card wird mit 104 Karten (2 Kartensets) gespielt. Es gibt 8 Ablagestapel und 7 Kartenreihen, die von links nach rechts mit 1 bis 7 Karten ausgelegt werden. Die oberste Karte einer jeden Reihe ist aufgedeckt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Wird eine offene Karte von einer Reihe auf eine andere gespielt, so wird die darunterliegende verdeckte Karte umgedreht. Leere Reihen können mit einem König oder einer Sequenz, die mit einem König startet, belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Der Talon kann beliebig oft durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Klondike double 3 card wird mit 104 Karten (2 Kartensets) gespielt. Es gibt 8 Ablagestapel und 7 Kartenreihen, die von links nach rechts mit 1 bis 7 Karten ausgelegt werden. Die oberste Karte einer jeden Reihe ist aufgedeckt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss und die Farben Rot-Schwarz wechseln müssen (also z.B. Pik 6 kann an Herz 7 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Wird eine offene Karte von einer Reihe auf eine andere gespielt, so wird die darunterliegende verdeckte Karte umgedreht. Leere Reihen können mit einem König oder einer Sequenz, die mit einem König startet, belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Hierbei werden immer 3 Karten umgedreht aber nur die oberste Karte ist spielbar. Der Talon kann beliebig oft durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Russian wird mit 52 Karten (1 Kartenset) gespielt, dabei sind aber nur 3 Farben vorhanden, eine fehlt und eine ist doppelt. Es gibt 7 Kartenreihen und 4 Ablagestapel.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die 7 Kartenreihen werden auf dem Tableau von links nach rechts ausgelegt, beginnend mit einer Karte in der ersten Reihe und 6 bis 11 Karten auf den Reihen 2 bis 7. Die jeweils oberste Karte und 4 weitere Karten werden auf den Kartenreihen 2 bis 7 aufgedeckt. Freiliegende Asse werden auf die Ablagestapel gelegt und darauf die weiteren Karten in aufsteigender Reihenfolge geordnet nach Farben. Jede offene Karte einer Kartenreihen darf auf die oberste Karte einer anderen Kartenreihe gelegt werden, sie muss aber die gleiche Farbe und absteigende Reihenfolge einhalten. Es kann also auch eine Karte einfach aus der Mitte gespielt werden, die unten anliegenden Karten werden mitgezogen. Auf leeren Kartenreihen darf nur ein König oder eine Königssequenz platziert werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Sea Towers wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel, 4 Zwischenablagefelder und 10 Kartenreihen, die mit jeweils 5 Karten belegt sind. 2 der 4 Zwischenablagefelder sind belegt. Alle Karten sind aufgedeckt.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz der gleichen Farbe handeln muss (also z.B. Pik 9 kann an Pik 10 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen und wenn entsprechend viele Zwischenablagefelder frei sind. Die obersten Karten der Kartenreihen können auf leere Zwischenablagefelder gespielt werden, die jeweils nur eine Karte aufnehmen können. Passende Karten können von den Zwischenablagefeldern wieder auf die Kartenreihen gespielt werden. Leere Kartenreihen können mit Königen oder Königssequenzen aufgefüllt werden. Es gibt keinen Talon und die Karten werden nicht gemischt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Limited covered wird mit 104 Karten (2 Kartensets) gespielt. Es gibt 8 Ablagestapel und 12 Kartenreihen mit je 3 Karten von denen die oberste umgedreht ist.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln und die Farbe gleich sein muss (z.B. Kreuz 4 kann an Kreuz 5 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Wird eine offene Karte von einer Reihe auf eine andere gespielt, so wird die darunterliegende verdeckte Karte umgedreht. Leere Reihen können beliebig neu belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Der Talon darf nur einmal durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Lady Palk wird mit 104 Karten (2 Kartensets) gespielt. Es gibt 8 Ablagestapel und 8 Kartenreihen mit je 4 Karten, die alle offen liegen.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz handeln muss, Farbe spielt keine Rolle (z.B. Kreuz 4 kann an Pik 5 angelegt werden). Es können auch mehrere Karten auf einmal verschoben werden, wenn sie in der richtigen Reihenfolge liegen. Leere Reihen können beliebig neu belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Der Talon darf nur einmal durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Labyrinth wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 6 Kartenreihen, von denen die oberste Reihe zu Beginn belegt wird. Die Asse werden auf die Ablagestapel gelegt. Alle Karten auf dem Tableau sind aufgedeckt und greibar.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten auf dem Tableau können auf den Ablagestapeln abgelegt werden, wenn sie von oben oder unten frei liegen. Die erste Reihe liegt natürlich von Beginn an und auch später frei, da sich darüber keine weitere Reihe befindet. Passt eine Karte auf einen der Ablagestapel, wird diese aus der Kartenreihe vom Tableau entfernt und auf dem Ablagestapel abgelegt. Ist keine weitere Karte der Reihe mehr spielbar, wird eine weitere komplette Reihe vom Talon ausgelegt, und man kann wieder Karten vom Tableau auf die Ablagestapel legen. Das wird wiederholt, bis alle 6 Reihen ausgelegt sind. Die Löcher werden nicht aufgefüllt, mit Ausnahme der ersten Reihe, die Löcher der ersten Reihe werden umgehend wieder mit Karten geschlossen. Durch das Entfernen der Karten entsteht auf dem Tableau eine labyrinth-ähnliche Anordnung. Der Talon wird nur einmal durchgespielt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Labyrinth easy wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 6 Kartenreihen, von denen die oberste Reihe zu Beginn belegt wird. Die Asse werden auf die Ablagestapel gelegt. Alle Karten auf dem Tableau sind aufgedeckt und greibar.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten auf dem Tableau können auf den Ablagestapeln abgelegt werden, wenn sie von oben oder unten frei liegen. Die erste Reihe liegt natürlich von Beginn an und auch später frei, da sich darüber keine weitere Reihe befindet. Passt eine Karte auf einen der Ablagestapel, wird diese aus der Kartenreihe vom Tableau entfernt und auf dem Ablagestapel abgelegt. Ist keine weitere Karte der Reihe mehr spielbar, wird eine weitere komplette Reihe vom Talon ausgelegt, und man kann wieder Karten vom Tableau auf die Ablagestapel legen. Das wird wiederholt, bis alle 6 Reihen ausgelegt sind. Die Löcher werden nicht aufgefüllt und im Gegensatz zum normalen Labyrinth werden auch nicht die Löcher der ersten Reihe wieder aufgefüllt. Durch das Entfernen der Karten entsteht auf dem Tableau eine labyrinth-ähnliche Anordnung. Der Talon wird nur einmal durchgespielt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Labyrinth Rodenbach wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 6 Kartenreihen, von denen die oberste Reihe zu Beginn belegt wird. Die Asse werden auf die Ablagestapel gelegt. Alle Karten auf dem Tableau sind aufgedeckt und greibar.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten auf dem Tableau können auf den Ablagestapeln abgelegt werden, wenn sie von oben, unten, links oder rechts frei liegen. Die erste Reihe liegt natürlich von Beginn an und auch später frei, da sich darüber keine weitere Reihe befindet. Passt eine Karte auf einen der Ablagestapel, wird diese aus der Kartenreihe vom Tableau entfernt und auf dem Ablagestapel abgelegt. Ist keine weitere Karte der Reihe mehr spielbar, wird eine weitere komplette Reihe vom Talon ausgelegt, und man kann wieder Karten vom Tableau auf die Ablagestapel legen. Das wird wiederholt, bis alle 6 Reihen ausgelegt sind. Die Löcher werden nicht aufgefüllt und im Gegensatz zum normalen Labyrinth werden auch nicht die Löcher der ersten Reihe wieder aufgefüllt. Durch das Entfernen der Karten entsteht auf dem Tableau eine labyrinth-ähnliche Anordnung. Der Talon wird nur einmal durchgespielt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Labyrinth Double  wird mit 104 Karten (2 Kartensets) gespielt. Es gibt 8 Ablagestapel und 6 Kartenreihen, von denen die oberste Reihe zu Beginn belegt wird. Die Asse werden auf die Ablagestapel gelegt. Alle Karten auf dem Tableau sind aufgedeckt und greibar.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten auf dem Tableau können auf den Ablagestapeln abgelegt werden, wenn sie von oben oder unten frei liegen. Die erste Reihe liegt natürlich von Beginn an und auch später frei, da sich darüber keine weitere Reihe befindet. Passt eine Karte auf einen der Ablagestapel, wird diese aus der Kartenreihe vom Tableau entfernt und auf dem Ablagestapel abgelegt. Ist keine weitere Karte der Reihe mehr spielbar, wird eine weitere komplette Reihe vom Talon ausgelegt, und man kann wieder Karten vom Tableau auf die Ablagestapel legen. Das wird wiederholt, bis alle 6 Reihen ausgelegt sind. Die Löcher werden nicht aufgefüllt und im Gegensatz zum normalen Labyrinth werden auch nicht die Löcher der ersten Reihe wieder aufgefüllt. Durch das Entfernen der Karten entsteht auf dem Tableau eine labyrinth-ähnliche Anordnung. Der Talon wird nur einmal durchgespielt.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Osmosis wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 4 Kartenreihen mit je 4 Karten in horizontaler Anordnung, von denen die jeweils oberste Karte aufgedeckt ist. Die erste Karte, die vom Talon gespielt wird, ist die Startkarte für den ersten Ablagestapel. Die anderen 3 Ablagestapel darunter müssen ebenfalls mit diesem Wert starten. |Beispiel: ist die erste Karte eine Herz 5, dann können die anderen Ablagestapel erst dann mit anderen Karten belegt werden, wenn die entsprechende 5 der jeweiligen Farbe auf dem Ablagestapel liegt, also während des Spiels aufgedeckt werden. Für die Sequenzen auf den Ablagestapeln ist nur die Farbe entscheidend, der Wert ist egal. Gemäß unserem Beispiel könnte jede weitere Herz Karte an die Herz 5 angelegt werden.|Für die darunter liegenden Ablagestapel ist wichtig, dass die jeweils anzulegende Karte schon auf dem darüberliegenden Stapel vorhanden ist. Wenn auf dem ersten Stapel Herz 5, Herz 9 und Herz König liegen, und auf dem darunter liegenden Ablagestapel nur eine Pik 5 liegt, dann passt hierzu auch nur Pik 9 oder Pik König, eine Pik 2 wäre also nicht spielbar.|Wenn keine Möglichkeit mehr besteht, von den Kartenreihen auf die Ablagestapel abzulegen, werden Karten vom verdeckten Talon gezogen, und zwar immer 3 Karten auf einmal, aber nur die oberste ist spielbar. Der Talon kann beliebig oft durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Golf easy wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 1 Ablagestapel, und 7 Kartenreihen. Alle Karten sind offen, nur die oberste Karte ist spielbar.|Ziel des Spiels ist es, das Tableau zu leeren und alle Karten auf den Ablagestapel zu spielen. |Eine Karte kann dann auf den Ablagestapel gespielt werden, wenn sie einen Wert höher oder niedriger ist, als die oberste Karte auf dem Ablagestapel, Farbe ist dabei egal (z.B. kann Karo 7 auf Herz 8 gelegt werden). Im Gegensatz zum normalen Golf kann  ein As auf einen König gelegt werden und umgekehrt. Die Karten können auf dem Tableau nicht bewegt werden, also nicht an andere Reihen angelegt werden. Leere Reihen können ebenfalls nicht wieder belegt werden. Wenn keine Karte vom Tableau mehr auf den Ablagestapel gespielt werden kann, werden Karten vom Talon gezogen, bis es wieder möglich ist, Karten vom Tableau auf den Ablagestapel zu spielen. Der Talon wird nur einmal durchgespielt und nicht gemischt.|Das Spiel ist gewonnen, wenn alle Karten auf dem Ablagestapel liegen.",..
				"King´s Peak wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 8 Kartenreihen und 4 Ablagefelder für die Könige. Alle Karten sind offen, nur die Karten vom Talon sind spielbar.|Ziel des Spiels ist es, den Talon zu leeren und alle Karten auf dem Tableau abzulegen. |Die Kartenreihen müssen in der richtigen Reihe aufgefüllt werden. Die linken Reihen haben die Reihenfolge 6 bis 1, die rechten Reihen haben die Reihenfolge 7 bis Dame. Karten werden vom Talon gezogen und auf die Reihen abgelegt, wenn sie vom Rang und von der Farbe her passen (z.B. kann Karo 8 auf Karo 7 gelegt werden). Die Karten können auf dem Tableau nicht verschoben werden. Der Talon kann dreimal durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf dem Tableau abgelegt sind und der Talon leer ist.",..
				"Forty Thieves wird mit 104 Karten (2 Kartensets) gespielt. Es gibt 8 Ablagestapel und 10 Kartenreihen mit je 4 Karten, die alle offen liegen.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz der gleichen Farbe handeln muss (z.B. Kreuz 4 kann an Kreuz 5 angelegt werden). Mehrere Karten, auch wenn sie in der richtigen Sequenz liegen, können nicht verschoben werden, nur die oberste Karte einer Reihe. Leere Reihen können beliebig neu belegt werden. Kann auf dem Tableau keine Karte mehr verschoben werden, dann wird vom Talon gezogen. Der Talon darf nur einmal durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"La Bell Lucie wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 17 Kartenreihen mit je 3 Karten, sowie eine einzelne Karte. Alle Karten liegen offen.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz der gleichen Farbe handeln muss (z.B. Kreuz 4 kann an Kreuz 5 angelegt werden). Mehrere Karten, auch wenn sie in der richtigen Sequenz liegen, können nicht verschoben werden, nur die oberste Karte einer Reihe. Leere Reihen können nicht neu belegt werden. Ist kein Zug auf dem Tableau mehr möglich, dann kann durch klicken auf den leeren Talon neu gemischt werden. Insgesamt kann zweimal neu gemischt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"La Facile Lucie wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Ablagestapel und 17 Kartenreihen mit je 3 Karten, sowie eine einzelne Karte. Alle Karten liegen offen.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die Karten können auf dem Tableau zwischen den Reihen verschoben werden. Hierfür gilt es zu beachten, dass es sich um eine absteigende Sequenz der gleichen Farbe handeln muss (z.B. Kreuz 4 kann an Kreuz 5 angelegt werden). Mehrere Karten, auch wenn sie in der richtigen Sequenz liegen, können nicht verschoben werden, nur die oberste Karte einer Reihe. Leere Reihen können mit einem König neu belegt werden. Ist kein Zug auf dem Tableau mehr möglich, dann kann durch klicken auf den leeren Talon neu gemischt werden. Insgesamt kann zweimal neu gemischt werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Russian easy wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 8 Kartenreihen und 4 Ablagestapel.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |8 Kartenreihen werden auf dem Tableau von links nach rechts ausgelegt. Die erste Reihe bleibt frei und kann mit einem König oder einer Königssequenz belegt werden. In die zweite Reihe wird eine Karte offen ausgelegt. Auf den Reihen 3 bis 8 werden 6 bis 11 Karten ausgelegt. Die jeweils oberste Karte und 4 weitere Karten werden auf den Kartenreihen 3 bis 7 aufgedeckt. Freiliegende Asse werden auf die Ablagestapel gelegt und darauf die weiteren Karten in aufsteigender Reihenfolge geordnet nach Farben. Jede offene Karte einer Kartenreihen darf auf die oberste Karte einer anderen Kartenreihe gelegt werden, sie muss aber die gleiche Farbe und absteigende Reihenfolge einhalten. Es kann also auch eine Karte einfach aus der Mitte gespielt werden, die unten anliegenden Karten werden mitgezogen. Auf leeren Kartenreihen darf nur ein König oder eine Königssequenz platziert werden.|Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Russian free wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 7 Kartenreihen und 4 Ablagestapel, dazu 4 Zwischenablagefelder, eines für jede Farbe.|Ziel des Spiels ist es, alle Karten in aufsteigender Reihenfolge (As bis König) geordnet nach Farben auf die Ablagestapel zu spielen. |Die 7 Kartenreihen werden auf dem Tableau von links nach rechts ausgelegt, beginnend mit einer Karte in der ersten Reihe und 6 bis 11 Karten auf den Reihen 2 bis 7. Die jeweils oberste Karte und 4 weitere Karten werden auf den Kartenreihen 2 bis 7 aufgedeckt. Freiliegende Asse werden auf die Ablagestapel gelegt und darauf die weiteren Karten in aufsteigender Reihenfolge geordnet nach Farben. Jede offene Karte einer Kartenreihen darf auf die oberste Karte einer anderen Kartenreihe gelegt werden, sie muss aber die gleiche Farbe und absteigende Reihenfolge einhalten. Es kann also auch eine Karte einfach aus der Mitte gespielt werden, die unten anliegenden Karten werden mitgezogen. Auf leeren Kartenreihen darf nur ein König oder eine Königssequenz platziert werden. Die 4 Zwischenablagefelder können mit allen Karten belegt werden, je eine Farbe ist erlaubt. |Das Spiel ist gewonnen, wenn alle Karten auf den Ablagestapeln liegen.",..
				"Aces Up wird mit 52 Karten (1 Kartenset) gespielt. Es gibt 4 Kartenreihen und einen Ablagestapel. Ziel des Spiels ist es, alle Karten auf den Ablagestapel zu spielen, mit Ausnahme der 4 Asse. Diese verbleiben auf den Kartenreihen. |Bei Spielstart werden 4 Karten (jeweils eine pro Kartenreihe) auf dem Tableau abgelegt. Wenn zwei oder mehr Karten der gleichen Farbe aufgedeckt sind, kann die jeweils niedrigere auf den Ablagestapel gespielt werden. Die Reihenfolge der Kartenwerte ist leicht verändert (in Bezug auf andere Solitaire Varianten): das As ist nicht die niedrigste, sondern die höchste Karte. Kann keine Karte mehr von den Kartenreihen gespielt werden, dann werden 4 Karten vom Talon gezogen, je eine wird pro Kartenreihe abgelegt. |Der Talon darf nur einmal durchgespielt werden.|Das Spiel ist gewonnen, wenn alle Karten mit Ausnahme der 4 Asse auf dem Ablagestapel liegen.",..
				"<acme>",..
				"<aces up easy>",..
				"<ant>",..
				"<aunt mary>",..
				"<aunt free mary>",..
				"<baker's dozen>",..
				"<baker's game>",..
				"<flower garden>",..
				"<gargantua>",..
				"<giant>",..
				"<indian>",..
				"<miss milligan>",..
				"<klondike contra>",..
				"<contraflow>",..
				"<freecell double>",..
				"<single rail>",..
				"<solid square>",..
				"<spiderette>",..
				"<stonewall>",..
				"<spiderlinge>",..
				"<maze>",..
				"<martha>",..
				"<limited>",..
				"<napoleaons square>",..
				"<pyramid double>",..
				"<free wall>",..
				"<carre napoleon>",..
				"<maze easy>",..
				"<maze twosuit>",..
				"<maze easy two suit>",..
				"<blanket two suit>",..
				"<pairs cross>",..
				"<stonewall easy>",..
				"<forty thieves double stock>",..
				"<forty thieves redeal>",..
				"<pyramid reserve>",..
				"<spider super stock>",..
				"<sweet match five>",..
				"<very easy>"..
				]
EndRem

'******************************************************************************************************************
'										G A M E S P I D E R O N E S U I T E
'******************************************************************************************************************
Type _gamespideronesuit Extends _game
	Method initgeneral(s:_solitaire,mo)	
				initgame(s,mo,SPIDER_1)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(10,-11,7)
				'If mode>0 
				 createpilestock(-11,7+taby,1,0)
				 For Local pdx#=0 To 7
				  createpilediscard(-9+tabx+pdx*tabx,7+taby)
				 Next
				'Else 
				' createpilestock(16,-12,1,0)
				' For Local pdx#=0 To 7
				'  createpilediscard(10-tabx*pdx,-12)
				 'Next
				'EndIf
				tableaugivesamesuit(True);
				tableaugivedescending(True);
				tableautakesamesuit(True);
				tableautakedescending(True);
				createcards(8,Rand(0,3))
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(0.5,0,-39)
				cameraposition[2].set(1,2,-39)
				camerapositionmenu[2].set(4,9,-57)
				camerapositionpreview[1].set(4,0,-75)
				camerapositionpreview[2].set(0,-7,-80)
				rectangle[0].set(-11,-6)
				rectangle[1].set(-11+10*tabx,7+taby)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,2,0,50,9)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,50,9,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),104,60,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),90,10)
				a3.soundsingle=True
				For Local n=0 To 3
				 a3.use(piletableau(n),6)
				Next
				For Local n=4 To 9
				 a3.use(piletableau(n),5)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 3 
				 as.use(piletableau(n),6)
				Next
				For n=4 To 9
				 as.use(piletableau(n),5)
				Next	
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				a4.usesoundaction=False
				a4.usesoundstart=False
				a4.soundstart=solitaire.sspend
				For Local n=0 To 9 
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tipptableaucompleterow()
				 tippexecutecompleterow();Return(True);
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableau(0,True,True,True)
				 tippexecutemove();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tippwaste()				
				 tippexecutemove();Return(True);
				 Print "tippwaste"
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod	
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tipptableaucompleterow()
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf autoplaymovetableau(1)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If tipptableaucompleterow() And solitaire.autodiscard
				  autoplayanimationpiletopile(True,True);Return(True);
	 			 ElseIf tipptableauturn() And solitaire.autoturncard
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,15,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile() And solitaire.autoempty
				  autoplayanimationpiletopile(True,True);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplaycompleterow(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplaytableaumove(card,True,True,True)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaytableauemptypile(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				EndIf
				Return(False);
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E S P I D E R T W O S U I T 
'******************************************************************************************************************
Type _gamespidertwosuit Extends _gamespideronesuit
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,SPIDER_2)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local suit[2]
				createpiletableau(10,-11,7)
				'If mode>0 
				 createpilestock(-11,7+taby,1,0)
				 For Local pdx#=0 To 7
				  createpilediscard(-9+tabx+pdx*tabx,7+taby)
				 Next
				'Else 
				' createpilestock(16,-12,1,0)
				' For Local pdx#=0 To 7
				'  createpilediscard(10-tabx*pdx,-12)
				' Next
				'EndIf
				tableaugivesamesuit(True);
				tableaugivedescending(True);
				tableautakedescending(True);
				suit[0]=Rand(0,3)
				If suit[0]=0 suit[1]=Rand(1,2)
				If suit[0]=1 suit[1]=Rand(0,1)*3
				If suit[0]=2 suit[1]=Rand(0,1)*3
				If suit[0]=3 suit[1]=Rand(1,2)
				createcards(4,suit[0])
				createcards(4,suit[1])
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(0.5,0,-39)
				cameraposition[2].set(1,2,-39)
				camerapositionmenu[2].set(4,9,-57)
				camerapositionpreview[1].set(4,0,-75)
				camerapositionpreview[2].set(0,-7,-80)
				rectangle[0].set(-11,-6)
				rectangle[1].set(-11+10*tabx,7+taby)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,2,0,50,9)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,50,9,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),104,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				a3.soundsingle=False
				For n=0 To 3
				 a3.use(piletableau(n),6)
				Next
				For n=4 To 9
				 a3.use(piletableau(n),5)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 3 
				 as.use(piletableau(n),6)
				Next
				For n=4 To 9
				 as.use(piletableau(n),5)
				Next	
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				a4.soundaction=solitaire.ssingle
				a4.usesoundaction=False
				a4.usesoundstart=False
				For Local n=0 To 9 
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tipptableaucompleterow()
				 tippexecutecompleterow();Return(True);
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tipptableau(0,True)
				 tippexecutemove();Return(True);
				ElseIf tipptableau(0,False)
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod	
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tipptableaucompleterow()
	 			  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
 				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod
	Method clickplay(card:_card)
				 startusing()
				 deinsertpick()
				 If clickplaycompleterow(card)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf card.turnedup()=False
				  card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				 ElseIf clickplaytableauemptypile(card)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf clickplaytableaumove(card,True)
			 	  autoplayanimationpiletopile();Return(True);
				 ElseIf clickplaytableaumove(card)
				  autoplayanimationpiletopile();Return(True);
				 EndIf
				Return(False);
				EndMethod
				
	EndType
'******************************************************************************************************************
'										G A M E S P I D E R F O U R S U I T 
'******************************************************************************************************************
Type _gamespiderfoursuit Extends _gamespidertwosuit
	Method initgeneral(s:_solitaire,mo)				
				Local suit[2]
				initgame(s,mo,SPIDER_4)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(10,-11,7)
				'If mode>0 
				 createpilestock(-11,7+taby,1,0)
				 For Local pdx#=0 To 7
				  createpilediscard(-9+tabx+pdx*tabx,7+taby)
				 Next
				'Else 
				' createpilestock(16,-12,1,0)
				' For Local pdx#=0 To 7
				'  createpilediscard(10-tabx*pdx,-12)
				' Next
				'EndIf
				tableaugivesamesuit(True);
				tableaugivedescending(True);
				tableautakedescending(True);
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(0.5,0,-39)
				cameraposition[2].set(1,2,-39)
				camerapositionmenu[2].set(4,9,-57)
				camerapositionpreview[1].set(4,0,-75)
				camerapositionpreview[2].set(0,-7,-80)
				rectangle[0].set(-11,-6)
				rectangle[1].set(-11+10*tabx,7+taby)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,2,0,50,9)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,50,9,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),104,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				a3.soundsingle=False
				For n=0 To 3
				 a3.use(piletableau(n),6)
				Next
				For n=4 To 9
				 a3.use(piletableau(n),5)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 3 
				 as.use(piletableau(n),6)
				Next
				For n=4 To 9
				 as.use(piletableau(n),5)
				Next	
			
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For Local n=0 To 9 
				 a4.use(piletableau(n))
				Next
				a4.usesoundaction=False
				a4.usesoundstart=False
				a4.soundstart=solitaire.sspend

				setanimationpreparative()
				update()
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E S C O R P I O N 
'******************************************************************************************************************
Type _gamescorpion Extends _gamespideronesuit
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,SCORPION)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7)
				'If mode>0
				 createpilestock(-11,7+taby,1,0)
				 createpilediscard(-11+tabx,7+taby)
				'Else 
				' createpilestock(16,-12,1,0)
				' createpilediscard(12,-12)
				'EndIf				
				tableautakesamesuit(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,1,-30)				
				cameraposition[1].set(-3,2,-30)				
				cameraposition[2].set(-3,4,-32)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(4,0,-75)
				camerapositionpreview[2].set(0,-4,-70)
				rectangle[0].set(-11,-3)
				rectangle[1].set(-11+7*tabx,7+taby)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,2,0,50,9)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,50,9,True)
				
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),52-7*7,60,30)
				
				
				Local i=3
				Local ar:_animationrotation
				For n=0 To 3 
				 ar=New _animationrotation
				 ar.init(Self,0,0,0,180,2,16,4,i)
				 i:+7
				Next
				i=7*4
				
				For n=4 To 6 
				 ar=New _animationrotation
				 ar.init(Self,0,0,0,180,2,16,7,i)
				 i:+7
				Next
				Local a3:_animationcardtopile=New _animationcardtopile
				a3.init(Self,30,40)
				For n=0 To 6
				 a3.use(piletableau(n),7)
				Next
				Local as:_animationpileshiftout=New _animationpileshiftout
				as.init(Self,15,30)
				For n=0 To 3
				 as.use(piletableau(n),4,3)
				Next
				For n=4 To 6
				 as.use(piletableau(n),7)
				Next	
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,10,50)
				For Local n=0 To 3 
				 a4.use(piletableau(n),4)
				Next
				For Local n=4 To 6
				 a4.use(piletableau(n),7)
				Next
				setanimationpreparative()
				shufflecards()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tipptableaucompleterow()
				 tippexecutecompleterow();Return(True);
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tipptableau(0)
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod	
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tipptableaucompleterow()
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If tipptableaucompleterow() And solitaire.autodiscard
				  autoplayanimationpiletopile(True,True);Return(True);
	 			 ElseIf tipptableauturn() And solitaire.autoturncard
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,15,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile() And solitaire.autoempty
				  autoplayanimationpiletopile(True,True);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplaycompleterow(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplaytableauemptypile(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod		
	EndType	
'******************************************************************************************************************
'										G A M E S P I D E R E T T E
'******************************************************************************************************************
Type _gamespiderette Extends _gamespideronesuit
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,SPIDERETTE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()			
				createpiletableau(7,-11,0)
				Local ps:_pilestock=createpilestock(-11,taby,1,0)
				ps.redealvalue=0
				For Local pdx#=0 To 3
				 createpilediscard(-9+tabx+pdx*tabx,taby)
				Next
				
				Local pr:_pilereserve=createpilereserve(-11+7*tabx+0.5,taby*0.5)
				pr.takerestriction=False				
				tableaugivesamesuit(True);
				tableaugivedescending(True);
				tableautakedescending(True);
				createcards(1,0)
				createcards(1,0)
				createcards(1,2)
				createcards(1,2)
				cameraposition[0].set(-6,0,-30)
				cameraposition[1].set(-4,0,-30)
				cameraposition[2].set(-2,-1,-28)
				camerapositionmenu[2].set(-1,1,-50)
				camerapositionpreview[1].set(4,0,-75)
				camerapositionpreview[2].set(0,-2,-56)
				rectangle[0].set(-11,-6)
				rectangle[1].set(-11+7*tabx+0.5,taby)
				enlargerectangle()
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,2,0,50,9)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,50,9,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),104,60,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 6
				 a3.use(piletableau(n),n+1)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 6
				 as.use(piletableau(n),n+1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 6
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tipptableaucompleterow()
				 tippexecutecompleterow();Return(True);
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableau(0,True,True,True)
				 tippexecutemove();Return(True);
				ElseIf tipptableau(0,False,False,True)
				 tippexecutemove();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod	
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tipptableaucompleterow()
	 			  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf autoplaymovetableau(1,True,True,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,False,True,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tipptableauemptypile()
 				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod
	Method clickplay(card:_card)
				 startusing()
				 deinsertpick()
				 If clickplaycompleterow(card)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf card.turnedup()=False
				  card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				 ElseIf clickplaytableaumove(card,True,True,True)
			 	  autoplayanimationpiletopile();Return(True);
				 ElseIf clickplaytableaumove(card,False,True,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf clickplaytableauemptypile(card)
				  autoplayanimationpiletopile(True,True);Return(True);
				 EndIf
				Return(False);
				EndMethod				
	EndType			
'******************************************************************************************************************
'										G A M E S P I D E R L I N G E
'******************************************************************************************************************
Type _gamespiderlinge Extends _gamespideronesuit
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,SPIDERLINGE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pt:_piletableau
				Local w#=155
				For Local i=0 To 3'linke seite
				 pt=createpiletableau(1,Cos(w)*20+12.5,Sin(w)*20)
				 pt.vector.set(Cos(w),Sin(w),0);
				 w:+17
				 If i=0 
				  pt.camerastretch=False
				  pt.maximumlength=9
				 EndIf
				 If i=1
				  pt.camerastretch=False
				  pt.maximumlength=11
				 EndIf
				 If i=2
				  pt.camerastretch=False
				  pt.maximumlength=11
				 EndIf
				Next
				w=25
				For Local i=0 To 3 'rechts seite
				 pt=createpiletableau(1,Cos(w)*20-12.5,Sin(w)*20)
				 pt.vector.set(Cos(w),Sin(w),0);
				 w:-17
				Next
				createpilestock(0,0,1,0)
				Local pf:_pilefreecell
				pf=createpilefreecell(-tabx,0);pf.suit=0
				pf=createpilefreecell(+tabx,0);pf.suit=0
				For Local pdy#=0 To 0
				 For Local pdx#=0 To 1
				  createpilediscard(pdx*tabx-tabx*0.5,taby+0.5)
				 Next
				Next
				For Local pdy#=0 To 1
				 For Local pdx#=0 To 1
				  createpilediscard(pdx*tabx-tabx*0.5,-12.5+pdy*taby)
				 Next
				Next
				'tableaugivesamesuit(true);
				tableaugivedescending(True);
				'tableautakesamesuit(true);
				tableautakedescending(True);
				createcards(1,0)
				createcards(1,0)
				createcards(1,0)
				createcards(1,0)
				createcards(1,0)
				createcards(1,0)
				cameraposition[0].set(-3,-3,-35)
				cameraposition[1].set(-1,-1,-33)
				cameraposition[2].set(-1,-2,-36)
				camerapositionmenu[2].set(3-tabx,1,-50)
				camerapositionpreview[1].set(4,0,-88)
				camerapositionpreview[2].set(0,-2,-85)
				rectangle[0].set(-11,-12.5)
				rectangle[1].set(+11,2*taby)
				enlargerectangle()
				
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,2,0,50,9)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,50,9,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),104,60,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 7
				 a3.use(piletableau(n),7)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 7
				 as.use(piletableau(n),7)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 7
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType				
'******************************************************************************************************************
'										G A M E K L O N D I K E O N E 
'******************************************************************************************************************
Type _gameklondikeone Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,KLONDIKE_1)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby)
				Local px#=-11
				createpilestock(px,7,0,1)
				createpilewaste(px+tabx,7)
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-2,-30)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-3,0,-30)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(4,0,-60)
				camerapositionpreview[2].set(0,-2,-57)
				rectangle[0].set(-11,-6)
				rectangle[1].set(tabx*3,7)
				enlargerectangle()				
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),4*13,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 6
				 a3.use(piletableau(n),n+1)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 6
				 as.use(piletableau(n),n+1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 6
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);
				ElseIf tipptableau(0,False,False)
				 tippexecutemove();Return(True);
				ElseIf tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,False,False)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				 If solitaire.autoturncard
				  If tipptableauturn() 
				   For Local card:_card=EachIn foundlist
				    card.turn(solitaire.clock,15,True)
				   Next
				   Return(True);				
				  EndIf
				 EndIf
				 If solitaire.autoempty
				  If tipptableauemptypile() 
				   autoplayanimationpiletopile(True,True)
				   Return(True);
				  EndIf
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableauemptypile(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaywaste(card)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E K L O N D I K E O N E T W O D E C K
'******************************************************************************************************************
Type _gameklondikeonetwodeck Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,DKLONDIKE_1)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby)
				Local px#=-11
				createpilestock(px,7,0,1)
				createpilewaste(px+tabx,7)
				px=-1-tabx
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				createpilefoundation(px+tabx*4,7)
				createpilefoundation(px+tabx*5,7)
				createpilefoundation(px+tabx*6,7)
				createpilefoundation(px+tabx*7,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
 				tableautakeemptynumber(12);
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-40)				
				cameraposition[1].set(1,0,-40)				
				cameraposition[2].set(1,0,-40)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(2,1+6,-50)
				camerapositionpreview[1].set(4,0,-70)
				camerapositionpreview[2].set(0,-5,-80)
				rectangle[0].set(-11,-10)
				rectangle[1].set(-1-tabx+tabx*7,7)
				enlargerectangle()				
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,30,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,30,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,(i-1) Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13,25,20)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 6
				 a3.use(piletableau(n),n+1)
				Next
				
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 6
				 as.use(piletableau(n),n+1)
				Next
				
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 6
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E G A R G A N T U A 
'******************************************************************************************************************
Type _gamegargantua Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,GARGANTUA)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(9,-11,7-taby-0.5)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=1
				createpilewaste(px+tabx,7)
				px=-1-tabx
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				createpilefoundation(px+tabx*4,7)
				createpilefoundation(px+tabx*5,7)
				createpilefoundation(px+tabx*6,7)
				createpilefoundation(px+tabx*7,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
 				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-40)				
				cameraposition[1].set(1,0,-40)				
				cameraposition[2].set(1,0,-40)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(2,7,-50)
				camerapositionpreview[1].set(4,0,-70)
				camerapositionpreview[2].set(0,-3,-78)
				rectangle[0].set(-11,-10)
				rectangle[1].set(-1-tabx+tabx*7,7)
				enlargerectangle()					
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,(i-1) Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13,25,20)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 8
				 a3.use(piletableau(n),n+1)
				Next
				
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 8
				 as.use(piletableau(n),n+1)
				Next
				
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 8
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E I N D I A N 
'******************************************************************************************************************
Type _gameindian Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,INDIAN)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(10,-11,7-taby-0.5)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=1
				createpilewaste(px+tabx+0.5,7)
				px=-1-tabx+0.5
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				createpilefoundation(px+tabx*4,7)
				createpilefoundation(px+tabx*5,7)
				createpilefoundation(px+tabx*6,7)
				createpilefoundation(px+tabx*7,7)
				For Local pit:_piletableau=EachIn tableau.pilelist
				 pit.givemaximal=1
				Next
				tableaugivedescending(True);
				tableautakeothersuit(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-40)				
				cameraposition[1].set(1,0,-40)				
				cameraposition[2].set(3,0,-37)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(4,1+6,-50)
				camerapositionpreview[1].set(4,0,-70)
				camerapositionpreview[2].set(0,-5,-80)
				rectangle[0].set(-11,-10)
				rectangle[1].set(-1-tabx+0.5+tabx*7,7)
				enlargerectangle()					
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				'For Local i=1 To 2
				' Local a01:_animationmove=New _animationmove
				' a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				'Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13-30,50,10)
				
				Local v:_vector3=New _vector3
				v.set(8,0,0)
				v.rotz(10)
				Local av#=2
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,0,20,30)
				For n=0 To 9
				 ar.use(card(n*3+0),180,v)
				 v.rotz(av)
				 v.mul(1.05)
				 av:*1.05
				 ar.use(card(n*3+1),180,v)
				 v.mul(1.05)
				 v.rotz(av)
				 av:*1.05
				Next
				
				Local a3:_animationcardtopile=New _animationcardtopile
				a3.init(Self,40,30)
				For n=0 To 9
				 a3.use(piletableau(n),3)
				Next

				Local as:_animationpileshiftout=New _animationpileshiftout
				as.init(Self,15,15)
				For n=0 To 9 
				 as.use(piletableau(n),2,1)
				Next
				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,15,15)
				For n=0 To 9
				 a4.use(piletableau(n),2)
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType	
'******************************************************************************************************************
'										G A M E G I A N T
'******************************************************************************************************************
Type _gamegiant Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,GIANT)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(8,-11,7-taby-1)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,1,0)
				ps.redealvalue=1
				px=-3-tabx
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				createpilefoundation(px+tabx*4,7)
				createpilefoundation(px+tabx*5,7)
				createpilefoundation(px+tabx*6,7)
				createpilefoundation(px+tabx*7,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-40)				
				cameraposition[1].set(1,0,-40)				
				cameraposition[2].set(1,0,-35)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(2,1+6,-50)
				camerapositionpreview[1].set(4,0,-70)
				camerapositionpreview[2].set(0,-4,-75)
				rectangle[0].set(-11,-10)
				rectangle[1].set(-3-tabx+tabx*7,7)
				enlargerectangle()					
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,45,25)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,45,25,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,(i+1) Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13,20,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),20,100)
				For n=0 To 7
				 a3.use(piletableau(n),1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,100)
				For n=0 To 7
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType	
'******************************************************************************************************************
'										G A M E M I S S M I L L I G A N
'******************************************************************************************************************
Type _gamemissmilligan Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,MISSMILLIGAN)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(8,-7,7-taby-1)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,1,0)
				ps.redealvalue=0
				Local pr:_pilereserve
				pr=createpilereserve(px,7-taby)
				pr.takerestriction=False
				px=-3-tabx
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				createpilefoundation(px+tabx*4,7)
				createpilefoundation(px+tabx*5,7)
				createpilefoundation(px+tabx*6,7)
				createpilefoundation(px+tabx*7,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
 				tableautakeemptynumber(12);
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-40)				
				cameraposition[1].set(1,0,-40)				
				cameraposition[2].set(2,0,-36)				
				camerapositionmenu[1].set(-1,7,-50)
				camerapositionmenu[2].set(4,7,-50)
				camerapositionpreview[1].set(4,0,-70)
				camerapositionpreview[2].set(0,-5,-73)
				rectangle[0].set(-11,-10)
				rectangle[1].set(-3-tabx+tabx*7,7)
				enlargerectangle()				
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				
				Local a0:_animationrotation=New _animationrotation
				a0.init(Self,12,2,0,180,25,9)
				Local a01:_animationrotation=New _animationrotation
				a01.init(Self,8,2,0,180,25,9)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,20,9,(i+1) Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				cardposition(-26,-11,0)
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13,20,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),20,100)
				For n=0 To 7
				 a3.use(piletableau(n),1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,100)
				For n=0 To 7
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType		
'******************************************************************************************************************
'										G A M E K L O N D I K E C O N T R A
'******************************************************************************************************************
Type _gameklondikecontra Extends _gamecarrenapoleon
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,KLONDIKECONTRA)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=-1
				createpilewaste(px+tabx,7)
				px=0
				Local pf:_pilefoundation
				pf=createpilefoundation(px+tabx*0,7);pf.takeascending=True;pf.takeemptysuit=0
				pf=createpilefoundation(px+tabx*1,7);pf.takeascending=True;pf.takeemptysuit=1
				pf=createpilefoundation(px+tabx*2,7);pf.takedescending=True;pf.takeemptysuit=2
				pf=createpilefoundation(px+tabx*3,7);pf.takedescending=True;pf.takeemptysuit=3
				tableautakealteratecolor(True);
				tableautakedescending(True);
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-2,-30)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-3,0,-30)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(4,0,-60)
				camerapositionpreview[2].set(0,-2,-56)
				rectangle[0].set(-11,-6)
				rectangle[1].set(tabx*3,7)
				enlargerectangle()				
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),4*13,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 6
				 a3.use(piletableau(n),n+1)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 6
				 as.use(piletableau(n),n+1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 6
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False,True)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaytableauemptypile(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaywaste(card)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod				
	EndType	
'******************************************************************************************************************
'										G A M E C O N T R A F L O W
'******************************************************************************************************************
Type _gamecontraflow Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,CONTRAFLOW);
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ps:_pilestock=createpilestock(-2,7,0,1);
				ps.redealvalue=0
				createpilewaste(+2,7);
				createpiletableau(3,-2.5*tabx-1,7-taby-1);
				createpiletableau(3,+1+0.5*tabx,7-taby-1);
				Local px#;
				px=0;
				Local pf:_pilefoundation;
				pf=createpilefoundation(-tabx*3,7);pf.takedescending=True;pf.takeemptysuit=2
				pf=createpilefoundation(-tabx*4,7);pf.takedescending=True;pf.takeemptysuit=3

				pf=createpilefoundation(+tabx*4,7);pf.takeascending=True;pf.takeemptysuit=0
				pf=createpilefoundation(+tabx*3,7);pf.takeascending=True;pf.takeemptysuit=1
				For Local j=0 To 2
				 piletableau(j).takeascending=True;
				 piletableau(j).giveascending=True;
				Next
				
				For Local j=3 To 5
				 piletableau(j).takedescending=True;
				 piletableau(j).givedescending=True;
				Next
				
				Local pr:_pilereserve=createpilereserve(-13,0)
				pr.takerestriction=False
				pr=createpilereserve(+13,0)
				pr.takerestriction=False
				
				createcards(1,0);
				createcards(1,1);
				createcards(1,2);
				createcards(1,3);
				cameraposition[0].set(-3,-2,-30);			
				cameraposition[1].set(-0.3,0,-30);
				cameraposition[2].set(-0.3,0,-30);
				camerapositionmenu[1].set(3-4,1+6,-50);
				camerapositionmenu[2].set(0.5,1+6,-50);
				camerapositionpreview[1].set(0,-4,-60);
				camerapositionpreview[2].set(0,-4,-70);
				rectangle[0].set(-tabx*4,-8)
				rectangle[1].set(+tabx*4,7)
				enlargerectangle()				
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n;
				initgeneral(s,mo);
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0);
				Local a0:_animationmove=New _animationmove;
				a0.init(Self,-14,-11,0,40,5);
				Local a01:_animationmove=New _animationmove;
				a01.init(Self,-8,-10,0,46,8,True);
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove;
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True);
				Next;			
				shufflecards();
				Local a2:_animationcardtostock=New _animationcardtostock;
				a2.init(Self,pilestock(0),4*13,50,10);
				Local a3:_animationstocktopile=New _animationstocktopile;
				a3.init(Self,pilestock(0),50,100);
				For n=0 To 5
				 a3.use(piletableau(n),3)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 5
				 as.use(piletableau(n),3)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 5
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);
				ElseIf tipptableau(0,False,False)
				 tippexecutemove();Return(True);
				ElseIf tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				ElseIf tippreserve(0)
				 tippexecutemove();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,False,False)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 ElseIf tippreserve(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	EndType		
'******************************************************************************************************************
'										G A M E K L O N D I K E T H R E E 
'******************************************************************************************************************
Type _gameklondikethree Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,KLONDIKE_3)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby)
				Local px#=-11
				createpilestock(px,7,0,3)
				createpilewaste(px+tabx,7)
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-2,-30)				
				cameraposition[1].set(-3,0,-30)				
				cameraposition[2].set(-3,0,-30)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(4,0,-60)
				camerapositionpreview[2].set(0,-2,-57)
				rectangle[0].set(-11,-6)
				rectangle[1].set(tabx*3,7)
				enlargerectangle()				
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),4*13,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For Local n=0 To 6
				 a3.use(piletableau(n),n+1)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For Local n=0 To 6
				 as.use(piletableau(n),n+1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For Local n=0 To 6
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E K L O N D I K E T H R E E T W O D E C K
'******************************************************************************************************************
Type _gameklondikethreetwodeck Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,DKLONDIKE_3)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby)
				Local px#=-11
				createpilestock(px,7,0,3)
				createpilewaste(px+tabx,7)
				px=-1-tabx
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				createpilefoundation(px+tabx*4,7)
				createpilefoundation(px+tabx*5,7)
				createpilefoundation(px+tabx*6,7)
				createpilefoundation(px+tabx*7,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-40)				
				cameraposition[1].set(1,0,-40)				
				cameraposition[2].set(1,0,-40)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(2,1+6,-50)
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-5,-80)
				rectangle[0].set(-11,-10)
				rectangle[1].set(-1-tabx+tabx*7,7)
				enlargerectangle()					
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,(i-1) Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13,25,20)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 6
				 a3.use(piletableau(n),n+1)
				Next
				
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 6
				 as.use(piletableau(n),n+1)
				Next
				
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 6
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E F O R T Y T H I E V E S
'******************************************************************************************************************
Type _gamefortythieves Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,FORTYTHIEVES)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(10,-11,7-taby-1)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=0
				createpilewaste(px+tabx,7)
				px=-1-tabx
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				createpilefoundation(px+tabx*4,7)
				createpilefoundation(px+tabx*5,7)
				createpilefoundation(px+tabx*6,7)
				createpilefoundation(px+tabx*7,7)
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);				
				For Local n=0 To 9 
				 piletableau(n).givemaximal=1
				Next
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-40)				
				cameraposition[1].set(0,0,-40)				
				cameraposition[2].set(1.5,-2,-38)				
				camerapositionmenu[1].set(3,7,-50)
				camerapositionmenu[2].set(3,4,-50)
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-5,-78)
				rectangle[0].set(-11,-10)
				rectangle[1].set(-1-tabx+tabx*7,7)
				enlargerectangle()				
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-5,2,0,40,5,True,False,True)
				shufflecards()
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,5,-5,0,180,20,8)
				Local as:_animationcardtostock=New _animationcardtostock
				as.init(Self,pilestock(0),8*13-40,30,10)
				Local ar3:_animationrotation=New _animationrotation
				ar3.init(Self,2,-4,0,180,10,8)
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,30,30)
				For n=0 To 9 
				 a2.use(piletableau(n),4)
				Next				
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,30,40)
				For n=0 To 9
				 a3.use(piletableau(n),4)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,20,50)
				For n=0 To 9
				 a4.use(piletableau(n),4)
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,False,True,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	EndType	

'******************************************************************************************************************
'										G A M E F O R T Y T H I E V E S D O U B L E S T O C K
'******************************************************************************************************************
Type _gamefortythievesdoublestock Extends _gamefortythieves
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,FORTYTHIEVESDOUBLESTOCK)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(10,-15+tabx*2+1,7-taby-1)
				Local px#=-15
				Local ps:_pilestock
				Local pw:_pilewaste
				ps=createpilestock(px,7,0,1)
				ps.redealvalue=1
				pw=createpilewaste(px+tabx,7)
				ps.wastepartner=0
				pw.stockpartner=0

				px=-15
				ps=createpilestock(px,7-taby,0,1)
				ps.redealvalue=1
				pw=createpilewaste(px+tabx,7-taby)
				ps.wastepartner=1
				pw.stockpartner=1

				
				px=-15+tabx*2
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				createpilefoundation(px+tabx*4,7)
				createpilefoundation(px+tabx*5,7)
				createpilefoundation(px+tabx*6,7)
				createpilefoundation(px+tabx*7,7)
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);				
				For Local n=0 To 9 
				 piletableau(n).givemaximal=1
				Next
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-40)				
				cameraposition[1].set(0,0,-40)				
				cameraposition[2].set(3,-2,-41)				
				camerapositionmenu[1].set(3,7,-50)
				camerapositionmenu[2].set(3,4,-50)
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-5,-90)
				rectangle[0].set(-15,-10)
				rectangle[1].set(-15+tabx*2+1+tabx*9,7)
				enlargerectangle()				
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-5,2,0,40,5,True,False,True)
				shufflecards()
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,5,-5,0,180,20,8)
				Local as:_animationcardtostock=New _animationcardtostock
				as.init(Self,pilestock(0),32,20,10)
				Local as2:_animationcardtostock=New _animationcardtostock
				as2.init(Self,pilestock(1),32,20,10)
				Local ar3:_animationrotation=New _animationrotation
				ar3.init(Self,2,-4,0,180,10,8)
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,30,30)
				For n=0 To 9 
				 a2.use(piletableau(n),4)
				Next				
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,30,40)
				For n=0 To 9
				 a3.use(piletableau(n),4)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,20,50)
				For n=0 To 9
				 a4.use(piletableau(n),4)
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType										
'******************************************************************************************************************
'										G A M E F O R T Y T H I E V E S R E D E A L
'******************************************************************************************************************
Type _gamefortythievesredeal Extends _gamefortythieves
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,FORTYTHIEVESREDEAL)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(10,-11,7-taby-1)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=1
				createpilewaste(px+tabx,7)
				px=-1-tabx
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				createpilefoundation(px+tabx*4,7)
				createpilefoundation(px+tabx*5,7)
				createpilefoundation(px+tabx*6,7)
				createpilefoundation(px+tabx*7,7)
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);				
				For Local n=0 To 9 
				 piletableau(n).givemaximal=1
				Next
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-40)				
				cameraposition[1].set(0,0,-40)				
				cameraposition[2].set(1.5,-2,-38)				
				camerapositionmenu[1].set(3,7,-50)
				camerapositionmenu[2].set(3,4,-50)
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-5,-78)
				rectangle[0].set(-11,-10)
				rectangle[1].set(-1-tabx+tabx*7,7)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-5,2,0,40,5,True,False,True)
				shufflecards()
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,5,-5,0,180,20,8)
				Local as:_animationcardtostock=New _animationcardtostock
				as.init(Self,pilestock(0),8*13-40,30,10)
				Local ar3:_animationrotation=New _animationrotation
				ar3.init(Self,2,-4,0,180,10,8)
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,30,30)
				For n=0 To 9 
				 a2.use(piletableau(n),4)
				Next				
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,30,40)
				For n=0 To 9
				 a3.use(piletableau(n),4)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,20,50)
				For n=0 To 9
				 a4.use(piletableau(n),4)
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E B L I N D A L L E Y S  
'******************************************************************************************************************
Type _gameblindalleys Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,BLINDA)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(6,-11,7-taby-1)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=1			
				createpilewaste(px+tabx,7)
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				foundationascending(True);	
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,0,-30)				
				cameraposition[1].set(-3,0,-30)				
				cameraposition[2].set(-3,0,-30)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(0,-4,-55)
				camerapositionpreview[2].set(0,-3,-57)
				rectangle[0].set(-11,-6)
				rectangle[1].set(tabx*3,7)
				enlargerectangle()
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-10,-3,0,40,5,True)
				Local af:_animationcardtofoundation=New _animationcardtofoundation
				af.init(Self,40,40)
				Local in=0
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 af.use(fit,card(in*13))
				 in:+1
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),4*12,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 5
				 a3.use(piletableau(n),3)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 5
				 as.use(piletableau(n),3)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 5
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
			
	EndType	
'******************************************************************************************************************
'										G A M E L I M I T E D 
'******************************************************************************************************************
Type _gamelimited Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,LIMITED)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=0
				Local oy#=taby
				For Local j=2 To 0 Step -1
			 	 For Local i=3 To 0 Step -1
				  createpiletableau(1,ox+-11+tabx*2.7*i,oy+1.5-(taby+1)*j)
				 Next
				Next
				For Local pit:_piletableau=EachIn tableau.pilelist
				 pit.vector.set(0.7,-0.3,0)
				 pit.givemaximal=1
				Next
				Local px#=-11
				Local ps:_pilestock=createpilestock(ox+px,oy+7,0,1)
				ps.redealvalue=0				
				createpilewaste(ox+px+tabx,oy+7)
				px=-tabx
				createpilefoundation(ox+px+tabx*0,oy+7)
				createpilefoundation(ox+px+tabx*1,oy+7)
				createpilefoundation(ox+px+tabx*2,oy+7)
				createpilefoundation(ox+px+tabx*3,oy+7)
				createpilefoundation(ox+px+tabx*4,oy+7)
				createpilefoundation(ox+px+tabx*5,oy+7)
				createpilefoundation(ox+px+tabx*6,oy+7)
				createpilefoundation(ox+px+tabx*7,oy+7)
				tableaumaximumlength(6)
				
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[1].set(1.8,0,-39)
				cameraposition[2].set(1.8,2,-39)
				camerapositionmenu[2].set(1,8,-55)
				camerapositionpreview[1].set(0,0,-90)
				camerapositionpreview[2].set(0,-3,-85)
				rectangle[0].set(-11,-8)
				rectangle[1].set(tabx*6,7+taby)
				enlargerectangle()

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-10,-3,0,40,5,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13-12*3,50,10)
				Local v:_vector3=New _vector3
				v.set(20,0,0)
				v.rotz(-20)
				Local av#=1
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,0,30,22)
				For n=0 To 35
				 ar.use(card(n),180,v)
				 v.rotz(av)
				 v.mul(1.01)
				 av:*1.02
				Next				
				Local a3:_animationcardtopile=New _animationcardtopile
				a3.init(Self,30,20)
				For n=0 To 11
				 a3.use(piletableau(n),3)
				Next
				Local a23:_animationpileshiftout=New _animationpileshiftout
				a23.init(Self,15,20)
				For n=0 To 11
				 a23.use(piletableau(n),3)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,13,10)
				For n=0 To 11
				 a4.use(piletableau(n),3)
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tipptableau(0,False,False,True)
				 tippexecutemove();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod				
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,False,False,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod					

	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False,True)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaytableauemptypile(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaywaste(card,True)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaywaste(card)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod				
	EndType

'******************************************************************************************************************
'										G A M E L I M I T E D C O V E R E D
'******************************************************************************************************************
Type _gamelimitedcovered Extends _gamelimited
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,LIMITEDCOVERED)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=0
				Local oy#=taby
				For Local j=2 To 0 Step -1
			 	 For Local i=3 To 0 Step -1
				  createpiletableau(1,ox+-11+tabx*2.7*i,oy+1.5-(taby+1)*j)
				 Next
				Next
				Local px#=-11
				Local ps:_pilestock=createpilestock(ox+px,oy+7,0,1)
				ps.redealvalue=0				
				createpilewaste(ox+px+tabx,oy+7)
				px=-tabx
				createpilefoundation(ox+px+tabx*0,oy+7)
				createpilefoundation(ox+px+tabx*1,oy+7)
				createpilefoundation(ox+px+tabx*2,oy+7)
				createpilefoundation(ox+px+tabx*3,oy+7)
				createpilefoundation(ox+px+tabx*4,oy+7)
				createpilefoundation(ox+px+tabx*5,oy+7)
				createpilefoundation(ox+px+tabx*6,oy+7)
				createpilefoundation(ox+px+tabx*7,oy+7)
				
				For Local pit:_piletableau=EachIn tableau.pilelist
				 pit.vector.set(0.7,-0.3,0)
				Next
				tableaumaximumlength(6)
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[1].set(1.8,0,-39)
				cameraposition[2].set(1.8,2,-39)
				camerapositionmenu[2].set(1,8,-50)
				camerapositionpreview[1].set(0,0,-90)
				camerapositionpreview[2].set(0,-3,-85)
				rectangle[0].set(-11,-8)
				rectangle[1].set(tabx*6,7+taby)
				enlargerectangle()

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-10,-3,0,40,5,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 11
				 a3.use(piletableau(n),3)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 11
				 as.use(piletableau(n),3)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 11
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E L A D Y P A L K
'******************************************************************************************************************
Type _gameladypalk Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,LADYPALK)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=0
				Local oy#=-taby
				createpiletableau(1,ox-tabx,oy+-1*taby)
				createpiletableau(1,ox-tabx,oy+0*taby)
				createpiletableau(1,ox-tabx,oy+1*taby)
				createpiletableau(1,ox-tabx,oy+2*taby)
				For Local i=0 To 3 
				 piletableau(i).vector.set(-1,0,0)
				 piletableau(i).camerastretch=False
				 piletableau(i).maximumlength=11
				Next
				createpiletableau(1,ox+tabx*2,oy+-1*taby)
				createpiletableau(1,ox+tabx*2,oy+0*taby)
				createpiletableau(1,ox+tabx*2,oy+1*taby)
				createpiletableau(1,ox+tabx*2,oy+2*taby)
				For Local i=4 To 7
				 piletableau(i).vector.set(1,0,0)
				Next
				Local px#=-11
				Local ps:_pilestock=createpilestock(ox,oy+3*taby,0,1)
				ps.redealvalue=0				
				createpilewaste(ox+tabx,oy+3*taby)
				px=-tabx
				createpilefoundation(ox,oy+-1*taby)
				createpilefoundation(ox,oy+0*taby)
				createpilefoundation(ox,oy+1*taby)
				createpilefoundation(ox,oy+2*taby)
				createpilefoundation(ox+tabx,oy+-1*taby)
				createpilefoundation(ox+tabx,oy+0*taby)
				createpilefoundation(ox+tabx,oy+1*taby)
				createpilefoundation(ox+tabx,oy+2*taby)
				tableaugivedescending(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-1.5,-40)	
				cameraposition[2].set(0,0,-35)
				camerapositionmenu[2].set(1.8,5.5,-55)		
				camerapositionpreview[1].set(0,0,-80)				
				camerapositionpreview[2].set(0,-3,-80)			
				rectangle[0].set(+tabx*2+10,-2*taby)
				rectangle[1].set(-tabx*1-10,2*taby)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,60,8)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-10+tabx*2,-10,0,60,8,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13,60,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),20,10,True)
				For n=0 To 7
				 a3.use(piletableau(n),4)
				Next
				Local aps:_animationpileshiftout=New _animationpileshiftout
				aps.init(Self,20,40)
				For n=0 To 7
				 aps.use(piletableau(n),4)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,33,50)
				For n=0 To 7 
				 a4.use(piletableau(n),4)
				Next
				setanimationpreparative()
				update()
				EndMethod
				
	EndType
'******************************************************************************************************************
'										G A M E A C M E 
'******************************************************************************************************************
Type _gameacme Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,ACME)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(4,-2-tabx*1.5,7-taby-1)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=1
				createpilewaste(px+tabx,7)
				px=-2
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				Local pr:_pilereserve=createpilereserve(-11,7-taby-2)
				pr.vector.set(0,-0.5,0)
				pr.tableaufill=True
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				For Local pit:_piletableau=EachIn tableau.pilelist 
				 pit.givemaximal=1
				 pit.takeemptyrestriction=True
				Next
				cameraposition[0].set(-3,-2,-30)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-3,0,-30)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(0,0,-50)
				camerapositionpreview[2].set(0,-1,-68)
				rectangle[0].set(-11,7-taby*3-1)
				rectangle[1].set(-2+tabx*3,7)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next				
				Local af:_animationcardtofoundation=New _animationcardtofoundation
				af.init(Self,40,40)
				Local in=0
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 af.use(fit,card(in*13))
				 in:+1
				Next				
				shufflecards()
				Local ap:_animationcardtopile=New _animationcardtopile
				ap.init(Self,30,30)
				For Local prit:_pilereserve=EachIn pilereservelist
				 ap.use(prit,13,False,True)
				Next
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),4*13-13,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 3
				 a3.use(piletableau(n),1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 3
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E A U N T M A R Y 
'******************************************************************************************************************
Type _gameauntmary Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,AUNTMARY)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(6,-11,(7-taby-1))
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=0
				createpilewaste(px+tabx,7)
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-2,-30)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-3,0,-30)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(4,0,-60)
				camerapositionpreview[2].set(0,-3,-65)
				rectangle[0].set(-11,-6)
				rectangle[1].set(+tabx*3,7)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n				
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-12,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-4,-10,0,40,5,True)
				shufflecards()
				Local woff#=Float(180)/Float(6)
				Local w#=woff*0.5
				Local ar:_animationrotation
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,6,0);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,5,7);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,4,14);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,3,21);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,2,28);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,1,35);w:+woff
				Local a3:_animationcardtopile=New _animationcardtopile
				a3.init(Self,20,40)
				For n=0 To 5
				 a3.use(piletableau(n),6)
				Next				
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),52-36,20,40)
				Local as:_animationpileshiftout=New _animationpileshiftout
				as.init(Self,20,40)
				For n=0 To 5
				 as.use(piletableau(n),6-n,n)
				Next				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,20,50)
				For n=0 To 5
				 a4.use(piletableau(n),6-n)
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType			
'******************************************************************************************************************
'										G A M E A U N T F R E E M A R Y 
'******************************************************************************************************************
Type _gameauntfreemary Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,AUNTFREEMARY)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(6,-11,7-taby-1)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=0
				createpilewaste(px+tabx,7)
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				Local pf:_pilefreecell
				pf=createpilefreecell(9,(7-taby-1))
				pf.suit=0
				pf=createpilefreecell(9+tabx,(7-taby-1))
				pf.suit=1
				pf=createpilefreecell(9,(7-taby-1)-taby)
				pf.suit=2
				pf=createpilefreecell(9+tabx,(7-taby-1)-taby)
				pf.suit=3				
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-2,-30)				
				cameraposition[1].set(-0.7,0,-30)		
				cameraposition[2].set(-0.7,0,-30)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(4,0,-60)
				camerapositionpreview[2].set(0,-3,-65)
				rectangle[0].set(-11,-6)
				rectangle[1].set(9+tabx,7)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n				
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-12,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-4,-10,0,40,5,True)
				shufflecards()
				Local woff#=Float(180)/Float(6)
				Local w#=woff*0.5
				Local ar:_animationrotation
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,6,0);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,5,7);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,4,14);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,3,21);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,2,28);w:+woff
				ar=New _animationrotation
				ar.init(Self,Cos(w)*7,Sin(w)*9,0,180,20,56,1,35);w:+woff
				Local a3:_animationcardtopile=New _animationcardtopile
				a3.init(Self,20,40)
				For n=0 To 5
				 a3.use(piletableau(n),6)
				Next				
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),52-36,20,40)
				Local as:_animationpileshiftout=New _animationpileshiftout
				as.init(Self,20,40)
				For n=0 To 5
				 as.use(piletableau(n),6-n,n)
				Next				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,20,50)
				For n=0 To 5
				 a4.use(piletableau(n),6-n)
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaywaste(card)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplayfreecell(card)
				 autoplayanimationpiletopile(True,True);Return(True);				
				EndIf
				Return(False);
				EndMethod				
	EndType				
'******************************************************************************************************************
'										G A M E S I N G L E R A I L 
'******************************************************************************************************************
Type _gamesinglerail Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,SINGLERAIL)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(4,-11,7-taby-1)
				Local px#=-11
				Local ps:_pilestock=createpilestock(px,7,0,1)
				ps.redealvalue=0
				createpilewaste(px+tabx,7)
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableaugivedescending(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-2,-30)				
				cameraposition[1].set(-3,0,-30)				
				cameraposition[2].set(-3,0,-30)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(4,0,-60)
				camerapositionpreview[2].set(0,-3,-57)
				rectangle[0].set(-11,-6)
				rectangle[1].set(+tabx*3,7)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),4*13,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For Local n=0 To 3
				 a3.use(piletableau(n),1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For Local n=0 To 3
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableau(0,False,False,True)
				 tippexecutemove();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);
				ElseIf tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf autoplaymovetableau(1,False,False,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				 If solitaire.autoturncard
				  If tipptableauturn() 
				   For Local card:_card=EachIn foundlist
				    card.turn(solitaire.clock,15,True)
				   Next
				   Return(True);				
				  EndIf
				 EndIf
				 If solitaire.autoempty
				  If tipptableauemptypile() 
				   autoplayanimationpiletopile(True,True)
				   Return(True);
				  EndIf
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False,True)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaytableauemptypile(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaywaste(card)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod				
	EndType		
'******************************************************************************************************************
'										G A M E C A R R E N A P O L E O N 
'******************************************************************************************************************
Type _gamecarrenapoleon Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,CARRENAPOLEON)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(6,-11,taby+1)
				tableaumaximumlength(6)
				createpiletableau(6,-11,taby-2.0*taby)
				Local px#=-11-tabx-1
				Local ps:_pilestock
				ps=createpilestock(px,7,1,0)
				ps.tableaucount=3
				ps.redealvalue=1
				createpilewaste(px,7-taby)
				px=0
				For Local iy#=0 To 3
				 For Local ix#=0 To 1
				  createpilefoundation(10+ix*tabx,7-taby*iy)
				 Next
				Next
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(-5,-2,-33)				
				cameraposition[1].set(-2,-2,-34)		
				cameraposition[2].set(-2,-2,-34)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,4,-50)
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-2,-75)
				rectangle[0].set(-11-tabx-1,7-taby*3-taby*0.5)
				rectangle[1].set(10+tabx,7)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*13,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For n=0 To 11
				 a3.use(piletableau(n),1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 11
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableau(0,False,True,True)
				 tippexecutemove();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);
				ElseIf tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf autoplaymovetableau(1,False,True,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tipptableauemptypile()
				  Print "empty pile auto"
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				 If solitaire.autoturncard
				  If tipptableauturn() 
				   For Local card:_card=EachIn foundlist
				    card.turn(solitaire.clock,15,True)
				   Next
				   Return(True);				
				  EndIf
				 EndIf
				 If solitaire.autoempty
				  If tipptableauemptypile() 
				   autoplayanimationpiletopile(True,True)
				   Return(True);
				  EndIf
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,True,True)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaytableauemptypile(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaywaste(card)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod
				
	EndType					
'******************************************************************************************************************
'										G A M E F R E E C E L L 
'******************************************************************************************************************
Type _gamefreecell Extends _game
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,FREECELL)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(8,-11,7-taby-0.5)
				createpilefoundation(4+tabx*0,7)
				createpilefoundation(4+tabx*1,7)
				createpilefoundation(4+tabx*2,7)
				createpilefoundation(4+tabx*3,7)
				createpilefreecell(-11+tabx*0,7)
				createpilefreecell(-11+tabx*1,7)
				createpilefreecell(-11+tabx*2,7)
				createpilefreecell(-11+tabx*3,7)
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cardlist.reverse()				
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				foundationascending(True);
				tableaugiverestrictionfreecell(True);
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(0,-2.5,-36)				
				cameraposition[2].set(0,-2.5,-34)
				camerapositionmenu[2].set(1,3,-50)				
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-2,-73)
				rectangle[0].set(-11,-10)
				rectangle[1].set(4+tabx*3,7+1)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				shufflecards()
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,-11,0,80,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,0,-11,0,40,5,True)
				'Local ar:_animationrotation=New _animationrotation
				'ar.init(Self,0,0,0,180,0.70,8)
				Local v:_vector3=New _vector3
				v.set(8,0,-0.02)
				v.rotz(10)
				Local av#=2
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,0,30,30)
				For n=0 To 51
				 ar.use(card(n),180,v)
				 v.rotz(av)
				 v.mul(1.005)
				 av:*1.02
				Next				
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				For n=0 To 3 
				 a2.use(piletableau(n),7)
				Next
				For n=4 To 7
				 a2.use(piletableau(n),6)
				Next	
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				For n=0 To 3 
				 a3.use(piletableau(n),7)
				Next
				For n=4 To 7
				 a3.use(piletableau(n),6)
				Next	
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,13,15)
				For n=0 To 3 
				 a4.use(piletableau(n),7)
				Next
				For n=4 To 7
				 a4.use(piletableau(n),6)
				Next	
				setanimationpreparative()
				update()
				EndMethod
	Method tippfreecelltofoundation:Int()
				Local found=False
				foundlist.clear()
				foundsour=Null
				founddest=Null
				For Local frit:_pilefreecell=EachIn pilefreecelllist
				 If found=False
				  If frit.cardlist.firstlink()
				   Local c:_card=_card(frit.cardlist.firstlink().value())
				   foundlist.clear()
				   foundlist.addlast(c)
				   For Local fit:_pilefoundation=EachIn pilefoundationlist
				    If found=False
				     If fit.candrop(foundlist)
				      found=True
				      foundsour=frit
				      founddest=fit
				     EndIf
				    EndIf
				   Next
				  EndIf
				 EndIf
				Next
				Return(found)
				EndMethod		
	Method getcardtableau:_card(ss,sn)
				Local c:_card=Null
				If tableau
				 For Local pit:_piletableau=EachIn tableau.pilelist
				  For Local cit:_card=EachIn pit.cardlist
				   If cit.suit=ss And cit.number=sn Return(cit)
				  Next
				 Next
				EndIf
				Return(Null)
				EndMethod				
	Method getcardfoundation:_card(ss,sn)
				Local c:_card=Null
				For Local pit:_pilefoundation=EachIn pilefoundationlist
				 For Local cit:_card=EachIn pit.cardlist
				  If cit.suit=ss And cit.number=sn Return(cit)
				 Next
				Next
				Return(Null)
				EndMethod				
	Method getsearchedcard:_card(b)'returns the card, that is used for the aktual blockade-foundation
				 'Print "b="+b
				If b<>-1
				 Local f:_pilefoundation=pilefoundation(b)
				 Local ss:Int
				 Local sn:Int
				 If f.cardlist.firstlink()
				  Local c:_card=_card(f.cardlist.firstlink().value())
				  ss=c.suit
				  sn=c.number+1
				  'Print "voller pile"+ss+" "+sn
				  If sn>12 Return(Null) 
				 Else
				  'achtung es muss bei einem leeren pile auf alle fälle
				  'eine karte gewählt werden, die noch nicht in einem der anderen
				  'foundations ist
				  sn=0
				  ss=b
				  'Print "leerer pile"+ss+" "+sn
				  
				  'ss=b
				  Local startsuit=ss
				  Local found=False
				  Repeat
				   If getcardfoundation(ss,sn)=Null 
				    found=True
				   Else
				    ss:+1
				    If ss>3 ss=0
				   EndIf
				  Until found Or ss=startsuit 
				 EndIf
				 Return(getcardtableau(ss,sn))
				Else 
				 Return(Null)
				EndIf
				EndMethod
	Method tippfreecelltotableau:Int()'only if target is not the blockade-tableaupile
				foundlist.clear()
				foundsour=Null
				founddest=Null
				Local csuch:_card=getsearchedcard(blockade)
				'If csuch Print "c suit="+csuch.suit+"c.number="+csuch.number
				For Local fit:_pilefreecell=EachIn pilefreecelllist
				 If fit.cardlist.firstlink()
				  Local c:_card=_card(fit.cardlist.firstlink().value())
				  foundlist.clear()
				  foundlist.addlast(c)				
				  For Local pit:_piletableau=EachIn tableau.pilelist
				   If pit.candrop(foundlist)
				    Local ok=True
				    If csuch If csuch.pile=pit ok=False
				 	If ok
				     founddest=pit
				     foundsour=fit
				     Return(True)
		   		    EndIf
				   EndIf
				  Next
				 EndIf
				Next
				Return(False)
				EndMethod		
	Method validateblockade:Int()
				'zuerst prüfen ob der akutelle blockadeindex noch gültig ist, indem das 
				'dazugehörige Foundationpile noch nicht vollständig besetzt ist
				'Local startblockade=blockade
				'Repeat
				Local f:_pilefoundation=pilefoundation(blockade)
				If f.cardlist.count()<13 Return(True)
				'blockade:+1
				'If blockade>pilefoundationlist.count() blockade=0
				'Until startblockade=blockade				
				Return(False)
				EndMethod		
	Method initblockade()
				'If blockade=-1
				 'Print "hier"
				 blockadecount=100000'more than 100000 card in a pile will not occur
				 'get the foundationindex ,which searchcard has the lowest blockadecount
				 Local i=0
				 For Local pit:_pilefoundation=EachIn pilefoundationlist
				  Local c:_card=getsearchedcard(i)
				  If c
				   Local bc:Int=c.index()'is directly the count!
				   If blockadecount>bc
				    blockadecount=bc
				    blockade=i
				   EndIf
				  EndIf
				  i:+1
				 Next
				'EndIf
				'Print "intiblockade ="+blockade
				EndMethod	
	Method nextblockade()
				If blockade<>-1
				 Local i=0
				 Local n=100000
				 Local changed=False
				 For Local pit:_pilefoundation=EachIn pilefoundationlist
				  If pit.flag=1
				   Local c:_card=getsearchedcard(i)
				   If c
				    Local bc:Int=c.index()'is directly the count!
				    If Abs(blockadecount-bc)<n
				     n=blockadecount-bc
				     blockade=i
				     changed=True
				    EndIf
				   EndIf
				  EndIf
				  i:+1
				 Next
				 If changed blockadecount=getsearchedcard(blockade).index() Else blockade=-1
				EndIf
				EndMethod							
	Method tippclearblockade:Int()
				'benutzt den aktuellen blockade index, und
				'versucht die suchkarte freizuräumen
				'found=False
				foundlist.clear()
				foundsour=Null
				founddest=Null
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 fit.flag=1
				Next
				'Local startblockade=blockade
				'Repeat
				initblockade()
				Repeat
				 If validateblockade()
				  Local csuch:_card=getsearchedcard(blockade)
				  If csuch
				   
				   'Print "csuch suit="+csuch.suit+"csuch.number="+csuch.number
  				   pilefoundation(blockade).flag=0
				   '------------------------------- fragment laden ----------------------
				   foundlist.clear()
				   Local it:TLink=csuch.pilelink.prevlink()
				   If it
				    Repeat
				     foundlist.addlast(_card(it.value()))
				     it=it.prevlink()
				    Until it=Null
				   EndIf
				   '------------------------------- pickbaren teil isolieren ------------
				   If foundlist.count()>0
				    Local pickable=False
				    Repeat
				     Local c:_card=_card(foundlist.firstlink().value())
				     If c.canpick() pickable=True Else RemoveLink foundlist.firstlink()
				    Until foundlist.count()=0 Or pickable
				   EndIf
				   '---------------------------------------------------------------------
				   If foundlist.count()>0
				
				    Repeat
				
				     '----versuche nun das fragment innerhalb des tableaus zu verlegen----
				     For Local pit:_piletableau=EachIn tableau.pilelist
				      If pit<>csuch.pile
				       If pit.candrop(foundlist)
				        foundsour=csuch.pile
				        founddest=pit
				        Return(True)
				       EndIf
				      EndIf
				     Next
					 '----versuche nun das Fragment auf einer der Freecells zu verlegen----
				 	 If foundlist.count()=1
					  For Local fit:_pilefreecell=EachIn pilefreecelllist
					   If fit.candrop(foundlist)
					    foundsour=csuch.pile
					    founddest=fit
					    Return(True)
					   EndIf
					  Next
				 	 EndIf
					 '---------------------------------------------------------------------
				     RemoveLink foundlist.firstlink()
				    Until foundlist.count()=0
				   EndIf
				  EndIf
				 EndIf	
				 nextblockade()			
				Until blockade=-1
				' blockade:+1
				' If blockade>(pilefoundationlist.count()-1) blockade=0
				'Until blockade=startblockade
				Rem
				Local startblockade=blockade
				Repeat
				Local f:_pilefoundation=pilefoundation(blockade)
				 blockade:+1
				 If blockade>3 blockade=0
				Until found Or startblockade=blockade
				EndRem
				Return(False)
				EndMethod		
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tippfreecelltofoundation()
				 tippexecutemove();Return(True);
				ElseIf tippfreecelltotableau()
				 tippexecutemove();Return(True);
				ElseIf tippclearblockade()
				 tippexecutemove();Return(True);
				ElseIf tipptableau(0,False,False)
				 tippexecutemove();Return(True);
				EndIf
				Return(False);
				EndMethod	
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tippfreecelltofoundation()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippfreecelltotableau()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippclearblockade()
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf autoplaymovetableau(1,False,False)
				  autoplayanimationpiletopile();Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()				
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
				  ElseIf tippfreecelltofoundation()
				   autoplayanimationpiletopile()
				   Return(True);
	 			  EndIf
	 			 EndIf	
				 If solitaire.autoturncard
				  If tipptableauturn() 
				   For Local card:_card=EachIn foundlist
				    card.turn(solitaire.clock,15,True)
				   Next
				   Return(True);
				  EndIf
				 EndIf
				EndIf
				Return(False);	
				EndMethod		
				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False,True)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaytableauemptypile(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplayfreecell(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				EndIf
				Return(False);
				EndMethod		
				
	Field blockade:Int=-1'bezieht sich auf die foundations ! 0-pilefoundation.count()
	Field blockadecount:Int=0
	EndType
'******************************************************************************************************************
'										G A M E F R E E C E L L D O U B L E
'******************************************************************************************************************
Type _gamefreecelldouble Extends _gamefreecell
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,FREECELLDOUBLE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpilefoundation(-14+tabx*6,7)
				createpilefoundation(-14+tabx*7,7)
				createpilefoundation(-14+tabx*8,7)
				createpilefoundation(-14+tabx*9,7)
				createpilefoundation(-14+tabx*6,7-taby)
				createpilefoundation(-14+tabx*7,7-taby)
				createpilefoundation(-14+tabx*8,7-taby)
				createpilefoundation(-14+tabx*9,7-taby)
				
				createpilefreecell(-14+tabx*0,7)
				createpilefreecell(-14+tabx*1,7)
				createpilefreecell(-14+tabx*2,7)
				createpilefreecell(-14+tabx*3,7)
				createpilefreecell(-14+tabx*0,7-taby)
				createpilefreecell(-14+tabx*1,7-taby)
				createpilefreecell(-14+tabx*2,7-taby)
				createpilefreecell(-14+tabx*3,7-taby)
				createpiletableau(10,-14,7-2*taby)
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cardlist.reverse()				
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				foundationascending(True);
				tableaugiverestrictionfreecell(True);
				cameraposition[0].set(-3,-6,-38)
				cameraposition[1].set(0.5,-5,-36)				
				cameraposition[2].set(0.5,-3,-37)	
				camerapositionmenu[2].set(1,1,-50)
			
				camerapositionpreview[1].set(0,0,-100)
				camerapositionpreview[2].set(0,-4.5,-100)
				rectangle[0].set(-14,-14.7)
				rectangle[1].set(-14+tabx*9,7)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				shufflecards()
				Local a0:_animationmove=New _animationmove
				a0.init(Self,14,-11,0,80,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,8,-7,0,40,5,True)
				'Local ar:_animationrotation=New _animationrotation
				'ar.init(Self,0,0,0,180,0.70,8)
				Local v:_vector3=New _vector3
				v.set(0,-5,-0.02)
				v.rotz(-20)
				Local av#=2
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,0,30,15)
				For n=0 To 103
				 ar.use(card(n),180,v)
				 v.rotz(-av)
				 v.mul(1.005)
				 av:*1.015
				Next				
				
				
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				For n=0 To 3 
				 a2.use(piletableau(n),11)
				Next
				For n=4 To 9
				 a2.use(piletableau(n),10)
				Next	
				
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,10,10)
				For n=0 To 3 
				 a3.use(piletableau(n),11)
				Next
				For n=4 To 9
				 a3.use(piletableau(n),10)
				Next	
				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,13,15)
				For n=0 To 3 
				 a4.use(piletableau(n),11)
				Next
				For n=4 To 9
				 a4.use(piletableau(n),10)
				Next	
				setanimationpreparative()
				update()
				EndMethod
	EndType		
'******************************************************************************************************************
'										G A M E F R E E W A L L
'******************************************************************************************************************
Type _gamefreewall Extends _gamefreecell
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,FREEWALL)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(8,-11,7-taby-0.5)
				createpilefoundation(4+tabx*1,7)
				createpilefoundation(4+tabx*2,7)
				createpilefoundation(4+tabx*3,7)
				createpilefoundation(4+tabx*4,7)
				createpilefreecell(-11+tabx*0,7)
				createpilefreecell(-11+tabx*1,7)
				createpilefreecell(-11+tabx*2,7)
				createpilefreecell(-11+tabx*3,7)
				createpilefreecell(-11+tabx*4,7)
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cardlist.reverse()				
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				foundationascending(True);
				tableaugiverestrictionfreecell(True);
				cameraposition[0].set(-2,-4,-37)
				cameraposition[1].set(1,-2.5,-36)				
				cameraposition[2].set(1,-2.5,-36)	
				camerapositionmenu[2].set(1,3,-50)		
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-4,-77)
				rectangle[0].set(-11,-10)
				rectangle[1].set(4+tabx*4,7+1)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				
				cardposition(-26,-11,0)
				shufflecards()
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,-11,0,80,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,0,-11,0,40,5,True)
				
				Local v:_vector3=New _vector3
				v.set(15,0,0)
				v.rotz(-10)
				Local av#=1
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,0,30,22)
				For n=0 To 23
				 ar.use(card(51-n),180,v)
				 v.rotz(av)
				 v.mul(1.01)
				 av:*1.02
				Next							
				
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				For n=0 To 1 
				 a2.use(piletableau(n),6)
				Next
				For n=6 To 7
				 a2.use(piletableau(n),6)
				Next	
				
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				For n=0 To 1
				 a3.use(piletableau(n),6)
				Next
				For n=6 To 7
				 a3.use(piletableau(n),6)
				Next	
				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,13,15)
				For n=0 To 1
				 a4.use(piletableau(n),6)
				Next
				For n=6 To 7
				 a4.use(piletableau(n),6)
				Next	
				'----------------------------- kern anlegen -------------------------
				Local ap52:_animationcardtopile=New _animationcardtopile
				ap52.init(Self,30,30)
				For n=2 To 5
				 ap52.use(piletableau(n),2,True,True)
				Next
				Local a54:_animationpileturn=New _animationpileturn
				a54.init(Self,13,100)
				For n=2 To 5
				 a54.use(piletableau(n))
				Next
				
				Local ap22:_animationcardtopile=New _animationcardtopile
				ap22.init(Self,30,30)
				For n=2 To 5
				 ap22.use(piletableau(n),5,True,True)
				Next
				Local a24:_animationpileturn=New _animationpileturn
				a24.init(Self,13,100)
				For n=2 To 5
				 a24.use(piletableau(n))
				Next					

				Local ap32:_animationcardtopile=New _animationcardtopile
				ap32.init(Self,30,30)
				For n=2 To 5
				 ap32.use(piletableau(n),7,True,True)
				Next
				Local a34:_animationpileturn=New _animationpileturn
				a34.init(Self,13,100)
				For n=2 To 5
				 a34.use(piletableau(n))
				Next

				
				setanimationpreparative()
				update()
				EndMethod
	EndType								
'******************************************************************************************************************
'										G A M E E I G H T O F F
'******************************************************************************************************************
Type _gameeightoff Extends _gamefreecell
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,EIGHTOFF)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(8,-11,7-taby-0.5)
				createpilefoundation(14.6,7-taby*0)
				createpilefoundation(14.6,7-taby*1)
				createpilefoundation(14.6,7-taby*2)
				createpilefoundation(14.6,7-taby*3)
				createpilefreecell(-11+tabx*0,7)
				createpilefreecell(-11+tabx*1,7)
				createpilefreecell(-11+tabx*2,7)
				createpilefreecell(-11+tabx*3,7)
				createpilefreecell(-11+tabx*4,7)
				createpilefreecell(-11+tabx*5,7)
				createpilefreecell(-11+tabx*6,7)
				createpilefreecell(-11+tabx*7,7)
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cardlist.reverse()
				tableaugivesamesuit(True);
				tableaugivedescending(True);
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);
				tableautakeemptynumber(12);'king
				tableaugiverestrictionfreecell(True);
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(0,-6,-35)				
				cameraposition[2].set(0,-1.5,-35)	
				camerapositionmenu[2].set(1.5,3,-50)
			
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-3,-75)
				rectangle[0].set(-11,-10)
				rectangle[1].set(14.6,7+1)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,-11,0,80,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,0,-11,0,40,5,True)
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,3,3,0,180,10,8)
				shufflecards()
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				For n=0 To 7 
				 a2.use(piletableau(n),6)
				Next
				Local ar2:_animationrotation=New _animationrotation
				ar2.init(Self,0,0,0,180,0.70,8)
				Local af:_animationcardtofreecell=New _animationcardtofreecell
				af.init(Self,40,40)
				For Local cfit:_pilefreecell=EachIn pilefreecelllist
				 af.use(cfit)
				Next
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				For n=0 To 7 
				 a3.use(piletableau(n),6)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,16,15)
				For n=0 To 7 
				 a4.use(piletableau(n),6)
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType

'******************************************************************************************************************
'										G A M E F O R E C E L L 
'******************************************************************************************************************
Type _gameforecell Extends _gamefreecell
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,FORECELL)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(8,-11,7-taby-0.5)
				createpilefoundation(4+tabx*0,7)
				createpilefoundation(4+tabx*1,7)
				createpilefoundation(4+tabx*2,7)
				createpilefoundation(4+tabx*3,7)
				createpilefreecell(-11+tabx*0,7)
				createpilefreecell(-11+tabx*1,7)
				createpilefreecell(-11+tabx*2,7)
				createpilefreecell(-11+tabx*3,7)
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cardlist.reverse()
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				foundationascending(True);
				tableaugiverestrictionfreecell(True);
				tableautakeemptynumber(12);'king
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(0,0,-37)				
				cameraposition[2].set(0,-2,-35)	
				camerapositionmenu[2].set(1,4,-55)			
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-3,-75)
				rectangle[0].set(-11,-10)
				rectangle[1].set(4+tabx*3,7+1)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,-11,0,80,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,0,-11,0,40,5,True)
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,180,0.70,8)
				shufflecards()
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				For n=0 To 7
				 a2.use(piletableau(n),6)
				Next
				Local ar2:_animationrotation=New _animationrotation
				ar2.init(Self,0,0,0,180,0.70,8)
				Local af:_animationcardtofreecell=New _animationcardtofreecell
				af.init(Self,40,40)
				For Local cfit:_pilefreecell=EachIn pilefreecelllist
				 af.use(cfit)
				Next				
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				For n=0 To 7
				 a3.use(piletableau(n),6)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,13,15)
				For n=0 To 7
				 a4.use(piletableau(n),6)
				Next
				setanimationpreparative()
				update()
				EndMethod
		
	EndType	
'******************************************************************************************************************
'										G A M E F O U R C O L O R
'******************************************************************************************************************
Type _gamefourcolor Extends _gamefreecell
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,FOURCOL)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby)
				createpilefoundation(14.6,7-taby*0)
				createpilefoundation(14.6,7-taby*1)
				createpilefoundation(14.6,7-taby*2)
				createpilefoundation(14.6,7-taby*3)
				createpilefreecell(-11+tabx*0,7,2)
				createpilefreecell(-11+tabx*1,7,3)
				createpilefreecell(-11+tabx*2,7,1)
				createpilefreecell(-11+tabx*3,7,0)
				createcards(1,0)
				createcards(1,1)
				createcards(1,3)
				createcards(1,2)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				foundationascending(True);
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(0,-2,-37)				
				cameraposition[2].set(0,-2,-37)				
				camerapositionmenu[2].set(2,4,-60)
				camerapositionpreview[1].set(0,0,-90)
				camerapositionpreview[2].set(0,-4,-95)
				rectangle[0].set(-11,-13)
				rectangle[1].set(14.6,7)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,-11,0,80,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,0,-11,0,40,5,True)
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,3,4,0,180,10,8)
				shufflecards(0,12)
				shufflecards(13,25)
				shufflecards(26,38)
				shufflecards(39,51)
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				For n=0 To 3
				 a2.use(piletableau(n),13)
				Next
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				For n=0 To 3
				 a3.use(piletableau(n),13)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,13,15)
				For n=0 To 3
				 a4.use(piletableau(n),13)
				Next
				setanimationpreparative()
				update()
				EndMethod
	
	EndType
'******************************************************************************************************************
'										G A M E S E A T O W E R S 
'******************************************************************************************************************
Type _gameseatowers Extends _gamefreecell
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,SEATOWERS)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(10,-11,7-taby-0.5)
				createpilefoundation(-11,7)
				createpilefoundation(-11+tabx,7)
				createpilefoundation(14+tabx*0,7)
				createpilefoundation(14+tabx*1,7)
				createpilefreecell(-1+tabx*0,7)
				createpilefreecell(-1+tabx*1,7)
				createpilefreecell(-1+tabx*2,7)
				createpilefreecell(-1+tabx*3,7)
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				tableaugivesamesuit(True);
				tableaugivedescending(True);
				tableautakesamesuit(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);
				tableaugiverestrictionfreecell(True);
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(1.5,-2,-37)
				cameraposition[2].set(1.5,-2,-37)
				camerapositionmenu[2].set(4,7,-55)

				camerapositionpreview[1].set(0,0,-75)
				camerapositionpreview[2].set(0,-4.5,-78)
				rectangle[0].set(-11,-10)
				rectangle[1].set(-11+tabx*9,7+1)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				shufflecards()
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,-11,0,80,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,0,-11,0,40,5,True)',False,True)
				'Local ar:_animationrotation=New _animationrotation
				'ar.init(Self,0,0,0,180,0.70,8)
				
				Local v:_vector3=New _vector3
				v.set(8,0,-0.02)
				v.rotz(10)
				Local av#=2
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,0,30,30)
				For n=0 To 51
				 ar.use(card(n),180,v)
				 v.rotz(av)
				 v.mul(1.005)
				 av:*1.02
				Next
				
				
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,25,20)
				For n=0 To 9
				 a2.use(piletableau(n),5)
				Next
				Local ar2:_animationrotation=New _animationrotation
				ar2.init(Self,0,0,0,180,0.70,8)		
				
						
				Local af:_animationcardtofreecell=New _animationcardtofreecell
				af.init(Self,40,40)
				Local it:TLink=pilefreecelllist.firstlink().nextlink()
				af.use(_pilefreecell(it.value()))
				it=it.nextlink()
				af.use(_pilefreecell(it.value()))
				
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,15)
				For n=0 To 9
				 a3.use(piletableau(n),5)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,13,15)
				For n=0 To 9
				 a4.use(piletableau(n),5)
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType	
'******************************************************************************************************************
'										G A M E B A K E R S G A M E 
'******************************************************************************************************************
Type _gamebakersgame Extends _gamefreecell
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,BAKERSGAME)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(8,-11,7-taby-0.5)
				createpilefoundation(4+tabx*0,7)
				createpilefoundation(4+tabx*1,7)
				createpilefoundation(4+tabx*2,7)
				createpilefoundation(4+tabx*3,7)
				createpilefreecell(-11+tabx*0,7)
				createpilefreecell(-11+tabx*1,7)
				createpilefreecell(-11+tabx*2,7)
				createpilefreecell(-11+tabx*3,7)
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cardlist.reverse()
				tableaugivesamesuit(True);
				tableaugivedescending(True);
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);
				tableaugiverestrictionfreecell(True);
				tableautakeemptynumber(12);'king
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(0,0,-37)				
				cameraposition[2].set(0,0,-34)		
				camerapositionmenu[2].set(0,7,-55)
		
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-4,-78)
				rectangle[0].set(-11,-8)
				rectangle[1].set(4+tabx*3,7+1)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,-11,0,80,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,0,-11,0,40,5,True)
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,Rnd(-6,6),Rnd(-8,8),0,180,20,8)
				shufflecards()
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				For n=0 To 3
				 a2.use(piletableau(n),7)
				Next
				For n=4 To 7
				 a2.use(piletableau(n),6)
				Next
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				For n=0 To 3
				 a3.use(piletableau(n),7)
				Next
				For n=4 To 7
				 a3.use(piletableau(n),6)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,33,50)
				For n=0 To 3
				 a4.use(piletableau(n),7)
				Next
				For n=4 To 7
				 a4.use(piletableau(n),6)
				Next
				setanimationpreparative()
				update()
				EndMethod
		
	EndType		
'******************************************************************************************************************
'										G A M E A U S T R A L I A N 
'******************************************************************************************************************
Type _gameaustralian Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,AUSTRALIAN)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby-1)
				Local px#=-11
				createpilestock(px,7,0,1)
				createpilewaste(px+tabx,7)
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,0,-30)				
				cameraposition[1].set(-3,0,-30)				
				cameraposition[2].set(-3,0,-30)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(4,0,-55)
				camerapositionpreview[2].set(0,-1,-58)
				rectangle[0].set(-11,-8)
				rectangle[1].set(+tabx*3,7+1)
				enlargerectangle()
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-6,0,40,5,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),24,50,10)
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,180,0.70,8)				
				Local a3:_animationcardtopile=New _animationcardtopile
				a3.init(Self,50,100)
				For n=0 To 6
				 a3.use(piletableau(n),4)
				Next
				Local as:_animationpileshiftout=New _animationpileshiftout
				as.init(Self,20,20)
				For n=0 To 6
				 as.use(piletableau(n),4)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,10,50)
				For n=0 To 6
				 a4.use(piletableau(n),4)
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableau(0)
				 tippexecutemove();Return(True);
				ElseIf tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf autoplaymovetableau(1)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaywaste(card)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E B E T H O R A L
'******************************************************************************************************************
Type _gamebethoral Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,BETROTHAL)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pb:_pilebethoral=createpilebethoral(-11+tabx*0.5,0+taby+4)
				pb.showdescription=False;
				Local px#=-11
				createpilestock(px,0,1,0)
				Local pd:_pilediscard=createpilediscard(px+tabx,0)
				pd.showdescription=False;

				createcards(1,1)
				createcards(1,0)
				createcards(1,3)
				createcards(1,2)
				cameraposition[2].set(-10,0,-35);
				camerapositionmenu[2].set(-10,5,-50)
				camerapositionpreview[1].set(4,0,-50)
				camerapositionpreview[2].set(0,-2.5,-55)
				rectangle[0].set(-11+tabx*0.5 - 6,-taby-4)
				rectangle[1].set(-11+tabx*0.5 + 6,+taby+4)
				enlargerectangle()
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-6,0,40,5,True)
				shufflecards(0,49)
				swapcards(0,50)
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),51,50,10)
				Local a3:_animationcardtopile=New _animationcardtopile
				a3.init(Self,50,100)
				a3.use(piletableau(0),1,False,True)
				setanimationpreparative()
				update()
				EndMethod
	Method tippbethoral:Int()
				For Local pit:_piletableau=EachIn tableau.pilelist
				 Local cpp=pit.cardlist.count()
				 If cpp>2
				  If sourcarditerator>(cpp-1) sourcarditerator=0
				  Local sourstart=sourcarditerator
				  Local found=False
				  Repeat
				   Local cs:_card=pit.card(sourcarditerator)	
				   If cs.canpick() 
				    foundlist.clear()
				    foundlist.addlast(cs)
				    founddest=getpilediscardminimum()
				    foundsour=cs.pile
				    found=True
				   EndIf
				   sourcarditerator:+1
				   If sourcarditerator>(cpp-1) sourcarditerator=0
				  Until found Or sourstart=sourcarditerator
				  If found Return(True)
				 EndIf
				Next
				Return(False)
				EndMethod				
	Method tipp()
				startusing()
				If tippbethoral()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod				
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippbethoral()
				  Local pb:_pilebethoral=_pilebethoral(foundsour)
				  Local it:TLink=foundlist.firstlink()
				  If it And pb
				   pb.discard(_card(it.value()))
				   Return(True);
				  EndIf
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf		
				Return(False);			
				EndMethod		
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autodiscard
	  			  If tippbethoral()
				   Local pb:_pilebethoral=_pilebethoral(foundsour)
				   Local it:TLink=foundlist.firstlink()
				   If it And pb
				    pb.discard(_card(it.value()))
				    Return(True);
				   EndIf
	 			  EndIf  
	 			 EndIf	
				EndIf	
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If card.canpick() 
				 Local pb:_pilebethoral=_pilebethoral(card.pile)
				 If pb
				  pb.discard(card)
				  Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Field sourcarditerator:Int=0						
	EndType
'******************************************************************************************************************
'										G A M E B L A N K E T
'******************************************************************************************************************
Type _gameblanket Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,BLANKET)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pb:_pileblanket
				pb=createpileblanket(-19,9-taby*0);pb.showdescription=False
				pb=createpileblanket(-19,9-taby*1);pb.showdescription=False
				pb=createpileblanket(-19,9-taby*2);pb.showdescription=False
				pb=createpileblanket(-19,9-taby*3);pb.showdescription=False

				Local pr:_pileredeal=createpileredeal(-19+6*tabx,9-taby*4.3,13)
				pr.blanketmode=True
				pr.redealvalue=2
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cardlist.reverse()
				cameraposition[0].set(-4,-4,-46)				
				cameraposition[1].set(0,-4,-43)				
				cameraposition[2].set(0,-2,-44)		
				camerapositionmenu[2].set(1,7,-70)		
				camerapositionpreview[1].set(0,0,-80)
				camerapositionpreview[2].set(0,-3,-100)
				rectangle[0].set(-19,9-taby*4)
				rectangle[1].set(-19+tabx*12,9)
				enlargerectangle()
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-3,-11,0,40,5,True)
				shufflecards()
				Local af:_animationcardtopile=New _animationcardtopile
				af.init(Self,40,40)
				For Local fit:_piletableau=EachIn tableau.pilelist
				 af.use(fit,13,False,True)
				Next		
				Local ar:_animationpseudoclear=New _animationpseudoclear
				ar.init(Self,0,-Rnd(-8,8),Rnd(-8,8),-30,24,40)
				setanimationpreparative()
				update()
				EndMethod
	Method tippblanket:Int()
				Local card:_card[48]
				Local ace:_card[4]
				Local ci=0
				Local ai=0
				For Local pit:_piletableau=EachIn tableau.pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  If cit.number=0
				   ace[ai]=cit
				   ai:+1
				  Else
				   card[ci]=cit
				   ci:+1
				  EndIf
				 Next
				Next
				Local cs:_card=card[souriterator]
				Local cd:_card=ace[destiterator]
				Local sourstart=souriterator
				Local deststart=destiterator
				Local found=False
				foundsourcard=Null
				founddestcard=Null
				Repeat
				 cs=card[souriterator]
				 cd=ace[destiterator]			
				 Local pkd:_pileblanket=_pileblanket(cd.pile)
				 Local pks:_pileblanket=_pileblanket(cs.pile)
				 If pkd And pks And cs.canpick()
				  If pkd.leftestcard(cd)
				   If cs.number=1 And pks.leftestcard(cs)=False'nur 2er
				    found=True
				    foundsourcard=cs
				    founddestcard=cd
				   EndIf
				  Else
				   If cs.number=1 
				    'nichts machen
				   Else
				    If pkd.candropat(cs,cd) 
				     found=True
				     foundsourcard=cs
				     founddestcard=cd
				    EndIf
				   EndIf
				  EndIf
				 EndIf
				 souriterator:+1
				 If souriterator>47 
				  souriterator=0
				  destiterator:+1
				  If destiterator>3 destiterator=0
				 EndIf
				Until found Or ((sourstart=souriterator)And(deststart=destiterator))
				Return(found)				
				EndMethod				
	Method tippexecuteblanket()				
				Local cs:_card=foundsourcard
				Local cd:_card=founddestcard
				If cs And cd
				 Local cn:_card=New _card
				 cn.copy(cs)
				 Local vn:_vector3=New _vector3
				 Local t0:_vector3=New _vector3
				 Local t1:_vector3=New _vector3
				 t0.set(0,0,-20)
				 t1.set(0,0,+20)
				 cn.tipplink=tipplist.addlast(cn)
				 cn.curveposition.setvector(cn.position,cd.position,t0,t1)
				 cn.curvevx.setvector(cn.vx,cn.vx,vn,vn)
				 cn.curvevy.setvector(cn.vy,cn.vy,vn,vn)
				 cn.curvespeed=solitaire.autospeed
				 cn.startcurve(solitaire.clock)
				 cn.cardcontrolopacity=cs
				 cn.curveopacity.set(0,0,2,-10)
				EndIf
				EndMethod					

	Method tipp()
				startusing()
				Local l:TLink=pileredeallist.firstlink();
				Local pr:_pileredeal=Null;
				If(l) pr=_pileredeal(l.value());
				If(pr) If (pr.ready()=False) Return(False);
				If tippblanket()
				 tippexecuteblanket();Return(True);	
				ElseIf tippredeal()
				 tippexecuteredeal();Return(True);
				EndIf
				Return(False);
				EndMethod				
	Method autoplay()
				startusing()
				Local l:TLink=pileredeallist.firstlink();
				Local pr:_pileredeal=Null;
				If(l) pr=_pileredeal(l.value());
				If(pr) If (pr.ready()=False) Return(False);
				If cardcurving()=False
				 If tippblanket()
				  Local pk:_pileblanket=_pileblanket(founddestcard.pile)
				  If pk pk.swap(foundsourcard,founddestcard)
				  Return(True);
				 ElseIf tippredeal()
				  _pileredeal(foundsour).redeal();Return(True);
				 EndIf
				EndIf	
				Return(False);
				EndMethod			
	Method automove()
				Return(False);
				EndMethod			
	Method clickplayblanket:Int(card:_card)
				If card.number=0 Return(False)
				Local ace:_card[4]
				Local ai=0
				For Local pit:_piletableau=EachIn tableau.pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  If cit.number=0
				   ace[ai]=cit
				   ai:+1
				  EndIf
				 Next
				Next
				Local cs:_card=card
				Local cd:_card=ace[destiterator]
				Local sourstart=souriterator
				Local deststart=destiterator
				Local pks:_pileblanket=_pileblanket(cs.pile)
				Local found=False
				Local di=0
				foundsourcard=Null
				founddestcard=Null
				If pks And cs.canpick()
				 Repeat
				  cd=ace[di]			
				  Local pkd:_pileblanket=_pileblanket(cd.pile)
				  If pkd 
			 	   If pkd.leftestcard(cd)
				    If cs.number=1' And pks.leftestcard(cs)=False'nur 2er
				     found=True
				     foundsourcard=cs
				     founddestcard=cd
				    EndIf
				   Else
				    If cs.number=1 
				     'nichts machen
				    Else
				     If pkd.candropat(cs,cd) 
				      found=True
				      foundsourcard=cs
				      founddestcard=cd
				     EndIf
				    EndIf
				   EndIf
				  EndIf
				  di:+1
			 	 Until found Or di=4
				EndIf
				Return(found)				
				EndMethod						
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayblanket(card)
				 Print "pfft"
				 Local pk:_pileblanket=_pileblanket(founddestcard.pile)
				 If pk pk.swap(foundsourcard,founddestcard)
				 Return(True);
				EndIf
				Return(False);
				EndMethod				
	Field souriterator:Int=0
	Field destiterator:Int=0
	Field foundsourcard:_card=Null
	Field founddestcard:_card=Null
	EndType		
'******************************************************************************************************************
'										G A M E B L A N K E T T W O S U I T
'******************************************************************************************************************
Type _gameblankettwosuit Extends _gameblanket
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,BLANKETTWOSUIT)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pb:_pileblanket
				pb=createpileblanket(-19,9-taby*0);pb.showdescription=False
				pb=createpileblanket(-19,9-taby*1);pb.showdescription=False
				pb=createpileblanket(-19,9-taby*2);pb.showdescription=False
				pb=createpileblanket(-19,9-taby*3);pb.showdescription=False
				Local pr:_pileredeal=createpileredeal(-19+6*tabx,9-taby*4.3,13)
				pr.blanketmode=True
				pr.redealvalue=2
				createcards(1,0)
				createcards(1,0)
				createcards(1,1)
				createcards(1,1)
				cardlist.reverse()
				cameraposition[0].set(-4,-4,-46)				
				cameraposition[1].set(0,-4,-43)				
				cameraposition[2].set(0,-2,-44)		
				camerapositionmenu[2].set(1,7,-70)		

				camerapositionpreview[1].set(0,0,-80)
				camerapositionpreview[2].set(0,-3,-100)
				rectangle[0].set(-19,9-taby*4)
				rectangle[1].set(-19+tabx*12,9)
				enlargerectangle()

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-3,-11,0,40,5,True)
				shufflecards()
				Local af:_animationcardtopile=New _animationcardtopile
				af.init(Self,40,40)
				For Local fit:_piletableau=EachIn tableau.pilelist
				 af.use(fit,13,False,True)
				Next		
				Local ar:_animationpseudoclear=New _animationpseudoclear
				ar.init(Self,0,-Rnd(-8,8),Rnd(-8,8),-30,24,40)
				setanimationpreparative()
				update()
				EndMethod
	EndType					
'******************************************************************************************************************
'										G A M E M A Z E 
'******************************************************************************************************************
Type _gamemaze Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,MAZE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local b:_pilemaze
				b=createpilemaze(-19,9-taby*0,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*1,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*2,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*3,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*4,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*5,9);b.showdescription=False

				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				createcard(0,12)
				createcard(0,12)
				cardlist.reverse()
				cameraposition[0].set(-4,-8,-46)				
				cameraposition[1].set(-7.5,-7,-40)				
				cameraposition[2].set(-7.5,-3,-40)	
			    camerapositionmenu[2].set(-7,7,-70)
			
				camerapositionpreview[1].set(0,0,-120)
				camerapositionpreview[2].set(0,-2.5,-95)
				rectangle[0].set(-19,9-taby*5)
				rectangle[1].set(-19+tabx*8,9)
				enlargerectangle()
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,12,-5,0,40,5,True)
				shufflecards()
				Local af:_animationcardtopile=New _animationcardtopile
				af.init(Self,40,40)
				For Local fit:_piletableau=EachIn tableau.pilelist
				 af.use(fit,9,False,True)
				Next		
				Local ar:_animationpseudoclear=New _animationpseudoclear
				ar.init(Self,12,-Rnd(-8,8),Rnd(-8,8),-30,24,40)
				setanimationpreparative()
				update()
				EndMethod
	Method tippmaze:Int()
				Local card:_card[48]
				Local king:_card[60]
				Local ci=0
				Local ai=0
				For Local pit:_piletableau=EachIn tableau.pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  If cit.number=12
				   king[ai]=cit
				   ai:+1
				  Else
				   card[ci]=cit
				   ci:+1
				  EndIf
				 Next
				Next
				Local cs:_card=card[souriterator]
				Local cd:_card=king[destiterator]
				Local sourstart=souriterator
				Local deststart=destiterator
				Local found=False
				foundsourcard=Null
				founddestcard=Null
				Repeat
				 cs=card[souriterator]
				 cd=king[destiterator]			
				 Local pkd:_pileblanket=_pileblanket(cd.pile)
				 Local pks:_pileblanket=_pileblanket(cs.pile)
				 If pkd And pks And cs.canpick()
				  If pkd.candropat(cs,cd)
				   found=True
				   foundsourcard=cs
				   founddestcard=cd
				  EndIf
				 EndIf
				 souriterator:+1
				 If souriterator>47 
				  souriterator=0
				  destiterator:+1
				  If destiterator>=ai destiterator=0
				 EndIf
				Until found Or ((sourstart=souriterator)And(deststart=destiterator))
				Return(found)				
				EndMethod				
	Method tippexecutemaze()				
				Local cs:_card=foundsourcard
				Local cd:_card=founddestcard
				If cs And cd
				 Local cn:_card=New _card
				 cn.copy(cs)
				 Local vn:_vector3=New _vector3
				 Local t0:_vector3=New _vector3
				 Local t1:_vector3=New _vector3
				 t0.set(0,0,-20)
				 t1.set(0,0,+20)
				 cn.tipplink=tipplist.addlast(cn)
				 cn.curveposition.setvector(cn.position,cd.position,t0,t1)
				 cn.curvevx.setvector(cn.vx,cn.vx,vn,vn)
				 cn.curvevy.setvector(cn.vy,cn.vy,vn,vn)
				 cn.curvespeed=solitaire.autospeed
				 cn.startcurve(solitaire.clock)
				 cn.cardcontrolopacity=cs
				 cn.curveopacity.set(0,0,2,-10)
				EndIf
				EndMethod					

	Method tipp()
				startusing()
				If tippmaze()
				 tippexecutemaze();Return(True);	
				EndIf
				Return(False);
				EndMethod				
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippmaze()
				  Local pk:_pilemaze=_pilemaze(founddestcard.pile)
				  If pk pk.swap(foundsourcard,founddestcard)
				  Return(True);
				 EndIf
				EndIf
				Return(False);	
				EndMethod			
	Method automove()
				Return(False);
				EndMethod			
	Method clickplaymaze:Int(card:_card)
				If card.number=12 Return(False)
				Local king:_card[60]
				Local ai=0
				For Local pit:_piletableau=EachIn tableau.pilelist
				 For Local cit:_card=EachIn pit.cardlist
				  If cit.number=12
				   king[ai]=cit
				   ai:+1
				  EndIf
				 Next
				Next
				Local cs:_card=card
				Local cd:_card=king[destiterator]
				Local sourstart=souriterator
				Local deststart=destiterator
				Local pks:_pilemaze=_pilemaze(cs.pile)
				Local found=False
				Local di=0
				foundsourcard=Null
				founddestcard=Null
				If pks And cs.canpick()
				 Repeat
				  cd=king[di]			
				  Local pkd:_pilemaze=_pilemaze(cd.pile)
				  If pkd 
				   If pkd.candropat(cs,cd) 
				    found=True
				    foundsourcard=cs
				    founddestcard=cd
				   EndIf
				  EndIf
				  di:+1
			 	 Until found Or di=ai
				EndIf
				Return(found)				
				EndMethod						
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplaymaze(card)
				 Local pk:_pilemaze=_pilemaze(founddestcard.pile)
				 If pk pk.swap(foundsourcard,founddestcard)
				 Return(True);
				EndIf
				Return(False);
				EndMethod				
	Field souriterator:Int=0
	Field destiterator:Int=0
	Field foundsourcard:_card=Null
	Field founddestcard:_card=Null
	EndType		

'******************************************************************************************************************
'										G A M E M A Z E E A S Y
'******************************************************************************************************************
Type _gamemazeeasy Extends _gamemaze
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,MAZEEASY)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local b:_pilemaze
				b=createpilemaze(-19,9-taby*0,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*1,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*2,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*3,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*4,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*5,11);b.showdescription=False

				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				createcard(0,12)
				createcard(0,12)
				For Local i=0 To 5
				 createcard(0,12)
				 createcard(0,12)
				Next
				cardlist.reverse()
				cameraposition[0].set(-4,-8,-46)				
				cameraposition[1].set(-5.5,-7,-43)				
				'cameraposition[2].set(-5.5,-1,-43)	
				cameraposition[2].set(-4,-3,-40)	
			    camerapositionmenu[2].set(-2,7,-70)							
				camerapositionpreview[1].set(0,0,-120)
				camerapositionpreview[2].set(0,-2.5,-95)
				rectangle[0].set(-19,9-taby*5)
				rectangle[1].set(-19+tabx*10,9)
				enlargerectangle()
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,12,-5,0,40,5,True)
				shufflecards()
				Local af:_animationcardtopile=New _animationcardtopile
				af.init(Self,40,40)
				For Local fit:_piletableau=EachIn tableau.pilelist
				 af.use(fit,11,False,True)
				Next		
				Local ar:_animationpseudoclear=New _animationpseudoclear
				ar.init(Self,12,-Rnd(-8,8),Rnd(-8,8),-30,24,40)
				setanimationpreparative()
				update()
				EndMethod
	EndType					
'******************************************************************************************************************
'										G A M E M A Z E T W O S U I T
'******************************************************************************************************************
Type _gamemazetwosuit Extends _gamemaze
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,MAZETWOSUIT)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local b:_pilemaze
				b=createpilemaze(-19,9-taby*0,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*1,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*2,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*3,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*4,9);b.showdescription=False
				b=createpilemaze(-19,9-taby*5,9);b.showdescription=False

				createcards(1,0)
				createcards(1,0)
				createcards(1,2)
				createcards(1,2)
				createcard(0,12)
				createcard(0,12)
				cardlist.reverse()
				cameraposition[0].set(-4,-8,-46)				
				cameraposition[1].set(-7.5,-7,-40)				
				'cameraposition[2].set(-7.5,-1,-40)	
				cameraposition[2].set(-7.5,-3,-40)	
			    camerapositionmenu[2].set(-7,7,-70)							
				camerapositionpreview[1].set(0,0,-120)
				camerapositionpreview[2].set(0,-2.5,-95)
				rectangle[0].set(-19,9-taby*5)
				rectangle[1].set(-19+tabx*8,9)
				enlargerectangle()
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,12,-5,0,40,5,True)
				shufflecards()
				Local af:_animationcardtopile=New _animationcardtopile
				af.init(Self,40,40)
				For Local fit:_piletableau=EachIn tableau.pilelist
				 af.use(fit,9,False,True)
				Next		
				Local ar:_animationpseudoclear=New _animationpseudoclear
				ar.init(Self,12,-Rnd(-8,8),Rnd(-8,8),-30,24,40)
				setanimationpreparative()
				update()
				EndMethod
	EndType				
'******************************************************************************************************************
'										G A M E M A Z E E A S Y T W O S U I T
'******************************************************************************************************************
Type _gamemazeeasytwosuit Extends _gamemaze
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,MAZEEASYTWOSUIT)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local b:_pilemaze
				b=createpilemaze(-19,9-taby*0,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*1,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*2,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*3,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*4,11);b.showdescription=False
				b=createpilemaze(-19,9-taby*5,11);b.showdescription=False

				createcards(1,3)
				createcards(1,3)
				createcards(1,1)
				createcards(1,1)
				createcard(0,12)
				createcard(0,12)
				For Local i=0 To 5
				 createcard(3,12)
				 createcard(3,12)
				Next
				cardlist.reverse()
				cameraposition[0].set(-4,-8,-46)				
				cameraposition[1].set(-5.5,-7,-43)				
				'cameraposition[2].set(-5.5,-1,-43)		
				cameraposition[2].set(-4,-3,-40)	
			    camerapositionmenu[2].set(-2,7,-70)	
				camerapositionpreview[1].set(0,0,-120)
				camerapositionpreview[2].set(0,-2.5,-95)
				rectangle[0].set(-19,9-taby*5)
				rectangle[1].set(-19+tabx*10,9)
				enlargerectangle()
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,12,-5,0,40,5,True)
				shufflecards()
				Local af:_animationcardtopile=New _animationcardtopile
				af.init(Self,40,40)
				For Local fit:_piletableau=EachIn tableau.pilelist
				 af.use(fit,11,False,True)
				Next		
				Local ar:_animationpseudoclear=New _animationpseudoclear
				ar.init(Self,12,-Rnd(-8,8),Rnd(-8,8),-30,24,40)
				setanimationpreparative()
				update()
				EndMethod
	EndType				
'******************************************************************************************************************
'										G A M E C A N C A N 
'******************************************************************************************************************
Type _gamecancan Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,CANCAN)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(13,-18,0)
				createpilereserve(-8+tabx*0,7)
				createpilereserve(-8+tabx*1,7)
				createpilereserve(-8+tabx*2,7)
				Local px#=4
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);				
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				'vorher : cameraposition.set(0,-4,-39)				
				cameraposition[0].set(-4,-4,-46)				
				cameraposition[1].set(1,-4,-43)				
				cameraposition[2].set(1,-4,-43)		
				camerapositionmenu[2].set(0,3,-55)
		
				camerapositionpreview[1].set(0,-6,-80)
				camerapositionpreview[2].set(0,-6,-96)
				rectangle[0].set(-18,-6)
				rectangle[1].set(-18+tabx*12,7)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n,i
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,2,-9,0,40,5,True)
				shufflecards()
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,50,10)
				i=1
				For n=0 To 12
				 a2.use(piletableau(n),i)
				 If n>5 i:-1 Else i:+1
				Next
				Local ap:_animationcardtopile=New _animationcardtopile
				ap.init(Self,50,10)
				For Local prit:_pilereserve=EachIn pilereservelist
				 ap.use(prit,1,False,True)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				i=1
				For n=0 To 12
				 as.use(piletableau(n),i)
				 If n>5 i:-1 Else i:+1
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For n=0 To 12
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tipptableau(0)
				 tippexecutemove();Return(True);
				ElseIf tippreserve(0)
				 tippexecutemove();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippreserve(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
				 Local f=False
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
	
				 If solitaire.autoturncard
				  If tipptableauturn() 
				   For Local card:_card=EachIn foundlist
				    card.turn(solitaire.clock,15,True)
				   Next
				   Return(True);
				  EndIf
				 EndIf
				
				 If solitaire.autoempty
				  If tipptableauemptypile() 
				   autoplayanimationpiletopile(True,True)
				   Return(True);
				  EndIf
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplaytableaumove(card)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod

	EndType	
'******************************************************************************************************************
'										G A M E C R U E L
'******************************************************************************************************************
Type _gamecruel Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,CRUEL)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpileredeal(-11,7,4)
				For Local iy#=0 To 1 
				 For Local ix#=0 To 5
				  createpilecruel(-11+ix*tabx,-4+iy*taby)
				 Next
			    Next
				Local px#=4
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[1].set(-1,0,-37)
				cameraposition[2].set(0,0,-35)
				camerapositionmenu[2].set(1,7,-50)
				camerapositionpreview[1].set(0,0,-58)
				camerapositionpreview[2].set(0,-2.5,-66)
				rectangle[0].set(-11,-4)
				rectangle[1].set(4+tabx*3,7)
				enlargerectangle()
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n,i
				initgeneral(s,mo)
				cardposition(26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,14,-6,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,10,-3,0,40,5,True)
				'shufflecards(1,12)
				'shufflecards(14,25)
				'shufflecards(27,38)
				'shufflecards(40,51)
				Local af:_animationcardtofoundation=New _animationcardtofoundation
				af.init(Self,40,40)
				Local in=0
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 af.use(fit,card(in*13))
				 'If in=1 af.use(fit,card(12))
				 'If in=2 af.use(fit,card(24))
				 'If in=3 af.use(fit,card(36))
				 in:+1
				Next					
				shufflecards()
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,50,35)
				For n=0 To 11
				 a2.use(piletableau(n),4,False,True)
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				Local l:TLink=pileredeallist.firstlink();
				Local pr:_pileredeal=Null;
				If(l) pr=_pileredeal(l.value());
				If(pr) If (pr.ready()=False) Return(False);
				
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableau(0)
				 tippexecutemove();Return(True);
				ElseIf tippredeal()
				 tippexecuteredeal();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				Local l:TLink=pileredeallist.firstlink();
				Local pr:_pileredeal=Null;
				If(l) pr=_pileredeal(l.value());
				If(pr) If (pr.ready()=False) Return(False);
				
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf autoplaymovetableau(1)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippredeal()
				  _pileredeal(foundsour).redeal();Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
				Local l:TLink=pileredeallist.firstlink();
				Local pr:_pileredeal=Null;
				If(l) pr=_pileredeal(l.value());
				If(pr) If (pr.ready()=False) Return(False);
	
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				Local l:TLink=pileredeallist.firstlink();
				Local pr:_pileredeal=Null;
				If(l) pr=_pileredeal(l.value());
				If(pr) If (pr.ready()=False) Return(False);
				
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod			
	EndType	
'******************************************************************************************************************
'										G A M E S O L I D S Q U A R E
'******************************************************************************************************************
Type _gamesolidsquare Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,SOLIDSQUARE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pw:_pilewaste=createpilewaste(-11,0)				
				pw.tableaufill=True
				Local ps:_pilestock=createpilestock(-14,taby,0,1)
				ps.tableaufill=True
				ps.redealvalue=0			
				For Local iy#=0 To 3 
				 For Local ix#=0 To 3
				  Local cc:_pilecruel=createpilecruel(-2*tabx+ix*tabx,2*taby-iy*taby)
				  cc.takeemptyrestriction=False
				 Next
			    Next
				Local px#=4
				Local pf:_pilefoundation
				pf=createpilefoundation(+tabx*4,+taby*2.2);pf.takeemptysuit=0
				pf=createpilefoundation(-tabx*5,-taby*1.2);pf.takeemptysuit=1
				pf=createpilefoundation(+tabx*4,-taby*1.2);pf.takeemptysuit=2
				pf=createpilefoundation(-tabx*5,+taby*2.2);pf.takeemptysuit=3
				tableautakesamesuit(True);
				tableautakeboth(True);
				tableautakewrapped(True);
				foundationascending(True);	
				foundationmirrored(True);
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(-5,2,-33)
				cameraposition[1].set(-4,3,-37)
				cameraposition[2].set(-4,3,-37)
				camerapositionmenu[1].set(-1,5,-65)
				camerapositionmenu[2].set(-1,5,-65)
				camerapositionpreview[1].set(0,0,-78)
				camerapositionpreview[2].set(0,-2.3,-75)
				rectangle[0].set(-tabx*5,-taby*1.2)
				rectangle[1].set(+tabx*4,+taby*2.2)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n,i
				initgeneral(s,mo)
				cardposition(26,-11,0)
				shufflecards()
				Local a0:_animationmove=New _animationmove
				a0.init(Self,14,-6,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,10,-3,0,40,5,True)
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,50,35)
				For n=0 To 15
				 a2.use(piletableau(n),1,False,True)
				Next
				Local as:_animationcardtostock=New _animationcardtostock
				as.init(Self,pilestock(0),8*13-16,20,10)				
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableau(0,False,True,True)
				 tippexecutemove();Return(True);
				ElseIf tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,False,True,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False,True)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod				
	EndType	
'******************************************************************************************************************
'										G A M E N A P O L E O N S S Q U A R E
'******************************************************************************************************************
Type _gamenapoleonssquare Extends _gamesolidsquare
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,NAPOLEONSSQUARE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pw:_pilewaste=createpilewaste(-tabx*0.7-tabx*0.5,-taby*1-0.5)				
				'pw.tableaufill=True
				Local ps:_pilestock=createpilestock(+tabx*0.7-tabx*0.5,-taby*1-0.5,0,1)
				ps.redealvalue=0			
				'ps.tableaufill=True
				For Local ix#=0 To 3 
				 Local pc:_pilecruel
				 pc=createpilecruel(-2*tabx+ix*tabx,2*taby);pc.takeemptyrestriction=False
				 pc=createpilecruel(-3*tabx-0.5,2*taby-taby*ix);pc.takeemptyrestriction=False
				 pc=createpilecruel(+2*tabx+0.5,2*taby-taby*ix);pc.takeemptyrestriction=False
				 Local pf:_pilefoundation
				 pf=createpilefoundation(-2*tabx+ix*tabx,taby);     pf.takeemptysuit=Int(ix)
				 pf=createpilefoundation(-2*tabx+ix*tabx,0);        pf.takeemptysuit=Int(ix)
			    Next
				tableautakesamesuit(True);
				tableautakedescending(True);
				foundationascending(True);	
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(-5,2,-33)
				cameraposition[1].set(-4,3,-33)
				cameraposition[2].set(-1,2.5,-30)
				camerapositionmenu[1].set(-1,5,-65)
				camerapositionmenu[2].set(-1,5,-65)
				camerapositionpreview[1].set(0,0,-78)
				camerapositionpreview[2].set(0,-2,-65)
				rectangle[0].set(-3*tabx-0.5,-taby*1-0.5)
				rectangle[1].set(+2*tabx+0.5,2*taby)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n,i
				initgeneral(s,mo)
				cardposition(26,-11,0)
				shufflecards()
				Local a0:_animationmove=New _animationmove
				a0.init(Self,14,-6,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,11,-3,0,40,5,True)
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,50,35)
				For n=0 To 11
				 a2.use(piletableau(n),1,False,True)
				Next
				Local as:_animationcardtostock=New _animationcardtostock
				as.init(Self,pilestock(0),8*13-12,20,10)				
				setanimationpreparative()
				update()
				EndMethod
				Rem
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove()	
				ElseIf tippwaste()
				 tippexecutemove()
				ElseIf tipptableau(0,False,True,True)
				 tippexecutemove()
				ElseIf tippstock()
				 tippexecutestock()
				EndIf
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True)
				 ElseIf tippwaste()
				  autoplayanimationpiletopile()
				 ElseIf autoplaymovetableau(1,False,True,True)
				  autoplayanimationpiletopile()
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock)
				 EndIf
				EndIf
				EndMethod		
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True)
				ElseIf clickplaytableaumove(card,False,False,True)
				 autoplayanimationpiletopile()
				EndIf
				EndMethod					
				EndRem
	EndType									
'******************************************************************************************************************
'										G A M E L A B E L L E L U C I E
'******************************************************************************************************************
Type _gamelabellelucie Extends _gamecruel
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,LABELLELUCIE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pr:_pileredeal=createpileredeal(-11,7,3)
				pr.shuffle=True
				pr.redealvalue=2
				createpiletableau(3,-8+7*tabx,6.5-4.3*taby,-tabx*2.3,0)
				createpiletableau(5,-8+7*tabx,6.5-3.2*taby,-tabx*2.3,0)
				createpiletableau(5,-8+7*tabx,6.5-2.1*taby,-tabx*2.3,0)
				createpiletableau(5,-8+7*tabx,6.5-1.0*taby,-tabx*2.3,0)
				Local px#=4
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableautakesamesuit(True);
				tableautakedescending(True);
				tableaumaximumlength(4)
				foundationascending(True);	
				For Local n=0 To 17
				 piletableau(n).givemaximal=1
				 piletableau(n).vector.set(0.8,-0.2,0)
				 piletableau(n).takeemptyrestriction=True
				Next			
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-taby-2,-41)
				cameraposition[1].set(0,-taby,-39)
				cameraposition[2].set(-2,-taby+1,-39)
				camerapositionpreview[1].set(0,0,-110)
				camerapositionpreview[2].set(0,-2,-83)
				rectangle[0].set(-8,7-4.3*taby-2)
				rectangle[1].set(tabx*3,7)
				enlargerectangle()

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n,i
				initgeneral(s,mo)
				cardposition(26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,14,-6,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,10,-3,0,40,5,True)
				shufflecards()
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,50,35)
				For n=0 To 16
				 a2.use(piletableau(n),3,False,True)
				Next
				a2.use(piletableau(17),1,False,True)
				setanimationpreparative()
				update()
				EndMethod
	EndType					
'******************************************************************************************************************
'										G A M E L A F A C I L E L U C I E
'******************************************************************************************************************
Type _gamelafacilelucie Extends _gamecruel
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,LAFACILELUCIE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pr:_pileredeal=createpileredeal(-11,7,3)
				pr.redealvalue=2
				pr.shuffle=True
				Rem
				createpiletableau(5,-11,7-1.0*taby,tabx*2,0)
				createpiletableau(5,-11,7-2.1*taby,tabx*2,0)
				createpiletableau(5,-11,7-3.2*taby,tabx*2,0)
				createpiletableau(3,-11,7-4.3*taby,tabx*2,0)
				EndRem
				createpiletableau(3,-8+7*tabx,6.5-4.3*taby,-tabx*2.3,0)
				createpiletableau(5,-8+7*tabx,6.5-3.2*taby,-tabx*2.3,0)
				createpiletableau(5,-8+7*tabx,6.5-2.1*taby,-tabx*2.3,0)
				createpiletableau(5,-8+7*tabx,6.5-1.0*taby,-tabx*2.3,0)
				
				Local px#=4
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				foundationascending(True);	
				tableaumaximumlength(4)
				
				For Local n=0 To 17
				
				' piletableau(n).localrule=True
				 piletableau(n).takesamesuit=True
				 piletableau(n).takedescending=True
				 piletableau(n).givemaximal=1
				 piletableau(n).vector.set(0.8,-0.2,0)
				 piletableau(n).takeemptynumber=12
				Next			
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-taby-2,-41)
				cameraposition[1].set(0,-taby,-39)
				cameraposition[2].set(-2,-taby+1,-39)
				camerapositionpreview[1].set(0,0,-110)
				camerapositionpreview[2].set(0,-2,-83)
				rectangle[0].set(-8,7-4.3*taby-2)
				rectangle[1].set(tabx*3,7)
				enlargerectangle()
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n,i
				initgeneral(s,mo)
				cardposition(26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,14,-6,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,10,-3,0,40,5,True)
				shufflecards()
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,50,35)
				For n=0 To 16
				 a2.use(piletableau(n),3,False,True)
				Next
				a2.use(piletableau(17),1,False,True)
				setanimationpreparative()
				update()
				EndMethod
	EndType					

'******************************************************************************************************************
'										G A M E P Y R A M I D
'******************************************************************************************************************
Type _gamepyramid Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,PYRAMID)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpilewastepyramid(-7.8,7-taby)
				Local pd:_pilediscard=createpilediscard(10,7)
				pd.pyramidmode=True
				createpilepyramid(2,7)
				Local ps:_pilestockpyramid=createpilestockpyramid(-7.8,7)
				ps.redealvalue=2
				ps.open=True
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-6,-39)
				cameraposition[2].set(0,0,-35)
				camerapositionmenu[2].set(2.5,5,-55)
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-2.5,-70)
				rectangle[0].set(-7.8,7-taby*3)
				rectangle[1].set(2+tabx*3,7)
				enlargerectangle()

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n,i
				initgeneral(s,mo)
				cardposition(26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,14,2,0,30,10)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,10,5,0,30,10,True)
				shufflecards()
				Local ap:_animationcardtopile=New _animationcardtopile
				ap.init(Self,20,40)	
				For Local pit:_pilepyramid=EachIn pilepyramidlist	
				 ap.use(pit,28,False,True)
				Next
				ap.cardinpreparationafteranimation=False
				Local a011:_animationmove=New _animationmove
				a011.init(Self,-2,8,0,30,20,True)
				Local as:_animationcardtopile=New _animationcardtopile
				as.init(Self,15,40)	
				as.use(pilestock(0),24,True,True)
				setanimationpreparative()
				update()
				EndMethod
	Method tippkingtodiscardcard:Int(c:_card)
				If c.number=12 
				 foundsour=c.pile
				 founddest=getpilediscardminimum()
				 foundlist.clear()
				 foundlist.addlast(c)
				 Return(True)
				EndIf
				Return(False)
				EndMethod
	Method tippkingtodiscard:Int()
				If pilediscardlist.firstlink()
				 Local it:TLink=Null
				 Local c:_card=Null
				 For Local psit:_pilestock=EachIn pilestocklist
				  it=psit.cardlist.firstlink()
				  If it If tippkingtodiscardcard(_card(it.value())) Return(True)
				 Next
				 For Local pwit:_pilewaste=EachIn pilewastelist
				  it=pwit.cardlist.firstlink()
				  If it If tippkingtodiscardcard(_card(it.value())) Return(True)
				 Next
				 For Local prit:_pilereserve=EachIn pilereservelist
				  For Local crit:_card=EachIn prit.cardlist
				   If tippkingtodiscardcard(crit) Return(True)
				  Next
				 Next
				 For Local pit:_pilepyramid=EachIn pilepyramidlist
				  For Local cit:_card=EachIn pit.cardlist
				   If cit.canpick() If tippkingtodiscardcard(cit) Return(True)
				  Next
				 Next
				EndIf
				Return(False)
				EndMethod				
	Method tipppyramidcard:Int(cs:_card)
				Local itp:TLink=pilepyramidlist.firstlink()
				Repeat
				 If itp
				  Local pp:_pilepyramid=_pilepyramid(itp.value())
				  Local itc:TLink=pp.cardlist.firstlink()
				  Repeat
				   If itc
				 	Local cp:_card=_card(itc.value())
					If cp.canpick() If (((cs.number+1)+(cp.number+1))=13)
				 	 foundlist.clear()
				 	 founddest=getpilediscardminimum()
				 	 foundsour=cp.pile
				   	 foundlist.addlast(cs)
				   	 foundlist.addlast(cp)
				   	 Return(True)
				  	EndIf
				    itc=itc.nextlink()
				   EndIf
				  Until itc=Null
				  itp=itp.nextlink()
				 EndIf
				Until itp=Null
				Return(False)
				EndMethod
	Method tipppyramidpyramid:Int(cs:_card,cd:_card)
				If pilediscardlist.firstlink()
				 If (((cs.number+1)+(cd.number+1))=13)
				  If cs.canpick() And cd.canpick()
				   foundlist.clear()
				   founddest=getpilediscardminimum()
				   foundsour=cd.pile
				   foundlist.addlast(cs)
				   foundlist.addlast(cd)
				   Return(True)				   
				  EndIf
				 EndIf
				EndIf
				Return(False)
				EndMethod
	Method tipppyramid:Int()
				If pilestocklist.firstlink() And pilewastelist.firstlink() And pilediscardlist.firstlink()
				 'Local pilewaste:_pilewaste=_pilewaste(pilewastelist.firstlink().value())
				 'Local pilestock:_pilestock=_pilestock(pilestocklist.firstlink().value())
				 'kann innerhalb der pyramide etwas discarded werden?
				 'dazu die kombination benutzen
				 Local pit:TLink=pilepyramidlist.firstlink()
				 If pit
				  Local pp:_pilepyramid=_pilepyramid(pit.value())
				  Local cpp=pp.cardlist.count()
				  If cpp>1
				   If sourcarditerator>(cpp-1) sourcarditerator=0
				   If destcarditerator>(cpp-1) destcarditerator=0
				   Local sourstart=sourcarditerator
				   Local deststart=destcarditerator
				   Local f=False
				   Repeat
				    Local cs:_card=pp.card(sourcarditerator)
				    Local cd:_card=pp.card(destcarditerator)
					If tipppyramidpyramid(cs,cd) f=True
				    destcarditerator:+1
				    If destcarditerator>(cpp-1)
				     destcarditerator=0
				     sourcarditerator:+1
				     If sourcarditerator>(cpp-1) sourcarditerator=0
				    EndIf
				   Until f Or ((sourstart=sourcarditerator) And (deststart=destcarditerator))
				   If f Return(True)
				  EndIf
				 EndIf
				 'kann zwischen stock und waste discarded werden ?
				 For Local psit:_pilestock=EachIn pilestocklist
				  For Local pwit:_pilewaste=EachIn pilewastelist
				   Local its:TLink=psit.cardlist.firstlink()
				   Local itw:TLink=pwit.cardlist.firstlink()
				   Local cs:_card=Null
				   Local cw:_card=Null
				   If its And itw
				    cs=_card(its.value())
				    cw=_card(itw.value())
				    If (((cs.number+1)+(cw.number+1))=13)
				     foundlist.clear()
				     founddest=getpilediscardminimum()
				     foundsour=psit
				     foundlist.addlast(cs)
				     foundlist.addlast(cw)
				     Return(True)
				    EndIf
  				   EndIf
				   'kann zwischen pyramide und stock discarded werden?
				   If its
				    cs=_card(its.value())
				    If tipppyramidcard(cs) Return(True)
				   EndIf
				   'kann zwischen pyramide und waste discarded werden?
				   If itw
				    cw=_card(itw.value())
				    If tipppyramidcard(cw) Return(True)
				   EndIf
				  Next
				 Next
				EndIf
				'kann zwischen pyramide und reserve discarded werden?
				For Local prit:_pilereserve=EachIn pilereservelist
				 For Local crit:_card=EachIn prit.cardlist
				  If tipppyramidcard(crit) Return(True)
				 Next
				Next
				Return(False)
				EndMethod	
	Method tippexecutepyramid:Int()
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
				 off.copy(founddest.dropposition())
				 cn.curveposition.setvector(cn.position,off,t0,t1)
				 cn.curvevx.setvector(cn.vx,founddest.dropvx(),vn,vn)
				 cn.curvevy.setvector(cn.vy,founddest.dropvy(),vn,vn)
				 cn.curvespeed=solitaire.autospeed
				 cn.startcurve(solitaire.clock)
				 cn.cardcontrolopacity=card
				 cn.curveopacity.set(0,0,2,-10)
				 i:+1
				Next				
				EndMethod				
	Method tipp()
				startusing()
				If tippkingtodiscard()
				 tippexecutemove();Return(True);
				ElseIf tipppyramid()
				 tippexecutepyramid();Return(True);
				ElseIf tippstockpyramid()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod				
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippkingtodiscard()
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipppyramid()
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tippstockpyramid()
				  _pilestockpyramid(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf	
				Return(False);
				EndMethod		
	Method automove()				
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autodiscard
	  			  If tippkingtodiscard()
				   autoplayanimationpiletopile(True,True);Return(True);
	 			  EndIf  
	 			 EndIf	
				EndIf	
				Return(False);
				EndMethod			
	Method clickplaypilecard(card:_card,pile:_pile)
				If pile=Null Return(False);
				If pilediscardlist.firstlink()
				
				 Local pr:_pilereserve=_pilereserve(pile);
				 If pr
				  For Local cit:_card=EachIn pile.cardlist
				   If (((card.number+1)+(cit.number+1))=13)
				    foundlist.clear()
				    founddest=getpilediscardminimum()
				    foundsour=card.pile
				    foundlist.addlast(card)
				    foundlist.addlast(cit)
				    Return(True)				   
				   EndIf
				  Next
				 Else
				  Local it:TLink=pile.cardlist.firstlink()
				  If it
				   Local cit:_card=_card(it.value())
				   If (((card.number+1)+(cit.number+1))=13)
				    foundlist.clear()
				    founddest=getpilediscardminimum()
				    foundsour=card.pile
				    foundlist.addlast(card)
				    foundlist.addlast(cit)
				    Return(True)				   
				   EndIf
				  EndIf
				 EndIf
				
				EndIf
				Return(False)
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If tippkingtodiscardcard(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf tipppyramidcard(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaypilecard(card,pilestock(0))
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaypilecard(card,pilewaste(0))
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaypilecard(card,pilestock(1))
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaypilecard(card,pilewaste(1))
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaypilecard(card,pilereserve(0))
				 autoplayanimationpiletopile(True,True);Return(True);
				EndIf
				Return(False);
				EndMethod				
	Field sourcarditerator:Int=0				
	Field destcarditerator:Int=0				
	EndType		
'******************************************************************************************************************
'										G A M E P Y R A M I D D O U B L E 
'******************************************************************************************************************
Type _gamepyramiddouble Extends _gamepyramid
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,PYRAMIDDOUBLE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpilewastepyramid(-7.8,7-taby)
				Local pd:_pilediscard=createpilediscard(10,7)
				pd.pyramidmode=True
				createpilepyramid(2,7)
				createpilefreecell(14,0)
				Local ps:_pilestockpyramid=createpilestockpyramid(-7.8,7)
				ps.redealvalue=2
				ps.open=True
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-8,-42)
				cameraposition[1].set(0,-8,-39)
				cameraposition[2].set(0,-2,-39)
				camerapositionmenu[2].set(2,1,-65)
				camerapositionpreview[1].set(0,0,-120)
				camerapositionpreview[2].set(0,-3,-90)
				rectangle[0].set(2-tabx*4.5,7-taby*4.5)
				rectangle[1].set(2+tabx*4.5,7)
				enlargerectangle()
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n,i
				initgeneral(s,mo)
				cardposition(26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,14,2,0,30,10)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,10,5,0,30,10,True)
				shufflecards()
				Local ap:_animationcardtopile=New _animationcardtopile
				ap.init(Self,20,40)	
				For Local pit:_pilepyramid=EachIn pilepyramidlist	
				 ap.use(pit,55,False,True)
				Next
				ap.cardinpreparationafteranimation=False
				Local a011:_animationmove=New _animationmove
				a011.init(Self,-2,8,0,30,20,True)
				Local as:_animationcardtopile=New _animationcardtopile
				as.init(Self,20,40)	
				as.use(pilestock(0),104-55,True,True)
				setanimationpreparative()
				update()
				EndMethod
	EndType				
'******************************************************************************************************************
'										G A M E P Y R A M I D R E S E R V E
'******************************************************************************************************************
Type _gamepyramidreserve Extends _gamepyramid
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,PYRAMIDRESERVE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pd:_pilediscard=createpilediscard(10,7)
				pd.pyramidmode=True
				createpilepyramid(2,7)
				'createpilefreecell(14,0)
				Local pr:_pilereserve=createpilereserve(-11-tabx*0.5,8)
				pr.vector.set(0,-0.8,0)
				pr.flowermode=True
				pr.arcmode=True
				pr.radiusy=3
				pr.radiusx=7
				pr.anglestep=10
				pr.pyramidmode=True
				
								
				Local ps:_pilestockpyramid=createpilestockpyramid(-11,3)
				createpilewastepyramid(-11,3-taby)
				ps.redealvalue=1
				ps.open=True
				
				ps=createpilestockpyramid(-11-tabx,3)
				Local pw:_pilewastepyramid=createpilewastepyramid(-11-tabx,3-taby)
				ps.redealvalue=1
				ps.open=True
				ps.wastepartner=1
				pw.stockpartner=1
				
				
				
				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-8,-42)
				cameraposition[1].set(0,-8,-39)
				cameraposition[2].set(-2,-3,-42)
				camerapositionmenu[2].set(2,1,-65)
				camerapositionpreview[1].set(0,0,-120)
				camerapositionpreview[2].set(0,-4,-110)
				rectangle[0].set(-11-tabx*1.5,7-taby*4.5)
				rectangle[1].set(2+tabx*4.5,8)
				enlargerectangle()
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n,i
				initgeneral(s,mo)
				cardposition(26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,14,2,0,30,10)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,10,5,0,30,10,True)
				shufflecards()
				Local ap:_animationcardtopile=New _animationcardtopile
				ap.init(Self,20,40)	
				For Local pit:_pilepyramid=EachIn pilepyramidlist	
				 ap.use(pit,55,False,True)
				Next
				ap.cardinpreparationafteranimation=False
				Local a011:_animationmove=New _animationmove
				a011.init(Self,-2,8,0,30,20,True)
				
				Local ap2:_animationcardtopile=New _animationcardtopile
				ap2.init(Self,10,40)
				For Local prit:_pilereserve=EachIn pilereservelist
				 ap2.use(prit,10,False,True)
				Next
				ap2.cardinpreparationafteranimation=False				
				
				Local as:_animationcardtopile=New _animationcardtopile
				as.init(Self,20,40)	
				as.use(pilestock(0),20,True,True)
				Local as2:_animationcardtopile=New _animationcardtopile
				as2.init(Self,20,40)	
				as2.use(pilestock(1),19,True,True)
				setanimationpreparative()
				update()
				EndMethod
	EndType					
'******************************************************************************************************************
'										G A M E G O L F
'******************************************************************************************************************
Type _gamegolf Extends _game
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,GOLF)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ps:_pilestock=createpilestock(-7.8,7,0,0,1)
				ps.redealvalue=0
				createpilefoundation(-7.8+tabx,7)
				For Local n=0 To 6
				 createpilereserve(-10+tabx*n,0)
				Next
				foundationboth(True);
				foundationsamesuit(False)
				
				foundationgiverestriction(True);
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,0,-30)				
				cameraposition[1].set(-3,0,-30)				
				cameraposition[2].set(-3,0,-30)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(0,0,-55)
				camerapositionpreview[2].set(0,-2,-57)
				rectangle[0].set(-10,-5)
				rectangle[1].set(-10+tabx*6,7)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,2,0,90,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,90,5,True)
				Local acs:_animationcardtostock=New _animationcardtostock
				acs.init(Self,pilestock(0),16,50,10)		
				Local a20:_animationcardtopile=New _animationcardtopile
				a20.init(Self,60,10)
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 a20.use(fit,1,False)
				Next
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,180,0.70,8)				
				shufflecards()
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,60,10)
				For n=0 To 6 
				 a2.use(pilereserve(n),5)
				Next
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				For n=0 To 6 
				 a3.use(pilereserve(n),5)
				Next				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,33,50)
				For n=0 To 6 
				 a4.use(pilereserve(n),5)
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tippreservetofoundation:Int()
				foundlist.clear()
				foundsour=Null
				founddest=Null
				For Local rit:_pilereserve=EachIn pilereservelist
				 Local c:_card=Null
				 Local it:TLink=rit.cardlist.firstlink()
				 If it
				  c=_card(it.value())
				  If rit.canpick(c)
				   foundlist.clear()
				   foundlist.addlast(c)
				   For Local fit:_pilefoundation=EachIn pilefoundationlist
				    If fit.candrop(foundlist)
				     foundsour=rit
					 founddest=fit
					 Return(True)
				    EndIf
				   Next
				  EndIf
				 EndIf
				Next
				Return(False)
				EndMethod				
	Method tipp()
				startusing()
				If tippreservetofoundation()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod				
	Method autoplay()
				If tippreservetofoundation()
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf tippstock()
				 _pilestock(foundsour).deal(solitaire.clock);Return(True);
				EndIf
				Return(False);
				EndMethod		
	Method automove()				
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippreservetofoundation()
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf	
				EndIf	
				Return(False);
				EndMethod						
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				EndIf
				Return(False);
				EndMethod										
	EndType	
'******************************************************************************************************************
'										G A M E G O L F E A S Y
'******************************************************************************************************************
Type _gamegolfeasy Extends _gamegolf
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,GOLFEASY)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ps:_pilestock=createpilestock(-7.8,7,0,0,1)
				ps.redealvalue=0
				createpilefoundation(-7.8+tabx,7)
				For Local n=0 To 6
				 createpilereserve(-10+tabx*n,0)
				Next
				tableautakesamesuit(True);
				foundationsamesuit(False)
				foundationboth(True)
				foundationwrapped(True)
				foundationgiverestriction(True)
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,0,-30)				
				cameraposition[1].set(-3,0,-30)				
				cameraposition[2].set(-3,0,-30)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(0,0,-55)
				camerapositionpreview[2].set(0,-2,-57)
				rectangle[0].set(-10,-5)
				rectangle[1].set(-10+tabx*6,7)
				enlargerectangle()
				pilesort()	
				EndMethod
EndType	
'******************************************************************************************************************
'										G A M E Y U K O N 
'******************************************************************************************************************
Type _gameyukon Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,YUKON)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby)
				Local px#
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-3,-30)				
				cameraposition[1].set(-3,0,-30)				
				cameraposition[2].set(-3,0,-30)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(0,0,-65)
				camerapositionpreview[2].set(0,-3,-70)
				rectangle[0].set(-11,-7)
				rectangle[1].set(+tabx*3,7+0.5)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n				
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-12,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-4,-10,0,40,5,True)
				
				
				Rem
				Local ar:_animationrotation
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,1)'0
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,2)'2,3,4,5,6
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,9),9,10,11,12,13
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,17)'17,18,19,20,21
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,26)'26,27,28,29,30
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,36)'
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,47)
				EndRem
				
				Local v:_vector3=New _vector3
				v.set(6,0,-0.02)
				v.rotz(10)
				Local av#=2
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,0,30,30)
				For n=0 To 51
				 If (n=0 )Or (n>=2 And n<=6) Or (n>=9 And n<=13) Or (n>=17 And n<=21) Or (n>=26 And n<=30) Or (n>=36 And n<=40) Or (n>=47 And n<=51) 
				  ar.useindex(n,180,v)
				  v.rotz(av)
				  v.mul(0.99)
				  av:*1.02
				 EndIf
				Next				
				
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				a2.use(piletableau(0),1)
				For n=1 To 6 
				 a2.use(piletableau(n),5+n)
				Next
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,15,20)
				a3.use(piletableau(0),1)
				For n=1 To 6 
				 a3.use(piletableau(n),5,n)
				Next				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,13,15)
				a4.use(piletableau(0),1)
			    For n=1 To 6 
				 a4.use(piletableau(n),5)
				Next
				setanimationpreparative()
				shufflecards()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf autoplaymovetableau(0,False,False)
				 tippexecutemove();Return(True);
				EndIf
				Return(False);
				EndMethod	
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,False,False)
				  autoplayanimationpiletopile();Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()				
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
				 
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf	
	
				 If solitaire.autoturncard
				  If tipptableauturn() 
				   For Local card:_card=EachIn foundlist
				    card.turn(solitaire.clock,15,True)
				   Next
				   Return(True);
				  EndIf
				 EndIf
	
				 If solitaire.autoempty
				  If tipptableauemptypile() 
				   autoplayanimationpiletopile(True,True)
				   Return(True);
				  EndIf
				 EndIf
	
				EndIf
				Return(False);	
				EndMethod		
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod			
					
	EndType
'******************************************************************************************************************
'										G A M E R U S S I A N 
'******************************************************************************************************************
Type _gamerussian Extends _gameyukon
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,RUSSIAN)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby-0.5)
				Local px#
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableautakesamesuit(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-3,-30)				
				cameraposition[1].set(-3,0,-30)				
				cameraposition[2].set(-3,0,-30)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(0,0,-65)
				camerapositionpreview[2].set(0,-3,-70)
				rectangle[0].set(-11,-7)
				rectangle[1].set(+tabx*3,7)
				enlargerectangle()
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n				
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-12,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-4,-10,0,40,5,True)
				shufflecards()
				Local ar:_animationrotation
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,1)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,2)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,9)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,17)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,26)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,36)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,47)
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				a2.use(piletableau(0),1)
				For n=1 To 6 
				 a2.use(piletableau(n),5+n)
				Next
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				a3.use(piletableau(0),1)
				For n=1 To 6 
				 a3.use(piletableau(n),5,n)
				Next				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,33,50)
				a4.use(piletableau(0),1)
				For n=1 To 6 
				 a4.use(piletableau(n),5)
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType	
'******************************************************************************************************************
'										G A M E R U S S I A N E A S Y
'******************************************************************************************************************
Type _gamerussianeasy Extends _gameyukon
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,RUSSIANEASY)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(8,-11-tabx,7-taby)
				Local px#
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				tableautakesamesuit(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(2,0)
				createcards(1,1)
				'createcards(1,2)
			    createcards(1,3)
				cameraposition[0].set(-6,-3,-31)				
				cameraposition[1].set(-4,-1,-31)				
				cameraposition[2].set(-4,-1,-31)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(0,0,-65)
				camerapositionpreview[2].set(0,-3,-70)
				rectangle[0].set(-11-tabx,-7)
				rectangle[1].set(+tabx*3,7)
				enlargerectangle()
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n				
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-12,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-4,-10,0,40,5,True)
				shufflecards()
				Local ar:_animationrotation
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,1)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,2)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,9)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,17)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,26)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,36)
				ar=New _animationrotation
				ar.init(Self,0,0,0,180,2,16,5,47)
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				a2.use(piletableau(1),1)
				For n=1 To 6
				 a2.use(piletableau(1+n),5+n)
				Next
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				a3.use(piletableau(1),1)
				For n=1 To 6 
				 a3.use(piletableau(1+n),5,n)
				Next				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,33,50)
				a4.use(piletableau(1),1)
				For n=1 To 6
				 a4.use(piletableau(1+n),5)
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType		
'******************************************************************************************************************
'										G A M E R U S S I A N F R E E 
'******************************************************************************************************************
Type _gamerussianfree Extends _gameyukon
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,RUSSIANFREE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(7,-11,7-taby)
				Local px#
				px=0
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				px=-11-tabx
				Local pf:_pilefreecell
				pf=createpilefreecell(px+tabx*0,7)
				pf.suit=0
				pf=createpilefreecell(px+tabx*1,7)
				pf.suit=1
				pf=createpilefreecell(px+tabx*2,7)
				pf.suit=2
				pf=createpilefreecell(px+tabx*3,7)
				pf.suit=3
				tableautakesamesuit(True);
				tableautakedescending(True);
				tableautakeemptynumber(12);'king
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-6,-3,-31)				
				cameraposition[1].set(-4,-1,-31)				
				cameraposition[2].set(-4,-1,-31)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(0,0,-65)
				camerapositionpreview[2].set(0,-3,-70)
				rectangle[0].set(-11-tabx,-7)
				rectangle[1].set(+tabx*3,7)
				enlargerectangle()
				pilesort()	
				
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n				
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-12,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-4,-10,0,40,5,True)
				shufflecards()
				Local ar:_animationrotation
				ar=New _animationrotation
				ar.init(Self,-5,0,0,180,20,66,1)
				ar=New _animationrotation
				ar.init(Self,-5,0,0,180,20,66,5,2)
				ar=New _animationrotation
				ar.init(Self,-5,0,0,180,20,66,5,9)
				ar=New _animationrotation
				ar.init(Self,-5,0,0,180,20,66,5,17)
				ar=New _animationrotation
				ar.init(Self,-5,0,0,180,20,66,5,26)
				ar=New _animationrotation
				ar.init(Self,-5,0,0,180,20,66,5,36)
				ar=New _animationrotation
				ar.init(Self,-5,0,0,180,20,66,5,47)
				Local a2:_animationcardtopile=New _animationcardtopile
				a2.init(Self,40,40)
				a2.use(piletableau(0),1)
				For n=1 To 6
				 a2.use(piletableau(0+n),5+n)
				Next
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				a3.use(piletableau(0),1)
				For n=1 To 6 
				 a3.use(piletableau(0+n),5,n)
				Next				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,33,50)
				a4.use(piletableau(0),1)
				For n=1 To 6
				 a4.use(piletableau(0+n),5)
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplayfreecell(card)
				 autoplayanimationpiletopile(True,True);Return(True);				
				EndIf
				Return(False);
				EndMethod			
				
	EndType	
'******************************************************************************************************************
'										G A M E L A B Y R I N T H 
'******************************************************************************************************************
Type _gamelabyrinth Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,LABYRINTH)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=-4
				Local oy#=11
				'vorher : cameraposition.set(0,-4,-39)
				Local pl:_pilelabyrinth=createpilelabyrinth(ox-4,oy+5,8,6)
				pl.fillfirst=True
				Local ps:_pilestock=createpilestock(ox-5-tabx,oy+5,0,0,0,True)
				ps.redealvalue=0				
				createpilefoundation(ox-5-tabx,oy+5-1*taby)
				createpilefoundation(ox-5-tabx,oy+5-2*taby)
				createpilefoundation(ox-5-tabx,oy+5-3*taby)
				createpilefoundation(ox-5-tabx,oy+5-4*taby)
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-1,-47)								
				cameraposition[1].set(0,0,-43)				
				cameraposition[2].set(0,taby,-43)				
				camerapositionmenu[2].set(1.5,8,-60)
				camerapositionpreview[1].set(0,0,-110)
				camerapositionpreview[2].set(0,-4.5,-97)
				rectangle[0].set(ox-5-tabx,oy+5-taby*5)
				rectangle[1].set(ox-4+tabx*7,oy+5)
				enlargerectangle()
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,60,8)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-10+tabx*2,-10,0,60,8,True)
				Local af:_animationcardtofoundation=New _animationcardtofoundation
				af.init(Self,40,40)
				Local in=0
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 af.use(fit,card(in*13))
				 in:+1
				Next	
				shufflecards()			
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),4*12,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),20,10,True)
				a3.uselabyrinth(pilelabyrinth(0))
				setanimationpreparative()
				update()
				EndMethod
	Method tipplabyrinth:Int()				
				Local found=False
				foundlist.clear()
				foundsour=Null
				founddest=Null
				Local pl:_pilelabyrinth
				Local lpl:TLink=pilelabyrinthlist.firstlink()
				If lpl
				 pl=_pilelabyrinth(lpl.value())
				 For Local pit:_pilefoundation=EachIn pilefoundationlist
				  If found=False
			       Local startsourcardx=sourcardx
				   Local startsourcardy=sourcardy
				   Repeat
				    If pl.feld[sourcardx,sourcardy]
				     Local c:_card=pl.feld[sourcardx,sourcardy]
					 If c.canpick()
				      foundlist.clear()
				  	  foundlist.addlast(c)
				  	  If pit.candrop(foundlist)
				       foundsour=pl
					   founddest=pit
					   found=True
					  EndIf
					 EndIf
					EndIf
					sourcardx:+1
				    If sourcardx>=pl.dimx
					 sourcardx=0
					 sourcardy:+1
					 If sourcardy>=pl.dimy sourcardy=0
				    EndIf
				   Until (startsourcardx=sourcardx And startsourcardy=sourcardy) Or found
				  EndIf				 
				 Next
				EndIf
				Return(found)				
				EndMethod
	Method tipp()
				startusing()
				If tipplabyrinth()
				 tippexecutemove();Return(True);	
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tipplabyrinth()
				  autoplayanimationpiletopile(True,True,-20,0,-10,False);Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
				 
	  			 If solitaire.autofoundation
	  			  If tipplabyrinth()
				   autoplayanimationpiletopile(True,True,-20,0,-10,False)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				EndIf
				Return(False);
				EndMethod		
	Method clickplayfoundationlabyrinth:Int(c:_card)
				founddest=Null
				foundsour=c.pile
				foundlist.clear()
				foundlist.addlast(c)
				'If c.pilelink.prevlink()<>Null Return(False)
				For Local destpile:_pilefoundation=EachIn pilefoundationlist
				 If founddest=Null
				  If destpile.candrop(foundlist) founddest=destpile
				 EndIf
				Next
				If founddest Return(True)				 
				Return(False)
				EndMethod							
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundationlabyrinth(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				EndIf
				Return(False);
				EndMethod	
	Field sourcardx=0						
	Field sourcardy=0						
	EndType	

'******************************************************************************************************************
'										G A M E L A B Y R I N T H E A S I E R
'******************************************************************************************************************
Type _gamelabyrintheasier Extends _gamelabyrinth
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,LABYRINTHEASIER)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=-4
				Local oy#=11
				'vorher : cameraposition.set(0,-4,-39)
				Local pl:_pilelabyrinth=createpilelabyrinth(ox-4,oy+5,8,6)
				pl.fillfirst=False
				Local ps:_pilestock=createpilestock(ox-5-tabx,oy+5,0,0,0,True)
				createpilefoundation(ox-5-tabx,oy+5-1*taby)
				createpilefoundation(ox-5-tabx,oy+5-2*taby)
				createpilefoundation(ox-5-tabx,oy+5-3*taby)
				createpilefoundation(ox-5-tabx,oy+5-4*taby)
				ps.redealvalue=0				
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-1,-47)				
				cameraposition[1].set(0,0,-43)				
				cameraposition[2].set(0,taby,-43)		
				camerapositionmenu[2].set(1.5,8,-60)		
				camerapositionpreview[1].set(0,0,-110)
				camerapositionpreview[2].set(0,-4.5,-97)
				rectangle[0].set(ox-5-tabx,oy+5-taby*5)
				rectangle[1].set(ox-4+tabx*7,oy+5)
				enlargerectangle()
				EndMethod
	EndType		
'******************************************************************************************************************
'										G A M E L A B Y R I N T H R O D E N B A C H
'******************************************************************************************************************
Type _gamelabyrinthrodenbach Extends _gamelabyrinth
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,LABYRINTHRODENBACH)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=-4
				Local oy#=11
				'vorher : cameraposition.set(0,-4,-39)
				Local pl:_pilelabyrinth=createpilelabyrinth(ox-4,oy+5,8,6)
				pl.fillfirst=False
				pl.bothdirection=True
				Local ps:_pilestock=createpilestock(ox-5-tabx,oy+5,0,0,0,True)
				createpilefoundation(ox-5-tabx,oy+5-1*taby)
				createpilefoundation(ox-5-tabx,oy+5-2*taby)
				createpilefoundation(ox-5-tabx,oy+5-3*taby)
				createpilefoundation(ox-5-tabx,oy+5-4*taby)
				ps.redealvalue=0				
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-1,-47)				
				cameraposition[1].set(0,0,-43)				
				cameraposition[2].set(0,taby,-43)			
				camerapositionmenu[2].set(1.5,8,-60)	
				camerapositionpreview[1].set(0,0,-110)
				camerapositionpreview[2].set(0,-4.5,-97)
				rectangle[0].set(ox-5-tabx,oy+5-taby*5)
				rectangle[1].set(ox-4+tabx*7,oy+5)
				enlargerectangle()
				EndMethod
	EndType				
'******************************************************************************************************************
'										G A M E L A B Y R I N T H D O U B L E
'******************************************************************************************************************
Type _gamelabyrinthdouble Extends _gamelabyrinth
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,LABYRINTHDOUBLE)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=-4-3*tabx
				Local oy#=11
				'vorher : cameraposition.set(0,-4,-59)
				Local pl:_pilelabyrinth=createpilelabyrinth(ox-4,oy+5,16,6)
				pl.fillfirst=False
				Local ps:_pilestock=createpilestock(ox-5-tabx,oy+5,0,0,0,True)
				createpilefoundation(ox-5-tabx,oy+5-1*taby)
				createpilefoundation(ox-5-tabx,oy+5-2*taby)
				createpilefoundation(ox-5-tabx,oy+5-3*taby)
				createpilefoundation(ox-5-tabx,oy+5-4*taby)
				createpilefoundation(ox-5-2*tabx,oy+5-1*taby)
				createpilefoundation(ox-5-2*tabx,oy+5-2*taby)
				createpilefoundation(ox-5-2*tabx,oy+5-3*taby)
				createpilefoundation(ox-5-2*tabx,oy+5-4*taby)
				ps.redealvalue=0				
				foundationascending(True);				
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(-4,0,-60)				
				cameraposition[1].set(3,0,-60)				
				cameraposition[2].set(3,2,-60)				
				camerapositionmenu[2].set(3,12,-95)
				camerapositionpreview[2].set(0,-5,-135)				
				rectangle[0].set(ox-5-tabx*2  +tabx*0.5  ,oy+5-taby*5)
				rectangle[1].set(ox-4+tabx*15 -taby*0.5  ,oy+5)
				enlargerectangle()
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,60,8)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-10+tabx*2,-10,0,60,8,True)
				Local af:_animationcardtofoundation=New _animationcardtofoundation
				af.init(Self,40,40)
				Local in=0
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 af.use(fit,card(in*13))
				 in:+1
				Next	
				shufflecards()			
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),8*12,50,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),20,10,True)
				a3.uselabyrinth(pilelabyrinth(0))
				setanimationpreparative()
				update()
				EndMethod				
	EndType	
'******************************************************************************************************************
'										G A M E S W E E T M A T C H 
'******************************************************************************************************************
Type _gamesweetmatch Extends _gameklondikeone'_gamelabyrinth
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,SWEETMATCH)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=-4-tabx
				Local oy#=11
				cameraposition[0].set(0,2,-41)		
				cameraposition[1].set(0,2,-41)	
					
				Local ps:_pilesweetmatch=createpilesweetmatch(ox-4,oy+5+7*taby,10,13)
				'------------------- set invisible fields -------------------------
				For Local y=0 To 5
				 For Local x=0 To 9
				  ps.status[x,y]=1
				 Next
				Next
				'------------------ set blocked fields ----------------------------
		        'ps.status[0,7]=2
		        'ps.status[1,8]=2
		        'ps.status[2,9]=2
		        'ps.status[3,10]=2
		        'ps.status[4,11]=2
		        'ps.status[7,9]=2
		 		For Local x=4 To 5
		 		 For Local y=9 To 12
				  ps.status[x,y]=2
				 Next
				Next
				'------------------ set blased fields ----------------------------
		        ps.status[3,9]=3
		        ps.status[3,10]=3
		        ps.status[3,11]=3
		        ps.status[3,12]=3
		        ps.status[6,9]=3
		        ps.status[6,10]=3
		        ps.status[6,11]=3
		        ps.status[6,12]=3
		        '------------------------------------------------------------------
				createpilediscard(ox+4+tabx*2,oy-3*taby)
				For Local i=0 To 11
				 createcard(0,0)
				 createcard(1,0)
				 createcard(0,9)
				 createcard(2,12)
				 createcard(3,11)
				Next
				ps.updateblase()
				rectangle[0].set(-11,-6)
				rectangle[1].set(+tabx*3,7)
				enlargerectangle()

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,46,8)
				Local a00:_animationmove=New _animationmove
				a00.init(Self,-6,-12,0,46,8)
				For Local i=1 To 3
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,3),-10+i*taby*2.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next
				
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,0,0,0,180,3,8)				
				shufflecards()			
				Local a3:_animationcardtopile=New _animationcardtopile
				a3.init(Self,20,10)
				a3.usesweetmatch(pilesweetmatch(0),True,True)
				update()
				EndMethod				
	Method tippsweetmatch:Int()
				Local ps:_pilesweetmatch=pilesweetmatch(0)
				Local found=False
				Local c:_card
				Local cn:_card
				Local nx,ny
				Local startsourn=sourn
				Local startsourx=sourx
				Local startsoury=soury
				foundsour=ps
				founddest=ps
				foundlist.clear()
				founddestposition.clear()
				founddestcard.clear()
				Repeat
				 If sourn=0 
				  nx=sourx+1
				  ny=soury
				 ElseIf sourn=1
				  nx=sourx
				  ny=soury+1
				 ElseIf sourn=2
				  nx=sourx-1
				  ny=soury
				 ElseIf sourn=3
				  nx=sourx
				  ny=soury-1
				 EndIf
				 c=ps.feld[sourx,soury]
				 cn=Null
				 If nx>=0 And nx<ps.dimx And ny>=0 And ny<ps.dimy cn=ps.feld[nx,ny]
				 If c And cn
				  If ps.swapbuildsrow(c,cn)
				   Local v:_vector3=ps.droppositionat(nx,ny)
				   'Print "--------nx="+nx
				   'Print "--------ny="+ny
				   'Print "--------vx="+v.x
				   'Print "--------vy="+v.y
				   foundlist.addlast(c)
				   founddestposition.addlast(v)
				   founddestcard.addlast(cn)
				   found=True
				  EndIf 
				 EndIf
				 sourn:+1
				 If sourn>3 
				  sourn=0
				  sourx:+1
				  If sourx>ps.dimx-1 
				   sourx=0
				   soury:+1
				   If soury>ps.dimy-1 soury=0
				  EndIf
				 EndIf
				 'Print "sn="+sourn
				 'Print "sx="+sourx
				 'Print "sy="+soury
				Until found Or (startsourn=sourn And startsourx=sourx And startsoury=soury)
				Return(found)
				EndMethod				
	Method tippexecutesweetmatch()				
				Local v:_vector3=_vector3(founddestposition.firstlink().value())
				'Print "--------vx="+v.x
				'Print "--------vy="+v.y
				For Local card:_card=EachIn foundlist
				 Local cn:_card=New _card
				 cn.copy(card)
				 Local vn:_vector3=New _vector3
				 Local t0:_vector3=New _vector3
				 Local t1:_vector3=New _vector3
				 t0.set(0,0,-20)
				 t1.set(0,0,+20)
				 cn.tipplink=tipplist.addlast(cn)
				 cn.curveposition.setvector(cn.position,v,t0,t1)
				 cn.curvevx.setvector(cn.vx,founddest.dropvx(),vn,vn)
				 cn.curvevy.setvector(cn.vy,founddest.dropvy(),vn,vn)
				 cn.curvespeed=40
				 cn.startcurve(solitaire.clock)
				 cn.cardcontrolopacity=card
				 cn.curveopacity.set(0,0,2,-10)
				Next
				EndMethod					
	Method tipp()
				startusing()
				If tippsweetmatch()
				 tippexecutesweetmatch();Return(True);	
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippsweetmatch()
				  Local ps:_pilesweetmatch=pilesweetmatch(0)
				  Local c:_card=_card(foundlist.firstlink().value())
				  Local cn:_card=_card(founddestcard.firstlink().value())
				  ps.swap(c,cn,False)
				  Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
				EndIf
				Return(False);
				EndMethod	
	Method clickplaysweetmatch:Int(c:_card)
				Local ps:_pilesweetmatch=pilesweetmatch(0)
				Local found=False
				Local cn:_card
				Local nx,ny
				Local x=c.sweetindex[0]
				Local y=c.sweetindex[1]
				Local n=0
				foundsour=ps
				founddest=ps
				foundlist.clear()
				founddestposition.clear()
				founddestcard.clear()
				Repeat
				 If n=0 
				  nx=x+1
				  ny=y
				 ElseIf n=1
				  nx=x
				  ny=y+1
				 ElseIf n=2
				  nx=x-1
				  ny=y
				 ElseIf n=3
				  nx=x
				  ny=y-1
				 EndIf
				 c=ps.feld[x,y]
				 cn=Null
				 If nx>0 And nx<ps.dimx And ny>0 And ny<ps.dimy cn=ps.feld[nx,ny]
				 If c And cn
				  If ps.swapbuildsrow(c,cn)
				   Local v:_vector3=ps.droppositionat(nx,ny)
				   foundlist.addlast(c)
				   founddestposition.addlast(v)
				   founddestcard.addlast(cn)
				   found=True
				  EndIf 
				 EndIf
				 n:+1
				Until found Or n=4
				Return(found)
				EndMethod							
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplaysweetmatch(card)
				 Local ps:_pilesweetmatch=pilesweetmatch(0)
				 Local c:_card=_card(foundlist.firstlink().value())
				 Local cn:_card=_card(founddestcard.firstlink().value())
				 ps.swap(c,cn,False)
				 Return(True);
				EndIf
				Return(False);
				EndMethod
	Field sourx=0
	Field soury=0		
	Field sourn=0		
	EndType		

'******************************************************************************************************************
'										G A M E K I N G S P E A K	
'******************************************************************************************************************
Type _gamekingspeak Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,KINGSPEAK)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=0
				Local oy#=-taby

				createpiletableau(1,ox-tabx,oy-1*taby)
				createpiletableau(1,ox-tabx,oy+0*taby)
				createpiletableau(1,ox-tabx,oy+1*taby)
				createpiletableau(1,ox-tabx,oy+2*taby)
				For Local i=0 To 3 
				 Local p:_piletableau=piletableau(i)
				 p.vector.set(-1,0,0)
				 p.takedescending=True
				 p.takesamesuit=True
				 p.takeemptynumber=5
				 p.takeemptysuit=i
				 p.giverestriction=True
				 p.discardcount=True
				Next
				createpiletableau(1,ox+tabx*1,oy-1*taby)
				createpiletableau(1,ox+tabx*1,oy+0*taby)
				createpiletableau(1,ox+tabx*1,oy+1*taby)
				createpiletableau(1,ox+tabx*1,oy+2*taby)
				For Local i=4 To 7
				 Local p:_piletableau=piletableau(i)
				 p.vector.set(1,0,0)
				 p.takeascending=True
				 p.takesamesuit=True
				 p.takeemptynumber=6
				 p.takeemptysuit=i-4
				 p.giverestriction=True
				 p.discardcount=True
				Next
				
				Local px#=-11
				Local ps:_pilestock=createpilestock(ox-tabx/2,oy+3*taby,0,1)
				createpilewaste(ox+tabx-tabx/2,oy+3*taby)
				px=-tabx
				createpiletableau(1,ox,oy-1*taby)
				createpiletableau(1,ox,oy+0*taby)
				createpiletableau(1,ox,oy+1*taby)
				createpiletableau(1,ox,oy+2*taby)
				For Local i=8 To 11
				 Local p:_piletableau=piletableau(i)
				 p.takeemptynumber=12
				 p.takeemptysuit=i-8
				 p.takemaximal=1
				 p.discardcount=True
				 p.giverestriction=True
				 p.showdescription=False
				Next
				ps.redealvalue=2			
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-1,-39)
				cameraposition[1].set(0,0,-37)
				cameraposition[2].set(0,0,-37)
				camerapositionmenu[1].set(0,6,-50)
				camerapositionmenu[2].set(0,6,-50)
				camerapositionpreview[1].set(0,0,-80)
				camerapositionpreview[2].set(0,-2.3,-77)
				rectangle[0].set(-11,oy-1*taby)
				rectangle[1].set(+11,oy+3*taby)
				enlargerectangle()
				
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,60,8)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-10+tabx*2,-10,0,60,8,True)
				Local af:_animationcardtopile=New _animationcardtopile
				af.init(Self,40,40)
				For Local i=0 To 3 
				 af.use(piletableau(8+i),1,False,True,card(12+i*13))
				Next				
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),4*13,60,10)
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippwaste()
				  autoplayanimationpiletopile(False,False,20,0,-10);Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippwaste()
				   autoplayanimationpiletopile(True,True,20,0,-10)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplaywaste(card)
				 autoplayanimationpiletopile(False,False,20,0,-10);Return(True);
				EndIf
				Return(False);
				EndMethod				
	EndType
'******************************************************************************************************************
'										G A M E A C E S U P 
'******************************************************************************************************************
Type _gameacesup Extends _game
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,ACESUP)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpileacesup(-11+3*tabx,7-taby)
				createpileacesup(-11+4*tabx,7-taby)
				createpileacesup(-11+5*tabx,7-taby)
				createpileacesup(-11+6*tabx,7-taby)
				'createpiletableau(4,-11+3*tabx,7-taby)
				createpilestock(16,-12,1,0)
				Local pd:_pilediscard=createpilediscard(12,-12)
				pd.acesupmode=True
				'For Local i=0 To 3 
				' piletableau(i).givemaximal=1
				' piletableau(i).takerestriction=True
				'Next
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-8,-39)
				cameraposition[1].set(5,-5,-36)
				cameraposition[2].set(5,-5,-32)
				camerapositionmenu[2].set(7,1,-50)
				camerapositionpreview[1].set(0,0,-50)
				camerapositionpreview[2].set(0,-1.5,-65)
				rectangle[0].set(-11+3*tabx,-12)
				rectangle[1].set(16,7-taby)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,0,0,0,30,15)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,30,15,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),104,60,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),40,100)
				For n=0 To 3
				 a3.use(piletableau(n),1)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 3 
				 as.use(piletableau(n),1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For Local n=0 To 3 
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tippacesup:Int()
				foundlist.clear()
				foundsour=Null
				founddest=Null
				Local found=False
				Local startpile=sourpile
				Repeat
				 Local pit:_pileacesup=_pileacesup(piletableau(sourpile))
				 If pit.cardlist.count()>0
				  foundlist.clear()
				  foundlist.addlast(_card(pit.cardlist.firstlink().value()))
				  If pilediscardlist.firstlink()
				   Local pd:_pilediscard=getpilediscardminimum()
				   If pd.candrop(foundlist)
				    found=True
				    foundsour=pit
				    founddest=pd
				   EndIf
				  EndIf
				 EndIf
				 sourpile:+1
				 If sourpile>=tableau.pilelist.count() sourpile=0
				Until found Or startpile=sourpile
				Return(found)
				EndMethod				
	Method tipp()
				startusing()
				If tipptableaucompleterow()
				 tippexecutecompleterow();Return(True);
				ElseIf tippacesup()
				 tippexecutemove();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tipptableau(0)
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod	
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tipptableaucompleterow()
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tippacesup()
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If tippacesup() And solitaire.autodiscard
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauemptypile() And solitaire.autoempty
				  autoplayanimationpiletopile(True,True);Return(True);
				 EndIf
				EndIf
			    Return(False);
				EndMethod	
	Method clickplayacesup:Int(c:_card)
				If pilediscardlist.firstlink()
				 founddest=Null
				 foundsour=c.pile
				 foundlist.clear()
				 foundlist.addlast(c)
				 If c.pilelink.prevlink()<>Null Return(False)
				 Local pd:_pilediscard=getpilediscardminimum()
				 If pd.candrop(foundlist) founddest=pd
				 If founddest Return(True)				 
				EndIf
				Return(False)
				EndMethod	
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayacesup(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				EndIf
				Return(False);
				EndMethod
	Field sourpile:Int=0				
	EndType	
'******************************************************************************************************************
'										G A M E A C E S U P E A S Y
'******************************************************************************************************************
Type _gameacesupeasy Extends _gameacesup
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,ACESUPEASY)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpileacesup(-11+3*tabx,7-taby)
				createpileacesup(-11+4*tabx,7-taby)
				createpileacesup(-11+5*tabx,7-taby)
				createpileacesup(-11+6*tabx,7-taby)
				createpilefreecell(-11+7.5*tabx,7-taby)
				createpilestock(16,-12,1,0)
				Local pd:_pilediscard=createpilediscard(12,-12)
				pd.acesupmode=True
				'For Local i=0 To 3 
				' piletableau(i).givemaximal=1
				' piletableau(i).takerestriction=True
				'Next
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-8,-39)
				cameraposition[1].set(5,-5,-36)
				cameraposition[2].set(5,-5,-32)
				camerapositionmenu[2].set(7,1,-50)
				camerapositionpreview[1].set(0,0,-50)
				camerapositionpreview[2].set(0,-1.5,-65)
				rectangle[0].set(-11+3*tabx,-12)
				rectangle[1].set(16,7-taby)
				enlargerectangle()
				pilesort()	
				EndMethod	
	EndType				
	
'******************************************************************************************************************
'										G A M E O S M O S I S
'******************************************************************************************************************
Type _gameosmosis Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,OSMOSIS)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(4,-10,7,0,-taby)
				Local px#
				createpilestock(8+1.5*tabx,7-taby*1,0,3)
				createpilewaste(8+2.5*tabx,7-taby*2)
				pilestock(0).verticalredeal=True
				px=0
				Local pf:_pilefoundation
				pf=createpilefoundation(px-tabx*1.5,7-taby*0)
				pf.drawownshadow=False;
				pf=createpilefoundation(px-tabx*1.5,7-taby*1)
				pf.drawownshadow=False;
				pf=createpilefoundation(px-tabx*1.5,7-taby*2)
				pf.drawownshadow=False;
				pf=createpilefoundation(px-tabx*1.5,7-taby*3)
				pf.drawownshadow=False;
				
				For Local i=0 To 3 
				 piletableau(i).vector.set(1,0,0)
				 piletableau(i).takerestriction=True
				 pilefoundation(i).osmosismode=True
				 pilefoundation(i).giverestriction=True
				 pilefoundation(i).vector.set(1,0,0)
				Next
				
				'tableaugivealteratecolor(true);
				'tableaugivedescending(true);
				'tableautakealteratecolor(true);
				'tableautakedescending(true);
				'pileemptyking=True
				'piletakerestriction=True
				'foundationascending(true);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(0,-3.74,-34)				
				cameraposition[1].set(0,-2,-36)				
				cameraposition[2].set(1,-2,-36)				
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3,4,-52)
				camerapositionpreview[1].set(0,0,-80)				
				camerapositionpreview[2].set(0,-2,-70)				
				rectangle[0].set(-10,7-taby*3)
				rectangle[1].set(8+2.5*tabx,7)
				enlargerectangle()

				EndMethod
	Method init(s:_solitaire,mo=0)				
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,40,5)
				
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-10+tabx,-3,0,40,5,True)
				shufflecards()
				
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),4*13-1,50,10)
				
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),50,100)
				For Local n=0 To 3
				 a3.use(piletableau(n),4)
				Next
				
				Local af:_animationcardtofoundation=New _animationcardtofoundation
				af.init(Self,40,40)
				af.use(pilefoundation(0),card(0))
				
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For Local n=0 To 3
				 as.use(piletableau(n),4)
				Next
				
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For Local n=0 To 3
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove()	;Return(True);
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tipptableau(0,False,False)
				 tippexecutemove();Return(True);
				ElseIf tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplayanimationpiletopile:_animationpiletopile(udx=False,udy=False,vx#=-20,vy#=0,vz#=-10,undoconstantsort=True)
				Local a:_animationpiletopile=New _animationpiletopile
				'in foundlist kann nur eine Karte sein
				a.init(Self,foundlist,founddest,solitaire.autospeed,0.1,True,udx,udy)
				a.undoconstantsort=undoconstantsort
				a.vector.set(vx,vy,vz)
				a.vectortarget.set(40,-40,0)
				a.skipable=False
				'----------------------- determine destindex for osmosismode sorted cards -------------------
				Local destindex=0
				Local pf:_pilefoundation=_pilefoundation(founddest)
				If pf
				 Local c:_card=_card(foundlist.firstlink().value())
				 Local it:TLink=pf.cardlist.firstlink()
				 If it And c
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
				EndIf
				'--------------------------------------------------------------------------------------				
				a.insertindex=destindex
				Return(a)
				EndMethod				
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,False,False)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
				 
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
	
				 If solitaire.autoturncard
				  If tipptableauturn() 
				   For Local card:_card=EachIn foundlist
				    card.turn(solitaire.clock,15,True)
				   Next
				   Return(True);
				  EndIf
				 EndIf
				
				 If solitaire.autoempty
				  If tipptableauemptypile() 
				   autoplayanimationpiletopile(True,True)
				   Return(True);
				  EndIf
				 EndIf
				
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False)
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaywaste(card)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod
				
	EndType	
'******************************************************************************************************************
'										G A M E V E R Y E A S Y 
'******************************************************************************************************************
Type _gameveryeasy Extends _gameklondikeone
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,VERYEASY)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(1,-11,2)
				Local px#=-11
				createpilestock(px,7,0,1)
				createpilewaste(px+tabx,7)
				px=0
				createpilefoundation(px+tabx*0,7)
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				tableautakealteratecolor(True);
				tableautakedescending(True);
				foundationascending(True);				
				createcard(0,0)
				cameraposition[0].set(-3,-2,-30)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-3,0,-30)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				rectangle[0].set(-11,-6)
				rectangle[1].set(+tabx*3,7)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next				
				'shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),1,50,10)
				setanimationpreparative()
				update()
				EndMethod
	EndType
'******************************************************************************************************************
'										G A M E A N T 
'******************************************************************************************************************
Type _gameant Extends _game
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,ANT)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(10,-11+tabx*0.5,1)
				Local ps:_pilestock=createpilestock(-11-tabx,7,0,1)
				createpilewaste(-11-tabx,7-taby)
				For Local pdx#=0 To 7
				 createpilediscard(-11+tabx*pdx,7)
				Next
				'createpilefreecell(-11-tabx,6-taby*2)				
				'createpilefreecell(-11-tabx,6-taby*3)
				tableaugivedescending(True);
				'tableaugivesamesuit(True)
				tableautakedescending(True);
				ps.redealvalue=0
				createcards(2,0)
				createcards(2,1)
				createcards(2,2)
				createcards(2,3)
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(1.6,0,-39)
				cameraposition[2].set(1.6,0,-39)
				camerapositionmenu[2].set(3,5,-60)

				camerapositionpreview[1].set(0,-5,-75)
				camerapositionpreview[2].set(0,-8,-86)
				rectangle[0].set(-11-tabx,-6)
				rectangle[1].set(-11+tabx*0.5+tabx*9,7)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,2,0,50,9)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,50,9,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),104,60,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),90,10)
				a3.soundsingle=True
				For Local n=0 To 9
				 a3.use(piletableau(n),1)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				For Local n=0 To 9
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tipptableaucompleterow()
				 tippexecutecompleterow();Return(True);
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tipptableau(True)
				 tippexecutemove();Return(True);
				ElseIf tipptableau(0)
				 tippexecutemove();Return(True);
				ElseIf tippwaste()
				 tippexecutemove();Return(True);
				ElseIf tippstock()
				 tippexecutestock();Return(True);
				EndIf
				Return(False);
				EndMethod	
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tipptableaucompleterow()
	 			  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
 				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,True)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippwaste()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippstock()
				  _pilestock(foundsour).deal(solitaire.clock);Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If tipptableaucompleterow() And solitaire.autodiscard
				  autoplayanimationpiletopile(True,True);Return(True);
	 			 ElseIf tipptableauturn() And solitaire.autoturncard
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,15,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile() And solitaire.autoempty
				  autoplayanimationpiletopile(True,True);Return(True);
				 EndIf
				EndIf
			    Return(False);
				EndMethod						
				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				 Print "c"
				
				If clickplaycompleterow(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				'ElseIf clickplaytableauemptypile(card)
				ElseIf clickplaytableaumove(card,True)
			 	 autoplayanimationpiletopile();Return(True);
				 Print "ctmf"
				ElseIf clickplaytableaumove(card)
				 Print "ctm"
				 autoplayanimationpiletopile();Return(True);
				ElseIf clickplaywaste(card)
				 Print "cw"
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod		
	EndType
	
'******************************************************************************************************************
'										G A M E B A K E R S D O Z E N 
'******************************************************************************************************************
Type _gamebakersdozen Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,BAKERSDOZEN)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local pt:_piletableau 
				
				For Local x#=0 To 5 
				 For Local y#=1 To 0 Step -1
				  If y=1 
				   createpiletableau(1,tabx*0.5-13+x*tabx,8-y*10)
				  Else 
				   pt=createpiletableau(1,-13+x*tabx,8-y*10)
				   pt.camerastretch=False
				   pt.maximumlength=7.5
				  EndIf
				 Next
				Next
				
				pt=createpiletableau(1,-13+tabx*6,8)
				pt.camerastretch=False
				pt.maximumlength=7.5
				'createpiletableau(6,-13,-6)
				Local px#
				px=10
				createpilefoundation(px,7)
				createpilefoundation(px,7-taby)
				createpilefoundation(px,7-taby*2)
				createpilefoundation(px,7-taby*3)
				For Local pit:_piletableau=EachIn tableau.pilelist
				 pit.givemaximal=1
				 pit.takeemptyrestriction=True
				Next
				tableautakedescending(True);
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-2,-30)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-3,0,-30)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(3-4,1+6,-50)
				camerapositionpreview[1].set(0,0,-70)
				camerapositionpreview[2].set(0,-3,-80)
				rectangle[0].set(-13,7-taby*3)
				rectangle[1].set(10,8)
				enlargerectangle()
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				Local piles[12]
				
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-3,1),-10+i*taby*1.7+Rnd(-1,1),0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next				
				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,4,-13,0,180,20,20)
				
				Local g=0
				For Local i=0 To 12
				 piles[i]=0
				Next
				Repeat
				 piles[Rand(0,11)]=1
				 g=0
				 For Local i=0 To 12
				  g:+piles[i]
				 Next
				Until g=4					


				Rem
				Local a32:_animationcardtopile=New _animationcardtopile
				a32.init(Self,50,100)
			
				g=12
				For Local i=0 To 3
				 'If piles[i] 
				  a32.use(pilefoundation(i),1,True,False,card(g))
				  g:+13
				 'EndIf
				Next
				EndRem			
				
				
				
				


				shufflecards()
				
				Local si[4]
				Local di[4]
				For Local i=0 To 3
				 si[i]=-1
				 di[i]=-1
				Next
				g=0
				Local m=0
				Local j=0
				For Local cit:_card=EachIn cardlist
				 If cit.number=12 
				  si[g]=m
				  g:+1
				 EndIf
				 m:+1
				Next
				
				g=0
				
				For Local i=0 To 3
				 If (si[i] Mod 4)>0
				  Repeat
				   g:+4
				  Until card(g).number<>12
				  di[i]=g
				 Else
				  di[i]=si[i]
				 EndIf
				Next
				
				For Local i=0 To 3
				 If si[i]<>di[i] swapcards(si[i],di[i])
			    Next
				
				Local a3:_animationcardtopile=New _animationcardtopile
				a3.init(Self,50,100)
				For n=0 To 12
				 a3.use(piletableau(n),4)
				Next				
				Rem
				Local cl:TList=CreateList()
				g=12
				For Local n=0 To 12
				 If piles[n]
				  cl.clear()
				  cl.addlast(card(g))
				  g:+13
				  Local app:_animationpiletopile=New _animationpiletopile
				  app.init(Self,cl,piletableau(n),50,100,False,False,False)
				 EndIf
				Next			
				EndRem
				
				Local as:_animationpileshiftout=New _animationpileshiftout
				as.init(Self,15,40)
				For n=0 To 12 
				 as.use(piletableau(n),4)
				Next
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,23,10)
				For n=0 To 12
				 a4.use(piletableau(n),4)
				Next
				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tipptableau(0,False,False)
				 tippexecutemove();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1,False,False)
				  autoplayanimationpiletopile();Return(True);
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				 If solitaire.autoturncard
				  If tipptableauturn() 
				   For Local card:_card=EachIn foundlist
				    card.turn(solitaire.clock,15,True)
				   Next
				   Return(True);
				  EndIf
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False)
				 autoplayanimationpiletopile();Return(True);
				EndIf
				Return(False);
				EndMethod
	EndType

'******************************************************************************************************************
'										G A M E M A R T H A
'******************************************************************************************************************
Type _gamemartha Extends _gamebakersdozen
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,MARTHA)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local y#=7-taby+0.5
				Local pt:_piletableau
				For Local x=0 To 7 
				 If x<>3 And x<>4
				  pt=createpiletableau(1,-tabx*4+x*tabx,y)
				  pt.vector.set(0,1,0)
				  pt.camerastretch=False
				  pt.maximumlength=7
				 EndIf
				Next
				
				y=7-taby*2-0.5
				For Local x=0 To 7 
				 If x<>3 And x<>4
				  pt=createpiletableau(1,-tabx*4+x*tabx,y)
				  pt.vector.set(0,-1,0)
				 EndIf
				Next
				Local px#
				px=0-tabx*0.5
				createpilefoundation(px,7)
				createpilefoundation(px,7-taby)
				createpilefoundation(px,7-taby*2)
				createpilefoundation(px,7-taby*3)
				For Local pit:_piletableau=EachIn tableau.pilelist
				 pit.takeemptymaximal=1
				Next
				tableautakedescending(True);
				tableautakealteratecolor(True);
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-3,-3,-30)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-3,0,-30)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(-2,3,-50)
				camerapositionpreview[1].set(4,0,-90)
				camerapositionpreview[2].set(0,-3,-75)
				rectangle[0].set(-tabx*4,7-taby*2-0.5-taby)
				rectangle[1].set(-tabx*4+7*tabx,7-taby+0.5+taby)
				enlargerectangle()
				pilesort()	

				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				For Local i=1 To 2
				 Local a01:_animationmove=New _animationmove
				 a01.init(Self,-10+tabx*2+Rnd(-8,-5),-10+i*taby*2.1,0,46,8,i Mod 2,(i+1) Mod 2,True)
				Next				
				Local af:_animationcardtofoundation=New _animationcardtofoundation
				af.init(Self,40,40)
				Local in=0
				For Local fit:_pilefoundation=EachIn pilefoundationlist
				 af.use(fit,card(in*13))
				 in:+1
				Next	
				shufflecards()
				Local ap2:_animationcardtopile=New _animationcardtopile
				ap2.init(Self,20,30)
				ap2.invers=True
				For n=0 To 11
				 ap2.use(piletableau(n),2,True,True)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,13,100)
				For n=0 To 11
				 a4.use(piletableau(n))
				Next
				Local ap22:_animationcardtopile=New _animationcardtopile
				ap22.init(Self,20,30)
				ap22.invers=True
				For n=0 To 11
				 ap22.use(piletableau(n),4,True,True)
				Next
				Local a24:_animationpileturn=New _animationpileturn
				a24.init(Self,13,100)
				For n=0 To 11
				 a24.use(piletableau(n))
				Next	
				setanimationpreparative()
				update()
				EndMethod
 	EndType
'******************************************************************************************************************
'										G A M E F L O W E R G A R D E N
'******************************************************************************************************************
Type _gameflowergarden Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,FLOWERGARDEN)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local px#
				px=0
				createpiletableau(6,-1.5-tabx*2,2)
				createpilefoundation(px+tabx*-3.7,2)
				createpilefoundation(px+tabx*-3.7,2-taby)
				createpilefoundation(px+tabx*3.7,2)
				createpilefoundation(px+tabx*3.7,2-taby)
				Local pr:_pilereserve=createpilereserve(0,10)
				pr.vector.set(0,-0.8,0)
				pr.flowermode=True
				pr.arcmode=True
				pr.radiusy=6
				pr.radiusx=10
				Rem
				createpiletableau(6,-2-tabx*1.8,0)
				Local px#=-11
				'createpilestock(px,7,0,1)
				'createpilewaste(px+tabx,7)
				px=-2
				createpilefoundation(px+tabx*0,7)
				createpilefoundation(px+tabx*1,7)
				createpilefoundation(px+tabx*2,7)
				createpilefoundation(px+tabx*3,7)
				Local pr:_pilereserve=createpilereserve(-11,7)
				pr.vector.set(0,-0.8,0)
				pr.flowermode=True
				'pr.tableaufill=True
				'tableautakesamesuit(true);
				EndRem
				tableautakedescending(True);
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				For Local pit:_piletableau=EachIn tableau.pilelist 
				 pit.givemaximal=1
				 'pit.takeemptyrestriction=True
				Next
				cameraposition[0].set(-2,2,-28)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-2,2,-33)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(0,1+6,-50)
				camerapositionpreview[1].set(4,0,-60)
				camerapositionpreview[2].set(0,-3,-70)
				rectangle[0].set(tabx*-3.7,-6)
				rectangle[1].set(tabx*3.7 ,10)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				shufflecards()
				Local ap:_animationcardtopile=New _animationcardtopile
				ap.init(Self,30,30)
				For Local prit:_pilereserve=EachIn pilereservelist
				 ap.use(prit,16,False,True)
				Next
				ap.cardinpreparationafteranimation=False


				Local ar:_animationrotation=New _animationrotation
				ar.init(Self,3,7,Rnd(-6,-3),180,20,18)

				Local ap2:_animationcardtopile=New _animationcardtopile
				ap2.init(Self,30,30)
				For n=0 To 5
				 ap2.use(piletableau(n),6)
				Next
				
				Local a3:_animationpileshiftout=New _animationpileshiftout
				a3.init(Self,20,40)
				For n=0 To 5
				 a3.use(piletableau(n),6)
				Next
				
				Local a4:_animationpileturnvertical=New _animationpileturnvertical
				a4.init(Self,33,50)
				For n=0 To 5
				 a4.use(piletableau(n),6)
				Next


				setanimationpreparative()
				update()
				EndMethod
	Method tipp()
				startusing()
				If tippfoundation(0)
				 tippexecutemove();Return(True);	
				ElseIf tipptableauturn()
				 tippexecuteturn();Return(True);
				ElseIf tipptableauemptypile()
				 tippexecutemove();Return(True);'tippexecuteemptypile()
				ElseIf tipptableau(0)
				 tippexecutemove();Return(True);
				ElseIf tippreserve(0)
				 tippexecutemove();Return(True);
				EndIf
				Return(False);
				EndMethod
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tippfoundation(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 ElseIf tipptableauturn()
				  For Local card:_card=EachIn foundlist
				   card.turn(solitaire.clock,solitaire.autospeed/2,True)
				  Next
				  Return(True);
				 ElseIf tipptableauemptypile()
				  autoplayanimationpiletopile();Return(True);
				 ElseIf autoplaymovetableau(1)
				  autoplayanimationpiletopile();Return(True);
				 ElseIf tippreserve(1)
				  autoplayanimationpiletopile(True,True);Return(True);
				 EndIf
				
				EndIf
				Return(False);
				EndMethod				
	Method automove()
	    		If cardcurving()=False And animationlist.firstlink()=Null And picklist.firstlink()=Null
	  			 If solitaire.autofoundation
	  			  If tippfoundation(2)
				   autoplayanimationpiletopile(True,True)
				   Return(True);
	 			  EndIf  
	 			 EndIf
				 If solitaire.autoturncard
				  If tipptableauturn() 
				   For Local card:_card=EachIn foundlist
				    card.turn(solitaire.clock,15,True)
				   Next
				   Return(True);
				  EndIf
				 EndIf
				 If solitaire.autoempty
				  If tipptableauemptypile() 
				   autoplayanimationpiletopile(True,True)
				   Return(True);
				  EndIf
				 EndIf
				EndIf
				Return(False);
				EndMethod				
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplayfoundation(card)
				 autoplayanimationpiletopile(True,True);Return(True);
				ElseIf card.turnedup()=False
				 card.turn(solitaire.clock,solitaire.autospeed/2,True);Return(True);
				ElseIf clickplaytableaumove(card,False,False)
				 autoplayanimationpiletopile(True,True);
				 Return(True);
				EndIf
				Return(False);
				EndMethod				
	EndType
'******************************************************************************************************************
'										G A M E S T O N E W A L L 
'******************************************************************************************************************
Type _gamestonewall Extends _gameflowergarden
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,STONEWALL)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local px#
				px=0
				createpiletableau(6,-1.5-tabx*2,2)
				createpilefoundation(px+tabx*-3.7,2)
				createpilefoundation(px+tabx*-3.7,2-taby)
				createpilefoundation(px+tabx*3.7,2)
				createpilefoundation(px+tabx*3.7,2-taby)
				Local pr:_pilereserve=createpilereserve(0,10)
				pr.vector.set(0,-0.8,0)
				pr.flowermode=True
				pr.arcmode=True
				pr.radiusy=6
				pr.radiusx=10
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-2,2,-28)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-2,2,-33)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(0,1+6,-50)
				camerapositionpreview[1].set(4,0,-60)
				camerapositionpreview[2].set(0,-4,-70)
				rectangle[0].set(tabx*-3.7,-6)
				rectangle[1].set(tabx*3.7 ,10)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				shufflecards()
				Local ap:_animationcardtopile=New _animationcardtopile
				ap.init(Self,30,30)
				For Local prit:_pilereserve=EachIn pilereservelist
				 ap.use(prit,16,False,True)
				Next
				ap.cardinpreparationafteranimation=False

				Local ap2:_animationcardtopile=New _animationcardtopile
				ap2.init(Self,30,30)
				For n=0 To 5
				 ap2.use(piletableau(n),2,True,True)
				Next
				
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,13,100)
				For n=0 To 5
				 a4.use(piletableau(n))
				Next

				Local ap22:_animationcardtopile=New _animationcardtopile
				ap22.init(Self,30,30)
				For n=0 To 5
				 ap22.use(piletableau(n),4,True,True)
				Next
				
				Local a24:_animationpileturn=New _animationpileturn
				a24.init(Self,13,100)
				For n=0 To 5
				 a24.use(piletableau(n))
				Next								

				Local ap222:_animationcardtopile=New _animationcardtopile
				ap222.init(Self,30,30)
				For n=0 To 5
				 ap222.use(piletableau(n),6,True,True)
				Next
				
				Local a224:_animationpileturn=New _animationpileturn
				a224.init(Self,13,100)
				For n=0 To 5
				 a224.use(piletableau(n))
				Next								
				setanimationpreparative()
				update()
				EndMethod
	EndType				
'******************************************************************************************************************
'										G A M E S T O N E W A L L E A S Y
'******************************************************************************************************************
Type _gamestonewalleasy Extends _gameflowergarden
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,STONEWALLEASY)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local px#
				px=0
				createpiletableau(6,-1.5-tabx*2,2)
				createpilefoundation(px+tabx*-3.7,2)
				createpilefoundation(px+tabx*-3.7,2-taby)
				createpilefoundation(px+tabx*3.7,2)
				createpilefoundation(px+tabx*3.7,2-taby)
				Local pr:_pilereserve=createpilereserve(0,10)
				pr.vector.set(0,-0.8,0)
				pr.flowermode=True
				pr.arcmode=True
				pr.radiusy=6
				pr.radiusx=12
				pr.anglestep=6
				tableautakealteratecolor(True);
				tableautakedescending(True);
				tableaugivealteratecolor(True);
				tableaugivedescending(True);
				foundationascending(True);				
				createcards(1,0)
				createcards(1,1)
				createcards(1,2)
				createcards(1,3)
				cameraposition[0].set(-2,2,-28)				
				cameraposition[1].set(-3,0,-30)		
				cameraposition[2].set(-2,2,-35)		
				camerapositionmenu[1].set(3-4,1+6,-50)
				camerapositionmenu[2].set(0,1+6,-50)
				camerapositionpreview[1].set(4,0,-60)
				camerapositionpreview[2].set(0,-4,-70)
				rectangle[0].set(tabx*-3.7,-6)
				rectangle[1].set(tabx*3.7 ,10)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-14,-11,0,40,5)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-8,-10,0,46,8,True)
				shufflecards()
				Local ap:_animationcardtopile=New _animationcardtopile
				ap.init(Self,30,30)
				For Local prit:_pilereserve=EachIn pilereservelist
				 ap.use(prit,16+6,False,True)
				Next
				ap.cardinpreparationafteranimation=False
				Local ap2:_animationcardtopile=New _animationcardtopile
				ap2.init(Self,30,30)
				For n=0 To 5
				 ap2.use(piletableau(n),2,True,True)
				Next
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,13,100)
				For n=0 To 5
				 a4.use(piletableau(n))
				Next
				Local ap22:_animationcardtopile=New _animationcardtopile
				ap22.init(Self,30,30)
				For n=0 To 5
				 ap22.use(piletableau(n),4,True,True)
				Next
				Local a24:_animationpileturn=New _animationpileturn
				a24.init(Self,13,100)
				For n=0 To 5
				 a24.use(piletableau(n))
				Next								
				Local ap222:_animationcardtopile=New _animationcardtopile
				ap222.init(Self,30,30)
				For n=0 To 5
				 ap222.use(piletableau(n),5,True,True)
				Next
				Local a224:_animationpileturn=New _animationpileturn
				a224.init(Self,13,100)
				For n=0 To 5
				 a224.use(piletableau(n))
				Next								
				setanimationpreparative()
				update()
				EndMethod
	EndType						
'******************************************************************************************************************
'										G A M E P A I R S C R O S S
'******************************************************************************************************************
Type _gamepairscross Extends _game
	Method initgeneral(s:_solitaire,mo)
				initgame(s,mo,PAIRSCROSS)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				Local ox#=0
				Local oy#=0
				Local pl:_pilearray=createpilearray(ox-tabx*2.5,0,5,5)
				createcard(0,12)
				createcard(1,12)
				createcard(2,12)
				createcard(3,12)
				createcard(0,11)
				createcard(1,11)
				createcard(2,11)
				createcard(3,11)
				For Local i=0 To 15 
				 Local c:_card=createcard(3,0)
				 c.backsided=True
				Next
				createcard(0,0)
				cameraposition[0].set(0,-1,-47)								
				cameraposition[1].set(0,-taby*2,-35)				
				cameraposition[2].set(0,-taby*2,-35)				
				camerapositionmenu[1].set(-1,-5-taby,-45)
				camerapositionmenu[2].set(-1.5,-4,-55)
				camerapositionpreview[1].set(0,0,-90)
				camerapositionpreview[2].set(0,-2.5,-80)
				rectangle[0].set(ox-tabx*2.5,-taby*4)
				rectangle[1].set(ox-tabx*2.5+tabx*4,0)
				enlargerectangle()
				EndMethod
	Method init(s:_solitaire,mo=0)				
				Local n
				initgeneral(s,mo)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				cardposition(-26,-11,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,-10,-11,0,60,8)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-10+tabx*2,-10,0,60,8,True)
				shufflecards()			
				Local ac:_animationcardtopile=New _animationcardtopile
				ac.init(Self,30,30)
				ac.usearray(pilearray(0))
				Local al:_animationpiletoclear=New _animationpiletoclear
				al.init(Self,0,0,Rnd(-20,20),Rnd(-20,20),-30,30,10)		
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				a4.use(pilearray(0))
				setanimationpreparative()
				update()
				EndMethod
	Method tipppairscross:Int()
				Local pa:_pilearray=pilearray(0)
				
				Local found=False
				Local nx=-1,ny=-1
				If pa
				
			 	 For Local iy=0 To pa.dimy-1
				  For Local ix=0 To pa.dimx-1
				   If pa.feld[ix,iy]=Null
				    nx=ix
				    ny=iy
			       EndIf
				  Next
				 Next
				 If nx<>-1
				  found=False
				  Local startiterator=destiterator
			 	  Repeat
				   If destiterator=0 And ny>0 'nach oben
				    If pa.candropat(pa.feld[nx,ny-1],nx,ny)
				     foundsourcard[0]=nx
				     foundsourcard[1]=ny-1
				     founddestcard[0]=nx
				     founddestcard[1]=ny
				     found=True
				    EndIf
				   ElseIf destiterator=1 And nx<pa.dimx-1'nach rechts
				    If pa.candropat(pa.feld[nx+1,ny],nx,ny)
				     foundsourcard[0]=nx+1
				     foundsourcard[1]=ny
				     founddestcard[0]=nx
				     founddestcard[1]=ny
				     found=True
				    EndIf
				   ElseIf destiterator=2 And ny<pa.dimy-1'nach unten
				    If pa.candropat(pa.feld[nx,ny+1],nx,ny)
				     foundsourcard[0]=nx
				     foundsourcard[1]=ny+1
				     founddestcard[0]=nx
				     founddestcard[1]=ny
				     found=True
				    EndIf
				   ElseIf destiterator=3 And nx>0 'nach links
				    If pa.candropat(pa.feld[nx-1,ny],nx,ny)
				     foundsourcard[0]=nx-1
				     foundsourcard[1]=ny
				     founddestcard[0]=nx
				     founddestcard[1]=ny
				     found=True
				    EndIf
				   EndIf
				   'destiterator:+1
				   'If destiterator>=4 destiterator=0
				   destiterator=Rand(0,3)
				  Until found Or (destiterator=startiterator)
				 EndIf
				EndIf
				Return(found)
				EndMethod	
	Method tippexecutepairscross()		
				Local pa:_pilearray=pilearray(0)
				If pa
				 Local cs:_card=pa.feld[foundsourcard[0],foundsourcard[1]]
				 If cs
				  Local cn:_card=New _card
				  cn.copy(cs)
				  Local vn:_vector3=New _vector3
				  Local t0:_vector3=New _vector3
				  Local t1:_vector3=New _vector3
				  t0.set(0,0,-20)
				  t1.set(0,0,+20)
				  cn.tipplink=tipplist.addlast(cn)
				  cn.curveposition.setvector(cn.position,pa.droppositionat(founddestcard[0],founddestcard[1]),t0,t1)
				  cn.curvevx.setvector(cn.vx,cn.vx,vn,vn)
				  cn.curvevy.setvector(cn.vy,cn.vy,vn,vn)
				  cn.curvespeed=solitaire.autospeed
				  cn.startcurve(solitaire.clock)
				  cn.cardcontrolopacity=cs
				  cn.curveopacity.set(0,0,2,-10)
				 EndIf
				EndIf
				EndMethod									
	Method tipp()
				startusing()
				If tipppairscross()
				 tippexecutepairscross();Return(True);	
				EndIf
				Return(False);
				EndMethod				
	Method autoplay()
				startusing()
				If cardcurving()=False
				 If tipppairscross()
				  Local pk:_pilearray=pilearray(0)
				  If pk pk.move(foundsourcard[0],foundsourcard[1],founddestcard[0],founddestcard[1])
				  Return(True);				
				 EndIf
				EndIf
				Return(False);	
				EndMethod			
	Method automove()
				Return(False);
				EndMethod			
	Method clickplaypairscross:Int(card:_card)
				Local cx=card.arrayindex[0]
				Local cy=card.arrayindex[1]
				Local pa:_pilearray=_pilearray(card.pile)
				If pa
				
				 If cx>0
				  If pa.candropat(card,cx-1,cy) 
				   foundsourcard[0]=cx
				   foundsourcard[1]=cy
				   founddestcard[0]=cx-1
				   founddestcard[1]=cy
				   Return(True)
				  EndIf
				 EndIf
				 If cx<pa.dimx-1
				  If pa.candropat(card,cx+1,cy) 
				   foundsourcard[0]=cx
				   foundsourcard[1]=cy
				   founddestcard[0]=cx+1
				   founddestcard[1]=cy
				   Return(True)
				  EndIf
				 EndIf
				 If cy>0
				  If pa.candropat(card,cx,cy-1) 
				   foundsourcard[0]=cx
				   foundsourcard[1]=cy
				   founddestcard[0]=cx
				   founddestcard[1]=cy-1
				   Return(True)
				  EndIf
				 EndIf
				 If cy<pa.dimy-1
				  If pa.candropat(card,cx,cy+1) 
				   foundsourcard[0]=cx
				   foundsourcard[1]=cy
				   founddestcard[0]=cx
				   founddestcard[1]=cy+1
				   Return(True)
				  EndIf
				 EndIf
	
				EndIf	
				
				Return(False)				
				EndMethod						
	Method clickplay(card:_card)
				startusing()
				deinsertpick()
				If clickplaypairscross(card)
				 Local pk:_pilearray=_pilearray(card.pile)
				 If pk pk.move(foundsourcard[0],foundsourcard[1],founddestcard[0],founddestcard[1])
				 Return(True);
				EndIf
				Return(False);
				EndMethod				
	Field destiterator=0
	Field foundsourcard[2]
	Field founddestcard[2]
	EndType


'******************************************************************************************************************
'										G A M E S P I D E R S U P E R S T O C K
'******************************************************************************************************************
Type _gamespidersuperstock Extends _gamespideronesuit
	Method initgeneral(s:_solitaire,mo)				
				initgame(s,mo,SPIDERSUPERSTOCK)
				Local tabx#=tabulatorx()
				Local taby#=tabulatory()	
				createpiletableau(6,-10+tabx,6)
				Local ps:_pilestock
				Local pw:_pilewaste
				ps=createpilestock(-11,7+taby,0,4)
				ps.wasteiteration=True
				ps.redealvalue=1
				For Local pdx#=0 To 7
				 createpilediscard(-9+tabx+pdx*tabx,7+taby)
				Next
				pw=createpilewaste(-11,7-taby*3)
				pw=createpilewaste(-11,7-taby*2)
				pw=createpilewaste(-11,7-taby*1)
				pw=createpilewaste(-11,7)
				tableaugivesamesuit(True);
				tableaugivedescending(True);
				tableautakesamesuit(True);
				tableautakedescending(True);
				createcards(8,Rand(0,3))
				cameraposition[0].set(0,-6,-39)
				cameraposition[1].set(0.5,0,-39)
				cameraposition[2].set(2,2,-39)
				camerapositionmenu[2].set(4,9,-57)
				camerapositionpreview[1].set(4,0,-75)
				camerapositionpreview[2].set(0,-7,-80)
				rectangle[0].set(-11,7-taby*3)
				rectangle[1].set(-9+tabx+7*tabx,7+taby)
				enlargerectangle()
				pilesort()	
				EndMethod
	Method init(s:_solitaire,mo=0)
				Local n
				initgeneral(s,mo)
				cardposition(-16,-10,0)
				Local a0:_animationmove=New _animationmove
				a0.init(Self,10,2,0,50,9)
				Local a01:_animationmove=New _animationmove
				a01.init(Self,-6,-6,0,50,9,True)
				shufflecards()
				Local a2:_animationcardtostock=New _animationcardtostock
				a2.init(Self,pilestock(0),104,60,10)
				Local a3:_animationstocktopile=New _animationstocktopile
				a3.init(Self,pilestock(0),90,10)
				a3.soundsingle=True
				For Local n=0 To 2
				 a3.use(piletableau(n),5)
				Next
				For Local n=3 To 5
				 a3.use(piletableau(n),4)
				Next
				Local as:_animationpileshiftoutvertical=New _animationpileshiftoutvertical
				as.init(Self,5,20)
				For n=0 To 2
				 as.use(piletableau(n),5)
				Next
				For n=3 To 5
				 as.use(piletableau(n),4)
				Next	
				Local a4:_animationpileturn=New _animationpileturn
				a4.init(Self,10,50)
				a4.usesoundaction=False
				a4.usesoundstart=False
				a4.soundstart=solitaire.sspend
				For Local n=0 To 5
				 a4.use(piletableau(n))
				Next
				setanimationpreparative()
				update()
				EndMethod
	EndType				
