I am, however, against using sequences (or serial integers in Postgres) for
reasons of scaling and replication across multiple copies of a database
running on different servers.

My preferred method is to give every table an ID column of UUID type and
generate a UUID using the uuid-ossp contrib module. This also prevents
someone not familiar with the database design from using an ID somewhere
they should not (as is possible with natural PKs) or treating the ID as an
integer, not an identifier (as is all too common with serial integers).

https://www.postgresql.org/message-id/CAH_wARuc1cLVCE49F3sPErBMkWYnMgi2tqBMGD22HdG1RDCybA@mail.gmail.com

##

There are better ways to store UUIDs: 

char(32)    <-- Easy to work with, fixed length, inefficient 
varchar(32) <-- 4 bytes larger due to variable size 
bytea()     <-- 20 bytes, variable length 
bit(128)    <-- 16 bytes, optimal 

I don't like char() or varchar() because of case-senstivity and 
inefficiency. 

We used bytea, and created a small function byte2guid() and guid2byte() 
to handle converting to/from strings when working at a SQL prompt.  But 
the production code doesn't use those.  In retrospect, I would like to 
have tried BIT(128) since I think fixed-length columns perform better 
than variable-length columns. 

http://www.postgresql-archive.org/varchar-as-primary-key-td1880643.html
