// http://stackoverflow.com/questions/14458508/node-js-shell-command-execution/14510775#14510775
// http://stackoverflow.com/questions/18470689/nodejs-required-module-not-available-in-other-modules
var chokidar = require('chokidar');
var shell = require("shelljs");

shell.exec('git add -A');
shell.exec('git commit -a -m "" --allow-empty-message');
shell.exec('git push');

var watcher = chokidar.watch('file, dir, glob, or array', {
  ignored: /[\/\\]\.git/,
  persistent: true
});

watcher
.on('add', path => {
  shell.exec('git add -A');
  shell.exec('git commit -a -m "" --allow-empty-message');
  shell.exec('git push');
})
.on('change', path => {
  shell.exec('git commit -a -m "" --allow-empty-message');
  shell.exec('git push');
});
