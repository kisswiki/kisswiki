Any app can spontaneously steal media key "focus" and the focus doesn't return to the previous app once the thief has finished.

Let's say I'm listening to music via music player app, and I happen to use my web browser to navigate to a web page with a video player. The browser then grabs the MPRIS controls and I cannot control the music player anymore. At least nowadays the music player will re-focus itself if I go to the app and manually pause/play a song with its in-UI controls.

The dumbest thing is the MPRIS keys don't actually seem to control the browser video player, they just stop controlling the music player as well.

P.S. Yes, I have since disabled MPRIS support in browsers.

<https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1569750-gnome-49-beta-ships-many-last-minute-features-including-greater-systemd-reliance?p=1569775#post1569775>

That is very likely a bug in the control app you are using.

The MPRIS (Media Player Remote Interface Specification) does not provide any means to "grab focus".

Players that implement these interfaces only provide methods that the "client" (e.g. panel applet) can call for control and signals/properties to indicate state/data changes.

Clients are not required to implement any specific interface nor required to tell any of the players that they exist.
Players have no means to initiate client operations.

Most clients will start with player discovery, i.e. listing the bus names and finding those with the "org.mpris.MediaPlayer2" prefix.
They will likely also connect to the Bus' signal that notifies them about names appearing/disappearing.

Clients are free to observe all of them at the same time, use filters to only "see" a subset or even just work with a single player.

A UI client which supports multiple players at the same time but which only displays one set of controls will have to decide which of the players it sends commands to.

It seems your client prefers a new (or newly active) player over an existing one and might not correctly detect it becoming inactive (or no longer being around).

<https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1569750-gnome-49-beta-ships-many-last-minute-features-including-greater-systemd-reliance?p=1569804#post1569804>
