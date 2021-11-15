kaba0

Nix doesn’t sandbox applications, it is basically only patches the ELF header so that it links to nix store entries instead of /usr/lib when it comes to shared libs.
So While I don’t have benchmarks, it is basically in the same ballpark as Arch programs.

https://news.ycombinator.com/item?id=25196553
