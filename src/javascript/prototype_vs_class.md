```javascript
function MyObject(name, message) {
  this.name = name.toString();
  this.message = message.toString();
}
;(function() {
  this.getName = function() {
    return this.name;
  };
  this.getMessage = function() {
    return this.message;
  };
}).call(MyObject.prototype);
```

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures

```javascript
function Person(name) {
  this.name = name;
}
Person.prototype.describe = function () {
  return 'Person called ' + this.name;
};
```
