- https://devcenter.heroku.com/articles/heroku-postgresql
- https://devcenter.heroku.com/articles/connecting-to-heroku-postgres-databases-from-outside-of-heroku
- https://devcenter.heroku.com/articles/heroku-cli
- https://dashboard.heroku.com/apps/your_application/resources
- https://data.heroku.com
- http://vitomd.com/blog/coding/deploy-a-javascript-node-app-to-heroku-in-20-minutes/

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

## add remote for existing app

`heroku git:remote -a app_name`

https://devcenter.heroku.com/articles/git#for-an-existing-heroku-app

## deploy with git

```
git remote add heroku https://git.heroku.com/app-name.git
git push heroku
```

https://dashboard.heroku.com/apps/<app_name>/deploy/heroku-git

## force redeploy

`npm version patch && git push heroku master`

https://coderwall.com/p/_x2ang/force-redeploy-of-node-js-project-on-heroku

## bash

`heroku run -a <app_name> bash`

When doing deploy, it will on new dyno, so you will have different files. You need to relogin to bash.

https://twitter.com/kevinMrr/status/558675159700103169

## restart app

`heroku restart -a app_name`

https://stackoverflow.com/questions/14612695/how-to-restart-a-rails-server-on-heroku

## logs

- https://dashboard.heroku.com/apps/app_name/logs

`heroku logs -a app-name`

more lines:

`heroku logs -n 500 -a app-name`

- https://devcenter.heroku.com/articles/logging#log-retrieval

## NODE_ENV isn't set by default for my app

- https://stackoverflow.com/questions/21831945/heroku-node-env-environment-variable
- https://stackoverflow.com/questions/22954782/install-devdependencies-on-heroku

## set env in batch from .env

```
heroku config:set NODE_ENV=production -a app-name
heroku config:set NPM_CONFIG_PRODUCTION=true -a app-name
for i in `cat .env`; do echo $i; heroku config:set $i -a app-name; done
```

- programatic access https://devcenter.heroku.com/articles/heroku-local#copy-heroku-config-vars-to-your-local-env-file
- https://devcenter.heroku.com/articles/config-vars#programmatic-access
- https://devcenter.heroku.com/articles/platform-api-reference#config-vars

## Error R14 (Memory quota exceeded) heroku node

changed to newer node, maybe this helped

## npm's devDependencies aren't installed when NPM_CONFIG_PRODUCTION=true

https://devcenter.heroku.com/articles/nodejs-support#devdependencies

## deploy with git

`git push heroku`

https://devcenter.heroku.com/articles/git

## heroku Error: secret option required for sessions

probably setting

`heroku config:set SESSION_SECRET=YourSessionSecretgoeshere -a app-name`

fixed this

https://stackoverflow.com/questions/18617091/secret-option-required-for-app-useexpress-cookiesession

## mutliple environments

https://devcenter.heroku.com/articles/multiple-environments

## Memory quota exceeded

- use `Procfile`:

```
web: node --optimize_for_size --max_old_space_size=460 --gc_interval=100 app.bundle.js

```

 and `postinstall` to compile:

```
     "postinstall": "webpack && webpack --config webpack.config.backend.js"
```

- free has 512 MB RAM https://devcenter.heroku.com/articles/dyno-types#available-dyno-types
- https://devcenter.heroku.com/articles/ruby-memory-use
- https://serverfault.com/questions/714534/heroku-error-r14-memory-quota-exceeded-using-node-js
- https://stackoverflow.com/questions/43146940/error-r14-memory-quota-exceeded-heroku-node

## procfile

use a Procfile to declare various process types, such as multiple types of workers, a singleton process like a clock, or a consumer of the Twitter streaming API

- https://devcenter.heroku.com/articles/procfile
- https://devcenter.heroku.com/articles/heroku-local#copy-heroku-config-vars-to-your-local-env-file

## postinstall

- https://devcenter.heroku.com/articles/nodejs-support#heroku-specific-build-steps
- https://stackoverflow.com/questions/35939678/getting-an-error-when-deploying-to-heroku-faliled-to-load-resource-404-bundle

## babel-exec not found

move babel-cli to dependencies

Setting `NPM_CONFIG_PRODUCTION=false` didn't work somehow.

- https://stackoverflow.com/questions/36781542/package-json-start-script-babel-node-not-found-on-heroku-deploy
- https://medium.com/@Cuadraman/how-to-use-babel-for-production-5b95e7323c2f

## nodemon

>This is assuming you don't really need nodemon

https://stackoverflow.com/questions/22618930/heroku-failing-to-start-my-node-app-because-its-trying-to-do-it-with-nodemon/22619372#22619372

## “secret” option required

`heroku config:set SESSION_SECRET=YourSessionSecretgoeshere -a app-name`

https://stackoverflow.com/questions/18617091/secret-option-required-for-app-useexpress-cookiesession

## deploying node

- https://devcenter.heroku.com/articles/deploying-nodejs
- https://devcenter.heroku.com/articles/node-best-practices
- https://devcenter.heroku.com/articles/nodejs-support

## specify node version

in `package.json`:

```
  "engines": {
    "node": "8.4.0"
  },
```

or `current` instead of `8.4.0`.

https://devcenter.heroku.com/articles/nodejs-support#specifying-a-node-js-version

## local development

- https://devcenter.heroku.com/articles/heroku-local

## free plan - SLEEPS AFTER 30 MINS OF INACTIVITY

https://www.heroku.com/pricing

## metrics

https://devcenter.heroku.com/articles/metrics
