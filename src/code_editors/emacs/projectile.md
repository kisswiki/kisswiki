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