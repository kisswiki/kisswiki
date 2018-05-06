
`Cmd+Shift+p > Shell Command : Install code in PATH`

or

`sudo ln -s "/Applications/Visual Studio Code.app/Contents/MacOS/Electron" /usr/local/bin/code`

or

`code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}`

- https://stackoverflow.com/questions/29963617/how-to-call-vs-code-editor-from-command-line
- https://stackoverflow.com/questions/30065227/run-open-vscode-from-mac-terminal
- https://gist.github.com/bangonkali/02ba0dc50aebca627fa68ff3a7325b8e