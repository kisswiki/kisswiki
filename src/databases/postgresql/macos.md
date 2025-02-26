
1. Install Homebrew
2. brew install postgres
3. brew services start postgresql
4. `initdb /usr/local/var/postgres` # do I need this?
5. `createuser -s postgres`
6. `psql -U postgres`

https://stackoverflow.com/questions/15301826/psql-fatal-role-postgres-does-not-exist/35308200#35308200