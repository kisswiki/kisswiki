The extension is continuation of RustyCode (an extension for Visual Studio Code for Rust language). https://github.com/editor-rs/vscode-rust


After installing plugin and restarting window, answer `yes` to installing source.

It should discover correct version of sources https://github.com/phildawes/racer/pull/598

http://asquera.de/blog/2017-03-03/setting-up-a-rust-devenv/


After installing that click at the bottom of vscode "Additional...". It will run:

`cargo install racer && cargo install rustsym` in the terminal.



## Rustfmt on save

"editor.formatOnSave": true,

https://github.com/editor-rs/vscode-rust/blob/master/doc/legacy_mode/rustfmt_configuration.md

## Debug

http://asquera.de/blog/2017-03-03/setting-up-a-rust-devenv/

## Rust Language Server (rls)

read `rls.md`
