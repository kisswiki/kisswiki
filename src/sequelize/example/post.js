'use strict';

function PostFunction (sequelize, Sequelize) {
  var Post = sequelize.define('post', {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    title: {
      type: Sequelize.INTEGER,
    },
    content: {
      type: Sequelize.TEXT,
    },
    visible: {
      type: Sequelize.BOOLEAN,
      defaultValue: false,
    },
  }, { timestamps: false });

  return Post;
}

module.exports = PostFunction;
