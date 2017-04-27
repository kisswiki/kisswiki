- http://stackoverflow.com/questions/38834022/turn-postgres-date-representation-into-iso-8601-string/43668527#43668527
- http://sql-info.de/postgresql/notes/to_date-to_timestamp-gotchas.html
- https://www.postgresql.org/docs/current/static/datatype-datetime.html
- http://phili.pe/posts/timestamps-and-time-zones-in-postgresql/
- https://serverfault.com/questions/554359/postgresql-timezone-does-not-match-system-timezone
- http://stackoverflow.com/questions/20877117/table-column-of-type-timestamp-without-milliseconds
- http://stackoverflow.com/questions/10213190/discard-millisecond-part-from-timestamp?noredirect=1

##

```sql
SELECT
      typname,
      typlen
FROM
      pg_type
WHERE
      typname ~ '^timestamp';
```

- http://www.postgresqltutorial.com/postgresql-timestamp/

## THIS WORKS!!!

```sql
create table blocks (
  release_date timestamptz DEFAULT NOW()
```

```
CREATE OR REPLACE FUNCTION date_display_tz(param_dt timestamp with time zone)
 RETURNS text AS
$$
DECLARE var_result varchar;
BEGIN
PERFORM set_config('timezone', 'UTC', true);
var_result := to_char(param_dt , 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"');
RETURN var_result;
END;
$$ language plpgsql VOLATILE;
```

```
# SELECT
#   localtimestamp, current_timestamp,
#   to_char(localtimestamp, 'YYYY-MM-DD"T"HH24:MI:SS:MS"Z"'),
#   to_char(current_timestamp, 'YYYY-MM-DD"T"HH24:MI:SS:MS"Z"'),
#   date_display_tz(localtimestamp), date_display_tz(current_timestamp);
         timestamp          |              now              |         to_char          |         to_char          |     date_display_tz      |     date_display_tz
----------------------------+-------------------------------+--------------------------+--------------------------+--------------------------+--------------------------
 2017-04-27 23:48:03.802764 | 2017-04-27 21:48:03.802764+00 | 2017-04-27T23:48:03:802Z | 2017-04-27T23:48:03:802Z | 2017-04-27T21:48:03:802Z | 2017-04-27T21:48:03:802Z
(1 row)
```


##

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
# SELECT extract (MICROSECONDS from TO_TIMESTAMP(1401432881230::double precision / 1000));
 date_part
-----------
  41230000
(1 row)


# SELECT extract (MICROSECONDS from TO_TIMESTAMP(1401432881230 / 1000));
 date_part
-----------
  41000000
(1 row)
```

- http://stackoverflow.com/questions/23950025/how-to-write-bigint-timestamp-in-milliseconds-value-as-timestamp-in-postgresql
- http://stackoverflow.com/questions/27027112/timestamp-resolution


```                                                             ^
# SELECT EXTRACT(EPOCH FROM now() AT TIME ZONE 'UTC');
    date_part
------------------
 1493325786.78076
(1 row)


# SELECT EXTRACT(EPOCH FROM now() AT TIME ZONE 'UTC') * 1000;
     ?column?
------------------
 1493325801406.16
(1 row)
```

https://dba.stackexchange.com/questions/2758/how-to-get-the-timestamp-column-in-only-milliseconds-from-postgresql

`SELECT to_char(TIMESTAMP '2013-01-01 12:13:14.001', 'YYYY-MM-DD HH:MI:SS:MS');`

http://stackoverflow.com/questions/21401221/make-postgresql-timestamps-display-milliseconds-even-if-zero


```
# SELECT TIMESTAMP '2016-08-12 10:22:31.949271-07', TIMESTAMP WITH TIME ZONE '2016-08-12 10:22:31.949271-07';
         timestamp          |          timestamptz
----------------------------+-------------------------------
 2016-08-12 10:22:31.949271 | 2016-08-12 19:22:31.949271+02
(1 row)
```

http://blog.untrod.com/2016/08/actually-understanding-timezones-in-postgresql.html


##

It's also worth noting at this point that Postgres will let you apply AT TIME ZONE conversions to date fields. I think this is nuts and Postgres should at least throw up a warning, as it's very weird to request a date at a specific timezone and get a totally different date. Thursday August 18th is Thursday August 18th in every time zone; but instead Postgres will sneakily cast it to a datetime, assume midnight, do the TZ conversion, and return a datetime. Check it out:

```
#=> SELECT ('July 1, 2015'::date AT TIME ZONE 'America/Los_Angeles')::date;
  timezone
------------
 2015-06-30
 ```

Another issue to keep in mind is that in POSIX time zone names, positive offsets are used for locations west of Greenwich. Everywhere else, PostgreSQL follows the ISO-8601 convention that positive timezone offsets are east of Greenwich.

http://blog.untrod.com/2016/08/actually-understanding-timezones-in-postgresql.html

##

`select to_timestamp(20120822193532::text, 'YYYYMMDDHH24MISS')`

http://stackoverflow.com/questions/5485502/how-to-format-bigint-field-into-a-date-in-postgresql/12080268#12080268
