`pm2 start index.js --watch --ignore-watch "node_modules"`

with app name to restart/stop easily with name

`pm2 start index.js --watch --ignore-watch "node_modules" --name my-app`

show log without console.log

`pm2 log my-app`

show log with console.log

`pm2 logs my-app`

restart

`pm2 restart my-app`

stop

`pm2 stop my-app`

There is also `reload` and `delete`.

`--no-daemon` useful for docker etc. and logs will be output to stdout

`pm2 start index.js --watch --ignore-watch "node_modules" --name my-app --no-daemon`

- https://pm2.keymetrics.io/docs/usage/quick-start/
- https://stackoverflow.com/questions/29766723/how-to-automatically-reload-node-js-project-when-using-pm2/30695750#30695750
- https://pm2.keymetrics.io/docs/usage/watch-and-restart/
- https://stackoverflow.com/questions/45204172/how-to-kill-the-pm2-no-daemon-process/61358157#61358157
- https://pm2.keymetrics.io/docs/usage/process-management/
- https://stackoverflow.com/questions/36075460/make-pm2-log-to-console/61741675#61741675
