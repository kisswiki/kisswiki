# Functional programming

- https://github.com/hemanth/functional-programming-jargon
- What makes functional programming so viable for problem modeling? https://github.com/staltz/ama/issues/4
- https://github.com/evancz/functional-programming-in-elm/blob/master/SUMMARY.md

## About

The core of Functional Programming is thinking about data-flow rather than control-flow

Functional programming means, that your program is composed out of functions. A function only depends on its input parameters and the effect of applying a function is the returned function result. By this definition, functions don't have side effects.

Why do functions and functional programming matter?

- Functions are a very nice abstraction. Looking at the input and output values gives you the complete information about the data flow. This makes functions very easy to reason about.
- With the absence of side effects, you also have no unintended side effects, which plague all code which modifies state.
- Functions are easily testable, they do not depend on an environment but just the function parameters.
- For the same input a function necessarily always returns the same result, this also makes reasoning about a programs behavior easier.
- As a consequence that they only depend on their inputs, functions usually are very composeable.

While for certain tasks, modifying a global state can be the most efficient way of performing a computation, functional programming does not have to be slow, and in many cases the resulting program might even be faster. There are several reasons for this:

- With the lack of side-effects, functional programs can be relatively easy parallelized.
- With only local state involved, compilers can optimize the code inside functions more aggressively.

There are pure functional languages, but most modern languages allow you to write your program in a functional style. So it is possible to mix functional with object oriented programming.

https://news.ycombinator.com/item?id=15141549

## FP vs OO

fp don't use assignment (mutation is reserved for specific sections) - no concurrent update problems

- The overriding difference between a functional language and a non-functional language is that functional languages don't have assignment statements

- what OO really comes down to is that OO languages replace function pointers with convenient polymorphism

http://blog.cleancoder.com/uncle-bob/2014/11/24/FPvsOO.html

### Elm encourages a strict separation of data and logic, and the ability to say this is primarily used to break this separation. This is a systemic problem in Object Oriented languages that Elm is purposely avoiding.

"this" is associated with mutation. Elm is an immutable language.  

In theory, one could have immutable objects where data and logic are grouped together. 
The best expression I've seen so far is the FauxO system in Gary Bernhardt's Boundaries talk.

I'm not saying that "this" implies mutation only that it is associated with mutating the current object. 

Of course one can write immutable objects using "this" but in OO languages you can also use it to mutate the state of the object. 

https://groups.google.com/forum/#!msg/elm-discuss/NKCbXMLNkBA/_DhP5wHwAgAJ

### Clean Architecture for Functional Programming

The vehemence with which some folks claim that FP and OO are antithetical is amusing.  A message is a function call.  A function call is a message.  The two are isomorphic.   

- In smalltalk you might say: obj msg arg.   
- In java you might say obj.msg(arg);.   
- In C you might say msg(obj, arg);   
- In Erlang you might say obj ! {msg, arg}. 

These are not fundamentally different concepts.  There are some technical differences: The C statement isn’t polymorphic, and the Erlang statement crosses a thread boundary.  But those are details. 

Over the last few decades we’ve gotten all bolluxed up with the idea that there is something special about OO that makes it fundamentally different from Structured Programming, or Functional Programming.  This isn’t quite true.  Programming is programming.   It’s all about functions and data.   

What we’ve learned over the last five decades is what _not_ to do; not so much what _to_ do.   

Structured Programming is programming without goto.  (Discipline imposed upon direct transfer of control). 
OO Programming is programming without pointers to functions. (Discipline imposed upon indirect transfer of control). 
Functional Programming is programming without assignment statements.  (Discipline imposed upon state). 

The fact that these three paradigms are _subtractive_ rather than additive means that they are all mutually compatible.  If you want to be structured, OO, and Functional, then don’t use goto, pointers to functions, and assignment. 

https://groups.google.com/forum/#!topic/clean-code-discussion/S2NQ65OZ0b8

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

>The problem with object-oriented languages is they’ve got all this implicit environment that they carry around with them. You wanted a banana but what you got was a gorilla holding the banana and the entire jungle. --  Joe Armstrong, the creator of Erlang
>
>-- https://medium.com/@cscalfani/goodbye-object-oriented-programming-a59cda4c0e53

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
