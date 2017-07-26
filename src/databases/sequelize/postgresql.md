- http://docs.sequelizejs.com/variable/index.html#static-variable-DataTypes
- Automatically generate bare sequelize models from your database https://github.com/sequelize/sequelize-auto
## SERIAL

normally Sequelize.js adapt itself with the databse. So the autoincrement attribute corresponds to a serial type in PostgreSQL.

`id serial primary key`

equivalent of

```
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    }
```

https://stackoverflow.com/questions/15737949/how-does-autoincrement-work-in-nodejss-sequelize/15742968#15742968

## VARCHAR

`content varchar` eq of

```
    content: {
      type: Sequelize.TEXT,
    }
```

Also:

`Sequelize.STRING(32)`

https://stackoverflow.com/questions/16295118/how-do-i-define-sequelize-string-length/19341808#19341808
