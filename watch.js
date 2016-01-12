// http://stackoverflow.com/questions/14458508/node-js-shell-command-execution/14510775#14510775
// http://stackoverflow.com/questions/18470689/nodejs-required-module-not-available-in-other-modules
var chokidar = require('chokidar');
var shell = require("shelljs");

var watcher = chokidar.watch('.', {
  ignored: [
    '.git',
    'node_modules',
    '.idea'
  ],
  persistent: true
});

watcher
.on('add', function (path) {
  console.log('add '+ path);
  // on is always triggered during start
  shell.exec('git add -A');
  shell.exec('git commit -a -m "" --allow-empty-message');
  shell.exec('git push');
})
.on('change', function (path) {
  console.log('change '+path);
  shell.exec('git commit -a -m "" --allow-empty-message');
  shell.exec('git push');
});
