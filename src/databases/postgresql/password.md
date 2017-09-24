find `pg_hba.conf`

```bash
$ sudo -u postgres psql postgres
postgres=# SHOW hba_file;
```

https://askubuntu.com/questions/256534/how-do-i-find-the-path-to-pg-hba-conf-from-the-shell

## set password for postgres

```
sudo -u postgres psql postgres
\password
```

https://stackoverflow.com/questions/12720967/how-to-change-postgresql-user-password

## no password checking

change to `trust` in `pg_hba.conf` for ipv4 and ipv6.

No need to reload postgres on Windows (?). On Linux:

`sudo service postgresql restart`

- https://dba.stackexchange.com/questions/83164/remove-password-requirement-for-user-postgres
- https://stackoverflow.com/questions/12720967/how-to-change-postgresql-user-password

## password types

- password managed by postgresql: md5
- connecting user must be the same as os user: peer

https://dba.stackexchange.com/questions/83164/remove-password-requirement-for-user-postgres/83233#83233

## check if user has LOGIN priviliege

If not, add it.

```psql
postgres=# \du
postgres=# alter role someuser login;
```

- https://unix.stackexchange.com/questions/201666/command-to-list-postgresql-user-accounts
- https://stackoverflow.com/questions/23641823/check-if-a-role-in-postgresql-has-a-password-set
