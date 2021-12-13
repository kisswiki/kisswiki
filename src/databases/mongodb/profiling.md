`db.setProfilingLevel()` returns `2`.

`db.system.profile.find({"ns": "portal.users"}).sort({ts:-1}).limit(1).pretty()`:

```json
{
    "op" : "query",
    "ns" : "portal.users",
    "command" : {
        "find" : "users",
        "filter" : {
            "oauth" : {
                "$elemMatch" : {
                    "twitter.id" : "29691436"
                }
            }
        },
        "projection" : {},
        "limit" : 1,
        "singleBatch" : true,
        "batchSize" : 1,
        "lsid" : {
            "id" : UUID("887dfc7c-b3d3-4821-b554-fcc401aaa2ef")
        },
        "$db" : "portal"
    }
}
```

- https://stackoverflow.com/questions/37702894/mongodb-profiler-query-details#comment62883779_37702894
- https://docs.mongodb.com/manual/tutorial/manage-the-database-profiler/
- https://docs.mongodb.com/manual/reference/database-profiler/
- https://stackoverflow.com/questions/21832407/mongodb-logging-write-read-queries/21840417#21840417
- https://discourse.nixos.org/t/how-to-view-all-mongodb-queries/16582
- https://stackoverflow.com/questions/15204341/mongodb-logging-all-queries/21726027#21726027
- https://stackoverflow.com/questions/60526685/enquiry-system-profile
- [few commands to dig into mongodb profiling data](https://gist.github.com/yuriyvolkov/3414360)
- [MongoDB Profiler Cheat Sheet](https://gist.github.com/kgorman/134896c7414fde8e090b)
- https://studio3t.com/knowledge-base/articles/mongodb-query-performance/
- https://docs.huihoo.com/mongodb/3.2/tutorial/manage-the-database-profiler.html
- https://rockset.com/blog/handling-slow-queries-in-mongodb-part-1-investigation/
