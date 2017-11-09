Co wypisze taki kod?

```javascript
for (var i = 0; i < 5; i++) {
  setTimeout(function(){
    console.log(i)
  }, i*100)
}
```

(wypisze 5z5 co 100 milisekund) - dobrze odpowiedział

Jak to zmienić by wypisało 0,1,2,3,4 co 100ms? (let, iife)

##

This has to do with how scoping and hoisting is being treated in JavaScript.

What happens in your code is that the JS engine modifies your code to this:

```javascript
var count;

for (count = 0; count < 3; count++) {
    setTimeout(function() {
        alert("Count = " + count);
    }, 1000 * count);
}
```

And when `setTimeout()` is being run it will first look in it's own scope after count but it won't find it so then it'll start looking in the functions that closes (this is called closures) over the `setTimeout` function until it finds the var count statement, which will have the value 3 since loop will have finished before the first timeout function has been executed.

- https://stackoverflow.com/questions/19221690/settimeout-with-loop-in-javascript

## Solutions

let:

```javascript
for (let i = 0; i < 5; i++) {
  setTimeout(function(){
    console.log(i)
  }, i*100)
}
```

```javascript
for (let i = 0; i < 5; i++) {
  let j = i;
  setTimeout(function(){
    console.log(j)
  }, j*100)
}
```

IIFE:

```javascript
for (var i = 0; i < 5; i++) {
  (function(i) {
	setTimeout(function(){
        console.log(i);
      }, i*100);
  })(i);
}
```

bind

```javascript
for (var i = 0; i < 5; i++) {
  setTimeout(function(i){
    console.log(i)
  }.bind(null i), i*100);
}
```

third parameter

```javascript
for (var i = 0; i < 5; i++) {
  setTimeout(function(i){
    console.log(i)
  }, i*100, i);
}
```