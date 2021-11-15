abstract777

Have you used docker inside NixOS? And if so, why?

srid

To run an one-off image from Docker registry, like mysql or redis, specific to a project. Docker is generally not required on NixOS for creating reproducible environments.

https://lobste.rs/s/jevfaf/nixos_for_developers#c_bhpxj1

## vs

Nix delivers what docker promised and ultimately failed to deliver. Docker promised to reproduce developer's environment to production. What it did was to zip developer's computer and deploy it. When docker got adopted, relying on images was impractical, so for deployment Dockerfile was used, but that file is not much different than a shell script.

Nix instead describes the entire dependency tree down to libc. Because the starting state and all dependencies are known it can always create the same result, that's the biggest selling point of Nix to me.

https://news.ycombinator.com/item?id=28591504

So, Why Not Docker? https://dev.to/ronenl/how-nix-shell-saved-our-teams-sanity-101k
