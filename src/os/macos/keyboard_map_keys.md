## map right control to right option

With karabiner-EventViewer I read that the key is right control.

With this side https://hidutil-generator.netlify.app (via https://rakhesh.com/mac/using-hidutil-to-map-macos-keyboard-keys/) I have generated the file:

Copy the configuration below to /Library/LaunchDaemons/com.local.KeyRemapping.plist.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.local.KeyRemapping</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--matching</string>
        <string>{"ProductID":0xc534}</string>
        <string>--set</string>
        <string>{"UserKeyMapping":[
            {
              "HIDKeyboardModifierMappingSrc": 0x7000000E4,
              "HIDKeyboardModifierMappingDst": 0x7000000E6
            }
        ]}</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <false/>
</dict>
</plist>
```

```shell
% sudo chown root:wheel /Library/LaunchDaemons/com.local.KeyRemapping.plist
# 644 also worked
% sudo chmod 600 /Library/LaunchDaemons/com.local.KeyRemapping.plist
```

and reboot or

`sudo launchctl load -w -- /Library/LaunchDaemons/com.local.KeyRemapping.plist`

To live change:

```shell
% cat ~/hdutil-mapping.sh
hidutil property --matching '{"ProductID":0xc534}' --set '{"UserKeyMapping":[
    {
        "HIDKeyboardModifierMappingSrc": 0x7000000E4,
        "HIDKeyboardModifierMappingDst": 0x7000000E6
    }
]}'
```

- https://apple.stackexchange.com/questions/329085/tilde-and-plus-minus-±-in-wrong-place-on-keyboard/393989#393989
  - https://gist.github.com/heiner/ca5b66b673d5514e520ad8099a9c905e#file-hidutil-remapping-py
- I have used `--matching` as adviced here https://stackoverflow.com/questions/54392510/how-to-assign-a-key-remapping-to-specific-device-using-hidutil/58981641#58981641
- https://stackoverflow.com/questions/50634404/how-to-launch-a-daemon-using-launchtl#comment88280887_50634404
- https://stackoverflow.com/questions/28063598/error-while-executing-plist-file-path-had-bad-ownership-permissions/40597631
- Karabiner does alot more, as well as make the keyboard unrecognizable by logitech software (in my case) https://apple.stackexchange.com/questions/173898/repurposing-menu-button-on-windows-keyboards-used-in-os-x/398797#398797
- https://apple.stackexchange.com/questions/88897/how-do-you-make-the-fn-keyboard-button-work-like-a-ctrl-button
- https://apple.stackexchange.com/questions/415242/macos-use-fn-command-keyboard-shortcuts-work
- https://formulae.brew.sh/cask/key-codes
- https://www.reddit.com/r/logitech/comments/rwyxp4/logi_pop_keys_swap_ctrl_and_fn_key/
- https://www.reddit.com/r/logitech/comments/rkl8i3/fn_and_ctrl_keys_logitech_mx_keys_mini/