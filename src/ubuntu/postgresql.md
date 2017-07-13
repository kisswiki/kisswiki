```
echo deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc) main >> /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt install postgresql
```

- https://www.postgresql.org/download/linux/ubuntu/
- https://askubuntu.com/questions/831292/how-to-install-postgresql-9-6-on-any-ubuntu-version
