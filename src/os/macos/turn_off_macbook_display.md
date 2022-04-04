`sudo pmset -a lidwake 0`

The -a, -b, -c, -u flags determine whether the settings apply to battery ( -b ), charger (wall power) ( -c ), UPS ( -u ) or all ( -a ).

To reverse the command, set the 0 to a 1. These settings are persistent, in that, they do not need to be re-applied every time the machine's power is cycled and are saved to the file: `/Library/Preferences/SystemConfiguration/com.apple.PowerManagement.plist`

https://apple.stackexchange.com/questions/21729/how-do-i-turn-off-macbook-display-when-i-have-an-external-display/24979#24979
