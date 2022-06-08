```
var x =                                                [-3.5, -2.9, -1.1, 1.1, 2.9, 3.5];
var f = x.map(Math.floor); // towards -infinity:       [  -4,   -3,   -2,   1,   2,   3]
var c = x.map(Math.ceil);  // towards +infinity:       [  -3,   -2,   -1,   2,   3,   4]
var r = x.map(Math.round); // towards nearest integer: [  -4,   -3,   -1,   1,   3,   4]
```

- https://blogs.sas.com/content/iml/2011/10/03/rounding-up-rounding-down.html
- https://stackoverflow.com/questions/9724960/whats-the-difference-between-the-pair-of-functions-floor-ceil-and-min-max
