- https://github.com/lschmierer/ecs_bench

## froggy

Ok, supposing the entity does know its components. And we decided that each system processes relevant entity data by iterating through entities first. Now we have another problem - growing the number of entities slows down every system, even the ones that are not related... Thus, different entities with no intersecting subsets of components start to affect each other indirectly.

- https://github.com/kvark/froggy/wiki/Component-Graph-System

- https://github.com/kvark/froggy
- https://www.reddit.com/r/rust_gamedev/comments/6b9q6g/froggy_03_release/

## specs

a parallel ECS

The discussion on implementing a thread safe ECS that ended up becoming specs IMO was really interesting and still worth taking a look at.

http://www.shadercat.com/overview-of-open-source-game-engines-in-rust/

https://github.com/amethyst/amethyst/wiki/ECS-Design-Crossroads

## misuse

Component Systems Misuse
Component-based entity systems are very common these days but are also frequently misused. This is probably due to the similarity of components and previous entity systems or maybe just the simple desire to save time during development.

Components should act as a blueprint with only a description for the system implementing it. The biggest mistake developers make is putting all the functionality inside the components, such as update and draw.

https://shaneenishry.com/blog/2014/12/27/misconceptions-of-component-based-entity-systems/

##

There are two main benefits.

The first is flexibility. It lets you add and remove components as the game runs (this is what /u/The_Jare is referring to). It lets you design whole systems that track information per-entity without modifying any existing data structures. It lets you use different data structures as appropriate to each system.

The second is performance. When your program can iterate through a contiguous array of components that contains only the data it needs, it will utilize the CPU cache far more effectively than if it had to chase pointers to heterogenous entity objects. Splitting up entities like this also makes it easier to use special-purpose data structures because you don't have to cram entire entities into them.

ECS isn't the only way to get these benefits, nor is it necessarily the best one all the time. It's just one technique that games can benefit from, and which can benefit from a library.


There is a great talk at GDC this year about how Overwatch's tech does ECS called "'Overwatch' Gameplay Architecture and Netcode".
Currently this is behind the gdcvault paywall, but it was popular. So it might be pushed to youtube soon. Keep an eye out:)

https://www.reddit.com/r/rust_gamedev/comments/6i7was/entity_component_systems_and_rust/
