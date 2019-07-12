- Edit the `/etc/default/grub` and replace `GRUB_DEFAULT=0` with `GRUB_DEFAULT=saved`
- `sudo update-grub`

In case, your `grub.conf` contains multiple lines for Windows, following functions will take care only about lines starting by menuentry and picking just the first one, referring to Windows:

```bash
function winboot {
    WINDOWS_TITLE=`grep -i 'windows' /boot/grub/grub.cfg|cut -d"'" -f2`
    sudo grub-reboot "$WINDOWS_TITLE"
    sudo reboot
}
```

https://unix.stackexchange.com/questions/43196/how-can-i-tell-grub-i-want-to-reboot-into-windows-before-i-reboot/112284#112284

and Gnome extension https://extensions.gnome.org/extension/893/grub-reboot/


- https://askubuntu.com/questions/18170/how-to-reboot-into-windows-from-ubuntu
- https://www.reddit.com/r/programming/comments/c4d78e/winboot_a_shell_script_that_reboots_directly_into/
