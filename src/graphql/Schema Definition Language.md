>A GraphQL Schema Definition is the most concise way to specify a GraphQL schema. The syntax is well-defined and will be adopted in the official GraphQL Spec. Schema Definitions are sometimes referred to as IDL (Interface Definition Language) or SDL (Schema Definition Language).

- https://blog.graph.cool/graphql-sdl-schema-definition-language-6755bcb9ce51
- https://github.com/facebook/graphql/tree/master/spec
- To learn more about the SDL, you can check out the official [documentation](http://graphql.org/learn/schema/#type-language) https://www.graph.cool/docs/reference/database/data-modelling-eiroozae8u/#overview
- https://github.com/sogko/graphql-schema-language-cheat-sheet

##

>Type language #
>GraphQL services can be written in any language. Since we can't rely on a specific programming language syntax, like JavaScript, to talk about GraphQL schemas, we'll define our own simple language. We'll use the "GraphQL schema language" - it's similar to the query language, and allows us to talk about GraphQL schemas in a language-agnostic way.

- http://graphql.org/learn/schema/#type-language

##

>We designed the type system, so we know what types are available, but if we didn't, we can ask GraphQL, by querying the __schema field, always available on the root type of a Query. 

http://graphql.org/learn/introspection/