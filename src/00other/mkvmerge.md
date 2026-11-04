# mkvmerge (MKVToolNix)

`brew install mkvtoolnix`. Remuxing copies the streams; nothing is re-encoded.

## Blu-ray to MKV

1. MakeMKV → Backup (decrypted): a folder with `BDMV/`.
2. Find the main playlist: the film's running time, all tracks (video, audio,
   dubs, subtitles), the biggest file in `BDMV/STREAM/`. Its number differs
   per disc; `00000.mpls` is often an intro, and a long playlist with one
   track is a loop of a short clip.

   ```sh
   cd DISC   # contains BDMV/
   for f in BDMV/PLAYLIST/*.mpls; do
     mkvmerge -J "$f" | python3 -I -c '
   import json, sys
   d = json.load(sys.stdin); c = d["container"]["properties"]
   print(round(c.get("playlist_duration", 0) / 6e10), "min",
         len(d["tracks"]), "tracks", sys.argv[1])' "$f"
   done | sort -nr | head
   ```

3. Remux (output ≈ playlist size, check `df -h .`):

   ```sh
   mkvmerge -o Movie.mkv BDMV/PLAYLIST/00001.mpls
   ```

Only some tracks (IDs from `mkvmerge -i FILE`):
`mkvmerge -o Movie.mkv --audio-tracks 1 --subtitle-tracks 9,10 BDMV/PLAYLIST/00001.mpls`

## Series disc: one playlist into episodes

```sh
mkvmerge -o all.mkv BDMV/PLAYLIST/00000.mpls
mkvmerge -o ep_%02d.mkv --split chapters:all all.mkv
```

## Other

- Chapters to XML: `mkvextract input.mkv chapters chapters.xml`
- One audio track as default, no subtitles:
  `mkvmerge -o out.mkv --audio-tracks 2 --default-track-flag 2:1 --no-subtitles in.mkv`
- Extract a track: `mkvextract tracks input.mkv 2:en.srt` ([subtitle.md](subtitle.md))
