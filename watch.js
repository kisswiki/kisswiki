// http://stackoverflow.com/questions/14458508/node-js-shell-command-execution/14510775#14510775
// http://stackoverflow.com/questions/18470689/nodejs-required-module-not-available-in-other-modules
var chokidar = require('chokidar');
var shell = require("shelljs");

shell.exec('git add -A');
shell.exec('git commit -a -m "" --allow-empty-message');
shell.exec('git push');

var watcher = chokidar.watch('.', {
  ignored: [
    '.git',
    'node_modules',
    '.idea',
    '.gitignore' // I had to add this, or chokidar would repeatdly fire `on` event
  ],
  persistent: true,
  ignoreInitial: true
});

watcher
.on('add', function (path) {
  console.log('add '+ path);
  shell.exec('git add -A');
  shell.exec('git commit -a -m "" --allow-empty-message');
  shell.exec('git push');

})
.on('change', function (path) {
  console.log('change '+path);
  shell.exec('git commit -a -m "" --allow-empty-message');
  shell.exec('git push');
});
