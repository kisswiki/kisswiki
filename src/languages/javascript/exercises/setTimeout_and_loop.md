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

## Explanation 1

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

## Explanation 2

1. The variable i in the for loop initializer is *global* in scope
2. Our callbacks passed to setTimeout() reference this global i
3. Because our callbacks are async, the loop completes before any are executed.

Due to the above, when the callbacks do execute, the for loop has already incremented the global variable i to hold the value 5; and we get it repeated in our output since each of the callbacks references the same global i.

- http://www.datchley.name/loop-variable-gotcha/

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

another function:

```javascript
function doTimer(i) {
  setTimeout(function(){
    console.log(i)
  }, i*100); 
}
for (let i = 0; i < 5; i++) {
  doTimer(i);
}
```

- https://stackoverflow.com/questions/6425062/passing-functions-to-settimeout-in-a-loop-always-the-last-value

forEach:

callback passed to forEach creates a closure around the values in the list via the declared arguments. For instance:

```javascript
[0,1,2,3,4].forEach(function(n) {
  setTimeout(function(){ console.log(n); }, n * 1000);
});
```

- http://www.datchley.name/loop-variable-gotcha/