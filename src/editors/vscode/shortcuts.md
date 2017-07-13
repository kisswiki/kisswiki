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

`ctrl+shift+o`

typing an additional `:` allows you to search by category.

https://johnpapa.net/getting-started-with-visual-studio-code/

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

##Side by Side Markdown Edit and Preview

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

`{ "key": "ctrl+w", "command": "-workbench.action.closeWindow", "when": "!editorIsOpen" }`

close window with `ctrl+shift+w`.

https://github.com/Microsoft/vscode/issues/1764#issuecomment-230674122
