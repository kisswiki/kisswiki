```javascript
var cursor = db.getCollection("users").find({});
while (cursor.hasNext()) {
  let obj = cursor.next();
  Object.keys(obj).forEach((key) => {
    if (Object.prototype.toString.call(obj[key]) === "[object Date]")
      obj[key] = obj[key].toISOString();
    else if (Object.prototype.toString.call(obj[key]) === "[object ObjectId]")
      obj[key] = obj[key].str;
  });
  print(tojson(obj), ",");
}
```

- https://stackoverflow.com/questions/28733692/how-to-export-json-from-mongodb-using-robomongo/38784785#38784785
- https://stackoverflow.com/questions/16478552/convert-objectid-mongodb-to-string-in-javascript/19770048#19770048
- https://stackoverflow.com/questions/12620328/how-can-i-know-in-mongodb-if-a-field-is-a-date-type/12670654#12670654
- https://stackoverflow.com/questions/11486779/formatting-isodate-from-mongodb/11488088#11488088
