```bash
git fetch origin master:master
git rebase master
git fetch . HEAD:master
git push origin master
```

If in the meantime, someone updated master and you get message

```
 ! [rejected]        master     -> master  (non-fast-forward)
```

You have to reset master

```
$ git rebase master
First, rewinding head to replay your work on top of it...
Applying: Defect-4060 Vertical scroll appears when the content is too long and without spaces
$ git fetch . HEAD:master
From .
5fdd090..2fd282c             -> master
$ git push
To <repo>
! [rejected]        feature/Defect-4060-rf -> feature/Defect-4060-rf (non-fast-forward)
error: failed to push some refs to '<repo>'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
$ git fetch origin master:master
From https://webapp-entw.mlp.de/fisheye/git/xbg-pa-adminbox
! [rejected]        master     -> master  (non-fast-forward)
$ git fetch . origin/master:master
From .
! [rejected]        origin/master -> master  (non-fast-forward)
$ git fetch -f . origin/master:master
From .
+ 2fd282c...5fdd090 origin/master -> master  (forced update)
$ git fetch origin master:master
$ git fetch . HEAD:master
From .
5fdd090..2fd282c             -> master
$ git push origin master
```
