## Disable Ollama autostart

Ollama is still forcing the open at login thing. I didn't want to compromise on not being able to run it in the background so I found a solution:
- First, as you have probably done already remove Ollama from the "Open at Login" menu in System Settings --> General
- THEN open Ollama's nagging-ass LaunchAgent with your favorite text editor (for instance, textedit) you can paste this in the terminal:

`open -a textedit /Applications/Ollama.app/Contents/Library/LaunchAgents/com.ollama.ollama.plist`

- NEXT STEP is locating the following lines in the text (plist) file:

```
    <key>RunAtLoad</key>
    <true/>
```

- WE ARE GONNA change that true tag below RunAtLoad into <false/>, this is how it should end up looking:

```
    <key>RunAtLoad</key>
    <false/>
```

File --> Save the file. Done. No more ollama at startup. Take care.

EDIT: I've just realized this procedure means an app will modify another app, and macOS is extra-cautious with that. Here's the fix:

- Choose Apple menu > System Settings, then click Privacy & Security in the sidebar. (You may need to scroll down.) Open Privacy & Security settings.
- App management.
- For each app in the list that you are using to modify the file, turn the ability to control other apps on. It might be Terminal, your text editor or whatever. Whatever you need to turn on will appear automagically when trying to go through the steps above.
- Restart whichever app you had to turn the setting on and try to edit the file again. :)
    
https://www.reddit.com/r/ollama/comments/1lx45fg/comment/nmglr1t/