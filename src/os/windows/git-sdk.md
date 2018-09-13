Because there are [problems with paths with node.js in msys2](https://github.com/observing/pre-commit/issues/102#issuecomment-418514346), I am using git-sdk.

But packages in git-sdk are older than in msys2. For example emacs 25 vs 26.

## Problems with pinning to taskbar

If you pin `C:\git-sdk-64\git-bash.exe` to Windows taskbar, clicking icon will put another icon on Windows taskbar. And when you pin this new icon, git bash run with will not have pacman etc.

If you see `Welcome to the Git for Windows SDK!`, then you are in sdk mode.
