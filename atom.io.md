- https://atom.io/docs/
- clickable links in markdown
  - ctrl+o https://atom.io/packages/open-path
  - ctrl+click https://atom.io/packages/nuclide-url-hyperclick + https://atom.io/packages/hyperclick
  - https://discuss.atom.io/t/clickable-links-in-markdown-file/15130
  - snippets installed with package langauge-gfm, look at settings to see the list
    - example: type b, tooltip shows, press tab
- javascript
  - jump to definition
    - https://discuss.atom.io/t/is-there-a-simple-go-to-definition/11809/15
      - https://atom.io/packages/goto
    - https://atom.io/packages/js-hyperclick
  - https://atom.io/packages/autocomplete-modules
  - https://atom.io/packages/atom-ternjs
  - https://atom.io/packages/turbo-javascript
- diff two files from tree view
  - https://atom.io/packages/compare-files
  - https://github.com/mupchrch/split-diff
- git diff
  - https://github.com/atom/git-diff
  - side-by-side
    - ungit https://github.com/FredrikNoren/ungit/issues/126
    - https://atom.io/packages/git-history + https://github.com/mupchrch/split-diff
      - https://discuss.atom.io/t/compare-files-side-by-side-with-diff-highlight/13726/10
- linter
  - to reload rules run `Linter: Toggle`
  - linter-plus is now linter:  
  https://github.com/steelbrain/linter-plus > https://github.com/AtomLinter/linter > https://github.com/atom-community/linter
  - eslint
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
- appearance/themes/syntax highlighting
  - https://github.com/silvestreh/atom-material-ui (uses background color from syntax theme)
  - https://atom.io/themes/oceanic-next
  - https://atom.io/packages/file-icons
- git
  - https://atom.io/packages/git-plus
- html
  - https://atom.io/packages/emmet
  - https://atom.io/packages/autoclose-html
  - https://atom.io/packages/html-entities
- markdown
  - https://atom.io/packages/toggle-markdown-task
  - https://atom.io/packages/markdown-helpers
  - https://atom.io/packages/markdown-deluxe
  - https://atom.io/packages/linter-markdown
  - https://atom.io/packages/markdown-lists or https://atom.io/packages/gfm-lists
  - sort list
    - https://atom.io/packages/markdown-sort-list - changes `-` to `*`, doesn't sort for me
  - https://atom.io/packages/markdown-toc/
  - https://atom.io/packages/markdown-preview-plus
- indent without moving to beginning Ctrl+]
- terminal
  - https://atom.io/packages/term2 most popular - cannot install on windows and atom beta - node-gyp related
  - https://atom.io/packages/terminal-plus second most popular and installs without problems
- focus
  - https://atom.io/packages/Zen
- emmet
  - https://atom.io/packages/emmet-simplified
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
- key binding
  - Keybinding Resolver
    - You can open and close the resolver using `cmd-.`
- stars
  - `apm stars [--user thedaniel] --install`
  - http://blog.atom.io/2014/06/09/stars.html
  - error: `Command failed: fatal: Unable to find remote helper for 'https'` happend when installing terminal-plus from command line
    - solution: add `C:\Program Files\Git\mingw64\libexec\git-core` to %PATH%
    - http://stackoverflow.com/questions/28216987/impossible-to-install-atom-beautify-on-windows-7-64bit-machine-with-apm/30314943#30314943
- default line ending - use .editorconfig
- open recent files/folders
  - https://atom.io/packages/open-recent
- theme
  - https://atom.io/themes/4-color-dark
