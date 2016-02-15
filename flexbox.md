- Use flexbox while supporting older Internet Explorers https://github.com/10up/flexibility
- Flexbox playgroung http://codepen.io/enxaneta/full/adLPwv/
- http://www.thedotpost.com/2015/12/rachel-andrew-the-new-css-layout
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
