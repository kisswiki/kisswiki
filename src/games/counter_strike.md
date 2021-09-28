- pro players steam profiles http://steamcommunity.com/sharedfiles/filedetails/?id=718421952

## autoexec.cfg

1. `Steam > Right click CSGO > Manage > Browse local files`. Then open the `csgo` and then the `cfg` folders. (If you have the default installation path, it will be `C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg`)
2. Create an `autoexec.cfg` file by copying any other cfg file and renaming it to autoexec
3. Make sure the last line in the file is `host_writeconfig`

> `+exec autoexec` is not needed when the file is built correctly (correctly means `host_writeconfig` at the last line?) https://www.reddit.com/r/GlobalOffensive/comments/jbfjvv/comment/g8v4ffj/?utm_source=reddit&utm_medium=web2x&context=3

Example autoexec.cfg from [s1mple's crosshair config](https://liquipedia.net/counterstrike/S1mple):

```
cl_crosshairalpha 255
cl_crosshaircolor 1
cl_crosshairdot 0
cl_crosshairgap -3
cl_crosshairsize 2
cl_crosshairstyle 4
cl_crosshairusealpha 1
cl_crosshairthickness 0
cl_crosshair_sniper_width 1
cl_crosshair_outlinethickness 1
cl_crosshair_drawoutline 0
host_writeconfig
```

`;` have to be used when commands in one line:

```
cl_crosshairalpha 255; host_writeconfig
```

- https://blog.leetify.com/updated-2020-how-to-create-and-use-an-autoexec-config-file-in-csgo/
- https://www.reddit.com/r/GlobalOffensive/comments/gws5wx/config_that_lets_you_try_out_the_crosshairs_of/

## import/export crosshair

``settings > crosshair > share or import`

You can also use `apply_crosshair_code CSGO-rJ9cP-v9QA4-Mpkew-mQpdb-LbRVP` in console.

- https://www.reddit.com/r/GlobalOffensive/comments/g813dh/how_to_enter_a_crosshair_code/
- https://www.reddit.com/r/GlobalOffensive/comments/gws5wx/config_that_lets_you_try_out_the_crosshairs_of/

```

```
