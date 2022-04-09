`Preferences: Configure User Snippets command, select the New Global Snippets file... > enter name`

```json
{
  "DateTime": {
    "prefix": "datetime",
    "description": "Output a file header with the file name and date",
    "body": [
      "$CURRENT_YEAR-$CURRENT_MONTH-${CURRENT_DATE}T$CURRENT_HOUR:$CURRENT_MINUTE:$CURRENT_SECOND "
    ]
  }
}
```

Type `date`, press `ctrl+space`, snippet menu should show.

- https://stackoverflow.com/questions/38780057/how-to-insert-current-date-time-in-vscode
- https://code.visualstudio.com/docs/editor/userdefinedsnippets#_variables
