## scuttlebutt

- https://www.scuttlebutt.nz
- https://www.inthemesh.com/archive/secure-scuttlebutt-facebook-alternative/

This is not your usual startup launch, it's a community project by multiple open source hackers. If something is missing, you can make it happen. And there are so many ongoing developments right now (see list below), that it really doesn't make sense, at this point, to point out the current problems with the protocol. It's evolving fast, and can evolve even faster if you choose to make it your own and do something about it.

Here are a couple of things being developed:

- Mobile app for Android
- Better cryptographically-verified user invites
- P2P replication over WebRTC
- P2P replication over DHT (Kademlia)
- Better scalability (Epidemic broadcast trees)
- GitHub alternative
- "Out-of-order" replication (get messages from distant friends of your friends)
- Private groups
- Moderation tools (every person as a moderator)
- Socio-technical discussion around data accountability
- New RPC stack, rewrite
- Rust client
- Go implementation
- C implementation
- Groundwork for iOS support
- Multi-devices accounts
- Scuttlebutt on Firefox as an extension
- Overall improving onboarding and docs
- Replication over Bluetooth and Wi-Fi P2P
- Web viewer
- Scuttlebutt cloud (easy way of setting up servers)
- Websites on scuttlebutt
- etc

It's a moving target

https://news.ycombinator.com/item?id=16879544

## trivial to block several distributed hosts simultaneously

It's trivial to block several distributed hosts simultaneously. An aspiring censor would simply find the most common federated endpoints for a given service and block all of them. Only the users of that software would be affected. There wouldn't be any collateral damage.
If the censors somehow didn't hit every single worthwhile federated endpoint, users would still be left wondering why they couldn't communicate with most of their friends. Moving between federated hosts would also necessitate an entirely new identifier, so users would need to rebuild their social graph again.

In addition to being ineffective against censorship, there are several other properties and trade-offs that make federation a difficult proposition for an application like Signal: https://signal.org/blog/the-ecosystem-is-moving/

https://news.ycombinator.com/item?id=16871352

## Identities stored on the blockchain

Identity: stored on the Stellar blockchain as usernames/namespaces.

Show HN: Second – solution to decentralize https://news.ycombinator.com/item?id=16684276