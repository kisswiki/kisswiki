```
$ mongo
use csampledb1
db.csamplecol1.save({id:1, name:"sample name"})
db.copyDatabase(<from_db>, <to_db>, <from_hostname>:<port>, <username>, <password>);
```

- https://stackoverflow.com/questions/5495137/how-do-i-copy-a-database-from-one-mongodb-server-to-another
- https://dedunumax.wordpress.com/2012/12/16/how-to-copy-a-database-from-a-mongodb-instance-to-another/
