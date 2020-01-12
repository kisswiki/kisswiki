`.mpv/scripts/pl.lua`

```lua
json = require "json"
mp.add_forced_key_binding(
    "L",
    "print-playlist",
    function()
        pl = json.decode(mp.get_property("playlist", "[]"))
        for _, v in pairs(pl) do
            print (v["current"] and ">" or " ", v["filename"])
        end
    end
)
```

Mapping to `L` does not work for me. I have used `'` instead.

Also there are many json modules for lua. With this [query](https://github.com/search?q=language%3Alua+json+decode) I have found [craigmj/json4lua](https://github.com/craigmj/json4lua).

Also [mpv needs lua 5.2](https://github.com/mpv-player/mpv/wiki/FAQ#Why_does_mpv_not_support_Lua_53).

On Ubuntu you [need to install](https://stackoverflow.com/questions/39760619/lua-cannot-find-installed-luarocks-on-ubuntu/39761123#39761123):

`sudo apt install lua5.2 lua5.2-dev luarocks`

Then

`sudo luarocks install json4Lua`

I see there is also https://github.com/mpx/lua-cjson/ but I have not tried it 

Code from https://github.com/mpv-player/mpv/issues/5868#issuecomment-573399328
