- https://www.heinrichhartmann.com/posts/2021-08-08-nix-emacs/
- https://nixos.org/manual/nix/stable/introduction.html
- https://nixos.wiki/wiki/Nixpkgs/Update_a_package
- https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/first-package.html
- https://discourse.nixos.org/t/speeding-up-vs-code-updates-merging/10652
- https://github.com/Mic92/nix-update/
- https://discourse.nixos.org/t/wrong-link-to-mpv-source/16141

## override

- [Overrides: In and Out (NixCon 2019) - YouTube](https://www.youtube.com/watch?v=6VepnulTfu8)
- https://nixos.org/manual/nixpkgs/stable/#chap-overrides
- https://discourse.nixos.org/t/how-to-override-package-version/2889/12
- https://nixos.wiki/wiki/Overlays
- https://nixos.wiki/wiki/Nixpkgs/Modifying_Packages
- https://stackoverflow.com/questions/65970915/how-can-i-override-a-package-source-in-nix
- https://ryantm.github.io/nixpkgs/using/overrides/
- https://ianthehenry.com/posts/how-to-learn-nix/overriding/
- https://stackoverflow.com/questions/36000514/how-to-override-2-two-packages-in-nixos-configuration-nix
- I've converted an overlay to a packageOverrides construct lately because the overlay took too much memory to evaluate https://github.com/NixOS/nixpkgs/issues/43266#issuecomment-407055671
- https://nixos.org/guides/nix-pills/override-design-pattern.html

## nix path-info

`ls $(nix path-info nixpkgs.gitFull)/libexec/git-core/git-gui`

https://github.com/NixOS/nixpkgs/issues/55071#issuecomment-461877147

## explore package and add some package

```bash
$ nix-shell -E 'with import <nixpkgs> {}; gnused.overrideAttrs (oldAttrs: { buildInputs = [ ctags ]: })'
$ unpackPhase
$ cd sed-4.8
$ configurePhase
$ buildPhase
```

https://stackoverflow.com/questions/63966084/what-is-the-equivilent-shell-nix-for-nix-shell-nixpkgs-a-gnused

## open nix file for package

`nix edit nixpkgs.gnused`

- https://stackoverflow.com/questions/63966084/what-is-the-equivilent-shell-nix-for-nix-shell-nixpkgs-a-gnused
- https://nixos.wiki/wiki/Nix_command/edit
- https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-edit.html

## documentations searcher and video about nix

siraben

I found reading code from Nixpkgs to be very valuable as well, and can't recommend it enough. I managed to get by using NixOS without writing my own derivations for several months until I inevitably ran into a need to package something new. Even then, Nix Pills isn't a super useful reference, it's sort of like learning Git by understanding blobs, too focused on details.
Another pain point is looking for documentation of Nix library functions, I've solved this by using Manix[0]

[0] A fast CLI documentation searcher for Nix https://github.com/mlvzk/manix

alephu5

I find nix pills hard to digest since they use the repl, and for a newbie it's hard to see how they apply to real-world packing of something like a python application.
This video helped me a lot though, but unfortunately there are a few minutes of broken audio in the middle [Everything You Always Wanted To Know About Nix (But Were Afraid To Ask) - YouTube](https://www.youtube.com/watch?v=2mG0zM_wtYs)

https://news.ycombinator.com/item?id=25191466

## process

For packages that have a standard expression format, and the build hasn’t fundamentally changed, they could just update the package doing:

```bash
$ git checkout -b bump-mypkg
$ nix-shell -p nix-update --run 'nix-update <pkg> --commit'
$ nix-build -A <pkg> # ensure it builds
$ git push <fork> bump-mypkg
```

and then create a PR with the bump. It is more involved, but less involved than finding where the nix expression lives, finding the latest version, update version, calculate new sha, building it, making a commit, then pushing to a fork.

For patch bumps, the above code is probably sufficient. For larger changes, there will some nix knowledge needed.

https://discourse.nixos.org/t/flag-packages-out-of-date/12612/18

## getting PR-s reviewed

samuela

My personal experience with the nixpkgs reviewing process is that either my PRs are reviewed and merged almost immediately (huge shout out to @Sandro!), or they linger unreviewed and unmerged forever.

aanderse

my advice is to become annoying :grinning_face_with_smiling_eyes: I kept pinging people until my PRs were merged.

Sandro

There are some things you can do to make your PRs easier to merge:

- Make one PR per package/change. Shorter PRs take way less time to review and are more fun to review. It is totally fine to also change things like missing completion scripts in an update PR.
- Look on your open PRs after a few hours when hopefully ofborg is done. If not please start the bot manually. That makes a huge difference since the reviewer don’t need to wait and maybe someone is pinged who can help you with the merge. Maybe something failed and you can already fix it without any reviewer looking at the changes. Maybe the rebuild count is high and you can already re-target to staging.
- Compare your package to recently new packages from the same eco system. Are they doing something different? Maybe there are newer functions I could adopt?
- Are there things you are unsure about or don’t know how to do in a cleaner way? Add a comment on that line. This can avoid back and forth questions why something is how it is and can’t be done in a nicer way. Most of the time such things should have a comment that the next person that looks at that code in 6 months still knows what’s going on. You never know, it might be you.

https://discourse.nixos.org/t/proposal-require-pr-authors-to-review-other-prs/16242/10

## how many developers with commit access

There are currently 139 people with commit access to nixos/nixpkgs. The list isn’t public, but as a committer, I can see it. I’d personally be in favor of making this list public.

https://discourse.nixos.org/t/trust-model-for-nixpkgs/9450/7

## bot

- a simple bot that checks for updates every 12 hours and creates PRs so you don't have to https://github.com/samuela/nixpkgs-upkeep
