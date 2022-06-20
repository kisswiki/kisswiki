- https://university.mongodb.com/courses/M320/about?_ga=2.78535444.1854559016.1653074010-395345014.1653074010

## Guy Harrison - MongoDB Performance Tunning

### Document Model

In JSON values may include values - nesting - in a relational database would require a separate table

BSON - similar to JSON

default structure of the documents in collection is not enforced

limit of nesting is 100 levels, 10 MB per document including subdocuments

can enforce schema with `validator` option, which is written in JSON schema.

### Protocol

Many diagnostics tools display data in protocol format.

Known as wire protocol.

Packets sent and recived over TCP/IP, by default on 27017 port.

Driver translates requests from a programming language into wire protocol.

### Commands

query, manipulation, data definition, administration

data definition and administration commands include some tools used to resolve performance problems.

`.find .sort .skip .limit`

find returns 1000 documents by default and next are requested with driver by `getMore` command.

find cannot join, aggregate can.

Also https://stackoverflow.com/questions/2578194/what-are-ddl-and-dml

`.aggegate(pipeline)`

most used operators in pipeline: `$match`, `$group`, `$sort`, `$project`, `$unwind` which returns one document for each element in an array, `$limit`, `$lookup`

### Query optimization

finds matching query in plan cache

else query that has lowest number of work units which correlates mostly with the number of documents to process

### Storage engines

Abstracts database storage from the underlaying storage medium and format: in memory, cloud objects, local disk.

WiredTiger is the default storage engine.
