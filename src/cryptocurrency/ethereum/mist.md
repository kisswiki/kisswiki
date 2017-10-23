When launching, Mist whill show sync status from `geth --rpc`.

## Mist and geth

Mist is a GUI browser running its own bundled geth node as backend. It is my understanding (someone please correct me if you know otherwise) that if you are already running geth, and then fire up mist on top of that, it will find your already-running node and you will be relating to that in the GUI. I haven't actually tried this, as I'm just running Mist on one machine (linux) with bundled node, and the geth CLI on another (Windows).

https://forum.ethereum.org/discussion/5257/relation-between-geth-and-mist

Wallet and Mist are almost the same thing. The only difference is that with Mist you can go to any web page, while Ethereum Wallet is hard coded to go to the wallet web page.

Geth is the node that does the real work. Mist and Wallet both fires up an instance of geth, and then connects to it to get blockchain information. Geth will download the blockchain. In theory, you don't need Mist or Wallet if you use command line arguments to issue transactions through geth. But that is far from user friendly.

Mist and Wallet currently connects to webpages on the usual internet. The goal is to eventually connect to web pages in Swarm instead.

https://www.reddit.com/r/ethereum/comments/5nvdbs/geth_ethereum_vs_mist_and_mining/

You can start Geth with desired parameters, and then run Mist. In that case, Mist will not start a new Geth instance, but use the existing one instead.

https://ethereum.stackexchange.com/questions/16160/configuring-geth-node-started-by-mist/16710#16710

## Mint vs Ethereum Wallet

Ethereum Wallet and Mist share the same source repository (https://github.com/ethereum/mist). Mist is a wallet enabled browser, and "Ethereum Wallet" is Mist but with the browser capability disabled, so you can use it as a wallet. I don't know about recent version but at some point you were able to switch between them with a command line option.

MIST and Etherum Wallet is two sides of the same thing. MIST is a DApp browser, and Etherum Wallet is also a DApp browser, but can only show one DApp, - the ethereum wallet DApp.

https://ethereum.stackexchange.com/questions/21523/ethereum-wallet-vs-mist-vs-testnet-vs-mainnet

## Manually connect to geth

`mist --rpc "/home/user/.ethereum/geth.ipc"`

https://ethereum.stackexchange.com/questions/12082/how-to-teach-mist-about-geth
