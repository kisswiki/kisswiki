- https://trailhead.salesforce.com/en/modules/salesforce_heroku_integration/units/getting_started_with_integration
- https://stackoverflow.com/questions/tagged/salesforce

- https://devcenter.heroku.com/articles/reading-data-from-salesforce-with-heroku-connect

Table of Contents

- SOAP API
- Bulk API
- Streaming API
- API call usage
- Resolving read errors

## General suggestions for integrations:

- To replicate data between Salesforce and Heroku, use Heroku Connect.
- To expose a Heroku Postgres database to Salesforce, use Heroku Connect External Object.
- To proxy OData, SOAP, XML, or JSON data sources into Salesforce, use Salesforce Connect.
- If Heroku Connect doesn’t fit the bill, like when you have a custom UI on Heroku where users log in via Salesforce, use the Salesforce REST APIs.
- To offload or extend the processing of Salesforce data events, use callouts from Salesforce to Heroku.
- To embed a custom UI from Heroku (or other external web app) into Salesforce, use Canvas.

https://trailhead.salesforce.com/en/modules/salesforce_heroku_integration/units/getting_started_with_integration

## Mapping

https://dashboard.heroku.com/apps/graylangur-backend/resources

click `Heroku Connect`

click `Create Mapping`

## checkboxes true

```javascript
for(input of document.querySelectorAll('td:first-child input[type="checkbox"]')) {
	input.checked = true;
}
```

## Errors when creating mapping for Contact object

### When enabling Streaming API

```
Unable to create mapping Contact in connection #6ebf2ab9-5777-4dbe-93dc-0aaf4fb315a1. {"code":"badconfig","message":"PushTopic check failed: Server raised fault: 'INVALID_TYPE: \n FROM PushTopic\n ^\nERROR at Row:2:Column:22\nsObject type 'PushTopic' is not supported. If you are attempting to use a custom object, be sure to append the '__c' after the entity name. Please reference your WSDL or the describe call for the appropriate names.'"}. Status code: 400 (HTTPError: error)
```

https://devcenter.heroku.com/articles/heroku-connect#mapping-objects

the problem might be with Professional Plan:

>Only the following editions support BigObject: Enterprise, Performance, Unlimited, and Developer. If you are using an edition other than these (such as Professional) you won't be able to use FieldHistoryArchive.

- https://salesforce.stackexchange.com/questions/179656/sobject-type-fieldhistoryarchive-is-not-supported
- https://salesforce.stackexchange.com/questions/187477/sobject-type-pushtopic-is-not-supported-when-creating-object-mapping-in-hero
- My ticket https://help.heroku.com/tickets/500813
- My question: heroku connect - cannot create mapping for Contact object with enabled "Write to Salesforce any updates to your database" https://developer.salesforce.com/forums#!/feedtype=SINGLE_QUESTION_DETAIL&dc=Developer_Forums&criteria=OPENQUESTIONS&id=9060G000000BhZzQAK
- Maybe relevant https://devcenter.heroku.com/articles/heroku-connect-faq#why-isn-t-connect-allowing-me-to-map-an-object-or-field


### When enabling Write to Salesforce

```
Error:Read-write mappings require an upsert field for syncing. Upsert fields must be defined as unique External ID fields in Salesforce.More Info...
Warning:Fields needed for insertion to Salesforce need to be mapped: LastName
```

- https://stackoverflow.com/questions/45585563/upsert-fields-must-be-defined-as-unique-external-id-fields-in-salesforce-herok


>Heroku Connect allows you to specify a unique external ID via the Upsert Field setting of the mapping configuration

- https://devcenter.heroku.com/articles/heroku-connect#upsert-field
- https://devcenter.heroku.com/articles/heroku-connect#mapping-objects


## Comparision of Salesforce plans

- https://salesforce.stackexchange.com/questions/187588/where-can-i-find-detailed-comparison-of-plans
- https://www.sfdcstatic.com/assets/pdf/datasheets/DS_SalesCloud_EdCompare.pdf
- What are the primary differences between the professional version of Salesforce and the enterprise version of Salesforce? https://success.salesforce.com/answers?id=90630000000DL7mAAG
  - https://help.salesforce.com/articleView?id=limits_general.htm&language=en_US&type=0
  - https://www.shellblack.com/administration/differences-between-professional-edition-and-enterprise-edition/
  - http://agilidi.com/how-to-choose-the-right-salesforce-com-edition-professional-vs-enterprise-vs-unlimited
- https://stackoverflow.com/search?q=%5Bsalesforce%5D+professional
- https://stackoverflow.com/questions/12401859/salesforce-api-supports-all-sales-cloud-editions
- https://stackoverflow.com/questions/16665661/salesforce-professional-edition-api-doesnt-support-all-fields-of-salesforce-con

## default schema in postgresql

You can also choose the Postgres schema to be used for the tables created by Heroku Connect. The default is salesforce however you can choose to put your tables in an existing schema, including public, as long as no tables exist in the schema.

https://devcenter.heroku.com/articles/heroku-connect

## change schema

`show search_path;`

`set search_path to myschema;`

or

`set search_path=myschema;`

https://stackoverflow.com/questions/34098326/how-to-select-a-schema-in-postgres-when-using-psql

## Select from different search path:

`select * from myschema.mytable;`

## change default postgresql schema

https://stackoverflow.com/questions/45730141/how-to-change-default-postgresql-schema-with-heroku-connect

## Don't create tables with ORM

>You should avoid creating mapped tables yourself. Heroku Connect will not replace an existing table when creating a new mapping and therefore, if the table is not created correctly, you will experience errors when syncing data. If you are using an ORM framework to model your mappings you should ensure that the framework does not attempt to create the underlying tables in the database.

https://devcenter.heroku.com/articles/heroku-connect-database-tables#salesforce-schema-changes

## doc

- https://devcenter.heroku.com/articles/heroku-external-objects-salesforce
- https://devcenter.heroku.com/articles/heroku-connect
- https://developer.salesforce.com/platform/heroku
- https://devcenter.heroku.com/articles/heroku-external-objects
- https://blog.heroku.com/heroku-external-objects
- https://developer.salesforce.com/blogs/developer-relations/2016/11/integrating-relational-data-salesforce-heroku-external-objects-heroku-postgres.html
- https://devcenter.heroku.com/articles/heroku-connect-database-tables#salesforce-schema-changes
- 
