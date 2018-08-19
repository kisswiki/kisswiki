- https://emacs.stackexchange.com/questions/3149/how-to-non-interactively-dump-list-of-open-buffers-associated-filenames-and-sav
- https://emacs.stackexchange.com/questions/3494/how-to-count-all-of-the-windows-in-a-frame
- https://stackoverflow.com/questions/22106656/how-can-i-filter-buffer-list-to-only-show-buffers-not-visible-in-windows

##

The fish: `C-h f get-buffer-window'

How to fish:

The Elisp manual is your friend (again).
`i' in the manual searches the index, with completion.

If you use Icicles, then completion works for any number of substrings (or
regexps) combined in any order. Example: `i window S-SPC buffer' shows the index
entries that contain both `window' and `buffer':

active-minibuffer-window
buffers, controlled in windows
fit-window-to-buffer
get-buffer-window
get-buffer-window-list
minibuffer window, and next-window 
minibuffer windows
minibuffer-scroll-window
minibuffer-selected-window 
minibuffer-window
minibuffer-window-active-p
other-window-scroll-buffer 
replace-buffer-in-windows
same-window-buffer-names
set-minibuffer-window
set-window-buffer 
shrink-window-if-larger-than-buffer
switch-to-buffer-other-window
window-buffer 
window-minibuffer-p

If you want to narrow things further, typing `minibuffer ~' then removes the
entries that contain `minibuffer'. Among the remaining entries, any of the
following get you to the node `Buffers and Windows', which describes what you
want:

buffers, controlled in windows
get-buffer-window
get-buffer-window-list
set-window-buffer
window-buffer

That's if you start with the keywords `window' and `buffer'. Suppose you start
instead with `display' and `buffer'. Then you see these matching index entries:

buffer-display-count
buffer-display-table
buffer-display-time
display-buffer 
display-buffer-function
display-buffer-reuse-frames
display-message-or-buffer 
displaying a buffer
edebug-save-displayed-buffer-points
special-display-buffer-names

Of those, the following entries get you to the same node `Buffers and Windows':

buffer-display-count
buffer-display-time

In Icicles, you can just use `C-next'... to visit the matching entries in order,
or `next'... and then `C-RET' to visit only specific entries - all in the same
invocation of `i'.

Nothing is as helpful as Emacs onboard help. You owe it to yourself to learn to
use it.

And Icicles can help Emacs help you:
- http://www.emacswiki.org/emacs/Icicles_-_Nutshell_View
- http://www.emacswiki.org/emacs/Icicles_-_Info_Enhancements

https://groups.google.com/forum/#!topic/gnu.emacs.help/j-m-Yr252ZY
