## Key down repeat with Vim extension

first you need to get Cursor’s id:

`$ osascript -e 'id of app "Cursor"'`

mine looked like this: com.todesktop.230313mzl4w4u92

Then do:

`$defaults write <app id goes here> ApplePressAndHoldEnabled -bool false`

And restart Cursor with quit and reopen.

<https://forum.cursor.sh/t/key-down-repeat-with-vim-extension/1581/3>

## AI

- <https://harper.blog/2025/02/16/my-llm-codegen-workflow-atm/>
  - <https://news.ycombinator.com/item?id=43094006>
- <https://ghuntley.com/stdlib/>
- <https://github.com/eastlondoner/cursor-tools>
- <https://github.com/cline/cline>
