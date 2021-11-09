## config

Location is `~/.mongorc.js`

On windows set `%HOMEDRIVE%` correctly.

https://docs.mongodb.com/manual/reference/program/mongo/#environment

## prompt

in `~/.mongorc.js`:

```javascript
host = db.serverStatus().host;

prompt = function () {
  return db + "@" + host + "$ ";
};
```

https://docs.mongodb.com/manual/tutorial/configure-mongo-shell/

## show current database

`db`

## list databases

`show dbs`

## use database

`use dbName`

MongoDB only creates the database when you first store data in that database. This data could be a collection or even a document.

To add a document to your database, use the `db.collection.insert()` command.

```
> db.user.insert({name: "Ada Lovelace", age: 205})
WriteResult({ "nInserted" : 1 })
```

- https://www.mongodb.com/basics/create-database

## drop current database

`db.dropDatabase()`

## command line and eval

`mongo <dbname> --eval "db.dropDatabase()"`

- https://stackoverflow.com/questions/8857276/how-do-i-drop-a-mongodb-database-from-the-command-line/8857373#8857373
- https://stackoverflow.com/questions/4837673/how-to-execute-mongo-commands-through-shell-scripts

`show collections` does not work in eval.

Use `db.runCommand( { listCollections: 1.0, authorizedCollections: true, nameOnly: true } )`

https://docs.mongodb.com/manual/release-notes/4.0-compatibility/#std-label-4.0-compat-show-collections
