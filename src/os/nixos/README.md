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

jpe90

The first problem I had was that it added steps to a number of tasks I had on a regular basis. For example, updating or adding new extensions to VS code. Because NixOS is immutable, you don't get to benefit from just running a single update or install command within VS code like you would on a normal system. It becomes an annoying series of steps you have to carry out for each operation, all in the name of being convenient to hypothetically down the line. Multiply this by all the tools you use and it gets tiresome.

The other issue is that you raise the barrier of entry for every new piece of technology you want to experiment with. Now, in addition to learning how to use any tooling involved with the ecosystem, you have to figure out how to get it to play nicely with Nix. This works very well for some ecosystems, like Haskell, and not well at all for others. I was just getting started with Android development at the time, and just when I thought I had it working nicely with Nix, I would run into a new problem that would need investigation and band-aids.

jchw

My biggest problem with NixOS is the complexity. Nixpkgs is maintenance hell, and the Nix filesystem is so different from standard UNIX-likes that a lot of software plays kinda weirdly with it.

The real game changer is definitely the reproducibility though. At first, it seems useful for software development, but trust me, if you get deep enough in it is way more important for system management. If an upgrade does break, being able to rollback at boot is nice. But what is much nicer is simply the feeling of safety I have going in extreme tangents. I can try setting up Pipewire as my system audio daemon, and if I don’t like it, I can revert it like nothing ever happened. If I run into a bug that has a reasonably good patch stuck in code review hell, I can pull it into my local setup with overlays, replaceDependency and fetchpatch. Setting up IOMMU PCI-e forwarding to a VM is pretty hard, and it sucks that the configuration is basically stored in no specific place, not to mention having to memorize everything you touched to get there; on NixOS, this relatively arduous task was reduced down to about 30 lines of Nix combined with finding some IDs for my secondary GPU. Everyone knows that Linux has some serious super powers if you can exploit them; it is truly crazy what Linux is really capable of. With NixOS, I feel like I’ve gotten a lot better at utilizing the super powers Linux has to offer.

danieldk

But I also learned that whether using NixOS is productive very much depends on what software ecosystems you are working in. When I was primarily doing Rust for work in Emacs, it worked marvelously.

When I switched to CLion (for various reasons), cracks started to show. CLion does not work well in combination with nix-shell, so when you switch often between projects, you end up with projects that don't build because you are not in the right environment. Currently, I am doing more Python development, and that is an absolute pain with Nix. You end up needing different sets of package versions (which are not packaged in nixpkgs) in different environments. If you need to change multiple packages in tandem, you want mutable state. The best you can do is to make a FHS environment with buildFHSUserEnv, which kind of works, but is not very smooth. At which point you realize that you are basically fighting the system.

Then there are the niches that are not well-covered. Over the past year or so, I have had to do GPU profiling more recently. Last time I tried, the usual NVIDIA tools (e.g. Nsight Systems) worked very badly on NixOS. Of course, it's a big proprietary blob with all kinds of FHS assumptions, but you need to get work done.

These are not all failings of Nix or NixOS, it is more that there are a lot of software ecosystems out there that are not really prepared (yet) for an non-FHS, immutable world.

> but I’ll be damned if it’s not a preview of the future

I think for most Linux users, Fedora Silverblue is probably more of a preview of the future. It doesn't have all the features that NixOS provides, but it does have many that matter (immutable base system, atomic upgrades/rollbacks), while going further than NixOS in other departments (verified boot, SELinux, git-like store of blobs). It sticks to FHS, so a lot of existing software continues to work.

jpe90

> I will say that some stuff is not easily encapsulated in Nix. Of course, you could always use virtual machines or Docker as an escape hatch. I’ve found this to be a fairly good solution in the somewhat rare event I need it.

It's true, escape hatches exist. But they are solutions to problems you are _creating by using nixos_, which did not occur on a normal FHS system, and require time and energy investments to solve them. And those problems are landmines lurking in every piece of software you will ever adopt in the future.

pimeys

I, like many other NixOS users, fully understand your sentiments. Let me explain why I stick with it and use it in all of my computers.
First off, I have a quite special environment for work. I like to customize many aspects of my desktop, and having my environments on other machines to work similarly is a tedious task, especially when having more than two computers you use daily. NixOS solves this issue very well.

What makes it hard is how docs are not that great for Nix or NixOS. What all of us have to do is to read other people's dotfiles and the nixpkgs monorepo to understand how things work and what can you do with it. It is extremely hard in the beginning, even for people like me with over 20 years of Linux experience. It took me about six months to finally being able to get it.

There are some new terms you hear when you first start using NixOS. One is flakes, that is very vague and academic at first, but when you understand what it does it is almost as hard to go back to Nix without them as it is for seasoned NixOS user to go back to using other operating systems. With flakes, you have two files:

- `flake.nix` lists inputs, such as git repositories, of nix build instructions for fetching packages and functions to your system.

