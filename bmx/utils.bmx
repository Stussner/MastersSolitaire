Function Draw_Text_Wrapped_X(txt:String,x,y,dx,srow=0,mrow=-1)
	Local line:String
	Local word_start_txt
	Local word_start_line
	Local pos
	Local cur_y=y
	Local crow=0

	If txt=Null
		Return
	EndIf

	While pos<txt.length
		If txt[pos]=13 Or txt[pos]=10
			If txt[pos+1]=10 Or txt[pos+1]=13
				pos:+1
			EndIf
			If srow<=crow And (crow<=mrow Or mrow=-1)
				DrawText(line,x,cur_y)
				cur_y=cur_y+TextHeight(line)
			EndIf
			crow:+1
			line=""
		ElseIf TextWidth(line)>dx
			pos=word_start_txt
			line=line[0..word_start_line]
			If srow<=crow And (crow<=mrow Or mrow=-1)
				DrawText(line,x,cur_y)
				cur_y=cur_y+TextHeight(line)
			EndIf
			crow:+1
			line=""
		Else
			If txt[pos]=32
				word_start_txt=pos
				word_start_line=line.length
			EndIf
			line=line+Chr(txt[pos])
		EndIf
		pos:+1
	Wend
	If srow<=crow And (crow<=mrow Or mrow=-1)
		DrawText(line,x,cur_y)
	EndIf
	crow:+1
	Return crow
End Function

Function Draw_Text_Wrapped_X_Centered(txt:String,x,y,dx)
	Local line:String
	Local word_start_txt
	Local word_start_line
	Local pos
	Local cur_y=y
	Local cx=x+dx/2

	If txt=Null
		Return
	EndIf

	While pos<txt.length
		If txt[pos]=13 Or txt[pos]=10
			If txt[pos+1]=10 Or txt[pos+1]=13
				pos:+1
			EndIf
			DrawXCenteredText(line,cx,cur_y)
			cur_y=cur_y+TextHeight(line)
			line=""
		ElseIf TextWidth(line)>dx
			pos=word_start_txt
			line=line[0..word_start_line]
			DrawXCenteredText(line,cx,cur_y)
			cur_y=cur_y+TextHeight(line)
			line=""
		Else
			If txt[pos]=32
				word_start_txt=pos
				word_start_line=line.length
			EndIf
			line=line+Chr(txt[pos])
		EndIf
		pos:+1
	Wend
	DrawXCenteredText(line,cx,cur_y)
End Function



Function DrawCenteredText (text$,X,Y)
	
	X:-TextWidth(Text$)*0.5
	Y:-TextHeight(Text$)*0.5
	DrawText(Text$,X,Y)

EndFunction

Function DrawXCenteredText (text$,X,Y)
	
	X:-TextWidth(Text$)*0.5
'	Y:-TextHeight(Text$)*0.5
	DrawText(Text$,X,Y)

EndFunction

Function DrawRightText (text$,X,Y)
	
	X:-TextWidth(Text$)
'	Y:-TextHeight(Text$)*0.5
	DrawText(Text$,X,Y)

EndFunction


Function DrawYCenteredText (text$,X,Y)
	
'	X:-TextWidth(Text$)*0.5
	Y:-TextHeight(Text$)*0.5
	DrawText(Text$,X,Y)

EndFunction

Function draw2text(text$,x,y)
	Local i
	Local t2:Short[Len(text$)]
'	 Local t2:Short Ptr
'	t2=text$.ToWString()
	For i=0 To Len(text$)-1 Step 2
		t2[i/2]=text$[i+1]*256+text$[i]
		'If(j1timedebug)
		'	Print t2[i/2]
		'EndIf
	Next
	'j1timedebug=0
'	t2[Len(text$)]=0
	Local t3:String=String.FromShorts(t2,6)

	DrawText(t3,X,Y)
End Function

Function TimeToStr:String(t)
	Local d,r
	Local s1:String
	Local s:String

	d=t/3600
	r=t Mod 3600
	s1=d
	If Len(s1)=1
		s1="0"+s1
	EndIf
	s=s1+":"
	d=r/60
	r=r Mod 60
	s1=d
	If Len(s1)=1
		s1="0"+s1
	EndIf
	s=s+s1+":"
	s1=r
	If Len(s1)=1
		s1="0"+s1
	EndIf
	s=s+s1
	Return s
End Function