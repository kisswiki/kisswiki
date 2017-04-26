```sql
select * 
  from view1 
  where view1.id = ANY(array(select ext_id 
                                from aggregate_table 
                                order by somedata limit 10)
                       )
  order by view1.somedata;
  ```

  http://stackoverflow.com/questions/14987321/postgresql-in-operator-with-subquery-poor-performance/15007154#15007154
