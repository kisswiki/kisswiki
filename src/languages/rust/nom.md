If I had a dime for each time I've seen someone report that they needed to parse, went with nom as the 'default option', and ended up complaining about macros, I'd have, uh, a dollar maybe. I wonder if there's anything we can or should do as a community about this situation? This is nothing against nom which is likely the best fit for many use cases, but the perception of it as "the Rust solution to parsing" is maybe not optimal.

/u/arcoain, have you looked into combine, lalrpop, or pest maybe? (N.B. I haven't tried any of them; these are just the other options which came immediately to mind)


I generally recommend combine to newcomers after some hairy experiences with nom (with some profuse thanks from people who had also been having bad experiences with nom). I didn't particularly care about performance so never measured it and can't comment, but it feels like a simpler model, with better error messages and less chance of pain when going off the beaten track - sometimes you have a silly underspecified format and you just want to run a bit of code on your input sequence to figure out what to do next.

I thought nom was for parsing arbitrary binary formats and for anything text-like you'd use a hand-written parser or larlpop.

https://www.reddit.com/r/rust/comments/88f69x/things_i_learned_writing_my_first_few_thousand/dwkprtu/