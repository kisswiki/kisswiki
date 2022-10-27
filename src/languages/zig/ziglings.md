## vscode task

`ctrl+shift+p > Tasks: Configure Task`.

Then I have changed `command` and added `runOptions`.

Also `ctrl+shift+p > Tasks: Manage Automatic Tasks in Folder > Allow...`

```
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "echo",
            "type": "shell",
            "command": "watchexec -w exercises -i zig-cache -e zig zig build",
            "runOptions": {
                "runOn": "folderOpen"
            }
        }
    ]
}
```

- https://dev.to/robole/how-to-run-webpack-automatically-in-vs-code-when-you-open-a-project-1c19

to update zig

`~/personal_projects/zig/zig-utils/scripts/zupd aarch64-macos`
