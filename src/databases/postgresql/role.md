- http://stackoverflow.com/questions/5189026/how-to-add-a-user-to-postgresql-in-windows
- https://www.cyberciti.biz/faq/howto-add-postgresql-user-account/
- https://www.postgresql.org/docs/current/static/sql-createrole.html

`psql -U postgres -c "CREATE ROLE Eric LOGIN" mydb`

`psql -U postgres -c "CREATE ROLE Eric LOGIN PASSWORD 'mypass'" mydb`

https://stackoverflow.com/questions/5189026/how-to-add-a-user-to-postgresql-in-windows