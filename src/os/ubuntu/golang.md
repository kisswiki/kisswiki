```bash
$ sudo apt install golang-go
```

Add to ~/.bashrc:

```bash
export GOPATH=$HOME/go
export PATH=${GOPATH//://bin:}/bin:$PATH
```

- https://github.com/golang/go/wiki/Ubuntu
- https://github.com/golang/go/wiki/GOPATH
