### homebrew

```
brew install postgres
brew services start postgresql
psql postgres -c "CREATE ROLE graylangur LOGIN PASSWORD 'g12345'"
psql postgres -c "CREATE DATABASE graylangur WITH OWNER = graylangur"
```

load service with plist instead of brew services:

```
brew ls --verbose postgres | grep plist
launchctl load path/to/plist
```

- <https://stackoverflow.com/questions/7975556/how-to-start-postgresql-server-on-mac-os-x>
- <https://dba.stackexchange.com/questions/131943/cannot-log-in-with-default-user-on-mac-10-10>

## Old

1. Install Homebrew
2. brew install postgres
3. brew services start postgresql
4. `initdb /usr/local/var/postgres` # do I need this?
5. `createuser -s postgres`
6. `psql -U postgres`

<https://stackoverflow.com/questions/15301826/psql-fatal-role-postgres-does-not-exist/35308200#35308200>

