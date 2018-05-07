
I had `$PATH` wrongly set in new vscode 1.23.0. It looks like setting it to `-l` somehow solved the problem.(for osx), even though `-l` is default:

```
    "terminal.integrated.shellArgs.osx": [
      "-i"
    ],
```

Starting vscode from terminal sets `$PATH` correclty.

Introspection: `vscode > Help > Toggle Developers Tools > process.env.PATH`

- https://github.com/Microsoft/vscode/issues/31800#issuecomment-327149392
- https://github.com/Krzysztof-Cieslak/vscode-elm/issues/193
- By default the VS Code integrated terminal does not run as a login shell and therefore does not run `~/.bash_profile` https://github.com/Microsoft/vscode/issues/9484#issuecomment-234347728