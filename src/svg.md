- https://github.com/blog/2112-delivering-octicons-with-svg
- http://stackoverflow.com/questions/33812303/svg-animation-not-working-on-ie-11
- The JavaScript SVG library for the modern web http://snapsvg.io/

## clear metadata

- https://github.com/codedread/scour http://wiki.inkscape.org/wiki/index.php/Save_Cleaned_SVG
- remove meatada, rdf etc.
- remove `standalone` http://stackoverflow.com/questions/5578645/what-does-the-standalone-directive-mean-in-xml
- remove `version` http://stackoverflow.com/questions/18467982/are-svg-parameters-such-as-xmlns-and-version-needed

## stroke inside

>The stroke-alignment attribute was on April 1st moved to a completely new spec called SVG Strokes.
>No browser support this property, or, as far as I know, any of the new SVG 2 features.
>There seems to be some issues as to how to the property should behave on open paths as well as loops. These issues will, most probably, prolong implementations across browsers.
>
>http://stackoverflow.com/questions/7241393/can-you-control-how-an-svgs-stroke-width-is-drawn/28787545#28787545

- https://github.com/Fyrd/caniuse/issues/1772

```svg
<svg style="background: light-blue;" height="500" width="500"> <circle cx="250" cy="250" r="250" stroke="black" stroke-width="10" stroke-alignment="inner" fill="none" /> </svg>
```

## Scale

To scale svg to enclosing element, there must be viewport attribute in svg.

https://css-tricks.com/scale-svg/
