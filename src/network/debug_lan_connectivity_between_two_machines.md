Debugging "machine A cannot reach machine B on the LAN" when you can only type on one of them

Worked example: M1 MacBook (Wi-Fi) could not reach a Linux Mint MacBook Pro (Wi-Fi, live USB), Mint could reach the Mac. Cause in the end: see `os/macos/no_route_to_host_local_network_permission.md`. The method below is what found it.

## 1. Get a way in that does not depend on the broken path

Reverse SSH tunnel, started from the machine that can still reach the other one (Mint), kept alive in a loop:

```bash
# on Mint (needs sshd: sudo systemctl enable --now ssh)
while true; do ssh -N -o ServerAliveInterval=10 -o ExitOnForwardFailure=yes -R 2222:localhost:22 <user>@<mac-ip>; sleep 3; done
# on the Mac
ssh -p 2222 mint@localhost
```

- The tunnel dies whenever the Mac's IP or Wi-Fi association changes (toggling Private Wi-Fi address gives a new MAC, a new DHCP lease and a new IP). Re-run it with the new IP.
- `Connection refused` on `localhost:2222` = no tunnel; a banner timeout = tunnel listener exists but the far side is stuck.
- `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED` on `[localhost]:2222`: an old tunnel left a key. Compare the fingerprints (`ssh-keyscan -p 2222 localhost | ssh-keygen -lf -` against `ssh-keygen -lf /etc/ssh/ssh_host_ed25519_key.pub` on the target), then `ssh-keygen -R '[localhost]:2222'`.
- A temporary host route on the Mac gives direct SSH again while debugging: `sudo route add -host <ip> <gateway-ip>` (undo: `sudo route -n delete <ip>`).

## 2. Drive the remote shell non-interactively without leaking the password

Keep the password in a gitignored file (`~/.config/.env.<host>`, `chmod 600`) and use `expect` with echo off:

```tcl
log_user 0
set pw $env(MINT_PW)
spawn ssh -tt -p 2222 mint@localhost [lindex $argv 0]
expect {
  -re "assword.*:" { send "$pw\r"; exp_continue }
  -re "(.+)" { append out $expect_out(1,string); exp_continue }
  eof
}
puts $out
```

- Never put the password into the spawned command line (`echo pw | sudo -S ...`): `expect` echoes the whole `spawn` line to the output. That leaked it once. Let `sudo` prompt and answer the prompt instead.
- Delete capture logs only after reading them; removing a file that a background `expect` still writes loses the data.

## 3. Prove where packets die: capture on both ends at once

- Receiver: `sudo tcpdump -ni <wifi-if> -e -c 100 'arp or icmp'` through the tunnel (`-e` shows source/destination MACs, which tells direct frames from router-forwarded ones).
- Sender: `sudo tcpdump -ni en0 arp` in one pane, `ping` in the other.
- Send three kinds of traffic and compare: unicast, broadcast (`ping 192.168.1.255`, UDP to the broadcast address from a script) and multicast (`dns-sd -B _ssh._tcp`).
- Check counters (`ip -s link show <if>`, `/proc/net/dev`) before and after, but they are noisy on a live host.

## 4. Use a third device as a control

A phone with Termux (`ping <ip>`) reached the host directly while the Mac could not. That one fact ruled out the router, the Wi-Fi band and the target's driver, and moved the search to the Mac.

## 5. Things that looked like causes and were not

- `Power Management: on` on the Broadcom `wl` card (checked with `iwconfig`), AP/client isolation, stale static ARP entries, Private Wi-Fi address, `RX mcast: 0` (ARP is broadcast, not multicast, so that counter says nothing about it).
- Linux Mint's own repos (`mintsystem`, `mintdrivers`) contain no network tuning, only the choice of the `broadcom-sta-dkms` driver.

## 6. Know what the tools lie about

- On this macOS `arp -an` and `ifconfig` show MACs as `2:0:0:0:0:0` / `02:00:00:00:00:00`; do not conclude that an entry is bad.
- `ping` printing `sendto: No route to host` at the first packet is normal while ARP is unresolved, but if it persists although tcpdump shows the ARP reply, suspect the OS (Local Network permission), not the network.
