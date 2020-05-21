## Run splitted terminal

1. https://code.visualstudio.com/docs/editor/tasks#_custom-tasks

It will create file `.vscode/tasks.json`. Paste in it below content:

```json
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "type": "shell",
            "command": "sh server.sh",
            "label": "sh server.sh",
            "presentation": {
                "group": "sxs", // some arbitrary name for the group
                "panel": "dedicated"
            },
            "runOptions": {
                "runOn": "folderOpen"
            }
        },
        {
            "type": "shell",
            "command": "node ../mock-server/index.js",
            "label": "node ../mock-server/index.js",
            "presentation": {
                "group": "sxs", // some arbitrary name for the group
                "panel": "dedicated"
            },
            "runOptions": {
                "runOn": "folderOpen"
            }
        },
        {
            "type": "shell",
            "command": "sh client.sh",
            "label": "sh client.sh",
            "presentation": {
                "group": "sxs2", // some arbitrary name for the group
                "panel": "dedicated"
            },
            "runOptions": {
                "runOn": "folderOpen"
            }
        },
        {
            "type": "shell",
            "command": "/bin/bash", // <-- your shell here
            "args": [
                "-l" // login shell for bash
            ],
            "label": "empy",
            "presentation": {
                "focus": true,
                "group": "sxs2", // some arbitrary name for the group
                "panel": "dedicated"
            },
            "runOptions": {
                "runOn": "folderOpen"
            }
        },
        {
            "command": "gitk",
            "args": [
                "--all"
            ],
            "isBackground": false,
            "label": "gitk --all",
            "runOptions": {
                "runOn": "folderOpen"
            }
        },
    ]
}
```

Now we need to globally git ignore `.vscode` directory.

For that open file `~/.gitconfig` and in it you have to add to core section or just paste below:

```
[core]
	excludesfile = ~/.global_gitignore
```

Now create file `~/.global_gitignore` and paste this in it:

```
.vscode/
```

For now on, `git status` should not show `.vscode` as new directory.

- `"runOn": "folderOpen"` https://stackoverflow.com/questions/34103549/can-i-automatically-start-a-task-when-a-folder-is-opened/53755091#53755091
  - Make sure that automatic tasks are enabled: 1. CTRL-SHIFT-P 2. Search for and run 'Manage Auotomatic Tasks in Folder' 3. Select for and run 'Allow Automatic Tasks in Folder' https://stackoverflow.com/questions/34103549/can-i-automatically-start-a-task-when-a-folder-is-opened#comment105445234_53755091
  - https://code.visualstudio.com/updates/v1_30#_run-on-folder-open
- For split use `group` https://stackoverflow.com/questions/52410847/how-to-split-the-terminal-when-running-tasks-in-vscode/58158211#58158211
  - https://github.com/Microsoft/vscode/issues/47265
- empty terminal https://stackoverflow.com/questions/54578615/vscode-open-new-terminal-as-part-of-task/58158143#58158143
- Cannot reuse first terminal now? https://stackoverflow.com/questions/48655347/run-same-instance-of-terminal-with-build-task-in-vs-code

## Old

tasks.json

```
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "0.1.0",
    "command": "npm",
    "isShellCommand": true,
    "showOutput": "always",
    "suppressTaskName": true,
    "tasks": [
        {
            "taskName": "start",
            "isBuildCommand": true,
            "args": [
                "start"
            ]
        }
    ]
}
```

- https://stackoverflow.com/questions/34103549/can-i-automatically-start-a-task-when-a-folder-is-opened
- https://code.visualstudio.com/docs/editor/tasks
