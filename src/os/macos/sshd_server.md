Privacy & Security > Full Disk Access

```shell
sudo systemsetup -setremotelogin on
```

or without giving full disk access

```shell
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
sudo launchctl list | grep ssh
```

check ip

```shell
ipconfig getifaddr $(route get default | awk '/interface: / {print $2}')
```
