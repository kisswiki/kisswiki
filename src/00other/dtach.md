## Run and attach

`dtach -A /tmp/odmt -e '^A' ng s`

socket `/tmp/odmt`

`Ctrl-A` to detach, be default it is `Ctrl-\` which conflicts with LazyVim toggle terminal.

`ng s` command to run

## attach to detached

`dtach -a /tmp/odmt -e '^A'`
