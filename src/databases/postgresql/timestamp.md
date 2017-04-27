- https://www.postgresql.org/docs/current/static/datatype-datetime.html
- http://phili.pe/posts/timestamps-and-time-zones-in-postgresql/
- https://serverfault.com/questions/554359/postgresql-timezone-does-not-match-system-timezone

```sql
SELECT to_char (now()::timestamp at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS:MS"Z"');
```

outputs

```
         to_char
--------------------------
 2017-04-28T00:26:08:797Z
(1 row)
```

- https://lluad.com/blog/2013/08/27/postgresql-and-iso-8601-timestamps/
- http://stackoverflow.com/questions/38834022/turn-postgres-date-representation-into-iso-8601-string/38834311#38834311


```sql
select CURRENT_TIMESTAMP;
select LOCALTIMESTAMP;
select CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
SELECT now() AT TIME ZONE current_setting('TimeZone');
SELECT now()::timestamp;
```

- http://stackoverflow.com/questions/1380460/how-do-i-use-gmt-times-in-postgresql/1380507#1380507
- http://stackoverflow.com/questions/20812091/now-without-timezone

```sql
SELECT current_setting('TIMEZONE')
```

http://stackoverflow.com/questions/2110216/local-time-zone-offset-in-postgresql


To get # of seconds difference as an integer:

```sql
select extract( timezone from now() );
```


## resolution

http://stackoverflow.com/questions/27027112/timestamp-resolution

## insert timestamp with microseconds

```
mydb=# SELECT extract (MICROSECONDS from TO_TIMESTAMP(1401432881230::double precision / 1000));
 date_part
-----------
  41230000
(1 row)


mydb=# SELECT extract (MICROSECONDS from TO_TIMESTAMP(1401432881230 / 1000));
 date_part
-----------
  41000000
(1 row)
```

- http://stackoverflow.com/questions/23950025/how-to-write-bigint-timestamp-in-milliseconds-value-as-timestamp-in-postgresql
- http://stackoverflow.com/questions/27027112/timestamp-resolution


```                                                             ^
mydb=# SELECT EXTRACT(EPOCH FROM now() AT TIME ZONE 'UTC');
    date_part
------------------
 1493325786.78076
(1 row)


mydb=# SELECT EXTRACT(EPOCH FROM now() AT TIME ZONE 'UTC') * 1000;
     ?column?
------------------
 1493325801406.16
(1 row)
```

https://dba.stackexchange.com/questions/2758/how-to-get-the-timestamp-column-in-only-milliseconds-from-postgresql

`SELECT to_char(TIMESTAMP '2013-01-01 12:13:14.001', 'YYYY-MM-DD HH:MI:SS:MS');`

http://stackoverflow.com/questions/21401221/make-postgresql-timestamps-display-milliseconds-even-if-zero


```
mydb=# SELECT TIMESTAMP '2016-08-12 10:22:31.949271-07', TIMESTAMP WITH TIME ZONE '2016-08-12 10:22:31.949271-07';
         timestamp          |          timestamptz
----------------------------+-------------------------------
 2016-08-12 10:22:31.949271 | 2016-08-12 19:22:31.949271+02
(1 row)
```

http://blog.untrod.com/2016/08/actually-understanding-timezones-in-postgresql.html
