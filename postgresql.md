- connection string `anything://user:password@host:port/database` https://github.com/brianc/node-postgres/wiki/pg
- `SELECT current_database()` http://stackoverflow.com/questions/3949876/how-to-switch-databases-in-psql

## psql

- change database `\c[onnect] database`
- show tables
  - `\dt`
  - `select * from pg_catalog.pg_tables`
  - without system tables `select * from pg_catalog.pg_tables where schemaname != 'pg_catalog' and schemaname != 'information_schema'` https://stackoverflow.com/questions/769683/show-tables-in-postgresql
