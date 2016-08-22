## Install

### Download ISO

As magicandre1981 said, download iso and run setup.exe

- file name: SW_DVD5_WIN_ENT_10_1607_64BIT_English_MLF_X21-07102.iso
- sha1 from [reddit][1]: f9ffea3a40bf39ccde105bb064e153343560d73e
- manget link: magnet:?xt=urn:btih:5FF1712FBD8EFE1BF911C77157841EAB3E01D988&dn=Microsoft%20Windows%2010%2010.0.14393%20Version%201607%20EN&tr=http%3a%2f%2ftorrents-club.org%2fbt%2fannounce.php%3fuk%3daGVYjdCbyI

Check sum of downloaded iso in powershell:

`Get-FileHash <filepath> -Algorithm SHA1`

To find out [what version of Windows][2] you have, run `winver`.

### Enable Developer Mode

1. `Settings > Update & Security > For Developers > Developer Mode`

    Note: Even after seeing error code [0x80004005][3], your machine is in developer mode.
2. `Control Panel > Programs > Turn Windows Features On or Off > Windows Subsystem for Linux (Beta)`

3. Restart windows
4. Run `bash`
5. Type `y` when asked to install ubuntu.

From:

- http://superuser.com/questions/1110580/how-to-install-windows-10-anniversary-update-on-windows-10-enterprise-edition
- http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/
- http://stackoverflow.com/questions/36352627/how-to-enable-bash-in-windows-10-developer-preview

### Other links

- https://tinkertry.com/download-windows-10-iso
- https://www.reddit.com/r/Piracy/comments/4vzon3/anyone_know_the_windows_10_anniversary_1607/
- https://www.reddit.com/r/Windows10/comments/4w7n05/windows_10_anniversary_edition_iso_checksums/
- https://www.reddit.com/r/Windows10/comments/4wcyz2/question_any_windows_10_iso_mirrors/


  [1]: https://www.reddit.com/r/Windows10/comments/4vm77u/looks_like_the_anniversary_update_isos_are/d5zjavx
  [2]: http://www.howtogeek.com/236195/how-to-find-out-which-build-and-version-of-windows-10-you-have/
  [3]: https://social.msdn.microsoft.com/Forums/en-US/a7e94e5b-db19-492f-a1c1-d5fa3aa87d0d/enabling-developer-mode-fails-with-error-code-0x80004005?forum=Win10SDKToolsIssues