- `flake.lock` is like your normal `Cargo.lock` that sets the exact commits of all inputs, freezing the versions of all software in your system.

This means I can mix things really nicely in my system. I can use the master branch of Sway, the pgtk version of Emacs with Wayland support from the emacs version control (not even master branch) and mix and match things from different NixOS versions. I can even fork the NixOS monorepo, do some changes and add them to all of my systems before my PR gets merged.

The `flake.lock`, which I commit to my repository, forces every single computer I have to use exactly these versions of the software with the configuration I give. It will always lead to the exact same result when I `nixos-rebuild switch`. When I want to update my packages, I go to the repo and say `nix flake update`, then switch to the new versions and only if everything worked with the new packages, I commit the `flake.lock` and it works everywhere else the same.

The other nice thing I learned, is while at first the nixpkgs feels like a crazy mess and hard to grasp, it is actually one of the best package repositories I've used. Being a package maintainer is easy and a PR that follows good coding standards gets merged to the main repository no matter how experienced Nix developer you are. See my first package I started to maintain:

https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/tools/pscale/default.nix

These 23 lines of nix will fetch the package with the given tag from GitHub, check the file download SHA256 sum matches the given, check the vendored libraries SHA256 sum matches the given and then will just use the system `buildGoModule` function to compile the package and put it to your system. When their CI catches changes here, it will build a binary cache for the derivation, so most users won't even need to compile anything, but get a binary derivation with exactly the same result as compiling it by themselves.

And it's easy to see what gets added to your system. You can see the repo and read the code. You can use your editor, go on top of `buildGoModule` call and jump to definition, and you can read the definition what the function does. Now some users are running bots that just go through many packages in the nix repo, change the versions and SHA sums if they have updates and automatically generate pull requests, saving the maintainers the work to do it manually.

I understand this is not for everyone. But I hope I also could make you understand why there is no way of going back to systems like Arch Linux, Ubuntu, Windows or macOS after getting some proper taste how to do things with NixOS.

Here's my config so far:

https://github.com/pimeys/nixos

kaba0

You sort of have that with NixOS as well, with eg. steam-run that provides a debian-like chroot and can run most executables. (You can also modify it to include any dependency you like, that will get installed to standard locations)

https://nixos.wiki/wiki/Steam

esjeon

NixOS is overrated for desktops. It's good for reproducing specific environment, but, unlike servers and dev envs, in desktop environments, changes are made from both software and user side frequently and sometime radically. ROI is significantly lower, and NixOS still can't save you from long-term breakage.

What I can say is that you're just riding on hypes, and never looked into the true abyss. If you're into rock solid systems, nothing can beat full-time suckless. Ditch those "modern" stuffs like systemd and smart DEs, and you get perfectly predictable system. Do that on Debian, an you have nothing to babysit at all.

rgoulter

I think the dissuading points under "Should I use NixOS?" are pretty good. https://github.com/hlissner/dotfiles#frequently-asked-questions

esjeon

You sound like a ball of buzzwords.

First, it's not that Wayland is bad, but it's simply not there yet. It still needs more time and effort. Nothing is wrong with this. What's wrong is trying to shove that thing into people's throat.

Second, NixOS is overrated for desktops. It's good for reproducing specific environment, but, unlike servers and dev envs, in desktop environments, changes are made from both software and user side frequently and sometime radically. ROI is significantly lower, and NixOS still can't save you from long-term breakage.

What I can say is that you're just riding on hypes, and never looked into the true abyss. If you're into rock solid systems, nothing can beat full-time suckless. Ditch those "modern" stuffs like systemd and smart DEs, and you get perfectly predictable system. Do that on Debian, an you have nothing to babysit at all.

https://news.ycombinator.com/item?id=28793941

And more of that https://news.ycombinator.com/item?id=28817477

