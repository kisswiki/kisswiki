// http://stackoverflow.com/questions/14458508/node-js-shell-command-execution/14510775#14510775
// http://stackoverflow.com/questions/18470689/nodejs-required-module-not-available-in-other-modules
var watch = require('fs').watch;
var shell = require("shelljs");

function ep() {
  shell.exec("git add -A");
  shell.exec("git commit -a -m \"\" --allow-empty-message");
  shell.exec("git push");
}

ep();

watch('.', (event, filename) => {
  // console.log(`event is: ${event}`);

  if (filename) {
    // console.log(`filename provided: ${filename}`);
    if(filename !== '.git') {
      ep();
    }
  } else {
    console.log('filename not provided');
  }
});
