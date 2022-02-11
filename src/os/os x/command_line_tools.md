Update them from Software Update in System Preferences or run:

```
softwareupdate --all --install --force
```

If that doesn't show you any updates, run:

```
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install
```

Alternatively, manually download them from:

https://developer.apple.com/download/all/.

You should download the Command Line Tools for Xcode 13.2.1.
