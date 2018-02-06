90% of Rust's draw to me is that the type system will give me a proper fight by default, instead of C++'s constant uphill battle of researching and opting into everything under the sun, filtering out the false positives, and then fixing the latent and not so latent problems uncovered by such efforts.

I haven't been nearly as lucky as you when it comes to avoiding memory errors (and debugging them). Large very active multi-team projects with years to decades of version history behind them results in a huge haystack. Individual memory or threading bugs can eat weeks or more, and with that many committers - I think there's some kind of quadratic or worse time sink in there. Memory safe languages fix some of that, and are massive productivity boosts as a result, by either preventing or making shallow such bugs.

To me it's not that Rust's borrow checker sounds like some good idea on paper, or just for security. To me, Rust's borrow checker is merely a unified, consistent, standard, and enabled by default implementation of much of what I'd been hacking together through the haphazard use of extensions, static analysis, runtime tools, and disabled by default annotations in C++ - since before I even knew what Rust was - with the specific aims of boosting my productivity and reducing my stress. The security is a nice bonus too.

I've "replaced" C++ with C# in a lot of cases. Rust is threatening to replace most of the remainder (except for existing projects which need to be maintained and don't make sense to rewrite.)

https://news.ycombinator.com/item?id=15051325
