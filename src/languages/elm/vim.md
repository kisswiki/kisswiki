```
ya{        Copy a record literal (or any other bracketed literal, including strings)
ds(        Delete one layer of parens that just became redundant [vim-surround]
ca[        Delete a list literal and replace it with a named variable
cs'`       Change quote types [vim-surround]
ci{        Change the entire contents of a block
ysiw)      Wrap the word under the cursor in (). Usually followed by ifoo to insert a foo function call in front of the () [vim-surround]
cst<span>  Change an HTML tag
S{         In visual mode to surround the selected text [vim-surround]?
viw        Select word when cursor somewhere on the word
```

- https://twitter.com/rtfeldman/status/1128712928276963330
- https://github.com/tpope/vim-surround
- https://github.com/emacs-evil/evil-surround
