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
