## Stylus

Create new style in Stylus without specyfing domain/url:

```css
@layer {
  code,
  pre {
    font-family: Menlo !important;
  }
}
```

## Didn't worked on freecodecamp.org

In tampermonkey

```javascript
// ==UserScript==
// @name         Force font
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Sets the font on all websites to Consolas
// @author       https://superuser.com/questions/1209191/force-chrome-to-use-my-preferred-font-over-the-authors/1757204#1757204
// @match        *://*/*
// @icon         https://e7.pngegg.com/pngimages/656/766/png-clipart-computer-terminal-computer-icons-bash-others-miscellaneous-angle.png
// @grant        none
// ==/UserScript==

(function () {
  "use strict";

  Array.prototype.forEach.call(
    document.getElementsByTagName("*"),
    function (e) {
      if (
        e.parentNode &&
        (e.parentNode.tagName === "PRE" || e.parentNode.tagName === "CODE")
      ) {
        return;
      }
      if (e.tagName === "PRE" || e.tagName === "CODE") {
        e.style.fontFamily = "Go Mono";
      } else {
        e.style.fontFamily = "Go Medium";
      }
    }
  );
})();
```
