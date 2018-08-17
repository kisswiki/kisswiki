- https://stackoverflow.com/questions/25065328/how-select-a-rectangle-in-emacs
- https://stackoverflow.com/questions/761706/in-emacs-edit-multiple-lines-at-once
- https://superuser.com/questions/77314/how-to-do-select-column-then-do-editing-in-gnu-emacs

## Rectangle mode

`C-x SPC` to enable

`C-x r k` to kill rectangle

`C-x r t` to fill rectangle with text

- https://stackoverflow.com/questions/7625824/vim-visual-selection-delete-insert-in-emacs
- https://www.gnu.org/savannah-checkouts/gnu/emacs/manual/html_node/emacs/Rectangles.html
- https://stackoverflow.com/questions/58872/rectangle-functions-in-emacs
- http://ergoemacs.org/emacs/emacs_string-rectangle_ascii-art.html

### Tips

- https://emacs.stackexchange.com/questions/39414/immediately-invoke-string-rectangle-upon-rectangle-mark-mode-selection/42597#42597
- https://emacs.stackexchange.com/questions/19461/insert-lines-when-yanking-rectangle-rather-than-inserting-among-following-lines
- https://www.reddit.com/r/emacs/comments/3vz6lx/command_to_rectangle_select_a_column_of_text/

## CUA

`M-x cua-rectangle-mark-mode`

- hitting enter moves the cursor around the edges of the rectangle
- you can then expand with the movement keys (arrows, `C-n`, `C-p`, `C-f`, `C-b`) to cover the text you want to manipulate. 
- anything you type is inserted outside the rectangle on the same side as the cursor. The insertion matches the size of the rectangle, so if you want to add the same text to the beginning (or middle or end) of a bunch of lines at once, this is the fastest way to do it.

`C-w` will kill the contents of the rectangle.

- https://stackoverflow.com/questions/7625824/vim-visual-selection-delete-insert-in-emacs
- https://www.gnu.org/savannah-checkouts/gnu/emacs/manual/html_node/emacs/CUA-Bindings.html
- https://www.emacswiki.org/emacs/CuaMode
