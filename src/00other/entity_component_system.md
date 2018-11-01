You may also read about actor model vs ecs. https://www.reddit.com/r/rust/comments/9i321m/the_first_live_build_of_citybound_with_rust_on/e6gudjf/

citybound is using actor model which allows it to work across network.

https://www.youtube.com/watch?v=qr9GTTST_Dk

peterjoel
 
ECS gives you a well-defined, centralised owner for each entity, and a way to track relationships and interactions without creating complicated hierarchies of references. Besides games, user interfaces in general can be easier to work with in Rust with ECS , but I'm sure there are other applications too.

kawgezaj
 
The pithy way to put it is that a typical GC runtime is just an ECS system under another name-- since, just like an ECS, it wants to be aware of all live references between "entities" (so that unreachable entities can be cleaned up) - and often it wants these references to be abstract "handles" or ID's, not bare pointers (so that it can implement its own memory management strategies-- memory compaction, etc.). Really all of this has a lot in common with an "in-memory database", it's just the way it's used that tends to be slightly different.

Guvante
 
Not that I know of at least using that phrasing. Games have a hard time with entanglement due to the way features get added and likely can benefit more from the performance boost.

Lots of other things just use a database which is similar in a lot of ways. Isolated data, all stored optimally with explicit access allowing safe concurrent changes. The main difference is the scale of usage and the language you are accessing it in.

Not saying ECS is just SQL for game objects just pointing out that similar benefits can be had without going full blown ECS.

Also note that ECS makes some things super complicated especially when you get into saying everything you touch. Complicated processes end up getting split up which is usually good but can sometimes hide things happening like when you don't realize you only found the first of three steps.

`__s`
 
I'm currently working at a company which is designing a wordpress like content platform, & I designed the DB in postgres like an ECS, ie there's an Entity table with an id column & all the data is stored in component tables which have a foreign key to the Entity id rather than an id of their own.

dagit

Non-expert here, but I did watch the talk by the dev from Chucklefish and read her extended blog version. Near the end she was saying that ECS are very basically a limited form SQL. She went on to say that games with real-time needs can't really afford the overhead of a SQL database so game devs sort of evolved their own solution that is more limited but has better performance for the operations they tend to need.

https://www.reddit.com/r/rust/comments/9srhuc/pyro_a_fast_small_and_documented_entity_component/
