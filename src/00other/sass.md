- inline with node-sass https://github.com/sass/node-sass/issues/372#issuecomment-61536001
  - node-sass input.scss --source-map-embed --source-map-contents > output.css

## @import

sass will include file content when you provide extension `scss` or no extension. If you use `css` extension, the file will be external.

- http://stackoverflow.com/questions/7111610/import-regular-css-file-in-scss-file
- https://varvy.com/pagespeed/render-blocking-css.html
- https://www.stevesouders.com/blog/2009/04/09/dont-use-import/

## grandparent selector

```scss
.component {
  $c: &;         // Set the parent as a variable
  &__floatAbove {
    color: #eee;
    
    &#{$c}__error {   // Use the variable here, compiles to .component__floatAbove.component__error
      color: red;
    }
  }
}
```


https://codeburst.io/how-to-do-sass-grandparent-selectors-b8666dcaf961