- https://coreos.com/docs/launching-containers/launching/getting-started-with-systemd/

`systemctl --help`

## list unit files

`systemctl list-unit-files`

## reread unit files

`systemctl daemon-reload`

http://serverfault.com/questions/700862/do-systemd-unit-files-have-to-be-reloaded-when-modified

## start service

`sudo systemctl start mongod`

## load during startup

`sudo systemctl enable mongod`

## status

`sudo systemctl status mongod`

## performance

```
@tehmal gom1@fujitsu:~$ systemd-analyze
Startup finished in 4.632s (kernel) + 10.168s (userspace) = 14.801s
graphical.target reached after 9.737s in userspace

U mnie system dość długo czeka na zestawienie połączenia z WiFi - całe 7 s:

gom1@fujitsu:~$ systemd-analyze
Startup finished in 4.688s (kernel) + 3.928s (userspace) = 8.617s
graphical.target reached after 3.718s in userspace
(tu bez WiFi)
17-08-2018 11:37:04
@gom1 Fajne polecenie - nie znałem. Systed powiedział mi, że mój zabytkowy pecet w pracy wstaje w 35 sekund. Co uważam za bardzo dobry wynik jak na C2D i dysk talerzowy napędzany wołami :D
17-08-2018 11:40:27
@pocolog spróbuj jeszcze: systemd-analyze blame

Dowiesz się, jakie usługi wstają i jak długo. Można w ten sposób pozbyć się zbędnego balastu (jak np. demon odpowiedzialny za BT, którego to nie mam w swoim lapku).

17-08-2018 13:07:31
@gom1 "U mnie system dość długo czeka na zestawienie połączenia z WiFi - całe 7 s"

 Wyłącz wstawanie sieci podczas startu (daj loopback w ustawieniach) i zacznij używać wicd - sieć będzie wstawała zaraz po odpaleniu pulpitu :)
17-08-2018 13:13:35
@bystryy wiesz, nie przeszkadza mi to. Sieć i tak wstaje na końcu, po prostu systemd-analyze pokazuje wtedy 14 zamiast 8. A w zasadzie 22, bo po połączeniu do WiFi zestawiane jest również połączenie VPN.
```

[Nowy Linux może gwałtownie przyspieszyć sieci i uruchamianie programów](https://www.dobreprogramy.pl/Nowy-Linux-moze-gwaltownie-przyspieszyc-sieci-i-uruchamianie-programow,News,89965.html#komentarz-2483791)

## check what reload command will do for some service

```bash
$ systemctl show nginx --property=ExecReload
ExecReload={ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; -s reload ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }
```

https://superuser.com/questions/710986/how-to-reload-nginx-systemctl-or-nginx-s/953901#953901

## show log

for specific service

```bash
$ journalctl -b -f -u nginx -b
-- Logs begin at Fri 2019-03-22 11:21:19 CET. --
kwi 29 11:36:58 roman-MS-7B43 systemd[1]: Starting A high performance web server and a reverse proxy server...
kwi 29 11:36:58 roman-MS-7B43 systemd[1]: Started A high performance web server and a reverse proxy server.
kwi 29 11:38:57 roman-MS-7B43 systemd[1]: nginx.service: Main process exited, code=killed, status=9/KILL
kwi 29 11:38:57 roman-MS-7B43 systemd[1]: nginx.service: Killing process 21775 (nginx) with signal SIGKILL.
kwi 29 11:38:57 roman-MS-7B43 systemd[1]: nginx.service: Killing process 21777 (nginx) with signal SIGKILL.
kwi 29 11:38:57 roman-MS-7B43 systemd[1]: nginx.service: Failed with result 'signal'.
kwi 29 14:49:14 roman-MS-7B43 systemd[1]: Starting A high performance web server and a reverse proxy server...
kwi 29 14:49:14 roman-MS-7B43 systemd[1]: Started A high performance web server and a reverse proxy server.
```

>For things named <something>.service, you can actually just use <something>, as in:
>`journalctl -u service-name`
> But for other sorts of units (sockets, targets, timers, etc), you need to be explicit.
>- https://unix.stackexchange.com/questions/225401/how-to-see-full-log-from-systemctl-status-service/225407#225407

`sudo journalctl -xel`

- https://www.linode.com/community/questions/476/systemctl-restart-nginxservice

## status of a service

```bash
~/personal_projects/kisswiki (master *)$ systemctl -l status nginx
● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2019-04-29 14:49:14 CEST; 9min ago
     Docs: man:nginx(8)
  Process: 4314 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
  Process: 4316 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
 Main PID: 4325 (nginx)
    Tasks: 13 (limit: 4915)
   Memory: 12.1M
   CGroup: /system.slice/nginx.service
           ├─4325 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
           ├─4326 nginx: worker process
           ├─4327 nginx: worker process
           ├─4328 nginx: worker process
           ├─4329 nginx: worker process
           ├─4330 nginx: worker process
           ├─4331 nginx: worker process
           ├─4332 nginx: worker process
           ├─4333 nginx: worker process
           ├─4334 nginx: worker process
           ├─4335 nginx: worker process
           ├─4336 nginx: worker process
           └─4338 nginx: worker process

kwi 29 14:49:14 roman-MS-7B43 systemd[1]: Starting A high performance web server and a reverse proxy server...
kwi 29 14:49:14 roman-MS-7B43 systemd[1]: Started A high performance web server and a reverse proxy server.
```

## logs size

If the journal is persistent (non-volatile), its size limit is set to a default value of 10% of the size of the underlying file system but capped at 4 GiB. For example, with /var/log/journal/ located on a 20 GiB partition, journal data may take up to 2 GiB. On a 50 GiB partition, it would max at 4 GiB.

The maximum size of the persistent journal can be controlled by uncommenting and changing the following:

`/etc/systemd/journald.conf`

`SystemMaxUse=50M`

It is also possible to use the drop-in snippets configuration override mechanism rather than editing the global configuration file. In this case, place the overrides under the `[Journal]` header:

`/etc/systemd/journald.conf.d/00-journal-size.conf`

```
[Journal]
SystemMaxUse=50M
```

Restart the `systemd-journald.service` after changing this setting to apply the new limit.

See `journald.conf(5)` for more info.

- https://wiki.archlinux.org/index.php/Systemd/Journal#Journal_size_limit
