#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance force

Menu, Tray, Icon, icon.ico
MsgBox,, 20mins, Start writing, 5
Gosub, Timeup
return

Timeup:
sleep 1200000
Gui, New, , 20mins
Gui, Font, s12
Gui, Add, Text, x48, 20mins is up
Gui, Add, Text, x10, Please enter word count?
Gui, Add, Edit, x10 vMyEdit,
Gui, Add, Button, w180 gAgain, Again
Gui, Add, Button, w180 gQuit Default , Quit
Gui,-MinimizeBox
Gui, show
return 

Again:
gui,submit
FileAppend, 
(
	%A_MMM% %A_DD% %A_YYYY% at %A_Hour%:%A_Min% 
	Words: %MyEdit% `n
), wordcount.txt
Gosub, Timeup
return 

Quit:
gui,submit
FileAppend, 
(
	%A_Hour%:%A_Min% on %A_MMM% %A_DD% %A_YYYY%
	Words: %MyEdit% `n
), wordcount.txt
ExitApp
return 