```javascript
const raw = {
  item1: { prop: "1" },
  item2: { prop: "2" },
  item3: { prop: "3" },
};

const allowed = ["item1", "item3"];

const filtered = Object.fromEntries(
  Object.entries(raw).filter(([key, val]) => allowed.includes(key))
);
```

- https://stackoverflow.com/questions/38750705/filter-object-properties-by-key-in-es6/56081419#56081419
