' Strings for various buttons
Global play$="Spielen"	' play button, main menu
Global cplayer$="Choose player"		' choose player, main menu
Global cgame$="Spieltyp"			' choose game, main menu
Global btimes$="Best times"			' best times, main menu
Global options$="Optionen"			' options, main menu and game
Global quit$="Beenden"					' quit, main menu
Global ok$="OK"						' ok and cancel used a lot
Global cancel$="Abbruch"
Global menu_str$="Menu"				' menu, game
Global choose$="Choose"				' choose, game
Global orientation$="Orientation"	' sceen orientation, game, top
Global help$="Hilfe"				' help, game
Global pause_str$="Pause"			' pause, game
Global deal$="Deal"					' deal, game (restart game)
Global undo$="Vor"					' undo move, game
Global redo$="Zurück"				' redo move, game
Global apon$="A/P On"				' autoplay on, game button
Global apoff$="A/P Off"				' autoplay off
Global shuffle$="Shuffle"			' (re)shuffle, game
Global restart$="Neu"				' restart the same game
Global hint_str$="Tipp"				' hint, game
Global atcards$="Auto turn cards"	' auto turn cards, options
Global autoplay_str$="Auto play"	' auto play, options
Global addplayer$="Add player"		' add player, players
Global remplayer$="Remove player"	' remove player, players
Global dif_easy$="Easy"				' Easy difficulty setting
Global dif_hard$="Hard"				' Hard difficulty setting
Global dif_str$="Schwierigkeit"		' Difficulty sider caption
Global fullscreen_str$="Fullscreen"	' Fullscreen checkbox, options
Global settings$="Settings"			' Buttons in options screen - settings (default)
Global credits$="Credits"			' credits
Global opthelp$="Help"				' help
Global avset$="Audio/Video"			' tabs in options screen
Global gameset$="Game"
Global grset$="Graphics"
Global cardset$="Cards&Deck"
Global music$="Musik"
Global soundfx$="Sounds"
Global ambient$="Ambienz"
Global slow_str$="Slow PC"
Global systemperformance_str$="Rechnerleistung"
Global invalidplayer$="Please enter a name"
Global pclick_str$="Anklicken und Verschieben autom."
Global astart_str$="Automatischer Spielstart"
Global exitconf_str$="Abfrage bei Verlassen"
Global dtime_str$="Zeitanzeige"
Global gbut1_str$="Spielknöpfe"
Global gbut2_str$="Menüknöpfe"
Global anim_str$="Kartenanimation"
Global natp_str$="Natürliche Stapel (tol-cm)"
Global mOver_str$="Maus über Karten-Tipp"
Global spark_str$="Funkelmaus"
Global bpt_str$="Best personal time:"
Global tries_str$="Games played:"
Global solved_str$="Games solved:"
Global cardslope_str$="Kartenneigung (cm)"
Global cardthickness_str$="Kartendicke (µm)"
Global cardlift_str$="Tableauanhebung (cm)"


' Confirmation and message strings
Global confirmremplayer$="Do you really want To remove "
Global pause_msg$="Press mouse button To Continue"
Global invalid_name_msg$="Invalid name"
Global enter_name_msg$="Enter your name"
Global msg_quit$="Do you really want to quit?"

' statistics/endgame message
Global solvedgame_msg$="You have succesfully solved the game!"+Chr(13)+Chr(10)+"Your time is: "
Global solvedbest_msg$=" and you are on the best times list in "
Global first$="First "
Global second$="Second "
Global third$="Third "
Global th$="th "
Global place$="place!"

' choose game/player lists
Global cgamecaption$="Game Type"
Global currentgame_str$="Current Game"
Global cplayerscaption$="Choose player"

Global dummynames$[]=["Sille","Sören","Sibo","Svantje","Svea","Sievert","Sofie","Simon","Sondre","Sander"]
Global scenenames$[]=["Ohne Sonne ist alles doof","Ohne Dich ist alles doof","Ohne Nacht ist alles doof","Ohne Winter ist alles doof","Sheepworld"]
Global cardbacknames$[]=["Klassisches Blau","Klassisches Rot","Glas","Drache"]
Global cardfrontnames$[]=["Klassisch"]
Global musicnames$[]=["Sheepworldsoli 1","Sheepworldsoli 2","Sheepworldsoli 3"]


					
Global bestperstime$="Best personal time:"
Global bestwinstreak$="Best winning streak:"

' error strings
Global err_appdata$="Application Data invalid or inaccessible"
Global err_appdatacreate$="Failed to create game application data folder"