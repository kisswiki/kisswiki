find `pg_hba.conf`

```sql
SHOW hba_file;
```

https://askubuntu.com/questions/256534/how-do-i-find-the-path-to-pg-hba-conf-from-the-shell

## set password for postgres

https://stackoverflow.com/questions/12720967/how-to-change-postgresql-user-password

## no password checking

change to `trust` in `pg_hba.conf` for ipv4 and ipv6.

No need to reload postgres.

https://dba.stackexchange.com/questions/83164/remove-password-requirement-for-user-postgres

## password types

- password managed by postgresql: md5
- connecting user must be the same as os user: peer