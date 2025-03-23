- Id Software Programming Principles https://news.ycombinator.com/item?id=13731741
  - http://programmingisterrible.com/post/139222674273/write-code-that-is-easy-to-delete-not-easy-to
  - https://www.bloomberg.com/graphics/2015-paul-ford-what-is-code/
  - Greg Young - The art of destroying software https://vimeo.com/108441214
  - prefer duplication over the wrong abstraction https://www.sandimetz.com/blog/2016/1/20/the-wrong-abstraction
- http://natureofcode.com/book/introduction/
- Fundamental Concepts in Programming Languages - CHRISTOPHER STRACHEY  https://www.itu.dk/courses/BPRD/E2009/fundamental-1967.pdf
  -  It is a beautiful paper and everybody can read and understand it. So, please do so. You will be much enlightened. https://stackoverflow.com/questions/210835/what-is-referential-transparency
- https://github.com/mr-mig/every-programmer-should-know
- `Premature Generalization.md`

## Good data structures simplify code

Show me your [code] and conceal your [data structures], and I shall continue to be mystified. Show me your [data structures], and I won't usually need your [code]; it'll be obvious.[1]

Bad programmers worry about the code. Good programmers worry about data structures and their relationships.[1][2][3]

What he is saying is that good data structures make the code very easy to design and maintain, whereas the best code can't make up for poor data structures.[2]

Rule of Representation: Fold knowledge into data so program logic can be stupid and robust.

I always do it the other way around (when starting software from scratch):
0. write the simplest mock/pseudo-code I can think of for the business logic that needs to be implemented
1. extract from this ideal code the data structure that it needs in order to actually be so simple and write real code that implements these ideal data structures
2. write the real code that actually does the work
[3]

- [1] https://lwn.net/Articles/193244/
- [2] https://softwareengineering.stackexchange.com/questions/163185/torvalds-quote-about-good-programmer
- [3] https://news.ycombinator.com/item?id=4560334

## About

a constant war against machines and against other programmers who produce unmaintainable and unreadable code

https://vaporsoft.net/am-i-sexist/


> I tend to read things like this as "Trust me, I know what I'm doing". As I step back having dealt with a lot of developers code, I'm more and more coming down on the mindset of I'd rather most developers NOT have the ability to be clever or too smart. I'm not smart enough to keep up.
For every smart, capable, well reasoned developer there are a thousand blindly copy/pasting and pulling together an application until "there it works!". Which then ships and down the line someone ends up maintaining. The more Swift can protect me from that future being a painful mess, the better.
> https://www.reddit.com/r/swift/comments/4zouci/my_least_favorite_thing_about_swift/

- http://www.kalzumeus.com/2011/10/28/dont-call-yourself-a-programmer/

>“But even the hacker who works alone,” said Master Foo, “collaborates with others, and must constantly communicate clearly to them, lest his work become confused and lost.”
>
>“Of what others do you speak?” the Prodigy demanded.
>
>Master Foo said: “All your future selves.”
>
>Upon hearing this, the Prodigy was enlightened.
>
>-- http://catb.org/esr/writings/unix-koans/prodigy.html


## Learn

- A curated list of games that can teach you how to learn a programming language https://github.com/michelpereira/gamesofcoding
  - https://news.ycombinator.com/item?id=13566247
- https://medium.com/@ipestov/collection-of-coders-games-to-improve-your-skills-9ea02906d73
- http://norvig.com/21-days.html
  - https://twitter.com/stephensenn/status/538017638111531009?lang=en
  - https://www.reddit.com/r/programming/comments/44kpzk/peter_norvig_being_good_at_programming/
  - https://michaelwhatcott.com/10-years/
  - https://news.ycombinator.com/item?id=3439772
  - https://jvns.ca/blog/2015/02/17/how-i-learned-to-program-in-10-years/
  - http://wiki.c2.com/?TeachYourselfProgrammingInTenYears
- https://teachyourselfcs.com/
- https://makecode.microbit.org

### mobile apps

- https://www.sololearn.com/
- https://codengo.net/

## Popularity

- https://medium.com/@hoffa/the-top-weekend-languages-according-to-githubs-code-6022ea2e33e8
- http://www.tiobe.com/tiobe-index/
- http://statisticstimes.com/tech/top-computer-languages.php
- https://www.benfrederickson.com/ranking-programming-languages-by-github-users/

## exercises

- https://leetcode.com
- https://www.hackerrank.com
