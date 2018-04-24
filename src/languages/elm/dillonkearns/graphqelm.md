- https://github.com/dillonkearns/graphqelm
  - https://github.com/dillonkearns/graphqelm/blob/master/FAQ.md
  - GraphQL Error on HTTP 200 and correct json schema wrapped in error https://github.com/dillonkearns/graphqelm/issues/54
  - https://github.com/dillonkearns/graphqelm/blob/master/examples/src/GithubPagination.elm
- ellie example needs to be updated https://github.com/dillonkearns/graphqelm/issues/56
- Does now work with example when generating from https://github.com/graphql/swapi-graphql https://github.com/dillonkearns/graphqelm/issues/57
  ## json schema

  You can save json schema to file: `introspection_and_schema.json.md`.

```json
{
    "data": {
        "__schema": {
            "queryType": {},
            "mutationType": {},
            "subscriptionType": null,
            "types": []
        }
    }
}
```

  ## generate elm from json schema

  `graphqelm --introspection-file schema.json`

  `graphqelm http://127.0.0.1:8080/graphql schema.json`

  `graphqelm --introspection-file schema.json --base Github --output examples/src`