## launch with npm

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
