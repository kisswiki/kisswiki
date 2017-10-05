## work_mem was set too low

Understanding your database configuration is important as well. I spent way longer than I'd like to admit trying to improve performance of complex query that would not execute the way I wanted it to no matter what, PostgreSQL absolutely refused to use a calculated index on one table and then do a HASH JOIN to a second, instead devolving into some really hairy execution plan I can't even remember at this point. Turns out, I had done everything right in my index design and query - but due to the sheer volume of data the query planner didn't use the "correct" plan because work_mem was set too low.
Always be mindful of how your database is tuned, you could be doing everything right but the query planner will seem to act insane regardless.

https://news.ycombinator.com/item?id=15409967
