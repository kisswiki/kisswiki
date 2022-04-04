```javascript
db.collection.remove({ fieldName: { $ne: "value" } });

db.inventory.remove({ fieldName: { $nin: ["Apple", "Mango"] } });
```

https://stackoverflow.com/questions/24037772/how-to-remove-all-documents-from-a-collection-except-one-in-mongodb
