```javascript
JSON.parse(JSON.stringify(obj, function(key, value) {
    if (typeof value === 'object' && value !== null && value.id === id) {
    return transform(value);
    } else {
    return value;
    }
}));
```

WARNING: When running moment, I needed to return in template string or it was silently crashing:

```javascript
function normalizeObjForValidation(object) {
  return JSON.parse(JSON.stringify(object, function(key, value) {
    if (value === null) {
      return value;
    }
    else if (typeof value === 'string' && value.trim() === '') {
      return null;
    }
    else if (value.constructor === Array && value.length === 1 && value[0] === '') {
      return [];
    }
    else if (typeof value === 'string' &&
      /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z$/.test(value)) {
      return `${moment(value).format('DD/MM/YYYY')}`;
    }
    else {
      return value;
    }
  }));
}
```

https://stackoverflow.com/questions/25569255/find-and-modify-deeply-nested-object-in-javascript-array/25569720#25569720
