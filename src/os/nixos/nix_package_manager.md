```bash
$ nix eval -f '<nixpkgs>' 'vscode.src.urls'
[ "https://update.code.visualstudio.com/1.62.3/linux-x64/stable

$ nix eval -f '<nixpkgs>' 'vscode.version'
"1.62.3"

$ nix eval --raw -f '<nixpkgs>' 'vscode.version'
1.62.3

$ nix eval --impure --expr 'with import <nixpkgs> { }; vscode.version'
"1.62.3"

$ nix eval --impure --expr '(import <nixpkgs> {}).vscode.version'
"1.62.3"

$ nix-eval() { nix-instantiate --eval -E "(import <nixpkgs> {}).$*"; }
$ nix-eval vscode.version
"1.62.3"
```

- https://discourse.nixos.org/t/eval-nix-expression-from-the-command-line/8993
