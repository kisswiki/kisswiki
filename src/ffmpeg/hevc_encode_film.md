# Shrinking a Blu-ray remux: HEVC vs AV1 for playback on an M1 Mac

Script: `~/scripts/hevc-encode IN.mkv [OUT.mkv]` (dotfiles), which runs:

```
caffeinate -i nice -n 19 ffmpeg -i IN.mkv -map 0 \
  -c:v libx265 -pix_fmt yuv420p10le -preset slow -crf 18 \
  -x265-params "pools=4:no-sao=1:aq-mode=3:psy-rd=2.0:psy-rdoq=1.0" \
  -filter:a:0 channelmap=channel_layout=5.1 -c:a libopus -b:a 384k -mapping_family 1 \
  -c:s copy OUT.mkv
```

- Not lossless: re-encoding a lossy source always loses something; the aim is
  "can't tell the difference".
- Do not use `-tune grain` with x265: it turns off adaptive quantization and
  inflates the bitrate (often 20-25 Mb/s on 35 mm grain). `psy-rd`/`psy-rdoq`
  with `aq-mode=3` and `no-sao` keep the grain at a sane size.
- 10-bit (`yuv420p10le`) even from an 8-bit source: less banding at the same size.
- libopus refuses `5.1(side)` (the usual Blu-ray layout) with
  `Invalid channel layout 5.1(side) for specified mapping family 1`;
  `channelmap=channel_layout=5.1` relabels the side pair as back.
- On laptop speakers or headphones lossless DTS-HD MA 5.1 buys nothing (it is
  downmixed to stereo): Opus 384k is ~0.4 GB instead of ~4.5 GB.
- Keeping the Mac usable during the encode (M1 Pro, x265 slow, 1080p):

  | How | CPU | Speed | Full film |
  |---|---|---|---|
  | `nice -n 19` only | ~690% (all 10 cores, 89 C, loud fan) | ~4.8 fps | ~11 h |
  | `taskpolicy -c utility` | ~630% | ~4.8 fps | ~11 h |
  | `taskpolicy -b` (background QoS) | ~80-140% | ~0.15 fps | ~380 h |
  | `-x265-params pools=4` + `nice -n 19` | ~380% | ~2.3 fps | ~25 h |

  `nice` only yields to other work; background QoS throttles far more than
  "efficiency cores only" suggests. `pools=N` is the knob that works. A
  running encode can be paused with `kill -STOP PID` and resumed with
  `kill -CONT PID`; `caffeinate -i` keeps the Mac from sleeping.

## Measurements (2026-11-06, M1 Pro, ffmpeg 9.0.2)

Source: Cast Away, 2 h 24 min, H.264 1080p 30.8 Mb/s (33.3 GB video),
DTS-HD MA 5.1. Sample: 120 s from 35:00; VMAF against the source.

| Encode | Mb/s | Full video | Encode time (full) | VMAF mean / min |
|---|---|---|---|---|
| SVT-AV1 preset 4, CRF 22 | 4.6 | ~4.9 GB | ~1.5 h (39 fps) | 96.5 / 88.2 |
| SVT-AV1 preset 4, CRF 18 | 7.1 | ~7.6 GB | ~1.7 h | 97.3 / 90.3 |
| SVT-AV1 preset 4, CRF 16 | 9.6 | ~10.3 GB | ~1.4 h | 97.8 / 91.6 |
| x265 slow, CRF 18 | 15.7 | ~16.9 GB | ~10.3 h (5.6 fps) | 98.2 / 94.2 |

SVT-AV1 options: `-pix_fmt yuv420p10le -preset 4 -crf N -svtav1-params tune=0:enable-qm=1`.

Playback in mpv, 60 s per sample, `top` %CPU / energy impact of the mpv process:

| Sample | Decoding | Window 1280x720, no config | Fullscreen, no config | Fullscreen, `profile=high-quality` + interpolation + deband |
|---|---|---|---|---|
| H.264 source | VideoToolbox (hardware) | 15 | 16 | 25 |
| HEVC CRF 18 | VideoToolbox (hardware) | 14 | 15 | 26 |
| AV1 CRF 16 | dav1d (software) | 46 | 51 | 55 |

- M1/M2 have no hardware AV1 decoder (M3 and later do), so AV1 costs ~3x the
  CPU of HEVC: fine on mains, worse on battery. HEVC won for that reason.
- `top`'s energy impact barely counts GPU work, so the high-quality config
  costs more than the table shows. For grainy Blu-ray film it buys little:
  deband has no banding to remove (and `deband-grain` adds fake grain), and
  24 fps already divides the 120 Hz display evenly.
- VMAF can reward smoothed grain; look at dark, grainy scenes too.
