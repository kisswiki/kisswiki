# Developer Tools: no first-run check of freshly built binaries

## The delay

The first start of a newly built executable waits while macOS assesses it (`syspolicyd`: Gatekeeper and the XProtect malware scan). Later starts of the same file are fast.

Measured 2026-11-03 on an Apple Silicon Mac:

- a tiny C program built with `cc`: first start about 200 ms, second about 12 ms
- a ~100 MB Lean binary (rr's viewer): first start 1.2 to 1.5 s, later about 25 ms

It hits anything that runs fresh builds often: test suites, a program that re-executes its own new build, `cargo run`, `zig build run`.

## The setting

System Settings → Privacy & Security → Developer Tools

- The pane appears once Xcode is installed, or after `spctl developer-mode enable-terminal`.
- Add the app the builds run from (for example Ghostty) and restart it. Programs it starts, and their children, are let run local software that does not meet the system's security policy, so they skip that assessment.

## Only the processes started from that app

macOS goes by the process's ancestors. A shell started by something else is not covered: under AgentDeck the tree is `zsh ← claude ← ad-holder ← launchd`, so adding Ghostty does not help AgentDeck's sessions and jobs; that would need `ad-holder` itself in the list, and its path (`~/.local/share/agentdeck/generations/...`) changes with each AgentDeck update.

## The cost

Everything started from a listed app skips Gatekeeper and XProtect, including a binary downloaded from the internet or `curl ... | sh`. Apps opened from Finder are unaffected.

## Check whether it works

Build a program with unique bytes and time its first and second start; with the exemption both are about the same:

```bash
d=$(mktemp -d); printf 'int main(void){return 0;} const char *x="%s";\n' "$(date +%s%N)" > "$d/p.c"
cc -o "$d/p" "$d/p.c"
ms() { perl -MTime::HiRes=time -e 'printf "%.0f", time*1000'; }
for k in first second; do a=$(ms); "$d/p"; b=$(ms); echo "$k start: $((b-a)) ms"; done
rm -rf "$d"
```
