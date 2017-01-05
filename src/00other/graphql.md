## Quick start

- https://medium.com/the-graphqlhub/your-first-graphql-server-3c766ab4f0a2
  - instructions in the comments
- https://github.com/cucumber/cucumber-js/issues/480
- http://stackoverflow.com/questions/37780952/babel-core-register-vs-babel-register
- https://www.udemy.com/building-better-apis-with-graphql

## Links

- https://wehavefaces.net/graphql-shorthand-notation-cheatsheet-17cd715861b6
- example https://github.com/graphql/swapi-graphql
  - https://github.com/graphql/swapi-graphql/pull/27
  - https://github.com/graphql/swapi-graphql/pull/26
- https://dev-blog.apollodata.com/tutorial-building-a-graphql-server-cddaa023c035
- https://github.com/chentsulin/awesome-graphql
 - https://github.com/kadirahq/lokka
  - https://porter.io/github.com/chentsulin/awesome-graphql
  - https://voice.kadira.io/introducing-lokka-a-simple-javascript-client-for-graphql-e0802695648c
  - https://forums.meteor.com/t/lokka-a-javascript-client-for-graphql/14922
- https://medium.com/@matt.krick/how-to-build-a-graphql-client-cache-part-i-25e698acd8af
- https://dev.to/reactiveconf/why-i-believe-graphql-will-come-to-replace-rest
- caching, continuous scrolling made easy etc. http://red-badger.com/blog/2015/08/28/give-it-5-days-facebook-relay-and-graphql/
- https://0x2a.sh/from-rest-to-graphql-b4e95e94c26b
- https://vinayaksb.wordpress.com/2016/03/15/why-need-to-choose-graphql-over-restodata-in-a-web-api-application-development-2/
- Parse GraphQL query into the standard GraphQL AST https://github.com/apollostack/graphql-tag
- https://learngraphql.com/
  - https://github.com/kadirahq/graphql-blog-schema
- GraphiQL http://stackoverflow.com/questions/37528382/how-to-connect-graphiql-to-another-implementation-other-than-javascript

## Backends

- Production-ready GraphQL backend in 5 minutes. Stop wasting time writing error-prone database migrations and monitoring log files. Graphcool handles all of that so you can focus on what matters: Building your app. https://www.graph.cool/
- https://www.reindex.io/

> If multiple queries require the same piece of data, Relay will efficiently batch and aggregate these queries together for you. This has the potential for huge wins, compared to typical REST-style applications. For example, if you were pulling information for an endpoint in multiple locations on your site, you will often be sending a GET request for each place you need this data. You could instead attempt to aggregate these yourself, but this will make the application substantially more difficult to reason about. In comparison, the Relay approach allows us to have the simple conceptual model of declaring our data needs in each place we need it, but have the performance benefits of placing all the queries in one location. It’s a pretty big win-win.
> -- http://thenewstack.io/facebooks-relay-javascript-framework-building-react-applications/

<br>

> OData is basically LINQ-over-REST, advantage over GraphQL is that it's better for aggregations (as they are hard to describe in GraphQL). GraphQL however performs nicer when it comes to joins, frontend-oriented data, documentation and tooling. Plus also it's easier to make it loosely coupled to you database schema than in OData.
> -- https://www.reddit.com/r/programming/comments/560f7d/why_i_believe_graphql_will_come_to_replace_rest/d8g785j

## Cons

>As a veteran MDE practitioner, I can assure you that you are infinitely better off writing code than metadata, be it as a template or a complex query language like GraphQL.
>
>-- https://www.infoq.com/articles/no-more-mvc-frameworks

## Introspection

- http://graphql.org/learn/introspection/
- https://www.graphqlhub.com/

## Schema

- http://graphql.org/learn/schema/

## schema.js to scheam.json

- https://github.com/WaldoJeffers/graphql-to-json

schema.js needs to export http://graphql.org/graphql-js/type/#graphqlschema
