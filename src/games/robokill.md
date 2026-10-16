- https://chromewebstore.google.com/detail/ruffle-flash-emulator/donbcfbmhbcapadipfkeojnmajbakjdc
- https://www.y8.com/search?utf8=%E2%9C%93&kind=game&q=robokill
- http://www.hackedonlinegames.com/game/794/robokill-2
- swf from this side redirected to another site when clicking play https://archive.org/download/armorgames

## Extract the SWF from the Windows .exe

- The Windows releases (`Robokill - Titan Prime v02 + Expansion Pack (ENG).exe`, `Robokill 2 - Leviathan Five v01 (ENG).exe`) are Adobe Flash Player projectors: the player .exe with the game SWF appended.
- Adobe/Macromedia Windows projector layout: `<player exe> <SWF> <u32 LE 0xFA123456> <u32 LE length of the stored SWF>`
  - on disk the magic reads `56 34 12 FA`; check it with `tail -c 8 game.exe | xxd`
  - the player stub size varies, so compute the offset: `filesize - 8 - length`
  - holds for Adobe/Macromedia Windows projectors only; third-party wrappers (Zinc, mProjector, SWF Studio) and Mac `.app` projectors store the movie differently, and a code signature added after the trailer breaks the "last 8 bytes" assumption
- Script (Python 3, stdlib only), `python3 extract_swf.py game.exe game.swf`:

```python
"""Extract the SWF appended to a Windows Flash Player projector (.exe).

Adobe/Macromedia projector layout (stub size varies):
  <player exe> <SWF> <u32 LE 0xFA123456> <u32 LE length of the stored SWF>
Third-party wrappers (Zinc, mProjector, SWF Studio) and Mac .app projectors
use other layouts; a signature appended after the trailer breaks this too.
"""
import struct, sys, zlib

def fail(msg):
    sys.exit(f'error: {msg}')

src, dst = sys.argv[1], sys.argv[2]
data = open(src, 'rb').read()
if len(data) < 16:
    fail('file too small')
magic, length = struct.unpack('<II', data[-8:])
if magic != 0xFA123456:
    fail(f'no projector trailer at end of file (got {magic:#010x})')
if not 8 <= length <= len(data) - 8:
    fail(f'trailer length {length} out of range')
swf = data[-8 - length:-8]
sig, version = swf[:3], swf[3]
file_len = struct.unpack('<I', swf[4:8])[0]  # uncompressed size
if sig == b'FWS':
    if file_len != len(swf):
        fail(f'FWS header says {file_len} bytes, got {len(swf)}')
elif sig == b'CWS':
    d = zlib.decompressobj()
    body = d.decompress(swf[8:])
    if not d.eof or d.unused_data or 8 + len(body) != file_len:
        fail('CWS stream does not match its header')
elif sig == b'ZWS':
    fail('ZWS (LZMA) not supported by this script')
else:
    fail(f'not a SWF signature: {sig!r}')
with open(dst, 'wb') as f:
    f.write(swf)
print(f'{dst}: {sig.decode()} version {version}, {len(swf)} bytes, '
      f'offset {len(data) - 8 - length}')
```

- Results (2026-10-16), both FWS (uncompressed), SWF version 9, ActionScript 3 (FileAttributes flag):
  - Titan Prime: offset 4180992, 9936865 bytes, 1030 tags
  - Leviathan Five: offset 4149248, 14991752 bytes, 2436 tags
- Validation: the SWF header length equals the extracted length, and walking the tag stream (RECORDHEADER, short and long form) reaches the End tag exactly at end of file.
- Without the script: `dd if=game.exe of=game.swf bs=1 skip=OFFSET count=LENGTH`, but nothing is validated.
- Run the SWF in Ruffle (Flash emulator, MIT/Apache-2.0): `brew install --cask ruffle`. Ruffle is an emulator; check important behaviour against the original projector (Windows VM). A SWF may also load other files at runtime (SWF, XML, MP3) from beside the .exe or over HTTP.
- Clean-room note: unpacking the container is not decompiling. If the goal is a clean-room reimplementation, stop at the container: do not decompile ActionScript (e.g. JPEXS FFDec script views) and do not list class/symbol names (SymbolClass, DoABC), strings or assets for whoever writes the new code.
