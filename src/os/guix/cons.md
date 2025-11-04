GNU shepherd, that keeps insisting on racy pid files for services it is supposed to, well, shepher https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1588830-devuan-6-0-released-for-debian-13-without-systemd?p=1588926#post1588926

„racy” = race-condition-ish
— czyli pliki PID, które mogą nie być bezpieczne → mogą być nieaktualne / błędne / powstawać z wyścigiem czasowym, w momentach startu / restartu / killowania procesu.

PID file = plik w /run/foo.pid gdzie proces zapisuje swój numer PID

Wiele starych initów i demonów w tradycyjnym UNIXie oczekiwało, że proces sam zapisze PID do pliku, a daemony potem go czytają aby wiedzieć co ubić / czy żyje.

Problem:

– PID file może zostać stworzony zanim proces naprawdę jest gotowy
– PID może zostać „zabrany” przez inny proces jeśli proces się crashował
– plik może zostać nieusunięty

To jest właśnie typowy „race”.

Czyli po polsku:

Ten post mówi:
„GNU shepherd uparcie wymaga tradycyjnych, zawodnych pid-file’ów, które są wrażliwe na race condition, do usług które powinien shepherdować (pilnować).”

Czyli:

Shepherd zamiast robić nowocześniejsze reliable tracking (np. przez cgroups / pidfd / proces rodzica), wymaga staromodnych pid-file’ów, które są wadliwe i często nie działają dobrze.

W domyśle:
systemd rozwiązał to lepiej (pidfd / cgroups / notify), a shepherd wciąż tkwi w starym mechanizmie.
