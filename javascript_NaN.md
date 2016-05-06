if(value !== value) console.log('is NaN')

```javascript
//Polyfill from MDN
Number.isNaN = Number.isNaN || function(value) {
    return typeof value === "number" && isNaN(value);
}
```

http://stackoverflow.com/questions/2652319/how-do-you-check-that-a-number-is-nan-in-javascript/32137779#32137779
