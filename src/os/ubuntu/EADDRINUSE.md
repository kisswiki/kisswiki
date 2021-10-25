> Address already in use

Add function to ~/.bashrc:

```bash
function killTcpListen () {
  kill -9 $(lsof -sTCP:LISTEN -i:$1 -t)
}
```

Pull changes: `source ~/.bashrc`

And use it: `killTcpListen 3000`

- https://stackoverflow.com/questions/4075287/node-express-eaddrinuse-address-already-in-use-kill-server/46276685#46276685
- https://stackoverflow.com/questions/11583562/how-to-kill-a-process-running-on-particular-port-in-linux/19060124#19060124

## osx

`source ~/.bash_profile`

```
function killTcpListen () {
  kill -QUIT $(sudo lsof -sTCP:LISTEN -t -i tcp:$1)
}
```

- https://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac/49587641#49587641
- https://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac/37998980#37998980
