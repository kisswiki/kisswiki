#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; https://autohotkey.com/board/topic/25492-after-movemouse-how-to-return-cursor-to-previous-location/
;; https://autohotkey.com/board/topic/17656-breaking-an-infinite-loop-with-keypress/?p=531749
;; https://autohotkey.com/board/topic/16943-breaking-out-of-multiple-nested-loops/?p=109881
;; https://gist.github.com/kenny-evitt/6f6571e38295f2b65f54
;; https://stackoverflow.com/questions/28182639/autohotkey-move-mouse-to-center-of-screen-whenever-it-gets-towards-edge/28185618#28185618
;; https://www.reddit.com/r/AutoHotkey/comments/97nxnh/keep_cursor_from_edge/e4b26aj?utm_source=share&utm_medium=web2x
;; https://autohotkey.com/board/topic/55934-constrain-mouse-movement-when-key-held-down/

CenterMouseCursor := false

F4::
If CenterMouseCursor {
  CenterMouseCursor := false
  KeyWait, F4
  DllCall("ClipCursor") ; unclip the cursor - works after key Up
} else {
  CenterMouseCursor := true
  CoordMode, Mouse, Screen ; needed to prevent some issues when clicking changes focus
  MouseMove, (A_ScreenWidth // 2), (A_ScreenHeight // 2)
  ClipCursor(A_ScreenWidth // 2 - 40, A_ScreenHeight // 2 - 40, A_ScreenWidth // 2 + 40, A_ScreenHeight // 2 + 40)
}
Return

RButton::
If CenterMouseCursor {
  Send {RButton Down}
  CoordMode, Mouse, Screen ; needed to prevent some issues when clicking changes focus
  MouseGetPos, X1, Y1
  ClipCursor(A_ScreenWidth // 2 - 400, A_ScreenHeight // 2 - 400, A_ScreenWidth // 2 + 400, A_ScreenHeight // 2 + 400)
  KeyWait, RButton
  Send {RButton Up}
  MouseMove, %mXcurr%, %mYCurr% ; restore mouse position
  ClipCursor(A_ScreenWidth // 2 - 40, A_ScreenHeight // 2 - 40, A_ScreenWidth // 2 + 40, A_ScreenHeight // 2 + 40)
} else {
  SendInput {RButton}
}
Return

;; does not work, use F4
;F5::
;If CenterMouseCursor {
;  DllCall("ClipCursor") ; unclip the cursor
;KeyWait, F5
;  ClipCursor(A_ScreenWidth // 2 - 40, A_ScreenHeight // 2 - 40, A_ScreenWidth // 2 + 40, A_ScreenHeight // 2 + 40)
;} else {
;  SendInput {F5}
;}
;Return

ClipCursor(x1=0, y1=0, x2=1, y2=1) {
  VarSetCapacity(R,16,0)
  NumPut(x1,&R+0)
  NumPut(y1,&R+4)
  NumPut(x2,&R+8)
  NumPut(y2,&R+12)
  Return DllCall("ClipCursor", UInt,&R)
}

;; https://autohotkey.com/board/topic/5727-hiding-the-mouse-cursor/?p=76269
;; https://www.autohotkey.com/docs/commands/DllCall.htm#HideCursor

; Example: Hides the mouse cursor when you press Win+C. To later show the cursor, press Win+C again.
; This script is from www.autohotkey.com/forum/topic6107.html

#Persistent
    OnExit, ShowCursor
return

ShowCursor:
SystemCursor("On")
ExitApp


SystemCursor(OnOff=1)   ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
{
    static AndMask, XorMask, $, h_cursor
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; handles of default cursors
    if (OnOff = "Init" or OnOff = "I" or $ = "")       ; init when requested or at first call
    {
        $ := "h"                                       ; active default cursors
        VarSetCapacity( h_cursor,4444, 1 )
        VarSetCapacity( AndMask, 32*4, 0xFF )
        VarSetCapacity( XorMask, 32*4, 0 )
        system_cursors := "32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650"
        StringSplit c, system_cursors, `,
        Loop %c0%
        {
            h_cursor   := DllCall( "LoadCursor", "Ptr",0, "Ptr",c%A_Index% )
            h%A_Index% := DllCall( "CopyImage", "Ptr",h_cursor, "UInt",2, "Int",0, "Int",0, "UInt",0 )
            b%A_Index% := DllCall( "CreateCursor", "Ptr",0, "Int",0, "Int",0
                , "Int",32, "Int",32, "Ptr",&AndMask, "Ptr",&XorMask )
        }
    }
    if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
        $ := "b"  ; use blank cursors
    else
        $ := "h"  ; use the saved cursors

    Loop %c0%
    {
        h_cursor := DllCall( "CopyImage", "Ptr",%$%%A_Index%, "UInt",2, "Int",0, "Int",0, "UInt",0 )
        DllCall( "SetSystemCursor", "Ptr",h_cursor, "UInt",c%A_Index% )
    }
}
