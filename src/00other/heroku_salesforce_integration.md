- https://trailhead.salesforce.com/en/modules/salesforce_heroku_integration/units/getting_started_with_integration

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

## Error: sObject type 'PushTopic' is not supported


the problem might be with Professional Plan:

>Only the following editions support BigObject: Enterprise, Performance, Unlimited, and Developer. If you are using an edition other than these (such as Professional) you won't be able to use FieldHistoryArchive.

- https://salesforce.stackexchange.com/questions/179656/sobject-type-fieldhistoryarchive-is-not-supported
- https://salesforce.stackexchange.com/questions/187477/sobject-type-pushtopic-is-not-supported-when-creating-object-mapping-in-hero
