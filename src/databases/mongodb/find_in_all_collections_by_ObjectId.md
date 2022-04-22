```bash
% mongosh portal
portal> db.getCollectionNames().forEach(function (collName) { var doc = db.getCollection(collName).findOne({ "_id": ObjectId("62545c6f1ed0cadcc04f6f0a") }); if (doc != null) print(doc._id + " was found in " + collName); });
62545c6f1ed0cadcc04f6f0a was found in users
```

https://stackoverflow.com/questions/42656541/mongodb-find-an-object-by-its-id-without-knowing-the-collection/45425585#45425585
