`ping`, `ssh`, `nc` to a LAN host fail with `No route to host` from Ghostty, while the host is fine

Fix: `System Settings > Privacy & Security > Local Network` > enable the terminal app (Ghostty). Works at once (checked on macOS 27, 2026-10-01). If it is already on, toggle it off and on and restart the terminal.

Symptoms:

- `ping: sendto: No route to host` for hosts on the same subnet; the router (`192.168.1.1`) still answers.
- `tcpdump -ni en0 arp` shows the ARP request and the reply, so the wire is fine, but macOS never uses the reply.
- Another device (Android, Termux) reaches the same host directly.
- The workaround `sudo route add -host <ip> <gateway-ip>` works, because traffic via the gateway is not treated as local.

What it was not (hours lost on these):

- Router client/AP isolation, Wi-Fi power save, the Broadcom `wl` driver on the target, Private Wi-Fi address (turning it off also changes the Mac's MAC and DHCP lease, so the IP changes and reverse tunnels break).
- A bad static ARP entry: `arp -an` and `ifconfig` show MACs redacted as `2:0:0:0:0:0` / `02:00:00:00:00:00` on this macOS, so that output cannot be trusted.

Debug order for "No route to host" on the LAN:

1. Local Network permission for the terminal app.
2. Same ping from the system Terminal.app or another device, to tell a host problem from a Mac problem.
3. Only then `tcpdump` on both ends.

`/usr/bin/log` is needed in zsh, because `log` is a shell builtin there.
