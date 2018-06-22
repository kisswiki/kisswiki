#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;https://superuser.com/questions/984343/remap-ctrl-to-alt-and-keep-alttab-and-ctrltab/1332713#1332713
;Swap LWin with LCtrl using SharpKeys and then
*tab:: 
{   
    if (GetKeyState("LAlt", "P") AND GetKeyState("LShift", "P") = false) {     
        Send {LControl up}{LAlt down}{tab}
        KeyWait, tab  
    } else if (GetKeyState("LAlt", "P") AND GetKeyState("LShift", "P")) {     
        Send {LControl up}{LShift down}{LAlt down}{tab}
        KeyWait, tab
    } else if (GetKeyState("LCtrl", "P") AND GetKeyState("LShift", "P") = false) {     
        Send {LAlt up}{LCtrl down}{tab}
        KeyWait, tab
    } else if (GetKeyState("LCtrl", "P") AND GetKeyState("LShift", "P")) {  
        Send {LAlt up}{LShift down}{LCtrl down}{tab}
        KeyWait, tab
    } else {   
        send {tab}
    }      
    return
}

~LAlt Up::
{   
    send {LAlt up}
    return
}

~LCtrl Up::
{   
    send {LCtrl up}
    return
}
LAlt::LCtrl 
LCtrl::LAlt

;Don't use polish programmers keyboard because of problems with AltGr (if you have this on your keyboard) producing Ctrl+Alt
;https://www.proz.com/forum/across_support/191719-shortcuts_for_polish_characters.html
;https://superuser.com/questions/592970/can-i-make-ctrlalt-not-act-like-altgr-on-windows
;https://stackoverflow.com/questions/229633/how-to-globally-map-altgr-key-to-alt-key
>!+a::Send {Ą}
>!a::Send {ą}
>!+c::Send {Ć}
>!c::Send {ć}
>!+e::Send {Ę}
>!e::Send {ę}
>!+l::Send {Ł}
>!l::Send {ł}
>!+n::Send {Ń}
>!n::Send {ń}
>!+o::Send {Ó}
>!o::Send {ó}
>!+s::Send {Ś}
>!s::Send {ś}
>!+x::Send {Ź}
>!x::Send {ź}
>!+z::Send {Ż}
>!z::Send {ż}
