```bash
sudo apt -y update
sudo apt -y install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev git
git clone https://github.com/fireice-uk/xmr-stak-cpu.git
cd xmr-stak-cpu
cmake .
make install
```

- https://www.cryptocurrencyfreak.com/2017/08/22/monero-mining-xmr-stak-cpu-ubuntu-16-04/
- https://github.com/fireice-uk/xmr-stak-cpu/blob/master/LINUXCOMPILE.md

## GLIBCXX_3.4.21 not defined in file libstdc++.so.6

To do a static build for a system without gcc 5.1+

```bash
cmake -DCMAKE_LINK_STATIC=ON .
make install
```

- https://stackoverflow.com/questions/36816570/glibcxx-3-4-21-not-defined-in-file-libstdc-so-6-with-link-time-reference
- https://askubuntu.com/questions/777803/apt-relocation-error-version-glibcxx-3-4-21-not-defined-in-file-libstdc-so-6
- https://packages.ubuntu.com/xenial-updates/amd64/libstdc++6/download
- https://superuser.com/questions/1174705/segmentation-fault-when-building-gcc
- https://stackoverflow.com/questions/5216399/usr-lib-libstdc-so-6-version-glibcxx-3-4-15-not-found
- https://askubuntu.com/questions/759320/glibcxx-3-4-21-not-defined-in-file-libstdc-so-6-with-link-time-reference/846078
- https://stackoverflow.com/questions/4032373/linking-against-an-old-version-of-libc-to-provide-greater-application-coverage
- https://stackoverflow.com/questions/32577224/unable-to-use-stdchrono-with-stdfuture-glibcxx-3-4-19-not-found?
