#!/bin/bash

DBNAME="$1"
DBROLE="$2"
DBPASS="$3"

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

eval "$cmd" << EOF
create table posts ( id serial primary key, title integer, content varchar, visible bool default false);
insert into posts (title, content, visible) values (1, 'content2', true);
EOF
