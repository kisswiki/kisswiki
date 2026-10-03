# MPD music stack on macOS

How my local music setup fits together. Tool usage lives in each tool's `--help`;
the tools are in my dotfiles (`~/scripts`, see `~/scripts/README.md`).

## Install

```
brew install mpd mpc
mkdir -p ~/.config/mpd/playlists
brew services start mpd        # LaunchAgent sh.brew.mpd (KeepAlive)
cargo install rmpc --locked    # TUI client (I use my fork rormpc: github.com/rofrol/rormpc, config in ~/.config/rormpc)
music-companions install       # scrobbler ro-listenbrainz-mpd (my fork) + launchd agents, from my dotfiles ~/scripts
mpc update && mpc add / && rmpc
```

`~/.mpdconf` must set, besides `music_directory`, `playlist_directory`, `db_file`, `log_file`:

- `state_file` — without it every MPD restart empties the queue.
- `sticker_file` — the per-song key/value DB used for play counts (rmpc reads stickers).

## Pieces

```
YouTube ──yt-mp3-mb──▶ mp3 (MusicBrainz tags, MBIDs, embedded cover) ──▶ MPD library
MPD ──ro-listenbrainz-mpd (LaunchAgent)──▶ ListenBrainz
ListenBrainz, MPD log, Takeout, Spotify export ──musicdb (hourly LaunchAgent)──▶ play history ──▶ MPD stickers ──▶ rmpc columns
Billboard year-end charts + MusicBrainz genres ──hits──▶ MPD playlists ("Hits 1980s rock top100")
```

- **yt-mp3-mb**: yt-dlp → mp3 → identifies the song on MusicBrainz (URL relation, AcoustID, ListenBrainz lookup), writes clean artist/title/MBIDs, embeds a cover (Cover Art Archive, else the YouTube thumbnail cropped square) and sets an album tag (clients cache art per album).
- **ro-listenbrainz-mpd**: my fork of [listenbrainz-mpd](https://codeberg.org/elomatreb/listenbrainz-mpd) ([github.com/rofrol/ro-listenbrainz-mpd](https://github.com/rofrol/ro-listenbrainz-mpd)). It counts a listen only after 90% of the song played in one run: pauses don't matter, a seek or a stop starts the run again, a song without a known duration is never sent (upstream: half the song or 4 min). It sends the MBID from the file. It only scrobbles while running, so it runs as a LaunchAgent (`KeepAlive`); plays while it was down are lost. A different package name than upstream, so `cargo install listenbrainz-mpd` would add a second scrobbler instead of replacing it: don't. Config and token stay in upstream's `listenbrainz-mpd` directory.
- **musicdb**: merges plays from all sources (ListenBrainz after the scrobbler went live, the MPD log before, skips filtered out), writes stickers `playCount`, `plays`, `lastPlayed`; likes come from rmpc's own `like` sticker. History is kept as JSONL in a private git repo; the SQLite DB is a rebuildable cache.
- **Skips**: ro-listenbrainz-mpd appends a song left for another song before its end (not a listen, not a
  stop) to `skips.jsonl` next to its cache; `musicdb` imports it (private data repo, never sent to ListenBrainz),
  sets the `skips` sticker (skips since the last play) and lists songs with 2+ in the MPD playlist `Skipped`,
  to review in rormpc and delete with Ctrl-x. Past ListenBrainz listens stay: deleting them would rewrite old
  years' statistics, which is where a change of taste shows.
- **mpd-gap**: 3 s of silence between songs. While a song plays it sets single to oneshot; MPD 0.24 then pauses
  at 0:00 of the next song (queue or random order) and mpd-gap resumes it. A user pause is never resumed.
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

- Spotify history: `musicdb import-spotify <zip>` for local counts, `musicdb lb-import-spotify` to send it to
  ListenBrainz; details in [spotify_history_import.md](../../listenbrainz/spotify_history_import.md).

## rmpc / rormpc

- My fork rormpc adds a Hits pane (table of `hits --json` output) and `Status(BuildRevision)` (sha + commit subject in the footer); see its RORMPC.md.

- Year column: `Transform(Truncate(content: (kind: Property(Other("date"))), length: 4))` (0.11 has no `Date` property).
  mbtag writes the MusicBrainz first release date to TDRC/TDOR; yt-dlp's upload date goes to `TXXX:YouTube Upload Date`.
- Song table columns from stickers: `(kind: Sticker("plays"))`; likes via `Transform(Replace(content: (kind: Sticker("like")), replacements: [(match: "2", replace: (kind: Text("♥")))]))`.
- `SortByColumn(n)` (1-based) sorts the queue; I bind `Y` to Year and `P` to Plays.
- rmpc compares sticker values as text, so `"10"` sorts before `"9"`: musicdb writes `plays` space-padded to a fixed width.
- Covers: M.A.L.P. (Android) and rmpc read embedded art via MPD `readpicture`.

## Media keys (Now Playing)

macOS sends keyboard media keys and Bluetooth headphone buttons to the app registered with Now Playing, so
MPD needs a bridge: [mpd-now-playable](https://git.00dani.me/00dani/mpd-now-playable) (Python/PyObjC).

```
uv tool install mpd-now-playable
mpd-now-playable install-launchagent    # ~/Library/LaunchAgents/me.00dani.mpd-now-playable.plist, starts it
```

Remapping keys with skhd/Karabiner is not a substitute: headphone buttons never become key events. A browser
that starts playing takes over Now Playing until MPD plays again.

## Troubleshooting

- Scrobbles stopped → `music-companions status`; log in `~/Library/Logs/ro-listenbrainz-mpd.log`.
- Changing the scrobbler: commit and tag in the fork, bump `RO_LB_TAG` in `music-companions`, run `music-companions install`
  (`install --local` builds the checkout without a tag, for trying a change).
- `ro-listenbrainz-mpd` 2.6 needs a recent rustc (`cfg_select`); `rustup default stable` if an old toolchain is pinned.
- Play counts not updating → `~/Library/Logs/musicdb.log`; `musicdb update` by hand.
- listenbrainz.org "Loading chunk … failed" is a front-end deploy/cache issue, not lost data: hard reload.
