> Honestly, I love what IPFS does but I dislike how it does it. It seems very re-invent-the-world-y, and I'm not convinced that's necessary. The daemon is also very heavyweight and can be very slow with no terribly good tools . It needs a dedicated server process per machine, that server is resource intensive, and administering it is a pain. It's far from a plug-and-play solution. :-/

Make IPFS better -- Tried this, it's very difficult to get into the massive and poorly-documented codebase.

https://github.com/icefoxen/world_id

- https://news.ycombinator.com/item?id=15375283

##

It’s worth noting here that IPFS very explicitly does not persist or “store” data; despite what the name and marketing suggests, it’s a distribution mechanism and not a storage system, essentially a more granular BitTorrent. It’s also subject to the same availability issues (ie. dead torrents if noone seeds them).

That’s not to say that it can’t be a useful mechanism for P2P distribution, but please please please do not build anything that relies on it to not lose data, because that really is not what it was designed for, and it will result in a lot of lost data down the line if people have the wrong expectations.

https://discourse.nixos.org/t/obsidian-systems-is-excited-to-bring-ipfs-support-to-nix/7375/2
