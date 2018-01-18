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

http://country-code.ghost.io/rxjs-scan-vs-reduce/