#!/bin/bash

export $(cat .env | grep -v ^# | xargs)
echo "DBNAME: $DBNAME"

# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
        cmd="sudo -u postgres psql"
        ;;
    Darwin*) # Mac OS
        cmd="psql postgres"
        ;;
    *)
esac
echo ${cmd}

psql $DBNAME $DBROLE << EOF
create table posts ( id serial primary key, title integer, content varchar, visible bool default false);
insert into posts (title, content, visible) values (1, 'content2', true);
insert into posts (title, content, visible) values (2, 'content2', true);
EOF 
