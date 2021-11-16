- pro players steam profiles http://steamcommunity.com/sharedfiles/filedetails/?id=718421952

## autoexec.cfg

actual:

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

bind 6 "buy awp; buy tec9"
bind 7 "buy awp"
bind 8 "buy deagle"

// https://gaming.stackexchange.com/questions/185520/how-to-change-video-to-fullscreen-and-windowed-in-console/185609#185609
mat_setvideomode 1920 1080 0

cl_showfps 1

host_writeconfig
```

1. `Steam > Right click CSGO > Manage > Browse local files`. Then open the `csgo` and then the `cfg` folders. (If you have the default installation path, it will be `C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg`)
2. Create an `autoexec.cfg` file by copying any other cfg file and renaming it to autoexec
3. Make sure the last line in the file is `host_writeconfig`

> `+exec autoexec` is not needed when the file is built correctly (correctly means `host_writeconfig` at the last line?) https://www.reddit.com/r/GlobalOffensive/comments/jbfjvv/comment/g8v4ffj/

## crosshair

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

## buy

```
bind "KP_HOME" "buy ssg08"
bind "6" "buy awp"
bind "KP_PGUP" "buy g3sg1; buy scar20"
bind "KP_LEFTARROW" "buy galilar; buy famas"
bind "KP_5" "buy m4a1;buy ak47"
bind "KP_RIGHTARROW" "buy aug; buy sg556"
bind "KP_END" "buy mac10;buy mp9"
bind "KP_DOWNARROW" "buy mp7"
bind "KP_PGDN" "buy p90"
bind "KP_INS" "buy p250"
bind "KP_DEL" "buy defuser"
bind "KP_SLASH" "buy smokegrenade"
bind "KP_MULTIPLY" "buy hegrenade"
bind "KP_MINUS" "buy flashbang"
bind "KP_PLUS" "buy incgrenade; buy molotov"
bind "KP_ENTER" "buy vesthelm; buy vest"
bind ins "buy nova"
bind home "buy xm1014"
bind pgup "buy mag7; buy sawedoff"
bind del "buy deagle"
bind end "buy elite"
bind pgdn "buy fn57; buy tec9"
bind leftarrow "buy bizon"
bind rightarrow "buy ump45"
bind uparrow "buy negev"
bind downarrow "buy m249"
bind "KP_PLUS" "buy incgrenade; buy molotov"
bind "KP_PLUS" "buy vest"
bind "NUM_LOCK" "buy incgrenade; buy molotov"
```

https://www.reddit.com/r/GlobalOffensive/comments/22z178/key_binds_for_purchasing_weapons_commands_in/
