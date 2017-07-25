find config: config_file_location.md

change line

`lc_messages=C`

then restart

`sudo systemctl restart postgresql`

If you provide value that isn't listed with `locale -a` (except `C`) and restart, you will see no error on the console.

## permission denied to set parameter "lc_messages"

`SET lc_messages TO 'en_US.UTF-8';`

- https://www.postgresql.org/docs/current/static/runtime-config-client.html
- https://www.postgresql.org/message-id/51C99E0D.70101%40gmail.com
