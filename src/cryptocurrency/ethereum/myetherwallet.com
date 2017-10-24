- https://blog.trezor.io/trezor-integration-with-myetherwallet-3e217a652e08

##

You can run MyEtherWallet.com on your computer instead of from the GitHub servers. You can generate a wallet completely offline and send transactions from the "Offline Transaction" page.

- Go to https://github.com/kvhnuke/etherwallet/releases/latest.
- Click on dist-vX.X.X.X.zip.
- Move zip to an airgapped computer.
- Unzip it and double-click index.html.
- MyEtherWallet.com is now running entirely on your computer.
- In case you are not familiar, you need to keep the entire folder in order to run the website, not just index.html. 

Don't touch or move anything around in the folder. If you are storing a backup of the MyEtherWallet repo for the future, we recommend just storing the ZIP so you can be sure the folder contents stay intact.
As we are constantly updating MyEtherWallet.com, we recommend you periodically update your saved version of the repo.

Oh, what, you want to send a transaction from your airgapped device now? Okey dokey:

- Navigate to the "Offline Transaction" page via your online computer.
- Enter the "From Address". Please note, this is the address you are sending FROM, not TO. This generates the nonce and gas price.
- Move to your offline computer. Enter the "TO ADDRESS" and the "AMOUNT" you wish to send.
- Enter the "GAS PRICE" as it was displayed to you on your online computer in step #1.
- Enter the "NONCE" as it was displayed to you on your online computer in step #1.
- The "GAS LIMIT" has a default value of 21000. This will cover a standard transaction. If you are sending to a contract or are including additional data with your transaction, you will need to increase the gas limit. Any excess gas will be returned to you.
- If you wish, enter some data. If you enter data, you will need to include more than the 21000 default gas limit. All data is in HEX format.
- Select your wallet file -or- your private key and unlock your wallet.
- Press the "GENERATE SIGNED TRANSACTION" button.
- The data field below this button will populate with your signed transaction. Copy this and move it back to your online computer.
- On your online computer, paste the signed transaction into the text field in step #3 and click send. This will broadcast your transaction.

Oh what, you want to look at the code first? Good call. Here ya go:

- Here's all the JS: https://github.com/kvhnuke/etherwallet/tree/mercury/app/scripts
- Here's the generate wallet controller: https://github.com/kvhnuke/etherwallet/blob/mercury/app/scripts/controllers/walletGenCtrl.js
- Here's the main repo where you can read all about everything: https://github.com/kvhnuke/etherwallet

Can't read code?

- And the help page: https://www.myetherwallet.com/#help
- And our knowledge base: https://myetherwallet.groovehq.com/help_center
- Specifically the offline section of the knowledge base: https://myetherwallet.groovehq.com/knowledge_base/categories/offline
- And the trustworthiness and security: https://myetherwallet.groovehq.com/knowledge_base/categories/trustworthiness-and-security

OMG This is so interesting, give me MOAR

- Here's the API we use for ensuring entropy: https://www.w3.org/TR/WebCryptoAPI/ (yeah, fuck mouse movements, btw, that's not truly random nor supported by all devices)
- Here's answer that no one bothered to read regarding how MyEtherWallet ensures entropy, even when offline or new computer: https://www.reddit.com/r/ethereum/comments/5psp13/ethereum_account_generation_on_airgapped_computer/
- And if you are still somehow reading all this, here's a fun comment on the components that make up a presale json file and how private -> public -> address derivation works in Ethereum: https://www.reddit.com/r/ethereum/comments/5ees2q/is_the_bkp_component_of_a_presale_json_file_a/
