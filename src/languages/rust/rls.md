Follow the instructions on https://github.com/rust-lang-nursery/rls

If it works you can install the extension permanently to vscode so you don't have to start vscode in debug mode https://github.com/jonathandturner/rls_vscode

Instead of using vsce to build package you can symlink it:

`ln -s ${HOME}/git/rust/rls_vscode/ ${HOME}/.vscode/extensions/rls_vscode`

http://asquera.de/blog/2017-03-03/setting-up-a-rust-devenv/

## vscode setting window.openFoldersInNewWindow can't be on

https://github.com/rust-lang-nursery/rls/pull/296

## RUST_SRC_PATH environment variable must be set to point to the src directory of a rust checkout

I needed to install src for specific rust version, e.g.

rustup component add rust-src --toolchain nightly-2017-04-16-x86_64-pc-windows-msvc

and then I got ~/.rustup/toolchains/nightly-2017-04-16-x86_64-pc-windows-msvc/lib/rustlib/src sources.

https://github.com/saviorisdead/RustyCode/issues/204#issuecomment-299710562

## problems

https://news.ycombinator.com/item?id=15048424

## type inference

> This is more of a missing feature, but type inference is a huge part of Rust, and it's often difficult to know what type the type inference engine has chosen for parts of your code. There's no way to find out using RLS in VSCode that I've seen, or go to the definition of inferred types, etc.

VS Code has a 'code lens' feature that allows extensions to display annotations above each lines of code - you can see it in action if you install e.g. the Git Blame extension.
Some language plugins use that feature to display inferred types; the Rust plugin could do the same.

https://news.ycombinator.com/item?id=15050464


## problem with vector completions

I can't get any dot-completions

It's not an issue with vec! - the same problem occurs if I use Vector::new and push. It seems to be a problem with the vector itself, or perhaps indexing.

I suspect this is an issue with Racer, the tool that provides the completion information.

https://news.ycombinator.com/item?id=15050762

I'm not sure when you last tried, but IntelliJ Rust handles completing methods on a variable initialized with vec![] for me just fine.

https://news.ycombinator.com/item?id=15054268

## vs racer

Unfortunately Cargo check + Racer will still be way more productive than RLS for quite a while. RLS can only do 1 thing at a time, so while it's doing typechecking, you get no completions or auto formatting and vice versa. With any larger project RLS is about 10x slower than pure racer + cargo check. Racer immediately has the auto completions, while RLS takes about 2-3 seconds for them to show up. Cargo check takes about 1-2 seconds to check your code while RLS takes more than 10 seconds, which then get super unproductive as no auto formatting or auto completions are available during that time. And all that is for a 15k LOC project, which isn't even all too large, and yet RLS is super unusable.

https://www.reddit.com/r/programming/comments/6sviwf/what_the_rust_language_server_can_do/dlgxa7m/
