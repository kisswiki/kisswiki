- https://github.com/lschmierer/ecs_bench

## froggy

Ok, supposing the entity does know its components. And we decided that each system processes relevant entity data by iterating through entities first. Now we have another problem - growing the number of entities slows down every system, even the ones that are not related... Thus, different entities with no intersecting subsets of components start to affect each other indirectly.

- https://github.com/kvark/froggy/wiki/Component-Graph-System

- https://github.com/kvark/froggy
- https://www.reddit.com/r/rust_gamedev/comments/6b9q6g/froggy_03_release/
