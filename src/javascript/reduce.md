- http://www.globalnerdy.com/2016/06/26/demonstrating-map-filter-and-reduce-in-swift-using-food-emoji/

## For composing

```javascript
let double = number => number * 2;  
let triple = number => number * 3;  
let quadruple = number => number * 4;  
let compose = (...funcs) => (value) => funcs.reduce((v,fn) => fn(v), value);

// Arguments are read right to left
// double -> triple -> quadruple
let crunchNumber = compose(  
    double,
    triple,
    quadruple
);

let number = crunchNumber(5);

console.log(number);
```

https://blog.jacob.uk.com/functional-composition-in-javascript/
