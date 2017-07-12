## launch with npm

```
{
    // Use IntelliSense to learn about possible Node.js debug attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch via NPM",
            "type": "node",
            "request": "launch",
            "cwd": "${workspaceRoot}/backend",
            "runtimeExecutable": "npm",
            "runtimeArgs": [
                "run-script", "start:dev"
            ]
        },
        {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "program": "${workspaceRoot}/backend/index.js",
            "cwd": "${workspaceRoot}/backend"
        }
    ]
}
```

- https://code.visualstudio.com/docs/nodejs/nodejs-debugging

## debug javascript

- https://code.visualstudio.com/docs/languages/javascript#_debugging

