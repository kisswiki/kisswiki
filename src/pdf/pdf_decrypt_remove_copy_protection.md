## decrypt

`brew install qpdf`

`qpdf --decrypt --password=xxxxx encrypted-filename.pdf decrypted-filename.pdf`

- https://superuser.com/questions/244832/how-do-i-decrypt-a-password-protected-pdf-on-osx/521466#521466

## remove restrictions like editing, printing, and copying

`qpdf --decrypt InputFile.pdf OutputFile.pdf`

https://superuser.com/questions/179064/how-to-remove-security-from-a-pdf-file/584710#584710
