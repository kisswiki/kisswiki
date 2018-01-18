```javascript
var obsScan = Observable.from([1,2,3,4,5,6]);
var count1 = obsScan.scan((acc, one) => acc + one, 0);
count1.subscribe(x => {
    console.log('scan shows incremental total', x);
});

var obsReduce = Observable.from([1,2,3,4,5,6]);
var count2 = obsReduce.reduce((acc, one) => acc + one, 0);
count2.subscribe(x => {
    console.log('reduce shows only total', x);
});
```

Output:

```
scan shows incremental total 1
scan shows incremental total 3
scan shows incremental total 6
scan shows incremental total 10
scan shows incremental total 15
scan shows incremental total 21
reduce shows only total 21
```

http://country-code.ghost.io/rxjs-scan-vs-reduce/