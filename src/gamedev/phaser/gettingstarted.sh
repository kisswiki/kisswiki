#!/bin/bash
# https://phaser.io/phaser3/gettingstarted
TEMP="${PWD}/temp"
PROJ="${PWD}/game1"

##############################################################################
# GET TEMPLATE
##############################################################################

mkdir $TEMP && cd $TEMP
npm init -y
npm install phaser3-project-template
mv node_modules/phaser3-project-template $PROJ

##############################################################################
# INSTALL AND BUILD
##############################################################################

cd $PROJ
# Error: 'webpack' is not recognized as an internal or external command,
# Error: Can't resolve 'phaser'
npm i phaser
# Error: Can't resolve 'raw-loader'
npm i raw-loader
npm i webpack -D
npm run build

##############################################################################
# CLEAN
##############################################################################

# need to put it at the end for it to work on Windows

rm -rf $TEMP

##############################################################################
# SERVE
##############################################################################

# Failed to load file:///C:/Users/user/projects/phaser/game1/assets/logo.png
npm i -g serve
serve
# open http://localhost:5000/
