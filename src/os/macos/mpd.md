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
- **musicdb**: merges plays from all sources (ListenBrainz after the scrobbler went live, the MPD log before, skips filtered out), writes stickers `playCount`, `plays`, `lastPlayed`, `favorite`. History is kept as JSONL in a private git repo; the SQLite DB is a rebuildable cache.
- **hits**: top 10/100/1000 of a decade from the Billboard Year-End Hot 100 (1959–), genre filter like `"rock -country"` (word match on MusicBrainz genres), ranked by chart points or ListenBrainz listens; writes an MPD playlist of the songs I have, `--download` fetches the rest.

## rmpc

- Song table columns from stickers: `(kind: Sticker("plays"))`, `(kind: Sticker("favorite"))`.
- `SortByColumn(n)` (1-based) sorts the queue; I bind `P` to the Plays column.
- rmpc compares sticker values as text, so `"10"` sorts before `"9"`: musicdb writes `plays` space-padded to a fixed width.
- Covers: M.A.L.P. (Android) and rmpc read embedded art via MPD `readpicture`.

## Troubleshooting

- Scrobbles stopped → `launchctl print gui/$(id -u)/com.rofrol.listenbrainz-mpd`; log in `~/Library/Logs/`.
- After `cargo install listenbrainz-mpd`: `launchctl kickstart -k gui/$(id -u)/com.rofrol.listenbrainz-mpd`.
- `listenbrainz-mpd` 2.6 needs a recent rustc (`cfg_select`); `rustup default stable` if an old toolchain is pinned.
- Play counts not updating → `~/Library/Logs/musicdb.log`; `musicdb update` by hand.
- listenbrainz.org "Loading chunk … failed" is a front-end deploy/cache issue, not lost data: hard reload.
