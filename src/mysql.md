> The design of Postgres means that updating existing rows is inefficient compared to MySQL

> acuuming is easier with InnoDB since the changed records all exist in the redo log whereas PostgreSQL needs to scan the whole table. pglogical is mentioned for people running PG9.4+ as a way of doing minimal downtime cross version upgrades, which wasn't an option back with PG9.2 unless you go with something like slony1 or londiste.

> There's been quite a few improvements to VACUUM in 9.6 [1], including avoiding full-table scans

> MySQL has had solid and flexible replication options for a long time. Postgres has only just started to catch up in the last couple of years.

> I would argue that most of these Postgres "flaws" are actually advantages over MySQL when you look at them holistically rather than the very specific Uber use-case.
> Postgres's MVCC is superior (can rollback DDL, can add indexes online, can have open read transactions for a VERY long time without impacting other parts of the system)
> Postgres supports many types of indexes, not just b-tree. One thing it doesn't have is clustered b-tree indexes... which is really what MySQL does that makes it somewhat "better." I wonder how Uber adds an index to a table that already has 1B+ rows in it with mysql?
> Postgres have WAL level replication is a better guarantee of actually replicating the data correctly. I cannot tell you how many times I've had to tell my boss that the "mysql replicas might be slightly out of sync with the master" because of various replication issues. The way it handles triggers and scheduled events alone is garbage and can very easily break replication and/or silently cause inconsistency.
> As for data corruption, if there is a bug that causes corruption, then there is a bug. I don't think that is a fundamental design flaw as implied in this article. You shouldn't rely on 1/2 assed replication design to accidentally save you from the data corruption bug. There are many downsides to the design MySQL has that are simply not listed here.
> I have been both a professional MySQL administrator as well as Postgresql (as well as SQL Server and many NoSQL engines). Many of these Postgres issues are only issues at crazy huge scale, and I would say at that point you probably want to move away from relational anyway. MySQL has its own very large set of problems at scale as well.
> It sounds like Uber is using MySQL as just a data bucket with primary keys ("Schemaless") which is good -- because you can't alter tables to save your life with MySQL.
> At the end of the data each developer/business needs to use what works for them, but I would really shy away from pointing to this article as a linchpin in the "MySQL vs. Postgres" war (if there even is such a thing.)

- https://news.ycombinator.com/item?id=12166585
- https://eng.uber.com/mysql-migration/
