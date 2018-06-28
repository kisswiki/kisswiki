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
    if (GetKeyState("LCtrl", "P") AND GetKeyState("LShift", "P") = false) {
        sendLAltUpOnLCtrlUp := 1
        Send {LCtrl up}{LAlt down}{tab}
        KeyWait, tab  
    } else
    if (GetKeyState("LCtrl", "P") AND GetKeyState("LShift", "P")) {
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
>!+a::Send {U+0104}
>!a::Send {U+0105}
>!+c::Send {U+0106}
>!c::Send {U+0107}
>!+e::Send {U+0118}
>!e::Send {U+0119}
>!+l::Send {U+0141}
>!l::Send {U+0142}
>!+n::Send {U+0143}
>!n::Send {U+0144}
>!+o::Send {U+00D3}
>!o::Send {U+00F3}
>!+s::Send {U+015A}
>!s::Send {U+015B}
>!+x::Send {U+0179}
>!x::Send {U+017A}
>!+z::Send {U+017B}
>!z::Send {U+017C}
