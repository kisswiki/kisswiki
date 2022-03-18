https://docs.brew.sh/Installation

## uninstall homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
#...
The following possible Homebrew files were not deleted:
/usr/local/.com.apple.installer.keep
/usr/local/apache-tomcat-7.0.29/
/usr/local/bin/
/usr/local/etc/
/usr/local/go/
/usr/local/include/
/usr/local/info/
/usr/local/lib/
/usr/local/libexec/
/usr/local/man/
/usr/local/n/
/usr/local/rvm/
/usr/local/sbin/
/usr/local/share/
/usr/local/texlive/
```

https://superuser.com/questions/203707/how-to-uninstall-homebrew#295772

## update

```
brew update
brew outdated
# below didn't upgraded visual-studio-code. I needed to do `brew upgrade visual-studio-code`.
brew upgrade
brew upgrade <formula>
brew cleanup -n
brew cleanup
brew cleanup <formula>
```

https://docs.brew.sh/FAQ

## update cask

`brew upgrade --cask`

However this will not update casks that do not have versioning information (version :latest) or applications that have a built-in upgrade mechanism (auto_updates true). To reinstall these casks (and consequently upgrade them if upgrades are available), run the upgrade command with the --greedy flag like this:

```shell
brew cask outdated --greedy --verbose
brew upgrade --cask --greedy
```

- https://stackoverflow.com/questions/31968664/upgrade-all-the-casks-installed-via-homebrew-cask

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

`brew ls --verbose <package>` or `brew ls -v <package>`

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

## cask search

- https://caskroom.github.io/search

`brew cask search | rg mono`

## brew update - error with ruby

https://apple.stackexchange.com/questions/153790/how-to-fix-brew-after-osx-upgrade-to-yosemite
