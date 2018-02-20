#NoTrayIcon
#SingleInstance Ignore
VarSetCapacity( AndMask, 32*4, 0xFF ), VarSetCapacity( XorMask, 32*4, 0 )
hIcon := DllCall("CreateCursor", Uint,0, Int,0, Int,0, Int,32, Int,32, Uint,&AndMask, Uint,&XorMask )
Gui, +LastFound
SendMessage, 0x80, 0, hIcon    ; Titlebar Icon
SendMessage, 0x80, 1, hIcon    ; Alt+Tab Icon


Gui, Font, S20 CDefault, Arista 2.0
Gui, Color, FFFFFF

Gui, Add, Edit, x42 y59 w110 h40 Center Number r1 vFirst1,
Gui, Add, Edit, x412 y59 w120 h40 Center Number r1 vFirst2,
Gui, Add, Edit, x572 y59 w120 h41 Center vFirst3,
Gui, Add, Edit, x172 y119 w110 h4 Center Number r1 vSecond1, 
Gui, Add, Edit, x412 y119 w120 h40 Center Number r1 vSecond2, 
Gui, Add, Edit, x572 y119 w120 h41 Center vSecond3, 

Gui, Font, S20 CDefault, COCOMAT Heavy

Gui, Add, Text, x172 y59 w220 h40 , IS WHAT `% OF
Gui, Add, Text, x42 y119 w130 h40 , WHAT IS
Gui, Add, Text, x302 y119 w90 h40 , `% OF

Gui, Show, x705 y403 h232 w738, Percentage Calculator

Loop
{
	Gui, Submit, NoHide
	
	math1 := (First1*100)/First2
	math1 := Round(math1, 2)
	GuiControl,, First3, %math1%`%
	
	math2 := (Second1*Second2)/100
	math2 := Round(math2, 2)
	GuiControl,, Second3, %math2%
	Sleep 200
}
Return

GuiClose:
ExitApp
