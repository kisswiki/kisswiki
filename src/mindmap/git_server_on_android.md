- through usb

  - https://gelexgaray.github.io/blog/2017/01/10/personal-mobile-git-server/
  - https://wiki.termux.com/wiki/Remote_Access
  - copy public key to `~/.ssh/authorized_keys` on android Termux
  - start ssh server
    - `pkg install openssh git`
      - for troubleshooting view src/00other/termux/README.md
    - `sshd -D`
      - ```shell
        logcat -s 'syslog:*'
        pkill sshd
        sshd
        ```
        - https://gist.github.com/evandrocoan/f503188587587d7b1d1ba8746c9c6107
      - `sshd -d` is debug and allows only one connection and closes on disconnect
  - install adb on macos
    - `brew install android-platform-tools`
      - https://stackoverflow.com/questions/31374085/installing-adb-on-macos/32314718#32314718
  - `adb devices` shows "unauthorized"
    - set "USB computer connection" to "Camera (PTP)" https://stackoverflow.com/questions/23081263/adb-android-device-unauthorized/26665521#26665521
  - port forwarding
    - `adb forward tcp:8022 tcp:8022`
  - on android

    ```shell
    % sh localhost -p 8022
    % mkdir ~/shared/calibre-library
    % cd ~/shared/calibre-library
    calibre-library % git init
    # remote: error: By default, updating the current branch in a non-bare repository is denied
    calibre-library % git config receive.denyCurrentBranch ignore
    ```

    on host

    ```shell
    % git remote add android ssh://localhost:8022/~/storage/shared/.gitrepos/calibre
    % git push android
    ```

    on android

    ```shell
    calibre-library % git checkout # or restore?
    ```

    - https://stackoverflow.com/questions/10391522/git-does-not-appear-to-be-a-git-repository/70400751#70400751

  - Since Termux is a single-user system you may connect as any user - regardless of your specified username you will login as the only Termux user available https://gist.github.com/evandrocoan/f503188587587d7b1d1ba8746c9c6107
