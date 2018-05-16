- http://stackoverflow.com/questions/33812303/svg-animation-not-working-on-ie-11
- The JavaScript SVG library for the modern web http://snapsvg.io/
- http://slides.com/sdrasner/svg-can-do-that
  - https://github.com/sdras/nuxt-type
  - https://www.reddit.com/r/programming/comments/6u9vam/svg_can_do_that/
  - Sarah Drasner - Animating Vue | VueConf 2017 https://youtu.be/gJDyhmL9O_E
- https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Tools_for_SVG
  - https://github.com/SVG-Edit/svgedit
- !!! https://fvsch.com/code/svg-icons/
- https://jakearchibald.github.io/svgomg/

## SVG Path basics

- L Lineto
- M Moveto
- C Curveto
- z close path

http://www.slideshare.net/davidcorbacho/next-generation-graphics-svg

## png to svg

Open in Gimp, `Image > Mode > RGB`, export as `pnm`. Converting with imagemagick's convert or pngtopnm, gave bad quality with not antialiased edges.

>Gimp can write PNM files, as well as BMP files. Both file formats are understood by Potrace version 1.1 or later. Note that the files have to be bitmaps, i.e., they should only use two colors black and white. All other colors or grey values will be converted to black and white before Potrace begins its processing. http://potrace.sourceforge.net/faq.html#formats

Best result:
  
`potrace --svg $FILE.pnm`

>It uses potrace to generate an SVG representation of the figure from a bitmap. potrace rocks. https://github.com/guyc/scadtrace

Worse result:

`raster-retrace -i $FILE.ppm -o $FILE.svg`

- https://stackoverflow.com/questions/1861382/how-to-convert-a-png-image-to-a-svg#comment86370954_16388237
- http://potrace.sourceforge.net/
- https://github.com/ideasman42/raster-retrace
- https://github.com/autotrace/autotrace
- https://github.com/fablabnbg/inkscape-centerline-trace

## resize

```bash
$ npm i -g svg-resizer
# because it's not installed correctly, we need to use it like this
$ $(npm root -g)/svg-resizer/svg-resizer.js -x 512 -y 512 -o resized/ file.svg
```

- https://graphicdesign.stackexchange.com/questions/6574/in-inkscape-resize-both-the-document-and-its-content-at-the-same-time/6670#6670

## viewBox

https://css-tricks.com/scale-svg/#article-header-id-3