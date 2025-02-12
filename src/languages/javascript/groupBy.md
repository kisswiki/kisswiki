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

var g3 = { ...Object.groupBy(people, (person) => person.name) };
console.log(g3);

var g4 = {
  ...Object.groupBy(people, (person) => (person.age > 30 ? "old" : "young")),
};
console.log(g4);
```

<https://www.youtube.com/shorts/L6btUQ8mDZo>
