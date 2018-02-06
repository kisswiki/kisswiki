## Range

- `var arr = ((a,b)=>{while(a--)b[a]=a+1;return b})(10,[]); // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` http://stackoverflow.com/a/16901629/588759http://stackoverflow.com/questions/3746725/create-a-javascript-array-containing-1-n/16901629#16901629
- `var arr = []...Array(10).keys()].map(n=>n+1) // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` http://stackoverflow.com/questions/3746725/create-a-javascript-array-containing-1-n/16901629#comment56780302_33352604

## Find the number of occurrences a given value has in an array

reduce is more appropriate here than filter as it doesn't build a temporary array just for counting.

```javascript
var dataset = [2,2,4,2,6,4,7,8];
var search = 2;
var count = dataset.reduce(function(n, val) {
    return n + (val === search);
}, 0);
```

http://stackoverflow.com/questions/17313268/find-the-number-of-occurrences-a-given-value-has-in-an-array
