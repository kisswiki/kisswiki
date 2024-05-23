# awesome-zig

Everything I find about zig.

- https://github.com/catdevnull/awesome-zig
  - forked from https://github.com/nrdmn/awesome-zig
- https://github.com/C-BJ/awesome-zig

## Learn

- https://ziglang.org/learn/
- https://ziglang.org/documentation/master/std/#std;fmt.format
  - [overhaul std.fmt formatting api · Issue #1358 · ziglang/zig](https://github.com/ziglang/zig/issues/1358)
  - [zig/fmt.zig at master · ziglang/zig](https://github.com/ziglang/zig/blob/9f01598a498ecbd868cb81dc1efdb1507010c1b8/lib/std/fmt.zig#L55)
- https://github.com/ziglang/zig/wiki
- [Learning Zig - first hour...](http://ciesie.com/post/zig_learning_01/)
- https://ziglang.org/documentation/master/#Generic-Data-Structures
- https://github.com/Sobeston/ziglearn
  - [White background theme · Issue #97 · Sobeston/ziglearn](https://github.com/Sobeston/ziglearn/issues/97)
- https://andrewkelley.me/post/intro-to-zig.html
  - https://www.reddit.com/r/programming/comments/44skm2/introducing_the_zig_programming_language/
- https://andrewkelley.me/post/zig-programming-language-blurs-line-compile-time-run-time.html
- https://dev.to/stein/a-surprisingly-capable-rpn-calculator-in-about-100-lines-of-zig-code-3bf1
- https://kristoff.it/blog/zig-new-relationship-llvm/
  - https://www.reddit.com/r/programming/comments/j1azlo/zigs_new_relationship_with_llvm/
- https://kristoff.it/blog/what-is-zig-comptime/
- https://nelari.us/post/raytracer_with_rust_and_zig/

## News sources

- https://www.reddit.com/r/Zig
- https://zigforum.org
- https://twitter.com/ziglang
- https://twitter.com/search?q=ziglang&src=typed_query&f=live
- https://github.com/topics/zig-lang
- https://stackoverflow.com/questions/tagged/zig
- https://zig.show/
- https://dev.to/t/zig
- https://andrewkelley.me/
- [Andrew Kelley - YouTube](https://www.youtube.com/channel/UCUICU6mgcyGy61pojwuWyHA)
  - [2021: Year of the Linux Gaming Desktop - Andrew Kelley - YouTube](https://www.youtube.com/watch?v=pq1XqP4-qOo)
  - [Interview with Zig language creator Andrew Kelley - YouTube](https://www.youtube.com/watch?v=ZvskDoP09Ao)
  - [The Road to Zig 1.0 - Andrew Kelley - YouTube](https://www.youtube.com/watch?v=Gv2I7qTux7g)
  - [Zig: A programming language designed for robustness, optimality, and clarity –  Andrew Kelley - YouTube](https://www.youtube.com/watch?v=Z4oYSByyRak)
- https://vimeo.com/andrewrk
- https://news.ycombinator.com/threads?id=AndyKelley
- https://gist.github.com/LewisGaul/d5b303da9c03bf95f778c64e12ef1c5e - Collection of blog posts about the Zig programming language
- https://medium.com/tag/zig
- https://github.com/trending/zig?since=monthly
- https://gist.github.com/search?l=Zig&o=desc&q=zig&s=updated
- https://github.com/search?o=desc&q=language%3Azig&s=indexed&type=Code

## Code examples

- https://github.com/ziglang/zig/tree/master/lib/std - look at tests
- https://ziglang.org/learn/samples/
- https://github.com/ziglang/zig-spec/tree/master/grammar/tests
  - https://github.com/ziglang/zig-spec/blob/master/grammar/tests/syntax.zig
- https://github.com/winksaville/zig-explore
- https://github.com/slashlostfound/HelloWorld/blob/master/hello.zig
- https://rosettacode.org/wiki/Category:Zig
- https://github.com/mlarouche/ZigWwiseDemo - A elaborate sample on how to use Dear IMGUI, Win32, Direct3D 11 and Audiokinetic Wwise in Zig. Done for a presentation to showcase Zig for coworkers.
- https://github.com/benhoyt/countwords/blob/master/simple.zig
  - https://benhoyt.com/writings/count-words/
  - https://zigforum.org/t/intro-how-did-you-discover-zig/41/44
- https://github.com/ziglang/zig/wiki/Community-Projects
- https://github.com/leroycep/zig-wasm-assets - A playground to study loading game assets in the browser from Zig
- https://github.com/mattyhall/zolter - A program to track bike rides (from FIT files) with a nice terminal UI. Written in Zig
- https://github.com/dgbuckley/lipsum - A utility to mash up lines of text. The purpose of this project is to generate random lines of real text to be used for typing practice. To better practice actual code writing I created this to generate random input for keybr.com from existing code. The resulting text allows keybr.com to then test me using the full suit of characters I interact with when programming.
- https://github.com/aligator/todo - A zig cli client for https://github.com/dominikbraun/todo
- https://github.com/tarasyarema/zig-docker
- https://github.com/jlauman/zig_examples
  - https://github.com/jlauman/zig_examples/pull/1
    - my fixes https://github.com/rofrol/zig_examples/tree/fixes
  - https://github.com/jlauman/zig_examples/blob/ef439d2fe631580a4b78de032f96b28bf32158d8/92_file_rw/example.zig#L13
- https://github.com/pfgithub/zcho - it's like echo but written in zig and it has a few more options
- https://github.com/kprotty/zig-adaptive-lock - Benchmarking a faster std.Mutex implementation for Zig
- https://gist.github.com/kprotty/a46ab161136c9ad7d903203fb11a9ce3 - async_main.zig - Bit-vector + rand shuffle order scheduler
- https://gist.github.com/kprotty/0d2dc3da4840341d6ff361b27bdac7dc - ParkingLot.zig - Small & Fast synchronization primitives for Zig
- https://github.com/coilhq/tigerbeetle - A purpose-built financial accounting database, designed for high-throughput low-latency two-phase prepare/commit transfers between accounts, using io_uring as a foundation for fast I/O
- https://gist.github.com/creationix/a91f8d5ded4ba809f45d41d06e2780d2 - async-wasm.zig
- https://github.com/tauoverpi/scratch/tree/master/zig
- https://github.com/jeffkdev/sokol-zig-examples

## build.zig

- https://ziglang.org/learn/overview/#zig-build-system
- https://ziglearn.org/chapter-3/#zig-build
- https://zig.news/xq/zig-build-explained-part-1-59lf
- https://dev.to/mattnite/weaning-zig-off-of-git-submodules-1-3jen
- https://dev.to/fabioarnold/setup-zig-for-gamedev-2bmf

## Package manager, import

- [Zig tips: v0.11 std.build API / package manager changes | Hexops' devlog](https://devlog.hexops.com/2023/zig-0-11-breaking-build-changes/)
- [@import() and Packages - Zig NEWS ⚡](https://zig.news/mattnite/import-and-packages-23mb)
- [import zig package from another zig package - Stack Overflow](https://stackoverflow.com/questions/68421136/import-zig-package-from-another-zig-package/75301059#75301059)
- [zigmod/docs at master · nektro/zigmod · GitHub](https://github.com/nektro/zigmod/tree/master/docs)
- [mattnite/gyro: A Zig package manager with an index, build runner, and build dependencies.](https://github.com/mattnite/gyro)
- https://github.com/topics/zig-package
- https://github.com/zigtools/zpm - Express shipping for your Zig packages!
  - https://zpm.random-projects.net/
  - List all repositories

```
curl -H 'Accept: application/vnd.github.mercy-preview+json' \
  'https://api.github.com/search/repositories?q=topic:zig-package' \
| jq '.items[].full_name'
```

- https://github.com/mattnite/gyro - A zig package manager with an index, build runner, and build dependencies, formely zkg
  - can freeze deps in `gyro.lock`
  - https://astrolabe.pm/ - zig packages
  - [zkg: un unofficial package manager](https://youtu.be/1yiCgMHDu4k)
  - Used by https://github.com/truemedian/zfetch
  - [Weaning Zig off of git submodules 1: Intro - DEV Community](https://dev.to/mattnite/weaning-zig-off-of-git-submodules-1-3jen)
- https://www.reddit.com/r/Zig/comments/lozuzy/zigmod_a_package_manager_for_zig/
- https://www.reddit.com/r/Zig/comments/a4cbeh/some_thoughts_after_intense_zig_sprints/
  - [enforce semver major version when publishing package · Issue #404 · ziglang/zig](https://github.com/ziglang/zig/issues/404)
  - [package manager · Issue #943 · ziglang/zig](https://github.com/ziglang/zig/issues/943)
  - [Andrew Kelley on Twitter: "Something I'm considering when designing the Zig package manager. This social problem can be solved with better tools. Consider: _ decentralized, locked packages, must intentionally update _ metadata saying "module maintained reluctantly" \* detect code from new authors" / Twitter](https://twitter.com/andy_kelley/status/1067285221144444928)
- https://www.lukewilson.me/blog/a-race-for-package-managers-zig/

## Packages and libs

- https://github.com/ziglibs
  - https://github.com/ziglibs/repository
- [Issues · zigforum/needed-libraries](https://github.com/zigforum/needed-libraries/issues)
- https://github.com/marler8997/zog - Some zig libraries
- https://github.com/zigtools
- https://github.com/zigtools/zpm-server - Open API Server providing a filterable list of curated Zig packages
- https://github.com/frmdstryr/zig-datetime - A date and time module for Zig
- https://github.com/frmdstryr/zig-mimetypes - A mimetypes module for Zig
- https://github.com/frmdstryr/zig-kiwi - A cassowary constraint solver in zig
- https://git.sr.ht/~jamii/imp
  - https://scattered-thoughts.net/writing/imp-intro/
  - https://github.com/ziglibs/known-folders - Provides access to well-known folders across several operating systems
- https://github.com/ifreund/river
- https://github.com/lithdew/hyperia
- https://github.com/Hejsil/zig-clap - Simple command line argument parsing library
- https://github.com/MasterQ32/zig-args - Simple-to-use argument parser with struct-based config
- https://github.com/alexnask/interface.zig - Dynamic dispatch for zig made easy
- https://github.com/alexnask/PeerType - Zig peer type resolution at comptime, ported from the compiler source code
- https://github.com/alexnask/ctregex.zig - Compile time regular expressions in zig
- https://github.com/Luukdegram/juicebox - Tiled Window Manager written in Zig
- https://github.com/alexnask/lepto.zig - Date and time library for zig, inspired by C++20 std::chrono
- https://github.com/mlarouche/stringtime - String template engine for Zig.
- https://github.com/kivikakk/koino - CommonMark + GFM compatible Markdown parser and renderer
- https://github.com/kivikakk/libpcre.zig - Zig bindings to libpcre
- https://github.com/gernest/zunicode
- https://github.com/travisstaloch/template.zig - comptime templates
- https://github.com/haze/etch - zig template framework
- https://github.com/suirad/zig-safe-return - Small library to check if returned pointers are pointing to the current stack frame
- https://github.com/darkr4y/OffensiveZig - Some attempts at using https://ziglang.org/ in penetration testing.
  - https://github.com/darkr4y/OffensiveZig/blob/main/src/try-to-learn-zig-in-y.zig
- https://github.com/marlersoft/zigwin32gen - Complete Autogenerated Zig bindings for Windows.
- https://github.com/suirad/zig-strings
- https://github.com/leroycep/zig-tzif - This repository implements TZif parsing, according to RFC 8536
- https://github.com/beho/zig-csv - Low-level CSV parser library for Zig language
- https://github.com/ziglibs/zinput - A Zig command-line input library
- https://github.com/ziglibs/zig-windows-console - Zig Windows Console stuff
- https://github.com/ziglibs/lscolors - zig library for colorizing paths according to LS_COLORS
- https://github.com/ziglibs/ansi-term - Zig library for dealing with ANSI Terminals (escape codes, styles, etc.). This was originally code which was extracted from lscolors for use in other zig libraries. More features have been added since
- https://github.com/ziglibs/funzig - Fun functional functionality for Zig
- https://github.com/ziglibs/string-searching - String(not limited to []const u8)-searching algorithms in zig
- https://github.com/ziglibs/computils - Zig utilities for all your comptime needs
- https://github.com/ziglibs/comptemplate - Comptime Templates
- https://github.com/ziglibs/painterz - Low-level implementation of different painting primitives (lines, rectangles, ...) without specialization on a certain draw target
- https://github.com/ziglibs/zwin - Making windows with Zig! (Only works on Windows at the moment)
- https://github.com/ziglibs/zstd - An extremely simple zstd wrapper for the programming language zig
- https://github.com/zenith391/zgt - Zig GUI Toolkit
- https://github.com/leecannon/zig-bootboot - A zig'ified BOOTBOOT header file
  - https://gitlab.com/bztsrc/bootboot - multi platform micro-kernel loader
- https://github.com/Hejsil/mecha - A parser combinator library for Zig
- https://github.com/fivemoreminix/zig-gap-buffer - A gap buffer implementation for Zig
- https://github.com/leecannon/zig-xbeam - A very partial re-implementation of the rust crate crossbeam
- https://github.com/nektro/zig-licenses - generated data from https://spdx.org/licenses/
- https://github.com/Sobeston/table-helper - A small zig package for fmt printing tables
- https://github.com/nektro/zig-tracy - Zig bindings for the Tracy profiler
- https://github.com/gruebite/zzz - Simple and boring human readable data format for Zig
- https://github.com/nektro/zig-ansi - ANSI utilities for CLI usage in Zig
- https://github.com/nektro/zig-zlib - zlib wrapper for Zig
- https://github.com/mattnite/ZLibBuilder - build zlib with the zig compiler
- https://github.com/leecannon/zig-pc_keyboard - A zig reimplementation of the pc-keyboard rust crate
- https://github.com/leroycep/zig-ulid - implements some functions for working with ULIDs in zig
- https://github.com/max-the-mage/tagged-union-struct
- https://github.com/mattnite/tar - tar library that has a bad interface ngl
- https://github.com/travisstaloch/art.zig - This library provides a zig implementation of the Adaptive Radix Tree or ART
- https://github.com/gaultier/zig-bencode - Zig bencode encoder/decoder
- https://github.com/Aransentin/zigwin - A Zig windowing library
- https://github.com/fourst4r/ztxt - A lil text editor project to test out Zig
- https://github.com/gitabaz/zigblas - Zig bindings for BLAS
- https://github.com/gitabaz/zigsh - A shell written in zig
- https://github.com/taskforcesh/bullmq-redis - BullMQ - Redis Module for handling queues of jobs and messages.
- https://github.com/devzero/parzival - A comptime-based parsing library for the Zig language
- https://gist.github.com/tuket/3b657d8ccadb54ca69a9c0ac4d387789 - paint in zig using SDL2
- Aims to provide high- and low-level utilites for building VST 2.4 plugins with Zig https://github.com/schroffl/zig-vst/
- a commandline fuzzy finder designed for filtering filepaths https://github.com/natecraddock/zf

## code editor

- https://git.sr.ht/~jamii/focus
- https://github.com/MasterQ32/TextEditor
- https://github.com/sergey6661313/ScalpiEditor
- https://github.com/greenfork/kisa
  - https://www.youtube.com/watch?v=XCvM_xRtWBg&list=PLp9tIOjPeMvtwQej_NhbC1k9NHWxDSpzx

## Database

- https://github.com/kristoff-it/zig-okredis - Zero-allocation Client for Redis 6+
- https://github.com/lithdew/lmdb-zig - Lightweight, fully-featured, idiomatic cross-platform Zig bindings to Lightning Memory-Mapped Database (LMDB)
- - https://www.reddit.com/r/Zig/comments/jkleeu/zigsqlite_small_wrapper_around_sqlites_c_api/

## Exercises

### Ziglings

- [ratfactor/ziglings: Learn the Zig programming language by fixing tiny broken programs.](https://github.com/ratfactor/ziglings)
- [Ziglings: Learn Zig by fixing little programs](https://www.reddit.com/r/Zig/comments/lgikvn/ziglings_learn_zig_by_fixing_little_programs/)
- [Ziglings: Learn the Zig programming language by fixing tiny broken programs](https://news.ycombinator.com/item?id=26125063)
- [Ziglings! Playing with Zig ⚡ - YouTube](https://www.youtube.com/watch?v=ghYEiGXxiGk)
- [Ziglings: Learn the Zig programming language by fixing tiny broken programs](https://news.ycombinator.com/item?id=26125063)

### Euler

- https://github.com/bondrewd/euler
- https://github.com/Sobeston/euler

### Advent of Code

- https://github.com/SpexGuy/Zig-AoC-Template
- https://github.com/fyrchik/aoc2020zig
- https://github.com/SpexGuy/AoC-2020
  https://github.com/zigster64/advent_of_code2020
- https://code.ur.gs/lupine/aoc2019
- https://github.com/rkallos/aoc2018
- https://github.com/Hejsil/advent-of-code-2018
- https://github.com/katafrakt/advent_of_code_2019/tree/master/04%20%5BZig%5D
- https://github.com/andrewrk/advent-of-code
- https://www.reddit.com/r/Zig/comments/e0sy0q/advent_of_code_2019_ziguana_leaderboard/
  - https://adventofcode.com/2019/leaderboard/private/view/384812
- https://dev.to/katafrakt/advent-of-code-day-4-in-zig-23o7
- [Zig Live Coding - Advent of Code 2019, Day 2 on Vimeo](https://vimeo.com/491488991)
- [4D game of life ⚡ Advent of Code in Zig Day 17 - YouTube](https://www.youtube.com/watch?v=pRJaMnc0Res)
- https://github.com/zanderxyz/advent-of-code
- https://github.com/pqflx3/aoc20
- https://github.com/GoNZooo/advent-of-code
- https://github.com/wooky/aoc
- https://github.com/devzero/aoc2020
- https://github.com/alexguirre/aoc-2020
- https://github.com/pjz/aoc-2020-zig
- https://github.com/theInkSquid/aoc-2020
- https://github.com/Sinitax/aoc-2020
- https://github.com/SpexGuy/Advent2021
- https://github.com/danslocombe/advent-of-code-2021
- https://github.com/LewisGaul/zig-aoc-2021
- https://www.reddit.com/r/Zig/comments/s60t8j/failing_to_learn_zig_via_advent_of_code/
- https://www.reddit.com/r/Zig/comments/rpq2fp/a_review_of_the_zig_programming_language_using/
  - https://github.com/sheredom/AOC2021
- https://github.com/Bogdanp/awesome-advent-of-code#zig

### Exercism

- https://github.com/ganderzz/zig-exercism - Exercism Programming Exercises in Zig

### Other

- https://code.golf/
- [Code Golf now supports Zig : Zig](https://www.reddit.com/r/Zig/comments/jhdp47/code_golf_now_supports_zig/)
- Leaderboard https://code.golf/scores/all-holes/zig/chars
- https://github.com/kanaka/mal/blob/master/impls/zig
- https://github.com/alecstein/word-chains - Get from the word "war" to "peace" by making a sequence of moves: either adding, deleting, or changing a letter. Each move must result in a new English word

## Async

- https://kristoff.it/blog/zig-colorblind-async-await/
  - https://www.reddit.com/r/Zig/comments/lwnlbz/trying_to_understand_the_colorless_async_handling/
  - https://www.reddit.com/r/programming/comments/hds7qm/what_is_zigs_colorblind_asyncawait/
- https://github.com/kprotty/zap - An asynchronous runtime with a focus on performance and resource efficiency
- https://github.com/Hejsil/lemonbar-maker - This is me trying out the event loop and async by creating a program that produces bar strings for lemonbar

## Networking and HTTP

- https://github.com/zigforum/needed-libraries/issues/3
- https://github.com/kristoff-it/bork - A Twitch chat client for the terminal
  - recommended as good example for async use
- https://github.com/Vexu/routez
- [Zig and Full stack web development · Issue #942 · ziglang/zig](https://github.com/ziglang/zig/issues/942)
- [http server in zig? : Zig](https://www.reddit.com/r/Zig/comments/bdp2ym/http_server_in_zig/)
- [I/O free HTTP/1.1 implementation for Zig 🦎 : Zig](https://www.reddit.com/r/Zig/comments/g776wm/io_free_http11_implementation_for_zig/)
- https://github.com/kristoff-it/bork - A Twitch chat client for the terminal
  - [Bork low effort demo lol - YouTube](https://www.youtube.com/watch?v=Px8rVB3ZpKA)
- https://github.com/kivikakk/kaksikud - smol gemini server
- https://github.com/MasterQ32/gurl - A curl-like cli application to interact with Gemini sites
- https://github.com/kivikakk/htmlentities.zig - HTML entity data for Zig
- https://github.com/truemedian/hzzp - A I/O agnostic HTTP/1.1 parser and encoder for Zig
- https://github.com/truemedian/zfetch - A HTTP request library for Zig with HTTPS support
- https://github.com/fengb/zigbot9001 - Officially unofficial bot for the officially unofficial Zig Discord server
- https://github.com/truemedian/wz/ - An I/O agnostic WebSocket 1.3 library for Zig
- https://github.com/alexnask/analysis-buddy - Analysis buddy for the zig issue linker discord bot
- https://github.com/haze/zirconium - irc
- https://github.com/travisstaloch/zig-ircbot
- https://github.com/lun-4/zigdig - naive dns client library in zig
- [http client in the standard library · Issue #2007 · ziglang/zig](https://github.com/ziglang/zig/issues/2007)
- https://github.com/ducdetronquito/http - HTTP core types for Zig 🦴
  - https://www.reddit.com/r/Zig/comments/ixwl3w/http_core_types_for_zig/
- https://github.com/Vexu/zuri - URI parser for Zig
- https://github.com/ducdetronquito/h11 - I/O free HTTP/1.1 implementation for Zig 🦎
- https://github.com/MasterQ32/zig-network - A smallest-common-subset of socket functions for crossplatform networking, TCP & UDP
  - https://github.com/MasterQ32/zig-network/pull/28 - Using echo example
- https://github.com/marler8997/ziget - Zig library/tool to request network assets
- [I like Zig, but it doesnt even have a HTTP client yet: https://github.com/zigla...](https://news.ycombinator.com/item?id=20116912)
- [ziget: A Zig HTTP Client : Zig](https://www.reddit.com/r/Zig/comments/gs064f/ziget_a_zig_http_client/)
- [An example of a zig tcp client? : Zig](https://www.reddit.com/r/Zig/comments/avgzcz/an_example_of_a_zig_tcp_client/)
- https://github.com/tiehuis/zig-nng-example - Simple async server/client example using nng
- https://github.com/ducdetronquito/requestz - HTTP client for Zig 🦎
  - https://www.reddit.com/r/Zig/comments/ju1hud/requestz_http_client_for_zig/
- https://www.reddit.com/r/Zig/comments/it8h92/any_workable_http_clients_or_working_examples/
- https://github.com/frmdstryr/zhp - A Http server written in Zig
  - Uses https://github.com/purringChaos/searchwrap
- https://github.com/Sobeston/zigcord - A discord library in zig.
- https://github.com/Sobeston/html-tree - A small zig library for writing trees of html
- https://github.com/euantorano/ip.zig - A Zig library for working with IP Addresses
- https://github.com/Hejsil/anilist/blob/master/src/main.zig#L416 - example curl usage
- https://github.com/fengb/zCord - Discord API with zero allocations in the critical path
- https://github.com/mattnite/download - zig library for downloading files for build scripts
- https://github.com/Hejsil/anilist - A simple cli program for keeping a local anime watch list
  - example of using curl https://github.com/Hejsil/anilist/blob/master/src/main.zig#L416
- https://github.com/haze/zex - (will probably be renamed) zig curl wrapper
- https://github.com/ziglang/www.ziglang.org/blob/111f3dc0464604ef66062e1e49d886ad3d4eb014/assets/zig-code/samples/5-curl.zig
- https://github.com/gaultier/zorrent - Zig torrent library and client
- https://github.com/donpdonp/zootdeck - Fediverse GTK Desktop Reader
- https://github.com/remeh/statsd-zig - Basic DogStatsD UDP server supporting gauges and counters and sending these metrics to Datadog
- https://gist.github.com/creationix/1c11d155c40f09b656ae9ef4bcb986c5 - websockets

## Security and Cryptography

- https://github.com/lithdew/pike - Async I/O for Zig
- https://github.com/Hejsil/mecha - A parser combinator library for Zig
- https://github.com/lithdew/snow - A small, fast, cross-platform, async Zig networking framework built on top of lithdew/pike.
- https://github.com/alexnask/iguanaTLS - Minimal, experimental TLS 1.2 implementation in Zig
- https://github.com/MasterQ32/zig-bearssl/
- https://github.com/jedisct1/zig-minisign - A Zig implementation of Minisign, a tool to verify signatures
- https://github.com/jedisct1/zig-alzette - Implementation of the Alzette box and CRAX block cipher in Zig
- https://github.com/jedisct1/zig-charm - A Zig version of the Charm crypto library
- https://github.com/jedisct1/zig-blind-rsa-signatures - Blind RSA signatures implementation for Zig
- https://github.com/leroycep/chrono-zig - A Zig port of the Rust crate chrono

## Math

- https://github.com/ziglibs/zlm - Zig linear mathemathics
  - used by https://github.com/wozeparrot/laddercraft
- https://github.com/leroycep/zigmath

## Games

- https://github.com/SpexGuy/TotallyNotTetris - A game that totally isn't tetris, built with Vulkan in Zig
- https://github.com/fabioarnold/zig-gorillas - A clone of the classic QBasic Gorillas written in the Zig programming language
- https://github.com/leroycep/2021-7drl - My project for the 2021 7 day roguelike
- https://github.com/wozeparrot/laddercraft - High-Performance Minecraft Server Written In Zig
- https://github.com/leroycep/2021-7drl - My project for the 2021 7 day roguelike
  - https://7drl.com/
    - https://itch.io/jams
- https://github.com/alecstein/conways-game-of-life
- https://github.com/zig-community/Zig-Showdown - A community effort to create a small multiplayer 3D shooter game in pure zig
- https://github.com/charlieman/handmade-zero - Handmade Hero written in ⚡ Zig ⚡
- https://github.com/campbellhome/zig_platformer
- https://github.com/PurityLake/zig-tetris
- https://github.com/kdelwat/riptide-engine - Riptide is a UCI-compatible chess engine and the successor to ChessSlayer. It started as a straight port of ChessSlayer from Go to Zig, but is becoming a more performant and advanced engine over time.

## Game Dev

- https://github.com/SpexGuy/Zig-ECS - A Unity-style ECS written in Zig
- https://github.com/prime31/zig-ecs - This is a zigification of the fantasic Entt
  - used by https://github.com/leroycep/2021-7drl
- https://github.com/prime31/zig-upaya Zig-based framework for creating game tools and helper apps
- https://www.reddit.com/r/Zig/comments/jgsod9/zalgebra_linear_algebra_library_for_mostly_games/
- https://github.com/SpexGuy/Zig-Gltf-Display - A program that displays glTF files using Vulkan, written in Zig
- https://github.com/ordovician/Zusion2D
- https://www.reddit.com/r/Zig/comments/m4bo8l/setup_zig_for_gamedev/
- https://github.com/leroycep/seizer - Cross platform Zig library for obtaining a rendering context and loading assets
  - [Introducing `seizer` -- a library for developing cross-platform games - Domains / Gamedev - The Zig Programming Language Forum](https://zigforum.org/t/introducing-seizer-a-library-for-developing-cross-platform-games/124)
- https://github.com/Beefster09/ziptile - Tilemapping and sprite engine - experimenting with Zig
- https://github.com/winksaville/zig-geometry - Mathematical routines for 3D geometry
  - https://github.com/andrewrk/tetris/blob/master/src/math3d.zig
- https://github.com/MasterQ32/zig-gamedev-lib - xq's Zig Game Development Library
- https://github.com/anholt/libepoxy - Epoxy is a library for handling OpenGL function pointer management for you
- https://github.com/zenith391/didot - Zig 3D game engine.
- https://www.reddit.com/r/Zig/comments/ivp9i1/3d_game_engine_in_zig/
- https://dev.to/fabioarnold/setup-zig-for-gamedev-2bmf
- https://github.com/mkeeter/futureproof
  - [Futureproof - Live editor for GPU shaders, built on Zig, Neovim, and WebGPU. : Zig](https://www.reddit.com/r/Zig/comments/kmc93b/futureproof_live_editor_for_gpu_shaders_built_on/)
- https://github.com/ysgard/sprite-blitting-zig - Sprite blitting example using SDL2 and Zig
- https://github.com/Iridescence-Technologies/zglfw - A thin, idiomatic wrapper for GLFW. Written in Zig, for Zig
- https://github.com/scurest/zimodre - Convert 3DS Monster Hunter .mod files to glTF
- https://github.com/prime31/zig-ecs - This is a zigification of the fantasic Entt
- https://github.com/mattnite/SdlBuilder - zig builder for SDL2
- https://github.com/mattnite/sdl-example
- https://github.com/ziglibs/zgl - This library provides a thin, type-safe binding for OpenGL on top of libepoxy
- https://github.com/ryuukk/zark - 2D & 3D Game Framework written in Zig, inspired by libGDX/XNA
- https://github.com/LakeByTheWoods/zig-bgfx-sdl2 - Minimal zig project to get bgfx running with sdl2
- https://github.com/Bekwnn/Eden - A game framework written in Zig, built on SDL2

## Image

- https://github.com/ifreund/zig-pixman - bindings for pixman
- https://github.com/ziglibs/painterz - Low-level implementation of different painting primitives (lines, rectangles, ...) without specialization on a certain draw target
- https://github.com/fabioarnold/MiniPixel

## Audio/Sound

- https://github.com/prime31/zig-miniaudio
- https://github.com/mattnite/ebur128 - libebur128 (EBU R 128 loudness normalization) zig wrapper
  - https://github.com/jiixyj/loudness-scanner - A tool that scans your music files and tags them with loudness information

## Embedded and ARM

- https://github.com/nrdmn/awesome-zig#bootables
- https://github.com/markfirmware/zig-vector-table
- https://www.reddit.com/r/Zig/comments/l8ii2s/zig_for_embedded/
  - https://github.com/tralamazza/embedded_zig
- [Using Zig in deep embedded development (ARM Cortex-M) — sourcehut lists](https://lists.sr.ht/~andrewrk/ziglang/%3CCAOM9R7L1YuEOBcnH9u2NRnDRw0UFzydhv-9E%3DB0m7JBKnpAo9A%40mail.gmail.com%3E)
- [I experimented with Zig for embedded programming. The language is very promising...](https://news.ycombinator.com/item?id=17190125)
- https://github.com/kivikakk/daintree - ARMv8-A/RISC-V kernel (with UEFI bootloader)
- https://github.com/kivikakk/dtb.zig - parse device tree blobs
- [Daintree: ARM + RISC-V kernel in Zig - Domains / OSdev - The Zig Programming Language Forum](https://zigforum.org/t/daintree-arm-risc-v-kernel-in-zig/123)
- [Hello Uefi-Zig World; a first look at an UEFI bootable kernel in Zig. : Zig](https://www.reddit.com/r/Zig/comments/icilxc/hello_uefizig_world_a_first_look_at_an_uefi/)
- https://codelv.com/blog/2020/5/using-zig-and-the-stm32h7-to-drive-stepper-motors
  - https://www.reddit.com/r/Zig/comments/maq23d/using_zig_and_the_stm32h7_to_drive_stepper_motors/
- https://www.reddit.com/r/rust/comments/aq473x/moving_to_zig_from_rust_for_arm_development/
- https://ziglaunch.org/posts/cross-compiled-freestanding-library-for-cortex-m4/

## Android

- https://github.com/MasterQ32/ZigAndroidTemplate - This repository contains a example on how to create a minimal Android app in Zig

## Allocator

- https://ziglang.org/documentation/master/#Choosing-an-Allocator
- [Zig Live Coding: Allocators & Memory Management on Vimeo](https://vimeo.com/showcase/7818787/video/483929038)
- [What's a Memory Allocator Anyway? - Benjamin Feng](https://www.youtube.com/watch?v=vHWiDx_l4V0)
- https://github.com/fengb/zee_alloc - tiny Zig allocator primarily targeting WebAssembly
- https://stackoverflow.com/questions/64301274/allocating-a-generic-struct-in-zig-lang
- https://github.com/andrewrk/zig-general-purpose-allocator - work-in-progress general purpose allocator intended to be eventually merged into Zig standard library. live streamed development
- https://github.com/dbandstra/zig-hunk - Basic stack allocator for Zig
- https://github.com/marler8997/zigalloc - an allocation library for zig
- https://www.reddit.com/r/Zig/comments/hoxapo/adma_general_purpose_slab_allocator_for_zig/
- https://github.com/ziglang/zig/blob/master/lib/std/mem/Allocator.zig
- https://github.com/SpexGuy/Zig-Allocators - An allocator library for Zig, based on allocating fixed-size chunks from the OS

## Misc

- [Why I rewrote my Rust keyboard firmware in Zig: consistency, mastery, and fun](https://kevinlynagh.com/rust-zig/)
  - https://news.ycombinator.com/item?id=24615916
- [struct definition with var instead of const in zig language - Stack Overflow](https://stackoverflow.com/questions/62554187/struct-definition-with-var-instead-of-const-in-zig-language)
- [Zig in 30 minutes](https://gist.github.com/ityonemo/769532c2017ed9143f3571e5ac104e50)
  - https://news.ycombinator.com/item?id=25618302
  - https://www.reddit.com/r/programming/comments/kpirah/zig_in_30_minutes/
- [Is Zig the Long Awaited C Replacement? | by Erik Engheim | Medium](https://erik-engheim.medium.com/is-zig-the-long-awaited-c-replacement-c8eeace1e692)
- [c++ - Integer division overflows - Stack Overflow](https://stackoverflow.com/questions/30394086/integer-division-overflows)
- [C++ vs Zig Template Based Programming | by Erik Engheim | Level Up Coding](https://levelup.gitconnected.com/c-vs-zig-template-based-programming-d3e248885aa)
- https://web.archive.org/web/20210316230834if_/https://levelup.gitconnected.com/c-vs-zig-template-based-programming-d3e248885aa?gi=7a25d503b34f
- https://web.archive.org/web/20210301143402/https://medium.com/swlh/zig-the-introduction-dcd173a86975
- [Programming languages [Thoughts on Zig]\_Lobsters - MdEditor](https://www.mdeditor.tw/pl/pgts)
- [Models of Generics and Metaprogramming: Go, Rust, Swift, D and More - Tristan Hume](https://thume.ca/2019/07/14/a-tour-of-metaprogramming-models-for-generics/)
- [Software Reliability C++ vs Zig. A tiny comparison of C++ and Zig in… | by Erik Engheim | Nov, 2020 | Medium](https://web.archive.org/web/20210107210155/https://erik-engheim.medium.com/software-reliability-c-vs-zig-dbb2d0005b9c)
- [Understanding the Zig Programming Language | The Startup](https://web.archive.org/web/20210301143402/https://medium.com/swlh/zig-the-introduction-dcd173a86975)
- [Gotchas when Doing Zig Programming (v0.7) | by Erik Engheim | Medium](https://erik-engheim.medium.com/gotchas-with-zig-optionals-and-errorsets-in-loops-516fcac3ea94)
- https://tiehu.is/blog/zig2.html
- [8 Big Ideas From 8 Programming Languages | by Erik Engheim | Better Programming](https://betterprogramming.pub/eight-big-ideas-from-eight-programming-languages-f3be5f6c9701)
- [Zig: A programming language designed for robustness, optimality, and clarity – Andrew Kelley - YouTube](https://www.youtube.com/watch?v=Z4oYSByyRak)
- [Why Zig when there is already C++, D, and Rust?](https://news.ycombinator.com/item?id=25797025)
- https://scattered-thoughts.net/writing/assorted-thoughts-on-zig-and-rust/
  - [Assorted Thoughts on Zig and Rust](https://news.ycombinator.com/item?id=24835357)
  - https://www.reddit.com/r/rust/duplicates/jekjeo/assorted_thoughts_on_zig_and_rust/
  - https://www.reddit.com/r/Zig/comments/jeeulv/assorted_thoughts_on_zig_and_rust/
  - https://www.reddit.com/r/programming/comments/jepu9n/assorted_thoughts_on_zig_and_rust/
  - https://www.reddit.com/r/rust/comments/jekjeo/assorted_thoughts_on_zig_and_rust/
- [`zig cc`: a Powerful Drop-In Replacement for GCC/Clang - Andrew Kelley](https://andrewkelley.me/post/zig-cc-powerful-drop-in-replacement-gcc-clang.html)
- [Why you should learn Zig - DEV Community](https://dev.to/hanna/why-you-should-learn-zig-329a)
- [How to Write a Redis Module in Zig | Redis Labs](https://redislabs.com/blog/write-redis-module-zig/)
- [Zig programming language / Sudo Null IT News](https://sudonull.com/post/3683-Zig-programming-language)
- [I'm watching Zig and Jai closely. We need a better C and C++ isn't it. Good luck...](https://news.ycombinator.com/item?id=18424471)
- [Generation of types in zig (zig language) - Stack Overflow](https://stackoverflow.com/questions/61466724/generation-of-types-in-zig-zig-language)
- [What do C programmers think of the Zig language? : C_Programming](https://www.reddit.com/r/C_Programming/comments/9bv2tx/what_do_c_programmers_think_of_the_zig_language/)
- [New challenger joins Rust to topple C language | InfoWorld](https://www.infoworld.com/article/3113083/new-challenger-joins-rust-to-upend-c-language.html)
- [enumerate all kinds of undefined behavior, even that which cannot be safety-checked · Issue #1966 · ziglang/zig](https://github.com/ziglang/zig/issues/1966)
- [make Debug and ReleaseSafe modes fully safe · Issue #2301 · ziglang/zig](https://github.com/ziglang/zig/issues/2301)
- [Why Zig When There is Already CPP, D, and Rust? · ziglang/zig Wiki](https://github.com/ziglang/zig/wiki/Why-Zig-When-There-is-Already-CPP,-D,-and-Rust%3F)
- https://github.com/ziglang/zig/projects
  - [Linux kernel module](https://github.com/ziglang/zig/projects/5)
  - [Safety](https://github.com/ziglang/zig/projects/3)
- [Rust, Zig, and the Futility of "Replacing" C : rust](https://www.reddit.com/r/rust/comments/luawx6/rust_zig_and_the_futility_of_replacing_c/)
- [Interview with Zig language creator Andrew Kelley : programming](https://www.reddit.com/r/programming/comments/igzqj3/interview_with_zig_language_creator_andrew_kelley/)
- [Zig compiler internals. : ProgrammingLanguages](https://www.reddit.com/r/ProgrammingLanguages/comments/fj54un/zig_compiler_internals/)
- [Zig CC Cross Compiling follows the same philosophy as Go : golang](https://www.reddit.com/r/golang/comments/k948l5/zig_cc_cross_compiling_follows_the_same/)
- [Trying Zig with C web servers - dermetfan](http://dermetfan.net/posts/zig-with-c-web-servers.html)
- [Odin seems rather similar to Zig: https://ziglang.org/ It would be interesting ...](https://news.ycombinator.com/item?id=22203861)
- [I think Zig will reserve a few interesting surprises also in the webdev world, i...](https://news.ycombinator.com/item?id=24616069)
- https://www.reddit.com/r/Zig/comments/mavl69/how_safe_is_zig/
- https://www.reddit.com/r/Zig/comments/mc312h/a_better_c_benchmark/
- https://www.reddit.com/r/Zig/comments/m29mt5/zig_parser_combinators_and_why_theyre_awesome/
- [Learning About ELF With Zig | g-w1’s Blog](https://g-w1.github.io/blog/zig/low-level/2021/03/15/elf-linux.html)
- [Opinions on Zig? Is it suckless? What about other languages? What does a language good for you? : suckless](https://www.reddit.com/r/suckless/comments/mc824m/opinions_on_zig_is_it_suckless_what_about_other/)
- https://www.reddit.com/r/Zig/comments/gq07n1/example_of_using_io_uring_for_file_readwrites/
- [Proposal: User definable type constraints on polymorphic parameters · Issue #1669 · ziglang/zig](https://github.com/ziglang/zig/issues/1669)
- [Andrew Kelley: Why I'm donating $150/month (10% of my income) to the musl libc project : Zig](https://www.reddit.com/r/Zig/comments/c4yup3/andrew_kelley_why_im_donating_150month_10_of_my/)
- [Why I'm donating $150/month (10% of my income) to the musl libc project - Andrew Kelley](https://andrewkelley.me/post/why-donating-to-musl-libc-project.html)
- [I'm donating $150/month to the musl libc project](https://news.ycombinator.com/item?id=20268087)
- [Andrew Kelley on Twitter: "About to merge this: @ziglang gains anonymous struct literals and anonymous list literals. After this, var args can be deleted from the language. Good riddance! https://t.co/Ep5dk7L5oL" / Twitter](https://twitter.com/andy_kelley/status/1194046250909392902)
- https://itscomputersciencetime.netlify.app/zig-thoughts/
- https://www.reddit.com/r/Zig/comments/bd30kw/build_system/
- [A Reply to \_The Road to Zig 1.0\* - gingerBill](https://www.gingerbill.org/article/2019/05/13/a-reply-to-the-road-to-zig/)
- [The more I see of the Zig language, the more I grow to appreciate its beautiful ...](https://news.ycombinator.com/item?id=18604008)
- [A "Better C" Benchmark](https://zserge.com/posts/better-c-benchmark/)
- [Zig doesn't force you to free all your memory (which occasionally good), so ther...](https://news.ycombinator.com/item?id=18608547)
- [Have you ever tried Zig ? - DEV Community](https://dev.to/pmalhaire/ziglang-first-contact-with-memory-safety-and-simplicity-83p)
- [Also worth noting that this is one thing Zig seems to have gotten quite right al...](https://news.ycombinator.com/item?id=21749220)
- [Is there Zig lang type memory management in our Rust lang - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/is-there-zig-lang-type-memory-management-in-our-rust-lang/49929)
- [arraylist - Mutating a value in an array list in Zig - Stack Overflow](https://stackoverflow.com/questions/61134368/mutating-a-value-in-an-array-list-in-zig)
- https://stackoverflow.com/questions/65480923/how-to-avoid-memory-leaks-when-building-a-slice-of-slices-using-arraylistshow-to-avoid-memory-leaks-when-building-a-slice-of-slices-using-arraylists)
- https://www.reddit.com/r/Zig/comments/fo7rcz/freeing_and_passing_arraylist/
- [Zig first impressions - DEV Community](https://dev.to/stein/zig-dangers-confusions-and-annoyances-280h)
- [Mutating a value in an array list in Zig - Javaer101](https://www.javaer101.com/en/article/39247759.html)
- [> There's no need for uncertainty about what Zig is going for. Rust code blows u...](https://news.ycombinator.com/item?id=18025286)
- [How safe is zig?](https://scattered-thoughts.net/writing/how-safe-is-zig/)
- https://gavinhoward.com/2021/02/rust-zig-and-the-futility-of-replacing-c/
- [self hosted compiler](https://github.com/ziglang/zig/projects/2)
  - [self-hosted compiler: passing behavior tests, std lib tests, and no longer relying on stage1 backend · Issue #89 · ziglang/zig](https://github.com/ziglang/zig/issues/89#issuecomment-328214707)
  - [Zig heading toward a self-hosting compiler [LWN.net]](https://lwn.net/Articles/833400/)
- [Neal's Blog : Breaking Changes](https://web.archive.org/web/20070221212101/https://blogs.msdn.com/nealho/archive/2005/11/22/496101.aspx)
- https://www.reddit.com/r/Zig/comments/9vtn9e/question_about_concurrency_status/
- [Support leak detection and race condition analysis · Issue #1199 · ziglang/zig](https://github.com/ziglang/zig/issues/1199)
- [Zig doesn't prevent memory errors, or data races at compile time, but Zig does h...](https://news.ycombinator.com/item?id=25029336)
- [Zig 0.7.0 tagged](https://news.ycombinator.com/item?id=25028953)
- [(2) Strings in Zig: What do I miss? - Usage - The Zig Programming Language Forum](https://zigforum.org/t/strings-in-zig-what-do-i-miss/188/20)
- https://github.com/JuliaStrings/utf8proc - a clean C library for processing UTF-8 Unicode data
- [Updates to Unicode v13.0 and Zig 0.8 by jecolon · Pull Request #3 · gernest/zunicode](https://github.com/gernest/zunicode/pull/3)
- [(2) Annoying things? - Usage - The Zig Programming Language Forum](https://zigforum.org/t/annoying-things/208/12)
- [(2) Why `anytype` and `type`? - Help - The Zig Programming Language Forum](https://zigforum.org/t/why-anytype-and-type/217/8)
- [Nit: anytype is a really inconsistent name · Issue #5893 · ziglang/zig](https://github.com/ziglang/zig/issues/5893)
- [Type Inference in the Standard Library · Issue #2904 · ziglang/zig](https://github.com/ziglang/zig/issues/2904)
- [Intro/how did you discover Zig? - Usage - The Zig Programming Language Forum](https://zigforum.org/t/intro-how-did-you-discover-zig/41)
- [Defining slice of mutable array literal...in one statement? - Help - The Zig Programming Language Forum](https://zigforum.org/t/defining-slice-of-mutable-array-literal-in-one-statement/218)
- [Zig ⚡ SHOWTIME #22 - Community / zig.show - The Zig Programming Language Forum](https://zigforum.org/t/zig-showtime-22/116)
- [Wasting time with Zig and Life - Study - The Zig Programming Language Forum](https://zigforum.org/t/wasting-time-with-zig-and-life/140)
- [Zig IDE with lots of fluff? Your setup? - Usage / Editors and IDEs - The Zig Programming Language Forum](https://zigforum.org/t/zig-ide-with-lots-of-fluff-your-setup/205)
- [Where did this forum come from? - Office - The Zig Programming Language Forum](https://zigforum.org/t/where-did-this-forum-come-from/235)
- [Calling an external command from Zig - Help - The Zig Programming Language Forum](https://zigforum.org/t/calling-an-external-command-from-zig/141)
- [Switching on tuples? - Usage - The Zig Programming Language Forum](https://zigforum.org/t/switching-on-tuples/210)
- https://github.com/Hejsil/lemonbar-maker
- [remove u0 from zig · Issue #1530 · ziglang/zig](https://github.com/ziglang/zig/issues/1530)
- https://github.com/rivten/senoceton
- [> But if I understand correctly, out-of-the-box, Zig's `union` doesn't get a tag...](https://news.ycombinator.com/item?id=17187008)
- [Converting a Rust Enum Example to a Zig Tagged Union : Zig](https://www.reddit.com/r/Zig/comments/ir0rl7/converting_a_rust_enum_example_to_a_zig_tagged/)
- [Zig Makes Go Cross Compilation Just Work - DEV Community](https://dev.to/kristoff/zig-makes-go-cross-compilation-just-work-29ho)
  https://www.reddit.com/r/Zig/comments/l4p38c/zig_makes_go_cross_compilation_just_work_loris_cro/
- [Jonathan Turner, Azure SDK Dev and co-creator of nushell, tries comptime for the first time : Zig](https://www.reddit.com/r/Zig/comments/lj4aa7/jonathan_turner_azure_sdk_dev_and_cocreator_of/)
- [Memory-mapped IO registers in zig](https://scattered-thoughts.net/writing/mmio-in-zig/)
- [FOSDEM videos from the Zig devroom are out! : Zig](https://www.reddit.com/r/Zig/comments/ll21gh/fosdem_videos_from_the_zig_devroom_are_out/)
- [Smallest Echo : Zig](https://www.reddit.com/r/Zig/comments/irnemd/smallest_echo/)
- [I made a String Library to learn Zig. And so far I love this language! : Zig](https://www.reddit.com/r/Zig/comments/ikppmo/i_made_a_string_library_to_learn_zig_and_so_far_i/)
  - [GitHub - gernest/zunicode port of go standard unicode package to zig](https://www.reddit.com/r/Zig/comments/9u2qnu/github_gernestzunicode_port_of_go_standard/)
- [Zorrow. Rusts borrowchk brought to Zig. : Zig](https://www.reddit.com/r/Zig/comments/gz7752/zorrow_rusts_borrowchk_brought_to_zig/)
- [Zig, Parser Combinators - and Why They're Awesome](https://devlog.hexops.com/2021/zig-parser-combinators-and-why-theyre-awesome)
- [Zig in 30 Minutes (Hacker News discussion linked in comments) : Zig](https://www.reddit.com/r/Zig/comments/kppzsr/zig_in_30_minutes_hacker_news_discussion_linked/)
- [Async CPU bound workers in Zig - DEV Community](https://dev.to/stein/async-cpu-bound-workers-in-zig-24b0)
- [Validating strings at compile time in Zig - DEV Community](https://dev.to/euantorano/validating-strings-at-compile-time-in-zig-539h)
- [Debugging Zig with VS Code - DEV Community](https://dev.to/watzon/debugging-zig-with-vs-code-44ca)
- https://github.com/pbui-project/pbui-main - The main repository for the PBUI project
  - https://www.reddit.com/r/Zig/comments/g1umkx/small_linux_userland_built_in_zig/
  - [Linux Userland in Zig | 码农网](https://www.codercto.com/a/107923.html)
  - [Project 01: Idlebin](https://www3.nd.edu/~pbui/teaching/cse.30341.fa19/project01.html)
- [> A `union(TagType)` in Zig is a tagged union and has safety checks on all acces...](https://news.ycombinator.com/item?id=17186888)
- [design spec: Are integers in zig guaranteed to have two's complement binary representation? · Issue #1723 · ziglang/zig](https://github.com/ziglang/zig/issues/1723)
- https://github.com/SpexGuy/Zig-ImGui - Zig bindings for ocornut/imgui, generated using cimgui/cimgui
- [Are integers in zig guaranteed to have two's complement binary representation? : Zig](https://www.reddit.com/r/Zig/comments/9wz8ly/are_integers_in_zig_guaranteed_to_have_twos/)
- (https://comby.dev/blog/2021/03/26/comby-reducer)[A simple program reducer for any language · Comby]
- (https://twitter.com/andy_kelley/status/1374137956038889475)[Andrew Kelley on Twitter: "this is a good example of safety feature of Zig that would not make sense in Rust - untagged unions https://t.co/tgoEDvxIkt" / Twitter]
- [Andrew Kelley on Twitter: "thanks to the Rust folks participating in this thread- what I have learned is that the Rust project is in fact interested in adding safety features even to `unsafe` areas of the codebase! that's great to hear." / Twitter](https://twitter.com/andy_kelley/status/1374144948585459712)
- [Zig ⚡ Pair Programming with Loris ⚡ Transitioning Redis to Zig ⚡ Part 3 on Vimeo](https://vimeo.com/524007646)
- [Zig ⚡ Pair Programming with Loris ⚡ Transitioning Redis to Zig ⚡ Part 2 on Vimeo](https://vimeo.com/521627209)
- [Zig ⚡ Pair Programming with Loris ⚡ Transitioning Redis to Zig ⚡ Part 1 on Vimeo](https://vimeo.com/519725401)
- That article was the main inspiration for Zig's cache system https://github.com/ziglang/zig/issues/6082#issuecomment-675646147
  - https://apenwarr.ca/log/20181113
- [An intro to Zig's integer casting for C programmers | Lager](https://www.lagerdata.com/articles/an-intro-to-zigs-integer-casting-for-c-programmers)
- [Using Zig to Provide Stack Traces on Kernel Panic for a Bare Bones Operating System - Andrew Kelley](https://andrewkelley.me/post/zig-stack-traces-kernel-panic-bare-bones-os.html)
- [Zig Crash Course - Gamedev Guide](https://ikrima.dev/dev-notes/zig/zig-crash-course/)
- [Preventing integer overflow in Zig | Lager](https://www.lagerdata.com/articles/preventing-integer-overflow-in-zig)
- [Learning Zig - first hour...](https://ciesie.com/post/zig_learning_01/)
- [Has anyone else given Zig a serious try, only to get caught up in language debugging? | Handmade Network](https://hero.handmade.network/forums/code-discussion/t/7826-has_anyone_else_given_zig_a_serious_try,_only_to_get_caught_up_in_language_debugging)
- [antirez/kilo: A text editor in less than 1000 LOC with syntax highlight and search.](https://github.com/antirez/kilo)
- [Learning Zig - Day 2 - Harsh Shandilya](https://msfjarvis.dev/posts/learning-zig-day-2/)
- [Zig Metaprogramming - Gamedev Guide](https://ikrima.dev/dev-notes/zig/zig-metaprogramming/)
- [SymmetricalDataSecurity: Zig in 30 Minutes](http://symmetricaldatasecurity.blogspot.com/2021/01/zig-in-30-minutes.html)
- [Zig in 30 Minutes | Hacker News](https://news.ycombinator.com/item?id=25618302)
- [Zig Live Coding - Advent of Code 2018 Day 7 on Vimeo](https://vimeo.com/488248001)
- [Zig Live Coding - “Hello World” x86 Kernel on Vimeo](https://vimeo.com/483928663)
- https://dev.to/akio_tanaka/my-cheatsheet-for-ziglang-21jg
- Zig Doesn’t Have Interfaces. The type of the writer has to be known at compile time. In this regard, Zig feel a bit like a script language in some regards. https://itnext.io/a-refresh-for-zig-programmers-and-dabblers-d33f02c6a362

## Lists

- [C-BJ/awesome-zig: 📜Zig Learning & Usage Guide.](https://github.com/C-BJ/awesome-zig)
- [catdevnull/awesome-zig: A list of awesome projects related to Zig](https://github.com/catdevnull/awesome-zig)
- [nrdmn/awesome-zig](https://github.com/nrdmn/awesome-zig)
- [zig-lang · GitHub Topics](https://github.com/topics/zig-lang)

## Practice

- [Zig on Exercism](https://exercism.org/tracks/zig)
  - [Exercism's Track Docs](https://exercism.org/docs/tracks/zig/learning)
  - https://github.com/exercism/zig
  - [std.fmt.bufPrint - Zig](https://ziglang.org/documentation/master/std/#A;std:fmt.bufPrint)
  - [std.fmt.bufPrintZ - Zig](https://ziglang.org/documentation/master/std/#A;std:fmt.bufPrintZ)
- [ratfactor/ziglings: Learn the Zig programming language by fixing tiny broken programs.](https://github.com/ratfactor/ziglings)
- [gurugio/lowlevelprogramming-university: How to be low-level programmer](https://github.com/gurugio/lowlevelprogramming-university)

## Gamedev, Graphics, Image, Audio, AI, UI, GUI

- [fubark/awesome-zig-gamedev: List of zig game development related projects](https://github.com/fubark/awesome-zig-gamedev)
- [Nelarius/weekend-raytracer-zig: A Zig implementation of the "Ray Tracing in One Weekend" book](https://github.com/Nelarius/weekend-raytracer-zig)
- https://github.com/MasterQ32/zero-graphics
- https://github.com/timmyw/conway/tree/master/zigconway
- [tauoverpi/turn: Example AI code for a turn based game](https://github.com/tauoverpi/turn)
- [notes on topics related to game engine development](https://tauoverpi.github.io/)
- [tauoverpi/levy: A small fantasy-based game](https://github.com/tauoverpi/levy)
- [tauoverpi/levy-aecs: Archetype Entity Component System for zig](https://github.com/tauoverpi/levy-aecs)
- [tauoverpi/bullet-hell-jam: Game jam: Sat 26 Feb 08:00 - Mon 28 Feb 08:00](https://github.com/tauoverpi/bullet-hell-jam)
- [tauoverpi/handmade-hero-zig: Following along handmade hero in zig](https://github.com/tauoverpi/handmade-hero-zig)
- [Zig Build - Gamedev Guide](https://ikrima.dev/dev-notes/zig/zig-build/)
- [Zig Crash Course - Gamedev Guide - Sentinel termination](https://ikrima.dev/dev-notes/zig/zig-crash-course/#sentinel-termination)
- [Why I chose to use a Custom Engine for my game | KCPS Dev Notes 1 - YouTube](https://www.youtube.com/watch?v=uDKKi2vXUnc)
- [jack on Twitter: "Just realized type-erasing using \*anyopaque allows escape compiler's constness check, using the technique, I can get rid of pointer parameter of game object. API of application context is much easier to use now. #ziglang #jok #gamedev https://t.co/T7Pv7nV51l" / Twitter](https://twitter.com/jichengde/status/1627603417840623616)
- [samhattangady/zig_sdl_base: base for zig sdl projects](https://github.com/samhattangady/zig_sdl_base)
- [~cnx/zeal - Zig Easy Audio Library - sourcehut git](https://git.sr.ht/~cnx/zeal)
- [tzigame: Some libraries for game development in Zig](https://sr.ht/~cnx/tzigame/)
- [~cnx/blackshades - A psychic bodyguard FPS - sourcehut git](https://git.sr.ht/~cnx/blackshades)
- [~cnx/gfz - Graphics Framework for Zig - sourcehut git](https://git.sr.ht/~cnx/gfz)
- [2022 Reflecting on a year in life & game development | Hexops' devlog](https://devlog.hexops.com/2022/2022-closing-thoughts/)
- [Zig Crash Course - Gamedev Guide](https://ikrima.dev/dev-notes/zig/zig-crash-course/)
- [Zig Crash Course - Gamedev Guide](https://ikrima.dev/dev-notes/zig/zig-crash-course/#array)
- [isaachier/gbemu: Zig Game Boy emulator](https://github.com/isaachier/gbemu)
- [Awesome tiny games in 11 programming languages - WASM-4 Jam 2022 results! - News - Ziggit](https://ziggit.dev/t/awesome-tiny-games-in-11-programming-languages-wasm-4-jam-2022-results/63/5)
- [Ethan Frei / wasm4-snake · GitLab](https://gitlab.com/freiguy1/wasm4-snake)
- [hztk/hztk: Cross-platform game-engine template, powered by Zig ⚡](https://github.com/hztk/hztk)
- [hztk/qoi.zig at main · hztk/hztk · GitHub](https://github.com/hztk/hztk/blob/main/libs/zig-qoi-slim/src/qoi.zig)
- [ArtemisX64/zgui: Imgui and it's bindings for Zig](https://github.com/ArtemisX64/zgui)
- [natecraddock/open-reckless-drivin: A work-in-progress open source reimplementation of the classic Macintosh shareware game Reckless Drivin'](https://github.com/natecraddock/open-reckless-drivin)
- [Game Development : Zig](https://www.reddit.com/r/Zig/comments/kqxljf/game_development/)
- [LakeByTheWoods/zig-bgfx-sdl2: Minimal zig project to get bgfx running with sdl2](https://github.com/LakeByTheWoods/zig-bgfx-sdl2)
- [pfgithub/mousegame: abandoned test project](https://github.com/pfgithub/mousegame)
- [Not-Nik/raylib-zig: Manually tweaked, auto generated raylib bindings for zig. https://github.com/raysan5/raylib](https://github.com/Not-Nik/raylib-zig)
- [david-vanderson/warpz: port warp game to zig](https://github.com/david-vanderson/warpz)
- [prime31/zig-gamekit: Companion repo for zig-renderkit for making 2D games](https://github.com/prime31/zig-gamekit)
- [prime31/zig-renderkit](https://github.com/prime31/zig-renderkit)
- [prime31/zig-upaya: Zig-based framework for creating game tools and helper apps](https://github.com/prime31/zig-upaya)
- [prime31/zig-ecs](https://github.com/prime31/zig-ecs)
- [zig-gamedev project: audio experiments (wgpu) - YouTube](https://www.youtube.com/watch?v=UvNJn2Ok16w)
- [trgwii/Game](https://github.com/trgwii/Game)
- [hazeycode/hazeytek: Zig powered ⚡ game-engine as a template](https://github.com/hazeycode/hazeytek)
- [TM35-Metronome/metronome: A set of tools for modifying and randomizing Pokémon games](https://github.com/TM35-Metronome/metronome)
- [thejoshwolfe/legend-of-swarkland: Turn-based action fantasy puzzle game inspired by NetHack and Crypt of the Necrodancer](https://github.com/thejoshwolfe/legend-of-swarkland)
- [Game of Life: Zig Edition | WASM-4](https://wasm4.org/play/game-of-life-zig-edition/)
- [davidroman0O/wasm4-game-of-life: Zig implementation of the famous Conway's Game of Life](https://github.com/davidroman0O/wasm4-game-of-life)
- [Finish It! Motivation & Processes For Video Game Development | Udemy](https://www.udemy.com/course/finish-it/)
- [Zig Programming Language - YouTube](https://www.youtube.com/watch?v=ygfGO5n1Oe4&list=PLS9MbmO_ssyCzjONn8v796nUGRXMX389H)
- [The Zig Programming Language – GameFromScratch.com](https://gamefromscratch.com/the-zig-programming-language/)
- [Setup Zig for Gamedev - DEV Community 👩‍💻👨‍💻](https://dev.to/fabioarnold/setup-zig-for-gamedev-2bmf)
- [Not-Nik/raylib-zig: Manually tweaked, auto generated raylib bindings for zig. https://github.com/raysan5/raylib](https://github.com/Not-Nik/raylib-zig)
- https://dev.to/fabioarnold/setup-zig-for-gamedev-2bmf
- [Code for Game Developers - Anatomy of a Memory Allocation - YouTube](https://www.youtube.com/watch?v=c0g3S_2QxWM&list=PLW3Zl3wyJwWOpdhYedlD-yCB7WQoHf-My&index=94)
- [Has anyone else given Zig a serious try, only to get caught up in language debugging? | Handmade Network](https://hero.handmade.network/forums/code-discussion/t/7826-has_anyone_else_given_zig_a_serious_try%252C_only_to_get_caught_up_in_language_debugging)
- [Zig gamedev project – left my job to build games in Zig lang | Hacker News](https://news.ycombinator.com/item?id=28897469)
- [brodeuralexis/webgpu](https://github.com/brodeuralexis/webgpu)
- [brodeuralexis/tenebris: A 3D game engine for immersive simulations in the likes of the original Thief.](https://github.com/brodeuralexis/tenebris)
- [fengb/fundude: Gameboy emulator: Zig -> wasm](https://github.com/fengb/fundude)
- [zig-community/Zig-Showdown: A community effort to create a small multiplayer 3D shooter game in pure zig](https://github.com/zig-community/Zig-Showdown)
- [Zig Testing - Gamedev Guide](https://ikrima.dev/dev-notes/zig/zig-test/)
- [Zig Metaprogramming - Gamedev Guide](https://ikrima.dev/dev-notes/zig/zig-metaprogramming/)
- [zig-gamedev/libs/zglfw at main · michal-z/zig-gamedev · GitHub](https://github.com/michal-z/zig-gamedev/tree/main/libs/zglfw)
- [Jack-Ji/jok: A minimal 2d/3d game framework for zig.](https://github.com/jack-ji/jok)
- [kiedtl/roguelike: A roguelike focused on tactical positioning and stealth.](https://github.com/kiedtl/roguelike)
- [astral-shining/zig-opengl-triangle: Zig Triangle using OpenGL Core 3.3 & GLFW](https://github.com/astral-shining/zig-opengl-triangle)
- [wendigojaeger/ZigGBA: Work in progress SDK for creating Game Boy Advance games using Zig programming language.](https://github.com/wendigojaeger/ZigGBA)

## Learn

- [Zig Crash Course - Gamedev Guide](https://ikrima.dev/dev-notes/zig/zig-crash-course/)
- [Zig type system illustrated using ascii diagrams](https://gist.github.com/lobre/4fbf32961513784dde2a9ef4e6a4a1d9)
- [What's a String Literal in Zig? - Zig NEWS](https://zig.news/kristoff/what-s-a-string-literal-in-zig-31e9)
- [A Look at Zig's Built-ins - Loris Cro - YouTube](https://www.youtube.com/watch?v=V0sthxzzN3U)
- [Zig Programming Language | Udemy](https://www.udemy.com/course/zig-programming-language/learn/lecture/33883554#overview)
- [Zig Programming Language Tutorials - YouTube](https://www.youtube.com/playlist?list=PLRMNjZSQLv5iGpjubyzlWYcGqiTPVyK3s)
- [My cheatsheet for Ziglang - DEV Community 👩‍💻👨‍💻](https://dev.to/akio_tanaka/my-cheatsheet-for-ziglang-21jg)
- [Zig Language - DEV Community 👩‍💻👨‍💻](https://dev.to/t/zig)
- [WebAssembly with Zig, Part 1 - DEV Community 👩‍💻👨‍💻](https://dev.to/sleibrock/webassembly-with-zig-part-1-4onm)
- [WebAssembly With Zig, Pt. II - DEV Community 👩‍💻👨‍💻](https://dev.to/sleibrock/webassembly-with-zig-pt-ii-ei7)
- [A Universe of Sorts](https://bollu.github.io/learn-zig-in-y-minutes.html)
- [Should you learn ZIG in 2022? - YouTube](https://www.youtube.com/watch?v=1sZYhY5cEg0)
- [Zig in 30 minutes](https://gist.github.com/ityonemo/769532c2017ed9143f3571e5ac104e50)
- [What's a Memory Allocator Anyway? - Benjamin Feng - YouTube](https://www.youtube.com/watch?v=vHWiDx_l4V0)
- [Solving Common Pointer Conundrums - Loris Cro - YouTube](https://www.youtube.com/watch?v=VgjRyaRTH6E)
- [Should/Can I learn zig? : Zig](https://www.reddit.com/r/Zig/comments/z5doik/shouldcan_i_learn_zig/)
- [Zig in 30 Minutes | Hacker News](https://news.ycombinator.com/item?id=25618302)
- [Zig JSON in 5 minutes : Zig](https://www.reddit.com/r/Zig/comments/s2g07j/zig_json_in_5_minutes/)
- [Writing a small ray tracer in Rust and Zig | Hacker News](https://news.ycombinator.com/item?id=20325638)
- [How I Built Zig-SQLite | Hacker News](https://news.ycombinator.com/item?id=31527559)

## Examples, libs

- [nektro/zig-extras: An assortment of random utility functions that aren't in std and don't deserve their own pacakge.](https://github.com/nektro/zig-extras)
- [sha256sum-zig/main.zig at main · rofrol/sha256sum-zig · GitHub](https://github.com/rofrol/sha256sum-zig/blob/main/src/main.zig)
- [ziglibs/repository: A community-maintained repository of zig packages](https://github.com/ziglibs/repository)

## OS Dev

- [leap0x7b/awesome-osdev: List of resources and projects for operating system development.](https://github.com/leap0x7b/awesome-osdev)
- [leap0x7b/viisi: A RISC-V hobby computer inspired by old 80s and 90s UNIX workstations.](https://github.com/leap0x7b/viisi)
- [leap0x7b/xeptoboot: A small 2-staged bootloader written in Zig](https://github.com/leap0x7b/xeptoboot)
- [leap0x7b/limine: Zig bindings of the Limine boot protocol](https://github.com/leap0x7b/limine)
- [leap0x7b/handover-zig: Zig bindings for Handover boot protocol](https://github.com/leap0x7b/handover-zig)
- [leap0x7b/limine-barebones: A minimal Limine kernel written in Zig](https://github.com/leap0x7b/limine-barebones)
- [discord/discord-open-source: List of open source communities living on Discord](https://github.com/discord/discord-open-source)

## Network, web

- [leap0x7b/germanium: A Gemini proxy written in Zig](https://github.com/leap0x7b/germanium)
- [nikneym/ws: WebSocket library for Zig ⚡](https://github.com/nikneym/ws)

## UI, GUI, TUI

- [capy-ui/capy: 💻Build one codebase and get native UI on Windows, Linux and Web](https://github.com/capy-ui/capy)
- [capy-ui/zig-template: Simple template for creating a Capy app in Zig](https://github.com/capy-ui/zig-template)
- [Porting Capy to Android](https://capy-ui.org/blog/porting-capy-to-android/)
- [Installation | Capy UI](https://capy-ui.org/docs/getting-started/installation/)

## Emulators

- [Luukdegram/lion: Chip-8 Emulator written in Zig](https://github.com/Luukdegram/lion)
- [agentultra/zig8: A Chip-8 emulator written in zig](https://github.com/agentultra/zig8)
- [GrooveStomp/chip8-zig: A CHIP-8 emulator written in Zig](https://github.com/GrooveStomp/chip8-zig)
- [emekoi/c8: chip 8 emulator in zig](https://github.com/emekoi/c8)
- [paoda/zig8: Yet another CHIP-8 Emulator, now in Zig! - zig8 - Rekai's Gitea Instance](https://git.musuka.dev/paoda/zig8)
- [sourgrasses/fishnchips: [WIP] 🐟 CHIP-8 emulator implemented in Zig for leeeearning](https://github.com/sourgrasses/fishnchips)

## Other

- [desttinghim/jazmin: Zig implementation of Jasmin](https://github.com/desttinghim/jazmin)
- [leap0x7b/spaceship-zig: ⚡ Zig section for Spaceship prompt](https://github.com/leap0x7b/spaceship-zig)
- [tensorush/Awesome-Languages-Learning: Collection of the most awesome learning resources on modern languages accompanied by solutions to annual Advent of Code challenges.](https://github.com/tensorush/Awesome-Languages-Learning#lizard-zig)
- [Multi-Object For Loops + Struct-Of-Arrays - Zig NEWS ⚡](https://zig.news/andrewrk/multi-object-for-loops-data-oriented-design-41ob)
- [Multi-Object For Loops + Struct-Of-Arrays | Lobsters](https://lobste.rs/s/abgxcg)
- [Higher order message - Wikipedia](https://en.m.wikipedia.org/wiki/Higher_order_message)
- [zitertools/main.zig at main · KilianVounckx/zitertools · GitHub](https://github.com/KilianVounckx/zitertools/blob/main/main.zig)
- [zig-cookbook/src/algorithms/sorting at main · KilianVounckx/zig-cookbook · GitHub](https://github.com/KilianVounckx/zig-cookbook/tree/main/src/algorithms/sorting)
- [KilianVounckx/zignews_interface](https://github.com/KilianVounckx/zignews_interface)
- [Zig Interfaces for the Uninitiated, an update - Zig NEWS ⚡](https://zig.news/kilianvounckx/zig-interfaces-for-the-uninitiated-an-update-4gf1)
- [KilianVounckx/doomsday: Program to train you in calculating which day of the week a date is.](https://github.com/KilianVounckx/doomsday)
- [KilianVounckx/invasion](https://github.com/KilianVounckx/invasion)
- [KilianVounckx/zttp](https://github.com/KilianVounckx/zttp)
- [KilianVounckx/advent-of-code-2021](https://github.com/KilianVounckx/advent-of-code-2021)
- [KilianVounckx/ZigCalc](https://github.com/KilianVounckx/ZigCalc)
- [KilianVounckx/zitertools: zig iterators](https://github.com/KilianVounckx/zitertools)
- [DWARF v5 Language Codes](https://dwarfstd.org/Languages.php)
- [Debugging using DWARF](https://dwarfstd.org/doc/Debugging%20using%20DWARF-2012.pdf)
- [Zig now has a DWARF language code assigned : Zig](https://www.reddit.com/r/Zig/comments/1147a7z/zig_now_has_a_dwarf_language_code_assigned/)
- [toppers/asp3_in_zig: TOPPERS/ASP3 Kernel written in Zig Programming Language](https://github.com/toppers/asp3_in_zig)

- [2 spaces for `zig fmt` instead of 4 · Issue #11107 · ziglang/zig](https://github.com/ziglang/zig/issues/11107)
- [zig/sort.zig at dc1f50e505105cabe1ed53951ca612778d6019ee · ziglang/zig](https://github.com/ziglang/zig/blob/dc1f50e505105cabe1ed53951ca612778d6019ee/lib/std/sort.zig#L7)
- [candrewlee14/zlog: A zero-allocation log library for Zig](https://github.com/candrewlee14/zlog)
- [candrewlee14/mnist-playground: Learning about machine learning and neural nets through experimenting.](https://github.com/candrewlee14/mnist-playground)
- [MasterQ32/SDL.zig: A shallow wrapper around SDL that provides object API and error handling](https://github.com/MasterQ32/SDL.zig)
- [rohlem/wasm4-cadences: wasm4 cadence playbox](https://github.com/rohlem/wasm4-cadences)
- [d-mironov/stm32f4.zig: STM32F4 HAL using the Zig Programming Language](https://github.com/d-mironov/stm32f4.zig)
- [r00ster91/hello-bios-zig: Greeting the BIOS from Zig!](https://github.com/r00ster91/hello-bios-zig)
- [natanalt/partition.zig: Partition table library for Zig](https://github.com/natanalt/partition.zig)
- [natanalt/zig-x86_16: An attempt at adding proper x86_16 support to Zig](https://github.com/natanalt/zig-x86_16)
- [jayschwa/dos.zig: Create DOS programs with Zig](https://github.com/jayschwa/dos.zig)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#while-with-Optionals)
- [tauoverpi/resources: Resource list](https://github.com/tauoverpi/resources)
- [scratch/zig at master · tauoverpi/scratch](https://github.com/tauoverpi/scratch/tree/master/zig)
- [znowflak3/ztime: Firmware for Pinetime watch](https://github.com/znowflak3/ztime

- [tauoverpi/zangle](https://github.com/tauoverpi/zangle)

- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Optionals)
- [Zig's equivalent of sprintf()? : Zig](https://www.reddit.com/r/Zig/comments/zhg623/zigs_equivalent_of_sprintf/)
- [bun/fs.zig at 8aa6ee5332f793a13269ad884d99b9711fedb091 · oven-sh/bun](https://github.com/oven-sh/bun/blob/8aa6ee5332f793a13269ad884d99b9711fedb091/src/fs.zig#L728)
- [swapview-rosetta/swapview.zig at master · lilydjwg/swapview-rosetta](https://github.com/lilydjwg/swapview-rosetta/blob/master/Zig/swapview.zig#L35)

- [errors / exception handling in zig - YouTube](https://www.youtube.com/watch?v=t9EUoSojDUw)
- [My reasoning for why Zig errors shouldn't have a payload : Zig](https://www.reddit.com/r/Zig/comments/wqnd04/my_reasoning_for_why_zig_errors_shouldnt_have_a/)
- [How to catch error and then print somthing. : Zig](https://www.reddit.com/r/Zig/comments/ue7xi8/how_to_catch_error_and_then_print_somthing/)
- [Using Zig to Provide Stack Traces on Kernel Panic for a Bare Bones Operating System - Andrew Kelley](https://andrewkelley.me/post/zig-stack-traces-kernel-panic-bare-bones-os.html)
- [Having fun with zig lang · Dane Williams](https://www.danewilliams.me/posts/having-fun-with-zig-lang/)
- [Zig ⚡ Self-Hosted Compiler ⚡ Applying Data-Oriented Design Principles on Vimeo](https://vimeo.com/572815502)
- [Error management is different, and quite uniquely done. Zig deals with failure m... | Hacker News](https://news.ycombinator.com/item?id=17256879)
- [The thing I dislike about Zig error handling is that there's no way to associate... | Hacker News](https://news.ycombinator.com/item?id=27875915)
- [Memory safety in C++, Zig, & Rust (part 1) - YouTube](https://www.youtube.com/watch?v=qeiRGbYCD-0)

- ["Why slice with comptime known end creates pointer to array?" | Zig Programming Language](https://discord.com/channels/605571803288698900/1076842251700940820)
- https://www.reddit.com/r/Zig/comments/r0l3uz/a_practical_guide_to_applying_dataoriented_design/
- [Andrew Kelley - Practical DOD on Vimeo](https://vimeo.com/649009599)
- [Practical DOD - Q&A](https://vimeo.com/649016743)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Pointers)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Arrays)
- [Many-item Pointers : Zig](https://www.reddit.com/r/Zig/comments/r9tikn/manyitem_pointers/)
- [belse-de/zig-tut: A collection of small projects and tutorials to learn ZIG; may it be inspiration for others as well.](https://github.com/belse-de/zig-tut)
- https://allyourcodebase.com/
- [Zig in Production - Jens Goldberg - YouTube](https://www.youtube.com/watch?v=124wdTckHNY)
- [Zig Roadmap 2023 - Andrew Kelley - YouTube](https://www.youtube.com/watch?v=AqDdWEiSwMM)
- [zig-trying/main.zig at main · rofrol/zig-trying · GitHub](https://github.com/rofrol/zig-trying/blob/main/src/main.zig)
- [mateonunez/struggling-with-zig: Playing with Zig](https://github.com/mateonunez/struggling-with-zig)
- [How do I make "generics" readable? : Zig](https://www.reddit.com/r/Zig/comments/108mslt/how_do_i_make_generics_readable/)
- [Functional style and encapsulation : Zig](https://www.reddit.com/r/Zig/comments/10xf3u3/functional_style_and_encapsulation/)
- [Beating the dead while-loop-horse : Zig](https://www.reddit.com/r/Zig/comments/t1ty7e/beating_the_dead_whileloophorse/)
- [Zig circularity issues : Zig](https://www.reddit.com/r/Zig/comments/jrss43/zig_circularity_issues/)
- [Looking at Zig Programming Language | Hacker News](https://news.ycombinator.com/item?id=30919305)
- [Looking at Zig programming language « Kostya's Boring Codec World](https://codecs.multimedia.cx/2022/02/looking-at-zig-programming-language/)
- [alichraghi (Ali Chraghi)](https://github.com/alichraghi)
- [Motiejus Jakštys Public Record](https://jakstys.lt/)
- [a plugin for GNU Name Service Switch (NSS) functionality of GNU C Library (glibc)](https://git.sr.ht/~motiejus/turbonss/)
- https://git.sr.ht/~motiejus/bazel-zig-cc

- [Discord | "How to speed up understanding and writing code in zig?" | Zig Programming Language](https://discord.com/channels/605571803288698900/1077263705630330880)
- [Convert []const u8 to []u8 : Zig](https://www.reddit.com/r/Zig/comments/s5eutc/convert_const_u8_to_u8/)
- [What Makes the Zig Programming Language Unique? | by Erik Engheim | ITNEXT](https://itnext.io/what-makes-zig-unique-1b98bfb95701)
- [Can you retry a Zig function call when it returns an error? - Stack Overflow](https://stackoverflow.com/questions/70871136/can-you-retry-a-zig-function-call-when-it-returns-an-error)
- [This is very different to most static languages. From the article: The whole pro... | Hacker News](https://news.ycombinator.com/item?id=34741454)
- [Was hoping the author found a solution to (in my view) Zig's biggest shortcoming... | Hacker News](https://news.ycombinator.com/item?id=34741753)

- [ziglang array iterator - Szukaj w Google](https://www.google.com/search?q=ziglang+array+iterator&rlz=1C5CHFA_enPL1026PL1026&oq=ziglang+array+iterator&aqs=chrome..69i57j33i160.3244j0j7&sourceid=chrome&ie=UTF-8)
- [iterating an array in reverse : Zig](https://www.reddit.com/r/Zig/comments/szx11v/iterating_an_array_in_reverse/)
- [Reddit - Dive into anything](https://www.reddit.com/r/Zig/comments/bokhvz/is_it_possible_to_iterate_over_a_stdarray_list/)
- [Why does the ArrayList iterator return by value? : Zig](https://www.reddit.com/r/Zig/comments/c9vzgx/why_does_the_arraylist_iterator_return_by_value/)
- [Found a cool way to loop over a range : Zig](https://www.reddit.com/r/Zig/comments/tuq7a0/found_a_cool_way_to_loop_over_a_range/)
- [Counting loops in Zig : Zig](https://www.reddit.com/r/Zig/comments/p2clkk/comment/h8kajs7/?utm_source=reddit&utm_medium=web2x&context=3)
- [nikic's Blog](https://www.npopov.com/)
- [Proposal: Multi-object `for` loops · Issue #7257 · ziglang/zig](https://github.com/ziglang/zig/issues/7257)
- [Proposal: Rename `for` to `each` · Issue #7826 · ziglang/zig](https://github.com/ziglang/zig/issues/7826)
- [The Coroutine Rewrite Issue · Issue #2377 · ziglang/zig](https://github.com/ziglang/zig/issues/2377)
- [proposal: Streamline loops, and enhance iteration · Issue #3110 · ziglang/zig](https://github.com/ziglang/zig/issues/3110)
- [YohananDiamond/zig-poly: Another attempt at a zig polymorphism library](https://github.com/YohananDiamond/zig-poly)

- [docs: add Lua API links to 5.1 functions · natecraddock/ziglua@cb5cc35](https://github.com/natecraddock/ziglua/commit/cb5cc359f82d9c3dd00139a5fe212107ab288d37)
- https://github.com/kassane?tab=repositories&q=&type=&language=zig&sort=

- [Gd32v Support by kassane · Pull Request #21 · ZigEmbeddedGroup/microzig](https://github.com/ZigEmbeddedGroup/microzig)
- [Protty on Twitter: "Tips i've learned from writing thread pools (this is easier than writing a blog): - Reduce the amount of state owned &amp; updated by one thread to the minimum - Make all queues lock-free and have a centralized blocking scheme instead of locks on some queues (1/n) I'll elaborate" / Twitter](https://twitter.com/kingprotty/status/1416774977836093445)
- [Zig custom chip demo - Wokwi Arduino and ESP32 Simulator](https://wokwi.com/projects/348776765607379539)
- [Matheus C. França on Twitter: "@vicradon @WokwiMakes and also esp32 with rust https://t.co/p1lvywqlFW" / Twitter](https://twitter.com/TheuCatarino/status/1558121102806753281)
- [kassane/Algorithms-Zig: All Algorithms implemented in Zig](https://github.com/kassane/Algorithms-Zig)
- [fubark](https://github.com/fubark)
- [ziglang/logo: The official Zig programming language logo & copyright information](https://github.com/ziglang/logo)
- [style guide: switch to snake case for functions · Issue #1097 · ziglang/zig](https://github.com/ziglang/zig/issues/1097)
- [tauoverpi (Simon A. Nielsen Knights)](https://github.com/tauoverpi)
- [thejoshwolfe (Josh Wolfe)](https://github.com/thejoshwolfe)
- [SpexGuy (Martin Wickham)](https://github.com/SpexGuy)
- [ZEG](https://zeg.random-projects.net/)

- [fubark/zig-v8: Simple V8 builds with C and Zig bindings.](https://github.com/fubark/zig-v8)
- [fubark/cosmic: A platform for computing and creating applications.](https://github.com/fubark/cosmic)
- [fubark/zig-vulkan-triangle: simple triangle displayed using vulkan, glfw, and zig](https://github.com/fubark/zig-vulkan-triangle)

- [tgschultz/Zig-GigatronEmulator: A Gigatron emulator written in Zig](https://github.com/tgschultz/Zig-GigatronEmulator)
- [tgschultz/Zig-Serialization: A simple serializer and deserializer for arbitrary types with any endianess and bit or byte packing.](https://github.com/tgschultz/Zig-Serialization)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Names)

- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#noreturn)
- [Behavior of `noreturn` (and `noreturn` like) variables · Issue #13807 · ziglang/zig](https://github.com/ziglang/zig/issues/13807)
- [Zig getting started](https://punkbit.com/hacking/ziglang-getting-started/)
- [bun/\_\_global.zig at e7cd45d0fa3f381238ea2ebfbba2d9e738376fcc · oven-sh/bun](https://github.com/oven-sh/bun/blob/e7cd45d0fa3f381238ea2ebfbba2d9e738376fcc/src/__global.zig#L64)
- [Search Results for noreturn - Zig NEWS ⚡](https://zig.news/search?q=noreturn)
- [Easily create TUI programs with zig-spoon! (project demonstration) - Zig NEWS ⚡](https://zig.news/lhp/easily-create-tui-programs-with-zig-spoon-project-demonstration-4k33)
- [zig-spoon: TUI library for zig](https://sr.ht/~leon_plickat/zig-spoon/)
- https://github.com/rodrigmars/medjai-zig

- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Error-Union-Type)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Blocks)
- [xoreaxeaxeax/movfuscator: The single instruction C compiler](https://github.com/xoreaxeaxeax/movfuscator)
- [Performance of WebAssembly runtimes in 2023 | Frank DENIS random thoughts.](https://00f.net/2023/01/04/webassembly-benchmark-2023/)
- [Stop Building On Corporate-Controlled Languages](https://blog.deckc.hair/2023-01-18-stop-building-on-corporate-controlled-languages.html)
- [rodrigmars/medjai-zig](https://github.com/rodrigmars/medjai-zig)
- [io_uring and networking in 2023 · axboe/liburing Wiki](https://github.com/axboe/liburing/wiki/io_uring-and-networking-in-2023#task-work)
- [cztomsik/zig-napigen: Automatic N-API bindings for your Zig project.](https://github.com/cztomsik/zig-napigen)
- [ifreund/zig-napi-example: example napi package in zig](https://github.com/ifreund/zig-napi-example)
- [evanwashere/napi.zig: tiny and fast napi bindings for zig](https://github.com/evanwashere/napi.zig)
- [staltz/zig-nodejs-example: Node.js Native Module written in Zig](https://github.com/staltz/zig-nodejs-example)

- [Status update, January 2023 — Meghan's Blog](https://nektro.mataroa.blog/blog/status-update-january-2023/)
- [InKryption](https://github.com/InKryption)
- [travisstaloch/simdjzon: simdjson port to zig](https://github.com/travisstaloch/simdjzon)
- [carryless multiplication builtin · Issue #9631 · ziglang/zig](https://github.com/ziglang/zig/issues/9631)
- [Add SIMD Support · Issue #903 · ziglang/zig](https://github.com/ziglang/zig/issues/903)
- [travisstaloch/zig_benchmarksgame: benchmarksgame implementations](https://github.com/travisstaloch/zig_benchmarksgame)

- [Zig benchmarks, Which programming language or compiler is faster](https://programming-language-benchmarks.vercel.app/zig)
- https://kokizzu.blogspot.com/search/label/zig
- [Reddit - Dive into anything](https://www.reddit.com/r/Zig/comments/h9zidb/just_a_little_bit_of_profiling_fun/)
- [tiehuis/advent-of-code-2022: https://adventofcode.com/2022](https://github.com/tiehuis/advent-of-code-2022)
- [How safe is Zig? | Hacker News](https://news.ycombinator.com/item?id=31850347)
- [Zig cc: A drop-in replacement for GCC/Clang | Hacker News](https://news.ycombinator.com/item?id=22679138)
- [The Idealism and Practicality of Software You Can Love - Loris Cro - Software You Can Love 2022 - YouTube](https://www.youtube.com/watch?v=aYtAdWASGzg)

- [Reddit - Dive into anything](https://www.reddit.com/r/rust/comments/mc6osg/a_better_c_benchmark_comparing_zig_rust_go_c/)

- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Error-Return-Traces)
- [Orhun's Blog](https://blog.orhun.dev/zig-bits-01/)
- [01.04.2022 - Zig/Strings in 5 minutes](https://www.huy.rocks/everyday/01-04-2022-zig-strings-in-5-minutes)
- [Orhun's Blog](https://blog.orhun.dev/no-bullshit-file-hosting/)
- [Zig Meta Programming](https://blog.deckc.hair/2023-02-08-zig-meta-programming.html)
- [Blog — The Dev Effect](https://www.deveffect.io/blog-1)
- [GitHub - ibebrett/zigzag](https://github.com/ibebrett/zigzag)
- [What is Zig's Comptime? | Loris Cro's Blog](https://kristoff.it/blog/what-is-zig-comptime/)
- [Ask HN: Smallest cross-platform language runtime? | Hacker News](https://news.ycombinator.com/item?id=34644145)
- [I learned seven programming languages | Hacker News](https://news.ycombinator.com/item?id=34761735)
- [Ask HN: Are Paul Graham's Classic Startup Essays Outdated? | Hacker News](https://news.ycombinator.com/item?id=34750727)
- [Getting Started ⚡ Zig Programming Language](https://ziglang.org/learn/getting-started/)
- [zig-ansi/lib.zig at master · nektro/zig-ansi · GitHub](https://github.com/nektro/zig-ansi/blob/master/src/lib.zig)
- [How to read a file in zig? - Stack Overflow](https://stackoverflow.com/questions/68368122/how-to-read-a-file-in-zig)
- [Implementing a file pager in Zig: Write behind policies - Ayende @ Rahien](https://ayende.com/blog/196257-C/implementing-a-file-pager-in-zig-write-behind-policies)
- [allocator - Allocating a generic struct in Zig lang - Stack Overflow](https://stackoverflow.com/questions/64301274/allocating-a-generic-struct-in-zig-lang)
- [Chapter 5 - Async | ziglearn.org](https://ziglearn.org/chapter-5/)
- [A Practical Guide to Applying Data-Oriented Design | Lobsters](https://lobste.rs/s/vbiu6y)
- [Zig + STM32F4Discovery = Blink · rbino](https://rbino.com/posts/zig-stm32-blink/)
- [2204.03775.pdf](https://arxiv.org/pdf/2204.03775.pdf)
- [This scratches the surface of why I hope C slowly fades away as the default low-... | Hacker News](https://news.ycombinator.com/item?id=17440590)
- [Could it be Zig?](https://groups.google.com/g/comp.lang.c/c/HLlUEbl7dAo?pli=1)
- [Zig Support · Issue #523 · AlDanial/cloc · GitHub](https://github.com/AlDanial/cloc/issues/523)

- [translate-c segfaults on typedef'd pointer subtraction · Issue #14560 · ziglang/zig](https://github.com/ziglang/zig/issues/14560)
- [zig/README.md at master · ziglang/zig · GitHub](https://github.com/ziglang/zig/blob/master/lib/compiler_rt/README.md)
- [zig build: The breakings will continue until morale improves. by andrewrk · Pull Request #14498 · ziglang/zig](https://github.com/ziglang/zig/pull/14498)
- [kivikakk/koino: CommonMark + GFM compatible Markdown parser and renderer](https://github.com/kivikakk/koino)
- [How a Zig IDE Could Work](https://matklad.github.io/2023/02/10/how-a-zig-ide-could-work.html)
- [How a Zig IDE Could Work | Hacker News](https://news.ycombinator.com/item?id=34740937#34749571)
- [comptime interfaces · Issue #1268 · ziglang/zig](https://github.com/ziglang/zig/issues/1268)
- [matklad blog post: How a Zig IDE Could Work : ProgrammingLanguages](https://www.reddit.com/r/ProgrammingLanguages/comments/10yt7n5/matklad_blog_post_how_a_zig_ide_could_work/)
- [Blog Post: How a Zig IDE Could Work : Zig](https://www.reddit.com/r/Zig/comments/10ysssh/blog_post_how_a_zig_ide_could_work/)
- [Zig | Lobsters](https://lobste.rs/s/wv6xhi)
- [Zig Compiler Internals : Zig](https://www.reddit.com/r/Zig/comments/sun9pw/zig_compiler_internals/)
- [Zig – Mitchell Hashimoto](https://mitchellh.com/zig)
- [Zig monthly, February 2022: Language interoperability keeps getting better | Zig monthly](https://zigmonthly.org/letters/2022/february/)
- [hazeycode (hazeycode) / Repositories](https://github.com/hazeycode?tab=repositories)
- [hazeycode/escape-guldur: A retro action-RPG handmade in Zig for the WASM-4 fantasy console](https://github.com/hazeycode/escape-guldur)
- [batiati/mustache-zig: Logic-less templates for Zig](https://github.com/batiati/mustache-zig)
- [hazeycode/zig-fetch: a dependency management solution for zig projects!](https://github.com/hazeycode/zig-fetch)
- [bootradev (bootradev) / Repositories](https://github.com/bootradev?tab=repositories)
- [marler8997/libschrift: A lightweight TrueType font rendering library](https://github.com/marler8997/libschrift)
- [Huffman Visualization](https://190n.github.io/huffman-visualization/#)

- [Looking into Odin and Zig: My notes - Ayende @ Rahien](https://ayende.com/blog/194466-A/looking-into-odin-and-zig-my-notes)
- [Some Thoughts on Zig — Sympolymathesy, by Chris Krycho](https://v5.chriskrycho.com/journal/some-thoughts-on-zig/)

- [Atomic reference counting (with Zig code samples) - RavenDB NoSQL Database](https://ravendb.net/articles/atomic-reference-counting-with-zig-code-samples#main)
- [Ziglang](https://www.reddit.com/r/Zig/comments/g7h8s0/referencecounted_shared_pointer/)
- [Ask reddit: What learning resources have taught you the most about zig? : Zig](https://www.reddit.com/r/Zig/comments/10lqwc3/ask_reddit_what_learning_resources_have_taught/)
- [Export chat logs, on Mac OS : discordapp](https://www.reddit.com/r/discordapp/comments/ts6q1z/export_chat_logs_on_mac_os/)
- [Use build.zig with runtime "instructions" : Zig](https://www.reddit.com/r/Zig/comments/10wtu4n/use_buildzig_with_runtime_instructions/)
- [Ask about the benefits of data-oriented design and effective procedural programming : Zig](https://www.reddit.com/r/Zig/comments/10uvx2j/ask_about_the_benefits_of_dataoriented_design_and/)
- https://github.com/raysan5/raylib/

- [Fpaq0p compressor in zig - Showcase - Ziggit](https://ziggit.dev/t/fpaq0p-compressor-in-zig/519)
- [dee0xeed/fpaq0p: An implementation of fpaq0p in Zig (and some more...)](https://github.com/dee0xeed/fpaq0p)
- [nikneym (nikneym) / Repositories](https://github.com/nikneym?tab=repositories)
- [natecraddock (Nathan Craddock)](https://github.com/natecraddock)
- [Nathan Craddock](https://nathancraddock.com/)
- [Pull requests · natecraddock/ziglua](https://github.com/natecraddock/ziglua/pulls)
- [Optimizing Neovim Startuptime | NTBBloodbath](https://ntbbloodbath.github.io/posts/optimizing-neovim-startuptime/)
- [BanchouBoo/ziglua: Zig bindings for the Lua C API](https://github.com/BanchouBoo/ziglua)
- [ziglua/build.zig at master · natecraddock/ziglua](https://github.com/natecraddock/ziglua/blob/master/build.zig)
- [fabioarnold (Fabio Arnold)](https://github.com/fabioarnold)
- [Fabio Arnold - Projects](https://fabioarnold.de/)
- [ziglibs/s2s: A zig binary serialization format.](https://github.com/ziglibs/s2s)
- [ZigLibs](https://github.com/ziglibs)
- [Toby Jaffey (@tobyjaffey@mastodon.me.uk) - mastodon.me.uk](https://mastodon.me.uk/@tobyjaffey)
- [ringtailsoftware/cubiti: cubiti is a toy Fediverse server written in Node.js](https://github.com/ringtailsoftware/cubiti)
- [Ringtail Software](https://www.ringtailsoftware.co.uk/articles/)
- [The things I make for fun](http://blog.hodgepig.org/)
- [Zero-Jetpack](http://www.hodgepig.org/zero/)
- [natecraddock/zf: a commandline fuzzy finder that prioritizes matches on filenames](https://github.com/natecraddock/zf)
- [ziglibs/diffz: Implementation of go-diff's diffmatchpatch in Zig](https://github.com/ziglibs/diffz)
- [tobyjaffey/bus-ninja: AVR Bus-Pirate-a-like](https://github.com/tobyjaffey/bus-ninja)
- [tobyjaffey (tobyjaffey) / Repositories](https://github.com/tobyjaffey?tab=repositories)
- [zig/Cache.zig at 7199d7c77715fe06606c5c89595e6852b3fa8c20 · ziglang/zig](https://github.com/ziglang/zig/blob/7199d7c77715fe06606c5c89595e6852b3fa8c20/lib/std/Build/Cache.zig#L664)
- [aquila/do_import.zig at 5ae32a9c73487a4deb17628241aa96d402593343 · nektro/aquila](https://github.com/nektro/aquila/blob/5ae32a9c73487a4deb17628241aa96d402593343/src/handler/do_import.zig#L97)
- [lun-4/obsidian2web: my obsidian publish knockoff that generates (largely static) websites](https://github.com/lun-4/obsidian2web)
- [lun-4/zigdig: naive dns client library in zig](https://github.com/lun-4/zigdig)
- [lun-4/awtfdb: the Anime Woman's Tagged File Data Base.](https://github.com/lun-4/awtfdb)
- [lun-4/tunez: tunez is a general purpose audio metadata library made in zig](https://github.com/lun-4/tunez)
- [lun-4/zig-ulid: A binary implementation of ULID in Zig.](https://github.com/lun-4/zig-ulid)
- [lun-4/lovr-rtsp: streaming rtsp to a lovr Image object, courtesy of ffmpeg](https://github.com/lun-4/lovr-rtsp)
- [lun-4/libpcre.zig: Zig bindings to libpcre](https://github.com/lun-4/libpcre.zig)
- [lun-4/expiring-hash-map.zig: need a cache or you're limited by memory in your long-lived zig code, well fear no more!](https://github.com/lun-4/expiring-hash-map.zig)
- [lun-4/koino: CommonMark + GFM compatible Markdown parser and renderer](https://github.com/lun-4/koino)
- [lun-4/maid: (WIP) self-contained todo list tui, inspired by void-rs](https://github.com/lun-4/maid)
- [lun-4/ziget: simple wget in zig without libc](https://github.com/lun-4/ziget)
- [lun-4/shitircd: shitpost capabilities induced ircd](https://github.com/lun-4/shitircd)
- [alexnask/analysis-buddy: Analysis buddy for the zig issue linker discord bot](https://github.com/alexnask/analysis-buddy)
- [lun-4/minishare: python -m http.server but this time its in zig because i can](https://github.com/lun-4/minishare)
- [lun-4/zeb: experimentation on a zig web framework](https://github.com/lun-4/zeb)
- [lun-4/znplay: zig network audio play (wip)](https://github.com/lun-4/znplay)
- [lun-4/nyaf: [to be continued?] nya firewall (an ufw frontend to netbsd's npf)](https://github.com/lun-4/nyaf)
- [lun-4/zig-sndfile: zig interface to the c libsndfile library](https://github.com/lun-4/zig-sndfile)
- [lun-4/zig-kak: kakoune plugin for zig support (wip)](https://github.com/lun-4/zig-kak)
- [lun-4/tsusu: proof of concept process manager written in zig (was rust)](https://github.com/lun-4/tsusu)
- [lun-4/strig: experiment on http audio streaming with zig](https://github.com/lun-4/strig)
- [lun-4/zig-docsearch: [WIP] search over zig stdlib doc comments (with rudimentary html gen)](https://github.com/lun-4/zig-docsearch)
- [lun-4/atsuko: zig http experiment](https://github.com/lun-4/atsuko)
- [lun-4/gtk-zig-test: testing if gtk and zig can build together (answer = almost)](https://github.com/lun-4/gtk-zig-test)

- [zig-examples/src at master · jonathangjertsen/zig-examples · GitHub](https://github.com/jonathangjertsen/zig-examples/tree/master/src)
- [HTTP Client - Zig By Example](https://zigbyexample.github.io/http-client)
- [floooh/sokol-zig: Zig bindings for the sokol headers (https://github.com/floooh/sokol)](https://github.com/floooh/sokol-zig)
- [stage1 C ABI compatibility · Issue #1481 · ziglang/zig](https://github.com/ziglang/zig/issues/1481#issuecomment-1340960670)
- [schmee/zig-kakuro: A Kakuro solver written in Zig](https://github.com/schmee/zig-kakuro)
- [ryoppippi/zigcv: zig bindings for OpenCV4](https://github.com/ryoppippi/zigcv)
- [raylib/build.zig at e187b693eaa4873a0d44d6578f44c269fd751315 · raysan5/raylib](https://github.com/raysan5/raylib/blob/e187b693eaa4873a0d44d6578f44c269fd751315/src/build.zig#L11)
- [Zig: A programming language designed for robustness, optimality, and clarity – Andrew Kelley - YouTube](https://www.youtube.com/watch?v=Z4oYSByyRak)
- [Advent of Code, day 4 in Zig - DEV Community 👩‍💻👨‍💻](https://dev.to/katafrakt/advent-of-code-day-4-in-zig-23o7)
- [advent_of_code_2019/solution.zig at master · katafrakt/advent_of_code_2019 · GitHub](https://github.com/katafrakt/advent_of_code_2019/blob/master/04%20%5BZig%5D/solution.zig)
- [100 doors - Rosetta Code](https://rosettacode.org/wiki/100_doors#Zig)

- [david-vanderson/zig-notes: Notes on learning to use Zig](https://github.com/david-vanderson/zig-notes)

- [Luukdegram/mzg_pack at 38f8e775fd2922ca3602863eadfb3de07ea1c9db](https://github.com/Luukdegram/mzg_pack/tree/38f8e775fd2922ca3602863eadfb3de07ea1c9db)
- [travisstaloch/protobuf-zig: A protocol buffers implementation in zig](https://github.com/travisstaloch/protobuf-zig)
- [Zig - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=prime31.zig)
- [Your Repositories](https://github.com/rofrol?tab=repositories&q=&type=&language=zig&sort=)
- [ziggetty/main.zig at master · rofrol/ziggetty](https://github.com/rofrol/ziggetty/blob/master/main.zig)
- [std.os.sendfile - Zig](https://ziglang.org/documentation/master/std/#A;std:os.sendfile)
- [Code search results · GitHub](https://github.com/search?q=language%3Azig+%22tcpConnectToHost%22&type=code)
- [bork/auth.zig at 13459b9a5e0361dcde16d8a4c322cf323e9f8d8e · kristoff-it/bork](https://github.com/kristoff-it/bork/blob/13459b9a5e0361dcde16d8a4c322cf323e9f8d8e/src/network/auth.zig#L14)

- [mach/main.zig at main · hexops/mach · GitHub](https://github.com/hexops/mach/blob/main/tools/html-generator/main.zig)
- [zini: Minimal perfect hash function for Zig : Zig](https://www.reddit.com/r/Zig/comments/wx6kbw/zini_minimal_perfect_hash_function_for_zig/)
- [use case: comptime allocator · Issue #1291 · ziglang/zig](https://github.com/ziglang/zig/issues/1291)
- [judofyr/zini: Minimal perfect hash function for Zig](https://github.com/judofyr/zini)
- [Implementing a file pager in Zig: Overall design - RavenDB NoSQL Database](https://ravendb.net/articles/implementing-a-file-pager-in-zig-overall-design)
- [Implementing a file pager in Zig: What do we need? - Ayende @ Rahien](https://ayende.com/blog/195587-B/implementing-a-file-pager-in-zig-what-do-we-need)
- [Implementing a file pager in Zig: Using mmap - Ayende @ Rahien](https://ayende.com/blog/195588-B/implementing-a-file-pager-in-zig-using-mmap)
- [Implementing a file pager in Zig: Rethinking my approach - Ayende @ Rahien](https://ayende.com/blog/195969-A/implementing-a-file-pager-in-zig-rethinking-my-approach)
- [Newest 'zig' Questions - Stack Overflow](https://stackoverflow.com/questions/tagged/zig)
- [type conversion - Convert i32 into f32 - Stack Overflow](https://stackoverflow.com/questions/75171967/convert-i32-into-f32)
- [How can I create a HashMap on the heap in Zig? - Stack Overflow](https://stackoverflow.com/questions/74904968/how-can-i-create-a-hashmap-on-the-heap-in-zig)
- [Am I using ArrayLists wrong in Zig when performing simple variable assignment changes function behaviour? - Stack Overflow](https://stackoverflow.com/questions/74709155/am-i-using-arraylists-wrong-in-zig-when-performing-simple-variable-assignment-ch)

- [atemmel/zig-proxy](https://github.com/atemmel/zig-proxy)
- [KekOnTheWorld/ZMC: An asynchronous Minecraft reverse proxy written in ZIG.](https://github.com/KekOnTheWorld/ZMC)
- [ZMC/Config.zig at main · KekOnTheWorld/ZMC · GitHub](https://github.com/KekOnTheWorld/ZMC/blob/main/src/Config.zig)
- [mattnite/zig-libssh2: compile libssh2 in your build.zig](https://github.com/mattnite/zig-libssh2)
- [mattnite/zig-mbedtls: compile mbedtls in your build.zig](https://github.com/mattnite/zig-mbedtls)
- [mattnite/zig-libcurl: compile libcurl in your build.zig](https://github.com/mattnite/zig-libcurl)
- [scheibo/zigpkg: Example project for using Zig to write native extensions that work with Node.js/WASM](https://github.com/scheibo/zigpkg)
- [jedisct1/libsodium: A modern, portable, easy to use crypto library.](https://github.com/jedisct1/libsodium)
- [pkmn/engine: A minimal, complete, Pokémon battle simulation engine optimized for performance](https://github.com/pkmn/engine)
- [WalderlanSena/hashblade: Encrypted texts and perform Brute Force. Through Hash MD5, SHA1, SHA256, SHA512.. In all operating systems Gnu/Linux , Windows, MacOs](https://github.com/WalderlanSena/hashblade)
- [A tour of std.crypto in Zig 0.7.0 - Frank Denis - YouTube](https://www.youtube.com/watch?v=9t6Y7KoCvyk)
- [tigerbeetle/vopr.zig at 0e32c5b5c5a38fb42946d2bc5451a3e87f759be7 · tigerbeetledb/tigerbeetle](https://github.com/tigerbeetledb/tigerbeetle/blob/0e32c5b5c5a38fb42946d2bc5451a3e87f759be7/src/vopr.zig#L377)
- [guidovranken/cryptofuzz: Fuzzing cryptographic libraries. Magic bug printer go brrrr.](https://github.com/guidovranken/cryptofuzz)
- [Luukdegram/feilich: Small, no dependency, TLS 1.3 implementation in Zig, for Zig.](https://github.com/Luukdegram/feilich)
- [std.crypto.pwhash.bcrypt.strHash - Zig](https://ziglang.org/documentation/master/std/#A;std:crypto.pwhash.bcrypt.strHash)
- [MasterQ32/ftz: A simple cross-platform file transfer utility](https://github.com/MasterQ32/ftz)
- [zig-serve/http.zig at master · MasterQ32/zig-serve · GitHub](https://github.com/MasterQ32/zig-serve/blob/master/examples/http.zig)
- [zig-tracer/tracer.zig at master · MasterQ32/zig-tracer](https://github.com/MasterQ32/zig-tracer/blob/master/tracer.zig)
- [MasterQ32/ZigPaint: A simple paint application written in Zig. Used to create an OpenGL loader/wrapper and a minimal UI system.](https://github.com/MasterQ32/ZigPaint)
- [I think Zig will reserve a few interesting surprises also in the webdev world, i... | Hacker News](https://news.ycombinator.com/item?id=24616069)
- [Trying Zig with C web servers - dermetfan](https://dermetfan.net/posts/zig-with-c-web-servers.html)
- [I Quit My Cushy Job at OkCupid to Live on Donations to Zig - Andrew Kelley](https://andrewkelley.me/post/full-time-zig.html)
- [mini-http-server-in-zig/main.zig at main · rofrol/mini-http-server-in-zig · GitHub](https://github.com/rofrol/mini-http-server-in-zig/blob/main/src/main.zig)

- [zig -ziglar -sharko -zag -zack - YouTube](https://www.youtube.com/results?search_query=zig+-ziglar+-sharko+-zag+-zack)
- [MasterQ32/ZigAndroidTemplate: This repository contains a example on how to create a minimal Android app in Zig.](https://github.com/MasterQ32/ZigAndroidTemplate)

- [prime31/zig-soloud](https://github.com/prime31/zig-soloud)
- [prime31/zig-fmod](https://github.com/prime31/zig-fmod)

- [Search Results for zig - DEV Community 👩‍💻👨‍💻](https://dev.to/search?q=zig)
- [Porting a simple Mark-Sweep Garbage Collector to Zig - DEV Community 👩‍💻👨‍💻](https://dev.to/justinethier/porting-a-simple-mark-sweep-garbage-collector-to-zig-eg5)
- [Why you should learn Zig - DEV Community 👩‍💻👨‍💻](https://dev.to/hanna/why-you-should-learn-zig-329a)
- [flat array from the multi dimensional zig-zag array - DEV Community 👩‍💻👨‍💻](https://dev.to/hidaytrahman/flat-array-from-the-multi-dimensional-zig-zag-array-4l4e)
- [Validating strings at compile time in Zig - DEV Community 👩‍💻👨‍💻](https://dev.to/euantorano/validating-strings-at-compile-time-in-zig-539h)
- [Debugging Zig with VS Code - DEV Community 👩‍💻👨‍💻](https://dev.to/watzon/debugging-zig-with-vs-code-44ca)

- [Paid Zig Stream - YouTube](https://www.youtube.com/watch?v=eIX9zER9vjY&t=34s)
- [Why Async/Await in Zig isn't That Easy - Loris Cro - YouTube](https://www.youtube.com/watch?v=lMaHr5u4DGo)
- [3 things you might like about Zig - YouTube](https://www.youtube.com/watch?v=3DxjZmLBizI)
- [Rafał Pocztarski - Zig, because fullstack is no longer just JavaScript and TypeScript #ziglang - YouTube](https://www.youtube.com/watch?v=_WccWcx0p4k)
- [Zig Compiler Internals - Andrew Kelley - YouTube](https://www.youtube.com/watch?v=8MbREuiLQrM)
- [Zig language: a WAY better C! - YouTube](https://www.youtube.com/watch?v=J6ZxxnSp_fY)
- [Learning Zig with Ziglings - YouTube](https://www.youtube.com/watch?v=391iJ0qGbqM)
- [Solving Common Pointer Conundrums - Loris Cro - YouTube](https://www.youtube.com/watch?v=VgjRyaRTH6E)
- [Should You Learn C Before Zig? - YouTube](https://www.youtube.com/watch?v=dK41zamWqz8)
- [Advanced Hello World in Zig - Loris Cro - YouTube](https://www.youtube.com/watch?v=iZFXAN8kpPo)
- [Zig: a great fit for emulators - Benjamin Feng - YouTube](https://www.youtube.com/watch?v=jkkUS0nmdsg)
- [Q&A: Going to School for C? Forget C, Learn Zig (from Webi #23) - YouTube](https://www.youtube.com/watch?v=OuaaHIwc3lM)
- [allocators in zig programming - YouTube](https://www.youtube.com/watch?v=bS7jtl-CoEs)
- [3. Fundamental Data Types | Zig Programming Language Tutorials - YouTube](https://www.youtube.com/watch?v=GuhC3J5C3NM)
- [First time! ⚡ Advent of Code in Zig Day 1 - YouTube](https://www.youtube.com/watch?v=IcJnvRE1nDc)
- [Reading Zig's Standard Library - YouTube](https://www.youtube.com/watch?v=NQgju_2mX-8)
- [A to Zig | 01 Hello World - YouTube](https://www.youtube.com/watch?v=iWqCekosIiI)
- [Abusing comptime to turn Zig into JS ⚡ Advent of Code in Zig Day 4 - YouTube](https://www.youtube.com/watch?v=es35PdkvcNg)
- [Efficient Web Assembly with the Smarts of Zig - YouTube](https://www.youtube.com/watch?v=owK-vhT8ibE)
- [Adam Serafini: Speeding up Python with Zig - YouTube](https://www.youtube.com/watch?v=O0MmmZxdct4)
- [BPF with Zig - Matt Knight - YouTube](https://www.youtube.com/watch?v=vZYKq3Dvv0g)
- [TigerBeetle - A Million Financial Transactions per Second in Zig - YouTube](https://www.youtube.com/watch?v=BH2jvJ74npM)
- [Compile WebAssembly on Linux to native Windows using Wasmer & Zig - YouTube](https://www.youtube.com/watch?v=VbYy2gqjnJI)
- [Zig Tutorial part 1 - YouTube](https://www.youtube.com/watch?v=G170lsf551Q)
- [Coding by voice in Zig - Rickard Andersson - YouTube](https://www.youtube.com/watch?v=GM_siEPD4Ws)
- [Indexing Zig w/ Auguste Rame - Sourcegraph Live #1 - YouTube](https://www.youtube.com/watch?v=xKMTzVgvf60)

- [context:global lang:zig -repo:.\*/bun -file:build.zig "application/x-www-form-urlencoded" - Sourcegraph](https://sourcegraph.com/search?q=context:global+lang:zig+-repo:.*/bun+-file:build.zig+%22application/x-www-form-urlencoded%22&patternType=standard&sm=1&groupBy=repo)
- [internal.zig - nektro/zig-docker - Sourcegraph](https://sourcegraph.com/github.com/nektro/zig-docker/-/blob/src/internal.zig)
- [Request.zig - Luukdegram/apple_pie - Sourcegraph](https://sourcegraph.com/github.com/Luukdegram/apple_pie/-/blob/src/Request.zig)
- [apple_pie/Request.zig at 5eaaabdced4f9b8d6cee947b465e7ea16ea61f42 · Luukdegram/apple_pie](https://github.com/Luukdegram/apple_pie/blob/5eaaabdced4f9b8d6cee947b465e7ea16ea61f42/src/Request.zig#L455)
- [Sending form data - Learn web development | MDN](https://developer.mozilla.org/en-US/docs/Learn/Forms/Sending_and_retrieving_form_data)
- [aws.zig - elerch/aws-sdk-for-zig - Sourcegraph](https://sourcegraph.com/github.com/elerch/aws-sdk-for-zig/-/blob/src/aws.zig)
- [⚡ Live Coding a Web Server in Zig ⚡ - 02 - YouTube](https://www.youtube.com/watch?v=gnTI9PNsu1U)
- [⚡ Live Coding a Web Server in Zig ⚡ - 03 - YouTube](https://www.youtube.com/watch?v=BTXHalxmHvs)
- [Proposal: Short Vector Primitives · Issue #7295 · ziglang/zig](https://github.com/ziglang/zig/issues/7295)
- [Array (data structure) - Wikipedia](https://en.m.wikipedia.org/wiki/Array_(data_structure))
- [zig array resizable - Szukaj w Google](https://www.google.com/search?q=zig+array+resizable&rlz=1C5CHFA_enPL1026PL1026&oq=zig+array+resizable+&aqs=chrome..69i57j69i64l3.4472j0j7&sourceid=chrome&ie=UTF-8)
- [cr in zig](https://gist.github.com/zickzackv/c12039a7b85484f9681851612a11ec58)
- [Unable to Create Array with Runtime Variable : Zig](https://www.reddit.com/r/Zig/comments/iy86jk/unable_to_create_array_with_runtime_variable/)
- [Append to slice in Zig : Zig](https://www.reddit.com/r/Zig/comments/k9q0vi/append_to_slice_in_zig/)

- [context:global lang:zig -repo:.\*/bun -file:build.zig std.sort.sort - Sourcegraph](https://sourcegraph.com/search?q=context:global++lang:zig+-repo:.*/bun+-file:build.zig+std.sort.sort&patternType=standard&sm=1&groupBy=repo)
- [oven-sh/bun: Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one.](https://github.com/oven-sh/bun)
- [zig arraylist tutorial - Szukaj w Google](https://www.google.com/search?q=zig+arraylist+tutorial&rlz=1C5CHFA_enPL1026PL1026&oq=zig+arraylist+tutorial&aqs=chrome..69i57j69i64l3.6225j0j7&sourceid=chrome&ie=UTF-8)
- [arraylist, vectors and iterators in ziglang - YouTube](https://www.youtube.com/watch?v=OhmfLyHYcCo)
- [Cool Zig Patterns - Gotta alloc fast - Zig NEWS](https://zig.news/xq/cool-zig-patterns-gotta-alloc-fast-23h)
- [Yep. Zig is shaping up to be the low-level programming language I've been waitin... | Hacker News](https://news.ycombinator.com/item?id=21739793)
- [Building a high-performance database buffer pool in Zig using io_uring's new fixed-buffer mode](https://gavinray97.github.io/blog/io-uring-fixed-bufferpool-zig)

- [pointlander/peg: Peg, Parsing Expression Grammar, is an implementation of a Packrat parser generator.](https://github.com/pointlander/peg)
- [breaking changes !｜ zig note](https://zenn.dev/ousttrue/books/b2ec4e93bdc5c4/viewer/4a67f3#pkg.path)

- [Keep Coding](https://liujiacai.net/)
- [jiacai2050/loc: Lines of code in Zig](https://github.com/jiacai2050/loc)
- [jiacai2050/simargs: A simple, opinionated, struct-based argument parser in Zig.](https://github.com/jiacai2050/simargs)
- [jiacai2050/ztags: Generate tags files for Zig projects](https://github.com/jiacai2050/ztags)
- [MasterQ32/zig-args: Simple-to-use argument parser with struct-based config](https://github.com/MasterQ32/zig-args)
- [elfsternberg/lru-weighted-cache: A Weighted Least Recently Used Cache for Rust](https://github.com/elfsternberg/lru-weighted-cache)
- [Sobeston/table-helper: A small zig package for fmt printing tables](https://github.com/Sobeston/table-helper)
- [mattn/zig-curl: cURL binding for Zig](https://github.com/mattn/zig-curl)
- [Arwalk/zig-protobuf: a protobuf 3 implementation for zig.](https://github.com/Arwalk/zig-protobuf)
- [Zig language: a WAY better C! - YouTube](https://www.youtube.com/watch?v=J6ZxxnSp_fY)
- [Zig weekly newsletter - discu.eu](https://discu.eu/weekly/zig/)
- [Meghan's Blog](https://nektro.mataroa.blog/)
- [This Week In Zig](https://thisweekinzig.mataroa.blog/)
- [Is zig lang faster than rust? - The Rust Programming Language Forum](https://users.rust-lang.org/t/is-zig-lang-faster-than-rust/70390)
- [Turing tarpit - Wikipedia](https://en.m.wikipedia.org/wiki/Turing_tarpit)
- [Rust VS Zig benchmarks, Which programming language or compiler is faster](https://programming-language-benchmarks.vercel.app/rust-vs-zig)
- [Programming-Language-Benchmarks/1.zig at main · hanabi1224/Programming-Language-Benchmarks · GitHub](https://github.com/hanabi1224/Programming-Language-Benchmarks/blob/main/bench/algorithm/json-serde/1.zig)
- [TigerBeetle raises $6.4M to power the future of financial accounting infrastructure | TigerBeetle](https://tigerbeetle.com/blog/2023-01-30-series-seed-announcement/)
- [Three Clocks are Better than One | TigerBeetle](https://tigerbeetle.com/blog/three-clocks-are-better-than-one/)

- [Nahua Kang on Twitter: "Great news for the entire #ziglang community! 🦎⚡️" / Twitter](https://twitter.com/nahuakang/status/1620146221431271425)
- [Michal Ziulek🇺🇦 on Twitter: "This is how I do dynamic dispatch in #ziglang (when I really need it). Can be easily extended to more parents, virtuals with default implementations etc. https://t.co/wq24yUan8T" / Twitter](https://twitter.com/MichalZiulek/status/1619386778850557952)
- [Analyze ziglang/zig | OSSInsight](https://ossinsight.io/analyze/ziglang/zig#overview)

- [Memoization and the Fibonacci Sequence | The Cloistered Monkey](https://necromuralist.github.io/posts/memoization-and-the-fibonacci-sequence/)
- [memory - Correct BigInt Fibonacci Implementation in Zig Lang - Stack Overflow](https://stackoverflow.com/questions/70761612/correct-bigint-fibonacci-implementation-in-zig-lang)
- [Super slow Big Int Implementation in Zig · Issue #10630 · ziglang/zig · GitHub](https://github.com/ziglang/zig/issues/10630)
- [GitHub - tiehuis/euler: Solutions for](https://github.com/tiehuis/euler)
- [euler/zig/src at master · tiehuis/euler · GitHub](https://github.com/tiehuis/euler/tree/master/zig/src)
- [blog](https://tiehu.is/)
- [blog](https://tiehu.is/blog/zig2)
- [blog](https://tiehu.is/blog/zig1)
- [blog](https://tiehu.is/blog/blog1)
- [std/math: optimize division with divisors less than a half-limb by tiehuis · Pull Request #10798 · ziglang/zig · GitHub](https://github.com/ziglang/zig/pull/10798)

- [MachO Flush... warning(link): library not found for '-lglfw' : Zig](https://www.reddit.com/r/Zig/comments/10jdt31/comment/j6agts2/)
- [rofrol/the-rules-of-programming-in-zig](https://github.com/rofrol/the-rules-of-programming-in-zig)

- [Exploring the zig build system - Random Musings](https://people.freebsd.org/~dch/posts/2021-02-12-zig-build-system.html)
- [Running Zig with WASI on Cloudflare Workers](https://blog.cloudflare.com/running-zig-with-wasi-on-cloudflare-workers/)
- [Zig <3 Raspberry-Pi GPIO](https://dominic.io/post/zig-gpio/)

- [zig - Converting a slice to an array - Stack Overflow](https://stackoverflow.com/questions/70102667/converting-a-slice-to-an-array)
- [Zig in 30 minutes](https://gist.github.com/ityonemo/769532c2017ed9143f3571e5ac104e50?permalink_comment_id=3649275)
- [Slice referring to out of scope data in zig language - Stack Overflow](https://stackoverflow.com/questions/64353847/slice-referring-to-out-of-scope-data-in-zig-language)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Lifetime-and-Ownership)
- [returning a pointer to a local should be a compile error · Issue #5725 · ziglang/zig](https://github.com/ziglang/zig/issues/5725)
- [heap allocate ziglang - Szukaj w Google](https://www.google.com/search?q=heap+allocate+ziglang&rlz=1C5CHFA_enPL1026PL1026&oq=heap+allocate+ziglang&aqs=chrome..69i57j33i160.1999j0j7&sourceid=chrome&ie=UTF-8)
- [How is managing memory in Zig different than C? : Zig](https://www.reddit.com/r/Zig/comments/iu37eg/how_is_managing_memory_in_zig_different_than_c/)
- [Untangling Lifetimes: The Arena Allocator - by Ryan Fleury](https://www.rfleury.com/p/untangling-lifetimes-the-arena-allocator)
- [Trying out Zig - Zigominoes | Lewis Gaul](https://www.lewisgaul.co.uk/blog/coding/2021/01/10/trying-zig/)
- [Returning struct from function break data when allocating : Zig](https://www.reddit.com/r/Zig/comments/l43ajc/returning_struct_from_function_break_data_when/)
- [A Brief Exploration of Zig - Garrett's Blog](https://gsquire.github.io/static/post/a-brief-exploration-of-zig/)
- [Have you ever tried Zig ? - DEV Community 👩‍💻👨‍💻](https://dev.to/pmalhaire/ziglang-first-contact-with-memory-safety-and-simplicity-83p)
- [Conditional structures - Rosetta Code](https://rosettacode.org/wiki/Conditional_structures)

- [(13) Discord | "invalid byte sequence for encoding "UTF8": 0xf0 0x6e 0x80 0x6b" | Zig Programming Language](https://discord.com/channels/605571803288698900/1068000302583787531)
- [star-tek-mb/pgz: Postgres driver written in pure Zig](https://github.com/star-tek-mb/pgz)
- [ibebrett/zigzag](https://github.com/ibebrett/zigzag)
- [Introducing ⚡zap⚡ - blazingly fast backends in zig - Zig NEWS](https://zig.news/renerocksai/introducing-zap-blazingly-fast-backends-in-zig-3jhh)
- [renerocksai/zap: blazingly fast backends in zig](https://github.com/renerocksai/zap)
- [leroycep/utils.zig](https://github.com/leroycep/utils.zig)
- [mitchellh/libxev: libxev is a cross-platform, high-performance event loop that provides abstractions for non-blocking IO, timers, events, and more and works on Linux (io_uring or epoll), macOS (kqueue), and Wasm + WASI. Available as both a Zig and C API.](https://github.com/mitchellh/libxev)

- [jackdbd/zigfmt-web: run zig fmt in a wasm module](https://github.com/jackdbd/zigfmt-web)

- [import zig package from another zig package - Stack Overflow](https://stackoverflow.com/questions/68421136/import-zig-package-from-another-zig-package)
- [Zig-Showdown/build.zig at main · zig-community/Zig-Showdown](https://github.com/zig-community/Zig-Showdown/blob/main/build.zig#L6-L62)
- [Zig-Showdown/build.zig at main · zig-community/Zig-Showdown](https://github.com/zig-community/Zig-Showdown/blob/main/build.zig#L112-L118)
- [import of file outside package path : Zig](https://www.reddit.com/r/Zig/comments/ra5qeo/import_of_file_outside_package_path/)
- [How do I include one .zig file from another .zig file - Stack Overflow](https://stackoverflow.com/questions/71186556/how-do-i-include-one-zig-file-from-another-zig-file)
- [compilation - Using zig compiler as a library - Stack Overflow](https://stackoverflow.com/questions/68609919/using-zig-compiler-as-a-library)

- [zig/path.zig at master · ziglang/zig · GitHub](https://github.com/ziglang/zig/blob/master/lib/std/fs/path.zig)
- [rename std.mem.split to tokenize and add a similar function which includes empty fields · Issue #1784 · ziglang/zig](https://github.com/ziglang/zig/issues/1784)
- [I was fairly hyped up about Zig with various HN pieces I've read and wanted to c... | Hacker News](https://news.ycombinator.com/item?id=26575313)
- [Improved handling of strings and unicode · Issue #234 · ziglang/zig](https://github.com/ziglang/zig/issues/234)
- [ziglang string manipulation - Szukaj w Google](https://www.google.com/search?q=ziglang+string+manipulation&rlz=1C5CHFA_enPL1026PL1026&oq=ziglang+string+mani&aqs=chrome.1.69i57j33i160l5.5783j0j7&sourceid=chrome&ie=UTF-8)
- [01.04.2022 - Zig/Strings in 5 minutes](https://www.huy.rocks/everyday/01-04-2022-zig-strings-in-5-minutes)
- [How to deal with strings in Zig ? : Zig](https://www.reddit.com/r/Zig/comments/9q3or3/how_to_deal_with_strings_in_zig/)
- [clownpriest/strings: strings for zig](https://github.com/clownpriest/strings)
- [Chapter 1 - Basics | ziglearn.org](https://ziglearn.org/chapter-1/#slices)
- [Pointers in Zig](https://nmichaels.org/zig/pointers.html)
- [ziglang tolwer - Szukaj w Google](https://www.google.com/search?q=ziglang+tolwer&rlz=1C5CHFA_enPL1026PL1026&oq=ziglang+tolwer&aqs=chrome..69i57j33i160l4.2899j0j7&sourceid=chrome&ie=UTF-8)
- [zig/fmt.zig at master · ziglang/zig · GitHub](https://github.com/ziglang/zig/blob/master/lib/std/fmt.zig)
- [Carbon’s most exciting feature is its calling convention | Hacker News](https://news.ycombinator.com/item?id=32292934)
- [Reddit - Dive into anything](https://www.reddit.com/r/programmingcirclejerk/comments/rm2p4t/i_was_actually_slightly_interested_in_zig_until_i/)
- [Building a database buffer pool in Zig using io_uring's new fixed-buffer mode | Hacker News](https://news.ycombinator.com/item?id=33218185)
- [java_bindings.zig - GitHub Code Search](https://cs.github.com/tigerbeetledb/tigerbeetle/blob/6b66ebecc740daaadbef34a2b168f6f4f3dfe9bb/src/clients/java/java_bindings.zig?q=language%3Azig+%22lowerString%22#L135)
- [debugger.zig - GitHub Code Search](https://cs.github.com/ordovician/Zacktron-33/blob/eab8912f361bace98ea0f36daeed622a48452b1e/src/debugger.zig?q=language%3Azig+%22lowerString%22#L28)
- [zek.zig - GitHub Code Search](https://cs.github.com/drcode/zek/blob/ef05c94e6239719194a2b01e6c57b8369538f1ea/src/zek.zig?q=language%3Azig+%22lowerString%22#L92)
- [font_cache.zig - GitHub Code Search](https://cs.github.com/zaneli/cosmic/blob/e26cc8ed9a6557e600ebac4cd5186ec94c3f9593/graphics/src/backend/gpu/font_cache.zig?q=language%3Azig+%22lowerString%22#L262)
- [string.zig - GitHub Code Search](https://cs.github.com/fubark/cosmic/blob/b85feaef0754dceb8762f3f3eafc115f2ed7e5d2/stdx/string.zig?q=language%3Azig+%22toLower%22#L78)
- [string.zig - GitHub Code Search](https://cs.github.com/fubark/cosmic/blob/b85feaef0754dceb8762f3f3eafc115f2ed7e5d2/stdx/string.zig?q=language%3Azig+%22toLower%22#L82)
- [bun/fs.zig at b767f9a99a2b4b6bd8f54cb851bda6a2696587ce · oven-sh/bun](https://github.com/oven-sh/bun/blob/b767f9a99a2b4b6bd8f54cb851bda6a2696587ce/src/fs.zig#L308)
- [std.ascii.lowerString - Zig](https://ziglang.org/documentation/master/std/#A;std:ascii.lowerString)

- [Where can I find some example of zig and sqlite, postres or mariadb working on macos arm? : Zig](https://www.reddit.com/r/Zig/comments/10jmk20/comment/j5pg95w/?context=3)

- [nikneym/wave: Tiny WAV encoder/decoder for Zig ⚡](https://github.com/nikneym/wave)
- [Minimal cross-platform graphics](https://zserge.com/posts/fenster/)
- [Minimal Cross-Platform Graphics | Hacker News](https://news.ycombinator.com/item?id=34500134)
- [zserge/fenster: The most minimal cross-platform GUI library](https://github.com/zserge/fenster)
- [Minimal cross-platform graphics | Lobsters](https://lobste.rs/s/xxbo7n)
- [Minimal cross-platform graphics + audio (~500 LOC) : tinycode](https://www.reddit.com/r/tinycode/comments/10jh3bp/minimal_crossplatform_graphics_audio_500_loc/)
- [Where can I find some example of zig and sqlite, postres or mariadb working on macos arm? : Zig](https://www.reddit.com/r/Zig/comments/10jmk20/comment/j5pqme8/?context=3)
- [Zig recap for week 3/2023 - discu.eu](https://discu.eu/weekly/zig/2023/3/)
- [Multi-thread awareness for default writer in trace.zig 0.3.0 - Zig NEWS](https://zig.news/huntrss/multi-thread-awareness-for-default-writer-in-tracezig-030-4219)
- [Zig | Everything I know](https://wiki.nikiv.dev/programming-languages/zig/)
- [How to Release your Zig Applications - Zig NEWS](https://zig.news/kristoff/how-to-release-your-zig-applications-2h90)
- [Zig build system internals | Hacker News](https://news.ycombinator.com/item?id=30470442)
- [Zig Build System Internals – Mitchell Hashimoto](https://mitchellh.com/zig/build-internals)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Import-from-C-Header-File)
- [Why Zig When There is Already C++, D, and Rust? ⚡ Zig Programming Language](https://ziglang.org/learn/why_zig_rust_d_cpp/)
- [example c import ziglang - Szukaj w Google](https://www.google.com/search?q=example+c+import+ziglang&rlz=1C5CHFA_enPL1026PL1026&oq=example+c+import+ziglang&aqs=chrome..69i57j33i160l4.4326j0j7&sourceid=chrome&ie=UTF-8)
- [support exporting a c-style var args function · Issue #515 · ziglang/zig](https://github.com/ziglang/zig/issues/515)

- [How can I pass a Zig String literal to C - Stack Overflow](https://stackoverflow.com/questions/72607441/how-can-i-pass-a-zig-string-literal-to-c)
- [I'm still confused on the why's of Zig : Zig](https://www.reddit.com/r/Zig/comments/srk7ws/im_still_confused_on_the_whys_of_zig/)
- [How to Write a Redis Module in Zig | Redis](https://redis.com/blog/write-redis-module-zig/)
- [How Uber Uses Zig - Motiejus Jakštys Public Record](https://jakstys.lt/2022/how-uber-uses-zig/)
- [blog](https://tiehu.is/blog/zig1)
- [An intro to Zig's integer casting for C programmers | Lager](https://www.lagerdata.com/articles/an-intro-to-zigs-integer-casting-for-c-programmers)
- [Preventing integer overflow in Zig | Lager](https://www.lagerdata.com/articles/preventing-integer-overflow-in-zig)
- [ziglearn/chapter-4.md at master · Sobeston/ziglearn](https://github.com/Sobeston/ziglearn/blob/master/chapter-4.md)
- [Interaction with C in Zig - DEV Community 👩‍💻👨‍💻](https://dev.to/dannypsnl/interaction-with-c-in-zig-540c)
- [ziglang import c header - Szukaj w Google](https://www.google.com/search?q=ziglang+import+c+header&rlz=1C5CHFA_enPL1026PL1026&oq=ziglang+import+c+header&aqs=chrome..69i57j69i60.3456j0j7&sourceid=chrome&ie=UTF-8)
- [language:zig libpq - GitHub Code Search](https://cs.github.com/?scopeName=All+repos&scope=&q=language%3Azig+libpq)
- [postgres/postgres.zig at main · ziggurat-of-ur/postgres](https://github.com/ziggurat-of-ur/postgres/blob/main/postgres.zig)
- [zig-postgres/build.zig at 35f72a554a25695b86ac489712b553c2cef319c1 · jane0009/zig-postgres · GitHub](https://github.com/jane0009/zig-postgres/blob/35f72a554a25695b86ac489712b553c2cef319c1/build.zig)
- [jane0009/zig-postgres at 35f72a554a25695b86ac489712b553c2cef319c1](https://github.com/jane0009/zig-postgres/tree/35f72a554a25695b86ac489712b553c2cef319c1)
- [Code search results · GitHub](https://github.com/search?q=repo%3ASobeston%2Fziglearn%20allocator&type=code)
- [ziglearn/test-out.zig at bd08cffcb115bae86747406b7efc5f30795b47e9 · Sobeston/ziglearn](https://github.com/Sobeston/ziglearn/blob/bd08cffcb115bae86747406b7efc5f30795b47e9/test-out.zig#L4)
- [std.builtin: renamings by r00ster91 · Pull Request #13930 · ziglang/zig](https://github.com/ziglang/zig/pull/13930/files)
- [Setting up Visual Studio Code for writing Zig - Zig NEWS](https://zig.news/jarredsumner/setting-up-visual-studio-code-for-writing-zig-kcj)
- [(13) Discord | #zig-help | Zig Programming Language](https://discord.com/channels/605571803288698900/1019652020308824145/threads/1067548360082464879)

- [Zig-style generics are not well-suited for most languages : ProgrammingLanguages](https://www.reddit.com/r/ProgrammingLanguages/comments/xzfdix/zigstyle_generics_are_not_wellsuited_for_most/)

- [Where can I find some example of zig and sqlite, postres or mariadb working on macos arm? : Zig](https://www.reddit.com/r/Zig/comments/10jmk20/comment/j5ocat9/?context=3)
- [Zig-style generics are not well-suited for most languages](https://typesanitizer.com/blog/zig-generics.html)
- [Community Projects · ziglang/zig Wiki](https://github.com/ziglang/zig/wiki/Community-Projects)
- [FAQ · ziglang/zig Wiki](https://github.com/ziglang/zig/wiki/FAQ)
- https://github.com/raysan5/raylib/
- [build.zig - GitHub Code Search](https://cs.github.com/jedisct1/libsodium/blob/9cd9a0d1203359aee46c7c8619a342666f1570b8/build.zig?q=language%3Azig+%22addIncludePath%22)
- [ziglang addIncludePath - Szukaj w Google](https://www.google.com/search?q=ziglang+addIncludePath&rlz=1C5CHFA_enPL1026PL1026&oq=ziglang+addIncludePath&aqs=chrome..69i57j35i39l2j0i19i512l7.1191j0j7&sourceid=chrome&ie=UTF-8)
- [mjoerussell/zdb: A library for interacting with databases in Zig](https://github.com/mjoerussell/zdb)
- [zq/postgres.zig at 2821fcf5a478239e1e5ce86868b45bf6895bfea2 · frmdstryr/zq](https://github.com/frmdstryr/zq/blob/2821fcf5a478239e1e5ce86868b45bf6895bfea2/src/backend/postgres.zig#L21)
- [zq/engine.zig at master · frmdstryr/zq · GitHub](https://github.com/frmdstryr/zq/blob/master/src/engine.zig)
- [frmdstryr/zq: A pure Zig database object relation mapper (currently using postgres)](https://github.com/frmdstryr/zq)

- [huffman-visualization/huffman.zig at 6a1baca56e5b1bfcf177685696730d216d310fd3 · 190n/huffman-visualization · GitHub](https://github.com/190n/huffman-visualization/blob/6a1baca56e5b1bfcf177685696730d216d310fd3/src/zig/src/huffman.zig)
- [zba/scheduler.zig at 3f72367aaf231bf71227ffed90f6d7da9698de93 · paoda/zba · GitHub](https://github.com/paoda/zba/blob/3f72367aaf231bf71227ffed90f6d7da9698de93/src/core/scheduler.zig)
- [machlibs](https://github.com/machlibs)
- [kassane/libvlc-zig: Zig bindings for libVLC media framework.](https://github.com/kassane/libvlc-zig)
- [davidgm94/rise: Trying to write a new operating system from scratch in Zig](https://github.com/davidgm94/rise)
- [xEgoist](https://github.com/xEgoist)
- [wisp/keys.zig at b12b8afa6b680cc173fd5e5a09d6a40a528ff2c1 · mbrock/wisp · GitHub](https://github.com/mbrock/wisp/blob/b12b8afa6b680cc173fd5e5a09d6a40a528ff2c1/core/keys.zig)
- [advent-of-code/day2b.zig at 8e1d4c8e84075afff582aaca59d79d0fc2fef4f8 · andrewrk/advent-of-code · GitHub](https://github.com/andrewrk/advent-of-code/blob/8e1d4c8e84075afff582aaca59d79d0fc2fef4f8/2018/day2b.zig)
- [ccgeom/zmath.zig at 93f9e96261b91be8abcb604011ab4b281ed4ad44 · mountain/ccgeom · GitHub](https://github.com/mountain/ccgeom/blob/93f9e96261b91be8abcb604011ab4b281ed4ad44/zig/zmath.zig)
- [simulations/zmath.zig at 01774cb62233c5e0ce75a1f52717e598a6a479d6 · ckrowland/simulations · GitHub](https://github.com/ckrowland/simulations/blob/01774cb62233c5e0ce75a1f52717e598a6a479d6/libs/zmath/src/zmath.zig)
- [hoodie/protocol.zig at 234e80572428f10adce35080e4679ad8b295d0cb · gernest/hoodie · GitHub](https://github.com/gernest/hoodie/blob/234e80572428f10adce35080e4679ad8b295d0cb/src/db/pq/protocol.zig)
- [nanovg-zig/internal.zig at 639121af836c73d617e69d76a90f752808d0e36e · fabioarnold/nanovg-zig · GitHub](https://github.com/fabioarnold/nanovg-zig/blob/639121af836c73d617e69d76a90f752808d0e36e/src/internal.zig)
- [Florence/ipc.zig at aaa5a9e568197ad24780ec9adb421217530d4466 · FlorenceOS/Florence · GitHub](https://github.com/FlorenceOS/Florence/blob/aaa5a9e568197ad24780ec9adb421217530d4466/subprojects/flork/src/kepler/ipc.zig)
- [zero-graphics/Sdk.zig at c64cf5d19b7c3cfbc32cb8424554e0f9ae8c5c0a · MasterQ32/zero-graphics · GitHub](https://github.com/MasterQ32/zero-graphics/blob/c64cf5d19b7c3cfbc32cb8424554e0f9ae8c5c0a/Sdk.zig)
- [Ray-Tracing-in-One-Weekend.zig/main.zig at 0b415d7dcd2992f9969001ca4f0ec5cb799a9595 · ryoppippi/Ray-Tracing-in-One-Weekend.zig · GitHub](https://github.com/ryoppippi/Ray-Tracing-in-One-Weekend.zig/blob/0b415d7dcd2992f9969001ca4f0ec5cb799a9595/src/main.zig)
- [huffman-visualization/pq.zig at 6a1baca56e5b1bfcf177685696730d216d310fd3 · 190n/huffman-visualization · GitHub](https://github.com/190n/huffman-visualization/blob/6a1baca56e5b1bfcf177685696730d216d310fd3/src/zig/src/pq.zig)
- [hoodie/oid.zig at 234e80572428f10adce35080e4679ad8b295d0cb · gernest/hoodie · GitHub](https://github.com/gernest/hoodie/blob/234e80572428f10adce35080e4679ad8b295d0cb/src/db/pq/oid.zig)
- [cosmic/lib.zig at b85feaef0754dceb8762f3f3eafc115f2ed7e5d2 · fubark/cosmic · GitHub](https://github.com/fubark/cosmic/blob/b85feaef0754dceb8762f3f3eafc115f2ed7e5d2/lib/nghttp2/lib.zig)
- [hello-algo/codes/zig at fc8bbb7d1c87ed673ce53fa1356a2298add36a70 · krahets/hello-algo · GitHub](https://github.com/krahets/hello-algo/tree/fc8bbb7d1c87ed673ce53fa1356a2298add36a70/codes/zig)
- [krahets/hello-algo at fc8bbb7d1c87ed673ce53fa1356a2298add36a70](https://github.com/krahets/hello-algo/tree/fc8bbb7d1c87ed673ce53fa1356a2298add36a70)
- [ewalk153/route-finder-zig: Dijkstra's algorithm, in zig](https://github.com/ewalk153/route-finder-zig)
- [Zig and wasm on the command line | Eric's Site](https://www.chartewalk.com/posts/zig-wasm/)
- [jane0009/zig-postgres: Zig wrapper for postgres](https://github.com/jane0009/zig-postgres)
- [Network Graph · tonis2/zig-postgres](https://github.com/tonis2/zig-postgres/network)
- [nifker/zig-postgres: Zig wrapper for postgres](https://github.com/nifker/zig-postgres)
- [klaudiosinani/ao: Elegant Microsoft To-Do desktop app](https://github.com/klaudiosinani/ao)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Tuples)
- [(13) Discord | #zig-help | Zig Programming Language](https://discord.com/channels/605571803288698900/1019652020308824145/threads/1067083393352867891)

- [In-depth Overview ⚡ Zig Programming Language](https://ziglang.org/learn/overview/)
- [reddit.com: search results - linkSystemLibrary](https://www.reddit.com/r/Zig/search/?q=linkSystemLibrary&restrict_sr=1&sr_nsfw=)
- [Help using GSL with Zig : Zig](https://www.reddit.com/r/Zig/comments/vld7st/help_using_gsl_with_zig/)
- [macho: implement and handle `-needed-*` and `-needed_*` family of flags · ziglang/zig@0dd2892](https://github.com/ziglang/zig/commit/0dd28920daa5127ffe5a3691343fa519f7547cfd)
- [Setting up build.zig to auto search src directories. : Zig](https://www.reddit.com/r/Zig/comments/sgww2j/setting_up_buildzig_to_auto_search_src_directories/)
- [Understanding c includes : Zig](https://www.reddit.com/r/Zig/comments/pj1u6f/understanding_c_includes/)
- [Reddit - Dive into anything](https://www.reddit.com/r/Zig/comments/p7htvk/using_libtorch_in_zig/)

- [Ziglang](https://www.reddit.com/r/Zig/comments/10j8zpq/some_questions_from_a_newbie/)
- [Simple Zig](https://simplezig.blogspot.com/)
- https://github.com/ratfactor/Ziglings

- [Honestly, I know it's minor, but when I tried Zig the fact I couldn't do the cla... | Hacker News](https://news.ycombinator.com/item?id=25621183)
- [root.io.bufferedWriter - Zig](https://ziglang.org/documentation/master/std/#root;io.bufferedWriter)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#if)
- [ziglang if else expression - Szukaj w Google](https://www.google.com/search?q=ziglang+if+else+expression&rlz=1C5CHFA_enPL1026PL1026&oq=ziglang+if+else+expression&aqs=chrome..69i57j33i160.5957j0j7&sourceid=chrome&ie=UTF-8)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Labeled-for)
- [Always require brackets {} when using if/else/when/for etc. · Issue #4294 · ziglang/zig](https://github.com/ziglang/zig/issues/4294)
- [Make it more obvious that ifs are expressions by mokulus · Pull Request #3990 · ziglang/zig](https://github.com/ziglang/zig/pull/3990/files)
- [ziglang named if - Szukaj w Google](https://www.google.com/search?q=ziglang+named+if&rlz=1C5CHFA_enPL1026PL1026&oq=ziglang+named+if&aqs=chrome..69i57j33i160l2.2373j0j7&sourceid=chrome&ie=UTF-8)
- [allocator - Allocating a generic struct in Zig lang - Stack Overflow](https://stackoverflow.com/questions/64301274/allocating-a-generic-struct-in-zig-lang)

- [Trying to PostgreSQL from ZIG - need help. : kaiopatz](https://www.reddit.com/user/kaiopatz/comments/eipame/trying_to_postgresql_from_zig_need_help/)
- [MachO Flush... warning(link): library not found for '-lglfw' : Zig](https://www.reddit.com/r/Zig/comments/10jdt31/macho_flush_warninglink_library_not_found_for/)
- [GLFW on OS X starting guide](https://gist.github.com/v3n/27e810ac744b076ceeb7)
- [kdchambers/music_player: Demo music player written in zig](https://github.com/kdchambers/music_player)
- [MachO Flush... warning(link): library not found for '-lglfw' : Zig](https://www.reddit.com/r/Zig/comments/10jdt31/comment/j5juhfe/?context=3)
- [How to cast what how? : Zig](https://www.reddit.com/r/Zig/comments/f6l7n3/how_to_cast_what_how/)
- [vrischmann/zig-sqlite: zig-sqlite is a small wrapper around sqlite's C API, making it easier to use with Zig.](https://github.com/vrischmann/zig-sqlite)
- [How I built zig-sqlite](https://rischmann.fr/blog/how-i-built-zig-sqlite)
- [vrischmann/zig-sqlite-demo: Basic demo of zig-sqlite](https://github.com/vrischmann/zig-sqlite-demo)

- [leroycep/disk-kv-store: Some experiments with creating a portable key value store format](https://github.com/leroycep/disk-kv-store)

- [(13) Discord | #zig-help | Zig Programming Language](https://discord.com/channels/605571803288698900/1019652020308824145/threads/1067180383805911061)
- [lithdew/lmdb-zig: Lightweight, fully-featured, idiomatic cross-platform Zig bindings to Lightning Memory-Mapped Database (LMDB).](https://github.com/lithdew/lmdb-zig)
- [add support for verifying SSL certificates signed with X9_62_prime256v1 · Issue #14406 · ziglang/zig](https://github.com/ziglang/zig/issues/14406)
- [Writing a small ray tracer in Rust and Zig // My thought repository](https://nelari.us/post/raytracer_with_rust_and_zig/)
- [Zig Bare Bones - OSDev Wiki](https://wiki.osdev.org/Zig_Bare_Bones)
- [Writing a small ray tracer in Rust and Zig : programming](https://old.reddit.com/r/programming/comments/c7sgvw/writing_a_small_ray_tracer_in_rust_and_zig/)
- [grailsort.zig - GitHub Code Search](https://cs.github.com/SpexGuy/Zig-GrailSort/blob/274318340e56011bad02fcc73af12148423bbd18/src/grailsort.zig?q=language%3Azig+binarySearch)
- [ttf.zig - GitHub Code Search](https://cs.github.com/marler8997/cosmic/blob/9e23ec4cd70a8a4f059b6eb303371310534667ec/graphics/src/ttf.zig?q=language%3Azig+binarySearch)
- [main.zig - GitHub Code Search](https://cs.github.com/seandewar/challenge-solutions/blob/ea8ef1a18db79799cd5105960ed619192576d2d9/advent-of-code/2022/day21/src/main.zig?q=language%3Azig+binarySearch)
- [main.zig - GitHub Code Search](https://cs.github.com/clebs/aoc22.zig/blob/f20e7fa6c7f85f7d67a9feb01b5eed3d64d18c36/src/03/main.zig?q=language%3Azig+binarySearch)
- [binary_search.zig - GitHub Code Search](https://cs.github.com/krahets/hello-algo/blob/31eefe028a4b6ae122d408ad11401548c13a0091/codes/zig/chapter_searching/binary_search.zig?q=language%3Azig+binarySearch)
- [algo.zig - GitHub Code Search](https://cs.github.com/fubark/cosmic/blob/b85feaef0754dceb8762f3f3eafc115f2ed7e5d2/stdx/algo/algo.zig?q=language%3Azig+binarySearch)
- [main.zig - GitHub Code Search](https://cs.github.com/kivikakk/htmlentities.zig/blob/311c844c1d1d1cb968eedfeb76ce911038b1043a/src/main.zig?q=language%3Azig+binarySearch)
- [packs.zig - GitHub Code Search](https://cs.github.com/natecraddock/open-reckless-drivin/blob/1d408c6747498ff66cb50b302d9c8ff50dacf029/src/packs.zig?q=language%3Azig+binarySearch)
- [binarySearchTree.zig - GitHub Code Search](https://cs.github.com/kassane/Algorithms-Zig/blob/dea21913af71a805255c54795fc5cb3c93d6ed63/search/binarySearchTree.zig?q=language%3Azig+binarySearch)
- [p1list.zig - GitHub Code Search](https://cs.github.com/sagemathinc/JSage/blob/bc08d1b955976f4237f6a25f6df72d48fbaddf76/lib/src/modular/p1list.zig?q=language%3Azig+binarySearch)
- [day3.zig - GitHub Code Search](https://cs.github.com/matklad/aoc2022/blob/67800cfb0aa3dcb0103da06c0b6f2103f1494dc7/day3.zig?q=language%3Azig+binarySearch)
- [skip_tree.zig - GitHub Code Search](https://cs.github.com/chadwain/zss/blob/f049bf49a2959f6ad7dd104547ec7337add9ecbc/source/util/skip_tree.zig?q=language%3Azig+binarySearch)
- [report_repair.zig - GitHub Code Search](https://cs.github.com/zweimach/wiyata.zig/blob/054d5e56d10c9223efcb39431471b1bd09618aa7/advent_of_code/report_repair.zig?q=language%3Azig+binarySearch)
- [day2.zig - GitHub Code Search](https://cs.github.com/untitaker/aoc2020/blob/e9e464e470ff25e7f1cb65b5b70ae54107b30cf4/day2.zig?q=language%3Azig+binarySearch)
- [sort.zig - GitHub Code Search](https://cs.github.com/tyler569/zig/blob/173a143dd04f9ec75355c04be9b0e6353ee9bc03/lib/std/sort.zig?q=language%3Azig+binarySearch)
- [day1.zig - GitHub Code Search](https://cs.github.com/chivay/aoc2020/blob/7c36a801da151fa7b47a8fce96f2256dc69fd053/day1.zig?q=language%3Azig+binarySearch)
- [grailsort.zig - GitHub Code Search](https://cs.github.com/HolyGrailSortProject/Rewritten-Grailsort/blob/eb1ba2093126c35d1570713f8330f14682e11fe0/Zig/SpexGuy/src/grailsort.zig?q=language%3Azig+binarySearch)
- [style.zig - GitHub Code Search](https://cs.github.com/minierolls/termelot/blob/3799764b6b6ea9417a7881f461ec0cf95a48781b/src/style.zig?q=language%3Azig+binarySearch)
- [day05.zig - GitHub Code Search](https://cs.github.com/ktravis/zig-aoc20/blob/ff623862341dbcd55a95167bb151d770db446a44/src/day05.zig?q=language%3Azig+binarySearch)
- [Database.zig - GitHub Code Search](https://cs.github.com/mattyhall/regz/blob/09c331e02d8037bf2e5133eaa40b1d762637b441/src/Database.zig?q=language%3Azig+binarySearch)
- [sort.zig - GitHub Code Search](https://cs.github.com/cartr/zig/blob/d907f574e02aadf8196e616bcc2fb2813cf2c82c/lib/std/sort.zig?q=language%3Azig+binarySearch)
- [bst.zig - GitHub Code Search](https://cs.github.com/massivelivefun/bst-zig/blob/e689d4a8aaf58b2eba3247c84fb05c42e254723c/src/bst.zig?q=language%3Azig+binarySearch)

- [Why Accounting Needs Its Own Database with Joran Greef of Tiger Beetle | The Data Stack Show](https://datastackshow.com/podcast/why-accounting-needs-its-own-database-with-joran-greef-of-tiger-beetle/)
- [zig-libharu-test/build.zig at main · apple-x-co/zig-libharu-test · GitHub](https://github.com/apple-x-co/zig-libharu-test/blob/main/build.zig)

- [Code study: interface idioms/patterns in zig standard libraries - Zig NEWS](https://zig.news/yglcode/code-study-interface-idiomspatterns-in-zig-standard-libraries-4lkj)
- [Less but also more supported functions for trace.zig 0.2.0 - Zig NEWS](https://zig.news/huntrss/less-but-also-more-supported-functions-for-tracezig-020-3fbh)
- [Realigning Set interfaces in std - Zig NEWS](https://zig.news/pyrolistical/realigning-set-interfaces-in-std-3cml)
- [FIDO2 authenticator - Zig NEWS](https://zig.news/r4gus/fido2-authenticator-1fi2)
- [How to create a zig project - Zig NEWS](https://zig.news/forinda/how-to-create-a-zig-project-58pc)
- [Using rr to quickly debug memory corruption - Zig NEWS](https://zig.news/david_vanderson/using-rr-to-quickly-debug-memory-corruption-2539)

- [Is This NEW Language BETTER Than Rust? C++? (Zig First Impressions) - YouTube](https://www.youtube.com/watch?v=zFELcHTki9U)

- [Am I missing the point, or is the "generics" example wrong? : Zig](https://www.reddit.com/r/Zig/comments/10drras/am_i_missing_the_point_or_is_the_generics_example/)
- [Writing Zig bindings - my journey so far : Zig](https://www.reddit.com/r/Zig/comments/10bptsv/writing_zig_bindings_my_journey_so_far/)
- [getty-zig/json: A serialization library for JSON](https://github.com/getty-zig/json)
- [foxnne/aftersun: Top-down 2D RPG](https://github.com/foxnne/aftersun)
- [MasterQ32/zero-graphics: Application framework based on OpenGL ES 2.0. Runs on desktop machines, Android phones and the web](https://github.com/MasterQ32/zero-graphics)

- [grokking_algorithms/binary-search.zig at master · egonSchiele/grokking_algorithms · GitHub](https://github.com/egonSchiele/grokking_algorithms/blob/master/01_introduction_to_algorithms/zig/binary-search.zig)
- [zig/sort.zig at 37fe41792c72f98657e5c51caa5bfd9ded7eb409 · ziglang/zig](https://github.com/ziglang/zig/blob/37fe41792c72f98657e5c51caa5bfd9ded7eb409/lib/std/sort.zig#L7)
- [Reddit - Dive into anything](https://www.reddit.com/r/Zig/comments/wl6rru/how_do_you_organize_your_tests/)
- [Reddit - Dive into anything](https://www.reddit.com/r/Zig/comments/ypydk4/how_to_identify_if_your_code_is_run_during_tests/)
- [Renato Athaydes](https://renato.athaydes.com/posts/testing-building-c-with-zig.html)
- [Sendilkumarn.com > My views on Zig (2022)](https://sendilkumarn.com/blog/my-views-on-zig-2022)
- [The Missing Bit | Testing Zig for embedded development](https://www.kuon.ch/post/2022-06-22-zig-embed/)
- [Zig is becoming more production-worthy (zigmonthly) | Zig monthly](https://zigmonthly.org/letters/2022/may-june/)
- [(13) Discord | "How can I receive packets without blocking the main thread?" | Zig Programming Language](https://discord.com/channels/605571803288698900/1065674834127900732)

- [tonis2/zig-postgres: Zig wrapper for postgres](https://github.com/tonis2/zig-postgres)
- [aeronavery/zig-orm: A database ORM](https://github.com/aeronavery/zig-orm)
- [Connecting to PostgreSQL from ZIG - need help : Zig](https://www.reddit.com/r/Zig/comments/eipecy/connecting_to_postgresql_from_zig_need_help/)
- [A programming language to program with till I die. : Zig](https://www.reddit.com/r/Zig/comments/uqp4bf/a_programming_language_to_program_with_till_i_die/)

- [root.mem.TokenIterator - Zig](https://ziglang.org/documentation/master/std/#root;mem.TokenIterator)
- [[]const T zig print - Szukaj w Google](https://www.google.com/search?q=%5B%5Dconst+T+zig+print&rlz=1C5CHFA_enPL1026PL1026&oq=%5B%5Dconst+T+zig+print&aqs=chrome..69i57j33i160.2535j0j7&sourceid=chrome&ie=UTF-8)
- [Where is print() in Zig? - Zig NEWS](https://zig.news/kristoff/where-is-print-in-zig-57e9)
- [unicode - How do I print a UTF-16 string in Zig? - Stack Overflow](https://stackoverflow.com/questions/64936132/how-do-i-print-a-utf-16-string-in-zig)
- [How to format strings in Zig using a runtime format string - Stack Overflow](https://stackoverflow.com/questions/72589596/how-to-format-strings-in-zig-using-a-runtime-format-string)

- [(13) Discord | "when will zig programming book publish" | Zig Programming Language](https://discord.com/channels/605571803288698900/1065740784466411570)
- [test/standalone: reinstate std.ChildProcess tests by matu3ba · Pull Request #13639 · ziglang/zig](https://github.com/ziglang/zig/pull/13639/files)
- [std.child_process: enable non-standard streams by matu3ba · Pull Request #14152 · ziglang/zig](https://github.com/ziglang/zig/pull/14152/files)
- [matu3ba/collection_rosettacode_zig: Simple Zig rosettacode examples](https://github.com/matu3ba/collection_rosettacode_zig)
- [matu3ba/chepa: Fast checking of paths on conformance for shell coding and absence of antipatterns.](https://github.com/matu3ba/chepa)
- [travisstaloch/comptime-trie: A comptime trie which aims minimize runtime memory use](https://github.com/travisstaloch/comptime-trie)
- [matu3ba/shcomp: Shell completion library](https://github.com/matu3ba/shcomp)
- [matu3ba/zignore: Library to ignore files conforming to gitignore syntax](https://github.com/matu3ba/zignore)
- [matu3ba/zsvlib: Zero runtime-allocation csv handling library in Zig](https://github.com/matu3ba/zsvlib)
- [Zig Programming Language | Udemy](https://www.udemy.com/course/zig-programming-language/learn/lecture/33883512#overview)
- [Online Courses - Learn Anything, On Your Schedule | Udemy](https://www.udemy.com/courses/search/?kw=competitive&p=1&q=competitive+programming&src=sac)
- [Commits · ziglang/zig](https://github.com/ziglang/zig/commits/master)
- [Commits · ziglang/zig](https://github.com/ziglang/zig/commits?author=Hardy7cc)
- [mikdusan (Michael Dusan)](https://github.com/mikdusan)
- [Passing f32 signalling NaN to a function converts to quiet NaN · Issue #10449 · ziglang/zig](https://github.com/ziglang/zig/issues/10449)
- [LewisGaul/minesolver: Minesweeper solver written in Zig and Python, supporting multiple mines per cell](https://github.com/LewisGaul/minesolver)
- [LewisGaul/zigominoes: Generate polyominoes in Zig](https://github.com/LewisGaul/zigominoes)
- [Collection of blog posts about the Zig programming language](https://gist.github.com/LewisGaul/d5b303da9c03bf95f778c64e12ef1c5e)
- [LewisGaul/zig-aoc-2021: Advent Of Code 2021 in Zig](https://github.com/LewisGaul/zig-aoc-2021)

- [Basic DogStatsD UDP server implementation : Zig](https://www.reddit.com/r/Zig/comments/hqmi33/basic_dogstatsd_udp_server_implementation/)
- [regenerativep/zig-mc-server: bad minecraft server in zig](https://github.com/regenerativep/zig-mc-server)
- [lithdew (lithdew) / Repositories](https://github.com/lithdew?tab=repositories)
- [quic-server-zig/ping.zig at 5e4a03df1063cf673b4ed9811e7280e6ddb1d2cc · shiguredo/quic-server-zig · GitHub](https://github.com/shiguredo/quic-server-zig/blob/5e4a03df1063cf673b4ed9811e7280e6ddb1d2cc/src/frame/ping.zig)

- [langref: add the new addrspace keyword · ziglang/zig@0973f36](https://github.com/ziglang/zig/commit/0973f3638917111ea09740d0346f1debefd5f9db)
- [langref: add the new addrspace keyword by perillo · Pull Request #14338 · ziglang/zig](https://github.com/ziglang/zig/pull/14338)
- [CI: additionally test debug builds on Windows · ziglang/zig@7b68b76](https://github.com/ziglang/zig/commit/7b68b76326a650fad4c20274601968d436920caf)
- [langref: document UTF-8 BOM handling · ziglang/zig@06e9b2c](https://github.com/ziglang/zig/commit/06e9b2c4e360e738c3be3d3e5d5a36006fd5b224)

- [Minisign by Frank Denis](https://jedisct1.github.io/minisign/)

- [Some thoughts about memcopy · Issue #3 · ratfactor/zigish](https://github.com/ratfactor/zigish)
- [chrboesch/zigcalc: A simple calculator in zig](https://github.com/chrboesch/zigcalc)
- [zig -ziglar -sharko -zag - YouTube](https://www.youtube.com/results?search_query=zig+-ziglar+-sharko+-zag&sp=EgIIBA%253D%253D)

- [test std lib TLS implementation against many real world servers · Issue #14172 · ziglang/zig](https://github.com/ziglang/zig/issues/14172)
- [Levenshtein distance - Wikipedia](https://en.m.wikipedia.org/wiki/Levenshtein_distance)
- [Allow returning a value with an error · Issue #2647 · ziglang/zig](https://github.com/ziglang/zig/issues/2647)
- [Zig Newcomer Programming FAQs · ziglang/zig Wiki](https://github.com/ziglang/zig/wiki/Zig-Newcomer-Programming-FAQs)
- [FYI ArrayList can act as a string buffer · Issue #5546 · ziglang/zig](https://github.com/ziglang/zig/issues/5546)
- [zig/array_list.zig at master · ziglang/zig](https://github.com/ziglang/zig/blob/master/lib/std/array_list.zig#L672)
- [Help! How to make dynamic array or string? : Zig](https://www.reddit.com/r/Zig/comments/fnvl9v/help_how_to_make_dynamic_array_or_string/)
- [language:zig "HTTP/1.1" - GitHub Code Search](https://cs.github.com/?scopeName=All+repos&scope=&q=language%3Azig+%22HTTP%2F1.1%22)
- [shiguredo/tls13-zig: The first TLS1.3 implementation in Zig(master/HEAD) only with std.](https://github.com/shiguredo/tls13-zig)
- [bun/http.zig at 9eb4a4ff3a8a4b0babf3d7e1bb2188c7ef1bbac1 · oven-sh/bun](https://github.com/oven-sh/bun/blob/9eb4a4ff3a8a4b0babf3d7e1bb2188c7ef1bbac1/src/http.zig#L619)
- [star-tek-mb (star-tek-mb) / Repositories](https://github.com/star-tek-mb?tab=repositories)
- [donsez/zig-examples: Ziglang examples](https://github.com/donsez/zig-examples)

- [(14) Discord | "https with std.http.Client error.TlsCertificateNotVerified" | Zig Programming Language](https://discord.com/channels/605571803288698900/1064554968985649252)
- [Zig recap for week 2/2023 - discu.eu](https://discu.eu/weekly/zig/2023/2/)
- [kristoff_it's submissions | Hacker News](https://news.ycombinator.com/submitted?id=kristoff_it)
- [My reasoning for why Zig errors shouldn't have a payload : Zig](https://old.reddit.com/r/Zig/comments/wqnd04/my_reasoning_for_why_zig_errors_shouldnt_have_a/)
- [Interfacing with Zig, a BDFL-run Project | Loris Cro's Blog](https://kristoff.it/blog/interfacing-with-zig/)
- [Error Guard Clause : Zig](https://www.reddit.com/r/Zig/comments/10ag56f/error_guard_clause/)
- [Thoughts on Zig - YouTube](https://www.youtube.com/watch?v=zlWqpRTgXBg)
- [A Zig Diary](https://kihlander.net/post/a-zig-diary/)
- [How Memory Safety Approaches Speed Up and Slow Down Development Velocity](https://verdagon.dev/blog/when-to-use-memory-safe-part-2)

- [Hello-World/hello-world.zig at master · julkwel/Hello-World · GitHub](https://github.com/julkwel/Hello-World/blob/master/hello-world.zig)
- [Current Way to Get User Input in Zig - Stack Overflow](https://stackoverflow.com/questions/62018241/current-way-to-get-user-input-in-zig)
- [zig/main.zig at 3ab43988c1cc5e22c84faccd1816df6e8094d9a3 · ziglang/zig](https://github.com/ziglang/zig/blob/3ab43988c1cc5e22c84faccd1816df6e8094d9a3/test/standalone/guess_number/main.zig#L4)
- [Looking for scanf() (formatted input on streams) · Issue #12161 · ziglang/zig](https://github.com/ziglang/zig/issues/12161)
- [WebAssembly with Zig | Enarx](https://enarx.dev/docs/webassembly/zig)

- [zig build explained - part 1 - Zig NEWS](https://zig.news/xq/zig-build-explained-part-1-59lf)
- [Category:Zig - Rosetta Code](https://rosettacode.org/wiki/Category:Zig)
- [Chapter 2 - Standard Patterns | ziglearn.org](https://ziglearn.org/chapter-2/#end-of-chapter-2)
- [Chapter 2 - Standard Patterns | ziglearn.org](https://ziglearn.org/chapter-2/#readers-and-writers)
- [zig/main.zig at master · ziglang/zig](https://github.com/ziglang/zig/blob/master/test/standalone/guess_number/main.zig)
- [(14) Discord | #zig-help | Zig Programming Language](https://discord.com/channels/605571803288698900/1019652020308824145/threads/1064145114445906061)
- [What are you working on in Zig? - Showcase - Ziggit](https://ziggit.dev/t/what-are-you-working-on-in-zig/29/16)
- [natecraddock/zf: a commandline fuzzy finder that prioritizes matches on filenames](https://github.com/natecraddock/zf/)
- [natecraddock/telescope-zf-native.nvim: native telescope bindings to zf for sorting results](https://github.com/natecraddock/telescope-zf-native.nvim)
- [Documentation generation? - Help - Ziggit](https://ziggit.dev/t/documentation-generation/511/3)
- [zig_TermCurs/buildExemple.zig at master · AS400JPLPC/zig_TermCurs](https://github.com/AS400JPLPC/zig_TermCurs/blob/master/src-zig/buildExemple.zig)

- [std.http.Client ziglang - Szukaj w Google](https://www.google.com/search?q=std.http.Client+ziglang&rlz=1C5CHFA_enPL1026PL1026&oq=std.http.Client+ziglang&aqs=chrome..69i57j69i60l2.4625j0j7&sourceid=chrome&ie=UTF-8)
- [http server in the standard library · Issue #910 · ziglang/zig](https://github.com/ziglang/zig/issues/910)
- [zig/http.zig at master · ziglang/zig](https://github.com/ziglang/zig/blob/master/lib/std/http.zig#L238)
- [zig/Client.zig at master · ziglang/zig](https://github.com/ziglang/zig/blob/master/lib/std/http/Client.zig#L130)
- [language:zig rescanRootCertificates - GitHub Code Search](https://cs.github.com/ziglang/zig?q=language%3Azig+rescanRootCertificates)
- [zig/Client.zig at master · ziglang/zig](https://github.com/ziglang/zig/blob/master/lib/std/http/Client.zig#L864)
- [zigbyexample.github.io/ at main · zigbyexample/zigbyexample.github.io](https://github.com/zigbyexample/zigbyexample.github.io/tree/main)
- [Package.zig - GitHub Code Search](https://cs.github.com/ziglang/zig/blob/bb15e4057c9c8bb22084990de475ab10a44592c0/src/Package.zig?q=language%3Azig+%22std.http%22#L1)
- [zig/http.zig at bb15e4057c9c8bb22084990de475ab10a44592c0 · ziglang/zig](https://github.com/ziglang/zig/blob/bb15e4057c9c8bb22084990de475ab10a44592c0/lib/std/http.zig#L72)
- [zig/Package.zig at bb15e4057c9c8bb22084990de475ab10a44592c0 · ziglang/zig](https://github.com/ziglang/zig/blob/bb15e4057c9c8bb22084990de475ab10a44592c0/src/Package.zig#L354)
- [zig/main.zig at bb15e4057c9c8bb22084990de475ab10a44592c0 · ziglang/zig](https://github.com/ziglang/zig/blob/bb15e4057c9c8bb22084990de475ab10a44592c0/src/main.zig#LL4099)
- [Interesting read, especially as someone poking w/ writing a parser in zig for fu... | Hacker News](https://news.ycombinator.com/item?id=26417494)
- [Half of curl’s vulnerabilities are C mistakes : programming](https://www.reddit.com/r/programming/comments/m15m3y/half_of_curls_vulnerabilities_are_c_mistakes/)
- [Code Examples ⚡ Zig Programming Language](https://ziglang.org/learn/samples/#using-curl-from-zig)
- [Zig binding to cURL · Issue #2056 · ziglang/zig](https://github.com/ziglang/zig/issues/2056)
- [zigbot9001/WorkContext.zig at ae3f774756d09e1e8ffa2d7c15516f819d2bc64e · fengb/zigbot9001](https://github.com/fengb/zigbot9001/blob/ae3f774756d09e1e8ffa2d7c15516f819d2bc64e/src/WorkContext.zig#L640)
- [zorrent/tracker.zig at master · gaultier/zorrent](https://github.com/gaultier/zorrent/blob/master/src/tracker.zig#L164)
- [zorrent/build.zig at dd01c1f9b877d6962451d5426571899a01a2cbbf · gaultier/zorrent](https://github.com/gaultier/zorrent/blob/dd01c1f9b877d6962451d5426571899a01a2cbbf/build.zig#L28)
- [Looks like its still lacking in network support: https://github.com/ziglang/zig/... | Hacker News](https://news.ycombinator.com/item?id=21117436)
- [zootdeck/net.zig at master · donpdonp/zootdeck](https://github.com/donpdonp/zootdeck/blob/master/src/net.zig)
- [zootdeck/ at master · donpdonp/zootdeck](https://github.com/donpdonp/zootdeck/tree/master)
- [zig build explained - part 3 - Zig NEWS](https://zig.news/xq/zig-build-explained-part-3-1ima)
- [⚡ Live Coding A Web Server in Zig ⚡ - 01 - YouTube](https://www.youtube.com/watch?v=olOJbYP0ORE)
- [zig-examples/curl.zig at main · donsez/zig-examples](https://github.com/donsez/zig-examples/blob/main/curl/curl.zig)
- [zig build explained - part 2 - Zig NEWS](https://zig.news/xq/zig-build-explained-part-2-1850)
- [Zig | webinstall.dev](https://webinstall.dev/zig/)
- [language:zig libcurl - GitHub Code Search](https://cs.github.com/?scopeName=All+repos&scope=&q=language%3Azig+libcurl)
- [lib.zig - GitHub Code Search](https://cs.github.com/fubark/cosmic/blob/b85feaef0754dceb8762f3f3eafc115f2ed7e5d2/lib/curl/lib.zig?q=language%3Azig+libcurl)
- [http.zig - GitHub Code Search](https://cs.github.com/ziglibs/repository/blob/9d7cd5ba6e0970c46b0a819b405b9c9acecd5f77/tools/http.zig?q=language%3Azig+libcurl)
- [Code search results](https://github.com/search?q=repo%3Aziglibs%2Frepository%20curl&type=code)
- [libcurl.zig - GitHub Code Search](https://cs.github.com/mattnite/gyro/blob/19cf64d93a5ad917a9e49f2b58f006a10210cb84/.gyro/zig-libcurl-mattnite-github.com-f1f316dc/pkg/libcurl.zig?q=language%3Azig+libcurl)
- [zig-snippets/c-libcurl.zig at b6f43fdb01372f56fde6bd810943a47af88b04db · sayden/zig-snippets](https://github.com/sayden/zig-snippets/blob/b6f43fdb01372f56fde6bd810943a47af88b04db/c-libcurl.zig)
- [sayden/zig-snippets at b6f43fdb01372f56fde6bd810943a47af88b04db](https://github.com/sayden/zig-snippets/tree/b6f43fdb01372f56fde6bd810943a47af88b04db)
- [zig-snippets/c-curl.c at b6f43fdb01372f56fde6bd810943a47af88b04db · sayden/zig-snippets](https://github.com/sayden/zig-snippets/blob/b6f43fdb01372f56fde6bd810943a47af88b04db/c-curl.c)
- [zig-snippets/Makefile at main · sayden/zig-snippets](https://github.com/sayden/zig-snippets/blob/main/Makefile)
- [zasp/json.zig at master · fengb/zasp](https://github.com/fengb/zasp/blob/master/src/json.zig)
- [zCord/https.zig at a6334ebf39773abe7e7272205170d7bed1d93dcd · fengb/zCord](https://github.com/fengb/zCord/blob/a6334ebf39773abe7e7272205170d7bed1d93dcd/src/https.zig#L4)

- [iguessthislldo/georgios: Hobby Operating System](https://github.com/iguessthislldo/georgios)
- [eigilhs/adventofcode: http://adventofcode.com/](https://github.com/eigilhs/adventofcode)
- [mattnite/zigbox: Zig port/fork of toybox: https://github.com/landley/toybox](https://github.com/mattnite/zigbox)

- [andi23rosca/mal: mal - Make a Lisp](https://github.com/andi23rosca/mal/tree/master/impls/zig)
- [xyaman/tuiz: Library for building Terminal User Interfaces using Zig](https://github.com/xyaman/tuiz)
- [ryota-sakamoto/bf-zig](https://github.com/ryota-sakamoto/bf-zig)
- [vegarsti/aoc2021: My solutions to Advent of Code 2021 problems](https://github.com/vegarsti/aoc2021)
- [letung3105/aoc2021: Advent of Code 2021 solutions in different languages](https://github.com/letung3105/aoc2021)
- [carstenschwede/countwords: Playing with counting word frequencies (and performance) in various languages.](https://github.com/carstenschwede/countwords/blob/master/simple.zig)
- [happyalu/zig-audio: Audio processing in zig](https://github.com/happyalu/zig-audio)
- [dtolnay-contrib/zig: General-purpose programming language and toolchain for maintaining robust, optimal, and reusable software.](https://github.com/dtolnay-contrib/zig)
- [jordanlewis/aoc](https://github.com/jordanlewis/aoc)
- [llimllib/personal_code: random code that I have lying around](https://github.com/llimllib/personal_code)
- [peterino2/zig-halcyon](https://github.com/peterino2/zig-halcyon)
- [prime31/zig-miniaudio](https://github.com/prime31/zig-miniaudio)
- [greenfork/kisa: Text editor of the new world](https://github.com/greenfork/kisa)
- [Wuelle/Kaola: UCI chess engine](https://github.com/Wuelle/Kaola)
- [gonzus/AdventOfCode: My Advent of Code implementations](https://github.com/gonzus/AdventOfCode)
- [Vexu/bog: Small, strongly typed, embeddable language.](https://github.com/Vexu/bog)
- [LewisGaul/zig-nestedtext: Zig NestedText parser library - a simple human readable data format based on YAML](https://github.com/LewisGaul/zig-nestedtext)
- [jwhear/zig-minifier: A simple minifier for Zig source code for code golfing purposes](https://github.com/jwhear/zig-minifier)
- [rutgerbrf/zig-nkeys: NKeys support for Zig](https://github.com/rutgerbrf/zig-nkeys)
- [TinyVG/sdk: TinyVG software development kit](https://github.com/TinyVG/sdk)
- [ordovician/Zacktron-33: Assembler and disassembler for the imaginary Calcutron-33 CPU implemented in Zig](https://github.com/ordovician/Zacktron-33)
- [minierolls/termelot: Cross-platform cell-based terminal library.](https://github.com/minierolls/termelot)
- [SnowballSH/Avalanche: UCI Chess Engine written in Zig.](https://github.com/SnowballSH/Avalanche)
- [jlauman/zig.run: Run and play with Zig source code.](https://github.com/jlauman/zig.run)
- [superwhiskers/question: the question function, now in every language you could possibly want it in](https://github.com/superwhiskers/question/blob/canon/zig/question.zig)
- [Daimanta/coreutils-zig: Coreutils recreated in Zig](https://github.com/Daimanta/coreutils-zig)
- [CalmSystem/wala: It aims to be for WASM what YAML is for JSON. Programming language targetting WebAssembly. Human friendly WAT](https://github.com/CalmSystem/wala)
- [travisstaloch/art.zig: An Adaptive Radix Tree ported from c](https://github.com/travisstaloch/art.zig)
- [cryptocode/bio: A Lisp dialect written in Zig](https://github.com/cryptocode/bio)
- [tiehuis/zligc: libc implementation in zig](https://github.com/tiehuis/zligc)
- [ziglibs/repository: A community-maintained repository of zig packages](https://github.com/ziglibs/repository)
- [mbrock/wisp: Lisp in WebAssembly](https://github.com/mbrock/wisp)
- [burrito-elixir/burrito: Wrap your application in a BEAM Burrito!](https://github.com/burrito-elixir/burrito)
- [fubark/cyber: Fast and concurrent scripting.](https://github.com/fubark/cyber)
- [krahets/hello-algo: 《Hello 算法》一本动画图解、能运行、可提问的数据结构与算法入门书。提供 Java, C++, Python, Go, JS, TS, C# 源代码。](https://github.com/krahets/hello-algo/tree/main/codes/zig)

- [shritesh/zig-wasm-dom: Zig + WebAssembly + JS + DOM](https://github.com/shritesh/zig-wasm-dom)
- [Roc Solid Platforms in Zig - Lucas - YouTube](https://www.youtube.com/watch?v=FMyyYdFSOHA)
- [Thinking of learning Zig and systems programming : Zig](https://www.reddit.com/r/Zig/comments/y3bjfe/thinking_of_learning_zig_and_systems_programming/)
- [Ziglang](https://www.reddit.com/r/Zig/top/?t=month)
- [What I learn by implementing argparser in Zig : Zig](https://www.reddit.com/r/Zig/comments/zmdj3y/what_i_learn_by_implementing_argparser_in_zig/)
- ["Actually Portable Executable" in Zig? : Zig](https://www.reddit.com/r/Zig/comments/104zfy7/actually_portable_executable_in_zig/)

- [ziglang http client - Szukaj w Google](https://www.google.com/search?q=ziglang+http+client&rlz=1C5CHFA_enPL1026PL1026&oq=ziglang+http+client&aqs=chrome..69i57.2940j0j7&sourceid=chrome&ie=UTF-8)
- [http client in the standard library · Issue #2007 · ziglang/zig](https://github.com/ziglang/zig/issues/2007)
- [std.http.Client: support HTTP redirects by andrewrk · Pull Request #14202 · ziglang/zig](https://github.com/ziglang/zig/pull/14202/files)
- [zig/Client.zig at master · ziglang/zig · GitHub](https://github.com/ziglang/zig/blob/master/lib/std/http/Client.zig#L737)
- [root.http.Client - Zig](https://ziglang.org/documentation/master/std/#root;http.Client)

- [Show HN: HyperLogLog in Zig | Hacker News](https://news.ycombinator.com/item?id=34312335)
- [axiomhq/zig-hyperloglog: Zig library for HyperLogLog estimation](https://github.com/axiomhq/zig-hyperloglog)

- [zigbyexample.github.io/atomic.zig at main · zigbyexample/zigbyexample.github.io · GitHub](https://github.com/zigbyexample/zigbyexample.github.io/blob/main/src/atomic.zig)
- [ziglang atomic - Szukaj w Google](https://www.google.com/search?q=ziglang+atomic&rlz=1C5CHFA_enPL1026PL1026&sxsrf=ALiCzsbEZSeodfBkaV5wxpJEOjpZtFhtCg:1672265683473&ei=07-sY827HPGQwPAPltGiuAw&start=20&sa=N&ved=2ahUKEwiN8aGQq538AhVxCBAIHZaoCMcQ8NMDegQIAxAI&biw=1152&bih=637&dpr=2.5)
- [Zig (notes) - DEV Community 👩‍💻👨‍💻](https://dev.to/crinklywrappr/zig-notes-378m)
- [language:zig "allocator.dupe" - GitHub Code Search](https://cs.github.com/?scopeName=All+repos&scope=&q=language%3Azig+%22allocator.dupe%22)
- [logger.zig - GitHub Code Search](https://cs.github.com/oven-sh/bun/blob/79a2f81447d477f47730f8d5be6479ec4bd4340a/src/logger.zig?q=language%3Azig+%22allocator.dupe%22#L113)
- [root.mem.Allocator - Zig](https://ziglang.org/documentation/master/std/#root;mem.Allocator)
- [A Reply to _The Road to Zig 1.0_ - gingerBill](https://www.gingerbill.org/article/2019/05/13/a-reply-to-the-road-to-zig/)
- [Testing memory allocation failures with Zig | Lager](https://www.lagerdata.com/articles/testing-memory-allocation-failures-with-zig)
- [Proposal: zig test run single test case · Issue #13524 · ziglang/zig](https://github.com/ziglang/zig/issues/13524)
- [zig/main.zig at 1caf56c5fbbb10fa28f8bf204d073983ce2a6dd5 · ziglang/zig](https://github.com/ziglang/zig/blob/1caf56c5fbbb10fa28f8bf204d073983ce2a6dd5/src/main.zig#L529)

- [Atomic reference counting (with Zig code samples) - RavenDB NoSQL Database](https://ravendb.net/articles/atomic-reference-counting-with-zig-code-samples)

- [The Missing Bit | CRC 32 on STM32l0](https://www.kuon.ch/post/2022-09-04-stm32-crc/)
- https://www.kuon.ch/tags/zig/
- [Advanced Hello World in Zig - Loris Cro - YouTube](https://www.youtube.com/watch?v=iZFXAN8kpPo)
- [Runtime polymorphism: why, how? - Alex Naskos - YouTube](https://www.youtube.com/watch?v=AHc4x1uXBQE)
- [A Look at Zig's Built-ins - Loris Cro - YouTube](https://www.youtube.com/watch?v=V0sthxzzN3U)
- [Simple JSON parser : Zig](https://www.reddit.com/r/Zig/comments/zp15bm/simple_json_parser/)
- [Learn Zig or C first? : Zig](https://www.reddit.com/r/Zig/comments/zpycrs/learn_zig_or_c_first/)
- [TCP Connection - Zig By Example](https://zigbyexample.github.io/tcp_connection)
- [Engine.zig - GitHub Code Search](https://cs.github.com/mattnite/gyro/blob/19cf64d93a5ad917a9e49f2b58f006a10210cb84/src/Engine.zig?q=language%3Azig+%22std.Thread.spawn%22+%22putNoClobber%22#L499)
- [ziglang std.Thread.spawn - Szukaj w Google](https://www.google.com/search?q=ziglang+std.Thread.spawn&rlz=1C5CHFA_enPL1026PL1026&oq=ziglang+std.Thread.spawn&aqs=chrome..69i57j33i160.1378j0j7&sourceid=chrome&ie=UTF-8)
- [Explainer: What Is A Meta? | Arc UNSW Student Life](https://www.arc.unsw.edu.au/blitz/read/explainer-what-is-a-metaquestion#:~:text=In%20essence%2C%20a%20%22meta%22,%E2%80%9Cmost%20effective%20tactics%20available%E2%80%9D.)
- [Resource efficient Thread Pools with Zig | Hacker News](https://news.ycombinator.com/item?id=28509073)
- [Multithreading in Zig : Zig](https://www.reddit.com/r/Zig/comments/mytkpv/multithreading_in_zig/)
- [Stuff](https://artixfox.gitlab.io/posts/Learning-Exploit-Development-With-Zig-3-26-April-2021.html)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/0.10.0/)
- [RAII works fine in Zig | Hacker News](https://news.ycombinator.com/item?id=29506814)
- [Zig programming language 0.9.0 released : programming](https://www.reddit.com/r/programming/comments/rl87pr/zig_programming_language_090_released/)
- [language:zig "Mutex" - GitHub Code Search](https://cs.github.com/?scopeName=All+repos&scope=&q=language%3Azig+%22Mutex%22)
- [network_thread.zig - GitHub Code Search](https://cs.github.com/oven-sh/bun/blob/f6bbfa7e404ec21f5aa3f60fabbd4a290a3b379d/src/network_thread.zig?q=language%3Azig+%22Mutex%22#L20)
- [zigbyexample.github.io/mutex.zig at main · zigbyexample/zigbyexample.github.io · GitHub](https://github.com/zigbyexample/zigbyexample.github.io/blob/main/src/mutex.zig)
- [zigbyexample.github.io/spawn-subprocess.zig at main · zigbyexample/zigbyexample.github.io · GitHub](https://github.com/zigbyexample/zigbyexample.github.io/blob/main/src/spawn-subprocess.zig)
- [log.zig/index.zig at master · emekoi/log.zig · GitHub](https://github.com/emekoi/log.zig/blob/master/src/index.zig)
- [kprotty/zap: An asynchronous runtime with a focus on performance and resource efficiency.](https://github.com/kprotty/zap)
- https://twitter.com/kingprotty
- [suirad/adma: A general purpose, multithreaded capable slab allocator for Zig](https://github.com/suirad/adma)
- [kprotty (@kprotty@hachyderm.io) - Hachyderm.io](https://hachyderm.io/@kprotty)
- [LSM: Grid scheduling overhaul and adding Storage.on_next_tick by kprotty · Pull Request #319 · tigerbeetledb/tigerbeetle](https://github.com/tigerbeetledb/tigerbeetle/pull/319)

- [Advent of Code 21: Setting up Zig + Days 1, 2, 3 - YouTube](https://www.youtube.com/watch?v=wo580tbLSR8)
- [Failing to Learn Zig via Advent of Code - ForrestTheWoods](https://www.forrestthewoods.com/blog/failing-to-learn-zig-via-advent-of-code/)
- [Advent of Code 2021 in Zig - Day 1 | Troy Kershaw's Blog](https://www.troykershaw.com/posts/advent-of-code-2021-zig-day-1/)
- [A Review of the Zig Programming Language (using Advent of Code 2021) :: Neil Henning](https://www.duskborn.com/posts/2021-aoc-zig/)
- [zig - Non determinism in the output when using ArrayList and Slices - Stack Overflow](https://stackoverflow.com/questions/71002692/non-determinism-in-the-output-when-using-arraylist-and-slices)
- [Bogdanp/awesome-advent-of-code: A collection of awesome resources related to the yearly Advent of Code challenge.](https://github.com/Bogdanp/awesome-advent-of-code#zig)
- [advent-of-zig-2022/day_01.zig at master · someone-stole-my-name/advent-of-zig-2022](https://github.com/someone-stole-my-name/advent-of-zig-2022/blob/master/day_01.zig)
- [advent-of-zig-2022/aoc.zig at master · someone-stole-my-name/advent-of-zig-2022 · GitHub](https://github.com/someone-stole-my-name/advent-of-zig-2022/blob/master/util/aoc.zig)

- [unable to set default value on tuple struct field · Issue #11705 · ziglang/zig](https://github.com/ziglang/zig/issues/11705)
- [Commits · ziglang/zig](https://github.com/ziglang/zig/commits/master?after=3318611618665e6d09ddad866efdabf54eb498ce+104&branch=master&qualified_name=refs%2Fheads%2Fmaster)
- [Yujiri's homepage](https://yujiri.xyz/)
- [Debugging Zig on VSCode on MacOS : Zig](https://www.reddit.com/r/Zig/comments/zk4myf/debugging_zig_on_vscode_on_macos/)
- [lldb-tools/lldb-mi: LLDB's machine interface driver](https://github.com/lldb-tools/lldb-mi)
- [HellOS/hellos.zig at master · andrewrk/HellOS](https://github.com/andrewrk/HellOS)
- [hexops/mach-glfw-vulkan-example: mach-glfw Vulkan example](https://github.com/hexops/mach-glfw-vulkan-example)
- [sagehane/pomeg: A gen 3 Pokemon save editor written in Zig.](https://github.com/sagehane/pomeg)
- [Newest 'zig' Questions - Stack Overflow](https://stackoverflow.com/questions/tagged/zig?tab=Newest)
- [string - how to convert []u8 to []const u8 in zig - Stack Overflow](https://stackoverflow.com/questions/74532596/how-to-convert-u8-to-const-u8-in-zig)
- [How to use SetConsoleOutputCP? - Help - Ziggit](https://ziggit.dev/t/how-to-use-setconsoleoutputcp/494/4)
- [Call by value / call by reference - Help - Ziggit](https://ziggit.dev/t/call-by-value-call-by-reference/483/4)
- [Footgun: hidden pass-by-reference · Issue #5973 · ziglang/zig](https://github.com/ziglang/zig/issues/5973)
- [How to convert an int to an enum? - Help - Ziggit](https://ziggit.dev/t/how-to-convert-an-int-to-an-enum/482/4)
- [Zig NEWS ⚡](https://zig.news/)
- [On the value of going deep, or How a broken keyboard led me to fix bugs in Zig. - Zig NEWS](https://zig.news/gwenzek/on-the-value-of-going-deep-or-how-a-broken-keyboard-led-me-to-fix-bugs-in-zig-288o)

- [What I learn by implementing argparser in Zig | KeepCoding](https://en.liujiacai.net/2022/12/14/argparser-in-zig/)
- [(14) Discord | #advent-of-code | Zig Programming Language](https://discord.com/channels/605571803288698900/783319340077285377)
- [segfault when mutating comptime created memory at runtime · Issue #13735 · ziglang/zig](https://github.com/ziglang/zig/issues/13735)
- [make closure over comptime var a compile error; comptime vars become immutable when they go out of scope · Issue #7396 · ziglang/zig](https://github.com/ziglang/zig/issues/7396)
- [The Zig Pastebin](https://zigbin.io/ff38fd)
- [The Zig Pastebin](https://zigbin.io/6a6db1)
- [The Zig Pastebin](https://zigbin.io/47dcfd)
- [aoc2022/day1.zig w master - aoc2022 - MZTE git](https://mzte.de/git/LordMZTE/aoc2022/src/branch/master/src/days/day1.zig)
- [The Zig Pastebin](https://zigbin.io/7e6212)
- [The Zig Pastebin](https://zigbin.io/1e11a0)
- [AoC/util.zig at master · Frechdachs/AoC · GitHub](https://github.com/Frechdachs/AoC/blob/master/2022/util.zig)
- [aoc2022/solve.zig w master - aoc2022 - Gitea](https://git.desu.ml/me/aoc2022/src/branch/master/zig/src/day01/solve.zig)
- [Beginner's guide : Zig](https://www.reddit.com/r/Zig/comments/fp3k27/beginners_guide/)
- [Simple Programming Problems](https://adriann.github.io/programming_problems.html)
- [I implement a code to read file line by line but failed make a array of words by using ArrayList. Please help me. : Zig](https://www.reddit.com/r/Zig/comments/r6b84d/i_implement_a_code_to_read_file_line_by_line_but/)
- [Can anyone show me an example of reading file line by line? : Zig](https://www.reddit.com/r/Zig/comments/mp083u/can_anyone_show_me_an_example_of_reading_file/)
- [How to create a type '[*c]const [*c]const u8' for paramValues of PQexecParams : Zig](https://www.reddit.com/r/Zig/comments/o9s9jc/how_to_create_a_type_cconst_cconst_u8_for/)
- [Gotchas when Doing Zig Programming (v0.7) | by Erik Engheim | Medium](https://erik-engheim.medium.com/gotchas-with-zig-optionals-and-errorsets-in-loops-516fcac3ea94)
- [The Zig and Go Programming Showdown! | by Erik Engheim | Oct, 2022 | ITNEXT](https://itnext.io/the-zig-and-go-programming-showdown-2244b261c051)

- [Function parameters treated as constant · Issue #1714 · ziglang/zig](https://github.com/ziglang/zig/issues/1714)
- [How to pass array by reference? Formerly working method stopped working : Zig](https://www.reddit.com/r/Zig/comments/o8utpv/how_to_pass_array_by_reference_formerly_working/)
- [Debugging Zig on VSCode on MacOS : Zig](https://www.reddit.com/r/Zig/comments/zk4myf/debugging_zig_on_vscode_on_macos/izzrozb/?context=8&depth=9)
- [Zig Tutorial #4 — sort. Zig provides basic sort facility. It is… | by Robert Guiscard | Medium](https://rguiscard.medium.com/zig-tutorial-4-sort-c7ca296faa91)
- [A couple of questions about Zig arrays and some other stuff : Zig](https://www.reddit.com/r/Zig/comments/jtbuvg/a_couple_of_questions_about_zig_arrays_and_some/)
- [Zig Strings in 5 minutes : Zig](https://www.reddit.com/r/Zig/comments/rxmg9p/zig_strings_in_5_minutes/)
- [New way to split and iterate over strings - Zig NEWS](https://zig.news/pyrolistical/new-way-to-split-and-iterate-over-strings-2akh)
- [How zig-spoon (and lots of coffee) helped me sort thousands of pictures - Zig NEWS](https://zig.news/lhp/how-zig-spoon-and-lots-of-coffee-helped-me-sort-thousands-of-pictures-4gkj)
- [Function Tables - Zig NEWS](https://zig.news/david_vanderson/function-tables-3jka)
- [Howto Pair Strings with Enums - Zig NEWS](https://zig.news/david_vanderson/howto-pair-strings-with-enums-9ce)
- [advent-of-code-2022/main.zig at main · dmbfm/advent-of-code-2022 · GitHub](https://github.com/dmbfm/advent-of-code-2022/blob/main/day-13/src/main.zig)
- [A Refresh for Zig Programmers and Dabblers | by Erik Engheim | Oct, 2022 | ITNEXT](https://itnext.io/a-refresh-for-zig-programmers-and-dabblers-d33f02c6a362)

- [Switching on a Tuple or Struct : Zig](https://www.reddit.com/r/Zig/comments/it8fga/switching_on_a_tuple_or_struct/)
- [Zig hashmaps explained : Zig](https://www.reddit.com/r/Zig/comments/sfzahe/zig_hashmaps_explained/)
- [How to use hash map contexts to save memory when doing a string table - Zig NEWS](https://zig.news/andrewrk/how-to-use-hash-map-contexts-to-save-memory-when-doing-a-string-table-3l33)
- [Compile Time HashMap in Zig - Stack Overflow](https://stackoverflow.com/questions/72835685/compile-time-hashmap-in-zig)
- [Is it possible to create hash maps at compile time? : Zig](https://www.reddit.com/r/Zig/comments/krnuac/is_it_possible_to_create_hash_maps_at_compile_time/)
- [zig/comptime_string_map.zig at master · ziglang/zig](https://github.com/ziglang/zig/blob/master/lib/std/comptime_string_map.zig#L16)
- [method.zig - GitHub Code Search](https://cs.github.com/oven-sh/bun/blob/c4557e57a112a694238dd8633e1743bc2e661749/src/http/method.zig?q=language%3Azig+ComptimeStringMap#L49)
- [command.zig - GitHub Code Search](https://cs.github.com/riverwm/river/blob/e603c5460a27bdc8ce6c32c8ee5e53fb789bc10b/river/command.zig?q=language%3Azig+ComptimeStringMap#L40)
- [lint.zig - GitHub Code Search](https://cs.github.com/tigerbeetledb/tigerbeetle/blob/9ead6f9579cd87e526ff3d694201ab309623d1b4/scripts/lint.zig?q=language%3Azig+ComptimeStringMap#L1)
- [LangOpts.zig - GitHub Code Search](https://cs.github.com/Vexu/arocc/blob/27d375037085231bbe3fcbb5d69c31a6c0681d0d/src/LangOpts.zig?q=language%3Azig+ComptimeStringMap#L39)
- [Trying out Zig - Zigominoes | Lewis Gaul](https://www.lewisgaul.co.uk/blog/coding/2021/01/10/trying-zig/#optionals-and-pointers)

- [jessrud/zbox: termbox like terminal UI library for zig](https://github.com/jessrud/zbox)
- [nektro/aoc2020: advent of code 2020 solutions for me](https://github.com/nektro/aoc2020)
- [nektro/pixel_draw: Temporary fork of https://gitlab.com/SamuelDeboni/pixel_draw](https://github.com/nektro/pixel_draw)
- [SamuelDeboni / pixel_draw · GitLab](https://gitlab.com/SamuelDeboni/pixel_draw)
- [nektro/discord-archiver: Chat archiver for Discord](https://github.com/nektro/discord-archiver)
- [Luukdegram/apple_pie: Basic HTTP server implementation in Zig](https://github.com/Luukdegram/apple_pie)
- [nektro/zig-ulid: A binary implementation of ULID in Zig.](https://github.com/nektro/zig-ulid)
- [zig-extras/lib.zig at master · nektro/zig-extras · GitHub](https://github.com/nektro/zig-extras/blob/master/src/lib.zig)
- [nektro/s3cmd: A drop-in replacement for s3tools/s3cmd written in Ziglang for better performance and bootstrappability.](https://github.com/nektro/s3cmd)

- [nektro/zig-time: A date and time parsing and formatting library for Zig.](https://github.com/nektro/zig-time)
- [truemedian/zfetch](https://github.com/truemedian/zfetch)
- [haze/zelda: A simple HTTP client library for Zig](https://github.com/haze/zelda)
- [ziglint/bad at master · nektro/ziglint](https://github.com/nektro/ziglint)
- [truemedian/hzzp](https://github.com/truemedian/hzzp)
- [nektro/zig-inquirer: A collection of utilities for prompting information from the user on the CLI](https://github.com/nektro/zig-inquirer)
- [zig-ansi/lib.zig at master · nektro/zig-ansi · GitHub](https://github.com/nektro/zig-ansi/blob/master/src/lib.zig)
- [Community · ziglang/zig Wiki](https://github.com/ziglang/zig/wiki/Community)
- [zigimg/zigimg: Zig library for reading and writing different image formats](https://github.com/zigimg/zigimg)
- [nektro/zig-tls: [WIP] A pure-Zig TLS 1.3 client implementation.](https://github.com/nektro/zig-tls)
- [nektro/arqv-ini: archival mirror of what once was https://github.com/arqv/ini](https://github.com/nektro/arqv-ini)
- [nektro/zig-flag: Config management for Zig.](https://github.com/nektro/zig-flag)
- [nektro/zig-oauth2: HTTP handler functions to allow you to easily add OAuth2 login support to your Zig application](https://github.com/nektro/zig-oauth2)
- [nektro/zig-iana-tlds: List of official IANA Top Level Domain Names](https://github.com/nektro/zig-iana-tlds)
- [nektro/zig-docker: Zig bindings for the Docker Engine API](https://github.com/nektro/zig-docker)
- [nektro/zig-pek: A comptime HTML preprocessor with a builtin template engine for Zig.](https://github.com/nektro/zig-pek)
- [nektro/zig-unicode-ucd: Zig bindings for the Unicode Character Database](https://github.com/nektro/zig-unicode-ucd)
- [nektro/zig-git: Inspect into the depths of your .git folder purely from Zig](https://github.com/nektro/zig-git)
- [nektro/zig-add](https://github.com/nektro/zig-add)
- [nektro/zig-tracy: Zig bindings for the Tracy profiler.](https://github.com/nektro/zig-tracy)
- [nektro/zig-double](https://github.com/nektro/zig-double)
- [nektro/zig-mbedtls](https://github.com/nektro/zig-mbedtls)
- [nektro/zig-range: A range function to loop over an index without an extra variable.](https://github.com/nektro/zig-range)
- [nektro/zig-zorm: An ORM-ish library for Zig.](https://github.com/nektro/zig-zorm)
- [nektro/zig-leven: Measure the difference between two slices using the Levenshtein distance algorithm](https://github.com/nektro/zig-leven)
- [nektro/aoc2021: Advent of Code 2021](https://github.com/nektro/aoc2021)
- [kristoff-it/bork: A TUI chat client tailored for livecoding on Twitch.](https://github.com/kristoff-it/bork)

- [A simple Set implementation - Showcase - Ziggit](https://ziggit.dev/t/a-simple-set-implementation/488)
- [jecolon/set: A Set data structure implementation in Zig](https://github.com/jecolon/set)
- [Pattern(s) for end-of-iteration? - Help - Ziggit](https://ziggit.dev/t/pattern-s-for-end-of-iteration/489/2)
- [Filter tests using zig build? - Help - Ziggit](https://ziggit.dev/t/filter-tests-using-zig-build/484)
- [Struct-of-arrays collection type in Zig | Hacker News](https://news.ycombinator.com/item?id=26266086)
- [1. Installing the Zig Compiler | Zig Programming Language Tutorials - YouTube](https://www.youtube.com/watch?v=fQ08HMZLbCw&list=PLRMNjZSQLv5iGpjubyzlWYcGqiTPVyK3s)
- [How to add methods to a generic data structure? : Zig](https://www.reddit.com/r/Zig/comments/74rhp3/how_to_add_methods_to_a_generic_data_structure/)
- [How to get a mutable pointer of struct literals - Help - Ziggit](https://ziggit.dev/t/how-to-get-a-mutable-pointer-of-struct-literals/340)

- [Code Examples ⚡ Zig Programming Language](https://ziglang.org/learn/samples/)
- [Understanding the Zig Programming Language | The Startup](https://medium.com/swlh/zig-the-introduction-dcd173a86975)
- [A Review of the Zig Programming Language (Using Advent of Code 2021) | Hacker News](https://news.ycombinator.com/item?id=29702607)
- [Taking the warts off C, with Andrew Kelley, creator of the Zig programming language](https://about.sourcegraph.com/podcast/andrew-kelley)
- [memory - Correct BigInt Fibonacci Implementation in Zig Lang - Stack Overflow](https://stackoverflow.com/questions/70761612/correct-bigint-fibonacci-implementation-in-zig-lang)
- [In defense of complicated programming languages](https://viralinstruction.com/posts/defense/)
- [Zig is a cute but dead man walking project. Rust has gained traction and that's ... | Hacker News](https://news.ycombinator.com/item?id=27249019)
- [Significant examples of Zig software? : Zig](https://www.reddit.com/r/Zig/comments/g5a9b8/significant_examples_of_zig_software/)
- [catdevnull/awesome-zig: A list of awesome projects related to Zig](https://github.com/catdevnull/awesome-zig#algorithms-and-data-structures)
- [C-BJ/awesome-zig: 📜Zig Learning & Usage Guide.](https://github.com/C-BJ/awesome-zig#algorithms-and-data-structures)
- [Introduction to the Zig Programming Language - Andrew Kelley](https://andrewkelley.me/post/intro-to-zig.html)
- [What is Zig's Comptime? | Loris Cro's Blog](https://kristoff.it/blog/what-is-zig-comptime/)
- [What is Zig's “Colorblind” Async/Await? | Loris Cro's Blog](https://kristoff.it/blog/zig-colorblind-async-await/)
- [Getting Started with Zig Programming Language - SoByte](https://www.sobyte.net/post/2022-07/zig/)
- [Zig in WebAssembly | Fermyon Technologies (@FermyonTech)](https://www.fermyon.com/wasm-languages/zig)
- [Assorted thoughts on zig (and rust)](https://www.scattered-thoughts.net/writing/assorted-thoughts-on-zig-and-rust/)
- [Zig getting started](https://www.punkbit.com/hacking/ziglang-getting-started/)
- [Zig at a Glance — A Language a Day, Advent Calendar 2019 Day 22/24 – Andrew Shitov](https://andrewshitov.com/2019/12/22/zig-at-a-glance/)
- [Zig by Example](https://zig-by-example.com/)
- [My views on Zig (2022)](https://sendilkumarn.com/blog/my-views-on-zig-2022/)
- [brodeuralexis/ethos](https://github.com/brodeuralexis/ethos)
- [brodeuralexis/zasm-emulator](https://github.com/brodeuralexis/zasm-emulator)
- [brodeuralexis/zvm: A cross platform Zig version manager written in Zig.](https://github.com/brodeuralexis/zvm)
- [fengb/zee_alloc: tiny Zig allocator primarily targeting WebAssembly](https://github.com/fengb/zee_alloc)
- [fengb/zCord: Zig ⚡ Discord API with zero allocations in the critical path](https://github.com/fengb/zCord)
- [fengb/zigbot9001: Officially unofficial bot for the officially unofficial Zig Discord server](https://github.com/fengb/zigbot9001)
- [fengb/zasp: zasp ⚡ a streaming parser](https://github.com/fengb/zasp)
- [truemedian/wz](https://github.com/truemedian/wz)
- [kristoff-it/suzie: Suzie is the bot that promotes Zig livecoding streams in some Discord servers](https://github.com/kristoff-it/suzie)
- [user-map/main.zig at master · zig-community/user-map · GitHub](https://github.com/zig-community/user-map/blob/master/src/main.zig)
- [MasterQ32/zig-bearssl: A BearSSL binding for Zig](https://github.com/MasterQ32/zig-bearssl)
- [alexnask/PeerType: Zig peer type resolution at comptime, ported from the compiler source code](https://github.com/alexnask/PeerType)
- [zig-https-example/main.zig at master · fengb/zig-https-example · GitHub](https://github.com/fengb/zig-https-example/blob/master/src/main.zig)
- [mping/main.zig at master · fengb/mping · GitHub](https://github.com/fengb/mping/blob/master/src/main.zig)
- [fengb/mem-order](https://github.com/fengb/mem-order)
- [fengb/generator-bench](https://github.com/fengb/generator-bench)
- [fengb/advent: Advent of Code](https://github.com/fengb/advent)
- [bitscan/main.zig at master · fengb/bitscan · GitHub](https://github.com/fengb/bitscan/blob/master/src/main.zig)
- [zig-sorts/main.zig at master · fengb/zig-sorts · GitHub](https://github.com/fengb/zig-sorts/blob/master/src/main.zig)
- [mlarouche/stringtime: String template engine for Zig.](https://github.com/mlarouche/stringtime)

- [benchmarks/primes.zig at master · kostya/benchmarks · GitHub](https://github.com/kostya/benchmarks/blob/master/primes/primes.zig)
- [kostya/benchmarks: Some benchmarks of different languages](https://github.com/kostya/benchmarks)
- [sharpobject/zort: Sorting algorithms in zig](https://github.com/sharpobject/zort)
- [marijnfs/zigmandel: Mandelbrot implementation, written in Zig. Output in WebP format](https://github.com/marijnfs/zigmandel)
- [ziglearn/main.zig at master · ruslandoga/ziglearn · GitHub](https://github.com/ruslandoga/ziglearn/blob/master/ch4/main.zig)
- [HolyGrailSortProject/Rewritten-Grailsort: A diverse array of heavily refactored versions of Andrey Astrelin's GrailSort.h, aiming to be as readable and intuitive as possible](https://github.com/HolyGrailSortProject/Rewritten-Grailsort)
- [GrailSort - A stable, in-place, worst-case O(n\*log(n)) sort : programming](https://www.reddit.com/r/programming/comments/brl69h/grailsort_a_stable_inplace_worstcase_onlogn_sort/)
- [Black-Cat/lamia: Small sdf editor](https://github.com/Black-Cat/lamia)
- [kristoff-it/aoc21: yo](https://github.com/kristoff-it/aoc21)
- [nilium/aoc2020: Advent of Code 2020, implemented in Zig 0.7.x. Mirror of https://git.sr.ht/~nilium/aoc2020.](https://github.com/nilium/aoc2020)
- [shilangyu/AoC-2020: Advent Of Code 2020 in whatever language I'm able to write a simple program in](https://github.com/shilangyu/AoC-2020)
- [lewis-weinberger/aoc: Advent of Code](https://github.com/lewis-weinberger/aoc)
- [truemedian/advent-of-code](https://github.com/truemedian/advent-of-code)
- [natecraddock/aoc: Advent of Code puzzle solutions](https://github.com/natecraddock/aoc)
- [DearRude/advent-of-code: Solutions to Advent Of Code](https://github.com/DearRude/advent-of-code)
- [leroycep/advent-of-code](https://github.com/leroycep/advent-of-code)
- [candrewlee14/AdventOfCode: Annual Advent Of Code Solutions](https://github.com/candrewlee14/AdventOfCode)
- [benclmnt/advent-of-code: trying adventofcode](https://github.com/benclmnt/advent-of-code)
- [kevinteynor/advent-of-code: Advent of Code Solutions](https://github.com/kevinteynor/advent-of-code)
- [criccomini/AoC-2022-Zig: Zig Advent of Code 2022](https://github.com/criccomini/AoC-2022-Zig)
- [darkliquid/zig-aoc-2022: Advent of Code 2022 in Zig](https://github.com/darkliquid/zig-aoc-2022)
- [tw4452852/aoc](https://github.com/tw4452852/aoc)
- [meatcar/adventofcode: 🎄My attempts at http://adventofcode.com/](https://github.com/meatcar/adventofcode)
- [sivertjoe/Advent-of-Code](https://github.com/sivertjoe/Advent-of-Code)
- [joachimschmidt557/adventofcode2020: Advent of code 2020](https://github.com/joachimschmidt557/adventofcode2020)
- [joachimschmidt557/adventofcode2021: Advent of Code 2021](https://github.com/joachimschmidt557/adventofcode2021)
- [dfyz/adventofcode: My solutions for the Advent of Code challenge (http://adventofcode.com/). Includes a solution to the Synacor Challenge (https://challenge.synacor.com/) as a bonus.](https://github.com/dfyz/adventofcode)
- [katesuyu/advent-of-code: Advent of Code solutions](https://github.com/katesuyu/advent-of-code)
- [pjz/aoc2021](https://github.com/pjz/aoc2021)
- [SpexGuy/Advent2021: Advent of Code 2021 Solutions, in Zig](https://github.com/SpexGuy/Advent2021)
- [vzwGrey/aoc-2021: My solutions for the Advent of Code 2021. 🎄](https://github.com/vzwGrey/aoc-2021)
- [caiges/zig-advent](https://github.com/caiges/zig-advent)
- [basile-henry/aoc2021: Advent of Code 2021](https://github.com/basile-henry/aoc2021)
- [paoda/aoc-22: Advent of Code 2022 Solutions](https://github.com/paoda/aoc-22)
- [Frechdachs/AoC: Advent of Code solutions](https://github.com/Frechdachs/AoC)
- [sendilkumarn/advent-of-zig: An attempt to learn zig lang](https://github.com/sendilkumarn/advent-of-zig)
- [angeris/advent-of-code-2021: Yet another AoC in Zig](https://github.com/angeris/advent-of-code-2021)

- [r00ster91/wool: A software renderer](https://github.com/r00ster91/wool)
- [r00ster91/http-1.1: A simple implementation of HTTP/1.1](https://github.com/r00ster91/http-1.1)
- [r00ster91/frame-dissection: Dissecting the content of a function frame](https://github.com/r00ster91/frame-dissection)
- [r00ster91/hello-wasm: A simple example of Zig + Wasm + JS interop](https://github.com/r00ster91/hello-wasm)
- [r00ster91/os: An OS running in user space](https://github.com/r00ster91/os)
- [r00ster91/Conversant: A text editor](https://github.com/r00ster91/Conversant)
- [r00ster91/csv: A CSV parser](https://github.com/r00ster91/csv)
- [12.11.2022 - Zig/Using Zig for Advent of Code](https://www.huy.rocks/everyday/12-11-2022-zig-using-zig-for-advent-of-code)
- [zig/mem.zig at 959c10c5e53d35f059dae577cd606d8c96a5feb4 · ziglang/zig](https://github.com/ziglang/zig/blob/959c10c5e53d35f059dae577cd606d8c96a5feb4/lib/std/mem.zig#L1909-L1914)
- [This year, I'm using Zig to solve AoC, here's what I learned so far : Zig](https://www.reddit.com/r/Zig/comments/zjr1qk/this_year_im_using_zig_to_solve_aoc_heres_what_i/)
- [personal_code/a.zig at master · llimllib/personal_code](https://github.com/llimllib/personal_code/blob/master/misc/advent/2022/07/a.zig#L56)
- [personal_code/a.zig at master · llimllib/personal_code](https://github.com/llimllib/personal_code/blob/master/misc/advent/2022/06/a.zig#L10)
- [SpexGuy/Advent2022 in zig](https://github.com/SpexGuy/Advent2022/)
- [root.mem.split - Zig](https://ziglang.org/documentation/master/std/#root;mem.split)
- [root.mem.tokenize - Zig](https://ziglang.org/documentation/master/std/#root;mem.tokenize)
- [How to read a file in zig? - Stack Overflow](https://stackoverflow.com/questions/68368122/how-to-read-a-file-in-zig)
- [Can someone describe in English words the type of [_:null]const ?[_:0]const u8 and also show some example values of that type? Thanks. : Zig](https://www.reddit.com/r/Zig/comments/s4jowo/can_someone_describe_in_english_words_the_type_of/)
- [root.fmt.format - Zig](https://ziglang.org/documentation/master/std/#root;fmt.format)
- [std.debug.print("{d}", .{whatever}); : Zig](https://www.reddit.com/r/Zig/comments/rsy0kn/stddebugprintd_whatever/)
- [zig/fmt.zig at 0.10.x · ziglang/zig · GitHub](https://github.com/ziglang/zig/blob/0.10.x/lib/std/fmt.zig)
- [Zig Strings in 5 minutes | Lobsters](https://lobste.rs/s/nimeia/zig_strings_5_minutes)
- [Zig Cheatsheet - ratfactor](https://ratfactor.com/zig/cheatsheet)
- [The Zig Programming Language - ratfactor](https://ratfactor.com/zig/)
- [learnxinyminutes-docs/zig.html.markdown at master · adambard/learnxinyminutes-docs](https://github.com/adambard/learnxinyminutes-docs/blob/master/zig.html.markdown)
- [fjebaker/advent-of-code-2022 in zig](https://github.com/fjebaker/advent-of-code-2022)
- [zig externs when using zig test for wasm - Stack Overflow](https://stackoverflow.com/questions/74708447/zig-externs-when-using-zig-test-for-wasm)
- [squeek502/audiometa: An audio metadata/tag reading library written in Zig](https://github.com/squeek502/audiometa)
- [-fsanitize=fuzzer support · Issue #5484 · ziglang/zig](https://github.com/ziglang/zig/issues/5484)
- [Sanitizers by meme · Pull Request #5956 · ziglang/zig](https://github.com/ziglang/zig/pull/5956)
- [Local Maximum: What It Is, and How to Get Over It in A/B Testing - CXL](https://cxl.com/blog/local-maximum/)
- [Meaning of "Avoid local maximums" Zen principle? : Zig](https://www.reddit.com/r/Zig/comments/o23p9l/meaning_of_avoid_local_maximums_zen_principle/)
- [My hopes and dreams for 'zig test' - Zig NEWS](https://zig.news/slimsag/my-hopes-and-dreams-for-zig-test-2pkh)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Nested-Container-Tests)
- [How to test every file in a simple Zig project using build.zig? : Zig](https://www.reddit.com/r/Zig/comments/y65qa6/how_to_test_every_file_in_a_simple_zig_project/)
- [advent-of-code-2022/main.zig at main · fjebaker/advent-of-code-2022 · GitHub](https://github.com/fjebaker/advent-of-code-2022/blob/main/day01/main.zig)
- [matklad/aoc2022](https://github.com/matklad/aoc2022)
- [Running zig build test does not output debug logs : Zig](https://www.reddit.com/r/Zig/comments/zcazob/running_zig_build_test_does_not_output_debug_logs/)
- [pjz/aoc-2020-zig: Advent of Code 2020 in Zig (to learn/try out ziglang)](https://github.com/pjz/aoc-2020-zig)
- [Goodbye to the C++ Implementation of Zig | Hacker News](https://news.ycombinator.com/item?id=33913231)
- [How (memory) safe is zig?](https://www.scattered-thoughts.net/writing/how-safe-is-zig/)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#Where-are-the-bytes)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/#struct)
- [tristanisham/zvm: zvm (Zig Version Manager) lets you easily install/upgrade between different versions of Zig.](https://github.com/tristanisham/zvm)
- [Zig Is Bootstrapping With WASM, Why? - YouTube](https://www.youtube.com/watch?v=MCfD7aIl-_E)
- [Govind. on Twitter: "Got burned today the fact the fact that @ziglang doesn't use default init. values if you use allocator to create your struct. Should there be a nice way in the stdlib or the lang to do this ?" / Twitter](https://twitter.com/DeepknowledgeU/status/1600456104592388097)
- [dmbfm/zwc: A WC clone written in zig](https://github.com/dmbfm/zwc)
- [dmbfm/zig-interpreters: Writing an interpreter in zig for self-study, based on Robert Nystrom's "Crafting Interpreters".](https://github.com/dmbfm/zig-interpreters)
- [dmbfm/cabinet-scan: Small program written in Zig that I use to scan my note-taking system for tags and other data](https://github.com/dmbfm/cabinet-scan)
- [daniel fortes on Twitter: "Zig's build system is so nice. I wrote a small tool to generate .gitignore files. Using the build tool I was able to bundle &gt;500 .gitignore templates directly in the binary so there is no need to keep all these files around @ziglang #zig #ziglang https://t.co/KHMSDVCscG" / Twitter](https://twitter.com/daniel__fortes/status/1463679306174013443)
- [zig/socket.zig at master · ziglang/zig · GitHub](https://github.com/ziglang/zig/blob/master/lib/std/x/os/socket.zig)
- [Socket/UDP implementation? => CoAP : Zig](https://www.reddit.com/r/Zig/comments/vhjuuj/socketudp_implementation_coap/)
- [zig-network/client.zig at master · MasterQ32/zig-network · GitHub](https://github.com/MasterQ32/zig-network/blob/master/examples/discovery/client.zig)
- [MasterQ32/zig-network: A smallest-common-subset of socket functions for crossplatform networking, TCP & UDP](https://github.com/MasterQ32/zig-network)
- [Failing to Learn Zig via Advent of Code : Zig](https://www.reddit.com/r/Zig/comments/s60t8j/failing_to_learn_zig_via_advent_of_code/)
- [ziglang socket site:www.reddit.com - Szukaj w Google](https://www.google.com/search?q=ziglang+socket+site:www.reddit.com&rlz=1C5CHFA_enPL1026PL1026&sxsrf=ALiCzsbbh5if9tZY-08xwUQeRp0P88SHBg:1670629805898&sa=X&ved=2ahUKEwjIv4aB3e37AhWWyIsKHVNVCNwQrQIoBHoECAkQBQ&biw=1152&bih=637&dpr=2.5)
- [How to Add Buffering to a Reader / Writer in Zig - Zig NEWS](https://zig.news/kristoff/how-to-add-buffering-to-a-writer-reader-in-zig-7jd)
- [Development with nix · ziglang/zig Wiki](https://github.com/ziglang/zig/wiki/Development-with-nix)
- [ziglang open socket - Szukaj w Google](https://www.google.com/search?q=ziglang+open+socket&rlz=1C5CHFA_enPL1026PL1026&sxsrf=ALiCzsYK0ncy8jCVCJ5S4AFKREjbK_XogQ%3A1670554369996&ei=AaOSY4u7PP-Pxc8Prq-XuAI&ved=0ahUKEwjLv7T-w-v7AhX_R_EDHa7XBScQ4dUDCA8&uact=5&oq=ziglang+open+socket&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIFCCEQoAEyBQghEKABOggIABCABBDLAToGCAAQFhAeOgcIIRCgARAKSgQIQRgASgQIRhgAUABYwgxgpQ1oAHABeACAAWqIAbMHkgEDOS4ymAEAoAEBwAEB&sclient=gws-wiz-serp)
- [ziget: A Zig HTTP Client : Zig](https://www.reddit.com/r/Zig/comments/gs064f/ziget_a_zig_http_client/)
- [nodejs/http-parser: http request/response parser for c](https://github.com/nodejs/http-parser)
- [ziget/parse.zig at master · marler8997/ziget · GitHub](https://github.com/marler8997/ziget/blob/master/ziget/http/parse.zig)
- [deemru/msspi: TLS client/server framework mimics OpenSSL to SSP interface](https://github.com/deemru/msspi)
- [iguanaTLS/src at master · marler8997/iguanaTLS](https://github.com/marler8997/iguanaTLS/tree/master/src)
- [Any workable HTTP clients or working examples? : Zig](https://www.reddit.com/r/Zig/comments/it8h92/any_workable_http_clients_or_working_examples/)
- [Requestz - HTTP client for Zig : Zig](https://www.reddit.com/r/Zig/comments/ju1hud/requestz_http_client_for_zig/)
- [I/O free HTTP/1.1 implementation for Zig 🦎 : Zig](https://www.reddit.com/r/Zig/comments/g776wm/io_free_http11_implementation_for_zig/)
- [One thing that I’m quite bummed out with Zig is the lack of a good http server/c... | Hacker News](https://news.ycombinator.com/item?id=28095541)
- [Zig Vs C - Minimal HTTP server](https://richiejp.com/zig-vs-c-mini-http-server)
- [Zig libraries | Everything I know](https://wiki.nikiv.dev/programming-languages/zig/zig-libraries)
- [A plan for std.net · Issue #7194 · ziglang/zig](https://github.com/ziglang/zig/issues/7194)
- [zig/socket.zig at master · ziglang/zig · GitHub](https://github.com/ziglang/zig/blob/master/lib/std/x/os/socket.zig)
- [An example of a zig tcp client? : Zig](https://www.reddit.com/r/Zig/comments/avgzcz/an_example_of_a_zig_tcp_client/)
- [nanomsg/nng: nanomsg-next-generation -- light-weight brokerless messaging](https://github.com/nanomsg/nng)
- [ziglang tcp - Szukaj w Google](https://www.google.com/search?q=ziglang+tcp+&rlz=1C5CHFA_enPL1026PL1026&sxsrf=ALiCzsapu6l2qtAPdJF7TnG9Ma6MfJj3xA%3A1670554548324&ei=tKOSY5O7E8SFxc8P5-W6wAQ&ved=0ahUKEwiT5bjTxOv7AhXEQvEDHeeyDkgQ4dUDCA8&uact=5&oq=ziglang+tcp+&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIECCMQJzIGCAAQFhAeOgoIABBHENYEELADOgUIIRCgAUoECEEYAEoECEYYAFDnDFjsEGDmE2gCcAF4AIABlQGIAekBkgEDMS4xmAEAoAEByAEIwAEB&sclient=gws-wiz-serp)
- [I want to run simple http server that I also know how it works : Zig](https://www.reddit.com/r/Zig/comments/xupw9d/i_want_to_run_simple_http_server_that_i_also_know/)
- [ducdetronquito/http: HTTP core types for Zig 🦴](https://github.com/ducdetronquito/http)
- [basic-tcp-chat.zig](https://gist.github.com/andrewrk/34c21bdc1600b0884a3ab9fa9aa485b8)
- [basic-tcp-chat.zig](https://gist.github.com/karlseguin/53bb8ebf945b20aa0b7472d9d30de801)
- [basic-tcp-chat.zig](https://gist.github.com/rofrol/55de5a3be4b2ec531ba3e85d2bdcb0a5)
- [zig/tcp.zig at master · ziglang/zig · GitHub](https://github.com/ziglang/zig/blob/master/lib/std/x/net/tcp.zig)
- [zhp/main.zig at master · frmdstryr/zhp · GitHub](https://github.com/frmdstryr/zhp/blob/master/example/main.zig)
- [advanced-hello-world/src/discord_logger at main · kristoff-it/advanced-hello-world · GitHub](https://github.com/kristoff-it/advanced-hello-world/tree/main/src/discord_logger)
- [zig_examples/example.zig at main · jlauman/zig_examples · GitHub](https://github.com/jlauman/zig_examples/blob/main/97_http_request/example.zig)
- [zig-network/build.zig at master · MasterQ32/zig-network](https://github.com/MasterQ32/zig-network/blob/master/build.zig)
- [MasterQ32/zig-network: A smallest-common-subset of socket functions for crossplatform networking, TCP & UDP](https://github.com/MasterQ32/zig-network/tree/master)
- [The road to zig std · Issue #21 · MasterQ32/zig-network](https://github.com/MasterQ32/zig-network/issues/21)
- [lithdew/rheia: A blockchain written in Zig.](https://github.com/lithdew/rheia)
- [GeneralPurposeAllocator zig - Szukaj w Google](https://www.google.com/search?q=GeneralPurposeAllocator+zig&rlz=1C5CHFA_enPL1026PL1026&sxsrf=ALiCzsZcIrIjFq-IWcObuRbMU5c-ZbqARA%3A1670558288483&ei=ULKSY_yTHZXt7_UP4KGwqAo&ved=0ahUKEwj8-_HK0uv7AhWV9rsIHeAQDKUQ4dUDCA8&uact=5&oq=GeneralPurposeAllocator+zig&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIHCCMQsAIQJzIICAAQFhAeEAoyCAgAEAgQHhANOgoIABBHENYEELADSgQIQRgASgQIRhgAUI4DWP8FYMwGaAFwAXgAgAFdiAFdkgEBMZgBAKABAcgBB8ABAQ&sclient=gws-wiz-serp)
- [Chapter 2 - Standard Patterns | ziglearn.org](https://ziglearn.org/chapter-2/)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/master/)
- [zig async self-hosted - Szukaj w Google](https://www.google.com/search?q=zig+async+self-hosted&rlz=1C5CHFA_enPL1026PL1026&sxsrf=ALiCzsYirbQKgI5y3P-7-o1ZhZiZyBLkOg%3A1670558532771&ei=RLOSY4nKLv3i7_UPq46PqAo&ved=0ahUKEwiJ_K-_0-v7AhV98bsIHSvHA6UQ4dUDCA8&uact=5&oq=zig+async+self-hosted&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIHCCEQoAEQCjoKCAAQRxDWBBCwAzoICAAQgAQQywE6BggAEBYQHjoICAAQFhAeEAo6BQghEKABSgQIQRgASgQIRhgAUG9YhhJg4hJoAXABeACAAWKIAa8HkgECMTGYAQCgAQHIAQjAAQE&sclient=gws-wiz-serp)
- [What do you guys think about Zig's approach to async? : rust](https://www.reddit.com/r/rust/comments/lwsqcc/what_do_you_guys_think_about_zigs_approach_to/)
- [language:zig AutoHashMap - GitHub Code Search](https://cs.github.com/?scopeName=All+repos&scope=&q=language%3Azig+AutoHashMap)
- [http.zig - GitHub Code Search](https://cs.github.com/fubark/cosmic/blob/b85feaef0754dceb8762f3f3eafc115f2ed7e5d2/stdx/http.zig?q=language%3Azig+AutoHashMap)
- [cosmic/http.zig at b85feaef0754dceb8762f3f3eafc115f2ed7e5d2 · fubark/cosmic · GitHub](https://github.com/fubark/cosmic/blob/b85feaef0754dceb8762f3f3eafc115f2ed7e5d2/stdx/http.zig#L115)
- [09_2.zig - GitHub Code Search](https://cs.github.com/joachimschmidt557/adventofcode2021/blob/4207122b190ff1783c89df44dbd27e722a38e3b7/src/09_2.zig?q=language%3Azig+AutoHashMap+GeneralPurposeAllocator#L38)
- [util.zig - GitHub Code Search](https://cs.github.com/SpexGuy/Zig-AoC-Template/blob/0433fdb88b93dc7990d398d09905b1af746d4b6f/src/util.zig?q=language%3Azig+AutoHashMap+GeneralPurposeAllocator#L1)
- [Malloc to a list of struct in Zig? - Stack Overflow](https://stackoverflow.com/questions/61422445/malloc-to-a-list-of-struct-in-zig)
- [Zig hashmaps explained | Hexops' devlog](https://devlog.hexops.com/2022/zig-hashmaps-explained/)
- [Resource efficient Thread Pools with Zig - Zig NEWS](https://zig.news/kprotty/resource-efficient-thread-pools-with-zig-3291)
- [Documentation - The Zig Programming Language](https://ziglang.org/documentation/0.10.0/#Choosing-an-Allocator)
- [Allocgate: Restructuring how allocators work in Zig | Hacker News](https://news.ycombinator.com/item?id=29571133)
- [zig - How can you create a buffer of the same size as a file? - Stack Overflow](https://stackoverflow.com/questions/70189554/how-can-you-create-a-buffer-of-the-same-size-as-a-file)
- [Allocgate is coming in Zig 0.9, and you will have to change your code](https://pithlessly.github.io/allocgate.html)
- [Allocgate · Issue #10052 · ziglang/zig](https://github.com/ziglang/zig/issues/10052)
- [Severe Performance Issue With `std.rand.Random` · Issue #10037 · ziglang/zig](https://github.com/ziglang/zig/issues/10037)

- [Ziglang](https://www.reddit.com/r/Zig/new/)
- [A noob learning zig : Zig](https://www.reddit.com/r/Zig/comments/zc8r8g/a_noob_learning_zig/)
- [Is there an Accumulate/Fold/Reduce like function for a Slice : Zig](https://www.reddit.com/r/Zig/comments/zdemxm/is_there_an_accumulatefoldreduce_like_function/)
- [RFC: Make function definitions expressions · Issue #1717 · ziglang/zig](https://github.com/ziglang/zig/issues/1717)
- [emekoi (Emeka Nkurumeh)](https://github.com/emekoi)
- [anonymous struct literals · Issue #685 · ziglang/zig](https://github.com/ziglang/zig/issues/685)
- [frmdstryr (frmdstryr)](https://github.com/frmdstryr)
- [functions inside functions (closures) · Issue #229 · ziglang/zig](https://github.com/ziglang/zig/issues/229#issuecomment-721421197)
- [Goodbye to the C++ Implementation of Zig: How we used WebAssembly to annihilate 80,000 lines of legacy code : Zig](https://www.reddit.com/r/Zig/comments/zgbx4g/comment/izisqeg/?utm_source=reddit&utm_medium=web2x&context=3)
- [Zig Is Bootstrapping With WASM, Why? - YouTube](https://www.youtube.com/watch?v=MCfD7aIl-_E)
- [bettertools/zigenesis: Build ANY project in ANY Language with Zig.](https://github.com/bettertools/zigenesis)
- [Ncdu 2: Less hungry and more Ziggy](https://dev.yorhel.nl/doc/ncdu2)
- [yorhel/ncdu: NCurses Disk Usage - ncdu - Blicky.net Git Hosting](https://code.blicky.net/yorhel/ncdu/src/branch/zig)
- [Learning the Zig programming language with help from its creator and core team - YouTube](https://www.youtube.com/watch?v=O4UYT-brgrc)
- [Ncdu 2.0 released: Completely rewritten in Zig, with lower memory usage and better performance : linux](https://www.reddit.com/r/linux/comments/roh8x8/ncdu_20_released_completely_rewritten_in_zig_with/)
- [mitchellh/zig-js: Access the JS host environment from Zig compiled to WebAssembly.](https://github.com/mitchellh/zig-js)
- [Govind. on Twitter: "Got burned today the fact the fact that @ziglang doesn't use default init. values if you use allocator to create your struct. Should there be a nice way in the stdlib or the lang to do this ?" / Twitter](https://twitter.com/DeepknowledgeU/status/1600456104592388097)
- [daniel fortes on Twitter: "I've been using @ziglang for a while but only now I realized you can do mixins/basic inheritance with usingnamespace. https://t.co/5n1Rvrc1JO" / Twitter](https://twitter.com/daniel__fortes/status/1597351196448391168)
- [trace.zig: A small and simple tracing client library - Zig NEWS](https://zig.news/huntrss/tracezig-a-small-and-simple-tracing-client-library-2ffj)
- [sm2(1)](https://len.falken.directory/code/sm2.git/)
- [A Programmer-Friendly I/O Abstraction Over io_uring and kqueue | TigerBeetle](https://tigerbeetle.com/blog/a-friendly-abstraction-over-iouring-and-kqueue/)
- [holobeat/zig-adventofcode-2021-solutions](https://github.com/holobeat/zig-adventofcode-2021-solutions)
- [Posts | kprotty.github.io](http://kprotty.me/)
- [SpexGuy/Zig-AoC-Template: A template for Advent of Code participants using Zig](https://github.com/SpexGuy/Zig-AoC-Template)
- [holobeat/zig-adventofcode-2021-solutions](https://github.com/holobeat/zig-adventofcode-2021-solutions)
- [Easy Interfaces with Zig 0.10.0 - Zig NEWS](https://zig.news/kristoff/easy-interfaces-with-zig-0100-2hc5)
- [Pyrolistical/zig-wasm-canvas](https://github.com/Pyrolistical/zig-wasm-canvas)
- [@toxi@mastodon.thi.ng on Twitter: "@pyrolistical @typescript @ziglang Btw. If you're interested, here're a bunch of #ziglang #WebAssembly demos: - https://t.co/GgqsoA8HyH - canvas doodling - https://t.co/b0zSn5nVxj - delayed execution - https://t.co/PAplTAnJcf - task w/ localstorage serialization DOM related parts much simplified w/ next update!" / Twitter](https://twitter.com/toxi/status/1592295784120483840)
- [Typescript in WebAssembly as Zig struct](https://blog.battlefy.com/typescript-in-webassembly-as-zig-struct)
- [Easy Interfaces with Zig 0.10.0 - Zig NEWS](https://zig.news/kristoff/easy-interfaces-with-zig-0100-2hc5)
- [Easy Interfaces with Zig 0.10.0 | Hacker News](https://news.ycombinator.com/item?id=33635341)
- [Easy Interfaces with Zig 0.10.0 | Lobsters](https://lobste.rs/s/sygfxw)
- [Easy Interfaces with Zig 0.10.0 : Zig](https://www.reddit.com/r/Zig/comments/ywmt0j/easy_interfaces_with_zig_0100/)
- [Zig Bare Metal Programming on STM32F103 — Booting up | by Mattia Maldini | Oct, 2022 | Medium](https://maldus512.medium.com/zig-bare-metal-programming-on-stm32f103-booting-up-b0ecdcf0de35)
- [Ziglang - First thoughts!](https://www.breakin.se/blog/ziglang-1.html)
- [Zig custom chip demo - Wokwi Arduino and ESP32 Simulator](https://zig.preview.wokwi.com/projects/348776765607379539)
- [Zig custom chip demo - Wokwi Arduino and ESP32 Simulator - discu.eu](https://discu.eu/q/https://zig.preview.wokwi.com/projects/348776765607379539)
- [How to implement conditional compilation in zig? - Help - Ziggit](https://ziggit.dev/t/how-to-implement-conditional-compilation-in-zig/379/10)
- [Writing a SQL database, take two: Zig and RocksDB | notes.eatonphil.com](https://notes.eatonphil.com/zigrocks-sql.html)
- [A minimal RocksDB example with Zig | notes.eatonphil.com](https://notes.eatonphil.com/zigrocks.html)
- [markisus/zig-aoc2021: Advent of Code 2021 in Zig](https://github.com/markisus/zig-aoc2021)
- [2021 Zig Solutions : adventofcode](https://www.reddit.com/r/adventofcode/comments/vv8r1k/2021_zig_solutions/)
- [Zig is Self-hosted Now, What's Next? : programming](https://www.reddit.com/r/programming/comments/yd70wk/zig_is_selfhosted_now_whats_next/)
- [Zig marches onwards, 0.10.0 released : programming](https://www.reddit.com/r/programming/comments/yirkiz/zig_marches_onwards_0100_released/)
- [https://allyourcodebase.com/zig/](https://allyourcodebase.com/zig/)
- [Fabio Arnold on Twitter: "Added a "zig build' command to @TiledApp that lets me see changes instantly in https://t.co/cYf34cjiQI. Also my build.zig is now responsible for converting Tiled files into Zig code. https://t.co/FltW0tckYw" / Twitter](https://twitter.com/captainhorst/status/1590093643636875264)
- [Desttinghim on Twitter: "I managed to playback a sine wave on Android using Zig! I actually did it twice - once for AAudio, once for OpenSL ES. What's the difference? AAudio is a newer API meant to reduce latency and complexity. OpenSL ES is a very OOP API that works on devices back to API level 16." / Twitter](https://twitter.com/Desttinghim/status/1587679607184011264)
- [Zig and the Zigzaw - Zig NEWS](https://zig.news/shadeops/zig-and-the-zigzaw-413n)
- [How do I call a C function with a pointer to a struct and then use the return value? : Zig](https://www.reddit.com/r/Zig/comments/ympy8a/how_do_i_call_a_c_function_with_a_pointer_to_a/)
- [I'm learning zig and I'm trying to make sense of the syntax. : Zig](https://www.reddit.com/r/Zig/comments/yl0nvv/im_learning_zig_and_im_trying_to_make_sense_of/)
- [Type/pointer cheatsheet - Zig NEWS](https://zig.news/toxi/typepointer-cheatsheet-3ne2)
- [Memory safety in C++, Zig, & Rust (part 1) : Zig](https://www.reddit.com/r/Zig/comments/yjdi25/memory_safety_in_c_zig_rust_part_1/)
- [How to multiply f32 and u32? - Help - Ziggit](https://ziggit.dev/t/how-to-multiply-f32-and-u32/413/15)
- [bootradev/zig-fetch: a dependency management solution for zig projects!](https://github.com/bootradev/zig-fetch)
- [Stay Together For The Kids - Andrew Kelley - Software You Can Love 2022 - YouTube](https://www.youtube.com/watch?v=stChOsejLEQ)
- [rganesan/aoc-zig-2022: 2022 Advent Of Code solutions in Zig](https://github.com/rganesan/aoc-zig-2022)
- [microsoft/mimalloc: mimalloc is a compact general purpose allocator with excellent performance.](https://github.com/microsoft/mimalloc)
- [rdunnington (Reuben Dunnington)](https://github.com/rdunnington)
- [daurnimator (daurnimator) / Repositories](https://github.com/daurnimator?tab=repositories&q=&type=&language=zig&sort=)
- [Ryan Liptak - ryanliptak.com](https://www.ryanliptak.com/)
