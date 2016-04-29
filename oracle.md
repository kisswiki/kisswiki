# Oracle

## localhost:8080 already in use

```
C:\> netstat -ano | findstr 8080
  TCP    0.0.0.0:8080           0.0.0.0:0              LISTENING       2424
  TCP    [::]:8080              [::]:0                 LISTENING       2424

C:\> tasklist | findstr 2424
TNSLSNR.EXE                   2424 Services                   0     21 908 K

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
