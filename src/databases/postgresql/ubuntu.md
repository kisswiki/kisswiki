```
echo deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main >> /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt install postgresql
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
