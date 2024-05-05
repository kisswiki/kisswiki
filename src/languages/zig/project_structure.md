dapper_dan

What is the basic use case of the root file?

I just got a big enough main that I'm thinking of breaking off into libs such, so I'm wondering what best practices are for project structure.

squirl

the question as stated is a bit vague, so I'll answer the second part instead :)
best practice for project structure is roughly:

- split a file it if it makes sense, but not arbitrarily (eg. `Sema.zig` in the compiler is ~35k lines, because any split would be arbitrary. Size isn't the thing that matters when deciding whether or not to split a file)
- if you split something out of `foo.zig`, it might make sense for it to go in `foo/bar.zig`, which `foo.zig` should then import (and possibly publicize, ie. `pub const bar = @import("foo/bar.zig")`
- namespaces are good, embrace them (in other words, `usingnamespace` considered harmful)

dapper_dan

this is all great advice, thanks! i think i'm asking more about the logistics of this in zig though. as in, the documents seem to imply that root.zig has some special significance to the build process. also, just adding my "types.zig" (name is arbitary) file to the build script in the same way that "root.zig" was linked didn't seem to work so im a little confused

Oak

The significance of the root source file, is that

1. it is turned into a module call `"root"`, which you will be able to access from anywhere in the compilation via `@import`, this is effectively the root of the graph of source files and modules the compiler will analyse
2. that module is where the std module looks for the entry point of an executable (i.e. `main()` or one of the platform specific entry functions like `_start()`) as well as a std_options decl for overriding various options of the std module

One thing to keep in mind that can cause confusion at first, is that for the executable built by `zig build` or `zig test` the root source file is not the `build.zig` or file tested, but rather `lib/compiler/build_runner.zig` or `lib/compiler/test_runner.zig` respectively.

dapper_dan

So is it a normal practice in zig land to make submodules, or do larger projects just do file imports?

experienced corner

`build.zig.zon` can specify dependencies

squirl

File imports within a project, modules for using dependencies
It's sometimes useful to have one extra module in a project (eg. If you expose a zig library as well as a binary, or something like that) but in most cases each zig project should have one module

Oak

You could also use modules if you wanted to split up your directory structure for different artefacts and have some internal library they all use that then wouldn't be in the main module path of the individual artefacts, but I don't think this is particularly common. For example I have done when I wanted to put all my fuzz testing stuff in a `test/` folder rather than under `src/`

https://discord.com/channels/605571803288698900/1019652020308824145/threads/1236157558264172574
