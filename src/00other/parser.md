## Understood LR

Those three helped me:

- http://blog.reverberate.org/2013/07/ll-and-lr-parsing-demystified.html
- [Parse Stack (CSC 4330 - PLC) - Shift Reduce Parser](https://youtu.be/1_qjmZXFaNw)
- https://www.geeksforgeeks.org/postfix-prefix-conversion/

With LR or LL we change infix to postfix or prefix graph traversal.

With LR we get Reverse Polish Notation so we can process it using just stack.

Those structures above input are so we have correct ordering.

So that we change `id => F => T => E`.

Though in this article about "parsing demystified" it's written:

>Knowing the parsing context makes it possible to extend grammars with rich regex-like operators like repetition, alternation anywhere (not just at the top level), etc. Basically each rule can form a DFA. This is possible with top-down parsing because the parser knows what rule it is in and can step through that rule’s state machine as it is parsing it. I don’t believe this is possible with bottom-up parsing

But LALRPOP is actually LR(1) parser and supports regexes.

## Links

- http://blog.reverberate.org/2013/07/ll-and-lr-parsing-demystified.html
  - https://www.reddit.com/r/compsci/comments/1iv68v/josh_haberman_ll_and_lr_parsing_demystified/
  - [Parse Stack (CSC 4330 - PLC) - Shift Reduce Parser](https://youtu.be/1_qjmZXFaNw)
  - https://www.quora.com/Whats-the-difference-between-PEMDAS-and-PEDMAS
  - [Postfix to Prefix Notation using Stack ( Step by Step )](https://youtu.be/u5B995eODQc)
  - https://www.geeksforgeeks.org/prefix-postfix-conversion/
  - https://www.geeksforgeeks.org/postfix-prefix-conversion/
  - https://stackoverflow.com/questions/113424/converting-reverse-polish-notation
  - http://www.manojagarwal.co.in/conversion-from-postfix-to-prefix/
  - https://cs.stackexchange.com/questions/11962/parsing-a-string-with-lr-parsing-table
- https://stackoverflow.com/questions/5975741/what-is-the-difference-between-ll-and-lr-parsing
- https://pl.m.wikipedia.org/wiki/Parser_LR
  - https://pl.m.wikipedia.org/wiki/Generowanie_parser%C3%B3w_LR#Konstrukcja_tabeli_parsingu_LR(0)
- https://en.m.wikipedia.org/wiki/Shift-reduce_parser
- http://sites.tufts.edu/comp181/2013/10/06/shift-reduce-parsing-bottom-up-parsing/
- CF G Experimenter includes algorithms for calculating First and Follow sets, canonical collections of LR(1) items, Action and Goto tables, and determining whether a context-free grammar is LL(1) or LR(1) parseable. CFG Experimenter can also animate LL(1) and LR(1) parsing, and allows students to “scrub through” the animation to check their understanding. http://curtclifton.net/cfg-experimenter
- https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec03b.pdf
- https://pl.m.wikipedia.org/wiki/Analiza_wst%C4%99puj%C4%85ca
  -  https://pl.m.wikipedia.org/wiki/Analiza_sk%C5%82adniowa
     - https://pl.m.wikipedia.org/wiki/Metoda_przesuni%C4%99cie-redukcja
       - Ullman JD Kompilatory Reguły metody i narzędzia, 4.5 Analiza wstępująca
- https://stackoverflow.com/questions/5467244/limitations-of-ll-vs-lr-parsers
- https://softwareengineering.stackexchange.com/questions/19541/what-are-the-main-advantages-and-disadvantages-of-ll-and-lr-parsing
- https://www.reddit.com/r/compsci/comments/kgpjv/can_somebody_please_explain_the_difference/
- https://blog.acolyer.org/2017/08/15/writing-parsers-like-it-is-2017/
  - http://spw17.langsec.org/papers/chifflier-parsing-in-2017.pdf
  - https://news.ycombinator.com/item?id=15016061
- [Parsing: a timeline -- V3.1](https://jeffreykegler.github.io/personal/timeline_v3)
  - https://www.reddit.com/r/programming/comments/8ctcut/parsing_a_timeline_hopefully_this_puts_parsing_is/
  - https://tratt.net/laurie/blog/entries/parsing_the_solved_problem_that_isnt.html
- [LR Parser Sample Grammar - YouTube](https://youtu.be/pH27jE-wYvE)
- [LR Parsing: Theory and Practice (Cambridge Studies in Cultural Systems): Nigel P. Chapman: 9780521304139: Amazon.com: Books](https://www.amazon.com/LR-Parsing-Practice-Cambridge-Cultural/dp/052130413X)
- https://stackoverflow.com/questions/34730772/resolving-reduce-reduce-conflicts
- https://eu.udacity.com/course/compilers-theory-and-practice--ud168
- https://www.amazon.com/Introduction-Language-Addison-Wesley-computer-science/dp/0201029553

### LR

1965: Knuth discovers LR

Donald Knuth answers[75] the challenge expressed a few years earlier by Oettinger. Oettinger had hoped for a theory of stack-based parsing to replace "ad hoc invention".[76] Knuth responds with a theory that encompasses all the "tricks"[77] used for efficient parsing up to that time. In an exhilarating and exhausting 39-page paper, Knuth shows that stack-based parsing is equivalent to a new class of grammars. Knuth calls this new class, LR(k). Knuth also provides a parsing algorithm for the LR(k) grammars.

Knuth's new LR parsing algorithm is deterministic, Chomskyan and bottom-up. It might be expected to be "the one to rule them all". Unfortunately, while linear, it is not practical.

LR(k) is actually a set of grammar classes. There is a grammar class for every k, where k is the amount of lookahead used. LR(0) requires no lookahead, but it is not practical because it is too weak to parse most grammars of interest. LR(1) is not practical because of the size of the tables it requires -- well beyond what can be done with 1965 hardware.[78]

As the k in LR(k) grows, LR(k) becomes more impractical rapidly. The size of the tables grows exponentially, while the value of the additional lookahead rapidly diminishes. It is not likely that LR(2) parsing will ever see much actual use, never mind LR(k) for any k greater than 2.

https://jeffreykegler.github.io/personal/timeline_v3

Why LR(1)? After all, aren’t LR(1) generators kind of annoying, what with those weird shift/reduce errors? Well, after teaching compiler design for so many years, I think I may have developed Stockholm syndrome – I kind of enjoy diagnosing and solving shift/reduce failures. ;) But more seriously, I personally like that once I get my grammar working with an LR(1) generator, I know that it is unambiguous and will basically work. When I’ve used PEG generators, I usually find that they work great in the beginning, but once in a while they will just mysteriously fail to parse something, and figuring out why is a horrible pain. This is why with LALRPOP I’ve tried to take the approach of adding tools to make handling shift/reduce errors relatively easy – basically automating the workarounds that one typically has to do by hand.

- http://smallcultfollowing.com/babysteps/blog/2015/09/14/lalrpop/
  - https://www.reddit.com/r/rust/comments/3kx23f/lalrpop_an_lr1_parser_generator_for_rust/

### Lalrpop

- https://github.com/lalrpop/lalrpop
- http://dfockler.github.io/2016/09/15/lalrpop.html
  - https://www.reddit.com/r/rust/comments/52ziax/lets_build_a_replparser_in_rust_lalrpop/
- http://fitzgeraldnick.com/2018/11/15/program-synthesis-is-possible-in-rust.html
- >I imagine the turning point was actually release 0.13; that is when we changed from generating our own regex to using the regex library. I imagine this is what made it slower (but it also vastly improved compilation time). [Performance degredation with noddy csv parser · Issue #269 · lalrpop/lalrpop](https://github.com/lalrpop/lalrpop/issues/269)

### Parsers in Rust

- https://www.reddit.com/r/rust/comments/6w6vak/writing_a_pl_in_rust_lalrpop_or_nom_or/
- [Writing a recursive ascent parser by hand - Abubalay](https://www.abubalay.com/blog/2018/04/08/recursive-ascent)
  - https://www.reddit.com/r/rust/comments/8aswd6/writing_a_recursive_ascent_parser_by_hand_in_rust/
- [Writing a Simple Parser in Rust](https://adriann.github.io/rust_parser.html)
- [Rust Web Assembly - Building a Simple Markdown Parser with Rust's Wasm Bindgen - YouTube](https://www.youtube.com/watch?v=Mj6hTGo0oGc)
- https://mnt.io/2018/08/22/from-rust-to-beyond-the-webassembly-galaxy/
  - https://www.reddit.com/r/programming/comments/99mh2p/using_rust_and_webassembly_to_parse_wordpresss/
  - https://github.com/Hywan/gutenberg-parser-rs
- https://crates.rs/parsing
- https://github.com/maciejhirsz/json-rust
- Create ridiculously fast Lexers https://github.com/maciejhirsz/logos
- https://github.com/dherman/esprit
  - https://www.reddit.com/r/rust/comments/9x7xrg/a_javascript_parser_written_in_rust/
- https://github.com/dherman/esprit
- https://www.reddit.com/r/rust/comments/74acpl/is_lalrpop_suitable_for_a_beginner_who_wants_to/
  - LISP in Rust. Uses LALRPOP. Implements tail-call optimization. https://github.com/tcr/oasis
- https://github.com/Marwes/combine

### ECMAScript/JavaScript tokenizers, lexers, parsers, tools, minifiers, compilers, etc in rust

- https://gist.github.com/pitaj/b32e5d093698b311b793b29c7dab2b88
- https://www.reddit.com/r/rust/comments/9yqufy/javascript_parser_and_ast_visitor_written_in_rust/
  - https://github.com/swc-project/swc
- https://github.com/FreeMasen/RESSA
- https://github.com/evmar/j8t
- https://github.com/ratel-rust/ratel-core
  - https://www.reddit.com/r/rust/comments/a0x9jd/ratel_high_performance_javascript_to_javascript/

### PEG

As stated earlier, unambiguous parsing algorithms such as LL and LR aren't easily usable in grammar composition. More recently, a "rediscovered" parsing approach has gathered a lot of attention: Packrat / PEG parsing (which I henceforth refer to as PEGs). PEGs are different than everything mentioned previously: they have no formal relation to CFGs. The chief reason for this is PEGs ordered choice operator, which removes any possibility for ambiguity in PEGs. PEGs are interesting because, unlike LL and LR, they're closed under composition: in other words, if you have two PEGs and compose them, you have a valid PEG.

Are PEGs the answer to our problems? Alas - at least as things stand - I now doubt it. First, PEGs are rather inexpressive: like LL and LR parsing, PEGs are often frustrating to use in practise. This is, principally, because they don't support left recursion; Alex Warth proposed an approach which adds left recursion but I discovered what appear to be problems with it, though I should note that there is not yet a general consensus on this (and I am collaborating with a colleague to try and reach an understanding of precisely what left recursion in PEGs should mean). Second, while PEGs are always unambiguous, depending on the glue one uses during composition, the ordered choice operator may cause strings that were previously accepted in the individual languages not to be accepted in the combined language - which, to put it mildly, is unlikely to be the desired behaviour.

- https://tratt.net/laurie/blog/entries/parsing_the_solved_problem_that_isnt.html
- a general purpose parser written in Rust with a focus on accessibility, correctness, and performance. uses parsing expression grammars (or PEG) as input https://github.com/pest-parser/pest
- https://stackoverflow.com/questions/5501074/what-are-the-differences-between-pegs-and-cfgs/5501886#5501886

## Cons and Pros of Parser Generators

I’m not a compiler expert, though I have written a couple of parsers, sometimes for some quite complex grammars, ranging from recursive descent hand-written parsers, lex/yacc, Irony parsers (C# parser where the grammer is declared in the language), GoldParser, ANTLR v3 and ANTLR v4. While there are indeed some valid points described in this post, I would like to revisit this with ANTLR v4, as the new version is really able to tackle nicely and efficiently some of your concerns.

1) Context lexer/parser: ANTLR v4 is coming with predicates to modify the grammar or behavior of the lexers and/or parsers based on dynamic contexts. You can even switch the grammar to contextual modes, to accept specifics tokens for part of the grammar at specifics points…etc. There is also the opportunity to develop a “filter” lexer on top of the existing generated lexer in order to generate/modify the flow of the tokens (for example, handle correctly indent grammars like Python)

2) Shift/Reduce and Grammar Conflicts: definitely yes, either with lex/yacc or with ANTLR3, I had some serious fight sometimes to correctly handle a grammar. But ANTLR v4 is just fantastic for this, at it allows to use left recursive grammar (with a very little restriction). Take a look at the v4 ANTLR grammar for Java for example (https://github.com/antlr/grammars-v4/blob/master/java/Java.g4 ), the way to describe an expression is just ridiculously easy. So far, working with ANTLR v4, I have not been hit by anykind of grammar conflicts.

3) Concerning syntax tree, I usually don’t use them directly in the language, as I’m always writing an AST that is independent of the parser. Afaik, ANTLR v4 doesn’t have syntax rewriting capabilities, but the new listener/visitor patterns make things quite easy to build a custom ast.

4) Mixed code: I agree. But again, ANTLR v4 allows to write a grammar almost entirely decoupled from the generated code (look the Java grammar). You can still use custom embedded actions in ANTLR, but they are most of the time not necessary and can be done entirely outside the grammar definition. Predicates in the grammar are usually quite light and they don’t mess up readability of the grammar.

5) Concerning parser context mode, as I said, It is working nicely in ANTLR v4. For source location, I have not experienced much of your problems with most of the parsers I have been using. I think that ANTLR v4 is quite good at hitting the right spot, column wise.

Plus on the things that you don’t mention, and with ANTLR v4 in mind I would say:
– Create a full effective grammar from scratch just takes a few hours for a quite complex language (all languages like C#, Java, Python…etc. are really easy to describe). You are much more productive this way.
– Developing an efficient token lexer is quite a laborious and stupid work, having a parser that creates optimized DFA tables for this tasks greatly simplify this.
– Error recovery is quite impressive in ANTLR v4. Achieving the same level of recovery (automatic token deletion, missing token insertion, continue to match rule list…etc) in a hand-written parser is quite difficult (more particularly with backtracks).
– Developing an efficient hand-written parser is not always as easy as it seems. Particularly when you need to do some backtracks, performance of a recursive descent parsers can be badly screwed-up in this case when this is not correctly handled (and this is absolutely not a simple task). But worst, the code of a recursive descent parsers can become much more difficult to maintain and understand, because of all the grammar ambiguities and performances hacks needed to handle them.

So for all these reasons, if you care about productivity, I strongly encourage developers to use a parser generator like ANTLR v4.

I would still recommend developing some hand-written parsers in some specific cases like:
– For learning how to write a parser :)
– For performance reasons, though, quite often the bottleneck in a parser is the lexer. Naive hand-written lexers will most certainly perform much worse than an efficient generated DFA table lexer.

- https://mortoray.com/2012/07/20/why-i-dont-use-a-parser-generator/
