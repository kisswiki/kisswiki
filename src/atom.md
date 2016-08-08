- https://atom.io/docs/
- indent without moving to beginning Ctrl+]
- convert spaces <=> tabs https://github.com/AtomLinter/linter-stylelint
- safe mode: `atom --safe` https://discuss.atom.io/t/what-does-safe-mode-do/22229

## snippets installed with package langauge-gfm, look at settings to see the list

- example: type b, tooltip shows, press tab

## javascript

- jump to definition
  - https://discuss.atom.io/t/is-there-a-simple-go-to-definition/11809/15
    - https://atom.io/packages/goto
  - https://atom.io/packages/js-hyperclick
- https://atom.io/packages/autocomplete-modules
- https://atom.io/packages/atom-ternjs
- https://atom.io/packages/turbo-javascript

## diff two files from tree view

- https://atom.io/packages/compare-files
- https://github.com/mupchrch/split-diff

## git diff

- https://github.com/atom/git-diff
- side-by-side
  - ungit https://github.com/FredrikNoren/ungit/issues/126
  - https://atom.io/packages/git-history + https://github.com/mupchrch/split-diff
    - https://discuss.atom.io/t/compare-files-side-by-side-with-diff-highlight/13726/10

## linter

- I had to `rm -rf ~/.atom` to make linter work http://stackoverflow.com/questions/29712232/cant-get-atom-linter-to-work/36000092#36000092, I've also installed https://atom.io/packages/react instead of https://atom.io/packages/language-javascript-jsx
- to reload rules run `Linter: Toggle`
- linter-plus is now linter: https://github.com/steelbrain/linter-plus > https://github.com/AtomLinter/linter > https://github.com/atom-community/linter

### eslint

- error level http://devnull.guru/get-started-with-eslint/
  - 0 - Turn the rule off
  - 1 - Turn the rule on as a warning
  - 2 - Turn the rule on as an error
