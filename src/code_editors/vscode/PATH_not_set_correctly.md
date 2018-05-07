I had `$PATH` wrongly set in new vscode 1.23.0. To fix this, set in settings (for osx):

```
    "terminal.integrated.shellArgs.osx": [
      "-i"
    ],
```

By default it is `-l`.

Starting vscode from terminal sets `$PATH` correclty.

Introspection: `vscode > Help > Toggle Developers Tools > process.env.PATH`

- https://github.com/Microsoft/vscode/issues/31800#issuecomment-327149392
- https://github.com/Krzysztof-Cieslak/vscode-elm/issues/193