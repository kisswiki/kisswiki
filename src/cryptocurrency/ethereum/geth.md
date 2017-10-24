## default sync method

As of version 1.6.0, the default method used by Geth for syncing the chaindata is "fast"

- https://ethereum.stackexchange.com/questions/15562/why-is-geths-fast-sync-now-the-default-whereas-before-it-wasnt
- https://ethereum.stackexchange.com/questions/1161/what-is-geths-fast-sync-and-why-is-it-faster

## blockchain location

`%USERPROFILE%\AppData\Roaming\Ethereum\geth\chaindata`

## create wallet

`geth account new`

If you see a warning about starting the Ledger hub here, you can ignore it. You’ll be prompted to enter a password, and then to confirm it (use a strong password that you won’t forget!). The output will be a long string between two curly braces { }. That’s your new wallet address—make a note of it. You can easily copy it by right-clicking anywhere in the command prompt window, selecting “Mark”, highlighting your new address by holding left-click and dragging the mouse over the entire address, and then right-clicking again to copy to your clipboard. From there, you can paste your address anywhere using standard Windows shortcuts (CTRL+V).

Important: The combination of the password you just used to create this address *and* the associated encrypted key file is what gives you control over your new wallet address. If you lose either of these, you’ve also lost control of your wallet and all of the coins associated with it—and there is literally nothing that anyone will be able to do to help you. Remember your password, and keep multiple backups of your key file(s)!

encrypted key file is stored in `%USERPROFILE%\AppData\Roaming\Ethereum\keystore`?

- http://www.cryptobadger.com/2017/04/build-ethereum-mining-rig-windows/
- https://github.com/ethereum/go-ethereum/wiki/Managing-your-accounts

## faster sync

`geth --cache=1024`

Depending on your RAM, you can also try with higher values, like `--cache=2048`.

https://ethereum.stackexchange.com/questions/392/how-can-i-get-a-geth-node-to-download-the-blockchain-quickly/4210

## network time synchronisation

This happened after I run with `--cache=2048`.

```
WARN [10-24|01:11:02] System clock seems off by 1m5.254318218s, which can prevent network connectivity
WARN [10-24|01:11:02] Please enable network time synchronisation in system settings.
```

###

geth finish the sincronization if that alert keep on cmd?

most certainly not. You will have to enable OS's timesync to be accepted by peers.

https://github.com/ethereum/mist/issues/947#issuecomment-234718463

###

Run cmd.exe as Administrator and run `w32tm /resync1` https://www.tenforums.com/tutorials/6410-synchronize-clock-internet-time-server-windows-10-a.html

And then quickly run `geth --rpc` without `--cache`, cause that may cause slowdown.

http://mintywhite.com/windows-7/7maintenance/windows-seven-7-sync-system-clock-with-internet-time-how-to/

## Port 8545

http://localhost:8545 is the RPC port of your locally running Ethereum node software.

When running geth, the Go implementation of the Ethereum node software, the command line parameters to create and configure this RPC service follows:

```bash
user@Kumquat:~$ geth --help | grep rpc
  --rpc                         Enable the HTTP-RPC server
  --rpcaddr "127.0.0.1"         HTTP-RPC server listening interface
  --rpcport "8545"              HTTP-RPC server listening port
  --rpcapi "db,eth,net,web3"    API's offered over the HTTP-RPC interface
  --rpccorsdomain               Domains from which to accept
```

https://ethereum.stackexchange.com/questions/3305/what-is-http-localhost8545

## console

https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console
