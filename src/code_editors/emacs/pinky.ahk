#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; The .ahk text file needed to be saved with UTF8-BOM encoding rather than UTF8
; https://stackoverflow.com/questions/15635635/how-do-i-use-unicode-in-autohotkey
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global sendLAltUpOnLCtrlUp := 0

;; https://superuser.com/questions/984343/remap-ctrl-to-alt-and-keep-alttab-and-ctrltab/1332713#1332713
;; https://autohotkey.com/board/topic/96465-switch-alt-and-ctrl-retain-alt-tab/
;; Let LCtrl sends LWin, LWin sends LAlt and LAlt sends LCtrl using SharpKeys and then
*tab:: 
{
    if ((GetKeyState("LCtrl", "P") OR GetKeyState("RCtrl", "P")) AND GetKeyState("LShift", "P") = false) {
        sendLAltUpOnLCtrlUp := 1
        Send {LCtrl up}{LAlt down}{tab}
        KeyWait, tab  
    } else
    if ((GetKeyState("LCtrl", "P") OR GetKeyState("RCtrl", "P")) AND GetKeyState("LShift", "P")) {
        sendLAltUpOnLCtrlUp := 1
        Send {LCtrl up}{LShift down}{LAlt down}{tab}
        KeyWait, tab
    } 
    else {   
        send {tab}
    }      
    return
}

~LCtrl up::
{   
    if(sendLAltUpOnLCtrlUp == 1) {
      sendLAltUpOnLCtrlUp := 0
      send {LAlt up}
    } else {
      send {LCtrl up}
    }
    return
}

~LAlt up::
{   
    send {LAlt up}
    return
}

;; Polish diactrics ĄąĆćĘęŁłŃńÓóŚśŹźŻż
;; Don't use polish programmers keyboard because of problems with AltGr (if you have this on your keyboard) producing Ctrl+Alt
;; https://www.proz.com/forum/across_support/191719-shortcuts_for_polish_characters.html
;; https://superuser.com/questions/592970/can-i-make-ctrlalt-not-act-like-altgr-on-windows
;; https://stackoverflow.com/questions/229633/how-to-globally-map-altgr-key-to-alt-key
;; I've also changed with Sharpkeys: RAlt sends RCtrl, AppsKey sends RAlt, RCtrl sends AppsKey
;; but then this `>!+a::Send Ą` started inserting strnage characters instead of `Ą`, so I needed to use `{U+0104}`
;; https://superuser.com/questions/782648/easily-type-unicode-characters-using-autohotkey
;; https://pl.m.wikipedia.org/wiki/Alfabet_polski
;; >!+a::Send {U+0104}
;; >!a::Send {U+0105}
;; https://superuser.com/questions/432646/using-different-mappings-for-uppercase-and-lowercase-of-the-same-key
;; https://autohotkey.com/board/topic/148483-how-to-pass-a-key-in-a-function-parameter/
;; AppsKey & a::
;;     if(GetKeyState("Shift"))
;;         Send {U+0104}
;;     else
;;         Send {U+0105}
;;     return

Polish(upper, lower)
{
    if(GetKeyState("Shift"))
        Send {%upper%}
    else
        Send {%lower%}
    return
}

AppsKey & c::Polish("U+0106", "U+0107")
AppsKey & e::Polish("U+0118", "U+0119")
AppsKey & l::Polish("U+0141", "U+0142")
AppsKey & n::Polish("U+0143", "U+0144")
AppsKey & o::Polish("U+00D3", "U+00F3")
AppsKey & s::Polish("U+015A", "U+015B")
AppsKey & x::Polish("U+0179", "U+017A")
AppsKey & z::Polish("U+017B", "U+017C")
