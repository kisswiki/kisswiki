https://x.com/dhh/status/1835112408089870511

https://gist.github.com/dhh/038234d3bdf89c40480566a2cb5ba2fd

Could also manually type in whichever pair you’d like, so da(/[/{/<.
Delete word you’re currently on: diW.
Move to previous/next blank line: {/}.
Previous/next page: Ctrl + B/F.
Quick exit (saves if any changes have been made): ZZ.
Jump to matching brace: %.
Find previous/next instance of a word: #/*.
Replace all occurrences of a regex pattern (escape special characters with a \ like you would in regex): :%s/pattern/replacement pattern.
^ that last one doesn’t even have to be regex. It can be as simple as replacing a word.
Repeat last action: . (yes, a period).
So you're on a line. Cursor is wherever. "dab" will find the next set of parenthesis (or brackets) on that line, delete them + contents, and place cursor at the end of that method call preceding.

"ciq" will jump to the next set of quotes, delete text within those quotes, place cursor ready to type something new. "vii" will select everything at the same indent level (like whole method), now you can "c" to change or "y" to copy.

when you got "app/<cursor>something/else" and hit ct" for change until next quote, so you get "app/<cursor>".

v" is select, "c" is change, "d" is delete. "i" is inside, "a" is around. "q" is quotes, "b" is brackets, "w" is word. All can be combined now. So caq, cib, vab, diw etc all make sense.

Could also manually type in whichever pair you’d like, so da(/[/{/<.
Delete word you’re currently on: diW.
Move to previous/next blank line: {/}.
Previous/next page: Ctrl + B/F.
Quick exit (saves if any changes have been made): ZZ.
Jump to matching brace: %.
Find previous/next instance of a word: #/*.
Replace all occurrences of a regex pattern (escape special characters with a \ like you would in regex): :%s/pattern/replacement pattern.
^ that last one doesn’t even have to be regex. It can be as simple as replacing a word.
Repeat last action: . (yes, a period).

yap

If you're using LazyVim, you can effortlessly select blocks of code with Shift + S, likely thanks to the flash.nvim plugin

dab is great, but i prefer to "change" not delete as it removes contents then switches to insert.
b is "brackets" (, B is braces {

you can also just use value ca` ca) ca{ ca' da| etc to select between change insert.

Check „Incremental select with treesitter”. I use it all the time under Ctrl+Space to expand and Ctrl+k to decrement.

ct<char> deletes everything to the right up to the character.

my favourite thing about vim is, learn a new command, like dab here, and you instantly learn about extra commands, yab, vab. good stuff

'daf' I think does same for a function or method
'dap' for paragraph
Etc

If you're using LazyVim, then you are likely using http://Mini.ai I think and the functionality comes from there.

I like gn. After a search you can select next occurrence. With cgn you can change the next occurrence and repeat this change with dot operator.

"cgn" then dot dot dot  is my favorite [Operating on search matches using gn](http://vimcasts.org/transcripts/63/en/)

I mildly prefer a{ (instead of aB) and a( (instead of ab) because that matches the character I'm seeing. Likewise, that makes it a small mental step to a[ (for which there is no letter equivalent I think)

- https://www.reddit.com/r/vim/comments/m330z4/getting_faster/
- https://theprimeagen.github.io/vim-fundamentals/
- interactive tutorial https://openvim.com/
- tips https://vimtips.strix.dev/
- https://m4xshen.dev/posts/vim-commands-for-navigation-between-brackets
- https://www.joshmedeski.com/posts/underrated-square-bracket/
- learning vim while playing game https://vim-adventures.com/
- interactive cheat sheet https://vim-keyboard.vercel.app/
- https://vi.stackexchange.com/questions/16829/moving-to-an-outer-block
- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
- [VimTutor World Record Speed Run 100% No Glitch | ThePrimeagen](https://youtu.be/y6VJBeZEDZU)
- [How to Vim in 2023: Tips and Tricks | ThePrimeagen](https://youtu.be/FrMRyXtiJkc)

- https://www.reddit.com/r/neovim/comments/14gyqau/what_is_the_trick_theprimegen_is_using_to_search/
  - tmux-sessionizer 20:18 [Dev Tool Time with ThePrimeagen | Sourcegraph](https://www.youtube.com/watch?v=GXxvxSlzJdI&t=1334s)
- https://github.com/ThePrimeagen/vim-be-good
- https://github.com/folke/flash.nvim
