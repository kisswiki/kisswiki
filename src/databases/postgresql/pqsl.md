## describe table

`\d+ tablename`

https://stackoverflow.com/questions/109325/postgresql-describe-table

## list schemas

`select schema_name from information_schema.schemata`

or (without information_schema and pg_catalog):

`\dn`

https://dba.stackexchange.com/questions/40045/how-do-i-list-all-schemas-in-postgresql

## list tables in schema

`\dt public.*`

https://stackoverflow.com/questions/15644152/list-tables-in-a-postgresql-schema
