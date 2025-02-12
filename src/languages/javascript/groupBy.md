```javascript
var people = [
  { name: "Kyle", age: 28 },
  { name: "Sally", age: 45 },
  { name: "John", age: 43 },
  { name: "Sally", age: 28 },
];

var g = people.reduce((group, person) => {
  if (group[person.name] == null) {
    group[person.name] = [];
  }
  group[person.name].push(person);
  return group;
}, {});
console.log(g);

var g2 = people.reduce((group, person) => {
  (group[person.name] ??= []).push(person);
  return group;
}, {});
console.log(g2);

var g3 = { ...Object.groupBy(people, ({name}) => name) };
console.log(g3);

var g4 = {
  ...Object.groupBy(people, (person) => (person.age > 30 ? "old" : "young")),
};
console.log(g4);
```

- <https://www.youtube.com/shorts/L6btUQ8mDZo>
- <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/groupBy>
- <https://stackoverflow.com/questions/14446511/most-efficient-method-to-groupby-on-an-array-of-objects>
