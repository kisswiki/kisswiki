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
DROP DATABASE IF EXISTS $DBNAME;
CREATE DATABASE $DBNAME;
DROP ROLE IF EXISTS $DBROLE;
CREATE ROLE $DBROLE LOGIN PASSWORD '$DBPASS';
ALTER DATABASE $DBNAME OWNER TO $DBROLE;
EOF
