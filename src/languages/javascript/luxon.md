## custom format, escaping, from zone, to utc

`DateTime.fromISO('2021-04-27T12:30:23', { zone: 'Europe/Warsaw' }).toUTC().toFormat("yyyyMMdd'T'HHmmss'Z'")`

- https://stackoverflow.com/questions/56927110/luxon-convert-local-time-to-utc-given-a-timezone
- https://stackoverflow.com/questions/64087227/luxon-does-not-format-ddmm-yyyy-format/64087682#64087682
  - https://moment.github.io/luxon/docs/manual/formatting.html#escaping
- https://stackoverflow.com/questions/56927110/luxon-convert-local-time-to-utc-given-a-timezone/56929596#56929596

## datetime object to javascript date

`toJSDate()`

- https://stackoverflow.com/questions/65775654/how-to-transform-a-luxon-datetme-object-to-a-date/65775740#65775740

## add duration to date

`DateTime.fromJSDate(date).plus({minutes}).toJSDate()`

`DateTime.fromFormat('20210427T123023Z', luxonFormat).toUTC().plus(Duration.fromISO('PT8H')).toJSDate()`
`DateTime.fromFormat('20210427T123023Z', luxonFormat, { zone: 'utc'}).plus(Duration.fromISO('PT8H')).toJSDate()`

- https://moment.github.io/luxon/docs/class/src/datetime.js~DateTime.html#instance-method-plus
- https://stackoverflow.com/questions/1197928/how-to-add-30-minutes-to-a-javascript-date-object/66920049#66920049
- https://observablehq.com/@aagostini/how-does-one-add-a-duration-to-a-date-time-so-that-24-hours-from

## from format

`DateTime.fromFormat('20210427T123023Z', "yyyyMMdd'T'HHmmss'Z'").toUTC().toFormat("yyyyMMdd'T'HHmmss'Z'")`

- https://moment.github.io/luxon/docs/manual/parsing.html#fromformat
- https://stackoverflow.com/questions/56854692/parse-datetime-string-in-local-date-format-in-javascript-preferably-using-luxon/58161377#58161377
