- https://github.com/rofrol/nix-for-javascript-developers
- [Nix Language Overview - YouTube](https://www.youtube.com/watch?v=eCapIx9heBw
- https://nixos.wiki/wiki/Nix_Expression_Languag
- https://medium.com/@MrJamesFisher/nix-by-example-a0063a1a4c55
- https://cheat.readthedocs.io/en/latest/nixos/nix_lang.html
- https://github.com/adambard/learnxinyminutes-docs/blob/master/nix.html.markdown
- https://github.com/functionalops/nix-cookbook
- https://nixos.org/manual/nix/stable/expressions/language-constructs.html
- https://scrive.github.io/nix-workshop/
- https://nixcloud.io/tour
- https://nixos.wiki/wiki/Nix_by_example
- lints and suggestions for the nix programming language https://github.com/nerdypepper/statix
  - https://www.reddit.com/r/NixOS/comments/qh47fz/statix_lints_and_suggestions_for_the_nix/
- https://tvl.fyi/blog/rewriting-nix
  - a tiny type-checker for data in Nix, written in Nix https://code.tvl.fyi/tree/nix/yants/README.md
  - a CGI programming library for the Nix expression language https://code.tvl.fyi/tree/web/bubblegum/README.md

## Use double quotes for string

```bash
$ nix-instantiate --eval --expr "'Hello world'"
error: syntax error, unexpected invalid token

       at «string»:1:1:

            1| 'Hello world'
             | ^
$  nix-instantiate --eval --expr "\"Hello world\""
"Hello world"
$ nix-instantiate --eval --expr '"Hello world"'
"Hello world"
```

I have followed path: https://nixos.wiki/wiki/Nix_Expression_Language -> https://medium.com/@MrJamesFisher/nix-by-example-a0063a1a4c55

## undefined variable 'length'

```bash
$ nix-instantiate --eval --expr "(length [1 2 3 \"x\"])"
error: undefined variable 'length'

       at «string»:1:2:

            1| (length [1 2 3])
             |  ^
```

I have followed path: https://nixos.wiki/wiki/Nix_Expression_Language -> https://github.com/nix-community/nix-snippets -> https://github.com/adambard/learnxinyminutes-docs/blob/master/nix.html.markdown

Then this gave me solution: https://github.com/search?q=extension%3Anix+%22length%22&ref=opensearch -> https://github.com/BBBSnowball/nixcfg/blob/87c54e3a312accbb984c5b559fc31c61bcfcfa98/hosts/nixosvm/firewall-iptables-restore/lib.nix#L2

So correct run would be:

```bash
nix-instantiate --eval --expr "wth builtins; (length [1 2 3 \"x\"])"
4
```

or with single-quotes outside:

```bash
$ nix-instantiate --eval --expr 'with builtins; (length [1 2 3 "x"])'
4
```

- https://nixos.org/manual/nix/unstable/expressions/builtins.html

## example from manual uses ’ instead of '

```nix-repl
nix-repl> with builtins; foldl’ (x: y: x + y) 0 [1 2 3]
error: syntax error, unexpected invalid token, expecting end of file

       at «string»:1:21:

            1| with builtins; foldl’ (x: y: x + y) 0 [1 2 3]
             |                     ^
            2|
nix-repl> with builtins; foldl' (x: y: x + y) 0 [1 2 3]
6
```

https://nixos.org/manual/nix/unstable/expressions/builtins.html

## global mutable state

Nix suffers from a lot of global mutable state access

https://www.reddit.com/r/NixOS/comments/r6ykln/comment/hmxkffk/
