- https://stackoverflow.com/questions/37346481/how-do-i-find-and-replace-all-occurrences-in-all-files-in-visual-studio-code
- https://stackoverflow.com/questions/37346481/how-do-i-find-and-replace-all-occurrences-in-all-files-in-visual-studio-code

You no longer need to Save All and Close All when replacing all search results. Replace actions will now replace and save the changes.

https://code.visualstudio.com/updates/v1_22#_save-automatically-when-search-replace

## search/replace in selection

'Find in selection' button in the find widget

https://github.com/Microsoft/vscode/issues/8787#issuecomment-230761140

## files to include - multiple extensions

`*.js,*.jsx`

and with subdirectory

`src/**/*.{tsx,jsx,js,ts}`

## exclude

In search dialog or permanently:

`ctrl+shift+p > open settings json`

```
    "search.exclude": { "**/*.map": true }
```

- https://stackoverflow.com/questions/45895070/vs-code-search-exclude-doesnt-work/51066228#51066228
- https://code.visualstudio.com/docs/getstarted/settings
