## default sync method

As of version 1.6.0, the default method used by Geth for syncing the chaindata is "fast"

- https://ethereum.stackexchange.com/questions/15562/why-is-geths-fast-sync-now-the-default-whereas-before-it-wasnt
- https://ethereum.stackexchange.com/questions/1161/what-is-geths-fast-sync-and-why-is-it-faster

## create wallet

`geth account new`

If you see a warning about starting the Ledger hub here, you can ignore it. You’ll be prompted to enter a password, and then to confirm it (use a strong password that you won’t forget!). The output will be a long string between two curly braces { }. That’s your new wallet address—make a note of it. You can easily copy it by right-clicking anywhere in the command prompt window, selecting “Mark”, highlighting your new address by holding left-click and dragging the mouse over the entire address, and then right-clicking again to copy to your clipboard. From there, you can paste your address anywhere using standard Windows shortcuts (CTRL+V).

Important: The combination of the password you just used to create this address *and* the associated encrypted key file is what gives you control over your new wallet address. If you lose either of these, you’ve also lost control of your wallet and all of the coins associated with it—and there is literally nothing that anyone will be able to do to help you. Remember your password, and keep multiple backups of your key file(s)!

encrypted key file is stored in `%USERPROFILE%\AppData\Roaming\Ethereum\keystore`?

http://www.cryptobadger.com/2017/04/build-ethereum-mining-rig-windows/

## faster sync

`geth --cache=2048`

https://ethereum.stackexchange.com/questions/392/how-can-i-get-a-geth-node-to-download-the-blockchain-quickly/4210
