VsCode provides an API for extensions, so you are restricted to things the API allows you to do. It's a totally different thing than "living inside the Interpreter" as you do in Emacs. You can not do things like `M-: (forward-char -1)`. Instead you load your extension do the VsCode extension API dance and eventually use something like:

`vscode.commands.executeCommand("cursorMove", {to: "left", by: "character"})`

VsCode Extensions have no access to the DOM UI at all.

https://www.reddit.com/r/emacs/comments/bp72wt/i_might_switch_to_vscode/enrphmi/
