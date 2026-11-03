# Blu-ray backup to MKV

1. Back up the disc with MakeMKV ("Backup", decrypted). You get a folder with
   `BDMV/`, `CERTIFICATE/` and `MAKEMKV/`.
2. Find the playlist (`BDMV/PLAYLIST/*.mpls`) that holds the main feature (see below).
3. Remux that playlist into one MKV with mkvmerge, without re-encoding: [mkvmerge.md](mkvmerge.md).

## Which playlist is the main feature

The number differs between publishers: The Matrix and Mad Max had it in
`00800.mpls`, Cast Away in `00001.mpls`. `00000.mpls` is often a short
intro clip (Cast Away: 13 s, a 38 MB "remux"), so check every time.

List all playlists with their duration (minutes), size (MiB) and number of tracks, longest first:

```sh
cd /path/to/DISC   # the folder that contains BDMV/
for f in BDMV/PLAYLIST/*.mpls; do
  mkvmerge -J "$f" 2>/dev/null | python3 -I -c '
import json, sys
d = json.load(sys.stdin)
c = d.get("container", {}).get("properties", {})
print(round(c.get("playlist_duration", 0) / 6e10, 1),
      c.get("playlist_size", 0) // 2**20,
      len(d.get("tracks", [])), sys.argv[1])' "$f"
done | sort -n -r | head
```

The main feature is the playlist that:

- has the film's running time (Cast Away: 143.8 min for a ~2 h 23 min film);
- has the full set of tracks: video, the original audio, dubs, many subtitles, chapters;
- points to the biggest file in `BDMV/STREAM/` (Cast Away: one 45 GB `00351.m2ts`).

Beware of decoy playlists that look longer: Cast Away's `01000.mpls` and
`01001.mpls` show 225 min, but they repeat one 318 MB `00014.m2ts` about
100 times and have a single track. Check which stream files a playlist uses:

```sh
mkvmerge -J BDMV/PLAYLIST/00001.mpls | python3 -I -c 'import json,sys; print(json.load(sys.stdin)["container"]["properties"]["playlist_file"])'
```

To be sure, watch the start: `open -a IINA BDMV/PLAYLIST/00001.mpls`.
The MakeMKV GUI also marks the longest title on the disc.

## Other tools tried

- `ffmpeg -playlist N -i bluray:. -map 0 -c copy out.mkv` works too (libbluray), but mkvmerge
  keeps chapters and track languages with less effort.
- tsMuxeR, HandBrake (re-encodes): https://handbrake.fr/
