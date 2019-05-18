## Access files

This version of Ubuntu has the latest libimobiledevice (at the time of release) so it supports iOS 11.4. There is a propblem with the Gnome integration, though. It shows the Documents folder (app folders). In addition to the tip below by @diego, here's a simple way to get to the pictures folder (this works if the iOS Documents show up for you but not the pictures):

- Open the iDevices Documents folder in Nautilus.
- Press CTRL+L to get the real address which will look like `afc://YOURSERIAL:3/`
- Remove trailing colon and number and press ENTER (i.e. it should just read `afc://YOURSERIAL`)

You should now see your iDevices system folders, including DCIM.

- https://askubuntu.com/questions/928750/how-do-i-access-ios-camera-pictures-on-ubuntu/928751#928751
- https://wiki.archlinux.org/index.php/IOS
- https://www.quora.com/Is-there-a-way-to-manage-your-iOS-device-for-Linux
- `sudo systemctl restart usbmuxd` https://www.reddit.com/r/Ubuntu/comments/8mwcux/1804_anyone_else_having_trouble_with_mounting/
- https://askubuntu.com/questions/1044679/iphone-mounts-only-once-doesnt-show-pictures-documents-on-remount/1064835#1064835
  - https://ubuntuforums.org/showthread.php?t=2376741&p=13779062#post13779062
- with MEGA Sync http://www.darkartistry.com/2018/12/using-linux-with-iphone-the-easy-way/

### root

At this point you may mount the root filesystem if you have your phone jailbroken by doing the following line instead

`ifuse /media/iPhone/ --root`

- https://askubuntu.com/questions/812006/how-can-i-mount-my-iphone-6s-on-ubuntu-16-04/812379#812379
