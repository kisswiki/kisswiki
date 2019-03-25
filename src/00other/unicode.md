- https://apps.timwhitlock.info/unicode/inspect?s=%F0%9F%92%9B%F0%9F%92%99%F0%9F%92%9C%F0%9F%92%9A%E2%9D%A4%EF%B8%8F#block-U1F300
- http://www.unicode.org/charts/PDF/U1F300.pdf
- https://emojipedia.org/

##

>Surrogates are actual codepoints, the range U+D800 to U+DFFF is reserved exclusively for that use:
Yes ... and no. In a UTF-16-encoded string, surrogates lose their status of code point (which they would have in a UTF-32- or a UCS-2-encoded string) and are mere code units instead.

The fact that the natural number they represent is reserved as code points is only a trick to band-aid systems that are trying to interpret buffers as UCS-2 although they are UTF-16.

>Not really. It's a base codepoint plus some sort of combining/variation selector, not unlike e +‌ ‌́ = é

I am pretty sure the combining marks and all these other things are technically still code points on their own. They're not glyphs, though: a glyph can be represented by multiple code points, as you mentioned one base code point (or two as in the flags) and potential combining marks/selectors/etc.

And then the families are indeed multiple glyphs with ligatures, AFAIU.

https://news.ycombinator.com/item?id=16750750

## UTF-8 vs UTF-16/UCS-2

nextnextstep:

UTF-8 was developed in 1992, and was the standard system encoding for Plan 9 in ... 1992. All the advantages they cite for UTF-8 were well known. It was always self-synchronizing and validating, because that's how it was designed. It always had better memory density, and memory was much more scarce back then.


chriswaco:

UTF-16 made perfect sense before unicode expanded beyond 16-bits.


Catfish_Man:

Certainly UTF-16 was a choice that made sense to a wide variety of people, considering Java, Javascript, Windows, and NeXT all picked it.

nextnextstep:

FoundationKit (including NSString) was first released to the public in 1994. UTF-8 was created in 1992 (with support for 6-byte forms = 2 billion codepoints), and UTF-16 not until 1996.

These systems you list all picked UCS-2, not UTF-16. We all knew that wouldn't last. UTF-16 was always a hack on UCS-2.


chriswaco:

I'm surprised they didn't go with UTF-32. While it would consume more memory, it supports faster access to arbitrary offsets and easier string manipulations. Maybe combining character and modifier support made arbitrary access less helpful.

nextnextstep:

It would consume a lot more memory, to the point where many optimizations (like smol strings) would be infeasible. You'd get only 3 characters on 64-bit rather than 15 (and maybe 1 on 32-bit?), which makes them essentially useless. And using 4x as much memory tends to make everything slower, since you're constantly blowing out your cache, and using indirection to get to all the data (mostly 0's) that can't fit in any registers.

As you say, the way Unicode is designed, there really isn't a great use case for random access. That's a remnant of how C stored English-character strings as byte arrays, and in the modern world, pretending everything is a byte array will result in a program that's somewhere between "inefficient" and "wrong".

Everybody loves to pull out toy problems like "reverse a string" but they were only ever popular because they were easy to implement in C (and most other data structure tasks were definitely not). I have never in my life seen a program that actually needed to reverse a string.

https://www.reddit.com/r/swift/comments/b3r5q5/swift_5_switches_the_preferred_encoding_of/
