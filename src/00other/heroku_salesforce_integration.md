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

When enabling Streaming API:

```
Unable to create mapping Contact in connection #6ebf2ab9-5777-4dbe-93dc-0aaf4fb315a1. {"code":"badconfig","message":"PushTopic check failed: Server raised fault: 'INVALID_TYPE: \n FROM PushTopic\n ^\nERROR at Row:2:Column:22\nsObject type 'PushTopic' is not supported. If you are attempting to use a custom object, be sure to append the '__c' after the entity name. Please reference your WSDL or the describe call for the appropriate names.'"}. Status code: 400 (HTTPError: error)
```

When enabling Write to Salesforce:

```
Error:Read-write mappings require an upsert field for syncing. Upsert fields must be defined as unique External ID fields in Salesforce.More Info...
Warning:Fields needed for insertion to Salesforce need to be mapped: LastName
```

https://devcenter.heroku.com/articles/heroku-connect#mapping-objects

the problem might be with Professional Plan:

>Only the following editions support BigObject: Enterprise, Performance, Unlimited, and Developer. If you are using an edition other than these (such as Professional) you won't be able to use FieldHistoryArchive.

- https://salesforce.stackexchange.com/questions/179656/sobject-type-fieldhistoryarchive-is-not-supported
- https://salesforce.stackexchange.com/questions/187477/sobject-type-pushtopic-is-not-supported-when-creating-object-mapping-in-hero


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
