## ctrl+shift+e e produces ctrl+shift+unknwon

GTK3 reserves the key combination Ctrl+Shift+E to insert Emoji.

Good news is, this feature has been removed in GTK version 3.24.

Even if you have GTK 3.24+, VSCode installed from Snap Store appears to be stuck with an older GTK version

Solution:

Download deb package as described here https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions

```
snap remove code
sudo apt install ./code_1.51.0-1604600753_amd64.deb
```

- https://stackoverflow.com/questions/52032340/ctrlshifte-inerts-special-characters-into-file-instead-of-showing-explore-pane#comment103282623_52295258
- https://github.com/microsoft/vscode/issues/72947#issuecomment-489483134