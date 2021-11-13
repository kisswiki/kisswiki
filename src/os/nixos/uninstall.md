```bash
[roman@nixos:~]$ nix-env --uninstall nixos.mongodb

[roman@nixos:~]$ readlink -f $(which mongo)
/nix/store/hq170ayrs7ym8aq47pv049vxlkfarsp6-mongodb-3.4.24/bin/mongo

[roman@nixos:~]$ mongo
MongoDB shell version v3.4.24
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.4.24
Server has startup warnings: 
2021-11-11T08:41:36.700+0100 I STORAGE  [initandlisten] 
2021-11-11T08:41:36.700+0100 I STORAGE  [initandlisten] ** WARNING: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine
2021-11-11T08:41:36.700+0100 I STORAGE  [initandlisten] **          See http://dochub.mongodb.org/core/prodnotes-filesystem
2021-11-11T08:41:36.951+0100 I CONTROL  [initandlisten] 
2021-11-11T08:41:36.951+0100 I CONTROL  [initandlisten] ** WARNING: Access control is not enabled for the database.
2021-11-11T08:41:36.951+0100 I CONTROL  [initandlisten] **          Read and write access to data and configuration is unrestricted.
2021-11-11T08:41:36.951+0100 I CONTROL  [initandlisten] 
> 
> q^C
bye

[roman@nixos:~]$ journalctl -f
-- Journal begins at Tue 2021-11-09 20:09:36 CET. --
Nov 13 13:11:53 nixos systemd[1400]: Started VTE child process 109101 launched by gnome-terminal-server process 95513.
Nov 13 13:11:57 nixos wpa_supplicant[1091]: wlo1: CTRL-EVENT-SIGNAL-CHANGE above=0 signal=-73 noise=9999 txrate=54000
Nov 13 13:13:30 nixos wpa_supplicant[1091]: wlo1: WPA: Group rekeying completed with 4c:5e:0c:b5:64:6b [GTK=TKIP]
Nov 13 13:14:06 nixos wpa_supplicant[1091]: wlo1: CTRL-EVENT-SIGNAL-CHANGE above=1 signal=-70 noise=9999 txrate=54000
Nov 13 13:15:35 nixos nix-daemon[6240]: accepted connection from pid 109457, user roman
Nov 13 13:16:03 nixos nix-daemon[6240]: accepted connection from pid 109529, user roman
Nov 13 13:16:08 nixos nix-daemon[6240]: accepted connection from pid 109546, user roman
Nov 13 13:16:20 nixos mongod.27017[1088]: 2021-11-13T13:16:20.693+0100 I NETWORK  [thread1] connection accepted from 127.0.0.1:34700 #305 (1 connection now open)
Nov 13 13:16:20 nixos mongod.27017[1088]: 2021-11-13T13:16:20.693+0100 I NETWORK  [conn305] received client metadata from 127.0.0.1:34700 conn305: { application: { name: "MongoDB Shell" }, driver: { name: "MongoDB Internal Client", version: "3.4.24" }, os: { type: "Linux", name: "NAME=NixOS", architecture: "x86_64", version: "Kernel 5.10.77" } }
Nov 13 13:16:23 nixos mongod.27017[1088]: 2021-11-13T13:16:23.755+0100 I -        [conn305] end connection 127.0.0.1:34700 (1 connection now open)
q^C

[roman@nixos:~]$ s^Cx-env -e nixos.mongodb

[roman@nixos:~]$ nix-env -q mongodb
mongodb-3.4.24

[roman@nixos:~]$ sudo nix-env -q mongodb
[sudo] password for roman: 
mongodb-3.4.24

[roman@nixos:~]$ sudo nix-env -e mongodb
uninstalling 'mongodb-3.4.24'
building '/nix/store/4wn6p44asl83zpchalyjb3jj3diz5d2y-user-environment.drv'...
created 983 symlinks in user environment

[roman@nixos:~]$ which mongo
/home/roman/.nix-profile/bin/mongo

[roman@nixos:~]$ readlink -f $(which mongo)
/nix/store/hq170ayrs7ym8aq47pv049vxlkfarsp6-mongodb-3.4.24/bin/mongo

[roman@nixos:~]$ sudo nix-env -q mongodb
error: selector 'mongodb' matches no derivations

[roman@nixos:~]$ nix-env -q mongodb
mongodb-3.4.24

[roman@nixos:~]$ nix-env -e mongodb
uninstalling 'mongodb-3.4.24'

[roman@nixos:~]$ readlink -f $(which mongo)
/nix/store/hq170ayrs7ym8aq47pv049vxlkfarsp6-mongodb-3.4.24/bin/mongo
```

https://nixos.org/manual/nix/unstable/package-management/garbage-collection.html


