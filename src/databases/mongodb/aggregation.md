```javascript
db.getCollection("users").aggregate([
  { $match: { email: "rofrol@gmail.com" } },
  {
    $lookup: {
      from: "participation",
      localField: "_id",
      foreignField: "user",
      as: "participation",
    },
  },
  {
    $project: {
      settings: 0,
    },
  },
  { $limit: 5 },
]);
```

- https://stackoverflow.com/questions/47627701/count-of-lookup-result-mongodb/67279238#67279238
- https://stackoverflow.com/questions/57466761/is-there-a-way-to-remove-a-field-during-a-mongo-aggregation/57466910#57466910
- https://stackoverflow.com/questions/20348093/mongodb-aggregation-how-to-get-total-records-count
