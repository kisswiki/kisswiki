You should mock everything that has a side effect if you are doing unit tests. Reading input is a side effect(and blocking in this case) so it makes sense to stub it. You should not mock stuff that has no side-effects(except in very specific cases like long running calculations, but those are very rare and they require their own tests).

https://www.reddit.com/r/programming/comments/8cwa4o/dependency_injection_is_a_25dollar_term_for_a/

##

I see this type of mock-heavy testing in lots of places. I used to do the same thing too, but I found that it basically just tightly couples your test to your implementation details. The whole purpose of unit tests is to be able to refactor things with confidence that your tests will still pass. If you so closely tie your test to your implementation you lose that.
In the example, the tests now really care about how data is being retrieved from the database. Instead, I'd use an in-memory database (or even a Dockerized one). That would then also test that the right queries are being done, but you could still refactor the internals of UserServiceImpl (terrible name btw) and your tests wouldn't fail.


I tend to do mock-heavy testing in Java projects, and it has burned me several times. You write mock tests along your architectural boundaries, but if those need to change due to a deeper refactoring, all your tests need to get refactored as well.
Mock testing essentially tests expected side effects. A more powerful concept is the use of pure functions wherever possible, so that your tests compare input/output pairs, instead of long, difficult to maintain and sometimes non-exhaustive lists of expected side effects.


Take a look at Gary Bernhardt's talk "Boundaries"[1]. It touches on this very topic and was quite the eye-opener for me (having experienced all the same issues you've described).
[1]https://www.destroyallsoftware.com/talks/boundaries

https://news.ycombinator.com/item?id=13874824