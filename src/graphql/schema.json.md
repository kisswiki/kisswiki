>schema.json is nothing but the serialized result of an introspection query onto GraphQL itself https://github.com/denvned/isomorphic-relay-router/issues/28#issuecomment-215653054

##

`apollo-codegen download-schema http://localhost:8080/graphql --output schema.json`

https://www.apollographql.com/docs/ios/downloading-schema.html

##

To generate a GraphQL schema introspection JSON from a local GraphQL schema:

`apollo-codegen introspect-schema schema.graphql --output schema.json`

https://github.com/apollographql/apollo-codegen

##

```typescript
import { GraphQLClient } from 'graphql-request'
//...
new GraphQLClient(graphqlUrl, {
    mode: 'cors',
    headers: headers
  })
    .request(introspectionQuery, { includeDeprecated: !excludeDeprecated })
```

https://github.com/dillonkearns/graphqelm/blob/master/src/graphqelm.ts