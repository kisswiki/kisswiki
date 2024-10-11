`%s/<http\(.\{-}\)>/http\1/gc`

non-greedy `\{-}`

will change this

`<https://github.com/rofrol/efryz.pl/settings/secrets/actions> > New repository secret > name: DEPLOY_KEY, content: paste private key`

to this

`https://github.com/rofrol/efryz.pl/settings/secrets/actions > New repository secret > name: DEPLOY_KEY, content: paste private key`

https://stackoverflow.com/questions/1305853/how-can-i-make-my-match-non-greedy-in-vim/1305957#1305957
