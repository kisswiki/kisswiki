#!/bin/bash

no_psql_in_path=true
which psql && no_psql_in_path=false
echo "no_psql_in_path: $no_psql_in_path"

macos_setup() {
    brew install postgres && \
    brew services start postgresql
}

ubuntu_setup() {
    echo "Installing on Linux"
    echo deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main | sudo tee /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
    sudo apt update && \
    sudo apt install -y postgresql
}

# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
        $no_psql_in_path && ubuntu_setup
        cmd="sudo -u postgres psql"
        ;;
    Darwin*)
        $no_psql_in_path && macos_setup
        cmd="psql postgres" # Mac OS
        ;;
    *)
esac
echo ${cmd}

DBNAME='graylangur'
DBROLE='graylangur'
DBPASS='mypass'

eval "$cmd" << EOF
DROP DATABASE IF EXISTS $DBNAME;
CREATE DATABASE $DBNAME;
DROP ROLE IF EXISTS $DBROLE;
CREATE ROLE $DBROLE LOGIN PASSWORD '$DBPASS';
ALTER DATABASE $DBNAME OWNER TO $DBROLE;
EOF
