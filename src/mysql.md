> The design of Postgres means that updating existing rows is inefficient compared to MySQL

> acuuming is easier with InnoDB since the changed records all exist in the redo log whereas PostgreSQL needs to scan the whole table. pglogical is mentioned for people running PG9.4+ as a way of doing minimal downtime cross version upgrades, which wasn't an option back with PG9.2 unless you go with something like slony1 or londiste.

> There's been quite a few improvements to VACUUM in 9.6 [1], including avoiding full-table scans

> MySQL has had solid and flexible replication options for a long time. Postgres has only just started to catch up in the last couple of years.

- https://news.ycombinator.com/item?id=12166585
- https://eng.uber.com/mysql-migration/
