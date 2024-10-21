It does have some actual technical advantages:

- More-consistent performance (especially for high write loads), because no vacuuming. It also won't just suddenly lock up for hours or days waiting for vacuuming to finish -- Postgres has some nasty surprises hidden in the default autovacuum configuration.

- Replication is logical, as the built-in default and realistically the only option. This means replication is usually compatible between different versions of MySQL, which means you can do online rolling upgrades. With Postgres' default physical replication, you need to upgrade your entire cluster all at once. Postgres10 fixed this, so you can upgrade from pg10 to pg11 in this way, but it has some gigantic holes, like "schema changes aren't replicated," so you can't really ever use logical replication as the default.

- MySQL uses a thread-per-connection inside one gigantic DB process; Postgres uses a process-per-connection with shared memory and IPC to coordinate. This is probably the reason Postgres connections are so heavyweight, enough that you really, really need to use connection pooling. MySQL can handle thousands of connections, and it can even handle incredibly stupid application designs like the one you get by default in PHP, where it literally opens a new DB connection on every HTTP request.

I could make a much longer list of reasons to choose Postgres, and I would definitely recommend Postgres anyway, but these are some technical advantages of MySQL.

But I don't think that's actually why people choose MySQL. I think it's either a legacy decision they inherited, or it's because MySQL is (or at least used to be) slightly easier to get started with. It's also more tolerant of your bullshit -- Postgres won't ever quietly decide to parse a string as a number and drop data, but if you're just trying to get something to work, databases and languages that have the equivalent of VB's "on error resume next" make it easier to get something running, even if it's buggy as shit.

https://www.reddit.com/r/programming/comments/aquok0/postgresql_11_reestablishes_window_functions/egjyd0j/

## one process per connection

- https://www.reddit.com/r/PostgreSQL/comments/t5ahe9/why_does_postgres_use_1_process_per_connection/
- https://x.com/thdxr/status/1847106854347813206

## outdated storage

- https://news.ycombinator.com/item?id=41895951
  - https://www.cs.cmu.edu/~pavlo/blog/2023/04/the-part-of-postgresql-we-hate-the-most.html
