- https://www.monero.how/tutorial-how-to-create-a-command-line-monero-wallet
- https://getmonero.org/resources/user-guides/monero-wallet-cli.html
- https://moneroaddress.org/

## Do I need to sync blockchain

on freenode.net #monero:

```
[16:58] <rofrol> when I run ./monero-wallet-cli
[16:58] <rofrol> it says: out of sync
[16:59] <rofrol> how can I sync while with xmr-stack-cpu is running?
[16:59] <scv> stak has nothing to do with it
[16:59] <scv> are you running monerod or are you connecting to a remote node
[17:01] <rofrol> monerod
[17:02] <rofrol> it constantly shows: Synced 1255333/1416961
[17:02] <rofrol> but why moner-wallet-cli shows: out of sync?
[17:03] <scv> rofrol: well because that's not synced, it's still running
[17:03] <scv> 1255333 is less than 1416961 of course
[17:06] <rofrol> so it will be synced?
[17:07] <rofrol> I'm doing: wget https://downloads.getmonero.org/blockchain.raw
[17:07] <rofrol> do I have to stop mining and monerod to sync?
[17:09] <scv> no
[17:09] <scv> stak has nothing to do with it
[17:09] <scv> and doesnt require monerod
[17:09] <scv> you dont need the blockchain to mine
[17:09] <scv> rofrol: you dont need to download blockchain.raw if you're synchronizing with monerod, from the looks of it you're already almost done

## sync blockchain

Step 1: Move into the folder where you downloaded the Monero Gui Wallet, e.g:
cd ~/Downloads/monero-gui-0.10.3.1-beta2

Step 2: Download the raw block chain from a trusted source, e.g:
wget -c --progress=bar https://downloads.getmonero.org/blockchain.raw

If it fails half-way, just re-run it. The above command will continue where it left off.

Step 3: Import the downloaded blockchain into the daemon:
./monero-blockchain-import --verify 0 --input-file ./blockchain.raw

Do remember though, run with --verify 0 only from a trusted source like the above.

Step 4: You can now remove the raw blockchain to free up disk space:
rm -rf ./blockchain.raw

Step 5: You can now start the Monero daemon, either from Settings in Monero Gui Wallet, or directly from the terminal in detached/background mode with:
./monerod --detach

- https://monero.stackexchange.com/questions/2761/what-is-the-fastest-way-to-synchronize-the-daemon
- https://monero.stackexchange.com/questions/3273/how-can-i-use-monero-without-syncing-the-blockchain

## balance

- You can then use commands such as "balance" to check the contents of your view only wallet. https://www.monero.how/how-to-verify-your-monero-funds-with-a-private-view-key
- https://www.monero.how/tutorial-how-to-speed-up-initial-blockchain-sync
- https://www.reddit.com/r/Monero/comments/5rllxz/easiest_way_to_view_balance_of_an_offline_wallet/
- Monero, how to create a view-only wallet and verify cold wallet's balance https://youtu.be/actU0Kzh8b4
- https://www.reddit.com/r/Monero/comments/5o4un7/view_balance_of_cold_wallet/
- https://www.reddit.com/r/Monero/comments/4djec7/check_mymonero_balance_without_logging_in/
- https://monero.stackexchange.com/questions/4179/how-can-i-check-the-balance-of-a-monero-paper-wallet
- https://monero.stackexchange.com/questions/3512/fastest-way-to-sync-and-start-using-monero-gui-wallet
- https://monero.stackexchange.com/questions/3256/easy-way-to-see-my-balance-without-having-wallet-synced
