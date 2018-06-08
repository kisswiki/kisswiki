#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
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
    } else if (GetKeyState("LWin", "P") AND GetKeyState("LShift", "P") = false) {     
        Send {LWin down}{tab}
        KeyWait, tab
    } else if (GetKeyState("LWin", "P") AND GetKeyState("LShift", "P")) {  
        Send {LShift down}{LWin down}{tab}
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
LWin::LAlt
LCtrl::LWin
; This cause alt sending LWin or RWin, idk
; RAlt::RCtrl
; AppsKey::RAlt
; RCtrl::AppsKey

; https://autohotkey.com/board/topic/30117-how-do-i-create-hotkey-to-suspend-autohotkey/page-2
^!F10::Suspend, Toggle