## select only ids that has not `suffixes` field as sibling

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

`jq '.data|map(select(has("suffixes")|not)|.id)[]' json/questions.json`


- https://stackoverflow.com/questions/26701538/how-to-filter-an-array-of-objects-based-on-values-in-an-inner-array-with-jq/45971669#45971669
- [Find objects that do not have key · Issue #952 · stedolan/jq](https://github.com/stedolan/jq/issues/952#issuecomment-141211150)
- https://github.com/stedolan/jq/wiki/Cookbook#filter-objects-based-on-the-contents-of-a-key
- https://stackoverflow.com/questions/46281030/use-jq-to-select-objects-not-containing-nested-objects
- https://stackoverflow.com/questions/42746828/jq-how-to-filter-a-json-that-does-not-contain

## pretty print

`jq '.' file.json`

and sort keys

`jq -S '.' file.json`

- https://stedolan.github.io/jq/manual/#Basicfilters
- https://stackoverflow.com/questions/38210288/how-can-i-get-jq-to-pretty-print-json-ordering-keys-alphabetically

## print keys

`jq 'keys' file.json`

or

`jq 'keys_unsorted' file.json`

- https://stackoverflow.com/questions/37577683/how-to-use-jq-to-obtain-the-keys
- https://stackoverflow.com/questions/34226370/jq-print-key-and-value-for-each-entry-in-an-object
