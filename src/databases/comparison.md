- Why Uber Engineering Switched from Postgres to MySQL https://eng.uber.com/mysql-migration/

##

1. Oracle is really lacking in modern features/usability. Features where frozen in roughly 1999 and they are pretty still the same (mostly). (You are STILL limited to 30 chars for a table name FFS). They do add new stuff from time to time but anything existing isn't modified. Works but not fun to work with.
2. MSSQL needs NOLOCK everywhere (I've seen codebases with this on EVERY query). The default locking really sucks. I'm sure a DBA can make the locking sane system wide but I've never seen this on any of the DBs I've worked with. Also, SQL Manager is a PITA IMHO. Toad it is not. Almost all DB interactions via a 1G windows only install is a "bad idea"
3. MySQL is nice but will just silently eat your data from time to time. Auto truncate is evil, as is missing enums. These have both hit me multiple times in production. Note: Not sure if this is still the case since I avoid it now for this reason.
4. Postgres. Lots of nice features and easy to work with but the optimizer will sometimes do something silly. Sometimes you have to cast your bound variable just use an index. (id=? => id=?::NUMBER just because you do a setObject in jdbc)

https://news.ycombinator.com/item?id=15411348

##

Uber certainly presented a valid pain-point with the way indexes are handled compared to the MySQL family, any updates to an indexed field require an update to all indexes on the table (compared to MySQL which uses clustered indexes, as a result only specific indexes need to be updated). If you have a lot of indexes on your tables and update indexed values frequently you're going to see an increase in disk I/O.

https://news.ycombinator.com/item?id=15409881
