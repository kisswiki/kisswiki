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
