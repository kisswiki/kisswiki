From json:

```json
{
  "data": [
    {
      "id": "someid",
      "suffixes": []
    }
  ]
}
```

select only ids that has `suffixes` field as sibling.

`jq '.data|map(select(has("suffixes"))|.id)[]' json/questions.json`

and has not


`jq '.data|map(select(has("suffixes")|not)|.id)[]' json/questions.json`

- https://stackoverflow.com/questions/26701538/how-to-filter-an-array-of-objects-based-on-values-in-an-inner-array-with-jq/45971669#45971669
- [Find objects that do not have key · Issue #952 · stedolan/jq](https://github.com/stedolan/jq/issues/952#issuecomment-141211150)
- https://github.com/stedolan/jq/wiki/Cookbook#filter-objects-based-on-the-contents-of-a-key
- https://stackoverflow.com/questions/46281030/use-jq-to-select-objects-not-containing-nested-objects
- https://stackoverflow.com/questions/42746828/jq-how-to-filter-a-json-that-does-not-contain
