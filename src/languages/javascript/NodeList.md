## Array.from(nodeList, callback)

`Array.from(nodeList).forEach(callback)`

However, you are not optimising the use of `Array.from` here, because you first create the whole array, and then iterate over it with `forEach`.

Instead use the second argument of `Array.from`:

`Array.from(nodeList, callback)`

Now the whole operation happens in one iteration.

https://stackoverflow.com/questions/43449971/loop-through-nodelist-array-prototype-foreach-call-vs-array-from-foreach/43450279#43450279

## Only this worked

```javascript
var elements = document.getElementsByClassName("bgflag");
BgFlags = Array.prototype.map.call(elements, (element) => ({
  height: element.offsetTop,
  bgsrc: element.dataset.bgsrc,
  bgcolor: element.dataset.bgcolor,
  size: element.dataset.size,
  name: element.id,
  image: parseInt(element.dataset.image),
}));
```

- https://chuckdries.medium.com/traversing-the-dom-with-filter-map-and-arrow-functions-1417d326d2bc

## Use map, find, filter, reduce, for..of

```javascript
["map", "find", "filter", "reduce"].forEach(
  (f) => (NodeList.prototype[f] = Array.prototype[f])
);
// this is for for..of, cannot be above 'map', 'filter' etc.
NodeList.prototype[Symbol.iterator] = Array.prototype[Symbol.iterator];
document.querySelectorAll("span").map((el) => console.log(el));
document
  .querySelectorAll("span")
  .filter((el) => el.className === "fc-black-500")
  .reduce((acc, el) => ((acc += el.className), acc), "");
for (let p of document.querySelectorAll("p")) {
  console.log(p);
}
```

- https://news.ycombinator.com/item?id=26320343
- https://stackoverflow.com/questions/30836289/for-of-loop-queryselectorall

## Convert NodeList to Array

`Array.prototype.slice.call(document.childNodes)`

http://stackoverflow.com/questions/3199588/fastest-way-to-convert-javascript-nodelist-to-array
