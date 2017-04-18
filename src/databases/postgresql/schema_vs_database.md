A PostgreSQL "schema" is roughly the same as a MySQL "database". Having many databases on a PostgreSQL installation can get problematic; having many schemas will work with no trouble. So you definitely want to go with one database and multiple schemas within that database.

- http://stackoverflow.com/questions/1152405/postgresql-is-it-better-using-multiple-databases-with-1-schema-each-or-1-datab
- http://stackoverflow.com/questions/6508267/postgresql-create-schema-in-specific-database

Databases are physically separated and access control is managed at the connection level. If one PostgreSQL server instance is to house projects or users that should be separate and for the most part unaware of each other, it is therefore recommendable to put them into separate databases. If the projects or users are interrelated and should be able to use each other's resources they should be put in the same database, but possibly into separate schemas. Schemas are a purely logical structure and who can access what is managed by the privilege system.

http://stackoverflow.com/questions/28951786/postgresql-multiple-database-vs-multiple-schemas/32689664#32689664
