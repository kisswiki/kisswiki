## map right control to right option

With karabiner-EventViewer I read that the key is right control.

With this side https://hidutil-generator.netlify.app (via https://rakhesh.com/mac/using-hidutil-to-map-macos-keyboard-keys/) I have generated the file:

Copy the configuration below to ~/Library/LaunchAgents/com.local.KeyRemapping.plist

```
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
</dict>
</plist>
```

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

I have used `--matching` as adviced here https://stackoverflow.com/questions/54392510/how-to-assign-a-key-remapping-to-specific-device-using-hidutil/58981641#58981641

- Karabiner does alot more, as well as make the keyboard unrecognizable by logitech software (in my case) https://apple.stackexchange.com/questions/173898/repurposing-menu-button-on-windows-keyboards-used-in-os-x/398797#398797
- https://apple.stackexchange.com/questions/88897/how-do-you-make-the-fn-keyboard-button-work-like-a-ctrl-button
- https://apple.stackexchange.com/questions/415242/macos-use-fn-command-keyboard-shortcuts-work
- https://formulae.brew.sh/cask/key-codes
- https://www.reddit.com/r/logitech/comments/rwyxp4/logi_pop_keys_swap_ctrl_and_fn_key/
- https://www.reddit.com/r/logitech/comments/rkl8i3/fn_and_ctrl_keys_logitech_mx_keys_mini/
