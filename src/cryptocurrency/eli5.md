##

It looks like there's still a bit of misinformation here, so I'll try to clear it up. The Big Picture Mining increases the bitcoin network's security and fights fraud by calculating what's effectively a checksum for transactions. By contributing their computing power to the bitcoin network for mining, individuals are rewarded with newly minted bitcoins by the community. This also provides a way to distribute new bitcoins in a fair manner. The Details Hash functions are at the heart of mining. A hash function is basically a complicated math formula that takes in some arbitrary input and gives a reproducible output. However, changing the input even slightly will completely alter the output. For example, using the SHA-256 hash function: SHA-256 of "Test" always outputs a hash of "532eaabd9574880dbf76b9b8cc00832c20a6ec113d682299550d7a6e0f345e25" SHA-256 of "test" (lowercase t) is "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08" Now, let's say Alice decides to pay Bob 10BTC. The bitcoin network basically records that in the public ledger of transactions as "Alice -> 10 -> Bob". However, right now someone could change that 10 to a 20 without consequence. The network has to have some way of checking if the recorded transaction is valid or fraudulent. That's where mining comes in. When Alice pays Bob those 10BTC, miners in the bitcoin network will try to hash the transaction "Alice -> 10 -> Bob", resulting in "aa314e08a642f5be3857276ecb4a4085a33b916f84aebef32a077df9c29949b3". However, mining has a requirement that the resulting hash must start with a certain number of 0's (depending on the network's hash speed). Thus, miners will slightly alter the transaction by adding a random number to the end like so: "Alice -> 10 -> Bob 12345". The miners will then hash it again and see if it has the required number of 0's. If not, it'll change the random number and hash it again. This is repeated until an acceptable hash is found. Once the correct hash is found, the transaction and the hash are permanently stored in the public ledger of transactions, and if anyone tries to change the transaction (i.e. changing the 10 to a 20), the hash will naturally mismatch and the network will know that that transaction is fake and will reject it. The miner who calculated the correct hash is rewarded a certain number of newly minted bitcoins and transaction fees for his contributions to the security of the network. Thus, "bitcoin mining" is actually a slight misnomer. Its other equally important purpose is "bitcoin transaction securing." Hope that answered some questions!

https://www.reddit.com/r/explainlikeimfive/comments/1bm1e4/eli5_how_are_bitcoins_mined/

##

Here's the story behind Bitcoin: sending money is complicated. PayPal can do it easily but has substantial fees and is risky for sellers, wires are expensive, and so on. Cash is ideal, but you can't use it over the internet. So people wanted a kind of e-cash: no chargebacks, low fees, no censorship. Also not run by a government or corporation, because then they have too much power and power corrupts.
But how can a money be created without a govt/company oversight? They invented a really hard puzzle, it's called a SHA256 hash. You can roll some dice and see what their hash is, and if it's really special you earn some coins. Example.

https://i.imgur.com/qgSNL.png

It's a strange and very hard puzzle. They designed the puzzle to be really hard, because if too many people can solve it, there are suddenly too much coins and the coins are worth nothing. It is so hard, on average it is solved every ten minutes by anyone in the world. So for a lot of people, it can take a year or even more to solve the puzzle. But when they solve it, it's like winning the lottery, except they get Bitcoins instead of dollars.
Until today, this lottery yielded 7 million coins in total. People give them to other people to buy things, or if they owe a friend some money. And it's really easy to give the money to others. You have this program, called a wallet, and it says how many coins you have. You can click send, type your friend's 'address', the amount, and a few seconds later it shows up in your friend's wallet. You can also save his address, so you don't have to type in his address twice.
Because people find Bitcoin convenient to use, and you can buy a lot of stuff with it, people want to have some Bitcoins. So they give $ to a lottery winner, and they get BTC back. And then they can buy stuff with it, or give it to a friend, or sell it to someone else.
To get a chance at winning the lottery, you need an expensive graphics card. Or if you want even more chance, you can buy 2 cards or 3 or even 100. It is like having 2 or 3 lottery tickets, instead of only one. But each graphics card also use a lot of power and make your room really hot.
By the way, if a lot of people buy expensive graphics cards and participate in the lottery, it gets harder for a single person to win. Also, the lottery decreases. Currently you get 50 coins if you win the lottery. After four years, the winner gets only 25. Four years later, only 12½, then 6¼, and so on. In total there will ever be only 21 million coins. This is makes a Bitcoin 'better' than a dollar: in 100 years, a dollar will be worth very little because the government keeps printing more and more money, and your dollar will be less and less special. In 100 years, there will still be only 21 million bitcoins.

