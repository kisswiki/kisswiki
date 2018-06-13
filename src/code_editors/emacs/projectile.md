##Quickstart

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

## clear cache and exclue files

`C-u C-c p f` or better use rg

How about deleting ~/.emacs.d/projectile.cache and using either ag(the silver searcher) or rg (ripgrep) to generate the project files ? Check out my [projectile config](https://github.com/CSRaghunandan/.emacs.d/blob/master/setup-files/setup-projectile.el) to get an idea on how you can use rg to generate project files 

https://stackoverflow.com/questions/40623499/how-to-force-emacs-projectile-to-reinitialize-a-project#comment68597596_40623499

## Use rg ripgrep

- https://github.com/seagle0128/.emacs.d/blob/master/lisp/init-projectile.el
- https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-projectile.el
- https://emacs.stackexchange.com/questions/16497/how-to-exclude-files-from-projectile/29200#29200