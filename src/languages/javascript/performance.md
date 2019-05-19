Javascript map reduce (node.js) 10,000ms

```javascript
    var sum = values.map(x => x*x).
                 reduce( (total,num,index,array) => total+num,0.0);
```

Javascript reduce (node.js) 800 and then 300 milliseconds

```javascript
var sum = values.reduce( (total,num,index,array) => total+num*num,0.0)
```

Javascript imperative (node.js) 37 milliseconds

```javascript
    var sum = 0.0;
    for (var i = 0; i < values.length;i++){
        var x = values[i];
        sum += x*x;
    }
```

https://jackmott.github.io/programming/2016/07/22/making-obvious-fast.html

via https://news.ycombinator.com/item?id=19947508


Jak ktoś lubi programowanie funkcyjne i zależy mu na tym żeby urwać te milisekundy to tutaj jest implementacja tych funkcji która działa szybciej bo pomija sprawdzanie: https://github.com/codemix/fast.js

https://www.facebook.com/groups/257881290932879/2214004415320547/
