## Offline

npm5 with an existing node_modules folder still goes out to the internet and checks some data whereas yarn does not

it's configurable and you can set --prefer-offline to true to avoid it

https://news.ycombinator.com/item?id=14423412

## Speed

I built a project to compare yarn and npm. See https://github.com/thomaschaaf/npm-vs-yarn

The different shows how much better npm@5 is :)

It installs two node.js projects (react & ghost) and shows how long it takes to do under multiple scenarios (cold cache, installed and lockfile). It is automatically run each day. It also creates an average if one version is run multiple times.

https://news.ycombinator.com/item?id=14423356


Just tried on a couple of projects with a lot of dependencies, we moved to yarn a while ago due to performance issues and it seems to be resolved.

On cold cache: Yarn: 20.94 seconds NPM5: 21.11 seconds

With cache: Yarn: 10.35 seconds NPM5: 15.20 seconds

For some reason, when node_modules folder is still there, yarn exits in a couple hundres milliseconds but npm5 does something for around 5 seconds.

Haven't checked lock file / installation consistency stuff. Yarn has been great on that too so we have no intention to go back but this is a decent release.

https://news.ycombinator.com/item?id=14423208

## Yarn doesn't support all of npm's features

A look through their issues on Github will reveal quite a few "npm supports this feature, yarn doesn't, plz add" entries. There are even more "this works in npm but not yarn, and I'm not sure why", many of which are also effectively a result of features/cases that npm supports and yarn doesn't. I don't have an exhaustive list or anything, but it's right there to see if you're interested enough to dig for a minute or two. It's pretty clearly not a drop-in replacement for npm—at least not yet.

My experience a couple months ago was that almost anything slightly off the path of the most basic use case rapidly entered "here be dragons" territory, such that every problem became "are we doing something wrong, or is yarn broken again?", which wasn't worth any benefits it provided. If you're just installing packages from NPM, and those packages don't do anything even slightly weird, it's probably fine.

[EDIT] a running theme of the issues is that a lot of correctness-checking and edge-case handling is missing or incomplete, in addition to some "strange" npm features not being supported. Anyway, here are a couple examples of what I'm talking about:

- https://github.com/yarnpkg/yarn/issues/3433
- https://github.com/yarnpkg/yarn/issues/3507
- https://github.com/yarnpkg/yarn/issues/2090

(last one has a lovely "why are you doing this?" as its first response, from the repo owner for bonus LULZ)

FAR from the only ones. IIRC one of our issues had something to do with Yarn totally rewriting the package.json of a package installed from a local directory, removing the "main" entry entirely, which broke it (obviously). Maybe it'll be something I use later, but right now I don't really want to have to wonder whether any given problem is due to some obscure breakage in my package manager when I can... just use npm and not worry about it.

https://news.ycombinator.com/item?id=14424638
