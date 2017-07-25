`SELECT * FROM pg_stat_activity WHERE datname='YourDatabase';`

`select pg_terminate_backend(pid) from pg_stat_activity where datname='YourDatabase';`
