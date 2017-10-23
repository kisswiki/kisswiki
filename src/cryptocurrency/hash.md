- https://www.khanacademy.org/economics-finance-domain/core-finance/money-and-banking/bitcoin/v/bitcoin-cryptographic-hash-function
- https://en.wikipedia.org/wiki/Security_of_cryptographic_hash_functions
- https://crypto.stackexchange.com/questions/30617/proving-collision-resistance-of-a-hash-function

##

A hash function maps arbitrarily long input strings to fixed-length outputs. For example, SHA-256 maps its input to a string of 256 bits. A cryptographically secure hash function h is a one-way function, i.e. given a message m it’s easy to compute h(m) but it’s not practical to go the other way, to learn anything about m from h(m). Secure hash functions are useful for message authentication codes because it is practically impossible to modify m without changing h(m).

Ideally, a secure hash is “indistinguishable from a random mapping.” [1]  So if a hash function has a range of size N, how many items can we send through the hash function before we can expect two items to have same hash value? By the pigeon hole principle, we know that if we hash N+1 items, two of them are certain to have the same hash value. But it’s likely that a much smaller number of inputs will lead to a collision, two items with the same hash value.

The famous birthday problem illustrates this. You could think of birthdays as a random mapping of people into 366 possible values [2]. In a room of less than 366 people, it’s possible that everyone has a different birthday. But in a group of 23 people, there are even odds that two people have the same birthday.

So the probability of no collisions is exp(-1/2) or about 60%, which means there’s a 40% chance of at least one collision. As a rule of thumb, a hash function with range of size N can hash on the order of √N values before running into collisions.

This means that with a 64-bit hash function, there’s about a 40% chance of collisions when hashing 232 or about 4 billion items. If the output of the hash function is discernibly different from random, the probability of collisions may be higher. A 64-bit hash function cannot be secure since an attacker could easily hash 4 billion items. A 256-bit or 512-bit hash could in principle be secure since one could expect to hash far more items before collisions are likely. Whether a particular algorithm like SHA3-512 is actually secure is a matter for cryptologists, but it is at least feasible that a hash with a 512-bit range could be secure, based on the size of its range, while a 64-bit hash cannot be.

- https://www.johndcook.com/blog/2017/01/10/probability-of-secure-hash-collisions/
