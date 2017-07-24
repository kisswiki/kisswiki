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
