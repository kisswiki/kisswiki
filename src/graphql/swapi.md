- https://github.com/graphql/swapi-graphql
- https://swapi.co/
- http://graphql.org/swapi-graphql/?query=query%20Test%20%7B%0A%20%20allPlanets%20%7B%0A%20%20%20%20planets%20%7B%0A%20%20%20%20%20%20...%20on%20Planet%20%7B%0A%20%20%20%20%20%20%20%20name%0A%20%20%20%20%20%20%20%20...%20on%20Node%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20id%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%7D%0A%20%20%20%20%7D%0A%20%20%7D%0A%7D%0A&operationName=Test

```graphql
query Test {
  allPlanets {
    planets {
      ... on Planet {
        name
        ... on Node {
          id
        }
      }
    }
  }
}
```