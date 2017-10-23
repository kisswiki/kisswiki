- https://theethereum.wiki/w/index.php/Ethereum_Wallet_Syncing_Problems
- explorer http://testnet.etherscan.io/

##

>Guess distributing a glorified calculator all over the world is taking its toll. Nonetheless ETH is gonna have a future on one datacenter or the other...https://bitcointalk.org/index.php?topic=1467928.msg14812182#msg14812182

The fast sync chain is about 12 Gb. For comparison, the full archive node is currently 140 Gb.
As your blockchain is at 30 Gb, your node client is not fast syncing.
https://www.reddit.com/r/ethereum/comments/61zh94/what_is_the_size_of_the_ethereum_blockchain/dfigsh9/

- https://ethereum.stackexchange.com/questions/3332/what-is-the-parity-light-pruning-mode

##

I would say it is around 30 GB.

Current Block is 3964879 (according to https://etherscan.io/). Now that the average block size is around 8100 bytes (https://etherscan.io/chart/blocksize), this would result in a total size of 32115519900 Bytes.

32115519900 / 1024(kb) / 1024(mb) / 1024(gb) equals 29.

But don't take that calculation for granted.

Those bigger blocks are a very recent phenomenon. For most of ethereums lifetime, they were a lot smaller.


Current blockchain size is about 7.5gb (all headers (2.1gb) + all transactions (5.2gb) + all uncles (170mb)).

AFAIK there is no site on the internet that is tracking this nor any of the clients. All you can do is extract all the block data manually and add up their sizes.


Infura runs full nodes with archive mode enabled (to keep all state trie info). Our data directory is at about 190GB right now on Geth nodes and 175GB on our Parity nodes

https://www.reddit.com/r/ethereum/comments/6kvzvp/what_is_the_data_size_of_the_ethereum_blockchain/

##

The Ethereum network can scale, depending how much Gas the transactions needs. So a block does not have a fixed size like in Bitcoin, and can "grow" if a giant transaction comes and consume all the Gas from the block. So, imho, there is no precise calculation possible. Moreover,the size of the blockchain with the client geth and the --fast method should be around 11GB

https://ethereum.stackexchange.com/questions/13628/what-is-the-size-of-the-blockchain-in-2017#comment15130_13633

##

Currently, the network is growing at around 1GB per month https://etherchain.org/statistics/basic. It's hard to anticipate how large it could grow and at what pace, but there are already efforts underway to implement state-tree pruning in various clients. These techniques will contribute towards so-called "light-clients".

In linked chart above, Block size evolution estimating block size in bytes over time that can be used to estimate velocity (rate). The most appropriate graph depends on what you mean specifically by block growth rate.

https://ethereum.stackexchange.com/questions/143/what-are-the-ethereum-disk-space-needs?noredirect=1&lq=1

##

Blockchain size in ethereum depends in the implementation. In Parity is about 6 GB, in Geth is about 11 GB. Geth is not implementing state pruning, so 11 GB would be a clean sync with --fast, while if you don't use this would be 60GB+.

There is a feature called state pruning, that clears the past states, leaving only the current state. Geth don't have this, but at --fast it don't parse old states, just latest. Parity can disable state pruning by config, and this is useful for example to block explorers. Geth and parity implement different storage algoritims, parity is able to compress better, so it needs a smaller blockchain disk space.

https://www.reddit.com/r/ethereum/comments/5om2lw/current_ethereum_blockchain_size/
