- connection string `anything://user:password@host:port/database` https://github.com/brianc/node-postgres/wiki/pg
- `SELECT current_database()` http://stackoverflow.com/questions/3949876/how-to-switch-databases-in-psql
- change database `\c[onnect] database`
- show tables
  - `\dt`
  - `select * from pg_catalog.pg_tables`
  - without system tables `select * from pg_catalog.pg_tables where schemaname != 'pg_catalog' and schemaname != 'information_schema'` https://stackoverflow.com/questions/769683/show-tables-in-postgresql
- show databases `\l`
- show users (for particular db) `\du` https://stackoverflow.com/questions/8926389/postgresql-user-listing
- describe table `\d+ tablename` https://stackoverflow.com/questions/109325/postgresql-describe-table
- create user http://stackoverflow.com/questions/10861260/how-to-create-user-for-a-db-in-postgresql
- creat user and table http://stackoverflow.com/questions/1471571/how-to-configure-postgresql-for-the-first-time/1471678#1471678

  ```
  $ psql -U postgres
  postgres=# CREATE ROLE myuser LOGIN password 'secret';
  postgres=#CREATE DATABASE mydatabase ENCODING 'UTF8' OWNER myuser;
  ```
- node.js
  - https://github.com/brianc/node-postgres
  - http://stackoverflow.com/questions/6466833/node-js-postgres-connection-problem
- https://github.com/dhamaniasad/awesome-postgres
- psql
  - psql: `\q` or `ctrl+c`
  - import sql file
    - `psql -U user -d database -a < file.sql`
      - http://stackoverflow.com/questions/6842393/import-sql-dump-into-postgresql-database/26610212#26610212
      - http://stackoverflow.com/questions/3393961/how-to-import-existing-sql-files-in-postgresql-8-4/29297796#29297796
      - http://stackoverflow.com/questions/9736085/run-a-postgresql-sql-file-using-command-line-args/12085561#12085561
    - `psql -U user -d database -f file.sql` // ERROR:  character with byte sequence 0xc5 0x81 in encoding "UTF8" has no equivalent in encoding "WIN1252"
- password: `export PGPASSWORD=[password]` http://stackoverflow.com/questions/6523019/postgresql-scripting-psql-execution-with-password/22693461#22693461
- command line query `psql -U username -d mydatabase -c 'SELECT * FROM mytable'`
- Client instances created via the constructor do not participate in pg's connection pooling https://github.com/brianc/node-postgres/wiki/Client
- https://github.com/brianc/node-postgres/wiki/FAQ
- http://stackoverflow.com/questions/12331668/node-postgres-how-to-prepare-a-statement-without-executing-the-query
- multiple inserts
  - http://stackoverflow.com/questions/10502121/node-postgres-will-not-insert-data-but-doesnt-throw-errors-either
  - `client.on('drain', client.end.bind(client));`
    - https://github.com/brianc/node-postgres/wiki/Client#event-drain
    - http://stackoverflow.com/questions/17319395/node-js-pg-postgresql-and-insert-queries-app-hangs#comment25151171_17336848
    - got this `(node) warning: possible EventEmitter memory leak detected. 11 drain listeners added. Use emitter.setMaxListeners() to increase limit.
Trace`
  - use pg;s connection pooling but have to wait 30s
  - build multiple inserts https://github.com/brianc/node-postgres/issues/530
  - pg-promise
    - http://stackoverflow.com/questions/34990186/how-do-i-properly-insert-multiple-rows-into-pg-with-node-postgres/35015424#35015424
    - http://stackoverflow.com/questions/29100807/node-postgres-with-massive-amount-of-queries
    - https://github.com/vitaly-t/pg-promise/wiki/Performance-Boost
- config location `SHOW config_file;` http://stackoverflow.com/questions/3602450/where-are-my-postgres-conf-files
- reload config `SELECT pg_reload_conf()` http://serverfault.com/questions/554359/postgresql-timezone-does-not-match-system-timezone
- preapred statments https://github.com/brianc/node-postgres/wiki/Prepared-Statements

## Timestamp, timezone

### Pro WITH TIME ZONE

The fact is that both "WITH TIME ZONE" and "WITHOUT TIME ZONE" store the value as a unix-like absolute UTC timestamp. The difference is all in how the timestamp is displayed. When "WITH time zone" then the displayed value is the UTC stored value translated to the user's zone. When "WITHOUT time zone" the UTC stored value is twisted so as to show the same clock face no matter what zone the user has set".

The only situation where a "WITHOUT time zone" is usable is when a clock face value is applicable regardless of actual zone. For example, when a timestamp indicates when voting booths might close (ie. they close at 20:00 regardless of a person's timezone).

Use choice 3. Always use "WITH time zone" unless there is a very specific reason not to.

http://stackoverflow.com/questions/32033114/javascript-postgres-timezone-and-timestamp-usage/32033471#32033471

Change TimeZone to `UTC` in posgresql.conf

David E. Wheeler, a major Postgres expert, would agree with your assessment
http://stackoverflow.com/questions/6151084/which-timestamp-type-should-i-choose-in-a-postgresql-database/17562423#17562423

http://justatheory.com/computers/databases/postgresql/use-timestamptz.html

If you know it's UTC, why don't you tell the database about it? http://stackoverflow.com/questions/22891740/postgresql-different-output-for-timestamp-without-time-zone-depending-on-client#comment51584460_30760391

with a time zone as part of the value, the value can be rendered as a local time in the client, whereas without a time zone value the only meaningful rendering of the value is as UTC time. http://stackoverflow.com/questions/5876218/difference-between-timestamps-with-without-time-zone-in-postgresql

http://stackoverflow.com/questions/11779293/how-to-set-timezone-for-postgres-psql

```
SELECT * FROM pg_timezone_names;
ALTER DATABASE postgres SET timezone TO 'Europe/Berlin';
```

http://stackoverflow.com/questions/6663765/postgres-default-timezone/32009497#32009497


Correct only if referring to the process of inserting/retrieving values.
timestamp with time zone and timestamp without time zone, in Postgres do *not actually store time zone information.
"without tz" means "ignore offset when inserting data" and "with tz" means "use offset to adjust to UTC"

an offset is a time zone plus rules for DST. You cannot discover the time zone given an offset, but you can discover the offset given the time zone and DST rules.

http://stackoverflow.com/questions/5876218/difference-between-timestamps-with-without-time-zone-in-postgresql


ISO-8601 dates are parsed as UTC by default while non-ISO dates are parsed using local time zone https://github.com/brianc/node-postgres/issues/510

```
SELECT now(), now()::timestamp, now()::timestamp with time zone, now() AT TIME ZONE 'POLAND', now()::timestamp AT TIME ZONE 'POLAND', now()::timestamp with time zone at time zone 'poland'
```

http://stackoverflow.com/questions/5876218/difference-between-timestamps-with-without-time-zone-in-postgresql/5876298#5876298

`show timezone;`

http://stackoverflow.com/questions/11779293/how-to-set-timezone-for-postgres-psql

### Against WITH TIME ZONE

The simplest way is to always store time stamps without time zone and in UTC.

Using CURRENT_TIMESTAMP will get the timestamp from the server at the time of execution.

http://stackoverflow.com/questions/32033114/javascript-postgres-timezone-and-timestamp-usage
