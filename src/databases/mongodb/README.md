run client

NOTE: There is no “create” command in the MongoDB shell. In order to create a database, you will first need to switch the context to a non-existing database using the use command. https://www.mongodb.com/basics/create-database

```
$ mongo
> show dbs
> use myDB
> db.getName()
> show collections
> db.collectionName.find()
```

- https://docs.mongodb.com/getting-started/shell/client/
- https://docs.mongodb.com/manual/reference/mongo-shell/
- https://docs.mongodb.com/manual/tutorial/access-mongo-shell-help/
- https://stackoverflow.com/questions/24985684/mongodb-show-all-contents-from-all-collections/29778560#29778560

## connect to remote

`mongo somewhere.mongolayer.com:10011/my_database -u username -p password`

or with connection string:

`mongo mongodb://username:password@somewhere.mongolayer.com:10011/my_database`

https://stackoverflow.com/questions/26813912/how-can-i-connect-to-a-remote-mongo-server-from-mac-os-terminal

## client

- https://stackoverflow.com/questions/6835042/is-there-a-mongodb-gui-desktop-application-for-linux
- https://askubuntu.com/questions/196136/what-is-a-good-mongodb-gui-client
- https://askubuntu.com/questions/739297/how-to-install-robomongo-on-ubuntu/781793
- https://stackoverflow.com/questions/17106315/failed-to-load-platform-plugin-xcb-while-launching-qt5-app-on-linux-without
- https://github.com/mrvautin/adminMongo

## fields of collection

`Object.keys(db.messages.findOne())`

https://stackoverflow.com/questions/5900792/how-to-view-document-fields-in-mongo-shell/26063468#26063468

## install

```
mkdir -p /c/data/{db,log}
mongod
```

https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/
