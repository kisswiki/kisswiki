## Element should be positioned

- absolute or relative - on the same stacking context
- fixed or sticky - on the lower stacking context

https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context

## stacking context

for example siblings div1 and div2. With `z-index` you could put children of div1 above div2, but if there is for example `transform: translate3d` on div1, then there is new stacking contenxt for div1's children.

In below example `id="slider"` is under `id="cover"`:

```html
<!DOCTYPE html>
<div id="content">
  <div id="widgets">
    <div class="control" id="slider">+ slider -</div>
    <div class="control">lock</div>
    <div class="control">crop</div>
  </div>
  <div class="control" id="slider2">+ slider2 -</div>
  <div id="cover"></div>
</div>
```

```css
/* https://www.paulirish.com/2012/box-sizing-border-box-ftw/ */
/* apply a natural box layout model to all elements, but allowing components to change */
html {
  box-sizing: border-box;
}
*, *:before, *:after {
  box-sizing: inherit;
}

body {
  margin: 0;
  padding: 0;
}
#content {
  display: flex;
  position: relative;
  width: 100vw;
  height: 100vh;
  flex-direction: column;
}
#widgets {
  display: flex;
  flex-direction: column;
  flex-basis: 100px;
  transform: translate3d(1px, 1px, 0);
}
.control {
  border: 1px solid black;
  background-color: red;
}
#cover {
  background-color: black;
  min-width: 100%;
  min-height: 100%;
  display: flex;
  border: 1px solid black;
  position: absolute;
  opacity: 0.75;
}
#slider {
  z-index: 1000;
  position: relative;
  opacity: 0.99;
}
#slider2 {
  z-index: 1001;
  position: relative;
  opacity: 0.99;
}
#another {
  display: flex;
  flex-direction: column;
}
```

- https://codepen.io/rofrol/pen/eYmBaRY?editors=1100
- https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context
