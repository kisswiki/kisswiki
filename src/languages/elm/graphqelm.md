- https://github.com/dillonkearns/graphqelm
  - GraphQL Error on HTTP 200 and correct json schema wrapped in error https://github.com/dillonkearns/graphqelm/issues/54
  - https://github.com/dillonkearns/graphqelm/blob/master/examples/src/GithubPagination.elm

  ## generate elm from json schema

  `graphqelm --introspection-file schema.json`

  `graphqelm http://127.0.0.1:8080/graphql schema.json`

  `graphqelm --introspection-file schema.json --base Github --output examples/src`