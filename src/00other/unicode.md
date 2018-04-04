> Surrogates are actual codepoints, the range U+D800 to U+DFFF is reserved exclusively for that use:
Yes ... and no. In a UTF-16-encoded string, surrogates lose their status of code point (which they would have in a UTF-32- or a UCS-2-encoded string) and are mere code units instead.

The fact that the natural number they represent is reserved as code points is only a trick to band-aid systems that are trying to interpret buffers as UCS-2 although they are UTF-16.

> Not really. It's a base codepoint plus some sort of combining/variation selector, not unlike e +‌ ‌́ = é

I am pretty sure the combining marks and all these other things are technically still code points on their own. They're not glyphs, though: a glyph can be represented by multiple code points, as you mentioned one base code point (or two as in the flags) and potential combining marks/selectors/etc.

And then the families are indeed multiple glyphs with ligatures, AFAIU.

https://news.ycombinator.com/item?id=16750750