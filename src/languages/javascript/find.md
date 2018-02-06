- Support: IE - not, Edge >= 12 https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find
- http://stackoverflow.com/questions/24183104/can-someone-explain-this-array-prototype-find-polyfill
- http://stackoverflow.com/questions/10457264/how-to-find-first-element-of-array-matching-a-boolean-condition-in-javascript
- https://github.com/paulmillr/Array.prototype.find
- https://github.com/jsPolyfill/Array.prototype.find
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some

## findIn

> I heard it was bad practice to put a polyfill on Array.prototype.
> I have used Array.prototype.find() and I'm running into problems on ios9 mobile
> - http://stackoverflow.com/questions/35097307/how-to-write-a-polyfill-for-array-prototype-find-as-a-custom-method

```javascript
function findIn(array, predicate) {
  if (array === null) {
    throw new TypeError('findIn called on null or undefined');
  }
  if (typeof predicate !== 'function') {
    throw new TypeError('predicate must be a function');
  }
  var list = Object(array);
  var length = list.length >>> 0;
  var thisArg = arguments[2];
  var value;

  for (var i = 0; i < length; i++) {
    value = list[i];
    if (predicate.call(thisArg, value, i, list)) {
      return value;
    }
  }
  return undefined;
}
```
