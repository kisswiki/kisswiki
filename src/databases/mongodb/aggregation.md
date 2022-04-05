```javascript
db.getCollection("users").aggregate([
  {
    $lookup: {
      from: "participation",
      localField: "_id",
      foreignField: "user",
      as: "participation",
    },
  },
  {
    $addFields: {
      drawings: { $size: "$participation" },
    },
  },
  { $match: { drawings: { $gt: 1 } } },
  {
    $project: {
      settings: 0,
      participation: 0,
    },
  },
]);
```

- https://stackoverflow.com/questions/47627701/count-of-lookup-result-mongodb/67279238#67279238
- https://stackoverflow.com/questions/57466761/is-there-a-way-to-remove-a-field-during-a-mongo-aggregation/57466910#57466910
- https://stackoverflow.com/questions/7811163/query-for-documents-where-array-size-is-greater-than-1/32429310#32429310
- https://stackoverflow.com/questions/20348093/mongodb-aggregation-how-to-get-total-records-count
