# Oracle

- create user http://stackoverflow.com/questions/9447492/how-to-create-a-user-in-oracle-11g-and-grant-permissions

## localhost:8080 already in use

Let's find out what occupies 8080

```
C:\> netstat -ano | findstr 8080
  TCP    0.0.0.0:8080           0.0.0.0:0              LISTENING       2424
  TCP    [::]:8080              [::]:0                 LISTENING       2424
```

Now get the executable name

```
C:\> tasklist | findstr 2424
TNSLSNR.EXE                   2424 Services                   0     21 908 K
```

Change the port on which oracle web listens on

```
C:\>sqlplus /nolog
SQL*Plus: Release 10.2.0.1.0 - Production on Tue Aug 26 10:40:44 2008
Copyright (c) 1982, 2005, Oracle.  All rights reserved.

SQL> connect
Enter user-name: system
Enter password: <enter password if will not be visible>
Connected.

SQL> Exec DBMS_XDB.SETHTTPPORT(3010); [Assuming you want to have HTTP going to this port]
PL/SQL procedure successfully completed.

SQL>quit
```

http://stackoverflow.com/questions/142868/change-oracle-port-from-port-8080

## SID

SID - The name of your instance.

An Instance, is an Instance of the RDBMS software. An instance MOUNTS a controlfile, (alter database mount) In this controfile are written the location of the datafiles. the collection of datafiles (okay, and the controlfile(s) ) == the database.

A database has a name, the db_name, and (optionally) a domain (db_domain) --> together global_db_name. Now imagine you're replicating (DataGuard) your database. You'd like to keep the DB_name the same, right? (I mean: data-wise, it's the SAME database) But then how to identify the two 'versions' of your database? Enter ' DB_UNIQUE_NAME'.

http://serverfault.com/questions/49509/oracle-difference-between-sid-db-name-db-domain-global-database-name-service/51944#51944

The SID is a site identifier https://asktom.oracle.com/pls/asktom/f?p=100:11:0::NO::P11_QUESTION_ID:318216852435

namespace - me :D

## command line

```
echo -e "drop user paab cascade; \n drop user paabwork cascade;" | sqlplus -s system/${ORACLE_SYSTEM_PASSWORD}@localhost:1521/xe
exit | sqlplus -s system/${ORACLE_SYSTEM_PASSWORD}@localhost:1521/xe @usersPAAB.sql
```

## get users and roles

```
select * from dba_roles;
select * from dba_users;
select username from dba_users;
```

- http://stackoverflow.com/questions/20725581/how-to-list-all-the-roles-existing-in-oracle-database
- http://stackoverflow.com/questions/22451252/how-to-find-the-users-list-in-oracle-11g-db
