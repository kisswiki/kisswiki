Basically, FoundationDB appears to claim ACID compliance (by following certain read/snapshot guidelines). Essentially, this appears to be a building block for any datastore you'd potentially like to build. It would be akin to TiKV, but with stronger consistency guarantees (as desired).

From the APIs it looks like abstractions could be built that would match the semantics of pretty much any datastore you'd like, which seems too good to be true and made me want to explore it. I can easily picture HBase, Cassandra, and/or DynamoDB APIs built on top. A full SQL/ACID compliant RDBMS could probably be built too. I'm curious about streaming APIs on top of it as well.

It looks like scalability is a factor of replication. It appears to work in both high-latency and low-latency environments, with support for things like low-latency replicas and disaster recovery options for backups. At work we quickly ran some non-scientific load to see how it performed, and it was impressive. Also, it's -super- easy to install and get started, think one click DB...

https://www.reddit.com/r/rust/comments/8e8m99/foundationdb_rust_client_api_010_announcements/