
```javascript
function obj2params(obj) {
  return Object.keys(obj).reduce(function(a, k) {
    if(typeof obj[k] !== 'undefined' && obj[k] !== null) {
      a.push(encodeURIComponent(k) + '=' + encodeURIComponent(obj[k]));
    }
    return a;
  }, []).join('&')
```
