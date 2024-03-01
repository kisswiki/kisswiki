```shell
gh api licenses -q '.[].name'
gh api licenses | jq . | grep Apach
# source cannot be with license
# gh repo create $(basename $PWD) --private --source . -l Apache-2.0
gh repo create $(basename $PWD) --private --add-readme --license Apache-2.0
gh repo help
gh repo list | grep steam
gh repo clone rofrol/steamdeck-games-popularity
```

- https://gotofritz.net/blog/using-gh-to-generate-a-new-repo/
- https://cli.github.com/manual/gh_repo_create
- https://stackoverflow.com/questions/69413752/how-to-set-gitignore-file-and-license-to-none-and-set-add-origin-git-remote-to
