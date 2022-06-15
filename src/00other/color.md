- https://github.com/yeun/open-color
- https://github.com/alecortega/palettable
- https://css-tricks.com/nerds-guide-color-web/
- http://colorsafe.co/
- https://coolors.co
  - https://coolors.co/browser/best/1
- https://github.com/SlexAxton/css-colorguard
- https://github.com/mrmrs/colors
- http://www.colourlovers.com/
- https://flatuicolors.com/
- http://www.color-hex.com/color-palettes/
- https://www.colorion.co/
- http://colormind.io/
- http://khroma.co/train/
- https://color.adobe.com/create/color-wheel/
- https://color.adobe.com/explore/?filter=most-popular&time=month
- http://q8z8p.net/#/color
- https://yeun.github.io/open-color/
- a small tool for creating new color palettes from scratch https://twitter.com/beast_pixels/status/1007953732632567808

## Code

```typescript
// https://stackoverflow.com/questions/2241447/make-foregroundcolor-black-or-white-depending-on-background/2241471#2241471
function perceivedBrightness([r, g, b]: [number, number, number]) {
  return Math.sqrt(r * r * 0.299 + g * g * 0.587 + b * b * 0.114);
}

// https://stackoverflow.com/questions/36721830/convert-hsl-to-rgb-and-hex/54014428#54014428
// https://blog.logrocket.com/how-to-manipulate-css-colors-with-javascript-fb547113a1b8/
function hsl2rgb([h, s, l]: [number, number, number]): [
  number,
  number,
  number
] {
  let a = s * Math.min(l, 1 - l);
  let f = (n: number, k = (n + h / 30) % 12) =>
    l - a * Math.max(Math.min(k - 3, 9 - k, 1), -1);
  return [f(0), f(8), f(4)];
}

function hsl2cssRgb([h, s, l]: [number, number, number]): string {
  const hsl = `hsl(${Math.round(h)}, ${Math.round(s * 100)}%, ${Math.round(
    l * 100
  )}%)`;
  return hsl;
}

// https://stackoverflow.com/questions/2348597/why-doesnt-this-javascript-rgb-to-hsl-code-work/54071699#54071699
function rgb2hsl([r, g, b]: [number, number, number]): [
  number,
  number,
  number
] {
  let v = Math.max(r, g, b),
    c = v - Math.min(r, g, b),
    f = 1 - Math.abs(v + v - c - 1);
  let h =
    c && (v === r ? (g - b) / c : v === g ? 2 + (b - r) / c : 4 + (r - g) / c);
  return [60 * (h < 0 ? h + 6 : h), f ? c / f : 0, (v + v - c) / 2];
}

function cssHsl2hsl(c: string): [number, number, number] {
  const [h, s, l] = c.match(/\d+/g)!.map((c) => parseInt(c, 10));
  return [h, s / 100, l / 100];
}

// https://stackoverflow.com/questions/10970958/get-a-color-component-from-an-rgb-string-in-javascript/11003212#11003212
function cssRgb2rgb(c: string): [number, number, number] {
  const [r, g, b] = c.match(/\d+/g)!.map((c) => parseInt(c, 10) / 255);
  return [r, g, b];
}

function rgb2cssRgb([r, g, b]: [number, number, number]): [
  number,
  number,
  number
] {
  return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
}

// https://stackoverflow.com/questions/23095637/how-do-you-get-random-rgb-in-javascript/23095818#23095818
function randomRGB() {
  // return Array.from({ length: 3 }, () => Math.round(Math.random() * 255));
  return rgb2cssRgb(hsl2rgb(cssHsl2hsl(sample(brewerColors))));
}

function toBlob(canvas: HTMLCanvasElement): Promise<Blob> {
  return new Promise((resolve) => {
    canvas.toBlob((blob) => {
      if (blob) resolve(blob);
    });
  });
}

function rgbToHex(rgb: number[]) {
  return rgb.map((c) => (0).toString(16).padStart(2, "0")).join("");
}
```

- https://stackoverflow.com/questions/5623838/rgb-to-hex-and-hex-to-rgb/5624139#5624139
- https://stackoverflow.com/questions/21646738/convert-hex-to-rgba

