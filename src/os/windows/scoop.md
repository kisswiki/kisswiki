## Downgrade

```
$ scoop uninstall vscode
$ cd ~/scoop/buckets/extras/bucket
# Go back before vscode was upgrade to 1.60.0
$ git checkout de8f507374cfc1cc40f87ebd89a17f053077942d^ -- vscode.json
$ scoop install vscode
# Prevent upgrading
$ scoop hold vscode
# Restore git repo to latest version
$ git checkout -f
```

There is idea to automate this restoring https://github.com/lukesampson/scoop/issues/3894

https://github.com/lukesampson/scoop/issues/4345#issuecomment-913495438
