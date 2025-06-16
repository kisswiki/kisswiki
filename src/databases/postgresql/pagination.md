```sql
SELECT * FROM output ORDER BY ID DESC OFFSET 0 LIMIT 10000 // first 10,000 rows
SELECT * FROM output ORDER BY ID DESC OFFSET 10000 LIMIT 10000 // next 10,000 rows
```

```javascript
const queryText = `SELECT
        *
        FROM output
        ORDER BY id
        OFFSET $1
        LIMIT $2
`;

const result = await query(queryText, [page * size, size]);
```

- <https://stackoverflow.com/questions/59619956/pagination-and-filtering-on-a-very-large-table-in-postgresql-keyset-pagination>
- <https://stackoverflow.com/questions/53280333/javascript-postgres-db-how-to-use-a-prepared-statement-with-an-array-as-para>
- <https://readyset.io/blog/optimizing-sql-pagination-in-postgres>
