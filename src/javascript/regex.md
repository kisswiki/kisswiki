```javascript
const getPrefixBad = (fileName) => {
  let match = null;
  // WTF: always the same result
  match = filename.match(/^.* - (.*)\.csv$/);
  return match[1];
};
```
