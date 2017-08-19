## config

Location is `~/.mongorc.js`

On windows set `%HOMEDRIVE%` correctly.

https://docs.mongodb.com/manual/reference/program/mongo/#environment

## prompt

in `~/.mongorc.js`:

```javascript
host = db.serverStatus().host;

prompt = function() {
             return db+"@"+host+"$ ";
         }
```

https://docs.mongodb.com/manual/tutorial/configure-mongo-shell/

## show current database

`db`

## list databases

`show dbs`

## use database

`use dbName`

## drop current database

`db.dropDatabase()`
