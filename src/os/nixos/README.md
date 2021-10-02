## Users

- Jakub Konka https://twitter.com/kubkon
- Marek Fajkus https://twitter.com/turbo_MaCk

## pros and cons

- it violates FHS
- many Linux tutorials/blog posts just don’t work for NixOS
- very few influential users/promoters
- most binaries distributed for Linux don’t work on NixOS out-of-box, thus create a problem for upstream
- there are problem with different language ecosystem interoperations, like virtualenv for Python doesn’t work for several important packages, and Nix python - packages do not feature all pypi packages. Other languages have similar problems
- NixOS is network hungry, and disk I/O hungry on updates/rebuilds. Without proper mgmt it is also disk-space hungry

https://discourse.nixos.org/t/why-do-i-have-to-switch-from-arch-to-nixos/5873/9

Other benefits I have from this transition is, that I have a centralised place and unified syntax to do my system configuration, and another place for the users configuration.

I can get similar recent programs as in Arch by simply overriding some attributes of a package. Updating software beyond what was given upstream in Arch always required me to manually check out from the ABS, tinker with PKGBUILD files, sandboxing the build of the package and then manually installing that package, and probably even miss update builds when I forgot to set the revision counter in the PKGBUILD to 0…

Similar for packages which you would like to have installed with a different set of flags than those provided upstream.

https://discourse.nixos.org/t/why-do-i-have-to-switch-from-arch-to-nixos/5873/20

- NixOS isn't very well known, it could use some marketing.
- It's got a very very steep learning curve. Imagine people believing arch is incredibly complicated, I guess for most Nixos users arch is no more different than - Ubuntu complexity wise.
- Declarative and immutable are mostly a thing coming from the functional programming world so I'd like to believe mostly functional programmers understand why it's - desirable.
- The docs are very lacking and often outdated, so I don't agree with your point that nixos has good docs. Almost every time I need to figure something out I find - myself digging through the nixpkgs code rather than looking in the manual. The manual is fine for simple things but when you're routinely creating your own - derivations it's not good enough.

https://www.reddit.com/r/NixOS/comments/kpntby/comment/ghz3436/

IMO, it's difficult to use without learning the in-and-outs of nix. Basically nothing is compatible out of the box, so you often have to write your own derivations or wrappers. Debugging compatibility requires expertise in both NixOS and conventional linux distros. Nix syntax is quirky and the parser is unforgiving (e.g. missing semicolons or parentheses can be misparsed as different constructs and lead to very confusing error messages). Also, a lot of the really cool features require nix (e.g. overlays, modules).

I love it, but I'm not sure what NixOS would look like to someone who wasn't a competent functional programmer in nix. I guess if you are happy just running packages from nixpkgs as-is and having a really basic configuration.nix, you still get some of the benefits, but it's difficult to overcome the activation energy of switching distros.

https://www.reddit.com/r/NixOS/comments/kpntby/comment/ghz3nlf/

## Links

