In general yes, garbage collection in Relay Modern is meant to help constrain growth of memory usage during the course of a session. This is where the declarative nature of GraphQL is helpful; unlike Redux which is accessed via arbitrary selector functions, Relay knows (via queries, fragments, etc) which parts of the cache may still be referenced and can evict records that aren't.

https://news.ycombinator.com/item?id=14143639
