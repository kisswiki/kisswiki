https://mercurylang.org/

If you put the most valuable thing in the universe inside a box that can't be opened or permeated by any force in the universe--then that thing is no longer valuable. Go find the former #2. If you have a programming ideal and that ideal requires laziness--then you've messed up. You have to conclude that there was something flawed about the ideal.

I'm a lot more confident about laziness being bad than about what you're thinking of as "a pure immutable language" being bad, but part of the problem about laziness is that it's a feature apart from the language it's in. If you implement a cache with a hash table in any normal language, then you can later on check and see how much data you have cached, keep track of your cache hit rate, empty the cache, pre-load your cache from a previous run, and so on. To work with your cache, you have the language itself at your disposal. If you implement a cache with a lazy list in language X, then language X can't help you. You'll need to hope that whatever Gods dangled laziness before you, also have some tools dangled elsewhere.

https://news.ycombinator.com/item?id=17848873
