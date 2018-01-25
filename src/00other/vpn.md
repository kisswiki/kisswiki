## BeyondCorp

- Beyond Corp: The Access Proxy https://research.google.com/pubs/pub45728.html

###

BeyondCorp is a security approach used by Google that allows employees to work from anywhere, quickly and easily.

This is easier said than done. In 2010, we undertook a massive project to rethink how to provide employees with secure remote access to applications: We moved away from our corporate VPN, and introduced BeyondCorp, a zero-trust network security model.

With BeyondCorp, we no longer have a binary access model, where you are either inside the whole corporate network, with all the access that allows, or outside and completely locked out of applications. Our new approach provides a better, more convenient, and less risky way: access to individual services as you need them, based on who you are and what machine you're using.

While BeyondCorp makes applications easily accessible from anywhere, it also improves security in other ways. Over the course of the migration we’ve discovered services that we thought were long dead, because this change required taking a detailed look at our traffic, our dependencies and our employee usage patterns. It’s also allowed us to scale globally while reducing our attack surface, and increased our ability to provide access when appropriate.

https://www.blog.google/topics/google-cloud/how-use-beyondcorp-ditch-your-vpn-improve-security-and-go-cloud/

The most common feedback I get is that it seems like too much of a stretch for companies that don’t operate at Google scale. That may be true if looking at the system as a whole, but the principles behind the architecture should attract anyone’s attention - remove trust from the network by authenticating and authorizing every request based on what’s known about the user and connecting device at the time of the request.

https://news.ycombinator.com/item?id=14596613

###

The short and long of BeyondCorp:
- Instead of a single VPN that will expose your entire squishy corporate LAN to anyone who gets VPN access, each application gets its own protected proxy.

- The protected proxies query a centrally-aggregated auth/authz database, which can work with client-side software to ensure qualities such as private key possession, full disk encryption, software updates, etc. In Google's case, this is combined with a host-rewriting browser extension for usability.

- Access proxies can easily funnel HTTP traffic, but some more clever solutions involving tunnels exist for plain old TCP and UDP.

By giving every application its own authentication and access control proxy, each application is secured on its own, hence "zero-trust.

- https://news.ycombinator.com/item?id=16205351
- https://thenewstack.io/beyondcorp-google-ditched-virtual-private-networking-internal-applications/?_lrsc=736ef0f1-9e4b-4970-81fc-82957c3e6c0f