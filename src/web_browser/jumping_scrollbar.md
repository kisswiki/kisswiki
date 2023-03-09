# Jumping scrollbar

- https://developers.google.com/web/updates/2017/03/custom-scrollbar
- http://stackoverflow.com/questions/1417934/how-to-prevent-scrollbar-from-repositioning-web-page/39289453#39289453

## Calc

```css
/* eliminiate jumping scrollbar https://aykevl.nl/2014/09/fix-jumping-scrollbar */
/* html width cannot be 100%, container i.e. body cannot have width in percentage */

@media screen and (min-width: 1280px) {
  html {
    margin-left: calc(100vw - 100%);
  }

  body {
    margin: 0 auto;
    width: 1280px;
  }
}
```


## Style scrollbar

```css
/* https://css-tricks.com/almanac/properties/s/scrollbar/
   http://caniuse.com/#feat=css-scrollbar
 */

@media screen and (min-width: 1280px) {
    body {
      width: auto;
      overflow-y: scroll;
    }

    body::-webkit-scrollbar {
      width: 1em;
    }

    body::-webkit-scrollbar-thumb {
      background-color: darkgrey;
    }
}
```
