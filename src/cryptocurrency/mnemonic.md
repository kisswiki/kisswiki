- blockchain.info was using non-standard wordlist
  - password recovery from mnemonic tool for old wordlist https://blockchain.info/wallet/recover-wallet
  - password recovery from mnemonic tool for new wordlist https://login.blockchain.com/#/recover
    - https://support.blockchain.com/hc/en-us/articles/115001298143-Your-Recovery-Phrase-The-Failsafe
  - https://github.com/gurnec/btcrecover/issues/56#issuecomment-323095328
  - old wordlist https://github.com/zootreeves/blockchain.info/blob/master/mnemonic_words_v3.html
  - new wordlist https://github.com/bitcoin/bips/blob/master/bip-0039/bip-0039-wordlists.md
  - https://www.reddit.com/r/Bitcoin/comments/7kf60d/recovering_legacy_wallet_from_blockchaininfo_21/
  - https://www.reddit.com/r/Bitcoin/comments/6cd4au/how_do_i_recover_a_blockchaininfo_wallet_with_a/
  - https://www.reddit.com/r/Bitcoin/comments/2jazzc/bip0039_word_list_alert_check_your_backups_now/
- https://en.bitcoinwiki.org/wiki/Mnemonic_phrase
- newer standard https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki
- https://en.bitcoinwiki.org/wiki/Mnemonic_phrase
- https://bitcoin.stackexchange.com/questions/89500/how-convert-a-mnemonic-phrase-back-and-forth-between-different-number-of-words
- https://www.bitc2.org/how-to-get-private-keys-from-blockchain.info

## Cons



> Don't use truly random mnemonic passphrase, instead rely on users' passwords known to be weak.

Dear god please don't push this, and let's try to erase the whole idea of relying on twelve-word passphrases from the community's memory forever. Mnemonic passphrases are horribly difficult to memorize, to the point that it's not even technically correct to call them "mnemonic" at all. See http://cups.cs.cmu.edu/soups/2012/proceedings/a7_Shay.pdf . Abstract:

> In a 1,476-participant online study, we explored the usability of 3- and 4-word system- assigned passphrases in comparison to system-assigned passwords composed of 5 to 6 random characters, and 8-character system-assigned pronounceable passwords. Contrary to expectations, sys- tem-assigned passphrases performed similarly to system-assigned passwords of similar entropy across the usability metrics we ex- amined. Passphrases and passwords were forgotten at similar rates, led to similar levels of user difficulty and annoyance, and were both written down by a majority of participants. However, passphrases took significantly longer for participants to enter, and appear to require error-correction to counteract entry mistakes. Passphrase usability did not seem to increase when we shrunk the dictionary from which words were chosen, reduced the number of words in a passphrase, or allowed users to change the order of words.

https://github.com/bitcoin-dot-org/bitcoin.org/pull/663#issuecomment-65375873
