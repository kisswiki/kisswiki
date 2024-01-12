## examples of jsoup

- you need `Jsoup/parse` for file, no need when using `Jsoup/connect` https://github.com/fmw/vix/blob/112a45d6e376f099ad0a3f5bff9cc07511f2ff5e/src/clj/vix/lucene.clj#L104
- slack bot [link](https://github.com/yetibot/yetibot/blob/d1fb936dd660c7b18cc4dbe89c4c30cbf216bd84/src/yetibot/models/jsoup.clj)
- `remove nil?` https://github.com/yetibot/yetibot/blob/d1fb936dd660c7b18cc4dbe89c4c30cbf216bd84/src/yetibot/commands/scrape.clj#L8C4-L8C15
- Distills the text value from an HTML string, followed by the values of any alt and title attributes of <img/> tags separated by newlines. https://github.com/fmw/vix/blob/112a45d6e376f099ad0a3f5bff9cc07511f2ff5e/src/clj/vix/lucene.clj#L99
- https://github.com/yetibot/yetibot/blob/d1fb936dd660c7b18cc4dbe89c4c30cbf216bd84/src/yetibot/models/jsoup.clj
- old but nice https://github.com/mfornos/clojure-soup/blob/610e881780b35ce683929d8273d92d7e67e49950/src/jsoup/soup.clj
- checks status == 200 and sets type for body when parsing https://github.com/cljdoc/cljdoc/blob/3895640b7236752da8fa5935992118cda88428b1/src/cljdoc/util/repositories.clj#L63
- return hashmap of attributes, text etc. https://github.com/jaydeesimon/pod-jaydeesimon-jsoup/blob/3f387cdf366cd9cc65e46f2cf3fb6d3017e51dff/src/pod_jaydeesimon_jsoup/core.clj#L44
- another wraper for jsoup https://github.com/ckirkendall/enfocus/blob/54ee5d1ec4c1fd603d4766caac07bfc482f65abb/src/clj/enfocus/macros.clj#L57
- another wraper for jsoup https://github.com/niwinz/cljsoup/blob/4d7465a48b7ae9b99b9b9605d807bfb59864b021/src/cljsoup/util.clj#L1

## tidy

to chceck manually with html

`brew install tidy-html5`

relogin, because there is old tidy on macos.

`tidy -o output.html input.html`

- https://stackoverflow.com/questions/2191989/a-command-line-html-pretty-printer-making-messy-html-readable
