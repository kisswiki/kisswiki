>> One other curiosity is about how Iron fits into the new Hyper-Tokio stack. Iron is currently a framework for adding middleware, and also a collection of middleware. Now that Tokio exists and its primary feature is compostability of middleware, will Iron just become a collection of Tokio middleware?
> Currently Iron 's handler is a synchronized one, which might not fit into futures/tokio model out of box. So I guess there will be some redesign to port Iron to tokio. Or use a thread pool.
> https://m.reddit.com/r/rust/comments/51zy7h/iron_first_impressions/d7gckhr
