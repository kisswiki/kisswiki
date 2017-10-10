```javascript
const getPrefix = (fileName) => {
  let match = null;
  match = filename.match(/^.* - (.*)\.csv$/);
  return match[1];
};
```
