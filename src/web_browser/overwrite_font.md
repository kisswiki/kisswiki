## Tampermonkey

Create new script:

```javascript
// ==UserScript==
// @name         Override fonts
// @version      1.0
// @description  Override fonts
// @author       Roman Frołow <rofrol@gmail.com>
// @match      *://*/*
// @grant        none
// @url https://gist.github.com/alistairjcbrown/5d85072660f0b850cef68f4be278cdb1
// ==/UserScript==

(function () {
  var styleNode = document.createElement("style");
  var styleText = document.createTextNode(
    'code *, pre *, .javascript  * { font-weight: 600; font-family: "Red Hat Mono", "iA Writer Mono V", "Fantasque Sans Mono", "Monaco NFM", Monaco, Menlo, "NotoMono Nerd Font Mono", monospace !important; } * { font-family: "Open Sans", "Noto Sans", Lato, "Atkinson Hyperlegible", sans-serif !important; } '
  );

  styleNode.type = "text/css";
  styleNode.appendChild(styleText);

  document.head.appendChild(styleNode);
})();
```

- https://github.com/Karmenzind/monaco-nerd-fonts/blob/master/fonts/Monaco%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf
- Atkinson-Hyperlegible-Regular-102.ttf https://brailleinstitute.org/freefont
  - https://www.reddit.com/r/kindle/comments/lna87d/comment/go0tl2e/
- https://gist.github.com/alistairjcbrown/5d85072660f0b850cef68f4be278cdb1
- https://stackoverflow.com/questions/15475404/include-all-pages-in-tampermonkeyuserscript/15774782#15774782
- https://stackoverflow.com/questions/15122959/how-can-my-script-change-a-specific-font-for-a-specific-class
- https://superuser.com/questions/1209191/force-chrome-to-use-my-preferred-font-over-the-authors/1757204#1757204
- https://superuser.com/questions/1209191/force-chrome-to-use-my-preferred-font-over-the-authors/1757204#1757204
