## Use map, find, filter, reduce, for..of

```javascript
['map', 'find', 'filter', 'reduce'].forEach(f => NodeList.prototype[f] = Array.prototype[f])
// this is for for..of, cannot be above 'map', 'filter' etc.
NodeList.prototype[Symbol.iterator] = Array.prototype[Symbol.iterator]
document.querySelectorAll('span').map(el => console.log(el))
document.querySelectorAll('span').filter(el => el.className === 'fc-black-500').reduce((acc, el) => (acc += el.className, acc), '')
for(let p of document.querySelectorAll('p')) { console.log(p) }
```

- https://news.ycombinator.com/item?id=26320343
- https://stackoverflow.com/questions/30836289/for-of-loop-queryselectorall

## Convert NodeList to Array

`Array.prototype.slice.call(document.childNodes)`

http://stackoverflow.com/questions/3199588/fastest-way-to-convert-javascript-nodelist-to-array
