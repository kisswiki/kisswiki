- https://github.com/zeeshanu/learn-regex

## match vs matchAll vs exec vs test vs search

`re.test(str)`

`str.match(regex)?.[0] ?? ""`

`Array.from('<h1>Hello, world!</h1>'..matchAll(/<(.*?)>/g))` - `.*?` - non-greedy - https://javascript.info/regexp-methods#str-matchall-regexp

`match()` works only with strings, but `test()` works also with integers. I'd recommend explicitly converting your number to a string if you want to use it with a regex (String(123) for example

match does things like to return a list of all matching sub-strings, while test only checks if there are any.

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match
- https://javascript.info/regexp-methods#str-matchall-regexp
  - https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search

## to create regex from concatenating string use double backspace to escape

```javascript
const regex = new RegExp(
  `^[+-]?(?:\\p{Number}+(?:\\${decimal}(?:\\p{Number}+)?)?)?$`,
  "u",
);
```

- https://stackoverflow.com/questions/12004808/does-javascript-take-local-decimal-separators-into-account/42213804#42213804

## Visualizer

- https://regex101.com/r/V2CEUa/1/
- https://rubular.com/r/OzgfopgyytWQHq
- https://www.debuggex.com/r/v-rDrUU9uCw1Q4zu
- https://jex.im/regulex/#!flags=&re=%5E(%5B%2B-%5D%3F(%3F%3ANaN%7CInfinity%7C0(%3F%3A%5BbB%5D%5B01%5D(%3F%3A_%3F%5B01%5D%2B)*%7C%5BoO%5D%3F%5B0-7%5D(%3F%3A_%3F%5B0-7%5D%2B)*%7C%5BxX%5D%5B0-9a-fA-F%5D(%3F%3A_%3F%5B0-9a-fA-F%5D%2B)*)%7C(%3F%3A(%3F%3A0%7C0(%3F%3A%5B0-9%5D(%3F%3A_%3F%5B0-9%5D%2B)*)%3F%5B89%5D(%3F%3A%5B0-9%5D(%3F%3A_%3F%5B0-9%5D%2B)*)%3F%7C%5B1-9%5D(%3F%3A_%3F%5B0-9%5D%2B)*)(%3F%3A%5C.(%3F%3A%5B0-9%5D(%3F%3A_%3F%5B0-9%5D%2B)*)%3F)%3F%7C%5C.%5B0-9%5D(%3F%3A_%3F%5B0-9%5D%2B)*)(%3F%3A%5BeE%5D%5B%2B-%5D%3F%5B0-9%5D(%3F%3A_%3F%5B0-9%5D%2B)*)%3F)%7C-%3F(%3F%3A0(%3F%3A%5BbB%5D%5B01%5D(%3F%3A_%3F%5B01%5D%2B)*%7C%5BoO%5D%5B0-7%5D(%3F%3A_%3F%5B0-7%5D%2B)*%7C%5BxX%5D%5B0-9a-fA-F%5D(%3F%3A_%3F%5B0-9a-fA-F%5D%2B)*)%3F%7C%5B1-9%5D(%3F%3A_%3F%5B0-9%5D%2B)*)n)%24
- https://regexper.com/#%2F%5E%28%5B%2B-%5D%3F%28%3F%3ANaN%7CInfinity%7C0%28%3F%3A%5BbB%5D%5B01%5D%28%3F%3A_%3F%5B01%5D%2B%29*%7C%5BoO%5D%3F%5B0-7%5D%28%3F%3A_%3F%5B0-7%5D%2B%29*%7C%5BxX%5D%5B0-9a-fA-F%5D%28%3F%3A_%3F%5B0-9a-fA-F%5D%2B%29*%29%7C%28%3F%3A%28%3F%3A0%7C0%28%3F%3A%5B0-9%5D%28%3F%3A_%3F%5B0-9%5D%2B%29*%29%3F%5B89%5D%28%3F%3A%5B0-9%5D%28%3F%3A_%3F%5B0-9%5D%2B%29*%29%3F%7C%5B1-9%5D%28%3F%3A_%3F%5B0-9%5D%2B%29*%29%28%3F%3A%5C.%28%3F%3A%5B0-9%5D%28%3F%3A_%3F%5B0-9%5D%2B%29*%29%3F%29%3F%7C%5C.%5B0-9%5D%28%3F%3A_%3F%5B0-9%5D%2B%29*%29%28%3F%3A%5BeE%5D%5B%2B-%5D%3F%5B0-9%5D%28%3F%3A_%3F%5B0-9%5D%2B%29*%29%3F%29%7C-%3F%28%3F%3A0%28%3F%3A%5BbB%5D%5B01%5D%28%3F%3A_%3F%5B01%5D%2B%29*%7C%5BoO%5D%5B0-7%5D%28%3F%3A_%3F%5B0-7%5D%2B%29*%7C%5BxX%5D%5B0-9a-fA-F%5D%28%3F%3A_%3F%5B0-9a-fA-F%5D%2B%29*%29%3F%7C%5B1-9%5D%28%3F%3A_%3F%5B0-9%5D%2B%29*%29n%29%24%2F
- https://piebridge.me/regulex/#!flags=&re=%5E(a%7Cb)*%3F%24
- https://johannesvollmer.com/regex-nodes/?
- https://regex-vis.com/
- https://27t.github.io/regex-visualizer/

## global (g) flag and `^pattern$` seems incompatible

## non-capturing group

`(?:\d)`

- https://stackoverflow.com/questions/10256061/regular-expression-for-finding-decimal-float-numbers/66847280#66847280

## non-greedy

```javascript
'a "witch" and her "broom" is one'.match(/"[^"]+"/g)
```

- https://javascript.info/regexp-greedy-and-lazy

## lookahead and lookbehind

`(?=...)`, `(?!...)` lookahead

`(?<=...)`, `(?<!...)` lookbehind

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion
- https://stackoverflow.com/questions/8078739/regex-lookahead-and-lookbehind-checking-a-dot-for-use-as-decimal-vs-full-s
- https://stackoverflow.com/questions/60814782/regex-match-an-entire-number-with-lookbehind-and-look-ahead-logicwithout-word-b

## \p{Number} for non-arabic numerals

Needs flag `u` or upgraded `v` flag.

```javascript
const regex = new RegExp(
  `^[+-]?(?:\\p{Number}+(?:\\${decimal}(?:\\p{Number}+)?)?)?$`,
  "u",
);
```

- https://stackoverflow.com/questions/12004808/does-javascript-take-local-decimal-separators-into-account/42213804#42213804
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape
- https://stackoverflow.com/questions/34849097/preg-match-to-regex-equivalent-expression-to-match-any-unicode-letters
- `v` flag https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Regular_expressions
