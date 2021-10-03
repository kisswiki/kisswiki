## Why Red Hat does not have engineers to support btrfs?

You have to understand how most kernel teams work across all companies. Kernel engineers work on what they want to work on, and companies hire the people working on the thing the company cares about to make sure they get their changes in.

This means that the engineers have 95% of the power. Sure you can tell your kernel developer to go work on something else, but if they don't want to do that they'll just go to a different company that will let them work on what they care about.

This gives Red Hat 2 options. One is they hire existing Btrfs developers to come help do the work. That's unlikely to happen unless they get one of the new contributors, as all of the seasoned developers are not likely to move. The second is to develop the talent in-house. But again we're back at that "it's hard to tell kernel engineers what to do" problem. If nobody wants to work on it then there's not going to be anybody that will do it.

https://news.ycombinator.com/item?id=14912457

## A Heavily-Commented Linux Kernel Source Code

The current Linux kernel source code amount is in the number of millions of lines, the 2.6.0 version of the kernel code line is about 5.92 million lines, and the 4.18.X version of the kernel code is extremely large, and it has exceeded 25 million lines! So it is almost impossible to fully annotate and elaborate on these kernels. The 0.12 version of the kernel does not exceed 20,000 lines of code, so it can be explained and commented clearly in a book

- http://www.oldlinux.org/download/ECLK-5.0-WithCover.pdf
- [A Heavily-Commented Linux Kernel Source Code [pdf] | Hacker News](https://news.ycombinator.com/item?id=19225268)

## gate keepers

Just follow the LKML mailing list on this topic.

It all comes down to a single asshole Linux maintainer, Christoph Hellwig, who loudly complained about a tiny cosmetic aspect of the patch (something as important as the character case of a prefix of function names), and made it appear as an horrible end-of-the-world life-and-death decision, so much so that most other Linux maintainers, who for the most part don't understand a single word of the topic, just conclude that "if there is smoke, there must be fire", and just stayed clear of the topic.

For the minority who cared and understood the topic, it was an infuriating situation, and it was hard to keep calm. That's a trap, as someone who looks angry immediately loses community respect, so after a few burned people (try to argue with a troll), it felt also safer to stay clear of the topic.

Finally, the main maintainer of the interface (called the "crypto" interface even though it includes data compression), who's the only one in position to act and could express judgment on the merit of a troll's comment, is essentially himself in maintenance mode. Aka, he doesn't do anything, doesn't comment anything, and essentially acts as a roadblock. Most of the time, he just doesn't show up. In rare cases, after enough pressure has built up, he will accept contributions wholesale, without a single comment. So that its bar : it must "look fine" and "highly wanted", and then okay, no need to read, just include that. You can imagine that with a single warning signal coming from some random loud asshole, that's enough of an excuse for him to not move a finger.

And the infuriating part of the story is that the "tiny debatable issue" that the initial asshole loudly complained about was even quickly fixed by the zstd maintainer ! So there is nothing to complain about ! But do you think that the complainer would come back and acknowledge that his topic has been taken care of ? No, let's just inflict maximal damage just to feel powerful, let's act as if nothing happened and people who don't want to know more (which include the gatekeeper) might believe that the "invisible" problem might still be there, and thus stay clear of the topic.

And that's where we are. We, users, are denied the benefit of years of development, even after countless beta testers report flawless experiences and large gains, on the ground that a single asshole wanted to feel powerful enough to mess with someone else contribution on laughingly ridiculous trivia, and it works because the main gatekeeper is essentially lazy, quick to find excuses to not do anything, showing essentially no more incentive and no more interest into his own topic.

https://www.phoronix.com/forums/forum/software/general-linux-open-source/1281868-updated-zstd-implementation-for-the-linux-kernel-coming-soon?p=1281965#post1281965
