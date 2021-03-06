- https://github.com/viatsko/awesome-vscode
- `ctrl+shift+n` http://stackoverflow.com/questions/29964825/how-does-one-open-multiple-instances-of-visual-studio-code
- http://stackoverflow.com/questions/30234146/open-multiple-folders-in-visual-studio-code
- `code --list-extensions` http://superuser.com/questions/1080682/how-do-i-back-up-my-vs-code-settings-and-list-of-installed-extensions
- https://code.visualstudio.com/Docs/customization/userandworkspace
- https://code.visualstudio.com/docs/editor/codebasics
- https://github.com/Microsoft/vscode-tips-and-tricks
- https://code.visualstudio.com/Docs/languages/markdown
- https://code.visualstudio.com/docs/customization/keybindings
- duplicate line: `Shift+Alt+Down and `Shift+Alt+Up` http://stackoverflow.com/questions/30203752/how-do-i-duplicate-a-line-or-selection-within-visual-studio-code

## Config

- https://code.visualstudio.com/docs/customization/userandworkspace#_settings-file-locations
- http://www.hongkiat.com/blog/customizing-visual-studio-code/
- https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync

```
"window.openFoldersInNewWindow": "on"
```

## Extensions

```
code --list-extensions
code --install-extension ms-vscode.cpptools
code --uninstall-extension ms-vscode.csharp
```

- https://code.visualstudio.com/Docs/editor/extension-gallery
- http://superuser.com/questions/1080682/how-do-i-back-up-my-vs-code-settings-and-list-of-installed-extensions
- should be possible to pass list of extensions https://github.com/Microsoft/vscode/commit/93eb84884605ee8d54d2f6ed892a4d55af80263f
- http://stackoverflow.com/questions/37071388/how-to-install-vscode-extensions-offline

## Graphql

- https://github.com/kumarharsh/graphql-for-vscod
  - Add details about the .gqlconfig file in readme https://github.com/Mayank1791989/gql/issues/1

## Soft wrap

`"editor.wrappingColumn": 0`

http://stackoverflow.com/questions/31025502/how-to-switch-word-wrap-on-and-off-in-vscode/34404903#34404903

## Font

https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions

## eslint

- VSCode doesn't work with eslint installed with yarn, use npm https://github.com/Microsoft/vscode-eslint/issues/187
- You need to have both eslint and babel eslint installed either globally or locally https://github.com/Microsoft/vscode/issues/7113#issuecomment-223513710

## goreturns

look at `golang/goreturns.md`

## Version mismatch! global tsc (2.1.6) != VS Code's language service (2.2.2)

```
npm i -g typescript@2.2.2
tsc -v
```

If `npm update -g typescript@2.2.2` didn't work, run first `npm rm -g typescript`.

## Search and replace

`Ctrl+H`

`Json<(\*)>`

`CORS<Json<$1>>`

## open window maximized

`"window.newWindowDimensions": "maximized"`

https://github.com/Microsoft/vscode-docs/blob/vnext/release-notes/v1_9.md#control-the-dimensions-of-new-windows
