# Swagger

- http://stackoverflow.com/questions/tagged/swagger
- https://swaggerhub.com
- https://github.com/Gi60s/swagger-response
- http://swagger.io/specification/
- https://help.apiary.io/api_101/swagger-tutorial/
- http://bfanger.github.io/swagger-explained/
- http://stackoverflow.com/questions/32502026/create-complex-types-definitions-in-swagger
- http://stackoverflow.com/questions/30655552/swagger-specification-for-anything-other-than-http-get
- https://github.com/apigee-127/swagger-tools

## Full of bugs

I can't open do `swagger project edit` because it fails to open browser on Windows. If I do `swagger project edit -s` I can't go to `/#/edit`.

- https://github.com/swagger-api/swagger-node/issues/315
- http://stackoverflow.com/questions/35448203/swagger-project-create-command-line-error
- https://github.com/swagger-api/swagger-node/issues/457
- https://github.com/swagger-api/swagger-node/issues/351
- https://github.com/swagger-api/swagger-editor/issues/407

## quick start

```
$ npm install -g swagger
$ swagger project create hello-world
$ cd hello-world
$ swagger project edit
$ swagger project start
$ curl http://127.0.0.1:10010/hello?name=Scott
```

- https://github.com/swagger-api/swagger-node
  - https://github.com/swagger-api/swagger-node/blob/master/docs/quick-start.md (on Windows use cmd.exe - bash doesn't work, type 2 and enter to use express)
  - https://github.com/swagger-api/swagger-node/blob/master/docs/swagger-file.md
- https://scotch.io/tutorials/speed-up-your-restful-api-development-in-node-js-with-swagger

## Cons

https://dzone.com/articles/swagger-great

## YAML

- http://apigee.com/about/blog/developer/design-first-approach-building-apis-swagger
- http://editor.swagger.io/

## Flickr case

- https://dzone.com/articles/how-configure-swagger-generate
- https://github.com/flickr/flickr-api-swagger
- https://www.flickr.com/services/api/explore/flickr.activity.userComments

## operationId

operationId: This refers to the function, in the controller, in charge of the business logic.

https://scotch.io/tutorials/speed-up-your-restful-api-development-in-node-js-with-swagger

## Windows users

For some versions of npm on Windows will have problems on the npm install step of swagger project create. They are related to a debug module on npm not being managed properly. The following steps should resolve this issue:

In the project directory, execute the following commands:

```
npm install yamljs
npm install debug
npm install swagger-tools
```

Now, when you run swagger project start your project should start successfully.

https://github.com/swagger-api/swagger-node/blob/master/docs/quick-start.md

## validate/assert requests

- http://apigee.com/about/blog/developer/swagger-test-templates-test-your-apis
- https://github.com/earldouglas/swagger-test
- https://github.com/Maks3w/SwaggerAssertions
- Any tools to validate requests against a swagger doc? https://groups.google.com/forum/#!topic/swagger-swaggersocket/dU1--hVw6BI
- New to the swagger inflector project is request/response validation https://github.com/swagger-api/swagger-inflector/blob/master/README.md#payload-validation
- https://github.com/wonderlic/swagger-validation