And more [NixOS and the Art of OS Configuration (2018) | Hacker News](https://news.ycombinator.com/item?id=28884609)

kvark uses it https://news.ycombinator.com/item?id=28899039

## ZFS

https://elis.nu/blog/2019/08/encrypted-zfs-mirror-with-mirrored-boot-on-nixos/

## Incrementally

fiddlerwoaroof

I found the Nixos learning curve easier when I started with nust nix-shell and then home manager on Debian and macOS. It let me focus on building up workflows in nix for particular tasks and I’ve slowly worked outwards towards overlays and full nixos deploys.

https://news.ycombinator.com/item?id=28795345

## New UI

The UI for Nix has been under significant rework over the last ~3 years, but the new UI isn't ready for primetime yet, so none of it is made prominent now. It's getting there though.
You can have a peek here: https://nixos.org/manual/nix/unstable/command-ref/experimental-commands.html

## Visual Studio Code

https://nixos.wiki/wiki/Visual_Studio_Code#Managing_extensions

## Gnome

https://nixos.org/manual/nixos/stable/#chap-gnome

## Links

- [NixOS - Explore](https://nixos.org/explore.html)
- [NixOS - Wikipedia](https://en.m.wikipedia.org/wiki/NixOS)
- [DistroWatch.com: Put the fun back into computing. Use Linux, BSD.](https://distrowatch.com/weekly.php?issue=20170515#nixos)
- [DistroWatch.com: NixOS](https://distrowatch.com/table.php?distribution=nixos)
- [(816) Random live gaming on NixOS (CSGO mostly) - YouTube](https://www.youtube.com/watch?v=mN2j70hSo4s)
- [Playing CS:GO on Linux? Don't enable resizable BAR : GlobalOffensive](https://www.reddit.com/r/GlobalOffensive/comments/nakz30/- playing_csgo_on_linux_dont_enable_resizable_bar/)
- [I fixed (most of) my FPS issues by turning Multicore Rendering ON. : GlobalOffensive](https://www.reddit.com/r/GlobalOffensive/comments/3to8f6/- i_fixed_most_of_my_fps_issues_by_turning/)
- [Nvidia - NixOS Wiki](https://nixos.wiki/wiki/Nvidia)
  - https://nixos.org/manual/nixos/stable/#sec-x11-graphics-cards-nvidia
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
- [Projects list - Repology](https://repology.org/projects/b/?inrepo=nix_unstable&notinrepo=gnuguix&repos=3)
- [Google Search is getting worse](https://www.fastcompany.com/90673924/its-not-just-you-google-search-really-is-getting-worse)
- [the most important HTTP request headers](https://wizardzines.com/comics/request-headers/)
- [So You Want To Compete With Roblox](https://www.fortressofdoors.com/so-you-want-to-compete-with-roblox/)
- [Benefits/disadvantages of NixOS over Guix? : NixOS](https://www.reddit.com/r/NixOS/comments/lgf7vo/benefitsdisadvantages_of_nixos_over_guix/)
- [nixos - What is the relationship between Disnix and NixOps? - Stack Overflow](https://stackoverflow.com/questions/21786773/- what-is-the-relationship-between-disnix-and-nixops)
- [Erase your darlings: immutable infrastructure for mutable systems - Graham Christensen](https://grahamc.com/blog/erase-your-darlings)
- [nix-community/lorri: Your project’s nix-env \[maintainer=@Profpatsch\]](https://github.com/nix-community/lorri)
- [Introducing lorri, your project's nix-env - Tweag](https://www.tweag.io/blog/2019-03-28-introducing-lorri/)
- [haslersn/any-nix-shell: fish and zsh support for the nix run and nix-shell environments of the Nix package manager](https://github.com/haslersn/any-nix-shell)
- [Steam beta 2021-09-07: steamwebhelper cannot find LIBTHAI_0.1.25 on NixOS · Issue #462 · ValveSoftware/steam-runtime](https://github.com/ValveSoftware/- steam-runtime/issues/462)
- [Steam: embeddedd browser not working with latest update · Issue #137279 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/issues/137279)
- [nix-community/home-manager: Manage a user environment using Nix \[maintainer=@rycee\]](https://github.com/nix-community/home-manager)
- [NixOS - Nix Pills](https://nixos.org/guides/nix-pills/why-you-should-give-it-a-try.html)
- [My NixOS Desktop Flow - Xe](https://christine.website/blog/nixos-desktop-flow-2020-04-25)
- [DBCDK/morph: NixOS deployment tool](https://github.com/DBCDK/morph)
- [Gabrieλ Voλpe on Twitter: &quot;My #NixOS user environment (including all software and services I use) - managed by Home Manager - is now being built on GH - actions 🥳 https://t.co/xc0X06Nsw2 https://t.co/czdb7E83ob&quot; / Twitter](https://twitter.com/volpegabriel87/status/1428706041378885632)
- [Articles | Functional Works](https://functional.works-hub.com/learn/?blogs-search=nix&interaction=1)
- [Exploring Nix &amp; Haskell Part 2: Dev Tools &amp; IDE Integration](https://functional.works-hub.com/learn/- exploring-nix-and-haskell-part-2-dev-tools-and-ide-integration-dd53e)
- [Exploring Nix &amp; Haskell Part 1: Project Setup – Christian Henry](https://cah6.github.io/technology/nix-haskell-1/)
- [nixpkgs/default.nix at master · mmahut/nixpkgs](https://github.com/mmahut/nixpkgs/blob/master/pkgs/development/web/cypress/default.nix)
- [divnix/devos: NixOS Template](https://github.com/divnix/devos)
- [numtide/devshell: Per project developer environments](https://github.com/numtide/devshell)
- [Key Concepts - devos docs](https://devos.divnix.com/concepts/index.html)
- [Introduction - Digga Library Docs](https://digga.divnix.com/)
- [gytis-ivaskevicius/flake-utils-plus: Use Nix flakes without any fluff.](https://github.com/gytis-ivaskevicius/flake-utils-plus)
