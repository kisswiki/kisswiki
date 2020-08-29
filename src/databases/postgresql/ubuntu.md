```
# Create the file repository configuration:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt-get update

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get -y install postgresql
```

- https://www.postgresql.org/download/linux/ubuntu/
- https://askubuntu.com/questions/831292/how-to-install-postgresql-9-6-on-any-ubuntu-version
- older version https://help.ubuntu.com/community/PostgreSQL

## remove

```
dpkg -l | grep postg
sudo apt remove --purge postgresql postgresql-9.6 postgresql-client-9.6 postgresql-client-common postgresql-common postgresql-contrib-9.6
sudo systemctl list-units --all | grep postg
systemctl stop system-postgresql.slice
```

https://askubuntu.com/questions/32730/how-to-remove-postgres-from-my-installation
