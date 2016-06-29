> x instanceof Object is true
> - http://stackoverflow.com/questions/1978049/what-values-can-a-constructor-return-to-avoid-returning-this#comment32167463_1978474

```javascript
function a() {
  return {
    a: 1,
    b: 2
  }
}
```

> returning this is not necessary, but it is valid. If the returned value is an object, new will return that object instead of the newly created object.
> - http://stackoverflow.com/questions/7064673/is-return-from-constructor-necessary-when-creating-object-with-new
