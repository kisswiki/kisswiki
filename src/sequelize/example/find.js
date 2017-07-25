'use strict';
var Sequelize = require('sequelize');
var Post = require('./post');

const uri = 'postgresql://sequelize_trying:mypass@localhost:5432/sequelize_trying';
const sequelize = new Sequelize(uri);


var log = function (inst) {
  console.log(inst.get());
};

Post(sequelize, Sequelize).findAll({
  where: { visible: true },
})
.then(function (posts) {
  posts.forEach(log);

  sequelize.close();
});
