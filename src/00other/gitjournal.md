
## git host

Go to https://github.com/new and create private repository named journal or other name.


Set manually git repository address and public and private keys.

Make sure the public key is addded on github.com.

## external git repository

Install termux

`pkg update`

During update you may be asked to update configs. Answer y.

It that fails, you may have some repos configured. Let's remove them.


```
pkg remove game-repo
pkg remove science-repo
pkg update
```

https://stackoverflow.com/questions/67647518/termux-repository-is-under-maintenance-or-down/67955726#67955726

If `pkg update` still fails, you may need to change source with `termux-change-repo`.

