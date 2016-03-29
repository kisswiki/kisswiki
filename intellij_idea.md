- disable HTML breadcrumbs: Settings > Editor > General > Appearance > Show HTML breadcrumbs http://stackoverflow.com/questions/29391588/how-to-hide-the-div-structure-thing-next-to-the-editor-tabs
- http://stackoverflow.com/questions/9162802/intellij-idea-output-directory-reverts-to-default-target
  - IDEA will revert to the Maven configuration on every pom.xml re-import. You can disable it in the IDEA Maven settings
- Colorize console output: install plugin `Grep Console` http://stackoverflow.com/questions/9420992/colorize-console-output-in-intellij-products/14584030#14584030

## Exclude from searching

Warning! If you exclude some dir, it won't be searched but also won't be deployed. If you want to exclude some dirs from searching you have to create scope. `Find in Path > Scope > Custom > Shift+Enter or click '...' buton > click + (Add scope) > Choose project from dropdown > Select some dir and click exclude recursively`. Later on you combine patters. Double slash before asterisk `//*` means recursively:

`!file[xbg-ab-web]:node_modules//*&&!file[xbg-ab-web]:src/main/webapp/vendor/js//*`

- http://stackoverflow.com/questions/29014063/ignore-a-folder-in-search-results
- http://stackoverflow.com/questions/16671706/how-can-i-tell-intellijs-find-in-files-to-ignore-generated-files
- http://stackoverflow.com/questions/14437647/exclude-directory-from-intellij-inspection-but-not-exclude-from-autocomplete
- http://stackoverflow.com/questions/12705538/how-to-configure-webstorm-phpstorm-project-so-that-js-code-intelligence-works

## JBoss output directory changes when switching git branches

`Settings > Build, Execution, Deployment > Build Tols > Maven > Importing > uncheck 'Use Maven output directories'`
