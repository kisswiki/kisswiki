I wanted to use org-mode inspired by [Emacs' org-mode gets citation support | Hacker News](https://news.ycombinator.com/item?id=28048880).

Googling "org-mode book pdf" gave this:

- https://orgmode.org/orgguide.pdf
- https://orgmode.org/org.pdf

I have also found this https://www.udemy.com/course/getting-yourself-organized-with-org-mode/

When googling "emacs org-mode first file" I came to https://orgmode.org/worg/org-tutorials/org4beginners.html

First problem was that I could not set keb bindings like in tutorial. Emacs was reading different config. Refer to emacs-config-file-location.md.

`C-c / t` this should be typed literally. You need to type slash. https://emacs.stackexchange.com/questions/61205/why-are-agenda-and-tag-shortcuts-for-org-mode-not-working#comment96320_61205

## Reset org-mode

Sometimes changes are saved somewhere and you need to `M-x org-mode` to reset org-mode.

https://www.reddit.com/r/emacs/comments/akr8ux/leading_stars_visible_with_orgindentmode_in_iterm2/ef7ghtd/

## Hide leading stars but do not indent

```org-mode
#+STARTUP: hidestars
```

You may need to reset with `M-x org-mode`.

https://emacs.stackexchange.com/questions/53445/how-remove-asterisks-in-org-mode/53455#53455

## indent

To disable completely indent:

```elisp
(org-indent-mode -1)
```

https://emacs.stackexchange.com/questions/22524/permanently-disable-org-indent-mode/22526#22526

To not indent context set `org-adapt-indentation` to `nil`.

- https://emacs.stackexchange.com/questions/41220/org-mode-disable-indentation-when-promoting-and-demoting-trees-subtrees
- https://orgmode.org/manual/Hard-indentation.html
- https://forsooth.org/posts/orgmode-no-indentation/index.html

Also this https://emacs.stackexchange.com/questions/7429/how-to-customize-org-mode-indentation/7431#7431

## keybindings

`M-S-<right>` runs `org-shiftmetaright` to indent subtree

`C-u <tab>` (#'org-cycle) will collapse all top-level trees

- https://emacs.stackexchange.com/questions/27921/org-mode-cycling-inside-subtree-impossible/27923#27923
- https://orgmode.org/manual/Global-and-local-cycling.html
