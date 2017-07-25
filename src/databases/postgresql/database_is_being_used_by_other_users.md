You can run the dropdb command from the command line:

`dropdb 'database name'`
Note that you have to be a superuser or the database owner to be able to drop it.

```
SELECT * FROM pg_stat_activity WHERE datname='YourDatabase';
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='YourDatabase';
```

https://stackoverflow.com/questions/7073773/drop-postgresql-database-through-command-line
