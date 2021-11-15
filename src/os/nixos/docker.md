abstract777

Have you used docker inside NixOS? And if so, why?

srid

To run an one-off image from Docker registry, like mysql or redis, specific to a project. Docker is generally not required on NixOS for creating reproducible environments.

https://lobste.rs/s/jevfaf/nixos_for_developers#c_bhpxj1
