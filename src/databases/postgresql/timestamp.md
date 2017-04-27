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
