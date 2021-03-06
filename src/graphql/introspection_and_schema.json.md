Taking introspection query from https://github.com/graphql/graphql-js/blob/926e4d80c558b107c49e9403e943086fa9b043a8/src/utilities/introspectionQuery.js:

```javascript
var descriptions = false;
var introspectionQuery = `
    query IntrospectionQuery {
      __schema {
        queryType { name }
        mutationType { name }
        subscriptionType { name }
        types {
          ...FullType
        }
        directives {
          name
          ${descriptions ? 'description' : ''}
          locations
          args {
            ...InputValue
          }
        }
      }
    }
    fragment FullType on __Type {
      kind
      name
      ${descriptions ? 'description' : ''}
      fields(includeDeprecated: true) {
        name
        ${descriptions ? 'description' : ''}
        args {
          ...InputValue
        }
        type {
          ...TypeRef
        }
        isDeprecated
        deprecationReason
      }
      inputFields {
        ...InputValue
      }
      interfaces {
        ...TypeRef
      }
      enumValues(includeDeprecated: true) {
        name
        ${descriptions ? 'description' : ''}
        isDeprecated
        deprecationReason
      }
      possibleTypes {
        ...TypeRef
      }
    }
    fragment InputValue on __InputValue {
      name
      ${descriptions ? 'description' : ''}
      type { ...TypeRef }
      defaultValue
    }
    fragment TypeRef on __Type {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
                ofType {
                  kind
                  name
                  ofType {
                    kind
                    name
                  }
                }
              }
            }
          }
        }
      }
    }
  `;
```

got this:

```graphql
 query IntrospectionQuery {
      __schema {
        queryType { name }
        mutationType { name }
        subscriptionType { name }
        types {
          ...FullType
        }
        directives {
          name
          
          locations
          args {
            ...InputValue
          }
        }
      }
    }
    fragment FullType on __Type {
      kind
      name
      
      fields(includeDeprecated: true) {
        name
        
        args {
          ...InputValue
        }
        type {
          ...TypeRef
        }
        isDeprecated
        deprecationReason
      }
      inputFields {
        ...InputValue
      }
      interfaces {
        ...TypeRef
      }
      enumValues(includeDeprecated: true) {
        name
        
        isDeprecated
        deprecationReason
      }
      possibleTypes {
        ...TypeRef
      }
    }
    fragment InputValue on __InputValue {
      name
      
      type { ...TypeRef }
      defaultValue
    }
    fragment TypeRef on __Type {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
                ofType {
                  kind
                  name
                  ofType {
                    kind
                    name
                  }
                }
              }
            }
          }
        }
      }
```


##

- https://facebook.github.io/graphql/#sec-Introspection
- http://graphql.org/learn/introspection/
- http://graphql.org/graphql-js/utilities/
- https://astexplorer.net/#/drYr8X1rnP/1
- https://github.com/rofrol/fetch-graphql-schema-custom
- visualize
  - https://apis.guru/graphql-voyager/
  - http://nathanrandal.com/graphql-visualizer/

```javascript
(async () => { // can be removed, top-level await works in Chrome and Firefox
  try {
    const response = await fetch('http://127.0.0.1:8080/graphql', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query: "{ __schema { types { name } } }"}),
    })
    const json = await response.json();
    console.log(JSON.stringify(json, null, 2));
  } catch (error) {
    console.error(error);
  }
})()
```

##

- https://github.com/yoctol/fetch-graphql-schema

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

- https://github.com/dillonkearns/graphqelm/blob/master/src/graphqelm.ts

>graphqelm url --excludeDeprecated # excludes deprecated enums and fields (they are included by default) https://github.com/dillonkearns/graphqelm/blob/master/src/graphqelm.ts#L19

```graphql
{query IntrospectionQuery($includeDeprecated: Boolean!) {
    __schema {
      queryType {
        name
      }
      mutationType {
        name
      }
      subscriptionType {
        name
      }
      types {
        ...FullType
      }
    }
  }
  fragment FullType on __Type {
    kind
    name
    description
    fields(includeDeprecated: $includeDeprecated) {
      name
      description
      args {
        ...InputValue
      }
      type {
        ...TypeRef
      }
      isDeprecated
      deprecationReason
    }
    inputFields {
      ...InputValue
    }
    interfaces {
      ...TypeRef
    }
    enumValues(includeDeprecated: $includeDeprecated) {
      name
      description
      isDeprecated
      deprecationReason
    }
    possibleTypes {
      ...TypeRef
    }
  }
  fragment InputValue on __InputValue {
    name
    description
    type { ...TypeRef }
    defaultValue
  }
  fragment TypeRef on __Type {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
                ofType {
                  kind
                  name
                }
              }
            }
          }
        }
      }
    }
  }
```

graphiql variables

```json
{
  "includeDeprecated": true
}
```


- https://github.com/dillonkearns/graphqelm/blob/master/src/introspection-query.ts

>We designed the type system, so we know what types are available, but if we didn't, we can ask GraphQL, by querying the __schema field, always available on the root type of a Query. 

http://graphql.org/learn/introspection/
