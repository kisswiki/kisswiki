- https://superuser.com/questions/172970/hotkey-to-mute-mic-on-mac-os-x/882417#882417
  - https://itunes.apple.com/pl/app/mutemymicfree/id567195825
- action https://www.reddit.com/r/shortcuts/comments/qk0u2f/comment/hiucak3/
- https://medium.com/macoclock/how-in-the-bleep-do-i-mute-my-mic-anywhere-on-macos-d2fa1185b13
  - https://apple.stackexchange.com/questions/408815/app-that-provides-a-keyboard-shortcut-to-mute-unmute-the-microphone

save as toggle-microphone and bind to cmd+shift+m

```
if input volume of (get volume settings) = 0 then
	set volume input volume 100
	display notification "✅ unmuted" with title "Microphone"
else
	set volume input volume 0 without output muted
	display notification "❌ muted" with title "Microphone"
end if
```
