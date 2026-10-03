# Import Spotify listening history into ListenBrainz (API)

1. Spotify: spotify.com/account/privacy → **Extended streaming history** (plus "Account data" for liked
   songs). Spotify mails a zip after days to ~30 days: `Spotify Extended Streaming History/Streaming_History_Audio_YYYY.json`.
2. ListenBrainz user token: listenbrainz.org/settings (or the `token` in listenbrainz-mpd's config).
3. Submit with `listen_type: "import"` (the type meant for history), at most a few hundred listens per request.

```python
import glob, json, time, urllib.request, zipfile
from datetime import datetime

TOKEN = "..."  # ListenBrainz user token
z = zipfile.ZipFile("my_spotify_data.zip")
plays = []
for name in sorted(n for n in z.namelist() if "Streaming_History_Audio" in n and n.endswith(".json")):
    for e in json.loads(z.read(name)):
        # skip podcasts/skips: count a play from 30 s, like Spotify and ListenBrainz do
        if not e.get("master_metadata_track_name") or (e.get("ms_played") or 0) < 30000:
            continue
        ts = int(datetime.fromisoformat(e["ts"].replace("Z", "+00:00")).timestamp())
        ai = {"music_service": "spotify.com", "submission_client": "spotify-history-import"}
        if (e.get("spotify_track_uri") or "").startswith("spotify:track:"):
            ai["spotify_id"] = "https://open.spotify.com/track/" + e["spotify_track_uri"].split(":")[-1]
        plays.append({"listened_at": ts, "track_metadata": {
            "artist_name": e["master_metadata_album_artist_name"], "track_name": e["master_metadata_track_name"],
            "release_name": e.get("master_metadata_album_album_name"), "additional_info": ai}})

for i in range(0, len(plays), 500):
    body = json.dumps({"listen_type": "import", "payload": plays[i:i + 500]}).encode()
    req = urllib.request.Request("https://api.listenbrainz.org/1/submit-listens", data=body, method="POST",
                                 headers={"Authorization": "Token " + TOKEN, "Content-Type": "application/json"})
    urllib.request.urlopen(req, timeout=120).read()
    print(f"{min(i + 500, len(plays))}/{len(plays)}")
    time.sleep(1)  # ListenBrainz rate-limits submissions per user
```

Notes:

- `ts` in the export is the time the play **ended**, in UTC; it is used as `listened_at` as is.
- Re-sending the same listens is safe in practice: ListenBrainz keeps one listen per user, timestamp and track.
- The profile listen count updates in the background (minutes); right after a big import the API can be slow,
  so a script that pages through `/1/user/<name>/listens` should use small pages (`count=100`) and retry.
- A distinctive `submission_client` lets your own tools recognise these listens later (e.g. so a sync that reads
  listens back from ListenBrainz does not count them twice).
- The listenbrainz.org web importer (Settings → Import) is the click-only alternative.

With my tools (see [mpd.md](../os/macos/mpd.md)): `musicdb import-spotify my_spotify_data.zip` (local play
counts), then `musicdb lb-import-spotify --dry-run` and `musicdb lb-import-spotify`.
