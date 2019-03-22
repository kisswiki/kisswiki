- onClick https://groups.google.com/forum/#!topic/elm-discuss/Q6mTrF4T7EU

## typed arrays

folkertdev   [Mar 19th at 9:59 PM]
I've just published elm-tiny-inflate https://package.elm-lang.org/packages/folkertdev/elm-tiny-inflate/latest/, a package that decompresses deflated data (e.g. zip, png and woff). This makes it possible to write decoders for these file formats.

dmy   [2 days ago]
@folkertdev Also I see you have some benchmarks, do you have some numbers to compare with js? How much slower?

folkertdev   [2 days ago]
I haven't compared to JS. I'd assume it is quite a bit slower though: js can work with typed arrays, and it preallocates (and then reuses) a lot of the arrays; we can't do that because of purity
