- http://db-engines.com/en/ranking_trend/system/MariaDB%3BMySQL
- http://cloudacademy.com/blog/mariadb-vs-mysql-aws-rds/
- new licensing model https://news.ycombinator.com/item?id=12325276
- MariaDB is the only option available in RedHat/CentOS and SUSE variants, and starting from the next Debian release it will be the default in the Debian ecosystem too https://github.com/Varying-Vagrant-Vagrants/VVV/issues/949#issuecomment-237775311
- https://www.wikivs.com/wiki/MySQL_vs_PostgreSQL
- http://db-engines.com/en/system/MariaDB%3BMySQL%3BPercona+Server

## Security

> Do not grant the FILE privilege to nonadministrative users
> -- https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/897317-mysql-hit-by-critical-remote-code-execution-0-day?p=897370#post897370

## Portable

```cmd
unzip mariadb-10.5.8-winx64.zip
cd mariadb-10.5.8-winx64\bin
mariadb-install-db.exe
mariadbd.exe --console
```

```cmd
mysqladmin -u root flush-privileges password "SECRET"
mysql -u root -p
```

- https://mariadb.org/download/
  - Could not download zip in Google Chrome. Have used Microsoft Edge.
- https://www.mariadb.education/install-portable
- https://mariadb.com/kb/en/installing-mariadb-windows-zip-packages/
- https://stackoverflow.com/questions/42693809/minimum-files-to-run-mysql-or-mariadb-server-on-windows-portable-mysql-mariad
- https://mariadb.com/kb/en/portable-mariadb/
- https://mariadb.com/kb/en/mysql_install_dbexe/

## Create databases from SQL file

```
$ mysql –u root –p
MariaDB [(none)]> source filename.sql
```

or

```
mysql -u root -p < filename.sql
```

- https://stackoverflow.com/questions/10769344/create-mysql-database-with-sql-file/16329302#16329302
- https://stackoverflow.com/questions/38830544/create-databases-from-sql-file
- for huge file disable autocommit https://stackoverflow.com/questions/17666249/how-do-i-import-an-sql-file-using-the-command-line-in-mysql/22855514#22855514

## Unknown collation: 'utf8mb4_0900_ai_ci'

```
sed -i 's/utf8mb4_0900_ai_ci/utf8mb4_unicode_520_ci/g' your_file.sql
```

- I would recommend utf8mb4_unicode_520_ci as being a compromise between 'general' and '0900' https://dba.stackexchange.com/questions/248904/mysql-to-mariadb-unknown-collation-utf8mb4-0900-ai-ci#comment490550_248904
- https://stackoverflow.com/questions/42385099/1273-unknown-collation-utf8mb4-unicode-520-ci
- this "workaround" can corrupt your data. Use alter > export> import if possible. https://github.com/drud/ddev/issues/1902#issuecomment-663856102
- https://mariadb.com/kb/en/supported-character-sets-and-collations/
- https://mariadb.com/kb/en/setting-character-sets-and-collations/

## utf8mb4 vs utf8

- Wordpress 4.2 introduced support for "utf8mb4" character encoding for security reasons https://stackoverflow.com/questions/29916610/1273-unknown-collation-utf8mb4-unicode-ci-cpanel/30248919#30248919
  - https://poststatus.com/the-trojan-emoji/

## describe database

```
show schemas;
select * from information_schema.schemata where schema_name = 'mydb';
```

- https://dataedo.com/kb/query/mariadb/list-schemas-in-database

## describe table

```
USE mydb;
SHOW TABLES;
SHOW FULL TABLES;
DESCRIBE mytable;
SHOW COLUMNS FROM mytable FROM mydb;
SHOW COLUMNS FROM mydb.mytable;
```

- https://mariadb.com/kb/en/show-tables/
- https://mariadb.com/kb/en/show-columns/

## Sshow tables in all databases

```sql
select table_schema,
    table_name
from information_schema.tables
where table_type = 'BASE TABLE'
    and table_schema not in ('information_schema','mysql',
                             'performance_schema','sys')
order by table_schema,
    table_name;
```

- https://dataedo.com/kb/query/mariadb/list-all-tables-in-all-databases

## sequelize

```javascript
const Sequelize = require('sequelize');

const sequelize = new Sequelize('database', 'username', 'password', {
    dialect: 'mariadb',
    dialectOptions: { connectTimeout: 1000 }
});
```

- https://sequelize.org/master/manual/dialect-specific-things.html#mariadb
- https://sequelize.org/v5/manual/dialects.html#mariadb
