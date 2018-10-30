the two big differences with traditional materialized views are: a) Noria provides partial materializations where not all results are stored and maintained, which improves both throughput and memory use; and b) Noria's materialized views are optimized for reads — all reads can proceed concurrently with one another, and concurrently with writes, whereas existing approaches require reads to either block writes, or to implement reads as writes.

We didn't really adapt Noria to MySQL/MariaDB. All I did was implement the server-side of the MySQL binary protocol, and then write a wrapper that accepts MySQL queries and rewrites then to Noria requests. Doing the same for PostgreSQL shouldn't be too hard; you just need to implement the protocol.

https://www.reddit.com/r/rust/comments/9mk404/noria_a_highperformance_web_application_backend

## Links

- https://www.reddit.com/r/rust/comments/9seioy/noria_dataflow_for_highperformance_web/
- https://blog.acolyer.org/2018/10/29/noria-dynamic-partially-stateful-data-flow-for-high-performance-web-applications/
- https://www.usenix.org/conference/osdi18/presentation/gjengset
