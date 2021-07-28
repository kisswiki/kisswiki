"use strict";
require("dotenv").config();
var Sequelize = require("sequelize");
var Post = require("./post");

const uri = `postgresql://${process.env.DBROLE}:${process.env.DBPASS}@localhost:5432/${process.env.DBNAME}`;
const sequelize = new Sequelize(uri);

var log = function (inst) {
  console.log(inst.get());
};

Post(sequelize, Sequelize)
  .findAll({
    where: { visible: true },
  })
  .then(function (posts) {
    posts.forEach(log);

    sequelize.close();
  });
