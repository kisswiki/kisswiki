- https://university.mongodb.com/courses/M320/about?_ga=2.78535444.1854559016.1653074010-395345014.1653074010

## Guy Harrison - MongoDB Performance Tunning

### Architecture and Concepts

#### Document Model

In JSON values may include values - nesting - in a relational database would require a separate table
var SearchLastActive = {
anytime: "Anytime",
last24hours: "Last 24 hours",
last3days: "Last 3 days",
last7days: "Last 7 days",
last30days: "Last 30 days",
last365days: "Last 365 days",
};

var SearchComments = {
withOrWithout: "With or without comments",
with: "With comments",
withUnresolved: "With unresolved comments",
};

var SearchPlace = {
everywhere: "everywhere",
personal: "personal",
team: "team",
};

function escapeRegExp(regex) {
return regex;
}

var SORT_COLUMNS_MAP = {
name: "nameLowercase", // TODO: this field doesn't exist
status: "status.state",
lastModified: "updatedAt",
};

var user = {
\_id: "624de5fcfa2b0b3fd0a3d5d5",
};

var basicObjectSearchClause = {
isRemoved: { $ne: true },
};

var ThreadStatus = {
RESOLVED: "resolved",
UNRESOLVED: "unresolved",
};

var pipelineGetThreads = (userId) => [
{
$lookup: {
      from: "threads",
      localField: "shortId",
      foreignField: "entityShortId",
      as: "threadsOnEntityDoc",
      pipeline: [
        { $match: { isRemoved: { $ne: true } } },
        {
          $lookup: {
            from: "threads-read-status",
            localField: "shortId",
            foreignField: "threadShortId",
            as: "threadReadStatus",
            pipeline: [{ $match: { upToDate: true, userId } }],
          },
        },
        {
          $group: {
            _id: "$entityShortId",
read: { $sum: { $size: "$threadReadStatus" } },
unresolved: {
$sum: {
                $cond: [{ $eq: ["$status", ThreadStatus.UNRESOLVED] }, 1, 0],
},
},
count: { $sum: 1 },
          },
        },
      ],
    },
  },
  {
    $unwind: { path: "$threadsOnEntityDoc", preserveNullAndEmptyArrays: true },
},
];

var DEFAULT_FOLDER_NAME = "Untitled folder";
var DEFAULT_FLOWCHART_NAME = "Untitled flowchart";

var defaultNameSelectorQuery = {
$ifNull: [
    "$name",
{
$cond: [
        { $eq: ["$type", "Folder"] },
DEFAULT_FOLDER_NAME,
DEFAULT_FLOWCHART_NAME,
],
},
],
};

var projectedEntityValues = {
\_id: "$_id",
  name: defaultNameSelectorQuery,
  nameLowercase: { $toLower: defaultNameSelectorQuery },
  collaborators: "$collaborators",
shortId: "$shortId",
  privateId: "$privateId",
author: "$author",
  createdAt: "$createdAt",
updatedAt: "$updatedAt",
  permissions: "$permissions",
hasPassword: { $toBool: "$password" },
modifiedAt: "$modifiedAt",
  openedAt: "$openedAt",
sizeOnDisk: "$sizeOnDisk",
  sequence: "$sequence",
children: "$children",
  cacheId: "$cacheId",
status: {
lastChange: {
at: "$status.lastChange.at",
      by: {
        _id: "$lastChangeUserDoc.\_id",
name: "$lastChangeUserDoc.name",
        email: "$lastChangeUserDoc.email",
},
},
notify: {
$map: {
        input: "$notifyUsersDoc",
as: "notifyUser",
in: {
\_id: "$$notifyUser._id",
          name: "$$notifyUser.name",
email: "$$notifyUser.email",
        },
      },
    },
    state: "$status.state",
  },
  folder: "$folder",
  type: "$type",
  participants: {
    $map: {
      input: "$participants",
      as: "participant",
      in: {
        _id: "$$participant.\_id",
name: "$$participant.name",
        avatar: "$$participant.avatar",
userType: "$$participant.userType",
        isOnline: false,
      },
    },
  },
  threads: {
    unread: { $subtract: ["$countThreads", "$readThreads"] },
    unresolved: "$unresolvedThreads",
count: "$countThreads",
},
teamDoc: 1,
projectDoc: 1,
};

var page = 1,
pageSize = 10,
sortOrder = "asc",
sortColumn = "name",
place = SearchPlace.everywhere,
team,
lastActive = SearchLastActive.anytime,
comments = SearchComments.withOrWithout;

var searchRegex = new RegExp(`.*${escapeRegExp(q)}.*`, "is");

