# mkvmerge (MKVToolNix)

`brew install mkvtoolnix`. Remuxing copies the streams; nothing is re-encoded.

## Blu-ray to MKV

1. MakeMKV → Backup (decrypted): a folder with `BDMV/`.
2. Find the main playlist: the film's running time, all tracks (video, audio,
   dubs, subtitles), the biggest file in `BDMV/STREAM/`. Its number differs
   per disc; `00000.mpls` is often an intro, and a long playlist with one
   track is a loop of a short clip. List them, most tracks first, with
   [bluray-playlists](https://github.com/rofrol/dotfiles/blob/master/scripts/bluray-playlists):

   ```sh
   bluray-playlists DISC   # DISC contains BDMV/
   ```

3. Remux the main playlist with only the English and Polish audio and
   subtitles: [bluray-remux](https://github.com/rofrol/dotfiles/blob/master/scripts/bluray-remux)
   `[-n] DISC [OUT.mkv | DIR]` (`-n` shows the plan; a directory gets
   `DIR/<disc name>.mkv`). By hand, all tracks
   (output ≈ playlist size, check `df -h .`):

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

## Add .srt subtitles

[mkv-add-srt](https://github.com/rofrol/dotfiles/blob/master/scripts/mkv-add-srt)
`[-n] Film.mkv Film.pl.srt [Film.en.srt ...]` adds them in place: the
language comes from the name (`pl` is "Polski", `en` "English"), the first
becomes the default track, and the original is replaced only after the
remux has the expected number of tracks. By hand:

```sh
mkvmerge -o out.mkv Film.mkv --language 0:pl --track-name 0:Polski \
  --default-track-flag 0:yes Film.pl.srt
```

The `.srt` must be UTF-8 (mkvmerge assumes it); convert CP1250 first with
[subtitles_encoding_and_line_ending.sh](https://github.com/rofrol/dotfiles/blob/master/scripts/subtitles_encoding_and_line_ending.sh).
To encode a film without the disc's own subtitles first, use
`hevc-encode-no-subs` ([hevc_encode_film.md](../ffmpeg/hevc_encode_film.md)).

## Other

- Chapters to XML: `mkvextract input.mkv chapters chapters.xml`
- One audio track as default, no subtitles:
  `mkvmerge -o out.mkv --audio-tracks 2 --default-track-flag 2:1 --no-subtitles in.mkv`
- Extract a track: `mkvextract tracks input.mkv 2:en.srt` ([subtitle.md](subtitle.md))
