- https://store.steampowered.com/account/registerkey
- Add &client=1 at the end of your gift link, so your full link will look like this:
  https://store.steampowered.com/account/ackgift/1234567890ABCDEF?redeemer=mail@mail.com&client=1 https://www.reddit.com/r/Steam/comments/3cbes8/how_can_i_activate_a_link_with_game_gift_on_my/
- list games by add date
  - https://store.steampowered.com/account/licenses/
  - https://store.steampowered.com/account/history/
  - https://steamcommunity.com/discussions/forum/10/864969953168772865/?ctp=2#c1319962683448797273

## Change currency/country

`Settings > Account > View Account Details > In section "STORE AND PURCHASE HISTORY" click "Update store country"`

https://support.steampowered.com/kb_article.php?ref=6627-QSNM-5276

## list of games

Enable api key https://steamcommunity.com/dev/apikey

```
export STEAM_API_KEY='YOUR_KEY'

curl -sG 'https://api.steampowered.com/IPlayerService/GetOwnedGames/v1/' \
  --data-urlencode "key=$STEAM_API_KEY" \
  --data-urlencode 'steamid=76561198020278653' \
  --data-urlencode 'include_appinfo=true' \
  --data-urlencode 'include_played_free_games=true' \
  --data-urlencode 'format=json' \
  -o games.json

 jq -r '.response.games[].name' games.json | sort > games.txt

 jq -r '
  ["appid", "name", "playtime_hours"],
  (.response.games[] | [.appid, .name, (.playtime_forever / 60)])
  | @csv
' games.json > games.csv

jq -r '
  .response.games[]
  | "<a href=\"https://store.steampowered.com/app/\(.appid)\">\( .name | @html )</a>"
' games.json > games.html

jq -r '
  "<ul>",
  (
    .response.games[]
    | "<li><a href=\"https://store.steampowered.com/app/\(.appid)\">\( .name | @html )</a></li>"
  ),
  "</ul>"
' games.json > games.html

jq '[.response.games[] | {appid, name}]' games.json > games-simple.json

jq '[.response.games[]].[0]' games.json

jq '[.response.games[] | {appid, name, playtime_forever, rtime_last_played}]' games.json > games_trimmed.json
```

- https://partner.steamgames.com/doc/webapi/IPlayerService#GetOwnedGames
