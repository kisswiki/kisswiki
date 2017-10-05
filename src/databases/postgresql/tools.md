
## management/administration/view

- https://www.jetbrains.com/datagrip/
- pgadmin3 (better than pgadmin4)
- https://github.com/pgmodeler/pgmodeler
- https://www2.navicat.com/pl/products/navicat-for-postgresql
- https://github.com/serge-rider/dbeaver
  - commercial https://dbeaver.com/
- http://www.teampostgresql.com/
- unmaintained https://github.com/workflowproducts/postage
- disscussion https://news.ycombinator.com/item?id=15408800

## backup

- https://github.com/2ndquadrant-it/barman

## replication

- https://github.com/citusdata/citus

>The biggest issue with replication in PostgreSQL is restoring a failed master, pg_rewind provides the low-level plumbing to do this and it's somewhat integrated into repmgr now - but it's far from being easy to use compared to something like SQL Server Availability Groups. Being the sole Linux sysadmin / PostgreSQL DBA in my organization means I have to take responsibility for this since the tools are complex enough I can't easily throw them over to our Windows admins or SQL Server DBA's in an emergency. This is partially an issue with staffing, but if the tooling was a little easier to understand and robust enough in fully-automatic operation I could just leave common troubleshooting steps in a runbook, but right now when replication breaks it REALLY breaks.
> https://news.ycombinator.com/item?id=15410467
