- https://www.emacswiki.org/emacs/Projectile
- http://cestlaz.github.io/posts/using-emacs-33-projectile-jump/
- https://projectile.readthedocs.io/en/latest/configuration/
- https://projectile.readthedocs.io/en/latest/
- https://github.com/bbatsov/projectile/blob/master/doc/usage.md
- https://github.com/ericdanan/counsel-projectile
- https://www.reddit.com/r/emacs/comments/19w642/how_can_i_give_projectile_a_specific_command_for/
- http://endlessparentheses.com/improving-projectile-with-extra-commands.html
- https://emacs.stackexchange.com/questions/24907/how-to-use-dir-locals-el-with-projectile
- https://emacs.stackexchange.com/questions/12650/have-projectile-find-file-fall-back-to-ido-find-file-outside-of-projects
- https://emacs.stackexchange.com/questions/16497/how-to-exclude-files-from-projectile

## Shell

- http://astronautradio.com/post/152934998548/open-a-terminal-with-projectile-in-emacs

## TODO: Read

- https://writequit.org/denver-emacs/presentations/2016-01-26-elisp-projectile-eshell.html
- https://www.philnewton.net/blog/exploring-emacs-projectile/

## Quickstart

In config:

```lisp
(projectile-mode)
```

Note: `projectile-global-mode` is probably not needed.

Open file, then:

`C-h v projectile-known-projects` or `C-C p p`

Reopen emacs

`M-x projectile-switch-project`

Open another file in project:

`M-x project-find-file` or `C-c p f`

- https://emacs.stackexchange.com/questions/32634/how-can-the-list-of-projects-used-by-projectile-be-manually-updated
- https://projectile.readthedocs.io/en/latest/usage/

## clear cache and exclude files

`C-u C-c p f`

https://stackoverflow.com/questions/40623499/how-to-force-emacs-projectile-to-reinitialize-a-project/41003451#41003451

or `M-x projectile-invalidate-cache`

https://emacs.stackexchange.com/questions/12843/how-to-clear-cache-of-projectile-file-in-spacemacs

better use rg

How about deleting ~/.emacs.d/projectile.cache and using either ag(the silver searcher) or rg (ripgrep) to generate the project files ? Check out my [projectile config](https://github.com/CSRaghunandan/.emacs.d/blob/master/setup-files/setup-projectile.el) to get an idea on how you can use rg to generate project files 

https://stackoverflow.com/questions/40623499/how-to-force-emacs-projectile-to-reinitialize-a-project#comment68597596_40623499

- https://emacs.stackexchange.com/questions/16497/how-to-exclude-files-from-projectile/16499
- https://github.com/bbatsov/projectile/issues/1075

## Use rg ripgrep

- https://github.com/seagle0128/.emacs.d/blob/master/lisp/init-projectile.el
- https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-projectile.el
- https://github.com/nlamirault/ripgrep.el
- https://emacs.stackexchange.com/questions/16497/how-to-exclude-files-from-projectile/29200#29200

## projectile-ripgrep problem

installed ripgrep.el, added rg to PATH

```lisp
(setenv  "PATH" (concat
     "~/.cargo/bin/" ";"
     (getenv "PATH")
     ))
```

and still problem:

```
Ripgrep started at Tue Jun 19 07:25:44

rg  --fixed-strings --glob !TAGS --glob !.idea --glob !.ensime_cache --glob !.eunit --glob !.git --glob !.hg --glob !.fslckout --glob !_FOSSIL_ --glob !.bzr --glob !_darcs --glob !.tox --glob !.svn --glob !.stack-work --no-heading --vimgrep -n --color=always --ignore-case -- emacsclient .
/bin/bash: rg: command not found

Ripgrep exited abnormally with code 127 at Tue Jun 19 07:25:44
```

## unignore file

Cannot do this globally. Only in `.projectile`:

`!.dir-locals.el`

http://projectile.readthedocs.io/en/latest/usage/#ignoring-files
