It is debatable if Clean Code actually improves the programmer efficiency and programs readability. I find people applying it religiously often create over-complex designs like FizzBuzz Enterprise.
Even Uncle Bob's examples are not the state of the art in readability: https://qntm.org/clean

The main problem seems to be that Clean Code is mostly a premature optimisation in code flexibility. It makes code more complex and objectively worse in hope it would be easier to extend later. Unfortunately we often dont know how the code will change, and in practice the code has to be significantly changed/rewritten anyway when a business requirement change appears.

IMHO optimizing for simplicity and readability has served me the best. Instead of avoiding the changes in code, it is better to write code so obvious that anyone can safely and easily change it when really needed.

And finally, performance of the program vs performance of the developer is a false dichotomy. So many times I've seen a more readable, simpler code turned out to be more efficient as well. You often can have both.

- https://news.ycombinator.com/item?id=35105528
- https://www.reddit.com/r/programming/comments/11dyx43/clean_code_horrible_performance/
- https://www.reddit.com/r/programming/comments/11mr7z1/uncle_bob_and_casey_muratori_discuss_clean_code/
- https://hn.algolia.com/?q=clean+code

also this:

On page 71, I realized I was not the problem. He provides an example of "bad" code which needs refactored, and provides a refactored version. The example is a prime generator program.

The original code is a single static function, using local variables. Not a particularly long method. The refactored version is several functions, sharing state with static fields.

The reason I decided to abandon the book entirely at this point was because the "refactored" code was literally broken.

The original code was thread-safe; the new code is completely non-reentrant, and will give erratic or wrong results if used on multiple threads.

https://www.reddit.com/r/programming/comments/11dyx43/comment/jabz1oz/

- ["Clean" Code, Horrible Performance - YouTube](https://www.youtube.com/watch?v=tD5NrevFtbU)
