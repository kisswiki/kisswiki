Depends what you mean by embedded.

Lots of people would consider "embedded" to include a computer in something that is sold as a non-desktop-computer product, even if it's running Linux or Windows on an i7. Or, in other words, anything that is a computer but doesn't look like a computer (cars, medical devices, robots, kiosks, etc).

In this case the article is talking about "firmware". And the big problem I see is that a lot of the prominent examples of that is perceived as critical stuff that's really hard and needs to be locked down. Additionally, a lot of the companies doing large-scale firmware stuff are not software companies and don't pay software engineers as well as software companies, so they have less first-hand ability to understand proposed technologies and have low expectations for software in general.

So for a company that's relying on non-technical heuristics, is wary of software quality, and is investing in a product which requires a lot of up-front capital, proposing a technology which has no "stable" support and only "nightly" support for the target platform is almost certainly going to be a lost cause. Firmware platforms are additionally currently tier 3, which means "they are not built or tested automatically, and may not work. Official builds are not available." This will kill the idea immediately. Although when I asked about it last year I was told that this could be resolved if it was the only blocker to using Rust for a commercial project, most people wouldn't bother to ask.

Rust will be an amazing language for firmware, but these things have to be solved before more companies will feel safe investing in the technology for embedded products.

https://www.reddit.com/r/rust/comments/80a3ob/should_you_rust_in_embedded_yet/duuerky/