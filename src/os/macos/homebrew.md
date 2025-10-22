<https://docs.brew.sh/Installation>

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

<https://superuser.com/questions/203707/how-to-uninstall-homebrew#295772>

## update

```
brew update
brew outdated
# below didn't upgraded visual-studio-code. I needed to do `brew upgrade visual-studio-code`.
brew upgrade
brew upgrade --cask --greedy
#brew upgrade <formula>
brew cleanup -n
brew cleanup
brew cleanup <formula>
```

<https://docs.brew.sh/FAQ>

## update cask

`brew upgrade --cask`

However this will not update casks that do not have versioning information (version :latest) or applications that have a built-in upgrade mechanism (auto_updates true). To reinstall these casks (and consequently upgrade them if upgrades are available), run the upgrade command with the --greedy flag like this:

```shell
brew outdated --cask --verbose
brew outdated --cask --verbose --greedy
brew upgrade --cask --greedy
```

- <https://stackoverflow.com/questions/31968664/upgrade-all-the-casks-installed-via-homebrew-cask>

## node & yarn

```
brew install node
brew install yarn
```

- <https://nodejs.org/en/download/package-manager/#macos>

## search for packages to install

`brew search <name>`

<https://apple.stackexchange.com/questions/33354/how-to-know-what-packages-are-available-with-homebrew>

## list files for package

`brew ls --verbose <package>` or `brew ls -v <package>`

<https://stackoverflow.com/questions/19010784/list-all-files-in-a-homebrew-package>

## list packages installed manually

```shell
brew ls --versions $( {brew leaves --installed-on-request & brew list --cask -1;} | sort | uniq )
```

Also to see which packages are installed by both cask and not cask

```shell
{brew leaves --installed-on-request & brew list --cask -1;} | sort | uniq -d
```

- <https://apple.stackexchange.com/questions/101090/list-of-all-packages-installed-using-homebrew/448627#448627>

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

<https://stackoverflow.com/questions/21758536/homebrew-list-only-installed-top-level-formulas>

## Permission denied @ dir_s_mkdir - /usr/local/Frameworks

Uninstall Homebrew:

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"`

Then re-install it:

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

/usr/bin/ruby -e "$(curl -fsSL <https://raw.githubusercontent.com/Homebrew/install/master/install>)"

## cask search

- <https://caskroom.github.io/search>

`brew cask search | rg mono`

## brew update - error with ruby

<https://apple.stackexchange.com/questions/153790/how-to-fix-brew-after-osx-upgrade-to-yosemite>

## link and unlink for neovim --HEAD

```shell
% brew info neovim
% brew unlink neovim
% brew install neovim --HEAD
% brew link neovim --HEAD
% brew unlink neovim
% brew link neovim
% brew link --dry-run neovim --HEAD
```

- <https://stackoverflow.com/questions/21175235/what-does-linking-unlinking-with-homebrew-mean>
- <https://stackoverflow.com/questions/64833482/do-you-need-to-run-brew-unlink-brew-link-before-after-brew-switch>
- <https://docs.brew.sh/Tips-N%27-Tricks#activate-a-previously-installed-version-of-a-formula>
- <https://stackoverflow.com/questions/13477363/how-can-i-brew-link-a-specific-version>

## wireshark cannot uninstall

`~/bin/brew_reinstall_wireshark.sh`

```
Error: Failure while executing; `/usr/bin/sudo -u root -E -- /usr/sbin/installer -pkg /opt/homebrew/Caskroom/wireshark/4.2.2/Uninstall\ ChmodBPF.pkg -target /` exited with 1. Here's the output:
installer: Error - the package path specified was invalid: '/opt/homebrew/Caskroom/wireshark/4.2.2/Uninstall ChmodBPF.pkg'.
```

<https://github.com/orgs/Homebrew/discussions/4190#discussioncomment-8075275>

## background-music cannot uninstall

```shell
rm -rf $(brew --prefix)/Caskroom/background-music
brew reinstall --cask background-music
```

<https://github.com/Homebrew/homebrew-cask/issues/171570#issuecomment-2065573181>

## error: redefinition of module 'SwiftBridging'

`sudo rm -rf /Library/Developer/CommandLineTools/`

download Command_Line_Tools_for_Xcode_26.dmg from <https://developer.apple.com/download/>

<https://github.com/orgs/Homebrew/discussions/5723#discussioncomment-11185411>

or maybe just update Mac OS will be enough?
