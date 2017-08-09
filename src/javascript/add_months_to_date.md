```javascript
const dateFormatString = 'MM/DD/YYYY';
dataToPrint.deadline = moment(_.get(data, 'date'), dateFormatString)
  .add(_.get(data, 'deadline'), _.get(data, 'deadlineMonthsOrWeeks'))
  .format(dateFormatString);
```

https://stackoverflow.com/questions/7937233/how-do-i-calculate-the-date-in-javascript-three-months-prior-to-today
