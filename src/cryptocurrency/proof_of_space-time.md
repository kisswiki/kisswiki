A major problem in designing secure decentralized protocols for the internet is a lack of identity verification. It is
often easy for an attacker to create many “fake” identities that cannot be distinguished from the real thing. Several
strategies have been suggested for defending against such attacks (often referred to as “sybil attacks”); one of the most
popular is to force users of the system to spend resources in order to participate. Creating multiple identities would
require an attacker to spend a correspondingly larger amount of resources, making this attack much more expensive.

Any bounded resource can be used as the “payment”; one of the more common is computing resources, since they
do not require any additional infrastructure beyond that already needed to access the Internet. In order to ensure that
users actually do spend the appropriate resource payment, the users must employ a “proof of work”.
Proofs of work have been used for reducing spam [6], for defending against denial-of-service attacks [15] and
fairly recently, as the underlying mechanism for implementing a decentralized bulletin-board—this is the technical
heart of the Bitcoin protocol [11].

While effective, proofs-of-work have a significant drawback; they require energy in direct proportion to the resource
used (i.e., the amount of electricity required to run the CPU during the proof of work generally depends linearly
on the amount of work being performed). This is especially problematic in the context of the Bitcoin protocol, since
the security of the system relies on all honest parties constantly performing proofs of work. In addition to having an
environmental impact, this also sets a lower bound on transaction fees (since rational parties would only participate in
the protocol if their reward exceeds their energy cost). Motivated in large part by the need to replace proofs-of-work
as a basis for crypto-currencies, two (very similar) proposals for Proofs of Space (PoS) have been published [7, 2].
Park et al. also designed an alternative crypto-currency that is based on Proofs of Space [12].

https://eprint.iacr.org/2016/035.pdf