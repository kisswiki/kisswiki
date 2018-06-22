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

## ignore

```lisp
(add-to-list 'projectile-globally-ignored-files ".tern-port")
```

- https://writequit.org/eos/eos-helm.html
- https://emacs.stackexchange.com/questions/16497/how-to-exclude-files-from-projectile/16498
- https://www.reddit.com/r/emacs/comments/4he1rx/how_to_projectile_globally_ignore_a_regex_file/

```lisp
        projectile-globally-ignored-files
        (append '(".pyc"
                  ".class"
                  "~")
                projectile-globally-ignored-files))
```

https://emacs.stackexchange.com/questions/24397/ignore-backup-files-in-projectile

## Share ignore with rg

```lisp
    (let ((command
           (cond
            ((executable-find "rg")
             (let ((rg-cmd ""))
               (dolist (dir projectile-globally-ignored-directories)
                 (setq rg-cmd (format "%s --glob '!%s'" rg-cmd dir)))
               (concat "rg -0 --files --color=never --hidden" rg-cmd))))))
    (setq projectile-generic-command command))
```

- https://github.com/seagle0128/.emacs.d/blob/9d9a5e64169fdb08463e83f1a72fdaab7ebf896f/lisp/init-projectile.el#L48
- https://emacs.stackexchange.com/questions/16497/how-to-exclude-files-from-projectile/29200#29200

```lisp
;;; Default rg arguments
;; https://github.com/BurntSushi/ripgrep
(defconst modi/rg-arguments
  `("--no-ignore-vcs"                   ;Ignore files/dirs ONLY from `.ignore'
    "--line-number"                     ;Line numbers
    "--smart-case"
    "--follow"                 ;Follow symlinks
    "--max-columns" "150"      ;Emacs doesn't handle long line lengths very well
    "--ignore-file" ,(expand-file-name ".ignore" (getenv "HOME")))
  "Default rg arguments used in the functions in `counsel' and `projectile'
packages.")
```

- https://github.com/kaushalmodi/.emacs.d/blob/e244053014272ad39901bf3306b762b5faa2d8a5/general.el#L106

## unignore file

Cannot do this globally. Only in `.projectile`:

`!.dir-locals.el`

http://projectile.readthedocs.io/en/latest/usage/#ignoring-files

## ignore with .dir-locals.el

```lisp
((nil . ((projectile-globally-ignored-files . ("MyBinaryFile")))))
```

https://github.com/bbatsov/projectile/blob/master/doc/configuration.md

setq in eval will change the global value of the variable (unless of course the variable was declared local to begin with.)

```lisp
((nil
   (eval . 
         (set 
          (make-local-variable 'projectile-globally-ignored-files)
          (push "SOME-VALUE" projectile-globally-ignored-files)))))
```

https://emacs.stackexchange.com/questions/24907/how-to-use-dir-locals-el-with-projectile

## ignore with .projectile

```
-/.meta
-/.projectile
```

https://emacs.stackexchange.com/questions/16948/ignoring-files-in-projectile
