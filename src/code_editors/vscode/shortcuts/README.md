- https://code.visualstudio.com/docs/getstarted/keybindings
  - https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf
  - https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf
  - https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf

## Errors and Warnings

`ctrl+shift+m`

Quickly jump to errors and warnings in the project.

Cycle through errors with `f8` or `shift+f8`

https://github.com/Microsoft/vscode-tips-and-tricks

## Side by side editing

create or switch:

`ctrl+1`

## Copy line up / down

`shift+alt+down` or `shift+alt+up`

## Find by symbol

You can navigate symbols inside a file with `Ctrl+Shift+O`. By typing `:` the symbols will be grouped by category

- https://code.visualstudio.com/docs/editor/editingevolved#_go-to-symbol
- https://johnpapa.net/getting-started-with-visual-studio-code/

## Undo cursor position

`ctrl+u`

## Move line up and down

`alt+up` or `alt+down`

## Trim trailing whitespace

`ctrl+shift+x`

## Code formatting

Currently selected source code

`ctrl+k, ctrl+f`

Whole document format

`shift+alt+f`

## Select current line

`ctrl+i`

## Toggle README preview

In a markdown file use

`ctrl+shift+v`

## Side by Side Markdown Edit and Preview

In a markdown file use

`ctrl+k v`

## Help for Commands

`ctrl-p` then type `?` shows all of the types of global and editor commands you can run.

https://johnpapa.net/getting-started-with-visual-studio-code/

- hide left panel `ctrl+b`
- zen mode `ctrk+k z`

## Join lines

```json
[
  {
    "key": "ctrl+j",
    "command": "editor.action.joinLines"
  }
]
```

## don't close window with ctrl+w when no files open

in `keybindings.json`

`{ "key": "ctrl+w", "command": "-workbench.action.closeWindow", "when": "!editorIsOpen" }`

close window with `ctrl+shift+w`.

https://github.com/Microsoft/vscode/issues/1764#issuecomment-230674122

## Navigate back to the last cursor position

On Windows:

`Alt+Left` .. navigate back

`Alt+Right` .. navigate forward

On Mac:

`Control+-` .. navigate back

On Ubuntu Linux:

`Ctrl+Alt+-` .. navigate back

`Ctrl+Shift+-` .. navigate forward

https://stackoverflow.com/questions/35424367/how-to-navigate-back-to-the-last-cursor-position-in-visual-studio-code

## collapse folders recursively

from vscode>=1.16

`alt+click` on Windows

`ctrl+alt+click` on Ubuntu

## reopen last closed file

`ctrl+shift+t`

https://github.com/Microsoft/vscode/issues/5586

## go to symbol

`⇧⌘O`

https://code.visualstudio.com/docs/editor/editingevolved

## unfold all

`ctrl+k ctrl+j`

https://www.mongodb.com/community/forums/t/convert-aggregation-results-to-json/2458
