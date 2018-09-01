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
