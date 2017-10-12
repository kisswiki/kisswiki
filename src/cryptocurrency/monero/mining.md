- https://www.usxmrpool.com/#easy_mining_guide
- https://www.monero.how/tutorial-how-to-mine-monero
  - https://www.monero.how/tutorial-how-to-create-a-command-line-monero-wallet
- https://github.com/fireice-uk/xmr-stak-cpu
- https://github.com/hyc/cpuminer-multi
- https://usxmrpool.com
- https://www.reddit.com/r/Monero/comments/54j54f/questionhow_mining_monero_use_cpu_linux/
- https://medium.com/@Jayvdb/how-to-start-mining-cryptocurrency-for-fun-and-possibly-profit-71517859ed91

## Currency calculator

- https://pl.coinmill.com/PLN_XMR.html#XMR=1

## Hash function

- This was a brilliantly designed proof-of-work function targeting the strengths of modern CPUs -- native AES encryption and fast 64 bit multipliers -- tuned to use a scratchpad exactly the size of the per-core L3 cache on Intel CPUs (about 2MB) that someone then wrapped in such a thick blanket of crap it was nearly unrecognizable until you started jumping in, tearing it apart, and putting it back together again. https://monero.stackexchange.com/questions/1110/where-can-i-find-a-description-of-the-cryptonight-hash-algorithm
- Cryptonight PoW uses Keccak at the first step. Key derivation functions use Keccak as well. It's the "fast hash" if you're looking at the code. https://www.reddit.com/r/Monero/comments/5w3pso/lifetimes_of_cryptographic_hash_functions_guess/de74xed/
  - http://valerieaurora.org/hash.html
  - Seriously keccak is beautiful. If you haven't read the paper on cryptographic sponge functions http://sponge.noekeon.org/CSF-0.1.pdf you are doing yourself a disservice
- The Hp and Hs hash functions of the Cryptonote paper are called hash_to_ec and hash_to_scalar in the Monero code base, and they are based on the Keccak1600 hash function (called fast_hash in the code), not Cryptonight (called slow-hash in the code). https://monero.stackexchange.com/questions/5714/is-cryptonight-the-hash-function-which-plays-the-role-of-the-random-oracle
- CryptoNight was originally implemented in the CryptoNote codebase. ... GPUs may run hundreds of concurrent instances, but they are limited in other ways. GDDR5 memory is slower than the CPU L3 cache and remarkable for its bandwidth, not random access speed. https://steemit.com/bitcoin/@knyaz/cryptonight-algorithm-and-how-to-mine-cryptocurrency-monero-bytecoin-etc

## Profitability

https://www.nicehash.com/profitability-calculator/nvidia-gtx-1070?e=0.1&currency=PLN

## How to check payment and pending on your pool at usxmrpool.com?

On #monero-pools I got such advice:

[09:35] <rofrol> I mine with xmr-stak-cpu, blockchain synchronized but balance shows: Balance: 0.000000000000, unlocked balance: 0.000000000000. What is going on? How to check if I have it set correctly? In config.txt I've changed "wallet_address". Can you help me?
[09:35] <scv> rofrol: so as i mentioned, stak does not use the blockchain nor does it work for solo mining unless you configure a proxy
[09:35] <scv> rofrol: what pool are you using? or did you setup a proxy
[09:36] <rofrol> scv: I'm using default pool: "pool_address" : "pool.usxmrpool.com:3333",
[09:36] <rofrol> "pool_password" : "",
[09:36] <scv> rofrol: FYI there is no 'default pool' it sounds like you downloaded the miner config from that pool directly
[09:37] <scv> or the config has been changed since i last checked... but no default pool that i know of :)
[09:37] <scv> ? payment
[09:37] <ducats> [payment] Pending payout (or "Total Due") is the amount of coin that you have earned that has not yet been paid to your wallet. Payments will not be sent until you reach your pool's minimum payment threshold, usually between 0.3 XMR to 1.0 XMR for normal addresses or 2.0 XMR to 5.0 XMR for integrated addresses.
[09:37] <scv> ? pending
[09:37] <ducats> [pending] On PPLNS and RBPPS pools your pending (due) balance increases only when the pool finds a block and the block reaches maturity. Depending on which pool you use, pending balance might only increase a few times each day. Check your pool's blocklist.
[09:37] <scv> you will need to check your pool website with your wallet address
[09:37] <scv> to see how much you have earned so far

At the bottom of page https://usxmrpool.com/ there is input `Your Stats & Payment History`.

Enter there your wallter address.

New version of site:

- https://v2.usxmrpool.com/dashboard
- https://v2.usxmrpool.com/faq
