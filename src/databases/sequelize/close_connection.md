`sequelize.close()`

or gracefully

`sequelize.connectionManager.close().then(() => console.log('shut down gracefully'));`

https://github.com/sequelize/sequelize/issues/4711
