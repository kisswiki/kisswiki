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
