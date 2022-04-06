```javascript
var cursor = db.getCollection("users").aggregate([
  {
    $lookup: {
      from: "publicshares",
      localField: "_id",
      foreignField: "author",
      as: "publicshares",
    },
  },
  {
    $addFields: {
      createdDrawings2: { $size: "$publicshares" },
    },
  },
  { $match: { createdDrawings2: { $gt: 1 } } },
  {
    $project: {
      email: 1,
      createdDrawings: 1,
      createdDrawings2: 1,
    },
  },
]);
while (cursor.hasNext()) {
  print(tojson(cursor.next()), ",");
}
```

- https://stackoverflow.com/questions/28733692/how-to-export-json-from-mongodb-using-robomongo/38784785#38784785
