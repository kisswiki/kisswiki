sergeykish

And it is easy to install software that's not packaged by distribution, ungoogled chromium [1]:

```
$ nix-env -iA nixpkgs.ungoogled-chromium
$ which chromium
/home/sergeykish/.nix-profile/bin/chromium
```

[1] https://search.nixos.org/packages?channel=20.09&show=ungoogl...

civodul

Or:

`guix install ungoogled-chromium`

This CLI difference is in part due to the underlying design, which is not just about syntax (parens vs. braces) but more about abstractions and composition.
For example, the Nix language doesn't have the ability to define new data types, and it doesn't have a "package" or an "operating system" data type. That means that all the entries in Nixpkgs look alike, which in turn prevents building a "package-aware" or "OS-aware" user interface.

The Guix CLI "knows" about packages and versions, and package transformation options are an example of how the CLI can take advantage of that abstraction.

Likewise, the "guix system" command knows about services, which gives it convenient introspection capabilities such as "guix system extension-graph" and "guix system shepherd-graph".

It really isn't about parentheses vs. braces. :-)

eliaspro

This is what annoys me about Nix the most - the missing abstraction of those, resulting in an often cumbersome UX and a very steep learning curve.
Guix on the other hand provides those, but is far from what nixpkgs offers in terms of number and actuality of pkgs.
mbakke

I think it's somewhat unfair to use number of packages vs Nix as an argument against Guix.
Nixpkgs has the biggest package repository of all the distributions, and a much larger community.

If you compare Guix against Arch for example, Guix comes out more favorably (15k packages) vs Arch's 12k.

Guix packages tend to be very well integrated too, usually running upstream test suites, leading to fewer run-time problems. I think only Debian and Fedora matches Guix on this practice.
rekado

Nixpkgs also has a lot of generated packages that cannot actually be built successfully, such as a large number of R packages.

https://news.ycombinator.com/item?id=25196285
