## learn

- http://modern-sql.com/
- http://use-the-index-luke.com/
- Lecture #01 - Course Information & History of Databases [CMU Database Systems Spring 2016] https://www.youtube.com/watch?v=MyQzjba1beA&list=PLSE8ODhjZXjbisIGOepfnlbfxeH7TW-8O
- https://sql-performance-explained.com/
  - https://news.ycombinator.com/item?id=28172073
- https://www.depesz.com/2019/02/19/waiting-for-postgresql-12-allow-user-control-of-cte-materialization-and-change-the-default-behavior/
  - https://news.ycombinator.com/item?id=28172439

## table names and plural

Table names should be plural like Customers.

Class names should be singular like Customer if it maps to a row in Customers table.

http://stackoverflow.com/questions/808992/singular-or-plural-database-table-names/809006#809006

## pagination with offset vs limit

The problem is that when I implement pagination it's often because I want automated scripts to be able to export ALL of the data, which means they need to be able to paginate to the end of the results.
Example from one of my projects: https://covid-19.datasettes.com/covid/ny_times_us_counties - it uses keyset (cursor) pagination so it's possible to efficiently export all 1,611,908 rows of data.

`SELECT * from table limit 100 offset 10000` requires the database to skip 10000 rows in order to get to the rows it needs to start returning - and then on the next page it has to do it again, using offset 10100.

If you're showing an interface to users you can implement an easy workaround: don't allow them to click past page 10, in which case OFFSET pagination only ever needs to loop through up to about 1,000 rows (depending on your page size).

https://news.ycombinator.com/item?id=28173053
