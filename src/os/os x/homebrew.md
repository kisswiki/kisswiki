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

## list installed packages

```shell
brew leaves
brew ls --versions $( brew leaves )
```

or if you need handling of optional/recommended dependencies:

```shell
brew ls --versions $( sh ~/bin/brew-root-formulae.sh )
```

~/bin/brew-root-formulae.sh

```shell
#!/bin/sh

brew deps --installed | \
    awk -F'[: ]+' \
    '{
        packages[$1]++
        for (i = 2; i <= NF; i++)
            dependencies[$i]++
    }
    END {
        for (package in packages)
            if (!(package in dependencies))
                print package
    }'
```

https://stackoverflow.com/questions/21758536/homebrew-list-only-installed-top-level-formulas

## Permission denied @ dir_s_mkdir - /usr/local/Frameworks

Uninstall Homebrew:

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"`

Then re-install it:

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"