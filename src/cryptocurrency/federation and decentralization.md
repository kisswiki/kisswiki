https://news.ycombinator.com/item?id=17172779

EGreg:

As someone who has worked exactly with these issues for the past 7 years, let me share what I have learned.
Just a bit of background. My first startup, https://qbix.com focused on letting each community host its own social network, the same way Wordpress powers blogs. Wordpress powers 30% of the Web so it seemed to be a good business model (and it is). Here is a video explaining that: https://www.youtube.com/watch?v=pZ1O_gmPneI

Last year we started a new company at https://intercoin.org focused on letting each community manage its own currency. We saw that crypto wasn't solving payments as well as WeChat and all the other centralized social networks, so we figured we could fix that. Here is a video explaining that: https://www.youtube.com/watch?v=HIbAz29L-FA

OK, so what have I learned?

First of all, federated is much easier. You simply have one source of truth for each stream of data. It's why it's more prevalent. It also creates "landlords" that you have to trust to host your data, and often their agendas clash with your own. Two months ago I asked why have "communities" at all: https://news.ycombinator.com/item?id=16741913

We are familiar with "landlords" all the time, and their inordinate power within their ecosystems. Consider Amazon's bookstore, Apple's app store, Google's search engine, Facebook's social network, and so on. Federating this would be a very good way of introducing choice, and competition among landlords. You still have to choose a landlord, but now the market can improve everyone's experience through competition.

But it turns out that you can do even better than the market, if you build technology that facilitates collaboration instead of competition. Collaboration has entirely different economics, but ultimately wins in the end. Think about Wikipedia vs Britannica, Linux vs Windows, WebKit vs old IE, and so on.

With Collaboration, the infrastructure gets paid for, but not by extracting rents through closed source software. Instead, you distribute the work across many different actors and none of them own their own little fiefdom but they are all intermixed in a grand tapestry. So why would any actor do anything? One answer is that, if they don't do it, someone else will, so they get a little bit of control / money in the beginning, which fades with time. That part is similar to capitalism. But another part is simply because "the main software is designed to facilitate that mode of collaboration by default".

Also the landlord can be a single point of failure for your data. Consider, for instance, how we store files. Imagine you have no backups in the cloud, and all files are stored in your apartment. Now there's a fire. What happened to all your files? They are gone.

But if your'e going to have backups in the cloud, you want to make sure they are encrypted, and only you can access them. Even better would be to blur the distinction between servers run by "the landlord" (even if it's your own apartment) and "the cloud" and just make protocols that find the best server, have it be in a consensus group, encrypt everything end-to-end, and allow reading and writing by multiple parties.

This is very hard to get right. But any such platform would allow people to build communities on top of a reliable foundation, where only members in the communities would be able to access information, and they could have validators who vouch for what actions (e.g. in a game) are valid. Clients that don't agree with a validator can ignore it, and thus the consensus may sometimes split (e.g. a hard fork), with each client choosing which validator to listen to.

This is a strict improvement in terms of resilience and control, removing arbitrary landlord relations, and capable of reducing back to them as a special case. It's just harder to implement.

Consider, for example, why we have domains and DNS. I have files, why do I have to "choose Google Drive" to store my data, and then trust that they will store it, encrypt it, and so on? Why do we have to choose a domain at all? There is a technique called Kademlia, invented in 2002, which was used to power DHTs including BitTorrent and now used in SAFENetwork. SAFENetwork is probably the ultimate example of a benign "landlord" - a network which encrypts and stores your files redundantly, and prevents them being taken down. (Qbix is moving towards the same thing (https://qbix.com/blog) except with dynamic data instead of static files.

https://maidsafe.net/docs/Safe%20Network%20Primer.pdf

I would say the future is:

  End-to-end encryption
  Kademlia (or similar) for routing
  Consensus groups for each data stream
  Churn (backend groups constantly change to prevent collusion)
  Proof of resource (every so often, within groups)
On top of this, people can build apps that can spread phone-to-phone, taking advantage of a dynamic data layer that lets anyone start their own "stream" and not worry about the arbitrary decision of "which domain hosts it". The participants get determine the rules of each stream (democracy? dictatorship?) and the landlord is just someone they give access to as well. A search engine would just be a guest in many streams.
Do I think Federated systems and market mechanisms are great? Yes. Do I think Distributed systems acting as totally benign landlords are better? Oh yes!

They are more resilient, too. For a crypto-currency, that is a must, or you can have this: https://www.youtube.com/watch?v=E1d5VvCa8Fo (they who know this movie know what happened there.)

But they are way harder to do. It took us over 1 year at Intercoin just to come up with the right design. If you want to know more about this topic, you can read about our design decisions (and economics etc) here:

https://forum.intercoin.org/

Also feel free to email me (greg is the username, intercoin.org is the domain) if you have more questions or want to discuss this topic, I geek out on it. Here is a video I made about decentralizing more than just software:

https://www.youtube.com/watch?v=WzMm7-j7yIY

##

About federation in particular: Moxie wrote about why Signal is unfederated a little while back: https://signal.org/blog/the-ecosystem-is-moving/
It has some interesting insights into when federation works and when it doesn’t.

“Nothing about any of the protocols we’ve developed requires centralization; it’s entirely possible to build a federated Signal Protocol-based messenger, but I no longer believe that it is possible to build a competitive federated messenger at all.”

It's good to compare this with views on the other side: https://gultsch.de/objection.html


https://news.ycombinator.com/item?id=17172203

##

Decentralized infrastructure with federated transactions describes many successful technologies such as email.
I think federation is just a design tool meant to solve a specific problem, much like decentralization, programming language choice, data structures, etc are more concrete software engineering ones.

https://news.ycombinator.com/item?id=17172151

##

When state matters federation is a better match such as emails. The real problem with executing decentralize/federate is it runs on the backbones of a centralized design network. IPv6 helps with that problem, but still at the end of the day dealing with all the complexity, headaches, and unknowns it is more simple to build a centralize solution then spend the extra time and effort for a federated/decentralize solution.

https://news.ycombinator.com/item?id=17172288