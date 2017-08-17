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

- https://www.postgresql.org/docs/current/static/functions-info.html
- https://www.postgresql.org/docs/current/static/app-psql.html#APP-PSQL-PROMPTING

There are lots of things you can put into a prompt, but that doesn't appear to be one of them. Seems like a reasonable feature request.

https://www.postgresql.org/message-id/AANLkTinasGLjHCy4r2fUUPIrul_VDL4nA9QAc2RLMOoe%40mail.gmail.com