- [NixOS - Explore](https://nixos.org/explore.html)
- [NixOS - Wikipedia](https://en.m.wikipedia.org/wiki/NixOS)
- [DistroWatch.com: Put the fun back into computing. Use Linux, BSD.](https://distrowatch.com/weekly.php?issue=20170515#nixos)
- [DistroWatch.com: NixOS](https://distrowatch.com/table.php?distribution=nixos)
- [(816) Random live gaming on NixOS (CSGO mostly) - YouTube](https://www.youtube.com/watch?v=mN2j70hSo4s)
- [Playing CS:GO on Linux? Don't enable resizable BAR : GlobalOffensive](https://www.reddit.com/r/GlobalOffensive/comments/nakz30/- playing_csgo_on_linux_dont_enable_resizable_bar/)
- [I fixed (most of) my FPS issues by turning Multicore Rendering ON. : GlobalOffensive](https://www.reddit.com/r/GlobalOffensive/comments/3to8f6/- i_fixed_most_of_my_fps_issues_by_turning/)
- [Nvidia - NixOS Wiki](https://nixos.wiki/wiki/Nvidia)
- [Search · csgo](https://github.com/NixOS/nixpkgs/search?q=csgo&type=issues)
- [Steam: Proton games don't start anymore · Issue #130699 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/issues/130699)
- [steam-runtime/reporting-steamlinuxruntime-bugs.md at master · ValveSoftware/steam-runtime](https://github.com/ValveSoftware/steam-runtime/blob/master/doc/- reporting-steamlinuxruntime-bugs.md#essential-information)
- [Steam proton games broken - Learn - NixOS Discourse](https://discourse.nixos.org/t/steam-proton-games-broken/14167/8)
- [steam: can not start CS:GO · Issue #50604 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/issues/50604)
- [Issues · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/labels/6.topic%3A%20steam)
- [nixpkgs/steam.nix at master · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/blob/master/pkgs/games/steam/steam.nix)
- [21.11 Feature Freeze · Issue #140168 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/issues/140168)
- [jonringer (Jonathan Ringer)](https://github.com/jonringer)
- [jonringer/nixpkgs-config: ~/.config/nixpkgs](https://github.com/jonringer/nixpkgs-config)
- [jonringer/nix-template: Make creating nix expressions easy](https://github.com/jonringer/nix-template)
- [nrdxp (Timothy DeHerrera)](https://github.com/nrdxp)
- [helix-editor/helix: A post-modern modal text editor.](https://github.com/helix-editor/helix)
- [divnix/digga: A a flake utility library to craft shell-, home-, and hosts- environments.](https://github.com/divnix/digga)
- [Flakes - NixOS Wiki](https://nixos.wiki/wiki/Flakes)
- [Notifications and other popups are treated like &quot;normal&quot; windows on Plasma Wayland · Issue #118650 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/- issues/118650)
- [samueldr/nix-top](https://github.com/samueldr/nix-top)
- [Mobile NixOS](https://mobile.nixos.org/)
- [NixOS/mobile-nixos](https://github.com/NixOS/mobile-nixos)
- [NixOS/nixpkgs: Nix Packages collection](https://github.com/NixOS/nixpkgs)
- [ttuegel (Thomas Tuegel)](https://github.com/ttuegel)
- [kwin: unwrap executable name for resource name by CertainLach · Pull Request #139459 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/pull/139459)
- [Issues with GNOME 3 and Nvidia EGLStream · Issue #75131 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/issues/75131)
- [Add unstable options to stable install - Learn - NixOS Discourse](https://discourse.nixos.org/t/add-unstable-options-to-stable-install/6482)
- [CSGO and other 3d games broken in Steam by commit ... · Issue #90229 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/issues/90229)
- [steam: switch to correct runtime tarball by euank · Pull Request #90286 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/pull/90286/files)
- [nixek-overlay/pkgs at master · euank/nixek-overlay](https://github.com/euank/nixek-overlay/tree/master/pkgs)
- [gtk2: 2.24.32 → 2.24.33 by jtojnar · Pull Request #138797 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/pull/138797)
- [jtojnar/nixfiles: Nix configuration for the machines I manage.](https://github.com/jtojnar/nixfiles)
- [SuperSandro2000 (Sandro)](https://github.com/SuperSandro2000)
- [factoriotools/factorio-docker: Factorio headless server in a Docker container](https://github.com/factoriotools/factorio-docker/)
- [SuperSandro2000/cheat-sheet: Cheat sheet about stuff others might find interesting](https://github.com/SuperSandro2000/cheat-sheet)
- [cheat-sheet/network.md at master · SuperSandro2000/cheat-sheet](https://github.com/SuperSandro2000/cheat-sheet/blob/master/misc/network.md)
- [cheat-sheet/git.md at master · SuperSandro2000/cheat-sheet](https://github.com/SuperSandro2000/cheat-sheet/blob/master/misc/git.md)
- [SuperSandro2000/install-scripts: Sandro's install scripts](https://github.com/SuperSandro2000/install-scripts)
- [NixOS: The Only Functional GNU/Linux Distribution - software](https://doczz.net/doc/3672568/nixos--the-only-functional-gnu-linux-distribution)
- [How to use Nix to build fresh GIMP](https://gist.github.com/jtojnar/c14bc10ae6052b5a6fb19bfdac077a01)
- [NixOS Search - Packages](https://search.nixos.org/packages?channel=21.05&show=gimp&from=0&size=50&sort=relevance&type=packages&query=gimp)
- [Does my first-ever configuration.nix look alright? - Learn - NixOS Discourse](https://discourse.nixos.org/t/does-my-first-ever-configuration-nix-look-alright/5372)
- [NixOS 21.05 Released! : linux](https://www.reddit.com/r/linux/comments/nqgtpk/nixos_2105_released/)
- [gimp: 2.10.24 → 2.10.28 by jtojnar · Pull Request #138410 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/pull/138410)
- [nixpkgs/default.nix at 9468b073267c9159d79b89686fabd09367f74ac3 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/blob/9468b073267c9159d79b89686fabd09367f74ac3/pkgs/applications/graphics/gimp/default.nix)
- [Way to install apps in their own FHS environment. : NixOS](https://www.reddit.com/r/NixOS/comments/m31t0m/way_to_install_apps_in_their_own_fhs_environment/)
- [NSU · 583c8ab804560227e3fd8db5bcedb1d85dad2551 · Jan Kaifer / nixos · GitLab](https://gitlab.com/JanKaifer/nixos/-/tree/583c8ab804560227e3fd8db5bcedb1d85dad2551/- NSU)
- [How to make NixOS so easy that people can be productive up front, without having to first learn the nix language? - Development - NixOS Discourse](https://- discourse.nixos.org/t/how-to-make-nixos-so-easy-that-people-can-be-productive-up-front-without-having-to-first-learn-the-nix-language/5625/4)
- [Lassulus/nix-autobahn](https://github.com/lassulus/nix-autobahn)
- [Mic92/nix-ld: Run unpatched dynamic binaries on NixOS](https://github.com/Mic92/nix-ld)
- [FBRS](https://www.fbrs.io/cypress/)
- [Different methods to run a non-nixos executable on Nixos - Unix &amp; Linux Stack Exchange](https://unix.stackexchange.com/questions/522822/- different-methods-to-run-a-non-nixos-executable-on-nixos)
- [Anyone tried NixOS, what are your thoughts? : archlinux](https://www.reddit.com/r/archlinux/comments/b2jkrp/anyone_tried_nixos_what_are_your_thoughts/)
- [NixOS users, tell me: What are the cons? : NixOS](https://www.reddit.com/r/NixOS/comments/441ymh/nixos_users_tell_me_what_are_the_cons/)
- [Why isn't NixOS more popular : NixOS](https://www.reddit.com/r/NixOS/comments/kpntby/why_isnt_nixos_more_popular/)
- [pmiddend/nixos-manager: Manage your NixOS packages and configuration via a simple, intuitive UI](https://github.com/pmiddend/nixos-manager)
- [Make JupyterWith a Flake · Issue #99 · tweag/jupyterWith](https://github.com/tweag/jupyterWith/issues/99)
- [rfcs/0049-flakes.md at 8c36f764fbae6a09b06fe2a35b5828e79e24d950 · NixOS/rfcs](https://github.com/NixOS/rfcs/blob/8c36f764fbae6a09b06fe2a35b5828e79e24d950/rfcs/- 0049-flakes.md)
- [Anyone tried NixOS, what are your thoughts? : archlinux](https://old.reddit.com/r/archlinux/comments/b2jkrp/anyone_tried_nixos_what_are_your_thoughts/)
- [Graphs - Repology](https://repology.org/repositories/graphs)
- [Google Search is getting worse](https://www.fastcompany.com/90673924/its-not-just-you-google-search-really-is-getting-worse)
- [the most important HTTP request headers](https://wizardzines.com/comics/request-headers/)
- [So You Want To Compete With Roblox](https://www.fortressofdoors.com/so-you-want-to-compete-with-roblox/)
- [Why isn't NixOS more popular : NixOS](https://www.reddit.com/r/NixOS/comments/kpntby/why_isnt_nixos_more_popular/)
- [pmiddend/nixos-manager: Manage your NixOS packages and configuration via a simple, intuitive UI](https://github.com/pmiddend/nixos-manager)
- [Make JupyterWith a Flake · Issue #99 · tweag/jupyterWith](https://github.com/tweag/jupyterWith/issues/99)
- [rfcs/0049-flakes.md at 8c36f764fbae6a09b06fe2a35b5828e79e24d950 · NixOS/rfcs](https://github.com/NixOS/rfcs/blob/8c36f764fbae6a09b06fe2a35b5828e79e24d950/rfcs/- 0049-flakes.md)
- [Anyone tried NixOS, what are your thoughts? : archlinux](https://old.reddit.com/r/archlinux/comments/b2jkrp/anyone_tried_nixos_what_are_your_thoughts/)
- [Graphs - Repology](https://repology.org/repositories/graphs)
- [Projects list - Repology](https://repology.org/projects/b/?inrepo=nix_unstable&notinrepo=gnuguix&repos=3)
