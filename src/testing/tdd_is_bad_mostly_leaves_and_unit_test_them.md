- https://reprog.wordpress.com/2010/04/23/testing-is-not-a-substitute-for-thinking-binary-search-part-3/
- https://news.ycombinator.com/item?id=3033129
  - https://www.infoq.com/news/2007/05/tdd-sudoku/
  - https://web.archive.org/web/20110926205016/https://www.writemoretests.com/2011/09/test-driven-development-give-me-break.html
  - http://norvig.com/sudoku.html
##

There are some important differences between incremental progress in algorithms and TDD, though.

One of the difference has been mentioned by JeffO: A test that verifies the correctness of the output data is separate from a test that asserts the performance between different implementation of the same algorithm (or different algorithms vying to give the same solution).

In TDD, one adds a new requirement in the form of a test, and this test shall initially not pass (red). Then the requirement is satisfied (green). Finally the code is refactored.

In algorithm development, the requirement usually doesn't change. The result correctness verification test is either written first, or shortly after a draft (highly confident but slow) implementation of the algorithm is completed. This data correctness test is seldom changed; one does not change it to fail (red) as part of the TDD rite.

However, in this aspect, data analysis is distinctly different from algorithm development, because data analysis requirements (both the input sets and the expected outcomes) are only defined loosely in human understanding. Thus the requirements change frequently on a technical level. This rapid change puts data analysis somewhere between algorithm development and general software application development - while still algorithm-heavy, the requirements are also changing "too fast" to the taste of any programmer.

If the requirement changes, it typically calls for a different algorithm.

In algorithm development, changing (tightening) the performance comparison test to fail (red) is silly - it does not give you any insight about potential changes to your algorithm that would improve performance.

Therefore, in algorithm development, both the correctness test and the performance test are not TDD tests. Instead, both are regression tests. Specifically, the correctness regression test prevents you from making changes to the algorithm that will break its correctness; the performance test prevents you from making changes to the algorithm that will make it run slower.

You can still incorporate TDD as a personal working style, except that the "red - green - refactor" ritual is not strictly necessary in nor particularly beneficial to the thought process of algorithm development.

I would argue that algorithm improvements actually result from making random (not necessary correct) permutations to the data flow diagrams of the current algorithm, or mixing and matching them between previously known implementations.

https://softwareengineering.stackexchange.com/questions/339855/tdd-like-approach-to-algorithmic-problems/339892#339892

##

IMO, most of the success stories for TDD are fake and just for the marketing purpose. There may be very few success with it, but only for small applications. I am working on a big silverlight application where TDD principles are used. The application has got hundreds of tests but it is still not stable. Several parts of the application are not testable because of the complex user interactions. Resulting tests with lot of mocks and hard to understand code.

Initially when we tried TDD, it all seems good. I was able to write lot of tests and mock out the parts that are tough for a unit test. Once you have a fair amount of code and an interface change is required, your are screwed. A lot of tests needs to be fixed and you will rewrite more tests than the actual change in the code.

Peter Norvig Explains his view on TDD in the Coders At Work book.

Seibel: What about the idea of using tests to drive design?

Norvig: I see tests more as a way of correcting errors rather than as a way of design. This extreme approach of saying, “Well, the first thing you do is write a test that says I get the right answer at the end,” and then you run it and see that it fails, and then you say, “What do I need next?”—that doesn’t seem like the right way to design something to me. It seems like only if it was so simple that the solution was preordained would that make sense. I think you have to think about it first. You have to say, “What are the pieces? How can I write tests for pieces until I know what some of them are?” And then, once you’ve done that, then it is good discipline to have tests for each of those pieces and to understand well how they interact with each other and the boundary cases and so on. Those should all have tests. But I don’t think you drive the whole design by saying, “This test has failed.”

https://softwareengineering.stackexchange.com/questions/41409/why-does-tdd-work/41703#41703

##

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

##

I work for a Danish municipality and we buy quite a lot of development from various software houses. Being the public sector we track and benchmark almost everything, and we actually have a dataset on automated testing that’s been running for two decades.

It’s hard to use the data, because we’re comparing different projects, teams and suppliers but our data shows no advantage in choosing the companies that are very test-focused.

They are often slower, more expensive but have the same amount of incident reports as the companies which tests less or doesn’t do automated test at all.

https://news.ycombinator.com/item?id=20976397

##

I'm grateful for what TDD did to open my eyes to automated regression testing, but I've long since moved on from the design dogma.

Test-first units leads to an overly complex web of intermediary objects and indirection in order to avoid doing anything that's "slow". Like hitting the database. Or file IO. Or going through the browser to test the whole system. It's given birth to some truly horrendous monstrosities of architecture. A dense jungle of service objects, command patterns, and worse.

https://dhh.dk/2014/tdd-is-dead-long-live-testing.html


##

Paweł Świątkowski Nie. Po prostu często nie można napisać testów kiedy nie wie się dokładnie jak ma wyglądać dana nowa rzecz. Wtedy piszę jej szkielet (kod taki który działa, ale potencjalnie niepoprawnie - zupełnie mnie to nie obchodzi). Kiedy jestem już zadowolony z API nowej klasy, modułu czy czego tam, WTEDY jest czas na napisanie pierwszych testów, zzielenienie ich, dopisanie testów do corner case'ów i EWENTUALNY refactoring.

Takie idealne TDD z prezek na konferencjach działa moim zdaniem tylko dla:
a) super dobrze zdefiniowanych problemów - co nigdy się nie zdarza w prawdziwym życiu
b) super prostych kwestii typu klasa Calculator
3

Roman Frołow Czyli tak jak pisałem:

- Structure your code so it is mostly leaves.
- Unit test the leaves.
- Integration test the rest if needed.

To nie jest już TDD imho.

Paweł Świątkowski A IMO jak najbardziej jest. Dopóki nie piszesz testów w osobnym commicie albo w ogóle w osobnym pull requeście bo "teraz trzeba szybko zafiksować, a testy kiedyś tam" - robisz TDD.

Bartosz Kostrowiecki To nie jest TDD.

W TDD Design API ma wyniknac z przypadkow uzycia testow, ktore napiszesz w pierwszej kolejnosci.

https://www.facebook.com/groups/turingi/2416340711986664/?comment_id=2416352271985508&reply_comment_id=2416362641984471&notif_id=1568726119030354&notif_t=group_comment
