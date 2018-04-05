- http://stackoverflow.com/questions/33812303/svg-animation-not-working-on-ie-11
- The JavaScript SVG library for the modern web http://snapsvg.io/
- http://slides.com/sdrasner/svg-can-do-that
  - https://github.com/sdras/nuxt-type
  - https://www.reddit.com/r/programming/comments/6u9vam/svg_can_do_that/
  - Sarah Drasner - Animating Vue | VueConf 2017 https://youtu.be/gJDyhmL9O_E

## SVG Path basics

- L Lineto
- M Moveto
- C Curveto
- z close path

http://www.slideshare.net/davidcorbacho/next-generation-graphics-svg

## png to svg

Open in Gimp, `Image > Mode > RGB`, export as `pnm`.

Best result:
  
`potrace --svg $FILE.pnm`

>It uses potrace to generate an SVG representation of the figure from a bitmap. potrace rocks. https://github.com/guyc/scadtrace

Worse result:

`raster-retrace -i $FILE.ppm -o $FILE.svg`


## resize

- https://graphicdesign.stackexchange.com/questions/6574/in-inkscape-resize-both-the-document-and-its-content-at-the-same-time/6670#6670