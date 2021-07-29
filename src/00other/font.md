## Overview

`0123456789 {}[]=<>{}|&;,.- 1lIi|`

- https://www.programmingfonts.org/
  - https://github.com/ProgrammingFonts/ProgrammingFonts
- https://www.s9w.io/font_compare/
- https://alexey-milovidov.github.io/font-selector/
- https://en.m.wikipedia.org/wiki/List_of_monospaced_typefaces
- https://draculatheme.com/blog/best-free-fonts-for-programming
- https://hadrysmateusz.medium.com/best-free-programming-fonts-2020-f243a6b4749a

## Ubuntu Mono

- My favourite monospace font, though r could be different.

```json
  "editor.fontFamily": "Ubuntu Mono",
  "editor.fontSize": 18, // Ubuntu Mono
```

- https://en.m.wikipedia.org/wiki/Ubuntu_(typeface)

## Iosevka

- https://github.com/be5invis/Iosevka
- Could be shorter/wider. Can built own variant https://github.com/be5invis/Iosevka/issues/53#issuecomment-173199457
- Many styles to download
- https://adam.kruszewski.name/articles/2019-10-27-build-custom-iosevka-font/

## Too sterile/artificial

- https://input.djr.com/
- https://github.com/JetBrains/JetBrainsMono

## Hack

- Can customize zero to be dot or diamond
- Just two width https://github.com/source-foundry/Hack/issues/472
- i maybe hard to distinguish between l https://github.com/source-foundry/Hack/issues/469

## Cartograph CF

- Free version download https://fontshub.pro/font/cartograph-cf-download

## Misc

- Machine Learning software that helps designers choose the best font combinations. Mix and match different fonts for the perfect pairing https://github.com/Jack000/fontjoy
- https://en.wikipedia.org/wiki/PT_Fonts
- My favourite now https://github.com/vikky49/patchedFonts-Ligatures/blob/master/SourceCodePro.zip

## Ligatures

the problems are:

- For example ≠ is very different from !=, and since some languages allow unicode symbols it could be confusing
- Languages are very different. In Haskell [i*i | i<-[1..]] should be rendered as [i*i | i⟵[1..]], but if - x<-3 should not become if x ⟵3. Lua has ~= instead of != and so on.
- The font has no context awareness. Ligatures would be shown in comments, documentation, strings...

https://github.com/madmalik/mononoki/issues/29#issuecomment-220626523

## free

- Choose "100% Free" in filter https://www.dafont.com
