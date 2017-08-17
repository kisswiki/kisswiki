## describe table

`\d+ tablename`

https://stackoverflow.com/questions/109325/postgresql-describe-table

## list schemas

`select schema_name from information_schema.schemata`

or (without information_schema and pg_catalog):

`\dn`

https://dba.stackexchange.com/questions/40045/how-do-i-list-all-schemas-in-postgresql

## list tables in schema

`\dt public.*`

https://stackoverflow.com/questions/15644152/list-tables-in-a-postgresql-schema

## disable pager

`\pset pager off`

https://stackoverflow.com/questions/11180179/postgresql-disable-more-output/11183473#11183473

## show schema in prompt

`current_schema[()]`

Maybe combined with

```
%`command`
```

https://www.postgresql.org/message-id/4C127289.9040903%40gmail.com

But that runs a shell command, how's that supposed to get the search_path?  I've been trying to think up a solution to that and can't come up with one.
https://www.postgresql.org/message-id/AANLkTik4iTJU3U6ybkMvDMmKEZWKeV_clItFGBZ0--r_@mail.gmail.com

Yeah, and you do *not* want the prompt mechanism trying to send SQL commands...
https://www.postgresql.org/message-id/12197.1276287500%40sss.pgh.pa.us

- https://www.postgresql.org/docs/current/static/functions-info.html
- https://www.postgresql.org/docs/current/static/app-psql.html#APP-PSQL-PROMPTING

There are lots of things you can put into a prompt, but that doesn't appear to be one of them. Seems like a reasonable feature request.

https://www.postgresql.org/message-id/AANLkTinasGLjHCy4r2fUUPIrul_VDL4nA9QAc2RLMOoe%40mail.gmail.com

### Workarounds

```
\set shsh 'SHOW search_path;' 
:shsh
\set setsh 'SET search_path TO'
:setsh salesforce
```

You may add it to `~/.psqlrc`.

http://www.postgresql-archive.org/How-to-show-the-current-schema-or-search-path-in-the-psql-PROMP-td1925956.html

## .psqlrc

- helpful shorthands like show slow queries https://gist.github.com/tkalfigo/5695657
  - my fork https://gist.github.com/rofrol/ddf639243acff2e7dd0b50cb2e8cc7d8

## cheatsheet

https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546
