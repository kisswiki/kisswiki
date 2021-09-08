ssokolow

I don't think a BSD+Patent license that's compatible with the GPLv2 is possible because the patent-related requirements, being not present in the GPLv2, would count as additional restrictions and thus inherently GPLv2-incompatible.

The LLVM exception is sort of a grey area since it's effectively saying "if courts deem that the patent rules are incompatible with the GPLv2, then you may ignore them when redistributing this code as part of a larger GPLv2 work"... so I have trouble seeing how it's significantly different from just releasing something under "Apache-2.0 OR GPL-2.0" terms.

Hell, the Rust ecosystem uses "Apache-2.0 OR MIT" because, as long as you care about getting your changes upstreamed, it has the same effect, patent-wise.

RahulSundaram

One significant difference between dual licensing and effectively similar licensing exception clauses is that dual licensing can lead to license specific forks. Some projects want to avoid that.

fanbelt

From what I understand, it is compatible because it lacks the "litigate against me and your patent grants are revoked" part. It's fully compatible with section 7 of GPLv2.

I'm not a fan of exception notices. As you pointed out, it effectively turns established licenses into dual licenses or new licenses entirely. I think the Rust ecosystem not pushing for MPL-2.0 was a missed opportunity, but if they still really wanted a permissive license, a BSD-3+Patent license would've been perfect. It's a shame they're stuck in dual-licensing hell now.

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1277599-openssl-3-0-officially-released?p=1277631#post1277631
