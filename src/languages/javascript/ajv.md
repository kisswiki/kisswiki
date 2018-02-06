- enums instead of pattern https://github.com/epoberezkin/ajv
- if-then-else use 'if' https://github.com/epoberezkin/ajv-keywords
- https://github.com/epoberezkin/ajv-errors
  - https://github.com/epoberezkin/ajv/issues/100
- https://github.com/epoberezkin/ajv/blob/master/KEYWORDS.md
- https://medium.com/@quentin.chevrin/ajv-a-solution-to-form-validation-f1d12e767f0
- https://code.tutsplus.com/tutorials/validating-data-with-json-schema-part-1--cms-25343
- https://stackoverflow.com/questions/42908916/ajv-conditional-schema-validation-based-on-data
- https://stackoverflow.com/questions/tagged/ajv
- https://survivejs.com/blog/ajv-interview/

## beware of misspelled keywords

For example `minLenght` won't trigger validation. Should be `minLength`.

## string as a number

```javascript
const contrahentDetailsCapital = {
  type: 'string',
  minLength: 1,
  pattern: '^\\d+$'
};
```

https://stackoverflow.com/questions/9011524/javascript-regexp-number-only-check/9011537#9011537
