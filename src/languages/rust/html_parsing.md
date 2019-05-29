- https://github.com/servo/html5ever
  - https://medium.com/@arpith/parsing-html-in-rust-5f2fe0efcd5a
- https://github.com/programble/scraper
  - https://cmcenroe.me/scraper/scraper/
- https://github.com/notriddle/ammonia
- https://github.com/KiChjang/dissolve
- https://crates.io/crates/kuchiki
  - "recommend using Kuchiki instead. It has more features (for tree traversal, CSS Selector matching, …) including optional Hyper support." http://stackoverflow.com/questions/35654525/parsing-html-page-content-in-a-stream-with-hyper-and-html5ever
  - https://www.reddit.com/r/rust/comments/3iyj3q/i_made_a_dead_simple_urban_dictionary_client_with/
    - (feat) select over kuchiki https://github.com/sunng87/urdict/commit/fdcc9913c14a4336a5c72e24ffcaa4f4fcb09edd
- https://crates.io/crates/select
  - http://stackoverflow.com/questions/35376961/html-parsing-in-rust
- https://crates.io/crates/soup

## kuchiki

>If you don’t already have a tree data structure, consider using Kuchiki itself https://github.com/xiangjt/MyPlayer/blob/6d7a2c7912a4e1bf90aa0c4253b803db98473956/servo/components/selectors/README.md

### code examples

- https://github.com/search?l=Rust&o=desc&q=kuchiki&s=indexed&type=Code
- https://users.rust-lang.org/t/get-tag-name-with-kuchiki-html5ever
- with custom errors https://github.com/fenhl/lore-seeker-discord/blob/5525b7d380ecd21b688773f96f24e7b41a457638/src/main.rs#L577
- with `and_then` https://github.com/eagletmt/idolmap/blob/5000be3fb60f7cb5acbbb5c107d6047433ddbafd/src/aikatsu.rs#L98
- https://github.com/iovxw/jandan_pic_bot/blob/5384dcfd5545920f71a57064f618bb4f67ed07a3/src/spider.rs#L159
- https://stackoverflow.com/questions/56329121/how-to-get-only-text-node-with-kuchiki
- https://github.com/iovxw/jandan_pic_bot
- https://github.com/upsuper/bgmrank
- https://github.com/notriddle/more-interesting/blob/0a078a06bcab5ef45265cfeb04482e5645d48f37/src/extract_excerpt.rs
- https://github.com/mgdm/htmlq/blob/ba59e244090692fb2cfbdb5cbbe95b96011ab0af/src/pretty_print.rs
- https://github.com/fenhl/lore-seeker-discord/blob/5525b7d380ecd21b688773f96f24e7b41a457638/src/main.rs#L577
- https://github.com/eagletmt/idolmap/blob/5000be3fb60f7cb5acbbb5c107d6047433ddbafd/src/aikatsu.rs#L98
- https://github.com/bltavares/artichoke/blob/6c5a22edfd6a1efccdc71dded7a015c12f09d2ff/src/lib.rs#L15
- https://github.com/andreastt/htmlgrep/blob/fc33be080b12ffcf4aa63ce3728344558245246a/grep.rs#L48

## kuchiki vs select

select looks simpler in use than kuchiki.

Example of migration from kuchiki to select https://github.com/sunng87/urdict/commit/fdcc9913c14a4336a5c72e24ffcaa4f4fcb09edd#diff-3390e2e873ae6f1a03e0577dc5036b24R34

But with kuchiki you can use css selectors.

Kuchiki uses newer html5ever atm: 0.22 vs 0.23.

select is downloaded more.

Latest version of select is 0.4.2 from 2017-07-13.

Latest version of kuchki is 0.7.3 from 2019-05-05.

## html5ever

- http://lexborisov.github.io/benchmark-html-persers/
  - https://www.reddit.com/r/rust/comments/5ich5l/html5ever_is_it_faster_than_nokogiri/
  - [html5ever is much slower than MyHTML · Issue #286 · servo/html5ever](https://github.com/servo/html5ever/issues/286)
- https://medium.com/@arpith/parsing-html-in-rust-5f2fe0efcd5a
- https://gist.github.com/sguzman/55a7172a80e83af3a390e9637101efb8