https://www.reddit.com/r/explainlikeimfive/comments/j8la9/eli5_how_do_bitcoins_work/

##

It looks like there's still a bit of misinformation here, so I'll try to clear it up.
The Big Picture
Mining increases the bitcoin network's security and fights fraud by calculating what's effectively a checksum for transactions. By contributing their computing power to the bitcoin network for mining, individuals are rewarded with newly minted bitcoins by the community. This also provides a way to distribute new bitcoins in a fair manner.
The Details
Hash functions are at the heart of mining. A hash function is basically a complicated math formula that takes in some arbitrary input and gives a reproducible output. However, changing the input even slightly will completely alter the output. For example, using the SHA-256 hash function:
SHA-256 of "Test" always outputs a hash of "532eaabd9574880dbf76b9b8cc00832c20a6ec113d682299550d7a6e0f345e25"
SHA-256 of "test" (lowercase t) is "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08"
Now, let's say Alice decides to pay Bob 10BTC. The bitcoin network basically records that in the public ledger of transactions as "Alice -> 10 -> Bob". However, right now someone could change that 10 to a 20 without consequence. The network has to have some way of checking if the recorded transaction is valid or fraudulent. That's where mining comes in.
When Alice pays Bob those 10BTC, miners in the bitcoin network will try to hash the transaction "Alice -> 10 -> Bob", resulting in "aa314e08a642f5be3857276ecb4a4085a33b916f84aebef32a077df9c29949b3". However, mining has a requirement that the resulting hash must start with a certain number of 0's (depending on the network's hash speed). Thus, miners will slightly alter the transaction by adding a random number to the end like so: "Alice -> 10 -> Bob 12345". The miners will then hash it again and see if it has the required number of 0's. If not, it'll change the random number and hash it again. This is repeated until an acceptable hash is found.
Once the correct hash is found, the transaction and the hash are permanently stored in the public ledger of transactions, and if anyone tries to change the transaction (i.e. changing the 10 to a 20), the hash will naturally mismatch and the network will know that that transaction is fake and will reject it. The miner who calculated the correct hash is rewarded a certain number of newly minted bitcoins and transaction fees for his contributions to the security of the network.
Thus, "bitcoin mining" is actually a slight misnomer. Its other equally important purpose is "bitcoin transaction securing."

https://www.reddit.com/r/explainlikeimfive/comments/1b689q/eli5_this_bitcoin_mining_thing_again/

##

For a decentralized currency we need to reach consensus between unkown and probably adverse distributed systems. Bitcoin mining is a brilliant solution to the Byzantine Generals' Problem:
The Byzantine Generals' Problem roughly goes as follows: N Generals have their armies camped outside a city they want to invade. They know their numbers are strong enough that if at least 1/2 of them attack at the same time they'll be victorious. But if they don't coordinate the time of attack, they'll be spread too thin and all die. They also suspect that some of the Generals might be disloyal and send fake messages. Since they can only communicate by messenger, they have no means to verify the authenticity of a message. How can such a large group reach consensus on the time of attack without trust or a central authority, especially when faced with adversaries intent on confusing them?
Bitcoin's solution is this: All of the Generals start working on a mathematical problem that statistically should take 10 minutes to solve if all of them worked on it. Once one of them finds the solution, she broadcasts that solution to all the other Generals. Everyone then proceeds to extending that solution - which again should take another ten minutes. Every General always starts working on extending the longest solution he's seen. After a solution has been extended 12 times, every General can be certain that no attacker controlling less than half the computational resources could have created another chain of similar length. The existence of the 12-block chain is proof that a majority of them has participated in its creation. We call this a proof-of-work scheme.

- http://paulbohm.com/articles/bitcoins-value-is-decentralization/
- http://en.wikipedia.org/wiki/Byzantine_fault_tolerance

https://www.reddit.com/r/explainlikeimfive/comments/1b689q/eli5_this_bitcoin_mining_thing_again/

##

Satoshi Nakamoto's paper, "Bitcoin: A Peer-to-Peer Electronic Cash System" deserves a mention here, because it proposed the first-known solution to the double-spending problem in a masterless peer-to-peer network, with Byzantine fault tolerance (i.e., in a manner resistant to fraudulent nodes attempting to game the rules), via a clever application of proof-of-work:

https://bitcoin.org/bitcoin.pdf

https://news.ycombinator.com/item?id=15091397

##

https://www.reddit.com/r/programming/comments/6wjw70/mining_bitcoin_with_pencil_and_paper/
