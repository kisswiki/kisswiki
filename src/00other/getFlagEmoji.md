```javascript
const getFlagEmoji = (countryCode) => {
  var codePoints = countryCode
    .toUpperCase()
    .split("")
    .map((char) => 127397 + char.charCodeAt());
  return String.fromCodePoint(...codePoints);
};
getFlagEmoji("pl"); // 🇵🇱
```
