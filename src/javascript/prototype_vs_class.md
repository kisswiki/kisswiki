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

function Employee(name, title) {
  Person.call(this.name);
  this.title = title;
}
Employee.prototype = Object.create(Person.prototype);
Employee.prototype.constructor = Employee;
Employee.prototype.describe = function () {
  return Person.prototype.describe.call(this) + ' (' + this.title + ')';
};
```
