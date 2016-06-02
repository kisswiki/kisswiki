## Format date

`new Date().toLocaleString('de-DE', {hour12: false, year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit'}) //  09.05.2016, 17:01:34`

- default locale for user, use []:

`new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: false})`

- get only month

`new Date().toLocaleString([], {month: '2-digit'});`


- http://stackoverflow.com/questions/3552461/how-to-format-a-javascript-date
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleString
- http://stackoverflow.com/questions/17913681/how-do-i-use-tolocaletimestring-without-displaying-seconds#comment50460422_20430558

```
var today = new Date();
var formattedToday = today.toLocaleDateString() + today.toLocaleTimeString();
```

http://stackoverflow.com/questions/3552461/how-to-format-a-javascript-date/35303057#35303057

## Date to unix timestamp

`var unix timestamp = Math.floor(Date.now() / 1000)`

- http://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
- http://stackoverflow.com/questions/9756120/how-do-i-get-a-utc-timestamp-in-javascript

## Unix timestamp to Date

`var date = new Date(unix timestamp * 1000)`

http://stackoverflow.com/questions/847185/convert-a-unix-timestamp-to-time-in-javascript

## Number of days between dates

```javascript
function treatAsUTC(date) {
    var result = new Date(date);
    result.setMinutes(result.getMinutes() - result.getTimezoneOffset());
    return result;
}

function daysBetween(startDate, endDate) {
    var millisecondsPerDay = 24 * 60 * 60 * 1000;
    return (treatAsUTC(endDate) - treatAsUTC(startDate)) / millisecondsPerDay;
}
```

http://stackoverflow.com/questions/542938/how-do-i-get-the-number-of-days-between-two-dates-in-javascript/11252167

## ISO year

`new Date().toISOString().split('T')[0]`

http://stackoverflow.com/questions/3552461/how-to-format-a-javascript-date#comment62675778_11172083
