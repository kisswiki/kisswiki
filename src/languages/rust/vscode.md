## rustup not found but available in terminal in Windows 10

`Start > search for "Edit environment variables for account" > Edit "Path" > Add "%USERPROFILE%\.cargo\bin"`

- https://stackoverflow.com/questions/60816886/how-do-i-solve-couldnt-start-client-rust-language-server-with-the-rust-vs-cod/66394305#66394305

## rust-analyzer

Uninstall rust extension, install rust-analyzer extension.

Install https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens

- https://users.rust-lang.org/t/rust-analyzer-wont-work/43712/5
- https://www.reddit.com/r/rust/comments/lkd50a/rustanalyzer_changelog_64/gnj7tzg/

## vscode-rust

The extension is continuation of RustyCode (an extension for Visual Studio Code for Rust language). https://github.com/editor-rs/vscode-rust


After installing plugin and restarting window, answer `yes` to installing source.

It should discover correct version of sources https://github.com/phildawes/racer/pull/598

http://asquera.de/blog/2017-03-03/setting-up-a-rust-devenv/


After installing that click at the bottom of vscode "Additional...". It will run:

`cargo install racer && cargo install rustsym` in the terminal.



## Rustfmt on save

"editor.formatOnSave": true,

For non-legacy: I run `Ctrl+Shitf+P > Format Document`, asked to install formatter, chosen rls, works.

- https://github.com/editor-rs/vscode-rust/blob/master/doc/format.md
- https://github.com/editor-rs/vscode-rust/blob/master/doc/legacy_mode/rustfmt_configuration.md

## Debug

http://asquera.de/blog/2017-03-03/setting-up-a-rust-devenv/

## Rust Language Server (rls)

read `rls.md`

## Run cargo build

>I will wait until the switch is final to provide support for whenActive

https://github.com/Microsoft/vscode/issues/6578#issuecomment-274607108
