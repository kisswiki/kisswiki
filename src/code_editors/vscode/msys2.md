```json
{
    "terminal.integrated.shell.windows": "C:\\msys64\\usr\\bin\\bash.exe",
    "terminal.integrated.shellArgs.windows": [
        "--login",
    ],
    "terminal.integrated.env.windows": {
        "CHERE_INVOKING": "1",
        "MSYSTEM": "MINGW64",
    },
}
```

https://stackoverflow.com/questions/45836650/how-do-i-integrate-msys2-shell-into-visual-studio-code-on-window/48016561#48016561

You also may need to add something to `$PATH`:

```bash
$ cat ~/.bashrc
alias epi="elm package install -y $@"
alias er0="elm reactor -a 0.0.0.0 $@"
```
