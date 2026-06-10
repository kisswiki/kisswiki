## ols - LSP and formatter

```
$ brew upgrade odin
$ cd ~/personal_projects/odin/vendor/
$ git clone https://github.com/DanielGavin/ols
$ cd ols
$ ./build.sh
$ ./odinfmt.sh
```

There will be two binaries: ols and odinfmt.

Copy it to `$PATH` od add current dir to `$PATH`.

### Odin nightly and ols

Download nightly odin https://odin-lang.org/docs/nightly/ to ~/bin/odin

May need to remove security protection with commands like `xattr -d com.apple.quarantine ~/bin/odin/libs/libzstd.1.5.7.dylib`

Nightly odin needed to compile ols from source. For example this commit https://github.com/DanielGavin/ols/commit/8d189a07 introduced `all_or_none` which is not in currently released odin 2025-11 released in homebrew https://github.com/Homebrew/homebrew-core/blob/d16c0c8ef91b088a2c33f719b93fa1b520022198/Formula/o/odin.rb

## is struct copied like a pass by value parameter?

It automatically passes by immutable reference if the parameter is larger than 16 bytes. The immutability makes sure you don't change it by accident.

<https://www.youtube.com/watch?v=KSy6EA7VBC4&lc=UgyXdyP6-XxDewrXcPh4AaABAg>

## configure odinfmt to use spaces

It needs `odinfmt.json` in project directory <https://github.com/DanielGavin/ols?tab=readme-ov-file#odinfmt-configurations>

```json
{
  "$schema": "https://raw.githubusercontent.com/DanielGavin/ols/master/misc/odinfmt.schema.json",
  "character_width": 120,
  "tabs": false,
  "tabs_width": 4
}
```

## prevent shadowing

```odin
package shadow

main :: proc() {
    shadow_test(2)
}

shadow_test :: proc(seed: int) -> int {
    seed := 2
    return seed
}
```

`odin run main.odin -file -vet` or `odin run main.odin -file -vet-shadowing`

https://forum.odin-lang.org/t/multiple-shadowing-mistakes/1530

## vetting as errors

- Just wanted to mention that, with ols (the lsp server for Odin), we can actually have it both ways: red squiggly lines in our editor by setting the vet in the ols config, and then - in our terminals - not use the vet flag to compile anyway https://forum.odin-lang.org/t/vet-flags-as-warnings-instead-of-errors/971
- https://forum.odin-lang.org/t/what-features-of-odin-do-you-dislike/132/64
- A useful idiom is `var := var`, which expresses a variable shadowing itself. When used at the top of a procedure the compiler understands the use case of enabling local modification of the otherwise immutable parameter variable, and won’t complain about the shadowing when you compile with `-vet`. https://odin-lang.org/docs/overview/
