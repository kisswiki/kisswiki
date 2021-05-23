- https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1155243-mpv-player-0-32-released-with-rar5-support-bash-completion
- https://github.com/mpv-player/mpv/wiki/FAQ#I_use_GNOME_Wayland_and_I_have_xyz_problem
- https://blog.martin-graesslin.com/blog/2018/01/server-side-decorations-and-wayland/
- https://gitlab.gnome.org/GNOME/mutter/issues/217
- https://mastodon.technology/@bugaevc/102226726346629274
- https://www.phoronix.com/forums/forum/linux-graphics-x-org-drivers/wayland-display-server/1034535-wayland-protocols-1-15-adds-xdg-decoration-protocol-for-server-side-window-decorations/page3
- https://www.reddit.com/r/linux/comments/bdfzm7/by_design_most_nongtk_wayland_apps_wont_run_on/el1fiex/
- https://kver.wordpress.com/2014/10/25/presenting-dwd-a-candidate-for-kde-window-decorations/

## CCS pros

vetinari 49 minutes ago [–]

> Unresponsive applications can not be closed by clicking the X button.
> They cannot be closed with server decorations either; if the client doesn't process the even queue and ignores WM_DELETE_WINDOW, it doesn't matter who paints the decoration.

> for the compositor to find out if an application is unresponsive or not literally means solving the halting problem.

Not in Wayland; if the client doesn't process events, the compositor knows that. It is just a matter of deciding on timeout value and then letting the user know (mutter does that, for example).

---

However, client side decorations ho have much more severe implications beyond estetic. For starters, with server decorations, you cannot guarantee frame-perfect synchronization of decoration and client area painting; with client decorations, you can, the same process does it.

https://news.ycombinator.com/item?id=27254174

## CSD cons

makomk 1 hour ago [–]

The problem with SDL's Wayland backend is that, as I understand it, you won't get any window decorations on common Wayland compositors like the Gnome one because Gnome expects every app to implement the window decorations itself (and the expected way to do this is by dragging in the entirety of Gtk, even if you're not using any of the other functionality of the toolkit). It looks like SDL are working on some kind of solution but it doesn't seem to be ready yet.
As it stands, though, it's probably not feasible to actually ship a game with Wayland support using SDL due to the potential support issues from people not running in fullscreen mode being stuck with a window that can't be moved, minimized or closed in the usual way.

https://news.ycombinator.com/item?id=27253878
