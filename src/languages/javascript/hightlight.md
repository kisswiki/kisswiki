for console:

```javascript
var label = 'Anglia i coś';
var value = 'a';
var getHighlighted = (label, value) => {
  if (!value) return [];
  var regExp = new RegExp(`(${value})`, 'i');
  var tokens = label.split(regExp).filter(item => item);
  return tokens.map(token => ({ value: token, hightlight: !!token.match(regExp) }));
}
getHighlighted(label, value).map(item => item.hightlight ? `<b>${item.value}</b>` : `<span>${item.value}</span>`);
```

```jsx
import React from 'react';

export const getHighlightedTokens = (label, value) => {
  if (!value) return [];
  const regExp = new RegExp(`(${value})`, 'i');
  // filter needed to remove first empty element
  const tokens = label.split(regExp).filter(item => item);
  return tokens.map(token => ({ value: token, hightlight: !!token.match(regExp) }));
};

export const getHighlighted = (label, value) => {
  const tokens = getHighlightedTokens(label, value);
  if (!tokens.length) return label;
  return tokens.map((item, index) => (item.hightlight
    ? <b key={index}>{item.value}</b> // eslint-disable-line react/no-array-index-key
    : <span key={index}>{item.value}</span> // eslint-disable-line react/no-array-index-key
  ));
};
```
