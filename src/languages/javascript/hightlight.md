```javascript
var label = 'Anglia i coś';
var value = 'a';
const getHighlighted = (label, value) => {
  var regExp = new RegExp(`(${value})`, 'i');
  var tokens = label.split(regExp).filter(item => item);
  return tokens.map(token => ({ value: token, hightlight: !!token.match(regExp) }));
}
const result = getHighlighted(label, value).map(item => item.hightlight ? `<b>${item.value}</b>` : `<span>${item.value}</span>`);
```