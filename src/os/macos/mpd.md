# MPD music stack on macOS

How my local music setup fits together. Tool usage lives in each tool's `--help`;
the tools are in my dotfiles (`~/scripts`, see `~/scripts/README.md`).

## Install

```
brew install mpd mpc
mkdir -p ~/.config/mpd/playlists
brew services start mpd        # LaunchAgent sh.brew.mpd (KeepAlive)
cargo install rmpc --locked    # TUI client
cargo install listenbrainz-mpd # scrobbler
mpc update && mpc add / && rmpc
```

`~/.mpdconf` must set, besides `music_directory`, `playlist_directory`, `db_file`, `log_file`:

- `state_file` — without it every MPD restart empties the queue.
- `sticker_file` — the per-song key/value DB used for play counts (rmpc reads stickers).

## Pieces

```
YouTube ──yt-mp3-mb──▶ mp3 (MusicBrainz tags, MBIDs, embedded cover) ──▶ MPD library
MPD ──listenbrainz-mpd (LaunchAgent)──▶ ListenBrainz
ListenBrainz, MPD log, Takeout, Spotify export ──musicdb (hourly LaunchAgent)──▶ play history ──▶ MPD stickers ──▶ rmpc columns
Billboard year-end charts + MusicBrainz genres ──hits──▶ MPD playlists ("Hits 1980s rock top100")
```

- **yt-mp3-mb**: yt-dlp → mp3 → identifies the song on MusicBrainz (URL relation, AcoustID, ListenBrainz lookup), writes clean artist/title/MBIDs, embeds a cover (Cover Art Archive, else the YouTube thumbnail cropped square) and sets an album tag (clients cache art per album).
- **listenbrainz-mpd**: counts a listen after half the song or 4 min and sends the MBID from the file. It only scrobbles while running, so it runs as a LaunchAgent (`KeepAlive`); plays while it was down are lost.
- **musicdb**: merges plays from all sources (ListenBrainz after the scrobbler went live, the MPD log before, skips filtered out), writes stickers `playCount`, `plays`, `lastPlayed`; likes come from rmpc's own `like` sticker. History is kept as JSONL in a private git repo; the SQLite DB is a rebuildable cache.
- **hits**: top 10/100/1000 of a decade from the Billboard Year-End Hot 100 (1959–), genre filter like `"rock -country"` (word match on MusicBrainz genres), ranked by chart points or ListenBrainz listens; writes an MPD playlist of the songs I have, `--download` fetches the rest.

## Everyday use

- `r` in rmpc: like / dislike (rmpc's own `like` sticker). musicdb sends changes to ListenBrainz as love / clear / hate.
- `Y` / `P`: sort the queue by year / by my play count.
- `Ctrl-x`: delete the selected song: it goes to the Trash and its ListenBrainz listens are queued. Nothing
  irreversible happens until `musicdb deletions` (review) and `musicdb deletions --confirm` (deletes the listens,
  LB applies deletions within about an hour, and removes the video from my YouTube music playlists via
  `yt-playlist`, YouTube Data API with my own published-but-unverified OAuth app). `Ctrl-y` undoes the last `Ctrl-x` (repeat to go further back),
  restoring the file and its stickers; `--cancel ID` restores an older one. Irreversible steps never run on a timer.
- `hits all -n 10 -g "+rock -thrash metal" --playlist`: top 10 of every decade in one playlist; `--owned` picks
  the top 10 I already have.
- ListenBrainz recommendations (Daily/Weekly Jams, Weekly Exploration) appear as MPD playlists `LB …`
  once LB generates them; `musicdb lb-playlists --download` fetches the missing tracks.

## rmpc

- Year column: `Transform(Truncate(content: (kind: Property(Other("date"))), length: 4))` (0.11 has no `Date` property).
  mbtag writes the MusicBrainz first release date to TDRC/TDOR; yt-dlp's upload date goes to `TXXX:YouTube Upload Date`.
- Song table columns from stickers: `(kind: Sticker("plays"))`; likes via `Transform(Replace(content: (kind: Sticker("like")), replacements: [(match: "2", replace: (kind: Text("♥")))]))`.
- `SortByColumn(n)` (1-based) sorts the queue; I bind `Y` to Year and `P` to Plays.
- rmpc compares sticker values as text, so `"10"` sorts before `"9"`: musicdb writes `plays` space-padded to a fixed width.
- Covers: M.A.L.P. (Android) and rmpc read embedded art via MPD `readpicture`.

## Troubleshooting

- Scrobbles stopped → `launchctl print gui/$(id -u)/com.rofrol.listenbrainz-mpd`; log in `~/Library/Logs/`.
- After `cargo install listenbrainz-mpd`: `launchctl kickstart -k gui/$(id -u)/com.rofrol.listenbrainz-mpd`.
- `listenbrainz-mpd` 2.6 needs a recent rustc (`cfg_select`); `rustup default stable` if an old toolchain is pinned.
- Play counts not updating → `~/Library/Logs/musicdb.log`; `musicdb update` by hand.
- listenbrainz.org "Loading chunk … failed" is a front-end deploy/cache issue, not lost data: hard reload.
