## launch with npm

npm way doesn't work, only direct script running.

```
{
    // Use IntelliSense to learn about possible Node.js debug attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "program": "${workspaceRoot}/backend/index.js",
            "cwd": "${workspaceRoot}/backend",
            "console": "integratedTerminal"
        },
        {
            "name": "Launch via NPM",
            "type": "node",
            "request": "launch",
            "cwd": "${workspaceRoot}/backend",
            "runtimeExecutable": "npm",
            "runtimeArgs": [
                "run-script", "start:dev"
            ]
        }

    ]
}
```

- https://code.visualstudio.com/docs/nodejs/nodejs-debugging
- https://github.com/Microsoft/vscode-node-debug/blob/master/.vscode/launch.json#L29

## debug javascript

- https://code.visualstudio.com/docs/languages/javascript#_debugging

