# mkvmerge (MKVToolNix)

`brew install mkvtoolnix`. Remuxing copies the streams; nothing is re-encoded.

## Blu-ray playlist to MKV

How to back up a disc and find the right playlist: [bluray.md](bluray.md).

```sh
cd /path/to/DISC   # the folder that contains BDMV/
mkvmerge -i BDMV/PLAYLIST/00001.mpls                   # list tracks and chapters
time mkvmerge -o Movie.mkv BDMV/PLAYLIST/00001.mpls    # all tracks, chapters included
```

The output is about as big as the playlist (Cast Away: ~42 GiB), so check free space first (`df -h .`).

Keep only some tracks (IDs from `mkvmerge -i`):

```sh
mkvmerge -o Movie.mkv --audio-tracks 1 --subtitle-tracks 9,10 BDMV/PLAYLIST/00001.mpls
```

Track languages: `mkvmerge -J BDMV/PLAYLIST/00001.mpls`, field `tracks[].properties.language`.

## Chapters

mkvmerge copies chapters from the playlist by itself. To get them as a file:

```sh
mkvmerge -A -D -S BDMV/PLAYLIST/00001.mpls -o chapters.mkv   # no audio, video, subtitles
mkvextract chapters.mkv chapters chapters.xml
```

## Split one playlist into episodes (TV series disc)

When a series disc has all episodes in one playlist (Mr. Inbetween S01):

```sh
time mkvmerge BDMV/PLAYLIST/00000.mpls -o remux.mkv
mkvmerge -o output_%02d.mkv --split chapters:all remux.mkv                # one file per chapter
mkvmerge -o output_%02d.mkv --split timestamps:00:26:17.472,00:51:20.864 remux.mkv   # at given times
```

Get the episode boundaries from `chapters.xml` (above).

## Other

- Keep one audio track and make it default, drop subtitles:
  `mkvmerge -o output.mkv --audio-tracks 2 --default-track-flag 2:1 --no-subtitles input.mkv`
- Extract a track: `mkvextract tracks input.mkv 2:en.srt` (more in [subtitle.md](subtitle.md)).
