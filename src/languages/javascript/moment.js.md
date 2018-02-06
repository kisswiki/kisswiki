## change locale globally

https://github.com/moment/moment/issues/1875

Or maybe this:

```javascript
getCurrentTime() {
return moment().locale('pl');
}
```

## parse date

`const myDate = moment(str, 'YYYY-MM-DD').toDate();`

or to just get moment object:

`const momentDate = moment(str, 'YYYY-MM-DD');`

https://stackoverflow.com/questions/22184747/parse-string-to-date-with-moment-js/44134515#44134515

## check if date is valid

`moment(moment("2012-10-19").format(dateFormat),dateFormat,true).isValid()`

https://stackoverflow.com/questions/40123747/how-to-check-if-date-is-valid-using-moment-js
