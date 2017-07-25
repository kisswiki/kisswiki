#!/bin/bash

export $(cat .env | grep -v ^# | xargs)
echo "DBNAME: $DBNAME"
echo "DBROLE: $DBROLE"

eval "psql $DBNAME $DBROLE" << EOF
create table posts (id serial primary key, title integer, content varchar, visible bool default false);
insert into posts (title, content, visible) values (1, 'content2', true);
insert into posts (title, content, visible) values (2, 'content2', true);
EOF 