## Colors distinguishable to humans

```
// https://news.ycombinator.com/item?id=7824684
// https://colorbrewer2.org/#type=diverging&scheme=RdYlBu&n=11
const brewerColors = [
  "hsl(3, 69%, 50%)",
  "hsl(8, 63%, 57%)",
  "hsl(14, 89%, 61%)",
  "hsl(18, 84%, 73%)",
  "hsl(28, 94%, 36%)",
  "hsl(30, 98%, 69%)",
  "hsl(32, 84%, 48%)",
  "hsl(33, 87%, 29%)",
  "hsl(35, 62%, 46%)",
  "hsl(42, 60%, 68%)",
  "hsl(44, 98%, 78%)",
  "hsl(60, 100%, 87%)",
  "hsl(87, 60%, 70%)",
  "hsl(90, 49%, 50%)",
  "hsl(97, 63%, 35%)",
  "hsl(108, 49%, 88%)",
  "hsl(114, 45%, 74%)",
  "hsl(125, 34%, 52%)",
  "hsl(138, 63%, 29%)",
  "hsl(171, 44%, 65%)",
  "hsl(171, 45%, 85%)",
  "hsl(175, 48%, 40%)",
  "hsl(175, 98%, 20%)",
  "hsl(195, 58%, 79%)",
  "hsl(200, 54%, 72%)",
  "hsl(201, 51%, 88%)",
  "hsl(203, 52%, 51%)",
  "hsl(203, 50%, 64%)",
  "hsl(210, 68%, 40%)",
  "hsl(237, 51%, 39%)",
  "hsl(251, 30%, 75%)",
  "hsl(254, 26%, 56%)",
  "hsl(268, 55%, 34%)",
  "hsl(281, 30%, 73%)",
  "hsl(282, 26%, 55%)",
  "hsl(291, 51%, 34%)",
  "hsl(297, 30%, 87%)",
  "hsl(323, 68%, 83%)",
  "hsl(325, 76%, 44%)",
  "hsl(326, 99%, 28%)",
  "hsl(328, 61%, 67%)",
  "hsl(346, 100%, 32%)",
];
```

- https://krazydad.com/tutorials/makecolors.php
  - http://jsfiddle.net/rGL52/
- https://stackoverflow.com/questions/10014271/generate-random-color-distinguishable-to-humans
- https://stackoverflow.com/questions/470690/how-to-automatically-generate-n-distinct-colors
- https://stackoverflow.com/questions/1168260/algorithm-for-generating-unique-colors
- https://stackoverflow.com/questions/773226/generate-unique-colours
- https://stackoverflow.com/questions/6823286/create-unique-colors-using-javascript
- https://sashamaps.net/docs/resources/20-colors/
- https://mokole.com/palette.html
- https://graphicdesign.stackexchange.com/questions/3682/where-can-i-find-a-large-palette-set-of-contrasting-colors-for-coloring-many-d
- Zeileis, Hornik and Murrell (2009): Escaping RGBland: Selecting Colors for Statistical Graphics // Computational Statistics & Data Analysis Volume 53, Issue 9, 1 July 2009 https://www.zeileis.org/papers/Zeileis+Hornik+Murrell-2009.pdf
- https://graphicdesign.stackexchange.com/questions/7960/clearly-distinguishable-colours-for-scientific-figures
- https://medialab.github.io/iwanthue/

## Sort colors

- https://stackoverflow.com/questions/51158179/given-a-finite-palette-how-to-sort-from-hot-to-cold-i-e-diverging
- https://stackoverflow.com/questions/56554290/algorithm-to-sort-colors-like-the-rainbow
- https://mathematica.stackexchange.com/questions/87588/how-to-sort-colors-properly
- https://stackoverflow.com/questions/3014402/sorting-a-list-of-colors-in-one-dimension
- https://tomekdev.com/posts/sorting-colors-in-js

## Color manipulation and conversion

- https://github.com/elchininet/ColorTranslator
- https://github.com/carloscabo/colz
- https://github.com/jakoivis/color-util
