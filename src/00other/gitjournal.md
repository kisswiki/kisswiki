Install gitjournal.


## git host and external git repository

Go to https://github.com/new and create private repository named journal or other name.

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

Now we want to create ssh key outside termux.

First we need to allow termux to access storage with `termux-setup-storage`.

Then let's create key with

`ssh-keygen -t ed25519 -C "your_email@example.com"`

Latest instruction about github ssh is on src/github/ssh.md.

Now let's show contest of keys in termux so we can select and copy them:

`cat ~/.ssh/id_ed25519.pub`

And

`cat ~/.ssh/id_ed25519`

Public kwy id_ed25519.pub should be added to github.

Now configure git host on journal manually.

Automatically fails for me. It opens some other window.

Antway, after setting git host and successfully syncing, set git to external repository in gitjournal.

You have to first set git host and then externl repository, othereise it fails.

Go to `gitjournal 
