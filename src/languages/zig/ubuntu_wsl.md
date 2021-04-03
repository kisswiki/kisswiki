## Build failed on Windows 10

```bash
$ git clone https://github.com/purringChaos/searchwrap
$ cd searchwrap
$ searchwrap-win $ zig build
.\deps\zhp\src\app.zig:613:21: error: container 'std.os' has no member called 'Sigaction'
var act = os.Sigaction{
^
```

Looks like there should be some check for Linux before using `os.Sigaction`

```zig
    const is_linux = comptime std.Target.current.os.tag == .linux;
    if (is_linux) {
        const pid = std.os.linux.getpid();
        print("pid={}\n", .{pid});

        const actionSighup = std.os.Sigaction{
            .sigaction = handleSighupLinux,
            .mask = std.os.empty_sigset,
            .flags = 0,
        };

    }
```

https://github.com/jlauman/zig_examples/blob/ef439d2fe631580a4b78de032f96b28bf32158d8/96_os_signals/example.zig#L13

## There are tiers in zig

Linux and MacOS are tier 1, Windows is tier 2. https://ziglang.org/learn/overview/#wide-range-of-targets-supported

Zig works well in Ubuntu WSL. Haven't checked in WSL2.

https://docs.microsoft.com/en-us/windows/wsl/install-win10#manual-installation-steps

I needed to reboot machine.

```bash
$ mkdir -p ~/installed
$ cd ~/installed
# https://ziglang.org/download/
$ curl -OJN https://ziglang.org/builds/zig-linux-x86_64-0.8.0-dev.1712+2f07d76ee.tar.xz
$ tar xf zig-linux-x86_64-0.8.0-dev.1712+2f07d76ee.tar.xz
$ ln -sf zig zig-linux-x86_64-0.8.0-dev.1712+2f07d76ee
$ echo 'export PATH=$PATH:~/installed/zig' >> ~/.bashrc
$ . ~/.bashrc
$ uname
Linux
$ zig version
0.8.0-dev.1712+2f07d76ee
```

VSCode supports it quite well. https://code.visualstudio.com/docs/remote/wsl-tutorial

I needed to install zig vscode extension also for wsl remote to have syntax highlighting.
