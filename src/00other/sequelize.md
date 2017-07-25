## quickstart

```javascript
const Sequelize = require('sequelize');
const sequelize = new Sequelize('database', 'username', 'password');
// Or you can simply use a connection uri
// const sequelize = new Sequelize('postgres://user:pass@example.com:5432/dbname');

const User = sequelize.define('user', {
  username: Sequelize.STRING,
  birthday: Sequelize.DATE
});

sequelize.sync()
  .then(() => User.create({
    username: 'janedoe',
    birthday: new Date(1980, 6, 20)
  }))
  .then(jane => {
    console.log(jane.get({
      plain: true
    }));
  });
```

- http://docs.sequelizejs.com/



- http://docs.sequelizejs.com/manual/installation/getting-started
