- https://userstyles.org/styles/160614/reddit-kill-sticky-header
- https://www.reddit.com/r/web_design/comments/6k04rc/kill_sticky_headers/
- https://alisdair.mcdiarmid.org/kill-sticky-headers/

```javascript
//javascript:
(function(){(function () {var i, elements = document.querySelectorAll('body *');for (i = 0; i < elements.length; i++) {if (getComputedStyle(elements[i]).position.startsWith('fixed')) {elements[i].style.setProperty("position", "absolute", "important");}}})()})()
```