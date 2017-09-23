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

https://news.ycombinator.com/item?id=15316175
