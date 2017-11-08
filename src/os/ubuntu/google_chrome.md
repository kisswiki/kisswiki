## An error occurred during the signature verification

`wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add` - The fix redownload and apply the google signing key. Really google need to fix their key transition process. Yes you will need to also delete the old google key. apt-key list last 8 chars in my case I had to do "apt-key del 7FAC5991" to get rid of the expired key.

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/967509-chrome-chromium-turns-on-support-for-opentype-variable-fonts?p=967541#post967541
