`brew doctor && brew install python`

https://stackoverflow.com/questions/17271319/how-do-i-install-pip-on-macos-or-os-x

## python missing

```bash
% brew info python
...
Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /opt/homebrew/opt/python@3.9/libexec/bin
% echo 'export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH' >> ~/.zprofile
% . ~/.zprofile
```

https://stackoverflow.com/questions/18419500/how-to-make-mac-os-use-the-python-installed-by-homebrew

## python3

`brew doctor && brew install python`

- http://docs.python-guide.org/en/latest/starting/install3/osx/
- http://blog.manbolo.com/2013/02/04/how-to-install-python-3-and-pydev-on-osx
