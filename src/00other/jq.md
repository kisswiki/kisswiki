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

## extract key value

```
{
  "host1": { "ip": "10.1.2.3" },
  "host2": { "ip": "10.1.2.2" },
  "host3": { "ip": "10.1.18.1" }
}
```
and generate this output:

```
host1, 10.1.2.3
host2, 10.1.2.2
host3, 10.1.18.1
```

To get the top-level keys as a stream, you can use keys[]. So one solution to your particular problem would be:

`jq -r 'keys[] as $k | "\($k), \(.[$k] | .ip)"'`

keys produces the key names in sorted order; if you want them in the original order, use `keys_unsorted`.

Another alternative, which produces keys in the original order, is:

`jq -r 'to_entries[] | "\(.key), \(.value | .ip)"'`

https://stackoverflow.com/questions/34226370/jq-print-key-and-value-for-each-entry-in-an-object

## output to file

Just calling jq will throw errors if stdout isn't a terminal

```bash
$ curl https://jsonplaceholder.typicode.com/posts/1 | jq > test.txt
jq - commandline JSON processor [version 1.5-1-a5b5cbe]
Usage: jq [options] <jq filter> [file...]

        jq is a tool for processing JSON inputs, applying the
        given filter to its JSON text inputs and producing the
[...]
```

Try `jq '.'` (i.e: pretty-print the input JSON):

```bash
$ curl https://jsonplaceholder.typicode.com/posts/1 | jq '.' > test.txt
```

https://stackoverflow.com/questions/48964305/write-output-to-a-file-after-piped-to-jq/48964481#48964481
