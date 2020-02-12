#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
#singleinstance force

Menu, Tray, Icon, icon.ico
MsgBox,, 20mins, Start writing, 5
Gosub, Timeup
return

Timeup:
;sleep 10000
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
file := FileOpen("wordcount.txt", "a") 
File.Write(A_DD " "A_MMMM " " A_YYYY "`r`n" "word count: "MyEdit "`r`n`r`n")
Gosub, Timeup
return 

Quit:
gui,submit
file := FileOpen("wordcount.txt", "a") 
File.Write(A_DD " "A_MMMM " " A_YYYY "`r`n" "word count: "MyEdit "`r`n`r`n")
ExitApp
return 