- [recent versions of ESLint do not use any rules by-default](https://atom.io/packages/linter-eslint)
- https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb
  - npm i -D eslint-config-airbnb eslint-plugin-react
  - .eslintrc

    ```json
    {
      'extends': 'airbnb',
      'rules': {
        'react/react-in-jsx-scope': 0, // when using jsx with i.e. cycle.js and not with react.js
        'comma-dangle': 0
      }
    }
    ```
  - When using --init, your configuration file will automatically [include](http://eslint.org/docs/user-guide/migrating-to-1.0.0.html) the following line:

    ```
    {
        "extends": "eslint:recommended"
    }
    ```
- https://github.com/walmartlabs/eslint-config-defaults
- Illegal import declaration https://github.com/eslint/eslint/issues/2112#issuecomment-83633766
  - ecmaFeatures: { modules: true }

## appearance/themes/syntax highlighting

- https://atom.io/themes/material-ui (uses background color from syntax theme)
- https://atom.io/themes/yoceanic-next-syntax
- https://atom.io/packages/file-icons

## html

- https://atom.io/packages/autoclose-html

## markdown

- https://atom.io/packages/markdown-lists or https://atom.io/packages/gfm-lists
- sort list
  - https://atom.io/packages/markdown-sort-list - changes `-` to `*`, doesn't sort for me
- clickable links in markdown
  - https://atom.io/packages/link - had to make a button because this ctrl+shif+o is used already
  - ctrl+o https://atom.io/packages/open-path
  - ctrl+click https://atom.io/packages/hyperlink-hyperclick + https://atom.io/packages/hyperclick
  - https://discuss.atom.io/t/clickable-links-in-markdown-file/15130
  - https://github.com/atom/markdown-preview/issues/85

## terminal

- https://atom.io/packages/term2 most popular - cannot install on windows and atom beta - node-gyp related
- OUTDATED! https://github.com/jeremyramin/terminal-plus/issues/255
  - https://atom.io/packages/terminal-plus second most popular and installs without problems
  - git bash: `Shell Override: C:\Program Files\Git\bin\bash.exe`, `Shell Arguments: -l -i` http://superuser.com/questions/856979/can-we-open-gitbash-from-atom-text-editor/1054082#1054082
- https://atom.io/packages/platformio-ide-terminal

## focus

- https://atom.io/packages/Zen

## emmet

- https://atom.io/packages/emmet-simplified

## packages

- https://atom.io/packages/windows-carriage-return-remover
- https://atom.io/packages/atom-diary
- https://atom.io/packages/block-comment `ctrl+shift+/` works
- https://atom.io/packages/image-view
- https://atom.io/packages/incompatible-packages
- https://atom.io/packages/notifications
- https://atom.io/packages/aligner
- https://atom.io/packages/list-edit
- https://atom.io/packages/fancy-new-file
- TimeCop: View
- open recent files/folders https://atom.io/packages/open-recent
- autosave https://atom.io/packages/atom-idle-autosave
- css lint https://github.com/AtomLinter/linter-stylelint

## key binding

- Keybinding Resolver
  - You can open and close the resolver using `cmd-.`

## stars

- `apm stars [--user thedaniel] --install`
- http://blog.atom.io/2014/06/09/stars.html
- error: `Command failed: fatal: Unable to find remote helper for 'https'` happend when installing terminal-plus from command line
  - solution: add `C:\Program Files\Git\mingw64\libexec\git-core` to %PATH%
  - http://stackoverflow.com/questions/28216987/impossible-to-install-atom-beautify-on-windows-7-64bit-machine-with-apm/30314943#30314943

## theme

- https://atom.io/themes/4-color-dark + https://atom.io/themes/atom-material-ui
- create
  - generated theme will appear in directory specified in Settings > Project Home. Default is ~/github
- http://flight-manual.atom.io/hacking-atom/sections/creating-a-theme/
- https://atom.io/themes/mbo + one dark or https://atom.io/themes/dark-flat-ui
  - https://github.com/elm-lang/elm-lang.org/blob/00badde648c0451b2ce1d2654c83a13c3b7e9ce6/src/editor/editor.js#L215
  - used in in elm i.e. http://elm-lang.org/examples/flickr

## polish accents with right alt

- https://atom.io/packages/keyboard-localization
- https://github.com/atom/atom-keymap/issues/35#issuecomment-110439831  
  ~/.atom/keymap.cson

  ```
  'body':
    'ctrl-alt-o': 'unset!'

  'atom-workspace atom-text-editor:not([mini])':
    'ctrl-alt-z': 'unset!'
    'ctrl-alt-c': 'unset!'

  '.platform-win32 atom-workspace':
    'ctrl-alt-c': 'unset!'
  ```


## line endings `\r\n`

- As a workaournd you can create a .editorconfig https://github.com/atom/line-ending-selector/issues/5#issuecomment-145816608
- https://github.com/atom/line-ending-selector
- editorconfig: for changes to take effect reopen file or disable/enable editorconfig package. Also note that for single extension don't use curly brackets like this `[*.{css}]`. Instead use this `[*.css]`

## React

https://atom.io/packages/react

## Stylelint

Undefined rule "declaration-block-no-ignored-properties"

Update atom-linter

## Search and replace

- Search on Windows doesn't work with `**\*.ext` https://github.com/atom/find-and-replace/issues/744
- Normalize slashes to backslashes on Windows https://github.com/atom/find-and-replace/issues/295
- https://atom.io/packages/fold-search-results

## Troubleshooting

### Unable to find remote helper for 'https'

- Verify that the git command is on the PATH.
- Use PowerShell to run the command instead of cmd or git-bash.
- Run PowerShell in administrator mode.

http://stackoverflow.com/questions/27178363/install-autocomplete-plus-package-in-windows/27186255#27186255

### Single-click to open file in tree-view

Still not merged https://github.com/atom/tree-view/pull/804

Need to double-click.

Solved: https://atom.io/packages/single-click-open

## Command toolbar

https://atom.io/packages/command-toolbar

can copy settings from ~/.atom/command-toolbar.json

## Windows

### AtomSetup.exe failed to install

Probably problem with privilieges and antivirus. Should be fixed already https://github.com/atom/atom/issues/5773#issuecomment-77003900 so I've downloaded exe from https://github.com/atom/atom/releases. I've also deleted `%USERPROFILE%\C:\Users\frolow\AppData\Local\SquirrelTemp` though I don't know if that has a positive effect.

### Failed to `apm stars --install`: EINVAL, invalid argument

Run it in cmd.exe, not in git bash.
