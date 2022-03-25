# Date

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date
- http://kangax.github.io/compat-table/es5/#test-Date_methods
- https://github.com/date-fns/date-fns

## Format date

`new Date().toLocaleString('de-DE', {hour12: false, year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit'}) // 09.05.2016, 17:01:34`

- http://stackoverflow.com/questions/3552461/how-to-format-a-javascript-date
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleString

- default locale for user, use []:

`new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: false})`

http://stackoverflow.com/questions/17913681/how-do-i-use-tolocaletimestring-without-displaying-seconds#comment50460422_20430558

- get only month

`new Date().toLocaleString([], {month: '2-digit'});`

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

- http://stackoverflow.com/questions/3552461/how-to-format-a-javascript-date#comment62675778_11172083

But what if browser doesn't return timezone?

`new Intl.DateTimeFormat('en-ca-iso8601').format(date) // "2012-12-20"`

- http://stackoverflow.com/questions/6348431/best-way-to-remove-edt-from-a-date-returned-via-javascript-with-tolocalestring
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
- http://stackoverflow.com/questions/2573521/how-do-i-output-an-iso-8601-formatted-string-in-javascript

## Add number of days to today's date

```javascript
var someDate = new Date();
var numberOfDaysToAdd = 6;
someDate.setDate(someDate.getDate() + numberOfDaysToAdd);
```

http://stackoverflow.com/questions/3818193/how-to-add-number-of-days-to-todays-date

## get age

```javascript
/**
 * Calculates the age of person
 *
 * @param date of birthday in the format dd.mm.YYYY e.g. 20.04.2001
 * @returns {number} number of full years - age
 */
function getAge(date) {
  return yearsDiff(parseDate(date), new Date());
}

// http://stackoverflow.com/questions/2587345/why-does-date-parse-give-incorrect-results/2587398#2587398
function parseDate(input) {
  var parts = input.split(".");
  return new Date(parts[2], parts[1] - 1, parts[0]);
}

// http://stackoverflow.com/questions/4060004/calculate-age-in-javascript/7091965#7091965
function yearsDiff(eariler, later) {
  var age = later.getFullYear() - eariler.getFullYear();
  var m = later.getMonth() - eariler.getMonth();
  if (m < 0 || (m === 0 && later.getDate() < eariler.getDate())) {
    age--;
  }
  return age;
}

// http://stackoverflow.com/questions/15313418/javascript-assert/15313435#15313435
function assert(condition, message) {
  if (!condition) {
    message = message || "Assertion failed";
    if (typeof Error !== "undefined") {
      throw new Error(message);
    }
    throw message; // Fallback
  }
}

function test() {
  assert(
    19 === yearsDiff(parseDate("22.05.1997"), parseDate("22.06.2016")),
    "yearsDiff should return 19"
  );
  assert(
    19 === yearsDiff(parseDate("23.05.1997"), parseDate("22.06.2016")),
    "yearsDiff should return 19"
  );
}
```

## Format counter

```javascript
const formatCounter = (s) => {
  let _s = Math.abs(s);
  const units = [3600, 60, 1],
    str = units.reduce((r, multiplier) => {
      if (_s >= multiplier) {
        const count = Math.trunc(_s / multiplier);
        r.push(count.toString().padStart(2, "0"));
        _s = _s % multiplier;
      } else {
        r.push("00");
      }
      return r;
    }, []);
  return (s < 0 ? "-" : "") + str.flat().join(":");
};
```

- https://stackoverflow.com/questions/62590455/format-time-interval-in-seconds-as-x-hours-y-minutes-z-seconds/62590689#62590689

## utc string to date

On any vaguely-modern browser, you just pass that into Date with a "Z" on the end:

```javascript
var str = "2016-11-22T17:14:00";
var dt = new Date(str + "Z");
console.log("UTC string:");
console.log(dt.toUTCString());
console.log("Local string");
console.log(dt.toString());
console.log("Hours UTC:   " + dt.getUTCHours());
console.log("Hours local: " + dt.getHours());
```

https://stackoverflow.com/questions/40768606/i-have-a-utc-string-and-i-want-to-convert-it-to-utc-date-object-in-javascript/40768745#40768745
