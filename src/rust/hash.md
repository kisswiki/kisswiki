Nope no false positives will occur. I suspect your confusion is on what keys are. Keys are not the result of hash functions, they are what's feed into the hash function. The result of the hash is used to determine where in the hash table to store the key (or key and value in the case of a hashmap, hashsets just have keys).

So when you do a lookup against the hashset, it uses the hash to figure out where in the hash table to look, then it does a full comparison of the key at that location against the key that was passed in.

As for collisions it depends on the type of hash table. Rust uses a open addressing with Robin Hood hashing. The Rust Docs Have some good links on the particular method it's using.

There is a probabilistic data structure based on hashes called a bloom filter. That you might be confusing the hashset with. Bloom filter's allow false positives but never false negatives. One use case is as a prefilter for a normal hashset/hashmap, where the key comparisons can be expensive, and the use case expects a lot of lookups to return not found. For that the key inserted into the hashset/hashmap is also inserted into a bloom filter. Then during lookup you check the bloom filter first and if it's not in there you can be sure it's not in the hashset and return not found.

https://www.reddit.com/r/rust/comments/7bqrre/are_rust_hashsets_probabilistic_how_are/