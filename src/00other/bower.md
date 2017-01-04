## init fails in git bash

run in `cmd.exe` or `cmd.exe /C "C:\Program Files\Git\bin\bash.exe" --login -i`

- https://github.com/bower/bower/issues/802#issuecomment-170383131
- http://stackoverflow.com/questions/38683378/bower-init-command-error-gitbash-in-windows
- http://stackoverflow.com/questions/33060727/bower-init-register-requires-an-interactive-shell-error

## reinstall

>bower install --force re-installs all installed components. It also forces installation even when there are non-bower directories with the same name in the components directory. Adding --force also bypasses the cache, and writes to the cache anyway.
>
>-- https://bower.io/docs/api/
