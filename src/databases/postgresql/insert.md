```sql
INSERT into foo_bar (foo_id, bar_id) VALUES ((select id from foo where name = 'selena'), (select id from bar where type = 'name'));
```

http://www.chesnok.com/daily/2013/11/19/everyday-postgres-insert-with-select/comment-page-1/
