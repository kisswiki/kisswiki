# Functional programming

- https://github.com/hemanth/functional-programming-jargon

## FP vs OO

fp don't use assignment (mutation is reserved for specific sections) - no concurrent update problems

- The overriding difference between a functional language and a non-functional language is that functional languages don't have assignment statements

- what OO really comes down to is that OO languages replace function pointers with convenient polymorphism

http://blog.cleancoder.com/uncle-bob/2014/11/24/FPvsOO.html

## The semantic problem with hierarchies

The idea of building software on top of a tree-shaped ontology would be broken even if our knowledge fit neatly into a tree. Ontologies are not used to build the real world, they are used to describe it from observation. As we learn more, we are constantly updating our ontology, sometimes moving everything around.

In software, this is incredibly destructive: Moving everything around breaks everything.

http://raganwald.com/2014/03/31/class-hierarchies-dont-do-that.html

## Composition over Inheritance

https://medium.com/humans-create-software/composition-over-inheritance-cb6f88070205

## Humor
- https://twitter.com/old_sound/status/674298612785000452
- http://code.tutsplus.com/tutorials/as3-101-oop-additional-concepts--active-7412#step_the_ultimate_mnemonic_device
- http://imgur.com/Q0vFcHd

## pros/cons

- Ask HN: Is functional programming really worth it? https://news.ycombinator.com/item?id=1191167
- https://storify.com/realtalktech/5-absurd-lies-of-functional-programmer-shills
- pissed off about functional programming http://www.perlmonks.org/?node_id=450922
- http://flyingfrogblog.blogspot.be/2016/05/disadvantages-of-purely-functional.html via https://www.facebook.com/groups/217169631654737/permalink/1085555794816112/

### cons

- http://stackoverflow.com/questions/1786969/pitfalls-disadvantages-of-functional-programming/
  - the real challenge in multicore programming is taking advantage of CPU caches to make sure cores aren't starved of data, a problem that has never been addressed in the context of Haskell (...) This leaves a big question mark over the purely functional programming paradigm. This is the price you pay for abstracting away time and space, which was always the major motivation behind this declarative paradigm.
  - Functional idioms often do lots of inversion-of-control or laziness, which often has a negative impact on debugging (using a debugger). (This is somewhat offset by FP being much less error-prone due to immutability/referential transparency, which means you'll need to debug less often.)
  - easy to add new functions for existing datatypes, but it's "hard" to add new datatypes
- Functional programming has one big advantage: it avoids (on conceptual level) 'states' during the runtime. Thus, the value of a term is always predetermined by the input. https://www.researchgate.net/post/What_are_the_advantages_and_disadvantages_of_functional_programming

### pros

- "immutability/referential transparency, which means you'll need to debug less often" ... and since everything is built of little independent functions, you can just test those directly; if each function is (a) a correct little function or (b) a correct composition of two or more correct little functions then wham! your program is correct http://stackoverflow.com/questions/1786969/pitfalls-disadvantages-of-functional-programming/#comment2238664_1786999
