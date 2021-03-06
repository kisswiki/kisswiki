## host 0.0.0.0 for exposing in LAN

`elm reactor -a 0.0.0.0`

## Custom script

### elm-0.19

`_compile` no longer works in 0.19.

I can't find documentation about `elm reactor` except this small mention https://elm-lang.org/0.19.0/init.

Use elm-live

`$ elm-live src/Main.elm -d public -- --output=public/elm.js`

- https://discourse.elm-lang.org/t/elm-reactor-init-with-flags-for-0-19/2217/2
- https://stackoverflow.com/questions/52702961/using-custom-html-with-elm-reactor-or-another-dev-server-in-0-19

### elm-0.18

iThis for custom script https://blog.ilias.xyz/elm-reactor-and-custom-html-9e7143553807

From comments:

I encountered one problem, running an application that uses elm-community/string-extra. The UTF-8 characters in its accentRegex variable weren’t properly coded until I added to the `<head>` section:

`<meta charset="UTF-8">`

Before adding that, I got a JavaScript syntax error:

```
Invalid regular expression: /[Ã™-Ãœ]/: Range out of order in character class. The range was supposed to be "à-æ" or "À-Æ".
```

It appears from my testing that the path in the `<script>` tag, `/_compile/src/Main.elm` in the example, is relative to the directory in which elm-reactor is running, not the directory where the index.html file is stored.

## Source

`elm reactor` runs `Develop.run`

https://github.com/elm/compiler/blob/76e90792bc166eab2fe45ec475fe32d2cc320902/terminal/src/Main.hs#L162

https://github.com/elm/compiler/blob/76e90792bc166eab2fe45ec475fe32d2cc320902/terminal/src/Develop.hs#L45
