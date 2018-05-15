- http://bradfrost.com/blog/post/float-label-pattern/
- https://css-tricks.com/float-labels-css/
- https://aforemny.github.io/elm-mdc/#text-field
- https://codepen.io/rofrol/pen/KRBpXP
- https://codepen.io/rofrol/pen/ZoRdvv
- https://codepen.io/rofrol/pen/GdGLdv
- https://codesandbox.io/s/pp7x5xylo7
- https://stackoverflow.com/questions/48990978/floating-label-on-input-focus
- https://github.com/mike-engel/floating-label-react
- https://github.com/cymen/react-floating-label-input
- https://redux-form.com/7.3.0/examples/material-ui/
  - https://material-ui-next.com/api/text-field/
- https://react-md.mlaursen.com/components/text-fields
- https://github.com/tonystar/float-label-css
- https://material-components.github.io/material-components-web-catalog/#/component/text-field
- https://material.io/design/components/text-fields.html#anatomy
- https://github.com/material-components/material-components-web/tree/master/packages/mdc-floating-label
- https://dev.to/peiche/css-only-floating-label-3cp
- https://github.com/richardvenneman/floatl

##

from https://material-components.github.io/material-components-web-catalog/#/component/text-field

```css
.TextFieldLabel {
  bottom: 8px;
  color: $color-gray;
  display: block;
  font-size: 14px;
  left: 0;
  line-height: 1.15rem;
  pointer-events: none;
  position: absolute;
  transform-origin: left top;
  transition: .2s ease all;
}

TextFieldWrapper__floatAbove {
  .TextFieldLabel {
    transform: translateY(-100%) scale(.75);
  }
}
```