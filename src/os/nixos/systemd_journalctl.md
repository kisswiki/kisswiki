```bash
$ journalctl -g firmware*
-- Journal begins at Tue 2021-11-09 20:09:36 CET, ends at Mon 2021-11-29 11:24:10 CET. --
lis 09 20:09:36 nixos kernel: platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
```

```bash
$ iw list | grep -A 15 Frequencies:
		Frequencies:
			* 2412 MHz [1] (22.0 dBm)
			* 2417 MHz [2] (22.0 dBm)
			* 2422 MHz [3] (22.0 dBm)
			* 2427 MHz [4] (22.0 dBm)
			* 2432 MHz [5] (22.0 dBm)
			* 2437 MHz [6] (22.0 dBm)
			* 2442 MHz [7] (22.0 dBm)
			* 2447 MHz [8] (22.0 dBm)
			* 2452 MHz [9] (22.0 dBm)
			* 2457 MHz [10] (22.0 dBm)
			* 2462 MHz [11] (22.0 dBm)
			* 2467 MHz [12] (22.0 dBm)
			* 2472 MHz [13] (22.0 dBm)
			* 2484 MHz [14] (disabled)
	Band 2:
--
		Frequencies:
			* 5180 MHz [36] (22.0 dBm) (no IR)
			* 5200 MHz [40] (22.0 dBm) (no IR)
			* 5220 MHz [44] (22.0 dBm) (no IR)
			* 5240 MHz [48] (22.0 dBm) (no IR)
			* 5260 MHz [52] (22.0 dBm) (no IR, radar detection)
			* 5280 MHz [56] (22.0 dBm) (no IR, radar detection)
			* 5300 MHz [60] (22.0 dBm) (no IR, radar detection)
			* 5320 MHz [64] (22.0 dBm) (no IR, radar detection)
			* 5340 MHz [68] (disabled)
			* 5360 MHz [72] (disabled)
			* 5380 MHz [76] (disabled)
			* 5400 MHz [80] (disabled)
			* 5420 MHz [84] (disabled)
			* 5440 MHz [88] (disabled)
			* 5460 MHz [92] (disabled)
```

```bash
$ sudo journalctl -b 0 -p 3
-- Journal begins at Tue 2021-11-09 20:09:36 CET, ends at Mon 2021-11-29 11:25:05 CET. --
lis 29 09:48:40 msi-laptop systemd[1]: plymouth-quit.service: Service has no ExecStart=, ExecStop=, or SuccessAction=. Refusing.
lis 29 09:48:40 msi-laptop kernel: nouveau 0000:01:00.0: unknown chipset (b76000a1)
lis 29 09:48:41 msi-laptop avahi-daemon[893]: Failed to read /etc/avahi/services.
lis 29 09:48:42 msi-laptop bluetoothd[894]: profiles/sap/server.c:sap_server_register() Sap driver initialization failed.
lis 29 09:48:42 msi-laptop bluetoothd[894]: sap-server: Operation not permitted (1)
lis 29 09:48:43 msi-laptop pulseaudio[1226]: module-rescue-stream is obsolete and should no longer be loaded. Please remove it from your configuration.
lis 29 09:48:44 msi-laptop kernel: psmouse serio1: synaptics: Unable to query device: -71
lis 29 09:48:46 msi-laptop gdm-password][1438]: gkr-pam: unable to locate daemon control file
lis 29 09:48:46 msi-laptop systemd[1454]: setxbkmap.service: Failed at step EXEC spawning /usr/bin/setxkbmap: No such file or directory
lis 29 09:48:46 msi-laptop systemd[1446]: Failed to start Apply my xkbmap settings.
lis 29 09:48:48 msi-laptop dhcpcd[898]: dhcp6_openudp: Address already in use
lis 29 09:48:48 msi-laptop dhcpcd[898]: dhcp6_start1: Address already in use
lis 29 09:48:49 msi-laptop avahi-daemon[893]: Failed to read /etc/avahi/services.
lis 29 09:48:53 msi-laptop avahi-daemon[893]: Failed to read /etc/avahi/services.
lis 29 09:49:10 msi-laptop gdm-password][1852]: gkr-pam: unable to locate daemon control file
lis 29 09:50:24 msi-laptop bluetoothd[894]: src/profile.c:ext_start_servers() RFCOMM server failed for Headset unit: rfcomm_bind: Address already in use (9>
lis 29 09:50:24 msi-laptop pipewire[2708]: jack-device 0x55f072a7c8a8: can't open client: Connection refused
lis 29 10:13:24 msi-laptop avahi-daemon[893]: Failed to read /etc/avahi/services.
lis 29 10:13:27 msi-laptop dhcpcd[1662]: dhcp6_openudp: Address already in use
lis 29 10:13:27 msi-laptop dhcpcd[1662]: dhcp6_start1: Address already in use
lis 29 10:13:32 msi-laptop avahi-daemon[893]: Failed to read /etc/avahi/services.
lis 29 10:22:12 msi-laptop systemd[1]: plymouth-quit.service: Service has no ExecStart=, ExecStop=, or SuccessAction=. Refusing.
lis 29 10:39:31 msi-laptop systemd[1]: plymouth-quit.service: Service has no ExecStart=, ExecStop=, or SuccessAction=. Refusing.
lis 29 10:39:32 msi-laptop nixos[17675]: switching to system configuration /nix/store/c7gbzpcl22i9djzlh2bcp6wi010kndgd-nixos-system-msi-laptop-21.05.4384.4>
lis 29 10:42:07 msi-laptop systemd[1]: plymouth-quit.service: Service has no ExecStart=, ExecStop=, or SuccessAction=. Refusing.
lis 29 10:42:08 msi-laptop nixos[18252]: switching to system configuration /nix/store/iywbwd8s0fm8iaxylzp7f6d8q8n274a3-nixos-system-msi-laptop-21.05.4384.4>
lis 29 10:44:23 msi-laptop systemd[1]: plymouth-quit.service: Service has no ExecStart=, ExecStop=, or SuccessAction=. Refusing.
lis 29 10:44:23 msi-laptop nixos[19175]: switching to system configuration /nix/store/s5g2kycyj5rlv4dbigc056ird87ynjnb-nixos-system-msi-laptop-21.05.4384.4>
lis 29 10:45:03 msi-laptop systemd[1]: plymouth-quit.service: Service has no ExecStart=, ExecStop=, or SuccessAction=. Refusing.
lis 29 10:45:32 msi-laptop systemd[1]: plymouth-quit.service: Service has no ExecStart=, ExecStop=, or SuccessAction=. Refusing
```
