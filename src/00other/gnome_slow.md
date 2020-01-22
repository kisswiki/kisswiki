Używam Gnome

Musiałem jednak przejść na wersję beta Muttera bo zwalniało https://gitlab.gnome.org/GNOME/gnome-shell/issues/1704#note_625268

Rozwiązaniem było `sudo apt install mutter/eoan-proposed` z https://wiki.ubuntu.com/Testing/EnableProposed

Nadal jest problem ze słabą wydajnością jak masz dwa monitory. https://gitlab.gnome.org/GNOME/mutter/issues/3

Na szczęście ten gościu zaczyna ten bajzel sprzątać:

The mouse cursor stuttering happens on Wayland every time gnome-shell does heavy computation, IO, or blocks for other reasons. Basically, the same thing that renders the UI, displays animations and manages window compositing also has to draw the mouse cursor (or at least update the position). If something deep down in gnome-shell takes more time than your monitor refresh interval (often ~16ms), the cursor stutters.
This is not an issue when choosing the X.org session at the login screen.
Daniel van Vugt wants to find all the cases where a frame takes >16ms to render, but that will probably take some time. Right now, he's trying to get a patch merged that will speed up rendering while hovering the pointer over the calendar and maybe other situations: https://gitlab.gnome.org/GNOME/mutter/merge_requests/983, but the patch is stuck since 1 month because discussion about the possibility of fixing this in a library instead of mutter has stalled.

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1153951-gnome-work-is-underway-for-sharper-background-images?p=1153991#post1153991
