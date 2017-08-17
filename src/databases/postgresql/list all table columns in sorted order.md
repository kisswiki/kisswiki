```sql
SELECT column_name
FROM information_schema.columns 
WHERE table_schema = 'public' 
AND table_name = 'blah' 
ORDER BY column_name ASC;
```

https://dba.stackexchange.com/questions/57130/how-to-list-all-table-columns-in-sorted-order
