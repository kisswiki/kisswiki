- https://devcenter.heroku.com/articles/heroku-postgresql
- https://devcenter.heroku.com/articles/connecting-to-heroku-postgres-databases-from-outside-of-heroku
- https://devcenter.heroku.com/articles/heroku-cli
- https://dashboard.heroku.com/apps/your_application/resources
- https://data.heroku.com

`heroku pg:info --app your_app`

`heroku pg:psql DATABASE_URL --app your_app`

## test bidir connection

`update salesforce.contact set email = 'test@example.com' where id = 1;`

## psql command line tips

Establish a connection to your database

`$ heroku pg:psql DATABASE_URL --app graylangur-backend`

List tables in the connect schema:

`# \dt salesforce.*;`

Query from a table:

`# select * from salesforce.account;`

Set the search path:

`# set search_path=salesforce, public;`

Show the list of all schemas

`# \dn`

https://connect.heroku.com/sync/6ebf2ab9-5777-4dbe-93dc-0aaf4fb315a1/settings/database

## change env

locally:

```
heroku config:set STRIPE_KEY=sk_test_123123 --app app_name
heroku restart --app app_name
```

on website:

```
More -> Login ssh
echo $STRIPE_KEY
```

- https://devcenter.heroku.com/articles/config-vars
- https://stackoverflow.com/questions/14612695/how-to-restart-a-rails-server-on-heroku

## login ssh

- ? https://devcenter.heroku.com/changelog-items/1112

## deploy with git

https://dashboard.heroku.com/apps/<app_name>/deploy/heroku-git
