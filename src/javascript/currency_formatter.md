```javascript
function currencyUSD(number) {
  return number.toLocaleString('en-US', { style: 'currency', currency: 'USD', minimumFractionDigits: 0 });
}
currencyUSD(123456); // "$123,456"
currencyUSD(123456.234); // "$123,456.23"
```

- https://stackoverflow.com/questions/149055/how-can-i-format-numbers-as-dollars-currency-string-in-javascript/149107#149107
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toLocaleString
- https://stackoverflow.com/questions/24758817/javascript-number-tolocalestring-with-4-digits-after-separator