```bash
[roman@nixos:~]$ nix-env --delete-generations old
removing generation 1
removing generation 2
removing generation 3
removing generation 4
removing generation 5
removing generation 6
removing generation 7
removing generation 8
removing generation 9
removing generation 10
removing generation 11

[roman@nixos:~]$ readlink -f $(which mongo)
/nix/store/hq170ayrs7ym8aq47pv049vxlkfarsp6-mongodb-3.4.24/bin/mongo

[roman@nixos:~]$ sudo readlink -f $(which mongo)
[sudo] password for roman: 
/nix/store/hq170ayrs7ym8aq47pv049vxlkfarsp6-mongodb-3.4.24/bin/mongo

[roman@nixos:~]$ sudo nix-env --delete-generations old
removing generation 1
removing generation 2
removing generation 3
removing generation 4
removing generation 5
removing generation 6
removing generation 7
removing generation 8
removing generation 9
removing generation 10
removing generation 11
removing generation 12
removing generation 13
removing generation 14
removing generation 15
removing generation 16
removing generation 17

[roman@nixos:~]$ readlink -f $(which mongo)
/nix/store/hq170ayrs7ym8aq47pv049vxlkfarsp6-mongodb-3.4.24/bin/mongo

[roman@nixos:~]$ nix-store --gc
finding garbage collector roots...
removing stale link from '/nix/var/nix/gcroots/auto/cizpiash3pa4i7lk5cagx0ds59p0llkm' to '/tmp/nix-build-17011-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/10v47d1ri3ck29a51fr7b3d1vba6anj5' to '/tmp/nixos-rebuild.1HpUKb/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/jy4fs81j3hgmivizqmxky3dh1gmgxycd' to '/tmp/nix-build-5685-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/cm4i5b0rr15fnmi958zimfskcsl2xyzv' to '/tmp/nix-build-10531-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/y4xb91df8ypy4z3l4i3d7vyn41dsjpvl' to '/tmp/nixos-rebuild.txrATu/nix'
removing stale link from '/nix/var/nix/gcroots/auto/icfnadh864fm58yn9x1qc00ahf0rmaq3' to '/tmp/nix-build-10462-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/cn59bdkd5gvxk1md6x2q36hvwk858a6p' to '/tmp/nixos-rebuild.Ti4bKb/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/29v70dn53fz23z8m45jmnqlyykak4y73' to '/tmp/nixos-rebuild.IkM6Ew/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/bqkkmqizlfndmin2vnr6nak27p2rgrfs' to '/tmp/nixos-rebuild.lQ57qW/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/vkdw1mg6mv33fnvi11h6i6iq3j6rwf2w' to '/mnt/tmp.j6I52f5A2f/system'
removing stale link from '/nix/var/nix/gcroots/auto/vhdg6651p38nlhb2jnhz3rh08s3715by' to '/tmp/nix-build-18807-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/iyjvqj4icf7y0fjlqwszvjkpq0bylfpz' to '/tmp/nix-build-5616-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/hfhrvb6d3kvkx0n6yl0y81jxapw4m77s' to '/tmp/nixos-rebuild.Smpc0S/nix'
removing stale link from '/nix/var/nix/gcroots/auto/wsbb1dj78qvlai42pk4m76fsr4c401yk' to '/tmp/nix-build-9448-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/n5rviv4srn4xll2zj0m7qmgy8p10rg12' to '/tmp/nix-build-3417-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/hrbd6svphvj6vv55xqm30d3kg17lnvv2' to '/mnt/tmp.8FxIUHbKcu/system'
removing stale link from '/nix/var/nix/gcroots/auto/750m1p1x29c5m0ip43jmwlyjhl9nk2qq' to '/tmp/nixos-rebuild.Ti4bKb/nix'
removing stale link from '/nix/var/nix/gcroots/auto/avs78l8qw2nhzgv0m0s9rk6i5krls1zs' to '/tmp/nix-build-18876-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/fzah8xplggk6zdh1vpz64azsidc3y6pz' to '/tmp/nixos-rebuild.mXpn9H/nix'
removing stale link from '/nix/var/nix/gcroots/auto/3s3np2hsfh10iw7kfd0d8ccfaschhnrq' to '/tmp/nix-build-2249-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/a4f986cklw88hzx71b4gl6lig8x4y92m' to '/tmp/nix-build-9526-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/714963gvw22qii1sy74s11njc67ziyac' to '/tmp/nixos-rebuild.yJtrqM/nix'
removing stale link from '/nix/var/nix/gcroots/auto/x5p5b27pf9xbd46gb2g1jpd85hhsybpd' to '/tmp/nixos-rebuild.Smpc0S/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/8yjzk913nbbzmxs95c0fzachvknnv7l5' to '/tmp/nix-build-4040-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/mabdrmm9m3xn616wbwm08jxhgv2g3c39' to '/tmp/nixos-rebuild.7Patc1/nix'
removing stale link from '/nix/var/nix/gcroots/auto/s0r8606gdasg9683q3wfdggcm9h4y21x' to '/tmp/nix-build-2374-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/zsskawaibb498vm3j7wykrsc1l85iir6' to '/tmp/nixos-rebuild.IkM6Ew/nix'
removing stale link from '/nix/var/nix/gcroots/auto/0vlgxw7mwkm581c9kd3s57g4aqyj2h18' to '/tmp/nix-build-2305-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/8cz5vscycy7yqpgd1zrjx6fcd31zq7p0' to '/tmp/nixos-rebuild.LF4UYt/nix'
removing stale link from '/nix/var/nix/gcroots/auto/7vj243np132sqfr7di1l6rninbdydwpp' to '/tmp/nixos-rebuild.1HpUKb/nix'
removing stale link from '/nix/var/nix/gcroots/auto/yd7d855xr5pp9fsdk354b2p4q6k1nzsk' to '/tmp/nix-build-2318-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/zy6dyhkb9zphyjcjhicllp31asrnla32' to '/tmp/nix-build-6854-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/8mlxh6mx02ajnhbys7ykypzc9kmiywvj' to '/tmp/nix-build-4688-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/bvfhdsiy8hrpl4lgfvm7i99jlh005m5b' to '/tmp/nixos-rebuild.ssgiYC/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/6l64rhn1zq9fp6wslbkqm5908vqiwgjc' to '/tmp/nixos-rebuild.NnA75X/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/585fk28kraxhy4zlv7z80d4n7mqal4n2' to '/tmp/nix-build-3457-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/bl1hp5mm65afczanpcsljp38jqaghzfc' to '/tmp/nixos-rebuild.7Patc1/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/rx81yscrkwyd67ms76nidcc8pv18k657' to '/run/user/1000/nix-build-4905-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/8y496q1v57gwf6f14ydqza85yfn84k04' to '/tmp/nixos-rebuild.ssgiYC/nix'
removing stale link from '/nix/var/nix/gcroots/auto/2xz6i1rvgr84p0dmsbbp3ymlgxhrhmgk' to '/tmp/nix-build-17080-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/5mhn6i8817g7hpsjl1hhklvvf0279gml' to '/tmp/nix-build-4839-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/rqnxpk8327fwlwh50q63nkpwffwbgnb0' to '/tmp/nixos-rebuild.NnA75X/nix'
removing stale link from '/nix/var/nix/gcroots/auto/8jfm6bjjjz61wz5jc4bxi0k3hq2snjcm' to '/tmp/nix-build-3483-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/65rmwpflq8lyav5466pfh0azq6wrc10b' to '/tmp/nix-build-4006-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/0wn9yyrjrys82fgdmqw08fz822xbfggp' to '/tmp/nix-build-6925-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/i36vqnn7yk0l2i3fqnjikvcs3294ri3q' to '/tmp/nixos-rebuild.mXpn9H/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/bh16wj3pn6faxpnzzgiiqbs53vx9g739' to '/tmp/nixos-rebuild.LF4UYt/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/jmhql5xi9jg3a47a91cgmh080vz5jkmd' to '/tmp/nixos-rebuild.lQ57qW/nix'
removing stale link from '/nix/var/nix/gcroots/auto/nr0411jyqdv5ngp4dd5iqxnr9ghvdkij' to '/tmp/nixos-rebuild.yJtrqM/nix.drv'
removing stale link from '/nix/var/nix/gcroots/auto/cfx2d8q457zi0yy842cpv3xa8d33mdf4' to '/tmp/nix-build-4023-0/result'
removing stale link from '/nix/var/nix/gcroots/auto/hbvbqvl033h6wbqg7xssd3q5kk673zsi' to '/tmp/nixos-rebuild.txrATu/nix.drv'
deleting garbage...
deleting '/nix/store/dspj7ai9f9bhxxkv54jm43hqvm2kycgf-diagnostics-sandbox.lock'
deleting '/nix/store/zdqz6vymwzjhq6xqlnls6251qji39v1w-diagnostics-sandbox.lock'
deleting '/nix/store/zndnib0q744ilihq1zcj0kbgvr2mnrsf-libsecret-0.20.4-dev'
deleting '/nix/store/60g8g1mzp2vbg67451xbf2rs8zzl98al-user-environment.drv'
deleting '/nix/store/yfyc5v8c1byalbqi6khwxys9ixs57b1m-user-environment'
deleting '/nix/store/b9zq77xq3wz18v462p43vmbp95w4al5j-env-manifest.nix'
deleting '/nix/store/gh6cv56j577i69x9fc52nzsv594z71nq-diagnostics-multiuser.drv'
deleting '/nix/store/6g0vhg91mllbgqd3z9j8pwjaflnmp7kx-VSCode_1.62.0_linux-x64.tar.gz'
deleting '/nix/store/4a2z2yxfhqp231l4ms67irbp36cjrpad-gnome-tweaks-40.0.drv'
deleting '/nix/store/w3xsdmrb466y2smllnygys5vwgrqxmvy-calibre-5.17.0.drv'
deleting '/nix/store/39hqgi2710krjc1g1pjdypc2zax7i80p-hyphen-2.8.8.drv'
deleting '/nix/store/aasq3axr2byzhcqgkk638kd4iyz82vsp-user-environment'
deleting '/nix/store/q4981kpzw2srg4wm9xmk5inshn8cl2ap-user-environment.drv'
deleting '/nix/store/8g93rn9ar9kjw06iy0g16pwmz3pjazfv-env-manifest.nix'
deleting '/nix/store/2a7r4xsnyzpxfccrvrlv9gm4rm6ry4nn-user-environment.drv'
deleting '/nix/store/w0n5m5sa7v8jj3jbi013i3v59ky873y7-env.drv'
deleting '/nix/store/54bbi5i6di2cz5jgpj03idgg4bjvs5xj-user-environment.drv'
deleting '/nix/store/k06zfh80xfgnfmwll501s6n8rvxidjdq-efibootmgr-17.drv'
deleting '/nix/store/ni0bxqykkbhx6ss05sfv64bm0yya0nqd-efivar-37.drv'
deleting '/nix/store/fxz7ss1dsivmyxd9si68hrqypi4s4af9-fix-misaligned-pointer.patch.drv'
deleting '/nix/store/niasxk6lb4szsr21a8j62qfhlba0bk28-stage-1-init.sh'
deleting '/nix/store/xinq0w2fpgi1azq5mbhkfgim35avhz9n-link-units'
deleting '/nix/store/2k7qfn7vyszq4v4c1s985kjbx3lbsyb6-hook.drv'
deleting '/nix/store/3fi5ii7c9zr9g7x0p5ys14n41f50dkxm-wrap-qt-apps-hook.sh'
deleting '/nix/store/nd32gpz0hrximx4493a7lxclnb3llbk7-remove-extra-decl.patch.drv'
deleting '/nix/store/rxb3dwnvlhnk86na5yw3ffr8cnbcq13q-texinfo-6.7'
deleting '/nix/store/hqz0rfbpsf4zga8a2sblrbc5wvcgnpwy-glew-2.2.0-dev'
deleting '/nix/store/dyqj7vxnwmi0i64gv9pdjj3nwf2vs95b-glu-9.0.1-dev'
deleting '/nix/store/nlbdxp1wc7qdwjx6l3rah4va7lpb4pkn-systemd-247.6-dev'
deleting '/nix/store/1fdyxjsh9fsyiyv77giq21b9h5232hph-stdenv-linux'
deleting '/nix/store/3k69hbxg04sdxlgi1236ddggs346sxf3-stdenv-linux'
deleting '/nix/store/xfc0ffwz6s87mnz9x2k2qj6ykwxgwjxk-patchelf-0.12'
deleting '/nix/store/mwxnfrnk15rf1pb3mirdg4mnl6ik4apv-user-environment'
deleting '/nix/store/pypzpqiq2c4c6lbv4bqjzq7yydr6mqir-user-environment.drv'
deleting '/nix/store/ba8w6pv3z32yp5znsxvjzk315kiy3bin-env.drv'
deleting '/nix/store/myh2inr7xghpyfh1hibdrscpns2zq3d8-user-environment.drv'
deleting '/nix/store/30a3jnx6zkjj508j3n7x18fp7yp97ayd-user-environment.drv'
deleting '/nix/store/ajc20gh8rfjk5xhcbh2f0yxpmb933c30-busybox-1.32.1'
deleting '/nix/store/a0iv48gp1sqaa5qn6r3hcpwrfya9l85q-libgnome-keyring-3.12.0-dev'
deleting '/nix/store/z12xig75q0xgbjya71lqi0s4ad4vzmf7-gobject-introspection-1.68.0-dev'
deleting '/nix/store/v9pwhpngzygpnajhsfj9xkgpsf4pjhji-env.drv'
deleting '/nix/store/vriq8mbnzcdrd193pp1qdf9c9i4mbmla-util-linux-2.36.2-dev'
deleting '/nix/store/r1y2q6knb7n749yi9hick3w8chxpvp9f-user-environment.drv'
deleting '/nix/store/wx0aadw37z7hf884fn9l3arbksxpa42i-user-environment'
deleting '/nix/store/ym6r633g8xyvi899m22gpy6vmsdrxxbz-env-manifest.nix'
deleting '/nix/store/52b1269920njfmhasx8vri3bc58k8xlz-node-dev-shell.drv'
deleting '/nix/store/g74d1nkklyj4jly55x21mg1rd0fvjd80-env.drv'
deleting '/nix/store/i3rhwqkcqn8vvxhq6va9x27lsfkzvjda-user-environment'
deleting '/nix/store/0gx99z6kayk5xwz9dlnb2l1n9yq9n1ls-user-environment'
deleting '/nix/store/65lcpq0nqmpkx18qrqijzgcz71qv3zgm-user-environment.drv'
deleting '/nix/store/71pnz6lz6kldali1qnxaig83f3wh4h44-env-manifest.nix'
deleting '/nix/store/ndxz4a7gpv5mn5idpajgl8capsp458in-user-environment.drv'
deleting '/nix/store/74ifclykh1ablmhxjyzlfbip0nqnymz7-env.drv'
deleting '/nix/store/aihpjxgv5j9wcd5pb4qs8wyhf17r0m6z-user-environment'
deleting '/nix/store/yddn895vkphms6mh1ld2szmdvv3kh42c-user-environment.drv'
deleting '/nix/store/dm7zyfkpn5xjqnga51vqibfk4wvjgjny-env-manifest.nix'
deleting '/nix/store/0xh0zq2pnfdqh73g4ak01x12j3drjs08-env.drv'
deleting '/nix/store/zkcmkh0cyxpyg2z9dwc6gg0mlq8vdccq-curl-7.76.1-dev'
deleting '/nix/store/krpbkx3l72wac9nsign07fhswlmywq0r-unit-console-getty.service-disabled'
deleting '/nix/store/c4sa1n9qy483dkbz3s6c7pi07yb07cpm-curl-7.76.1-bin'
deleting '/nix/store/8l0qpj9bamd0b4i4rgbw42lg3412g3p3-mkfontscale-1.2.1'
deleting '/nix/store/7rq55hgfy8qzqv8lbinm8lz2fv40hbqk-openssl-1.1.1l-dev'
deleting '/nix/store/xh777qc2dibb65249m471lf2xnsbhbxc-openssl-1.1.1l-bin'
deleting '/nix/store/1442hsfaj6iw5s08h13w6s1v6zazn07s-disable_plugins.patch'
deleting '/nix/store/3ffrj7xxqdh0sl82cfb8k9lwj5jpg49l-mesa-21.1.4-dev'
deleting '/nix/store/crl01xc7f5mg016gjwzb6lw75zpkpm5i-libXdamage-1.1.5-dev'
deleting '/nix/store/lahccn7130smjgh7qzm26cll9aclndx6-gnome-tweaks-40.0.tar.xz.drv'
deleting '/nix/store/r29jr8d8p5lrczzkk8lk1f68plkjbr76-chmlib-0.40a.drv'
deleting '/nix/store/lanch0ck0gh2xr61nszgkbbl60ic7kr4-shell.drv'
deleting '/nix/store/vhwhg4s8ss9sj7vq8q78nkhizjs8i07b-calibre-5.17.0.tar.xz.drv'
deleting '/nix/store/3si7x121b9cr3a1s72f83fgsksxvj2xq-user-environment'
deleting '/nix/store/bsyv76gg1g6x6sld10i84qczl3fvngq8-env.drv'
deleting '/nix/store/l8rjhpbr32gqnrwq8xn3rbkr1df3hhnr-user-environment'
deleting '/nix/store/l042hpvp785l8424slj5nqrncrh6jmzm-no_updates_dialog.patch'
deleting '/nix/store/h4f3s5b1j1d7cq5671c6lmfy58gc90w1-user-environment.drv'
deleting '/nix/store/aw0crjpvxf94mqkm1j1qg2wkasbizxvh-transmission-3.00.drv'
deleting '/nix/store/ncpc1cc4cwr7d2qk1qha9813h1zhcvqz-env.drv'
deleting '/nix/store/sbsl5mdazwk26x962adpjr5fi3ghbz2b-user-environment'
deleting '/nix/store/m067nfxh5pxwhplnsnn9kqglsdxs5nyk-env-manifest.nix'
deleting '/nix/store/3rf3wdmknlmc1qzkgxj2z2d0ky4i9mw9-user-environment.drv'
deleting '/nix/store/hh952gibci6yy551zrs8za73wyds2ybj-stage-2-init.sh'
deleting '/nix/store/qdi19jwnp99b4l8mv24x7pclpgrmklak-hook'
deleting '/nix/store/2lp4nm4b94db11q1g29gdqsl4rvd3v61-automake-1.16.3'
deleting '/nix/store/w0fr0g2ba4179nmm262g14qahcnbz8dn-user-environment.drv'
deleting '/nix/store/gaa1s1xz5x2ddacp7nvrzd9acwiv0yr2-bdftopcf-1.1'
deleting '/nix/store/5p84s4khi57h57l7iixsap6wj0hrhncc-systemd-default-tmpfiles'
deleting '/nix/store/3i7kjvhyd14a1y95fhmz4c6c1dkmkayk-linux-5.10.77-modules'
deleting '/nix/store/d6d4pi0sm4glmhld6r2xavrpr4krk6xb-libxkbfile-1.1.0-dev'
deleting '/nix/store/0p1nw63icxj3g70v6sk8zcxwfsl3pp00-user-environment'
deleting '/nix/store/gypbqm56lvdfsr3p4xnlxkwiljhzn1y0-user-environment.drv'
deleting '/nix/store/g5v7qbjs95dy0sd3grkx03nflq0p281b-env-manifest.nix'
deleting '/nix/store/skk7bz3v0cva1xsxjfkwkvrwgf7divhy-devshell.drv'
deleting '/nix/store/8kn2pcf5p1jc528kmslskgbycxcmvf42-getconf-1003.1-2008'
deleting '/nix/store/g96j8mlkyq21s38fi0vfxim4g9kdd3i1-curl-7.76.1'
deleting '/nix/store/kffla0dyd2zpvdlzgq2r13gfv2fgs68g-libssh2-1.9.0-dev'
deleting '/nix/store/6a2syky0m7v888jz9v9i4b9aimnwycc3-libssh2-1.9.0'
deleting '/nix/store/pa1dbgjacjc4287qdhpg15g4fhagpg1x-nghttp2-1.43.0-dev'
deleting '/nix/store/g2vc5j27b904jxymfwqyjimsld5f3aji-nghttp2-1.43.0-bin'
deleting '/nix/store/gcq4mg3gdfa556n98zaxj66i20lzhahg-openssl-1.1.1l'
deleting '/nix/store/wbszfrx76q4fhc3kaz0lb49r4hcsnccm-transmission-3.00-apparmor'
deleting '/nix/store/ywgfbq897pspqjs4vck81w20qsld6h3m-transmission-3.00-apparmor'
deleting '/nix/store/3dg0qhslvb6rm9a6vkqzinf91h09c85k-apparmor-closure-rules-transmission-daemon'
deleting '/nix/store/p6w85pifybn6x5p64fgp620kng5v12w0-env.drv'
deleting '/nix/store/hn197wn4pghqh705d4qpssjmp0gbg1si-user-environment'
deleting '/nix/store/hf437m33m8x3989mphglp111l7qks4dg-user-environment'
deleting '/nix/store/sr22hp7kk4yg5n73f18gh9nnfx4khsfi-user-environment.drv'
deleting '/nix/store/l2yzf2lvzsi0344iryhcxpsrfr6bqvag-env-manifest.nix'
deleting '/nix/store/gd9pgnyrjjs8xaf4slnz6gdq5pnmmj17-user-environment.drv'
deleting '/nix/store/1zq4wq7hcv5bsc50f7bjlajswm5jf0rb-env-manifest.nix'
deleting '/nix/store/213ljj811q2ni3g2bbc4x7r2cjxz70d6-user-environment.drv'
deleting '/nix/store/h0cz8vfxf8a79rxjnp5kkra8zjjdw62n-user-environment'
deleting '/nix/store/r8linrgjd2ijrbyy7jmw3qx6fimxwyl3-env-manifest.nix'
deleting '/nix/store/7kzwmn7r93b4d6jj9wx0ny4bficjzmlb-manifest.vim'
deleting '/nix/store/cs4b62imccbb1qrkpygi7855ggannwhq-node-dev-shell.drv'
deleting '/nix/store/bbjzyx3d3ifrs1d1xbrrkpxiqgni440f-yarn-1.22.10.drv'
deleting '/nix/store/80kl0b40cx0dvgp2kkm6w9wn3f8snpsv-env.drv'
deleting '/nix/store/6f39b7dd59dd338dain3mrqgf8bz3dvk-xlibs-wrapper'
deleting '/nix/store/0wc1xfzkbn73f09k6pszzkaqvmpjhkxi-mdadm.conf'
deleting '/nix/store/2fypvhjwhd9aq4zbqa0k5dbv069c53m3-env.drv'
deleting '/nix/store/m7hvnmbrvxhj1k41h3vhzi9gjirpka7z-initrd-kmod-blacklist-ubuntu'
deleting '/nix/store/xa0xk2vj5845zgrm3h7xy4x2bzypd7wb-hyphen-2.8.8.tar.gz.drv'
deleting '/nix/store/xmjgmq63psbkvvr3kr6dk43g1330j7qx-nghttp2-1.43.0'
deleting '/nix/store/mhqqk7kyzg13b3s0lwygc4prilyzmccs-shell.drv'
deleting '/nix/store/cwwnxv4qayvd0cz9sj9pfz3g26gg3ays-user-environment'
deleting '/nix/store/qdaan22nwhppgj0df96gs02wzg006x3s-dont_build_unrar_plugin.patch'
deleting '/nix/store/47fjf7wjf61xjdd99hjxv37y4pisn9xn-unit-gdm.service-disabled'
deleting '/nix/store/vh6c92swnifnjgicjjmdlshmk4xk2gip-dbus-catalog.xml'
deleting '/nix/store/2wyvfq9vm7889ir2d2yckla285201728-user-environment.drv'
deleting '/nix/store/f7njbxcvsynwqmm9xx61353qp85q4gdk-builder.pl'
deleting '/nix/store/7y8f8p9y9chp6d8yc0sf7i0bk0dfssav-libtool-2.4.6'
deleting '/nix/store/6l40xv85fd8ivcbb50849c5agnyfz2ia-curl-7.76.1-man'
deleting '/nix/store/3gg4fa4a5l1lhb6hiisw03fsj3ymfvh7-user-environment'
deleting '/nix/store/ig1hv5hwpvkf6k3h3qjll8gwvyxk020b-shell.drv'
deleting '/nix/store/bkr9yscps6svwm406m50lyxqp82bhnjh-user-environment.drv'
deleting '/nix/store/schi9rxy2pabshvdgdcd962mmfhysjvl-user-environment'
deleting '/nix/store/97smqp4h0nwk0qx1jl58dfic684kvhxd-env-manifest.nix'
deleting '/nix/store/z84ni5ryy6kk9yxay1aaa7ri43sw6nh7-libXxf86vm-1.1.4-dev'
deleting '/nix/store/4qpfi447q91m33mr0a9isfyixwsx07gn-libdrm-2.4.105-dev'
deleting '/nix/store/l5fd412r7zbp1d2z9hvhmnbxqqgl9vc5-font-bh-lucidatypewriter-75dpi-1.0.3.tar.bz2'
deleting '/nix/store/1pfpsr2424mnw2akxp1azls09vilpzvx-pkg-config-wrapper-0.29.2-doc'
deleting '/nix/store/4x72jwfpl5kh00038ik3dpd5l3nl3vi5-pkg-config-0.29.2-doc'
deleting '/nix/store/j5vp2kv38h8591xaadxk5drfclnwan8a-user-environment.drv'
deleting '/nix/store/49d46wlmspz8difd1jv88lvd1kcf59gl-user-environment.drv'
deleting '/nix/store/zfddq2zjkiwcj4qg4l214n0zsii7y1lw-user-environment'
deleting '/nix/store/sbdg70m66f9c80yaqwdmdx63mq70ajnh-env-manifest.nix'
deleting '/nix/store/aypp9xrbbn6achd345rs1ka7i3npl7v2-hook'
deleting '/nix/store/76xfm1np3l976zm5vcl2vsxlpawaxrcx-user-environment.drv'
deleting '/nix/store/4ci7arv71bq1gn0cdz58gdgmi20vmpd2-source.drv'
deleting '/nix/store/jdcrlfcl7y7j5d2alpcd09a5yjraib1r-libgcrypt-1.9.4-dev'
deleting '/nix/store/hqivipwl98ldn8d7hrwd4n5rijsy6i95-libgpg-error-1.41-dev'
deleting '/nix/store/ss0l9g32h0icfjc0h5a9x92xhy3d95cm-env.drv'
deleting '/nix/store/jm57m7igmm2q08f2smflm5yvxnaxbq87-libkrb5-1.18-dev'
deleting '/nix/store/l7vp27q8zywmf7xanldl9w530g7irh49-glew-2.2.0-doc'
deleting '/nix/store/ma1bn23gxcxh50bzhj0hxmyyyc2h9yv8-user-environment'
deleting '/nix/store/ki8iz73l0xyd1h3gfdpqpyx7njm62n3h-user-environment'
deleting '/nix/store/sv4gpc1yjfh40pw5zwwsx32xv1m0j293-env-manifest.nix'
deleting '/nix/store/kpns3p4w3aj5yp4r4sw4ybl9abdmj04p-user-environment'
deleting '/nix/store/mw57ax1k7kpn4m8s8xrwfvf8z0z4z3cd-mirrors-list'
deleting '/nix/store/2lisbl6h7bgj79hhw8174hhg77rpw2v4-libXi-1.7.10-doc'
deleting '/nix/store/rxnsap885pdhcvs5xbbacmivxzy2v3gj-user-environment.drv'
deleting '/nix/store/i9yl87kxiaw2ds6xc0sa2f0ryg9v1nx3-env-manifest.nix'
deleting '/nix/store/rcw2n6q2p0blgpm7a9m6s6j0qfz97g93-user-environment.drv'
deleting '/nix/store/c98grhaidv9f2gpmz2h1qsvfmr4d2na3-check_string_termination.patch.drv'
deleting '/nix/store/530vs01d6ig2yvzay2fn1c9jklpj9bfc-font-bh-100dpi-1.0.3.tar.bz2'
deleting '/nix/store/a16wkyq2b2h9x70m37s5v7xq0nr774md-auto-patchelf-hook'
deleting '/nix/store/0cdxj4lb4rifihfq0qgfqgv6d973ihp3-user-environment'
deleting '/nix/store/ay8fnhv2r8sisxgb4zxcmdx88fmy3n99-env-manifest.nix'
deleting '/nix/store/yjz78x03bv1rsd60dwr53bs76zcki745-diagnostics-sandbox.drv'
deleting '/nix/store/la0l92fhyyx4ac4823p8axm0bdmsbiq3-c-ares-1.17.2'
deleting '/nix/store/sg2lm783lqrfnqslpprwql0ggmjn7f5q-yarn-1.22.10'
deleting '/nix/store/1sv0616drxjrslcwmzdi6affdf17cv25-env-manifest.nix'
deleting '/nix/store/7pxgc66wcxnyf6c8m64l5xf253p1p913-nss-3.64-dev'
deleting '/nix/store/sa1hwy9gar38fgbldk6jq404q2gqsncp-nspr-4.30-dev'
deleting '/nix/store/baycdm6iar8r0clfiz7h3m58hi1ird8r-env-manifest.nix'
deleting '/nix/store/68p71s9z5b77si99lg5598psvdr02vnq-user-environment.drv'
deleting '/nix/store/71wmig7469qvcqxfgnnazpgd3g4bnnrd-libxslt-1.1.34-bin'
deleting '/nix/store/c4ycxaiqymnr4m86c2qjhg7yf5fnr41q-user-environment'
deleting '/nix/store/djwfsz6hxlhcw8smqmbk7cbjavsyp254-env-manifest.nix'
deleting '/nix/store/zpq1jllpqjvg2rgzrvwm4299k5ij9sdv-env-manifest.nix'
deleting '/nix/store/vnjx4zjpp07djrn2p24msd6h5sczx9ba-user-environment'
deleting '/nix/store/2i920q5dj22cd99cdr4zdr5v1q911zy2-env-manifest.nix'
deleting '/nix/store/9x8vvr3xxm0w26nym2kgmjiy9nzrjw16-env.drv'
deleting '/nix/store/qvwydj6l9bllr4w7w82d441sh1s4jcjv-remove_unused_variable.patch.drv'
deleting '/nix/store/jlk30dhkbagsm77qyp53inq99y6igpf8-nuke-references'
deleting '/nix/store/07ggaacxn71w8wnyq22krw7xdy9hdp70-source.drv'
deleting '/nix/store/aryi8hgx8jafnm0h08iag4jf9arvxw0l-udev-rules'
deleting '/nix/store/xzkzk3ppxbccp4r43dvx3lw17d05iywi-diagnostics-sandbox.drv'
deleting '/nix/store/f5d4c3bpn2fk56j8avg7ihknc89grl9j-env.drv'
deleting '/nix/store/8bip4si0hl6n0linpzd340f8m54h7pzi-r13y.patch.drv'
deleting '/nix/store/yih67hc5jsqsmxw915ck78xvais77yhv-initrd-fsinfo'
deleting '/nix/store/zsyb78b4zsvppjjjxqhgy8i3rp3ygi7n-fix-gcc9-error.patch.drv'
deleting '/nix/store/yislaaf7xd7pi1vdzvwi9b0rqdiqi0l6-shell.drv'
deleting '/nix/store/d0ndylkw78whlhiqhlb5rj63c96wj7rv-autoconf-2.71'
deleting '/nix/store/9qnpbdkan22vb7rvbnhazggyyfwj4yc8-env-manifest.nix'
deleting '/nix/store/1ani5r9qlq918sw4lnqy02y721qds26q-inotify-tools-3.20.11.0'
deleting '/nix/store/2b5k1qawa0xbx81hmh2yfb1ddqq9cxbl-env.drv'
deleting '/nix/store/10d1j16038gxfnb6c7q09zm130jhvrp0-env.drv'
deleting '/nix/store/s6fqsh0adrbg3ws2f0hvp0vj9nkv8035-user-environment.drv'
deleting '/nix/store/ymanxm69v0676j0f0l4npds5l7g65fxp-ubuntu-font-family-0.83.drv'
deleting '/nix/store/7fvh39lbqnsfwzs9yng6dykfqpbiihp2-user-environment'
deleting '/nix/store/kcl4vic3nqpvacricfdnimmq02njrb80-env-manifest.nix'
deleting '/nix/store/3r3c4hfnhkd37zl4f8jwss22qn4lc9nc-extra-utils'
deleting '/nix/store/wfzdk9vxayfnw7fqy05s7mmypg5a8lyr-gnumake-4.3'
deleting '/nix/store/yabxadx8f1zyp9ifg3n5amgd0r6id6mb-user-environment'
deleting '/nix/store/mpcrxbqpswnv13wdd1svxz4gzjbpsnz7-env-manifest.nix'
deleting '/nix/store/dxz489vcjhgw0mzki70kas4ynpvjpmwf-shell.drv'
deleting '/nix/store/8m3qph2287cdkqki0n7chawcpnvjckmb-nghttp2-1.43.0-lib'
deleting '/nix/store/pvq1lhjqxrpkz67hrsq1809hkcwd69iq-env.drv'
deleting '/nix/store/q0cd46qlhczzf11vhhbc7jhqjybw1bb3-zlib-1.2.11-static'
deleting '/nix/store/4885m19zz486xmhaiy4h21sj578y2bmq-gtk+-2.24.32-dev'
deleting '/nix/store/41gbp7y66zn65ynbci9c4lxfv8yjp5c9-google-chrome-stable_95.0.4638.69-1_amd64.deb'
deleting '/nix/store/2d06v54bcva06ad3rflm7a6sqjkyc04m-env-manifest.nix'
deleting '/nix/store/hcxz1shvk2c2z7jwdjxxhmvd1xiw4wib-libXt-1.2.1-dev'
deleting '/nix/store/a51bjxndwyg1b8zjj4wb7g9d9vp91s8a-nixos-21.05'
deleting '/nix/store/rwnxhwwbmnjgyggg79lk13bln122y8ag-env.drv'
deleting '/nix/store/jh46j18ciwh1gb5xlg2qvfgb6apdvr4k-env.drv'
deleting '/nix/store/bakvhz3wkfwmb7b21n9kaj6py615b424-source.drv'
deleting '/nix/store/p5lnl4zr45n7mf9kz9w8yz3rqh001b5c-bash-interactive-4.4-p23-dev'
deleting '/nix/store/9pjkjkgrxmckpp0mw84665x4cixna6jl-user-environment'
deleting '/nix/store/8ivrr5ik434nhxi40ny6c377gqzngvdm-env.drv'
deleting '/nix/store/pnk72vj32q9qlhrkbw0jlh4cyd19dgq0-libkrb5-1.18'
deleting '/nix/store/i9mcin7gxqx5cxl08p1l55d9gmp7g5qx-libxshmfence-1.3-dev'
deleting '/nix/store/8v2pzx3vkrjzjj7wnwv9ma8yph01pk65-gconf-3.2.6-dev'
deleting '/nix/store/9by2vb17x8q0cmqi3k4ryh6iwanvmrym-lndir-1.0.3'
deleting '/nix/store/22jm3vvr4bd5dggwrkm301z63rl3hrqg-diagnostics-multiuser'
deleting '/nix/store/n5m1w2g4n1kyr9kacazx6wf368vv8yz5-libcap-2.48-dev'
deleting '/nix/store/vx018j7hxp020ls89y2mvwccawxp1653-shell.drv'
deleting '/nix/store/703vsy5zazpmmz3ql95fxkg6s0ywzkw8-xkbvalidate'
deleting '/nix/store/14zcfv0jd1xghnf8grbcqbzqnyww0063-shell.drv'
deleting '/nix/store/35lrwp94kqcrvq75fd4sim1jav4bbmv0-env.drv'
deleting '/nix/store/y64h6yyap0i79mbri8n78z21j19v9z5i-transmission-3.00'
deleting '/nix/store/b5ynr6sn7w98fnakmwhzlpv29vbc8i6b-env-manifest.nix'
deleting '/nix/store/h4ncq349vmskrgj6jkk8xn4y2810abs3-glibc-2.32-54-static'
deleting '/nix/store/2i9x60sdlficz4n8r9pyg2m61z5bqpcp-dbus-glib-0.110-dev'
deleting '/nix/store/lj7ljrhwqz2klqjp4zzxp66d5ljb5p0v-libev-4.33'
deleting '/nix/store/6c8ng5nqs0aqclkh1ixzd699pskvld9h-libnotify-0.7.9-dev'
deleting '/nix/store/w1hzp0nsyskhgzbipx3l8r3ncxg6dkpb-font-bh-lucidatypewriter-100dpi-1.0.3.tar.bz2'
deleting '/nix/store/6h01dvcm0944xf8bna8yq3f9mq314mxg-env-manifest.nix'
deleting '/nix/store/fvandicbgcviw6g4yx21qdx10qajdlfd-keymap'
deleting '/nix/store/m5pkwfs7v64c0a59j6sim93zz3ar305y-cryptsetup-2.3.5-dev'
deleting '/nix/store/qw70y1nw888g58laa2hd641q4573a2p2-env-manifest.nix'
deleting '/nix/store/hbghqyl2347kjwlwz73qvcphsp0rssp4-alsa-lib-1.2.4-dev'
deleting '/nix/store/xy92hrw2pf7nqmv9f9vhxh6rj6by3xhc-source.drv'
deleting '/nix/store/trash'
deleting unused links...
note: currently hard linking saves -0.00 MiB
243 store paths deleted, 294.82 MiB freed
```

