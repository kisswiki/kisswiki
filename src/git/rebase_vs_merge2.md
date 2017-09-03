https://www.reddit.com/r/programming/comments/6uagiu/the_ins_and_outs_of_a_solid_git_workflow/

Essense:

if you have non-linearities, you can very easily end up with situations where the problem is ultimately tracked down to a commit with two parents. In these situations, you may end up getting totally screwed because the merge commit can be large, and neither parent commit shows the bug on its own.

The absolute gold standard in a git commit history is:

- linear
- with every single individual commit passing all unit and regression tests available at the time

The reason why is because it makes your history maximally useful: if you discover a problem, and can verify that this problem didn't exist e.g. one month ago, you have a linear sequence of changes where the repo should be a valid state after every single change. It makes your bisect extremely efficient and meaningful.

If there are commits that leave the code in an inconsistent state, then you can basically get false positives in your bisect. You have a test for correctness that passes today, fails a month ago, but may also fail at random points in between unrelated to the real problem, because unrelated trivial commits left the code inconsistent (as an example of inconsistent: a function name is changed, but the calling code still uses the old name, leading to compilation or runtime errors depending if you're static or dynamic typed). Note that a true "consistent state" is impossible to achieve, the code in master can't always be correct! But it can be at least correct against its own automated tests.

On the other hand, if you have non-linearities, you can very easily end up with situations where the problem is ultimately tracked down to a commit with two parents. In these situations, you may end up getting totally screwed because the merge commit can be large, and neither parent commit shows the bug on its own.

Both merge and rebase are accurate records of what really happened. The thing is that with a rebase, you have to do a bit of extra work at the end to push. That extra work is part of what happened too.

Let's consider a repo that runs all automation tests on every single commit. Let's consider two devs, Al and Betty. Master has moved 3 commits past them, ABC, while they have to merge their own branch with 3 commits, 123. Al will merge, Betty will rebase.

Al will have run the automation tests on his own work. And the automation tests have already run on master. So ABC are tested without 123, and vice versa. But there is only a single point of testing that includes both of them, the merge commit.

Betty does a rebase first. Before she pushes, all the tests have to pass. That means that 1 passes tests, accounting for ABC (because 1 has been rebased onto C). 2 passes tests, accounting for ABC1. And 3 passes tests accounting for everything.

If some interaction between the ABC and 123 branches jointly causes a failure, you have 3 separate points to observe it: 1, 2, and 3. If you merge, you only have the merge commit.

The long and short is that when you merge, you are foregoing doing a bit of extra work now, but you are leaving information on the table that you can get for free from your automated tests, and also leaving the history in a state where it's harder to inspect or bisect later on. Viewed yet another way: merging causes most of your tests to be run with stale information. When you rebase first, you are using the most up-to-date picture of upstream to verify your own work.

The only real time I see a strong use for merging, is when a history is shared. If you have 100 devs, and 10 people are working on a branch for 3 months, you can't just rebase that off master willy nilly, because it invalidates peoples work. In this case you need more complex strategies, and every team will be different. You could still avoid merging by say agreeing that at the end of the week everything needs to be checked into the branch, and then rebasing the branch off master. But that may or may not be practical. In many cases you end up doing merges but the merge commits go downstream, from master into the branch. Even here, I still think that the branch should at the end of its lifetime, get rebased prior to getting pushed into master. But it may be a pain.

tl; dr if you have a branch that is yours only and you have any automated testing, rebasing is strictly better than merging. In other situations it's more complicated. Some (but not all) the benefit is lost if you don't run tests per commit but in a more granular way (i.e. if you only run tests on 123 as a whole, or if you only run them nightly, etc).
