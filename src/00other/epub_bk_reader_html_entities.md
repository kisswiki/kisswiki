I wanted to read epub in terminal.

I tried to use [bk](https://crates.io/crates/bk) to read [epub file](https://helion.pl/ksiazki/programowanie-w-jezyku-rust-wydajnosc-i-bezpieczenstwo-jim-blandy-jason-orendorff,prrust.htm).

First there was [problem with installing bk](https://github.com/aeosynth/bk/issues/11).

After that bk had [problem](https://github.com/RazrFalcon/roxmltree/issues/12) with reading `&nbsp;` inside xhtml files.

This was [a clue](https://stackoverflow.com/questions/9625602/how-to-display-nbsp-in-xml-output/50240797#50240797) how to do it.

epub file is zip file. So I have used standard `zip` and `unzip` [commands in Ubuntu](https://unix.stackexchange.com/questions/6596/how-do-i-zip-unzip-on-the-unix-command-line/6599#6599).

I tried to [replace with sed](https://stackoverflow.com/questions/27140408/bash-replacing-a-number-with-unicode-character-using-sed/27141959#27141959), on [multiple files](https://stackoverflow.com/questions/10445934/change-multiple-files/30717770#30717770), but then there was entities like `&gt;` that could cause problems inside other html tags.

So I decided to insert `<!ENTITY>` with [perl](https://unix.stackexchange.com/questions/26284/how-can-i-use-sed-to-replace-a-multi-line-string#comment91067_26289).

Those xhtml files were in dos file format so I needed to insert `\r\n` [using perl](https://www.perlmonks.org/?node_id=890769).

This is how to [include](https://stackoverflow.com/questions/6508860/how-do-i-define-html-entity-references-inside-a-valid-xml-document/6509008#6509008) `<!ENTITY>` inside existing `<!DOCTYPE>` .

To get a list of html entities in all files I have used ripgrep `rg -oIN '&[a-z]+;' | sort | uniq`.

To get decimal code point I have used this [page](https://en.m.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references).

To get bk output path of file that there was problem reading, I have modified `src/epub.rs`, decided to use [dbg macro](https://doc.rust-lang.org/std/macro.dbg.html) and added `dbg!("{}", path)` in [line 56](https://github.com/aeosynth/bk/blob/f20adc60a3dcc744a3adbd40ba6aa6917f06d9c7/src/epub.rs#L56).

Then I have used this command to read epub file `cargo run -- file.zip`.

These are generally the commands I have used:

```bash
$ unzip file.epub
$ rg -oIN '&[a-z]+;' | sort | uniq
$ find . -type f | xargs perl -pi -e 's@"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">@"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" [\r\n    <!ENTITY amp "&#38;">\r\n    <!ENTITY gt "&#62;">\r\n    <!ENTITY lt "&#60;">\r\n    <!ENTITY nbsp "&#160;">\r\n]>@g'
$ zip -r file.zip META-INF/ mimetype OEBPS/
$ bk file.zip
```

TIP: You can use the --meta switch to use [bk as a file previewer](https://www.reddit.com/r/commandline/comments/hpmlsm/terminal_epub_reader/fxsrxgr/?utm_source=reddit&utm_medium=web2x&context=3) with eg nnn.

## Install bk

`cargo install bk`

or to install from git

```
cargo uninstall bk
git clone https://github.com/aeosynth/bk
cd bk
cargo install --path .
bk file.epub
bk file.zip
```

<F1> for help

<Tab> for table of Contents

## Other epub readers

- https://crates.io/crates/myne
  - possible to add theme
  - converts to markdown first
- https://github.com/wustho/epy
  - needed to do `sudo apt install python3-pip` https://www.rosehosting.com/blog/how-to-install-pip-on-ubuntu-20-04/
- https://itsfoss.com/best-ebook-readers-linux/
- https://askubuntu.com/questions/14378/what-software-can-i-use-to-view-epub-documents
