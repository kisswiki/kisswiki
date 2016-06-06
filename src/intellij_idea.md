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

## Duplicate artifact

Edit run configuration, in section 'Before launch' click + > Run External tool > Add > { Name: 'restore jboss config', Program: 'bash', Parameters: '-c "cd /c/installed/jboss-eap-6.2/ && git checkout -f"' }

- http://stackoverflow.com/questions/15203498/intellij-idea-11-running-a-shell-script-as-a-run-debug-configuration
- http://stackoverflow.com/questions/16966033/run-a-bash-script-before-running-a-maven-goal-in-intellij-idea

## JBoss - edit configuration - missing

The JBoss Integration plugin must be enabled

https://www.jetbrains.com/help/idea/2016.1/run-debug-configuration-jboss-server.html?origin=old_help

## only 75 visible characters in Intellij Idea's embedded terminal

For windows change the terminal shell path (File->Settings->Tools->Terminal) from cmd.exe to:

`cmd.exe /K "mode con:cols=500 lines=9999&cmd.exe"`

http://stackoverflow.com/questions/24936479/why-there-are-only-75-visible-characters-in-intellij-ideas-embedded-terminal

## Output window of IntelliJ IDEA cuts output

IDEA_HOME\bin\idea.properties

`idea.cycle.buffer.size=1024`

http://stackoverflow.com/questions/11763996/output-window-of-intellij-idea-cuts-output
