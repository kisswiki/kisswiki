I'd take a slightly different take:

- Structure your code so it is mostly leaves.
- Unit test the leaves.
- Integration test the rest if needed.

I like this approach in part because making lots of leaves also adds to the "literate"-ness of the code. With lots of opportunities to name your primitives, the code is much closer to being self documenting.
Depending on the project and its requirements, I also think "lazy" testing has value. Any time you are looking at a block of code, suspicious that it's the source of a bug, write a test for it. If you're in an environment where bugs aren't costly, where attribution goes through few layers of code, and bugs are easily visible when they occur, this can save a lot of time.

My leaves are either pure functions (FP languages) or value objects that init themselves based on other value objects (OOP languages). These value objects have no methods, no computed properties, etc. Just inert data.
No mocks and no “header” interfaces needed.
On top of that I sprinkle a bunch of UI tests to verify it’s all properly wired up.

https://news.ycombinator.com/item?id=15565875

I work for a Danish municipality and we buy quite a lot of development from various software houses. Being the public sector we track and benchmark almost everything, and we actually have a dataset on automated testing that’s been running for two decades.

It’s hard to use the data, because we’re comparing different projects, teams and suppliers but our data shows no advantage in choosing the companies that are very test-focused.

They are often slower, more expensive but have the same amount of incident reports as the companies which tests less or doesn’t do automated test at all.

https://news.ycombinator.com/item?id=20976397

I'm grateful for what TDD did to open my eyes to automated regression testing, but I've long since moved on from the design dogma.

Test-first units leads to an overly complex web of intermediary objects and indirection in order to avoid doing anything that's "slow". Like hitting the database. Or file IO. Or going through the browser to test the whole system. It's given birth to some truly horrendous monstrosities of architecture. A dense jungle of service objects, command patterns, and worse.

https://dhh.dk/2014/tdd-is-dead-long-live-testing.html
