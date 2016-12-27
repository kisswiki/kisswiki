- Still not updated to elm-0.18 https://github.com/jahewson/elm-graphql


>Secondly, we'd end up with infinite types; look at theCharacter interface our schema, it defines the field friends: [Character], which is recursive and so can't be translated to an Elm record.
>
>-- https://github.com/jahewson/elm-graphql/wiki/How-elm-graphql-works
