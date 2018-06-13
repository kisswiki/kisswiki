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

## 

https://stackoverflow.com/questions/40623499/how-to-force-emacs-projectile-to-reinitialize-a-project

## Use rg ripgrep

- https://github.com/seagle0128/.emacs.d/blob/master/lisp/init-projectile.el
- https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-projectile.el
- https://emacs.stackexchange.com/questions/16497/how-to-exclude-files-from-projectile