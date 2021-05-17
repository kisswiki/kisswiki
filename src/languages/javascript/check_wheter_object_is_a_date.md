```javascript
function isValidDate(date) {
  return (
    date &&
    Object.prototype.toString.call(date) === "[object Date]" &&
    !isNaN(date)
  );
}
```

https://stackoverflow.com/questions/643782/how-to-check-whether-an-object-is-a-date/44198641#44198641
