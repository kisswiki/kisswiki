`C-h v` and then `user-init-file RET` to get current config file location.

## Windows

On Windows 10 if you want Emacs to read config from `%USERPROFILE%` you need to set user env `HOME` pointing `%USERPROFILE%`. Otherwise Emacs searches for config in `~/AppData/Roaming/`.

https://emacs.stackexchange.com/questions/60127/how-can-i-find-my-emacs-init-file/60194#60194
