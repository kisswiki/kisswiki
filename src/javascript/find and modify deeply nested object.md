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

Or better this to have greater control:

```javascript
function normalizeObjForValidation(object) {
  const datetimeISORe = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}).(\d{3})Z$/;
  Object.keys(object).map(key => {
    let value = object[key];
    if (value === null) {
      object[key] = null;
    }
    else if (typeof value === 'string' && value.trim() === '') {
      object[key] = null;
    }
    else if (value.constructor === Array && value.length === 1 && (value[0] === '' || value[0] === null)) {
      object[key] = [];
    }
    else if (typeof value === 'string' && datetimeISORe.test(value)) {
      var parts = value.match(datetimeISORe)
      const date = `${parts[3]}/${parts[2]}/${parts[1]}`;
      object[key] = date;
    }
    else if(Object.keys(value).length > 0 && value.constructor === Object) {
      normalizeObjForValidation(value);
    }
    else {
      object[key] = value;
    }
  });
}
let dealData = JSON.parse(JSON.stringify(state));
normalizeObjForValidation(dealData);
```

WTF. It doesn't work ^^^. https://stackoverflow.com/questions/122102/what-is-the-most-efficient-way-to-deep-clone-an-object-in-javascript/4591639#4591639

`JSON.parse(JSON.stringify(state))` somehow keeps handle to value. Use this:

```javascript
function normalizeObjForValidation(object) {
  Object.keys(object).map(key => {
    let value = object[key];
    if (value === null) {
      object[key] = null;
    }
    else if (typeof value === 'string' && value.trim() === '') {
      object[key] = null;
    }
    else if (value.constructor === Array && value.length === 1 && (value[0] === '' || value[0] === null)) {
      object[key] = [];
    }
    else if (moment.isMoment(value)) {
      object[key] = value.format('DD/MM/YYYY');
    }
    else if(Object.keys(value).length > 0 && value.constructor === Object) {
      normalizeObjForValidation(value);
    }
    else {
      object[key] = value;
    }
  });
}
```

https://stackoverflow.com/questions/25569255/find-and-modify-deeply-nested-object-in-javascript-array/25569720#25569720