// TODO: `nameLowercase` field does not exits, why is it here ?
var mappedSortColumn = SORT_COLUMNS_MAP[sortColumn] || "nameLowercase";
var sortParam = { [mappedSortColumn]: sortOrder === "asc" ? 1 : -1 };

var personalPlace = {
author: user.\_id,
$or: [{ team: { $exists: false } }, { team: null }],
...basicObjectSearchClause,
};
var teamPlace = (team) => ({
team: new Types.ObjectId(team),
...basicObjectSearchClause,
});

var matchSearch = {
$or: [
{ input: { $regex: searchRegex } }, // flowchart only
{ name: { $regex: searchRegex } },
],
};

// cannot use `find` or `count` here, because `input` field will be stripped by mongoose as it's not in EntityDB

var matchOwned =
place === SearchPlace.everywhere
? basicObjectSearchClause
: place === SearchPlace.personal
? personalPlace
: teamPlace(team);

var matchLastActive = (lastActive) => {
switch (lastActive) {
case SearchLastActive.last24hours:
return {
modifiedAt: { $gt: new Date(Date.now() - DAY) },
};
case SearchLastActive.last3days:
return {
modifiedAt: { $gt: new Date(Date.now() - 3 \* DAY) },
};
case SearchLastActive.last7days:
return {
modifiedAt: { $gt: new Date(Date.now() - WEEK) },
};
case SearchLastActive.last30days:
return {
modifiedAt: { $gt: new Date(Date.now() - MONTH) },
};
case SearchLastActive.last365days:
return {
modifiedAt: { $gt: new Date(Date.now() - YEAR) },
};
default:
return {};
}
};

var commentsLookup = {
$lookup: {
    from: "threads",
    localField: "shortId",
    foreignField: "entityShortId",
    as: "threadsOnEntityDoc",
    ...(comments === SearchComments.withUnresolved && {
      pipeline: [
        {
          $match: {
            $expr: {
              $eq: ["$status", "unresolved"],
},
},
},
],
}),
},
};

var matchQuery = [
{ $match: matchOwned },
  { $match: matchSearch },
  { $match: matchLastActive(lastActive) },
  ...(comments !== SearchComments.withOrWithout
    ? [{ $match: { type: "Drawing" } }]
    : []),
  ...(comments !== SearchComments.withOrWithout ? [commentsLookup] : []),
  ...(comments !== SearchComments.withOrWithout
    ? [
        {
          $unwind: {
            path: "$threadsOnEntityDoc",
preserveNullAndEmptyArrays: false,
},
},
]
: []),
];

var result = db.getCollection("publicshares").aggregate([
...matchQuery,
{
$graphLookup: {
      from: "publicshares",
      startWith: "$folder",
connectFromField: "folder",
connectToField: "\_id",
depthField: "depth",
as: "folderHierarchy",
},
},
{
$lookup: {
      from: "participation",
      localField: "_id",
      foreignField: "entity",
      as: "usersOnEntityDoc",
    },
  },
  {
    $unwind: {
      path: "$usersOnEntityDoc",
preserveNullAndEmptyArrays: true,
},
},
{
$lookup: {
      from: "users",
      localField: "usersOnEntityDoc.user",
      foreignField: "_id",
      as: "userDoc",
    },
  },
  { $unwind: { path: "$userDoc", preserveNullAndEmptyArrays: true } },
...(place !== SearchPlace.personal
? [
{
$lookup: {
from: "projects",
localField: "project",
foreignField: "_id",
as: "projectDoc",
},
},
]
: []),
...(place !== SearchPlace.personal
? [
{
$unwind: {
path: "$projectDoc",
preserveNullAndEmptyArrays: true,
},
},
]
: []),
...(place !== SearchPlace.personal
? [
{
$lookup: {
from: "teams",
localField: "projectDoc.team",
foreignField: "_id",
as: "teamDoc",
},
},
]
: []),
...(place !== SearchPlace.personal
? [{ $unwind: { path: "$teamDoc", preserveNullAndEmptyArrays: true } }]
: []),
...pipelineGetThreads(user.\_id),
{
$group: {
      _id: "$\_id",
author: { $first: "$author" },
createdAt: { $first: "$createdAt" },
updatedAt: { $first: "$updatedAt" },
name: { $first: "$name" },
folder: { $first: "$folder" },
permission: { $first: "$permission" },
privateId: { $first: "$privateId" },
modifiedAt: { $first: "$modifiedAt" },
openedAt: { $first: "$openedAt" },
shortId: { $first: "$shortId" },
status: { $first: "$status" },
sizeOnDisk: { $first: "$sizeOnDisk" },
type: { $first: "$type" },
roles: { $first: "$roles" },
password: { $first: "$password" },
children: { $first: "$children" },
participants: {
$push: {
          _id: "$userDoc.\_id",
name: "$userDoc.name",
          avatar: "$userDoc.avatar",
},
},
readThreads: {
$first: {
          $ifNull: ["$threadsOnEntityDoc.read", 0, "$threadsOnEntityDoc.read"],
        },
      },
      unresolvedThreads: {
        $first: {
          $ifNull: [
            "$threadsOnEntityDoc.unresolved",
0,
"$threadsOnEntityDoc.unresolved",
          ],
        },
      },
      countThreads: {
        $first: {
          $ifNull: [
            "$threadsOnEntityDoc.count",
0,
"$threadsOnEntityDoc.count",
          ],
        },
      },
      teamDoc: { $first: "$teamDoc" },
projectDoc: { $first: "$projectDoc" },
},
},
{ $project: { ...projectedEntityValues, roles: "$roles" } },
{
$addFields: {
      "team.slug": "$teamDoc.slug",
"team.avatar": "$teamDoc.avatar",
      project: "$projectDoc.\_id",
},
},
{ $project: { unread: 0, unresolved: 0, teamDoc: 0, projectDoc: 0 } },
{ $sort: sortParam },
{ $skip: pageSize \* (page - 1) },
{ $limit: pageSize },
]);

