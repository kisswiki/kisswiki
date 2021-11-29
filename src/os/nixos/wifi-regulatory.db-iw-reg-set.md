- https://discourse.nixos.org/t/direct-firmware-load-for-regulatory-db-failed/16317
- https://unix.stackexchange.com/questions/253933/wifi-iw-reg-set-us-has-no-effect/351389#351389
  - https://unix.stackexchange.com/questions/385565/what-is-iwlwifis-lar-disable/385590#385590

```bash
$ iw reg get
global
country 00: DFS-UNSET
	(2402 - 2472 @ 40), (N/A, 20), (N/A)
	(2457 - 2482 @ 20), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
	(2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM, PASSIVE-SCAN
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW, PASSIVE-SCAN
	(5490 - 5730 @ 160), (N/A, 20), (0 ms), DFS, PASSIVE-SCAN
	(5735 - 5835 @ 80), (N/A, 20), (N/A), PASSIVE-SCAN
	(57240 - 63720 @ 2160), (N/A, 0), (N/A)

phy#0 (self-managed)
country EU: DFS-UNSET
	(2402 - 2437 @ 40), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-80MHZ, NO-160MHZ
	(2422 - 2462 @ 40), (6, 22), (N/A), AUTO-BW, NO-80MHZ, NO-160MHZ
	(2447 - 2482 @ 40), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS, NO-80MHZ, NO-160MHZ
	(5170 - 5190 @ 160), (6, 22), (N/A), NO-OUTDOOR, AUTO-BW, IR-CONCURRENT, NO-HT40MINUS, PASSIVE-SCAN
	(5190 - 5210 @ 160), (6, 22), (N/A), NO-OUTDOOR, AUTO-BW, IR-CONCURRENT, NO-HT40PLUS, PASSIVE-SCAN
	(5210 - 5230 @ 160), (6, 22), (N/A), NO-OUTDOOR, AUTO-BW, IR-CONCURRENT, NO-HT40MINUS, PASSIVE-SCAN
	(5230 - 5250 @ 160), (6, 22), (N/A), NO-OUTDOOR, AUTO-BW, IR-CONCURRENT, NO-HT40PLUS, PASSIVE-SCAN
	(5250 - 5270 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5270 - 5290 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5290 - 5310 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5310 - 5330 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5490 - 5510 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5510 - 5530 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5530 - 5550 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5550 - 5570 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5570 - 5590 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5590 - 5610 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5610 - 5630 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5630 - 5650 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5650 - 5670 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, NO-160MHZ, PASSIVE-SCAN
	(5670 - 5690 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, NO-160MHZ, PASSIVE-SCAN
	(5690 - 5710 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, NO-160MHZ, PASSIVE-SCAN
	(5710 - 5730 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, NO-160MHZ, PASSIVE-SCAN
	(5735 - 5755 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-160MHZ
	(5755 - 5775 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS, NO-160MHZ
	(5775 - 5795 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-160MHZ
	(5795 - 5815 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS, NO-160MHZ
	(5815 - 5835 @ 20), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-HT40PLUS, NO-80MHZ, NO-160MHZ

$ iw list | grep -A 15 Frequencies
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
$ iw reg get
global
country PL: DFS-ETSI
	(2400 - 2483 @ 40), (N/A, 20), (N/A)
	(5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
	(5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
	(5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
	(5725 - 5875 @ 80), (N/A, 13), (N/A)
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)

phy#0 (self-managed)
country EU: DFS-UNSET
	(2402 - 2437 @ 40), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-80MHZ, NO-160MHZ
	(2422 - 2462 @ 40), (6, 22), (N/A), AUTO-BW, NO-80MHZ, NO-160MHZ
	(2447 - 2482 @ 40), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS, NO-80MHZ, NO-160MHZ
	(5170 - 5190 @ 160), (6, 22), (N/A), NO-OUTDOOR, AUTO-BW, IR-CONCURRENT, NO-HT40MINUS, PASSIVE-SCAN
	(5190 - 5210 @ 160), (6, 22), (N/A), NO-OUTDOOR, AUTO-BW, IR-CONCURRENT, NO-HT40PLUS, PASSIVE-SCAN
	(5210 - 5230 @ 160), (6, 22), (N/A), NO-OUTDOOR, AUTO-BW, IR-CONCURRENT, NO-HT40MINUS, PASSIVE-SCAN
	(5230 - 5250 @ 160), (6, 22), (N/A), NO-OUTDOOR, AUTO-BW, IR-CONCURRENT, NO-HT40PLUS, PASSIVE-SCAN
	(5250 - 5270 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5270 - 5290 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5290 - 5310 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5310 - 5330 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5490 - 5510 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5510 - 5530 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5530 - 5550 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5550 - 5570 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5570 - 5590 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5590 - 5610 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5610 - 5630 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-SCAN
	(5630 - 5650 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SCAN
	(5650 - 5670 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, NO-160MHZ, PASSIVE-SCAN
	(5670 - 5690 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, NO-160MHZ, PASSIVE-SCAN
	(5690 - 5710 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, NO-160MHZ, PASSIVE-SCAN
	(5710 - 5730 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, NO-160MHZ, PASSIVE-SCAN
	(5735 - 5755 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-160MHZ
	(5755 - 5775 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS, NO-160MHZ
	(5775 - 5795 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-160MHZ
	(5795 - 5815 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS, NO-160MHZ
	(5815 - 5835 @ 20), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-HT40PLUS, NO-80MHZ, NO-160MHZ


[roman@msi-laptop:~]$ iw list | grep -A 15 Frequencies
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
```
