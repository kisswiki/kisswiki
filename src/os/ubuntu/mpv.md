## lua support

### Update: 2019-01-02

When doing update after adding this repository:

```bash
$ sudo add-apt-repository ppa:mc3man/mpv-tests
...
$ sudo apt update
...
Err:8 http://ppa.launchpad.net/mc3man/mpv-tests/ubuntu cosmic Release                                                                                  
  404  Not Found [IP: 91.189.95.83 80]
Hit:9 http://security.ubuntu.com/ubuntu cosmic-security InRelease        
Reading package lists... Done                      
E: The repository 'http://ppa.launchpad.net/mc3man/mpv-tests/ubuntu cosmic Release' does not have a Release file.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

So removing:

```bash
$ sudo add-apt-repository -r ppa:mc3man/mpv-tests
$ sudo apt update
```

And using this https://launchpad.net/ubuntu/cosmic/+package/mpv.

0.29 in official repo, 0.29.1 in mc3man repo.


### Old

The Ubuntu repository version of MPV is not very good. It's old and lacks features such as on-screen display.

I use the latest version and it works perfectly. Install it like this:

```
sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install mpv
```

- https://forums.linuxmint.com/viewtopic.php?t=213944
- https://launchpad.net/~mc3man/+archive/ubuntu/mpv-tests
