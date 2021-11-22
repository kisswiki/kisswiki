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

No other package manager can freeze the complete dependency set you are using AND allow you to revert it exactly when things don't work. That's the power of declarative, reproducible builds: you try to update and it doesn't work? No problem, revert to the last working version and things are all good again.

https://news.ycombinator.com/item?id=28591414

## No easy pinning of package version

look at "No easy pinning of package version" in `nixos/packages.md`

## vs docker

takeda

Nix delivers what docker promised and ultimately failed to deliver. Docker promised to reproduce developer's environment to production. What it did was to zip developer's computer and deploy it. When docker got adopted, relying on images was impractical, so for deployment Dockerfile was used, but that file is not much different than a shell script.

Nix instead describes the entire dependency tree down to libc. Because the starting state and all dependencies are known it can always create the same result, that's the biggest selling point of Nix to me.

There are implicit dependencies and explicit ones. Build dependencies and runtime ones.
Other package managers typically handle the last one and completely ignore implicit dependencies.

cwp

Nix makes sure that you get a predictable and reproducible tree of dependencies, and allows different applications to depend on different versions of the same dependencies. That is, it's a solution to DLL hell.

https://news.ycombinator.com/item?id=28591504

So, Why Not Docker? https://dev.to/ronenl/how-nix-shell-saved-our-teams-sanity-101k

## Conan vs Nix

trusktr

Now here with Nix we have a package manager that is trying to allow any package to depend on any version of any other package, but the issue is that the underlying system (FHS, etc) that each package is conventionalized on is completely in the way, and required Nix users to create sub-shells with fake FHS environments or patched ELF binaries. It’s basically hacking the very old system to bend it to newer ideas.

KoviRobi

I’d like to point out, indeed that both ELF patching and FHS chroot/virtualisation while is indeed an ad-hoc hack as you pointed out, only necessary for packages that for one reason or other cannot be packaged properly in Nix – and usually this would mean they cannot be packaged properly in Connan (I would imagine) either.

E.g. Adobe reader is shipped as a linked binary, so we cannot link our own libraries hence the need to patch.

Patching steam, and all its applications would be too much work (if at all possible, because we don’t have access to the purchased content to package it), so we virtualise the FHS it expects.

jonringer

I think this is a good example of the fundamental difference between nixos and other operating systems. In typical FHS operating systems, you start from a place of impurity, all of your system installation is dumped into a few directories which get mutated over time. In NixOS, you start from a place of complete purity, and you can “introduce” impurity with buildFHSUserEnv, and a few other tools as needed.

It blows my coworkers mind when i can switch between python interpreters with a single command. It’s only really possible because i don’t have to invalidate a system wide installation like you would need to do normally or in windows.

https://discourse.nixos.org/t/how-to-make-nixos-so-easy-that-people-can-be-productive-up-front-without-having-to-first-learn-the-nix-language/5625/45

## nix is a horrible language

chianuo

It's kind of horrifying. I hate the Nix language, and especially when things go wrong and you have to figure out wtf is going on, it's not easy to debug. You basically have to become a functional programming expert just to be able to configure your system. Their documentation also sucks and their usual answer is: just look at the source code.

Great. To debug my system not only do I need to learn FP, and learn their new cryptic language (and its strange obsession with semicolons), but I need to go dig through their fucking source code and understand how their whole project is laid out.

And that frustration is coming from me, a lover of FP -- I work professionally with Scala and previously with Haskell. I know enough to slog through it and make it work, but I only use Nix to configure my VMs as a curiosity I'm willing to dump hours into. But I would never recommend it even to other developers in its current state.

IshKebab

why do they force the extra complication of FP on users? Bazel manages to do the same thing with something that is basically a subset of Python.

https://www.reddit.com/r/programming/comments/qg72gi/comment/hi80cxh/

poelzi

After upgrading to 21.05 find gl broken again with some libs linked against newer glibc. Today after next test I wanted to restarting to the last 20.10 generation that worked and the x11 greeter is just black. After 2 years of NixOS I did not have a single upgrade without problems. They promissed that exactly this would not happen....

https://www.reddit.com/r/NixOS/comments/o8g95v/comment/h3awmx2/

RockstarArtisan

Fuck Nix, the idea is good, their approach to the implementation is horrible. I'd love to have nix and nixpkgs that work, but thus far all projects that I've worked on that used nixpkgs were horrible timesinks due to constant breakages whenever something needed to change. No, adding a library or changing the linkage of a library shouldn't take a week. No, nix doesn't need 6 different ways of building cargo projects, each broken in their own cute unique way.

There's a reason for how bad nix is: instead of changing unix userland to work with their approach by making upstream changes and publishing standards on how to be nix-compatible they've resorted to essentially forking the entire userland.

This works well enough if you're interested in executables which do not interact with paths or environment of other system resources, but breaks horribly for tools that do, like all of the bloody linux development tools. So, nix has to patch these tools, or wrap them in a shell-script wrapper, but this often isn't ideal because users of those executables might break because of those patches. For example, an editor using a compiler executable to produce static analysis will not be aware of what paths nix's wrapper on top of clang injected this time and thus won't be able to do static analysis properly.

This means that with the current approach linux devtools only work well in nixpkgs if all of the tools are patched to run on nix including editors, which is just simply unfeasible and unsuprisingly doesn't happen - only the bare minimum gets patched. Say goodbye to good editor integration, say goodbye to running many tools that run out of the box in other environments.

And the nix patches and wrappers always lag behind in features behind the wrapped counterparts. Want to run cargo build -vv in buildRustCrate? Too bad, it's not there. Issues like that will always pop up because there's just no way that a userland fork can keep up with all the userspace, even userland doesn't keep up with itself when things break because others there haven't caught up with the changes.

There's only one solution to these problems, stop forking the userspace and start making the upstream compatible with the nixpkgs model.

https://www.reddit.com/r/programming/comments/qg72gi/comment/hi8gikr/
