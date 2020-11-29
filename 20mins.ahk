#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
#singleinstance force
Menu, Tray, Icon, icon.ico

;sleep 10000
sleep 1200000
InputBox, WordCount, 20mins, Please enter word count
if ErrorLevel
    return
else
    file := FileOpen("wordcount.txt", "a") 
    File.Write(A_DD " "A_MMMM " " A_YYYY "`r`n" "word count: "WordCount "`r`n`r`n")
    MsgBox, 4,, Reload
    IfMsgBox Yes
        reload
    else
        ExitApp
return 