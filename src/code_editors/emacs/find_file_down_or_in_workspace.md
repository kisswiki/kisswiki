`counsel-file-jump` lists all files below parent directory. But first use `counsel-find-file` to select a parent directory.

`counsel-locate` lists all matching directory and file names from Linux root.

- https://emacs.stackexchange.com/questions/33745/how-to-find-file-name-a-few-levels-down-in-directory
- https://oremacs.com/2015/07/02/counsel-locate/

Looks like projectile-find-file and counsel-git should work the same.


I used to work with neovim and fzf before switching to emacs. I tried to implement a global fzf setup throug counsel-rg but I feel like using projectile-switch-project and projectile-find-file just works better. Having to switch projects before finding a file may seem constraining at first but I actually like it better, it makes more sense in terms of context switching imo.

https://www.reddit.com/r/emacs/comments/8grv2q/emacs_and_fuzzy_file_finder_fzf/dyeozb1/

Overall I think doing counsel-git in git directories and counsel-fzf in non-git directories seems to be a good solution. I'll keep counsel-locate in mind too. Usually, I don't search in ~!

https://github.com/abo-abo/swiper/issues/1525#issuecomment-379688894


- https://emacs.stackexchange.com/questions/33745/how-to-find-file-name-a-few-levels-down-in-directory