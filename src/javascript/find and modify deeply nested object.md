```javascript
JSON.parse(JSON.stringify(obj, function(key, value) {
    if (typeof value === 'object' && value !== null && value.id === id) {
    return transform(value);
    } else {
    return value;
    }
}));
```

https://stackoverflow.com/questions/25569255/find-and-modify-deeply-nested-object-in-javascript-array/25569720#25569720
