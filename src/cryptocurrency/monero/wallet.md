- https://www.monero.how/tutorial-how-to-create-a-command-line-monero-wallet
- https://getmonero.org/resources/user-guides/monero-wallet-cli.html
- https://moneroaddress.org/

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

- https://www.monero.how/how-to-verify-your-monero-funds-with-a-private-view-key
- https://www.monero.how/tutorial-how-to-speed-up-initial-blockchain-sync
- Monero, how to create a view-only wallet and verify cold wallet's balance https://youtu.be/actU0Kzh8b4
- https://www.reddit.com/r/Monero/comments/5o4un7/view_balance_of_cold_wallet/
- https://www.reddit.com/r/Monero/comments/4djec7/check_mymonero_balance_without_logging_in/
- https://monero.stackexchange.com/questions/4179/how-can-i-check-the-balance-of-a-monero-paper-wallet
- https://monero.stackexchange.com/questions/3512/fastest-way-to-sync-and-start-using-monero-gui-wallet
- https://monero.stackexchange.com/questions/3256/easy-way-to-see-my-balance-without-having-wallet-synced
