```javascript
JSON.stringify(
  db
    .getCollection("users")
    .find({})
    .map((obj) => {
      Object.keys(obj).forEach((key) => {
        if (Object.prototype.toString.call(obj[key]) === "[object Date]")
          obj[key] = obj[key].toISOString();
        else if (
          Object.prototype.toString.call(obj[key]) === "[object ObjectId]"
        )
          obj[key] = obj[key].str;
      });
      return obj;
    }),
  null,
  2
);
```

```javascript
db.system.js.insertOne({
  _id: "toProperJSON",
  value: function (cursor) {
    JSON.stringify(
      cursor.map((obj) => {
        Object.keys(obj).forEach((key) => {
          if (Object.prototype.toString.call(obj[key]) === "[object Date]")
            obj[key] = obj[key].toISOString();
          else if (
            Object.prototype.toString.call(obj[key]) === "[object ObjectId]"
          )
            obj[key] = obj[key].str;
        });
        return obj;
      }),
      null,
      2
    );
  },
});
```

save/update function in mongodb (function available after restarting robo3t):

```javascript
db.system.js.save({
  _id: "toProperJSON",
  value: function (cursor) {
    return JSON.stringify(
      cursor.map((obj) => {
        Object.keys(obj).forEach((key) => {
          if (Object.prototype.toString.call(obj[key]) === "[object Date]")
            obj[key] = obj[key].toISOString();
          else if (
            Object.prototype.toString.call(obj[key]) === "[object ObjectId]"
          )
            obj[key] = obj[key].str;
        });
        return obj;
      }),
      null,
      2
    );
  },
});
```

and use it:

```javascript
db.loadServerScripts();
toProperJSON(db.getCollection("users").find({}));
```

to remove function

```javascript
db.system.js.remove({ _id: "toProperJSON" });
```

- https://stackoverflow.com/questions/28733692/how-to-export-json-from-mongodb-using-robomongo/38784785#38784785
- https://stackoverflow.com/questions/16478552/convert-objectid-mongodb-to-string-in-javascript/19770048#19770048
- https://stackoverflow.com/questions/12620328/how-can-i-know-in-mongodb-if-a-field-is-a-date-type/12670654#12670654
- https://stackoverflow.com/questions/11486779/formatting-isodate-from-mongodb/11488088#11488088
- https://www.mongodb.com/docs/manual/reference/method/cursor.map/
- https://stackoverflow.com/questions/9952649/convert-mongoose-docs-to-json/14129972#14129972
- https://stackoverflow.com/questions/46419071/in-robo3t-how-to-add-a-custom-function/46419439#46419439