BSON - similar to JSON

default structure of the documents in collection is not enforced

limit of nesting is 100 levels, 10 MB per document including subdocuments

can enforce schema with `validator` option, which is written in JSON schema.

### Protocol

Many diagnostics tools display data in protocol format.

Known as wire protocol.

Packets sent and recived over TCP/IP, by default on 27017 port.

Driver translates requests from a programming language into wire protocol.

#### Commands

query, manipulation, data definition, administration

data definition and administration commands include some tools used to resolve performance problems.

`.find .sort .skip .limit`

find returns 1000 documents by default and next are requested with driver by `getMore` command.

find cannot join, aggregate can.

Also https://stackoverflow.com/questions/2578194/what-are-ddl-and-dml

`.aggegate(pipeline)`

most used operators in pipeline: `$match`, `$group`, `$sort`, `$project`, `$unwind` which returns one document for each element in an array, `$limit`, `$lookup`

#### Query optimization

Query optimization is determining the optimal path to the data.

if optimizer finds matching query in plan cache then uses it

else uses query that has lowest number of work units which correlates mostly with the number of documents to process

#### Storage engines

Abstracts database storage from the underlaying storage medium and format: in memory, cloud objects, local disk.

WiredTiger is the default storage engine.

### Tools of the Trade

`explain()`, profiler, `ServerStatus()`, `CurrentOp()`, Compass tool - GUI

#### Introduction to explain()

```javascript
var cursor = db.customers.explain().find();
var doc = cursor.next();
// Look at most nested `inputStage`/`inputStages` or use tool `mongoTuning.quickExplain(doc)`
printjson(doc.queryPlaner.winningPlan);
mongoTuning.quickExplain(doc);
```

most fundamental procedures

- COLLSCAN - entire collection scanned without using index
- IXCAN - use of index to find documents
- SORT - sorting documents without using index

`doc.queryPlanner.rejectedPlans[1]`.

`stage` is root, `inputStage`/`inputStages` are children.

Plan was rejected after query was executed first time and optimizer estimated the amount of work. The plan with lowest estimate wins.

`explain('executionStats')` reports on performance of each steap of a plan. May take much longer than simple `explain()` and place siginificant load on the server.

most significant stats

- executionTimeMillisEstimate
- keysExamined
- docsExamined

`mongoTuning.executionStats(doc)`

In the example there is no longer `SORT` - MongoDB was able to use index to return documents in sorted order without an explicit sort.

#### The Query Profiler

How do we find the statements that are generating that IO and from there identify the index required? This is where the MongoDB profiler comes in.

```shell
> db.getProfilingStatus()
{ was: 0, slowms: 100, sampleRate: 1, ok: 1 }
> db.getProfilingStatus()
> db.setProfilingLevel(0)
> db.createCollection("system.profile", {capped: true, size:10485760 })
> db.setProfilingLevel(2)
{ was: 0, slowms: 100, sampleRate: 1, ok: 1 }
> db.getProfilingStatus()
{ was: 2, slowms: 100, sampleRate: 1, ok: 1 }
```

#### Tuning with MongoDB Logs

https://github.com/rueckstiess/mtools

### Tuning MongoDB Code

#### Tunning Aggregation Pipelines

For `explain().aggregation(pipeline)`, `queryPlanner` resides in `stages[0].$cursor.queryPlanner`.

`stages` array contains each of the aggregation stages as individual objects. `stages` arrays show information about each subsequent step in the aggregation pipeline. MongoDB can merge and reorder aggregation stages during execution.

### Other

`tail -f /opt/homebrew/var/log/mongodb/mongo.log`
