## Some text is small on Windows 10 when connected TV

Below solutions didn't work for me.

1. Open the app you want to fix.
2. Right-click the app in the taskbar.
3. Right-click the name of the app and select Properties.
4. Click on the Compatibility tab.
5. Under "Settings," click the Change high DPI settings button.
   Quick Tip: If you want to apply the settings for all accounts configured on your computer, click the Change settings for all users button, and then click the Change high DPI settings button.
6. Under "Program DPI," check the Use this setting to fix scaling problems for this program instead of the one in Settings option.
7. Using the available drop-down menu, specify whether an app should use the display DPI settings when you sign in to Windows 10 or when opening the app. (Usually, you want to use the default option.)
8. Click OK.
9. Click Apply.
10. Click OK.

It's worth noting that in step No. 5, you can also use the High DPI scaling override options to change the default scaling behavior for a program that is blurry from the very beginning.

- Application — Forces the app to run on a per-monitor DPI awareness.
- System — Stretches the interface, bitmap elements, and text will be blurry. This is how Windows handles scaling by default.

https://www.windowscentral.com/how-change-high-dpi-settings-classic-apps-windows-10-april-2018-update

I was able to adjust the Qbit UI scale using the program specific 'High DPI Scaling Override' properties settings vs changing the global windows dpi settings. Right mouse click on the qBittorrent application in c:\Progam Files\qBittorrent\ then go to the Compatibility tab.

Check the box for: 'Override high DPI scaling behavior.' 'Scaling performed by' : System (pulldown menu option)

https://www.reddit.com/r/qBittorrent/comments/jnou1z/why_is_my_text_so_tiny_how_can_i_fix_it/gb6zc64/

1. In Windows find the Qbittorrent exe
2. Click on the Compatibility tab
3. Select "Change the high DPI settings"
4. Tick "Use this setting to fix scaling problems..."
5. Under "Use the DPI that's set for my main display when" and select the "I open this program" option from the dropdown box
6. Lastly, under "High DPI scaling override" section, tick the override box and select "Application" in the "performed by" dropdown box.
7. Apply/OK your way back out

https://www.reddit.com/r/torrents/comments/dg5rpn/how_do_i_fix_qbittorrent_this_scaling_issue_on_my/
