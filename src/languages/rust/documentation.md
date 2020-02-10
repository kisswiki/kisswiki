- https://www.rust-lang.org/learn
- https://www.reddit.com/r/rust/comments/36f94o/how_do_i_read_the_api_docs
- http://www.smilingleo.net/2018/how-to-read-rust-api-doc/
- [Tutorial on how to read the standard library documentation on API docs homepage · Issue #40116 · rust-lang/rust](https://github.com/rust-lang/rust/issues/40116)
  - https://github.com/rust-lang/rust/issues/40116#issuecomment-324451046
    - The purpose of this "document" is to describe how a rustdoc-generated documentation site is organized, how to read through it, and some tips for navigating a doc bundle. https://tonberry.quietmisdreavus.net/rustdoc-guide/tutorial/
  - https://www.reddit.com/r/rust/comments/36f94o/how_do_i_read_the_api_docs
- https://www.reddit.com/r/rust/comments/cq4dip/can_we_get_better_documentation/
  - So I wrote my own Javascript snippet to do just that: https://gist.github.com/BurntSushi/6bc3fd4dd79a0148b385abfa9d865ec4
    - Multiline comments for easy pasting in bookmarklet https://gist.github.com/rofrol/c3a3e6395c74326ce075c7f815823a45
  - There is actually a page with all items (not methods though) that is generated. For example: https://doc.rust-lang.org/nightly/std/all.html. It is linked in the top page "index.html", in the sidebar. You have a button "See all std's items" in there.
  - use separate impl blocks for logical blocks of functions. Then they're separated on the documentation page, and you can attach docs to the impl block itself. [Here's a small example.](https://docs.rs/simple-interner/0.2.0/simple_interner/struct.Interner.html)
  - https://www.reddit.com/r/rust/comments/cq4dip/can_we_get_better_documentation/ewu3htf/
    - https://stevedonovan.github.io/rust-gentle-intro/5-stdlib-containers.html#reading-the-documentation
- I checked the str documentation but i couldnt find anything about `r#""#` style and what it is for 
  - https://doc.rust-lang.org/book/appendix-02-operators.html is where to go in cases like these
- https://doc.rust-lang.org/stable/std/index.html#how-to-read-this-documentation
- [Crawl doc.rust-lang.org for dead links on a regular basis · Issue #54894 · rust-lang/rust](https://github.com/rust-lang/rust/issues/54894)
- https://www.reddit.com/r/rust/comments/5495oy/script_for_redirecting_documentation_to_docsrs/
- https://github.com/ctjhoa/rust-learning
- https://github.com/sn99/rust-practise-questions
- https://cheats.rs/
- dash or zeal for offline search as you type https://www.reddit.com/r/rust/comments/bazy8u/how_do_experienced_rust_developers_read_the/ekg28kv/
- https://github.com/rust-lang/rust/labels/T-rustdoc
- [> universally terrible documentation Wait, what? Rust has what I consider the b... | Hacker News](https://news.ycombinator.com/item?id=16659798)
- https://hoverbear.org/blog/reading-rust-function-signatures/

## epub

- https://nostarch.com/Rust2018
- https://www.jyotirmoy.net/posts/2018-12-01-rust-book.html
  - https://www.reddit.com/r/rust/comments/a22dfx/the_rust_book_in_epub_format_for_offline_reading/
  - some hacky way to get epub (without table of content unfortunatelly) https://github.com/rust-lang/rust/issues/20866#issuecomment-495962961
- [Add building of E-book formats to the toolchain and provide E-book builds · Issue #684 · rust-lang/rust-by-example](https://github.com/rust-lang/rust-by-example/issues/684)
- [Support ebooks and pdf export · Issue #88 · rust-lang/mdBook](https://github.com/rust-lang/mdBook/issues/88)
- [Exporting to PDF and ePub · Issue #815 · rust-lang/mdBook](https://github.com/rust-lang/mdBook/issues/815)
  - [lise-henry/crowbook: Converts books written in Markdown to HTML, LaTeX/PDF and EPUB](https://github.com/lise-henry/crowbook)
  - https://github.com/Michael-F-Bryan/mdbook-epub
- [WIP on ePub by asolove · Pull Request #94 · rust-lang/mdBook](https://github.com/rust-lang/mdBook/pull/94)
- old https://github.com/rust-lang/rust-by-example/issues/684
- [Scripts to generate EPUB. by jmoy · Pull Request #1654 · rust-lang/book](https://github.com/rust-lang/book/pull/1654)
  - I ran [epubcheck](https://github.com/w3c/epubcheck/releases) on your file
- https://github.com/killercup/trpl-ebook
- Gitbook supports export to ebooks and pdfs via calibre [Support ebooks and pdf export · Issue #88 · rust-lang/mdBook](https://github.com/rust-lang/mdBook/issues/88)
  - We use it in Russian translation of TRPL and we've come along several problems with EPUB https://github.com/rust-lang/mdBook/issues/88#issuecomment-171068151
- Especially be selective about which impls are visible in rustdoc -- all the ones that users would need for using the crate fully, but no others. In the following code the rustdoc of `PublicError` by default would show the `From<PrivateError>` impl. We choose to hide it with `#[doc(hidden)]` because users can never have a `PrivateError` in their code so this impl would never be relevant to them. https://rust-lang.github.io/api-guidelines/documentation.html#rustdoc-does-not-show-unhelpful-implementation-details-c-hidden

## rustup doc

```bash
$ rustup doc 
$ rustup doc --book
$ rustup doc --core
$ rustup doc --reference
$ rustup doc --toolchain nightly --book
$ rustup doc --rust-by-example
$ rustup doc --nomicon
$ rustup doc --help
```

https://doc.rust-lang.org/rustdoc/
