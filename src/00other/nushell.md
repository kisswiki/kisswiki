## config location

```nushell
❯ $nu.env-path
/Users/roman.frolow/.config/nushell/env.nu

❯ $nu.config-path
/Users/roman.frolow/.config/nushell/config.nu
```

## macos and config location in ~/.config

`ln -s ~/.config/nushell ~/Library/Application\ Support/`

- https://github.com/nushell/nushell/issues/10746
- https://github.com/nushell/nushell/issues/893
- my answer https://superuser.com/questions/1804643/how-do-i-change-the-default-location-for-nushell-configration-files/1827175#1827175

## iterm2 and nushell

in iterm2 set `Preferences > Profiles > General > Command > Command` to `/opt/homebrew/bin/nu`

## alias

not single quotes

bash/zsh:

`aliast gitka='gitk --all &'`

nushell:

config nu or

`alias gitk = gitk --all`

https://www.nushell.sh/book/aliases.html

## background task

Cannot use `gitk --all &` in nushell.

Just use `gitk --all` and terminal will not be blocked.

https://www.nushell.sh/book/background_task.html

## Use ; instead of &&

Cannot use `cd path && nvim`

Use `cd path ; nvim`

https://github.com/nushell/nushell/issues/4139

## space in path and completion

Does not work `cd path\ with\ space`

Nushell completes with single quotes to `cd 'path with space'`

## starship

https://starship.rs/#nushell

## ls -ltr - -t is not known

`ls | sort-by modified | reverse`

## glob

`for $i in (glob "*.{(?i)w(?i)e(?i)b(?i)p,pdf}") { echo $i }`

`help glob`

https://www.nushell.sh/commands/docs/glob.html

## pyenv

Problem

There is activator for nushell but it was not installed with `python3 -m venv .venv`

I have downloaded `activate.nu` and put it in `.venv/bin/activate.nu` but it didn't work:

```nushell
source .venv/bin/activate.nu
Error: nu::parser::unexpected_keyword

  × Statement used in pipeline.
    ╭─[/Users/roman.frolow/projects/dbschenker/video-analytics/clg024-video-analytics-cl/.venv/bin/activate.nu:95:1]
 95 │ export alias pydoc = python -m pydoc
 96 │ export alias deactivate = overlay hide activate
    ·                           ───┬───
    ·                              ╰── not allowed in pipeline
    ╰────
  help: 'overlay' keyword is not allowed in pipeline. Use 'overlay' by itself,
        outside of a pipeline.
```

- https://github.com/nushell/nu_scripts/pull/219
- https://github.com/pypa/virtualenv/blob/main/src/virtualenv/activation/nushell/activate.nu
-
