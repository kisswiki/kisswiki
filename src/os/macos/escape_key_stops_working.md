# Escape key stops working in every app

On 2026-10-03 (macOS 27, Apple Silicon) Escape suddenly did nothing in any app:
Ghostty, Terminal.app, nvim, Claude Code, Chrome
(https://keypress.io/tester/escape). Every other key worked. Logging out fixes
the session; until then a Hammerspoon workaround forwards Escape to the app.

## What the diagnosis showed

- Karabiner-EventViewer shows `escape` down/up from the Karabiner virtual
  keyboard, with no modifiers.
- Listen-only `CGEventTap`s at `kCGHIDEventTap` and `kCGSessionEventTap` see
  keyDown/keyUp for keycode 53 (flags `0x100`) on every press. So the key
  reaches the window session and is swallowed after it, before any app.
- Not the cause:
  - Karabiner rules: Escape is disabled only in Emacs.
  - Ghostty: quitting it did not help, although its event tap was the only
    active filtering key tap.
  - AltTab and Hammerspoon (`hs.hotkey.assignable({}, "escape")` was `true`).
  - Gemini launcher and Siri AI: restarting them did not help.
  - Secure Input: `hs.eventtap.isSecureInputEnabled()` was `false`.
  - Services and symbolic hotkeys: only Cmd+Esc is bound.
- The cause was not found.

Listing event taps (who can see or swallow keys):

```swift
import CoreGraphics
var n: UInt32 = 0
CGGetEventTapList(0, nil, &n)
var taps = [CGEventTapInformation](repeating: CGEventTapInformation(), count: Int(n))
CGGetEventTapList(n, &taps, &n)
for t in taps where t.eventsOfInterest & ((1 << 10) | (1 << 11)) != 0 {
  print("pid=\(t.tappingProcess) enabled=\(t.enabled) listenOnly=\(t.options == .listenOnly)")
}
```

Run it with `swift taps.swift`, then `ps -o comm= -p <pid>`.

## Workaround: Hammerspoon forwards Escape to the app

Hammerspoon still receives plain Escape as a hotkey. Posting a new key event to
the frontmost app's process (`event:post(app)`) skips whatever swallows it. The
file is in my dotfiles, `~/.hammerspoon/esc-workaround.lua`, and `init.lua` does
not load it.

Load it while the bug is there (it lasts until Hammerspoon reloads or I log out):

```sh
hs -c 'dofile(os.getenv("HOME") .. "/.hammerspoon/esc-workaround.lua")'
```

Remove it:

```sh
hs -c 'escFix.hk:delete(); escFix = nil'
```

The core of it:

```lua
escFix = {}
local function send(down)
  local app = escFix.target or hs.application.frontmostApplication()
  escFix.hk:disable() -- so the posted event cannot re-trigger the hotkey
  hs.eventtap.event.newKeyEvent({}, "escape", down):post(app)
  escFix.hk:enable()
end
escFix.hk = hs.hotkey.new({}, "escape",
  function() escFix.target = hs.application.frontmostApplication(); send(true) end,
  function() send(false); escFix.target = nil end,
  function() send(true) end)
escFix.hk:enable()
```

Rejected: Karabiner mapping Escape and Caps Lock to F19 plus a Hammerspoon F19
binding. It would turn Cmd+Esc into Cmd+F19, take Caps Lock away, and stop
Escape from cancelling dead keys in the Polish layout.
