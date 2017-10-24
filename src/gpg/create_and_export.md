`gpg --gen-key`

choose 4096 for size

```bash
$ gpg --list-secret-keys --keyid-format LONG
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot 
ssb   4096R/42B317FD4BA89E7A 2016-03-10
# export public, can do > public.asc
$ gpg --armor --export 3AA5C34371567BD2
# export private, can do > private.asc
# gpg --armor --export-secret-keys 3AA5C34371567BD2
```

- https://help.github.com/articles/generating-a-new-gpg-key/
- https://stackoverflow.com/questions/5587513/how-to-export-private-secret-asc-key-to-decrypt-gpg-files-in-windows
