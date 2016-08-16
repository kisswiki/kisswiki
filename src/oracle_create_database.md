> XE is limited to one database per server
> http://programmers.stackexchange.com/questions/154370/development-environment-to-manage-multiple-oracle-databases

> 2 Creating a Database User
> You should create at least one database user that you will use to create database objects. A database user is a type of database object: a user is associated with a database schema, you connect to the database as a database user, and the database user is the owner of any database objects (tables and so on) that you create in the schema associated with the user.
> https://docs.oracle.com/cd/E17781_01/admin.112/e18585/toc.htm#XEGSG110

> 2 Creating and Configuring an Oracle Database
> Reasons to create a database after installation are as follows:
> - You used Oracle Universal Installer (OUI) to install software only, and did not create a database.
> - You want to create another database (and database instance) on the same host computer as an existing Oracle database. In this case, this chapter assumes that the new database uses the same Oracle home as the existing database. You can also create the database in a new Oracle home by running OUI again.
> - You want to make a copy of (clone) a database.
> https://docs.oracle.com/database/121/ADMIN/create.htm#ADMIN11068

<br>

> Databases use server resources: CPU, RAM, disk I/O. Unless your server is physically partitioned (e.g. Solaris Zones) or you are using VMs it is a really bad idea to host multiple databases on the same server. You are just creating an environment where contention will be rife and tuning will be even trickier than normal.
> Oracle RDBMS has always been designed to host multiple schemas in the one database, and for different applications that is the way to go. This is one of the main differences between Oracle and (say) MS SQL Server or MySQL.
> Oracle has this new pluggable pill in their latest release 12.1.0.1 of the database which is supposed to address the "multiple database vs. multiple schema" discussion. Now you can plug a database into the multitenant container database - CDB.
> http://dba.stackexchange.com/questions/47387/best-practice-either-create-multiple-databases-or-multiple-users/

<br>

> When you create a user in Oracle, you're creating a schema. A schema is a collection of tables and related objects (views, functions, stored procedures, etc) specific to that schema. So each developer could have their own user/schema, and work independently of one another. Access to other users can be granted, and public synonyms can be created to ensure that YOUR_TABLE points to a YOUR_TABLE in a specific schema, without the need to specify that schema. But this can eat space...
> If there is shared development, might be best to have a single schema so everyone is working on the same copy.
> http://stackoverflow.com/questions/5079616/how-can-i-create-and-access-multiple-databases-in-oracle-11g

<br>
- http://stackoverflow.com/questions/9534136/how-to-create-a-new-database-after-initally-installing-oracle-database-11g-expre
- Creating a Database with the CREATE DATABASE Statement https://docs.oracle.com/cd/B28359_01/server.111/b28310/create003.htm
