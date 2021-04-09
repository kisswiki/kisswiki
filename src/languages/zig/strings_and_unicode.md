- https://zigforum.org/t/strings-in-zig-what-do-i-miss/188/6
  - The “mem” functions for treating strings as “just bytes” https://ziglang.org/documentation/master/std/#std;mem
    - concat()
    - endsWith()
    - eql()
    - indexOfPos()
    - join()
    - …and many more.
    - mem.SplitIterator
    - mem.TokenIterator
  - It looks like ASCII operations are mostly for case changes and classifying individual characters https://ziglang.org/documentation/master/std/#std;ascii
    - allocLowerString()
    - allocUpperString()
    - isAlpha()
    - isDigit()
    - etc…
  - The Unicode operations are specific to encoding and decoding 21-byte codepoints and UTF-8 and UTF-16 encoding https://ziglang.org/documentation/master/std/#std;unicode
    - utf8CodepointSequenceLength()
    - utf8Decode()
    - utf8Encode()
- https://zigforum.org/t/strings-in-zig-what-do-i-miss/188/9
  - `std.meta.trait.isZigString()` tries to capture all allowed cases for [the standard library’s format()](https://ziglang.org/documentation/master/std/#std;fmt.format) `"{s}"` formatting option
- I [forked zunicode](https://github.com/jecolon/zunicode/tree/updates-uc13-zig08) to update it to Unicode 13 and Zig 0.8. All tests are passing. Made a PR so let’s see if I get a response. https://zigforum.org/t/strings-in-zig-what-do-i-miss/188/15

##

From my perspective, in line with what @dude_the_builder said, with unicode you either go big or go home and I don’t think it would make sense for Zig to have a builtin type that tries to be “unicode”.

It’s not just codepoints and normalization, but also grapheme clusters and all the related operations, and on top of that such type would require to decode everything beforehand and trick programmers that are not used handling this stuff into very inefficient paths.

Strings should be byte sequences unless they need to be something else, and in those cases you want full support, maybe even with support for different unicode versions depending on the context.

When writing bork I was faced with all these problems and for now the best tool I’ve found to know how to properly implement unicode-aware word wrapping is to rely on [GitHub - JuliaStrings/utf8proc: a clean C library for processing UTF-8 Unicode data](https://github.com/JuliaStrings/utf8proc), which I hope to start using as soon as I get back into bork development.

https://zigforum.org/t/strings-in-zig-what-do-i-miss/188/13
