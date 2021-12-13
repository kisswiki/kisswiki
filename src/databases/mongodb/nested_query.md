If nested query returns first object in collection using mongoose, find out what query was executed using `profiling.md`.

Workaround for `findOne` is to use `$elemMatch`:

```
db.Collection.findOne({'a.c': {$elemMatch: {e: '5c35f1045643180d9488112f'}}});
```

https://stackoverflow.com/questions/62282626/how-to-use-elemmatch-under-nested-structure-mongodb/62286299#62286299

for `updateOne` use `$set`:

```
DBUser.updateOne({ _id: user._id }, [
    { $set: { [`oauth.${profile.provider}`]: profile } },
]);
```
