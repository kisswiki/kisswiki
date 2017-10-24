- https://github.com/ethereum/wiki/wiki/Mining
- https://www.cryptocompare.com/mining/guides/how-to-mine-ethereum/
- https://ethereum.stackexchange.com/questions/110/how-to-mine-ether-and-use-ethereum-on-windows
- https://99bitcoins.com/guide-ethereum-mining-how-to-mine-ethereum/
- https://whattomine.com/
- https://99bitcoins.com/advanced-ethereum-mining-calculator/
- https://ethereum.gitbooks.io/frontier-guide/content/mining_with_geth.html

## Pool

- https://ethermine.org/
  - https://www.cryptocompare.com/mining/guides/how-to-connect-to-an-ethereum-mining-pool/
- http://ethpool.org/
- https://ethereumpool.co
  - https://ethereumpool.co/how/
- https://www.reddit.com/r/EtherMining/comments/5x4etf/brainless_ethereum_pool_mining_with_windows_a/
- https://github.com/sammy007/open-ethereum-pool

###

Just run a full geth node and point your miners to that.

First do a fast sync on your geth node to pull the blockchain in hours rather than days geth --fast

Then on your node (rpcaddr is the node's IP addr)...

`geth geth --rpc --rpcaddr "x.x.x.x" --gasprice 10000000000 --identity "<some node name>" 2>>geth.log`

On your miners...

`ethminer -G -F http://x.x.x.x/ --<other guff>`

You can track your geth log with tail -f geth.log

And track blocks mined with tail -f geth.log | grep Mined

1. Use a miner to act as a geth node
2. The miner needs larger hdd to store the DAG. Anything 60gb and above should last a good year or more
3. All other miners point to this node
4. I believe I should also run Stratum proxy on this pc?

I'm using G series Intel. They basically float at 24%+ usage during mining. When a work package is received from pool, it goes to 100% for a short bit before going back to 20%+ usage.

https://forum.ethereum.org/discussion/5706/how-do-i-create-my-own-pool

## Mist

Mining will be accomplished in one of two ways: either on CPU (and possibly the GPU, to be confirmed) with the Mist client or on the GPU though a combination of the Ethereum daemon and sgminer.

https://github.com/ethereum/wiki/wiki/Mining

##

I talked about my reasons for selecting Claymore’s miner over other alternatives in my Linux guide, but to sum up: it’s currently the fastest, most stable Ethereum miner that’s still under active development. The downside is that it’s not free—about 1% of your mining time will benefit the creator of the software instead of you. However, even after the usage fee, you’ll come out ahead compared to the alternatives.

http://www.cryptobadger.com/2017/04/build-ethereum-mining-rig-windows/
