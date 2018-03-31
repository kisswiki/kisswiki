- Thoughts on implementing GraphQL in Elm https://gist.github.com/gyzerok/50c65c48ce375fd3f071
- https://alpacaaa.net/blog/post/elm-graphql-client/
- https://www.reddit.com/r/elm/comments/5zpz9h/hacker_news_clone_in_elm_elmnavigation_graphql/
- https://github.com/dillonkearns/graphqelm
  - GraphQL Error on HTTP 200 and correct json schema wrapped in error https://github.com/dillonkearns/graphqelm/issues/54
  - https://github.com/dillonkearns/graphqelm/blob/master/examples/src/GithubPagination.elm

## ghivert/elm-graphql

- https://github.com/ghivert/elm-graphql
- https://www.reddit.com/r/elm/comments/6pwf5g/elm_graphql_graphql_made_easy_in_elm/

## jahewson/elm-graphql

- https://github.com/jahewson/elm-graphql
- Still not updated to elm-0.18
- https://github.com/indigobio/elm-graphql/commit/5c64a8d1dc0c0f02edc987567ef15ffddc407f1f
- most recent fork https://github.com/Bellk17/elm-graphql https://github.com/jahewson/elm-graphql/network

>Secondly, we'd end up with infinite types; look at theCharacter interface our schema, it defines the field friends: [Character], which is recursive and so can't be translated to an Elm record.
>
>-- https://github.com/jahewson/elm-graphql/wiki/How-elm-graphql-works

## jamesmacaulay/elm-graphql

- https://github.com/jamesmacaulay/elm-graphql

I've talked to the author of https://github.com/jamesmacaulay/elm-graphql
about level of graphql support in his library and he said:

>it can do almost everything in the GraphQL spec
>the only missing things I can think of are directives on fragment and operation definitions
>if you look at this test file, you can see almost everything in use https://github.com/jamesmacaulay/elm-graphql/blob/master/tests/GraphQL/Request/BuilderTests.elm
>one issue you might encounter is flexibility in decoding to arbitrary types, which is somewhat limited right now https://github.com/jamesmacaulay/elm-graphql/issues/3
