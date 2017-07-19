```javascript
// usage: formatCurrency(undefined, { currency: 'GBP' })(TEST_AMOUNT)
export function formatCurrency (locale = 'en-US', config = {}, options = {
  locale = 'en-us',
}) {
  return number => number.toLocaleString(
    locale,
    Object.assign({ style: 'currency', currency: 'USD', minimumFractionDigits: 0 }, config),
  );
}
```

- https://stackoverflow.com/questions/149055/how-can-i-format-numbers-as-dollars-currency-string-in-javascript/149107#149107
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toLocaleString
- https://stackoverflow.com/questions/24758817/javascript-number-tolocalestring-with-4-digits-after-separator
