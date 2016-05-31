
```javascript
function obj2params(obj) {
  return Object.keys(obj).reduce(function(a, k) {
    if(typeof obj[k] !== 'undefined' && obj[k] !== null) {
      a.push(encodeURIComponent(k) + '=' + encodeURIComponent(obj[k]));
    }
    return a;
  }, []).join('&')
```

http://stackoverflow.com/questions/3308846/serialize-object-to-query-string-in-javascript-jquery/30707423#30707423
