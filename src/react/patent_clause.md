1. clause is limited to patent lawsuits.
2. You keep the protection given by grant if FB sues you first.
3. Facebook needs to find a patent that they own that relates to React to sue you for using React.
4. If you sue Facebook, it's only the patent grant that terminates. Without that you still have the BSD licence to use React under.

- https://www.reddit.com/r/reactjs/comments/4ybhzw/
- http://patents.justia.com/company/facebook?list=patents
- https://github.com/search?q=org%3Afacebook+filename%3APATENTS&type=Code

##

Never heard Facebook answer: why didn't they just follow Red Hat's model and make a "Patent Promise"[1]?
Then accumulation of software patents would help deter meritless litigation while staying out of the way of FLOSS developers getting their work done.
https://www.redhat.com/en/about/patent-promise

Or what about Google's Golang PATENTS clause?
https://golang.org/PATENTS

the one in Go basically says if you sue google for any Go related patents then they revoke the license. that patent retaliation clause is nothing different from the one used in Apache Licence Version 2. the one in react says they revoke your license when you sue facebook for any patent related matter.
reply

Aslo called a "weak patent retaliation clause" vs React's (current) strong patent retaliation clause. I found the explanations in [1] to be very helpful to understand patent clauses. https://medium.com/@dwalsh.sdlr/react-facebook-and-the-revokable-patent-license-why-its-a-paper-25c40c50b562

Red Hat holds patents but promises not to enforce them. This means anyone can use the IP without worrying about being sued for infringement. No one else can claim they own the IP because Red Hat already owns it. They also have a clause saying that if Red Hat sells the IP, the buyer needs to uphold the same promise.

I am also not a lawyer. But I don't think a "promise" is a legally enforceable concept.

I'm not a lawyer either, but the estoppel doctrine should make it enforceable.

3rd year law student (among other things!) here. As you've mentioned, the doctrine of promissory estoppel should make this enforceable in law.

Red Hat: You can use our patents if we can use your software.

Facebook: You can use our software if we can use your patents.

That's my severely over-simplified interpretation. The most significant difference is that Red Hat's promise extends to FOSS in general, though apparently not proprietary software. Facebook's license applies only to specific Facebook FOSS code, but it can be used in proprietary software.

Facebook can sue you first.

Sure, but you won't loose the patent grant.

>if Facebook [...] files a lawsuit alleging patent infringement against you
>in the first instance, and you respond by filing a patent infringement
>counterclaim in that lawsuit against that party that is unrelated to the
>Software, the license granted hereunder will not terminate


I'm astounded how everyone things MIT == Apache2. MIT doesn't protect you from patent litigation.
This is a backwards move. Facebook is very good at PR painting this as a win for users.
See http://en.swpat.org/wiki/Patent_clauses_in_software_licences#Apache_License_2.0
an explanation https://opensource.stackexchange.com/a/1890

Which license is PyTorch?

PyTorch itself isnt, But the multi-GPU version requires Gloo which is BSD+PATENTS
https://github.com/facebookincubator/gloo/blob/master/PATENTS

Facebook's patent clause disarms all their opponents, but leaves them free to attack. It's actually a wildly aggressive, offensive weapon, surprisingly - just like how nuclear missile defense is one of the more provocative technologies out there that possibly makes nuclear conflicts more probably.
That's why it's totally unpalatable, at least at the big companies.

The only legitimate criticism I've heard of the FB patent grant is that FB could intentionally infringe your patents and the you couldn't sue them for infringement without losing your React patent grant. It's such a narrow case though that I seriously doubt it's a legitimate concern for most of the people complaining about it.

Furthermore, suppose you're some company like, say, IBM which figured out some way to say, safely double the energy density and recharge cycles of Lithium Ion batteries, which you have patented. Let's also assume that you are shipping some critical problem which is dependent on React. Facebook could now freely use your patented idea, and violating it left, right, and center, and if you try to sue them for violating that patent, you're completely f*cked.
So Facebook's idea works fine if you believe that Patents as a Thing are bad (all patents, not just software patents), and should not be asserted under any circumstances, and it's fine for Facebook to arbitrarily violate any patent of any company who has become dependent on React.

https://news.ycombinator.com/item?id=15316175
