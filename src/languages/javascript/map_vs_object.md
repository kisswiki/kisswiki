
```typescript
const test = new Map<string, string>();

items.forEach(current => {
  const { name } = current;

  test.set(name, current);
});
```

- Passing an array to Map constructor turned out to be less performant than using Map.set in a loop, at least on this test: https://jsbench.me/6gkawrdlys/1 https://stackoverflow.com/questions/26264956/convert-object-array-to-hash-map-indexed-by-an-attribute-value-of-the-object#comment109897075_38622270

- A key in the Map may only occur once
- Key equality: uses SameValueZero algorithm, `-0 == 0`, `NaN == Nan`, other values use `===`.
- user-provided key-value pairs on an Object may allow an attacker to override the object's prototype, which can lead to object injection attacks
- Map's key can be any value including functions, objects, or any primitive.
- iterate with `for(const [key, value] of map)` vs iterate over `Object.keys()` or `Object.entries()`.
- methods `set` and `del`
- `map.size()` vs `Object.keys(obj).length)`
- Performs better in scenarios involving frequent additions and removals of key-value pairs.
- No native support for serialization or parsing

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map
