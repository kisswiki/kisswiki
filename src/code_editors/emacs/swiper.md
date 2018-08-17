swiper is like occur and help-swoop

https://truthseekers.io/lessons/how-to-use-ivy-swiper-counsel-in-emacs-for-noobs/

swiper is a much improved replacement for Emacs’s incremental search http://irreal.org/blog/?p=5340

With the standard emacs search function, one of my most common use-cases was "C-s C-w" to search for other instances of the string that starts at the point

Using swiper (ivy, really), the function "ivy-yank-word", which is mapped to "M-j", will yank from the main buffer and insert into the ivy buffer. So after re-mapping "C-s" to swiper, you can use "C-s M-j" to yank a word and search the file for it.

you can map 'C-w' to ivy-yank-word:

```elisp
(use-package counsel
:ensure t
:bind
(("M-y" . counsel-yank-pop)
:map ivy-minibuffer-map
("M-y" . ivy-next-line)
("C-w" . ivy-yank-word)))
```

http://cestlaz.github.io/posts/using-emacs-6-swiper/#comment-3436888755


Having bar match bár is called character folding

`(setq search-default-mode #'char-fold-to-regexp)`

https://emacs.stackexchange.com/questions/42107/unicode-character-folding-with-swiper-ivy


You can insert symbol at point with M-n - the same key as the history forward, which is one of the recommended Emacs workflows for inserting thing at point.

Additionally, M-j will extend the minibuffer by word at point, similar to what C-w does for isearch.

https://emacs.stackexchange.com/questions/28483/is-it-possible-to-insert-word-at-point-in-swiper
