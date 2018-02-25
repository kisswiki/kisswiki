## update

```
brew update
brew outdated
brew upgrade
brew upgrade <formula>
brew cleanup -n
brew cleanup
brew cleanup <formula>
```

https://docs.brew.sh/FAQ


## node & yarn

```
brew install node
brew install yarn
```

- https://nodejs.org/en/download/package-manager/#macos

## search for packages to install

`brew search <name>`

https://apple.stackexchange.com/questions/33354/how-to-know-what-packages-are-available-with-homebrew

## list files for package

`brew ls --verbose <package>`

https://stackoverflow.com/questions/19010784/list-all-files-in-a-homebrew-package

## Permission denied @ dir_s_mkdir - /usr/local/Frameworks

Uninstall Homebrew:

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"`

Then re-install it:

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"