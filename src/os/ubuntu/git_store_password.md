## netrc

In `~/.netrc`

```
machine host
  password yourpassword
  login yourlogin
  protocol https
```

You may also encrypt `.netrc` https://stackoverflow.com/questions/5343068/is-there-a-way-to-skip-password-typing-when-using-https-on-github/18362082#18362082

## libsecret

Unfortunately it ask for creds again after some time.

```
sudo apt install libsecret-1-0 libsecret-1-dev
cd /usr/share/doc/git/contrib/credential/libsecret
sudo make
git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
```

- https://stackoverflow.com/questions/36585496/error-when-using-git-credential-helper-with-gnome-keyring-as-sudo/40312117#40312117
- https://stackoverflow.com/questions/5343068/is-there-a-way-to-skip-password-typing-when-using-https-on-github/32470658#32470658
- https://askubuntu.com/questions/740183/store-git-credentials-permanently-and-encrypted-using-a-keystore-in-ubuntu
