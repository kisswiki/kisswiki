## Autostart

```
Find the script file, select it, and press Control+C.
Press Win+R to open the Run dialog, then enter shell:startup and click OK or Enter. This will open the Startup folder for the current user. To instead open the folder for all users, enter shell:common startup (however, in that case you must be an administrator to proceed).
Right click inside the window, and click "Paste Shortcut". The shortcut to the script should now be in the Startup folder.
```

- https://www.autohotkey.com/docs/FAQ.htm#Startup

## Switch LAlt with LCtrl except Alt+Tab and Shift+Alt+Tab

- https://superuser.com/questions/984343/remap-ctrl-to-alt-and-keep-alttab-and-ctrltab/1332713#1332713

## super-globals and variables

- https://superuser.com/a/495757/64577
- https://autohotkey.com/docs/Variables.htm
- https://stackoverflow.com/questions/12850350/autohotkey-global-variable-that-can-be-accessed-and-modified-by-different-macros

## if/else

- https://autohotkey.com/docs/commands/IfExpression.htm

## Alert-like box

```ahk
MsgBox %globalVar%
```

- https://stackoverflow.com/questions/12850350/autohotkey-global-variable-that-can-be-accessed-and-modified-by-different-macros

## More than two keys

```
LWin & Left::
	if GetKeyState("Shift")	
		{
		Send +^{Left}
		return
		}
	else
		{	
		Send ^{Left}
		return
		}
```

https://github.com/olets/MacKeyboard/blob/master/MacKeyboard.ahk

## Debug

- https://stackoverflow.com/questions/49009176/autohotkey-getting-control-key-stuck

## Links

- https://gaming.stackexchange.com/questions/110349/how-do-i-remap-the-arrow-keys-using-autohotkey
- https://superuser.com/questions/1150394/autohotkey-remap-a-solid-key
- https://stackoverflow.com/questions/37169218/autohotkey-remap-keys-to-swich-two-keys-with-each-other
- http://xahlee.info/mswin/autohotkey_key_notations.html
- http://xahlee.info/mswin/autohotkey_swap_capslock.html
- http://xahlee.info/mswin/autohotkey_examples.html
- https://superuser.com/questions/135539/how-do-i-swap-the-windows-and-control-keys-in-windows
- http://autohotkey.free.fr/docs/commands/Send.htm
