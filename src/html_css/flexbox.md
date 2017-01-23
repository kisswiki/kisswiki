- Use flexbox while supporting older Internet Explorers https://github.com/10up/flexibility
- Flexbox playgroung http://codepen.io/enxaneta/full/adLPwv/
- http://www.thedotpost.com/2015/12/rachel-andrew-the-new-css-layout
- play game to learn http://www.flexboxdefense.com/
- examples http://www.flexboxpatterns.com/
- https://davidwalsh.name/flexbox-layouts

- adviced settings http://philipwalton.com/articles/normalizing-cross-browser-flexbox-bugs/

  ```css
  /**
   * 1. Avoid the IE 10-11 `min-height` bug.
   * 2. Set `flex-shrink` to `0` to prevent Chrome, Opera, and Safari from
   *    letting these items shrink to smaller than their content's default
   *    minimum size.
   */
  .Site {
    display: flex;
    flex-direction: column;
    height: 100vh; /* 1 */
  }
  .Site-header,
  .Site-footer {
    flex-shrink: 0; /* 2 */
  }
  .Site-content {
    flex: 1 0 auto; /* 2 */
  }
  ```
- bug in IE11 when `flex-basis: 50%`, needed `max-height: 50%`, otherwise there is overflow and scrollbar appears http://degradingdisgracefully.com/ie11-ie10-flexbox-overflow-bug/
- bug in IE11: max-width needed http://degradingdisgracefully.com/ie11-ie10-flexbox-overflow-bug/
- bug in chrome: input needs placeholder for middle vertical centering (text base)
- https://github.com/channingallen/tower-defense
- http://flexboxfroggy.com/
- https://github.com/luisrudge/postcss-flexbugs-fixes
- Aligning Text Smartly in CSS, with flexbox http://codepen.io/MoOx/pen/XdVjpK
- http://www.flexboxpatterns.com/
- bulma: a modern CSS framework http://bulma.io/

## vertically align and stretch

```css
.menu {
  display: flex;
  align-items: stretch;
}

.menu > * {
  padding-left: 10px;
  padding-right: 10px;
  display: flex;
  flex-grow: 1;
  align-items: center;
  justify-content: center;
}

```

- http://stackoverflow.com/questions/19063770/how-to-vertically-align-and-stretch-content-using-css-flexbox
- http://stackoverflow.com/questions/19072610/flexbox-vertically-center-and-match-size

## children equal size

>Each flex item has a flex-basis which is sort of like its initial size. Then from there, any remaining free space is distributed proportionally (based on flex-grow) among the items. With auto, that basis is the contents size (or defined size with width, etc.). As a result, items with bigger text within are being given more space overall in your example.
>
>If you want your elements to be completely even, you can set flex-basis: 0. This will set the flex basis to 0 and then any remaining space (which will be all space since all basises are 0) will be proportionally distributed based on flex-grow.
>
>-- http://stackoverflow.com/questions/25066214/flexbox-not-giving-equal-width-to-elements/25066844#25066844
