## Format date

`new Date().toLocaleString('de-DE', {year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit'}) //  09.05.2016, 17:01:34`

- http://stackoverflow.com/questions/3552461/how-to-format-a-javascript-date
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleString

```
var today = new Date();
var formattedToday = today.toLocaleDateString() + today.toLocaleTimeString();
```

http://stackoverflow.com/questions/3552461/how-to-format-a-javascript-date/35303057#35303057

## Date to unix timestamp

`var unix timestamp = Math.floor(Date.now() / 1000)`

- http://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
- http://stackoverflow.com/questions/9756120/how-do-i-get-a-utc-timestamp-in-javascript

## unix timestamp to Date

`var date = new Date(unix timestamp * 1000)`
